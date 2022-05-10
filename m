Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1E8C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.10877.1652193547837040723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w5WJoRFK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id o69so16038467pjo.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BlHsGb4043l2Dhh9KhaFKIBM5iEGllbkcTeuBMm7GT4=;
        b=w5WJoRFKyGLqE+wY2LeWlqcSga/ekiCdbaS+t2pHm7xV+850YXHXE7MhvNaKdl5Jsf
         twY7U+S/5us3pV1f9zluJgtHxk+WG4ExsJuDpHlRXmPDKnxcLNsA4vr2Ga6xU78y9QsQ
         b33AVyukBrHUP6h2j7FWISOsQ2SKsu1ElKYClGJf0eI27DjCrab+tmWVZG1iCtsYckzf
         K+HJmUV5moPI+oL9mdLL84StBSCJ4zPo4fAmWd4wvcQt+u1ETPSjKwQBiaIhJqW2dNas
         YllcjRmpFOOH9SNkTDLsiZhNpGlODBpkyNSe68wRfcLRhW6KSYJ8cuyft9vm3qTQmm+x
         kJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BlHsGb4043l2Dhh9KhaFKIBM5iEGllbkcTeuBMm7GT4=;
        b=KdcOFgdBkbDkJyRbL8+B/D7NIvhk2RXnH5MIzNzw4ymvdwtckRSdjguyvnDX6rOtjl
         Bmu4lC1J/Lx9zVDEK6Xw4JBnej0DCL0QK2yhae/u7lUbxtOed0ti2/LHYg+vvLkhb9Yp
         c+e/KTZIPzn4eqJcTWtrF1ZdPGK/5+2j1CYOBrdYp0/4QkobuFF3Z3B0zZtX7XkyqWhS
         11SlyhfSYeHVukhbYqXQSmsVie76hZ0RuAY6Uv1KiEFG1EWHrxBU8KBVKSbJXQJAW1HV
         oSodCYOG162xvTRymJS12SsreLitXNtQMraJQS/mFgsNpy4Noydqk4TFtKE1zkmszcz3
         mVfQ==
X-Gm-Message-State: AOAM5311G3SlA/LEp2Qy1p34j55PtfdbbQgMzaY/N6APM4wV3bS5quPl
	B08fvTiTCqbHG40n1VkVxLnZiT1E4v0jAC3w
X-Google-Smtp-Source: 
 ABdhPJw5f0QNt2mAakt5ZIs/+hlK1uloxZqnlCoe3v2knB4XcxGqFlZAMxmK2qoD/DAjks1SGmduxw==
X-Received: by 2002:a17:90a:b703:b0:1dd:1e2f:97d7 with SMTP id
 l3-20020a17090ab70300b001dd1e2f97d7mr340861pjr.62.1652193545365;
        Tue, 10 May 2022 07:39:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/40] linux-yocto/5.15: update to v5.15.33
