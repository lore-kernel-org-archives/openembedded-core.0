Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QJzel-0000Iy-UT
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 05:00:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2011 19:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="745478578"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2011 19:57:24 -0700
Message-Id: <4d6fe7a650aacde7748f1b482ba70f6ed6078328.1305082484.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305082484.git.edwin.zhai@intel.com>
References: <cover.1305082484.git.edwin.zhai@intel.com>
Old-Date: Tue, 10 May 2011 15:49:12 +0800
Date: Wed, 11 May 2011 10:57:24 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 2/2] clutter-cairo: remove remaining files from this obsolete recipe
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
X-List-Received-Date: Wed, 11 May 2011 03:00:12 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/clutter/clutter-cairo.inc    |   13 ---------
 .../clutter-cairo/enable_examples-0.6.patch        |   23 ----------------
 .../clutter/clutter-cairo/enable_examples.patch    |   28 --------------------
 3 files changed, 0 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo/enable_examples-0.6.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-cairo/enable_examples.patch

diff --git a/meta/recipes-graphics/clutter/clutter-cairo.inc b/meta/recipes-graphics/clutter/clutter-cairo.inc
deleted file mode 100644
index ff88989..0000000
--- a/meta/recipes-graphics/clutter/clutter-cairo.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Clutter Cairo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPL"
-
-DEPENDS = "cairo"
-
-FILESPATH = "${FILE_DIRNAME}/clutter-cairo"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${bindir}/flowers ${bindir}/clock"
-
-inherit autotools pkgconfig
-
diff --git a/meta/recipes-graphics/clutter/clutter-cairo/enable_examples-0.6.patch b/meta/recipes-graphics/clutter/clutter-cairo/enable_examples-0.6.patch
deleted file mode 100644
index 3baea4c..0000000
--- a/meta/recipes-graphics/clutter/clutter-cairo/enable_examples-0.6.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Index: clutter-cairo-0-6/examples/Makefile.am
-===================================================================
---- clutter-cairo-0-6.orig/examples/Makefile.am	2008-10-02 22:03:18.000000000 +0100
-+++ clutter-cairo-0-6/examples/Makefile.am	2008-10-02 22:03:31.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = clock flowers
-+bin_PROGRAMS = clock flowers
- 
- INCLUDES = -I$(top_srcdir)/ @GCC_FLAGS@ @DEPS_CFLAGS@
- AM_LDFLAGS = @DEPS_LIBS@ $(top_builddir)/libclutter-cairo-@CLUTTER_CAIRO_MAJORMINOR@.la 
-Index: clutter-cairo-0-6/examples/flowers.c
-===================================================================
---- clutter-cairo-0-6.orig/examples/flowers.c	2008-10-02 22:03:23.000000000 +0100
-+++ clutter-cairo-0-6/examples/flowers.c	2008-10-02 22:03:39.000000000 +0100
-@@ -11,7 +11,7 @@
- 
- #define PETAL_MIN 20
- #define PETAL_VAR 40
--#define N_FLOWERS 40 /* reduce if you have a small card */
-+#define N_FLOWERS 8 /* reduce if you have a small card */
- 
- typedef struct Flower
- {
diff --git a/meta/recipes-graphics/clutter/clutter-cairo/enable_examples.patch b/meta/recipes-graphics/clutter/clutter-cairo/enable_examples.patch
deleted file mode 100644
index c5ed63f..0000000
--- a/meta/recipes-graphics/clutter/clutter-cairo/enable_examples.patch
+++ /dev/null
@@ -1,28 +0,0 @@
----
- examples/Makefile.am |    2 +-
- examples/flowers.c   |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: clutter-cairo/examples/Makefile.am
-===================================================================
---- clutter-cairo.orig/examples/Makefile.am	2008-08-11 16:30:04.000000000 +0100
-+++ clutter-cairo/examples/Makefile.am	2008-08-11 16:30:24.000000000 +0100
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = clock flowers bubbles
-+bin_PROGRAMS = clock flowers bubbles
- 
- INCLUDES = -I$(top_srcdir)/ @GCC_FLAGS@ @DEPS_CFLAGS@
- AM_LDFLAGS = @DEPS_LIBS@ $(top_builddir)/libclutter-cairo-@CLUTTER_CAIRO_MAJORMINOR@.la 
-Index: clutter-cairo/examples/flowers.c
-===================================================================
---- clutter-cairo.orig/examples/flowers.c	2008-08-11 16:30:04.000000000 +0100
-+++ clutter-cairo/examples/flowers.c	2008-08-11 16:30:10.000000000 +0100
-@@ -11,7 +11,7 @@
- 
- #define PETAL_MIN 20
- #define PETAL_VAR 40
--#define N_FLOWERS 40 /* reduce if you have a small card */
-+#define N_FLOWERS 8 /* reduce if you have a small card */
- 
- typedef struct Flower
- {
-- 
1.7.1



