Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5829177027
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="655095417"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 05:38:31 +0000
Message-Id: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/5] yocto-bsp: Update templates to 4.1 kernel
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Besides updating the templates to 4.1 kernel, there are a few changes done in
the yocto-bsp script. More info can be found on each patch's description.

The following changes since commit f78f90240a3041be426c6ba9085849352164ee8b:

  bitbake: prserv/serv.py: Better messaging when starting/stopping the server with port=0 (2015-09-28 12:00:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/yocto-bsp
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/yocto-bsp

Leonardo Sandoval (5):
  scripts/yocto-bsp: Exit successfully when asking for help
  scrips/lib/bsp/engine: List properties to stdout when output parameter
    is omitted
  yocto-bsp: Update templates to 4.1 kernel
  scripts/lib/bsp/engine: Indent the karch properties when stored into a
    file
  lib/oeqa/selftest/yoctobsp: Basic tests for yocto-bsp script

 meta/lib/oeqa/selftest/yoctobsp.py                 | 39 ++++++++++++++
 scripts/lib/bsp/engine.py                          |  6 +--
 .../arm/recipes-kernel/linux/kernel-list.noinstall |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbapend   | 33 ++++++++++++
 .../target/arch/i386/conf/machine/machine.conf     |  4 +-
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../target/arch/powerpc/conf/machine/machine.conf  |  2 +-
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 62 ++++++++++++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 62 ++++++++++++++++++++++
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 scripts/yocto-bsp                                  |  2 +-
 25 files changed, 578 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/yoctobsp.py
 create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend

-- 
1.8.4.5


