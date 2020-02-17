Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD0F614FE
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j4so9413920pgi.1
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=e2K1qr2BkVwP9Wx1C5FAObM/+CDZWj1/Gs05wAFofvk=;
	b=EXbzelF5D4TjYE7pEkJEF9tvtTSCsmP4lNlNspyBM3FztI9VSrg1Z6egc+lZowuCSt
	tjlbWMLop/NsD0zYEtHAWKcaEzcSiUcpKRFdR4/cbmTj5mJmM8DNMONU/UYrQeSrRwKd
	/7Te7GqhcquGHXAievY2HdsUIvyWiCz0a1wOkc6UOvfMqZZDDLQYOp8JHOwxhxr/iiCZ
	BivPv00U+4N7gtm9s+L0stei7IWVRFMQOnld1YoqZOEhO/zxTzixtHWIQF1lOWSPD8DI
	PB7FLOlhh7viZl6NG4WCI06KUUbeQ/hKatH0jrA5g4+7XejWq7MK4KKMSAQYHL9dLqve
	5SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=e2K1qr2BkVwP9Wx1C5FAObM/+CDZWj1/Gs05wAFofvk=;
	b=PTfJfLpcyTSaUBrscqqc+71tRTAyO08JXUhBQJfEYIjUCgxnLnv2lpzZEOfHT6AlfT
	eN3mkpK0+lLUrpIyMNflev6VSZE2pSd7HNv5eFPNqUkbXXN815RAKWrl/Vt6mw4XxdQX
	7/Qk+3+zdqnBFm1spSMU6fC+bQPaQH+Y6f67XTsFahW5X80zLZGJbGhwz3DnqkR+hNWT
	kb19xTfQBFH3gt/G+XXKHV2Wk+bLS0xHR/+XOjPZbzYpIvbzwLYfN2ban9EVOTKtznj+
	k1G+OvnG1sHFQCR8JoHqjixl8wM9wQidc+4ZS+eiqJMtzTYB0K5otcdth3XmUTScr9KC
	4Lug==
X-Gm-Message-State: APjAAAWq7IZc993P6KK8LfOeR/SNyLzXgBLBCWy/Z+VRwT5oAXI5155A
	R+wjXZz1W3z+jDo4Nqz76G6FC5vD
X-Google-Smtp-Source: APXvYqxYPGEbtU5Rkqy7PReMGv+swCV0H46sikY84pfHay3QIN1bFs9celPAJSbQQh4LkEOfLuGfOg==
X-Received: by 2002:a17:90a:b318:: with SMTP id
	d24mr21623168pjr.142.1581955262155; 
	Mon, 17 Feb 2020 08:01:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:43 -0800
