#!/bin/bash
set -eu

TOOL_DIR=$(cd $(dirname $0); pwd)
TITLE_DIR=${TOOL_DIR%%\/maketool}
INDEX_DIR=${TOOL_DIR%%\/customs\/pdf\/images\/title\/maketool}

echo ${TOOL_DIR}
echo ${TITLE_DIR}
echo ${INDEX_DIR}

REVISION_NUMBER=`cat ${INDEX_DIR}/contents/defines/define-version-headeronly.adoc | grep revnumber | awk '{print $2}'`
TITLE_BACKGROUND=`cat ${TITLE_DIR}/title-background.svg`
echo ${TITLE_BACKGROUND} | sed -e "s|{%revnumber%}|$REVISION_NUMBER|g" > "${TITLE_DIR}/title-background.svg"
