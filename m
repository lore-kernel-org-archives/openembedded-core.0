Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16261747F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 15:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4IF6FP1025623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 May 2018 08:06:15 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 May 2018 08:06:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 May 2018 11:05:48 -0400
Message-ID: <18546858b2d089bec437dd4181e4e3515d2538b5.1526655802.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1526655802.git.bruce.ashfield@windriver.com>
References: <cover.1526655802.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/4.12: update to v4.12.22
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
X-List-Received-Date: Fri, 18 May 2018 15:06:16 -0000
Content-Type: text/plain

Paul Gortmaker released another 4.12-stable that comprises the following
changes:

   23dcfbfbca0a Linux 4.12.22
   d4879ce5efb7 arm64: Kill PSCI_GET_VERSION as a variant-2 workaround
   77915e1a7544 arm64: Add ARM_SMCCC_ARCH_WORKAROUND_1 BP hardening support
   b06fbedb6e14 arm/arm64: smccc: Implement SMCCC v1.1 inline primitive
   1f400b388a20 arm/arm64: smccc: Make function identifiers an unsigned quantity
   f5d3afa3aecc firmware/psci: Expose SMCCC version through psci_ops
   4c69d3a66e60 firmware/psci: Expose PSCI conduit
   cfec930a45f8 arm64: KVM: Add SMCCC_ARCH_WORKAROUND_1 fast handling
   9e9697733818 arm64: KVM: Report SMCCC_ARCH_WORKAROUND_1 BP hardening support
   2a8574eb6e3f arm/arm64: KVM: Turn kvm_psci_version into a static inline
   2c79f828dfed arm64: KVM: Make PSCI_VERSION a fast path
   042626a87234 arm/arm64: KVM: Advertise SMCCC v1.1
   48a9e563e528 arm/arm64: KVM: Implement PSCI 1.0 support
   28283de68052 arm/arm64: KVM: Add smccc accessors to PSCI code
   33d47367626b arm/arm64: KVM: Add PSCI_VERSION helper
   82ca1dcebf95 arm/arm64: KVM: Consolidate the PSCI include files
   efb7c6b5b7f9 arm64: KVM: Increment PC after handling an SMC trap
   b720b7837ed8 arm64: Branch predictor hardening for Cavium ThunderX2
   6f2750c7a1c9 arm64: Implement branch predictor hardening for Falkor
   b56fa11959a7 arm64: Implement branch predictor hardening for affected Cortex-A CPUs
   5eb80f970c49 arm64: cputype: Add missing MIDR values for Cortex-A72 and Cortex-A75
   cf45e77d8106 arm64: entry: Apply BP hardening for suspicious interrupts from EL0
   e9c2f25bf62d arm64: entry: Apply BP hardening for high-priority synchronous exceptions
   b4f51ebd0fc3 arm64: KVM: Use per-CPU vector when BP hardening is enabled
   e8f7c5ba8c70 arm64: Move BP hardening to check_and_switch_context
   e2c124fa14e1 arm64: Add skeleton to harden the branch predictor against aliasing attacks
   ddd305f0fdf8 arm64: Move post_ttbr_update_workaround to C code
   204d987e7143 drivers/firmware: Expose psci_get_version through psci_ops structure
   8880e6380d91 arm64: cpufeature: Pass capability structure to ->enable callback
   48017c15187b arm64: Run enable method for errata work arounds on late CPUs
   cf64258fb122 arm64: cpufeature: __this_cpu_has_cap() shouldn't stop early
   7d550f8cb119 arm64: futex: Mask __user pointers prior to dereference
   b9d01590df34 arm64: uaccess: Mask __user pointers for __arch_{clear, copy_*}_user
   1b74ca827ed3 arm64: uaccess: Don't bother eliding access_ok checks in __{get, put}_user
   41b08b7c365b arm64: uaccess: Prevent speculative use of the current addr_limit
   1736debe11ef arm64: entry: Ensure branch through syscall table is bounded under speculation
   84e4780beea5 arm64: Use pointer masking to limit uaccess speculation
   d77d4c9aa433 arm64: Make USER_DS an inclusive limit
   b96ab81a6468 arm64: Implement array_index_mask_nospec()
   21eb21937d8e arm64: barrier: Add CSDB macros to control data-value prediction
   da1217a79997 arm64: idmap: Use "awx" flags for .idmap.text .pushsection directives
   c20b48f5b7a3 arm64: entry: Reword comment about post_ttbr_update_workaround
   15d4d37f7709 arm64: Force KPTI to be disabled on Cavium ThunderX
   3489abd67e33 arm64: kpti: Add ->enable callback to remap swapper using nG mappings
   b154d9be8c6f arm64: mm: Permit transitioning from Global to Non-Global without BBM
   1610bb019302 arm64: kpti: Make use of nG dependent on arm64_kernel_unmapped_at_el0()
   250a3a64585f arm64: Turn on KPTI only on CPUs that need it
   32da2aa26b97 arm64: cputype: Add MIDR values for Cavium ThunderX2 CPUs
   93d290bbe8f1 arm64: kpti: Fix the interaction between ASID switching and software PAN
   923618230c12 arm64: mm: Introduce TTBR_ASID_MASK for getting at the ASID in the TTBR
   51218390beb6 arm64: capabilities: Handle duplicate entries for a capability
   630cf7161fca arm64: Take into account ID_AA64PFR0_EL1.CSV3
   4b7ebe5c3644 arm64: Kconfig: Reword UNMAP_KERNEL_AT_EL0 kconfig entry
   e09f32469091 arm64: Kconfig: Add CONFIG_UNMAP_KERNEL_AT_EL0
   8202169d678a arm64: use RET instruction for exiting the trampoline
   414d9eabda3d arm64: kaslr: Put kernel vectors address in separate data page
   fce92f180168 arm64: entry: Add fake CPU feature for unmapping the kernel at EL0
   83584a583bff arm64: tls: Avoid unconditional zeroing of tpidrro_el0 for native tasks
   4732b98b6400 arm64: cpu_errata: Add Kryo to Falkor 1003 errata
   85dacaa58475 arm64: erratum: Work around Falkor erratum #E1003 in trampoline code
   bb0fa2f9cece arm64: entry: Hook up entry trampoline to exception vectors
   df7f7308d5f0 arm64: entry: Explicitly pass exception level to kernel_ventry macro
   14bcc912ca7e arm64: mm: Map entry trampoline into trampoline and kernel page tables
   c30f47afaa64 arm64: entry: Add exception trampoline page for exceptions from EL0
   21b891bf770f arm64: mm: Invalidate both kernel and user ASIDs when performing TLBI
   09e8df92ba8e arm64: mm: Add arm64_kernel_unmapped_at_el0 helper
   6832da386e60 arm64: mm: Allocate ASIDs in pairs
   bfd2ff25b585 arm64: mm: Fix and re-enable ARM64_SW_TTBR0_PAN
   1e4477930e5e arm64: mm: Rename post_ttbr0_update_workaround
   1e1890551573 arm64: mm: Remove pre_ttbr0_update_workaround for Falkor erratum #E1003
   0223b2589432 arm64: mm: Move ASID from TTBR0 to TTBR1
   9fe82f4ebdc3 arm64: mm: Temporarily disable ARM64_SW_TTBR0_PAN
   199f832ebf00 arm64: mm: Use non-global mappings for kernel space
   e9b0e14af7e3 arm64: move TASK_* definitions to <asm/processor.h>
   cab5207f57fd brd: remove unused brd_mutex
   7522521435a4 arm/syscalls: Optimize address limit check
   797f169015c5 Revert "arm/syscalls: Check address limit on user-mode return"
   3056c8f5be3a syscalls: Use CHECK_DATA_CORRUPTION for addr_limit_user_check
   74116ef5625a arm64: add VMAP_STACK overflow detection
   0d82fd80a2d1 arm64: add on_accessible_stack()
   c38502bc1472 arm64: add basic VMAP_STACK support
   c3a53247c1ff arm64: use an irq stack pointer
   73dcb6d84040 arm64: assembler: allow adr_this_cpu to use the stack pointer
   344a8e142697 arm64: factor out entry stack manipulation
   59c4a6fb5606 efi/arm64: add EFI_KIMG_ALIGN
   1a5300c6063f arm64: move SEGMENT_ALIGN to <asm/memory.h>
   3969d302c52f arm64: clean up irq stack definitions
   f030f0edba48 arm64: clean up THREAD_* definitions
   1f3c78245a4a arm64: factor out PAGE_* and CONT_* definitions
   8a5bc40e0c93 arm64: kernel: remove {THREAD,IRQ_STACK}_START_SP
   deba543af0b8 fork: allow arch-override of VMAP stack alignment
   774f64ce7b0f arm64: remove __die()'s stack dump
   7342855775d5 arm64: unwind: remove sp from struct stackframe
   553dbcbcff1d arm64: unwind: reference pt_regs via embedded stack frame
   926b0fe43412 arm64: unwind: disregard frame.sp when validating frame pointer
   da32ad8b5c11 arm64: unwind: avoid percpu indirection for irq stack
   eac4e8ecdd77 arm64: move non-entry code out of .entry.text
   b341e176374e arm64: consistently use bl for C exception entry
   3cdad1f0b9d0 arm64: Add ASM_BUG()
   01ace65c9150 arm64/vdso: Support mremap() for vDSO
   8050b6ba63cb arm64: Handle trapped DC CVAP
   0ee09d69dc93 arm64: Expose DC CVAP to userspace
   704046e3e554 arm64: Convert __inval_cache_range() to area-based
   b40935f19c73 arm64: mm: Fix set_memory_valid() declaration
   29530b5b549e arm64: Abstract syscallno manipulation
   f9f1c9d7d767 arm64: syscallno is secretly an int, make it official
   ab69949ffe23 x86/tracing: Build tracepoints only when they are used
   03793940e25c x86/tracing: Disentangle pagefault and resched IPI tracing key
   2822852ed8a5 x86/idt: Clean up the i386 low level entry macros
   d5654eb18f73 x86/idt: Remove the tracing IDT completely
   0d38071a05e7 x86/smp: Use static key for reschedule interrupt tracing
   4ef6e0f37891 x86/smp: Remove pointless duplicated interrupt code
   40b216cec86d x86/mce: Remove duplicated tracing interrupt code
   03f41cf538fd x86/irqwork: Get rid of duplicated tracing interrupt code
   418b9a493901 x86/apic: Remove the duplicated tracing versions of interrupts
   5be95f8dfffe x86/irq: Get rid of duplicated trace_x86_platform_ipi() code
   bd936c5d828a x86/apic: Remove the duplicated tracing version of local_timer_interrupt()
   f4971407abbb x86/traps: Simplify pagefault tracing logic
   2f436623b2c3 x86/tracing: Introduce a static key for exception tracing
   4395735bf0a9 arm64/syscalls: Check address limit on user-mode return
   3e1d12839e05 arm/syscalls: Check address limit on user-mode return
   649cd48799ef x86/syscalls: Check address limit on user-mode return
   8fe35f321cd3 audit: fix memleak in auditd_send_unicast_skb.
   4b1e889a4dd0 arm64: ptrace: Flush user-RW TLS reg to thread_struct before reading
   75a382c72d50 arm64: Add dump_backtrace() in show_regs

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index ff730846f555..8d4aaba09f56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bec5c846f002161d695171798f250c59e85ab821"
-SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
+SRCREV_machine ?= "9289c965739cc5f52a7d3694fcda0a02d385eac2"
+SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.21"
+LINUX_VERSION ?= "4.12.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 325857fa9d29..520388c98d3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.21"
+LINUX_VERSION ?= "4.12.22"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
+SRCREV_machine ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 81079ce584cb..57d4ddcd4d2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fa1d1c94af290039f25b2b6fb0f419b4272e7156"
-SRCREV_machine_qemuarm64 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_machine_qemumips ?= "558d4b974687d421c5e8ff63a7d2660520f9dab0"
-SRCREV_machine_qemuppc ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_machine_qemux86 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_machine_qemux86-64 ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_machine_qemumips64 ?= "09bddd16543c2f4fa1bb5a535994975dd1457fe2"
-SRCREV_machine ?= "97e710ef0545c19d3c10bd81a61bdca9fe543b81"
-SRCREV_meta ?= "f8f75cc4d9cb3195a2221b375cfc4f91ee211399"
+SRCREV_machine_qemuarm ?= "8c29379a4bbf1e3b16f1857129d145edd358e547"
+SRCREV_machine_qemuarm64 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_machine_qemumips ?= "77d7b5c30b0eb2d79d3e35550504d1ec7ffd37aa"
+SRCREV_machine_qemuppc ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_machine_qemux86 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_machine_qemux86-64 ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_machine_qemumips64 ?= "3da8c99d28ef06b0c9750d163ea67f3e5a6912d2"
+SRCREV_machine ?= "1c60fc3c4910d38c781d016d2ec13c8cc2084694"
+SRCREV_meta ?= "e10da92d2984c77ed67be9722e4a39af9d025e2f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.21"
+LINUX_VERSION ?= "4.12.22"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


