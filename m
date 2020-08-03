Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.12597.1596464842487576790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pB6n6rCB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id t10so15405498plz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Py15X/AOBsP9HP/mdu5PmiFe0+pHqvYOEzpcMv+s0y0=;
        b=pB6n6rCBUt580VoHR3ZxIdmrw26CD0uX8+ajBEvfBAwusZlg0tx5gC1R/5kJsL4pkK
         QimCVpd3M0kyU/oe2Ne09gvMRHn8OpQiiQvZwQ7nUfzMN+FHnn/m5PTYzYm4rrx2XrbJ
         /majVboODTMWULW6/5h2VbdGRe3eFdd5so8FEOHdOswGs5hmzXXM6E9vRXf/VUaL4pwT
         syMZ+xdrUdHvC4RddFQgmKl8NNZhqKPppM3xd6L+u+e1W306v50Jn5lCWFCwRwtQ4Y/T
         HlL2BVKOVvlc65giUBC0zBdLbks0/kYEeByoXZEmoSxfTCqTUWCcD7XhOyAnIL1bI77C
         1SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Py15X/AOBsP9HP/mdu5PmiFe0+pHqvYOEzpcMv+s0y0=;
        b=UE05zYuw5xT9LLCE6Uo4xLci75oiSydBJGQ/nsmXeebbVDPfc/XQBJdrTIolXI+Tjc
         Px2hEbFFbgi0xzBqJSRPKgjpnhiSnCfmLcdLJVopQZxl85sglII3YbuD5zTmpD+0KMNF
         RTnfM5/C3fphz8ikcmOchwLxLNwPDsk1ZM9ZGPJ5AcuYETGZaAAH8uQx2erviC/XYcB2
         WNHW9lubEfpPgVQhgDx3Rre8s1nEzdMiiwLTOi8wOIdEXhXipE1muap/0PiBXUbS0L3R
         mld4XGpCEaQ8j9Qe1eEWPzyQZWxYdSn824nty6rBBG2dPL5DSg2ToNGJOG5SAvw5sEG6
         gVSQ==
X-Gm-Message-State: AOAM5334gt0tdHtsqjWj1X96x0+/c8+37czq4vuRxURgp6Gi+QHAS73e
	vQnRs+vncwG3/ZG5j4XPymC+L0KVO9s=
X-Google-Smtp-Source: ABdhPJxxtKv/UUhXRYbEimTdZJR0tSjXtWsZcQZmpy6YXqkRngrxEnzpk+L7QNKRi1JI+t0YWufW8Q==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr2554905pjj.6.1596464841247;
        Mon, 03 Aug 2020 07:27:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] initscripts: Fix various shellcheck warnings in populate-volatile.sh
Date: Mon,  3 Aug 2020 04:26:53 -1000
Message-Id: <2c44581c3be7f1330f32870f9a9721a53a49f62b.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Andrei Gherzan <andrei@gherzan.ro>

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a128a238f63d52aa82f8c63ee2f84ab528b3346)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 1c525b71bd..3a265329f0 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -9,10 +9,10 @@
 ### END INIT INFO
 
 # Get ROOT_DIR
-DIRNAME=`dirname $0`
-ROOT_DIR=`echo $DIRNAME | sed -ne 's:/etc/.*::p'`
+DIRNAME="$(dirname "$0")"
+ROOT_DIR="$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')"
 
-[ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
+[ -e "${ROOT_DIR}/etc/default/rcS" ] && . "${ROOT_DIR}/etc/default/rcS"
 # When running populate-volatile.sh at rootfs time, disable cache.
 [ -n "$ROOT_DIR" ] && VOLATILE_ENABLE_CACHE=no
 # If rootfs is read-only, disable cache.
@@ -46,13 +46,13 @@ create_file() {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
 		if [ -z "$ROOT_DIR" ]; then
-			eval $EXEC
+			eval "$EXEC"
 		else
 			# Creating some files at rootfs time may fail and should fail,
 			# but these failures should not be logged to make sure the do_rootfs
 			# process doesn't fail. This does no harm, as this script will
 			# run on target to set up the correct files and directories.
-			eval $EXEC > /dev/null 2>&1
+			eval "$EXEC" > /dev/null 2>&1
 		fi
 	}
 }
@@ -68,11 +68,11 @@ mk_dir() {
 		[ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
 	} || {
 		if [ -z "$ROOT_DIR" ]; then
-			eval $EXEC
+			eval "$EXEC"
 		else
 			# For the same reason with create_file(), failures should
 			# not be logged.
-			eval $EXEC > /dev/null 2>&1
+			eval "$EXEC" > /dev/null 2>&1
 		fi
 	}
 }
@@ -96,11 +96,11 @@ link_file() {
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
 
 	if [ -z "$ROOT_DIR" ]; then
-		eval $EXEC
+		eval "$EXEC"
 	else
 		# For the same reason with create_file(), failures should
 		# not be logged.
-		eval $EXEC > /dev/null 2>&1
+		eval "$EXEC" > /dev/null 2>&1
 	fi
 }
 
