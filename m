Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0Hw-00063u-Kb
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:41:04 +0200
Received: by wibhj13 with SMTP id hj13so2349405wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=Iq00Kt48NM8HyYgUZql/GyYYqI8dQOmEg47Zj8R460s=;
	b=wD9KnZYCfQy0F4R2xZC2HkYH3UuLd04DvP8cAmJiv3pMMMyCjJzL6OaKeaNQcOLv6+
	0WrfqeND1rB/zLS3esriOe+f7JocISEcKDPOy0x4yRYy2l1IRvw8TkAXIIHrnYPxdsHH
	9ozh9MpPHihxBIwVBEcIvAMPk9FjRmgm3NF+/2xX9LNhA0pOCAoLGP18asNSdD366p2X
	A6Zvd+1qWU93D4Lk/0xmKx9sYWPKmjr8zLmgn9lsmeeBtyZCKHS455Ngr4oOWVjaBLYd
	t/gN5IyuHCa2FUGt2EvSZqHSAuiDgH8YJknWoMr0gzIddkDiqHCyoEzoSLg+XpNR3Qb7
	7mow==
Received: by 10.180.105.163 with SMTP id gn3mr4140894wib.2.1348698493709;
	Wed, 26 Sep 2012 15:28:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm9500307wib.10.2012.09.26.15.28.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:28:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:13 +0200
