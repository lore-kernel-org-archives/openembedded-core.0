Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E852073173
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELEUXq023947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:30 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:17 -0500
Message-ID: <f8a86d7984a6c441790d6036d3bb60c5263b885b.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] linux-yocto/4.8: update to v4.8.18
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:31 -0000
Content-Type: text/plain

Paul Gortmaker has started doing 4.8 -stable updates. This integrates
his 4.8.18 queue from:

   git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux-4.8.y.git

Change log is as follows:

   28dda89acd7c Linux 4.8.18
   936e79682048 tick/broadcast: Prevent NULL pointer dereference
   f22b03e15427 clocksource/dummy_timer: Move hotplug callback after the real timers
   8f78db7e5df0 xfs: use GPF_NOFS when allocating btree cursors
   1d818a81bac6 xfs: ignore leaf attr ichdr.count in verifier during log replay
   62ef2c9c1d94 xfs: don't allow di_size with high bit set
   db28776559c7 xfs: error out if trying to add attrs and anextents > 0
   fb70f2a64910 xfs: don't crash if reading a directory results in an unexpected hole
   ebff27d76e7e xfs: complain if we don't get nextents bmap records
   14c3f0b270aa xfs: check for bogus values in btree block headers
   31f0f90742a3 xfs: pass state not whichfork to trace_xfs_extlist
   430a362685e9 xfs: Move AGI buffer type setting to xfs_read_agi
   20aa52b53586 xfs: new inode extent list lookup helpers
   c7b75fcea4e6 xfs: fix unbalanced inode reclaim flush locking
   e89df591f833 xfs: check minimum block size for CRC filesystems
   b04a2c02f4d7 xfs: provide helper for counting extents from if_bytes
   f4e7f4cd52b1 xfs: don't BUG() on mixed direct and mapped I/O
   49f159ae6e80 xfs: check return value of _trans_reserve_quota_nblks
   23bb39fdbb96 xfs: don't call xfs_sb_quota_from_disk twice
   d3c7d2aa00d4 tpm_tis: Check return values from get_burstcount.
   9fc58e555d78 drm/i915/gen9: fix the WM memory bandwidth WA for Y tiling cases
   4f075608d2c4 drm/i915/gen9: unconditionally apply the memory bandwidth WA
   55e9c9d00d70 drm/i915: disable PSR by default on HSW/BDW
   2c266a9a3631 drm/radeon: Always store CRTC relative radeon_crtc->cursor_x/y values
   e4d1900e15db s390/topology: always use s390 specific sched_domain_topology_level
   b04e5322d8a4 powerpc/pci/rpadlpar: Fix device reference leaks
   458e63f135d6 PCI: Enable access to non-standard VPD for Chelsio devices (cxgb3)
   05a725c46f56 PCI: Support INTx masking on ConnectX-4 with firmware x.14.1100+
   8d12795b1eac PCI: Convert Mellanox broken INTx quirks to be for listed devices only
   24af87eb2ffa PCI: Convert broken INTx masking quirks from HEADER to FINAL
   ec9f277f52e9 PCI: Add Mellanox device IDs
   9e7c8ebc1316 staging: media: davinci_vpfe: unlock on error in vpfe_reqbufs()
   8c6c73a692c9 f2fs: hide a maybe-uninitialized warning
   a91f2c1d4f45 f2fs: remove percpu_count due to performance regression
   93634e1cc928 md: MD_RECOVERY_NEEDED is set for mddev->recovery
   239b31c50bde crypto: arm64/aes-ce - fix for big endian
   a3141467e092 crypto: arm64/aes-xts-ce: fix for big endian
   7c26ef18f05a crypto: arm64/sha1-ce - fix for big endian
   cb70151453a1 crypto: arm64/aes-neon - fix for big endian
   c1c451bea4af crypto: arm64/aes-ccm-ce: fix for big endian
   c4957563b255 crypto: arm/aes-ce - fix for big endian
   dcb0c4ebc7ad crypto: arm64/ghash-ce - fix for big endian
   d60ecc7f02a4 crypto: arm64/sha2-ce - fix for big endian
   f9315853c7c1 s390/crypto: unlock on error in prng_tdes_read()
   a76c795f53e7 mm, compaction: fix NR_ISOLATED_* stats for pfn based migration
   d3b82f9a9716 mm: khugepaged: fix radix tree node leak in shmem collapse error path
   ab533014582f mm: khugepaged: close use-after-free race during shmem collapsing
   c9777f749c4c mm/hugetlb.c: use the right pte val for compare in hugetlb_cow
   0ff00251359e mmc: mmc_test: Uninitialized return value
   abe558647a0f PM / wakeirq: Fix dedicated wakeirq for drivers not using autosuspend
   b90b6b8cce53 irqchip/bcm7038-l1: Implement irq_cpu_offline() callback
   d6229a05dd06 ima: fix memory leak in ima_release_policy
   8cbe9b689467 sbp-target: Fix second argument of percpu_ida_alloc()
   fed8068fd1de target/iscsi: Fix double free in lio_target_tiqn_addtpg()
   ec92af68808e scsi: mvsas: fix command_active typo
   efe08cc6939b ASoC: samsung: i2s: Fixup last IRQ unsafe spin lock call
   a5a550bd0768 ASoC: cht_bsw_rt5645: Fix leftover kmalloc
   3fcdecb0f9f6 iommu/vt-d: Flush old iommu caches for kdump when the device gets context mapped
   22604a045edb iommu/vt-d: Fix pasid table size encoding
   f7dd8813279b iommu/amd: Fix the left value check of cmd buffer
   9a134d29af48 iommu/amd: Missing error code in amd_iommu_init_device()
   35a294dd5723 clk: renesas: mstp: Support 8-bit registers for r7s72100
   8a7022b2ffad clk: imx31: fix rewritten input argument of mx31_clocks_init()
   8b4940dd9224 clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clocks
   a13af6a13e68 clk: ti: dra7: fix "failed to lookup clock node gmac_gmii_ref_clk_div" boot message
   c54f34533601 clk: clk-wm831x: fix a logic error
   36c3481984b5 clk: qcom: ipq806x: Fix board clk rates
   fdd91f12bebc hwmon: (g762) Fix overflows and crash seen when writing limit attributes
   18d749bb756f hwmon: (nct7802) Fix overflows seen when writing into limit attributes
   1e6b9473280a hwmon: (ds620) Fix overflows seen when writing temperature limits
   0bc18f1d87d9 hwmon: (amc6821) sign extension temperature
   4c8493cb90b9 hwmon: (scpi) Fix module autoload
   d618b1647e27 platform/x86: fujitsu-laptop: use brightness_set_blocking for LED-setting callbacks
   b803e5984015 x86/cpu: Probe CPUID leaf 6 even when cpuid_level == 6
   1121b5f49eb7 debugfs: improve DEFINE_DEBUGFS_ATTRIBUTE for !CONFIG_DEBUG_FS
   f4b9eaba036c clk: renesas: cpg-mssr: Fix inverted debug check
   a25cb9b5744b efi/efivar_ssdt_load: Don't return success on allocation failure
   b36f676475bd cris: Only build flash rescue image if CONFIG_ETRAX_AXISFLASHMAP is selected
   40b0bbe612bb ath10k: use the right length of "background"
   3e0f61361a82 nl80211: Use different attrs for BSSID and random MAC addr in scan req
   3d04e6a06abc mac80211: fix tid_agg_rx NULL dereference
   f4ded840a335 drm/i915: tune down the fast link training vs boot fail
   2ed2b3cc6ae3 drm/i915/dp: add lane_count check in intel_dp_check_link_status
   ac2370c93a40 usb: dwc3: gadget: always unmap EP0 requests
   6039272a760e usb: dwc3: ep0: explicitly call dwc3_ep0_prepare_one_trb()
   4f76ead23734 usb: dwc3: ep0: add dwc3_ep0_prepare_one_trb()
   7acc87fae524 iio: accel: st_accel: fix LIS3LV02 reading and scaling
   d59378efa7ac staging: iio: ad7606: fix improper setting of oversampling pins
   401316ef7253 mei: move write cb to completion on credentials failures
   3ab87b8fd267 mei: bus: fix mei_cldev_enable KDoc
   c103d55bb7d7 USB: serial: io_ti: bind to interface after fw download
   d302588a910f ARM: dts: sun7i: bananapi-m1-plus: Enable USB PHY for USB host support
   56dce131ec69 arm64: dts: hip06: Correct hardware pin number of usb node
   0c03658a3e7b USB: phy: am335x-control: fix device and of_node leaks
   518a4d8d533c ARM: dts: r8a7794: Correct hsusb parent clock
   7780eb2fd54b usb: gadget: Fix second argument of percpu_ida_alloc()
   a3ff51875d83 USB: serial: kl5kusb105: abort on open exception path
   5f8a0a2fd33b ALSA: usb-audio: Fix bogus error return in snd_usb_create_stream()
   fb106dc8b847 usb: musb: blackfin: add bfin_fifo_offset in bfin_ops
   1bff22506598 usb: gadget: udc: core: fix return code of usb_gadget_probe_driver()
   c7c4ad7fce6d usb: hub: Move hub_port_disable() to fix warning if PM is disabled
   b7fb0479ecd6 usb: musb: Fix trying to free already-free IRQ 4
   217c03eaf10c usb: dwc3: gadget: Fix full speed mode
   7de3c659811a usb: dwc3: pci: Fix dr_mode misspelling
   6fdac0047799 usb: dwc3: pci: add Intel Gemini Lake PCI ID
   220d6521aac2 xhci: Fix race related to abort operation
   d3f3b0bd0756 xhci: Use delayed_work instead of timer for command timeout
   0da62a5b5242 usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL
   997d598c694f USB: serial: mos7720: fix parallel probe
   eb9e22ac9265 USB: serial: mos7720: fix parport use-after-free on probe errors
   c91243377c8d USB: serial: mos7720: fix use-after-free on probe errors
   b756fba5e563 USB: serial: mos7720: fix NULL-deref at open
   8cc2ae8e130e USB: serial: mos7840: fix NULL-deref at open
   68ab1ccfc085 USB: serial: kobil_sct: fix NULL-deref in write
   37ca8378e77c USB: serial: cyberjack: fix NULL-deref at open
   fd435e99f5ed USB: serial: oti6858: fix NULL-deref at open
   1653f66ba3fb USB: serial: io_edgeport: fix NULL-deref at open
   73ec9d58b1c7 USB: serial: ti_usb_3410_5052: fix NULL-deref at open
   d1706b42d164 USB: serial: garmin_gps: fix memory leak on failed URB submit
   b653000d9b0c USB: serial: iuu_phoenix: fix NULL-deref at open
   427bac51ce67 USB: serial: io_ti: fix I/O after disconnect
   59f740cd834c USB: serial: io_ti: fix another NULL-deref at open
   2ef82cf063c8 USB: serial: io_ti: fix NULL-deref at open
   8d5f29b2d578 USB: serial: spcp8x5: fix NULL-deref at open
   e1fe8df45b74 USB: serial: keyspan_pda: verify endpoints at probe
   10da95b6a2eb USB: serial: pl2303: fix NULL-deref at open
   e29498ba6e1f USB: serial: quatech2: fix sleep-while-atomic in close
   05859d754d6f USB: serial: omninet: fix NULL-derefs at open and disconnect
   be17e1c916ce usb: return error code when platform_get_irq fails
   0e9fc72194ce usb: xhci: hold lock over xhci_abort_cmd_ring()
   527f810d8a86 xhci: Handle command completion and timeout race
   c18ca85fd6de usb: host: xhci: Fix possible wild pointer when handling abort command
   67a7de5a2f35 usb: xhci: fix return value of xhci_setup_device()
   775a2bec9cdf xhci: free xhci virtual devices with leaf nodes first
   80c502e0ce6f usb: xhci: apply XHCI_PME_STUCK_QUIRK to Intel Apollo Lake
   d3a9f7c7e8c4 usb: xhci: fix possible wild pointer
   5ded28d83128 usb: gadget: composite: Test get_alt() presence instead of set_alt()
   16718d267e09 USB: dummy-hcd: fix bug in stop_activity (handle ep0)
   47acb8434892 USB: fix problems with duplicate endpoint addresses
   a45f34e820c6 USB: gadgetfs: fix checks of wTotalLength in config descriptors
   27b4d04d1b87 USB: gadgetfs: fix use-after-free bug
   cd4da96b1bac USB: gadgetfs: fix unbounded memory allocation bug
   1fa95887b663 usb: gadgetfs: restrict upper bound on device configuration size
   e4efa88511eb usb: storage: unusual_uas: Add JMicron JMS56x to unusual device
   05ace125078d usb: musb: dsps: implement clear_ep_rxintr() callback
   38caa4d8986e usb: musb: core: add clear_ep_rxintr() to musb_platform_ops
   483c56831853 KVM: MIPS: Flush KVM entry code from icache globally
   08aa895b61e1 KVM: MIPS: Don't clobber CP0_Status.UX
   d33b04df932e KVM: x86: reset MMU on KVM_SET_VCPU_EVENTS
   e3843cdbf81a drm/i915: Force VDD off on the new power seqeuencer before starting to use it
   dbce182845b4 gcc-plugins: update gcc-common.h for gcc-7
   970150316c04 mac80211: initialize fast-xmit 'info' later
   cf3b94f8fe70 ARM: davinci: da850: don't add emac clock to lookup table twice
   391c21a9ab0a parisc: Mark cr16 clocksource unstable on SMP systems
   684f6df20889 fscrypt: fix renaming and linking special files
   6c55d3ad7fb3 ALSA: usb-audio: Fix irq/process data synchronization
   3074297922e2 ALSA: hda - Apply asus-mode8 fixup to ASUS X71SL
   81a35981225c ALSA: hda - Fix up GPIO for ASUS ROG Ranger
   576b9d7789d8 iio: bmi160: Fix time needed to sleep after command execution
   ad2a1ae984c6 iio: max44000: correct value in illuminance_integration_time_available
   ee8e4a73dbf6 iio: common: st_sensors: fix channel data parsing

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index f76b590055ef..71308310c94e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9c4f52cb2bafd9657c51cef2166db2b73a95aaa9"
-SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
+SRCREV_machine ?= "ffd0a071c2df55ecb2bb1f101465df93a81093b5"
+SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.17"
+LINUX_VERSION ?= "4.8.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 1f0406b30468..52e2b5233b0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.17"
+LINUX_VERSION ?= "4.8.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b62f29ac5c15d6333a13811db030d704b35ace8f"
-SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
+SRCREV_machine ?= "db2e91ce904f32347ccf739de969b4216cbcaf92"
+SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index dba7a4aa115e..a56ecdf23c56 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "16f32b5197fbaec1dbf4f380015792ed47322f06"
-SRCREV_machine_qemuarm64 ?= "38631cc4a8f89fb9547af9e44213971a5b360a36"
-SRCREV_machine_qemumips ?= "bcbe7a7845e3061998a740f12e88a792f358393e"
-SRCREV_machine_qemuppc ?= "4858eec374ee4b09e4428895141ad1ed26fb6d64"
-SRCREV_machine_qemux86 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
-SRCREV_machine_qemux86-64 ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
-SRCREV_machine_qemumips64 ?= "b90b544d7a5b004b635cf337b29e15294cb17553"
-SRCREV_machine ?= "9bcb4ea3fa107f1a8790c8c3408eb250e8d1d66e"
-SRCREV_meta ?= "ceb1eeb63f96e903a4caee1bad4dda238192fb6a"
+SRCREV_machine_qemuarm ?= "c0123490bb9b454a43c3573e2573b491e0c09701"
+SRCREV_machine_qemuarm64 ?= "304f750aa5be0bf66f70720d68f16865d912ff9f"
+SRCREV_machine_qemumips ?= "aa15b7a291ca18d08fd640932efad673f6b278c3"
+SRCREV_machine_qemuppc ?= "d2c3ea488fe179898ae853cb9565cb7ac62291c6"
+SRCREV_machine_qemux86 ?= "c50f695341260d4757af64d809390610aae213e1"
+SRCREV_machine_qemux86-64 ?= "c50f695341260d4757af64d809390610aae213e1"
+SRCREV_machine_qemumips64 ?= "40a880b0f21aa09f3b52d68969339d80f9cc10ad"
+SRCREV_machine ?= "c50f695341260d4757af64d809390610aae213e1"
+SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.17"
+LINUX_VERSION ?= "4.8.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


