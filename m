Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 737697468A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:46:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U6kvZ2014121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:46:57 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:46:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:31 -0400
Message-ID: <63e2022bc710e7c3d7c693f24219d81fd9b3a741.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] libgpg-error: 1.27 -> 1.28
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
X-List-Received-Date: Fri, 30 Mar 2018 06:46:56 -0000
Content-Type: text/plain

1. License-Update: update years from 2003-2004 to 2001-2018,
   and add a new line 'SPDX-License-Identifier: LGPL-2.1+'

2. Rebase pkgconfig.patch -> 0001-support-pkgconfig.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...kgconfig.patch => 0001-support-pkgconfig.patch} | 67 +++++++++++++---------
 .../{libgpg-error_1.27.bb => libgpg-error_1.28.bb} |  8 +--
 2 files changed, 45 insertions(+), 30 deletions(-)
 rename meta/recipes-support/libgpg-error/libgpg-error/{pkgconfig.patch => 0001-support-pkgconfig.patch} (76%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.27.bb => libgpg-error_1.28.bb} (86%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-support-pkgconfig.patch
similarity index 76%
rename from meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
rename to meta/recipes-support/libgpg-error/libgpg-error/0001-support-pkgconfig.patch
index 9ffeedb..3066613 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-support-pkgconfig.patch
@@ -1,15 +1,26 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
+From ec309e20b5a27d42a5fb915c328d61e924ab5f19 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 29 Mar 2018 15:12:17 +0800
+Subject: [PATCH] support pkgconfig
 
 Upstream-Status: Pending
 
-Index: libgpg-error-1.17/configure.ac
-===================================================================
---- libgpg-error-1.17.orig/configure.ac
-+++ libgpg-error-1.17/configure.ac
-@@ -529,6 +529,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
+Rebase to 1.28
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac        |  1 +
+ src/Makefile.am     |  4 ++-
+ src/gpg-error.m4    | 71 +++--------------------------------------------------
+ src/gpg-error.pc.in | 11 +++++++++
+ 4 files changed, 18 insertions(+), 69 deletions(-)
+ create mode 100644 src/gpg-error.pc.in
+
+diff --git a/configure.ac b/configure.ac
+index aca9300..f7794e9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile tests/Makefile])
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
  AC_CONFIG_FILES([src/versioninfo.rc src/gpg-error.w32-manifest])
  AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
@@ -17,33 +28,33 @@ Index: libgpg-error-1.17/configure.ac
  
  AC_OUTPUT
  
-Index: libgpg-error-1.17/src/Makefile.am
-===================================================================
---- libgpg-error-1.17.orig/src/Makefile.am
-+++ libgpg-error-1.17/src/Makefile.am
-@@ -75,6 +75,8 @@ nodist_include_HEADERS = gpg-error.h
- bin_SCRIPTS = gpg-error-config
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 268c2ab..95f8459 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -87,6 +87,8 @@ bin_SCRIPTS = gpg-error-config
+ nodist_bin_SCRIPTS = gpgrt-config
  m4datadir = $(datadir)/aclocal
- m4data_DATA = gpg-error.m4
+ m4data_DATA = gpg-error.m4 gpgrt.m4
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = gpg-error.pc
  
  EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
  	mkerrnos.awk errnos.in README \
-@@ -82,7 +84,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.
+@@ -94,7 +96,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
  	mkheader.c gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
- 	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 \
+ 	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 gpgrt.m4 \
  	gpg-error.vers gpg-error.def.in \
 -        versioninfo.rc.in gpg-error.w32-manifest.in \
 +        versioninfo.rc.in gpg-error.w32-manifest.in gpg-error.pc \
  	$(lock_obj_pub)
  
  BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
-Index: libgpg-error-1.17/src/gpg-error.m4
-===================================================================
---- libgpg-error-1.17.orig/src/gpg-error.m4
-+++ libgpg-error-1.17/src/gpg-error.m4
-@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_wa
+diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
+index 60c88d8..2ef7e3e 100644
+--- a/src/gpg-error.m4
++++ b/src/gpg-error.m4
+@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -132,10 +143,11 @@ Index: libgpg-error-1.17/src/gpg-error.m4
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(GPG_ERROR_CFLAGS)
-Index: libgpg-error-1.17/src/gpg-error.pc.in
-===================================================================
+diff --git a/src/gpg-error.pc.in b/src/gpg-error.pc.in
+new file mode 100644
+index 0000000..bc0b174
 --- /dev/null
-+++ libgpg-error-1.17/src/gpg-error.pc.in
++++ b/src/gpg-error.pc.in
 @@ -0,0 +1,11 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -148,3 +160,6 @@ Index: libgpg-error-1.17/src/gpg-error.pc.in
 +Version: @VERSION@
 +Libs: -L${libdir} -lgpg-error
 +Cflags: -I${includedir}
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
similarity index 86%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
index b74f079..2feace7 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.28.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c \
+                    file://src/gpg-error.h.in;endline=23;md5=fc7423b56d5f7163a9a2acf9fe2f8d6b \
                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
 
 
@@ -13,11 +13,11 @@ SECTION = "libs"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-           file://pkgconfig.patch \
+           file://0001-support-pkgconfig.patch \
 	  "
 
-SRC_URI[md5sum] = "5217ef3e76a7275a2a3b569a12ddc989"
-SRC_URI[sha256sum] = "4f93aac6fecb7da2b92871bb9ee33032be6a87b174f54abf8ddf0911a22d29d2"
+SRC_URI[md5sum] = "2b072f6194eb22d48cd4c7c77e59b5af"
+SRC_URI[sha256sum] = "3edb957744905412f30de3e25da18682cbe509541e18cd3b8f9df695a075da49"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.8.1


