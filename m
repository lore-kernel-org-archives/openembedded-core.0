Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.8683.1596639004193659199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0BTJRXlF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id f9so4409289pju.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Py15X/AOBsP9HP/mdu5PmiFe0+pHqvYOEzpcMv+s0y0=;
        b=0BTJRXlFjSzHAy07z+lusR68osNX2Sp2mour7S7X1mXW9MaVm9iALmiWfHOYGk6fNZ
         bCK59iUkYUL1eIo0Ne5JqwMPQdChYcXYUaRLpGT9/QA5TAvzb6ilxjq3xyGv7UwcqYcc
         3oA0jgb9//uS5uhN9D6IpoDP48fozIi9K7mPT9biJIvr4oxyuCTlsmnnsXuQIcf0X5Ue
         qpVTbZ9oUsX9a84k14z1hPbXc8cbPokNAEVBo4OVXFIISDyJGYlDvDBWOrO9uRw/G7DC
         Gc9668tUu+O3pFW7VPBhAUc2HzBEFEAJgoLMgVwq8tVSv6yX+z4w6ubYNL7AmdtLUPbC
         3pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Py15X/AOBsP9HP/mdu5PmiFe0+pHqvYOEzpcMv+s0y0=;
        b=tNVNA+3yULrbBkv2iU2nOOSVHZJeZ+GWCJ6tbURXISZmkd1nufOuN8gNeibtKbEAaQ
         Bofcr+obixLePg0is4IwGXGIXN3kqTnH5tW6DBfsCPMn4eIJH6ttLe4PDAAhQlOpu6fE
         buiJ+YH7I1wUagtWkUYW4vc9jFV5IsD7SVuJ04h9A7axXmkqUEYjJiKFMqV0Zvd3Ilze
         2+XDWwqkEN/kP5FnrltOx3pHrWKTyegLzARvfT8O3vN4BkmFuGUfTZnSW5CYNnjSqzx5
         kQx9E3nWiaqV1FxDQSIvL3PRQL7NzEfYwm6Y8cts3wBB4w+PeKKwORqliGW9Z0kACxxU
         0xJA==
X-Gm-Message-State: AOAM532FqRsrlauJTDrF5JnPMVLapjNyp41q2CEQz6sWw06qAWV2GmQu
	5CjxAMZH0OhJCODh6bGgyCc4YjGVU4A=
X-Google-Smtp-Source: ABdhPJxPpV2nE7rWpqzVLLeo9IMMhO1u5nIqwFq73+nuWw++lpRQlz5ajtgEvRYBvxbPego/zvhcfw==
X-Received: by 2002:a17:90a:cf95:: with SMTP id i21mr3663830pju.135.1596639003057;
        Wed, 05 Aug 2020 07:50:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 01/11] initscripts: Fix various shellcheck warnings in populate-volatile.sh
Date: Wed,  5 Aug 2020 04:49:24 -1000
Message-Id: <2c44581c3be7f1330f32870f9a9721a53a49f62b.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

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