Message-Id: <bdc7d1a72bc4b095ae9b26ee9cc861e8e9cb05ab.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 05/14] linux-yocto/4.19: update to v4.19.78
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:02 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/4.19 to the latest korg -stable release that comprises
the following commits:

    58fce2064530 Linux 4.19.78
    5b0446c8e0a8 9p/cache.c: Fix memory leak in v9fs_cache_session_get_cookie
    d85bc11a6894 kexec: bail out upon SIGKILL when allocating memory.
    c8a65ec0602a NFC: fix attrs checks in netlink interface
    1b42503211ca smack: use GFP_NOFS while holding inode_smack::smk_lock
    ef9744a0218f Smack: Don't ignore other bprm->unsafe flags if LSM_UNSAFE_PTRACE is set
    4703593498d3 soundwire: fix regmap dependencies and align with other serial links
    322753c78d1d soundwire: Kconfig: fix help format
    74e2a311a226 sch_cbq: validate TCA_CBQ_WRROPT to avoid crash
    ed9420ddce87 tipc: fix unlimited bundling of small messages
    a1afd826e549 xen-netfront: do not use ~0U as error return value for xennet_fill_frags()
    36a4043c4bb8 net/rds: Fix error handling in rds_ib_add_one()
    012363f5ded0 udp: only do GSO if # of segs > 1
    5c08d7e4f1ea net: dsa: rtl8366: Check VLAN ID and not ports
    3c1f0704401c vsock: Fix a lockdep warning in __vsock_release()
    544aee546174 udp: fix gso_segs calculations
    79fd59ae7c2f sch_dsmark: fix potential NULL deref in dsmark_init()
    76b552775d60 rxrpc: Fix rxrpc_recvmsg tracepoint
    7047aae65456 qmi_wwan: add support for Cinterion CLS8 devices
    dd9c580a6d9b nfc: fix memory leak in llcp_sock_bind()
    d5b1db1c7ce4 net: Unpublish sk from sk_reuseport_cb before call_rcu
    9d0995cc268b net: qlogic: Fix memory leak in ql_alloc_large_buffers
    124b64feafa9 net: ipv4: avoid mixed n_redirects and rate_tokens usage
    6f8564edf8c1 ipv6: Handle missing host route in __ipv6_ifa_notify
    658d7ee4da50 ipv6: drop incoming packets having a v4mapped source address
    a495fd19cce2 hso: fix NULL-deref on tty open
    7f30c44b7ca4 erspan: remove the incorrect mtu limit for erspan
    2b8389112292 cxgb4:Fix out-of-bounds MSI-X info array access
    ed568ca73601 bpf: fix use after free in prog symbol exposure
    dbb7339cfddf block: mq-deadline: Fix queue restart handling
    af10ffa69b06 arm: use STACK_TOP when computing mmap base address
    f91a9c6591c0 arm: properly account for stack randomization and stack guard gap
    53ba8d4358eb mips: properly account for stack randomization and stack guard gap
    e1b391abbfce arm64: consider stack randomization for mmap base only when necessary
    30ab799e758e kmemleak: increase DEBUG_KMEMLEAK_EARLY_LOG_SIZE default to 16K
    52132ff52cad ocfs2: wait for recovering done after direct unlock request
    d4a546452dcc kbuild: clean compressed initramfs image
    d983182d4002 crypto: hisilicon - Fix double free in sec_free_hw_sgl()
    22c788ba7a52 hypfs: Fix error number left in struct pointer member
    bbd76d9514c7 pktcdvd: remove warning on attempting to register non-passthrough dev
    0840daeea6cb fat: work around race with userspace's read via blockdev while mounting
    297904ea60a3 ARM: 8903/1: ensure that usable memory in bank 0 starts from a PMD-aligned address
    9a87ab2b4d60 security: smack: Fix possible null-pointer dereferences in smack_socket_sock_rcv_skb()
    69a32a7306dd PCI: exynos: Propagate errors for optional PHYs
    1264d2e7b75b PCI: imx6: Propagate errors for optional regulators
    403d6c9284f1 PCI: histb: Propagate errors for optional regulators
    ac9c0e2ecc49 PCI: rockchip: Propagate errors for optional regulators
    709c4841e51f HID: apple: Fix stuck function keys when using FN
    31e98cba55ed rtc: pcf85363/pcf85263: fix regmap error in set_time
    607f95788fa9 rtc: snvs: fix possible race condition
    078937549f47 ARM: 8875/1: Kconfig: default to AEABI w/ Clang
    3039c788d648 soundwire: intel: fix channel number reported by hardware
    6a684e002561 ARM: 8898/1: mm: Don't treat faults reported from cache maintenance as writes
    0f0ced702d53 livepatch: Nullify obj->mod in klp_module_coming()'s error path
    78a1138672af HID: wacom: Fix several minor compiler warnings
    3b7fbbddeb7a PCI: tegra: Fix OF node reference leak
    c74a801ded7d mfd: intel-lpss: Remove D3cold delay
    70bb4bf9fdfb i2c-cht-wc: Fix lockdep warning
    371077ea2e75 MIPS: tlbex: Explicitly cast _PAGE_NO_EXEC to a boolean
    3ed14a8d2fe7 MIPS: Ingenic: Disable broken BTB lookup optimization.
    5b400fed74df ext4: fix potential use after free after remounting with noblock_validity
    81fbd2327c32 dma-buf/sw_sync: Synchronize signal vs syncpt free
    c76e18970d93 scsi: core: Reduce memory required for SCSI logging
    c6304d4d7458 clk: sprd: add missing kfree
    7cd89b8db60c mbox: qcom: add APCS child device for QCS404
    324b0c9efc77 powerpc: dump kernel log before carrying out fadump or kdump
    72884423e77f clk: at91: select parent if main oscillator or bypass is enabled
    952d1c6d7cf0 arm64: fix unreachable code issue with cmpxchg
    b25bd837a637 pinctrl: meson-gxbb: Fix wrong pinning definition for uart_c
    b717a47dd913 powerpc/pseries: correctly track irq state in default idle
    ae089bf87c57 clk: qcom: gcc-sdm845: Use floor ops for sdcc clks
    2c16f72135fb pstore: fs superblock limits
    0c09b02842b8 powerpc/64s/exception: machine check use correct cfar for late handler
    39b6d05169b2 drm/amdgpu/si: fix ASIC tests
    4dcbca872a84 drm/amd/display: support spdif
    38dfc974f322 clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain
    0b5ac607db4b clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for clock domain
    2cfb89832179 pinctrl: amd: disable spurious-firing GPIO IRQs
    274d7acb0b81 drm/nouveau/volt: Fix for some cards having 0 maximum voltage
    9b2d2f2ad003 vfio_pci: Restore original state on release
    c1f7b3fb87cf powerpc/eeh: Clear stale EEH_DEV_NO_HANDLER flag
    b2df456c83e3 pinctrl: tegra: Fix write barrier placement in pmx_writel
    4c91e678d27c powerpc/pseries/mobility: use cond_resched when updating device tree
    6d728a172732 powerpc/futex: Fix warning: 'oldval' may be used uninitialized in this function
    6aa455b0d0a0 powerpc/rtas: use device model APIs and serialization during LPM
    25c501f0f9d9 powerpc/xmon: Check for HV mode when dumping XIVE info from OPAL
    2cca24b2cb9a clk: zx296718: Don't reference clk_init_data after registration
    efa0fe4cde05 clk: sprd: Don't reference clk_init_data after registration
    89dc59fb267d clk: sirf: Don't reference clk_init_data after registration
    bd3a445c2717 clk: actions: Don't reference clk_init_data after registration
    437399ed906a powerpc/powernv/ioda2: Allocate TCE table levels on demand for default DMA window
    782a77f2eb39 drm/amd/display: reprogram VM config when system resume
    24ba84ec0016 drm/amd/display: fix issue where 252-255 values are clipped
    efb0e1e3d0e1 clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
    a2279550f7be clk: qoriq: Fix -Wunused-const-variable
    84038a98b904 ipmi_si: Only schedule continuously in the thread in maintenance mode
    b351726bb5be PCI: rpaphp: Avoid a sometimes-uninitialized warning
    0936c46139cb gpu: drm: radeon: Fix a possible null-pointer dereference in radeon_connector_set_property()
    6e03bca91f8e drm/radeon: Fix EEH during kexec
    441c15582338 drm/rockchip: Check for fast link training before enabling psr
    f3d62177dee3 drm/panel: check failure cases in the probe func
    9cb3698dcc86 drm/stm: attach gem fence to atomic state
    043f0229f442 video: ssd1307fb: Start page range at page_offset
    bd5b6a7c89ef drm/panel: simple: fix AUO g185han01 horizontal blanking
    db472be8b340 drm/bridge: tc358767: Increase AUX transfer length limit
    053d0ec61e33 tpm: Fix TPM 1.2 Shutdown sequence to prevent future TPM operations
    d598712712e4 tpm: use tpm_try_get_ops() in tpm-sysfs.c.
    6cad9d0cf87b Linux 4.19.77
    2c60da90ec44 drm/amd/display: Restore backlight brightness after system resume
    4d8bdf7f3a86 mm/compaction.c: clear total_{migrate,free}_scanned before scanning a new zone
    5bead06b3443 fuse: fix deadlock with aio poll and fuse_iqueue::waitq.lock
    bbe3e2056d27 md/raid0: avoid RAID0 data corruption due to layout confusion.
    4290a9e59323 CIFS: Fix oplock handling for SMB 2.1+ protocols
    a3a150895b6f CIFS: fix max ea value size
    a0f7fd38acf5 i2c: riic: Clear NACK in tend isr
    fec38267a2bf hwrng: core - don't wait on add_early_randomness()
    060986096fea quota: fix wrong condition in is_quota_modification()
    091c754d5ca9 ext4: fix punch hole for inline_data file systems
    775e3e734bd3 ext4: fix warning inside ext4_convert_unwritten_extents_endio
    caa6926d94f1 /dev/mem: Bail out upon SIGKILL.
    bd3a11af1bde cfg80211: Purge frame registrations on iftype change
    5dc86e9574a1 md: only call set_in_sync() when it is expected to succeed.
    598a2cda62d3 md: don't report active array_state until after revalidate_disk() completes.
    e8323e0ddce1 md/raid6: Set R5_ReadError when there is read failure on parity disk
    bacff03bb286 Btrfs: fix race setting up and completing qgroup rescan workers
    b5c42ef09df3 btrfs: qgroup: Fix reserved data space leak if we have multiple reserve calls
    c521bfa8e2dc btrfs: qgroup: Fix the wrong target io_tree when freeing reserved data space
    067f82a05c2f btrfs: Relinquish CPUs in btrfs_compare_trees
    b08344be3546 Btrfs: fix use-after-free when using the tree modification log
    4874c6fe1c9e btrfs: fix allocation of free space cache v1 bitmap pages
    934243a72849 ovl: filter of trusted xattr results in audit
    e7265adc0a3c ovl: Fix dereferencing possible ERR_PTR()
    2e96c9332595 smb3: allow disabling requesting leases
    82652c06f976 block: fix null pointer dereference in blk_mq_rq_timed_out()
    db5b2fe4d33c i40e: check __I40E_VF_DISABLE bit in i40e_sync_filters_subtask
    b4a734a529b8 memcg, kmem: do not fail __GFP_NOFAIL charges
    d40b3eafb52e memcg, oom: don't require __GFP_FS when invoking memcg OOM killer
    e0c1e6e55bca gfs2: clear buf_in_tr when ending a transaction in sweep_bh_for_rgrps
    3620b06b1db0 efifb: BGRT: Improve efifb_bgrt_sanity_check
    c4f65c2fb0f5 regulator: Defer init completion for a while after late_initcall
    3784576fc639 alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP
    174bbcc560cc arm64: dts: rockchip: limit clock rate of MMC controllers for RK3328
    8cfe3b8aa3b6 arm64: tlb: Ensure we execute an ISB following walk cache invalidation
    fc7d6bfdd774 Revert "arm64: Remove unnecessary ISBs from set_{pte,pmd,pud}"
    881edc165b8e ARM: zynq: Use memcpy_toio instead of memcpy on smp bring-up
    2209279439a1 ARM: samsung: Fix system restart on S3C6410
    ad884155fb9c ASoC: Intel: Fix use of potentially uninitialized variable
    7bdab36455f9 ASoC: Intel: Skylake: Use correct function to access iomem space
    3c54f463402f ASoC: Intel: NHLT: Fix debug print format
    29ecf8cae5f4 binfmt_elf: Do not move brk for INTERP-less ET_EXEC
    02ef5c299d15 media: don't drop front-end reference count for ->detach
    589ca8ec4c62 media: sn9c20x: Add MSI MS-1039 laptop to flip_dmi_table
    496cf984a60e KVM: x86: Manually calculate reserved bits when loading PDPTRS
    933e3e2b5070 KVM: x86: set ctxt->have_exception in x86_decode_insn()
    9723e4458604 KVM: x86: always stop emulation on page fault
    8225db4a70b2 parisc: Disable HP HSC-PCI Cards to prevent kernel crash
    ad41162974c6 fuse: fix missing unlock_page in fuse_writepage()
    ecfe4b5f70c8 powerpc/imc: Dont create debugfs files for cpu-less nodes
    e94443fc7b64 scsi: implement .cleanup_rq callback
    4ec3ca2770e7 blk-mq: add callback of .cleanup_rq
    4848fb93243e ALSA: hda/realtek - PCI quirk for Medion E4254
    e9bcaf82dd37 ceph: use ceph_evict_inode to cleanup inode's resource
    72f0fff3c450 Revert "ceph: use ceph_evict_inode to cleanup inode's resource"
    98dc6d958bd9 randstruct: Check member structs in is_pure_ops_struct()
    ad6819cd68be IB/hfi1: Define variables as unsigned long to fix KASAN warning
    a924850c93d4 IB/mlx5: Free mpi in mp_slave mode
    40b071992ca5 printk: Do not lose last line in kmsg buffer dump
    28f142b940af scsi: qla2xxx: Fix Relogin to prevent modifying scan_state flag
    03b75e65ceed scsi: scsi_dh_rdac: zero cdb in send_mode_select()
    2e21e5b225ef ALSA: firewire-tascam: check intermediate state of clock status and retry
    f5779e4449da ALSA: firewire-tascam: handle error code when getting current source of clock
    fdd131eab68f iwlwifi: fw: don't send GEO_TX_POWER_LIMIT command to FW version 36
    6437ec272eda PM / devfreq: passive: fix compiler warning
    814f7fe56ebb media: omap3isp: Set device on omap3isp subdevs
    c5dbd74f8259 btrfs: extent-tree: Make sure we only allocate extents from block groups with the same type
    2aeeb0a4b440 iommu/amd: Override wrong IVRS IOAPIC on Raven Ridge systems
    291da335040c ALSA: hda/realtek - Blacklist PC beep for Lenovo ThinkCentre M73/93
    8630a4d13683 media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()
    d47636913bda drm/amd/powerplay/smu7: enforce minimal VBITimeout (v2)
    5370cf8d90ad ALSA: hda - Drop unsol event handler for Intel HDMI codecs
    ac1d43a20a08 e1000e: add workaround for possible stalled packet
    35b6cba971f5 libertas: Add missing sentinel at end of if_usb.c fw_table
    0a43d5d458d5 raid5: don't increment read_errors on EILSEQ return
    da87dfca25aa mmc: dw_mmc: Re-store SDIO IRQs mask at system resume
    a0dd3d95fb21 mmc: core: Add helper function to indicate if SDIO IRQs is enabled
    8ba99d50cb61 mmc: sdhci: Fix incorrect switch to HS mode
    869122775782 mmc: core: Clarify sdio_irq_pending flag for MMC_CAP2_SDIO_IRQ_NOTHREAD
    a5443cd24063 raid5: don't set STRIPE_HANDLE to stripe which is in batch list
    064fba888e77 ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set
    476eda2539bb platform/x86: intel_pmc_core: Do not ioremap RAM
    e836cd2917c6 x86/cpu: Add Tiger Lake to Intel family
    b21919eeced6 s390/crypto: xts-aes-s390 fix extra run-time crypto self tests finding
    fad90d4bfa8d kprobes: Prohibit probing on BUG() and WARN() address
    213077da3e7c dmaengine: ti: edma: Do not reset reserved paRAM slots
    f1db75622996 md/raid1: fail run raid1 array when active disk less than one
    76cf93f04c3d hwmon: (acpi_power_meter) Change log level for 'unsafe software power cap'
    f0956418d997 closures: fix a race on wakeup from closure_sync
    9fcfdff61f74 ACPI / PCI: fix acpi_pci_irq_enable() memory leak
    e4467fb6ef54 ACPI: custom_method: fix memory leaks
    6fceb241dc76 ARM: dts: exynos: Mark LDO10 as always-on on Peach Pit/Pi Chromebooks
    e4b4280dcd97 libtraceevent: Change users plugin directory
    c55659cd1459 iommu/iova: Avoid false sharing on fq_timer_on
    223b0481ed4b libata/ahci: Drop PCS quirk for Denverton and beyond
    de888e0244cb iommu/amd: Silence warnings under memory pressure
    6241c0ac301e ALSA: firewire-motu: add support for MOTU 4pre
    ad58ce6cacd1 nvme-multipath: fix ana log nsid lookup when nsid is not found
    9edc229b9c90 nvmet: fix data units read and written counters in SMART log
    7bbb7a9dd2c3 x86/mm/pti: Handle unaligned address gracefully in pti_clone_pagetable()
    5201b4ffc324 ASoC: fsl_ssi: Fix clock control issue in master mode
    4b7d9c2a716e x86/mm/pti: Do not invoke PTI functions when PTI is disabled
    eb2485e32f90 arm64: kpti: ensure patched kernel text is fetched from PoU
    b619496540ba x86/apic/vector: Warn when vector space exhaustion breaks affinity
    01e8f487cecb sched/cpufreq: Align trace event behavior of fast switching
    2919fa0398ad ACPI / CPPC: do not require the _PSD method
    b79922133f9c ASoC: es8316: fix headphone mixer volume table
    dd25f76c1f34 media: ov9650: add a sanity check
    342a0bee4d94 perf trace beauty ioctl: Fix off-by-one error in cmd->string table
    57409ea782e7 media: saa7134: fix terminology around saa7134_i2c_eeprom_md7134_gate()
    78550c5cfe6d media: cpia2_usb: fix memory leaks
    d796c6c1aab4 media: saa7146: add cleanup in hexium_attach()
    ab20f38ce522 media: cec-notifier: clear cec_adap in cec_notifier_unregister
    d51268d7574b PM / devfreq: exynos-bus: Correct clock enable sequence
    7e19b7e0d640 PM / devfreq: passive: Use non-devm notifiers
    f9de170eaf7e EDAC/amd64: Decode syndrome before translating address
    6f80e91a66e0 EDAC/amd64: Recognize DRAM device type ECC capability
    adb97f18b4e7 libperf: Fix alignment trap with xyarray contents in 'perf stat'
    4df2427a5148 media: dvb-core: fix a memory leak bug
    8d5fccff7b0c posix-cpu-timers: Sanitize bogus WARNONS
    9df9652b7345 media: dvb-frontends: use ida for pll number
    006a6065c867 media: mceusb: fix (eliminate) TX IR signal length limit
    d093d3183ca2 nbd: add missing config put
    e497ec26cc43 led: triggers: Fix a memory leak bug
    83c2a42b1b84 ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
    5466c30b11cb tools headers: Fixup bitsperlong per arch includes
    b1f1b83e2583 ASoC: uniphier: Fix double reset assersion when transitioning to suspend state
    e6bc6e2c0d1f media: hdpvr: add terminating 0 at end of string
    4a2cb7600b72 media: radio/si470x: kill urb on error
    dfaf60580191 ARM: dts: imx7-colibri: disable HS400
    c20ee5d906ec ARM: dts: imx7d: cl-som-imx7: make ethernet work again
    21927786df27 m68k: Prevent some compiler warnings in Coldfire builds
    ba8f56ffaebf net: lpc-enet: fix printk format strings
    aa2d05a9de05 media: imx: mipi csi-2: Don't fail if initial state times-out
    1b7df445d881 media: omap3isp: Don't set streaming state on random subdevs
    0c3802174754 media: i2c: ov5645: Fix power sequence
    3dfbac0add22 media: vsp1: fix memory leak of dl on error return path
    c47022e019fe perf record: Support aarch64 random socket_id assignment
    482c1d0a7cc4 dmaengine: iop-adma: use correct printk format strings
    19a1fa140594 media: rc: imon: Allow iMON RC protocol for ffdc 7e device
    a527d3d4b513 media: em28xx: modules workqueue not inited for 2nd device
    6a1c59a7603d media: fdp1: Reduce FCP not found message level to debug
    e3f5f626e17a media: mtk-mdp: fix reference count on old device tree
    066afce8d87d perf test vfs_getname: Disable ~/.perfconfig to get default output
    96b61fe7a5f7 perf config: Honour $PERF_CONFIG env var to specify alternate .perfconfig
    db751f6d5241 media: gspca: zero usb_buf on error
    511110236089 idle: Prevent late-arriving interrupts from disrupting offline
    9addfbd40959 sched/fair: Use rq_lock/unlock in online_fair_sched_group
    6e9d45022d26 firmware: arm_scmi: Check if platform has released shmem before using
    0dbdc1986bb4 efi: cper: print AER info of PCIe fatal error
    4410b8517950 EDAC, pnd2: Fix ioremap() size in dnv_rd_reg()
    cf8f20a1aacf loop: Add LOOP_SET_DIRECT_IO to compat ioctl
    18e5e458c6d8 ACPI / processor: don't print errors for processorIDs == 0xff
    465bc6e80fd2 media: media/platform: fsl-viu.c: fix build for MICROBLAZE
    371538451c21 md: don't set In_sync if array is frozen
    d38aff20c407 md: don't call spare_active in md_reap_sync_thread if all member devices can't work
    1cd972e0a107 md/raid1: end bio when the device faulty
    7d75275fbfb1 arm64/prefetch: fix a -Wtype-limits warning
    829bebdc1ce6 ASoC: rsnd: don't call clk_get_rate() under atomic context
    f5bef62df824 EDAC/altera: Use the proper type for the IRQ status bits
    87bc43e2a775 ia64:unwind: fix double free for mod->arch.init_unw_table
    ca57eca32b3e ALSA: usb-audio: Skip bSynchAddress endpoint check if it is invalid
    d76b5ac5016c base: soc: Export soc_device_register/unregister APIs
    4a75e77ef1b5 media: iguanair: add sanity checks
    fe8fc7d7cb64 EDAC/mc: Fix grain_bits calculation
    55a98e872186 ALSA: i2c: ak4xxx-adda: Fix a possible null pointer dereference in build_adc_controls()
    1af6822f29d6 ALSA: hda - Show the fatal CORB/RIRB error more clearly
    b40c15c20e42 x86/apic: Soft disable APIC before initializing it
    ce7fdd5cd83e x86/reboot: Always use NMI fallback when shutdown via reboot vector IPI fails
    0f30856944d4 sched/deadline: Fix bandwidth accounting at all levels after offline migration
    d29c7b8be599 x86/apic: Make apic_pending_intr_clear() more robust
    f381d3d2c39c sched/core: Fix CPU controller for !RT_GROUP_SCHED
    417cf53b4b85 sched/fair: Fix imbalance due to CPU affinity
    7cebdfa62f22 time/tick-broadcast: Fix tick_broadcast_offline() lockdep complaint
    64f3fb5d751c media: i2c: ov5640: Check for devm_gpiod_get_optional() error
    6cc816dd644e media: hdpvr: Add device num check and handling
    8bc254d3e6b8 media: exynos4-is: fix leaked of_node references
    7ec720763a20 media: mtk-cir: lower de-glitch counter for rc-mm protocol
    920acbff8932 media: dib0700: fix link error for dibx000_i2c_set_speed
    8f9dc49928c2 leds: leds-lp5562 allow firmware files up to the maximum length
    fdcf06a35bc6 dmaengine: bcm2835: Print error in case setting DMA mask fails
    e841313b5731 firmware: qcom_scm: Use proper types for dma mappings
    ec4815460d81 ASoC: sgtl5000: Fix charge pump source assignment
    84bb4024b358 ASoC: sgtl5000: Fix of unmute outputs on probe
    a7ace049bddc ASoC: tlv320aic31xx: suppress error message for EPROBE_DEFER
    3657e58405fb regulator: lm363x: Fix off-by-one n_voltages for lm3632 ldo_vpos/ldo_vneg
    3eec108aa879 ALSA: hda: Flush interrupts on disabling
    5b6c791f494d nfp: flower: prevent memory leak in nfp_flower_spawn_phy_reprs
    33fe1f517e29 nfc: enforce CAP_NET_RAW for raw sockets
    dd651ab7a114 ieee802154: enforce CAP_NET_RAW for raw sockets
    6f0f18e53269 ax25: enforce CAP_NET_RAW for raw sockets
    6fbf86627608 appletalk: enforce CAP_NET_RAW for raw sockets
    50dddec689cb mISDN: enforce CAP_NET_RAW for raw sockets
    f06b0b3e5d76 net/mlx5: Add device ID of upcoming BlueField-2
    3fdcf6a88ded tcp: better handle TCP_USER_TIMEOUT in SYN_SENT state
    a749eea97ac9 net: sched: fix possible crash in tcf_action_destroy()
    831d0fcba1cf usbnet: sanity checking of packet sizes and device mtu
    b7eeccc1c786 usbnet: ignore endpoints with invalid wMaxPacketSize
    ff4419d725c7 skge: fix checksum byte order
    9a623e1b1d03 sch_netem: fix a divide by zero in tabledist()
    1cd663adcece ppp: Fix memory leak in ppp_write
    99952b08537c openvswitch: change type of UPCALL_PID attribute to NLA_UNSPEC
    587df35cbf65 nfp: flower: fix memory leak in nfp_flower_spawn_vnic_reprs
    195a3ea494d2 net_sched: add max len check for TCA_KIND
    c31096dc586e net/sched: act_sample: don't push mac header on ip6gre ingress
    abb04d0a9dea net: qrtr: Stop rx_worker before freeing node
    6ea3bc412506 net/phy: fix DP83865 10 Mbps HDX loopback disable function
    831d082be72c macsec: drop skb sk before calling gro_cells_receive
    fd0034688358 cdc_ncm: fix divide-by-zero caused by invalid wMaxPacketSize
    0bf79588586c arcnet: provide a buffer big enough to actually receive packets
    555161ee1b7a Linux 4.19.76
    59a5cea41dd0 f2fs: use generic EFSBADCRC/EFSCORRUPTED
    fc3d296491f4 net/rds: Check laddr_check before calling it
    3de749d6d7ce net/rds: An rds_sock is added too early to the hash table
    07f7ec87b5f6 net_sched: check cops->tcf_block in tc_bind_tclass()
    90b0761c1b81 Bluetooth: btrtl: Additional Realtek 8822CE Bluetooth devices
    6934809432d2 netfilter: nft_socket: fix erroneous socket assignment
    649836fe946c xfs: don't crash on null attr fork xfs_bmapi_read
    91ae87240166 drm/nouveau/disp/nv50-: fix center/aspect-corrected scaling
    3717f4a49b34 ACPI: video: Add new hw_changes_brightness quirk, set it on PB Easynote MZ35
    46beb6eacef5 Bluetooth: btrtl: HCI reset on close for Realtek BT chip
    8ffd7ba9ffb1 net: don't warn in inet diag when IPV6 is disabled
    ff0fbfacc94f drm: Flush output polling on shutdown
    303f6d6bbc0c f2fs: fix to do sanity check on segment bitmap of LFS curseg
    dec09554eba9 net/ibmvnic: Fix missing { in __ibmvnic_reset
    dc9118feb472 dm zoned: fix invalid memory access
    73d90f57fcc2 Revert "f2fs: avoid out-of-range memory access"
    40cdc71e1111 blk-mq: move cancel of requeue_work to the front of blk_exit_queue
    313efb253d03 blk-mq: change gfp flags to GFP_NOIO in blk_mq_realloc_hw_ctxs
    75448f40b9f6 initramfs: don't free a non-existent initrd
    ad16dfef4a44 bcache: remove redundant LIST_HEAD(journal) from run_cache_set()
    08fdaee2d97b PCI: hv: Avoid use of hv_pci_dev->pci_slot after freeing it
    ef2baa03b7f0 f2fs: check all the data segments against all node ones
    ef06c33dc371 irqchip/gic-v3-its: Fix LPI release for Multi-MSI devices
    52b4947bac50 bpf: libbpf: retry loading program on EAGAIN
    a935d78e54cc Revert "drm/amd/powerplay: Enable/Disable NBPSTATE on On/OFF of UVD"
    288831cba980 scsi: qla2xxx: Return switch command on a timeout
    2b983f212c68 scsi: qla2xxx: Remove all rports if fabric scan retry fails
    6b449e4cf090 scsi: qla2xxx: Turn off IOCB timeout timer on IOCB completion
    9423770eb336 locking/lockdep: Add debug_locks check in __lock_downgrade()
    0c23335a2d81 power: supply: sysfs: ratelimit property read error message
    1456c40aa906 pinctrl: sprd: Use define directive for sprd_pinconf_params values
    037d73a6458e objtool: Clobber user CFLAGS variable
    952844f31eb7 ALSA: hda - Apply AMD controller workaround for Raven platform
    50c9ccffe041 ALSA: hda - Add laptop imic fixup for ASUS M9V laptop
    866a1a7e9f23 ALSA: dice: fix wrong packet parameter for Alesis iO26
    9829fd27501e ALSA: usb-audio: Add DSD support for EVGA NU Audio
    303921276360 ALSA: usb-audio: Add Hiby device family to quirks for native DSD support
    8a845c02e495 ASoC: fsl: Fix of-node refcount unbalance in fsl_ssi_probe_from_dt()
    a5e2c65034f8 ASoC: Intel: cht_bsw_max98090_ti: Enable codec clock once and keep it enabled
    ec2a3681b30c media: tvp5150: fix switch exit in set control handler
    ba6860700d1f iwlwifi: mvm: always init rs_fw with 20MHz bandwidth rates
    ced0676fc9c2 iwlwifi: mvm: send BCAST management frames to the right station
    b3873e34cbf2 net/mlx5e: Rx, Check ip headers sanity
    404f118f2790 net/mlx5e: Rx, Fixup skb checksum for packets with tail padding
    c95ebb394d65 net/mlx5e: XDP, Avoid checksum complete when XDP prog is loaded
    79e972a89cad net/mlx5e: Allow reporting of checksum unnecessary
    8da68f79b3b3 mlx5: fix get_ip_proto()
    44da02576b5d net/mlx5e: don't set CHECKSUM_COMPLETE on SCTP packets
    6debda97411e net/mlx5e: Set ECN for received packets using CQE indication
    e867ef113004 CIFS: fix deadlock in cached root handling
    f3160a1d71f7 crypto: talitos - fix missing break in switch statement
    c1a7fe486647 mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
    5fdefdcb92bb HID: Add quirk for HP X500 PIXART OEM mouse
    3d072c272b88 HID: hidraw: Fix invalid read in hidraw_ioctl
    acc96be807bb HID: logitech: Fix general protection fault caused by Logitech driver
    3e785174fb35 HID: sony: Fix memory corruption issue on cleanup.
    eb77929769e3 HID: prodikeys: Fix general protection fault during probe
    2661d462aaa9 IB/core: Add an unbound WQ type to the new CQ API
    70ec2eecc550 drm/amd/display: readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines
    80fc27953e74 powerpc/xive: Fix bogus error code returned by OPAL
    4eb92a114834 RDMA/restrack: Protect from reentry to resource return path
    373f9092df95 net/ibmvnic: free reset work of removed device from queue
    2af977b0d1db Revert "Bluetooth: validate BLE connection interval updates"
    d573e8a79f70 Linux 4.19.75
    b841a9f58d9c media: technisat-usb2: break out of loop at end of buffer
    f35f5a990a07 arm64: kpti: Whitelist Cortex-A CPUs that don't implement the CSV3 field
    c0ccb4da26bc binfmt_elf: move brk out of mmap when doing direct loader exec
    c3817ffb1036 floppy: fix usercopy direction
    9c13e770cca9 ovl: fix regression caused by overlapping layers detection
    5e74396d8beb PCI: kirin: Fix section mismatch warning
    0d50f7b1e8c8 iommu/amd: Fix race in increase_address_space()
    52f32e4aec50 iommu/amd: Flush old domains in kdump kernel
    ca77acdf1ac9 keys: Fix missing null pointer check in request_key_auth_describe()
    d73515a17c14 x86/hyper-v: Fix overflow bug in fill_gva_list()
    371357770c8b x86/uaccess: Don't leak the AC flags into __get_user() argument evaluation
    72c762b01eb0 dmaengine: ti: omap-dma: Add cleanup in omap_dma_probe()
    d04b522a65c0 dmaengine: ti: dma-crossbar: Fix a memory leak bug
    6bc421d5a04a net: seeq: Fix the function used to release some memory in an error handling path
    83360eb798ca net: aquantia: fix out of memory condition on rx side
    30c345bd786a tools/power turbostat: fix buffer overrun
    d485c65853de tools/power x86_energy_perf_policy: Fix argument parsing
    254b9b2971a7 tools/power x86_energy_perf_policy: Fix "uninitialized variable" warnings at -O2
    a85a0d9f3796 amd-xgbe: Fix error path in xgbe_mod_init()
    7ec11cad3fde perf/x86/amd/ibs: Fix sample bias for dispatched micro-ops
    560857de3064 perf/x86/intel: Restrict period on Nehalem
    65ad72ce10e7 i2c: designware: Synchronize IRQs when unregistering slave client
    5a45b14b03f7 sky2: Disable MSI on yet another ASUS boards (P6Xxxx)
    6cce2adae3e1 ibmvnic: Do not process reset during or after device removal
    080ca754f5db ARM: 8901/1: add a criteria for pfn_valid of arm
    c6d779fd8197 usb: host: xhci-tegra: Set DMA mask correctly
    b62946852afa cifs: Use kzfree() to zero out the password
    325fa2a6729b cifs: set domainName when a domain-key is used in multiuser
    9a74f799b99c kallsyms: Don't let kallsyms_lookup_size_offset() fail on retrieving the first symbol
    0f7130177325 NFSv2: Fix write regression
    60f0d449601d NFSv2: Fix eof handling
    6075729f76da netfilter: nf_conntrack_ftp: Fix debug output
    7ac5947f7578 netfilter: xt_physdev: Fix spurious error message in physdev_mt_check
    e997c0730520 x86/apic: Fix arch_dynirq_lower_bound() bug for DT enabled machines
    688fdaa54a3e r8152: Set memory to all 0xFFs on failed reg reads
    d9f79f0ace55 bpf: allow narrow loads of some sk_reuseport_md fields with offset > 0
    7d4201ff9f73 batman-adv: Only read OGM2 tvlv_len after buffer len check
    5b8b66274183 ARM: 8874/1: mm: only adjust sections of valid mm structures
    b870f8afc5a5 qed: Add cleanup in qed_slowpath_start()
    30881d79de31 xdp: unpin xdp umem pages in error path
    55ed0ad50201 Kconfig: Fix the reference to the IDT77105 Phy driver in the description of ATM_NICSTAR_USE_IDT77105
    767877deb25a NFS: Fix initialisation of I/O result struct in nfs_pgio_rpcsetup
    4ac4f4716fba NFSv4: Fix return value in nfs_finish_open()
    d7565d51af18 NFSv4: Fix return values for nfs4_file_open()
    4e5fbcb9a615 netfilter: xt_nfacct: Fix alignment mismatch in xt_nfacct_match_info
    a02c676c0f03 netfilter: nft_flow_offload: missing netlink attribute policy
    a4fa6c68ecc3 netfilter: ebtables: Fix argument order to ADD_COUNTER
    634dd5a48627 fpga: altera-ps-spi: Fix getting of optional confd gpio
    0d393f23f18e tools: bpftool: close prog FD before exit on showing a single program
    c5bb033529f1 selftests/bpf: fix "bind{4, 6} deny specific IP & port" on s390
    48d77ca1497f s390/bpf: use 32-bit index for tail calls
    999f33c2438c bus: ti-sysc: Simplify cleanup upon failures in sysc_probe()
    1a85d5819ade ARM: OMAP1: ams-delta-fiq: Fix missing irq_ack
    a8919f8d352f ARM: dts: dra74x: Fix iodelay configuration for mmc3
    2ff2bd2c5526 ARM: OMAP2+: Fix omap4 errata warning on other SoCs
    73d003274a42 s390/bpf: fix lcgr instruction encoding
    c1e0937ef4d5 bus: ti-sysc: Fix using configured sysc mask value
    0aee9e118eee ARM: OMAP2+: Fix missing SYSC_HAS_RESET_STATUS for dra7 epwmss
    f696ba6b122d ARM: dts: am57xx: Disable voltage switching for SD card
    ac8f26f6a035 ieee802154: hwsim: unregister hw while hwsim_subscribe_all_others fails
    c237a050df3b ieee802154: hwsim: Fix error handle path in hwsim_init_module
    6a10e87ffca1 nl80211: Fix possible Spectre-v1 for CQM RSSI thresholds
    941431c491a6 mwifiex: Fix three heap overflow at parsing element in cfg80211_ap_settings
    770cee245191 tty/serial: atmel: reschedule TX after RX was started
    4c2f60ed8ed8 serial: sprd: correct the wrong sequence of arguments
    2871621518ac firmware: google: check if size is valid when decoding VPD data
    232a6462f43f KVM: coalesced_mmio: add bounds checking
    7a1bad565ceb net_sched: let qdisc_put() accept NULL pointer
    47288968eebd xen-netfront: do not assume sk_buff_head list is empty in error handling
    fdd60d80c429 udp: correct reuseport selection with connected sockets
    97b5f8c95b75 ip6_gre: fix a dst leak in ip6erspan_tunnel_xmit
    4fb95f299504 phy: renesas: rcar-gen3-usb2: Disable clearing VBUS in over-current
    abf389e0795a media: tm6000: double free if usb disconnect while streaming
    77d4e2a05885 USB: usbcore: Fix slab-out-of-bounds bug during device reset
    b01b1eb24c04 powerpc/mm/radix: Use the right page size for vmemmap mapping
    289f3c82b116 Input: elan_i2c - remove Lenovo Legion Y7000 PnpID
    305c3b497662 RDMA/restrack: Release task struct which was hold by CM_ID object
    8993c673d6c4 HID: wacom: generic: read HID_DG_CONTACTMAX from any feature report
    2a0aa8a06aea netfilter: nf_flow_table: set default timeout after successful insertion
    dbc29aff8d04 Linux 4.19.74
    9d587fe2cd70 x86/build: Add -Wnoaddress-of-packed-member to REALMODE_CFLAGS, to silence GCC9 build warning
    96c08711fc66 nvmem: Use the same permissions for eeprom as for nvmem
    3622d621e9be rsi: fix a double free bug in rsi_91x_deinit()
    780f3aadee1e platform/x86: pmc_atom: Add CB4063 Beckhoff Automation board to critclk_systems DMI table
    52bfcc9c8406 modules: fix compile error if don't have strict module rwx
    ae415d7a2707 modules: fix BUG when load module with rodata=n
    0ae0c43abcbf iio: adc: stm32-dfsdm: fix data type
    acf77c411b4e Revert "Bluetooth: btusb: driver to enable the usb-wakeup feature"
    a03ed2891cdb drm/mediatek: mtk_drm_drv.c: Add of_node_put() before goto
    d13a836d787d drm: panel-orientation-quirks: Add extra quirk table entry for GPD MicroPC
    4b30a0698208 firmware: ti_sci: Always request response from firmware
    3dfc787f2f50 crypto: talitos - HMAC SNOOP NO AFEU mode requires SW icv checking.
    e89d4cb6fba3 crypto: talitos - Do not modify req->cryptlen on decryption.
    9aff4077304b crypto: talitos - fix ECB algs ivsize
    c4d7148e2d67 crypto: talitos - check data blocksize in ablkcipher.
    02ebbb4f8df8 crypto: talitos - fix CTR alg blocksize
    39fa02a36bb3 crypto: talitos - check AES key size
    e1666bcbae0c driver core: Fix use-after-free and double free on glue directory
    72cd230b3231 ubifs: Correctly use tnc_next() in search_dh_cookie()
    a65290083b66 gpio: fix line flag validation in lineevent_create
    0f4095f33557 PCI: Always allow probing with driver_override
    70facf939ba2 mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue
    6da56f8982bb clk: rockchip: Don't yell about bad mmc phases when getting
    a63416f39aaf drm/meson: Add support for XBGR8888 & ABGR8888 formats
    d9e8b4ba0397 powerpc: Add barrier_nospec to raw_copy_in_user()
    eb020b77b646 x86/purgatory: Change compiler flags from -mcmodel=kernel to -mcmodel=large to fix kexec relocation errors
    73c31bd92039 KVM: nVMX: handle page fault in vmread
    6e60900cfa3e KVM: x86: work around leak of uninitialized stack contents
    09a9f894c65b KVM: s390: Do not leak kernel stack data in the KVM_S390_INTERRUPT ioctl
    9f8a2825918c KVM: s390: kvm_s390_vm_start_migration: check dirty_bitmap before using it as target for memset()
    991b3458da56 genirq: Prevent NULL pointer dereference in resend_irqs()
    5b5f14601e0a ixgbe: Prevent u8 wrapping of ITR value to something less than 10us
    7cbd49cf0d62 Btrfs: fix assertion failure during fsync and use of stale transaction
    22ed1d472811 gpio: fix line flag validation in linehandle_create
    705df757e937 gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist
    0f4ceb259493 tun: fix use-after-free when register netdev failed
    9a4598424e99 tipc: add NULL pointer check before calling kfree_rcu
    67fe3b94a833 tcp: fix tcp_ecn_withdraw_cwr() to clear TCP_ECN_QUEUE_CWR
    7c34a29261ee sctp: use transport pf_retrans in sctp_do_8_2_transport_strike
    41b624ff83d2 sctp: Fix the link time qualifier of 'sctp_ctrlsock_exit()'
    a9e91767b921 sch_hhf: ensure quantum and hhf_non_hh_weight are non-zero
    a7f46e18ecfe net: sched: fix reordering issues
    3600a311f83d net: phylink: Fix flow control resolution
    821302dd0c51 net: gso: Fix skb_segment splat when splitting gso_size mangled skb having linear-headed frag_list
    88a46756f016 net: Fix null de-reference of device refcount
    b26f489245b3 ixgbe: Fix secpath usage for IPsec TX offload.
    2354e925e361 isdn/capi: check message length in capi_write()
    ea6ec671c87e ipv6: Fix the link time qualifier of 'ping_v6_proc_exit_net()'
    a20c8e4ae48d cdc_ether: fix rndis support for Mediatek based smartphones
    f57fd58dda42 bridge/mdb: remove wrong use of NLM_F_MULTI
    db2d0b7c1dde Linux 4.19.73
    ba03ee62aed0 vhost: make sure log_num < in_num
    569775bd5364 powerpc/tm: Fix restoring FP/VMX facility incorrectly on interrupts
    052bc385f970 powerpc/tm: Remove msr_tm_active()
    f193e02265aa PCI: Reset both NVIDIA GPU and HDA in ThinkPad P50 workaround
    ff69322509bb ext4: unsigned int compared against zero
    292666d2d868 ext4: fix block validity checks for journal inodes using indirect blocks
    97fbf573460e ext4: don't perform block validity checks on the journal inode
    1e88a1f874ca drm/atomic_helper: Allow DPMS On<->Off changes for unregistered connectors
    b1dd1d06b31d virtio/s390: fix race on airq_areas[]
    057cdb6f0f47 drm/i915: Make sure cdclk is high enough for DP audio on VLV/CHV
    b113f98432ae bcache: fix race in btree_flush_write()
    f73c35d92976 bcache: add comments for mutex_lock(&b->write_lock)
    7989a5026fd1 bcache: only clear BTREE_NODE_dirty bit when it is set
    652993a5aae5 NFSv4: Fix delegation state recovery
    5026932adb1a iio: adc: gyroadc: fix uninitialized return code
    2e7e7c8f9423 mm/migrate.c: initialize pud_entry in migrate_vma()
    b8ad18a10f70 i2c: at91: fix clk_offset for sama5d2
    4c9170b55f3a i2c: at91: disable TXRDY interrupt after sending data
    c9c90711ee88 gpio: don't WARN() on NULL descs if gpiolib is disabled
    a532a120a5cd iommu/iova: Remove stale cached32_node
    c4fc7cb93e0a powerpc/mm: Limit rma_size to 1TB when running without HV mode
    5b9a6ba975c0 ALSA: hda - Fix intermittent CORB/RIRB stall on Intel chips
    87c3692172da drm/panel: Add support for Armadeus ST0700 Adapt
    ecf99cdea02d dm thin metadata: check if in fail_io mode when setting needs_check
    5e9a2ce6d3b4 pstore: Fix double-free in pstore_mkfile() failure path
    192b9af8caf0 resource: fix locking in find_next_iomem_res()
    485bcc29a200 resource: Fix find_next_iomem_res() iteration issue
    9a80dfccade1 resource: Include resource end in walk_*() interfaces
    1c13c9c40e31 btrfs: correctly validate compression type
    0ca2688bd7cd RDMA/srp: Accept again source addresses that do not have a port number
    9541604735b2 RDMA/srp: Document srp_parse_in() arguments
    bab0ff2d87db ARM: dts: gemini: Set DIR-685 SPI CS as active low
    3a1b79ade460 KVM: PPC: Book3S HV: Fix CR0 setting in TM emulation
    3ac718069f7c KVM: PPC: Use ccr field in pt_regs struct embedded in vcpu struct
    beeeead95b2f KVM: VMX: check CPUID before allowing read/write of IA32_XSS
    891011ca564d KVM: VMX: Fix handling of #MC that occurs during VM-Entry
    74ce13331db9 KVM: VMX: Always signal #GP on WRMSR to MSR_IA32_CR_PAT with bad value
    74fd8aae19d9 KVM: x86: optimize check for valid PAT value
    812810399999 ceph: use ceph_evict_inode to cleanup inode's resource
    42fa0e35d6e0 ALSA: hda - Don't resume forcibly i915 HDMI/DP codec
    987564c28e8a cifs: Properly handle auto disabling of serverino option
    d85e830d8534 scsi: zfcp: fix request object use-after-free in send path causing wrong traces
    ba8701d2226c staging: wilc1000: fix error path cleanup in wilc_wlan_initialize()
    60b856dc1744 scsi: target/iblock: Fix overrun in WRITE SAME emulation
    ba52842de1ad scsi: target/core: Use the SECTOR_SHIFT constant
    17111037fdf0 apparmor: reset pos on failure to unpack for various functions
    90ca4912e55d IB/hfi1: Avoid hardlockup with flushlist_lock
    fa717fc442ff clk: tegra210: Fix default rates for HDA clocks
    350503c8982b clk: tegra: Fix maximum audio sync clock for Tegra124/210
    acc07941e224 cifs: add spinlock for the openFileList to cifsInodeInfo
    1d0648767ccf Btrfs: fix race between block group removal and block group allocation
    f276beb324cc drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
    7abeffff7bc3 drm/amdgpu: fix ring test failure issue during s3 in vce 3.0 (V2)
    d5f6539381c7 kvm: Check irqchip mode before assign irqfd
    90772cf58838 drm/amdkfd: Add missing Polaris10 ID
    cacbc85376b6 ARC: mm: SIGSEGV userspace trying to access kernel virtual memory
    7edfa9c99d21 ARC: mm: fix uninitialised signal code in do_page_fault
    0828438e523e signal/arc: Use force_sig_fault where appropriate
    fcb2f1e2ea68 dm crypt: move detailed message into debug level
    96b44c20e6f0 cifs: smbd: take an array of reqeusts when sending upper layer data
    3f27a14b03d8 PCI: dwc: Use devm_pci_alloc_host_bridge() to simplify code
    842da8fac182 mmc: sdhci-pci: Add support for Intel CML
    e238e6dc222b blk-mq: free hw queue's resource in hctx's release handler
    69409854ba08 dm mpath: fix missing call of path selector type->end_io
    0fe097012b6c PCI: Reset Lenovo ThinkPad P50 nvgpu at boot if necessary
    5659dfca74d0 PCI: Add macro for Switchtec quirk declarations
    e4ba157877db dt-bindings: mmc: Add disable-cqe-dcmd property.
    eb83f9fa10f7 dt-bindings: mmc: Add supports-cqe property
    0a0176f93ea9 ARM: dts: qcom: ipq4019: enlarge PCIe BAR range
    445a78ea3f90 ARM: dts: qcom: ipq4019: Fix MSI IRQ type
    df1216d8bc86 ARM: dts: qcom: ipq4019: fix PCI range
    2fd4629de519 ext4: protect journal inode's blocks using block_validity
    f10a92309b83 media: i2c: tda1997x: select V4L2_FWNODE
    4061e662c8e9 cifs: Fix lease buffer length error
    df5d4ea2d8be KVM: x86: Always use 32-bit SMRAM save state for 32-bit kernels
    7a74d806bdaa x86/kvm: move kvm_load/put_guest_xcr0 into atomic context
    163b24b1a68c kvm: mmu: Fix overflow on kvm mmu page limit calculation
    feced628c068 IB/mlx5: Reset access mask when looping inside page fault handler
    37222eaf7eb7 arm64: dts: stratix10: add the sysmgr-syscon property from the gmac's
    3cfce8b77aad usb: typec: tcpm: Try PD-2.0 if sink does not respond to 3.0 source-caps
    fba4f7c118e4 drm/i915: Sanity check mmap length against object size
    6423a2ad5709 drm/i915: Handle vm_mmap error during I915_GEM_MMAP ioctl with WC set
    778d626c6af3 CIFS: Fix leaking locked VFS cache pages in writeback retry
    fb2dabeabb17 CIFS: Fix error paths in writeback code
    e407b58c3576 drm: add __user attribute to ptr_to_compat()
    e1a12c3b6f87 PCI: qcom: Don't deassert reset GPIO during probe
    be905d0f2330 PCI: qcom: Fix error handling in runtime PM support
    476ecc14cfdb btrfs: init csum_list before possible free
    936690bdd8e6 btrfs: scrub: fix circular locking dependency warning
    ff55333f5c52 btrfs: scrub: move scrub_setup_ctx allocation out of device_list_mutex
    8ba3169dceac btrfs: scrub: pass fs_info to scrub_setup_ctx
    df7329207870 mmc: renesas_sdhi: Fix card initialization failure in high speed mode
    915c9d0a1d68 powerpc/kvm: Save and restore host AMR/IAMR/UAMOR
    b3f864b88256 spi: spi-gpio: fix SPI_CS_HIGH capability
    1d60902a5448 x86/kvmclock: set offset for kvm unstable clock
    716b0cfa88a5 iwlwifi: add new card for 9260 series
    213566a9b0de iwlwifi: fix devices with PCI Device ID 0x34F0 and 11ac RF modules
    2b76fcb6ba62 drm/nouveau: Don't WARN_ON VCPI allocation failures
    173b6557fcbc mt76: fix corrupted software generated tx CCMP PN
    0d7f329e2431 iio: adc: exynos-adc: Use proper number of channels for Exynos4x12
    4e516b721a50 dt-bindings: iio: adc: exynos-adc: Add S5PV210 variant
    7f588a7262b3 iio: adc: exynos-adc: Add S5PV210 variant
    cd490d44150d KVM: VMX: Compare only a single byte for VMCS' "launched" in vCPU-run
    687e470e9123 bcache: treat stale && dirty keys as bad keys
    d1cec665de2c bcache: replace hard coded number with BUCKET_GC_GEN_MAX
    ee30121fbd78 tpm: Fix some name collisions with drivers/char/tpm.h
    c207ac66848e mfd: Kconfig: Fix I2C_DESIGNWARE_PLATFORM dependencies
    6fd5e50add36 drm/i915/ilk: Fix warning when reading emon_status with no output
    2b4f567912ad drm/vblank: Allow dynamic per-crtc max_vblank_count
    71f719105462 crypto: ccree - add missing inline qualifier
    72eec6b303f4 crypto: ccree - fix resume race condition on init
    f0e286550af8 IB/uverbs: Fix OOPs upon device disassociation
    8c6fb55abf2c ARC: mm: do_page_fault fixes #1: relinquish mmap_sem if signal arrives while handle_mm_fault
    96af7d92d8d2 ARC: show_regs: lockdep: re-enable preemption
    424b75b79994 media: vim2m: only cancel work if it is for right context
    be77686f0369 btrfs: Use real device structure to verify dev extent
    a2790b9939ae btrfs: volumes: Make sure no dev extent is beyond device boundary
    cfbf227e0591 powerpc/pkeys: Fix handling of pkey state across fork()
    2ad95be18995 scsi: megaraid_sas: Use 63-bit DMA addressing
    3263f78640cc scsi: megaraid_sas: Add check for reset adapter bit
    dc4e3ec9d226 scsi: megaraid_sas: Fix combined reply queue mode detection
    eb124aaa2e85 btrfs: Fix error handling in btrfs_cleanup_ordered_extents
    1669d1d2e696 btrfs: Remove extent_io_ops::fill_delalloc
    338a528b7922 Btrfs: fix deadlock with memory reclaim during scrub
    fac803479f60 Btrfs: clean up scrub is_dev_replace parameter
    d3984e80d7f2 KVM: PPC: Book3S HV: Fix race between kvm_unmap_hva_range and MMU mode switch
    d88b01d04c6a drm/i915: Cleanup gt powerstate from gem
    b185bde520d5 drm/i915: Restore sane defaults for KMS on GEM error load
    f999485109d1 media: vim2m: use cancel_delayed_work_sync instead of flush_schedule_work
    a7b6f95f3ca6 media: vim2m: use workqueue
    e432a58d7a0d s390/zcrypt: reinit ap queue state machine during device probe
    a4f404af3ca8 ARM: davinci: dm644x: define gpio interrupts as separate resources
    8d6b2b24ca85 ARM: davinci: dm355: define gpio interrupts as separate resources
    d31f2b61e7f9 ARM: davinci: dm646x: define gpio interrupts as separate resources
    4883e9e66f76 ARM: davinci: dm365: define gpio interrupts as separate resources
    0a6c3bdae2c9 ARM: davinci: da8xx: define gpio interrupts as separate resources
    016218ef6bb0 drm/amd/dm: Understand why attaching path/tile properties are needed
    853dc0759586 drm/amd/pp: Fix truncated clock value when set watermark
    5faabd22ed64 powerplay: Respect units on max dcfclk watermark
    11bedb2e77a0 Drivers: hv: kvp: Fix the recent regression caused by incorrect clean-up
    74ff258346e4 Drivers: hv: kvp: Fix the indentation of some "break" statements
    e352d8eb9394 drm/atomic_helper: Disallow new modesets on unregistered connectors
    cff9e1e33151 drm/i915/gen9+: Fix initial readout for Y tiled framebuffers
    8ccbb1d24c26 drm/i915: Rename PLANE_CTL_DECOMPRESSION_ENABLE
    4b2dfc0e2d44 drm/i915: Fix intel_dp_mst_best_encoder()
    796469e361ed x86/kvm/lapic: preserve gfn_to_hva_cache len on cache reinit
    cdad0f65050e KVM: hyperv: define VP assist page helpers
    b0d9043bdbe6 KVM: x86: hyperv: keep track of mismatched VP indexes
    f031fd03e22e KVM: x86: hyperv: consistently use 'hv_vcpu' for 'struct kvm_vcpu_hv' variables
    0b535f7b95af KVM: x86: hyperv: enforce vp_index < KVM_MAX_VCPUS
    8e91cc7f7f91 drm/amdgpu: Update gc_9_0 golden settings.
    bcc3bd761ab5 drm/amdgpu/gfx9: Update gfx9 golden settings.
    2c2cf2245ff6 remoteproc: qcom: q6v5-mss: add SCM probe dependency
    4d9707586ec7 x86, hibernate: Fix nosave_regions setup for hibernation
    805e0e46eb54 Drivers: hv: kvp: Fix two "this statement may fall through" warnings
    3f3beae22842 keys: Fix the use of the C++ keyword "private" in uapi/linux/keyctl.h
    bac1c4edb5c4 scsi: qla2xxx: Move log messages before issuing command to firmware
    6e087eae89df media: cec: remove cec-edid.c
    851308450a8f media: cec/v4l2: move V4L2 specific CEC functions to V4L2
    c09d675f294b drm/i915: Re-apply "Perform link quality check, unconditionally during long pulse"
    3015291b2fb5 kernel/module: Fix mem leak in module_add_modinfo_attrs
    9c49f7811f82 modules: always page-align module section allocations
    84ba9ae18fbb remoteproc: qcom: q6v5: shore up resource probe handling
    56944c0b9774 clk: s2mps11: Add used attribute to s2mps11_dt_match
    480101a4aea2 nvme-fc: use separate work queue to avoid warning
    5f147150b753 riscv: remove unused variable in ftrace
    8d23872c7539 scripts/decode_stacktrace: match basepath using shell prefix operator, not regex
    6c550a5db18f arm64: dts: rockchip: enable usb-host regulators at boot on rk3328-rock64
    573370113b24 media: stm32-dcmi: fix irq = 0 case
    7f8b23600779 powerpc/64: mark start_here_multiplatform as __ref
    85a24825b2e6 x86/ftrace: Fix warning and considate ftrace_jmp_replace() and ftrace_call_replace()
    b93aed78eb78 selftests: fib_rule_tests: use pre-defined DEV_ADDR
    68829256e1f9 timekeeping: Use proper ktime_add when adding nsecs in coarse offset
    1aa38eceb6c0 {nl,mac}80211: fix interface combinations on crypto controlled devices
    178d1337a527 blk-iolatency: fix STS_AGAIN handling
    5f33e81250a6 Blk-iolatency: warn on negative inflight IO counter
    91a71a61da8c hv_sock: Fix hang when a connection is closed
    86d5ae21d6b8 batman-adv: Only read OGM tvlv_len after buffer len check
    4b5fee457723 batman-adv: fix uninit-value in batadv_netlink_get_ifindex()
    47a0f70d7d9a powerpc/tm: Fix FP/VMX unavailable exceptions inside a transaction
    6e7040d65a71 vhost/test: fix build for vhost test - again
    4f45483faadf vhost/test: fix build for vhost test
    dcd22e14780a drm/vmwgfx: Fix double free in vmw_recv_msg()
    38d38d1e0cc5 sched/fair: Don't assign runtime for throttled cfs_rq
    044ab4715585 ALSA: hda/realtek - Fix the problem of two front mics on a ThinkCentre
    849f85bfdf12 ALSA: hda/realtek - Enable internal speaker & headset mic of ASUS UX431FL
    a956998ac1c2 ALSA: hda/realtek - Add quirk for HP Pavilion 15
    d11ca2d79334 ALSA: hda/realtek - Fix overridden device-specific initialization
    2c4d2ce8b799 ALSA: hda - Fix potential endless loop at applying quirks

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 611c7d62d67016942323d2fa4f108774c85dce09)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index c55ef50a5d..8e36d9aa48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "02f0c38dd20819c0e9d279e3b1e95280101ea8ab"
-SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
+SRCREV_machine ?= "0e4a79e608e92830693e511a3dd282ce7c3b3f41"
+SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.72"
+LINUX_VERSION ?= "4.19.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index f4f411de19..2af79874e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.72"
+LINUX_VERSION ?= "4.19.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "283b870cef5f79a6f07465828a51f27a6aed4c50"
-SRCREV_machine ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
+SRCREV_machine_qemuarm ?= "be50001808f00efee538c2a3e7c0a5a2a2df65da"
+SRCREV_machine ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index fb505862ee..73f1715b13 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b0be447bc9053d07f3438999778bd077679ae756"
-SRCREV_machine_qemuarm64 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_machine_qemumips ?= "3c8b21d0a335b5f418682969448574dfd0011f02"
-SRCREV_machine_qemuppc ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_machine_qemux86 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_machine_qemux86-64 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_machine_qemumips64 ?= "2854797711fee4061fb760c2b6e0e3d3135195ab"
-SRCREV_machine ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
-SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
+SRCREV_machine_qemuarm ?= "7fde51abcaf389193ce5d87ebfb8e8fb66a9271a"
+SRCREV_machine_qemuarm64 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_machine_qemumips ?= "8ac68d42beb24b275ac0d2a54a0a2291970e5dde"
+SRCREV_machine_qemuppc ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_machine_qemux86 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_machine_qemux86-64 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_machine_qemumips64 ?= "ea2cb8731306f734bf0227575e04cafac7dfade0"
+SRCREV_machine ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
+SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.72"
+LINUX_VERSION ?= "4.19.78"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


