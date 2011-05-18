Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QMcnM-0001tn-Vj
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:11:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 02:08:58 -0700
X-ExtLoop1: 1
Received: from unknown (HELO helios) ([10.255.16.147])
	by orsmga002.jf.intel.com with SMTP; 18 May 2011 02:08:57 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 18 May 2011 10:08:56 +0100
Message-Id: <00cd5a1003f7653f9fa757bea8906682a758b95d.1305709034.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1305709034.git.paul.eggleton@linux.intel.com>
References: <cover.1305709034.git.paul.eggleton@linux.intel.com>
Old-Date: Tue, 17 May 2011 15:51:01 +0100
Date: Wed, 18 May 2011 10:08:56 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] qt4: add comments and Upstream-Status to all patches
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
X-List-Received-Date: Wed, 18 May 2011 09:11:57 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/files/0004-no-qmake.patch      |    1 +
 .../qt4/files/0006-freetype-host-includes.patch    |    3 ++-
 meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch  |    7 ++++++-
 meta/recipes-qt/qt4/files/0009-support-2bpp.patch  |    5 +++++
 .../recipes-qt/qt4/files/compile.test-lflags.patch |    4 ++++
 meta/recipes-qt/qt4/files/configure-lflags.patch   |    5 +++++
 meta/recipes-qt/qt4/files/configure-paths.patch    |    5 +++++
 meta/recipes-qt/qt4/files/fix-config-tests.patch   |    2 ++
 meta/recipes-qt/qt4/files/qmake-exists-check.patch |    1 +
 meta/recipes-qt/qt4/files/qt-config.patch          |    5 +++++
 .../0001-Added-Openembedded-crossarch-option.patch |    5 ++++-
 .../qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch          |   12 ++++++++++++
 12 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt4/files/0004-no-qmake.patch b/meta/recipes-qt/qt4/files/0004-no-qmake.patch
index a58b19f..ed50c6d 100644
--- a/meta/recipes-qt/qt4/files/0004-no-qmake.patch
+++ b/meta/recipes-qt/qt4/files/0004-no-qmake.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] no qmake
 qmake is already built in qt4-tools-native, so disable it
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Inappropriate [configuration]
 
 ---
  configure |    2 +-
diff --git a/meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch b/meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch
index 081d899..effc5f1 100644
--- a/meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch
+++ b/meta/recipes-qt/qt4/files/0006-freetype-host-includes.patch
@@ -3,9 +3,10 @@ From: Michael Krelin <hacker@klever.net>
 Date: Mon, 4 Jun 2007 14:48:50 +0200
 Subject: [PATCH] freetype host includes
 
-Host include path should not be used in corss compiling case.
+Host include path should not be used in cross compiling case.
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Pending
 
 ---
  config.tests/unix/freetype/freetype.pri |    2 +-
diff --git a/meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch b/meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch
index a1b8912..d308a15 100644
--- a/meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch
+++ b/meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch
@@ -1,6 +1,11 @@
-Add lib infix to distinguish different qt compile version: e.g. "E" for embedded, "" for X11
+Add lib infix for QtUiTools to distinguish different Qt edition: e.g. "E" for embedded, "" for X11
 
+Patch has been accepted upstream and should be included in the next major version (4.8.0), see:
+http://bugreports.qt.nokia.com/browse/QTBUG-7169
+
+Original Author: Jeremy Lainé <jeremy.laine@m4x.org>
 Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Accepted
 
 --- /tmp/uitools.prf	2009-12-01 18:38:22.000000000 +0100
 +++ qt-everywhere-opensource-src-4.6.0/mkspecs/features/uitools.prf	2009-12-01 18:58:16.000000000 +0100
diff --git a/meta/recipes-qt/qt4/files/0009-support-2bpp.patch b/meta/recipes-qt/qt4/files/0009-support-2bpp.patch
index cf44ea8..6f0890b 100644
--- a/meta/recipes-qt/qt4/files/0009-support-2bpp.patch
+++ b/meta/recipes-qt/qt4/files/0009-support-2bpp.patch
@@ -1,5 +1,10 @@
 Add 2bpp support
 
+Submitted upstream but rejected as being "out of scope":
+http://bugreports.qt.nokia.com/browse/QTBUG-3468
+
+Upstream-Status: Denied
+Original author: Jeremy Lainé <jeremy.laine@m4x.org>
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 
 diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/configure qt-embedded-linux-opensource-src-4.4.3/configure
diff --git a/meta/recipes-qt/qt4/files/compile.test-lflags.patch b/meta/recipes-qt/qt4/files/compile.test-lflags.patch
index e4b256b..1d725b7 100644
--- a/meta/recipes-qt/qt4/files/compile.test-lflags.patch
+++ b/meta/recipes-qt/qt4/files/compile.test-lflags.patch
@@ -1,3 +1,7 @@
+Pass through LDFLAGS to configure tests
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: qt-everywhere-opensource-src-4.6.3/config.tests/unix/compile.test
 ===================================================================
 --- qt-everywhere-opensource-src-4.6.3.orig/config.tests/unix/compile.test	2010-06-02 06:03:18.000000000 +0400
