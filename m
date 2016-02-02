Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 54FD4771B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:29:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 10:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="646029229"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 10:29:01 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 10:25:46 +0000
Message-Id: <1454408746-552-5-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454408746-552-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1454408746-552-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH 4/4][jethro] yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
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

By default, checkout to latest revision from the machine branch specified by
the user.

(From meta-yocto rev: f79a43406b5b323587415380ecffc87527c64653)

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a35f79ddd8afe54835ad927b21b8f7cfbd86202a)
Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../arch/arm/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend    | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend  | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend  | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend   | 6 +++---
 .../arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 8 ++++----
 .../arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend       | 8 ++++----
 .../target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 8 ++++----
 .../arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 8 ++++----
 .../arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 8 ++++----
 .../arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 8 ++++----
 .../arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend | 6 +++---
 .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
 .../mips64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
 .../mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend    | 2 +-
 .../arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend    | 8 ++++----
 .../arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend     | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend     | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend   | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend   | 6 +++---
 .../powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend    | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend   | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend   | 6 +++---
 .../arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend    | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend   | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend  | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend      | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend      | 6 +++---
 .../arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend       | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend | 6 +++---
 .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend    | 6 +++---
 .../x86_64/recipes-kernel/linux/linux-yocto-tiny_3.19.bbappend    | 6 +++---
 .../x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend     | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend    | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend    | 6 +++---
 .../arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend     | 6 +++---
 49 files changed, 152 insertions(+), 152 deletions(-)

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
index b7603aa..5af490d 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.14"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 729afed..c327d16 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.19"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 8ba7b5f..2d3d073 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index be92ec5..41325ca 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.14"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 7c5772b..b471742 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.19"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 0489ef5..761b9c6 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index b7603aa..5af490d 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.14"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.14"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
index 729afed..c327d16 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.19"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
index 38adca3..1e99a04 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 8ec4117..858d5fc 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,7 +25,7 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
 SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
 SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
index a1f2cc3..f084531 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
             file://{{=machine}}-user-features.scc \
            "
 
-# uncomment and replace these SRCREVs with the real commit ids once you've had
+# replace these SRCREVs with the real commit ids once you've had
 # the appropriate changes committed to the upstream linux-yocto repo
-#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
-#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
-#LINUX_VERSION = "3.19"
+SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "${AUTOREV}"
+#LINUX_VERSION = "3.19"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
index f98cf0c..01a046c 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index b7603aa..6f1e7b0 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 729afed..44086af 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 38adca3..1e99a04 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 08a997a..fbaed33 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -54,8 +54,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index cdc00a9..7b590ad 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -54,8 +54,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 6a24dc2..82bb970 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -54,8 +54,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 7c5dcc7..62a99d5 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 92b68cc..a5dd37d 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_3.19.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
index 7f49bfc..8d0bc97 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -25,8 +25,8 @@ SRC_URI += "file://{{=machine}}-standard.scc \
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
2.6.2


