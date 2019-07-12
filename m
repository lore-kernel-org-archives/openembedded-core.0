Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 686A47F0E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B6A4E18134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:19 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id krSG7m0_6wkG
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D5B0618111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B67901A061
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB4CD1A05D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 9FB402CF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x6CADItm008755
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:13:18 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x6CADIVw008738
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Jul 2019 12:13:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 12:13:16 +0200
Message-Id: <20190712101316.6887-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] glibc-package.inc: Do not use bitbake variable syntax for shell variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 10:13:19 -0000
Content-Transfer-Encoding: 8bit

Using bitbake variable syntax (i.e., ${FOO}) for shell variables is
bad practice. First of all it is confusing, but more importantly it
can lead to weird problems if someone actually defines a bitbake
variable with the same name as the shell variable.

Also correct the indentation in stash_locale_cleanup().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 48 +++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 5cfb1b6ab9..b150a34378 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -161,34 +161,34 @@ bashscripts = "mtrace sotruss xtrace"
 
 do_stash_locale () {
 	dest=${LOCALESTASH}
-	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
+	install -d $dest${base_libdir} $dest${bindir} $dest${libdir} $dest${datadir}
 	# Hide away the locale data from the deployment
 	if [ -e ${D}${bindir}/localedef ]; then
-		cp -a ${D}${bindir}/localedef ${dest}${bindir}
+		cp -a ${D}${bindir}/localedef $dest${bindir}
 	fi
 	if [ -e ${D}${libdir}/gconv ]; then
-		cp -a ${D}${libdir}/gconv ${dest}${libdir}
+		cp -a ${D}${libdir}/gconv $dest${libdir}
 	fi
 	if [ -e ${D}${datadir}/i18n ]; then
-		cp -a  ${D}${datadir}/i18n ${dest}${datadir}
+		cp -a  ${D}${datadir}/i18n $dest${datadir}
 	fi
 
 	# Make a copy of all the libraries into the locale stash
-	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
+	cp -fpPR ${D}${libdir}/* $dest${libdir}
 	if [ "${base_libdir}" != "${libdir}" ]; then
-		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
+		cp -fpPR ${D}${base_libdir}/* $dest${base_libdir}
 	fi
 	if [ -e ${D}${exec_prefix}/lib ]; then
 		if [ ${exec_prefix}/lib != ${base_libdir} ] && [ ${exec_prefix}/lib != ${libdir} ]; then
-			cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}
+			cp -fpPR ${D}${exec_prefix}/lib $dest${exec_prefix}
 		fi
 	fi
 
-	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
+	cp -fpPR ${D}${datadir}/* $dest${datadir}
 	rm -rf ${D}${datadir}/locale/
-	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
+	cp -fpPR ${WORKDIR}/SUPPORTED $dest
 
-	target=${dest}/scripts
+	target=$dest/scripts
 	mkdir -p $target
 	for i in ${bashscripts}; do
 		if [ -f ${D}${bindir}/$i ]; then
@@ -216,23 +216,23 @@ stash_locale_cleanup () {
 	cleanupdir=$1
 	# Remove all files which do_stash_locale() copies
 	for i in ${bashscripts}; do
-	    rm -f ${cleanupdir}${bindir}/$i
+		rm -f $cleanupdir${bindir}/$i
 	done
-	rm -f ${cleanupdir}${bindir}/localedef
-	rm -rf ${cleanupdir}${datadir}/i18n
-	rm -rf ${cleanupdir}${libdir}/gconv
-	rm -rf ${cleanupdir}/${localedir}
-	rm -rf ${cleanupdir}${datadir}/locale
+	rm -f $cleanupdir${bindir}/localedef
+	rm -rf $cleanupdir${datadir}/i18n
+	rm -rf $cleanupdir${libdir}/gconv
+	rm -rf $cleanupdir${localedir}
+	rm -rf $cleanupdir${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
-	    if [ -d "${cleanupdir}${exec_prefix}/lib" ]; then
-		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
-		     ! -e "${cleanupdir}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
-			# error out if directory isn't empty
-			# this dir should only contain locale dir
-			# which has been deleted in the previous step
-			rmdir ${cleanupdir}${exec_prefix}/lib
+		if [ -d "$cleanupdir${exec_prefix}/lib" ]; then
+			if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
+			     ! -e "$cleanupdir${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
+				# error out if directory isn't empty
+				# this dir should only contain locale dir
+				# which has been deleted in the previous step
+				rmdir $cleanupdir${exec_prefix}/lib
+			fi
 		fi
-	    fi
 	fi
 }
 
-- 
2.21.0