@@ -117,11 +117,11 @@ check_requirements() {
 	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
 	TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
 
-	sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/passwd | sort | uniq > "${TMP_DEFINED}"
-	cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 2 > "${TMP_INTERMED}"
+	sed 's@\(^:\)*:.*@\1@' "${ROOT_DIR}/etc/passwd" | sort | uniq > "${TMP_DEFINED}"
+	grep -v "^#" "${CFGFILE}" | cut -s -d " " -f 2 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
-	NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
-	NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
+	NR_DEFINED_USERS="$(wc -l < "${TMP_DEFINED}")"
+	NR_COMBINED_USERS="$(wc -l < "${TMP_COMBINED}")"
 
 	[ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
 		echo "Undefined users:"
@@ -131,12 +131,12 @@ check_requirements() {
 	}
 
 
-	sed 's@\(^:\)*:.*@\1@' ${ROOT_DIR}/etc/group | sort | uniq > "${TMP_DEFINED}"
-	cat ${CFGFILE} | grep -v "^#" | cut -s -d " " -f 3 > "${TMP_INTERMED}"
+	sed 's@\(^:\)*:.*@\1@' "${ROOT_DIR}/etc/group" | sort | uniq > "${TMP_DEFINED}"
+	grep -v "^#" "${CFGFILE}" | cut -s -d " " -f 3 > "${TMP_INTERMED}"
 	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 
-	NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
-	NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
+	NR_DEFINED_GROUPS="$(wc -l < "${TMP_DEFINED}")"
+	NR_COMBINED_GROUPS="$(wc -l < "${TMP_COMBINED}")"
 
 	[ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
 		echo "Undefined groups:"
@@ -157,13 +157,13 @@ apply_cfgfile() {
 
 	[ "${VERBOSE}" != "no" ] && echo "Applying ${CFGFILE}"
 
-	[ "${SKIP_REQUIREMENTS}" == "yes" ] || check_requirements "${CFGFILE}" || {
+	[ "${SKIP_REQUIREMENTS}" = "yes" ] || check_requirements "${CFGFILE}" || {
 		echo "Skipping ${CFGFILE}"
 		return 1
 	}
 
-	cat ${CFGFILE} | sed 's/#.*//' | \
-	while read TTYPE TUSER TGROUP TMODE TNAME TLTARGET; do
+	sed 's/#.*//' "${CFGFILE}" | \
+	while read -r TTYPE TUSER TGROUP TMODE TNAME TLTARGET; do
 		test -z "${TLTARGET}" && continue
 		TNAME=${ROOT_DIR}${TNAME}
 		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
@@ -187,9 +187,9 @@ apply_cfgfile() {
 
 		[ -L "${TNAME}" ] && {
 			[ "${VERBOSE}" != "no" ] && echo "Found link."
-			NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
-			echo ${NEWNAME} | grep -v "^/" >/dev/null && {
-				TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
+			NEWNAME=$(ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/')
+			echo "${NEWNAME}" | grep -v "^/" >/dev/null && {
+				TNAME="$(echo "${TNAME}" | sed -e 's@\(.*\)/.*@\1@')/${NEWNAME}"
 				[ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
 			} || {
 				TNAME="${NEWNAME}"
@@ -217,7 +217,7 @@ apply_cfgfile() {
 
 clearcache=0
 exec 9</proc/cmdline
-while read line <&9
+while read -r line <&9
 do
 	case "$line" in
 		*clearcache*)  clearcache=1
@@ -228,11 +228,11 @@ do
 done
 exec 9>&-
 
-if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
+if test -e "${ROOT_DIR}/etc/volatile.cache" -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
 then
-	sh ${ROOT_DIR}/etc/volatile.cache
+	sh "${ROOT_DIR}/etc/volatile.cache"
 else
-	rm -f ${ROOT_DIR}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
+	rm -f "${ROOT_DIR}/etc/volatile.cache" "${ROOT_DIR}/etc/volatile.cache.build"
 
 	# Apply the core file with out checking requirements. ${TMPROOT} is
 	# needed by check_requirements but is setup by this file, so it must be
@@ -246,7 +246,7 @@ else
 	TMP_FILE="${TMPROOT}/tmp_volatile.$$"
 	rm -f "$TMP_FILE"
 
-	CFGFILES="`ls -1 "${CFGDIR}" | grep -v "^${COREDEF}\$" | sort`"
+	CFGFILES="$(ls -1 "${CFGDIR}" | grep -v "^${COREDEF}\$" | sort)"
 	for file in ${CFGFILES}; do
 		cat "${CFGDIR}/${file}" >> "$TMP_FILE"
 	done
@@ -264,7 +264,7 @@ else
 	fi
 	rm "$TMP_FILE"
 
-	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
+	[ -e "${ROOT_DIR}/etc/volatile.cache.build" ] && sync && mv "${ROOT_DIR}/etc/volatile.cache.build" "${ROOT_DIR}/etc/volatile.cache"
 fi
 
 if [ -z "${ROOT_DIR}" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
-- 
2.17.1

