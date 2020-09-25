#!/bin/bash
JAVA_PATH=/u01/jdk1.8.0_11/bin
jps -l | grep api-process-info-service.jar | xargs echo 'kill -9'
jps -l | grep api-process-info-service.jar | awk  '{print $1}'  | xargs kill -9
sleep 5
nohup ${JAVA_PATH}/java -jar  -Xms512m -Xmx512m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=7074 -Dserver.port=8001 api-process-info-service.jar >8001.logs &
tail -f 8001.logs
