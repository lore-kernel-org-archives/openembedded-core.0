Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QMKUk-0000ww-H8
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:39:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 06:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,225,1304319600"; 
   d="scan'208";a="2772123"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 06:36:35 -0700
Message-Id: <6a45c0729404ded8851b080e75c0c7c1674c47ee.1305639192.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305639192.git.edwin.zhai@intel.com>
References: <cover.1305639192.git.edwin.zhai@intel.com>
Old-Date: Tue, 17 May 2011 21:26:36 +0800
Date: Tue, 17 May 2011 21:36:23 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 1/1] Upstream-Status: Update patch upstream-status for GPLv2 recipes
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
X-List-Received-Date: Tue, 17 May 2011 13:39:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Including gzip and mtoools

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mtools/mtools/mtools-makeinfo.patch            |    2 ++
 meta/recipes-devtools/mtools/mtools/mtools.patch   |    2 ++
 meta/recipes-devtools/mtools/mtools/no-x11.patch   |    2 ++
 .../gzip/gzip-1.3.12/dup-def-fix.patch             |    3 +++
 .../gzip/gzip-1.3.12/m4-extensions-fix.patch       |    3 +++
 5 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 35fae44..2e2873a 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 --- mtools-3.9.9/configure.in.orig	2006-04-14 16:05:54.337655192 -0600
 +++ mtools-3.9.9/configure.in	2006-04-14 16:12:29.736545424 -0600
 @@ -21,6 +21,33 @@
diff --git a/meta/recipes-devtools/mtools/mtools/mtools.patch b/meta/recipes-devtools/mtools/mtools/mtools.patch
index 2abf534..15a3208 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools.patch
@@ -4,6 +4,8 @@ $NetBSD: patch-aa,v 1.10 2007/08/17 20:55:34 joerg Exp $
  Makefile.in |   74 ++++++++++++++++++++++++++----------------------------------
  1 file changed, 33 insertions(+), 41 deletions(-)
 
+Upstream-Status: Inappropriate [licensing]
+
 Index: mtools-3.9.9/Makefile.in
 ===================================================================
 --- mtools-3.9.9.orig/Makefile.in	2007-10-12 11:18:46.000000000 +0100
diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.patch b/meta/recipes-devtools/mtools/mtools/no-x11.patch
index 300f43f..705b629 100644
--- a/meta/recipes-devtools/mtools/mtools/no-x11.patch
+++ b/meta/recipes-devtools/mtools/mtools/no-x11.patch
@@ -2,6 +2,8 @@
  Makefile.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+Upstream-Status: Inappropriate [licensing]
+
 --- mtools-3.9.9.orig/Makefile.in
 +++ mtools-3.9.9/Makefile.in
 @@ -128,11 +128,11 @@ X_EXTRA_LIBS = @X_EXTRA_LIBS@
diff --git a/meta/recipes-extended/gzip/gzip-1.3.12/dup-def-fix.patch b/meta/recipes-extended/gzip/gzip-1.3.12/dup-def-fix.patch
index 8308865..d9e8d21 100644
--- a/meta/recipes-extended/gzip/gzip-1.3.12/dup-def-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.3.12/dup-def-fix.patch
@@ -1,6 +1,9 @@
 gzip uses gnulib, whose header conflict with glibc. This patch rename some function to avoid conflict.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [licensing]
+
 Index: gzip-1.3.12/gzip.c
 ===================================================================
 --- gzip-1.3.12.orig/gzip.c	2010-08-13 10:29:38.000000000 +0800
diff --git a/meta/recipes-extended/gzip/gzip-1.3.12/m4-extensions-fix.patch b/meta/recipes-extended/gzip/gzip-1.3.12/m4-extensions-fix.patch
index 9273772..6b2f698 100644
--- a/meta/recipes-extended/gzip/gzip-1.3.12/m4-extensions-fix.patch
+++ b/meta/recipes-extended/gzip/gzip-1.3.12/m4-extensions-fix.patch
@@ -2,6 +2,9 @@ remove AC_USE_SYSTEM_EXTENSIONS to fix the autoconf error "AC_REQUIRE: circular
 dependency of AC_GNU_SOURCE"
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [licensing]
+
 Index: gzip-1.3.12/m4/extensions.m4
 ===================================================================
 --- gzip-1.3.12.orig/m4/extensions.m4	2010-08-16 14:18:16.000000000 +0800
-- 
1.7.1



