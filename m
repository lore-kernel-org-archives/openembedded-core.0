Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A1EC04FFE
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.3999.1714704045466445194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+/Z0MBq;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-de45dba157cso8080079276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704044; x=1715308844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZTwG/ntok8beJA87fxO7/IxaMJdFaHbo4gTFhku/hU=;
        b=Q+/Z0MBq8l497kDwdMiGcafiBYpxFmd6lTywzgUxxmESbbrvB6bBeuxNuGnonHdmwQ
         gPz1fqLz19ZjNvQC2kU1lEchXzcxUm4vhD9eSRTbBfi/5rfpH7aXOfgi3vODR3tj5l3w
         NOp6PJbLYB3kmA7D8V38OotcRtjTQGDPUraQML6t82rQMs6T7lBa8Z9ynfp26BEvKxAc
         4EhQCn3mfzOVZTSdanTPSPxfFKVGzl1cqA/kCEpj+NQHmmc8DCvOxvHXZqrjhT/jKM95
         okpdPQ+hnoxq8+wFJeZyN3mVgCATaaopchFVvKYyBdhOJYZyYLC9fwijGGK/tUi8NnoZ
         /n7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704044; x=1715308844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZTwG/ntok8beJA87fxO7/IxaMJdFaHbo4gTFhku/hU=;
        b=S3VIJ871Si8dU42R1DlGif7F4Vm+eaOrPa/vibN2BdU16cNbCr5ADGHeMEy+ZzEHTR
         Q9UjE9TeuYMRb+YKuLwm3d+aOLGP6ijFpsPG8ZvQt/6Pli59cnRtfBhL0y/jmBxO70Lf
         LfK00zDL9tpjgeMoupiMCbFa103bQDce8GpCm9hi2bEeq/N9e+ZvZpmsVi2NojYed6An
         PN6rVxkDtm6u7k1XIJcQgMKRZ1sHX7YudL97oDQUl3f3SnWnR4wV1ojEnqLQaK3nZGbu
         weedEaKKodZ0FImRWtfDyk42YgbBEBm/cZn+pZWkhQzwYjL67YWwfENN11ZQCTEV4dM6
         Z7Mg==
X-Gm-Message-State: AOJu0YyY32URHatpfHdrzS0luy38Nzw9PcByC3E0VC4dLVueq+msQ2ge
	6MLVcrpd9GqMfzQ583TJmoJXurH42L4pWh25NOVmkpsNJfOWQt7GyQFACg==
X-Google-Smtp-Source: AGHT+IGRbBIsCdeGPBj7tn8NFalaebhxSv6CJBNPV1vQhY8dbQ/LbTXtrngPWRnOL0ky7IcSHcDJxA==
X-Received: by 2002:a25:80cd:0:b0:dcf:411f:e78 with SMTP id c13-20020a2580cd000000b00dcf411f0e78mr1719394ybm.25.1714704044041;
        Thu, 02 May 2024 19:40:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] linux-yocto/6.6: update to v6.6.24
