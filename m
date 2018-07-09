Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB6AA7520C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:25:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w69FPjY0014747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2018 08:25:45 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 08:25:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Jul 2018 11:25:36 -0400
Message-ID: <c014274d31c2640bf694f85e0f3b6e018fb418a1.1531149297.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1531149297.git.bruce.ashfield@windriver.com>
References: <cover.1531149297.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.12: bump to v4.12.25
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
X-List-Received-Date: Mon, 09 Jul 2018 15:25:45 -0000
Content-Type: text/plain

Integrating Paul Gortmaker's v4.12.25 -stable queue, which comprises the
following commits:

  e61748ef5db0 Linux 4.12.25
  c34553e3e8af x86/bugs: Rename SSBD_NO to SSB_NO
  4aa9e65a91b9 x86/bugs: Remove x86_spec_ctrl_set()
  7283d22a40c4 x86/bugs: Expose x86_spec_ctrl_base directly
  60fb8f1bbd46 x86/speculation: Rework speculative_store_bypass_update()
  cc8a65725832 x86/cpufeatures: Disentangle SSBD enumeration
  4cadf648f802 x86/cpufeatures: Disentangle MSR_SPEC_CTRL enumeration from IBRS
  14476a34b4d0 x86/speculation: Use synthetic bits for IBRS/IBPB/STIBP
  e66dd0595eac x86/cpu: Make alternative_msr_write work for 32-bit code
  32e38eda9958 x86/bugs: Fix the parameters alignment and missing void
  5593194735ea x86/bugs: Make cpu_show_common() static
  86e7eb199990 x86/bugs: Fix __ssb_select_mitigation() return type
  4efd9170a722 Documentation/spec_ctrl: Do some minor cleanups
  e074092d9d0a proc: Use underscores for SSBD in 'status'
  f57b4be9a391 x86/bugs: Rename _RDS to _SSBD
  f395cafed558 x86/speculation: Make "seccomp" the default mode for Speculative Store Bypass
  9599751872de seccomp: Move speculation migitation control to arch code
  647fb2d84f05 seccomp: Add filter flag to opt-out of SSB mitigation
  44d5a1d9fe07 seccomp: Use PR_SPEC_FORCE_DISABLE
  9490e71c3074 prctl: Add force disable speculation
  ad5b97fe1ab6 x86/bugs: Make boot modes __ro_after_init
  cfc00a7877b6 seccomp: Enable speculation flaw mitigations
  bc4bf81c64b0 proc: Provide details on speculation flaw mitigations
  a41d2136a447 nospec: Allow getting/setting on non-current task
  7e17279e72b9 x86/speculation: Add prctl for Speculative Store Bypass mitigation
  eea6b1abc91e x86/process: Allow runtime control of Speculative Store Bypass
  c8630c28cd28 prctl: Add speculation control prctls
  ecefae5ca101 x86/speculation: Create spec-ctrl.h to avoid include hell
  4bcdf54612aa x86/bugs/AMD: Add support to disable RDS on Fam[15,16,17]h if requested
  6ce1317929a3 x86/bugs: Whitelist allowed SPEC_CTRL MSR values
  cd5e5e6f2e39 x86/bugs/intel: Set proper CPU features and setup RDS
  d97584229d85 x86/bugs: Provide boot parameters for the spec_store_bypass_disable mitigation
  793b7453cfc5 x86/cpufeatures: Add X86_FEATURE_RDS
  c6c3cd47ccbb x86/bugs: Expose /sys/../spec_store_bypass
  2d92a521bda7 x86/bugs: Read SPEC_CTRL MSR during boot and re-use reserved bits
  81865e325abe x86/bugs: Concentrate bug reporting into a separate function
  45245a5b9dc4 x86/bugs: Concentrate bug detection into a separate function
  05e82d536970 x86/nospec: Simplify alternative_msr_write()
  effb0dfecfa2 x86/cpu_entry_area: Sync cpu_entry_area to initial_page_table
  89fffee9d555 x86/xen: Zero MSR_IA32_SPEC_CTRL before suspend
  76199d7beb0b x86/speculation: Move firmware_restrict_branch_speculation_*() from C to CPP
  426210b00b02 x86/speculation: Use IBRS if available before calling into firmware
  63904f8a6d41 x86/entry/64: Fix CR3 restore in paranoid_exit()
  35cf6a9daf5f x86/cpu: Change type of x86_cache_size variable to unsigned int
  7fded60b2cb7 x86/spectre: Fix an error message
  343945a16727 x86/speculation: Add <asm/msr-index.h> dependency
  eb0f059ee2de nospec: Move array_index_nospec() parameter checking into separate macro
  31951a39de73 x86/speculation: Fix up array_index_nospec_mask() asm constraint
  344711f16fec x86/entry/64: Remove the unused 'icebp' macro
  d4324affaf05 x86/entry/64: Fix paranoid_entry() frame pointer warning
  3cadbc9228b4 x86/entry/64: Indent PUSH_AND_CLEAR_REGS and POP_REGS properly
  0d561147160c x86/entry/64: Get rid of the ALLOC_PT_GPREGS_ON_STACK and SAVE_AND_CLEAR_REGS macros
  22c1269eefa9 x86/entry/64: Use PUSH_AND_CLEAN_REGS in more cases
  ac897d25b1d3 x86/entry/64: Introduce the PUSH_AND_CLEAN_REGS macro
  226eea037fa6 x86/entry/64: Interleave XOR register clearing with PUSH instructions
  120d889cac9f x86/entry/64: Merge the POP_C_REGS and POP_EXTRA_REGS macros into a single POP_REGS macro
  2d5eb3888f24 x86/entry/64: Merge SAVE_C_REGS and SAVE_EXTRA_REGS, remove unused extensions
  797a6f4444f1 x86/speculation: Clean up various Spectre related details
  ff032faca431 KVM/nVMX: Set the CPU_BASED_USE_MSR_BITMAPS if we have a valid L02 MSR bitmap
  1aaab2d1a1fd KVM/x86: Reduce retpoline performance impact in slot_handle_level_range(), by always inlining iterator helper methods
  dd17c0f5a114 Revert "x86/speculation: Simplify indirect_branch_prediction_barrier()"
  add7dd4f1f81 x86/speculation: Correct Speculation Control microcode blacklist again
  358f03a9395f x86/speculation: Update Speculation Control microcode blacklist
  0307861327c7 x86/mm/pti: Fix PTI comment in entry_SYSCALL_64()
  a612b987b028 x86/entry/64/compat: Clear registers for compat syscalls, to reduce speculation attack surface
  1b8b432f6dee x86/entry/64: Clear registers for exceptions/interrupts, to reduce speculation attack surface
  513e4bbfc32c x86/entry/64: Clear extra registers beyond syscall arguments, to reduce speculation attack surface

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index bee1452fe7aa..1f0b7d5e382e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "75a9dd36c291ce674ef6d14b74c5096de9f59ca3"
-SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
+SRCREV_machine ?= "84b640c582ad7f2a968003c38702b39fa6b903b0"
+SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.24"
+LINUX_VERSION ?= "4.12.25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 58a6b27144d0..c63860a937bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.24"
+LINUX_VERSION ?= "4.12.25"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
+SRCREV_machine ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 12342c419474..c244c99e7b06 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e89109c66eecdd78402a6814219658cf48efeba7"
-SRCREV_machine_qemuarm64 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_machine_qemumips ?= "76f8650f009abea482c8b9b54a4f33510e0812d7"
-SRCREV_machine_qemuppc ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_machine_qemux86 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_machine_qemux86-64 ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_machine_qemumips64 ?= "eae7e3959377e0d5514df8add61df074450dbd38"
-SRCREV_machine ?= "7e7ac3f0fda9707e94b3311a4510ae080cd86238"
-SRCREV_meta ?= "46171de19220c49d670544017cfbeffc1ec70e80"
+SRCREV_machine_qemuarm ?= "b1aa2a86605847e98799eb7a9720659639b95c35"
+SRCREV_machine_qemuarm64 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_machine_qemumips ?= "f2e9eb5ef808d5bf6ef00e549e7f4a297e3101fa"
+SRCREV_machine_qemuppc ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_machine_qemux86 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_machine_qemux86-64 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_machine_qemumips64 ?= "f4cade13f87df43e14d340e001b553dcf9665a8e"
+SRCREV_machine ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
+SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.24"
+LINUX_VERSION ?= "4.12.25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


