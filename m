Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgNDf-0001AM-RC
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 23:13:32 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3182827eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ja19TaEPBYy2dPM4chUMaNBwzShOgkKiqiFefbadvn0=;
	b=xjVzveVQhIjyrU+aBkynOWZbao0gqDBhu92JgUH5G3EM817zsN16f+59tBPpwwj1PB
	S1KvzJIjCaqG0bH325KhSEBroS5AWmyO1bKisdbeqqUr0afbQ2axSsIpfz02qaC0o/J9
	6BcwhjmSi/tuFJR+cPzECOpfpPI5WUnDy62VnnolZfJvqSk7gESETvSX56Ws03ZTfa2T
	aZ28cKfJFgBmM0S0eybdl9iiMazGlD3zOSUbVJZ3EvGyCcqg4en6c/oDBlwu5237LALl
	BskQWhGz/DQpyV8Opz6K18pxdk4yNFxUgNe5TjsLV7O3SrgV9btR8do91NmK2zyLbTrU
	RQ7A==
Received: by 10.14.225.72 with SMTP id y48mr64719083eep.46.1354744747601;
	Wed, 05 Dec 2012 13:59:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm11804310eeo.7.2012.12.05.13.59.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:59:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:59:01 +0100
Message-Id: <1354744742-31355-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 1/2] qt4: upgrade to 4.8.4
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
X-List-Received-Date: Wed, 05 Dec 2012 22:13:32 -0000

* changes in licenses are only s/Nokia/Digia/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

It was only build tested for now (qt4-x11-free, qt4-embedded,
nativesdk-qt4-tools) and it's only bugfix release, but please
test it a bit more before merging.

Sending it now for others to test it very throroughly while
I'm for skiing vacation :).

