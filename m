Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Us-0001UW-PE
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264342"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:49 -0700
Message-Id: <cover.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
Subject: [RC2 PULL 00/13] Prelinker, Kernel and distro tracking
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Please pull this first before pulling any other changes, so that 
we can tag / branch this for RC2.

These changes are all reviewed.  There is a kernel update, deb packaging
fix, prelinker and distro tracking updates.

I also included Paul's core-console change, Tom's Grub2 move and 
the blacklisting of diginotar certs.

This is what was built on the Autobuilder for RC2 with no failures in
the build.

Thanks
	Sau!


The following changes since commit 8df322abfd3fa8c460fd73c83c1ef0b5e419dc11:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:27:08 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/stage
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  linux-yocto: move common tasks to a common location
  linux-yocto: split e100 and e1000 support
  linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c

Dexuan Cui (1):
  package_deb.bbclass, populate_sdk_deb.bbclass: fix
    meta-toolchain-gmae build

Dongxiao Xu (1):
  distro_tracking: update package alias

Eric Bénard (1):
  qt4: add blacklist-diginotar-certs patch

Mark Hatle (1):
  Uprev to latest version of prelink_git, fixing TLS issues

Paul Eggleton (1):
  task-core: split into task-core-console and task-core-x11

Saul Wold (1):
  task-core-sdk: change task-core -> task-core-console

Tom Zanussi (2):
  initramfs-live-install: add support for grub2
  grub2: new recipe

Yu Ke (1):
  distro_tracking_field: add distro checking field

Zhai Edwin (1):
  distro-tracking: Update alias

 meta/classes/package_deb.bbclass                   |   10 +--
 meta/classes/populate_sdk_deb.bbclass              |    6 +-
 .../conf/distro/include/distro_tracking_fields.inc |   63 +++++++++++--
 meta/conf/multilib.conf                            |    3 +-
 meta/recipes-bsp/grub/grub-1.99/40_custom          |    9 ++
 .../grub/grub-1.99/grub-install.in.patch           |   20 ++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |   44 +++++++++
 .../initrdscripts/files/init-install.sh            |   31 +++++--
 .../initrdscripts/initramfs-live-install_1.0.bb    |    8 +-
 meta/recipes-core/tasks/task-core-console.bb       |   28 ++++++
 meta/recipes-core/tasks/task-core-sdk.bb           |    2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |    8 +--
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   14 +--
 meta/recipes-kernel/linux/linux-yocto.inc          |    5 +
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   13 +---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   10 +--
 .../qt4/files/blacklist-diginotar-certs.diff       |   95 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.3.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
 meta/recipes-qt/qt4/qt4-native_4.7.3.bb            |    2 +
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    2 +
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 .../tasks/{task-core.bb => task-core-x11.bb}       |   17 +---
 26 files changed, 317 insertions(+), 86 deletions(-)
 create mode 100755 meta/recipes-bsp/grub/grub-1.99/40_custom
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
 create mode 100644 meta/recipes-bsp/grub/grub_1.99.bb
 create mode 100644 meta/recipes-core/tasks/task-core-console.bb
 create mode 100644 meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
 rename meta/recipes-sato/tasks/{task-core.bb => task-core-x11.bb} (79%)

-- 
1.7.6



