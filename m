Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R3u0l-00088l-7R
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:16:39 +0200
Received: from localhost.localdomain (yow-pbarrett-lx.ottawa.windriver.com
	[128.224.146.11])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EIBIX8010737;
	Wed, 14 Sep 2011 11:11:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Sep 2011 14:11:12 -0400
Message-Id: <bf5014b426ee0629a8011677447810097c5294de.1316023378.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316023378.git.bruce.ashfield@windriver.com>
References: <cover.1316023378.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1316023378.git.bruce.ashfield@windriver.com>
References: <cover.1316023378.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c
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
X-List-Received-Date: Wed, 14 Sep 2011 18:16:39 -0000

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
1.7.4.1



