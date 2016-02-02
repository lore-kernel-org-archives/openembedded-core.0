Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6D1E76EBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:29:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 10:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="646029204"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 10:29:01 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 10:25:42 +0000
Message-Id: <1454408746-552-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Cc: saul.wold@intel.com
Subject: [PATCH 0/4][jethro] yocto-bsp related patches backported from master
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
X-List-Received-Date: Tue, 02 Feb 2016 18:29:01 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Set of patches that mainly fixes the do_patch issues found when creating
BSP layers with the yocto-bsp tool. More detail on each patch description.

Leonardo Sandoval (4):
  yocto-bsp: Default kernel version to 4.1 on x86_64
  yocto-bsp: Avoid duplication of user patches
    ({{=machine}}-user-patches.scc)
  yocto-bsp: Set KTYPE to user selected base branch
  yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV

 .../arch/arm/recipes-kernel/linux/files/machine-preempt-rt.scc     | 3 ++-
 .../arch/arm/recipes-kernel/linux/files/machine-standard.scc       | 3 ++-
 .../target/arch/arm/recipes-kernel/linux/files/machine-tiny.scc    | 3 ++-
 .../target/arch/arm/recipes-kernel/linux/linux-yocto-dev.bbappend  | 1 -
 .../arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend | 7 +++----
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend | 7 +++----
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 7 +++----
 .../arch/i386/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
 .../arch/i386/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
 .../target/arch/i386/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
 .../target/arch/i386/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
 .../arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
 .../arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
 .../arch/mips/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
 .../arch/mips/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
 .../target/arch/mips/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
 .../target/arch/mips/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
 .../arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
 .../arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
 .../arch/mips64/recipes-kernel/linux/files/machine-preempt-rt.scc  | 3 ++-
 .../arch/mips64/recipes-kernel/linux/files/machine-standard.scc    | 3 ++-
 .../target/arch/mips64/recipes-kernel/linux/files/machine-tiny.scc | 3 ++-
 .../arch/mips64/recipes-kernel/linux/linux-yocto-dev.bbappend      | 1 -
 .../arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
 .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
 .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 5 ++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 7 +++----
 .../arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 7 +++----
 .../arch/powerpc/recipes-kernel/linux/files/machine-preempt-rt.scc | 3 ++-
 .../arch/powerpc/recipes-kernel/linux/files/machine-standard.scc   | 3 ++-
 .../arch/powerpc/recipes-kernel/linux/files/machine-tiny.scc       | 3 ++-
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-dev.bbappend     | 1 -
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend    | 7 +++----
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend    | 7 +++----
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend     | 7 +++----
 .../arch/qemu/recipes-kernel/linux/files/machine-preempt-rt.scc    | 3 ++-
 .../arch/qemu/recipes-kernel/linux/files/machine-standard.scc      | 3 ++-
 .../target/arch/qemu/recipes-kernel/linux/files/machine-tiny.scc   | 3 ++-
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto-dev.bbappend | 1 -
 .../arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 7 +++----
 .../arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 7 +++----
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend | 7 +++----
 .../arch/x86_64/recipes-kernel/linux/files/machine-preempt-rt.scc  | 3 ++-
 .../arch/x86_64/recipes-kernel/linux/files/machine-standard.scc    | 3 ++-
 .../target/arch/x86_64/recipes-kernel/linux/files/machine-tiny.scc | 3 ++-
 .../target/arch/x86_64/recipes-kernel/linux/kernel-list.noinstall  | 2 +-
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-dev.bbappend      | 1 -
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
 .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
 .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 7 +++----
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 7 +++----
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 7 +++----
 78 files changed, 189 insertions(+), 196 deletions(-)

-- 
2.6.2


