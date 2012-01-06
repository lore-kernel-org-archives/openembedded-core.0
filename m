Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj4mQ-0004Lc-UM
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:04:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 23:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93004456"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 23:56:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 23:56:11 -0800
Message-Id: <cover.1325836241.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/25] Various Patches
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
X-List-Received-Date: Fri, 06 Jan 2012 08:04:03 -0000

Richard,

Here is a set up changes collected during the day and built
on x86 and ARM.

I have done reviewed these and they look OK to me.

As an aside I am testing the update qemuppc config and will
include that before M2 I hope.

Thanks
Sau!

The following changes since commit 4a85312568a6bb052cc511c15b4ae842ff7f8e59:

  image-mklibs/package_ipk: Remove bashisms (2012-01-05 22:26:20 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (2):
  xorg-driver: add xf86-video-fbdev from meta-openembedded
  x11-common: remove extraneous BSP customizations

Bruce Ashfield (3):
  kern-tools: import flexible branching support
  linux-yocto: bump kernel version to v3.0.14
  linux-yocto: use src_patches for out of tree kernel feature support

Nitin A Kamble (6):
  python-pycairo: fix for x32
  libevent: fix compilation for x32
  vte: update patch header
  automake-1.11.2: backport pkglibexec_SCRIPTS fix
  mc: remove not needed fix for automake 1.11.2
  systemtap: remove not needed fix for automake 1.11.2

Otavio Salvador (8):
  qt4-graphics-system: add
  qt4e.bbclass: add QT_BASE_NAME for use in recipes
  qt4x11.bbclass: add QT_BASE_NAME for use in recipes
  qt4-embedded.inc: use QT_BASE_NAME from qt4e.bbclass
  qt4-x11-free.inc: use QT_BASE_NAME from qt4x11.bbclass
  initscripts: avoid mounting /sys if it is already mounted
  udev: ensure /dev/pts and /dev/shm does exists
  udev: improve udev-cache robustness

Paul Eggleton (4):
  buildhistory: add script to check for significant changes
  classes/buildhistory: add hostname to commit message
  classes/buildhistory: make the package version backwards error
    non-fatal
  classes/buildhistory: remove redundant package history checking stub

Saul Wold (2):
  util-linux: Update patch for non-GPLv3
  gnutls: remove gettext patch for non-GPLv3

 meta/classes/buildhistory.bbclass                  |   16 +-
 meta/classes/kernel-yocto.bbclass                  |   67 ++++++-
 meta/classes/qt4e.bbclass                          |    1 +
 meta/classes/qt4x11.bbclass                        |    1 +
 meta/lib/oe/buildhistory_analysis.py               |  240 ++++++++++++++++++++
 .../initscripts/initscripts-1.0/sysfs.sh           |    4 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/udev/udev.inc                    |   11 +-
 meta/recipes-core/udev/udev/init                   |   23 ++-
 meta/recipes-core/udev/udev/udev-cache             |   20 ++-
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +
 .../util-linux-2.20.1/remove-lscpu.patch           |   94 +-------
 ...utomake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch |  118 ++++++++++
 meta/recipes-devtools/automake/automake_1.11.2.bb  |    5 +-
 .../python/python-pycairo_1.10.0.bb                |    6 +-
 .../mc/files/fix_for_automake_1.11.2.patch         |   69 ------
 meta/recipes-extended/mc/mc_4.8.1.bb               |    3 +-
 .../x11-common/x11-common/etc/X11/Xserver          |   24 --
 .../xorg-driver/xf86-video-fbdev_0.4.2.bb          |    8 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +-
 .../systemtap/fix_for_automake_1.11.2.patch        |   46 ----
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    6 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   27 +++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    3 +-
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   13 +-
 .../libevent/libevent-2.0.16_fix_for_x32.patch     |   47 ++++
 meta/recipes-support/libevent/libevent_2.0.16.bb   |    5 +-
 meta/recipes-support/vte/vte/introspection.patch   |    8 +
 scripts/buildhistory-diff                          |   43 ++++
 32 files changed, 656 insertions(+), 289 deletions(-)
 create mode 100644 meta/lib/oe/buildhistory_analysis.py
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
 create mode 100644 meta/recipes-devtools/automake/automake/automake_1.11.2_fix_for_pkglibexec_SCRIPTS.patch
 delete mode 100644 meta/recipes-extended/mc/files/fix_for_automake_1.11.2.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
 create mode 100644 meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
 create mode 100644 meta/recipes-support/libevent/libevent/libevent-2.0.16_fix_for_x32.patch
 create mode 100755 scripts/buildhistory-diff

-- 
1.7.6.4



