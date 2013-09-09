Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 692FA6BE96
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 16:49:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Sep 2013 09:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,872,1371106800"; d="scan'208";a="400708088"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.204])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2013 09:49:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 09:49:02 -0700
Message-Id: <cover.1378744742.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/23] Post M4 Patch set
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
X-List-Received-Date: Mon, 09 Sep 2013 16:49:01 -0000

Richard,

Here is a set of changes for Milestone 5, yes I have included a couple of 
updates as I think they are appropriate for the overall replease.

I spoke to Otavio about the u-boot and he told me the tools are ready to go.

Thanks
	Sau!
The following changes since commit 57be84259f0885865c85d7bac350979430b956b5:

  cmake: set system name correctly (2013-09-08 10:48:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Roxell (1):
  ltp: update to new release 20130904

Chen Qi (2):
  ptest.bbclass: fix error on ubuntu host
  ptest.bbclass: add cleandirs flag to do_install_ptest_base

Khem Raj (1):
  systemd: Fix build with multilib

Li Zhijian (1):
  libxml2: make xmlcatalog work via --with-catalog

Muhammad Shakeel (5):
  openssh: Add systemd support
  lighttpd: Add systemd support
  rpcbind: Add systemd support
  nfs-utils: Add systemd support
  systemd: Remove base_libdir if installed only for systemd_unitdir

Otavio Salvador (1):
  u-boot, u-boot-fw-utils-cross, u-boot-mkimage: Upgrade to 2013.07

Paul Woegerer (3):
  lttng-ust: Update to version 2.3.0
  lttng-tools: Update to version 2.3.0
  lttng-modules: Update to version 2.3.0

Peter Kjellerstedt (2):
  bb-matrix: Clean before, rather than after, building
  bb-matrix: Make sure local.conf does not interfere

Ross Burton (4):
  qemu: add recommend of kernel-modules for all qemu machines
  mesa: use distro_features_check to abort build without opengl feature
  xf86-video-intel: allow builds without opengl, add more options
  systemd: update patch header and comments

Roy.Li (1):
  systemd: add ptest

Saul Wold (1):
  qemu.inc: remove apm as a MACHINE_FEATURE

Tudor Florea (1):
  kmod: avoid parallel-tests

 meta/classes/ptest.bbclass                         | 26 ++++---
 meta/classes/systemd.bbclass                       |  3 +
 meta/conf/machine/include/qemu.inc                 |  4 +-
 meta/conf/machine/qemumips.conf                    |  2 -
 meta/conf/machine/qemumips64.conf                  |  2 -
 .../u-boot/files/fix-arm920t-eabi.patch            | 24 -------
 .../u-boot/u-boot-fw-utils-cross_2013.07.bb        | 38 ++++++++++
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | 28 --------
 .../u-boot/u-boot-fw-utils_2013.01.01.bb           | 33 ---------
 ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------------
 ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  | 31 --------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  | 29 --------
 .../u-boot/u-boot-mkimage_2013.01.01.bb            | 33 ---------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 16 +++--
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          | 24 -------
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          | 24 -------
 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb       | 29 --------
 .../nfs-utils/nfs-utils/nfs-mountd.service         | 11 +++
 .../nfs-utils/nfs-utils/nfs-server.service         | 18 +++++
 .../nfs-utils/nfs-utils/nfs-statd.service          | 12 ++++
 .../nfs-utils/nfs-utils/nfs-utils.conf             | 35 +++++++++
 .../nfs-utils/nfs-utils_1.2.8.bb                   | 21 +++++-
 .../openssh/openssh-6.2p2/sshd.socket              | 11 +++
 .../openssh/openssh-6.2p2/sshd@.service            |  9 +++
 .../openssh/openssh-6.2p2/sshdgenkeys.service      | 10 +++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb | 19 ++++-
 meta/recipes-core/libxml/libxml2.inc               |  2 +-
 .../systemd/systemd/binfmt-install.patch           |  9 ++-
 meta/recipes-core/systemd/systemd/run-ptest        |  2 +
 meta/recipes-core/systemd/systemd_206.bb           | 18 ++++-
 .../lighttpd/files/lighttpd.service                | 12 ++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  | 12 +++-
 .../ltp/{ltp_20130503.bb => ltp_20130904.bb}       | 10 +--
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf |  3 +
 .../rpcbind/rpcbind/rpcbind.service                | 14 ++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     | 16 ++++-
 meta/recipes-graphics/mesa/mesa.inc                |  4 +-
 .../xorg-driver/xf86-video-intel_2.21.13.bb        |  9 ++-
 meta/recipes-kernel/kmod/kmod.inc                  |  1 +
 .../kmod/kmod/remove_parallel_tests.patch          | 18 +++++
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |  4 +-
 .../{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb} |  4 +-
 .../{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb}     |  4 +-
 scripts/contrib/bb-perf/bb-matrix.sh               | 16 +++--
 47 files changed, 341 insertions(+), 551 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-mountd.service
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-server.service
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-statd.service
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.conf
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
 create mode 100644 meta/recipes-core/systemd/systemd/run-ptest
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd.service
 rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (94%)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
 create mode 100644 meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb} (93%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb} (93%)

-- 
1.8.3.1