diff --git a/meta/recipes-qt/qt4/files/configure-lflags.patch b/meta/recipes-qt/qt4/files/configure-lflags.patch
index df19549..a8e5945 100644
--- a/meta/recipes-qt/qt4/files/configure-lflags.patch
+++ b/meta/recipes-qt/qt4/files/configure-lflags.patch
@@ -1,3 +1,8 @@
+qt4-tools-native: set LFLAGS to pick up zlib from staging
+
+Original Author: Jeremy Lainé <jeremy.laine@m4x.org>
+Upstream-Status: Pending
+
 Index: qtopia-core-opensource-src-4.3.3/configure
 ===================================================================
 --- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.000000000 +0000
diff --git a/meta/recipes-qt/qt4/files/configure-paths.patch b/meta/recipes-qt/qt4/files/configure-paths.patch
index c9259a1..45208ec 100644
--- a/meta/recipes-qt/qt4/files/configure-paths.patch
+++ b/meta/recipes-qt/qt4/files/configure-paths.patch
@@ -1,3 +1,8 @@
+Use OE_QMAKE_* values to specify Qt utility paths
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Upstream-Status: Inappropriate [configuration]
+
 Index: qt-everywhere-opensource-src-4.6.3/configure
 ===================================================================
 --- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 15:47:37.100607001 +0000
diff --git a/meta/recipes-qt/qt4/files/fix-config-tests.patch b/meta/recipes-qt/qt4/files/fix-config-tests.patch
index 2105455..1e0d14e 100644
--- a/meta/recipes-qt/qt4/files/fix-config-tests.patch
+++ b/meta/recipes-qt/qt4/files/fix-config-tests.patch
@@ -2,7 +2,9 @@ Fix invocation in case of "ccache some-compiler-gcc". As the command "ccache som
 
 both visibility and relocs were affected.
 
+Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
 Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Pending
 
 Index: qt-x11-opensource-src-4.5.2/config.tests/unix/bsymbolic_functions.test
 ===================================================================
diff --git a/meta/recipes-qt/qt4/files/qmake-exists-check.patch b/meta/recipes-qt/qt4/files/qmake-exists-check.patch
index cc73837..27d21e0 100644
--- a/meta/recipes-qt/qt4/files/qmake-exists-check.patch
+++ b/meta/recipes-qt/qt4/files/qmake-exists-check.patch
@@ -4,6 +4,7 @@ qt4-tools-nativesdk patch to avoids building qmake in configure if it already ex
 (as it will, since we symlink it in from the native sysroot in do_configure)
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Upstream-Status: Inappropriate [configuration]
 
 --- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 12:01:56.260607001 +0000
 +++ qt-everywhere-opensource-src-4.6.3/configure	2011-01-10 12:02:20.584607015 +0000
diff --git a/meta/recipes-qt/qt4/files/qt-config.patch b/meta/recipes-qt/qt4/files/qt-config.patch
index a31e7b3..2ab05ed 100644
--- a/meta/recipes-qt/qt4/files/qt-config.patch
+++ b/meta/recipes-qt/qt4/files/qt-config.patch
@@ -1,5 +1,10 @@
+Allow to set a qt.conf from the outside using the environment. This allows
+to inject new prefixes and other paths into qmake. This is needed when using
+the same qmake binary to build qt/x11 and qt/embedded
 
+Original Author: Holger Freyther <zecke@selfish.org>
 Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Pending
 
 --- /tmp/qlibraryinfo.cpp	2008-08-02 17:16:41.000000000 +0200
 +++ qt-embedded-linux-opensource-src-4.4.1/src/corelib/global/qlibraryinfo.cpp	2008-08-02 17:17:42.000000000 +0200
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
index 71a04a5..f302c5b 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
+++ b/meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-crossarch-option.patch
@@ -1,8 +1,11 @@
 From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
+From: Matthias Günther <matgnt@gmail.com>
 Date: Wed, 12 May 2010 16:52:45 +0200
 Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
 
+Original Author: Michael Lauer <mickey@vanille-media.de>
+Upstream-Status: Pending
+
 ---
  configure |    7 ++++++-
  1 files changed, 6 insertions(+), 1 deletions(-)
diff --git a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
index 5c588ff..39c5f4a 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
+++ b/meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
@@ -1,3 +1,15 @@
+Hack to not use the pg_config of the host system which will add /usr/include
+
+pg_config is a native binary so using that when cross compiling
+will always fail.  The commented out fix would do, but for OE
+our -platform and -xplatform is the same so we are actually not
+really cross compiling. Just comment out the test, we are passing
+the location to the postgres headers and if they are okay we
+will pad.
+
+Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
+Upstream-Status: Inappropriate [configuration]
+
 Index: qt-everywhere-opensource-src-4.7.0/configure
 ===================================================================
 --- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:51.191162141 -0400
-- 
1.7.4.1



