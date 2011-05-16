Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5cz-0003Re-0b
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 14:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="643470530"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 14:44:06 -0700
Message-Id: <8468b436a4c87e9554b71ce95ba54888b6957cab.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Sun, 15 May 2011 20:04:27 -0700
Date: Mon, 16 May 2011 14:44:06 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/14] recipes: Add Upstream-Status to various recipe patches
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
X-List-Received-Date: Mon, 16 May 2011 21:47:01 -0000

From: Scott Garman <scott.a.garman@intel.com>

Add Upstream-Status tag to patches for the following recipes:

openssh
dbus-glib
expat
opensp
sgml-common
at
cpio (GPLv3 version)
libpam
icu

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../openssh/openssh-5.6p1/nostrip.patch            |    9 ++++++---
 .../dbus/dbus-glib-0.92/no-examples.patch          |    9 ++++++---
 .../recipes-core/expat/expat-2.0.1/autotools.patch |   10 +++++++---
 .../opensp/opensp/attributevalue.patch             |    3 +++
 .../opensp/opensp/fix-docdir.patch                 |    3 +++
 meta/recipes-devtools/opensp/opensp/m4.patch       |    3 +++
 .../opensp/opensp/rangmap-fix.patch                |    3 +++
 .../sgml-common/sgml-common-0.6.3/autohell.patch   |    3 +++
 .../sgml-common/sgml-common-0.6.3/license.patch    |    3 +++
 meta/recipes-extended/at/at-3.1.12/configure.patch |    8 ++++++--
 .../at/at-3.1.12/fix_parallel_build_error.patch    |    4 ++++
 meta/recipes-extended/cpio/cpio-2.11/statdef.patch |    8 ++++++--
 .../pam/libpam/pam-no-innetgr.patch                |    5 +++++
 meta/recipes-extended/sudo/files/libtool.patch     |   10 +++++++---
 meta/recipes-support/icu/files/gccfix.patch        |    6 ++++++
 meta/recipes-support/icu/files/noldlibpath.patch   |    5 +++++
 .../icu/files/use-g++-for-linking.patch            |    7 +++++++
 17 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
index a88e18e..7970b6d 100644
--- a/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
+++ b/meta/recipes-connectivity/openssh/openssh-5.6p1/nostrip.patch
@@ -1,6 +1,9 @@
-# Disable stripping binaries during make install.
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Disable stripping binaries during make install.
+
+Upstream-Status: Inappropriate [Other]
+Build system specific.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 diff -ur openssh-5.6p1.orig/Makefile.in openssh-5.6p1/Makefile.in
 --- openssh-5.6p1.orig/Makefile.in	2010-05-11 23:51:39.000000000 -0700
diff --git a/meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch b/meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch
index 32609b9..fbb4967 100644
--- a/meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch
+++ b/meta/recipes-core/dbus/dbus-glib-0.92/no-examples.patch
@@ -1,6 +1,9 @@
-# disable compiling examples
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-10
+Disable compiling examples
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Kevin Tian <kevin.tian@intel.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 --- dbus-glib-0.70/dbus/Makefile.am.orig	2006-07-23 16:04:43.000000000 +0200
 +++ dbus-glib-0.70/dbus/Makefile.am	2006-07-23 16:04:52.000000000 +0200
diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/recipes-core/expat/expat-2.0.1/autotools.patch
index ff1578f..c0ac10b 100644
--- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
+++ b/meta/recipes-core/expat/expat-2.0.1/autotools.patch
@@ -1,6 +1,10 @@
-# avoid to use expat's own *.m4
-#
-# comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-07
+Avoid using expat's m4 files
+
+Upstream-Status: Inappropriate [Other]
+Workaround specific to our build system.
+
+Signed-off-by: Kevin Tian <kevin.tian@intel.com>
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
 --- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
diff --git a/meta/recipes-devtools/opensp/opensp/attributevalue.patch b/meta/recipes-devtools/opensp/opensp/attributevalue.patch
index 4f3507e..92f5898 100644
--- a/meta/recipes-devtools/opensp/opensp/attributevalue.patch
+++ b/meta/recipes-devtools/opensp/opensp/attributevalue.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- OpenSP-1.5/include/Attribute.h~attributevalue	2000-03-09 13:30:56.000000000 -0500
 +++ OpenSP-1.5/include/Attribute.h	2004-01-20 14:11:36.000000000 -0500
 @@ -31,6 +31,28 @@
