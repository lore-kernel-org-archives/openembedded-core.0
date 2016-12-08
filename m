Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2C8F71C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:03:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I3FWr017139
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:03:15 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 10:01:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:52 -0500
Message-ID: <2f1e478f5bec800974c43568ade124defef72885.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/4.8: update to v4.8.12
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
X-List-Received-Date: Thu, 08 Dec 2016 18:03:14 -0000
Content-Type: text/plain

shortlog of the changes follow:

   356ccf6d2b0c Linux 4.8.12
   f81c90012f2f scsi: mpt3sas: Unblock device after controller reset
   3de3eebb10fd flow_dissect: call init_default_flow_dissectors() earlier
   7838fbe25a95 mm, oom: stop pre-mature high-order OOM killer invocations
   374ff835e2b6 can: bcm: fix support for CAN FD frames
   7ed8d94b99b3 powerpc/boot: Fix the early OPAL console wrappers
   7cbe9568fa04 powerpc/mm: Fixup kernel read only mapping
   30988ea31783 powerpc: Set missing wakeup bit in LPCR on POWER9
   8d248df485f2 device-dax: fail all private mapping attempts
   f87a483126b5 device-dax: check devm_nsio_enable() return value
   5b08489eba14 xc2028: Fix use-after-free bug properly
   9030deb21f29 X.509: Fix double free in x509_cert_parse() [ver #3]
   0257b7e20c07 mpi: Fix NULL ptr dereference in mpi_powm() [ver #3]
   bdab996a7a9e mmc: sdhci-of-esdhc: fixup PRESENT_STATE read
   0a80bef18a9f parisc: Also flush data TLB in flush_icache_page_asm
   09e35a83cdc9 parisc: Fix race in pci-dma.c
   3cb2bc6fdc54 parisc: Switch to generic sched_clock implementation
   113b60efa37c parisc: Fix races in parisc_setup_cache_timing()
   b2f64572db2e thermal/powerclamp: add back module device table
   6dfe1643b56a perf/x86/intel: Cure bogus unwind from PEBS entries
   403f47ddbf6b perf/core: Fix address filter parser
   c5795c5f682d x86/traps: Ignore high word of regs->cs in early_fixup_exception()
   885bad1e5f32 x86/fpu: Fix invalid FPU ptrace state after execve()
   1a42cd56229b NFSv4.x: hide array-bounds warning
   154c665b2b02 apparmor: fix change_hat not finding hat after policy replacement
   9c15a98542f0 cfg80211: limit scan results cache size
   f204d21ee0b7 tile: avoid using clocksource_cyc2ns with absolute cycle count
   c707019bef62 scsi: mpt3sas: Fix secure erase premature termination
   b33387f6a68d Fix USB CB/CBI storage devices with CONFIG_VMAP_STACK=y
   89a28f3a3c77 USB: serial: ftdi_sio: add support for TI CC3200 LaunchPad
   6476f6530187 USB: serial: cp210x: add ID for the Zone DPMX
   7445ffb75ed5 usb: chipidea: move the lock initialization to core file
   32fe669c8634 KVM: x86: check for pic and ioapic presence before use
   c02d13809180 KVM: x86: fix out-of-bounds accesses of rtc_eoi map
   39b653013527 KVM: x86: drop error recovery in em_jmp_far and em_ret_far
   3c22c81377d4 KVM: x86: fix out-of-bounds access in lapic
   eb060c1a03f7 iommu/vt-d: Fix IOMMU lookup for SR-IOV Virtual Functions
   8b23f16343f6 iommu/vt-d: Fix PASID table allocation
   36bd5bfe4349 Linux 4.8.11
   a9a0027757f8 gpio: pca953x: Fix corruption of other gpios in set_multiple.
   88fce76cf590 gpio: pca953x: Move memcpy into mutex lock for set multiple
   9a7b80894951 netfilter: nft_dynset: fix element timeout for HZ != 1000
   fd4251fa4d09 IB/cm: Mark stale CM id's whenever the mad agent was unregistered
   8ce92be782f8 IB/uverbs: Fix leak of XRC target QPs
   160149299f71 IB/hfi1: Remove incorrect IS_ERR check
   46e47543175b IB/core: Avoid unsigned int overflow in sg_alloc_table
   82c377d05311 IB/mlx5: Fix NULL pointer dereference on debug print
   554e4b69f1bb IB/mlx5: Fix fatal error dispatching
   32091ee63d17 IB/mlx5: Fix memory leak in query device
   21822a5bbddd IB/mlx5: Use cache line size to select CQE stride
   ad886a0e9035 IB/mlx5: Validate requested RQT size
   76a93a6f8dd7 IB/mlx4: Fix create CQ error flow
   4234e6a06f8b IB/mlx4: Check gid_index return value
   fc9275365065 IB/rxe: Clear queue buffer when modifying QP to reset
   3c87b4a8f6d5 IB/rxe: Fix handling of erroneous WR
   c4605a0e9605 IB/rxe: Fix kernel panic in UDP tunnel with GRO and RX checksum
   04d016249998 IB/rxe: Update qp state for user query
   bac1543b764c perf hists: Fix column length on --hierarchy
   4cba876de64d PM / sleep: don't suspend parent when async child suspend_{noirq, late} fails
   2e2c8f0e7502 PM / sleep: fix device reference leak in test_suspend
   fd669bf2a099 uwb: fix device reference leaks
   ab17baeaea91 sunrpc: svc_age_temp_xprts_now should not call setsockopt non-tcp transports
   8c7ea73e3a9b mfd: core: Fix device reference leak in mfd_clone_cell
   545ea4003db9 iwlwifi: mvm: wake the wait queue when the RX sync counter is zero
   8bfaf856695b iwlwifi: mvm: fix d3_test with unified D0/D3 images
   8cdfd32398b5 iwlwifi: mvm: fix netdetect starting/stopping for unified images
   6e3324dc039c iwlwifi: pcie: mark command queue lock with separate lockdep class
   b822907865cc iwlwifi: pcie: fix SPLC structure parsing
   edb60ee4bc65 rtc: omap: Fix selecting external osc
   5f95e68daae3 clk: imx: fix integer overflow in AV PLL round rate
   fec43900c9b7 clk: mmp: mmp2: fix return value check in mmp2_clk_init()
   63465eaf7b2e clk: mmp: pxa168: fix return value check in pxa168_clk_init()
   a42bbd552ded clk: mmp: pxa910: fix return value check in pxa910_clk_init()
   bb6c9ec826be virtio-net: drop legacy features in virtio 1 mode
   899f5426eebf drm/i915: Assume non-DP++ port if dvo_port is HDMI and there's no AUX ch specified in the VBT
   f6920e506992 drm/i915: Refresh that status of MST capable connectors in ->detect()
   56a02a5f60ea drm/amdgpu: Attach exclusive fence to prime exported bo's. (v5)
   3eac4767dd7e powerpc/64: Fix setting of AIL in hypervisor mode
   fc312878ffe3 crypto: caam - do not register AES-XTS mode on LP units
   54f28973e8a5 ARM: dts: imx53-qsb: Fix regulator constraints
   7001b98b9dce ext4: sanity check the block and cluster size at mount time
   56df604296c2 kbuild: Steal gcc's pie from the very beginning
   e14754cb8f0c x86/kexec: add -fno-PIE
   ad4e2f324ade scripts/has-stack-protector: add -fno-PIE
   1c7727d0bca0 kbuild: add -fno-PIE
   20bcbe246933 Disable the __builtin_return_address() warning globally after all
   504b60516ba7 i2c: i2c-mux-pca954x: fix deselect enabling for device-tree
   45244660281c i2c: mux: fix up dependencies
   ce97f5012b6d ALSA: hda - Fix mic regression by ASRock mobo fixup
   23e14ee1abcf ALSA: hda - add a new condition to check if it is thinkpad
   85fcb62a58b2 ALSA: usb-audio: Fix use-after-free of usb_device at disconnect
   e902f10da218 gpio: do not double-check direction on sleeping chips
   b21b327d96bc can: bcm: fix warning in bcm_connect/proc_register
   50e6cd2feff7 mfd: stmpe: Fix RESET regression on STMPE2401
   e015527c6fbd mfd: intel-lpss: Do not put device in reset state on suspend
   8b4d44f46bf2 IB/hfi1: Fix rnr_timer addition
   06eac15f11e0 IB/rdmavt: rdmavt can handle non aligned page maps
   ca720a2b11b4 fuse: fix fuse_write_end() if zero bytes were copied
   de58c50e84e2 genirq: Use irq type from irqdata instead of irqdesc
   8844024c8839 ftrace: Add more checks for FTRACE_FL_DISABLED in processing ip records
   c5d20ce0b459 ftrace: Ignore FTRACE_FL_DISABLED while walking dyn_ftrace records
   f271087fb2ea KVM: arm64: Fix the issues when guest PMCCFILTR is configured
   8d8b37e242de arm64: KVM: pmu: Fix AArch32 cycle counter access
   1cb9b2489e77 KVM: Disable irq while unregistering user notifier
   23555ca21394 KVM: x86: fix missed SRCU usage in kvm_lapic_set_vapic_addr
   f8c74cf95655 x86/cpu/AMD: Fix cpu_llc_id for AMD Fam17h systems

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 980e4b14ed7f..c939bbabd112 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "df64f1041f15871cffb254d7136072d1d4859284"
-SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
+SRCREV_machine ?= "aa9ab71e9d9539c7f81282a47e87dea79c2e0f4e"
+SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.10"
+LINUX_VERSION ?= "4.8.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 82daf48585e6..e1de91461f43 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.10"
+LINUX_VERSION ?= "4.8.12"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "78e5c86c1c194e2045e8eb2c948d00f2dbb1f31c"
-SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
+SRCREV_machine ?= "c12f4b364b6638843f5b9049c7fd467503bf30a8"
+SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 6c7ab52f1552..4be42679551a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a004864814e34348c6dc5f745af3f775c55c0510"
-SRCREV_machine_qemuarm64 ?= "eb61693c773924d742aeea5e03b88d7554db61c3"
-SRCREV_machine_qemumips ?= "89f99732db8a8082898a396e67a34472a1017032"
-SRCREV_machine_qemuppc ?= "e03132839bac2cef030ff70b3e19c0fb4816a9fd"
-SRCREV_machine_qemux86 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
-SRCREV_machine_qemux86-64 ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
-SRCREV_machine_qemumips64 ?= "ff92ef8e2b67415b5e6fd4cd15489cb43de8c932"
-SRCREV_machine ?= "9acf42c4475aa0699b2692d7f27f22d699b36337"
-SRCREV_meta ?= "f768e31c67f7c67b27ff2c1ba857eef2367de974"
+SRCREV_machine_qemuarm ?= "9e3e856bc06ddaacc5f4075603630fcca76810f7"
+SRCREV_machine_qemuarm64 ?= "008b4cdf62307da4e07082fd8782d70ba07500cb"
+SRCREV_machine_qemumips ?= "c86ac5b3228b43304d8b2f1d49a0e4bd66207342"
+SRCREV_machine_qemuppc ?= "5a245217d5271d1961df408b9a723a4eb188e0bf"
+SRCREV_machine_qemux86 ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
+SRCREV_machine_qemux86-64 ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
+SRCREV_machine_qemumips64 ?= "7bfa2a19b1aa9f1389f8276d6a7669472517b18a"
+SRCREV_machine ?= "45f25516edd8636f1fec250f6e3020408cd30be9"
+SRCREV_meta ?= "b22e47739683444916dc64548df1dbf6856500a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.10"
+LINUX_VERSION ?= "4.8.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


