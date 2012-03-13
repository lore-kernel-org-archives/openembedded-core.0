Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlk-0000Hp-Ee
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321777"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:58:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:34 -0700
Message-Id: <cover.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/23] Catching up after conference Time
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:45 -0000

Richard,

Here is a collection of patches that have been pending for a little 
while.

There is one pending change from Bruce for poky (meta-yocto) in the
MUT branch

Have built world with this code, and booted a minimal image



The following changes since commit f47ada62a3da879006e7cb27479dc9b72c56e923:

  cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH (2012-03-12 17:46:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Oberritter (10):
  qt4: fix deps in libQtWebkit.la and QtWebKit.pc
  udev-164: fixup "don't hardcode path to pidof"
  package.bbclass: sort dynamically generated packages
  util-linux: explicitly disable udev
  linux-firmware: fix permissions of installed files
  python, python-native: always set platform to linux2
  python: regenerate plat-linux2/*.py
  python: depend on bzip2
  python-native: distutils: don't use libdir, remove dead code path
  python, python-native: bump PR

Bruce Ashfield (1):
  linux-yocto: respect FILESPATH directories

Dexuan Cui (1):
  image_types: ensure .rootfs.ext3 is created before vmdk is created.

Jeff Lance (1):
  trace-cmd: modifying License information

Matthew McClintock (2):
  packagedata.py: Fix get_subpkgedata_fn for multilib
  arch-powerpc.inc: use default value of TUNE_PKGARCH

Otavio Salvador (6):
  run-postinsts: fix opkg data path
  image.bbclass: fix rootfs generation without package management tools
  rootfs_rpm.bbclass: rename postinst trigger script
  opkg: rename postinst trigger script
  dpkg: rename postinst trigger script
  connman: update to 0.79

Saul Wold (2):
  glib-2.0: Add Upstream Status for nodbus.patch
  image-vmdk: add NOISO to disable iso image creation since it's not
    needed

 meta/classes/core-image.bbclass                    |    2 -
 meta/classes/image-vmdk.bbclass                    |    1 +
 meta/classes/image.bbclass                         |    7 +++-
 meta/classes/image_types.bbclass                   |    6 +++
 meta/classes/kernel-yocto.bbclass                  |   30 +++++++++++++--
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/rootfs_rpm.bbclass                    |    6 ++--
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 +--
 meta/lib/oe/packagedata.py                         |    8 ++++
 .../connman/add_xuser_dbus_permission.patch        |   12 ++++---
 .../connman/connman/disable_alg-test.patch         |   18 +++++-----
 .../connman/{connman_0.78.bb => connman_0.79.bb}   |    6 +--
 meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |    2 +
 meta/recipes-core/udev/udev/init                   |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    6 ++--
 .../dpkg/run-postinsts/run-postinsts               |    4 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 meta/recipes-devtools/opkg/opkg.inc                |    8 ++--
 ...2-distutils-prefix-is-inside-staging-area.patch |    6 ++--
 .../sys_platform_is_now_always_linux2.patch        |   39 ++++++++++++++++++++
 .../recipes-devtools/python/python-native_2.7.2.bb |    1 +
 meta/recipes-devtools/python/python.inc            |    2 +-
 .../python/python/07-linux3-regen-fix.patch        |   18 ---------
 .../python/sys_platform_is_now_always_linux2.patch |   39 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |   15 +++++++-
 .../linux-firmware/linux-firmware_git.bb           |    4 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    8 +++--
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    1 +
 34 files changed, 194 insertions(+), 81 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_0.78.bb => connman_0.79.bb} (79%)
 create mode 100644 meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
 delete mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/sys_platform_is_now_always_linux2.patch

-- 
1.7.7.6



