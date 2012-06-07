Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2Z-0004qy-Rm
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:44 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07Da018923;
	Thu, 7 Jun 2012 13:00:11 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:45 -0400
Message-Id: <3adb30f8aa3039be032889851c4c080dab459d9e.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/9] linux-yocto: remove v2.6.37 recipe
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:44 -0000

With the introduction of the 3.4 kernel recipe, the 2.6.37 kernel
recipe is removed, keeping the supported list at three kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   38 -----------------------
 1 files changed, 0 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb b/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
deleted file mode 100644
index 3968c62..0000000
--- a/meta/recipes-kernel/linux/linux-yocto_2.6.37.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-inherit kernel
-require linux-yocto.inc
-
-KMACHINE = "yocto/standard/base"
-KMACHINE_qemux86  = "yocto/standard/common-pc/base"
-KMACHINE_qemux86-64  = "yocto/standard/common-pc-64/base"
-KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
-KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
-KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
-
-KBRANCH = "${KMACHINE}"
-
-KMETA = "meta"
-
-LINUX_VERSION ?= "2.6.37"
-
-SRCREV_machine_qemuarm = "b3e53a090eaa23aa82e64fa0a563a93a2b4dbb5d"
-SRCREV_machine_qemumips = "91f2eb4a3b447476b36aac8e6e198d08c98e0680"
-SRCREV_machine_qemuppc = "862faf3666b3a4e4bc1d469ff5fb3fb90c25f621"
-SRCREV_machine_qemux86 = "27ad78e1f6378da554775a7d6760730c92f8c5a7"
-SRCREV_machine_qemux86-64 = "af2bfbe5f757361b5b027a24d67a93bfdfaaf33c"
-SRCREV_machine = "4ae8f8605c81c39b959948e23f7123294a5dfb3f"
-SRCREV_meta = "aeea99683c7283f1f3320bf2ee7085ee252d4e7e"
-
-PR = "r23"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
-
-# Functionality flags
-KERNEL_FEATURES = "features/netfilter"
-KERNEL_FEATURES_append = " features/taskstats"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-
-require linux-tools.inc
-- 
1.7.5.4



