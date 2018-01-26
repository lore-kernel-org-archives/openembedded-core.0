Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14DCD7883F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxaqS003802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:36 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:35 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:22 -0500
Message-ID: <2e7c86ff55d0ccb0b7b21cdab9db4050abb62b21.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] linux-yocto/4.12: update to v4.12.19
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:35 -0000
Content-Type: text/plain

Integrating the -stable update from Paul Gortmaker which comprises
the following commits:

   4aff9b16f4ba Linux 4.12.19
   28f16fcc84f9 Bluetooth: Prevent stack info leak from the EFS element.
   a430cb040780 loop: fix concurrent lo_open/lo_release
   4dd428f5965c net: ipv4: fix for a race condition in raw_sendmsg
   4428a99052e6 bpf: fix lockdep splat
   686f16d77fee bpf/verifier: Fix states_equal() comparison of pointer and UNKNOWN
   2c4577f1274b bpf: fix branch pruning logic
   d16a3b7b0642 bpf: reject out-of-bounds stack pointer calculation
   a1177b36876f x86/microcode/AMD: Add support for fam17h microcode loading
   19be0f0937af iommu/arm-smmu-v3: Cope with duplicated Stream IDs
   2e9834fd3352 iommu/arm-smmu-v3: Don't free page table ops twice
   1e67d5342bde KVM: X86: Fix load RFLAGS w/o the fixed bit
   b45b19d6e92d KVM: PPC: Book3S HV: Fix pending_pri value in kvmppc_xive_get_icp()
   ce4ad56d8b44 KVM: PPC: Book3S: fix XIVE migration of pending interrupts
   721f59a0bf4f KVM: arm/arm64: Fix HYP unmapping going off limits
   a7dbd1b73e6c arm64: kvm: Prevent restoring stale PMSCR_EL1 for vcpu
   3e4266c9ea63 KVM: arm/arm64: vgic-its: Preserve the revious read from the pending table
   c15b6348058e x86/asm: Use register variable to get stack pointer value
   19af84ace857 x86/asm: Fix inline asm call constraints for GCC 4.4
   78d54c1f3ac1 x86/asm: Fix inline asm call constraints for Clang
   9a6d78ff4fb7 arm64: prevent regressions in compressed kernel image size when upgrading to binutils 2.27
   3af55325636e mm: Handle 0 flags in _calc_vm_trans() macro
   f951c9e762b6 arm-ccn: perf: Prevent module unload while PMU is in use
   21bc2a95624c arm64: fix CONFIG_DEBUG_WX address reporting
   a2fb441f8cbd arm64: Initialise high_memory global variable earlier
   2b2e733345b0 kbuild: do not call cc-option before KBUILD_CFLAGS initialization
   4c67bceb55f4 jump_label: Invoke jump_label_test() via early_initcall()
   7cdf334210c3 ARM: BUG if jumping to usermode address in kernel mode
   77358b0b4d2f arm64: SW PAN: Update saved ttbr0 value on enter_lazy_tlb
   09bddb96452b arm64: SW PAN: Point saved ttbr0 at the zero page when switching to init_mm
   f451d0e885e1 arm64: fpsimd: Prevent registers leaking from dead tasks
   bf4bfcfd1780 KVM: arm/arm64: vgic-its: Check result of allocation before use
   bdd70c122339 KVM: arm/arm64: vgic: Preserve the revious read from the pending table
   6b99a8c8cdc0 KVM: arm/arm64: Fix broken GICH_ELRSR big endian conversion
   eadaba010c36 KVM: VMX: remove I/O port 0x80 bypass on Intel hosts
   b31b0eb03c2c arm: KVM: Fix VTTBR_BADDR_MASK BUG_ON off-by-one
   7c5a020deec8 arm64: KVM: fix VTTBR_BADDR_MASK BUG_ON off-by-one
   e1d48f51262e KVM: x86: fix APIC page invalidation
   4465b8b94411 x86/PCI: Make broadcom_postcore_init() check acpi_disabled
   74d50f1ac954 perf tools: Fix leaking rec_argv in error cases
   a8698071c4ba KVM: lapic: Fixup LDR on load in x2apic
   18db8c0cd612 KVM: lapic: Split out x2apic ldr calculation
   06e79931a082 KVM: x86: inject exceptions produced by x86_decode_insn
   1c7ccddc0a60 KVM: x86: Exit to user-mode on #UD intercept when emulator requires
   933a293d5925 KVM: x86: pvclock: Handle first-time write to pvclock-page contains random junk
   27a37b1b39b5 mm/madvise.c: fix madvise() infinite loop under special circumstances
   9a415da9c31c mm, hugetlbfs: introduce ->split() to vm_operations_struct
   ab1e80ae2b42 mm: fix device-dax pud write-faults triggered by get_user_pages()
   84392a1ffc54 mm/cma: fix alloc_contig_range ret code/potential leak
   390e49975c0c mm, thp: Do not make page table dirty unconditionally in touch_p[mu]d()
   c9d8192b4165 mm, oom_reaper: gather each vma to prevent leaking TLB entry
   557cc85757eb mm, memory_hotplug: do not back off draining pcp free pages from kworker context
   e7f78f55bdcb KVM: SVM: obey guest PAT
   eee1b36f5bd8 KVM: nVMX: set IDTR and GDTR limits when loading L1 host state
   eca2c0a4f6fd KVM: PPC: Book3S HV: Don't call real-mode XICS hypercall handlers if not enabled
   139c8678fb65 x86/decoder: Add new TEST instruction pattern
   f06e373ee93d RDS: Heap OOB write in rds_message_alloc_sgs()
   4f72d5339c6f RDS: null pointer dereference in rds_atomic_free_op
   3911496c7b54 net: Fix double free and memory corruption in get_net_ns_by_id()
   5c9f58b167bd MIPS: math-emu: do not use bools for arithmetic
   a756ea350c02 crypto: salsa20 - fix blkcipher_walk API usage
   632cfeb3cb42 crypto: hmac - require that the underlying hash algorithm is unkeyed
   fdd279fd5561 netlink: Add netns check on taps
   c142151947e9 dccp: CVE-2017-8824: use-after-free in DCCP code
   edd820b4ba76 media: hdpvr: Fix an error handling path in hdpvr_probe()
   aa0327d3dddc powerpc/tm: Add commandline option to disable hardware transactional memory

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 712b54a3259b..69b73b502f49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3cf5febafc30090aa1c0ef1ac7e5a80631201e4c"
-SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
+SRCREV_machine ?= "f095b0588b491bb81854fbc168479cf5ff8a03ff"
+SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.18"
+LINUX_VERSION ?= "4.12.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 85063d611396..c516d5de69af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.18"
+LINUX_VERSION ?= "4.12.19"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
+SRCREV_machine ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index f3ca9cc6fd90..d7b6e2750d50 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "02385ff70983375d3c8a4172ecded3796b266955"
-SRCREV_machine_qemuarm64 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_machine_qemumips ?= "508b8f61dd8477b2af91863bfb21e119301362d2"
-SRCREV_machine_qemuppc ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_machine_qemux86 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_machine_qemux86-64 ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_machine_qemumips64 ?= "6b2b8d3be7bd298684ed2a597e24360c025201ef"
-SRCREV_machine ?= "850696176565bc889670b96f0e27ab8166a8cf02"
-SRCREV_meta ?= "2a4e862a6ad55e5ee8beb62f3ea53f4b77c6f4c1"
+SRCREV_machine_qemuarm ?= "dafca619b2bd44966042bba76aa00edb0ca002df"
+SRCREV_machine_qemuarm64 ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_machine_qemumips ?= "99c30bfd13f4cc364e55b67138705976bab193c9"
+SRCREV_machine_qemuppc ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_machine_qemux86 ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_machine_qemux86-64 ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_machine_qemumips64 ?= "135d85c1f8cded6b68d533a0018b2897230b880c"
+SRCREV_machine ?= "257f843ea367744620f1d92910afd2f454e31483"
+SRCREV_meta ?= "44a22d45cbcd7e14ea635d36949e14135f540fe0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.18"
+LINUX_VERSION ?= "4.12.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


