Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDN-0005Pe-C8
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387534"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:34 -0700
Message-Id: <cover.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/12] Various Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Aug 2011 23:35:33 -0000

Richard,

Please review Lianhao's patch to LDD Scripts, the rest of these
patches seem correct to me.

Sau!


The following changes since commit d126e22f6b3f27196144f87e22b36ebccd6dea65:

  rt-tests: use an explicit commit ID (2011-08-12 17:51:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (1):
  intltool: Use nativeperl binary for PERL instead of 'perl'

Lianhao Lu (4):
  utils.bbclass/multilib.class: Added misc supporting functions.
  eglibc: Modify ldd script according to multilib config.
  image: populate site config files into roootfs.
  meta-toolchain/environment: Use site config in rootfs.

Lin Tong (1):
  valgrind: supporting on Linux kernel 3.x

Noor Ahsan (1):
  bluez4: Added new recipe 4.96 and removed 4.82 version

Phil Blundell (5):
  pixman: remove spurious dependency on libx11
  libx11: skip self if x11 not in DISTRO_FEATURES
  cairo: only use x11 if selected in DISTRO_FEATURES
  dbus: only use x11 if DISTRO_FEATURES has selected it
  default-distrovars: add x11 to default DISTRO_FEATURES

 meta/classes/image.bbclass                         |    1 +
 meta/classes/multilib.bbclass                      |    7 ++-
 meta/classes/populate_sdk.bbclass                  |    2 +-
 meta/classes/siteinfo.bbclass                      |    4 +-
 meta/classes/toolchain-scripts.bbclass             |   31 +++++++++--
 meta/classes/utils.bbclass                         |   29 +++++++++++
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 meta/conf/multilib.conf                            |    3 +
 .../fix-dfutool-usb-declaration-mismatch.patch     |   20 -------
 .../bluez/bluez4-4.82/hid2hci_usb_init.patch       |   35 -------------
 .../bluez/bluez4-4.82/sbc-thumb.patch              |   14 -----
 .../{bluez4-4.82 => bluez4-4.96}/bluetooth.conf    |    0
 .../bluez/{bluez4_4.82.bb => bluez4_4.96.bb}       |    6 +--
 meta/recipes-core/dbus/dbus.inc                    |    7 ++-
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 ++++++
 meta/recipes-core/eglibc/eglibc-ld.inc             |   54 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   13 ++++-
 meta/recipes-core/meta/meta-environment.bb         |    6 +--
 meta/recipes-core/meta/meta-toolchain.bb           |    4 +-
 .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 +++++++
 meta/recipes-devtools/intltool/intltool.inc        |    3 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    9 +++-
 .../valgrind-3.6.1/fix_unsupporting_kernel_3.patch |   26 +++++++++
 meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    3 +-
 meta/recipes-graphics/cairo/cairo.inc              |    5 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |    5 ++
 meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb    |    2 -
 29 files changed, 226 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
 rename meta/recipes-connectivity/bluez/{bluez4-4.82 => bluez4-4.96}/bluetooth.conf (100%)
 rename meta/recipes-connectivity/bluez/{bluez4_4.82.bb => bluez4_4.96.bb} (90%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc
 create mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.6.1/fix_unsupporting_kernel_3.patch

-- 
1.7.6



