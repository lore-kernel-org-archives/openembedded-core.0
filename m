Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B052160842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 16:26:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 09:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="390453627"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2013 09:26:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 09:26:02 -0700
Message-Id: <cover.1377188323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/31] Updated for Final Review
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
X-List-Received-Date: Thu, 22 Aug 2013 16:26:24 -0000

Richard,

I updated a few of the commit messages and removed the Python3
patch set along with a couple other patches which include the 
Build Appliance related ones and cpan patch (I will have an
alternate fix soon)

Sau!

The following changes since commit 4c5756149754d0b18b14595db335f8f5e14cc0a3:

  busybox.inc: Avoid error when SYSLOG is not enabled (2013-08-22 15:10:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cristian Iorga (1):
  builder: register directories with pcmanfm

Jonathan Liu (3):
  xf86-video-intel: remove duplicate xf86driproto from DEPENDS
  xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
  mesa: enable additional drivers for gallium-llvm x86/x86-64

Kai Kang (3):
  bc: add patch to fix segmentation fault
  libx11: upgrade to 1.6.1
  libx11-diet: upgrade to 1.6.1

Khem Raj (1):
  eglibc: Update SRC_URI and fix unpackaged empty dir

Lauren Post (2):
  directfb: Upgrade to 1.6.3
  directfb: add fusion patch for hangs

Mark Hatle (11):
  image.bbclass: Add basic support for PACKAGE_EXCLUDE
  python-smartpm: Add support for excluding package from the install
  package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
  python-smartpm: Add support to disable installing recommends
  package_rpm.bbclass: NO_RECOMMENDATIONS support
  package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
  package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
  opkg: Add --no-install-recommends option.
  package_ipk: Add support for NO_RECOMMENDATIONS
  opkg: Add support for excluding packages from the install
  package_ipk: Add support for PACKAGE_EXCLUDE

Marko Lindqvist (3):
  texinfo: correct dont-depend-on-help2man.patch
  SDL2: add recipe
  boost: fix build when PARALLEL_MAKE is not set

Otavio Salvador (1):
  distro_features_check.bbclass: Allow checking of required/conflicting
    features

Paul Eggleton (1):
  gst-plugins-good: fix orc enabling via PACKAGECONFIG

Roy.Li (1):
  shadow: backport a patch to make newgrp work

Saul Wold (3):
  libsdl: Backport xData32 patch for x11 update
  valgrind: Backport patch for eglibc 2.18
  gnupg: Update to 2.0.21

Yevhen Kyriukha (1):
  connman: fix systemd support for connman-* packages.

 meta/classes/distro_features_check.bbclass         | 28 ++++++
 meta/classes/image.bbclass                         | 39 ++++++---
 meta/classes/package_deb.bbclass                   | 34 +++++---
 meta/classes/package_ipk.bbclass                   |  2 +
 meta/classes/package_rpm.bbclass                   |  8 ++
 meta/classes/rootfs_deb.bbclass                    |  8 +-
 meta/conf/bitbake.conf                             |  1 +
 meta/conf/documentation.conf                       |  9 ++
 meta/recipes-connectivity/connman/connman.inc      |  8 ++
 .../eglibc/cross-localedef-native_2.18.bb          |  6 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |  4 +
 meta/recipes-core/eglibc/eglibc_2.18.bb            |  6 +-
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 99 ++++++++++++++++++++++
 .../opkg/opkg/no-install-recommends.patch          | 78 +++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |  5 +-
 .../smart-config-ignore-all-recommends.patch       | 24 ++++++
 .../smart-flag-exclude-packages.patch              | 70 +++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  2 +
 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      | 27 ++++++
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |  1 +
 meta/recipes-extended/bc/bc_1.06.bb                |  3 +-
 .../bc/files/fix-segment-fault.patch               | 28 ++++++
 .../shadow/files/fix-etc-gshadow-reading.patch     | 36 ++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  1 +
 .../texinfo-5.1/dont-depend-on-help2man.patch      | 43 ++++++++--
 .../builder/files/builder_hob_start.sh             |  9 ++
 meta/recipes-graphics/directfb/directfb.inc        |  2 +-
 .../directfb/directfb/fusion.patch                 | 36 ++++++++
 .../recipes-graphics/directfb/directfb/mesa9.patch | 29 -------
 .../{directfb_1.6.1.bb => directfb_1.6.3.bb}       |  5 +-
 .../libsdl-1.2.15/libsdl-1.2.15-xdata32.patch      | 19 +++++
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  3 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb     | 56 ++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  4 +
 .../xorg-driver/xf86-video-intel_2.21.13.bb        |  2 +-
 .../xorg-driver/xf86-video-vesa_2.3.2.bb           |  2 +-
 .../{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} |  7 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |  3 +-
 .../xorg-lib/libx11/disable_tests.patch            |  9 +-
 .../xorg-lib/libx11/keysymdef_include.patch        | 42 ---------
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     | 13 ---
 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb     | 10 +++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |  2 +-
 meta/recipes-support/boost/boost.inc               |  2 +
 .../gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb}     |  4 +-
 45 files changed, 689 insertions(+), 140 deletions(-)
 create mode 100644 meta/classes/distro_features_check.bbclass
 create mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
 create mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch
 create mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
 create mode 100755 meta/recipes-graphics/directfb/directfb/fusion.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/mesa9.patch
 rename meta/recipes-graphics/directfb/{directfb_1.6.1.bb => directfb_1.6.3.bb} (76%)
 mode change 100644 => 100755
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} (65%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
 rename meta/recipes-support/gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb} (85%)

-- 
1.8.3.1