Date: Tue, 10 May 2022 04:36:54 -1000
Message-Id: 
 <79790e0aa5cc637fa4572e2894989c0000ec8ef7.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165432

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    06f50ca83ace Linux 5.15.33
    541b7456fc4d PCI: xgene: Revert "PCI: xgene: Use inbound resources for setup"
    39fd0cc079c9 coredump: Use the vma snapshot in fill_files_note
    cabd69640957 coredump/elf: Pass coredump_params into fill_note_info
    7ba958df6449 coredump: Remove the WARN_ON in dump_vma_snapshot
    f6ca862806df coredump: Snapshot the vmas in do_coredump
    57c04fac8023 iommu/dma: Account for min_align_mask w/swiotlb
    3e44e136560c swiotlb: Support aligned swiotlb buffers
    52d23f5f0915 iommu/dma: Check CONFIG_SWIOTLB more broadly
    bc05d84824c0 iommu/dma: Fold _swiotlb helpers into callers
    c3841d020b82 iommu/dma: Skip extra sync during unmap w/swiotlb
    8771d9673e0b KVM: x86/mmu: do compare-and-exchange of gPTE via the user address
    b0e8e828acb5 mmc: rtsx: Fix build errors/warnings for unused variable
    8af04b6aa02b mmc: rtsx: Let MMC core handle runtime PM
    a9bbdeef768f n64cart: convert bi_disk to bi_bdev->bd_disk fix build
    2a710a5c59e9 torture: Make torture.sh help message match reality
    acabfc943245 openvswitch: Fixed nd target mask field in the flow dump.
    3fc38521fc30 docs: sysctl/kernel: add missing bit to panic_print
    166abd13eab0 um: Fix uml_mconsole stop/go
    94a53804ec3a arm64: dts: ls1046a: Update i2c node dma properties
    32820c358d1b arm64: dts: ls1043a: Update i2c dma properties
    28a020859c00 ARM: dts: spear13xx: Update SPI dma properties
    7aa9bba18f80 ARM: dts: spear1340: Update serial node properties
    dd8772224c19 spi: mediatek: support tick_delay without enhance_timing
    2a6e0695ddd5 media: ov6650: Fix crop rectangle affected by set format
    3995d4cf529c media: ov6650: Add try support to selection API operations
    8f5e6110e108 perf vendor events: Update metrics for SkyLake Server
    b0e5c18317f7 ASoC: topology: Allow TLV control to be either read or write
    678b6901d00b ASoC: SOF: Intel: Fix build error without SND_SOC_SOF_PCI_DEV
    ba8260872dd5 ubi: fastmap: Return error code if memory allocation fails in add_aeb()
    666176d0f9bb dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix example
    e918b36600d6 dt-bindings: memory: mtk-smi: No need mediatek,larb-id for mt8167
    b2b85196a31a dt-bindings: spi: mxic: The interrupt property is not mandatory
    c19a9d307844 dt-bindings: mtd: nand-controller: Fix a comment in the examples
    716a77f8460d dt-bindings: mtd: nand-controller: Fix the reg property description
    8ec990990be3 mmc: rtsx: Use pm_runtime_{get,put}() to handle runtime PM
    50c906a6977f bpf: Fix comment for helper bpf_current_task_under_cgroup()
    398ac11f4425 bpf: Adjust BPF stack helper functions to accommodate skip > 0
    21b6b8d43d87 af_unix: Support POLLPRI for OOB.
    260daa256d30 mm/usercopy: return 1 from hardened_usercopy __setup() handler
    c9acbcd636ab mm/memcontrol: return 1 from cgroup.memory __setup() handler
    48ddbd8b4e42 ARM: 9187/1: JIVE: fix return value of __setup handler
    6795b20d4b2c mm/mmap: return 1 from stack_guard_gap __setup() handler
    23629b673b78 net: preserve skb_end_offset() in skb_unclone_keeptruesize()
    51e458fc0ca6 net: add skb_set_end_offset() helper
    14d552ab31ed tracing: Have type enum modifications copy the strings
    7007c894631c Reinstate some of "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""
    63351e2e1362 ASoC: soc-compress: Change the check for codec_dai
    7ed3cce2fe68 arm64: mm: Drop 'const' from conditional arm64_dma_phys_limit definition
    5ab0f5e238b9 staging: mt7621-dts: fix pinctrl-0 items to be size-1 items on ethernet
    0e39097efcb5 scsi: qla2xxx: Add qla2x00_async_done() for async routines
    b9cf1208af36 drm/connector: Fix typo in documentation
    5b422da35c15 proc: bootconfig: Add null pointer check
    f78f56488cd3 can: isotp: restore accidentally removed MSG_PEEK feature
    3fc81968625a platform/chrome: cros_ec_typec: Check for EC device
    8c1c3c00dceb spi: Fix Tegra QSPI example
    7480cc0240eb vhost: handle error while adding split ranges to iotlb
    97b5593fd1b1 ACPI: CPPC: Avoid out of bounds access when parsing _CPC data
    dae252901378 riscv module: remove (NOLOAD)
    0853bd6885c2 io_uring: fix memory leak of uid in files registration
    5b9ac3727e4a block: Fix the maximum minor value is blk_alloc_ext_minor()
    21cfddd5e0f6 ARM: iop32x: offset IRQ numbers by 1
    1a3f1cf87054 ubi: Fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
    619709f0c608 ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
    d509d41d89c5 pinctrl: nuvoton: npcm7xx: Use %zu printk format for ARRAY_SIZE()
    3e51c3023228 pinctrl: nuvoton: npcm7xx: Rename DS() macro to DSTR()
    b603cbe08b0b net: sparx5: uses, depends on BRIDGE or !BRIDGE
    84817c83c0e7 watchdog: rti-wdt: Add missing pm_runtime_disable() in probe function
    d02ca80ec735 pinctrl: pinconf-generic: Print arguments for bias-pull-*
    4913daecd04a watch_queue: Free the page array when watch_queue is dismantled
    210891d81b9c crypto: arm/aes-neonbs-cbc - Select generic cbc and aes
    c78d23ea7506 mailbox: imx: fix wakeup failure from freeze mode
    8cbf4ae7a283 rxrpc: Fix call timer start racing with call destruction
    432297011caf rxrpc: fix some null-ptr-deref bugs in server_key.c
    88570bda6e48 net: hns3: fix software vlan talbe of vlan 0 inconsistent with hardware
    a0817ad3f283 net: hns3: fix the concurrency between functions reading debugfs
    5c3c9bce1c99 gfs2: Make sure FITRIM minlen is rounded up to fs block size
    1d8195349742 gfs2: gfs2_setattr_size error path fix
    50ed32e67c5c rtc: check if __rtc_read_time was successful
    9f20ce95db3d modpost: restore the warning message for missing symbol versions
    7aae60df6782 XArray: Update the LRU list in xas_split()
    be8ebbabac94 can: mcp251xfd: mcp251xfd_register_get_dev_id(): fix return of error value
    fa9c1f14002d can: mcba_usb: properly check endpoint type
    37f07ad24866 can: mcba_usb: mcba_usb_start_xmit(): fix double dev_kfree_skb in error path
    7521a97b1929 XArray: Fix xas_create_range() when multi-order entry present
    9af42a4f6d81 wireguard: socket: ignore v6 endpoints when ipv6 is disabled
    402991a97715 wireguard: socket: free skb in send6 when ipv6 is disabled
    6a7245252fdc wireguard: queueing: use CFI-safe ptr_ring cleanup function
    c98f792a1468 nvme: fix the read-only state for zoned namespaces with unsupposed features
    7d18d6c71372 nvme: allow duplicate NSIDs for private namespaces
    578bf41d9443 ubifs: rename_whiteout: correct old_dir size computing
    4f75bab98565 ubifs: Fix to add refcount once page is set private
    a7054aaf1909 ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
    56cf8b26b18e ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
    489c3a2577b3 ubifs: Rectify space amount budget for mkdir/tmpfile operations
    a9662bec5a4d ubifs: Fix 'ui->dirty' race between do_tmpfile() and writeback work
    c67bc98d1f08 ubifs: Rename whiteout atomically
    ff846f2c5d1d ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
    c58af8564a7b ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
    2ad07009c459 ubifs: rename_whiteout: Fix double free for whiteout_ui->data
    3fa2d7479605 KVM: SVM: fix panic on out-of-bounds guest IRQ
    63961ac1359e KVM: x86: fix sending PV IPI
    43637ee17092 KVM: Prevent module exit until all VMs are freed
    ba6e8c2df520 KVM: x86: Forbid VMM to set SYNIC/STIMER MSRs when SynIC wasn't activated
    0e5dbc0540ba KVM: x86: Avoid theoretical NULL pointer dereference in kvm_irq_delivery_to_apic_fast()
    569a229142e9 KVM: x86: Check lapic_in_kernel() before attempting to set a SynIC irq
    81e5b16de862 platform: chrome: Split trace include file
    89dad346c241 scsi: qla2xxx: Use correct feature type field during RFF_ID processing
    f63fde0d16a4 scsi: qla2xxx: Reduce false trigger to login
    20909563bd50 scsi: qla2xxx: Fix stuck session of PRLI reject
    2b612191f9d3 scsi: qla2xxx: Fix N2N inconsistent PLOGI
    c9d6081a5f18 scsi: qla2xxx: Fix missed DMA unmap for NVMe ls requests
    d6f691a133f0 scsi: qla2xxx: Fix hang due to session stuck
    7ccd6063874d scsi: qla2xxx: Fix incorrect reporting of task management failure
    c0300beb313f scsi: qla2xxx: Fix disk failure to rediscover
    9c33d49ab9f3 scsi: qla2xxx: Suppress a kernel complaint in qla_create_qpair()
    d1b7d23cd462 scsi: qla2xxx: Check for firmware dump already collected
    812afc2b8ec0 scsi: qla2xxx: Add devids and conditionals for 28xx
    d70d86f7a6ea scsi: qla2xxx: Fix T10 PI tag escape and IP guard options for 28XX adapters
    2df59f3bb240 scsi: qla2xxx: edif: Fix clang warning
    fbc1aa41269a scsi: qla2xxx: Fix device reconnect in loop topology
    b6c95db6d2e8 scsi: qla2xxx: Fix warning for missing error code
    67b1be130861 scsi: qla2xxx: Fix wrong FDMI data for 64G adapter
    5ef6319f9882 scsi: qla2xxx: Fix premature hw access after PCI error
    826a9d4a00d1 scsi: qla2xxx: Fix scheduling while atomic
    7a3457777c4f scsi: qla2xxx: Fix warning message due to adisc being flushed
    5fb0a488028e scsi: qla2xxx: Fix stuck session in gpdb
    e17111dd2fda scsi: qla2xxx: Implement ref count for SRB
    24e86eae3f7b scsi: qla2xxx: Refactor asynchronous command initialization
    f5a0cf225f8d drm/i915: Reject unsupported TMDS rates on ICL+
    beeebae6ea82 drm/i915: Fix PSF GV point mask when SAGV is not possible
    102cba6d5ae2 drm/i915: Treat SAGV block time 0 as SAGV disabled
    e912d697400c drm/dp: Fix off-by-one in register cache size
    2d67222b2380 powerpc: Fix build errors with newer binutils
    f4b0b5a0f3c1 powerpc: Add set_memory_{p/np}() and remove set_memory_attr()
    a29341e48601 powerpc/lib/sstep: Fix build errors with newer binutils
    d25efd904271 powerpc/lib/sstep: Fix 'sthcx' instruction
    5a3d8f3192a4 powerpc/kasan: Fix early region not updated correctly
    cb188e07105f KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
    5c3d0dbe200f KVM: x86: hyper-v: Fix the maximum number of sparse banks for XMM fast TLB flush hypercalls
    72eae60bfe83 KVM: x86: hyper-v: Drop redundant 'ex' parameter from kvm_hv_flush_tlb()
    dbec906dbef6 KVM: x86: hyper-v: Drop redundant 'ex' parameter from kvm_hv_send_ipi()
    f4fd34eaa767 KVM: x86/mmu: Check for present SPTE when clearing dirty bit in TDP MMU
    af47248407c0 KVM: x86/mmu: Zap _all_ roots when unmapping gfn range in TDP MMU
    31a70b170e06 KVM: x86/mmu: Move "invalid" check out of kvm_tdp_mmu_get_root()
    48306afcac2a KVM: x86: Reinitialize context if host userspace toggles EFER.LME
    273ad0cf5684 ALSA: hda/realtek: Add alc256-samsung-headphone fixup
    fe440221ca0f media: atomisp: fix bad usage at error handling logic
    251a11699fe5 mmc: host: Return an error when ->enable_sdio_irq() ops is missing
    7c6bd60999f3 tracing: Have TRACE_DEFINE_ENUM affect trace event types as well
    ae2b93b0a6a7 ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"
    f90db7cca4d4 media: hdpvr: initialize dev->worker at hdpvr_register_videodev
    deb1f0453198 media: Revert "media: em28xx: add missing em28xx_close_extension"
    96a7522c72c4 media: i2c: ov5648: Fix lockdep error
    eae90015d10f video: fbdev: sm712fb: Fix crash in smtcfb_write()
    a07c7b64eadf ASoC: amd: vg: fix for pm resume callback sequence
    4ab0293c961b ARM: mmp: Fix failure to remove sram device
    f8ef3b979bfa ARM: tegra: tamonten: Fix I2C3 pad setting
    6a1c70de40b5 lib/test_lockup: fix kernel pointer check for separate address spaces
    8b2a6074b981 uaccess: fix type mismatch warnings from access_ok()
    cb5bd93ad218 media: cx88-mpeg: clear interrupt status register before streaming video
    02f9f97d54ff media: imx-jpeg: fix a bug of accessing array out of bounds
    0b620fce5eae ASoC: soc-core: skip zero num_dai component in searching dai name
    80e6bbe4e193 ARM: dts: bcm2711: Add the missing L1/L2 cache information
    2d5c47df8e21 video: fbdev: udlfb: replace snprintf in show functions with sysfs_emit
    e7f5b1c56921 video: fbdev: omapfb: panel-tpo-td043mtea1: Use sysfs_emit() instead of snprintf()
    509bc99aba95 video: fbdev: omapfb: panel-dsi-cm: Use sysfs_emit() instead of snprintf()
    79045b61875d arm64: defconfig: build imx-sdma as a module
    c7129c401f55 ARM: dts: imx7: Use audio_mclk_post_div instead audio_mclk_root_clk
    330de92eb10f ARM: ftrace: avoid redundant loads or clobbering IP
    3f887cb763a0 media: atomisp: fix dummy_ptr check to avoid duplicate active_bo
    8b6b38083a29 media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2 regulator off on some boards
    1c17870f26d9 ASoC: madera: Add dependencies on MFD
    35a2aeb70fe6 ARM: dts: bcm2837: Add the missing L1/L2 cache information
    93b85b6e8358 ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
    521796018815 video: fbdev: omapfb: acx565akm: replace snprintf with sysfs_emit
    6fe23ff94e78 video: fbdev: cirrusfb: check pixclock to avoid divide by zero
    9522e11e8636 video: fbdev: w100fb: Reset global state
    9ff2f7294ab0 video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow
    77fbe028d5a3 media: iommu/mediatek: Add device_link between the consumer and the larb devices
    4dd3e2d1bd70 media: iommu/mediatek: Return ENODEV if the device is NULL
    1515d1414967 media: iommu/mediatek-v1: Free the existed fwspec if the master dev already has
    eff76b180751 media: imx-jpeg: Prevent decoding NV12M jpegs into single-planar buffers
    47b45e08e5ad ASoC: SOF: Intel: match sdw version on link_slaves_found
    205db54b159f ASoC: sh: rz-ssi: Make the data structures available before registering the handlers
    2011363c1968 media: ir_toy: free before error exiting
    0b2313042634 media: atmel: atmel-isc-base: report frame sizes as full supported range
    3681eb1fd45c media: staging: media: zoran: fix various V4L2 compliance errors
    7e76f3ed7ab2 media: staging: media: zoran: calculate the right buffer number for zoran_reap_stat_com
    ff3357bffd9f media: staging: media: zoran: move videodev alloc
    24ab2d4ef52c ntfs: add sanity check on allocation size
    9dd6bb11df64 Adjust cifssb maximum read size
    1a55c48bba81 f2fs: compress: fix to print raw data size in error path of lz4 decompression
    2eff60346e7a f2fs: use spin_lock to avoid hang
    c78bada18aa1 btrfs: make search_csum_tree return 0 if we get -EFBIG
    40d006dfedd6 btrfs: harden identification of a stale device
    58d3aa672d13 f2fs: don't get FREEZE lock in f2fs_evict_inode in frozen fs
    7260793c13e9 NFSD: Fix nfsd_breaker_owns_lease() return values
    f68caedf264a f2fs: fix to do sanity check on curseg->alloc_type
    a0856764dc12 ext4: don't BUG if someone dirty pages without asking ext4 first
    7cca463f1030 sched/tracing: Report TASK_RTLOCK_WAIT tasks as TASK_UNINTERRUPTIBLE
    6a6beb074186 ext4: fix ext4_mb_mark_bb() with flex_bg with fast_commit
    572d14e6cec4 ext4: correct cluster len and clusters changed accounting in ext4_mb_mark_bb
    1388c10b3257 locking/lockdep: Iterate lock_classes directly when reading lockdep files
    95bc0ba6bef8 atomics: Fix atomic64_{read_acquire,set_release} fallbacks
    75fe5dcb1653 spi: tegra20: Use of_device_get_match_data()
    ffe0c4916795 nvme-tcp: lockdep: annotate in-kernel sockets
    b3ea76bda7f7 parisc: Fix handling off probe non-access faults
    c29642ba72f8 PM: core: keep irq flags in device_pm_check_callbacks()
    c02f2d420a44 ACPI/APEI: Limit printable size of BERT table data
    65d8a737452e Revert "Revert "block, bfq: honor already-setup queue merges""
    5b8d69c8c107 lib/raid6/test/Makefile: Use $(pound) instead of \# for Make 4.3
    33ccf4f81785 ACPICA: Avoid walking the ACPI Namespace if it is not there
    080665e2c3cb bfq: fix use-after-free in bfq_dispatch_request
    e0943c456b60 fs/binfmt_elf: Fix AT_PHDR for unusual ELF files
    757322b5aba9 irqchip/nvic: Release nvic_base upon failure
    dabfc878ef6f irqchip/qcom-pdc: Fix broken locking
    05ba7d0c639f Fix incorrect type in assignment of ipv6 port for audit
    860d36424d1b loop: use sysfs_emit() in the sysfs xxx show()
    55d192691b4b selinux: allow FIOCLEX and FIONCLEX with policy capability
    e48c260b0b2a arm64: module: remove (NOLOAD) from linker script
    15bb7a467b2b selinux: use correct type for context length
    8f34dea99cd7 block, bfq: don't move oom_bfqq
    69d41c77aadf crypto: hisilicon/sec - not need to enable sm4 extra mode at HW V3
    f84b1633004d crypto: xts - Add softdep on ecb
    e11293de5cf6 block/bfq_wf2q: correct weight to ioprio
    e34806c6c29d rcu: Mark writes to the rcu_segcblist structure's ->flags field
    99780fcb5494 pinctrl: npcm: Fix broken references to chip->parent_device
    999ee266531b gcc-plugins/stackleak: Exactly match strings instead of prefixes
    ca97dfbda510 crypto: hisilicon/qm - cleanup warning in qm_vf_read_qos
    4941c21090c3 regulator: rpi-panel: Handle I2C errors/timing to the Atmel
    f3f93a1aaafc LSM: general protection fault in legacy_parse_param
    c331c9d1d2b7 fs: fix fd table size alignment properly
    611170142b42 lib/test: use after free in register_test_dev_kmod()
    136736abcd35 fs: fd tables have to be multiples of BITS_PER_LONG
    fd3f70b90772 net: dsa: bcm_sf2_cfp: fix an incorrect NULL check on list iterator
    a738ff8143d8 NFSv4/pNFS: Fix another issue with a list iterator pointing to the head
    bcbf4e5c3b5b net/sched: act_ct: fix ref leak when switching zones
    72dd9e61fa31 net: prefer nf_ct_put instead of nf_conntrack_put
    6b663fa23c7e octeontx2-af: initialize action variable
    b375ea083fa6 net: sparx5: switchdev: fix possible NULL pointer dereference
    409570a619c1 net/x25: Fix null-ptr-deref caused by x25_disconnect
    c416e9bb85a6 qlcnic: dcb: default to returning -EOPNOTSUPP
    e87c47df2193 net: sparx5: depends on PTP_1588_CLOCK_OPTIONAL
    34a5c64951c3 net: hns3: clean residual vf config after disable sriov
    c95578235888 NFS: Don't loop forever in nfs_do_recoalesce()
    667760fe01e9 selftests: test_vxlan_under_vrf: Fix broken test case
    2d05a007096e net: phy: broadcom: Fix brcm_fet_config_init()
    2dc73ba93202 net: hns3: refine the process when PF set VF VLAN
    ee7e9a9d73d9 net: hns3: format the output of the MAC address
    30f0ff7176ef net: hns3: add vlan list lock to protect vlan list
    02948e5782ce net: hns3: fix port base vlan add fail when concurrent with reset
    5e528c0e0618 net: hns3: fix bug when PF set the duplicate MAC address for VFs
    be6937a11b1c net: enetc: report software timestamping via SO_TIMESTAMPING
    af884b276b08 xen: fix is_xen_pmu()
    6c17fd7a6f5d clk: Initialize orphan req_rate
    8b320893461c vsock/virtio: enable VQs early on probe
    b64bf5464ad5 vsock/virtio: read the negotiated features before using VQs
    10c6cb867ffa vsock/virtio: initialize vdev->priv before using VQs
    c07a9d2a1d1d clk: qcom: gcc-msm8994: Fix gpll4 width
    e16b5f077980 perf stat: Fix forked applications enablement of counters
    c532caa7df8c kdb: Fix the putarea helper function
    0445609a7ace NFSv4.1: don't retry BIND_CONN_TO_SESSION on session error
    4ee7a4b67770 SUNRPC don't resend a task on an offlined transport
    6195af5ad801 netfilter: nf_conntrack_tcp: preserve liberal flag in tcp options
    6bbfe9a715ea jfs: fix divide error in dbNextAG
    104852921ff6 driver core: dd: fix return value of __setup handler
    20fab30930f3 firmware: google: Properly state IOMEM dependency
    af6e1b06d0ba kgdbts: fix return value of __setup handler
    1d5103d9bb7d virt: acrn: fix a memory leak in acrn_dev_ioctl()
    b9c43aa0b18d virt: acrn: obtain pa from VMA with PFNMAP flag
    16e323804732 serial: 8250: fix XOFF/XON sending when DMA is used
    a885e17cf5f2 kgdboc: fix return value of __setup handler
    e1338178f35e tty: hvc: fix return value of __setup handler
    e35a555b5a9d pinctrl/rockchip: Add missing of_node_put() in rockchip_pinctrl_probe
    c52703355766 pinctrl: nomadik: Add missing of_node_put() in nmk_pinctrl_probe
    84940deb8dd3 pinctrl: microchip-sgpio: lock RMW access
    c6f009fe90f1 pinctrl: microchip sgpio: use reset driver
    a843ba2e9c87 pinctrl: mediatek: paris: Skip custom extra pin config dump for virtual GPIOs
    070d46aee151 pinctrl: mediatek: paris: Fix pingroup pin config state readback
    1190c1a5828a pinctrl: mediatek: paris: Fix "argument" argument type for mtk_pinconf_get()
    a8d236a32934 pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_* readback
    3ddbb9ba7579 pinctrl: mediatek: Fix missing of_node_put() in mtk_pctrl_init
    127a5d3e732d staging: mt7621-dts: fix GB-PC2 devicetree
    b24dfa54d6e8 staging: mt7621-dts: fix pinctrl properties for ethernet
    97d01fabee69 staging: mt7621-dts: fix formatting
    1293b7481d73 staging: mt7621-dts: fix LEDs and pinctrl on GB-PC1 devicetree
    75ee75cc360a NFS: remove unneeded check in decode_devicenotify_args()
    8bddc0227e78 mailbox: imx: fix crash in resume on i.mx8ulp
    613e1b253f6d clk: tegra: tegra124-emc: Fix missing put_device() call in emc_ensure_emc_driver
    4be3e4c05d8d clk: Fix clk_hw_get_clk() when dev is NULL
    071c958f8e1b clk: clps711x: Terminate clk_div_table with sentinel element
    0415dce6228c clk: hisilicon: Terminate clk_div_table with sentinel element
    f4aee7714a1c clk: loongson1: Terminate clk_div_table with sentinel element
    7608a654a294 clk: actions: Terminate clk_div_table with sentinel element
    be8ab90a3a77 nvdimm/region: Fix default alignment for small regions
    bd4771ba2cf9 remoteproc: qcom_q6v5_mss: Fix some leaks in q6v5_alloc_memory_region
    9c28309d6a5e remoteproc: qcom_wcnss: Add missing of_node_put() in wcnss_alloc_memory_region
    9a809b902e1d remoteproc: qcom: Fix missing of_node_put in adsp_alloc_memory_region
    95deff8996fb dmaengine: hisi_dma: fix MSI allocate fail when reload hisi_dma
    2a9b575627fc clk: qcom: clk-rcg2: Update the frac table for pixel clock
    34dca60982e9 clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
    7a778371f9f2 clk: at91: sama7g5: fix parents of PDMCs' GCLK
    4b8a71f206c9 clk: imx: off by one in imx_lpcg_parse_clks_from_dt()
    4bd979ee9927 clk: imx7d: Remove audio_mclk_root_clk
    c39a750b61f7 dma-debug: fix return value of __setup handlers
    872a7b12af43 staging: r8188eu: fix endless loop in recv_func
    18dc19571210 NFS: Return valid errors from nfs2/3_decode_dirent()
    8a842f88d0e2 habanalabs: Add check for pci_enable_device
    82546d91d588 iio: adc: Add check for devm_request_threaded_irq
    3e843460fb42 serial: 8250: Fix race condition in RTS-after-send handling
    ba3a3390c9b1 NFS: Use of mapping_set_error() results in spurious errors
    b59173ff16fb serial: 8250_lpss: Balance reference count for PCI DMA device
    3a1131f7d2a8 serial: 8250_mid: Balance reference count for PCI DMA device
    675216a820ec phy: phy-brcm-usb: fixup BCM4908 support
    d9a3c2949d04 phy: dphy: Correct lpx parameter and its derivatives(ta_{get,go,sure})
    ca3d7cf53d8f clk: qcom: ipq8074: Use floor ops for SDCC1 clock
    8c54f6c900d1 pinctrl: renesas: checker: Fix miscalculation of number of states
    d19fb1d659ba pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
    157a22ca80c5 staging:iio:adc:ad7280a: Fix handing of device address bit reversing.
    d6c4fc0d903f serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port type
    011e841cd11b iio: mma8452: Fix probe failing when an i2c_device_id is used
    cad1a3b1f481 dmaengine: idxd: restore traffic class defaults after wq reset
    7bebc9519691 dmaengine: idxd: change bandwidth token to read buffers
    e509584b079a dmaengine: idxd: check GENCAP config support for gencfg register
    41e360fa73a4 clk: qcom: ipq8074: fix PCI-E clock oops
    9a5f4da1ea27 soundwire: intel: fix wrong register name in intel_shim_wake
    251aabcb0b09 cpufreq: qcom-cpufreq-nvmem: fix reading of PVS Valid fuse
    2d7a9c09be64 misc: alcor_pci: Fix an error handling path
    72c4f4200f98 fsi: Aspeed: Fix a potential double free
    8adfd166fb32 pps: clients: gpio: Propagate return value from pps_gpio_probe
    6f4f778f2747 pwm: lpc18xx-sct: Initialize driver data and hardware before pwmchip_add()
    28a886a308ed fsi: scom: Remove retries in indirect scoms
    9fdc543b0e2a fsi: scom: Fix error handling
    b125b08dbee3 mxser: fix xmit_buf leak in activate when LSR == 0xff
    7a68abde36e1 staging: r8188eu: release_firmware is not called if allocation fails
    1768384f61d1 staging: r8188eu: convert DBG_88E_LEVEL call in hal/rtl8188e_hal_init.c
    a9e88c2618d2 kernel/resource: fix kfree() of bootmem memory again
    585dc196a08f drivers: ethernet: cpsw: fix panic when interrupt coaleceing is set via ethtool
    eec20eea27a0 ice: don't allow to run ice_send_event_to_aux() in atomic ctx
    9b77c8cf69a4 ice: fix 'scheduling while atomic' on aux critical err interrupt
    c64223a8d188 mfd: asic3: Add missing iounmap() on error asic3_mfd_probe
    21a2b4ab48a4 tipc: fix the timer expires after interval 100ms
    95df5cd5a446 net: dsa: fix panic on shutdown if multi-chip tree failed to probe
    894347d4d29b openvswitch: always update flow key after nat
    862002402333 tcp: ensure PMTU updates are processed during fastopen
    06d836801cd8 net: bcmgenet: Use stronger register read/writes to assure ordering
    40092a8ac089 PCI: Avoid broken MSI on SB600 USB devices
    dd1043342e45 selftests/bpf/test_lirc_mode2.sh: Exit with proper code
    33d39efb61a8 powerpc/pseries: Fix use after free in remove_phb_dynamic()
    226ec1997de7 i2c: mux: demux-pinctrl: do not deactivate a master that is not active
    0ee072f91326 netfilter: conntrack: Add and use nf_ct_set_auto_assign_helper_warned()
    9b2bbf36b9cf i2c: meson: Fix wrong speed use from probe
    7409ff6393a6 af_netlink: Fix shift out of bounds in group mask calculation
    9151982547ee ipv4: Fix route lookups when handling ICMP redirects and PMTU updates
    770a97d3f34b Bluetooth: btmtksdio: Fix kernel oops in btmtksdio_interrupt
    60283d3ad395 Bluetooth: call hci_le_conn_failed with hdev lock in hci_le_conn_failed
    7235485433d2 Bluetooth: hci_uart: add missing NULL check in h5_enqueue
    292e8478ae0a selftests/bpf: Fix error reporting from sock_fields programs
    48e785075f9e af_unix: Fix some data-races around unix_sk(sk)->oob_skb.
    1bd58abf595b ibmvnic: fix race between xmit and reset
    3f798111077a bareudp: use ipv6_mod_enabled to check if IPv6 enabled
    b184a8fa7dd4 can: isotp: support MSG_TRUNC flag when reading from socket
    05e4e7d9bbb3 can: isotp: return -EADDRNOTAVAIL when reading from unbound socket
    f343dbe82314 can: isotp: sanitize CAN ID checks in isotp_bind()
    9265c09b2415 mt76: mt7921: fix mt7921_queues_acq implementation
    2a85c4cb3b15 netfilter: flowtable: Fix QinQ and pppoe support for inet table
    7ff346ee019b drm/i915/display: Fix HPD short pulse handling for eDP
    5d48ddbcafdf USB: storage: ums-realtek: fix error code in rts51x_read_mem()
    bc2c4dc5b566 samples/bpf, xdpsock: Fix race when running for fix duration of time
    cb6f141ae705 bpf, sockmap: Fix double uncharge the mem of sk_msg
    168ff181f5b6 bpf, sockmap: Fix more uncharged while msg has more_data
    de3a8d8fab07 bpf, sockmap: Fix memleak in tcp_bpf_sendmsg while sk msg is full
    ef9785f42979 bpf, sockmap: Fix memleak in sk_psock_queue_msg
    8dd392e352d3 RDMA/mlx5: Fix memory leak in error flow for subscribe event routine
    b089f7fc89f9 Revert "RDMA/core: Fix ib_qp_usecnt_dec() called when error"
    d52dab6e0355 RDMA/irdma: Prevent some integer underflows
    18e65ab351cf power: ab8500_chargalg: Use CLOCK_MONOTONIC
    fe0e2ce5c87e mtd: rawnand: atmel: fix refcount issue in atmel_nand_controller_init
    d29cda15cab0 MIPS: pgalloc: fix memory leak caused by pgd_free()
    d5e41310bd72 MIPS: RB532: fix return value of __setup handler
    69155dc2e047 mips: cdmm: Fix refcount leak in mips_cdmm_phys_base
    32939187f254 ath10k: Fix error handling in ath10k_setup_msa_resources
    9d04f4a15fe0 vxcan: enable local echo for sent CAN frames
    45962427aca2 powerpc: 8xx: fix a return value error in mpc8xx_pic_init
    88242bd033e2 scsi: mpt3sas: Fix incorrect 4GB boundary check
    ee773b7018d6 platform/x86: huawei-wmi: check the return value of device_create_file()
    fdee6b347cb8 selftests/bpf: Make test_lwt_ip_encap more stable and faster
    adc4a1ed139e libbpf: Unmap rings when umem deleted
    0a0c75ce5e26 mfd: mc13xxx: Add check for mc13xxx_irq_request
    4a852ff9b7be powerpc/64s: Don't use DSISR for SLB faults
    b55697c2a274 powerpc/sysdev: fix incorrect use to determine if list is empty
    804338913d27 MIPS: Sanitise Cavium switch cases in TLB handler synthesizers
    be48780b4dec mips: DEC: honor CONFIG_MIPS_FP_SUPPORT=n
    f23b4c9c6a5a drm/msm/a6xx: Fix missing ARRAY_SIZE() check
    62f44f554d1c net: axienet: fix RX ring refill allocation failure handling
    e37d269734ee PCI: Reduce warnings on possible RW1C corruption
    4c3c666ecc6a RDMA/core: Fix ib_qp_usecnt_dec() called when error
    c5505076073b IB/hfi1: Allow larger MTU without AIP
    4124966fbd95 power: supply: wm8350-power: Add missing free in free_charger_irq
    1318caf07507 power: supply: wm8350-power: Handle error for wm8350_register_irq
    8659aba5cab3 i2c: xiic: Make bus names unique
    383798d13aea hv_balloon: rate-limit "Unhandled message" warning
    5baa1283d698 KVM: x86/emulator: Defer not-present segment check in __load_segment_descriptor()
    468b136c2ca1 KVM: x86: Fix emulation in writing cr8
    29322cd03678 powerpc/Makefile: Don't pass -mcpu=powerpc64 when building 32-bit
    451472dc178f powerpc/mm/numa: skip NUMA_NO_NODE onlining in parse_numa_properties()
    6792c0b56252 libbpf: Skip forward declaration when counting duplicated type names
    c06577a80485 gpu: host1x: Fix a memory leak in 'host1x_remove()'
    2154f7cadd88 RDMA/irdma: Remove incorrect masking of PD
    a0051c05312e RDMA/irdma: Fix Passthrough mode in VM
    5e96bb45c936 RDMA/irdma: Fix netdev notifications for vlan's
    ad7219cd8751 xsk: Fix race at socket teardown
    c08f23081c9b bpf, arm64: Feed byte-offset into bpf line info
    c301772c219d bpf, arm64: Call build_prologue() first in first JIT pass
    ffe0526c2e17 drm/bridge: cdns-dsi: Make sure to to create proper aliases for dt
    849e6be7d66d scsi: hisi_sas: Change permission of parameter prot_mask
    1003a85d0a30 power: supply: bq24190_charger: Fix bq24190_vbus_is_enabled() wrong false return
    852c1f5f3119 drm/tegra: Fix reference leak in tegra_dsi_ganged_probe
    3813591bc046 ext2: correct max file size computing
    0c80fe5ea1b3 power: supply: sbs-charger: Don't cancel work that is not initialized
    c2554b47644f TOMOYO: fix __setup handlers return values
    bd443887ed2a drm/amd/display: Remove vupdate_int_entry definition
    847f8677e367 RDMA/mlx5: Fix the flow of a miss in the allocation of a cache ODP MR
    c8db786858d8 scsi: pm8001: Fix abort all task initialization
    c6c95cdd5138 scsi: pm8001: Fix NCQ NON DATA command completion handling
    e4fce9af88ec scsi: pm8001: Fix NCQ NON DATA command task initialization
    03865ae38771 scsi: pm8001: Fix le32 values handling in pm80xx_chip_sata_req()
    b453d71af756 scsi: pm8001: Fix le32 values handling in pm80xx_chip_ssp_io_req()
    d14d1f88d8c2 scsi: pm8001: Fix payload initialization in pm80xx_encrypt_update()
    fc1d7c820287 scsi: pm8001: Fix le32 values handling in pm80xx_set_sas_protocol_timer_config()
    e332a97c4358 scsi: pm8001: Fix payload initialization in pm80xx_set_thermal_config()
    3a9bb3afd0cb scsi: pm8001: Fix command initialization in pm8001_chip_ssp_tm_req()
    4e878e41e900 scsi: pm8001: Fix command initialization in pm80XX_send_read_log()
    08f0b58e2a5f scsi: fnic: Fix a tracing statement
    aed99c7648cb vfio/pci: wake-up devices around reset functions
    4319f17fb826 vfio/pci: fix memory leak during D3hot to D0 transition
    5f3856f3ba10 dm crypt: fix get_key_size compiler warning if !CONFIG_KEYS
    590bc324ac4e drm/msm/dpu: fix dp audio condition
    9b625cee90a9 drm/msm/dpu: add DSPP blocks teardown
    ea009273d0c2 drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
    04ed3cd92999 drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
    47e2060f2366 drm/msm/dp: always add fail-safe mode into connector mode list
    740d2330760e drm/msm/dp: stop link training after link training 2 failed
    9525b8bcae8b drm/msm/dp: populate connector of struct dp_panel
    2c4de9b94227 mtd: rawnand: pl353: Set the nand chip node as the flash node
    a2095c3e0309 iwlwifi: mvm: Fix an error code in iwl_mvm_up()
    01e36bdb95e7 iwlwifi: Fix -EIO error code that is never returned
    a3bb5cda4fed iwlwifi: yoyo: remove DBGI_SRAM address reset writing
    06511eed8177 iwlwifi: mvm: align locking in D3 test debugfs
    ec9b77481aaf iwlwifi: mvm: don't iterate unadded vifs when handling FW SMPS req
    21053d707480 iwlwifi: mvm: Don't call iwl_mvm_sta_from_mac80211() with NULL sta
    2de35ae362f3 selftests: mptcp: add csum mib check for mptcp_connect
    e2951eaa9398 dax: make sure inodes are flushed before destroy cache
    c08208f2635c IB/cma: Allow XRC INI QPs to set their local ACK timeout
    d85baefc858f libbpf: Fix memleak in libbpf_netlink_recv()
    0f47edc22c2b drm/amd/display: Add affected crtcs to atomic state for dsc mst unplug
    ac98fdec1114 drm/amd/pm: enable pm sysfs write for one VF mode
    28093e78e0f2 bpftool: Fix the error when lookup in no-btf maps
    64c06df2428b drm/bridge: anx7625: Fix overflow issue on reading EDID
    d6c7f46b8f05 iommu/ipmmu-vmsa: Check for error num after setting mask
    b5b285818754 HID: i2c-hid: fix GET/SET_REPORT for unnumbered reports
    ffb8e92b4cef power: supply: ab8500: Fix memory leak in ab8500_fg_sysfs_init
    9dea119df0fa libbpf: Use dynamically allocated buffer when receiving netlink messages
    f2a19db2a941 drm/bridge: dw-hdmi: use safe format when first in bridge chain
    2f0949db6e2c libbpf: Fix compilation warning due to mismatched printf format
    0255e93dce7a net:enetc: allocate CBD ring data memory using DMA coherent methods
    721992163e0c cxl/regs: Fix size of CXL Capability Header Register
    0e348f94787f cxl/core: Fix cxl_probe_component_regs() error message
    855f1c64e21e libbpf: Fix signedness bug in btf_dump_array_data()
    cdb2150050c7 RDMA/rxe: Check the last packet by RXE_END_MASK
    ed750e22e443 PCI: aardvark: Fix reading PCI_EXP_RTSTA_PME bit on emulated bridge
    0fe94b84c43c PCI: aardvark: Fix reading MSI interrupt number
    1f0add37ac5c igb: refactor XDP registration
    ab8c107470d1 igc: avoid kernel warning when changing RX ring parameters
    ea6b04796c87 mtd: mchp48l640: Add SPI ID table
    21e78798b206 mtd: mchp23k256: Add SPI ID table
    0eec5e2748f1 i2c: bcm2835: Fix the error handling in 'bcm2835_i2c_probe()'
    0b01811fc193 i2c: bcm2835: Use platform_get_irq() to get the interrupt
    b96a7265f763 net: asix: add proper error handling of usb read errors
    b997cfdc3f98 livepatch: Fix build failure on 32 bits processors
    34bed8dae12a scripts/dtc: Call pkg-config POSIXly correct
    0aec294f2d2f mac80211: limit bandwidth in HE capabilities
    a41efae062bf mac80211: Remove a couple of obsolete TODO
    5ad6b337e4ac net: dsa: mv88e6xxx: Enable port policy support on 6097
    b2dea2a696d0 ptp: unregister virtual clocks when unregistering physical clock.
    a53c147ac496 mt76: mt7615: check sta_rates pointer in mt7615_sta_rate_tbl_update
    fd1fcad5c053 mt76: mt7603: check sta_rates pointer in mt7603_sta_rate_tbl_update
    443cb1bc8a96 mt76: mt7615: fix a leftover race in runtime-pm
    421cb64c91dd mt76: mt7921: fix a leftover race in runtime-pm
    0f3d76144b9c mt76: mt7915: use proper aid value in mt7915_mcu_sta_basic_tlv
    60d815fd4338 mt76: mt7915: use proper aid value in mt7915_mcu_wtbl_generic_tlv in sta mode
    203a1e1230cf mt76: connac: fix sta_rec_wtbl tag len
    94fd8a2a47c8 powerpc/perf: Don't use perf_hw_context for trace IMC PMU
    0dc750479a5f KVM: PPC: Book3S HV: Check return value of kvmppc_radix_init
    10686b028059 powerpc: dts: t1040rdb: fix ports names for Seville Ethernet switch
    9acf7c2f3145 ray_cs: Check ioremap return value
    3a4bcc4cb612 power: reset: gemini-poweroff: Fix IRQ check in gemini_poweroff_probe
    cb42b6cfc5b0 ixgbe: respect metadata on XSK Rx to skb
    8c072b8e3226 ixgbe: don't reserve excessive XDP_PACKET_HEADROOM on XSK Rx to skb
    6dc18226976c ixgbe: pass bi->xdp to ixgbe_construct_skb_zc() directly
    28e561f3660d igc: don't reserve excessive XDP_PACKET_HEADROOM on XSK Rx to skb
    0e2f6a7f59f1 i40e: respect metadata on XSK Rx to skb
    968c76e96afd i40e: don't reserve excessive XDP_PACKET_HEADROOM on XSK Rx to skb
    7ad4f7729f0e selftests/net: timestamping: Fix bind_phc check
    5bedd66a59e5 KVM: PPC: Fix vmx/vsx mixup in mmio emulation
    72c179f650f6 RDMA/core: Set MR type in ib_reg_user_mr
    0b700f7d0649 ath9k_htc: fix uninit value bugs
    c41832e7dadd selftests/bpf/test_xdp_redirect_multi: use temp netns for testing
    a5c1c0920cf6 selftests/bpf: Normalize XDP section names in selftests
    f00346b30a7c net: phy: at803x: move page selection fix to config_init
    b175bc586410 drm/amd/pm: return -ENOTSUPP if there is no get_dpm_ultimate_freq function
    bdc7429708a0 drm/amd/display: Fix a NULL pointer dereference in amdgpu_dm_connector_add_common_modes()
    408ab78ca138 drm/nouveau/acr: Fix undefined behavior in nvkm_acr_hsfw_load_bl()
    2e05de23052d ionic: Don't send reset commands if FW isn't running
    4f69a923a388 ionic: start watchdog after all is setup
    76624b5a61c7 ionic: fix type complaint in ionic_dev_cmd_clean()
    da491fc54e4e drm/edid: Split deep color modes between RGB and YUV444
    19da408ab41c drm/edid: Don't clear formats if using deep color
    8480efe815e5 mtd: rawnand: gpmi: fix controller timings setting
    5b1f32593955 mtd: onenand: Check for error irq
    041e5b8a62e6 Bluetooth: hci_serdev: call init_rwsem() before p->open()
    9d42e744685c Bluetooth: btintel: Fix WBS setting for Intel legacy ROM products
    0b96610a7b74 selftests: bpf: Fix bind on used port
    0728ccb66468 drm/selftests/test-drm_dp_mst_helper: Fix memory leak in sideband_msg_req_encode_decode
    51b82141fffa bpf: Fix UAF due to race between btf_try_get_module and load_module
    811b667cefbe udmabuf: validate ubuf->pagecount
    e5f642c55f4c bpftool: Only set obj->skeleton on complete success
    b385ebe91ae9 libbpf: Fix possible NULL pointer dereference when destroying skeleton
    34d0a99fa09a drm/panfrost: Check for error num after setting mask
    2ff993b3daa4 drm/v3d/v3d_drv: Check for error num after setting mask
    982d824a9b27 ath10k: fix memory overwrite of the WoWLAN wakeup packet pattern
    66b805b63527 drm: bridge: adv7511: Fix ADV7535 HPD enablement
    c43b4106cfc5 drm/bridge: nwl-dsi: Fix PM disable depth imbalance in nwl_dsi_probe
    4db8e14ce478 drm/bridge: Add missing pm_runtime_disable() in __dw_mipi_dsi_probe
    f20a990784ee drm/bridge: Fix free wrong object in sii8620_init_rcp_input_dev
    461656a5e9be drm/meson: Fix error handling when afbcd.ops->init fails
    1c5439a71612 drm/meson: split out encoder from meson_dw_hdmi
    ffcfa1669316 drm/meson: Make use of the helper function devm_platform_ioremap_resourcexxx()
    d2a0678dff46 drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
    d81d72b912dc ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
    c4d2a100f104 ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVERS
    c2e5f5d23718 ASoC: amd: Fix reference to PCM buffer address
    2f44eca78cc6 ASoC: codecs: wcd934x: Add missing of_node_put() in wcd934x_codec_parse_data
    e2aeafc6509c ASoC: msm8916-wcd-analog: Fix error handling in pm8916_wcd_analog_spmi_probe
    f589063b585a ASoC: atmel: Fix error handling in sam9x5_wm8731_driver_probe
    f2b0fc2a46a6 mmc: davinci_mmc: Handle error for clk_enable
    9668c6bca12a ASoC: msm8916-wcd-digital: Fix missing clk_disable_unprepare() in msm8916_wcd_digital_probe
    42735eae94ee ASoC: SOF: Intel: enable DMI L1 for playback streams
    b23b524b8bbd ASoC: imx-es8328: Fix error return code in imx_es8328_probe()
    06e6f4ba2534 ASoC: fsl_spdif: Disable TX clock when stop
    44acdaf7acb6 ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
    1ecf9dcf2868 ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
    39c2894dfc08 ASoC: rk817: Fix missing clk_disable_unprepare() in rk817_platform_probe
    87e04a89c31e ASoC: mediatek: mt8192-mt6359: Fix error handling in mt8192_mt6359_dev_probe
    56e0f1696a96 ASoC: mediatek: use of_device_get_match_data()
    5441ab46dd43 ASoC: SOF: Add missing of_node_put() in imx8m_probe
    6724217bfbfd ASoC: rockchip: i2s: Fix missing clk_disable_unprepare() in rockchip_i2s_probe
    f32ac9bf5e3f ASoC: atmel: Fix error handling in snd_proto_probe
    1e77cab218e4 ivtv: fix incorrect device_caps for ivtvfb
    a8523efdc946 media: saa7134: fix incorrect use to determine if list is empty
    a41fc6d02d82 video: fbdev: omapfb: Add missing of_node_put() in dvic_probe_of
    c19312809931 ASoC: fsi: Add check for clk_enable
    0bdb861b7d1b ASoC: wm8350: Handle error for wm8350_register_irq
    a0bc36b247dc ASoC: atmel: Add missing of_node_put() in at91sam9g20ek_audio_probe
    9dd2fd7a1f84 media: vidtv: Check for null return of vzalloc
    a09e9882800f media: stk1160: If start stream fails, return buffers with VB2_BUF_STATE_QUEUED
    ea2258664ffc m68k: coldfire/device.c: only build for MCF_EDMA when h/w macros are defined
    178b32112be1 arm64: dts: rockchip: Fix SDIO regulator supply properties on rk3399-firefly
    eab74c416120 ALSA: firewire-lib: fix uninitialized flag for AV/C deferred transaction
    2883fb9838fc memory: emif: check the pointer temp in get_device_details()
    50d934cea574 memory: emif: Add check for setup_interrupts
    fc237b8d624f ASoC: soc-compress: prevent the potentially use of null pointer
    d70d4a3ff5f2 ASoC: dwc-i2s: Handle errors for clk_enable
    58b64ee38637 ASoC: atmel_ssc_dai: Handle errors for clk_enable
    152d62d80960 ASoC: mxs-saif: Handle errors for clk_enable
    f64c5b235b47 printk: fix return value of printk.devkmsg __setup handler
    0fbd610e68c2 arm64: dts: broadcom: Fix sata nodename
    de64846df9fe arm64: dts: ns2: Fix spi-cpol and spi-cpha property
    b98940965daf ALSA: spi: Add check for clk_enable()
    89676d9e8c84 ASoC: ti: davinci-i2s: Add check for clk_enable()
    0a96bff46a5e mmc: sdhci_am654: Fix the driver data of AM64 SoC
    7c31acd9ca79 soc: mediatek: pm-domains: Add wakeup capacity support in power domain
    9db742370304 ASoC: rt5663: check the return value of devm_kzalloc() in rt5663_parse_dp()
    3fa8114be4a2 uaccess: fix nios2 and microblaze get_user_8()
    469277ff5ac8 vsprintf: Fix %pK with kptr_restrict == 0
    8611161ea715 lib: uninline simple_strntoull() as well
    34dd193d2329 selftests/lkdtm: Add UBSAN config
    f58159509b62 media: ov5640: Fix set format, v4l2_mbus_pixelcode not updated
    b1b91b31627d media: v4l2-core: Initialize h264 scaling matrix
    7399b9b62277 ASoC: codecs: wcd934x: fix return value of wcd934x_rx_hph_mode_put
    c42e96af49ef ASoC: codecs: wcd934x: fix kcontrol max values
    363490abe0be ASoC: codecs: wcd938x: fix kcontrol max values
    adafea71b49e ASoC: codecs: wc938x: fix accessing array out of bounds for enum type
    966408e37d84 ASoC: codecs: va-macro: fix accessing array out of bounds for enum type
    eb15c6ea692f ASoC: codecs: rx-macro: fix accessing array out of bounds for enum type
    9208ecc703b5 ASoC: codecs: rx-macro: fix accessing compander for aux
    56dcb5480687 media: cedrus: h264: Fix neighbour info buffer size
    dd6454742581 media: cedrus: H265: Fix neighbour info buffer size
    895364fa97e6 media: usb: go7007: s2250-board: fix leak in probe()
    332d45fe51d7 media: em28xx: initialize refcount before kref_get
    aa613ac27029 media: ti-vpe: cal: Fix a NULL pointer dereference in cal_ctx_v4l2_init_formats()
    12cb301cc5cb media: video/hdmi: handle short reads of hdmi info frame.
    0d05a58ea3b9 media: mexon-ge2d: fixup frames size in registers
    498ab2d70a9d ARM: dts: imx: Add missing LVDS decoder on M53Menlo
    2305e3460b42 vsprintf: Fix potential unaligned access
    b4c8675a710a ARM: dts: sun8i: v3s: Move the csi1 block to follow address order
    49db8d166d7b soc: ti: wkup_m3_ipc: Fix IRQ check in wkup_m3_ipc_probe
    42dab81e9309 firmware: ti_sci: Fix compilation failure when CONFIG_TI_SCI_PROTOCOL is not defined
    19e4c3b037ff arm64: dts: qcom: sm8350: Correct TCS configuration for apps rsc
    8026415d7f54 arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
    17790ef9ad1f arm64: dts: broadcom: bcm4908: use proper TWD binding
    cc3a67e4147e arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
    4514dc92a353 arm64: dts: qcom: sdm845: fix microphone bias properties and values
    15565049d729 soc: qcom: aoss: remove spurious IRQF_ONESHOT flags
    1874365f3c17 soc: qcom: ocmem: Fix missing put_device() call in of_get_ocmem
    724376c30af5 soc: qcom: rpmpd: Check for null return of devm_kcalloc
    d761d62022bb ARM: dts: qcom: ipq4019: fix sleep clock
    b14f6a7d3608 firmware: qcom: scm: Remove reassignment to desc following initializer
    6c4cc4d36966 ARM: dts: Fix OpenBMC flash layout label addresses
    c3364cbc3762 video: fbdev: fbcvt.c: fix printing in fb_cvt_print_name()
    f3ef254c840d video: fbdev: atmel_lcdfb: fix an error code in atmel_lcdfb_probe()
    c420b540db4b video: fbdev: smscufx: Fix null-ptr-deref in ufx_usb_probe()
    24cfeb466146 video: fbdev: controlfb: Fix COMPILE_TEST build
    02684dd83332 video: fbdev: matroxfb: set maxvram of vbG200eW to the same as vbG200 to avoid black screen
    96eb48f017cd media: aspeed: Correct value for h-total-pixels
    4a3051977327 media: ov5648: Don't pack controls struct
    26b1865f1fd4 media: v4l: Avoid unaligned access warnings when printing 4cc modifiers
    ef35afc268c5 media: ov6650: Fix set format try processing path
    4ea548312052 media: hantro: Fix overfill bottom register field name
    b0b890dd8df3 media: meson: vdec: potential dereference of null pointer
    c3590ec1161d media: coda: Fix missing put_device() call in coda_get_vdoa_data
    f0344f0aee4d ASoC: simple-card-utils: Set sysclk on all components
    bb0a0e23dd00 ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
    1179081ba5fa ASoC: codecs: Check for error pointer after calling devm_regmap_init_mmio
    e48b189799d3 ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
    f7d07ad8bc03 media: atmel: atmel-sama7g5-isc: fix ispck leftover
    25b925f94a36 media: bttv: fix WARNING regression on tunerless devices
    e1854a6c3a68 media: imx: imx8mq-mipi_csi2: fix system resume
    72d79cd3c3ad media: imx: imx8mq-mipi-csi2: remove wrong irq config write operation
    0022dc8cafa5 media: mtk-vcodec: potential dereference of null pointer
    48d00e24822e media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
    1fbc023f8173 media: staging: media: imx: imx7-mipi-csis: Make subdev name unique
    74cbe85fa044 media: camss: vfe-170: fix "VFE halt timeout" error
    9af4e473668a media: camss: csid-170: set the right HALT_CMD when disabled
    a3b104487f74 media: camss: csid-170: don't enable unused irqs
    20d5934825b9 media: camss: csid-170: fix non-10bit formats
    0ac903a7bde9 media: staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
    b84343a9d676 pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
    9a24d035c5eb kunit: make kunit_test_timeout compatible with comment
    9ca7b59e7877 drivers/base/memory: add memory block to memory group after registration succeeded
    5bed6c2c1ffe selftests, x86: fix how check_cc.sh is being invoked
    0f42a02e4773 f2fs: fix compressed file start atomic write may cause data corruption
    1a97987f76b4 btrfs: fix unexpected error path when reflinking an inline extent
    2911ad0249c5 f2fs: fix to avoid potential deadlock
    1e0e63ad6243 sched/rt: Plug rt_mutex_setprio() vs push_rt_task() race
    b7aec0843e28 sched/cpuacct: Fix charge percpu cpuusage
    cc91880f0417 nfsd: more robust allocation failure handling in nfsd_file_cache_init
    d1eaaf6caded f2fs: fix missing free nid in f2fs_handle_failed_inode
    ec5884cbbfd3 sched/fair: Improve consistency of allowed NUMA balance calculations
    df5e0a0b3a4e perf/x86/intel/pt: Fix address filter config for 32-bit kernel
    929d8a87f709 perf/core: Fix address filter parser for multiple filters
    3bb11f3f6872 rseq: Remove broken uapi field layout on 32-bit little endian
    d2c741290f7e sched/uclamp: Fix iowait boost escaping uclamp restriction
    6c7276622393 sched/core: Export pelt_thermal_tp
    8bc68c44d97f sched/debug: Remove mpol_get/put and task_lock/unlock from sched_show_numa
    d8c8dd97bb8c f2fs: fix to enable ATGC correctly via gc_idle sysfs interface
    f69aecb49968 watch_queue: Actually free the watch
    695c47cea02b watch_queue: Fix NULL dereference in error cleanup
    109dda451021 io_uring: terminate manual loop iterator loop correctly for non-vecs
    1323976e9448 io_uring: don't check unrelated req->open.how in accept request
    657edec8987a clocksource: acpi_pm: fix return value of __setup handler
    9b181ad309c6 hwmon: (pmbus) Add Vin unit off handling
    41887c82e76f hwrng: nomadik - Change clk_disable to clk_disable_unprepare
    335bf1fc74f7 crypto: ccree - Fix use after free in cc_cipher_exit()
    20550eb187e8 crypto: ccp - ccp_dmaengine_unregister release dma channels
    166b2478152c ACPI: APEI: fix return value of __setup handlers
    bfa4a733aeaa KEYS: trusted: Avoid calling null function trusted_key_exit
    b0efbe7e88c7 KEYS: trusted: Fix trusted key backends when building as module
    d362998e8df9 arm64: prevent instrumentation of bp hardening callbacks
    df04ef63347f clocksource/drivers/timer-of: Check return value of of_iomap in timer_of_base_init()
    abc6b2a12a3e clocksource/drivers/timer-microchip-pit64b: Use notrace
    a81de4315ecf clocksource/drivers/exynos_mct: Handle DTS with higher number of interrupts
    e34ba9ff04ee clocksource/drivers/exynos_mct: Refactor resources allocation
    97e3aaace46e clocksource/drivers/timer-ti-dm: Fix regression from errata i940 fix
    58c9d407ce82 crypto: vmx - add missing dependencies
    f9474039df09 crypto: gemini - call finalize with bh disabled
    6ce48276d736 crypto: amlogic - call finalize with bh disabled
    67bc6890b981 crypto: sun8i-ce - call finalize with bh disabled
    05e13c5e4f8e crypto: sun8i-ss - call finalize with bh disabled
    2684f459f919 hwrng: atmel - disable trng on failure path
    f8a1392c099b spi: spi-zynqmp-gqspi: Handle error for dma_set_mask
    7e45fc93dde2 PM: suspend: fix return value of __setup handler
    d0cd9da501f6 PM: hibernate: fix __setup handler error handling
    efaa0e969261 block: don't delete queue kobject before its children
    b9070c866aa3 nvme: fix the check for duplicate unique identifiers
    2340a15d3914 nvme: cleanup __nvme_check_ids
    a015dd1b8a54 hwmon: (sch56xx-common) Replace WDOG_ACTIVE with WDOG_HW_RUNNING
    3a70165fc788 hwmon: (pmbus) Add mutex to regulator ops
    f2757af27bf3 spi: pxa2xx-pci: Balance reference count for PCI DMA device
    40dba7c26e89 crypto: hisilicon/sec - fix the aead software fallback for engine
    c71e4d45dcc4 crypto: ccree - don't attempt 0 len DMA mappings
    0c366ade8606 EVM: fix the evm= __setup handler return value
    3a10df731516 audit: log AUDIT_TIME_* records only from rules
    8e8724b87afe crypto: rockchip - ECB does not need IV
    4d6e00474872 selftests/sgx: Treat CC as one argument
    d9172393f0f6 selftests/x86: Add validity check and allow field splitting
    e129fb065106 blk-cgroup: set blkg iostat after percpu stat aggregation
    c17eb1586c94 arm64/mm: avoid fixmap race condition when create pud mapping
    8550c9b846c5 stack: Constrain and fix stack offset randomization with Clang builds
    8effc4dc79a5 spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe
    906315cb82d6 spi: tegra114: Add missing IRQ check in tegra_spi_probe
    e6374086f249 crypto: octeontx2 - remove CONFIG_DM_CRYPT check
    9ada174f47b3 thermal: int340x: Check for NULL after calling kmemdup()
    486d4c18f207 selinux: Fix selinux_sb_mnt_opts_compat()
    c111b3c1a257 crypto: mxs-dcp - Fix scatterlist processing
    af3c34eb9410 crypto: authenc - Fix sleep in atomic context in decrypt_tail
    8f10a38c9212 crypto: sun8i-ss - really disable hash on A80
    046f1499aef8 hwrng: cavium - HW_RANDOM_CAVIUM should depend on ARCH_THUNDER
    7919dfd84b35 hwrng: cavium - Check health status while reading random data
    0e67b3e1f93a crypto: ccp - Ensure psp_ret is always init'd in __sev_platform_init_locked()
    01d508417055 selinux: check return value of sel_make_avc_files
    aeeb944e7f91 selinux: access superblock_security_struct in LSM blob way
    ae2ff8d991b6 regulator: qcom_smd: fix for_each_child.cocci warnings
    9bbe88d1023f PCI: xgene: Revert "PCI: xgene: Fix IB window setup"
    920facf23305 PCI: pciehp: Clear cmd_busy bit in polling mode
    86ca87591870 PCI: imx6: Allow to probe when dw_pcie_wait_for_link() fails
    312d3d4f49e1 drm/i915/gem: add missing boundary check in vm_access
    d8b8bd1d03ee drm/i915/opregion: check port number bounds for SWSCI display power state
    2b08e0189b02 brcmfmac: pcie: Fix crashes due to early IRQs
    a7ea6de3bdd5 brcmfmac: pcie: Replace brcmf_pcie_copy_mem_todev with memcpy_toio
    b6957a10747c brcmfmac: pcie: Declare missing firmware files in pcie.c
    a88337a06966 brcmfmac: pcie: Release firmwares in the brcmf_pcie_setup error path
    6e2dfa829026 brcmfmac: firmware: Allocate space for default boardrev in nvram
    51f0af904fb6 drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTFB
    713f1fefb6c6 drm/nouveau/backlight: Just set all backlight types as RAW
    80de94c4ab4e drm/nouveau/backlight: Fix LVDS backlight detection on some laptops
    7585d0f56f29 drm/syncobj: flatten dma_fence_chains on transfer
    85814e6461b8 xtensa: fix xtensa_wsr always writing 0
    821907e8f516 xtensa: fix stop_machine_cpuslocked call in patch_text
    e28bace5e7dc xtensa: define update_mmu_tlb function
    00c6bb4cea62 btrfs: verify the tranisd of the to-be-written dirty extent buffer
    f85ee0c845fd btrfs: extend locking to all space_info members accesses
    68a8120e1647 btrfs: zoned: mark relocation as writing
    2bd666b0fd28 media: davinci: vpif: fix unbalanced runtime PM enable
    12159871e1b4 media: davinci: vpif: fix unbalanced runtime PM get
    992af22dab9c media: venus: venc: Fix h264 8x8 transform control
    d5fcfc4af806 media: venus: hfi_cmds: List HDR10 property as unsupported for v1 and v3
    0a45148635f8 media: gpio-ir-tx: fix transmit with long spaces on Orange Pi PC
    3e3c8d88e0ca DEC: Limit PMAX memory probing to R3k systems
    2039163c30f8 PM: domains: Fix sleep-in-atomic bug caused by genpd_debug_remove()
    74e2d61e4faa bcache: fixup multiple threads crash
    2221a0f6c90c crypto: rsa-pkcs1pad - fix buffer overread in pkcs1pad_verify_complete()
    dc7cacd209c8 crypto: rsa-pkcs1pad - restore signature length check
    5013dbd89101 crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
    9c8d8f87c213 crypto: rsa-pkcs1pad - only allow with rsa
    1290eb4412aa exec: Force single empty string when argv is empty
    d342786a0e94 lib/raid6/test: fix multiple definition linking error
    137c66d5f915 thermal: int340x: Increase bitmap size
    bc5f440e1c5c pstore: Don't use semaphores in always-atomic-context code
    10a15d91bcba carl9170: fix missing bit-wise or operator for tx_params
    1d89cb2c72d6 mgag200 fix memmapsl configuration in GCTL6 register
    bd0cc79722df ARM: dts: exynos: add missing HDMI supplies on SMDK5420
    661016b895e6 ARM: dts: exynos: add missing HDMI supplies on SMDK5250
    d4577ac55725 ARM: dts: exynos: fix UART3 pins configuration in Exynos5250
    cc7c9d207fce ARM: dts: at91: sama5d2: Fix PMERRLOC resource size
    64b3bc9050d8 ARM: dts: at91: sama7g5: Remove unused properties in i2c nodes
    cdcaec46a6b2 rfkill: make new event layout opt-in
    677a5f6c81b5 video: fbdev: atari: Atari 2 bpp (STe) palette bugfix
    46cdbff26c88 video: fbdev: sm712fb: Fix crash in smtcfb_read()
    c894ac44786c fbdev: Hot-unplug firmware fb devices on forced removal
    6e72980d588e drm/edid: check basic audio support on CEA extension block
    2e76c69c85f9 block: don't merge across cgroup boundaries if blkcg is enabled
    6a11b52b498d block: limit request dispatch loop duration
    f1dd8c1186be mailbox: tegra-hsp: Flush whole channel
    3d4b396a616d landlock: Use square brackets around "landlock-ruleset"
    20fbf100f84b samples/landlock: Fix path_list memory leak
    3eb18f8a1d02 drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
    3c65b7309d2e ext4: make mb_optimize_scan performance mount option work with extents
    597393cde841 ext4: fix fs corruption when tring to remove a non-empty directory with IO error
    73fa1798233c ext4: fix ext4_fc_stats trace point
    6cdb84dd0c8d coredump: Also dump first pages of non-executable ELF libraries
    8a7f9d9c3f6a ACPI: properties: Consistently return -ENOENT if there are no more references
    2e2eb55823df Revert "ACPI: Pass the same capabilities to the _OSC regardless of the query flag"
    b6094744e261 ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
    5e3bd996d2c8 arm64: dts: ti: k3-am64: Fix gic-v3 compatible regs
    96181539a521 arm64: dts: ti: k3-j7200: Fix gic-v3 compatible regs
    e931b8494a51 arm64: dts: ti: k3-j721e: Fix gic-v3 compatible regs
    146ad3e0177d arm64: dts: ti: k3-am65: Fix gic-v3 compatible regs
    393a8a0f971e arm64: dts: qcom: sm8250: Fix MSI IRQ for PCIe1 and PCIe2
    a01e1eaf5407 arm64: Do not defer reserve_crashkernel() for platforms with no DMA memory zones
    556e8e0a27c8 arm64: signal: nofpsimd: Do not allocate fp/simd context when not available
    e04a1de51cf6 PCI: fu740: Force 2.5GT/s for initial device probe
    ec5ebfd1ce35 powerpc/kvm: Fix kvm_use_magic_page
    024c2a0db53a drbd: fix potential silent data corruption
    39483fd3b2d2 tracing: Have trace event string test handle zero length strings
    12ea1f73690b dm integrity: set journal entry unused when shrinking device
    737d5e25e28d dm: fix double accounting of flush with data
    dc77afd7491e dm: interlock pending dm_io and dm_wait_for_bios_completion
    0987f00a76a1 dm: fix use-after-free in dm_cleanup_zoned_dev()
    d3444138ff0d dm stats: fix too short end duration_ns when using precise_timestamps
    7d3bd683e084 mm/kmemleak: reset tag when compare object pointer
    7d04d6d5c114 mm,hwpoison: unmap poisoned page before invalidation
    d4835551fd9f Revert "mm: madvise: skip unmapped vma holes passed to process_madvise"
    a07a4b75cccb mm: madvise: return correct bytes advised with process_madvise
    27d96f11b0a2 mm: madvise: skip unmapped vma holes passed to process_madvise
    476df5994878 drm/simpledrm: Add "panel orientation" property on non-upright mounted LCD panels
    7c5312fdb1dc ocfs2: fix crash when mount with quota enabled
    cd2722e411e8 rtc: pl031: fix rtc features null pointer dereference
    8e167fdd4f62 rtc: mc146818-lib: fix locking in mc146818_set_time
    0cc320929ac6 ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020
    7777744e92a0 ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock
    f9f37a956de1 ALSA: hda: Avoid unsol event during RPM suspending
    cf4cd2a5d0ae ALSA: cs4236: fix an incorrect NULL check on list iterator
    39a4bf7d1a23 cifs: fix NULL ptr dereference in smb2_ioctl_query_info()
    f143f8334fb9 cifs: prevent bad output lengths in smb2_ioctl_query_info()
    665cf5507470 Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
    305a5303d1da riscv: Increase stack size under KASAN
    ee29fe27818e riscv: Fix fill_callchain return value
    3c4a1c81900c riscv: dts: canaan: Fix SPI3 bus width
    876a9bdfd9af qed: validate and restrict untrusted VFs vlan promisc mode
    4d8323922ea9 qed: display VF trust config
    59a4bc52f111 scsi: libsas: Fix sas_ata_qc_issue() handling of NCQ NON DATA commands
    cbf4e2f4f700 scsi: scsi_transport_fc: Fix FPIN Link Integrity statistics counters
    64b0fe4808bd scsi: ufs: Fix runtime PM messages never-ending cycle
    6ade94e6afc6 scsi: core: sd: Add silence_suspend flag to suppress some PM messages
    5e217aa2c825 mempolicy: mbind_range() set_policy() after vma_merge()
    3bae72c2db69 mm: invalidate hwpoison page cache page in fault path
    a74bb0eeabcd mm/pages_alloc.c: don't create ZONE_MOVABLE beyond the end of a node
    ab657a29c3e9 mm: fs: fix lru_cache_disabled race in bh_lru
    52ba0ab4f0a6 jffs2: fix memory leak in jffs2_scan_medium
    4392e8aeebc5 jffs2: fix memory leak in jffs2_do_mount_fs
    7a75740206af jffs2: fix use-after-free in jffs2_clear_xattr_subsystem
    f2ce5238904f can: usb_8dev: usb_8dev_start_xmit(): fix double dev_kfree_skb() in error path
    f43e64076ff1 can: m_can: m_can_tx_handler(): fix use after free of skb
    459b19f42fd5 can: ems_usb: ems_usb_start_xmit(): fix double dev_kfree_skb() in error path
    31d7d7f35045 mtd: rawnand: protect access to rawnand devices while in suspend
    7d94d25c7972 spi: mxic: Fix the transmit path
    48254561bd04 net: bnxt_ptp: fix compilation error
    89d369454267 pinctrl: samsung: drop pin banks references on error paths
    1db1639d955b pinctrl: ingenic: Fix regmap on X series SoCs
    025a7ccfb7a5 mm/mlock: fix two bugs in user_shm_lock()
    34afac3c75fa remoteproc: Fix count check in rproc_coredump_write()
    b065f398c860 f2fs: fix to do sanity check on .cp_pack_total_block_count
    f9156db0987f f2fs: quota: fix loop condition at f2fs_quota_sync()
    e98ae961b334 f2fs: fix to unlock page correctly in error path of is_alive()
    303cd6173dce NFSD: prevent integer overflow on 32 bit systems
    614a61e15920 NFSD: prevent underflow in nfssvc_decode_writeargs()
    253a9533941e NFS: NFSv2/v3 clients should never be setting NFS_CAP_XATTR
    518a7d6be1ed SUNRPC: avoid race between mod_timer() and del_timer_sync()
    19c82681db26 HID: intel-ish-hid: Use dma_alloc_coherent for firmware update
    b3e38f939ab4 firmware: sysfb: fix platform-device leak in error path
    0dff5664b867 firmware: stratix10-svc: add missing callback parameter on RSU
    72403d1c04bb Documentation: update stable tree link
    8259235ab46e Documentation: add link to stable release candidate tree
    a1e55db51a88 KEYS: asymmetric: properly validate hash_algo and encoding
    255921f63a9e KEYS: asymmetric: enforce that sig algo matches key algo
    fe8df4489240 KEYS: fix length validation in keyctl_pkey_params_get_2()
    512bde642087 cifs: we do not need a spinlock around the tree access during umount
    2fafbc198613 cifs: fix handlecache and multiuser
    b6d75218ff65 ptrace: Check PTRACE_O_SUSPEND_SECCOMP permission on PTRACE_SEIZE
    42606add50f9 clk: uniphier: Fix fixed-rate initialization
    5aa6d84a0b07 clk: rockchip: re-add rational best approximation algorithm to the fractional divider
    ab67122003b1 greybus: svc: fix an error handling bug in gb_svc_hello()
    9e97f6641c87 iio: inkern: make a best effort on offset calculation
    b378d3f585e3 iio: inkern: apply consumer scale when no channel scale is available
    e38582362101 iio: inkern: apply consumer scale on IIO_VAL_INT cases
    1cb35faea3c3 iio: afe: rescale: use s64 for temporary scale calculations
    c61e2fc87f24 coresight: syscfg: Fix memleak on registration failure in cscfg_create_device
    ba81399402b7 coresight: Fix TRCCONFIGR.QE sysfs interface
    f1d936537155 docs: sphinx/requirements: Limit jinja2<3.1
    c1013a5ba4c9 bus: mhi: Fix MHI DMA structure endianness
    fe66a11af28c bus: mhi: pci_generic: Add mru_default for Quectel EM1xx series
    84bb0ac6c86f mei: avoid iterator usage outside of list_for_each_entry
    6d2ec095176c mei: me: add Alder Lake N device id.
    7c2422748463 mei: me: disable driver on the ign firmware
    f6121a746fae xhci: fix uninitialized string returned by xhci_decode_ctrl_ctx()
    7c2a317703c6 xhci: make xhci_handshake timeout for xhci_reset() adjustable
    4f2ab7e93b37 xhci: fix runtime PM imbalance in USB2 resume
    75bbc2b9748b xhci: fix garbage USBSTS being logged in some cases
    f5dc00496f76 USB: usb-storage: Fix use of bitfields for hardware data in ene_ub6250.c
    c94138ae4000 usb: typec: tipd: Forward plug orientation to typec subsystem
    662893b4f6bd tpm: fix reference counting for struct tpm_chip
    5a0735b0bcf9 virtio-blk: Use blk_validate_block_size() to validate block size
    8a4521456b54 iommu/iova: Improve 32-bit free space estimate
    fe953e0f77e5 drm/amdgpu: only check for _PR3 on dGPUs
    0884abb259f1 drm/amdgpu: move PX checking into amdgpu_device_ip_early_init
    03f836fcb655 locking/lockdep: Avoid potential access of invalid memory in lock_class
    9f93d46a63d5 selftests: vm: fix clang build error multiple output files
    2ea395dc1327 net: dsa: microchip: add spi_device_id tables
    d06ee4572fd9 af_key: add __GFP_ZERO flag for compose_sadb_supported in function pfkey_register
    f868ffd1ead3 Input: zinitix - do not report shadow fingers
    8745973cdfc6 spi: Fix erroneous sgs value with min_t()
    20f46b12162c Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"
    13b570f365b8 net:mcf8390: Use platform_get_irq() to get the interrupt
    526a46a5f479 spi: Fix invalid sgs value
    a28571fcc422 gpio: Revert regression in sysfs-gpio (gpiolib.c)
    cd3121310e33 ethernet: sun: Free the coherent when failing in probing
    afffb79a2dd5 tools/virtio: fix virtio_test execution
    f8f8e96048ad vdpa/mlx5: should verify CTRL_VQ feature exists for MQ
    32aef620e650 virtio_console: break out of buf poll on remove
    3d39860bea5e ARM: mstar: Select HAVE_ARM_ARCH_TIMER
    189bdde30b55 xfrm: fix tunnel model fragmentation behavior
    3a2914bc3e62 HID: Add support for open wheel and no attachment to T300
    a3248ecf0724 HID: logitech-dj: add new lightspeed receiver id
    d5aad7d63b1b hv: utils: add PTP_1588_CLOCK to Kconfig to fix build
    dd84d71bcbcb mm: kfence: fix missing objcg housekeeping for SLAB
    3d7df3f83f67 USB: serial: simple: add Nokia phone driver
    33325a62249e USB: serial: pl2303: fix GS type detection
    1dd64317e785 dt-bindings: usb: hcd: correct usb-device path
    2241e42f6c71 USB: serial: pl2303: add IBM device IDs
    890f78e54b74 Revert "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 079cf4b9edb0a40f40135b7ae761254823051393)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b7949e3b85..d9ec799d7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "29d051cc421a76432897019edc33edae35b16e39"
-SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
+SRCREV_machine ?= "21c75f01103d61c2382d334b3ffbfe99dda7e262"
+SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.32"
+LINUX_VERSION ?= "5.15.33"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 129b70cb24..94911d309d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.32"
+LINUX_VERSION ?= "5.15.33"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
-SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
+SRCREV_machine ?= "ea49628781d5a5e42616c73f0dbf2d02d533f29b"
+SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index cfdce6ea97..8035a87c57 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b6fd1a7dd80a336567fa30c1d674f0d5df9af836"
-SRCREV_machine:qemuarm64 ?= "387a676543764b59e38cf6b13d6474846fb07d78"
-SRCREV_machine:qemumips ?= "7c084cf3a700f7a2c68c8909501f4d35b3215e40"
-SRCREV_machine:qemuppc ?= "239f7c8f37bf9ade16325101df3c06a485ccc74e"
-SRCREV_machine:qemuriscv64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_machine:qemuriscv32 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_machine:qemux86 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_machine:qemux86-64 ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_machine:qemumips64 ?= "a4805fe749c9c56d18a60b5378674760ef0e85ed"
-SRCREV_machine ?= "c9f3902d8069e32a8928153a38d8f6115194d128"
-SRCREV_meta ?= "20dcef879138eeb57347b35d2250a432ee23d927"
+SRCREV_machine:qemuarm ?= "43ff86b464fcc7b5050a727052321c11aeae68ab"
+SRCREV_machine:qemuarm64 ?= "2f91a381a2c207975c082737b94f18e908e94243"
+SRCREV_machine:qemumips ?= "f2bb2fd873acd46e19acaafcd64b0f3e81afb979"
+SRCREV_machine:qemuppc ?= "2d8f15356671a566aac072dadbb9757046fc8acc"
+SRCREV_machine:qemuriscv64 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_machine:qemuriscv32 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_machine:qemux86 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_machine:qemux86-64 ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_machine:qemumips64 ?= "6aa2697e458c5a67404566ddbb3027a48593a7bc"
+SRCREV_machine ?= "2fa9f5b7eded592b4a38e505f914971e48601e00"
+SRCREV_meta ?= "34f5ef44b9aca6708c44d0fb652ec9a4ccc2d13b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e29be6724adbc9c3126d2a9550ec21f927f22f6d"
+SRCREV_machine:class-devupstream ?= "06f50ca83ace219cb72213369d2be05bb0dd337e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.32"
+LINUX_VERSION ?= "5.15.33"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