diff --git a/meta/recipes-devtools/opensp/opensp/fix-docdir.patch b/meta/recipes-devtools/opensp/opensp/fix-docdir.patch
index 5e2fc8b..c78b9ad 100644
--- a/meta/recipes-devtools/opensp/opensp/fix-docdir.patch
+++ b/meta/recipes-devtools/opensp/opensp/fix-docdir.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: OpenSP-1.5/doc/Makefile.am
 ===================================================================
 --- OpenSP-1.5.orig/doc/Makefile.am	2000-05-06 09:10:32.000000000 +1000
diff --git a/meta/recipes-devtools/opensp/opensp/m4.patch b/meta/recipes-devtools/opensp/opensp/m4.patch
index a8504c5..96a782c 100644
--- a/meta/recipes-devtools/opensp/opensp/m4.patch
+++ b/meta/recipes-devtools/opensp/opensp/m4.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- /dev/null	2003-09-23 18:19:32.000000000 -0400
 +++ OpenSP-1.5/m4/codeset.m4	2004-01-20 03:01:28.000000000 -0500
 @@ -0,0 +1,23 @@
diff --git a/meta/recipes-devtools/opensp/opensp/rangmap-fix.patch b/meta/recipes-devtools/opensp/opensp/rangmap-fix.patch
index cc849ca..da31411 100644
--- a/meta/recipes-devtools/opensp/opensp/rangmap-fix.patch
+++ b/meta/recipes-devtools/opensp/opensp/rangmap-fix.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: OpenSP-1.5/include/RangeMap.cxx
 ===================================================================
 --- OpenSP-1.5.orig/include/RangeMap.cxx	2000-02-26 03:55:21.000000000 +1100
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
index 1366ada..1f39b03 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
+++ b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/autohell.patch
@@ -1,6 +1,9 @@
 Patch obtained from OpenEmbedded.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- sgml-common-0.6.3/bin/Makefile.am~autohell.patch	2001-01-30 15:42:21.000000000 +0100
 +++ sgml-common-0.6.3/bin/Makefile.am	2004-06-17 11:51:11.000000000 +0200
 @@ -1,6 +1,5 @@
diff --git a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
index ec66aae..54b3f54 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
+++ b/meta/recipes-devtools/sgml-common/sgml-common-0.6.3/license.patch
@@ -7,7 +7,10 @@ Upstream was notified about this on 2011-01-24. When upgrading
 this recipe, this should be fixed and you should remove this
 patch.
 
+Upstream-Status: Pending
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN sgml-common-0.6.3.orig/LICENSE-GPLv2 sgml-common-0.6.3/LICENSE-GPLv2
 --- sgml-common-0.6.3.orig/LICENSE-GPLv2	1969-12-31 16:00:00.000000000 -0800
 +++ sgml-common-0.6.3/LICENSE-GPLv2	2011-01-28 17:05:17.299528001 -0800
diff --git a/meta/recipes-extended/at/at-3.1.12/configure.patch b/meta/recipes-extended/at/at-3.1.12/configure.patch
index 2458ef3..079a6b4 100644
--- a/meta/recipes-extended/at/at-3.1.12/configure.patch
+++ b/meta/recipes-extended/at/at-3.1.12/configure.patch
@@ -1,5 +1,9 @@
-# Fix cross-compilation issues in configure.ac
-# Derived from an OE patch for at-3.1.8
+Fix cross-compilation issues in configure.ac
+Derived from an OE patch for at-3.1.8
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 Index: at-3.1.12/configure.ac
 ===================================================================
diff --git a/meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch b/meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch
index 6383660..877be35 100644
--- a/meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch
+++ b/meta/recipes-extended/at/at-3.1.12/fix_parallel_build_error.patch
@@ -9,6 +9,10 @@ Fixed the issue by adding a dependancy in the makefile.
 Nitin <nitin.a.kamble@intel.com>
 2010/09/02
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: at-3.1.12/Makefile.in
 ===================================================================
 --- at-3.1.12.orig/Makefile.in
