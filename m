Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH0Gu-0005lV-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:40:00 +0200
Received: by wibhj13 with SMTP id hj13so2348888wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=Nn5MfgM4roZkopGj0qgYaZFFVAlXTg8U+u1G+gYHfsw=;
	b=YovOMIJlI55satK2NmbbL1Ji7d2od/kXt6JHeVnqEaUXNY5nnGpcABLobjRdi+PfyR
	gO/vwgRJ1w+59ftVjFNCZmfdq6DYfvDSFdwgBYZbM73jOWvtFU4SBrPXqCLg9BPQ0gk6
	/87NZeANU8t/thwRkpgO3qGNAKmYReZzC0xvQZS3wsO6elXzOcGBxoYT9k+C03OcrVec
	c+N6df+XVaoteGN2Q0MPe8EmF3Ifos6wdr48C6BbTfCHcofVQOTRM8fq2I7GB+bRioZl
	smGztsYFgMxPESgs+M9uVQp5ejpfJDghzngSKitlmAAsBkxMHEkKX6L5t26AebAj5pXE
	b5Jw==
Received: by 10.180.99.99 with SMTP id ep3mr4033335wib.15.1348698429290;
	Wed, 26 Sep 2012 15:27:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm28002162wib.2.2012.09.26.15.27.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 15:27:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 00:27:05 +0200
Message-Id: <cover.1348697518.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH 00/10] qt4: upgrade to 4.8.3 and cleanup
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
X-List-Received-Date: Wed, 26 Sep 2012 22:40:00 -0000

Please test on more architectures.
I've tested complete qt4-native + qt4-free-x11 on armv4t.
And only do_patch for nativesdk-qt4-tools, qt-mobility-*, qt4-embedded.

