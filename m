Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD2D6710C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 08:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835164"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:30 -0700
Message-Id: <d43674d46b1507c90010f035203ff70bff532eb2.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
Subject: [PATCH 4/5] libassuan: Upgrade to 2.1.2
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libassuan-add-pkgconfig-support.patch          | 38 +++++++++++-----------
 .../{libassuan_2.1.1.bb => libassuan_2.1.2.bb}     |  4 +--
 2 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.1.1.bb => libassuan_2.1.2.bb} (86%)

diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index 4f96881..f130d85 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -6,18 +6,18 @@ Upstream-Status: Rejected
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: libassuan-2.1.1/Makefile.am
+Index: libassuan-2.1.2/Makefile.am
 ===================================================================
---- libassuan-2.1.1.orig/Makefile.am	2014-05-13 20:57:37.794398357 +0000
-+++ libassuan-2.1.1/Makefile.am	2014-05-13 20:57:37.790398357 +0000
-@@ -24,10 +24,13 @@
+--- libassuan-2.1.2.orig/Makefile.am
++++ libassuan-2.1.2/Makefile.am
+@@ -24,10 +24,13 @@ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gz
  # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
  GITLOG_TO_CHANGELOG=gitlog-to-changelog
  
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = libassuan.pc
 +
- EXTRA_DIST = config.rpath autogen.sh README.GIT                  	\
+ EXTRA_DIST = autogen.sh autogen.rc README.GIT         	                \
               ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
               tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
 -             build-aux/git-log-footer build-aux/git-log-fix
@@ -25,10 +25,10 @@ Index: libassuan-2.1.1/Makefile.am
  
  SUBDIRS = m4 src doc tests
  
-Index: libassuan-2.1.1/libassuan.pc.in
+Index: libassuan-2.1.2/libassuan.pc.in
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libassuan-2.1.1/libassuan.pc.in	2014-05-13 20:57:37.790398357 +0000
+--- /dev/null
++++ libassuan-2.1.2/libassuan.pc.in
 @@ -0,0 +1,14 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -44,11 +44,11 @@ Index: libassuan-2.1.1/libassuan.pc.in
 +Libs: -L${libdir} -lassuan
 +Libs.private: -lgpg-error
 +Cflags: -I${includedir}
-Index: libassuan-2.1.1/configure.ac
+Index: libassuan-2.1.2/configure.ac
 ===================================================================
---- libassuan-2.1.1.orig/configure.ac	2014-05-13 20:57:37.794398357 +0000
-+++ libassuan-2.1.1/configure.ac	2014-05-13 20:57:37.790398357 +0000
-@@ -434,7 +434,7 @@
+--- libassuan-2.1.2.orig/configure.ac
++++ libassuan-2.1.2/configure.ac
+@@ -439,7 +439,7 @@ AC_CONFIG_FILES([doc/Makefile])
  AC_CONFIG_FILES([tests/Makefile])
  AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
  AC_CONFIG_FILES([src/versioninfo.rc])
@@ -57,11 +57,11 @@ Index: libassuan-2.1.1/configure.ac
  AC_OUTPUT
  
  echo "
-Index: libassuan-2.1.1/src/libassuan.m4
+Index: libassuan-2.1.2/src/libassuan.m4
 ===================================================================
---- libassuan-2.1.1.orig/src/libassuan.m4	2011-04-06 15:37:26.000000000 +0000
-+++ libassuan-2.1.1/src/libassuan.m4	2014-05-13 21:06:53.402395537 +0000
-@@ -15,18 +15,6 @@
+--- libassuan-2.1.2.orig/src/libassuan.m4
++++ libassuan-2.1.2/src/libassuan.m4
+@@ -15,18 +15,6 @@ dnl Returns ok set to yes or no.
  dnl
  AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -80,7 +80,7 @@ Index: libassuan-2.1.1/src/libassuan.m4
  
    tmp=ifelse([$1], ,1:0.9.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -37,51 +25,12 @@
+@@ -37,51 +25,12 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
      min_libassuan_version="$tmp"
    fi
  
@@ -134,7 +134,7 @@ Index: libassuan-2.1.1/src/libassuan.m4
        if test "$tmp" -gt 0 ; then
          AC_MSG_CHECKING([LIBASSUAN API version])
          if test "$req_libassuan_api" -eq "$tmp" ; then
-@@ -96,7 +45,7 @@
+@@ -96,7 +45,7 @@ AC_DEFUN([_AM_PATH_LIBASSUAN_COMMON],
  
    if test $ok = yes; then
      if test x"$host" != x ; then
@@ -143,7 +143,7 @@ Index: libassuan-2.1.1/src/libassuan.m4
        if test x"$libassuan_config_host" != xnone ; then
          if test x"$libassuan_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -137,12 +86,8 @@
+@@ -137,12 +86,8 @@ dnl
  AC_DEFUN([AM_PATH_LIBASSUAN],
  [ _AM_PATH_LIBASSUAN_COMMON($1)
    if test $ok = yes; then
diff --git a/meta/recipes-support/libassuan/libassuan_2.1.1.bb b/meta/recipes-support/libassuan/libassuan_2.1.2.bb
similarity index 86%
rename from meta/recipes-support/libassuan/libassuan_2.1.1.bb
rename to meta/recipes-support/libassuan/libassuan_2.1.2.bb
index d660233..6d89107 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.2.bb
@@ -13,8 +13,8 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "757243cc4a71b30ed8d8dbe784035d36"
-SRC_URI[sha256sum] = "23e2d67779b88e90d29fe1df6b157109f1c2a647d0f1b2a0f4295bb3c0b2039d"
+SRC_URI[md5sum] = "1dc4c3e1dbfb3939bfa2d72db8e136ba"
+SRC_URI[sha256sum] = "39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
1.8.3.1