Message-Id: <1e3d41103c168b7bb677fcbd06d49333f2c1536b.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] qt4: replace all local patches with git patches with headers
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
X-List-Received-Date: Wed, 26 Sep 2012 22:41:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* in preparation for upgrade to 4.8.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        | 12 ++--
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb   |  2 +-
 meta/recipes-qt/qt4/qt4-4.8.1.inc                  | 34 +++++-----
 ...-allow-to-set-qt.conf-from-the-outside-u.patch} | 28 ++++++--
 ...ty_qws-fix-build-with-old-kernel-headers.patch} | 21 ++++--
 ...03-webkit2-set-OUTPUT_DIR-value-if-empty.patch} | 21 +++++-
 ...make-is-already-built-in-qt4-tools-native.patch | 29 +++++++++
 meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch  | 27 --------
 ...-set-LFLAGS-to-pick-up-zlib-from-staging.patch} | 22 +++++--
 ...e-OE_QMAKE_-values-to-specify-Qt-utility.patch} | 26 ++++++--
 ...const-usage-that-causes-compile-failure-.patch} | 26 ++++++--
 ...low-building-a-separate-qmake-for-the-ta.patch} | 20 +++---
 ...-fix-source-file-references-in-qmake.pri.patch} | 13 ++--
 ...ck-to-not-use-the-pg_config-of-the-host-.patch} | 25 +++++--
 ...des.patch => 0011-freetype-host-includes.patch} | 20 +++---
 ...port-2bpp.patch => 0012-Add-2bpp-support.patch} | 76 +++++++++++++---------
 ...h => 0013-configure-add-crossarch-option.patch} | 32 ++++-----
 ...ions-fix-phony-translation-linking-error.patch} | 19 ++++--
 ...configure-add-nostrip-for-debug-packages.patch} | 15 ++++-
 ...l.patch => 0016-configure-eval-QMAKE_CXX.patch} | 26 ++++++--
 ...sure-we-identify-the-compiler-as-g-in-co.patch} | 27 ++++++--
 ...re-make-pulseaudio-a-configurable-option.patch} | 17 ++---
 ...re-Fix-compile-error-when-using-toolchai.patch} | 31 ++++++---
 ...es-for-gcc-4.7.0-particularly-on-qemux86.patch} | 45 ++++++++-----
 ...021-webkit-disable-the-fuse-ld-gold-flag.patch} | 23 +++++--
 ...tch => 0022-webkit-fix-conflicting-types.patch} | 32 +++++----
 meta/recipes-qt/qt4/qt4-native.inc                 |  6 +-
 27 files changed, 438 insertions(+), 237 deletions(-)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{qt-config.patch => 0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch} (49%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{fix_qkbdtty_qws.patch => 0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch} (68%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{set-OUTPUT_DIR-if-empty.patch => 0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch} (48%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch
 rename meta/recipes-qt/qt4/qt4-4.8.1/{configure-lflags.patch => 0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch} (48%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{configure-paths.patch => 0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch} (58%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{qt-dbus-const.patch => 0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch} (52%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{target_qmake.patch => 0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch} (57%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{qmake_pri_fixes.patch => 0009-qmake-fix-source-file-references-in-qmake.pri.patch} (82%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{hack-out-pg2-4.7.0.patch => 0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch} (68%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{0006-freetype-host-includes.patch => 0011-freetype-host-includes.patch} (50%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{0009-support-2bpp.patch => 0012-Add-2bpp-support.patch} (83%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{0001-Added-Openembedded-crossarch-option.patch => 0013-configure-add-crossarch-option.patch} (61%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{fix-translations.patch => 0014-translations-fix-phony-translation-linking-error.patch} (63%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{add_nostrip_for_debug_packages.diff => 0015-configure-add-nostrip-for-debug-packages.patch} (57%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{qmake_cxx_eval.patch => 0016-configure-eval-QMAKE_CXX.patch} (60%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{configure_oe_compiler.patch => 0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch} (60%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{pulseaudio-config.patch => 0018-configure-make-pulseaudio-a-configurable-option.patch} (85%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{gcc47-fix.patch => 0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch} (46%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{gcc47-fix2.patch => 0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch} (46%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{disable-fuse-gold-flag.patch => 0021-webkit-disable-the-fuse-ld-gold-flag.patch} (46%)
 rename meta/recipes-qt/qt4/qt4-4.8.1/{fix_conflicting_types.patch => 0022-webkit-fix-conflicting-types.patch} (42%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 542f395..2330853 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -11,12 +11,12 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 inherit nativesdk qmake2
 
 SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://0004-no-qmake.patch \
-           file://configure-lflags.patch \
-           file://qt-config.patch \
-           file://configure-paths.patch \
-           file://qt-dbus-const.patch \
-           file://target_qmake.patch \
+           file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+           file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
+           file://0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch \
+           file://0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch \
+           file://0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch \
+           file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch \
            file://g++.conf \
            file://linux.conf"
 
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
index 42d2873..6d9800d 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
@@ -2,7 +2,7 @@ require nativesdk-qt4-tools.inc
 
 PR = "${INC_PR}.1"
 
-SRC_URI += "file://qmake_pri_fixes.patch"
+SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
 
 SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
 SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1.inc b/meta/recipes-qt/qt4/qt4-4.8.1.inc
index ace665f..4cf1222 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.1.inc
@@ -6,25 +6,25 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
 SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://0004-no-qmake.patch \
-           file://hack-out-pg2-4.7.0.patch \
-           file://0006-freetype-host-includes.patch \
-           file://0009-support-2bpp.patch \
-           file://0001-Added-Openembedded-crossarch-option.patch \
-           file://fix-translations.patch \
-           file://add_nostrip_for_debug_packages.diff \
-           file://qmake_cxx_eval.patch \
-           file://configure_oe_compiler.patch \
-           file://target_qmake.patch \
-           file://qmake_pri_fixes.patch \
-           file://pulseaudio-config.patch \
+           file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
+           file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
+           file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch \
+           file://0009-qmake-fix-source-file-references-in-qmake.pri.patch \
+           file://0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch \
+           file://0011-freetype-host-includes.patch \
+           file://0012-Add-2bpp-support.patch \
+           file://0013-configure-add-crossarch-option.patch \
+           file://0014-translations-fix-phony-translation-linking-error.patch \
+           file://0015-configure-add-nostrip-for-debug-packages.patch \
+           file://0016-configure-eval-QMAKE_CXX.patch \
+           file://0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch \
+           file://0018-configure-make-pulseaudio-a-configurable-option.patch \
+           file://0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch \
+           file://0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
+           file://0021-webkit-disable-the-fuse-ld-gold-flag.patch \
+           file://0022-webkit-fix-conflicting-types.patch \
            file://g++.conf \
            file://linux.conf \
-           file://gcc47-fix.patch \
-           file://gcc47-fix2.patch \
-           file://disable-fuse-gold-flag.patch \
-           file://fix_conflicting_types.patch \
-           file://set-OUTPUT_DIR-if-empty.patch \
            "
 
 SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qt-config.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 49%
rename from meta/recipes-qt/qt4/qt4-4.8.1/qt-config.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 2ab05ed..a3a8dae 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/qt-config.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,14 +1,25 @@
+From 51c37481a0c0ea946567ea2344107428e6d71590 Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 17:22:30 +0200
+Subject: [PATCH 01/22] qlibraryinfo: allow to set qt.conf from the outside
+ using the environment
+
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
 the same qmake binary to build qt/x11 and qt/embedded
 
-Original Author: Holger Freyther <zecke@selfish.org>
-Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Pending
 
---- /tmp/qlibraryinfo.cpp	2008-08-02 17:16:41.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.1/src/corelib/global/qlibraryinfo.cpp	2008-08-02 17:17:42.000000000 +0200
-@@ -47,6 +47,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/corelib/global/qlibraryinfo.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 2862c2c..3a36b01 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -54,6 +54,7 @@
  QT_BEGIN_NAMESPACE
  extern QString qmake_libraryInfoFile();
  QT_END_NAMESPACE
@@ -16,8 +27,8 @@ Upstream-Status: Pending
  #else
  # include "qcoreapplication.h"
  #endif
-@@ -113,6 +114,10 @@
- #ifdef QT_BUILD_QMAKE
+@@ -112,6 +113,10 @@ QSettings *QLibraryInfoPrivate::findConfiguration()
+ #ifdef BOOTSTRAPPING
      if(!QFile::exists(qtconfig))
          qtconfig = qmake_libraryInfoFile();
 +    if (!QFile::exists(qtconfig)) {
@@ -27,3 +38,6 @@ Upstream-Status: Pending
  #else
      if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
  #ifdef Q_OS_MAC
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/fix_qkbdtty_qws.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
similarity index 68%
rename from meta/recipes-qt/qt4/qt4-4.8.1/fix_qkbdtty_qws.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
index c2aed5c..021a6de 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/fix_qkbdtty_qws.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
@@ -1,4 +1,7 @@
-Upstream-Status: Pending
+From 419b6a19d3d506880fa705682613eaaeb7dcd9cf Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 26 Sep 2012 20:18:08 +0200
+Subject: [PATCH 02/22] qkbdtty_qws: fix build with old kernel headers
 
 This issue is that with C++ compiler process an old version of kernel
 header file, coincidently that file has a variable named 'new':
@@ -9,11 +12,18 @@ header file, coincidently that file has a variable named 'new':
 
 On mostly hosts it has been changed to: new -> newev.
 
+Upstream-Status: Pending
+
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-=======================================
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui/embedded/qkbdtty_qws.cpp | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
 diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
---- a/src/gui/embedded/qkbdtty_qws.cpp	2012-07-27 13:16:58.420198350 +0800
-+++ b/src/gui/embedded/qkbdtty_qws.cpp	2012-07-27 13:24:43.924191127 +0800
+index f4b8461..4cee2e7 100644
+--- a/src/gui/embedded/qkbdtty_qws.cpp
++++ b/src/gui/embedded/qkbdtty_qws.cpp
 @@ -54,8 +54,20 @@
  
  #if defined Q_OS_LINUX
@@ -35,3 +45,6 @@ diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
  #  include "qscreen_qws.h"
  #  include "qwindowsystem_qws.h"
  #  include "qapplication.h"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/set-OUTPUT_DIR-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
similarity index 48%
rename from meta/recipes-qt/qt4/qt4-4.8.1/set-OUTPUT_DIR-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
index 9cb72ba..859a037 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/set-OUTPUT_DIR-if-empty.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
@@ -1,3 +1,8 @@
+From 96bee73bdf663ddeb2a5d48cab9c5e4df65ba295 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 1 May 2012 07:48:15 +0200
+Subject: [PATCH 03/22] webkit2: set OUTPUT_DIR value if empty
+
 Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
 now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
 
@@ -6,9 +11,16 @@ http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24436.h
 
 Upstream-Status: Pending
 
---- qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro.orig	2012-05-01 07:48:08.457613310 +0200
-+++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro	2012-05-01 07:48:15.493613232 +0200
-@@ -3,6 +3,8 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro b/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
+index 006a88c..5e17193 100644
+--- a/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
++++ b/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
+@@ -3,6 +3,8 @@ TARGET = dummy
  
  CONFIG -= debug_and_release
  
@@ -17,3 +29,6 @@ Upstream-Status: Pending
  CONFIG(standalone_package) {
      isEmpty(WEBKIT2_GENERATED_SOURCES_DIR):WEBKIT2_GENERATED_SOURCES_DIR = $$PWD/generated
      isEmpty(WC_GENERATED_SOURCES_DIR):WC_GENERATED_SOURCES_DIR = $$PWD/../WebCore/generated
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
new file mode 100644
index 0000000..e147375
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
@@ -0,0 +1,29 @@
+From aa1788b0ec0b9b7c0e1a7c6bd9ef5c9555361014 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Wed, 26 Sep 2012 20:24:20 +0200
+Subject: [PATCH 04/22] configure: qmake is already built in qt4-tools-native,
+ so disable it
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index a706908..00b072a 100755
+--- a/configure
++++ b/configure
+@@ -4816,7 +4816,7 @@ END {
+ }
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake. Please wait..."
+ 
+     OLD_QCONFIG_H=
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch
deleted file mode 100644
index ed50c6d..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0004-no-qmake.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f5a73ce944240de9013cc23288c115e8213add5e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Sat, 2 Jun 2007 16:06:59 +0200
-Subject: [PATCH] no qmake
-
-qmake is already built in qt4-tools-native, so disable it
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-Upstream-Status: Inappropriate [configuration]
-
----
- configure |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.4.3/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2009-03-26 17:03:43.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-03-26 17:04:17.000000000 +0100
-@@ -3786,7 +3786,7 @@
- }
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake. Please wait..."
- 
-     OLD_QCONFIG_H=
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/configure-lflags.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
similarity index 48%
rename from meta/recipes-qt/qt4/qt4-4.8.1/configure-lflags.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
index d74f7fd..9171fa7 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/configure-lflags.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
@@ -1,12 +1,19 @@
-qt4-tools-native: set LFLAGS to pick up zlib from staging
+From 1602cdf7f3bb548e63fca40b5bff8b9a75a144c5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
+Date: Wed, 26 Sep 2012 20:27:44 +0200
+Subject: [PATCH 05/22] configure: set LFLAGS to pick up zlib from staging
 
-Original Author: Jeremy Lainé <jeremy.laine@m4x.org>
 Upstream-Status: Pending
 
-Index: qt-everywhere-opensource-src-4.8.0/configure
-===================================================================
---- qt-everywhere-opensource-src-4.8.0.orig/configure
-+++ qt-everywhere-opensource-src-4.8.0/configure
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 00b072a..b1ba542 100755
+--- a/configure
++++ b/configure
 @@ -611,7 +611,7 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
@@ -16,3 +23,6 @@ Index: qt-everywhere-opensource-src-4.8.0/configure
  for varname in $SYSTEM_VARIABLES; do
      qmakevarname="${varname}"
      # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/configure-paths.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
similarity index 58%
rename from meta/recipes-qt/qt4/qt4-4.8.1/configure-paths.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
index 45208ec..51a6cfc 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/configure-paths.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
@@ -1,13 +1,22 @@
-Use OE_QMAKE_* values to specify Qt utility paths
+From 074881d57e5d7ad23a7a784a75f4ffebf091e543 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:29:09 +0200
+Subject: [PATCH 06/22] configure: Use OE_QMAKE_* values to specify Qt utility
+ paths
 
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Upstream-Status: Inappropriate [configuration]
 
-Index: qt-everywhere-opensource-src-4.6.3/configure
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 15:47:37.100607001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/configure	2011-01-10 15:49:14.576606999 +0000
-@@ -7198,11 +7198,11 @@
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure b/configure
+index b1ba542..0231b7d 100755
+--- a/configure
++++ b/configure
+@@ -8517,11 +8517,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
  QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
  
  #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
@@ -24,3 +33,6 @@ Index: qt-everywhere-opensource-src-4.6.3/configure
  QMAKE_INCDIR_QT  = \$\$QT_BUILD_TREE/include
  QMAKE_LIBDIR_QT  = \$\$QT_BUILD_TREE/lib
  
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qt-dbus-const.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
similarity index 52%
rename from meta/recipes-qt/qt4/qt4-4.8.1/qt-dbus-const.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
index 6ee402f..0105758 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/qt-dbus-const.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
@@ -1,17 +1,26 @@
-Remove "const" usage that causes compile failure building nativesdk-qt4-tools
-
-Upstream-Status: Denied [possible retry]
+From ff6a714f8256c6d98234066ba1788bee234b25a1 Mon Sep 17 00:00:00 2001
+From: Pavel Heimlich <tropikhajma@gmail.com>
+Date: Wed, 26 Sep 2012 20:31:10 +0200
+Subject: [PATCH 07/22] dbus: Remove "const" usage that causes compile failure
+ building nativesdk-qt4-tools
 
 Patch has apparently been rejected upstream, not because it is invalid
 but because the submitter did not submit a merge request for it, so the
 validity of the patch upstream is uncertain. For further details see:
 http://bugreports.qt.nokia.com/browse/QTBUG-17962
 
-Original Author: Pavel Heimlich <tropikhajma at gmail.com>
+Upstream-Status: Denied [possible retry]
 
---- qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp.orig	2011-03-12 02:11:32.313467991 +0100
-+++ qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp	2011-03-12 02:11:03.795809176 +0100
-@@ -71,7 +71,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/dbus/qdbusintegrator.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dbus/qdbusintegrator.cpp b/src/dbus/qdbusintegrator.cpp
+index 5d97a8e..5014b8b 100644
+--- a/src/dbus/qdbusintegrator.cpp
++++ b/src/dbus/qdbusintegrator.cpp
+@@ -72,7 +72,7 @@ QT_BEGIN_NAMESPACE
  static bool isDebugging;
  #define qDBusDebug              if (!::isDebugging); else qDebug
  
@@ -20,3 +29,6 @@ Original Author: Pavel Heimlich <tropikhajma at gmail.com>
  
  static inline QString dbusServiceString()
  { return *orgFreedesktopDBusString(); }
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/target_qmake.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
similarity index 57%
rename from meta/recipes-qt/qt4/qt4-4.8.1/target_qmake.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
index 9b53aff..57071c7 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/target_qmake.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
@@ -1,17 +1,19 @@
-From e4b27237386b3dd864dd603de2ae54a707f5419f Mon Sep 17 00:00:00 2001
+From 049f44c260fb8956f0acf18355e3403638d2a084 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Mon, 27 Feb 2012 00:13:05 +0000
-Subject: [PATCH] Allow building a separate qmake for the target
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:32:41 +0200
+Subject: [PATCH 08/22] qmake.pro: Allow building a separate qmake for the
+ target
 
 Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- qmake/qmake.pro |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ qmake/qmake.pro | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index b602afa..b59f7fb 100644
+index 38e0fce..53b1ffb 100644
 --- a/qmake/qmake.pro
 +++ b/qmake/qmake.pro
 @@ -7,6 +7,7 @@ CONFIG += console bootstrap
@@ -23,5 +25,5 @@ index b602afa..b59f7fb 100644
  OBJECTS_DIR = .
  MOC_DIR = .
 -- 
-1.7.5.4
+1.7.12
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qmake_pri_fixes.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.1/qmake_pri_fixes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
index 82bff04..43072e0 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/qmake_pri_fixes.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
@@ -1,7 +1,7 @@
-From c56ed5f64a5f47cf8d539aa4ca9bedbe1fea2264 Mon Sep 17 00:00:00 2001
+From e863f35a80b130d8b520cdb7c81112a601157c44 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Fri, 10 Feb 2012 15:32:12 +0000
-Subject: [PATCH] qmake: fix source file references in qmake.pri
+Date: Wed, 26 Sep 2012 20:33:49 +0200
+Subject: [PATCH 09/22] qmake: fix source file references in qmake.pri
 
 Fix duplicate entries in SOURCES and HEADERS, and fix the source file
 list for the split of qlocale.cpp.
@@ -9,9 +9,10 @@ list for the split of qlocale.cpp.
 Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- qmake/qmake.pri |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ qmake/qmake.pri | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/qmake/qmake.pri b/qmake/qmake.pri
 index f2a3705..2d4e94c 100644
@@ -47,5 +48,5 @@ index f2a3705..2d4e94c 100644
          qmap.cpp \
          qmetatype.cpp \
 -- 
-1.7.5.4
+1.7.12
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/hack-out-pg2-4.7.0.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
similarity index 68%
rename from meta/recipes-qt/qt4/qt4-4.8.1/hack-out-pg2-4.7.0.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
index 39c5f4a..38e3cdf 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/hack-out-pg2-4.7.0.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
@@ -1,4 +1,8 @@
-Hack to not use the pg_config of the host system which will add /usr/include
+From 64c70ae60b96c940805ab50be3ce724df094eddc Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 20:36:38 +0200
+Subject: [PATCH 10/22] configure: Hack to not use the pg_config of the host
+ system which will add /usr/include
 
 pg_config is a native binary so using that when cross compiling
 will always fail.  The commented out fix would do, but for OE
@@ -7,14 +11,18 @@ really cross compiling. Just comment out the test, we are passing
 the location to the postgres headers and if they are okay we
 will pad.
 
-Original Author: Holger Hans Peter Freyther <zecke@selfish.org>
 Upstream-Status: Inappropriate [configuration]
 
-Index: qt-everywhere-opensource-src-4.7.0/configure
-===================================================================
---- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:51.191162141 -0400
-+++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179981232 -0400
-@@ -4921,10 +4921,10 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 0231b7d..9650199f6 100755
+--- a/configure
++++ b/configure
+@@ -5362,10 +5362,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
          psql)
              if [ "$CFG_SQL_psql" != "no" ]; then
                  # Be careful not to use native pg_config when cross building.
@@ -29,3 +37,6 @@ Index: qt-everywhere-opensource-src-4.7.0/configure
                  [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
                  [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
                  # But, respect PSQL_LIBS if set
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0006-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
similarity index 50%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0006-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
index effc5f1..7f6ff32 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0006-freetype-host-includes.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
@@ -1,21 +1,22 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
+From 9b05106d0bdfa84e8406633d71206ef1defaade8 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
+Subject: [PATCH 11/22] freetype host includes
 
 Host include path should not be used in cross compiling case.
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Pending
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- config.tests/unix/freetype/freetype.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ config.tests/unix/freetype/freetype.pri | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
+diff --git a/config.tests/unix/freetype/freetype.pri b/config.tests/unix/freetype/freetype.pri
+index 7ef1cf9..b362fcd 100644
+--- a/config.tests/unix/freetype/freetype.pri
++++ b/config.tests/unix/freetype/freetype.pri
 @@ -1,5 +1,5 @@
  !cross_compile {
 -    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
@@ -23,3 +24,6 @@ Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetyp
      # LSB doesn't allow using headers from /include or /usr/include
      linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
      for(p, TRY_INCLUDEPATHS) {
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0009-support-2bpp.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
similarity index 83%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0009-support-2bpp.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
index 6f0890b..580ba4c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0009-support-2bpp.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
@@ -1,16 +1,25 @@
-Add 2bpp support
+From 69ff4de0f06ba112a5ca531957937dd860d0f3f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
+Date: Wed, 26 Sep 2012 20:39:21 +0200
+Subject: [PATCH 12/22] Add 2bpp support
 
 Submitted upstream but rejected as being "out of scope":
 http://bugreports.qt.nokia.com/browse/QTBUG-3468
 
 Upstream-Status: Denied
-Original author: Jeremy Lainé <jeremy.laine@m4x.org>
-Ported from OE by: Yu Ke <ke.yu@intel.com>
 
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/configure qt-embedded-linux-opensource-src-4.4.3/configure
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2008-09-27 11:01:23.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-01-14 14:30:53.000000000 +0100
-@@ -5045,6 +5045,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure                               |   5 +-
+ src/gui/embedded/qscreen_qws.cpp        | 211 ++++++++++++++++++++++++++++++++
+ src/gui/embedded/qscreenlinuxfb_qws.cpp |   4 +-
+ 3 files changed, 216 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 9650199f6..7028ecf 100755
+--- a/configure
++++ b/configure
+@@ -6917,6 +6917,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
      echo "Choose pixel-depths to support:"
      echo
      echo "   1. 1bpp, black/white"
@@ -18,7 +27,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/configure qt-embedded-linu
      echo "   4. 4bpp, grayscale"
      echo "   8. 8bpp, paletted"
      echo "  12. 12bpp, rgb 4-4-4"
-@@ -5063,11 +5064,11 @@
+@@ -6935,11 +6936,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
  fi
  if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
      if [ "$CFG_QWS_DEPTHS" = "all" ]; then
@@ -32,24 +41,11 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/configure qt-embedded-linu
  	    generic) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_GENERIC";;
  	esac
      done
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreenlinuxfb_qws.cpp qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreenlinuxfb_qws.cpp
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreenlinuxfb_qws.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreenlinuxfb_qws.cpp	2009-01-14 17:22:34.000000000 +0100
-@@ -404,8 +404,8 @@
-         setupOffScreen();
- 
-     // Now read in palette
--    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4)) {
--        screencols= (vinfo.bits_per_pixel==8) ? 256 : 16;
-+    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4) || (vinfo.bits_per_pixel==2)) {
-+        screencols= 1 << vinfo.bits_per_pixel;
-         int loopc;
-         fb_cmap startcmap;
-         startcmap.start=0;
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_qws.cpp qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreen_qws.cpp
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_qws.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreen_qws.cpp	2009-01-14 17:22:44.000000000 +0100
-@@ -444,6 +444,58 @@
+diff --git a/src/gui/embedded/qscreen_qws.cpp b/src/gui/embedded/qscreen_qws.cpp
+index d6c614d..504f3d3 100644
+--- a/src/gui/embedded/qscreen_qws.cpp
++++ b/src/gui/embedded/qscreen_qws.cpp
+@@ -469,6 +469,58 @@ static void solidFill_gray4(QScreen *screen, const QColor &color,
  }
  #endif // QT_QWS_DEPTH_4
  
@@ -108,7 +104,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
  #ifdef QT_QWS_DEPTH_1
  static inline void qt_rectfill_mono(quint8 *dest, quint8 value,
                                      int x, int y, int width, int height,
-@@ -551,6 +603,11 @@
+@@ -576,6 +628,11 @@ void qt_solidFill_setup(QScreen *screen, const QColor &color,
          screen->d_ptr->solidFill = solidFill_gray4;
          break;
  #endif
@@ -120,7 +116,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
  #ifdef QT_QWS_DEPTH_1
      case 1:
          screen->d_ptr->solidFill = solidFill_mono;
-@@ -958,6 +1015,149 @@
+@@ -1006,6 +1063,149 @@ static void blit_4(QScreen *screen, const QImage &image,
  }
  #endif // QT_QWS_DEPTH_4
  
@@ -270,7 +266,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
  #ifdef QT_QWS_DEPTH_1
  
  struct qmono { quint8 dummy; } Q_PACKED;
-@@ -1206,6 +1406,11 @@
+@@ -1259,6 +1459,11 @@ void qt_blit_setup(QScreen *screen, const QImage &image,
          screen->d_ptr->blit = blit_4;
          break;
  #endif
@@ -282,7 +278,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
  #ifdef QT_QWS_DEPTH_1
      case 1:
          screen->d_ptr->blit = blit_1;
-@@ -2056,6 +2261,8 @@
+@@ -2146,6 +2351,8 @@ int QScreen::alloc(unsigned int r,unsigned int g,unsigned int b)
          }
      } else if (d == 4) {
          ret = qGray(r, g, b) >> 4;
@@ -291,7 +287,7 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
      } else if (d == 1) {
          ret = qGray(r, g, b) >= 128;
      } else {
-@@ -2126,6 +2333,10 @@
+@@ -2216,6 +2423,10 @@ bool QScreen::supportsDepth(int d) const
      } else if(d==1) {
          return true;
  #endif
@@ -302,3 +298,21 @@ diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_q
  #ifdef QT_QWS_DEPTH_4
      } else if(d==4) {
          return true;
+diff --git a/src/gui/embedded/qscreenlinuxfb_qws.cpp b/src/gui/embedded/qscreenlinuxfb_qws.cpp
+index 3fe9713..933f489 100644
+--- a/src/gui/embedded/qscreenlinuxfb_qws.cpp
++++ b/src/gui/embedded/qscreenlinuxfb_qws.cpp
+@@ -466,8 +466,8 @@ bool QLinuxFbScreen::connect(const QString &displaySpec)
+         setupOffScreen();
+ 
+     // Now read in palette
+-    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4)) {
+-        screencols= (vinfo.bits_per_pixel==8) ? 256 : 16;
++    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4) || (vinfo.bits_per_pixel==2)) {
++        screencols= 1 << vinfo.bits_per_pixel;
+         int loopc;
+         ::fb_cmap startcmap;
+         startcmap.start=0;
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0001-Added-Openembedded-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
similarity index 61%
rename from meta/recipes-qt/qt4/qt4-4.8.1/0001-Added-Openembedded-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
index f302c5b..c1ec3b5 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0001-Added-Openembedded-crossarch-option.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
@@ -1,20 +1,20 @@
-From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
-From: Matthias Günther <matgnt@gmail.com>
-Date: Wed, 12 May 2010 16:52:45 +0200
-Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
+From 8ddc1820a8678fda3a9bf3da4fc256c22fbd9b51 Mon Sep 17 00:00:00 2001
+From: Michael Lauer <mickey@vanille-media.de>
+Date: Wed, 26 Sep 2012 20:41:32 +0200
+Subject: [PATCH 13/22] configure: add "-crossarch" option
 
-Original Author: Michael Lauer <mickey@vanille-media.de>
 Upstream-Status: Pending
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure |    7 ++++++-
- 1 files changed, 6 insertions(+), 1 deletions(-)
+ configure | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index facd192..9d15136 100755
+index 7028ecf..8eb138f 100755
 --- a/configure
 +++ b/configure
-@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1059,7 +1059,7 @@ while [ "$#" -gt 0 ]; do
          shift
          VAL=$1
          ;;
@@ -23,9 +23,9 @@ index facd192..9d15136 100755
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          shift
          VAL="$1"
-@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
-     xplatform)
-         XPLATFORM="$VAL"
+@@ -1601,6 +1601,9 @@ while [ "$#" -gt 0 ]; do
+         case "$XPLATFORM" in *symbian*) XPLATFORM_SYMBIAN=yes;; esac
+         case "$XPLATFORM" in symbian-sbsv2) XPLATFORM_SYMBIAN_SBSV2=yes;; esac
          ;;
 +	crossarch)
 +		CROSSARCH="$VAL"
@@ -33,9 +33,9 @@ index facd192..9d15136 100755
      debug-and-release)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_DEBUG_RELEASE="$VAL"
-@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" = "yes" ] || [ -z "$CFG_ARCH" ]; then
-     CFG_ARCH=$CFG_HOST_ARCH
- fi
+@@ -3200,6 +3203,8 @@ arm*)
+     ;;
+ esac
  
 +CFG_ARCH="$CROSSARCH"
 +
@@ -43,5 +43,5 @@ index facd192..9d15136 100755
      if [ "$OPT_VERBOSE" = "yes" ]; then
          echo "    '$CFG_ARCH' is supported"
 -- 
-1.7.0.4
+1.7.12
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/fix-translations.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
similarity index 63%
rename from meta/recipes-qt/qt4/qt4-4.8.1/fix-translations.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
index 906d4e3..b788a68 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/fix-translations.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
@@ -1,4 +1,7 @@
-fix phony translation linking error
+From 306e0987cfdc67db11abc7071c48b0d196e84c8e Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 26 Sep 2012 20:45:10 +0200
+Subject: [PATCH 14/22] translations: fix phony translation linking error
 
   | .../usr/lib/crt1.o: In function `_start':
   | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
@@ -6,13 +9,16 @@ fix phony translation linking error
 
 Upstream-Status: Pending
 
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ translations/translations.pro | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/translations/translations.pro b/translations/translations.pro
-index cdaf04a..24fa668 100644
+index dc99beb..0d98829 100644
 --- a/translations/translations.pro
 +++ b/translations/translations.pro
-@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+@@ -101,7 +101,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
  updateqm.CONFIG += no_link
  QMAKE_EXTRA_COMPILERS += updateqm
  
@@ -21,7 +27,7 @@ index cdaf04a..24fa668 100644
      QMAKE_LINK = @: IGNORE THIS LINE
      OBJECTS_DIR =
      win32:CONFIG -= embed_manifest_exe
-@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+@@ -111,7 +111,7 @@ isEmpty(vcproj) {
      phony_src.input = PHONY_DEPS
      phony_src.output = phony.c
      phony_src.variable_out = GENERATED_SOURCES
@@ -30,3 +36,6 @@ index cdaf04a..24fa668 100644
      phony_src.name = CREATE phony.c
      phony_src.CONFIG += combine
      QMAKE_EXTRA_COMPILERS += phony_src
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/add_nostrip_for_debug_packages.diff b/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
similarity index 57%
rename from meta/recipes-qt/qt4/qt4-4.8.1/add_nostrip_for_debug_packages.diff
rename to meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
index 774cb99..027633d 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/add_nostrip_for_debug_packages.diff
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
@@ -1,4 +1,7 @@
-author: Fathi Boudra <fabo@debian.org>
+From c7ee6896f4894626986956cc8892a13fa9f7c2aa Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Wed, 26 Sep 2012 20:46:14 +0200
+Subject: [PATCH 15/22] configure: add nostrip for debug packages
 
 Qt is built in release mode and strip files by default.
 Set CONFIG+=nostrip to avoid the stripping and
@@ -6,13 +9,16 @@ let dh_strip do it to generate debug packages.
 
 Upstream-Status: Inappropriate [Configuration]
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure |    2 ++
+ configure | 2 ++
  1 file changed, 2 insertions(+)
 
+diff --git a/configure b/configure
+index 8eb138f..5cc755e 100755
 --- a/configure
 +++ b/configure
-@@ -627,6 +627,8 @@ mkdir -p "$outpath/config.tests"
+@@ -631,6 +631,8 @@ mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
  cp "$QMAKE_VARS_FILE" "$outpath/config.tests/.qmake.cache"
  
@@ -21,3 +27,6 @@ Upstream-Status: Inappropriate [Configuration]
  QMakeVar add styles "cde mac motif plastique cleanlooks windows"
  QMakeVar add decorations "default windows styled"
  QMakeVar add mouse-drivers "pc"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qmake_cxx_eval.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
similarity index 60%
rename from meta/recipes-qt/qt4/qt4-4.8.1/qmake_cxx_eval.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
index d5eac6b..8b9b3bf 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/qmake_cxx_eval.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
@@ -1,16 +1,25 @@
+From 3893ad264f85e4a0eec64017d515dddf9ee9ef88 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:47:08 +0200
+Subject: [PATCH 16/22] configure: eval QMAKE_CXX
+
 Allow expansion of $(...) references in QMAKE_CXX (currently its value
 is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
 which allows WebKit to be enabled.
 
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
 Upstream-Status: Pending
 
-Index: qt-everywhere-opensource-src-4.8.0/configure
-===================================================================
---- qt-everywhere-opensource-src-4.8.0.orig/configure
-+++ qt-everywhere-opensource-src-4.8.0/configure
-@@ -3322,7 +3322,8 @@ else
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 5cc755e..1e6c910 100755
+--- a/configure
++++ b/configure
+@@ -3329,7 +3329,8 @@ else
      CFG_FRAMEWORK=no
  fi
  
@@ -20,3 +29,6 @@ Index: qt-everywhere-opensource-src-4.8.0/configure
  TEST_COMPILER="$CXX"
  
  [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/configure_oe_compiler.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
similarity index 60%
rename from meta/recipes-qt/qt4/qt4-4.8.1/configure_oe_compiler.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
index d455d0a..32649b4 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/configure_oe_compiler.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
@@ -1,13 +1,19 @@
-Ensure we identify the compiler as g++ in configure
+From 965068125d1e83699442fca83f0c9fe05ecee564 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:48:37 +0200
+Subject: [PATCH 17/22] configure: ensure we identify the compiler as g++ in
+ configure
 
 Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
-script was interpreting from this that the compiler was "oe-g++" and thus
+script was interpreting from this that the compiler was "oe-g++" and
+thus
 g++ specific checks were not being run since this string did not match;
 among other things this resulted in a compiler version check in the
 QtWebKit build code not working, and hence the following error at build
 time:
 
-./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword in C++0x [-Werror=c++0x-compat]
+./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword
+in C++0x [-Werror=c++0x-compat]
 
 The easiest thing since our PLATFORM is entirely artificial is to just
 force COMPILER to "g++" in the configure script if it is detected as
@@ -16,10 +22,16 @@ force COMPILER to "g++" in the configure script if it is detected as
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 3 +++
+ 1 file changed, 3 insertions(+)
 
---- qt-everywhere-opensource-src-4.8.0.orig/configure
-+++ qt-everywhere-opensource-src-4.8.0/configure
-@@ -7444,6 +7444,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; th
+diff --git a/configure b/configure
+index 1e6c910..0edaad9 100755
+--- a/configure
++++ b/configure
+@@ -7444,6 +7444,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
  else
      COMPILER=`echo $PLATFORM | cut -f 2- -d-`
  fi
@@ -29,3 +41,6 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  if [ "$CFG_EXCEPTIONS" = "unspecified" -a "$PLATFORM_QWS" = "yes" ]; then
      CFG_EXCEPTIONS=no
  fi
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/pulseaudio-config.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
similarity index 85%
rename from meta/recipes-qt/qt4/qt4-4.8.1/pulseaudio-config.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
index 0992efa..4d91560 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/pulseaudio-config.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From 677f5b4bec03972c8cada19d2e4530252c9ac4ef Mon Sep 17 00:00:00 2001
+From d93ea994bf2ecee4775c68de645eac0cab248ac2 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH] configure: make pulseaudio a configurable option
+Subject: [PATCH 18/22] configure: make pulseaudio a configurable option
 
 Allows disabling pulseaudio support within phonon at configure time.
 (This is the Qt 4.8.0 version.)
@@ -9,15 +9,16 @@ Allows disabling pulseaudio support within phonon at configure time.
 Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure |    9 ++++++++-
- 1 files changed, 8 insertions(+), 1 deletions(-)
+ configure | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 5a5ef1d..e43b920 100755
+index 0edaad9..3a63734 100755
 --- a/configure
 +++ b/configure
-@@ -1043,7 +1043,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1045,7 +1045,7 @@ while [ "$#" -gt 0 ]; do
          VAL=no
          ;;
      #Qt style yes options
@@ -26,7 +27,7 @@ index 5a5ef1d..e43b920 100755
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          VAL=yes
          ;;
-@@ -2000,6 +2000,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2005,6 +2005,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -41,5 +42,5 @@ index 5a5ef1d..e43b920 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.7.5.4
+1.7.12
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
similarity index 46%
rename from meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
index 47618cf..13229d4 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
@@ -1,13 +1,21 @@
-Fix compile error when using toolchains based on GCC 4.7.
+From 4811267206e20e5409df0500c02d7fe77caf5293 Mon Sep 17 00:00:00 2001
+From: Ken Werner <ken.werner@linaro.org>
+Date: Wed, 26 Sep 2012 20:53:35 +0200
+Subject: [PATCH 19/22] javascriptcore: Fix compile error when using
+ toolchains based on GCC 4.7.
 
 Upstream-Status: Pending
 
-Signed-off-by: Ken Werner <ken.werner@linaro.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h   | 4 +---
+ .../javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h       | 3 +--
+ 2 files changed, 2 insertions(+), 5 deletions(-)
 
-Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-===================================================================
---- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-+++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
+diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
+index 7c20272..917c0ff 100644
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
 @@ -57,9 +57,7 @@ namespace JSC {
      
      class JSGlobalObject : public JSVariableObject {
@@ -19,10 +27,10 @@ Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScript
              // We use an explicit destructor function pointer instead of a
              // virtual destructor because we want to avoid adding a vtable
              // pointer to this struct. Adding a vtable pointer would force the
-Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-===================================================================
---- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-+++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
+diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
+index 2542878..637f62c 100644
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
 @@ -32,8 +32,7 @@ namespace JSC{
      
      class JSStaticScopeObject : public JSVariableObject {
@@ -33,3 +41,6 @@ Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/javascriptcore/JavaScript
              JSStaticScopeObjectData()
                  : JSVariableObjectData(&symbolTable, &registerStore + 1)
              {
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix2.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
similarity index 46%
rename from meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix2.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
index 09513b6..b763ac1 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/gcc47-fix2.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
@@ -1,4 +1,7 @@
-Fixes for gcc 4.7.0, particularly on qemux86
+From fb89f23c25363ac7b138fdba2bf5a9cdcaa7e840 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 26 Sep 2012 20:54:38 +0200
+Subject: [PATCH 20/22] Fixes for gcc 4.7.0, particularly on qemux86
 
 Origin: upstream, http://trac.webkit.org/changeset/93631
 Origin: upstream, http://trac.webkit.org/changeset/113848
@@ -10,11 +13,18 @@ RP 2012/04/30
 
 Upstream-Status: Backport
 
-Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
-===================================================================
---- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp	2012-04-30 09:15:17.000000000 +0000
-+++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp	2012-04-30 09:22:04.586008994 +0000
-@@ -1080,7 +1080,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/webkit/Source/WebCore/dom/Element.cpp                      | 2 +-
+ src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp            | 2 +-
+ .../webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h   | 1 +
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp b/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
+index 32e47ca..b8e7389 100644
+--- a/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
++++ b/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
+@@ -1080,7 +1080,7 @@ void Element::recalcStyle(StyleChange change)
  {
      // Ref currentStyle in case it would otherwise be deleted when setRenderStyle() is called.
      RefPtr<RenderStyle> currentStyle(renderStyle());
@@ -23,11 +33,11 @@ Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/dom
      bool hasDirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByDirectAdjacentRules();
      bool hasIndirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByForwardPositionalRules();
  
-Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
-===================================================================
---- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp	2012-03-14 14:01:19.000000000 +0000
-+++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp	2012-04-30 09:22:04.586008994 +0000
-@@ -74,7 +74,7 @@
+diff --git a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
+index d66075e..ab8f111 100644
+--- a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
++++ b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
+@@ -74,7 +74,7 @@ PassRefPtr<HTMLImageElement> HTMLImageElement::createForJSConstructor(Document*
      RefPtr<HTMLImageElement> image = adoptRef(new HTMLImageElement(imgTag, document));
      if (optionalWidth)
          image->setWidth(*optionalWidth);
@@ -36,11 +46,11 @@ Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/htm
          image->setHeight(*optionalHeight);
      return image.release();
  }
-Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
-===================================================================
---- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h	2012-03-14 14:01:24.000000000 +0000
-+++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h	2012-04-30 09:22:04.590008963 +0000
-@@ -25,6 +25,7 @@
+diff --git a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
+index 6087ec3..6d748f6 100644
+--- a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
++++ b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
+@@ -25,6 +25,7 @@ namespace WebCore {
  #if ENABLE(TILED_BACKING_STORE)
  class TiledBackingStoreClient {
  public:
@@ -48,3 +58,6 @@ Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCore/pla
      virtual void tiledBackingStorePaintBegin() = 0;
      virtual void tiledBackingStorePaint(GraphicsContext*, const IntRect&) = 0;
      virtual void tiledBackingStorePaintEnd(const Vector<IntRect>& paintedArea) = 0;
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/disable-fuse-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
similarity index 46%
rename from meta/recipes-qt/qt4/qt4-4.8.1/disable-fuse-gold-flag.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
index 6efbaf5..05dc806 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/disable-fuse-gold-flag.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
@@ -1,14 +1,22 @@
-Disable the -fuse-ld=gold flag. This option is a Debian/Ubuntu specific
-extension to the g++ and causes upstream GCC to throw an error.
+From 3a74f5cf7f92ff6bf6b69c7cf76f54516573abb7 Mon Sep 17 00:00:00 2001
+From: Ken Werner <ken.werner@linaro.org>
+Date: Wed, 26 Sep 2012 20:55:21 +0200
+Subject: [PATCH 21/22] webkit: disable the -fuse-ld=gold flag
+
+This option is a Debian/Ubuntu specific extension to the g++ and causes upstream GCC to throw an error.
 
 Upstream-Status: Pending
 
 Signed-off-by: Ken Werner <ken.werner@linaro.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/webkit/Source/common.pri | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
 
-Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
-===================================================================
---- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/webkit/Source/common.pri
-+++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
+diff --git a/src/3rdparty/webkit/Source/common.pri b/src/3rdparty/webkit/Source/common.pri
+index 0f62e14..d81a1f0 100644
+--- a/src/3rdparty/webkit/Source/common.pri
++++ b/src/3rdparty/webkit/Source/common.pri
 @@ -3,12 +3,12 @@
  contains(JAVASCRIPTCORE_JIT,yes): DEFINES+=ENABLE_JIT=1
  contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
@@ -28,3 +36,6 @@ Index: qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/common.pri
  
  # We use this flag on production branches
  # See https://bugs.webkit.org/show_bug.cgi?id=60824
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/fix_conflicting_types.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
similarity index 42%
rename from meta/recipes-qt/qt4/qt4-4.8.1/fix_conflicting_types.patch
rename to meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
index 8124505..bdd5d4f 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.1/fix_conflicting_types.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
@@ -1,23 +1,30 @@
-Upstream-Status: Pending
+From 5cc08e33ea7ab5d32b6a14ccb23a366d56e50ea1 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Wed, 26 Sep 2012 20:56:33 +0200
+Subject: [PATCH 22/22] webkit: fix conflicting types
 
 This patch fixes the type mismatch fixing this compile issue:
 
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7: error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
+|
+/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7:
+error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
 | In file included from ./wtf/Platform.h:1217:0,
 |                  from ./config.h:30,
 |                  from wtf/gobject/GOwnPtr.cpp:19:
-| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously declared here
-NOTE: package qt4-x11-free-4.8.1-r41.1: task do_compile: Failed
-
+| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously
+declared here
 
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/30
+Upstream-Status: Pending
 
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index:  qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-===================================================================
---- qt-everywhere-opensource-src-4.8.1/src/3rdparty.orig/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-+++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
+diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
+index c7f7ac4..f00e9cf 100644
+--- a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
++++ b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
 @@ -52,7 +52,7 @@ typedef struct _GFile GFile;
  typedef struct _GHashTable GHashTable;
  typedef struct _GInputStream GInputStream;
@@ -27,3 +34,6 @@ Index:  qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/JavaScript
  typedef struct _GPatternSpec GPatternSpec;
  typedef struct _GPollableOutputStream GPollableOutputStream;
  typedef struct _GSocketClient GSocketClient;
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 492a700..9500d4b 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -14,11 +14,11 @@ INC_PR = "r16"
 inherit native
 
 SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://qt-config.patch \
+           file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+           file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
+           file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://g++.conf \
            file://linux.conf \
-           file://fix_qkbdtty_qws.patch \
-           file://set-OUTPUT_DIR-if-empty.patch \
 	"
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
-- 
1.7.12



