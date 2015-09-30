Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B6E377705C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="655095420"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 05:38:34 +0000
Message-Id: <744abb94a7a5a035ad175c15677e6a30f9cbd0f1.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/5] yocto-bsp: Update templates to 4.1 kernel
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Add 4.1 kernel support. Old bbapends were not removed, so user still
have the option for 3.14/3.19 kernels.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../arm/recipes-kernel/linux/kernel-list.noinstall |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbapend   | 33 ++++++++++++
 .../target/arch/i386/conf/machine/machine.conf     |  4 +-
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../target/arch/powerpc/conf/machine/machine.conf  |  2 +-
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 .../recipes-kernel/linux/kernel-list.noinstall     |  4 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            | 62 ++++++++++++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 62 ++++++++++++++++++++++
 .../linux/linux-yocto-tiny_4.1.bbappend            | 33 ++++++++++++
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 33 ++++++++++++
 22 files changed, 535 insertions(+), 15 deletions(-)
 create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
 create mode 100644 scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend

diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/kernel-list.noinstall
index 811d695..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.19) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.19"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
new file mode 100644
index 0000000..2ffb7a6
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/linux-yocto_4.1.bbapend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
\ No newline at end of file
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/machine.conf
index 7189341..1739ab3 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/machine.conf
@@ -33,7 +33,7 @@ MACHINE_FEATURES += "wifi efi pcbios"
 
 {{ input type:"boolean" name:"xserver" prio:"50" msg:"Do you need support for X? (y/n)" default:"y" }}
 
-{{ if xserver == "y" and (kernel_choice == "linux-yocto_3.19" or kernel_choice == "linux-yocto_3.14"): }}
+{{ if xserver == "y" and (kernel_choice == "linux-yocto_4.1" or kernel_choice == "linux-yocto_3.19" or kernel_choice == "linux-yocto_3.14"): }}
 {{ input type:"choicelist" name:"xserver_choice" prio:"50" msg:"Please select an xserver for this machine:" default:"xserver_vesa" }}
 {{ input type:"choice" val:"xserver_vesa" msg:"VESA xserver support" }}
 {{ input type:"choice" val:"xserver_i915" msg:"i915 xserver support" }}
@@ -49,7 +49,7 @@ MACHINE_FEATURES += "wifi efi pcbios"
 {{ input type:"choice" val:"xserver_fbdev" msg:"fbdev xserver support" }}
 {{ input type:"choice" val:"xserver_modesetting" msg:"modesetting xserver support" }}
 
-{{ if xserver == "y" and kernel_choice != "linux-yocto_3.19" and kernel_choice != "linux-yocto_3.14" and kernel_choice != "custom": xserver_choice = "xserver_i915" }}
+{{ if xserver == "y" and kernel_choice != "linux-yocto_4.1" and kernel_choice != "linux-yocto_3.19" and kernel_choice != "linux-yocto_3.14" and kernel_choice != "custom": xserver_choice = "xserver_i915" }}
 
 {{ if xserver == "y": }}
 XSERVER ?= "${XSERVER_X86_BASE} \
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/kernel-list.noinstall
index 811d695..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.19) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.19"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..d4862b5
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/kernel-list.noinstall
index 811d695..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.19) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.19"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..61adafd
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/kernel-list.noinstall
index a04e6c7..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.14) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.14"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..851d306
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/edgerouter" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/edgerouter" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
index c94f7f9..018146f 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/machine.conf
@@ -74,7 +74,7 @@ XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-video-fbdev"
 
-PREFERRED_VERSION_u-boot ?= "v2015.01%"
+PREFERRED_VERSION_u-boot ?= "v2015.07%"
 {{ input type:"edit" name:"uboot_entrypoint" prio:"40" msg:"Please specify a value for UBOOT_ENTRYPOINT:" default:"0x00000000" }}
 UBOOT_ENTRYPOINT = "{{=uboot_entrypoint}}"
 
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/kernel-list.noinstall
index 811d695..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.19) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.19"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..61adafd
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/kernel-list.noinstall b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/kernel-list.noinstall
index 811d695..7676ca8 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/kernel-list.noinstall
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/kernel-list.noinstall
@@ -1,5 +1,5 @@
 {{ if kernel_choice != "custom": }}
