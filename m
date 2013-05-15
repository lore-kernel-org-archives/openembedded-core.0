Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UcXB7-00015b-Nr
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 10:35:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 May 2013 01:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="302702201"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.183])
	by azsmga001.ch.intel.com with ESMTP; 15 May 2013 01:17:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 11:17:02 +0300
Message-Id: <cover.1368603810.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/29] Updates, patches and mips64 enabling
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
X-List-Received-Date: Wed, 15 May 2013 08:35:34 -0000

Richard,

Here is a set of patches that I have pulled together and built
and test on the Autobuilder.

This includes Robert's fatal() clean-up.

Thanks
	Sau!

The following changes since commit f9f1397d688cc4eb8d736066b1280bee40a8916a:

  image.bbclass: Add package-management image feature to validitems (2013-05-14 15:02:25 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (2):
  kern-tools: refresh and make dash compliant
  linux-yocto: add qemumips64 compatibility

Ionut Radu (6):
  libxi: updated from 1.7 to 1.7.1
  json-glib: updated from 0.15.2 to 0.16.0
  libfontenc: Updated from 1.1.1 to 1.1.2
  ethtool: Updated from 3.8 to 3.9
  pixman: Update from 0.29.2 to 0.29.4
  gpgme: Updated from 1.4.0 to 1.4.1

Jonathan Liu (3):
  syslinux: Update to 4.06
  boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
  xf86-video-modesetting: upgrade to 0.7.0

Jukka Rissanen (5):
  connman: Add VPN support
  connman: Add OpenVPN support
  connman: Add vpnc support
  connman: Add L2TP support
  connman: Add PPTP support

Khem Raj (4):
  runqemu: Replace use of ifconfig with ip
  binutils: Add broadcom XLP support
  machine/qemumips64: Add machine definition
  pam: Add libtirpc to build dependencies

Laurentiu Palcu (1):
  systemd: make udev-hwdb postinstall run on host

Martin Jansa (1):
  bitbake.conf: define empty EXTRA_IMAGE_FEATURES before using them

Mike Looijmans (1):
  busybox-mdev: Startup at level S03 instead of S06

Robert Yang (2):
  bbclass: bb.fatal() clean up
  cachedpath.py: global name 'error' is not defined

Ross Burton (1):
  glib-2.0: drop dependency on python-argparse

Saul Wold (1):
  pkgconfig: Update to 0.28

Stefan Stanacar (1):
  connman: replace hardcoded path in init script and systemd service

Zongchun Yu (1):
  toolchain-scripts.bbclass:Add CROSS_COMPILE variable to
    environment-setup file

 meta/classes/boot-directdisk.bbclass               |  27 +-
 meta/classes/insane.bbclass                        |   1 -
 meta/classes/package.bbclass                       |   1 -
 meta/classes/package_rpm.bbclass                   |   2 -
 meta/classes/syslinux.bbclass                      |   8 +-
 meta/classes/toolchain-scripts.bbclass             |   3 +
 meta/conf/bitbake.conf                             |   2 +
 meta/conf/machine/qemumips64.conf                  |  13 +
 meta/lib/oe/cachedpath.py                          |   4 +-
 meta/recipes-connectivity/connman/connman.inc      |  92 +-
 meta/recipes-connectivity/connman/connman/connman  |   4 +-
 meta/recipes-core/busybox/busybox.inc              |   2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb      |   6 +-
 meta/recipes-core/systemd/systemd_199.bb           |  11 +-
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |   1 +
 .../binutils-2.23.2/binutils-xlp-support.patch     | 398 +++++++++
 .../pkgconfig-0.25/obsolete_automake_macros.patch  |  35 -
 .../autofoo.patch                                  |   0
 .../fix-glib-configure-libtool-usage.patch         |  45 +
 .../glibconfig-sysdefs.h                           |   0
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   6 +-
 .../pkgconfig/pkgconfig/disable-legacy.patch       |  48 -
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |  13 -
 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb  |  10 +
 .../syslinux/files/cross-build.patch               |  71 --
 .../libinstaller-Avoid-using-linux-ext2_fs.h.patch | 975 ---------------------
 .../recipes-devtools/syslinux/files/no-strip.patch |  31 -
 .../{syslinux_4.03.bb => syslinux_4.06.bb}         |  33 +-
 .../ethtool/{ethtool_3.8.bb => ethtool_3.9.bb}     |   5 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   2 +-
 .../{json-glib_0.15.2.bb => json-glib_0.16.0.bb}   |   4 +-
 ...ng_0.6.0.bb => xf86-video-modesetting_0.7.0.bb} |   5 +-
 .../{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb}   |   5 +-
 .../xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb}      |   4 +-
 .../{pixman_0.29.2.bb => pixman_0.29.4.bb}         |   6 +-
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   2 +-
 .../disable_gpgconf_check.patch                    |   0
 .../gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb}       |   6 +-
 scripts/runqemu-gen-tapdevs                        |   6 +-
 scripts/runqemu-ifup                               |   6 +-
 scripts/runqemu-internal                           |   6 +-
 43 files changed, 628 insertions(+), 1275 deletions(-)
 create mode 100644 meta/conf/machine/qemumips64.conf
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-xlp-support.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
 rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.25 => pkgconfig-0.28}/autofoo.patch (100%)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.28/fix-glib-configure-libtool-usage.patch
 rename meta/recipes-devtools/pkgconfig/{pkgconfig-0.25 => pkgconfig-0.28}/glibconfig-sysdefs.h (100%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_0.28.bb
 delete mode 100644 meta/recipes-devtools/syslinux/files/cross-build.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/libinstaller-Avoid-using-linux-ext2_fs.h.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch
 rename meta/recipes-devtools/syslinux/{syslinux_4.03.bb => syslinux_4.06.bb} (62%)
 rename meta/recipes-extended/ethtool/{ethtool_3.8.bb => ethtool_3.9.bb} (78%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.15.2.bb => json-glib_0.16.0.bb} (79%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-modesetting_0.6.0.bb => xf86-video-modesetting_0.7.0.bb} (50%)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.1.bb => libfontenc_1.1.2.bb} (70%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.bb => libxi_1.7.1.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.29.2.bb => pixman_0.29.4.bb} (88%)
 rename meta/recipes-support/gpgme/{gpgme-1.4.0 => gpgme-1.4.1}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb} (89%)

-- 
1.8.0.2



