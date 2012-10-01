Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIpci-0000rL-I5
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 01:42:04 +0200
Received: by wgbdq11 with SMTP id dq11so3689407wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 16:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Jp72tNtsads34cZ2gIY9J6xRO/iJLQPCLlLjlFIHNl8=;
	b=Vug0tMpnnzzYWCzV25eIL0W29u7FVsOK4DL/xhrw7IQSH5qVV33Khw1qQslNG9iK9v
	G2YYT4kwZ+lm6aqEHJqb6nqUkobRo59ukSvVQAdtdj3SgVSR/kjHw24FVgl8jBt6tazc
	CS7Y5pOrUFgVjq+dEFMo5bn+4b8TA18MgLfxuOZvCRmeEIcta87o10KYMV4recQtfWXQ
	TRGc1pR/kaHos0rKzyvIVerXlNq/loBfg0P/2EYobGMVmJOeYOD92RFaDLSEj58a58JI
	EBdr2jztgfsjT3onj4WwVr48Y5U/vLix/Pn2kslkJYYc2MrvnAQ9WLSZs92SJQLRXLG0
	ucaw==
Received: by 10.216.194.38 with SMTP id l38mr8497223wen.80.1349134146848;
	Mon, 01 Oct 2012 16:29:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm8688601wib.10.2012.10.01.16.29.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 16:29:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2012 01:28:59 +0200
Message-Id: <c55495c2463225d887e6bc3e4469638dac08c33d.1349134104.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <78d078c48e5f4440e6bebe93851a56e0721d2804.1348697518.git.Martin.Jansa@gmail.com>
References: <78d078c48e5f4440e6bebe93851a56e0721d2804.1348697518.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349134104.git.Martin.Jansa@gmail.com>
References: <cover.1349134104.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 10/10] qt4: add 4.8.3 version with negative D_P
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
X-List-Received-Date: Mon, 01 Oct 2012 23:42:04 -0000

