Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id C83BB6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 05:46:05 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so1283906pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=o/EWRBVRVPgNfI/tqQ9cpB6qS+jvbL9llBLnQDVWJDo=;
	b=gPgRqWyRkPXTefrAVgV0LrVHmKXZU0EtYVN/RpETJFawVNm0UGlePgK5An2kbRbvtq
	hA3J7fPfhz2mG8rEumsueuCEbnDSEw84s3iyMMo/LZgx3dbfoIxwDAybmFWchbGNUV3G
	zkfG7zaEKGv2597ABFJo18Iu/cKTg81nXf/NBMNtbrY7mC32n7frS5mnoHdEe4LvPR27
	LDIVRCRhY24S/c9gjU51JHksuB83K9x5JCcl0ARCQZyHASD6ov2LWLoUvKUQd8xVCqnv
	y2wWy9tWhgeVQTIaXscho15mug+KGXcYarx28AMJgSkPvEeUElFBRKfgBnooZKuoa4GL
	7Kzg==
X-Received: by 10.67.3.103 with SMTP id bv7mr7727883pad.15.1377063966145;
	Tue, 20 Aug 2013 22:46:06 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id om2sm6027432pbb.34.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 22:46:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 22:45:23 -0700
Message-Id: <1377063923-23922-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] eglibc: Update SRC_URI and fix unpackaged empty dir
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
X-List-Received-Date: Wed, 21 Aug 2013 05:46:05 -0000

eglibc 2.18 has now been branched out so point to new
tarballs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/cross-localedef-native_2.18.bb | 6 +++---
 meta/recipes-core/eglibc/eglibc-package.inc             | 4 ++++
 meta/recipes-core/eglibc/eglibc_2.18.bb                 | 6 +++---
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
index 072b807..62296b5 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
@@ -16,11 +16,11 @@ inherit autotools
 # pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23532.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23787.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-SRC_URI[md5sum] = "8c83078851c44089a019c626d51c51bb"
-SRC_URI[sha256sum] = "ecd3167d7d417c05b10ea7ab8e3acbc05f4bc2b389b6fae9c186bc0fd34c3ff1"
+SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
+SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
 
 S = "${WORKDIR}/eglibc-${PV}/localedef"
 
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index a590cce..1a23805 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -76,6 +76,10 @@ do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
 	rm -rf ${D}${localstatedir}
 
+	# remove empty eglibc dir
+	if [ -d ${D}${libdir}/eglibc ]; then
+		rmdir ${D}${libdir}/eglibc
+	fi
 	oe_multilib_header bits/syscall.h
 
 	if [ -f ${D}${bindir}/mtrace ]; then
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 2e1d380..17b651f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
 
-SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23532.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23787.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -27,8 +27,8 @@ SRC_URI = "http://sakrah.dontexist.org/files/eglibc-${PV}-svnr23532.tar.bz2 \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
           "
-SRC_URI[md5sum] = "8c83078851c44089a019c626d51c51bb"
-SRC_URI[sha256sum] = "ecd3167d7d417c05b10ea7ab8e3acbc05f4bc2b389b6fae9c186bc0fd34c3ff1"
+SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
+SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.8.3.4