---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |  4 ++--
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb   |  8 --------
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb   |  8 ++++++++
 .../qt4/{qt4-4.8.3.inc => qt4-4.8.4.inc}           |  8 ++++----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  8 ++++----
 ...tty_qws-fix-build-with-old-kernel-headers.patch |  8 ++++----
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |  6 +++---
 ...make-is-already-built-in-qt4-tools-native.patch |  8 ++++----
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |  8 ++++----
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch | 10 +++++-----
 ...-const-usage-that-causes-compile-failure-.patch | 10 +++++-----
 ...llow-building-a-separate-qmake-for-the-ta.patch |  6 +++---
 ...e-fix-source-file-references-in-qmake.pri.patch |  6 +++---
 ...ack-to-not-use-the-pg_config-of-the-host-.patch | 10 +++++-----
 .../0011-freetype-host-includes.patch              |  6 +++---
 .../0012-Add-2bpp-support.patch                    | 16 ++++++++--------
 .../0013-configure-add-crossarch-option.patch      | 14 +++++++-------
 ...tions-fix-phony-translation-linking-error.patch |  6 +++---
 ...-configure-add-nostrip-for-debug-packages.patch |  8 ++++----
 .../0016-configure-eval-QMAKE_CXX.patch            | 17 +++++++++--------
 ...nsure-we-identify-the-compiler-as-g-in-co.patch | 10 +++++-----
 ...ure-make-pulseaudio-a-configurable-option.patch | 12 ++++++------
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |  6 +++---
 ...0020-webkit-disable-the-fuse-ld-gold-flag.patch |  6 +++---
 ...ke-qt4-native-work-with-long-building-pa.patch} | 22 +++++++++++++++++-----
 .../qt4/{qt4-4.8.3 => qt4-4.8.4}/g++.conf          |  0
 .../qt4/{qt4-4.8.3 => qt4-4.8.4}/linux.conf        |  0
 .../recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/qte.sh |  0
 ...qt4-embedded_4.8.3.bb => qt4-embedded_4.8.4.bb} |  0
 meta/recipes-qt/qt4/qt4-native.inc                 |  6 +++---
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |  8 --------
 meta/recipes-qt/qt4/qt4-native_4.8.4.bb            |  8 ++++++++
 ...qt4-x11-free_4.8.3.bb => qt4-x11-free_4.8.4.bb} |  0
 33 files changed, 133 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
 create mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
 rename meta/recipes-qt/qt4/{qt4-4.8.3.inc => qt4-4.8.4.inc} (88%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (88%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch (78%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch (82%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (82%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch (84%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch (82%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (92%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch (87%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0011-freetype-host-includes.patch (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0012-Add-2bpp-support.patch (97%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0013-configure-add-crossarch-option.patch (83%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0014-translations-fix-phony-translation-linking-error.patch (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0015-configure-add-nostrip-for-debug-packages.patch (82%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0016-configure-eval-QMAKE_CXX.patch (72%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch (84%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0018-configure-make-pulseaudio-a-configurable-option.patch (90%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch (95%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/0020-webkit-disable-the-fuse-ld-gold-flag.patch (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch => qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch} (89%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.3.bb => qt4-embedded_4.8.4.bb} (100%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.3.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.4.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.3.bb => qt4-x11-free_4.8.4.bb} (100%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 1199a8a..85c7eab 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -23,8 +23,8 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
+                    file://LICENSE.GPL3;md5=6e1694ee338db410417517884918d4d2 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
 
 require qt4_arch.inc
 
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
deleted file mode 100644
index 51afe13..0000000
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nativesdk-qt4-tools.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
-
-SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
-SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
new file mode 100644
index 0000000..27d58d1
--- /dev/null
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
@@ -0,0 +1,8 @@
+require nativesdk-qt4-tools.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
+
+SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
+SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3.inc b/meta/recipes-qt/qt4/qt4-4.8.4.inc
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-4.8.3.inc
rename to meta/recipes-qt/qt4/qt4-4.8.4.inc
index 4b80c6c..08173a1 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -1,7 +1,7 @@
 LICENSE = "LGPLv2.1 | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
+                    file://LICENSE.GPL3;md5=6e1694ee338db410417517884918d4d2 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
@@ -25,8 +25,8 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
-SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
+SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
+SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 88%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index e7eb52c..d8b0a09 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From 89349d565cf03f3a2c09fe235ac6c75e415859bd Mon Sep 17 00:00:00 2001
+From 55097d27e8b746b3d5ff437939caf1fa43c0d62b Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 01/20] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 01/21] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -16,7 +16,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 91d2dfc..41045b3 100644
+index 180dc39..4adad35 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
 @@ -54,6 +54,7 @@
@@ -39,5 +39,5 @@ index 91d2dfc..41045b3 100644
      if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
  #ifdef Q_OS_MAC
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
index fbda9c4..98fc887 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
@@ -1,7 +1,7 @@
-From fe15b966616cc2d2f2f071474a3414fd03ee473e Mon Sep 17 00:00:00 2001
+From 5e6b1051afa3099a02a758b0596236759d70670e Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 26 Sep 2012 20:18:08 +0200
-Subject: [PATCH 02/20] qkbdtty_qws: fix build with old kernel headers
+Subject: [PATCH 02/21] qkbdtty_qws: fix build with old kernel headers
 
 This issue is that with C++ compiler process an old version of kernel
 header file, coincidently that file has a variable named 'new':
@@ -21,7 +21,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/src/gui/embedded/qkbdtty_qws.cpp b/src/gui/embedded/qkbdtty_qws.cpp
-index c629fa3..47fd3f7 100644
+index a46811b..762138f 100644
 --- a/src/gui/embedded/qkbdtty_qws.cpp
 +++ b/src/gui/embedded/qkbdtty_qws.cpp
 @@ -54,8 +54,20 @@
@@ -46,5 +46,5 @@ index c629fa3..47fd3f7 100644
  #  include "qwindowsystem_qws.h"
  #  include "qapplication.h"
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
index 66a7db1..ecaea51 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
@@ -1,7 +1,7 @@
-From f7eb6d336d30da7b8193f1d1ab6142293e3966da Mon Sep 17 00:00:00 2001
+From b6805e883c078f7647d9234aca4e3513ebd1c9bf Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 May 2012 07:48:15 +0200
-Subject: [PATCH 03/20] webkit2: set OUTPUT_DIR value if empty
+Subject: [PATCH 03/21] webkit2: set OUTPUT_DIR value if empty
 
 Without this do_configure was trying to create /include/WebCore/libdummy.prl in root of build host filesystem
 now it's in proper place ${WORKDIR}/qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/include/WebCore/libdummy.prl
@@ -30,5 +30,5 @@ index 006a88c..5e17193 100644
      isEmpty(WEBKIT2_GENERATED_SOURCES_DIR):WEBKIT2_GENERATED_SOURCES_DIR = $$PWD/generated
      isEmpty(WC_GENERATED_SOURCES_DIR):WC_GENERATED_SOURCES_DIR = $$PWD/../WebCore/generated
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
similarity index 78%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
index 56bb8c3..1eb8a58 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
@@ -1,7 +1,7 @@
-From 53a20e5f7f790d047b67b1631e1d4acc9a86906a Mon Sep 17 00:00:00 2001
+From af699c6e8cf9fb28d6f8b789bf33d53b47edaec7 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Wed, 26 Sep 2012 20:24:20 +0200
-Subject: [PATCH 04/20] configure: qmake is already built in qt4-tools-native,
+Subject: [PATCH 04/21] configure: qmake is already built in qt4-tools-native,
  so disable it
 
 Upstream-Status: Inappropriate [configuration]
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index d19f443..59bdb63 100755
+index e3d464b..cc04b27 100755
 --- a/configure
 +++ b/configure
 @@ -4899,7 +4899,7 @@ setBootstrapVariable()
@@ -25,5 +25,5 @@ index d19f443..59bdb63 100755
  
      OLD_QCONFIG_H=
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
index 4e310c2..1a8f2b7 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
@@ -1,7 +1,7 @@
-From 5641d763180e7f848f5d39588417292b6b8df88e Mon Sep 17 00:00:00 2001
+From ac93237bc90ea7773c0ef5275962baba01d4a9c7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
 Date: Wed, 26 Sep 2012 20:27:44 +0200
-Subject: [PATCH 05/20] configure: set LFLAGS to pick up zlib from staging
+Subject: [PATCH 05/21] configure: set LFLAGS to pick up zlib from staging
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 59bdb63..cc08b71 100755
+index cc04b27..5a7c4ee 100755
 --- a/configure
 +++ b/configure
 @@ -690,7 +690,7 @@ fi
@@ -24,5 +24,5 @@ index 59bdb63..cc08b71 100755
      qmakevarname="${varname}"
      # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
index 21d5b4d..90ebf75 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
@@ -1,7 +1,7 @@
-From fa9e376ff72f488608c8fc635ec669fc00c3c1ea Mon Sep 17 00:00:00 2001
+From 0bc0db83812b5900dc4e6ffa96bdeab46b6adcae Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:29:09 +0200
-Subject: [PATCH 06/20] configure: Use OE_QMAKE_* values to specify Qt utility
+Subject: [PATCH 06/21] configure: Use OE_QMAKE_* values to specify Qt utility
  paths
 
 Upstream-Status: Inappropriate [configuration]
@@ -13,10 +13,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/configure b/configure
-index cc08b71..958b884 100755
+index 5a7c4ee..db4d044 100755
 --- a/configure
 +++ b/configure
-@@ -8612,11 +8612,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
+@@ -8683,11 +8683,11 @@ QMAKE_ABSOLUTE_SOURCE_ROOT = \$\$QT_SOURCE_TREE
  QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
  
  #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
@@ -34,5 +34,5 @@ index cc08b71..958b884 100755
  QMAKE_LIBDIR_QT  = \$\$QT_BUILD_TREE/lib
  
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
similarity index 84%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
index 1ce3dbb..7d3b336 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
@@ -1,7 +1,7 @@
-From db3c7b5710ee14280b51c355487dabe21eff60b4 Mon Sep 17 00:00:00 2001
+From 2011bb8029480af1d1266f258e5a5f5cef7392d3 Mon Sep 17 00:00:00 2001
 From: Pavel Heimlich <tropikhajma@gmail.com>
 Date: Wed, 26 Sep 2012 20:31:10 +0200
-Subject: [PATCH 07/20] dbus: Remove "const" usage that causes compile failure
+Subject: [PATCH 07/21] dbus: Remove "const" usage that causes compile failure
  building nativesdk-qt4-tools
 
 Patch has apparently been rejected upstream, not because it is invalid
@@ -17,10 +17,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dbus/qdbusintegrator.cpp b/src/dbus/qdbusintegrator.cpp
-index 0bf62de..e53620f 100644
+index 0f0b647..aa4cbab 100644
 --- a/src/dbus/qdbusintegrator.cpp
 +++ b/src/dbus/qdbusintegrator.cpp
-@@ -72,7 +72,7 @@ QT_BEGIN_NAMESPACE
+@@ -73,7 +73,7 @@ QT_BEGIN_NAMESPACE
  static bool isDebugging;
  #define qDBusDebug              if (!::isDebugging); else qDebug
  
@@ -30,5 +30,5 @@ index 0bf62de..e53620f 100644
  static inline QString dbusServiceString()
  { return *orgFreedesktopDBusString(); }
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
index d945025..ec07f41 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
@@ -1,7 +1,7 @@
-From dacee47b11fc7cf89cdb8ddeeac9e6b64320ec8b Mon Sep 17 00:00:00 2001
+From 64ce5d0e7c19436b928a2a0d9d192f56be3c9bb2 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:32:41 +0200
-Subject: [PATCH 08/20] qmake.pro: Allow building a separate qmake for the
+Subject: [PATCH 08/21] qmake.pro: Allow building a separate qmake for the
  target
 
 Upstream-Status: Inappropriate [config]
@@ -25,5 +25,5 @@ index 38e0fce..53b1ffb 100644
  OBJECTS_DIR = .
  MOC_DIR = .
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0009-qmake-fix-source-file-references-in-qmake.pri.patch
similarity index 92%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0009-qmake-fix-source-file-references-in-qmake.pri.patch
index 9616a5b..45b8c10 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0009-qmake-fix-source-file-references-in-qmake.pri.patch
@@ -1,7 +1,7 @@
-From 08ec0f7ac7438e6f5b506b23fb52fe086078308b Mon Sep 17 00:00:00 2001
+From e129dc0d6cde69dd15d1836c4111e0526fc29161 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:33:49 +0200
-Subject: [PATCH 09/20] qmake: fix source file references in qmake.pri
+Subject: [PATCH 09/21] qmake: fix source file references in qmake.pri
 
 Fix duplicate entries in SOURCES and HEADERS, and fix the source file
 list for the split of qlocale.cpp.
@@ -48,5 +48,5 @@ index 31f67f4..9081669 100644
          qmap.cpp \
          qmetatype.cpp \
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
similarity index 87%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
index f3674e8..1d2ddab 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
@@ -1,7 +1,7 @@
-From d9544b4a079f3c66d15f973c5d1526df2fe49d40 Mon Sep 17 00:00:00 2001
+From 4888791d1899f781af710dd8813887dea52fda59 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 20:36:38 +0200
-Subject: [PATCH 10/20] configure: Hack to not use the pg_config of the host
+Subject: [PATCH 10/21] configure: Hack to not use the pg_config of the host
  system which will add /usr/include
 
 pg_config is a native binary so using that when cross compiling
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 958b884..24cbb2a 100755
+index db4d044..35a8fe7 100755
 --- a/configure
 +++ b/configure
-@@ -5441,10 +5441,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
+@@ -5511,10 +5511,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
          psql)
              if [ "$CFG_SQL_psql" != "no" ]; then
                  # Be careful not to use native pg_config when cross building.
@@ -38,5 +38,5 @@ index 958b884..24cbb2a 100755
                  [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
                  # But, respect PSQL_LIBS if set
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0011-freetype-host-includes.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0011-freetype-host-includes.patch
index 60acb80..e0879c5 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0011-freetype-host-includes.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0011-freetype-host-includes.patch
@@ -1,7 +1,7 @@
-From 95cbbdaaf543bb5747b535b5e4b02114f3d821d6 Mon Sep 17 00:00:00 2001
+From 3fcffa79e6a5f0448cbfe2bb33fe1218f5dae61d Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH 11/20] freetype host includes
+Subject: [PATCH 11/21] freetype host includes
 
 Host include path should not be used in cross compiling case.
 
@@ -25,5 +25,5 @@ index 7ef1cf9..b362fcd 100644
      linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
      for(p, TRY_INCLUDEPATHS) {
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0012-Add-2bpp-support.patch
similarity index 97%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0012-Add-2bpp-support.patch
index 019b9f4..8402eab 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0012-Add-2bpp-support.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0012-Add-2bpp-support.patch
@@ -1,7 +1,7 @@
-From a8233fddb36592361910d967664e5b546ac4cc3e Mon Sep 17 00:00:00 2001
+From 8744273fc452eb54bbeeb7d15823009ce926c6fa Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
 Date: Wed, 26 Sep 2012 20:39:21 +0200
-Subject: [PATCH 12/20] Add 2bpp support
+Subject: [PATCH 12/21] Add 2bpp support
 
 Submitted upstream but rejected as being "out of scope":
 http://bugreports.qt.nokia.com/browse/QTBUG-3468
@@ -16,10 +16,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  3 files changed, 216 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 24cbb2a..cd66d05 100755
+index 35a8fe7..79c1c7b 100755
 --- a/configure
 +++ b/configure
-@@ -6999,6 +6999,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+@@ -7063,6 +7063,7 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
      echo "Choose pixel-depths to support:"
      echo
      echo "   1. 1bpp, black/white"
@@ -27,7 +27,7 @@ index 24cbb2a..cd66d05 100755
      echo "   4. 4bpp, grayscale"
      echo "   8. 8bpp, paletted"
      echo "  12. 12bpp, rgb 4-4-4"
-@@ -7017,11 +7018,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
+@@ -7081,11 +7082,11 @@ if [ "$CFG_QWS_DEPTHS" = "prompted" -a "$PROMPT_FOR_DEPTHS" = "yes" ]; then
  fi
  if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
      if [ "$CFG_QWS_DEPTHS" = "all" ]; then
@@ -42,7 +42,7 @@ index 24cbb2a..cd66d05 100755
  	esac
      done
 diff --git a/src/gui/embedded/qscreen_qws.cpp b/src/gui/embedded/qscreen_qws.cpp
-index d2ad851..d25fc87 100644
+index b307bf2..88950b3 100644
 --- a/src/gui/embedded/qscreen_qws.cpp
 +++ b/src/gui/embedded/qscreen_qws.cpp
 @@ -469,6 +469,58 @@ static void solidFill_gray4(QScreen *screen, const QColor &color,
@@ -299,7 +299,7 @@ index d2ad851..d25fc87 100644
      } else if(d==4) {
          return true;
 diff --git a/src/gui/embedded/qscreenlinuxfb_qws.cpp b/src/gui/embedded/qscreenlinuxfb_qws.cpp
-index 04abcd4..06dea6d 100644
+index 6f3caad..14159ee 100644
 --- a/src/gui/embedded/qscreenlinuxfb_qws.cpp
 +++ b/src/gui/embedded/qscreenlinuxfb_qws.cpp
 @@ -466,8 +466,8 @@ bool QLinuxFbScreen::connect(const QString &displaySpec)
@@ -314,5 +314,5 @@ index 04abcd4..06dea6d 100644
          ::fb_cmap startcmap;
          startcmap.start=0;
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0013-configure-add-crossarch-option.patch
similarity index 83%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0013-configure-add-crossarch-option.patch
index c216c85..aa464fd 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0013-configure-add-crossarch-option.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0013-configure-add-crossarch-option.patch
@@ -1,7 +1,7 @@
-From 8785f376533ffdcf4c32b53274e8c40f567d7fd5 Mon Sep 17 00:00:00 2001
+From 549342fa380ed2a9ad41be3d04ee2f0585f6a465 Mon Sep 17 00:00:00 2001
 From: Michael Lauer <mickey@vanille-media.de>
 Date: Wed, 26 Sep 2012 20:41:32 +0200
-Subject: [PATCH 13/20] configure: add "-crossarch" option
+Subject: [PATCH 13/21] configure: add "-crossarch" option
 
 Upstream-Status: Pending
 
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index cd66d05..f2c0725 100755
+index 79c1c7b..7983c3d 100755
 --- a/configure
 +++ b/configure
-@@ -1141,7 +1141,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1153,7 +1153,7 @@ while [ "$#" -gt 0 ]; do
          shift
          VAL=$1
          ;;
@@ -23,7 +23,7 @@ index cd66d05..f2c0725 100755
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          shift
          VAL="$1"
-@@ -1697,6 +1697,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1709,6 +1709,9 @@ while [ "$#" -gt 0 ]; do
          DEV_VAL=`echo $VAL | sed "s,^.*=\(.*\),\1,"`
          DeviceVar set $DEV_VAR $DEV_VAL
          ;;
@@ -33,7 +33,7 @@ index cd66d05..f2c0725 100755
      debug-and-release)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_DEBUG_RELEASE="$VAL"
-@@ -3297,6 +3300,8 @@ arm*)
+@@ -3324,6 +3327,8 @@ arm*)
      ;;
  esac
  
@@ -43,5 +43,5 @@ index cd66d05..f2c0725 100755
      if [ "$OPT_VERBOSE" = "yes" ]; then
          echo "    '$CFG_ARCH' is supported"
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0014-translations-fix-phony-translation-linking-error.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0014-translations-fix-phony-translation-linking-error.patch
index 0874c84..66724a8 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0014-translations-fix-phony-translation-linking-error.patch
@@ -1,7 +1,7 @@
-From 851eb73f7c2d3fa8dc017c3fb4f448b522cd9873 Mon Sep 17 00:00:00 2001
+From 21af8f6d21b28a53041affb11b58d6316023fa92 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 26 Sep 2012 20:45:10 +0200
-Subject: [PATCH 14/20] translations: fix phony translation linking error
+Subject: [PATCH 14/21] translations: fix phony translation linking error
 
   | .../usr/lib/crt1.o: In function `_start':
   | .../../sysdeps/i386/elf/start.S:115: undefined reference to `main'
@@ -37,5 +37,5 @@ index dc99beb..0d98829 100644
      phony_src.CONFIG += combine
      QMAKE_EXTRA_COMPILERS += phony_src
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0015-configure-add-nostrip-for-debug-packages.patch
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0015-configure-add-nostrip-for-debug-packages.patch
index fc13b08..b5db491 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0015-configure-add-nostrip-for-debug-packages.patch
@@ -1,7 +1,7 @@
-From 1c42c9c5f02845ea4c5b82638b7b2ed4d3dca0ff Mon Sep 17 00:00:00 2001
+From 9250fed086a4a8a645a972764a9bf34e4566ec2e Mon Sep 17 00:00:00 2001
 From: Fathi Boudra <fabo@debian.org>
 Date: Wed, 26 Sep 2012 20:46:14 +0200
-Subject: [PATCH 15/20] configure: add nostrip for debug packages
+Subject: [PATCH 15/21] configure: add nostrip for debug packages
 
 Qt is built in release mode and strip files by default.
 Set CONFIG+=nostrip to avoid the stripping and
@@ -15,7 +15,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index f2c0725..d1a0dfd 100755
+index 7983c3d..d02824b 100755
 --- a/configure
 +++ b/configure
 @@ -710,6 +710,8 @@ mkdir -p "$outpath/config.tests"
@@ -28,5 +28,5 @@ index f2c0725..d1a0dfd 100755
  QMakeVar add decorations "default windows styled"
  QMakeVar add mouse-drivers "pc"
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0016-configure-eval-QMAKE_CXX.patch
similarity index 72%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0016-configure-eval-QMAKE_CXX.patch
index 87966be..9c3de47 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0016-configure-eval-QMAKE_CXX.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0016-configure-eval-QMAKE_CXX.patch
@@ -1,7 +1,7 @@
-From ec9d722e08c636e0c672b0adc3b54569367c6502 Mon Sep 17 00:00:00 2001
+From 8403634a71f067eec514b6d2193cf41e281dff8e Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:47:08 +0200
-Subject: [PATCH 16/20] configure: eval QMAKE_CXX
+Subject: [PATCH 16/21] configure: eval QMAKE_CXX
 
 Allow expansion of $(...) references in QMAKE_CXX (currently its value
 is $(OE_QMAKE_CXX)) in order to allow compiler version check to succeed
@@ -15,22 +15,23 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Conflicts:
 	configure
 ---
- configure | 2 ++
- 1 file changed, 2 insertions(+)
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index d1a0dfd..9f59e1a 100755
+index d02824b..891d6e7 100755
 --- a/configure
 +++ b/configure
-@@ -3438,6 +3438,7 @@ else
+@@ -3409,7 +3409,8 @@ else
+     CFG_FRAMEWORK=no
  fi
  
 -QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
-+QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'` 
++QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
 +QMAKE_CONF_COMPILER=`eval "echo $QMAKE_CONF_COMPILER"`
  TEST_COMPILER="$CXX"
  
  [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
similarity index 84%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
index ef32932..9471966 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
@@ -1,7 +1,7 @@
-From 5945025c96fd25880565819881b8ef48e1baa3ce Mon Sep 17 00:00:00 2001
+From d2bb701b551402f0befddd0e906423596bdc0df7 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Wed, 26 Sep 2012 20:48:37 +0200
-Subject: [PATCH 17/20] configure: ensure we identify the compiler as g++ in
+Subject: [PATCH 17/21] configure: ensure we identify the compiler as g++ in
  configure
 
 Our PLATFORM in OE is ${TARGET_OS}-oe-g++, and previously the configure
@@ -28,10 +28,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/configure b/configure
-index 9f59e1a..6989962 100755
+index 891d6e7..7031898 100755
 --- a/configure
 +++ b/configure
-@@ -7527,6 +7527,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
+@@ -7592,6 +7592,9 @@ elif [ "$XPLATFORM" != "$PLATFORM" ]; then
  else
      COMPILER=`echo $PLATFORM | cut -f 2- -d-`
  fi
@@ -42,5 +42,5 @@ index 9f59e1a..6989962 100755
      CFG_EXCEPTIONS=no
  fi
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0018-configure-make-pulseaudio-a-configurable-option.patch
similarity index 90%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0018-configure-make-pulseaudio-a-configurable-option.patch
index f3c17a5..19cdd4c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0018-configure-make-pulseaudio-a-configurable-option.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0018-configure-make-pulseaudio-a-configurable-option.patch
@@ -1,7 +1,7 @@
-From 5da434f2a61ca819ff9a9b0a84de8c2307f9d41b Mon Sep 17 00:00:00 2001
+From d6dc1a7d6594d7e395347732a3e553fc82ccab3d Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 18/20] configure: make pulseaudio a configurable option
+Subject: [PATCH 18/21] configure: make pulseaudio a configurable option
 
 Allows disabling pulseaudio support within phonon at configure time.
 (This is the Qt 4.8.0 version.)
@@ -15,10 +15,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 6989962..58fcedd 100755
+index 7031898..a4a42f1 100755
 --- a/configure
 +++ b/configure
-@@ -1127,7 +1127,7 @@ while [ "$#" -gt 0 ]; do
+@@ -1139,7 +1139,7 @@ while [ "$#" -gt 0 ]; do
          VAL=no
          ;;
      #Qt style yes options
@@ -27,7 +27,7 @@ index 6989962..58fcedd 100755
          VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
          VAL=yes
          ;;
-@@ -2101,6 +2101,13 @@ while [ "$#" -gt 0 ]; do
+@@ -2120,6 +2120,13 @@ while [ "$#" -gt 0 ]; do
              UNKNOWN_OPT=yes
          fi
          ;;
@@ -42,5 +42,5 @@ index 6989962..58fcedd 100755
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_QGTKSTYLE="$VAL"
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
similarity index 95%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
index 9f4adab..a83d247 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
@@ -1,7 +1,7 @@
-From 915ea240e03f04c6ae788cf369b13afe5d9bfc45 Mon Sep 17 00:00:00 2001
+From 1f1da2f24d3028b250dbc2e98e2b7e37862b3771 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 26 Sep 2012 20:54:38 +0200
-Subject: [PATCH 19/20] Fixes for gcc 4.7.0, particularly on qemux86
+Subject: [PATCH 19/21] Fixes for gcc 4.7.0, particularly on qemux86
 
 Origin: upstream, http://trac.webkit.org/changeset/93631
 Origin: upstream, http://trac.webkit.org/changeset/113848
@@ -59,5 +59,5 @@ index 6087ec3..6d748f6 100644
      virtual void tiledBackingStorePaint(GraphicsContext*, const IntRect&) = 0;
      virtual void tiledBackingStorePaintEnd(const Vector<IntRect>& paintedArea) = 0;
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0020-webkit-disable-the-fuse-ld-gold-flag.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0020-webkit-disable-the-fuse-ld-gold-flag.patch
index 1e07a54..92eddeb 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0020-webkit-disable-the-fuse-ld-gold-flag.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0020-webkit-disable-the-fuse-ld-gold-flag.patch
@@ -1,7 +1,7 @@
-From a10ba547001f4a4ba0ae313a4e9c2c0b5bb36a09 Mon Sep 17 00:00:00 2001
+From d90b496f9ffdc828928ef84afad43260ea67ec1f Mon Sep 17 00:00:00 2001
 From: Ken Werner <ken.werner@linaro.org>
 Date: Wed, 26 Sep 2012 20:55:21 +0200
-Subject: [PATCH 20/20] webkit: disable the -fuse-ld=gold flag
+Subject: [PATCH 20/21] webkit: disable the -fuse-ld=gold flag
 
 This option is a Debian/Ubuntu specific extension to the g++ and causes upstream GCC to throw an error.
 
@@ -37,5 +37,5 @@ index 0f62e14..d81a1f0 100644
  # We use this flag on production branches
  # See https://bugs.webkit.org/show_bug.cgi?id=60824
 -- 
-1.7.12
+1.8.0
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch
similarity index 89%
rename from meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
rename to meta/recipes-qt/qt4/qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch
index e004745..dbc9022 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch
@@ -1,15 +1,24 @@
+From 6742ac7ea6fd1e9c82ecb5305f84e721242f857d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 5 Dec 2012 07:48:15 +0200
+Subject: [PATCH 21/21] configure: make qt4-native work with long building
+ path.
+
 Upstream-Status: Submitted
 
-Make qt4-native work with long building path.
 Reference: https://bugreports.qt-project.org/browse/QTBUG-28292
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure | 52 ++++++++++++++++++++++++++--------------------------
+ 1 file changed, 26 insertions(+), 26 deletions(-)
 
-Index: configure
-=====================================================================
+diff --git a/configure b/configure
+index a4a42f1..2358563 100755
 --- a/configure
 +++ b/configure
-@@ -4764,8 +4764,8 @@ DEMOS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_demopath=$QT_INST
+@@ -4779,8 +4779,8 @@ DEMOS_PATH_STR=`"$relpath/config.tests/unix/padstring" 268 "qt_demopath=$QT_INST
  TODAY=`date +%Y-%m-%d`
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
@@ -20,7 +29,7 @@ Index: configure
  
  /* Installation date */
  static const char qt_configure_installation          [12+11]    = "qt_instdate=$TODAY";
-@@ -4790,36 +4790,36 @@ if [ ! -z "$QT_HOST_PREFIX" ]; then
+@@ -4805,36 +4805,36 @@ if [ ! -z "$QT_HOST_PREFIX" ]; then
  
  #if defined(QT_BOOTSTRAPPED) || defined(QT_BUILD_QMAKE)
  /* Installation Info */
@@ -81,3 +90,6 @@ Index: configure
  EOF
  
  if [ ! -z "$QT_HOST_PREFIX" ]; then
+-- 
+1.8.0
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.3/g++.conf
rename to meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.4/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.3/linux.conf
rename to meta/recipes-qt/qt4/qt4-4.8.4/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.4/qte.sh
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.3/qte.sh
rename to meta/recipes-qt/qt4/qt4-4.8.4/qte.sh
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-embedded_4.8.3.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 0dab364..7645232 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -6,8 +6,8 @@ PROVIDES = "qt4-tools-native"
 
 LICENSE = "LGPLv2.1 | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
+                    file://LICENSE.GPL3;md5=6e1694ee338db410417517884918d4d2 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
 
 INC_PR = "r19"
 
@@ -17,7 +17,7 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
-           file://0001-make-qt4-native-work-with-long-building-path.patch \
+           file://0021-configure-make-qt4-native-work-with-long-building-pa.patch \
            file://g++.conf \
            file://linux.conf \
 	"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb b/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
deleted file mode 100644
index afae0ae..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.8.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-native.inc
-
-PR = "${INC_PR}.0"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "a663b6c875f8d7caa8ac9c30e4a4ec3b"
-SRC_URI[sha256sum] = "f1f72974f924861be04019f49f07cd43ab3c95056db2ba8f34b283487cccc728"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.4.bb b/meta/recipes-qt/qt4/qt4-native_4.8.4.bb
new file mode 100644
index 0000000..3932b3c
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.4.bb
@@ -0,0 +1,8 @@
+require qt4-native.inc
+
+PR = "${INC_PR}.0"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
+SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.3.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
-- 
1.8.0