-{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (3.19) kernel? (y/n)" default:"y"}}
+{{ input type:"boolean" name:"use_default_kernel" prio:"10" msg:"Would you like to use the default (4.1) kernel? (y/n)" default:"y"}}
 
 {{ if kernel_choice != "custom" and use_default_kernel == "n": }}
-{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_3.19"}}
+{{ input type:"choicelist" name:"kernel_choice" gen:"bsp.kernel.kernels" prio:"10" msg:"Please choose the kernel to use in this BSP:" default:"linux-yocto_4.1"}}
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..1990419
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,62 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "arm": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"arm" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "arm": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"arm" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "powerpc": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"powerpc" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "powerpc": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"powerpc" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "i386": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"i386" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "i386": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"i386" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/common-pc" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "x86_64": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"x86_64" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "x86_64": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"x86_64" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "mips": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"mips" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "mips": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"mips" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "mips64": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"mips64" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "mips64": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"mips64" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..dc8a5be
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,62 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "arm": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base your new BSP branch on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "arm": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose an existing machine branch to use for this BSP:" default:"standard/arm-versatile-926ejs" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "powerpc": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"powerpc" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "powerpc": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"powerpc" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/qemuppc" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "i386": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"i386" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "i386": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"i386" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "x86_64": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"x86_64" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc-64"  prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc-64/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "x86_64": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"x86_64" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc-64"  prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc-64/base" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "mips": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"mips" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/mti-malta32" }}
+
+{{ if need_new_kbranch == "n" and qemuarch == "mips64": }}
+{{ input type:"choicelist" name:"existing_kbranch" nameappend:"mips64" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/mti-malta64" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "mips": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"mips" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "y" and qemuarch == "mips64": }}
+{{ input type:"choicelist" name:"new_kbranch" nameappend:"mips64" gen:"bsp.kernel.all_branches" branches_base:"standard" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Would you like SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
new file mode 100644
index 0000000..bbff78d
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto-tiny_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto-tiny_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard/tiny" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/tiny/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-tiny.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto-tiny_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto-tiny_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
new file mode 100644
index 0000000..9cc2a7f
--- /dev/null
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/linux-yocto_4.1.bbappend
@@ -0,0 +1,33 @@
+# yocto-bsp-filename {{ if kernel_choice == "linux-yocto_4.1": }} this
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+PR := "${PR}.1"
+
+COMPATIBLE_MACHINE_{{=machine}} = "{{=machine}}"
+
+{{ input type:"boolean" name:"need_new_kbranch" prio:"20" msg:"Do you need a new machine branch for this BSP (the alternative is to re-use an existing branch)? [y/n]" default:"y" }}
+
+{{ if need_new_kbranch == "y": }}
+{{ input type:"choicelist" name:"new_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc-64" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc-64/base" }}
+
+{{ if need_new_kbranch == "n": }}
+{{ input type:"choicelist" name:"existing_kbranch" gen:"bsp.kernel.all_branches" branches_base:"standard:standard/common-pc-64" prio:"20" msg:"Please choose a machine branch to base this BSP on:" default:"standard/common-pc-64/base" }}
+
+{{ if need_new_kbranch == "n": }}
+KBRANCH_{{=machine}}  = "{{=existing_kbranch}}"
+
+{{ input type:"boolean" name:"smp" prio:"30" msg:"Do you need SMP support? (y/n)" default:"y"}}
+{{ if smp == "y": }}
+KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
+
+SRC_URI += "file://{{=machine}}-standard.scc \
+            file://{{=machine}}-user-config.cfg \
+            file://{{=machine}}-user-patches.scc \
+            file://{{=machine}}-user-features.scc \
+           "
+
+# uncomment and replace these SRCREVs with the real commit ids once you've had
+# the appropriate changes committed to the upstream linux-yocto repo
+#SRCREV_machine_pn-linux-yocto_{{=machine}} ?= "840bb8c059418c4753415df56c9aff1c0d5354c8"
+#SRCREV_meta_pn-linux-yocto_{{=machine}} ?= "4fd76cc4f33e0afd8f906b1e8f231b6d13b6c993"
+#LINUX_VERSION = "4.1"
-- 
1.8.4.5


