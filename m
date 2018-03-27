Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDF8F71A82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2RF3L3b018336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:21 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:13 -0400
Message-ID: <68aa5da1db2d48f5f448eaaa34a97f95c08a20d1.1522162765.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1522162765.git.bruce.ashfield@windriver.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/4.12: update to v4.12.21
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:21 -0000
Content-Type: text/plain

Integrating Paul Gortmaker's stable update to 4.12, this includes CVE
fixes for meltdown and spectre:

   3bb926457832 Linux 4.12.21
   76781f72ce64 lguest: disable it vs. removing it.
   6ab3176bb365 x86/speculation: Fix typo IBRS_ATT, which should be IBRS_ALL
   efa97ecdf026 x86/pti: Mark constant arrays as __initconst
   a4d9aaf35e28 x86/spectre: Simplify spectre_v2 command line parsing
   1dbde4da259a x86/retpoline: Avoid retpolines for built-in __init functions
   7f3a7b69b0f7 x86/paravirt: Remove 'noreplace-paravirt' cmdline option
   ebeddfbee13f x86/speculation: Use Indirect Branch Prediction Barrier in context switch
   7e0a7c84eb35 x86/cpuid: Fix up "virtual" IBRS/IBPB/STIBP feature bits on Intel
   bf0c4c3f38f6 x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
   f4d4ccfdf361 x86/spectre: Report get_user mitigation for spectre_v1
   12f20abacd8b nl80211: Sanitize array index in parse_txq_params
   7686c72bfd9c vfs, fdtable: Prevent bounds-check bypass via speculative execution
   a3d62741fc9b x86/syscall: Sanitize syscall table de-references under speculation
   0b99c598274c x86/get_user: Use pointer masking to limit speculation
   bf532304a22f x86/uaccess: Use __uaccess_begin_nospec() and uaccess_try_nospec
   04584b001618 x86/usercopy: Replace open coded stac/clac with __uaccess_{begin, end}
   5a64c3ccd99d x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
   9bbc24f34f03 x86: Introduce barrier_nospec
   b55fd06d6fe0 x86: Implement array_index_mask_nospec
   79a2efa3e0f5 array_index_nospec: Sanitize speculative array de-references
   e9046d054bb9 Documentation: Document array_index_nospec
   0078d6b103f9 x86/asm: Move 'status' from thread_struct to thread_info
   46afe23798a3 x86/entry/64: Push extra regs right away
   4213246ab7a8 x86/entry/64: Remove the SYSCALL64 fast path
   026a59b9de37 x86/spectre: Check CONFIG_RETPOLINE in command line parser
   a345c5f7a1b6 x86/mm: Fix overlap of i386 CPU_ENTRY_AREA with FIX_BTMAP
   999e3eca6861 x86/speculation: Simplify indirect_branch_prediction_barrier()
   c7acab78a24c x86/retpoline: Simplify vmexit_fill_RSB()
   be5c3f1101f7 x86/cpufeatures: Clean up Spectre v2 related CPUID flags
   7addf309d0e0 x86/cpu/bugs: Make retpoline module warning conditional
   b7c17f71e9cc x86/bugs: Drop one "mitigation" from dmesg
   af16629cc1da x86/nospec: Fix header guards names
   ebfadec0c9dc x86/alternative: Print unadorned pointers
   2e4bcf1ccaa9 x86/speculation: Add basic IBPB (Indirect Branch Prediction Barrier) support
   332de1ac4373 x86/cpufeature: Blacklist SPEC_CTRL/PRED_CMD on early Spectre v2 microcodes
   79a2a1ba23e7 x86/pti: Do not enable PTI on CPUs which are not vulnerable to Meltdown
   d29069565618 x86/msr: Add definitions for new speculation control MSRs
   114a7b0f431c x86/cpufeatures: Add AMD feature bits for Speculation Control
   2d5755e9daac x86/cpufeatures: Add Intel feature bits for Speculation Control
   3f5d9b428f05 x86/cpufeatures: Add CPUID_7_EDX CPUID leaf
   2f1b883356ca module/retpoline: Warn about missing retpoline in module
   8c935f65cf6a KVM: VMX: Make indirect call speculation safe
   79c0d980e610 KVM: x86: Make indirect calls in emulator speculation safe
   956ca31407ab x86/retpoline: Remove the esp/rsp thunk
   de8cd92003c6 x86/mm/64: Fix vmapped stack syncing on very-large-memory 4-level systems
   f2846896cd75 x86/microcode: Fix again accessing initrd after having been freed
   badb7498ab69 x86/retpoline: Optimize inline assembler for vmexit_fill_RSB
   750d9c97cede x86/pti: Document fix wrong index
   8d759c94307d kprobes/x86: Disable optimizing on the function jumps to indirect thunk
   59a3c4dc0ab9 kprobes/x86: Blacklist indirect thunk functions for kprobes
   2eef7eab7aea retpoline: Introduce start/end markers of indirect thunk
   a37c55916910 x86/mce: Make machine check speculation protected
   3aab76cd9d88 x86/tsc: Fix erroneous TSC rate on Skylake Xeon
   b129f5955cd5 x86/tsc: Future-proof native_calibrate_tsc()
   7639b8268579 x86/mm/pkeys: Fix fill_sig_info_pkey
   b19a92bb0f18 x86/cpufeature: Move processor tracing out of scattered features
   eb5a1177e60b x86/retpoline: Add LFENCE to the retpoline/RSB filling RSB macros
   ed114eb7be88 x86/retpoline: Fill RSB on context switch for affected CPUs
   70d519c9f97c x86/kasan: Panic if there is not enough memory to boot
   01e21b5f7c9c x86/retpoline: Remove compile time warning
   8ca1b5f8a9f4 x86,perf: Disable intel_bts when PTI
   6f037d7eaeaa security/Kconfig: Correct the Documentation reference for PTI
   b8c74586d251 x86/pti: Fix !PCID and sanitize defines
   8e24a4722756 selftests/x86: Add test_vsyscall
   c3d9420f23cf x86/retpoline: Fill return stack buffer on vmexit
   dd182d455654 x86/retpoline/irq32: Convert assembler indirect jumps
   d592a8a2c5f5 x86/retpoline/checksum32: Convert assembler indirect jumps
   0f3df59f16d3 x86/retpoline/xen: Convert Xen hypercall indirect jumps
   c0459b479a22 x86/retpoline/ftrace: Convert ftrace assembler indirect jumps
   11edfaeadbd1 x86/retpoline/entry: Convert entry assembler indirect jumps
   bf4c91a3b74f x86/retpoline/crypto: Convert crypto assembler indirect jumps
   2b243b8623a5 x86/spectre: Add boot time option to select Spectre v2 mitigation
   8ab0d792e81c x86/retpoline: Add initial retpoline support
   f2f4c0853dba x86/pti: Make unpoison of pgd for trusted boot work for real
   7495fd5400e6 x86/alternatives: Fix optimize_nops() checking
   8b932f131e26 sysfs/cpu: Fix typos in vulnerability documentation
   299b4adfed2e x86/cpu/AMD: Use LFENCE_RDTSC in preference to MFENCE_RDTSC
   32996f3a0a81 x86/cpu/AMD: Make LFENCE a serializing instruction
   10ffc3c2b2f7 x86/mm/pti: Remove dead logic in pti_user_pagetable_walk*()
   9e1201731d4b x86/tboot: Unbreak tboot with PTI enabled
   728d879e5c6b x86/cpu: Implement CPU vulnerabilites sysfs functions
   aeba317a23de sysfs/cpu: Add vulnerability folder
   83e59b5d52bf x86/cpufeatures: Add X86_BUG_SPECTRE_V[12]
   f7845c2cbd6e x86/Documentation: Add PTI description
   16331e2c3b06 x86/pti: Unbreak EFI old_memmap
   5723b0260415 kdump: Write the correct address of mem_section into vmcoreinfo
   50d02826dfc0 mm/sparse.c: wrong allocation for mem_section
   d3cbfb481af2 mm/sparsemem: Fix ARM64 boot crash when CONFIG_SPARSEMEM_EXTREME=y

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index ad0981296f5a..7b6d67c623f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da775aa9aab41e8a2b4e9b44ffe268446c51759f"
-SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
+SRCREV_machine ?= "e631b6433928b4b7f44b7ae2e97fe0a174aa0b44"
+SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.20"
+LINUX_VERSION ?= "4.12.21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 0bbd8e28db86..d31c6ff3e1db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.20"
+LINUX_VERSION ?= "4.12.21"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
+SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index fabf0f554bbf..830634211a4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "42cf4d6a1bc84b90681cb82ad95c129387d76b4b"
-SRCREV_machine_qemuarm64 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_machine_qemumips ?= "571315a5526b9e22262cf99bae7c0dd6e5bd204c"
-SRCREV_machine_qemuppc ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_machine_qemux86 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_machine_qemux86-64 ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_machine_qemumips64 ?= "e7889ba18f060368d4ab35e70b076728d73ba622"
-SRCREV_machine ?= "60b649971940737dc7e3a7f247c62ffbd7c82e4c"
-SRCREV_meta ?= "4f825eeb783a279216ee45ed3b9a63dd6837f7d7"
+SRCREV_machine_qemuarm ?= "d2bdc11312fc02d4ad34e044cf1bb88da2b85591"
+SRCREV_machine_qemuarm64 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_machine_qemumips ?= "15e9d4817db80cee890207e849776beeda7759e5"
+SRCREV_machine_qemuppc ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_machine_qemux86 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_machine_qemux86-64 ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_machine_qemumips64 ?= "68bcd22421aa288aff3dc9cf3035539788b04353"
+SRCREV_machine ?= "1a600c736163e7350ee4da9172f5321d06a72889"
+SRCREV_meta ?= "2feb169ba66721f3794bacd97c8360ad594ce133"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.20"
+LINUX_VERSION ?= "4.12.21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


