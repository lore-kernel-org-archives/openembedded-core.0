Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DDA0261FB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 16:19:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2013 09:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,859,1363158000"; d="scan'208";a="328951858"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.2])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2013 09:19:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 09:19:45 -0700
Message-Id: <cover.1371140186.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/37] Updates and some fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 16:19:47 -0000

Richard,

This is a group of updates and some patches that have been
pulled together and built on the Autobuilder

There's a Chris patch to sstate.bbclass that needs your eyes.

Thanks
	Sau!

The following changes since commit 74158c2e99c6d8631800ae80025d1cc9f19336d2:

  tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines. (2013-06-12 17:54:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  gzip : upgrade to 1.6

Christopher Larson (2):
  sstate.bbclass: brute force silence fetch errors
  libnewt: split python module into libnewt-python

Felipe F. Tonello (1):
  qt: update qmake2 class to export qconfig.pri mkspec

Jonathan Liu (2):
  util-linux: update to 2.23.1
  classes/qmake_base: allow parallel make

Khem Raj (1):
  gcc: Upgrade to 4.8.1

Laurentiu Palcu (7):
  xf86-input-synaptics: upgrade to 1.7.1
  xkeyboard-config: upgrade to 2.9
  xdpyinfo: upgrade to 1.3.1
  xf86-video-intel: upgrade to 2.21.9
  xwininfo: upgrade to 1.1.3
  libdrm: upgrade to 2.4.45
  libxt: upgrade to 1.1.4

Muhammad Shakeel (1):
  ofono: Add run time dependency for ofono test scripts

Riku Voipio (1):
  qemu: update to 1.5.0

Ross Burton (6):
  runqemu: when tunctl can't be found, say what package builds it
  site: add more alignment values for at-spi2-core
  dpkg: drop the usage of create_wrapper
  python-native: add nativepython symlink
  createrepo: drop the usage of create_wrapper
  gnome-doc-utils: drop the usage of create_wrapper

Roy.Li (2):
  wpa-supplicant: Enable EXTRA_CFLAGS
  latencytop: Deprecate tracing_enabled for tracing_on

Saul Wold (11):
  socat: Update to 1.7.2.2
  cmake: Update to 2.8.11.1
  help2man: Update to 1.43.2
  cracklib: Update to 2.9.0
  cups: Update to 1.6.2
  libidn: Update to 1.27
  lsbinitscripts: Update to 9.47
  sysstat: Update to 10.1.6
  libxkbcommon: Update to 0.3.1
  libusb: Update tp 0.1.5
  nspr: Update to 4.10

Stefan Stanacar (2):
  scripts/contrib/build-perf-test.sh: add branch name and sizes to
    results
  scripts/contrib/build-perf-test.sh: fix passing arguments

 meta/classes/qmake2.bbclass                        |   1 +
 meta/classes/qmake_base.bbclass                    |   2 +-
 meta/classes/sstate.bbclass                        |   5 +
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/recipes-connectivity/ofono/ofono.inc          |   2 +-
 .../socat/{socat_1.7.2.1.bb => socat_1.7.2.2.bb}   |  11 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   1 +
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch |  60 ------
 ...etup-use-warn_size-for-regular-files-only.patch |  29 ---
 .../{util-linux_2.23.bb => util-linux_2.23.1.bb}   |   7 +-
 .../cmake/cmake-native_2.8.11.1.bb                 |   5 +
 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |   5 -
 .../cmake/{cmake_2.8.11.bb => cmake_2.8.11.1.bb}   |   4 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |  10 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   8 +-
 ...-native_1.41.2.bb => help2man-native_1.43.2.bb} |   5 +-
 .../recipes-devtools/python/python-native_2.7.3.bb |   6 +
 ...x-texinfo-table-markup-in-qemu-options.hx.patch | 213 ---------------------
 ...x-generating-qemu-doc.html-with-texinfo-5.patch |  54 ------
 ...re_vga-Add-back-some-info-in-local-state-.patch | 114 -----------
 meta/recipes-devtools/qemu/files/arm-bgr.patch     |  30 ---
 .../files/fallback-to-safe-mmap_min_addr.patch     |  39 ----
 .../recipes-devtools/qemu/files/linker-flags.patch |  25 ---
 meta/recipes-devtools/qemu/qemu.inc                |   7 +-
 .../qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb}          |   4 +-
 .../{cracklib_2.8.22.bb => cracklib_2.9.0.bb}      |   5 +-
 meta/recipes-extended/cups/cups16.inc              |   2 +-
 .../cups/{cups_1.6.1.bb => cups_1.6.2.bb}          |   4 +-
 .../gzip/{gzip_1.5.bb => gzip_1.6.bb}              |   6 +-
 .../libidn/{libidn_1.26.bb => libidn_1.27.bb}      |  11 +-
 ...binitscripts_9.46.bb => lsbinitscripts_9.47.bb} |   6 +-
 .../newt/libnewt-python_0.52.14.bb                 |  26 +++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |  15 +-
 meta/recipes-extended/sysstat/sysstat.inc          |   1 -
 meta/recipes-extended/sysstat/sysstat_10.1.5.bb    |   8 -
 meta/recipes-extended/sysstat/sysstat_10.1.6.bb    |   6 +
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   2 +-
 .../drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb}     |   4 +-
 .../{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb}       |   5 +-
 .../{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb}       |   5 +-
 ...tics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} |   4 +-
 ...-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} |   4 +-
 ...libxkbcommon_0.3.0.bb => libxkbcommon_0.3.1.bb} |   4 +-
 .../xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb}    |   7 +-
 ...board-config_2.8.bb => xkeyboard-config_2.9.bb} |   5 +-
 .../latencytop-0.5/latencytop-fsync.patch          |  49 +++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   3 +-
 .../createrepo/createrepo_0.4.11.bb                |   2 +-
 .../0.1.0-beta1-gcc3.4-fix.patch                   |  15 --
 .../obsolete_automake_macros.patch                 |  15 --
 ...busb-compat_0.1.4.bb => libusb-compat_0.1.5.bb} |  10 +-
 .../nspr/{nspr_4.9.6.bb => nspr_4.10.bb}           |  10 +-
 meta/site/arm-common                               |  10 +
 meta/site/ix86-common                              |   2 +-
 meta/site/mips-common                              |  10 +
 meta/site/powerpc-common                           |   9 +
 meta/site/x86_64-linux                             |   3 +-
 scripts/contrib/build-perf-test.sh                 |  60 +++---
 scripts/runqemu-ifdown                             |   2 +-
 59 files changed, 239 insertions(+), 740 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.2.1.bb => socat_1.7.2.2.bb} (79%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
 rename meta/recipes-core/util-linux/{util-linux_2.23.bb => util-linux_2.23.1.bb} (70%)
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.bb => cmake_2.8.11.1.bb} (88%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.41.2.bb => help2man-native_1.43.2.bb} (79%)
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/arm-bgr.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
 delete mode 100644 meta/recipes-devtools/qemu/files/linker-flags.patch
 rename meta/recipes-devtools/qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb} (67%)
 rename meta/recipes-extended/cracklib/{cracklib_2.8.22.bb => cracklib_2.9.0.bb} (83%)
 rename meta/recipes-extended/cups/{cups_1.6.1.bb => cups_1.6.2.bb} (80%)
 rename meta/recipes-extended/gzip/{gzip_1.5.bb => gzip_1.6.bb} (48%)
 rename meta/recipes-extended/libidn/{libidn_1.26.bb => libidn_1.27.bb} (75%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.46.bb => lsbinitscripts_9.47.bb} (78%)
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.5.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.6.bb
 rename meta/recipes-graphics/drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb} (46%)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb} (69%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.3.0.bb => libxkbcommon_0.3.1.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.8.bb => xkeyboard-config_2.9.bb} (87%)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
 delete mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/0.1.0-beta1-gcc3.4-fix.patch
 delete mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
 rename meta/recipes-support/libusb/{libusb-compat_0.1.4.bb => libusb-compat_0.1.5.bb} (78%)
 rename meta/recipes-support/nspr/{nspr_4.9.6.bb => nspr_4.10.bb} (94%)

-- 
1.8.1.4


