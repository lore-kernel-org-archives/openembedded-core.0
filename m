Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9DAA71B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsjZ3026313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:45 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:29 -0500
Message-ID: <bf56d6e79dd28c8a91c1862c389c40e23f3db3e6.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] linux-yocto/4.9: merge 4.9.3 and ethernet config changes
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:45 -0000
Content-Type: text/plain

Merging the following meta-data changes:

 03a2d3f7f999 Add support for NVMe storage devices
 27a79fa51d44 Modularize PCI/PCIe ethernet drivers
 53d2a7d9c9f8 Modularize USB network drivers

And the 4.9.3 -stable update, which has the following shortlog:

   584fd7872c1b Linux 4.9.3
   3999c535da7a usb: gadget: composite: always set ep->mult to a sensible value
   7ff469ceba26 Revert "usb: gadget: composite: always set ep->mult to a sensible value"
   ec3d5c521af8 Revert "rtlwifi: Fix enter/exit power_save"
   cf365b117388 tick/broadcast: Prevent NULL pointer dereference
   34db201f0de7 clocksource/dummy_timer: Move hotplug callback after the real timers
   1b9c2556809a xfs: fix max_retries _show and _store functions
   91192ae41e6f xfs: fix crash and data corruption due to removal of busy COW extents
   b96e4e87d2b0 xfs: use the actual AG length when reserving blocks
   d9c7c9fa600a xfs: fix double-cleanup when CUI recovery fails
   aa38f370b25a xfs: use GPF_NOFS when allocating btree cursors
   3c382dda47e4 xfs: ignore leaf attr ichdr.count in verifier during log replay
   c00203386d50 xfs: don't cap maximum dedupe request length
   f8b20705a383 xfs: don't allow di_size with high bit set
   12815dd15c48 xfs: error out if trying to add attrs and anextents > 0
   cd4bf1d416ef xfs: don't crash if reading a directory results in an unexpected hole
   b88398de1833 xfs: complain if we don't get nextents bmap records
   4bb31bccea38 xfs: check for bogus values in btree block headers
   b85f32481d93 xfs: forbid AG btrees with level == 0
   4081d4a79a95 xfs: handle cow fork in xfs_bmap_trace_exlist
   a585e1c4ec93 xfs: pass state not whichfork to trace_xfs_extlist
   bdbfd4ee6bc7 xfs: Move AGI buffer type setting to xfs_read_agi
   06ac11df915d xfs: pass post-eof speculative prealloc blocks to bmapi
   553937d3cce8 xfs: use new extent lookup helpers xfs_file_iomap_begin_delay
   3d6e3b12bb4e xfs: clean up cow fork reservation and tag inodes correctly
   4a323331d8c9 xfs: use new extent lookup helpers in __xfs_reflink_reserve_cow
   cf168f2ff8ba xfs: track preallocation separately in xfs_bmapi_reserve_delalloc()
   cf4fb510473b xfs: remove prev argument to xfs_bmapi_reserve_delalloc
   390325766033 xfs: always succeed when deduping zero bytes
   2b7dae91a134 xfs: factor rmap btree size into the indlen calculations
   49dc19915d3b xfs: new inode extent list lookup helpers
   b49ef758f600 xfs: fix unbalanced inode reclaim flush locking
   63fa793e757d xfs: check minimum block size for CRC filesystems
   f380ee72a7a4 xfs: provide helper for counting extents from if_bytes
   3978c5bb0043 xfs: don't BUG() on mixed direct and mapped I/O
   2f092422e1ce xfs: don't skip cow forks w/ delalloc blocks in cowblocks scan
   a11f90ca5f30 xfs: check return value of _trans_reserve_quota_nblks
   ae8b6cb40cb2 xfs: don't call xfs_sb_quota_from_disk twice
   56d22b912542 tpm_tis: Check return values from get_burstcount.
   4ffac6f06dfa drm/i915/gen9: fix the WM memory bandwidth WA for Y tiling cases
   f482823e99f0 drm/i915/gen9: unconditionally apply the memory bandwidth WA
   2bdb638de2fc drm/i915: disable PSR by default on HSW/BDW
   9ab30a6529b5 drm/radeon: Always store CRTC relative radeon_crtc->cursor_x/y values
   5417f59cb996 s390/pci: fix dma address calculation in map_sg
   dae9151a88f7 s390/topology: always use s390 specific sched_domain_topology_level
   b3539f813578 powerpc/pci/rpadlpar: Fix device reference leaks
   1aaa777ec009 PCI: Enable access to non-standard VPD for Chelsio devices (cxgb3)
   c444cc34534b PCI: Support INTx masking on ConnectX-4 with firmware x.14.1100+
   e2822904ace5 PCI: Convert Mellanox broken INTx quirks to be for listed devices only
   890661544739 PCI: Convert broken INTx masking quirks from HEADER to FINAL
   04b97a6be2ed PCI: Add Mellanox device IDs
   090cce6f6f88 PCI: rockchip: Correct the use of FTS mask
   6e4bcf8539af PCI: rockchip: Fix negotiated lanes calculation
   257349bedca3 staging: media: davinci_vpfe: unlock on error in vpfe_reqbufs()
   a299abd23081 f2fs: hide a maybe-uninitialized warning
   725ba1a3ebc4 f2fs: remove percpu_count due to performance regression
   5cc85ef4ffe6 md: fix refcount problem on mddev when stopping array.
   60a931c20d1a md: MD_RECOVERY_NEEDED is set for mddev->recovery
   d33a490770e5 crypto: arm64/aes-ce - fix for big endian
   eb64cbc5665d crypto: arm64/aes-xts-ce: fix for big endian
   c3edfe038a75 crypto: arm64/sha1-ce - fix for big endian
   39b7e1c2fdda crypto: arm64/aes-neon - fix for big endian
   d018dc9540f7 crypto: arm64/aes-ccm-ce: fix for big endian
   e6ce55f7be90 crypto: arm/aes-ce - fix for big endian
   a7c9666735f4 crypto: arm64/ghash-ce - fix for big endian
   cdeaed7dda7b crypto: arm64/sha2-ce - fix for big endian
   a05aa258b237 s390/crypto: unlock on error in prng_tdes_read()
   5d7d362abc40 mm, compaction: fix NR_ISOLATED_* stats for pfn based migration
   dc1b6d0aed97 mm: khugepaged: fix radix tree node leak in shmem collapse error path
   058a4a534c23 mm: khugepaged: close use-after-free race during shmem collapsing
   cd6d9ffffc4c docs-rst: fix LaTeX \DURole renewcommand with Sphinx 1.3+
   66c677037936 mm/hugetlb.c: use the right pte val for compare in hugetlb_cow
   17df3e74fb51 rpmsg: qcom_smd: Correct return value for O_NONBLOCK
   1d8286ccbcc6 mmc: mmc_test: Uninitialized return value
   74e365e69687 genirq/affinity: Fix node generation from cpumask
   65f796837e00 PM / wakeirq: Fix dedicated wakeirq for drivers not using autosuspend
   3b198ddd5855 irqchip/bcm7038-l1: Implement irq_cpu_offline() callback
   5cbea795f4d1 PCI/MSI: Check for NULL affinity mask in pci_irq_get_affinity()
   825e6a0f7c51 ima: fix memory leak in ima_release_policy
   c4c11b4bdbf6 relay: check array offset before using it
   3dd50a5e2be9 sbp-target: Fix second argument of percpu_ida_alloc()
   0e79a6b45677 target/iscsi: Fix double free in lio_target_tiqn_addtpg()
   962a12f8e523 scsi: mvsas: fix command_active typo
   5157e98aa024 scsi: g_NCR5380: Fix release_region in error handling
   d451b3cc89c7 ASoC: samsung: i2s: Fixup last IRQ unsafe spin lock call
   574bac4f4022 ASoC: Intel: Skylake: Fix a shift wrapping bug
   d61a969f0e94 ASoC: cht_bsw_rt5645: Fix leftover kmalloc
   311742c40da9 ASoC: lpass-platform: initialize dma channel number
   afd7e2b4258a iommu/vt-d: Flush old iommu caches for kdump when the device gets context mapped
   ef41459ab279 iommu/vt-d: Fix pasid table size encoding
   2148835de3c2 iommu/amd: Fix the left value check of cmd buffer
   48ffae87e913 iommu/amd: Missing error code in amd_iommu_init_device()
   54eed7ab1367 clk: renesas: mstp: Support 8-bit registers for r7s72100
   5dd700e897e4 clk: imx31: fix rewritten input argument of mx31_clocks_init()
   6c9f62846872 clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clocks
   36a6f7005f38 clk: sunxi-ng: sun8i-a23: Set CLK_SET_RATE_PARENT for audio module clocks
   7af503c02b33 clk: ti: dra7: fix "failed to lookup clock node gmac_gmii_ref_clk_div" boot message
   411873a0390e clk: clk-wm831x: fix a logic error
   e3b665ef4110 clk: qcom: ipq806x: Fix board clk rates
   447433e5f804 Input: synaptics-rmi4 - unlock on error
   584cb7dd15a3 hwmon: (lm90) fix temp1_max_alarm attribute
   2aca9a4fe104 hwmon: (g762) Fix overflows and crash seen when writing limit attributes
   81616a9f751e hwmon: (nct7802) Fix overflows seen when writing into limit attributes
   a69a6ebd036a hwmon: (ds620) Fix overflows seen when writing temperature limits
   29e7b170db90 hwmon: (amc6821) sign extension temperature
   af3cd3f0a805 hwmon: (scpi) Fix module autoload
   7a13086bd457 platform/x86: fujitsu-laptop: use brightness_set_blocking for LED-setting callbacks
   36c1bc65d211 x86/cpu: Probe CPUID leaf 6 even when cpuid_level == 6
   bedcab8723ce x86/prctl/uapi: Remove #ifdef for CHECKPOINT_RESTORE
   e641c92fd2ae debugfs: improve DEFINE_DEBUGFS_ATTRIBUTE for !CONFIG_DEBUG_FS
   629138cd28be clk: renesas: cpg-mssr: Fix inverted debug check
   47e3472507f0 efi/efivar_ssdt_load: Don't return success on allocation failure
   4e1dfb0035e1 cris: Only build flash rescue image if CONFIG_ETRAX_AXISFLASHMAP is selected
   15e0355a1ec5 ath10k: use the right length of "background"
   ac86312e0870 mfd: tps65217: Fix page fault on unloading modules
   a24f1f3520e6 ath10k: fix failure to send NULL func frame for 10.4
   45816391e1a5 nl80211: Use different attrs for BSSID and random MAC addr in scan req
   cd84516473a7 mac80211: fix tid_agg_rx NULL dereference
   1d9c33f1b45c drm/i915: tune down the fast link training vs boot fail
   8b4879154a67 drm/i915/dp: add lane_count check in intel_dp_check_link_status
   5af6f56bb16c usb: dwc3: gadget: always unmap EP0 requests
   c008309f53e5 usb: dwc3: ep0: explicitly call dwc3_ep0_prepare_one_trb()
   5f7fd4d2f94d usb: dwc3: ep0: add dwc3_ep0_prepare_one_trb()
   96a0c8ee7ce6 iio: accel: st_accel: fix LIS3LV02 reading and scaling
   a673f99884e3 staging: iio: ad7606: fix improper setting of oversampling pins
   fc322290fc06 mei: move write cb to completion on credentials failures
   5d46c4e9a05e mei: bus: fix mei_cldev_enable KDoc
   af776953108b mei: fix parameter rename KDoc
   c1ec6ba3d7c7 USB: serial: io_ti: bind to interface after fw download
   fb0a00fb0843 dibusb: fix possible memory leak in dibusb_rc_query()
   5f6136debf7e ARM: dts: sun7i: bananapi-m1-plus: Enable USB PHY for USB host support
   5ef54ae37b13 arm64: dts: hip06: Correct hardware pin number of usb node
   93f6891a383f USB: phy: am335x-control: fix device and of_node leaks
   d387f98cb0c1 ARM: dts: r8a7794: Correct hsusb parent clock
   a10a1b797a0f usb: gadget: fix request length error for isoc transfer
   b429e37b80fd usb: gadget: Fix second argument of percpu_ida_alloc()
   8da83724d491 USB: serial: kl5kusb105: abort on open exception path
   e7c72dccd725 ALSA: usb-audio: Fix bogus error return in snd_usb_create_stream()
   2eb09ccfa45b usb: musb: blackfin: add bfin_fifo_offset in bfin_ops
   64244edf304b usb: gadget: udc: core: fix return code of usb_gadget_probe_driver()
   8ecf70fb0889 usb: hub: Move hub_port_disable() to fix warning if PM is disabled
   d7550d7d6ae2 usb: musb: Fix trying to free already-free IRQ 4
   5e3c2920e9f2 usb: dwc3: gadget: Fix full speed mode
   81f1f24d1873 usb: dwc3: pci: Fix dr_mode misspelling
   6af3ba285acb usb: dwc3: pci: add Intel Gemini Lake PCI ID
   63d92d10a820 xhci: Fix race related to abort operation
   799dfdeb33a0 xhci: Use delayed_work instead of timer for command timeout
   6db52153fea3 usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL
   1bd67e85edf1 USB: serial: mos7720: fix parallel probe
   6ea44fb2183c USB: serial: mos7720: fix parport use-after-free on probe errors
   e7cf756c8932 USB: serial: mos7720: fix use-after-free on probe errors
   ac81f1fa956f USB: serial: mos7720: fix NULL-deref at open
   bd52ddb0996a USB: serial: mos7840: fix NULL-deref at open
   9de856caff86 USB: serial: kobil_sct: fix NULL-deref in write
   b2aa55142ea5 USB: serial: cyberjack: fix NULL-deref at open
   4de811c61ac5 USB: serial: oti6858: fix NULL-deref at open
   65914eeb39f4 USB: serial: io_edgeport: fix NULL-deref at open
   2e5167b239e6 USB: serial: ti_usb_3410_5052: fix NULL-deref at open
   0556702bf34e USB: serial: garmin_gps: fix memory leak on failed URB submit
   9401cc62b7f5 USB: serial: iuu_phoenix: fix NULL-deref at open
   69017618a61e USB: serial: io_ti: fix I/O after disconnect
   a66274a9b2f4 USB: serial: io_ti: fix another NULL-deref at open
   32631d1a739f USB: serial: io_ti: fix NULL-deref at open
   b5264ea24484 USB: serial: spcp8x5: fix NULL-deref at open
   dda7611ec4a5 USB: serial: keyspan_pda: verify endpoints at probe
   69c415ed5c98 USB: serial: pl2303: fix NULL-deref at open
   2a4ae7bc3d8d USB: serial: quatech2: fix sleep-while-atomic in close
   6ae3e89aa6b1 USB: serial: omninet: fix NULL-derefs at open and disconnect
   9acba5179d6c usb: return error code when platform_get_irq fails
   cb02cce9a7f8 usb: xhci: hold lock over xhci_abort_cmd_ring()
   9e6c400bb582 xhci: Handle command completion and timeout race
   78ccc1966c9e usb: host: xhci: Fix possible wild pointer when handling abort command
   a2118d097409 usb: xhci: fix return value of xhci_setup_device()
   3bf5e7410178 xhci: free xhci virtual devices with leaf nodes first
   40359f915694 usb: xhci: apply XHCI_PME_STUCK_QUIRK to Intel Apollo Lake
   9da8e3e48e88 usb: xhci: fix possible wild pointer
   9bdd47c53b7c usb: dwc3: core: avoid Overflow events
   2b95c939cb88 usb: gadget: composite: Test get_alt() presence instead of set_alt()
   735daeec9e60 USB: dummy-hcd: fix bug in stop_activity (handle ep0)
   05b0f2fc3c2f USB: fix problems with duplicate endpoint addresses
   da4543b3bce0 USB: gadgetfs: fix checks of wTotalLength in config descriptors
   46427c247b62 USB: gadgetfs: fix use-after-free bug
   b946777664db USB: gadgetfs: fix unbounded memory allocation bug
   404954e5b8a6 usb: gadgetfs: restrict upper bound on device configuration size
   72271ae49d6b usb: storage: unusual_uas: Add JMicron JMS56x to unusual device
   4a37dbe68289 usb: musb: dsps: implement clear_ep_rxintr() callback
   5de2dd7f1be1 usb: musb: core: add clear_ep_rxintr() to musb_platform_ops
   84fd8feb5bb5 KVM: MIPS: Flush KVM entry code from icache globally
   26a401a6a52f KVM: MIPS: Don't clobber CP0_Status.UX
   f39969ab0418 KVM: x86: reset MMU on KVM_SET_VCPU_EVENTS
   fe4fc2d67d0b drm/i915: Initialize overlay->last_flip properly
   f0f7f38e8068 drm/i915: Force VDD off on the new power seqeuencer before starting to use it
   73d425635989 drm/i915: Fix oops in overlay due to frontbuffer tracking
   5652dd3f005d drm/i915: Fix oopses in the overlay code due to i915_gem_active stuff
   8f8157c2a72a gcc-plugins: update gcc-common.h for gcc-7
   8c775affbbd6 asm-prototypes: Clear any CPP defines before declaring the functions
   5e7598a625ee mac80211: initialize fast-xmit 'info' later
   3c4eef316703 pinctrl/amd: Set the level based on ACPI tables
   c7b1b7951d9d ARM: davinci: da850: don't add emac clock to lookup table twice
   5f390df2baf7 HID: sensor-hub: Move the memset to sensor_hub_get_feature()
   0c8033357b1d parisc: Mark cr16 clocksource unstable on SMP systems
   e569eef6298a parisc: Add line-break when printing segfault info
   d259b6853732 fscrypt: fix renaming and linking special files
   be4e3aec5667 ALSA: usb-audio: Fix irq/process data synchronization
   5b2c3cafcafc ALSA: hda - Apply asus-mode8 fixup to ASUS X71SL
   71c88fc3bde7 ALSA: hda - Fix up GPIO for ASUS ROG Ranger
   755259ba2a3a staging: octeon: Call SET_NETDEV_DEV()
   ea991c8354c3 iio: bmi160: Fix time needed to sleep after command execution
   7090b8da3836 iio: max44000: correct value in illuminance_integration_time_available
   cf49219364fd iio: common: st_sensors: fix channel data parsing

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index b4091e97013d..e745ff76ea18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "561c287ba4ac6a771b2a9b605d1bda1ad8d1bc4b"
-SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
+SRCREV_machine ?= "2751bf0b7339c4f3227b3a7d45b2dbe5726906aa"
+SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.2"
+LINUX_VERSION ?= "4.9.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 5d960bc14289..fa5dbfef1ea0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.2"
+LINUX_VERSION ?= "4.9.3"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
+SRCREV_machine ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index b820e7c864ee..f57024f7f605 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f616cec971fc96f282730a7db685638ac530b36"
-SRCREV_machine_qemuarm64 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_machine_qemumips ?= "51e43e95d3ba96e95b19027d288d24d5e7eaff66"
-SRCREV_machine_qemuppc ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_machine_qemux86 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_machine_qemux86-64 ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_machine_qemumips64 ?= "608c940901025464daaafe9749727ce26a194429"
-SRCREV_machine ?= "441291bf1bfbbfff1dc1c326b950d92e3cd5c900"
-SRCREV_meta ?= "155d2810faa1977c6a87f671cdb0da48c36af5fd"
+SRCREV_machine_qemuarm ?= "09b1056330a9a4fc077d569513c2b40e8340e813"
+SRCREV_machine_qemuarm64 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_machine_qemumips ?= "858b4f40b3c2dbb6cb2ac76cc27dd5275d83f1f9"
+SRCREV_machine_qemuppc ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_machine_qemux86 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_machine_qemux86-64 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_machine_qemumips64 ?= "32baa0c2e903fdfa714c38428ba055ad861d058d"
+SRCREV_machine ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
+SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.2"
+LINUX_VERSION ?= "4.9.3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


