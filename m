Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UA1bF-0000zb-13
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 18:12:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Feb 2013 08:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,735,1355126400"; d="scan'208";a="261162693"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 25 Feb 2013 08:56:04 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 18:57:14 +0200
Message-Id: <1361811434-16920-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] libassuan: upgrade to 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2013 17:12:29 -0000

- license checksum change due to addition of
"Copyright (C) 2001, 2002, 2012, 2013 g10 Code GmbH"

libassuan-add-pkgconfig-support.patch: adapted to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../files/libassuan-add-pkgconfig-support.patch    | 44 +++++++++++-----------
 .../{libassuan_2.0.3.bb => libassuan_2.1.0.bb}     |  6 +--
 2 files changed, 24 insertions(+), 26 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.0.3.bb => libassuan_2.1.0.bb} (73%)

diff --git a/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
index ba33252..ac1604f 100644
--- a/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
@@ -1,18 +1,18 @@
-Upstream-Status: Rejected
-
 Add pkgconfig support to libassuan.
 This patch is rejected by upstream for the reason below:
 They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
+Upstream-Status: Rejected
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
-Index: Makefile.am
-==============================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -21,11 +21,14 @@
- ACLOCAL_AMFLAGS = -I m4
- AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
+Index: libassuan-2.1.0/Makefile.am
+===================================================================
+--- libassuan-2.1.0.orig/Makefile.am
++++ libassuan-2.1.0/Makefile.am
+@@ -24,10 +24,13 @@ AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gz
+ # (A suitable gitlog-to-changelog script can be found in GnuPG master.)
+ GITLOG_TO_CHANGELOG=gitlog-to-changelog
  
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = assuan.pc
@@ -20,16 +20,15 @@ Index: Makefile.am
  EXTRA_DIST = config.rpath autogen.sh README.GIT                  	\
               ChangeLog-2011 doc/ChangeLog-2011 src/ChangeLog-2011 	\
               tests/ChangeLog-2011 contrib/ChangeLog-2011     		\
-              build-aux/gitlog-to-changelog build-aux/git-log-footer	\
--             build-aux/git-log-fix
-+             build-aux/git-log-fix assuan.pc.in
+-             build-aux/git-log-footer build-aux/git-log-fix
++             build-aux/git-log-footer build-aux/git-log-fix assuan.pc.in
  
  SUBDIRS = m4 src doc tests
  
-Index: assuan.pc.in
-==============================================================
+Index: libassuan-2.1.0/assuan.pc.in
+===================================================================
 --- /dev/null
-+++ b/assuan.pc.in
++++ libassuan-2.1.0/assuan.pc.in
 @@ -0,0 +1,12 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -43,17 +42,16 @@ Index: assuan.pc.in
 +Libs: -L${libdir} -lassuan
 +Libs.private: -lgpg-error
 +Cflags: -I${includedir}
-Index: configure.ac
-==============================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -380,5 +380,5 @@ AC_CONFIG_FILES([doc/Makefile])
+Index: libassuan-2.1.0/configure.ac
+===================================================================
+--- libassuan-2.1.0.orig/configure.ac
++++ libassuan-2.1.0/configure.ac
+@@ -433,7 +433,7 @@ AC_CONFIG_FILES([doc/Makefile])
  AC_CONFIG_FILES([tests/Makefile])
  AC_CONFIG_FILES([src/libassuan-config], [chmod +x src/libassuan-config])
  AC_CONFIG_FILES([src/versioninfo.rc])
 -
 +AC_CONFIG_FILES([assuan.pc])
  AC_OUTPUT
--- 
-1.7.5.4
-
+ 
+ echo "
diff --git a/meta/recipes-support/libassuan/libassuan_2.0.3.bb b/meta/recipes-support/libassuan/libassuan_2.1.0.bb
similarity index 73%
rename from meta/recipes-support/libassuan/libassuan_2.0.3.bb
rename to meta/recipes-support/libassuan/libassuan_2.1.0.bb
index f0d7c9f..0483560 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv3 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/assuan.c;endline=20;md5=fbd7f2a44aab170430d59380f94f85f8 \
+                    file://src/assuan.c;endline=20;md5=0f465544183405055ec179869fc5b5ba \
                     file://src/assuan-defs.h;endline=20;md5=20cd55535260ca1779edae5c7b80b21e"
 
 DEPENDS = "libgpg-error"
@@ -13,7 +13,7 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
-SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
+SRC_URI[md5sum] = "b3231eec8e567f4f9294474a387378f5"
+SRC_URI[sha256sum] = "a4c5bd3a0c2726e8bcc2ea8a3b15f7aae3bd92d4f85968f315fd3a75d101c267"
 
 inherit autotools binconfig pkgconfig
-- 
1.7.11.7



