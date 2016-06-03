Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2B6177444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440110"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:37 +0300
Message-Id: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 00/25] Version updates and upstream check fixes
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:10 -0000

A bunch of version updates for recipes where I'm listed as maintainer.
I have also moved gobject-introspection recipe to Python 3, as it required
first updating the recipe to latest version, and that required updating glib
to latest version.

The following changes since commit dcbfc72303d6782d9108538c830cf2ee7849bf59:

  poky: Add Ubuntu 16.04 to tested/supported list since I run it myself (2016-06-02 10:37:05 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (25):
  gdbm: upgrade to 1.12
  rt-tests, hwlatdetect: upgrade to 2.0
  webkitgtk: upgrade to 2.12.3
  cups: fix upstream version check
  tzcode, tzdata: fix upstream version check
  cantarell-fonts: fix upstream check
  boost: update to 1.61.0
  btrfs-tools: update to 4.5.3
  build-appliance-image: update version to 15.0.0
  ffmpeg: update to 3.0.2
  cantarell-fonts: update to 0.0.24
  gcc: fix upstream check for 5.x version
  gdb: fix upstream check
  gnome-desktop3: update to 3.20.2
  gobject-introspection: update to 1.48.0
  gobject-introspection: move to Python 3
  mc: update to 4.8.17
  icu: update to 57.1
  iso-codes: update to 3.68
  kexec-tools: update to 2.0.12
  libksba: update to 1.3.4
  libxslt: update to 1.1.29
  msmtp: update to 1.6.5
  systemtap: update to 3.0
  watchdog: update to 5.15

 ...e_14.0.0.bb => build-appliance-image_15.0.0.bb} |  0
 .../fix-symlink-creation-multiple-times.patch      | 46 ----------
 .../{btrfs-tools_4.4.bb => btrfs-tools_4.5.3.bb}   |  3 +-
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 meta/recipes-devtools/gdb/gdb-common.inc           |  2 +
 meta/recipes-extended/cups/cups.inc                |  2 +-
 .../mc/{mc_4.8.16.bb => mc_4.8.17.bb}              |  4 +-
 .../msmtp/{msmtp_1.6.4.bb => msmtp_1.6.5.bb}       |  4 +-
 .../recipes-extended/tzcode/tzcode-native_2016d.bb |  1 +
 meta/recipes-extended/tzdata/tzdata_2016d.bb       |  1 +
 ...d-issues-found-with-non-glibc-C-libraries.patch | 99 ----------------------
 .../watchdog/watchdog/fix-ping-failure.patch       | 79 -----------------
 .../watchdog/watchdog/fixsepbuild.patch            | 27 ------
 .../{watchdog_5.14.bb => watchdog_5.15.bb}         |  7 +-
 ...desktop3_3.18.2.bb => gnome-desktop3_3.20.2.bb} |  4 +-
 ...ncomplete-upstream-attempt-at-cross-compi.patch | 50 +++++++++++
 ...-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch} | 15 ++--
 ...-giscanner-add-use-binary-wrapper-option.patch} | 17 ++--
 ...4-giscanner-add-a-use-ldd-wrapper-option.patch} | 15 ++--
 ...onfig-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch} | 13 ++-
 ...n_1.46.0.bb => gobject-introspection_1.48.0.bb} | 28 +++---
 .../cantarell-fonts/cantarell-fonts_git.bb         |  5 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |  4 +
 ...kexec-tools-Refine-kdump-device_tree-sort.patch | 48 -----------
 ...kexec-tools_2.0.11.bb => kexec-tools_2.0.12.bb} |  6 +-
 .../systemtap/systemtap/docproc-build-fix.patch    | 19 -----
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  5 +-
 .../ffmpeg/{ffmpeg_3.0.bb => ffmpeg_3.0.2.bb}      |  4 +-
 ...t-CC-AR-variable-only-if-it-doesn-t-have-.patch | 30 -------
 .../{hwlatdetect_0.96.bb => hwlatdetect_2.0.bb}    |  0
 meta/recipes-rt/rt-tests/rt-tests.inc              |  3 +-
 .../rt-tests/{rt-tests_0.96.bb => rt-tests_2.0.bb} |  2 +-
 .../{webkitgtk_2.12.1.bb => webkitgtk_2.12.3.bb}   |  4 +-
 ...bjam-native_1.60.0.bb => bjam-native_1.61.0.bb} |  0
 .../boost/{boost-1.60.0.inc => boost-1.61.0.inc}   |  4 +-
 ...qualify-fenv.h-names-that-might-be-macros.patch | 45 ----------
 .../boost/{boost_1.60.0.bb => boost_1.61.0.bb}     |  1 -
 .../gdbm/{gdbm_1.11.bb => gdbm_1.12.bb}            |  4 +-
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  | 24 ------
 .../icu/{icu_56.1.bb => icu_57.1.bb}               |  7 +-
 .../{iso-codes_3.65.bb => iso-codes_3.68.bb}       |  6 +-
 .../libksba/{libksba_1.3.3.bb => libksba_1.3.4.bb} |  4 +-
 ...se-pkg-config-to-find-gcrypt-and-libxml2.patch} | 42 +++++----
 .../libxslt/libxslt/CVE-2015-7995.patch            | 34 --------
 .../{libxslt_1.1.28.bb => libxslt_1.1.29.bb}       |  8 +-
 46 files changed, 171 insertions(+), 558 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_14.0.0.bb => build-appliance-image_15.0.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.4.bb => btrfs-tools_4.5.3.bb} (89%)
 rename meta/recipes-extended/mc/{mc_4.8.16.bb => mc_4.8.17.bb} (93%)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.4.bb => msmtp_1.6.5.bb} (86%)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/0001-Fix-build-issues-found-with-non-glibc-C-libraries.patch
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/fix-ping-failure.patch
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/fixsepbuild.patch
 rename meta/recipes-extended/watchdog/{watchdog_5.14.bb => watchdog_5.15.bb} (79%)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.18.2.bb => gnome-desktop3_3.20.2.bb} (84%)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch => 0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch} (95%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-giscanner-add-use-binary-wrapper-option.patch => 0003-giscanner-add-use-binary-wrapper-option.patch} (85%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-giscanner-add-a-use-ldd-wrapper-option.patch => 0004-giscanner-add-a-use-ldd-wrapper-option.patch} (85%)
 rename meta/recipes-gnome/gobject-introspection/gobject-introspection/{0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch => 0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch} (91%)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.46.0.bb => gobject-introspection_1.48.0.bb} (88%)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.11.bb => kexec-tools_2.0.12.bb} (84%)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.0.bb => ffmpeg_3.0.2.bb} (97%)
 delete mode 100644 meta/recipes-rt/rt-tests/files/0001-Makefile-Set-CC-AR-variable-only-if-it-doesn-t-have-.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.96.bb => hwlatdetect_2.0.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.96.bb => rt-tests_2.0.bb} (93%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.1.bb => webkitgtk_2.12.3.bb} (96%)
 rename meta/recipes-support/boost/{bjam-native_1.60.0.bb => bjam-native_1.61.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.60.0.inc => boost-1.61.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Do-not-qualify-fenv.h-names-that-might-be-macros.patch
 rename meta/recipes-support/boost/{boost_1.60.0.bb => boost_1.61.0.bb} (59%)
 rename meta/recipes-support/gdbm/{gdbm_1.11.bb => gdbm_1.12.bb} (88%)
 delete mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_56.1.bb => icu_57.1.bb} (72%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.65.bb => iso-codes_3.68.bb} (64%)
 rename meta/recipes-support/libksba/{libksba_1.3.3.bb => libksba_1.3.4.bb} (86%)
 rename meta/recipes-support/libxslt/libxslt/{pkgconfig.patch => 0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch} (78%)
 delete mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
 rename meta/recipes-support/libxslt/{libxslt_1.1.28.bb => libxslt_1.1.29.bb} (85%)

-- 
2.8.1


