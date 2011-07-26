Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlZxZ-0000wd-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 07:13:37 +0200
Received: by pzk1 with SMTP id 1so187831pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 22:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GWchDLGPz9To6jt9zAK/4IYabaUYYXWeMCcJgBT/Dkc=;
	b=Zkmsqz8WlTdjjXeT6FAXUdBqdbWpszWuHROMzysDxfUiG6/b/KNXBlfs+XiOsY/+9j
	7LOmlvpJOqnyAy+MWEapLCNdXRAKzzIgJR+WyXyRvoqBu+5jrkJuTggJb/Dha9sx/7gV
	zp58MlTCD2nnxxFh0+lY1xbiIgYorKY32Jckk=
Received: by 10.68.42.164 with SMTP id p4mr9489416pbl.91.1311656961720;
	Mon, 25 Jul 2011 22:09:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v1sm100417pbg.95.2011.07.25.22.09.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 22:09:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 22:09:13 -0700
Message-Id: <1311656953-30417-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] meta: Rename SITEINFO_ENDIANESS to SITEINFO_ENDIANNESS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 05:13:37 -0000

There is this discrepency in spelling. Lets fix it in
core. There are lot of layers using SITEINFO_ENDIANNESS
This was shielded since meta-oe had its own copy of
siteinfo class. But that class has now been deleted in
favor of oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass                      |    4 ++--
 meta/conf/machine/include/tune-xscale.inc          |    4 ++--
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    4 ++--
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4_arch.inc                   |    4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index c5308b3..f3c24e8 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -86,9 +86,9 @@ def siteinfo_data(d):
 python () {
     sitedata = set(siteinfo_data(d))
     if "endian-little" in sitedata:
-        d.setVar("SITEINFO_ENDIANESS", "le")
+        d.setVar("SITEINFO_ENDIANNESS", "le")
     elif "endian-big" in sitedata:
-        d.setVar("SITEINFO_ENDIANESS", "be")
+        d.setVar("SITEINFO_ENDIANNESS", "be")
     else:
         bb.error("Unable to determine endianness for architecture '%s'" %
                  d.getVar("HOST_ARCH", True))
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 71dba5b..7fabb46 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -4,8 +4,8 @@ INHERIT += "siteinfo"
 
 TUNE_CCARGS = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
-TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+TUNE_PKGARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANNESS', d, 1) == 'le']}"
+PACKAGE_EXTRA_ARCHS = "${@['armeb armv4b armv4tb armv5teb', 'arm armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANNESS', d, 1) == 'le']}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b134ad0..88d5081 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 S = "${WORKDIR}/openssl-${PV}"
 
 AR_append = " r"
-CFLAG = "${@base_conditional('SITEINFO_ENDIANESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
 	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
 
 # Avoid binaries being marked as requiring an executable stack (which causes 
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index 344747f..54bdcc2 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r4"
+PR = "r5"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
index 4b6b5a7..671319c 100644
--- a/meta/recipes-devtools/perl/perl_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r3"
+PR = "r4"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -117,7 +117,7 @@ do_configure() {
         rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
         for i in ${WORKDIR}/config.sh \
                  ${WORKDIR}/config.sh-${SITEINFO_BITS} \
-                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANESS}; do
+                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANNESS}; do
             cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
         done
 
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index de311dc..9b7e071 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r27"
+INC_PR = "r28"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index e6169f3..b8633de 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index 7f4be63..e8c8fab 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -17,9 +17,9 @@ def qt_arch(d):
 
 def qt_endian(d):
     import bb
-    if bb.data.getVar('SITEINFO_ENDIANESS', d, True) == "le":
+    if bb.data.getVar('SITEINFO_ENDIANNESS', d, True) == "le":
         return "-little-endian"
-    elif bb.data.getVar('SITEINFO_ENDIANESS', d, True) == "be":
+    elif bb.data.getVar('SITEINFO_ENDIANNESS', d, True) == "be":
         return "-big-endian"
     else:
         assert False
-- 
1.7.4.1



