Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pvav7-0006F3-P2
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:44:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2011 11:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="609190614"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2011 11:42:09 -0800
Message-Id: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 11:40:30 -0800
Date: Fri, 04 Mar 2011 11:42:09 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/13] Consolidated Pull Request from Yocto Team
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
X-List-Received-Date: Fri, 04 Mar 2011 19:44:14 -0000

From: Saul Wold <sgw@linux.intel.com>

This is a batch of fixes for bernard with Documentation
updates and distro tracking/data updates. This also address
some LSB related issues.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Darren Hart (2):
  module: build hostprogs for each module
  hello-mod: add a module for testing module.bbclass

Jingdong Lu (1):
  task-poky-lsb: add python-misc

Lianhao Lu (1):
  toolchain-script.bbclass: Added --sysroot to LDFLAGS.

Mei Lei (1):
  distrodata.bbclass: Get git repo tag information

Saul Wold (1):
  distro tracking: Updates to Tracking infor for clutter and other
    changes

Scott Rifenbark (2):
  documentation/kernel-manual/figures/kernel-title.png: Updated title
    graphic
  documentation/kernel-manual:  Kernel manual Style changes

Xiaofeng Yan (3):
  LSB_Setup.sh:Install LSB Test Suite and set lsb test environment
  creat-lsb-image: Add some functions for creating a appropriate image
    to make lsb test
  task-poky-lsb: Add packges needed by LSB Test Suite

Yu Ke (1):
  x11vnc: fix the endian issue in mips for bug 782

Zhai Edwin (1):
  qemu-script: Remove mmap_min_addr check

 .../kernel-manual/figures/kernel-title.png         |  Bin 14549 -> 14305 bytes
 documentation/kernel-manual/style.css              |   30 +-
 .../yocto-project-kernel-manual-customization.xsl  |    2 +-
 meta/classes/distrodata.bbclass                    |   52 +++-
 meta/classes/module.bbclass                        |   12 +-
 meta/classes/toolchain-scripts.bbclass             |    2 +
 .../conf/distro/include/distro_tracking_fields.inc |   32 +-
 meta/recipes-core/meta/meta-environment.bb         |    2 +-
 meta/recipes-core/meta/meta-toolchain.bb           |    2 +-
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |   20 +-
 meta/recipes-extended/tasks/task-poky-lsb.bb       |   17 +-
 .../recipes-graphics/x11vnc/files/endian-fix.patch |   22 ++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb      |    5 +-
 meta/recipes-kernel/hello-mod/files/COPYING        |  340 ++++++++++++++++++++
 meta/recipes-kernel/hello-mod/files/Makefile       |   14 +
 meta/recipes-kernel/hello-mod/files/hello.c        |   33 ++
 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb     |   15 +
 scripts/creat-lsb-image                            |  148 +++++----
 scripts/poky-qemu-internal                         |    7 -
 19 files changed, 633 insertions(+), 122 deletions(-)
 mode change 100755 => 100644 documentation/kernel-manual/figures/kernel-title.png
 create mode 100644 meta/recipes-graphics/x11vnc/files/endian-fix.patch
 create mode 100644 meta/recipes-kernel/hello-mod/files/COPYING
 create mode 100644 meta/recipes-kernel/hello-mod/files/Makefile
 create mode 100644 meta/recipes-kernel/hello-mod/files/hello.c
 create mode 100644 meta/recipes-kernel/hello-mod/hello-mod_0.1.bb



