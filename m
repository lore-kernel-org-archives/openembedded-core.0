Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 86C277709E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:18:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 08:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="679816473"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 06 Nov 2015 08:18:04 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 16:17:02 +0000
Message-Id: <b413fa3ac49fd133da8f4128c539153d285029a7.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1446823405.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/3] yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
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

By default, checkout to latest revision from the machine branch specified by
the user.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend      | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend  | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend  | 6 +++---
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 2 +-
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend  | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend     | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend     | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend      | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend | 6 +++---
 .../target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend  | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 49 files changed, 145 insertions(+), 145 deletions(-)

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 5f8db03..c56e9e5 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index 471ccbc..15b9b1b 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index 4de82fa..caefcfc 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 1e1cc51..270f48e 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 97e1bb8..c8312e9 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 2ffb7a6..4ac4483 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 5f8db03..c56e9e5 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index 471ccbc..15b9b1b 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index 4de82fa..caefcfc 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
index fbb49ed..43e1372 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 0c2cb5a..56e8302 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
index d4862b5..daa5784 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 5f8db03..c56e9e5 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index c7e7989..7c6bc7f 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index a9ba0ae..7f20379 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 1e1cc51..270f48e 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 97e1bb8..c8312e9 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 61adafd..854ba62 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 5f8db03..c56e9e5 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index c7e7989..7c6bc7f 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index a9ba0ae..7f20379 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
index fb6cdef..777ec4d 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,7 +26,7 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
 SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
 SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 134aeec..2632826 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 851d306..f2f6318 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 7a25446..4700d98 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index 471ccbc..15b9b1b 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index 4de82fa..caefcfc 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
index e688384..7d70513 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
index ded9e85..c66c33f 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 61adafd..854ba62 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index ce5e1a0..9e5aa97 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index 7879ce2..1faac44 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index f7ef4bb..51fc7d0 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index 1990419..14ee16f 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 626019c..634a21f 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
index b4798b7..e54d470 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
index dc8a5be..4cff8e3 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -55,8 +55,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
index 7a25446..4700d98 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-preempt-rt.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "f35992f80c81dc5fa1a97165dfd5cbb84661f7cb"
-#SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "1b534b2f8bbe9b8a773268cfa30a4850346f6f5f"
+SRCREV_machine_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-rt_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
index 471ccbc..15b9b1b 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
index 4de82fa..caefcfc 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
index bbff78d..0a47a4e 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-tiny.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
index ca0b497..cc7bb92 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.14"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend
index dba63c3..5b21e9f 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "3.19"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 9cc2a7f..8f76f07 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -26,8 +26,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
 #LINUX_VERSION = "4.1"
-- 
1.8.4.5