Date: Thu,  2 May 2024 22:40:29 -0400
Message-Id: <4099f83b6ae501d60ce67b60ab2fecd91593de36.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198932

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    9467d7a12f97 Linux 6.6.24
    e87e08c94c95 drm/amdgpu: fix use-after-free bug
    3a9569441b47 tools/resolve_btfids: fix build with musl libc
    4338e40da808 x86/sev: Skip ROM range scans and validation for SEV-SNP guests
    2048ff503f43 scsi: libsas: Fix disk not being scanned in after being removed
    f23db7579283 scsi: libsas: Add a helper sas_get_sas_addr_and_dev_type()
    76edb986c44b scsi: lpfc: Correct size for wqe for memset()
    ac5b18f52858 scsi: lpfc: Correct size for cmdwqe/rspwqe for memset()
    ff3cdff7c897 usb: dwc3: pci: Drop duplicate ID
    70977e7d5e5f Revert "x86/bugs: Use fixed addressing for VERW operand"
    367b4ce0d74d x86/bugs: Use fixed addressing for VERW operand
    a492d6dad9af scsi: qla2xxx: Delay I/O Abort on PCI error
    29520a334f3e scsi: qla2xxx: Change debug message during driver unload
    f85af9f1aa5e scsi: qla2xxx: Fix double free of fcport
    f14cee7a882c scsi: qla2xxx: Fix double free of the ha->vp_map pointer
    8de1584ec4fe scsi: qla2xxx: Fix command flush on cable pull
    adc9702642a0 scsi: qla2xxx: NVME|FCP prefer flag not being honored
    b31a120b81ac scsi: qla2xxx: Update manufacturer detail
    be895682c507 scsi: qla2xxx: Split FCE|EFT trace control
    8ec0d55020f6 scsi: qla2xxx: Fix N2N stuck connection
    ef23850940d9 scsi: qla2xxx: Prevent command send on chip reset
    db4aaf281a5b usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE before reset
    1f510af8dbc3 usb: typec: ucsi_acpi: Refactor and fix DELL quirk
    5857494b5056 usb: typec: ucsi: Ack unsupported commands
    68f57d013827 usb: typec: ucsi: Clear EVENT_PENDING under PPM lock
    c708b704c26d usb: typec: Return size of buffer if pd_set operation succeeds
    99731076722e usb: udc: remove warning when queue disabled ep
    3e417f31b06a usb: dwc2: gadget: LPM flow fix
    f047361fee44 usb: dwc2: gadget: Fix exiting from clock gating
    8d310e5d702c usb: dwc2: host: Fix ISOC flow in DDMA mode
    96dff759ef7d usb: dwc2: host: Fix hibernation flow
    ba2951ec82e8 usb: dwc2: host: Fix remote wakeup from hibernation
    f51849833705 USB: core: Fix deadlock in port "disable" sysfs attribute
    8dbc001bba86 USB: core: Add hub_get() and hub_put() routines
    122a06f1068b USB: core: Fix deadlock in usb_deauthorize_interface()
    fd2304f4c0ae usb: dwc3: Properly set system wakeup
    d12af9a1c59e staging: vc04_services: fix information leak in create_component()
    98592a49956c staging: vc04_services: changen strncpy() to strscpy_pad()
    d4c34782b6d7 scsi: core: Fix unremoved procfs host directory regression
    a1f506af7ffe scsi: sd: Fix TCG OPAL unlock on system resume
    61d4787692c1 ALSA: sh: aica: reorder cleanup operations to avoid UAF bugs
    66aa5d95ea8c vfio/pds: Make sure migration file isn't accessed after reset
    2ceddecdd0ef drm/amd/display: Clear OPTC mem select on disable
    6a1cb68b9810 drm/amd/display: Disconnect phantom pipe OPP from OPTC being disabled
    ae62f1dde66a drm/amd/display: Fix hang/underflow when transitioning to ODM4:1
    ce748df0d570 USB: UAS: return ENODEV when submit urbs fail with device not attached
    da3b75931bb7 usb: cdc-wdm: close race between read and workqueue
    56c5145baef5 Revert "usb: phy: generic: Get the vbus supply"
    9c74507e6c43 mtd: spinand: Add support for 5-byte IDs
    9ae3954dd36b Bluetooth: hci_sync: Fix not checking error on hci_cmd_sync_cancel_sync
    3b031e4fcb27 drm/i915/gt: Reset queue_priority_hint on parking
    07c011e3351d drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()
    69fa0e23a6a3 drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, mostly
    a891add409e3 drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode()
    510c5f5e4837 drm/i915/hwmon: Fix locking inversion in sysfs getter
    197f6d6987c5 drm/amdgpu: fix deadlock while reading mqd from debugfs
    2684393685f7 drm/amdkfd: fix TLB flush after unmap for GFX9.4.2
    042ef0afc40f drm/vmwgfx: Create debugfs ttm_resource_manager entry only if needed
    476eed5f1c22 net: ll_temac: platform_get_resource replaced by wrong function
    2a84744a037b nouveau/dmem: handle kcalloc() allocation failure
    be4f3af178cb thermal: devfreq_cooling: Fix perf state when calculate dfc res_util
    cc80b5d7fbef block: Do not force full zone append completion in req_bio_endio()
    152799126327 sdhci-of-dwcmshc: disable PM runtime in dwcmshc_remove()
    4466677dcabe mmc: core: Avoid negative index with array access
    35ee8529eee7 mmc: core: Initialize mmc_blk_ioc_data
    6810ebeb0975 mmc: sdhci-omap: re-tuning is needed after a pm transition to support emmc HS200 mode
    07cf57eba52f selftests/mm: fix ARM related issue with fork after pthread_create
    fe295de2d564 selftests/mm: sigbus-wp test requires UFFD_FEATURE_WP_HUGETLBFS_SHMEM
    b79f9e1ff27c mm: cachestat: fix two shmem bugs
    2e2f7a576b13 hexagon: vmlinux.lds.S: handle attributes section
    c3639d87286a exec: Fix NOMMU linux_binprm::exec in transfer_args_to_stack()
    78516979792d Revert "drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR"
    566e540b404f wifi: iwlwifi: fw: don't always use FW dump trig
    3d7ac0250714 wifi: iwlwifi: mvm: disable MLO for the time being
    6956ba7da71b wifi: cfg80211: add a flag to disable wireless extensions
    6b948b54c8bd wifi: mac80211: check/clear fast rx for non-4addr sta VLAN changes
    8ca8aac42bf7 btrfs: zoned: use zone aware sb location for scrub
    7b5029e3f1b6 btrfs: zoned: don't skip block groups with 100% zone unusable
    0427c8ef8bbb btrfs: fix race in read_extent_buffer_pages()
    c7077f43f30d tmpfs: fix race on handling dquot rbtree
    907efa8839cd ARM: prctl: reject PR_SET_MDWE on pre-ARMv6
    a0071e3b0c24 prctl: generalize PR_SET_MDWE support check to be per-arch
    5110da79d7d6 x86/efistub: Reinstate soft limit for initrd loading
    90048007daea efi/libstub: Cast away type warning in use of max()
    01666eece40e x86/efistub: Add missing boot_params for mixed mode compat entry
    32e4750262e0 init: open /initrd.image with O_LARGEFILE
    3f59182bcb4d ALSA: hda/tas2781: add locks to kcontrols
    b999e77ecf3a ALSA: hda/tas2781: remove digital gain kcontrol
    11b4dc6494b5 perf top: Use evsel's cpus to replace user_requested_cpus
    78142322a1c3 selftests/mm: Fix build with _FORTIFY_SOURCE
    ccf2d9d2ae95 selftests/mm: gup_test: conform test to TAP format output
    674545b4852c pwm: img: fix pwm clock lookup
    9114ba998750 efi: fix panic in kdump kernel
    1acbca933313 x86/fpu: Keep xfd_state in sync with MSR_IA32_XFD
    bebb5af001dc x86/mpparse: Register APIC address only once
    31a6a791b046 efi/libstub: fix efi_random_alloc() to allocate memory at alloc_min or higher address
    f13edd1871d4 kprobes/x86: Use copy_from_kernel_nofault() to read from unsafe address
    455b94f95e49 irqchip/renesas-rzg2l: Prevent spurious interrupts when setting trigger type
    e9b18e99938b irqchip/renesas-rzg2l: Rename rzg2l_irq_eoi()
    ddec478fb711 irqchip/renesas-rzg2l: Rename rzg2l_tint_eoi()
    ec5482d22c67 irqchip/renesas-rzg2l: Add macro to retrieve TITSR register offset based on register's index
    9913a07850e0 irqchip/renesas-rzg2l: Flush posted write in irq_eoi()
    c15a37e3f162 irqchip/renesas-rzg2l: Implement restriction when writing ISCR register
    ea4c338cfefa printk: Update @console_may_schedule in console_trylock_spinning()
    e07a16e6f5b1 iommu/dma: Force swiotlb_max_mapping_size on an untrusted device
    c803069d4845 swiotlb: Fix alignment checks when both allocation and DMA masks are present
    ae2f8dbe921e swiotlb: Honour dma_alloc_coherent() alignment in swiotlb_alloc()
    3e7acd6e25ba swiotlb: Fix double-allocation of slots due to broken alignment handling
    4da463081026 entry: Respect changes to system call number by trace_sys_enter()
    0c027c2bad7f ARM: 9359/1: flush: check if the folio is reserved for no-mapping addresses
    66689127f1a7 ARM: 9352/1: iwmmxt: Remove support for PJ4/PJ4B cores
    df13f43686f3 clocksource/drivers/arm_global_timer: Fix maximum prescaler value
    0982fd6bf0b8 x86/sev: Fix position dependent variable references in startup code
    ecd16da39d44 x86/Kconfig: Remove CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT
    ee0bd4ad780d vfio/fsl-mc: Block calling interrupt handler without trigger
    62d4e43a569b vfio/platform: Create persistent IRQ handlers
    69276a555c74 vfio/pci: Create persistent INTx handler
    2ee432d74043 vfio: Introduce interface to flush virqfd inject workqueue
    ded566b4637f btrfs: fix deadlock with fiemap and extent locking
    ea01221f95f3 xfs: remove conditional building of rt geometry validator functions
    9efd84260f47 xfs: reset XFS_ATTR_INCOMPLETE filter on node removal
    69252ab1d566 xfs: update dir3 leaf block metadata after swap
    264e3509590c xfs: ensure logflagsp is initialized in xfs_bmap_del_extent_real
    8a4566795552 xfs: fix perag leak when growfs fails
    59b115a7e802 xfs: add lock protection when remove perag from radix tree
    c4848932911b xfs: short circuit xfs_growfs_data_private() if delta is zero
    47604cf2b803 xfs: initialise di_crc in xfs_log_dinode
    b9358db0a811 xfs: add missing nrext64 inode flag check to scrub
    1a48327c9e5a xfs: force all buffers to be written during btree bulk load
    7bc086bbc977 xfs: fix an off-by-one error in xreap_agextent_binval
    84cd4f79b4ce xfs: recompute growfsrtfree transaction reservation while growing rt volume
    d6b65ed1cc5f xfs: remove unused fields from struct xbtree_ifakeroot
    fb6e584e7471 xfs: make xchk_iget safer in the presence of corrupt inode btrees
    3f6308034432 xfs: don't allow overly small or large realtime volumes
    89e511a745be xfs: fix 32-bit truncation in xfs_compute_rextslog
    0a31f1e8d8c6 xfs: make rextslog computation consistent with mkfs
    680776e555f3 xfs: transfer recovered intent item ownership in ->iop_recover
    87db24c8edd3 xfs: pass the xfs_defer_pending object to iop_recover
    cd3c2cf35f7c xfs: use xfs_defer_pending objects to recover intent items
    c0231292d059 xfs: don't leak recovered attri intent items
    08bac45e02c6 xfs: consider minlen sized extents in xfs_rtallocate_extent_block
    57a20b6150d3 xfs: convert rt bitmap extent lengths to xfs_rtbxlen_t
    1a6d63f2418c xfs: move the xfs_rtbitmap.c declarations to xfs_rtbitmap.h
    648b41f28181 wifi: rtw88: 8821cu: Fix connection failure
    9fe75ad3c7e8 wifi: iwlwifi: pcie: fix RB status reading
    3d0a7b23d688 ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
    930775060ca3 x86/efistub: Call mixed mode boot services on the firmware's stack
    23b99c7bf6ec drm/amd/display: handle range offsets in VRR ranges
    e21fee1035b9 drm/i915: Don't explode when the dig port we don't have an AUX CH
    60b9d1887a35 iio: imu: inv_mpu6050: fix FIFO parsing when empty
    3df5e345d6b4 iio: imu: inv_mpu6050: fix frequency setting when chip is off
    d017ec50fac9 i2c: i801: Avoid potential double call to gpiod_remove_lookup_table
    21e985684216 iio: accel: adxl367: fix I2C FIFO data register
    73d42ed41182 iio: accel: adxl367: fix DEVID read after reset
    d97be07a0027 arm64: dts: qcom: sc8280xp-x13s: limit pcie4 link speed
    27cd25e3b3bc mm, vmscan: prevent infinite loop for costly GFP_NOIO | __GFP_RETRY_MAYFAIL allocations
    b1c10caf752c ARM: imx_v6_v7_defconfig: Restore CONFIG_BACKLIGHT_CLASS_DEVICE
    520f79c110ff tee: optee: Fix kernel panic caused by incorrect error handling
    bccaba16db96 ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook
    6971e0592314 ALSA: hda/realtek - Add Headset Mic supported Acer NB platform
    c01ed748847f fs/aio: Check IOCB_AIO_RW before the struct aio_kiocb conversion
    ed56f3cfbe6f Revert "tty: serial: simplify qcom_geni_serial_send_chunk_fifo()"
    7529cbd8b5f6 vt: fix unicode buffer corruption when deleting characters
    68b988933885 mei: me: add arrow lake point H DID
    e86a87a4bea8 mei: me: add arrow lake point S DID
    434beb66368d serial: port: Don't suspend if the port is still busy
    a62a30ccf721 misc: fastrpc: Pass proper arguments to scm call
    997ca4153846 misc: lis3lv02d_i2c: Fix regulators getting en-/dis-abled twice on suspend/resume
    16eac1126d6a tty: serial: fsl_lpuart: avoid idle preamble pending if CTS is enabled
    cc31dba9afa6 xhci: Fix failure to detect ring expansion need.
    a4eff9198449 usb: port: Don't try to peer unused USB ports based on location
    a0f77b5d6067 usb: gadget: ncm: Fix handling of zero block length packets
    4a22aeac24d0 usb: typec: altmodes/displayport: create sysfs nodes as driver's default device attribute group
    871fd7b10b56 USB: usb-storage: Prevent divide-by-0 error in isd200_ata_command
    a125ee2c06b0 ALSA: hda/realtek - Fix headset Mic no show at resume back for Lenovo ALC897 platform
    a30c36bc0cfc drm/i915: Check before removing mm notifier
    24b5eff43ec2 tty: serial: imx: Fix broken RS485
    6f3c1dabe8d0 drm/amdgpu/pm: Fix the error of pwm1_enable setting
    274f0b1a6b97 tracing: Use .flush() call to wake up readers
    4577036353fa SEV: disable SEV-ES DebugSwap by default
    12f8e32a5a38 KVM: SVM: Flush pages under kvm->lock to fix UAF in svm_register_enc_region()
    9d1b22e573a3 KVM: x86: Mark target gfn of emulated atomic instruction as dirty
    43c70cbc2502 firewire: ohci: prevent leak of left-over IRQ on unbind
    a5b60c8b9a9e init/Kconfig: lower GCC version check for -Warray-bounds
    4c9f70c73ddb Input: xpad - add additional HyperX Controller Identifiers
    d9f400dc3e89 cgroup/cpuset: Fix retval in update_cpumask()
    0f952b1bb048 usb: typec: tpcm: Fix PORT_RESET behavior for self powered devices
    bae5b98dcf63 selftests: mptcp: diag: return KSFT_FAIL not test_cnt
    b93494329656 mm, mmap: fix vma_merge() case 7 with vma_ops->close
    b475226733f1 xfrm: Avoid clang fortify warning in copy_to_user_tmpl()
    dc60b25540c8 crypto: sun8i-ce - Fix use after free in unprepare
    48dd260fdb72 crypto: rk3288 - Fix use after free in unprepare
    c288a61a48dd drm/nouveau: fix stale locked mutex in nouveau_gem_ioctl_pushbuf
    6887314f5356 nouveau: lock the client object tree.
    ba29cffccfea Drivers: hv: vmbus: Calculate ring buffer size for more efficient use of memory
    7332d7389b5e netfilter: nf_tables: reject constant set with timeout
    c0c2176d1814 netfilter: nf_tables: disallow anonymous set with timeout flag
    b2d6f9a5b1cf netfilter: nf_tables: mark set as dead when unbinding anonymous set with timeout
    56712f74b704 net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    95232806972a drm/amd/display: Use freesync when `DRM_EDID_FEATURE_CONTINUOUS_FREQ` found
    8b934390272d workqueue: Shorten events_freezable_power_efficient name
    47ccb849a023 drm/bridge: lt8912b: do not return negative values from .get_modes()
    d5a81e981769 drm/bridge: lt8912b: clear the EDID property on failures
    a7d980a9f70e drm/bridge: lt8912b: use drm_bridge_edid_read()
    2b6aaf7b193b drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
    de125efb3bae drm/ttm: Make sure the mapped tt pages are decrypted when needed
    0436d691d216 wifi: brcmfmac: Demote vendor-specific attach/detach messages to info
    8d59a64cbec8 wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
    47b563297a48 wifi: brcmfmac: add per-vendor feature detection callback
    73520eeea49d x86/pm: Work around false positive kmemleak report in msr_build_context()
    e50f83061ac2 dm snapshot: fix lockup in dm_exception_table_exit
    066bbc430644 drm/amd/display: Fix noise issue on HDMI AV mute
    c7c855fd3d5a drm/amd/display: Return the correct HDCP error code
    6fcd12cb9088 drm/amdgpu: amdgpu_ttm_gart_bind set gtt bound flag
    4992f44a3b05 ahci: asm1064: asm1166: don't limit reported ports
    836af9a25b2d ahci: asm1064: correct count of reported ports
    49391e9f1e14 wireguard: selftests: set RISCV_ISA_FALLBACK on riscv{32,64}
    c991567e6c63 wireguard: netlink: access device through ctx instead of peer
    13d107794304 wireguard: netlink: check for dangling peer via is_dead instead of empty list
    7f1005dd39d2 LoongArch/crypto: Clean up useless assignment operations
    d7d7c6cdea87 LoongArch: Define the __io_aw() hook as mmiowb()
    f3f5d7a5049d LoongArch: Change __my_cpu_offset definition to avoid mis-optimization
    3d26a2d80181 virtio: reenable config if freezing device failed
    8a2e2336b8cf cxl/trace: Properly initialize cxl_poison region name
    a66885b840d6 net: hns3: tracing: fix hclgevf trace event strings
    9aa7a53c4733 drm/i915: Add missing ; to __assign_str() macros in tracepoint code
    6244036a07ae NFSD: Fix nfsd_clid_class use of __string_len() macro
    8291b4eac429 net: esp: fix bad handling of pages from page_pool
    d0caabe6fe76 x86/CPU/AMD: Update the Zenbleed microcode revisions
    f8a2a55a0b82 cpufreq: dt: always allocate zeroed cpumask
    037414669414 mtd: rawnand: Constrain even more when continuous reads are enabled
    26a4eee38f8c mtd: rawnand: Fix and simplify again the continuous read derivations
    da2911798f25 cifs: open_cached_dir(): add FILE_READ_EA to desired access
    997b0c26d3fa cifs: reduce warning log level for server not advertising interfaces
    0845cb6bbf15 cifs: make cifs_chan_update_iface() a void function
    4501f9cd36c1 cifs: delete unnecessary NULL checks in cifs_chan_update_iface()
    db3a3e6fa33e cifs: do not let cifs_chan_update_iface deallocate channels
    66c2940c9614 cifs: make sure server interfaces are requested only for SMB3+
    407ced4e770e cifs: add xid to query server interface call
    0c8aa4cfda4e nilfs2: prevent kernel bug at submit_bh_wbc()
    f69e81396aea nilfs2: fix failure to detect DAT corruption in btree and direct mappings
    6966586c2f77 f2fs: truncate page cache before clearing flags when aborting atomic write
    99d1fd81d341 f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag
    9a31f4b61448 Revert "block/mq-deadline: use correct way to throttling write requests"
    f1d93b2a010c memtest: use {READ,WRITE}_ONCE in memory scanning
    b483eff0bd19 drm/vc4: hdmi: do not return negative values from .get_modes()
    fd79a093bb23 drm/imx/ipuv3: do not return negative values from .get_modes()
    b71ae5fb2dd3 drm/exynos: do not return negative values from .get_modes()
    a686732df6ce drm/panel: do not return negative error codes from drm_panel_get_modes()
    12bbe2c25cdb drm/probe-helper: warn about negative .get_modes()
    a64ab862e84e s390/zcrypt: fix reference counting on zcrypt card objects
    54d26adf64c0 soc: fsl: qbman: Use raw spinlock for cgr_lock
    0e6521b0f93f soc: fsl: qbman: Always disable interrupts when taking cgr_lock
    700ed41bf63e dlm: fix user space lkb refcounting
    b31301a1fa61 ring-buffer: Use wait_event_interruptible() in ring_buffer_wait()
    7bcd58e8096a ring-buffer: Fix full_waiters_pending in poll
    b87a7e108e6d ring-buffer: Fix resetting of shortest_full
    73dae1a5d489 ring-buffer: Do not set shortest_full when full target is hit
    b82dbe74ee31 ring-buffer: Fix waking up ring buffer readers
    1241052e158d io_uring: clean rings on NO_MMAP alloc fail
    e8fc78a1c70f platform/x86/intel/tpmi: Change vsec offset to u64
    ed3fb2e2fe87 ksmbd: retrieve number of blocks using vfs_getattr in set_file_allocation_info
    c8f7ad2df083 ksmbd: replace generic_fillattr with vfs_getattr
    ef309589f01c server: convert to new timestamp accessors
    1d7317d5b636 tpm,tpm_tis: Avoid warning splat at shutdown
    74c564b7f008 vfio/platform: Disable virqfds on cleanup
    04a4a017b9ff vfio/pci: Lock external INTx masking ops
    2a4a666c4510 vfio/pci: Disable auto-enable of exclusive INTx IRQ
    fe750e274442 thermal/drivers/mediatek: Fix control buffer enablement on MT7896
    7e8cffa4f85e cifs: allow changing password during remount
    9179aa27039a cifs: prevent updating file size from server if we have a read/write lease
    b9e741ac2b7c smb: client: stop revalidating reparse points unnecessarily
    db5f1f1fb8c1 PCI: hv: Fix ring buffer size calculation
    cebb4baed803 PCI: dwc: endpoint: Fix advertised resizable BAR size
    7aeca6f44cb6 PCI: qcom: Enable BDF to SID translation properly
    52f86f3e091c kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1
    71739da67085 NFS: Read unlock folio on nfs_page_create_from_folio() error
    e25447c35f87 nfs: fix UAF in direct writes
    7293dd0bd34a sparc32: Fix parport build with sparc32
    0f314c3be7d9 io_uring: fix mshot io-wq checks
    f55ecbd9a78c io_uring/net: correctly handle multishot recvmsg retry setup
    1a6efd4c286c PCI/AER: Block runtime suspend when handling errors
    cc3519b818c1 speakup: Fix 8bit characters from direct synth
    a973ef25f144 usb: gadget: tegra-xudc: Fix USB3 PHY retrieval logic
    3dd6e0faa75d phy: tegra: xusb: Add API to retrieve the port number of phy
    0ef9d78ba7e7 slimbus: core: Remove usage of the deprecated ida_simple_xx() API
    63c7a5cf228e nvmem: meson-efuse: fix function pointer type mismatch
    37b6a3ba793b ext4: fix corruption during on-line resize
    27715371c162 hwmon: (amc6821) add of_match table
    100d83b0da07 landlock: Warn once if a Landlock action is requested while disabled
    bc8e5fda787b drm/etnaviv: Restore some id values
    10f2af1af8ab leds: trigger: netdev: Fix kernel panic on interface rename trig notify
    d4e2365b07f1 Bluetooth: btnxpuart: Fix btnxpuart_close
    985edff78e80 mmc: core: Fix switch on gp3 partition
    0f98f6d2fb5f mm: swap: fix race between free_swap_and_cache() and swapoff()
    20d3e1c8a184 mac802154: fix llsec key resources release in mac802154_llsec_key_del
    7d3765550374 block: Fix page refcounts for unaligned buffers in __bio_release_pages()
    653d51504f41 powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
    dc9702acfb4f dm-raid: fix lockdep waring in "pers->hot_add_disk"
    31ead1845c37 PCI/DPC: Quirk PIO log size for Intel Raptor Lake Root Ports
    d86ad8c3e152 PCI/PM: Drain runtime-idle callbacks before driver removal
    0bfe6b29d6ac wifi: rtw88: Add missing VID/PIDs for 8811CU and 8821CU
    51dad05f1835 btrfs: fix off-by-one chunk length calculation at contains_pending_extent()
    40a24160cf3c btrfs: qgroup: always free reserved space for extent records
    4cc3e2ed6759 serial: Lock console when calling into driver before registration
    6f12c54fa09d serial: core: only stop transmit when HW fifo is empty
    1846bd4fc1bb usb: dwc3-am62: Disable wakeup at remove
    7dfed9855397 usb: dwc3-am62: fix module unload/reload behavior
    4a1f0678d15e usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
    8b86779ade3a fuse: don't unhash root
    777ba18929b5 fuse: fix root lookup with nonzero generation
    3d304dd6b29d fuse: replace remaining make_bad_inode() with fuse_make_bad()
    bd169abd394e mmc: tmio: avoid concurrent runs of mmc_request_done()
    677aa47e3e43 PM: sleep: wakeirq: fix wake irq warning in system suspend
    3c3df979e9b7 USB: serial: cp210x: add pid/vid for TDK NC0110013M and MM0110113M
    28f719670f00 KVM: x86/xen: inject vCPU upcall vector when local APIC is enabled
    5cf342a13d49 USB: serial: option: add MeiG Smart SLM320 product
    07a8b301818f USB: serial: cp210x: add ID for MGP Instruments PDS100
    515159ca62a8 USB: serial: add device ID for VeriFone adapter
    58bb229d9714 USB: serial: ftdi_sio: add support for GMC Z216C Adapter IR-USB
    816ae3cf3dcb powerpc/fsl: Fix mfpmr build errors with newer binutils
    620b6cf2f1a2 usb: xhci: Add error handling in xhci_map_urb_for_dma
    7e9926fef71e clk: qcom: mmcc-msm8974: fix terminating of frequency table arrays
    9b4c4546dd61 clk: qcom: mmcc-apq8084: fix terminating of frequency table arrays
    0204247cf366 clk: qcom: gcc-ipq9574: fix terminating of frequency table arrays
    b6b31b4c67ea clk: qcom: gcc-ipq8074: fix terminating of frequency table arrays
    421b135aceac clk: qcom: gcc-ipq6018: fix terminating of frequency table arrays
    b0cf3d200e8a clk: qcom: gcc-ipq5018: fix terminating of frequency table arrays
    245c318cdad0 vfio/pds: Always clear the save/restore FDs on reset
    35c1cdd504a3 PM: suspend: Set mem_sleep_current during kernel command line setup
    ed87a423756a cpufreq: Limit resolving a frequency to policy min/max
    66e2c41b0c80 docs: Restore "smart quotes" for quotes
    f77c8c1603bb iio: adc: rockchip_saradc: use mask for write_enable bitfield
    7ed675cfaf51 iio: adc: rockchip_saradc: fix bitmask for channels on SARADCv2
    8ec4a68a25a2 md/raid5: fix atomicity violation in raid5_cache_count
    644604e6f014 parisc: Strip upper 32 bit of sum in csum_ipv6_magic for 64-bit builds
    d4b71ff9c918 parisc: Fix csum_ipv6_magic on 64-bit systems
    cabe3343acce parisc: Fix csum_ipv6_magic on 32-bit systems
    d31c8d0ca8bf parisc: Fix ip_fast_csum
    6bd42452713e parisc: Avoid clobbering the C/B bits in the PSW with tophys and tovirt macros
    51408b47f8af parisc/unaligned: Rewrite 64-bit inline assembly of emulate_ldd()
    f9f67e87e4b7 x86/nmi: Fix the inverse "in NMI handler" check
    736ad6c577a3 md/md-bitmap: fix incorrect usage for sb_index
    d8ea3e788b5a mtd: rawnand: meson: fix scrambling mode value in command macro
    1a3487cdf8dc ubi: correct the calculation of fastmap size
    d1b505c988b7 ubi: Check for too small LEB size in VTBL code
    fc99f4e2d2f1 ubifs: Set page uptodate in the correct place
    ab8f9df10694 fuse: fix VM_MAYSHARE and direct_io_allow_mmap
    03a7e3f2ba3c fat: fix uninitialized field in nostale filehandles
    b46c822f8b55 bounds: support non-power-of-two CONFIG_NR_CPUS
    d6e646b86085 kasan/test: avoid gcc warning for intentional overflow
    fe86d01ce7db block: Clear zone limits for a non-zoned stacked queue
    ba191200a1ae ext4: correct best extent lstart adjustment logic
    9a06d17abc16 selftests/mqueue: Set timeout to 180 seconds
    8a5a7611ccc7 crypto: qat - resolve race condition during AER recovery
    e8ac80031809 sparc: vDSO: fix return value of __setup handler
    61798d3cb53a sparc64: NMI watchdog: fix return value of __setup handler
    a0b9f4f8e22b powerpc/smp: Increase nr_cpu_ids to include the boot CPU
    68a9c41f0167 powerpc/smp: Adjust nr_cpu_ids to cover all threads of a core
    7f6282665dd7 powercap: intel_rapl_tpmi: Fix System Domain probing
    b5cbb42fb658 powercap: intel_rapl_tpmi: Fix a register bug
    d6c83ee705a1 powercap: intel_rapl: Fix locking in TPMI RAPL
    c4c2f7e672e7 sched: Simplify tg_set_cfs_bandwidth()
    0641908b906a powercap: intel_rapl: Fix a NULL pointer dereference
    9df6a7a3c951 thermal/intel: Fix intel_tcc_get_temp() to support negative CPU temperature
    868e3264f236 cpufreq: amd-pstate: Fix min_perf assignment in amd_pstate_adjust_perf()
    e056484f189b arm64: dts: qcom: sm8550-mtp: correct WCD9385 TX port mapping
    6eacb2ec2e79 arm64: dts: qcom: sm8550-qrd: correct WCD9385 TX port mapping
    a75afe480d43 KVM: Always flush async #PF workqueue when vCPU is being destroyed
    88efc3095b6d media: nxp: imx8-isi: Mark all crossbar sink pads as MUST_CONNECT
    d0e3440dab0d media: mc: Expand MUST_CONNECT flag to always require an enabled link
    3b6ccc91dcc4 media: mc: Rename pad variable to clarify intent
    ebb6fb7f6265 media: mc: Add num_links flag to media_pad
    c95318607fbe media: nxp: imx8-isi: Check whether crossbar pad is non-NULL before access
    0a7690224714 media: mc: Fix flags handling when creating pad links
    cc088ebf8b4a media: mc: Add local pad to pipeline regardless of the link state
    dc5e4f240473 media: xc4000: Fix atomicity violation in xc4000_get_frequency
    b5d40f02e722 pci_iounmap(): Fix MMIO mapping leak
    86cb706a40b7 drm/vmwgfx: Fix the lifetime of the bo cursor memory
    2160ad6861c4 serial: max310x: fix NULL pointer dereference in I2C instantiation
    ff41e0d4f3fa drm/vmwgfx: Fix possible null pointer derefence with invalid contexts
    01fad74090a0 arm: dts: marvell: Fix maxium->maxim typo in brownstone dts
    3677d01c55bc smack: Handle SMACK64TRANSMUTE in smack_inode_setsecurity()
    c6fc44595491 smack: Set SMACK64TRANSMUTE only for dirs in smack_inode_setxattr()
    a1a8d40182e2 clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
    2c26984759bb remoteproc: virtio: Fix wdg cannot recovery remote processor
    779af170f1db arm64: dts: qcom: sc7280: Add additional MSI interrupts
    1992f2af6444 media: staging: ipu3-imgu: Set fields before media_entity_pads_init()
    e76f6b9618e8 wifi: brcmfmac: avoid invalid list operation when vendor attach fails
    190794848e2b wifi: brcmfmac: Fix use-after-free bug in brcmf_cfg80211_detach
    0a23f95af7f2 drm/vmwgfx: Unmap the surface before resetting it on a plane state
    51138f1f3564 KVM: x86: Use a switch statement and macros in __feature_translate()
    688313fb139e KVM: x86: Advertise CPUID.(EAX=7,ECX=2):EDX[5:0] to userspace
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a44a08451a..2f788667f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "19813826de57a6425518c7b3daf8dd6a04d2321f"
-SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
+SRCREV_machine ?= "7290738691e931c361f5391a47189e40477cc2a2"
+SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.23"
+LINUX_VERSION ?= "6.6.24"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index db9e252572..4f9474efae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.23"
+LINUX_VERSION ?= "6.6.24"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
+SRCREV_machine ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 43696db59b..65a3e9a97d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ceb94a85299b59d8840ed7ed392b1d3e4c727678"
-SRCREV_machine:qemuarm64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemuloongarch64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemumips ?= "c79ffc89f8909f60de52005ef258db9752634eda"
-SRCREV_machine:qemuppc ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemuriscv64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemuriscv32 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemux86 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemux86-64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_machine:qemumips64 ?= "b0a73fa83073c8d7d7bc917bcbeac88d296ebe38"
-SRCREV_machine ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
-SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
+SRCREV_machine:qemuarm ?= "47c23d5ba2db28b76e62e152bf4601f30ffbb1a6"
+SRCREV_machine:qemuarm64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemuloongarch64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemumips ?= "d433ef0d8830772213f0d667478d675e778cfbc1"
+SRCREV_machine:qemuppc ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemuriscv64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemuriscv32 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemux86 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemux86-64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_machine:qemumips64 ?= "480ddad109153a5cadd6c625d93044d7d93ce8bd"
+SRCREV_machine ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
+SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5c7587f69194bc9fc714953ab4c7203e6e68885b"
+SRCREV_machine:class-devupstream ?= "9467d7a12f970e7f12adcba143b0c9b9d1a9e72d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.23"
+LINUX_VERSION ?= "6.6.24"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


