Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.434.1595610740514907649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 10:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=CBBVfRVx;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.221.50, mailfrom: andrei@gherzan.ro)
Received: by mail-wr1-f50.google.com with SMTP id f18so8982726wrs.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=59D2wEjbseYFwXoYjgrnEyLXW/5Tdmj2tLUUK+5yyH4=;
        b=CBBVfRVxtu/ofb5R7ycxRDTfK6a0SOvs7HmERB2GZSmjiiW4lkVZFrZPXzCXnP9MDw
         IAc1rjqqZuO5GNyoRCnMGJDrZX4c1l7vE67uJQr7UvzVJ4Y3QhE6ETImntmjRUwE+OJj
         5W/Efz8ShiSPJ5NkUDJxgJk1GFxthku4yquut+/CpO2GEyymCmDV4kfTDn8yd9wq7p9E
         wIEkVzlqLj4DkjAuarVkQk5S6hUa0jVzH2L4XWgoCHB4xH1/Ejs0TRPouGpiIOFnso3a
         bdiIoxdoTT3smLzkSkt92OqIwff6DDCMnTn0qPdTPnw+k7XiszVWGN3iZY3177eCylRp
         CgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=59D2wEjbseYFwXoYjgrnEyLXW/5Tdmj2tLUUK+5yyH4=;
        b=bV327UCNzDsHIEN1lZHodU16H2SY2f/PoWfWF/vYesdZ1r+jVo80g5Dh2Cph5aOiVa
         Jfp0Tm8dh6qksfiD92aG5Zm0EH/+PR2EC3w4XfsNYAwIBj54dLFB4KVg+MAXphrh9okf
         OTrJ0XMR7xouTTpPv/EvaHbnNuw0CVdzhuRGpG4t+sqgdHNVpz/pvMCyF0xwBTqriisd
         IQ1J8fxWRcMfNgnbShVYWberkDrRNP/avV6cUuDei8GhWk0dRVwpQXcavSz/BZGOGwPh
         xOVAf9X46P6PsYsuKA9gksT2A0SGoqQiA3nNEYPz25n2J5pGxS8vfjMEsqGseKhQeDrp
         B0Pw==
X-Gm-Message-State: AOAM532Bb0b6waXqxG2FW/oImjolYvhs9IrmZ1e+T3NPs1xQCxnH/Pr3
	SbNGdO48D1+ZYNpvAO/W82eaJF7G9yA=
X-Google-Smtp-Source: ABdhPJzce37g/ZAOXiIqlZVIgEoMXCbdp94VTunDDoOfqttvIgtldk4tz3A4/q3/DRuD4ml2NiWCjA==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr9570041wru.107.1595610738526;
        Fri, 24 Jul 2020 10:12:18 -0700 (PDT)
Return-Path: <andrei@gherzan.ro>
Received: from agherzan-lnxU.hanoverdisplays.com (host109-149-215-13.range109-149.btcentralplus.com. [109.149.215.13])
        by smtp.gmail.com with ESMTPSA id v15sm2016290wrm.23.2020.07.24.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 10:12:17 -0700 (PDT)
From: "Andrei Gherzan" <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei@gherzan.ro>
Subject: [PATCH 1/2] initscripts: Fix various shellcheck warnings in populate-volatile.sh
Date: Fri, 24 Jul 2020 18:12:04 +0100
Message-Id: <20200724171205.9871-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
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

