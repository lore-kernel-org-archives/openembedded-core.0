Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RrxYL-00017L-Bn
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:10:13 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0UK2DFw017744;
	Mon, 30 Jan 2012 12:02:16 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 Jan 2012 15:02:12 -0500
Message-Id: <0d4ac91a1168574ac0a652355d8639dcac796711.1327952323.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1327952323.git.bruce.ashfield@windriver.com>
References: <cover.1327952323.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: update to v3.0.18 + features
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
X-List-Received-Date: Mon, 30 Jan 2012 20:10:13 -0000

The -stable team released v3.0.18, so it becomes the new base for the
linux-yocto_3.0 recipe.

Along with the 3.0.18 update this kernel refresh brings in the following
changes:

  59314a3 meta/beagleboard: Using CONFIG_PANEL_GENERIC_DPI=y
  b168325 crownbay: use emgd-1.10
  281b80f kver: bumping to v3.0.18
  0d5d0dd common-pc*: add SMP and virtio

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   19 +++++++++----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 9a543ab..5402f17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.14"
+LINUX_VERSION ?= "3.0.18"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "f1cc220f4ddf434bf254707c83a45794a63f117f"
-SRCREV_machine_qemuppc ?= "8bd5b80cb3243dadc9d6c5c09482c49994dff1a8"
-SRCREV_meta ?= "665fea1c249b4f335cb1c9a46a9f2c138d611f1a"
+SRCREV_machine ?= "2f9d925f5681eaae7f341cc1270c739e8b329c03"
+SRCREV_machine_qemuppc ?= "c66f7ef2315010756c8c97af6b13d52f9f18c03b"
+SRCREV_meta ?= "59314a3523e360796419d76d78c6f7d8c5ef2593"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 9d51bd0..6ff6027 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,16 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.14"
-
-
-SRCREV_machine_qemuarm ?= "c0386e4195c685b0ff94b7e21581ec47008ab13b"
-SRCREV_machine_qemumips ?= "56e4361a1bfc10042d83a7d8a5f96932056e3f35"
-SRCREV_machine_qemuppc ?= "53e71af30e30162e17e32b2f57e4481f5bc0573e"
-SRCREV_machine_qemux86 ?= "9e73573b6b227ab2c62e66e63470866d136f8d76"
-SRCREV_machine_qemux86-64 ?= "3551fd0412965b1f6b0b2f6ba35f7fecdaddb58a"
-SRCREV_machine ?= "6f5b11830deba4a6262c8c4abf67e608924f649e"
-SRCREV_meta ?= "665fea1c249b4f335cb1c9a46a9f2c138d611f1a"
+LINUX_VERSION ?= "3.0.18"
+
+SRCREV_machine_qemuarm ?= "48e68bd72da497a14200801140b3b87dae6d60e9"
+SRCREV_machine_qemumips ?= "9d86aeb43e5bbb0851cc4f105b64caab13bc71f3"
+SRCREV_machine_qemuppc ?= "15fd748017f0849138ff4b47d73f6866fa26cfe8"
+SRCREV_machine_qemux86 ?= "8f74a4339b3dc029fafff0ba7d88d6dc950d4b31"
+SRCREV_machine_qemux86-64 ?= "610c5a62daeda033755b0b7bfcb3e2cad5c76f3f"
+SRCREV_machine ?= "5df0b4c2538399aed543133b3855f809adf08ab8"
+SRCREV_meta ?= "59314a3523e360796419d76d78c6f7d8c5ef2593"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



