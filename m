Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 60A0B6AFBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 17:16:45 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jul 2013 10:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="330509983"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.73])
	by azsmga001.ch.intel.com with ESMTP; 12 Jul 2013 10:16:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 10:16:45 -0700
Message-Id: <cover.1373649195.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/27] REVIEWED & READY
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
X-List-Received-Date: Fri, 12 Jul 2013 17:16:46 -0000

Richard,

Poss and Paul have reviewed this set and either acked the
last email or will ack this one.

I removed Stefan's change from this one, since he posted a new set for
weekend review. This also includes the updated distrodata (v3) from Ema

Please take the 2 items for Poky also from Tom and Ema (yocto-kernel and package regex)

Thanks
	Sau!

The following changes since commit 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe:

  security_flags: Add addition recipes to the non pie list (2013-07-10 09:40:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (4):
  xserver-xorg: extend packageconfig and dependencies
  cogl-1.0: put each library into its own package
  cogl-1.0: make building cogl-pango optional
  qt4-x11-free: fix post-processing of QtWebKit.pc

Bian Naimeng (1):
  package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm

Cristian Iorga (3):
  libogg: upgrade to 1.3.1
  xdg-utils: upgrade to 1.1.0-rc1
  dbus: upgrade to 1.6.10

Darren Hart (1):
  alsa-state: Provide an empty asound.conf by default

Emilia Ciobanu (1):
  distrodata.bbaclass: change in git and svn package reporting

Gabriel Barbu (1):
  ethtool: add ptest

Hongxu Jia (5):
  nspr: add native version
  packagegroup-core-lsb: add nss for LSB library check
  nss: add version 3.15.1
  nss: create checksum files for the nss libraries
  nss: fix incorrect shebang line of perl script

Jonathan Liu (1):
  boot-directdisk: allow specifying custom MBR disk signature

Kang Kai (1):
  packagegroup-core-tools-profile: exclude systemtap and valgrind for
    mips64

Mark Hatle (1):
  qemu: QEMU fix libtool usage

Radu Moisan (3):
  iputils: Upgrade to v20121221
  diffutils: Upgrade to v3.3
  rxvt-unicode: Check existence of acinclude.m4

Roy.Li (1):
  pango: remove pango-module-basic-x RRECOMMENDS

Saul Wold (3):
  boost: backport glibc patch for new eglibc
  pciutils: Add kmod dependency
  ncurses: add xterm-256color to terminfo-base

Sergey Matyukevich (1):
  powertop: fix update-alternatives link

 meta/classes/boot-directdisk.bbclass               |  20 +++
 meta/classes/distrodata.bbclass                    |  79 ++++++---
 meta/classes/package_rpm.bbclass                   |   5 +
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf |  13 +-
 meta/recipes-bsp/pciutils/pciutils_3.2.0.bb        |   2 +-
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/dbus-1.init   |   0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/ptest.patch   |   0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/run-ptest     |   0
 .../test-run-path.patch                            |   0
 .../dbus/{dbus-1.6.8 => dbus-1.6.10}/tmpdir.patch  |   0
 .../dbus/dbus-1.6.8/systemd-address.patch          | 187 ---------------------
 .../{dbus-ptest_1.6.8.bb => dbus-ptest_1.6.10.bb}  |   4 +-
 meta/recipes-core/dbus/dbus.inc                    |   1 -
 meta/recipes-core/dbus/dbus_1.6.10.bb              |   6 +
 meta/recipes-core/dbus/dbus_1.6.8.bb               |   6 -
 meta/recipes-core/ncurses/ncurses.inc              |   2 +-
 .../packagegroup-core-tools-profile.bb             |   2 +
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 .../diffutils-3.2/obsolete_automake_macros.patch   |  14 --
 .../diffutils/diffutils-3.2/remove-gets.patch      |  22 ---
 meta/recipes-extended/diffutils/diffutils.inc      |   4 -
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   7 +-
 .../{diffutils_3.2.bb => diffutils_3.3.bb}         |  12 +-
 .../ethtool/ethtool-3.10/run-ptest                 |   2 +
 meta/recipes-extended/ethtool/ethtool_3.10.bb      |  18 +-
 .../files/debian/add-icmp-return-codes.diff        |  43 -----
 .../iputils/files/debian/fix-arping-timeouts.diff  |  26 ---
 .../files/debian/fix-dead-host-ping-stats.diff     |  16 --
 .../iputils/files/debian/targets.diff              |  14 +-
 .../iputils/files/debian/use_gethostbyname2.diff   |  36 ++--
 ...x-build-command-line-argument-with-gnutls.patch |  37 ++++
 .../{iputils_s20101006.bb => iputils_s20121221.bb} |  15 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 .../{xdg-utils_1.0.2.bb => xdg-utils_1.1.0-rc1.bb} |   9 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  33 +++-
 meta/recipes-graphics/pango/pango.inc              |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  10 +-
 meta/recipes-kernel/powertop/powertop_2.3.bb       |   2 +-
 .../libogg-1.3.0/obsolete_automake_macros.patch    |  14 --
 .../libogg/{libogg_1.3.0.bb => libogg_1.3.1.bb}    |  10 +-
 meta/recipes-qt/qt4/qt4.inc                        |   3 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb |   4 +-
 meta/recipes-support/boost/boost_1.54.0.bb         |   1 +
 meta/recipes-support/boost/files/glibc.patch       |  26 +++
 meta/recipes-support/nspr/nspr_4.10.bb             |   2 +
 .../files/nss-fix-incorrect-shebang-of-perl.patch  | 110 ++++++++++++
 .../files/nss-fix-support-cross-compiling.patch    |  71 ++++++++
 .../files/nss-no-rpath-for-cross-compiling.patch   |  26 +++
 meta/recipes-support/nss/files/nss.pc.in           |  11 ++
 meta/recipes-support/nss/files/signlibs.sh         |  20 +++
 meta/recipes-support/nss/nss.inc                   | 187 +++++++++++++++++++++
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 +
 52 files changed, 698 insertions(+), 448 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/ptest.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/run-ptest (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/test-run-path.patch (100%)
 rename meta/recipes-core/dbus/{dbus-1.6.8 => dbus-1.6.10}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.8.bb => dbus-ptest_1.6.10.bb} (91%)
 create mode 100644 meta/recipes-core/dbus/dbus_1.6.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.6.8.bb
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.2.bb => diffutils_3.3.bb} (59%)
 create mode 100644 meta/recipes-extended/ethtool/ethtool-3.10/run-ptest
 delete mode 100644 meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
 create mode 100644 meta/recipes-extended/iputils/files/fix-build-command-line-argument-with-gnutls.patch
 rename meta/recipes-extended/iputils/{iputils_s20101006.bb => iputils_s20121221.bb} (80%)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb => xdg-utils_1.1.0-rc1.bb} (80%)
 delete mode 100644 meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libogg/{libogg_1.3.0.bb => libogg_1.3.1.bb} (72%)
 create mode 100644 meta/recipes-support/boost/files/glibc.patch
 create mode 100644 meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
 create mode 100644 meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss.pc.in
 create mode 100644 meta/recipes-support/nss/files/signlibs.sh
 create mode 100644 meta/recipes-support/nss/nss.inc
 create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

-- 
1.8.1.4


