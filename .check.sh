#!/bin/sh
SCORE=0
mvn clean compile
mvn package | tee .pack.txt
TEST_1=$(grep -o -w  -e "<packaging>war</packaging>" -e "maven-war-plugin" pom.xml | wc -l)
TEST_2=$(grep -o -w "Welcome to first maven war project" ./src/main/java/javaApp/Demo.java | wc -l)
TEST_3=$((grep -o -w "BUILD SUCCESS" .pack.txt ) | wc -l)
TEST_4=$((find ./target/*.war ) | wc -l)
if [ "$TEST_1" -ge 2 ]
then SCORE=$(($SCORE + 30))
fi;
if [ "$TEST_2" -eq 1 ]
then SCORE=$(($SCORE + 20))
fi;
if [ "$TEST_3" -eq 1 ]
then SCORE=$(($SCORE + 30))
fi;
if [ "$TEST_4" -eq 1 ]
then SCORE=$(($SCORE + 20))
fi;
echo "FS_SCORE:$SCORE%" 