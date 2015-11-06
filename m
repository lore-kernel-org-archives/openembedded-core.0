Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA5176E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:18:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 08:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="679816470"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 06 Nov 2015 08:18:04 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 16:16:59 +0000
Message-Id: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/3] yocto-bsp: Fixes on unpacking/patching issues
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
X-List-Received-Date: Fri, 06 Nov 2015 16:18:05 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Patches 0002/0003 allows building generate BSP layers by the yocto-bsp. Patch
0001 is a rename from an original bad prefix bbappend file.

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/yocto-bsp-intel-bug8630
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/yocto-bsp-intel-bug8630

Leonardo Sandoval (3):
  yocto-bsp: Typo on the file extension
  yocto-bsp: Set KTYPE to user selected base branch
  yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV

 .../arch/arm/recipes-kernel/linux/files/machine-preempt-rt.scc      | 3 ++-
 .../target/arch/arm/recipes-kernel/linux/files/machine-standard.scc | 3 ++-
 .../target/arch/arm/recipes-kernel/linux/files/machine-tiny.scc     | 3 ++-
 .../arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend      | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend  | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend  | 6 +++---
 .../linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend}     | 6 +++---
 .../arch/i386/recipes-kernel/linux/files/machine-preempt-rt.scc     | 3 ++-
 .../arch/i386/recipes-kernel/linux/files/machine-standard.scc       | 3 ++-
 .../target/arch/i386/recipes-kernel/linux/files/machine-tiny.scc    | 3 ++-
 .../arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/mips/recipes-kernel/linux/files/machine-preempt-rt.scc     | 3 ++-
 .../arch/mips/recipes-kernel/linux/files/machine-standard.scc       | 3 ++-
 .../target/arch/mips/recipes-kernel/linux/files/machine-tiny.scc    | 3 ++-
 .../arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/mips64/recipes-kernel/linux/files/machine-preempt-rt.scc   | 3 ++-
 .../arch/mips64/recipes-kernel/linux/files/machine-standard.scc     | 3 ++-
 .../target/arch/mips64/recipes-kernel/linux/files/machine-tiny.scc  | 3 ++-
 .../arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 2 +-
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/files/machine-preempt-rt.scc  | 3 ++-
 .../arch/powerpc/recipes-kernel/linux/files/machine-standard.scc    | 3 ++-
 .../target/arch/powerpc/recipes-kernel/linux/files/machine-tiny.scc | 3 ++-
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 6 +++---
 .../arch/qemu/recipes-kernel/linux/files/machine-preempt-rt.scc     | 3 ++-
 .../arch/qemu/recipes-kernel/linux/files/machine-standard.scc       | 3 ++-
 .../target/arch/qemu/recipes-kernel/linux/files/machine-tiny.scc    | 3 ++-
 .../arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/files/machine-preempt-rt.scc   | 3 ++-
 .../arch/x86_64/recipes-kernel/linux/files/machine-standard.scc     | 3 ++-
 .../target/arch/x86_64/recipes-kernel/linux/files/machine-tiny.scc  | 3 ++-
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 70 files changed, 187 insertions(+), 166 deletions(-)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (83%)

-- 
1.8.4.5


