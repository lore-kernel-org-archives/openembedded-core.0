Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMd-000659-9v
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292865"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:14 -0700
Message-Id: <cover.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/41] Fixes and Updates
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This set contains a 2 patches that will fix multilib and non-gplv3
build issues, along with some other patches and updates.

Sau!

The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:

  bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (1):
  curl: upgrade to 7.26.0

Bruce Ashfield (1):
  kernel.bbclass: add non-santized kernel provides

Darren Hart (4):
  init-install: Use swap_ratio in the calulation of swap_size
  init-install: Correct ext2->ext3 typo in logging
  init-install: Clean up partition alignment
  grub-efi: Do not use help2man

Kang Kai (2):
  initscripts: use update-alternative to handle file functions
  lsbinitscripts: increase ALTERNATIVE_PRIORITY

Kartik Mohta (1):
  gcc-common: Don't use "is" for comparing strings, use "=="

Laurentiu Palcu (8):
  directfb: upgrade to 1.6.1
  directfb-examples: upgrade to 1.6.0
  libx11: upgrade to 1.5.0
  libx11-trim: upgrade to 1.5.0
  libx11-diet: upgrade to 1.5.0
  libxi: upgrade to 1.6.1
  xinput: upgrade to 1.6.0
  pixman: upgrade to 0.26.2

Mark Hatle (4):
  populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
  multilib: Enable multilib remapping for SDK generation
  package_rpm: Avoid duplicate package generation failures
  rpm: Fix PACKAGECONFIG dependencies

Martin Jansa (2):
  startup-notification: bump PR because libxcb-util soname was changed
  matchbox-panel-2: bump PR because libxcb-util soname was changed

Matthew McClintock (3):
  libxml-parser-perl_2.41.bb: fix MakeMaker issues with using wrong
    CC/LD/etc
  qemu-0.15.1: add patch to fix compilatation problems on powerpc
  packagedata.py: Fix get_subpkgedata_fn for multilib

Paul Eggleton (1):
  classes/license: fix manifest to work with deb

Peter Seebach (1):
  pseudo: Update to 1.3.1 (fixing chroot crash)

Richard Purdie (1):
  utils.bbclass: add helper function to add all multilib variants of a
    specific package

Robert P. J. Day (1):
  recipes.txt: Add entries for "recipes-rt" and "recipes-support"

Robert Yang (3):
  apt 0.7.14: runtime error: filename too long (tmpdir length)
  apt 0.7.14: runtime error: Method file has died unexpectedly
  sanity.bbclass: the tmpdir can't be longer than 410

Ross Burton (3):
  gthumb: run make install in parallel
  connman: remove some obviously wrong (circa early-GNOME 2?)
    directories from FILES
  connman: ship the empty plugins directory in the connman package

Saul Wold (3):
  gnutls: make sure native is patched for gettext version
  bluez4: fix packaging issue after update
  ncurses: fix packaging issue in multilib build

Scott Garman (2):
  runqemu: fix usage() help for MACHINE setting
  runqemu: fix support for ext4 rootfs images

 meta/classes/kernel.bbclass                        |    1 +
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/multilib.bbclass                      |    6 +
 meta/classes/package_rpm.bbclass                   |   10 +-
 meta/classes/populate_sdk_rpm.bbclass              |   15 +-
 meta/classes/rootfs_rpm.bbclass                    |    1 +
 meta/classes/sanity.bbclass                        |    8 +
 meta/classes/utils.bbclass                         |    9 +
 meta/lib/oe/packagedata.py                         |    8 +
 .../grub/files/grub-1.99-disable-help2man.patch    |  231 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |   17 +-
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    4 +-
 meta/recipes-connectivity/connman/connman.inc      |    8 +-
 .../initrdscripts/files/init-install.sh            |   12 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    8 +-
 meta/recipes-core/ncurses/ncurses.inc              |    6 +-
 .../apt/apt-0.7.14/allocate-larger-memory.patch    |   75 +++++++
 .../apt/apt-0.7.14/truncate-filename.patch         |   35 +++
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    2 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +-
 .../perl/libxml-parser-perl_2.41.bb                |   11 +-
 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb       |    8 +
 meta/recipes-devtools/pseudo/pseudo_1.3.bb         |    8 -
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
 .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 ++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    8 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb   |    4 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    4 +-
 ...xamples_1.5.3.bb => directfb-examples_1.6.0.bb} |    4 +-
 meta/recipes-graphics/directfb/directfb.inc        |    4 +-
 .../directfb/fix-compilation-with-zlib.patch       |   29 +++
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ---
 ...ibdirect-remove-include-of-linux-config.h.patch |   29 ---
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 --
 meta/recipes-graphics/directfb/directfb_1.6.1.bb   |   23 ++
 .../startup-notification_0.12.bb                   |    2 +-
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |   14 --
 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb     |   15 ++
 ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 ------------
 .../keysymdef_include.patch                        |    0
 .../makekeys_crosscompile.patch                    |    0
 .../x11_disable_makekeys.patch                     |   13 +-
 .../X18NCMSstubs.diff                              |    2 +-
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../keysymdef_include.patch                        |    0
 .../x11_disable_makekeys.patch                     |   13 +-
 .../{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} |    4 +-
 .../keysymdef_include.patch                        |    0
 .../makekeys_crosscompile.patch                    |    0
 .../x11_disable_makekeys.patch                     |   20 +-
 .../{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} |    6 +-
 .../xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb}  |    7 +-
 .../xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb}    |    4 +-
 .../{pixman_0.25.2.bb => pixman_0.26.2.bb}         |    9 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 meta/recipes-support/curl/curl/noldlibpath.patch   |   76 -------
 .../curl/{curl_7.24.0.bb => curl_7.26.0.bb}        |    7 +-
 meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    9 +-
 meta/recipes.txt                                   |    3 +-
 scripts/runqemu                                    |    4 +-
 64 files changed, 624 insertions(+), 424 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
 rename meta/recipes-graphics/directfb/{directfb-examples_1.5.3.bb => directfb-examples_1.6.0.bb} (77%)
 create mode 100644 meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/x11_disable_makekeys.patch (74%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-diet-1.5.0}/x11_disable_makekeys.patch (74%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} (86%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-trim-1.5.0}/x11_disable_makekeys.patch (62%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb} (67%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.25.2.bb => pixman_0.26.2.bb} (75%)
 delete mode 100644 meta/recipes-support/curl/curl/noldlibpath.patch
 rename meta/recipes-support/curl/{curl_7.24.0.bb => curl_7.26.0.bb} (90%)

-- 
1.7.7.6



