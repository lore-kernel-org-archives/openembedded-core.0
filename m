Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaSV6-0003XZ-Sg
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 15:39:08 +0100
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 06:25:00 -0800
Received: by mail-we0-f197.google.com with SMTP id t44so1236690wey.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 06:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=tUkcg/AWDrbOJ0YetOh8I9nvIaz3QdnIWF55pzr30EQ=;
	b=fOzwruNMN2bVp8DHpLflPSGvkk/scXKDniLbmaJt71BRnBrBiGZ5tDbu4qpn+0LEVx
	k4uewqRop5nAMkSf5FYJMEeAPAKKR+4/mZ19GsvzRBqYafT9rgrolqsvpxtuj23DgYcH
	zmxG7qlLb8r9N5xRHK6nw6GqsK78Abb4szwuJ5lHdHw4s+IWOliCrhobK1kSf/Gl4eSo
	E1uqzfzqAGtoRYE2G5EYuPRwQ8Fng1HBN8Pt1AkrYhfhxbfk3wCqq/Xnp5ajFRoOWFX8
	Rywan3mdGsjdsSKnltr6h7TVkesaz4a1R9MgpOulq39KJf+H4lTVwU8YPUcpmLECO97q
	Q3zg==
Received: by 10.216.203.210 with SMTP id f60mr4534761weo.69.1353335098057;
	Mon, 19 Nov 2012 06:24:58 -0800 (PST)
Received: by 10.216.203.210 with SMTP id f60mr4534749weo.69.1353335097629;
	Mon, 19 Nov 2012 06:24:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eu8sm13557202wib.1.2012.11.19.06.24.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 06:24:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 14:22:34 +0000
Message-Id: <1353334954-4909-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1353334954-4909-1-git-send-email-ross.burton@intel.com>
References: <1353334954-4909-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnetFZyobsCtO1xqG/VCfSibi5J7qAmr/46xGBymRL61472Thd31/t0QZFkledE0elVJvlYQIBm2rSQK+CxcXv9xwuDIimSNLXpJSfy7guOBEl0zOoiZe0GWAThXxRh5vOw8tQLkwkAEK4XPFBOhPLbG1vC2vgIEGI0Zw8MK97OjuyB4lr6YoiQsDQVf6DdLKQE62q7
Subject: [PATCH 2/2] qt4: remove 4.8.1
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
X-List-Received-Date: Mon, 19 Nov 2012 14:39:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb   |    8 -
 meta/recipes-qt/qt4/qt4-4.8.1.inc                  |   60 ----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   43 ---
 ...tty_qws-fix-build-with-old-kernel-headers.patch |   50 ---
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   34 ---
 ...make-is-already-built-in-qt4-tools-native.patch |   29 --
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   28 --
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |   38 ---
 ...-const-usage-that-causes-compile-failure-.patch |   34 ---
 ...llow-building-a-separate-qmake-for-the-ta.patch |   29 --
 ...e-fix-source-file-references-in-qmake.pri.patch |   52 ----
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |   42 ---
 .../qt4-4.8.1/0011-freetype-host-includes.patch    |   29 --
 .../qt4/qt4-4.8.1/0012-Add-2bpp-support.patch      |  318 --------------------
 .../0013-configure-add-crossarch-option.patch      |   47 ---
 ...tions-fix-phony-translation-linking-error.patch |   41 ---
 ...-configure-add-nostrip-for-debug-packages.patch |   32 --
 .../qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch  |   34 ---
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |   46 ---
 ...ure-make-pulseaudio-a-configurable-option.patch |   46 ---
 ...ore-Fix-compile-error-when-using-toolchai.patch |   46 ---
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   63 ----
 ...0021-webkit-disable-the-fuse-ld-gold-flag.patch |   41 ---
 .../0022-webkit-fix-conflicting-types.patch        |   39 ---
 meta/recipes-qt/qt4/qt4-4.8.1/g++.conf             |   56 ----
 meta/recipes-qt/qt4/qt4-4.8.1/linux.conf           |   66 ----
 meta/recipes-qt/qt4/qt4-4.8.1/qte.sh               |    7 -
 meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb          |   11 -
 meta/recipes-qt/qt4/qt4-native_4.8.1.bb            |   12 -
 meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb          |   11 -
 30 files changed, 1392 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1.inc
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
 delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.1.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
