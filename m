Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RM0vl-0002CJ-LZ
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 18:18:22 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA3HC8s6004949;
	Thu, 3 Nov 2011 10:12:09 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  3 Nov 2011 13:11:27 -0400
Message-Id: <e643b059a95d419b5efba71150927d66664d59f4.1320340081.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1320340081.git.bruce.ashfield@windriver.com>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1320340081.git.bruce.ashfield@windriver.com>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto_3.0: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 17:18:22 -0000

The board branches are updated to have v3.0.8 as their base kernel
revision, and the version in the recipe is updated to match.

This commit also updates the meta branch to pick up the following
4 commits:

  4095bb5 meta/common-pc-64: remove igb
  17565fa meta/crownbay: use power/intel feature
  8948937 meta/sugarbay: use power/intel feature
  fcbc8a9 meta: add power feature

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 72db7bf..615209b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
 SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_meta ?= "353d43d340e87996b4be4c5f6ddb4447e050b65c"
+SRCREV_meta ?= "4095bb597a7bcd647856aa35b5fb8637ed7ff975"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 9da7cc1..688999f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.4"
-
-SRCREV_machine_qemuarm ?= "7908f38ac44359d58c40b166dbb45e48fc58295c"
-SRCREV_machine_qemumips ?= "7ea75f58d69293e6b1c2f904f8f5790521a7ccee"
-SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
-SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
-SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
-SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
-SRCREV_meta ?= "353d43d340e87996b4be4c5f6ddb4447e050b65c"
+LINUX_VERSION ?= "3.0.8"
+
+SRCREV_machine_qemuarm ?= "d2f4973505e9cebcf2fc0058434214927deed5e6"
+SRCREV_machine_qemumips ?= "42968ceaecd71ae57157676aa63542db409732cb"
+SRCREV_machine_qemuppc ?= "16eb6506148ff163cfc4f4516110275726831014"
+SRCREV_machine_qemux86 ?= "fea3842615c13a54180b6600783b222f499002ef"
+SRCREV_machine_qemux86-64 ?= "5f86f8f0a3102e1c7d0164abefcd50d825aa468f"
+SRCREV_machine ?= "a811486d28dd9b0e1af0672a65ad9fa97873b82a"
+SRCREV_meta ?= "4095bb597a7bcd647856aa35b5fb8637ed7ff975"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



