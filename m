Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 52C846E666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 13:18:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2018 05:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,517,1511856000"; d="scan'208";a="18352142"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 15 Feb 2018 05:18:52 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 7FDF6580385
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 05:18:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 15:19:31 +0200
Message-Id: <1518700772-14988-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] python3-pygobject: remove unused patches
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
X-List-Received-Date: Thu, 15 Feb 2018 13:18:51 -0000

Remove the following patches that are no-longer used in python3-pygobject:
 1. 0001-configure.ac-Don-t-use-gnome-common-macros.patch
 2. 0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...onfigure.ac-Don-t-use-gnome-common-macros.patch | 33 -----------------
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch | 41 ----------------------
 2 files changed, 74 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
 delete mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch

diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch b/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
deleted file mode 100644
index aaedb58..0000000
--- a/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 206360744cedff20eae3c8fcfde9938fdae99592 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 6 Jul 2017 11:47:21 +0300
-Subject: [PATCH] configure.ac: Don't use gnome-common macros
-
-remove GNOME_COMPILE_WARNINGS() call: it's from gnome-common which
-is deprecated.
-
-This patch can be removed when upgrading to 3.25.1: at that point
-pygobject needs autoconf-archive instead.
-
-Upstream-Status: Inappropriate [Already handled upstream]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1f15b3c..5cb170f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -221,8 +221,6 @@ AC_ARG_WITH(common,
-     with_common=yes)
- AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
- 
--# compiler warnings, errors, required cflags, and code coverage support
--GNOME_COMPILE_WARNINGS([maximum], [-Wno-error=missing-prototypes])
- AC_MSG_CHECKING(for Gnome code coverage support)
- m4_ifdef([GNOME_CODE_COVERAGE],
-          [AC_MSG_RESULT(yes)
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch b/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
deleted file mode 100644
index a391f7e..0000000
--- a/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5e5350d730f85957a42c6d846d347d080e7dd996 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 23 Oct 2015 12:40:34 +0300
-Subject: [PATCH] configure.ac: add sysroot path to GI_DATADIR; don't set
- introspection scanner and compiler paths
-
-Upstream-Status: Pending [review on oe-core maillist]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2c0cfbd..cfcb3bf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -194,7 +194,7 @@ PKG_CHECK_MODULES(GI,
-     gobject-introspection-1.0 >= introspection_required_version
- )
- 
--GI_DATADIR=$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
-+GI_DATADIR=$PKG_CONFIG_SYSROOT_DIR$($PKG_CONFIG --variable=gidatadir gobject-introspection-1.0)
- AC_SUBST(GI_DATADIR)
- 
- if test "$enable_cairo" != no; then
-@@ -219,12 +219,6 @@ AC_ARG_WITH(common,
-     with_common=yes)
- AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
- 
--INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--
--AC_SUBST(INTROSPECTION_SCANNER)
--AC_SUBST(INTROSPECTION_COMPILER)
--
- # compiler warnings, errors, required cflags, and code coverage support
- GNOME_COMPILE_WARNINGS([maximum])
- AC_MSG_CHECKING(for Gnome code coverage support)
--- 
-2.1.4
-
-- 
2.4.0


