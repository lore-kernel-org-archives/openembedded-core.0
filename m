Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5E7A757E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 07:59:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t527x6Rb004003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 00:59:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 2 Jun 2015 00:59:06 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 15:52:06 +0800
Message-ID: <cover.1433231155.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Upgrade qt4 from 4.8.6 to 4.8.7
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
X-List-Received-Date: Tue, 02 Jun 2015 07:59:11 -0000
Content-Type: text/plain

Built for qemux86-64 and qemuarm:
1 bitbake qt4-native qt4-embedded qt4-x11-free nativesdk-qt4-tools  
2 bitbake world

The following changes since commit 81f09295b09bd705669bbf0d92a76513ad40f17b:

  bitbake: data_smart: fixup3 (2015-06-01 22:22:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/qt4
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/qt4

Kai Kang (1):
  qt4: upgrade to 4.8.7

 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 -
 ...tools_4.8.6.bb => nativesdk-qt4-tools_4.8.7.bb} |   4 +-
 .../0029-aarch64_arm64_fix_arch_detection.patch    |  53 ---
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 ---------------------
 .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ------
 .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |  18 -
 ...ion-by-zero-when-processing-malformed-BMP.patch |  44 --
 .../qt4/{qt4-4.8.6.inc => qt4-4.8.7.inc}           |   9 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   0
 ...tty_qws-fix-build-with-old-kernel-headers.patch |   0
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   0
 ...make-is-already-built-in-qt4-tools-native.patch |   0
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   0
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |   0
 ...-const-usage-that-causes-compile-failure-.patch |   0
 ...llow-building-a-separate-qmake-for-the-ta.patch |   0
 ...e-fix-source-file-references-in-qmake.pri.patch |   0
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  20 +-
 .../0011-freetype-host-includes.patch              |   0
 .../0012-Add-2bpp-support.patch                    |   0
 .../0013-configure-add-crossarch-option.patch      |  22 +-
 ...tions-fix-phony-translation-linking-error.patch |   0
 ...-configure-add-nostrip-for-debug-packages.patch |   0
 .../0016-configure-eval-QMAKE_CXX.patch            |   0
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |   0
 ...ure-make-pulseaudio-a-configurable-option.patch |   0
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   0
 ...ake-qt4-native-work-with-long-building-pa.patch |   0
 ...ls.pro-disable-qmeegographicssystemhelper.patch |   0
 .../0028-Don-t-crash-on-broken-GIF-images.patch    |   0
 ...figure-support-c-0x-standard-for-directfd.patch |   0
 .../Fix-QWSLock-invalid-argument-logs.patch        |   0
 .../add_check_for_aarch64_32.patch                 |   0
 .../qt4/{qt4-4.8.6 => qt4-4.8.7}/g++.conf          |   0
 .../qt4/{qt4-4.8.6 => qt4-4.8.7}/linux.conf        |   0
 .../recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/qte.sh |   0
 meta/recipes-qt/qt4/qt4-embedded.inc               |   1 -
 ...qt4-embedded_4.8.6.bb => qt4-embedded_4.8.7.bb} |   0
 meta/recipes-qt/qt4/qt4-native.inc                 |   6 -
 meta/recipes-qt/qt4/qt4-native_4.8.6.bb            |   6 -
 meta/recipes-qt/qt4/qt4-native_4.8.7.bb            |   6 +
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   2 -
 ...qt4-x11-free_4.8.6.bb => qt4-x11-free_4.8.7.bb} |   0
 43 files changed, 35 insertions(+), 773 deletions(-)
 rename meta/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.6.bb => nativesdk-qt4-tools_4.8.7.bb} (44%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
 rename meta/recipes-qt/qt4/{qt4-4.8.6.inc => qt4-4.8.7.inc} (87%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch (65%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0011-freetype-host-includes.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0012-Add-2bpp-support.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0013-configure-add-crossarch-option.patch (76%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0014-translations-fix-phony-translation-linking-error.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0015-configure-add-nostrip-for-debug-packages.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0016-configure-eval-QMAKE_CXX.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0018-configure-make-pulseaudio-a-configurable-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0021-configure-make-qt4-native-work-with-long-building-pa.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0027-tools.pro-disable-qmeegographicssystemhelper.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0028-Don-t-crash-on-broken-GIF-images.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/0033-configure-support-c-0x-standard-for-directfd.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/Fix-QWSLock-invalid-argument-logs.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/add_check_for_aarch64_32.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.6 => qt4-4.8.7}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.6.bb => qt4-embedded_4.8.7.bb} (100%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.6.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.7.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.6.bb => qt4-x11-free_4.8.7.bb} (100%)

-- 
1.9.1


