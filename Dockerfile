# Docker image for springboot file run
# VERSION 0.0.1
# Author: bolingcavalry

#基础镜像使用centos7
FROM centos:centos7

#作者
MAINTAINER BolingCavalry <zq2599@gmail.com>

#定义工作目录
ENV WORK_PATH /usr/local/work

#定义jdk1.8的文件夹
ENV JDK_PACKAGE_FILE jdk1.8.0_144

#定义jdk1.8的文件名
ENV JDK_RPM_FILE jdk-8u144-linux-x64.rpm

#yum更新
RUN yum -y update

#把分割过的jdk1.8安装文件复制到工作目录
COPY ./jdkrpm-* $WORK_PATH/

#用本地分割过的文件恢复原有的jdk1.8的安装文件
RUN cat $WORK_PATH/jdkrpm-* > $WORK_PATH/$JDK_RPM_FILE

#本地安装jdk1.8
RUN yum -y localinstall $WORK_PATH/$JDK_RPM_FILE

#暴露8080端口
EXPOSE 8080