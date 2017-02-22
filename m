Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2791C730F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302135"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:50:55 +0200
Message-Id: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/24] Recipe updates and version check fixes
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:12 -0000

I've skipped openssl 1.1 update (https://bugzilla.yoctoproject.org/show_bug.cgi?id=11091)
and gperf 3.1 update (incompatible with latest libcap 2.25).

The following changes since commit f04f4981c1309f07b569dc953f9b2f25695eb58f:

  wget.py: match .lz tarballs as well when determining latest version (2017-02-21 13:36:01 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (24):
  ruby: fix upstream version check
  zlib: fix upstream version check
  kconfig-frontends: fetch source from git
  sysprof: inherit upstream-version-is-even
  libepoxy: fix upstream version check
  libva: fix upstream version check
  babeltrace: update to 1.5.2
  bash-completion: update to 2.5
  boost: update to 1.63.0
  btrfs-tools: update to 4.9.1
  cmake: update to 3.7.2
  lzip: add a recipe from meta-oe
  ed: update to 1.14.1
  webkitgtk: update to 2.14.5
  epiphany: update to 3.22.6
  ffmpeg: update to 3.2.4
  gnutls: update to 3.5.9
  iso-codes: update to 3.74
  kbd: update to 2.0.4
  libiconv: remove recipe
  libnl: update to 3.2.29
  libwebp: update to 0.6.0
  nss: update to 3.28.1
  systemtap: update to 3.1

 .../kbd/{kbd_2.0.3.bb => kbd_2.0.4.bb}             |    4 +-
 meta/recipes-core/zlib/zlib_1.2.8.bb               |    1 +
 .../{btrfs-tools_4.8.5.bb => btrfs-tools_4.9.1.bb} |    2 +-
 ...cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} |    0
 meta/recipes-devtools/cmake/cmake.inc              |    4 +-
 .../cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb}       |    0
 .../kconfig-frontends_3.12.0.0.bb                  |    9 +-
 meta/recipes-devtools/ruby/ruby.inc                |    1 +
 .../ed/{ed_1.9.bb => ed_1.14.1.bb}                 |   12 +-
 meta/recipes-extended/lzip/lzip_1.18.bb            |   41 +
 .../{epiphany_3.22.3.bb => epiphany_3.22.6.bb}     |    4 +-
 meta/recipes-graphics/libepoxy/libepoxy_1.4.0.bb   |    1 +
 meta/recipes-graphics/libva/libva_1.7.3.bb         |    1 +
 .../{babeltrace_1.5.1.bb => babeltrace_1.5.2.bb}   |    4 +-
 meta/recipes-kernel/sysprof/sysprof_3.22.3.bb      |    2 +-
 ...configure-write-a-python-location-into-th.patch |   25 +
 .../systemtap/systemtap/fix-monitor-linking.patch  |   41 -
 .../systemtap/systemtap/monitor-option.patch       |   26 +-
 .../systemtap/systemtap/no-msgfmt-check.patch      |   22 +-
 .../systemtap/obsolete_automake_macros.patch       |   15 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    9 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    7 +-
 .../ffmpeg/{ffmpeg_3.2.2.bb => ffmpeg_3.2.4.bb}    |    4 +-
 .../webp/{libwebp_0.5.1.bb => libwebp_0.6.0.bb}    |    4 +-
 .../{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb}   |    4 +-
 ...sh-completion_2.4.bb => bash-completion_2.5.bb} |    4 +-
 ...bjam-native_1.62.0.bb => bjam-native_1.63.0.bb} |    0
 .../boost/{boost-1.62.0.inc => boost-1.63.0.inc}   |    4 +-
 ...soft-float-on-ARM-we-should-not-expect-th.patch |   29 +
 ...execution_monitor.hpp-fix-mips-soft-float.patch |  145 -
 .../boost/boost/consider-hardfp.patch              |   19 -
 .../boost/{boost_1.62.0.bb => boost_1.63.0.bb}     |    3 +-
 ...cli-args.h-to-cli-args.stamp-Makefile-tar.patch |   27 -
 .../gnutls/0001-configure.ac-fix-sed-command.patch |   26 +-
 .../gnutls/{gnutls_3.5.7.bb => gnutls_3.5.9.bb}    |    5 +-
 .../{iso-codes_3.72.bb => iso-codes_3.74.bb}       |    4 +-
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   50 -
 .../shared_preloadable_libiconv_linux.patch        |   26 -
 .../libiconv-1.14/add-relocatable-module.patch     | 5008 --------------------
 .../libiconv/libiconv-1.14/autoconf.patch          |   50 -
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   47 -
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   51 -
 ...01-lib-add-utility-function-nl_strerror_l.patch |  146 -
 ...to-using-strerror_l-instead-of-strerror_r.patch |  403 --
 ...to-using-strerror_l-instead-of-strerror_r.patch |   82 -
 .../libnl/{libnl_3.2.28.bb => libnl_3.2.29.bb}     |    7 +-
 ... => 0001-nss-fix-support-cross-compiling.patch} |   51 +-
 .../nss/{nss_3.27.1.bb => nss_3.28.1.bb}           |    8 +-
 48 files changed, 215 insertions(+), 6223 deletions(-)
 rename meta/recipes-core/kbd/{kbd_2.0.3.bb => kbd_2.0.4.bb} (92%)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.5.bb => btrfs-tools_4.9.1.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.1.bb => cmake-native_3.7.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.1.bb => cmake_3.7.2.bb} (100%)
 rename meta/recipes-extended/ed/{ed_1.9.bb => ed_1.14.1.bb} (51%)
 create mode 100644 meta/recipes-extended/lzip/lzip_1.18.bb
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.3.bb => epiphany_3.22.6.bb} (83%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.1.bb => babeltrace_1.5.2.bb} (82%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Do-not-let-configure-write-a-python-location-into-th.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.2.bb => ffmpeg_3.2.4.bb} (97%)
 rename meta/recipes-multimedia/webp/{libwebp_0.5.1.bb => libwebp_0.6.0.bb} (93%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb} (97%)
 rename meta/recipes-support/bash-completion/{bash-completion_2.4.bb => bash-completion_2.5.bb} (88%)
 rename meta/recipes-support/boost/{bjam-native_1.62.0.bb => bjam-native_1.63.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.62.0.inc => boost-1.63.0.inc} (84%)
 create mode 100644 meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
 delete mode 100644 meta/recipes-support/boost/boost/0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch
 delete mode 100644 meta/recipes-support/boost/boost/consider-hardfp.patch
 rename meta/recipes-support/boost/{boost_1.62.0.bb => boost_1.63.0.bb} (82%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.7.bb => gnutls_3.5.9.bb} (52%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.72.bb => iso-codes_3.74.bb} (76%)
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/autoconf.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.14.bb
 delete mode 100644 meta/recipes-support/libnl/libnl/0001-lib-add-utility-function-nl_strerror_l.patch
 delete mode 100644 meta/recipes-support/libnl/libnl/0002-lib-switch-to-using-strerror_l-instead-of-strerror_r.patch
 delete mode 100644 meta/recipes-support/libnl/libnl/0003-src-switch-to-using-strerror_l-instead-of-strerror_r.patch
 rename meta/recipes-support/libnl/{libnl_3.2.28.bb => libnl_3.2.29.bb} (80%)
 rename meta/recipes-support/nss/nss/{nss-fix-support-cross-compiling.patch => 0001-nss-fix-support-cross-compiling.patch} (49%)
 rename meta/recipes-support/nss/{nss_3.27.1.bb => nss_3.28.1.bb} (96%)

-- 
2.11.0


