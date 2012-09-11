Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TBSPr-0000Xm-2h
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:30:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFHgwt015656;
	Tue, 11 Sep 2012 08:17:43 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 11 Sep 2012 11:17:29 -0400
Message-Id: <ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347376358.git.bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347376358.git.bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:30:19 -0000

When x32 is the tuning for a x86 MACHINE, the kernel should also have
CONFIG_X86_X32=y.

This can be accomplished by adding the x32 configuraion fragment to the
KERNEL_FEATURES when x32 is the tuning for a given machine.

cc: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    3 ++-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 4fd3845..156fb93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
 SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
-SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
+SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
@@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
+KERNEL_FEATURES_append_x32 = " cfg/x32"
\ No newline at end of file
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 59ad4b2..bcd1292 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "b9a720ca38d298ed457f37d099c85771f9164b19"
 SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
 SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
 SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
-SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
+SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
@@ -27,3 +27,4 @@ KERNEL_REVISION_CHECKING=""
 KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES_append_x32 = " cfg/x32"
-- 
1.7.5.4



