Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5E5-0003hm-9S
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:21:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282279"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:33 -0800
Message-Id: <cover.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/19] Community Chest
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
X-List-Received-Date: Tue, 31 Jan 2012 04:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Kernel Update from Bruce, they need a meta-yocto change set also.
I pulled the first part of Steve's GNUGP changes, but not the enabling
part since that is getting tweaked still.

Generally the other changes seems ok, autobuilder is still chugging
away on the MUT branch.

Sau!


The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (2):
  image_types.bbclass: refactor cpio images generation.
  tzdata_2011n: provide pkg_postinst and timezone defaults

Bruce Ashfield (3):
  kern-tools: import config audit and branch manipulation updates
  linux-yocto: add kernel 3.2.2 support
  linux-yocto: update to v3.0.18 + features

Eric Bénard (1):
  qt4-tools-nativesdk-4.8.0: fix build

Khem Raj (4):
  gdb-common: Drop elfutils from DEPENDS
  arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
  tunearch/arm: Differentiate between thumb code generation and thumb
    capability
  tune-thumb.inc: Delete

Koen Kooi (3):
  alsa-state: fix RDEPENDS assignment
  alsa-utils: make alsa-utils-alsactl recommend alsa-states
  classes: replace 'Poky' with 'OE-core'

Martin Jansa (1):
  rootfs_ipk: remove runtime_script_required usage

Saul Wold (3):
  default-providers: add kbd as PREFERRED_PROVIDER for console-tools
  gcc-runtime: fix override from poky-lsb to linuxstdbase
  genext2fs: fix inode computation

Steve Sakoman (2):
  libksba: add recipe for 1.2.0
  gnupg: add recipe for 2.0.18

 meta/classes/image_types.bbclass                   |   21 +++++-
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/package_rpm.bbclass                   |   10 ++--
 meta/classes/rootfs_ipk.bbclass                    |    2 +-
 meta/classes/sanity.bbclass                        |    2 +-
 meta/classes/staging.bbclass                       |    2 +-
 meta/classes/toolchain-scripts.bbclass             |    2 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   20 +++++--
 meta/conf/machine/include/tune-strongarm1100.inc   |    4 +-
 meta/conf/machine/include/tune-thumb.inc           |   32 ----------
 meta/recipes-bsp/alsa-state/alsa-state.bb          |    5 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb       |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    6 +-
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   35 +++++++++++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |    4 +-
 meta/recipes-extended/tzdata/tzdata_2011n.bb       |   62 ++++++++++++++++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   37 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   19 +++---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   41 +++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 +-
 .../qt4/{files => qt-4.7.4}/configure-lflags.patch |    0
 .../recipes-qt/qt4/qt-4.8.0/configure-lflags.patch |   18 ++++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   10 ++-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    3 +-
 meta/recipes-support/gnupg/gnupg_2.0.18.bb         |   25 ++++++++
 meta/recipes-support/libksba/libksba_1.2.0.bb      |   12 ++++
 29 files changed, 305 insertions(+), 87 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.2.bb
 rename meta/recipes-qt/qt4/{files => qt-4.7.4}/configure-lflags.patch (100%)
 create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
 create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb

-- 
1.7.6.5