diff --git a/meta/recipes-extended/cpio/cpio-2.11/statdef.patch b/meta/recipes-extended/cpio/cpio-2.11/statdef.patch
index dfa0d91..a6b8e82 100644
--- a/meta/recipes-extended/cpio/cpio-2.11/statdef.patch
+++ b/meta/recipes-extended/cpio/cpio-2.11/statdef.patch
@@ -1,5 +1,9 @@
-# Avoid multiple stat definitions
-# Patch taken from cpio mailing list posting 2010-03-19
+Avoid multiple stat definitions
+Patch taken from cpio mailing list posting 2010-03-19
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
 diff -urN cpio-2.11.orig/src/filetypes.h cpio-2.11/src/filetypes.h
 --- cpio-2.11.orig/src/filetypes.h	2010-02-12 02:19:23.000000000 -0800
diff --git a/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch b/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
index e622a0d..5e551ac 100644
--- a/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
+++ b/meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
@@ -2,6 +2,11 @@ innetgr may not be there so make sure that when innetgr is not present
 then we inform about it and not use it.
 
 -Khem
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: Linux-PAM-1.1.3/modules/pam_group/pam_group.c
 ===================================================================
 --- Linux-PAM-1.1.3.orig/modules/pam_group/pam_group.c
diff --git a/meta/recipes-extended/sudo/files/libtool.patch b/meta/recipes-extended/sudo/files/libtool.patch
index 2375fc6..22fda53 100644
--- a/meta/recipes-extended/sudo/files/libtool.patch
+++ b/meta/recipes-extended/sudo/files/libtool.patch
@@ -1,6 +1,10 @@
-# Fix path to libtool scripts so autoreconf can succeed.
-#
-# Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Fix path to libtool scripts so autoreconf can succeed.
+
+Upstream-Status: Inappropriate [Other]
+Workaround specific to our build system.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -urN sudo-1.7.4p4.orig//aclocal.m4 sudo-1.7.4p4//aclocal.m4
 --- sudo-1.7.4p4.orig//aclocal.m4	2010-08-06 07:17:36.000000000 -0700
 +++ sudo-1.7.4p4//aclocal.m4	2010-11-22 14:38:20.360957038 -0800
diff --git a/meta/recipes-support/icu/files/gccfix.patch b/meta/recipes-support/icu/files/gccfix.patch
index 9291e92..755341f 100644
--- a/meta/recipes-support/icu/files/gccfix.patch
+++ b/meta/recipes-support/icu/files/gccfix.patch
@@ -1,3 +1,9 @@
+Fixes an error which prevents compilation
+
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: source/layoutex/ParagraphLayout.cpp
 ===================================================================
 --- source.orig/layoutex/ParagraphLayout.cpp	2009-06-30 11:48:47.000000000 +0100
diff --git a/meta/recipes-support/icu/files/noldlibpath.patch b/meta/recipes-support/icu/files/noldlibpath.patch
index eba3d80..8543044 100644
--- a/meta/recipes-support/icu/files/noldlibpath.patch
+++ b/meta/recipes-support/icu/files/noldlibpath.patch
@@ -4,6 +4,11 @@ harmless. This is a hack.
 
 RP 10/6/2010
 
+Upstream-Status: Inappropriate [Other]
+Hacky workaround not likely to be accepted upstream.
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: source/config/Makefile.inc.in
 ===================================================================
 --- source.orig/config/Makefile.inc.in	2010-06-10 21:49:19.000000000 +0100
diff --git a/meta/recipes-support/icu/files/use-g++-for-linking.patch b/meta/recipes-support/icu/files/use-g++-for-linking.patch
index 4702abc..f477dad 100644
--- a/meta/recipes-support/icu/files/use-g++-for-linking.patch
+++ b/meta/recipes-support/icu/files/use-g++-for-linking.patch
@@ -1,3 +1,10 @@
+Use g++ for linking.
+
+Upstream-Status: Inappropriate [Other]
+Build system specific
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 ---
  tools/genccode/Makefile.in |    2 +-
  tools/gencmn/Makefile.in   |    2 +-
-- 
1.7.1.1