The following changes since commit 938d07871bedd91f0d95ed6fe338ecbfafa5ebfe:

  busybox: Fix misplaced quote (2012-09-26 18:28:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/qt4-4.8.3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/qt4-4.8.3

Martin Jansa (10):
  qt4-tools-nativesdk.inc: rename to nativesdk-qt4-tools.inc
  qt4: use releases.qt-project.org instead of get.qt.nokia.com
  qt4: rename qt-4.8.1 to qt4-4.8.1 to match other .inc and .bb
  qt4.inc: move more options to separate variables
  qt-mobility: move qt-mobility patches to separate dir
  qt4: move patches from files to qt4-4.8.1
  qt4: drop patches not used in any recipe
  qt4: replace all local patches with git patches with headers
  qt4: PR bumps
  qt4: upgrade to 4.8.3

 meta/recipes-qt/qt4/files/0004-no-qmake.patch      | 27 ------
 meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch  | 41 ----------
 .../qt4/files/blacklist-diginotar-certs.diff       | 95 ----------------------
 .../recipes-qt/qt4/files/compile.test-lflags.patch | 17 ----
 meta/recipes-qt/qt4/files/fix-config-tests.patch   | 38 ---------
 ...tools-nativesdk.inc => nativesdk-qt4-tools.inc} | 18 ++--
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb   |  8 --
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb   |  8 ++
 .../qt4/qt-4.8.1/fix_conflicting_types.patch       | 29 -------
 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch       | 35 --------
 meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch  | 22 -----
 ...stvideoconnector-fixed-buffers-allocation.patch |  0
 ...nnecessary-rpaths-from-qml_device-example.patch |  0
 .../{files => qt-mobility-1.2.0}/gcc-scope.patch   |  0
 .../qt-mobility-configure.patch                    |  0
 .../qt-mobility-no-opengl.patch                    |  0
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  3 +-
 .../recipes-qt/qt4/{qt-4.8.1.inc => qt4-4.8.3.inc} | 41 +++++-----
 ...-allow-to-set-qt.conf-from-the-outside-u.patch} | 28 +++++--
 ...ty_qws-fix-build-with-old-kernel-headers.patch} | 21 ++++-
 ...03-webkit2-set-OUTPUT_DIR-value-if-empty.patch} | 21 ++++-
 ...make-is-already-built-in-qt4-tools-native.patch | 29 +++++++
 ...-set-LFLAGS-to-pick-up-zlib-from-staging.patch} | 24 ++++--
 ...e-OE_QMAKE_-values-to-specify-Qt-utility.patch} | 26 ++++--
 ...const-usage-that-causes-compile-failure-.patch} | 26 ++++--
 ...low-building-a-separate-qmake-for-the-ta.patch} | 20 +++--
 ...-fix-source-file-references-in-qmake.pri.patch} | 15 ++--
 ...ck-to-not-use-the-pg_config-of-the-host-.patch} | 25 ++++--
 .../0011-freetype-host-includes.patch}             | 20 +++--
 .../0012-Add-2bpp-support.patch}                   | 76 ++++++++++-------
 .../0013-configure-add-crossarch-option.patch}     | 36 ++++----
 ...ions-fix-phony-translation-linking-error.patch} | 19 +++--
 ...configure-add-nostrip-for-debug-packages.patch} | 15 +++-
 ...sure-we-identify-the-compiler-as-g-in-co.patch} | 27 ++++--
 ...re-make-pulseaudio-a-configurable-option.patch} | 17 ++--
 ...es-for-gcc-4.7.0-particularly-on-qemux86.patch} | 45 ++++++----
 ...019-webkit-disable-the-fuse-ld-gold-flag.patch} | 23 ++++--
 .../qt4/{qt-4.8.1 => qt4-4.8.3}/g++.conf           |  0
 .../qt4/{qt-4.8.1 => qt4-4.8.3}/linux.conf         |  0
 meta/recipes-qt/qt4/{files => qt4-4.8.3}/qte.sh    |  0
 meta/recipes-qt/qt4/qt4-embedded.inc               |  2 +-
 ...qt4-embedded_4.8.1.bb => qt4-embedded_4.8.3.bb} |  4 +-
 meta/recipes-qt/qt4/qt4-native.inc                 | 10 +--
 meta/recipes-qt/qt4/qt4-native_4.8.1.bb            | 12 ---
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |  8 ++
 meta/recipes-qt/qt4/qt4-x11-free.inc               |  2 +-
 ...qt4-x11-free_4.8.1.bb => qt4-x11-free_4.8.3.bb} |  4 +-
 meta/recipes-qt/qt4/qt4.inc                        | 19 ++++-
 48 files changed, 427 insertions(+), 529 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/files/0004-no-qmake.patch
 delete mode 100644 meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch
 delete mode 100644 meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
 delete mode 100644 meta/recipes-qt/qt4/files/compile.test-lflags.patch
 delete mode 100644 meta/recipes-qt/qt4/files/fix-config-tests.patch
 rename meta/recipes-qt/qt4/{qt4-tools-nativesdk.inc => nativesdk-qt4-tools.inc} (83%)
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
 create mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
 delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_types.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
 delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/0001-gstvideoconnector-fixed-buffers-allocation.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/0002-Remove-unnecessary-rpaths-from-qml_device-example.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/gcc-scope.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/qt-mobility-configure.patch (100%)
 rename meta/recipes-qt/qt4/{files => qt-mobility-1.2.0}/qt-mobility-no-opengl.patch (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1.inc => qt4-4.8.3.inc} (50%)
 rename meta/recipes-qt/qt4/{files/qt-config.patch => qt4-4.8.3/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch} (49%)
 rename meta/recipes-qt/qt4/{files/fix_qkbdtty_qws.patch => qt4-4.8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch} (68%)
 rename meta/recipes-qt/qt4/{files/set-OUTPUT_DIR-if-empty.patch => qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch} (48%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
 rename meta/recipes-qt/qt4/{qt-4.8.1/configure-lflags.patch => qt4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch} (46%)
 rename meta/recipes-qt/qt4/{files/configure-paths.patch => qt4-4.8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch} (58%)
 rename meta/recipes-qt/qt4/{files/qt-dbus-const.patch => qt4-4.8.3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch} (52%)
 rename meta/recipes-qt/qt4/{files/target_qmake.patch => qt4-4.8.3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch} (57%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/qmake_pri_fixes.patch => qt4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch} (81%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/hack-out-pg2-4.7.0.patch => qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch} (68%)
 rename meta/recipes-qt/qt4/{files/0006-freetype-host-includes.patch => qt4-4.8.3/0011-freetype-host-includes.patch} (50%)
 rename meta/recipes-qt/qt4/{files/0009-support-2bpp.patch => qt4-4.8.3/0012-Add-2bpp-support.patch} (83%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/0001-Added-Openembedded-crossarch-option.patch => qt4-4.8.3/0013-configure-add-crossarch-option.patch} (49%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/fix-translations.patch => qt4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch} (63%)
 rename meta/recipes-qt/qt4/{files/add_nostrip_for_debug_packages.diff => qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch} (57%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/configure_oe_compiler.patch => qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.patch} (60%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/pulseaudio-config.patch => qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch} (85%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/gcc47-fix2.patch => qt4-4.8.3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch} (46%)
 rename meta/recipes-qt/qt4/{qt-4.8.1/disable-fuse-gold-flag.patch => qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch} (46%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.3}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt-4.8.1 => qt4-4.8.3}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{files => qt4-4.8.3}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.1.bb => qt4-embedded_4.8.3.bb} (73%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.1.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.3.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.1.bb => qt4-x11-free_4.8.3.bb} (75%)

-- 
1.7.12



