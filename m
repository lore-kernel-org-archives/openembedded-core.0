Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiDh8-00062n-T3
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 01:27:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2012 16:13:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="262131950"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.12.85])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2012 16:13:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 16:13:01 -0800
Message-Id: <cover.1355184740.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [CONSOLIDATED PULL v2 0/9] Fixes and updates (cover letter only)
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
X-List-Received-Date: Tue, 11 Dec 2012 00:27:38 -0000

Richard,

Here is a request of fixes that have been build and
basic tested.  I excudled the SMART changes due to 
some continuing issues.

I hope to get those resolved next week so we can have
SMART integrated.

Sau!



The following changes since commit 28c06a32201351894546b3095f80daa84acf7b39:

  base.bbclass: Remove implicit dependency on license.bbclass (2012-12-07 17:35:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andy Ross (1):
  base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs

Chunrong Guo (1):
  mtd-utils:fix corrupt cleanmarker with flash_erase -j command

Laurentiu Palcu (1):
  populate_sdk_deb.bbclass: put back INSTALL_PACKAGES_NORMAL_DEB

Martin Jansa (2):
  qt4: upgrade to 4.8.4
  nativesdk-qt4-tools: fix do_configure to be reentrant

Ross Burton (4):
  package.bbclass: make do_split_packages handle non-existent root
    directories
  mesa: common packaging cleanup
  mesa: upgrade to 8.0.5
  mesa-dri: upgrade -git version to current master

 meta/classes/base.bbclass                          |  69 +++++------
 meta/classes/license.bbclass                       |  68 ++++-------
 meta/classes/package.bbclass                       |   8 +-
 meta/classes/populate_sdk_deb.bbclass              |   4 +-
 ...t-cleanmarker-with-flash_erase--j-command.patch | 133 +++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |   5 +-
 .../mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc}        |   6 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |  22 ++--
 ...tive_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} |   6 +-
 .../mesa/mesa-dri-glsl-native_git.bb               |  23 ----
 .../mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb}  |   2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |   2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |  17 +--
 meta/recipes-graphics/mesa/mesa-git/uclibc.patch   |  57 ---------
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   8 +-
 ...tools_4.8.3.bb => nativesdk-qt4-tools_4.8.4.bb} |   4 +-
 .../qt4/{qt4-4.8.3.inc => qt4-4.8.4.inc}           |   8 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   8 +-
 ...tty_qws-fix-build-with-old-kernel-headers.patch |   8 +-
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   6 +-
 ...make-is-already-built-in-qt4-tools-native.patch |   8 +-
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   8 +-
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |  10 +-
 ...-const-usage-that-causes-compile-failure-.patch |  10 +-
 ...llow-building-a-separate-qmake-for-the-ta.patch |   6 +-
 ...e-fix-source-file-references-in-qmake.pri.patch |   6 +-
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |  10 +-
 .../0011-freetype-host-includes.patch              |   6 +-
 .../0012-Add-2bpp-support.patch                    |  16 +--
 .../0013-configure-add-crossarch-option.patch      |  14 +--
 ...tions-fix-phony-translation-linking-error.patch |   6 +-
 ...-configure-add-nostrip-for-debug-packages.patch |   8 +-
 .../0016-configure-eval-QMAKE_CXX.patch            |  17 +--
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |  10 +-
 ...ure-make-pulseaudio-a-configurable-option.patch |  12 +-
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   6 +-
 ...0020-webkit-disable-the-fuse-ld-gold-flag.patch |   6 +-
 ...ke-qt4-native-work-with-long-building-pa.patch} |  22 +++-
 .../qt4/{qt4-4.8.3 => qt4-4.8.4}/g++.conf          |   0
 .../qt4/{qt4-4.8.3 => qt4-4.8.4}/linux.conf        |   0
 .../recipes-qt/qt4/{qt4-4.8.3 => qt4-4.8.4}/qte.sh |   0
 ...qt4-embedded_4.8.3.bb => qt4-embedded_4.8.4.bb} |   0
 meta/recipes-qt/qt4/qt4-native.inc                 |   6 +-
 meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |   8 --
 meta/recipes-qt/qt4/qt4-native_4.8.4.bb            |   8 ++
 ...qt4-x11-free_4.8.3.bb => qt4-x11-free_4.8.4.bb} |   0
 46 files changed, 362 insertions(+), 305 deletions(-)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.5.0/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
 rename meta/recipes-graphics/mesa/{mesa-8.0.4.inc => mesa-8.0.5.inc} (80%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_8.0.4.bb => mesa-dri-glsl-native_8.0.5.bb} (66%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 rename meta/recipes-graphics/mesa/{mesa-dri_8.0.4.bb => mesa-dri_8.0.5.bb} (78%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git/uclibc.patch
 rename meta/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.3.bb => nativesdk-qt4-tools_4.8.4.bb} (48%)
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

-- 
1.8.0.1