deleted file mode 100644
index 6d9800d..0000000
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nativesdk-qt4-tools.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
-
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1.inc b/meta/recipes-qt/qt4/qt4-4.8.1.inc
deleted file mode 100644
index 4cf1222..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1.inc
+++ /dev/null
@@ -1,60 +0,0 @@
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
-
-SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
-           file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
-           file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch \
-           file://0009-qmake-fix-source-file-references-in-qmake.pri.patch \
-           file://0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch \
-           file://0011-freetype-host-includes.patch \
-           file://0012-Add-2bpp-support.patch \
-           file://0013-configure-add-crossarch-option.patch \
-           file://0014-translations-fix-phony-translation-linking-error.patch \
-           file://0015-configure-add-nostrip-for-debug-packages.patch \
-           file://0016-configure-eval-QMAKE_CXX.patch \
-           file://0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch \
-           file://0018-configure-make-pulseaudio-a-configurable-option.patch \
-           file://0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch \
-           file://0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
-           file://0021-webkit-disable-the-fuse-ld-gold-flag.patch \
-           file://0022-webkit-fix-conflicting-types.patch \
-           file://g++.conf \
-           file://linux.conf \
-           "
-
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-FILES_${QT_BASE_NAME}-tools_append     = " ${bindir}/qml ${bindir}/qmlplugindump"
-FILES_${QT_BASE_NAME}-tools-dbg_append = " ${bindir}/.debug/qml ${bindir}/.debug/qmlplugindump"
-
-PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
-FILES_${QT_BASE_NAME}-tests-dbg        = "/usr/tests/qt4/*/.debug"
-FILES_${QT_BASE_NAME}-tests            = "/usr/tests/qt4/*"
-
-do_configure_prepend() {
-    for pro in $(find ${S} -name "*.pro") ; do
-        sed -i \
-            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
-            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
-    done
-
-    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
-    sed -i \
-    -e /QMAKE_MOC\ /d \
-    -e /QMAKE_UIC\ /d \
-    -e /QMAKE_UIC3\ /d \
-    -e /QMAKE_RCC\ /d \
-    ${S}/configure
-
-    # Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD (since we want the linker to be g++)
-    unset LD
-}
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
deleted file mode 100644
index a3a8dae..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 51c37481a0c0ea946567ea2344107428e6d71590 Mon Sep 17 00:00:00 2001
-From: Holger Freyther <zecke@selfish.org>
-Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 01/22] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
-
-Allow to set a qt.conf from the outside using the environment. This allows
-to inject new prefixes and other paths into qmake. This is needed when using
-the same qmake binary to build qt/x11 and qt/embedded
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/corelib/global/qlibraryinfo.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 2862c2c..3a36b01 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -54,6 +54,7 @@
- QT_BEGIN_NAMESPACE
- extern QString qmake_libraryInfoFile();
- QT_END_NAMESPACE
-+#include <stdlib.h>
- #else
- # include "qcoreapplication.h"
- #endif
-@@ -112,6 +113,10 @@ QSettings *QLibraryInfoPrivate::findConfiguration()
- #ifdef BOOTSTRAPPING
-     if(!QFile::exists(qtconfig))
-         qtconfig = qmake_libraryInfoFile();
-+    if (!QFile::exists(qtconfig)) {
-+        QByteArray config = getenv("QT_CONF_PATH");
-+        qtconfig = QFile::decodeName(config);
-+    }
- #else
-     if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
- #ifdef Q_OS_MAC
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
deleted file mode 100644
index 021a6de..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 419b6a19d3d506880fa705682613eaaeb7dcd9cf Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Wed, 26 Sep 2012 20:18:08 +0200
-Subject: [PATCH 02/22] qkbdtty_qws: fix build with old kernel headers
-
-This issue is that with C++ compiler process an old version of kernel
-header file, coincidently that file has a variable named 'new':
-
-* 'embedded/qkbdtty_qws.cpp' include 'linux/vt.h';
-* '/usr/include/linux/vt.h' has below code on SLED-11.x:
-    + unsigned int new;
-
-On mostly hosts it has been changed to: new -> newev.
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/gui/embedded/qkbdtty_qws.cpp | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
-index f4b8461..4cee2e7 100644
---- a/src/gui/embedded/qkbdtty_qws.cpp
-+++ b/src/gui/embedded/qkbdtty_qws.cpp
-@@ -54,8 +54,20 @@
- 
- #if defined Q_OS_LINUX
- #  include <linux/kd.h>
-+
-+/* Workaround kernel headers using "new" as variable name. The problem
-+ is specific to SLED-11, other distros use "newev" rather than "new" */
-+#ifdef __cplusplus
-+#warning "workaround kernel headers using new as variable name on SLED 11"
-+#define new newev
-+#endif
-+
- #  include <linux/vt.h> //TODO: move vt handling somewhere else (QLinuxFbScreen?)
- 
-+#ifdef __cplusplus
-+#undef new
-+#endif
-+
- #  include "qscreen_qws.h"
- #  include "qwindowsystem_qws.h"
- #  include "qapplication.h"
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
deleted file mode 100644
index 859a037..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 96bee73bdf663ddeb2a5d48cab9c5e4df65ba295 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 1 May 2012 07:48:15 +0200
-Subject: [PATCH 03/22] webkit2: set OUTPUT_DIR value if empty
-
-Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
-now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
-
-First reported here:
-http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24436.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro b/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
-index 006a88c..5e17193 100644
---- a/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
-+++ b/src/3rdparty/webkit/Source/WebKit2/DerivedSources.pro
-@@ -3,6 +3,8 @@ TARGET = dummy
- 
- CONFIG -= debug_and_release
- 
-+isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../..
-+
- CONFIG(standalone_package) {
-     isEmpty(WEBKIT2_GENERATED_SOURCES_DIR):WEBKIT2_GENERATED_SOURCES_DIR = $$PWD/generated
-     isEmpty(WC_GENERATED_SOURCES_DIR):WC_GENERATED_SOURCES_DIR = $$PWD/../WebCore/generated
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
deleted file mode 100644
index e147375..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aa1788b0ec0b9b7c0e1a7c6bd9ef5c9555361014 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Wed, 26 Sep 2012 20:24:20 +0200
-Subject: [PATCH 04/22] configure: qmake is already built in qt4-tools-native,
- so disable it
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index a706908..00b072a 100755
---- a/configure
-+++ b/configure
-@@ -4816,7 +4816,7 @@ END {
- }
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake. Please wait..."
- 
-     OLD_QCONFIG_H=
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
deleted file mode 100644
index 9171fa7..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1602cdf7f3bb548e63fca40b5bff8b9a75a144c5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
-Date: Wed, 26 Sep 2012 20:27:44 +0200
-Subject: [PATCH 05/22] configure: set LFLAGS to pick up zlib from staging
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 00b072a..b1ba542 100755
---- a/configure
-+++ b/configure
-@@ -611,7 +611,7 @@ fi
- # initalize variables
- #-------------------------------------------------------------------------------
- 
--SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
-+SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
- for varname in $SYSTEM_VARIABLES; do
-     qmakevarname="${varname}"
-     # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
deleted file mode 100644
index 51a6cfc..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 074881d57e5d7ad23a7a784a75f4ffebf091e543 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:29:09 +0200
-Subject: [PATCH 06/22] configure: Use OE_QMAKE_* values to specify Qt utility
- paths
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure b/configure
-index b1ba542..0231b7d 100755
---- a/configure
-+++ b/configure
-@@ -8517,11 +8517,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
- QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
- 
- #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
--QMAKE_MOC        = \$\$QT_BUILD_TREE/bin/moc
--QMAKE_UIC        = \$\$QT_BUILD_TREE/bin/uic
--QMAKE_UIC3       = \$\$QT_BUILD_TREE/bin/uic3
--QMAKE_RCC        = \$\$QT_BUILD_TREE/bin/rcc
--QMAKE_QDBUSXML2CPP = \$\$QT_BUILD_TREE/bin/qdbusxml2cpp
-+QMAKE_MOC        = \${OE_QMAKE_MOC}
-+QMAKE_UIC        = \${OE_QMAKE_UIC}
-+QMAKE_UIC3       = \${OE_QMAKE_UIC3}
-+QMAKE_RCC        = \${OE_QMAKE_RCC}
-+QMAKE_QDBUSXML2CPP = \${OE_QMAKE_QDBUSXML2CPP}
- QMAKE_INCDIR_QT  = \$\$QT_BUILD_TREE/include
- QMAKE_LIBDIR_QT  = \$\$QT_BUILD_TREE/lib
- 
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
deleted file mode 100644
index 0105758..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ff6a714f8256c6d98234066ba1788bee234b25a1 Mon Sep 17 00:00:00 2001
-From: Pavel Heimlich <tropikhajma@gmail.com>
-Date: Wed, 26 Sep 2012 20:31:10 +0200
-Subject: [PATCH 07/22] dbus: Remove "const" usage that causes compile failure
- building nativesdk-qt4-tools
-
-Patch has apparently been rejected upstream, not because it is invalid
-but because the submitter did not submit a merge request for it, so the
-validity of the patch upstream is uncertain. For further details see:
-http://bugreports.qt.nokia.com/browse/QTBUG-17962
-
-Upstream-Status: Denied [possible retry]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/dbus/qdbusintegrator.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dbus/qdbusintegrator.cpp b/src/dbus/qdbusintegrator.cpp
-index 5d97a8e..5014b8b 100644
---- a/src/dbus/qdbusintegrator.cpp
-+++ b/src/dbus/qdbusintegrator.cpp
-@@ -72,7 +72,7 @@ QT_BEGIN_NAMESPACE
- static bool isDebugging;
- #define qDBusDebug              if (!::isDebugging); else qDebug
- 
--Q_GLOBAL_STATIC_WITH_ARGS(const QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
-+Q_GLOBAL_STATIC_WITH_ARGS(QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
- 
- static inline QString dbusServiceString()
- { return *orgFreedesktopDBusString(); }
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
deleted file mode 100644
index 57071c7..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 049f44c260fb8956f0acf18355e3403638d2a084 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:32:41 +0200
-Subject: [PATCH 08/22] qmake.pro: Allow building a separate qmake for the
- target
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qmake/qmake.pro | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 38e0fce..53b1ffb 100644
---- a/qmake/qmake.pro
-+++ b/qmake/qmake.pro
-@@ -7,6 +7,7 @@ CONFIG += console bootstrap
- CONFIG -= qt shared app_bundle uic
- DEFINES += QT_BUILD_QMAKE QT_BOOTSTRAPPED
- DESTDIR = ../bin/
-+TARGET = qmake2
- 
- OBJECTS_DIR = .
- MOC_DIR = .
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
deleted file mode 100644
index 43072e0..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0009-qmake-fix-source-file-references-in-qmake.pri.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e863f35a80b130d8b520cdb7c81112a601157c44 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:33:49 +0200
-Subject: [PATCH 09/22] qmake: fix source file references in qmake.pri
-
-Fix duplicate entries in SOURCES and HEADERS, and fix the source file
-list for the split of qlocale.cpp.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qmake/qmake.pri | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index f2a3705..2d4e94c 100644
---- a/qmake/qmake.pri
-+++ b/qmake/qmake.pri
-@@ -22,8 +22,7 @@ SOURCES += project.cpp property.cpp main.cpp generators/makefile.cpp \
-            generators/symbian/initprojectdeploy_symbian.cpp \
-            generators/integrity/gbuild.cpp \
-            windows/registry.cpp \
--           symbian/epocroot.cpp \
--           generators/integrity/gbuild.cpp
-+           symbian/epocroot.cpp
- 
- HEADERS += project.h property.h generators/makefile.h \
-            generators/unix/unixmake.h meta.h option.h cachekeys.h \
-@@ -40,8 +39,7 @@ HEADERS += project.h property.h generators/makefile.h \
-            generators/symbian/initprojectdeploy_symbian.h \
-            generators/integrity/gbuild.h \
-            windows/registry_p.h \
--           symbian/epocroot_p.h \
--           generators/integrity/gbuild.h
-+           symbian/epocroot_p.h
- 
- contains(QT_EDITION, OpenSource) {
-    DEFINES += QMAKE_OPENSOURCE_EDITION
-@@ -72,6 +70,8 @@ bootstrap { #Qt code
-         qlist.cpp \
-         qlinkedlist.cpp \
-         qlocale.cpp \
-+        qlocale_tools.cpp \
-+        qlocale_unix.cpp \
-         qmalloc.cpp \
-         qmap.cpp \
-         qmetatype.cpp \
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
deleted file mode 100644
index 38e3cdf..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 64c70ae60b96c940805ab50be3ce724df094eddc Mon Sep 17 00:00:00 2001
-From: Holger Freyther <zecke@selfish.org>
-Date: Wed, 26 Sep 2012 20:36:38 +0200
-Subject: [PATCH 10/22] configure: Hack to not use the pg_config of the host
- system which will add /usr/include
-
-pg_config is a native binary so using that when cross compiling
-will always fail.  The commented out fix would do, but for OE
-our -platform and -xplatform is the same so we are actually not
-really cross compiling. Just comment out the test, we are passing
-the location to the postgres headers and if they are okay we
-will pad.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 0231b7d..9650199f6 100755
---- a/configure
-+++ b/configure
-@@ -5362,10 +5362,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
-                 # Be careful not to use native pg_config when cross building.
--                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
--                fi
-+#                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
-+#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
-+#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
-+#                fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
-                 # But, respect PSQL_LIBS if set
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
deleted file mode 100644
index 7f6ff32..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0011-freetype-host-includes.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9b05106d0bdfa84e8406633d71206ef1defaade8 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH 11/22] freetype host includes
-
-Host include path should not be used in cross compiling case.
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- config.tests/unix/freetype/freetype.pri | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.tests/unix/freetype/freetype.pri b/config.tests/unix/freetype/freetype.pri
-index 7ef1cf9..b362fcd 100644
---- a/config.tests/unix/freetype/freetype.pri
-+++ b/config.tests/unix/freetype/freetype.pri
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
deleted file mode 100644
index 580ba4c..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0012-Add-2bpp-support.patch
+++ /dev/null
@@ -1,318 +0,0 @@
-From 69ff4de0f06ba112a5ca531957937dd860d0f3f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
-Date: Wed, 26 Sep 2012 20:39:21 +0200
-Subject: [PATCH 12/22] Add 2bpp support
-
-Submitted upstream but rejected as being "out of scope":
-http://bugreports.qt.nokia.com/browse/QTBUG-3468
-
-Upstream-Status: Denied
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure                               |   5 +-
- src/gui/embedded/qscreen_qws.cpp        | 211 ++++++++++++++++++++++++++++++++
- src/gui/embedded/qscreenlinuxfb_qws.cpp |   4 +-
- 3 files changed, 216 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 9650199f6..7028ecf 100755
---- a/configure
-+++ b/configure
-@@ -6917,6 +6917,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
-     echo "Choose pixel-depths to support:"
-     echo
-     echo "   1. 1bpp, black/white"
-+    echo "   2. 2bpp, grayscale"
-     echo "   4. 4bpp, grayscale"
-     echo "   8. 8bpp, paletted"
-     echo "  12. 12bpp, rgb 4-4-4"
-@@ -6935,11 +6936,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
- fi
- if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
-     if [ "$CFG_QWS_DEPTHS" = "all" ]; then
--        CFG_QWS_DEPTHS="1 4 8 12 15 16 18 24 32 generic"
-+        CFG_QWS_DEPTHS="1 2 4 8 12 15 16 18 24 32 generic"
-     fi
-     for D in `echo "$CFG_QWS_DEPTHS" | sed -e 's/,/ /g'`; do
- 	case $D in
--	    1|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
-+	    1|2|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
- 	    generic) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_GENERIC";;
- 	esac
-     done
-diff --git a/src/gui/embedded/qscreen_qws.cpp b/src/gui/embedded/qscreen_qws.cpp
-index d6c614d..504f3d3 100644
---- a/src/gui/embedded/qscreen_qws.cpp
-+++ b/src/gui/embedded/qscreen_qws.cpp
-@@ -469,6 +469,58 @@ static void solidFill_gray4(QScreen *screen, const QColor &color,
- }
- #endif // QT_QWS_DEPTH_4
- 
-+#ifdef QT_QWS_DEPTH_2
-+static inline void qt_rectfill_gray2(quint8 *dest, quint8 value,
-+                                     int x, int y, int width, int height,
-+                                     int stride)
-+{
-+    const int pixelsPerByte = 4;
-+    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
-+    const int doAlign = (alignWidth > 0 ? 1 : 0);
-+    const int alignStart = pixelsPerByte - 1 - (x & 3);
-+    const int alignStop = alignStart - (alignWidth - 1);
-+    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
-+    const int tailWidth = (width - alignWidth) & 3;
-+    const int doTail = (tailWidth > 0 ? 1 : 0);
-+    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
-+    const int width8 = (width - alignWidth) / pixelsPerByte;
-+
-+    dest += y * stride + x / pixelsPerByte;
-+    stride -= (doAlign + width8);
-+
-+    for (int j = 0; j < height; ++j) {
-+        if (doAlign) {
-+            *dest = (*dest & ~alignMask) | (value & alignMask);
-+            ++dest;
-+        }
-+        if (width8) {
-+            qt_memfill<quint8>(dest, value, width8);
-+            dest += width8;
-+        }
-+        if (doTail)
-+            *dest = (*dest & tailMask) | (value & ~tailMask);
-+        dest += stride;
-+    }
-+}
-+
-+static void solidFill_gray2(QScreen *screen, const QColor &color,
-+                            const QRegion &region)
-+{
-+    quint8 *dest = reinterpret_cast<quint8*>(screen->base());
-+    const quint8 c = qGray(color.rgba()) >> 6;
-+    const quint8 c8 = (c << 6) | (c << 4) | (c << 2) | c;
-+
-+    const int stride = screen->linestep();
-+    const QVector<QRect> rects = region.rects();
-+
-+    for (int i = 0; i < rects.size(); ++i) {
-+        const QRect r = rects.at(i);
-+        qt_rectfill_gray2(dest, c8, r.x(), r.y(), r.width(), r.height(),
-+                          stride);
-+    }
-+}
-+#endif // QT_QWS_DEPTH_2
-+
- #ifdef QT_QWS_DEPTH_1
- static inline void qt_rectfill_mono(quint8 *dest, quint8 value,
-                                     int x, int y, int width, int height,
-@@ -576,6 +628,11 @@ void qt_solidFill_setup(QScreen *screen, const QColor &color,
-         screen->d_ptr->solidFill = solidFill_gray4;
-         break;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    case 2:
-+        screen->d_ptr->solidFill = solidFill_gray2;
-+        break;
-+#endif
- #ifdef QT_QWS_DEPTH_1
-     case 1:
-         screen->d_ptr->solidFill = solidFill_mono;
-@@ -1006,6 +1063,149 @@ static void blit_4(QScreen *screen, const QImage &image,
- }
- #endif // QT_QWS_DEPTH_4
- 
-+#ifdef QT_QWS_DEPTH_2
-+
-+struct qgray2 { quint8 dummy; } Q_PACKED;
-+
-+template <typename SRC>
-+static inline quint8 qt_convertToGray2(SRC color);
-+
-+template <>
-+inline quint8 qt_convertToGray2(quint32 color)
-+{
-+    return qGray(color) >> 6;
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(quint16 color)
-+{
-+    const int r = (color & 0xf800) >> 11;
-+    const int g = (color & 0x07e0) >> 6; // only keep 5 bit
-+    const int b = (color & 0x001f);
-+    return (r * 11 + g * 16 + b * 5) >> 8;
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(qrgb444 color)
-+{
-+    return qt_convertToGray2(quint32(color));
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(qargb4444 color)
-+{
-+    return qt_convertToGray2(quint32(color));
-+}
-+
-+template <typename SRC>
-+static inline void qt_rectconvert_gray2(qgray2 *dest2, const SRC *src,
-+                                        int x, int y, int width, int height,
-+                                        int dstStride, int srcStride)
-+{
-+    const int pixelsPerByte = 4;
-+    quint8 *dest8 = reinterpret_cast<quint8*>(dest2)
-+                    + y * dstStride + x / pixelsPerByte;
-+    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
-+    const int doAlign = (alignWidth > 0 ? 1 : 0);
-+    const int alignStart = pixelsPerByte - 1 - (x & 3);
-+    const int alignStop = alignStart - (alignWidth - 1);
-+    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
-+    const int tailWidth = (width - alignWidth) & 3;
-+    const int doTail = (tailWidth > 0 ? 1 : 0);
-+    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
-+    const int width8 = (width - alignWidth) / pixelsPerByte;
-+
-+    srcStride = srcStride / sizeof(SRC) - (width8 * pixelsPerByte + alignWidth);
-+    dstStride -= (width8 + doAlign);
-+
-+    for (int j = 0;  j < height; ++j) {
-+        if (doAlign) {
-+            quint8 d = *dest8 & ~alignMask;
-+            for (int i = alignStart; i >= alignStop; --i)
-+                d |= qt_convertToGray2<SRC>(*src++) << (2 * i);
-+            *dest8++ = d;
-+        }
-+        for (int i = 0; i < width8; ++i) {
-+            *dest8 = (qt_convertToGray2<SRC>(src[0]) << 6)
-+                     | (qt_convertToGray2<SRC>(src[1]) << 4)
-+                     | (qt_convertToGray2<SRC>(src[2]) << 2)
-+                     | (qt_convertToGray2<SRC>(src[3]));
-+            src += 4;
-+            ++dest8;
-+        }
-+        if (doTail) {
-+            quint8 d = *dest8 & tailMask;
-+            switch (tailWidth) {
-+            case 3: d |= qt_convertToGray2<SRC>(src[2]) << 2;
-+            case 2: d |= qt_convertToGray2<SRC>(src[1]) << 4;
-+            case 1: d |= qt_convertToGray2<SRC>(src[0]) << 6;
-+            }
-+            *dest8 = d;
-+        }
-+
-+        dest8 += dstStride;
-+        src += srcStride;
-+    }
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const quint32 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<quint32>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const quint16 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<quint16>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const qrgb444 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<qrgb444>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const qargb4444 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<qargb4444>(dest, src, x, y, width, height,
-+                                    dstStride, srcStride);
-+}
-+
-+static void blit_2(QScreen *screen, const QImage &image,
-+                   const QPoint &topLeft, const QRegion &region)
-+{
-+    switch (image.format()) {
-+    case QImage::Format_ARGB32_Premultiplied:
-+        blit_template<qgray2, quint32>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_RGB16:
-+        blit_template<qgray2, quint16>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_RGB444:
-+        blit_template<qgray2, qrgb444>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_ARGB4444_Premultiplied:
-+        blit_template<qgray2, qargb4444>(screen, image, topLeft, region);
-+        return;
-+    default:
-+        qCritical("blit_2(): Image format %d not supported!", image.format());
-+    }
-+}
-+#endif // QT_QWS_DEPTH_2
-+
- #ifdef QT_QWS_DEPTH_1
- 
- struct qmono { quint8 dummy; } Q_PACKED;
-@@ -1259,6 +1459,11 @@ void qt_blit_setup(QScreen *screen, const QImage &image,
-         screen->d_ptr->blit = blit_4;
-         break;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    case 2:
-+        screen->d_ptr->blit = blit_2;
-+        break;
-+#endif
- #ifdef QT_QWS_DEPTH_1
-     case 1:
-         screen->d_ptr->blit = blit_1;
-@@ -2146,6 +2351,8 @@ int QScreen::alloc(unsigned int r,unsigned int g,unsigned int b)
-         }
-     } else if (d == 4) {
-         ret = qGray(r, g, b) >> 4;
-+    } else if (d == 2) {
-+        ret = qGray(r, g, b) >> 6;
-     } else if (d == 1) {
-         ret = qGray(r, g, b) >= 128;
-     } else {
-@@ -2216,6 +2423,10 @@ bool QScreen::supportsDepth(int d) const
-     } else if(d==1) {
-         return true;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    } else if(d==2) {
-+        return true;
-+#endif
- #ifdef QT_QWS_DEPTH_4
-     } else if(d==4) {
-         return true;
-diff --git a/src/gui/embedded/qscreenlinuxfb_qws.cpp b/src/gui/embedded/qscreenlinuxfb_qws.cpp
-index 3fe9713..933f489 100644
---- a/src/gui/embedded/qscreenlinuxfb_qws.cpp
-+++ b/src/gui/embedded/qscreenlinuxfb_qws.cpp
-@@ -466,8 +466,8 @@ bool QLinuxFbScreen::connect(const QString &displaySpec)
-         setupOffScreen();
- 
-     // Now read in palette
--    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4)) {
--        screencols= (vinfo.bits_per_pixel==8) ? 256 : 16;
-+    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4) || (vinfo.bits_per_pixel==2)) {
-+        screencols= 1 << vinfo.bits_per_pixel;
-         int loopc;
-         ::fb_cmap startcmap;
-         startcmap.start=0;
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
deleted file mode 100644
index c1ec3b5..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0013-configure-add-crossarch-option.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8ddc1820a8678fda3a9bf3da4fc256c22fbd9b51 Mon Sep 17 00:00:00 2001
-From: Michael Lauer <mickey@vanille-media.de>
-Date: Wed, 26 Sep 2012 20:41:32 +0200
-Subject: [PATCH 13/22] configure: add "-crossarch" option
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 7028ecf..8eb138f 100755
---- a/configure
-+++ b/configure
-@@ -1059,7 +1059,7 @@ while [ "$#" -gt 0 ]; do
-         shift
-         VAL=$1
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1601,6 +1601,9 @@ while [ "$#" -gt 0 ]; do
-         case "$XPLATFORM" in *symbian*) XPLATFORM_SYMBIAN=yes;; esac
-         case "$XPLATFORM" in symbian-sbsv2) XPLATFORM_SYMBIAN_SBSV2=yes;; esac
-         ;;
-+	crossarch)
-+		CROSSARCH="$VAL"
-+		;;
-     debug-and-release)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_DEBUG_RELEASE="$VAL"
-@@ -3200,6 +3203,8 @@ arm*)
-     ;;
- esac
- 
-+CFG_ARCH="$CROSSARCH"
-+
- if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
-     if [ "$OPT_VERBOSE" = "yes" ]; then
-         echo "    '$CFG_ARCH' is supported"
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
deleted file mode 100644
index b788a68..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0014-translations-fix-phony-translation-linking-error.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 306e0987cfdc67db11abc7071c48b0d196e84c8e Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 26 Sep 2012 20:45:10 +0200
-Subject: [PATCH 14/22] translations: fix phony translation linking error
-
-  | .../usr/lib/crt1.o: In function `_start':
-  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
-  | collect2: ld returned 1 exit status
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- translations/translations.pro | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/translations/translations.pro b/translations/translations.pro
-index dc99beb..0d98829 100644
---- a/translations/translations.pro
-+++ b/translations/translations.pro
-@@ -101,7 +101,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
- updateqm.CONFIG += no_link
- QMAKE_EXTRA_COMPILERS += updateqm
- 
--isEmpty(vcproj) {
-+!isEmpty(vcproj) {
-     QMAKE_LINK = @: IGNORE THIS LINE
-     OBJECTS_DIR =
-     win32:CONFIG -= embed_manifest_exe
-@@ -111,7 +111,7 @@ isEmpty(vcproj) {
-     phony_src.input = PHONY_DEPS
-     phony_src.output = phony.c
-     phony_src.variable_out = GENERATED_SOURCES
--    phony_src.commands = echo int main() { return 0; } > phony.c
-+    phony_src.commands = echo \"int main() { return 0; }\" > phony.c
-     phony_src.name = CREATE phony.c
-     phony_src.CONFIG += combine
-     QMAKE_EXTRA_COMPILERS += phony_src
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
deleted file mode 100644
index 027633d..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0015-configure-add-nostrip-for-debug-packages.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c7ee6896f4894626986956cc8892a13fa9f7c2aa Mon Sep 17 00:00:00 2001
-From: Fathi Boudra <fabo@debian.org>
-Date: Wed, 26 Sep 2012 20:46:14 +0200
-Subject: [PATCH 15/22] configure: add nostrip for debug packages
-
-Qt is built in release mode and strip files by default.
-Set CONFIG+=nostrip to avoid the stripping and
-let dh_strip do it to generate debug packages.
-
-Upstream-Status: Inappropriate [Configuration]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index 8eb138f..5cc755e 100755
---- a/configure
-+++ b/configure
-@@ -631,6 +631,8 @@ mkdir -p "$outpath/config.tests"
- rm -f "$outpath/config.tests/.qmake.cache"
- cp "$QMAKE_VARS_FILE" "$outpath/config.tests/.qmake.cache"
- 
-+QMakeVar add CONFIG nostrip
-+
- QMakeVar add styles "cde mac motif plastique cleanlooks windows"
- QMakeVar add decorations "default windows styled"
- QMakeVar add mouse-drivers "pc"
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
deleted file mode 100644
index 8b9b3bf..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0016-configure-eval-QMAKE_CXX.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3893ad264f85e4a0eec64017d515dddf9ee9ef88 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:47:08 +0200
-Subject: [PATCH 16/22] configure: eval QMAKE_CXX
-
-Allow expansion of $(...) references in QMAKE_CXX (currently its value
-is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
-which allows WebKit to be enabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 5cc755e..1e6c910 100755
---- a/configure
-+++ b/configure
-@@ -3329,7 +3329,8 @@ else
-     CFG_FRAMEWORK=no
- fi
- 
--QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
-+QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg' | tail -1`
-+QMAKE_CONF_COMPILER=`eval "echo $QMAKE_CONF_COMPILER"`
- TEST_COMPILER="$CXX"
- 
- [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
deleted file mode 100644
index 32649b4..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 965068125d1e83699442fca83f0c9fe05ecee564 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Wed, 26 Sep 2012 20:48:37 +0200
-Subject: [PATCH 17/22] configure: ensure we identify the compiler as g++ in
- configure
-
-Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
-script was interpreting from this that the compiler was "oe-g++" and
-thus
-g++ specific checks were not being run since this string did not match;
-among other things this resulted in a compiler version check in the
-QtWebKit build code not working, and hence the following error at build
-time:
-
-./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword
-in C++0x [-Werror=c++0x-compat]
-
-The easiest thing since our PLATFORM is entirely artificial is to just
-force COMPILER to "g++" in the configure script if it is detected as
-"oe-g++".
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index 1e6c910..0edaad9 100755
---- a/configure
-+++ b/configure
-@@ -7444,6 +7444,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
- else
-     COMPILER=`echo $PLATFORM | cut -f 2- -d-`
- fi
-+case $COMPILER in
-+    *oe-g++) COMPILER="g++" ;;
-+esac
- if [ "$CFG_EXCEPTIONS" = "unspecified" -a "$PLATFORM_QWS" = "yes" ]; then
-     CFG_EXCEPTIONS=no
- fi
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
deleted file mode 100644
index 4d91560..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0018-configure-make-pulseaudio-a-configurable-option.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d93ea994bf2ecee4775c68de645eac0cab248ac2 Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 18/22] configure: make pulseaudio a configurable option
-
-Allows disabling pulseaudio support within phonon at configure time.
-(This is the Qt 4.8.0 version.)
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 0edaad9..3a63734 100755
---- a/configure
-+++ b/configure
-@@ -1045,7 +1045,7 @@ while [ "$#" -gt 0 ]; do
-         VAL=no
-         ;;
-     #Qt style yes options
--    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
-+    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-pulseaudio|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         VAL=yes
-         ;;
-@@ -2005,6 +2005,13 @@ while [ "$#" -gt 0 ]; do
-             UNKNOWN_OPT=yes
-         fi
-         ;;
-+    pulseaudio)
-+        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-+            CFG_PULSEAUDIO="$VAL"
-+        else
-+            UNKNOWN_OPT=yes
-+        fi
-+        ;;
-     gtkstyle)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_QGTKSTYLE="$VAL"
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
deleted file mode 100644
index 13229d4..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4811267206e20e5409df0500c02d7fe77caf5293 Mon Sep 17 00:00:00 2001
-From: Ken Werner <ken.werner@linaro.org>
-Date: Wed, 26 Sep 2012 20:53:35 +0200
-Subject: [PATCH 19/22] javascriptcore: Fix compile error when using
- toolchains based on GCC 4.7.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h   | 4 +---
- .../javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h       | 3 +--
- 2 files changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-index 7c20272..917c0ff 100644
---- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-+++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
-@@ -57,9 +57,7 @@ namespace JSC {
-     
-     class JSGlobalObject : public JSVariableObject {
-     protected:
--        using JSVariableObject::JSVariableObjectData;
--
--        struct JSGlobalObjectData : public JSVariableObjectData {
-+        struct JSGlobalObjectData : public JSVariableObject::JSVariableObjectData {
-             // We use an explicit destructor function pointer instead of a
-             // virtual destructor because we want to avoid adding a vtable
-             // pointer to this struct. Adding a vtable pointer would force the
-diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-index 2542878..637f62c 100644
---- a/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-+++ b/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
-@@ -32,8 +32,7 @@ namespace JSC{
-     
-     class JSStaticScopeObject : public JSVariableObject {
-     protected:
--        using JSVariableObject::JSVariableObjectData;
--        struct JSStaticScopeObjectData : public JSVariableObjectData {
-+        struct JSStaticScopeObjectData : public JSVariableObjectData::JSVariableObjectData {
-             JSStaticScopeObjectData()
-                 : JSVariableObjectData(&symbolTable, &registerStore + 1)
-             {
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
deleted file mode 100644
index b763ac1..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0020-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From fb89f23c25363ac7b138fdba2bf5a9cdcaa7e840 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 26 Sep 2012 20:54:38 +0200
-Subject: [PATCH 20/22] Fixes for gcc 4.7.0, particularly on qemux86
-
-Origin: upstream, http://trac.webkit.org/changeset/93631
-Origin: upstream, http://trac.webkit.org/changeset/113848
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=62168
-Bug: https://bugs.webkit.org/show_bug.cgi?id=83584
-
-RP 2012/04/30
-
-Upstream-Status: Backport
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/webkit/Source/WebCore/dom/Element.cpp                      | 2 +-
- src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp            | 2 +-
- .../webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h   | 1 +
- 3 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp b/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
-index 32e47ca..b8e7389 100644
---- a/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
-+++ b/src/3rdparty/webkit/Source/WebCore/dom/Element.cpp
-@@ -1080,7 +1080,7 @@ void Element::recalcStyle(StyleChange change)
- {
-     // Ref currentStyle in case it would otherwise be deleted when setRenderStyle() is called.
-     RefPtr<RenderStyle> currentStyle(renderStyle());
--    bool hasParentStyle = parentNodeForRenderingAndStyle() ? parentNodeForRenderingAndStyle()->renderStyle() : false;
-+    bool hasParentStyle = parentNodeForRenderingAndStyle() ? static_cast<bool>(parentNodeForRenderingAndStyle()->renderStyle()) : false;
-     bool hasDirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByDirectAdjacentRules();
-     bool hasIndirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByForwardPositionalRules();
- 
-diff --git a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
-index d66075e..ab8f111 100644
---- a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
-+++ b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
-@@ -74,7 +74,7 @@ PassRefPtr<HTMLImageElement> HTMLImageElement::createForJSConstructor(Document*
-     RefPtr<HTMLImageElement> image = adoptRef(new HTMLImageElement(imgTag, document));
-     if (optionalWidth)
-         image->setWidth(*optionalWidth);
--    if (optionalHeight > 0)
-+    if (optionalHeight)
-         image->setHeight(*optionalHeight);
-     return image.release();
- }
-diff --git a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
-index 6087ec3..6d748f6 100644
---- a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
-+++ b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
-@@ -25,6 +25,7 @@ namespace WebCore {
- #if ENABLE(TILED_BACKING_STORE)
- class TiledBackingStoreClient {
- public:
-+    virtual ~TiledBackingStoreClient() { }
-     virtual void tiledBackingStorePaintBegin() = 0;
-     virtual void tiledBackingStorePaint(GraphicsContext*, const IntRect&) = 0;
-     virtual void tiledBackingStorePaintEnd(const Vector<IntRect>& paintedArea) = 0;
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
deleted file mode 100644
index 05dc806..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0021-webkit-disable-the-fuse-ld-gold-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3a74f5cf7f92ff6bf6b69c7cf76f54516573abb7 Mon Sep 17 00:00:00 2001
-From: Ken Werner <ken.werner@linaro.org>
-Date: Wed, 26 Sep 2012 20:55:21 +0200
-Subject: [PATCH 21/22] webkit: disable the -fuse-ld=gold flag
-
-This option is a Debian/Ubuntu specific extension to the g++ and causes upstream GCC to throw an error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ken Werner <ken.werner@linaro.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/webkit/Source/common.pri | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/3rdparty/webkit/Source/common.pri b/src/3rdparty/webkit/Source/common.pri
-index 0f62e14..d81a1f0 100644
---- a/src/3rdparty/webkit/Source/common.pri
-+++ b/src/3rdparty/webkit/Source/common.pri
-@@ -3,12 +3,12 @@
- contains(JAVASCRIPTCORE_JIT,yes): DEFINES+=ENABLE_JIT=1
- contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
- 
--linux-g++ {
--isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
--    message(Using gold linker)
--    QMAKE_LFLAGS+=-fuse-ld=gold
--}
--}
-+#linux-g++ {
-+#isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
-+#    message(Using gold linker)
-+#    QMAKE_LFLAGS+=-fuse-ld=gold
-+#}
-+#}
- 
- # We use this flag on production branches
- # See https://bugs.webkit.org/show_bug.cgi?id=60824
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch b/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
deleted file mode 100644
index bdd5d4f..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/0022-webkit-fix-conflicting-types.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5cc08e33ea7ab5d32b6a14ccb23a366d56e50ea1 Mon Sep 17 00:00:00 2001
-From: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: Wed, 26 Sep 2012 20:56:33 +0200
-Subject: [PATCH 22/22] webkit: fix conflicting types
-
-This patch fixes the type mismatch fixing this compile issue:
-
-|
-/srv/home/nitin/builds/build-gcc47/tmp/sysroots/qemux86/usr/include/glib-2.0/glib/gthread.h:58:7:
-error: 'union' tag used in naming 'struct _GMutex' [-Werror=permissive]
-| In file included from ./wtf/Platform.h:1217:0,
-|                  from ./config.h:30,
-|                  from wtf/gobject/GOwnPtr.cpp:19:
-| wtf/gobject/GTypedefs.h:55:16: note: 'struct _GMutex' was previously
-declared here
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-index c7f7ac4..f00e9cf 100644
---- a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-+++ b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/gobject/GTypedefs.h
-@@ -52,7 +52,7 @@ typedef struct _GFile GFile;
- typedef struct _GHashTable GHashTable;
- typedef struct _GInputStream GInputStream;
- typedef struct _GList GList;
--typedef struct _GMutex GMutex;
-+typedef union _GMutex GMutex;
- typedef struct _GPatternSpec GPatternSpec;
- typedef struct _GPollableOutputStream GPollableOutputStream;
- typedef struct _GSocketClient GSocketClient;
--- 
-1.7.12
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
deleted file mode 100644
index e58fb15..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/g++.conf
+++ /dev/null
@@ -1,56 +0,0 @@
-#
-# qmake configuration for common gcc
-#
-
-QMAKE_CC       = $(OE_QMAKE_CC)
-QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+= -M
-QMAKE_CFLAGS_WARN_ON	+= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+= -w
-QMAKE_CFLAGS_RELEASE	+=
-QMAKE_CFLAGS_DEBUG	+= -g
-QMAKE_CFLAGS_SHLIB	+= -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
-QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
-
-QMAKE_CXX      = $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
-QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
-QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
-
-QMAKE_LINK     = $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-QMAKE_LINK_C		= $(OE_QMAKE_LINK)
-QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
-QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=
-QMAKE_LFLAGS_DEBUG	+=
-QMAKE_LFLAGS_APP	+=
-QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
-QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
-
-QMAKE_PCH_OUTPUT_EXT    = .gch
-
-# -Bsymbolic-functions (ld) support
-QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
-QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
-
-# some linking helper...
-CONFIG += rpath_libdirs
-
-# for the SDK
-isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
deleted file mode 100644
index 8670381..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/linux.conf
+++ /dev/null
@@ -1,66 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =
-QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      =
-QMAKE_LIBDIR_X11      =
-QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =
-QMAKE_LIBDIR_OPENGL   =
-QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_EGL      =
-QMAKE_LIBDIR_EGL      =
-QMAKE_INCDIR_OPENVG   =
-QMAKE_LIBDIR_OPENVG   =
-
-
-QMAKE_LIBS            =
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_EGL        = -lEGL
-QMAKE_LIBS_OPENGL     = -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
-QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
-QMAKE_LIBS_OPENVG     = -lOpenVG
-QMAKE_LIBS_THREAD     = -lpthread
-
-QMAKE_MOC             = $(OE_QMAKE_MOC)
-QMAKE_UIC             = $(OE_QMAKE_UIC)
-QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-QMAKE_RCC             = $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = objcopy
-QMAKE_RANLIB          =
-
-QMAKE_TAR             = tar -cf
-QMAKE_GZIP            = gzip -9f
-
-QMAKE_COPY            = cp -f
-QMAKE_COPY_FILE       = $(COPY)
-QMAKE_COPY_DIR        = $(COPY) -r
-QMAKE_MOVE            = mv -f
-QMAKE_DEL_FILE        = rm -f
-QMAKE_DEL_DIR         = rmdir
-QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB += --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  = test -d
-QMAKE_MKDIR           = mkdir -p
-QMAKE_INSTALL_FILE    = install -m 644 -p
-QMAKE_INSTALL_PROGRAM = install -m 755 -p
-
-include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt4-4.8.1/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
deleted file mode 100644
index 21d6ecb..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.1/qte.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-if [ -e /dev/input/touchscreen0 ]
-then
-    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-    export QWS_MOUSE_PROTO
-fi
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
deleted file mode 100644
index 5a3dc65..0000000
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt4-${PV}.inc
-require qt4-embedded.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-QT_CONFIG_FLAGS += " \
- -exceptions \
-"
-
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
deleted file mode 100644
index c09e6df..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt4-native.inc
-
-PR = "${INC_PR}.1"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "7960ba8e18ca31f0c6e4895a312f92ff"
-SRC_URI[sha256sum] = "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
-
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
deleted file mode 100644
index 9b03ff2..0000000
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt4-x11-free.inc
-require qt4-${PV}.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-- 
1.7.10



