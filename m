Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (unknown [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAF8D6FB85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 10:49:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 28 May 2014 03:45:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,927,1392192000"; d="scan'208";a="538858349"
Received: from drewstep-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.232])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2014 03:49:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 11:49:29 +0100
Message-Id: <aad80ad2cb21561ecf519ce367061fd8f50e1f57.1401274062.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1401274062.git.paul.eggleton@linux.intel.com>
References: <cover.1401274062.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1401274062.git.paul.eggleton@linux.intel.com>
References: <cover.1401274062.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/2] qt4: upgrade to version 4.8.6
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
X-List-Received-Date: Wed, 28 May 2014 10:49:47 -0000

* Remove patches merged upstream
* Add a qtscript translation package for an additional .qm file added in
  this release

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...tools_4.8.5.bb => nativesdk-qt4-tools_4.8.6.bb} |   4 +-
 ...0020-webkit-disable-the-fuse-ld-gold-flag.patch |  41 ------
 ...-of-0-width-polylines-from-outside-the-de.patch | 148 ---------------------
 ...art-fix-data-corruption-in-readData-metho.patch |  43 ------
 ...Pixel.y-is-also-initalized-to-1-when-nece.patch |  48 -------
 ...ned-selection-region-with-text-when-cente.patch |  75 -----------
 .../qt4/{qt4-4.8.5.inc => qt4-4.8.6.inc}           |   9 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   0
 ...tty_qws-fix-build-with-old-kernel-headers.patch |   0
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   0
 ...make-is-already-built-in-qt4-tools-native.patch |   0
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   0
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |   0
 ...-const-usage-that-causes-compile-failure-.patch |   0
 ...llow-building-a-separate-qmake-for-the-ta.patch |   0
 ...e-fix-source-file-references-in-qmake.pri.patch |   0
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |   0
 .../0011-freetype-host-includes.patch              |   0
 .../0012-Add-2bpp-support.patch                    |   0
 .../0013-configure-add-crossarch-option.patch      |   0
 ...tions-fix-phony-translation-linking-error.patch |   0
 ...-configure-add-nostrip-for-debug-packages.patch |   0
 .../0016-configure-eval-QMAKE_CXX.patch            |   0
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |   0
 ...ure-make-pulseaudio-a-configurable-option.patch |   0
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   0
 ...ake-qt4-native-work-with-long-building-pa.patch |   0
 ...ls.pro-disable-qmeegographicssystemhelper.patch |   0
 .../qt4/{qt4-4.8.5 => qt4-4.8.6}/g++.conf          |   0
 .../qt4/{qt4-4.8.5 => qt4-4.8.6}/linux.conf        |   0
 .../recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/qte.sh |   0
 ...qt4-embedded_4.8.5.bb => qt4-embedded_4.8.6.bb} |   0
 meta/recipes-qt/qt4/qt4-native_4.8.5.bb            |   6 -
 meta/recipes-qt/qt4/qt4-native_4.8.6.bb            |   6 +
 ...qt4-x11-free_4.8.5.bb => qt4-x11-free_4.8.6.bb} |   0
 meta/recipes-qt/qt4/qt4.inc                        |   2 +-
 36 files changed, 11 insertions(+), 371 deletions(-)
 rename meta/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.5.bb => nativesdk-qt4-tools_4.8.6.bb} (44%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
 rename meta/recipes-qt/qt4/{qt4-4.8.5.inc => qt4-4.8.6.inc} (82%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0011-freetype-host-includes.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0012-Add-2bpp-support.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0013-configure-add-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0014-translations-fix-phony-translation-linking-error.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0015-configure-add-nostrip-for-debug-packages.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0016-configure-eval-QMAKE_CXX.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0018-configure-make-pulseaudio-a-configurable-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0021-configure-make-qt4-native-work-with-long-building-pa.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/0027-tools.pro-disable-qmeegographicssystemhelper.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.5 => qt4-4.8.6}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.5.bb => qt4-embedded_4.8.6.bb} (100%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.5.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.6.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.5.bb => qt4-x11-free_4.8.6.bb} (100%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
similarity index 44%
rename from meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb
rename to meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
index 9e5743b..00526b8 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
@@ -2,5 +2,5 @@ require nativesdk-qt4-tools.inc
 
 SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
 
-SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
-SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
+SRC_URI[md5sum] = "2edbe4d6c2eff33ef91732602f3518eb"
+SRC_URI[sha256sum] = "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch
deleted file mode 100644
index 92eddeb..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d90b496f9ffdc828928ef84afad43260ea67ec1f Mon Sep 17 00:00:00 2001
-From: Ken Werner <ken.werner@linaro.org>
-Date: Wed, 26 Sep 2012 20:55:21 +0200
-Subject: [PATCH 20/21] webkit: disable the -fuse-ld=gold flag
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
-1.8.0
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch
deleted file mode 100644
index ad45dd0..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.5/0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From b7029fbd12c32e851ed7d81b692197176eb71d9e Mon Sep 17 00:00:00 2001
-From: Gunnar Sletta <gunnar.sletta@digia.com>
-Date: Thu, 4 Jul 2013 16:20:40 +1000
-Subject: [PATCH] Fix drawing of 0-width polylines from outside the devicerect.
-
-This was broken by a previous fix which aimed to fix gaps in
-polylines with tiny line segments. The result was that we
-skipped updating the origin point when stroke() didn't produce
-pixels which accidentally included the case of the line
-being completely outside the deviceRect. I fixed this
-by returning the value of clipLine in drawLine to the caller
-so we could still update the origin for this case.
-
-Upstream-Status: Accepted [https://codereview.qt-project.org/#change,60427]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Task-number: QTBUG-31579
-Change-Id: Iac29436f042da7658bbeaf9370351dc6f2c95065
-(cherry picked from qtbase/900cccfd459fcbdbc4aa3d313afe12cfbf68fd87)
----
- src/gui/painting/qcosmeticstroker.cpp | 42 ++++++++++++++++++++++-------------
- src/gui/painting/qcosmeticstroker_p.h |  2 +-
- 2 files changed, 27 insertions(+), 17 deletions(-)
-
-diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
-index 0061ecb..4413170 100644
---- a/src/gui/painting/qcosmeticstroker.cpp
-+++ b/src/gui/painting/qcosmeticstroker.cpp
-@@ -133,10 +133,15 @@ struct NoDasher {
- 
- };
- 
-+/*
-+ * The return value is the result of the clipLine() call performed at the start
-+ * of each of the two functions, aka "false" means completely outside the devices
-+ * rect.
-+ */
- template<DrawPixel drawPixel, class Dasher>
--static void drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+static bool drawLine(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- template<DrawPixel drawPixel, class Dasher>
--static void drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+static bool drawLineAA(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- 
- inline void drawPixel(QCosmeticStroker *stroker, int x, int y, int coverage)
- {
-@@ -602,17 +607,20 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
-                 caps |= CapEnd;
- 
-             QCosmeticStroker::Point last = this->lastPixel;
--            stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
-+            bool unclipped = stroke(this, p.x(), p.y(), p2.x(), p2.y(), caps);
- 
-             /* fix for gaps in polylines with fastpen and aliased in a sequence
-                of points with small distances: if current point p2 has been dropped
--               out, keep last non dropped point p. */
--            if (fastPenAliased) {
--                if (last.x != lastPixel.x || last.y != lastPixel.y ||
--                    points == begin + 2 || points == end - 2 ) {
--                    {
--                        p = p2;
--                    }
-+               out, keep last non dropped point p.
-+
-+               However, if the line was completely outside the devicerect, we
-+               still need to update p to avoid drawing the line after this one from
-+               a bad starting position.
-+            */
-+            if (fastPenAliased && unclipped) {
-+                if (last.x != lastPixel.x || last.y != lastPixel.y
-+                    || points == begin + 2 || points == end - 2) {
-+                    p = p2;
-                 }
-             } else {
-                 p = p2;
-@@ -720,10 +728,10 @@ static inline void capAdjust(int caps, int &x1, int &x2, int &y, int yinc)
-   the drawing shifts from horizontal to vertical or back.
-   */
- template<DrawPixel drawPixel, class Dasher>
--static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
-+static bool drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
- {
-     if (stroker->clipLine(rx1, ry1, rx2, ry2))
--        return;
-+        return false;
- 
-     static const int half = 31;
-     int x1 = toF26Dot6(rx1) + half;
-@@ -813,7 +821,7 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
-     } else {
-         // horizontal
-         if (!dx)
--            return;
-+            return true;
- 
-         QCosmeticStroker::Direction dir = QCosmeticStroker::LeftToRight;
- 
-@@ -886,14 +894,15 @@ static void drawLine(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2,
-         }
-     }
-     stroker->lastPixel = last;
-+    return true;
- }
- 
- 
- template<DrawPixel drawPixel, class Dasher>
--static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
-+static bool drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx2, qreal ry2, int caps)
- {
-     if (stroker->clipLine(rx1, ry1, rx2, ry2))
--        return;
-+        return false;
- 
-     int x1 = toF26Dot6(rx1);
-     int y1 = toF26Dot6(ry1);
-@@ -967,7 +976,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
-     } else {
-         // horizontal
-         if (!dx)
--            return;
-+            return true;
- 
-         int yinc = F16Dot16FixedDiv(dy, dx);
- 
-@@ -1029,6 +1038,7 @@ static void drawLineAA(QCosmeticStroker *stroker, qreal rx1, qreal ry1, qreal rx
-             drawPixel(stroker, x, (y>>16) + 1, alpha * alphaEnd >> 6);
-         }
-     }
-+    return true;
- }
- 
- QT_END_NAMESPACE
-diff --git a/src/gui/painting/qcosmeticstroker_p.h b/src/gui/painting/qcosmeticstroker_p.h
-index 870738b..3216856 100644
---- a/src/gui/painting/qcosmeticstroker_p.h
-+++ b/src/gui/painting/qcosmeticstroker_p.h
-@@ -56,7 +56,7 @@ QT_MODULE(Gui)
- class QCosmeticStroker;
- 
- 
--typedef void (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
-+typedef bool (*StrokeLine)(QCosmeticStroker *stroker, qreal x1, qreal y1, qreal x2, qreal y2, int caps);
- 
- class QCosmeticStroker
- {
--- 
-1.8.3.2
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
deleted file mode 100644
index c3c002e..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1f40ed553e618c3b0511c7db4b4fd26c2d2b65bf Mon Sep 17 00:00:00 2001
-From: Peter Hartmann <phartmann@blackberry.com>
-Date: Thu, 25 Jul 2013 12:05:29 -0400
-Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
-
-When readData() is called repeatedly, we need to keep track which
-part of the multipart message we are currently reading from.
-Hereby we also need to take the boundary size into account, and not
-only the size of the multipart; otherwise we would skip a not
-completely read part. This would then later lead to advancing the
-read pointer by negative indexes and data loss.
-
-Upstream-Status: Accepted [https://codereview.qt-project.org/#change,61861]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Task-number: QTBUG-32534
-Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
-Reviewed-by: Jonathan Liu <net147@gmail.com>
-Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
-(cherry picked from qtbase/af96c6fed931564c95037539f07e9c8e33c69529)
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
----
- src/network/access/qhttpmultipart.cpp          |  3 +-
- tests/auto/qnetworkreply/tst_qnetworkreply.cpp | 44 ++++++++++++++++++++++++++
- 2 files changed, 46 insertions(+), 1 deletion(-)
-
-diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qhttpmultipart.cpp
-index 635129a..b25e917 100644
---- a/src/network/access/qhttpmultipart.cpp
-+++ b/src/network/access/qhttpmultipart.cpp
-@@ -488,7 +488,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qint64 maxSize)
- 
-     // skip the parts we have already read
-     while (index < multiPart->parts.count() &&
--           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size())
-+           readPointer >= partOffsets.at(index) + multiPart->parts.at(index).d->size()
-+           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes, \r\n after boundary, \r\n after multipart
-         index++;
- 
-     // read the data
--- 
-1.8.3.4
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
deleted file mode 100644
index 7825205..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0726127285413829f58618b5b82fb3e2da0c3a74 Mon Sep 17 00:00:00 2001
-From: Andy Shaw <andy.shaw@digia.com>
-Date: Tue, 8 Oct 2013 15:45:42 +0200
-Subject: [PATCH] Ensure lastPixel.y is also initalized to -1 when necessary
-
-Task-number: QTBUG-31579
-
-Upstream-Status: Accepted [https://codereview.qt-project.org/#change,67624]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Change-Id: Ia4916ac0d384ea523bbfad0dafbc90044da7ec3e
-Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
-(cherry picked from qtbase/f0b950144dde85b65df0c3cf83f7c8df0e94bbbf)
----
- src/gui/painting/qcosmeticstroker.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/gui/painting/qcosmeticstroker.cpp b/src/gui/painting/qcosmeticstroker.cpp
-index 4413170..36616d4 100644
---- a/src/gui/painting/qcosmeticstroker.cpp
-+++ b/src/gui/painting/qcosmeticstroker.cpp
-@@ -305,6 +305,7 @@ void QCosmeticStroker::setup()
-     ymax = deviceRect.bottom() + 2;
- 
-     lastPixel.x = -1;
-+    lastPixel.y = -1;
- }
- 
- // returns true if the whole line gets clipped away
-@@ -533,6 +534,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
-             QPointF p = QPointF(points[0], points[1]) * state->matrix;
-             patternOffset = state->lastPen.dashOffset()*64;
-             lastPixel.x = -1;
-+            lastPixel.y = -1;
- 
-             bool closed;
-             const QPainterPath::ElementType *e = subPath(type, end, points, &closed);
-@@ -587,6 +589,7 @@ void QCosmeticStroker::drawPath(const QVectorPath &path)
-         QPointF movedTo = p;
-         patternOffset = state->lastPen.dashOffset()*64;
-         lastPixel.x = -1;
-+        lastPixel.y = -1;
- 
-         const qreal *begin = points;
-         const qreal *end = points + 2*path.elementCount();
--- 
-1.8.4
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
deleted file mode 100644
index 964bcf8..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From c368cbad3a505d44894ff150dc25c74d0174ca15 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Wed, 23 Oct 2013 00:28:17 +1100
-Subject: [PATCH] Fix misaligned selection region with text when centered
-
-If the text is centered, the x/y position in the selection QRectF may
-be a multiple of 0.5 which is rounded up. This rounding causes
-misalignment of the selection region with the text.
-
-The alignment is fixed by using qFloor on the x and y components.
-
-Upstream-Status: Accepted [https://codereview.qt-project.org/#change,68935]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Task-number: QTBUG-34218
-Task-number: QTBUG-34234
-Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
-Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
-(cherry picked from qtbase/5d8a882c11201a29475c5ea71cfb76c9de6573f5)
----
- src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
- 1 file changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
-index 3d340cb..8d652ea 100644
---- a/src/gui/text/qtextlayout.cpp
-+++ b/src/gui/text/qtextlayout.cpp
-@@ -44,6 +44,7 @@
- 
- #include <qfont.h>
- #include <qapplication.h>
-+#include <qmath.h>
- #include <qpainter.h>
- #include <qvarlengtharray.h>
- #include <qtextformat.h>
-@@ -979,15 +980,23 @@ static void addSelectedRegionsToPath(QTextEngine *eng, int lineNumber, const QPo
-                 continue;
-             }
- 
--            if (lastSelectionWidth > 0)
--                region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
-+            if (lastSelectionWidth > 0) {
-+                QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
-+                rect.moveLeft(qFloor(rect.left()));
-+                rect.moveTop(qFloor(rect.top()));
-+                region->addRect(rect);
-+            }
- 
-             lastSelectionX = selectionX;
-             lastSelectionWidth = selectionWidth;
-         }
-     }
--    if (lastSelectionWidth > 0)
--        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight));
-+    if (lastSelectionWidth > 0) {
-+        QRectF rect = boundingRect & QRectF(lastSelectionX.toReal(), selectionY, lastSelectionWidth.toReal(), lineHeight);
-+        rect.moveLeft(qFloor(rect.left()));
-+        rect.moveTop(qFloor(rect.top()));
-+        region->addRect(rect);
-+    }
- }
- 
- static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
-@@ -2081,7 +2090,7 @@ static void setPenAndDrawBackground(QPainter *p, const QPen &defaultPen, const Q
- 
-     QBrush bg = chf.background();
-     if (bg.style() != Qt::NoBrush && !chf.property(SuppressBackground).toBool())
--        p->fillRect(r, bg);
-+        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.height()), bg);
-     if (c.style() != Qt::NoBrush) {
-         p->setPen(QPen(c, 0));
-     }
--- 
-1.8.4
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
similarity index 82%
rename from meta/recipes-qt/qt4/qt4-4.8.5.inc
rename to meta/recipes-qt/qt4/qt4-4.8.6.inc
index dcbf26f..c4dd36f 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -20,18 +20,13 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch \
            file://0018-configure-make-pulseaudio-a-configurable-option.patch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
-           file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
-           file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
-           file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
-           file://0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch \
-           file://0025-Fix-misaligned-selection-region-with-text-when-cente.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://g++.conf \
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
-SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
+SRC_URI[md5sum] = "2edbe4d6c2eff33ef91732602f3518eb"
+SRC_URI[sha256sum] = "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-references-in-qmake.pri.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0009-qmake-fix-source-file-references-in-qmake.pri.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-references-in-qmake.pri.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0011-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0012-Add-2bpp-support.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0013-configure-add-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-translation-linking-error.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0014-translations-fix-phony-translation-linking-error.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-translation-linking-error.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-debug-packages.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0015-configure-add-nostrip-for-debug-packages.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-debug-packages.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0016-configure-eval-QMAKE_CXX.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a-configurable-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0018-configure-make-pulseaudio-a-configurable-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a-configurable-option.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0021-configure-make-qt4-native-work-with-long-building-pa.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-work-with-long-building-pa.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0021-configure-make-qt4-native-work-with-long-building-pa.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-work-with-long-building-pa.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0027-tools.pro-disable-qmeegographicssystemhelper.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegographicssystemhelper.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/0027-tools.pro-disable-qmeegographicssystemhelper.patch
rename to meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegographicssystemhelper.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.6/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
rename to meta/recipes-qt/qt4/qt4-4.8.6/g++.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.6/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/linux.conf
rename to meta/recipes-qt/qt4/qt4-4.8.6/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.6/qte.sh
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.5/qte.sh
rename to meta/recipes-qt/qt4/qt4-4.8.6/qte.sh
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.5.bb b/meta/recipes-qt/qt4/qt4-native_4.8.5.bb
deleted file mode 100644
index 2443cc4..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.8.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-native.inc
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
-SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.6.bb b/meta/recipes-qt/qt4/qt4-native_4.8.6.bb
new file mode 100644
index 0000000..d874d32
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.6.bb
@@ -0,0 +1,6 @@
+require qt4-native.inc
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "2edbe4d6c2eff33ef91732602f3518eb"
+SRC_URI[sha256sum] = "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 6de0202..75a580c 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -275,7 +275,7 @@ do_compile() {
 python populate_packages_prepend() {
     translation_dir = d.expand('${datadir}/${QT_DIR_NAME}/translations/')
     translation_name = d.expand('${QT_BASE_NAME}-translation-%s')
-    do_split_packages(d, translation_dir, '^(assistant|designer|linguist|qt|qtconfig|qvfb)_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
+    do_split_packages(d, translation_dir, '^(assistant|designer|linguist|qt|qtconfig|qvfb|qtscript)_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
  
     phrasebook_dir = d.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/')
     phrasebook_name = d.expand('${QT_BASE_NAME}-phrasebook-%s')
-- 
1.9.3


