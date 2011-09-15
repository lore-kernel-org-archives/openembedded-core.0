Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Ux-0001Ud-T7
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264355"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:57 -0700
Message-Id: <d55838ea019e57633b7f81fe243b852616e25dc9.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 08/13] linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:24 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Merging the following commit for the -rt machines:

[
    preempt-rt/base: correct 3.0.3->3.0.4 mismerge for, stop_machine.c

    Commit 0b805cce57f61a244eb3b8fce460b14f1be442b3 dropped a change making
    stop_cpus_mutex non-static, resulting in a build failure for 3.0.4-rt
    kernels.

    Restore the move to non-static from commit
    6857336c7fddaf460a13adc0c395698fcf9423ff.

    Reported-by: Kishore Bodke <kishore.k.bodke@intel.com>
    Signed-off-by: Darren Hart <dvhart@linux.intel.com>
]

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 36717d6..b3bb4ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -14,8 +14,8 @@ KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 LINUX_VERSION ?= "3.0.4"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
-SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
+SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
+SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
 SRCREV_meta ?= "12574e5a77597f6938315ef82d18fc5e229fb79c"
 
 PR = "r1"
-- 
1.7.6



