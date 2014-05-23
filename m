Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 99BE96116C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 14:58:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 07:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,894,1392192000"; d="scan'208";a="543964024"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2014 07:58:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 15:57:53 +0100
Message-Id: <cover.1400856941.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Qt 4 upgrade
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
X-List-Received-Date: Fri, 23 May 2014 14:58:12 -0000

I've done the usual application tests at runtime, but I'd appreciate
some further testing.


The following change since commit f1727bb18f35ff01e53d3d442a6ff3c613639fa6:

  guile: Update to 2.0.11 version (2014-05-21 10:50:37 -0700)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt4-upgrade
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-upgrade

Paul Eggleton (1):
  qt4: upgrade to version 4.8.6

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

-- 
1.9.0