* rebased patches, 3 patches are resolved upstream:
  0019-javascriptcore-Fix-compile-error-when-using-toolchai.patch
    resolved in upstream commit 7ac8d8597db1f58b11338f91fb27f6ad8696b34b
  0022-webkit-fix-conflicting-types.patch
    resolved in upstream commit929b4443d53fcf3a7ad1cb9f3af5569e41ef56f1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb   |  10 +
 meta/recipes-qt/qt4/qt4-4.8.3.inc                  |  60 ++++
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  43 +++
 ...tty_qws-fix-build-with-old-kernel-headers.patch |  50 ++++
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  34 +++
 ...make-is-already-built-in-qt4-tools-native.patch |  29 ++
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  28 ++
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  38 +++
 ...-const-usage-that-causes-compile-failure-.patch |  34 +++
 ...llow-building-a-separate-qmake-for-the-ta.patch |  29 ++
 ...e-fix-source-file-references-in-qmake.pri.patch |  52 ++++
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  42 +++
 .../qt4-4.8.3/0011-freetype-host-includes.patch    |  29 ++
 .../qt4/qt4-4.8.3/0012-Add-2bpp-support.patch      | 318 +++++++++++++++++++++
 .../0013-configure-add-crossarch-option.patch      |  47 +++
 ...tions-fix-phony-translation-linking-error.patch |  41 +++
 ...-configure-add-nostrip-for-debug-packages.patch |  32 +++
 .../qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch  |  36 +++
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |  46 +++
 ...ure-make-pulseaudio-a-configurable-option.patch |  46 +++
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |  63 ++++
 ...0020-webkit-disable-the-fuse-ld-gold-flag.patch |  41 +++
 meta/recipes-qt/qt4/qt4-4.8.3/g++.conf             |  56 ++++
 meta/recipes-qt/qt4/qt4-4.8.3/linux.conf           |  66 +++++
 meta/recipes-qt/qt4/qt4-4.8.3/qte.sh               |   7 +
 meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb          |  11 +
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |  10 +
 meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb          |  11 +
 28 files changed, 1309 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3.inc
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
new file mode 100644
index 0000000..ad5d881
--- /dev/null
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
@@ -0,0 +1,10 @@
+require nativesdk-qt4-tools.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
+
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3.inc b/meta/recipes-qt/qt4/qt4-4.8.3.inc
new file mode 100644
index 0000000..e473dc6
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3.inc
@@ -0,0 +1,60 @@
+LICENSE = "LGPLv2.1 | GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
+                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
+                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
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
+           file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
+           file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
+           file://g++.conf \
+           file://linux.conf \
+           "
+
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
+
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+
+FILES_${QT_BASE_NAME}-tools_append     = " ${bindir}/qml ${bindir}/qmlplugindump"
+FILES_${QT_BASE_NAME}-tools-dbg_append = " ${bindir}/.debug/qml ${bindir}/.debug/qmlplugindump"
+
+PACKAGES_append = " ${QT_BASE_NAME}-tests-dbg ${QT_BASE_NAME}-tests"
+FILES_${QT_BASE_NAME}-tests-dbg        = "/usr/tests/qt4/*/.debug"
+FILES_${QT_BASE_NAME}-tests            = "/usr/tests/qt4/*"
+
+do_configure_prepend() {
+    for pro in $(find ${S} -name "*.pro") ; do
+        sed -i \
+            -e 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' \
+            -e 's:qtPrepareTool(LRELEASE, lrelease):LRELEASE = ${OE_QMAKE_LRELEASE}:g' $pro
+    done
+
+    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
+    sed -i \
+    -e /QMAKE_MOC\ /d \
+    -e /QMAKE_UIC\ /d \
+    -e /QMAKE_UIC3\ /d \
+    -e /QMAKE_RCC\ /d \
+    ${S}/configure
+
+    # Avoid problems with Qt 4.8.0 configure setting QMAKE_LINK from LD (since we want the linker to be g++)
+    unset LD
+}
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
new file mode 100644
index 0000000..e7eb52c
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -0,0 +1,43 @@
+From 89349d565cf03f3a2c09fe235ac6c75e415859bd Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 17:22:30 +0200
+Subject: [PATCH 01/20] qlibraryinfo: allow to set qt.conf from the outside
+ using the environment
+
+Allow to set a qt.conf from the outside using the environment. This allows
+to inject new prefixes and other paths into qmake. This is needed when using
+the same qmake binary to build qt/x11 and qt/embedded
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/corelib/global/qlibraryinfo.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 91d2dfc..41045b3 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -54,6 +54,7 @@
+ QT_BEGIN_NAMESPACE
+ extern QString qmake_libraryInfoFile();
+ QT_END_NAMESPACE
++#include <stdlib.h>
+ #else
+ # include "qcoreapplication.h"
+ #endif
+@@ -112,6 +113,10 @@ QSettings *QLibraryInfoPrivate::findConfiguration()
+ #ifdef BOOTSTRAPPING
+     if(!QFile::exists(qtconfig))
+         qtconfig = qmake_libraryInfoFile();
++    if (!QFile::exists(qtconfig)) {
++        QByteArray config = getenv("QT_CONF_PATH");
++        qtconfig = QFile::decodeName(config);
++    }
+ #else
+     if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
+ #ifdef Q_OS_MAC
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
new file mode 100644
index 0000000..fbda9c4
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
@@ -0,0 +1,50 @@
+From fe15b966616cc2d2f2f071474a3414fd03ee473e Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 26 Sep 2012 20:18:08 +0200
+Subject: [PATCH 02/20] qkbdtty_qws: fix build with old kernel headers
+
+This issue is that with C++ compiler process an old version of kernel
+header file, coincidently that file has a variable named 'new':
+
+* 'embedded/qkbdtty_qws.cpp' include 'linux/vt.h';
+* '/usr/include/linux/vt.h' has below code on SLED-11.x:
+    + unsigned int new;
+
+On mostly hosts it has been changed to: new -> newev.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui/embedded/qkbdtty_qws.cpp | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
+index c629fa3..47fd3f7 100644
+--- a/src/gui/embedded/qkbdtty_qws.cpp
++++ b/src/gui/embedded/qkbdtty_qws.cpp
+@@ -54,8 +54,20 @@
+ 
+ #if defined Q_OS_LINUX
+ #  include <linux/kd.h>
++
++/* Workaround kernel headers using "new" as variable name. The problem
++ is specific to SLED-11, other distros use "newev" rather than "new" */
++#ifdef __cplusplus
++#warning "workaround kernel headers using new as variable name on SLED 11"
++#define new newev
++#endif
++
+ #  include <linux/vt.h> //TODO: move vt handling somewhere else (QLinuxFbScreen?)
+ 
++#ifdef __cplusplus
++#undef new
++#endif
++
+ #  include "qscreen_qws.h"
+ #  include "qwindowsystem_qws.h"
+ #  include "qapplication.h"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
new file mode 100644
index 0000000..66a7db1
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
@@ -0,0 +1,34 @@
+From f7eb6d336d30da7b8193f1d1ab6142293e3966da Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 1 May 2012 07:48:15 +0200
+Subject: [PATCH 03/20] webkit2: set OUTPUT_DIR value if empty
+
+Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
+now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
+
+First reported here:
+http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24436.html
+
+Upstream-Status: Pending
+
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
+ 
+ CONFIG -= debug_and_release
+ 
++isEmpty(OUTPUT_DIR): OUTPUT_DIR = ../..
++
+ CONFIG(standalone_package) {
+     isEmpty(WEBKIT2_GENERATED_SOURCES_DIR):WEBKIT2_GENERATED_SOURCES_DIR = $$PWD/generated
+     isEmpty(WC_GENERATED_SOURCES_DIR):WC_GENERATED_SOURCES_DIR = $$PWD/../WebCore/generated
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
new file mode 100644
index 0000000..56bb8c3
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
@@ -0,0 +1,29 @@
+From 53a20e5f7f790d047b67b1631e1d4acc9a86906a Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Wed, 26 Sep 2012 20:24:20 +0200
+Subject: [PATCH 04/20] configure: qmake is already built in qt4-tools-native,
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
+index d19f443..59bdb63 100755
+--- a/configure
++++ b/configure
+@@ -4899,7 +4899,7 @@ setBootstrapVariable()
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
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
new file mode 100644
index 0000000..4e310c2
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
@@ -0,0 +1,28 @@
+From 5641d763180e7f848f5d39588417292b6b8df88e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
+Date: Wed, 26 Sep 2012 20:27:44 +0200
+Subject: [PATCH 05/20] configure: set LFLAGS to pick up zlib from staging
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 59bdb63..cc08b71 100755
+--- a/configure
++++ b/configure
+@@ -690,7 +690,7 @@ fi
+ # initalize variables
+ #-------------------------------------------------------------------------------
+ 
+-SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
++SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
+ for varname in $SYSTEM_VARIABLES; do
+     qmakevarname="${varname}"
+     # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
new file mode 100644
index 0000000..21d5b4d
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
@@ -0,0 +1,38 @@
+From fa9e376ff72f488608c8fc635ec669fc00c3c1ea Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:29:09 +0200
+Subject: [PATCH 06/20] configure: Use OE_QMAKE_* values to specify Qt utility
+ paths
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure b/configure
+index cc08b71..958b884 100755
+--- a/configure
++++ b/configure
+@@ -8612,11 +8612,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
+ QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
+ 
+ #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
+-QMAKE_MOC        = \$\$QT_BUILD_TREE/bin/moc
+-QMAKE_UIC        = \$\$QT_BUILD_TREE/bin/uic
+-QMAKE_UIC3       = \$\$QT_BUILD_TREE/bin/uic3
+-QMAKE_RCC        = \$\$QT_BUILD_TREE/bin/rcc
+-QMAKE_QDBUSXML2CPP = \$\$QT_BUILD_TREE/bin/qdbusxml2cpp
++QMAKE_MOC        = \${OE_QMAKE_MOC}
++QMAKE_UIC        = \${OE_QMAKE_UIC}
++QMAKE_UIC3       = \${OE_QMAKE_UIC3}
++QMAKE_RCC        = \${OE_QMAKE_RCC}
++QMAKE_QDBUSXML2CPP = \${OE_QMAKE_QDBUSXML2CPP}
+ QMAKE_INCDIR_QT  = \$\$QT_BUILD_TREE/include
+ QMAKE_LIBDIR_QT  = \$\$QT_BUILD_TREE/lib
+ 
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
new file mode 100644
index 0000000..1ce3dbb
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
@@ -0,0 +1,34 @@
+From db3c7b5710ee14280b51c355487dabe21eff60b4 Mon Sep 17 00:00:00 2001
+From: Pavel Heimlich <tropikhajma@gmail.com>
+Date: Wed, 26 Sep 2012 20:31:10 +0200
+Subject: [PATCH 07/20] dbus: Remove "const" usage that causes compile failure
+ building nativesdk-qt4-tools
+
+Patch has apparently been rejected upstream, not because it is invalid
+but because the submitter did not submit a merge request for it, so the
+validity of the patch upstream is uncertain. For further details see:
+http://bugreports.qt.nokia.com/browse/QTBUG-17962
+
+Upstream-Status: Denied [possible retry]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/dbus/qdbusintegrator.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dbus/qdbusintegrator.cpp b/src/dbus/qdbusintegrator.cpp
+index 0bf62de..e53620f 100644
+--- a/src/dbus/qdbusintegrator.cpp
++++ b/src/dbus/qdbusintegrator.cpp
+@@ -72,7 +72,7 @@ QT_BEGIN_NAMESPACE
+ static bool isDebugging;
+ #define qDBusDebug              if (!::isDebugging); else qDebug
+ 
+-Q_GLOBAL_STATIC_WITH_ARGS(const QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
++Q_GLOBAL_STATIC_WITH_ARGS(QString, orgFreedesktopDBusString, (QLatin1String(DBUS_SERVICE_DBUS)))
+ 
+ static inline QString dbusServiceString()
+ { return *orgFreedesktopDBusString(); }
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
new file mode 100644
index 0000000..d945025
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
@@ -0,0 +1,29 @@
+From dacee47b11fc7cf89cdb8ddeeac9e6b64320ec8b Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:32:41 +0200
+Subject: [PATCH 08/20] qmake.pro: Allow building a separate qmake for the
+ target
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ qmake/qmake.pro | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/qmake/qmake.pro b/qmake/qmake.pro
+index 38e0fce..53b1ffb 100644
+--- a/qmake/qmake.pro
++++ b/qmake/qmake.pro
+@@ -7,6 +7,7 @@ CONFIG += console bootstrap
+ CONFIG -= qt shared app_bundle uic
+ DEFINES += QT_BUILD_QMAKE QT_BOOTSTRAPPED
+ DESTDIR = ../bin/
++TARGET = qmake2
+ 
+ OBJECTS_DIR = .
+ MOC_DIR = .
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
new file mode 100644
index 0000000..9616a5b
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
@@ -0,0 +1,52 @@
+From 08ec0f7ac7438e6f5b506b23fb52fe086078308b Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:33:49 +0200
+Subject: [PATCH 09/20] qmake: fix source file references in qmake.pri
+
+Fix duplicate entries in SOURCES and HEADERS, and fix the source file
+list for the split of qlocale.cpp.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ qmake/qmake.pri | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index 31f67f4..9081669 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -22,8 +22,7 @@ SOURCES += project.cpp property.cpp main.cpp generators/makefile.cpp \
+            generators/symbian/initprojectdeploy_symbian.cpp \
+            generators/integrity/gbuild.cpp \
+            windows/registry.cpp \
+-           symbian/epocroot.cpp \
+-           generators/integrity/gbuild.cpp
++           symbian/epocroot.cpp
+ 
+ HEADERS += project.h property.h generators/makefile.h \
+            generators/unix/unixmake.h meta.h option.h cachekeys.h \
+@@ -40,8 +39,7 @@ HEADERS += project.h property.h generators/makefile.h \
+            generators/symbian/initprojectdeploy_symbian.h \
+            generators/integrity/gbuild.h \
+            windows/registry_p.h \
+-           symbian/epocroot_p.h \
+-           generators/integrity/gbuild.h
++           symbian/epocroot_p.h
+ 
+ contains(QT_EDITION, OpenSource) {
+    DEFINES += QMAKE_OPENSOURCE_EDITION
+@@ -72,6 +70,8 @@ bootstrap { #Qt code
+         qlist.cpp \
+         qlinkedlist.cpp \
+         qlocale.cpp \
++        qlocale_tools.cpp \
++        qlocale_unix.cpp \
+         qmalloc.cpp \
+         qmap.cpp \
+         qmetatype.cpp \
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
new file mode 100644
index 0000000..f3674e8
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
@@ -0,0 +1,42 @@
+From d9544b4a079f3c66d15f973c5d1526df2fe49d40 Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 20:36:38 +0200
+Subject: [PATCH 10/20] configure: Hack to not use the pg_config of the host
+ system which will add /usr/include
+
+pg_config is a native binary so using that when cross compiling
+will always fail.  The commented out fix would do, but for OE
+our -platform and -xplatform is the same so we are actually not
+really cross compiling. Just comment out the test, we are passing
+the location to the postgres headers and if they are okay we
+will pad.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 958b884..24cbb2a 100755
+--- a/configure
++++ b/configure
+@@ -5441,10 +5441,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+         psql)
+             if [ "$CFG_SQL_psql" != "no" ]; then
+                 # Be careful not to use native pg_config when cross building.
+-                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
+-                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
+-                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
+-                fi
++#                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
++#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
++#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
++#                fi
+                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
+                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
+                 # But, respect PSQL_LIBS if set
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
new file mode 100644
index 0000000..60acb80
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
@@ -0,0 +1,29 @@
+From 95cbbdaaf543bb5747b535b5e4b02114f3d821d6 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 4 Jun 2007 14:48:50 +0200
+Subject: [PATCH 11/20] freetype host includes
+
+Host include path should not be used in cross compiling case.
+
+Ported from OE by: Yu Ke <ke.yu@intel.com>
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ config.tests/unix/freetype/freetype.pri | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.tests/unix/freetype/freetype.pri b/config.tests/unix/freetype/freetype.pri
+index 7ef1cf9..b362fcd 100644
+--- a/config.tests/unix/freetype/freetype.pri
++++ b/config.tests/unix/freetype/freetype.pri
+@@ -1,5 +1,5 @@
+ !cross_compile {
+-    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
++    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     # LSB doesn't allow using headers from /include or /usr/include
+     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
+     for(p, TRY_INCLUDEPATHS) {
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
new file mode 100644
index 0000000..019b9f4
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
@@ -0,0 +1,318 @@
+From a8233fddb36592361910d967664e5b546ac4cc3e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
+Date: Wed, 26 Sep 2012 20:39:21 +0200
+Subject: [PATCH 12/20] Add 2bpp support
+
+Submitted upstream but rejected as being "out of scope":
+http://bugreports.qt.nokia.com/browse/QTBUG-3468
+
+Upstream-Status: Denied
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure                               |   5 +-
+ src/gui/embedded/qscreen_qws.cpp        | 211 ++++++++++++++++++++++++++++++++
+ src/gui/embedded/qscreenlinuxfb_qws.cpp |   4 +-
+ 3 files changed, 216 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 24cbb2a..cd66d05 100755
+--- a/configure
++++ b/configure
+@@ -6999,6 +6999,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+     echo "Choose pixel-depths to support:"
+     echo
+     echo "   1. 1bpp, black/white"
++    echo "   2. 2bpp, grayscale"
+     echo "   4. 4bpp, grayscale"
+     echo "   8. 8bpp, paletted"
+     echo "  12. 12bpp, rgb 4-4-4"
+@@ -7017,11 +7018,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+ fi
+ if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
+     if [ "$CFG_QWS_DEPTHS" = "all" ]; then
+-        CFG_QWS_DEPTHS="1 4 8 12 15 16 18 24 32 generic"
++        CFG_QWS_DEPTHS="1 2 4 8 12 15 16 18 24 32 generic"
+     fi
+     for D in `echo "$CFG_QWS_DEPTHS" | sed -e 's/,/ /g'`; do
+ 	case $D in
+-	    1|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
++	    1|2|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
+ 	    generic) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_GENERIC";;
+ 	esac
+     done
+diff --git a/src/gui/embedded/qscreen_qws.cpp b/src/gui/embedded/qscreen_qws.cpp
+index d2ad851..d25fc87 100644
+--- a/src/gui/embedded/qscreen_qws.cpp
++++ b/src/gui/embedded/qscreen_qws.cpp
+@@ -469,6 +469,58 @@ static void solidFill_gray4(QScreen *screen, const QColor &color,
+ }
+ #endif // QT_QWS_DEPTH_4
+ 
++#ifdef QT_QWS_DEPTH_2
++static inline void qt_rectfill_gray2(quint8 *dest, quint8 value,
++                                     int x, int y, int width, int height,
++                                     int stride)
++{
++    const int pixelsPerByte = 4;
++    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
++    const int doAlign = (alignWidth > 0 ? 1 : 0);
++    const int alignStart = pixelsPerByte - 1 - (x & 3);
++    const int alignStop = alignStart - (alignWidth - 1);
++    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
++    const int tailWidth = (width - alignWidth) & 3;
++    const int doTail = (tailWidth > 0 ? 1 : 0);
++    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
++    const int width8 = (width - alignWidth) / pixelsPerByte;
++
++    dest += y * stride + x / pixelsPerByte;
++    stride -= (doAlign + width8);
++
++    for (int j = 0; j < height; ++j) {
++        if (doAlign) {
++            *dest = (*dest & ~alignMask) | (value & alignMask);
++            ++dest;
++        }
++        if (width8) {
++            qt_memfill<quint8>(dest, value, width8);
++            dest += width8;
++        }
++        if (doTail)
++            *dest = (*dest & tailMask) | (value & ~tailMask);
++        dest += stride;
++    }
++}
++
++static void solidFill_gray2(QScreen *screen, const QColor &color,
++                            const QRegion &region)
++{
++    quint8 *dest = reinterpret_cast<quint8*>(screen->base());
++    const quint8 c = qGray(color.rgba()) >> 6;
++    const quint8 c8 = (c << 6) | (c << 4) | (c << 2) | c;
++
++    const int stride = screen->linestep();
++    const QVector<QRect> rects = region.rects();
++
++    for (int i = 0; i < rects.size(); ++i) {
++        const QRect r = rects.at(i);
++        qt_rectfill_gray2(dest, c8, r.x(), r.y(), r.width(), r.height(),
++                          stride);
++    }
++}
++#endif // QT_QWS_DEPTH_2
++
+ #ifdef QT_QWS_DEPTH_1
+ static inline void qt_rectfill_mono(quint8 *dest, quint8 value,
+                                     int x, int y, int width, int height,
+@@ -576,6 +628,11 @@ void qt_solidFill_setup(QScreen *screen, const QColor &color,
+         screen->d_ptr->solidFill = solidFill_gray4;
+         break;
+ #endif
++#ifdef QT_QWS_DEPTH_2
++    case 2:
++        screen->d_ptr->solidFill = solidFill_gray2;
++        break;
++#endif
+ #ifdef QT_QWS_DEPTH_1
+     case 1:
+         screen->d_ptr->solidFill = solidFill_mono;
+@@ -1006,6 +1063,149 @@ static void blit_4(QScreen *screen, const QImage &image,
+ }
+ #endif // QT_QWS_DEPTH_4
+ 
++#ifdef QT_QWS_DEPTH_2
++
++struct qgray2 { quint8 dummy; } Q_PACKED;
++
++template <typename SRC>
++static inline quint8 qt_convertToGray2(SRC color);
++
++template <>
++inline quint8 qt_convertToGray2(quint32 color)
++{
++    return qGray(color) >> 6;
++}
++
++template <>
++inline quint8 qt_convertToGray2(quint16 color)
++{
++    const int r = (color & 0xf800) >> 11;
++    const int g = (color & 0x07e0) >> 6; // only keep 5 bit
++    const int b = (color & 0x001f);
++    return (r * 11 + g * 16 + b * 5) >> 8;
++}
++
++template <>
++inline quint8 qt_convertToGray2(qrgb444 color)
++{
++    return qt_convertToGray2(quint32(color));
++}
++
++template <>
++inline quint8 qt_convertToGray2(qargb4444 color)
++{
++    return qt_convertToGray2(quint32(color));
++}
++
++template <typename SRC>
++static inline void qt_rectconvert_gray2(qgray2 *dest2, const SRC *src,
++                                        int x, int y, int width, int height,
++                                        int dstStride, int srcStride)
++{
++    const int pixelsPerByte = 4;
++    quint8 *dest8 = reinterpret_cast<quint8*>(dest2)
++                    + y * dstStride + x / pixelsPerByte;
++    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
++    const int doAlign = (alignWidth > 0 ? 1 : 0);
++    const int alignStart = pixelsPerByte - 1 - (x & 3);
++    const int alignStop = alignStart - (alignWidth - 1);
++    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
++    const int tailWidth = (width - alignWidth) & 3;
++    const int doTail = (tailWidth > 0 ? 1 : 0);
++    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
++    const int width8 = (width - alignWidth) / pixelsPerByte;
++
++    srcStride = srcStride / sizeof(SRC) - (width8 * pixelsPerByte + alignWidth);
++    dstStride -= (width8 + doAlign);
++
++    for (int j = 0;  j < height; ++j) {
++        if (doAlign) {
++            quint8 d = *dest8 & ~alignMask;
++            for (int i = alignStart; i >= alignStop; --i)
++                d |= qt_convertToGray2<SRC>(*src++) << (2 * i);
++            *dest8++ = d;
++        }
++        for (int i = 0; i < width8; ++i) {
++            *dest8 = (qt_convertToGray2<SRC>(src[0]) << 6)
++                     | (qt_convertToGray2<SRC>(src[1]) << 4)
++                     | (qt_convertToGray2<SRC>(src[2]) << 2)
++                     | (qt_convertToGray2<SRC>(src[3]));
++            src += 4;
++            ++dest8;
++        }
++        if (doTail) {
++            quint8 d = *dest8 & tailMask;
++            switch (tailWidth) {
++            case 3: d |= qt_convertToGray2<SRC>(src[2]) << 2;
++            case 2: d |= qt_convertToGray2<SRC>(src[1]) << 4;
++            case 1: d |= qt_convertToGray2<SRC>(src[0]) << 6;
++            }
++            *dest8 = d;
++        }
++
++        dest8 += dstStride;
++        src += srcStride;
++    }
++}
++
++template <>
++void qt_rectconvert(qgray2 *dest, const quint32 *src,
++                    int x, int y, int width, int height,
++                    int dstStride, int srcStride)
++{
++    qt_rectconvert_gray2<quint32>(dest, src, x, y, width, height,
++                                  dstStride, srcStride);
++}
++
++template <>
++void qt_rectconvert(qgray2 *dest, const quint16 *src,
++                    int x, int y, int width, int height,
++                    int dstStride, int srcStride)
++{
++    qt_rectconvert_gray2<quint16>(dest, src, x, y, width, height,
++                                  dstStride, srcStride);
++}
++
++template <>
++void qt_rectconvert(qgray2 *dest, const qrgb444 *src,
++                    int x, int y, int width, int height,
++                    int dstStride, int srcStride)
++{
++    qt_rectconvert_gray2<qrgb444>(dest, src, x, y, width, height,
++                                  dstStride, srcStride);
++}
++
++template <>
++void qt_rectconvert(qgray2 *dest, const qargb4444 *src,
++                    int x, int y, int width, int height,
++                    int dstStride, int srcStride)
++{
++    qt_rectconvert_gray2<qargb4444>(dest, src, x, y, width, height,
++                                    dstStride, srcStride);
++}
++
++static void blit_2(QScreen *screen, const QImage &image,
++                   const QPoint &topLeft, const QRegion &region)
++{
++    switch (image.format()) {
++    case QImage::Format_ARGB32_Premultiplied:
++        blit_template<qgray2, quint32>(screen, image, topLeft, region);
++        return;
++    case QImage::Format_RGB16:
++        blit_template<qgray2, quint16>(screen, image, topLeft, region);
++        return;
++    case QImage::Format_RGB444:
++        blit_template<qgray2, qrgb444>(screen, image, topLeft, region);
++        return;
++    case QImage::Format_ARGB4444_Premultiplied:
++        blit_template<qgray2, qargb4444>(screen, image, topLeft, region);
++        return;
++    default:
++        qCritical("blit_2(): Image format %d not supported!", image.format());
++    }
++}
++#endif // QT_QWS_DEPTH_2
++
+ #ifdef QT_QWS_DEPTH_1
+ 
+ struct qmono { quint8 dummy; } Q_PACKED;
+@@ -1259,6 +1459,11 @@ void qt_blit_setup(QScreen *screen, const QImage &image,
+         screen->d_ptr->blit = blit_4;
+         break;
+ #endif
++#ifdef QT_QWS_DEPTH_2
++    case 2:
++        screen->d_ptr->blit = blit_2;
++        break;
++#endif
+ #ifdef QT_QWS_DEPTH_1
+     case 1:
+         screen->d_ptr->blit = blit_1;
+@@ -2146,6 +2351,8 @@ int QScreen::alloc(unsigned int r,unsigned int g,unsigned int b)
+         }
+     } else if (d == 4) {
+         ret = qGray(r, g, b) >> 4;
++    } else if (d == 2) {
++        ret = qGray(r, g, b) >> 6;
+     } else if (d == 1) {
+         ret = qGray(r, g, b) >= 128;
+     } else {
+@@ -2216,6 +2423,10 @@ bool QScreen::supportsDepth(int d) const
+     } else if(d==1) {
+         return true;
+ #endif
++#ifdef QT_QWS_DEPTH_2
++    } else if(d==2) {
++        return true;
++#endif
+ #ifdef QT_QWS_DEPTH_4
+     } else if(d==4) {
+         return true;
+diff --git a/src/gui/embedded/qscreenlinuxfb_qws.cpp b/src/gui/embedded/qscreenlinuxfb_qws.cpp
+index 04abcd4..06dea6d 100644
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
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
new file mode 100644
index 0000000..c216c85
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
@@ -0,0 +1,47 @@
+From 8785f376533ffdcf4c32b53274e8c40f567d7fd5 Mon Sep 17 00:00:00 2001
+From: Michael Lauer <mickey@vanille-media.de>
+Date: Wed, 26 Sep 2012 20:41:32 +0200
+Subject: [PATCH 13/20] configure: add "-crossarch" option
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index cd66d05..f2c0725 100755
+--- a/configure
++++ b/configure
+@@ -1141,7 +1141,7 @@ while [ "$#" -gt 0 ]; do
+         shift
+         VAL=$1
+         ;;
+-    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot)
++    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-sysroot|-crossarch)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         shift
+         VAL="$1"
+@@ -1697,6 +1697,9 @@ while [ "$#" -gt 0 ]; do
+         DEV_VAL=`echo $VAL | sed "s,^.*=\(.*\),\1,"`
+         DeviceVar set $DEV_VAR $DEV_VAL
+         ;;
++	crossarch)
++		CROSSARCH="$VAL"
++		;;
+     debug-and-release)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_DEBUG_RELEASE="$VAL"
+@@ -3297,6 +3300,8 @@ arm*)
+     ;;
+ esac
+ 
++CFG_ARCH="$CROSSARCH"
++
+ if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
+     if [ "$OPT_VERBOSE" = "yes" ]; then
+         echo "    '$CFG_ARCH' is supported"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
new file mode 100644
index 0000000..0874c84
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
@@ -0,0 +1,41 @@
+From 851eb73f7c2d3fa8dc017c3fb4f448b522cd9873 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 26 Sep 2012 20:45:10 +0200
+Subject: [PATCH 14/20] translations: fix phony translation linking error
+
+  | .../usr/lib/crt1.o: In function `_start':
+  | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
+  | collect2: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ translations/translations.pro | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/translations/translations.pro b/translations/translations.pro
+index dc99beb..0d98829 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -101,7 +101,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG += no_link
+ QMAKE_EXTRA_COMPILERS += updateqm
+ 
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK = @: IGNORE THIS LINE
+     OBJECTS_DIR =
+     win32:CONFIG -= embed_manifest_exe
+@@ -111,7 +111,7 @@ isEmpty(vcproj) {
+     phony_src.input = PHONY_DEPS
+     phony_src.output = phony.c
+     phony_src.variable_out = GENERATED_SOURCES
+-    phony_src.commands = echo int main() { return 0; } > phony.c
++    phony_src.commands = echo \"int main() { return 0; }\" > phony.c
+     phony_src.name = CREATE phony.c
+     phony_src.CONFIG += combine
+     QMAKE_EXTRA_COMPILERS += phony_src
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
new file mode 100644
index 0000000..fc13b08
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
@@ -0,0 +1,32 @@
+From 1c42c9c5f02845ea4c5b82638b7b2ed4d3dca0ff Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fabo@debian.org>
+Date: Wed, 26 Sep 2012 20:46:14 +0200
+Subject: [PATCH 15/20] configure: add nostrip for debug packages
+
+Qt is built in release mode and strip files by default.
+Set CONFIG+=nostrip to avoid the stripping and
+let dh_strip do it to generate debug packages.
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index f2c0725..d1a0dfd 100755
+--- a/configure
++++ b/configure
+@@ -710,6 +710,8 @@ mkdir -p "$outpath/config.tests"
+ rm -f "$outpath/config.tests/.qmake.cache"
+ cp "$QMAKE_VARS_FILE" "$outpath/config.tests/.qmake.cache"
+ 
++QMakeVar add CONFIG nostrip
++
+ QMakeVar add styles "cde mac motif plastique cleanlooks windows"
+ QMakeVar add decorations "default windows styled"
+ QMakeVar add mouse-drivers "pc"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch
new file mode 100644
index 0000000..87966be
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch
@@ -0,0 +1,36 @@
+From ec9d722e08c636e0c672b0adc3b54569367c6502 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:47:08 +0200
+Subject: [PATCH 16/20] configure: eval QMAKE_CXX
+
+Allow expansion of $(...) references in QMAKE_CXX (currently its value
+is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
+which allows WebKit to be enabled.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Conflicts:
+	configure
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index d1a0dfd..9f59e1a 100755
+--- a/configure
++++ b/configure
+@@ -3438,6 +3438,7 @@ else
+ fi
+ 
+-QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
++QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'` 
++QMAKE_CONF_COMPILER=`eval "echo $QMAKE_CONF_COMPILER"`
+ TEST_COMPILER="$CXX"
+ 
+ [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
new file mode 100644
index 0000000..ef32932
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
@@ -0,0 +1,46 @@
+From 5945025c96fd25880565819881b8ef48e1baa3ce Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Wed, 26 Sep 2012 20:48:37 +0200
+Subject: [PATCH 17/20] configure: ensure we identify the compiler as g++ in
+ configure
+
+Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
+script was interpreting from this that the compiler was "oe-g++" and
+thus
+g++ specific checks were not being run since this string did not match;
+among other things this resulted in a compiler version check in the
+QtWebKit build code not working, and hence the following error at build
+time:
+
+./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword
+in C++0x [-Werror=c++0x-compat]
+
+The easiest thing since our PLATFORM is entirely artificial is to just
+force COMPILER to "g++" in the configure script if it is detected as
+"oe-g++".
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure b/configure
+index 9f59e1a..6989962 100755
+--- a/configure
++++ b/configure
+@@ -7527,6 +7527,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
+ else
+     COMPILER=`echo $PLATFORM | cut -f 2- -d-`
+ fi
++case $COMPILER in
++    *oe-g++) COMPILER="g++" ;;
++esac
+ if [ "$CFG_EXCEPTIONS" = "unspecified" -a "$PLATFORM_QWS" = "yes" ]; then
+     CFG_EXCEPTIONS=no
+ fi
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch
new file mode 100644
index 0000000..f3c17a5
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch
@@ -0,0 +1,46 @@
+From 5da434f2a61ca819ff9a9b0a84de8c2307f9d41b Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Tue, 28 Feb 2012 15:10:24 +0000
+Subject: [PATCH 18/20] configure: make pulseaudio a configurable option
+
+Allows disabling pulseaudio support within phonon at configure time.
+(This is the Qt 4.8.0 version.)
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 6989962..58fcedd 100755
+--- a/configure
++++ b/configure
+@@ -1127,7 +1127,7 @@ while [ "$#" -gt 0 ]; do
+         VAL=no
+         ;;
+     #Qt style yes options
+-    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
++    -incremental|-qvfb|-profile|-shared|-static|-sm|-xinerama|-xshape|-xsync|-xinput|-egl|-reduce-exports|-pch|-separate-debug-info|-stl|-freetype|-xcursor|-xfixes|-xrandr|-xrender|-mitshm|-fontconfig|-xkb|-nis|-qdbus|-dbus|-dbus-linked|-glib|-gstreamer|-pulseaudio|-gtkstyle|-cups|-iconv|-largefile|-h|-help|-v|-verbose|-debug|-release|-fast|-accessibility|-confirm-license|-gnumake|-framework|-qt3support|-debug-and-release|-exceptions|-cocoa|-carbon|-universal|-harfbuzz|-prefix-install|-silent|-armfpa|-optimized-qmake|-dwarf2|-reduce-relocations|-sse|-openssl|-openssl-linked|-ptmalloc|-xmlpatterns|-phonon|-phonon-backend|-multimedia|-audio-backend|-svg|-declarative|-declarative-debug|-javascript-jit|-script|-scripttools|-rpath|-force-pkg-config|-s60|-usedeffiles|-icu)
+         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
+         VAL=yes
+         ;;
+@@ -2101,6 +2101,13 @@ while [ "$#" -gt 0 ]; do
+             UNKNOWN_OPT=yes
+         fi
+         ;;
++    pulseaudio)
++        if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
++            CFG_PULSEAUDIO="$VAL"
++        else
++            UNKNOWN_OPT=yes
++        fi
++        ;;
+     gtkstyle)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_QGTKSTYLE="$VAL"
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
new file mode 100644
index 0000000..9f4adab
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
@@ -0,0 +1,63 @@
+From 915ea240e03f04c6ae788cf369b13afe5d9bfc45 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 26 Sep 2012 20:54:38 +0200
+Subject: [PATCH 19/20] Fixes for gcc 4.7.0, particularly on qemux86
+
+Origin: upstream, http://trac.webkit.org/changeset/93631
+Origin: upstream, http://trac.webkit.org/changeset/113848
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=62168
+Bug: https://bugs.webkit.org/show_bug.cgi?id=83584
+
+RP 2012/04/30
+
+Upstream-Status: Backport
+
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
+ {
+     // Ref currentStyle in case it would otherwise be deleted when setRenderStyle() is called.
+     RefPtr<RenderStyle> currentStyle(renderStyle());
+-    bool hasParentStyle = parentNodeForRenderingAndStyle() ? parentNodeForRenderingAndStyle()->renderStyle() : false;
++    bool hasParentStyle = parentNodeForRenderingAndStyle() ? static_cast<bool>(parentNodeForRenderingAndStyle()->renderStyle()) : false;
+     bool hasDirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByDirectAdjacentRules();
+     bool hasIndirectAdjacentRules = currentStyle && currentStyle->childrenAffectedByForwardPositionalRules();
+ 
+diff --git a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
+index d66075e..ab8f111 100644
+--- a/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
++++ b/src/3rdparty/webkit/Source/WebCore/html/HTMLImageElement.cpp
+@@ -74,7 +74,7 @@ PassRefPtr<HTMLImageElement> HTMLImageElement::createForJSConstructor(Document*
+     RefPtr<HTMLImageElement> image = adoptRef(new HTMLImageElement(imgTag, document));
+     if (optionalWidth)
+         image->setWidth(*optionalWidth);
+-    if (optionalHeight > 0)
++    if (optionalHeight)
+         image->setHeight(*optionalHeight);
+     return image.release();
+ }
+diff --git a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
+index 6087ec3..6d748f6 100644
+--- a/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
++++ b/src/3rdparty/webkit/Source/WebCore/platform/graphics/TiledBackingStoreClient.h
+@@ -25,6 +25,7 @@ namespace WebCore {
+ #if ENABLE(TILED_BACKING_STORE)
+ class TiledBackingStoreClient {
+ public:
++    virtual ~TiledBackingStoreClient() { }
+     virtual void tiledBackingStorePaintBegin() = 0;
+     virtual void tiledBackingStorePaint(GraphicsContext*, const IntRect&) = 0;
+     virtual void tiledBackingStorePaintEnd(const Vector<IntRect>& paintedArea) = 0;
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch
new file mode 100644
index 0000000..1e07a54
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch
@@ -0,0 +1,41 @@
+From a10ba547001f4a4ba0ae313a4e9c2c0b5bb36a09 Mon Sep 17 00:00:00 2001
+From: Ken Werner <ken.werner@linaro.org>
+Date: Wed, 26 Sep 2012 20:55:21 +0200
+Subject: [PATCH 20/20] webkit: disable the -fuse-ld=gold flag
+
+This option is a Debian/Ubuntu specific extension to the g++ and causes upstream GCC to throw an error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ken Werner <ken.werner@linaro.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/3rdparty/webkit/Source/common.pri | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/3rdparty/webkit/Source/common.pri b/src/3rdparty/webkit/Source/common.pri
+index 0f62e14..d81a1f0 100644
+--- a/src/3rdparty/webkit/Source/common.pri
++++ b/src/3rdparty/webkit/Source/common.pri
+@@ -3,12 +3,12 @@
+ contains(JAVASCRIPTCORE_JIT,yes): DEFINES+=ENABLE_JIT=1
+ contains(JAVASCRIPTCORE_JIT,no): DEFINES+=ENABLE_JIT=0
+ 
+-linux-g++ {
+-isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
+-    message(Using gold linker)
+-    QMAKE_LFLAGS+=-fuse-ld=gold
+-}
+-}
++#linux-g++ {
++#isEmpty($$(SBOX_DPKG_INST_ARCH)):exists(/usr/bin/ld.gold) {
++#    message(Using gold linker)
++#    QMAKE_LFLAGS+=-fuse-ld=gold
++#}
++#}
+ 
+ # We use this flag on production branches
+ # See https://bugs.webkit.org/show_bug.cgi?id=60824
+-- 
+1.7.12
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
new file mode 100644
index 0000000..e58fb15
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
@@ -0,0 +1,56 @@
+#
+# qmake configuration for common gcc
+#
+
+QMAKE_CC       = $(OE_QMAKE_CC)
+QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
+QMAKE_CFLAGS_DEPS	+= -M
+QMAKE_CFLAGS_WARN_ON	+= -Wall -W
+QMAKE_CFLAGS_WARN_OFF	+= -w
+QMAKE_CFLAGS_RELEASE	+=
+QMAKE_CFLAGS_DEBUG	+= -g
+QMAKE_CFLAGS_SHLIB	+= -fPIC
+QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
+QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
+QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
+QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
+QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
+
+QMAKE_CXX      = $(OE_QMAKE_CXX)
+QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
+QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
+QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
+QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
+QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
+QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
+QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
+QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
+QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
+QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
+QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
+QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
+QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
+
+QMAKE_LINK     = $(OE_QMAKE_LINK)
+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
+QMAKE_LINK_C		= $(OE_QMAKE_LINK)
+QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
+QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
+QMAKE_LFLAGS_RELEASE	+=
+QMAKE_LFLAGS_DEBUG	+=
+QMAKE_LFLAGS_APP	+=
+QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
+QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
+
+QMAKE_PCH_OUTPUT_EXT    = .gch
+
+# -Bsymbolic-functions (ld) support
+QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
+QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
+
+# some linking helper...
+CONFIG += rpath_libdirs
+
+# for the SDK
+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
new file mode 100644
index 0000000..a541355
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
@@ -0,0 +1,66 @@
+#
+# qmake configuration for common linux
+#
+
+QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
+QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
+
+QMAKE_INCDIR          =
+QMAKE_LIBDIR          =
+QMAKE_INCDIR_X11      =
+QMAKE_LIBDIR_X11      =
+QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
+QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
+QMAKE_INCDIR_OPENGL   =
+QMAKE_LIBDIR_OPENGL   =
+QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
+QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
+QMAKE_INCDIR_EGL      =
+QMAKE_LIBDIR_EGL      =
+QMAKE_INCDIR_OPENVG   =
+QMAKE_LIBDIR_OPENVG   =
+
+
+QMAKE_LIBS            =
+QMAKE_LIBS_DYNLOAD    = -ldl
+QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
+QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
+QMAKE_LIBS_NIS        = -lnsl
+QMAKE_LIBS_EGL        = -lEGL
+QMAKE_LIBS_OPENGL     = -lGLU -lGL
+QMAKE_LIBS_OPENGL_QT  = -lGL
+QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
+QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
+QMAKE_LIBS_OPENVG     = -lOpenVG
+QMAKE_LIBS_THREAD     = -lpthread
+
+QMAKE_MOC             = $(OE_QMAKE_MOC)
+QMAKE_UIC             = $(OE_QMAKE_UIC)
+QMAKE_UIC3            = $(OE_QMAKE_UIC3)
+QMAKE_RCC             = $(OE_QMAKE_RCC)
+QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
+QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
+
+QMAKE_AR              = $(OE_QMAKE_AR) cqs
+QMAKE_OBJCOPY         = objcopy
+QMAKE_RANLIB          =
+
+QMAKE_TAR             = tar -cf
+QMAKE_GZIP            = gzip -9f
+
+QMAKE_COPY            = cp -f
+QMAKE_COPY_FILE       = $(COPY)
+QMAKE_COPY_DIR        = $(COPY) -r
+QMAKE_MOVE            = mv -f
+QMAKE_DEL_FILE        = rm -f
+QMAKE_DEL_DIR         = rmdir
+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
+QMAKE_STRIPFLAGS_LIB += --strip-unneeded
+QMAKE_CHK_DIR_EXISTS  = test -d
+QMAKE_MKDIR           = mkdir -p
+QMAKE_INSTALL_FILE    = install -m 644 -p
+QMAKE_INSTALL_PROGRAM = install -m 755 -p
+
+include(unix.conf)
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
new file mode 100644
index 0000000..21d6ecb
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ -e /dev/input/touchscreen0 ]
+then
+    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
+    export QWS_MOUSE_PROTO
+fi
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
new file mode 100644
index 0000000..187de73
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
@@ -0,0 +1,11 @@
+require qt4-${PV}.inc
+require qt4-embedded.inc
+
+PR = "${INC_PR}.0"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -exceptions \
+"
+
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
new file mode 100644
index 0000000..0f93187
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
@@ -0,0 +1,10 @@
+require qt4-native.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "${INC_PR}.0"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
+SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
new file mode 100644
index 0000000..bedd201
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
@@ -0,0 +1,11 @@
+require qt4-x11-free.inc
+require qt4-${PV}.inc
+
+PR = "${INC_PR}.0"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -no-embedded \
+ -xrandr \
+ -x11"
-- 
1.7.12



