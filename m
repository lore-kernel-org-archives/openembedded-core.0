Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.6548.1601504133261761423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=REL4ZL7A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id u3so649659pjr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=awUPYlx3oUg4xrg1hfKknTPjS+MEMHywN5K/CzdVINU=;
        b=REL4ZL7AMJpdfc7J/h18MmCwAbZPammASrI4wjsPx4IOxD+BbGB73HTMaZBvXBnrzV
         nVZDcZxDOme68sWbAOIEQxLpvC1aqdegjdBViQXQPmoswvd7p3NUZSMOgRhomx5a1ZgF
         ayJm/v2E/6mA4x5ZICBupg798AtHVOqW/SddlKNgTrtk2EKY/wWbNl42AJTQ1ZHo1Ege
         rNcecgtatyI0MNEHqlbvAG0Y4xZ8E9nlsaFRUeJmxIX6Hg7R9tK/fazDE8L1lURFsLTZ
         mDwNBrYmu0agv+Y76sQ53F4dxAEaFDHYUPMxxDgNndf3XCyj8o3kZ7B2gKf0SPSmn3BW
         dAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=awUPYlx3oUg4xrg1hfKknTPjS+MEMHywN5K/CzdVINU=;
        b=ZVYR+FrWLFmpPliYxzen9hR8L7wH32KP2DwT79LpN1ssP+0Omj1O1Wwxg3fCshEE1l
         5ACHinJ7b4LYxdJrvKajfFWxXXqjdWh04je10WHhkEVH6BTU2kqo1MpxrZ5NB2gTNiaa
         WcD+Bbqkjcm/NRnE0fl5txPMT0t2NjyNzjXN7PRGd93p1Uyo7Q0jlxB7m0lViRV7AmqD
         QBxNYN0GyiN96USy+He3e5yxqxTKvWvBMVUvg2qCEIki3RPQgtXntsAnFaxuWxTywbtP
         9wfsyq4IBli6/cnYUrDh9XmWbzPa6nY69nojhoMB0NIMdy7utAE/BFEcZVEc/yFrTgY/
         /k+g==
X-Gm-Message-State: AOAM530/rtL0WjV38Rqxt4gEKBjAEqyfErqsZuv4AeH5PA2/nlUtHF1e
	am68bzA3j8bOBRWvhDF0pYSLbhTkv3daRAmpwRs=
X-Google-Smtp-Source: ABdhPJwzxWzqxAlNx9PmzpqmsS45K8wImkoQC2DNC8mmMFl2nzGaBotGPIbPaNDP0fD4RxzxFQwRgA==
X-Received: by 2002:a17:90a:d246:: with SMTP id o6mr4487180pjw.211.1601504131726;
        Wed, 30 Sep 2020 15:15:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/41] linux-yocto/5.4: update to v5.4.64
Date: Wed, 30 Sep 2020 12:11:37 -1000
Message-Id: <e4c1ab07a50015fd85b4f5e78b62ac0fdebad969.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6ffabce36fc8 Linux 5.4.64
    beaf13ed8e97 net: usb: Fix uninit-was-stored issue in asix_read_phy_addr()
    58c3e86d42d2 cfg80211: regulatory: reject invalid hints
    08eeec445297 mm/khugepaged.c: fix khugepaged's request size in collapse_file
    af7786b20c71 mm/hugetlb: fix a race between hugetlb sysctl handlers
    f2cd86225c89 checkpatch: fix the usage of capture group ( ... )
    59ac5bfa82bc sdhci: tegra: Add missing TMCLK for data timeout
    e915b3b63dfd perf record: Correct the help info of option "--no-bpf-event"
    894a6f0be372 vfio/pci: Fix SR-IOV VF handling with MMIO blocking
    f4fa8d937edf mm: madvise: fix vma user-after-free
    87fb7b0c5266 mm: slub: fix conversion of freelist_corrupted()
    291144f1114d dm thin metadata: Fix use-after-free in dm_bm_set_read_only
    cfe85a4a8552 dm thin metadata: Avoid returning cmd->bm wild pointer on error
    392a6afcbf19 dm cache metadata: Avoid returning cmd->bm wild pointer on error
    9dd74db0bfd1 dm crypt: Initialize crypto wait structures
    e6ddb1d45c51 dm integrity: fix error reporting in bitmap mode after creation
    b30f628beec9 dm mpath: fix racey management of PG initialization
    226fb99eb59d dm writecache: handle DAX to partitions on persistent memory correctly
    6fb192c06a14 drm/amd/pm: avoid false alarm due to confusing softwareshutdowntemp setting
    f84804af09c7 dmaengine: dw-edma: Fix scatter-gather address calculation
    9f4ab0172e6c blk-iocost: ioc_pd_free() shouldn't assume irq disabled
    f7880745e91b libata: implement ATA_HORKAGE_MAX_TRIM_128M and apply to Sandisks
    5f5f27228195 block: ensure bdi->io_pages is always initialized
    84c041c12442 block: allow for_each_bvec to support zero len bvec
    b6e4827c04b0 affs: fix basic permission bits to actually work
    2d89e44dc932 media: rc: uevent sysfs file races with rc_unregister_device()
    5925179bbc64 media: rc: do not access device via sysfs after rc_unregister_device()
    3d77c12f3040 mmc: sdhci-pci: Fix SDHCI_RESET_ALL for CQHCI for Intel GLK-based controllers
    ed48704c36a8 mmc: cqhci: Add cqhci_deactivate()
    a69047c01eb4 mmc: dt-bindings: Add resets/reset-names for Mediatek MMC bindings
    5876ee035ba6 mmc: mediatek: add optional module reset property
    2816ccd07145 arm64: dts: mt7622: add reset node for mmc device
    d074d9d52fe0 ALSA: hda/realtek - Improved routing for Thinkpad X1 7th/8th Gen
    7de2f56ef51a ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion NT950XCJ-X716A
    a253fe35666d ALSA; firewire-tascam: exclude Tascam FE-8 from detection
    982505615063 ALSA: hda - Fix silent audio output and corrupted input on MSI X570-A PRO
    cebaed033037 ALSA: firewire-digi00x: exclude Avid Adrenaline from detection
    4fa06a43bf9f ALSA: hda/hdmi: always check pin power status in i915 pin fixup
    2ebb83a259a8 ALSA: pcm: oss: Remove superfluous WARN_ON() for mulaw sanity check
    79124b1b912c ALSA: usb-audio: Add implicit feedback quirk for UR22C
    a3b94af5117b ALSA: ca0106: fix error code handling
    156dd7c73a9b Revert "ALSA: hda: Add support for Loongson 7A1000 controller"
    62db427bf8ca Revert "net: dsa: microchip: set the correct number of ports"
    4254a4f7988c btrfs: fix potential deadlock in the search ioctl
    de53545e8d4c net: core: use listified Rx for GRO_NORMAL in napi_gro_receive()
    df0c47585cea btrfs: tree-checker: fix the error message for transid error
    650275310f3b btrfs: set the lockdep class for log tree extent buffers
    7e0ffb0d9d9f btrfs: set the correct lockdep class for new nodes
    c37cc199da2b btrfs: allocate scrub workqueues outside of locks
    eb29635ba68a btrfs: drop path before adding new uuid tree entry
    20b591fd00c0 ARC: perf: don't bail setup if pct irq missing in device-tree
    ce690fa1d5d0 xfs: don't update mtime on COW faults
    12cd8fccc9ed ext2: don't update mtime on COW faults
    cc6c4d81d6ad tracing/kprobes, x86/ptrace: Fix regs argument order for i386
    036a857bb57d iommu/vt-d: Handle 36bit addressing for x86-32
    8f747b0149c5 vfio-pci: Invalidate mmaps and block MMIO access on disabled memory
    b0f5096b281a vfio-pci: Fault mmaps to enable vma tracking
    270c35d0723a vfio/type1: Support faulting PFNMAP vmas
    5629bb21ce20 include/linux/log2.h: add missing () around n in roundup_pow_of_two()
    bc846b58fe5c net/packet: fix overflow in tpacket_rcv
    e3d109c3484e iommu/amd: Restore IRTE.RemapEn bit after programming IRTE
    7ce6bc1b549e thermal: qcom-spmi-temp-alarm: Don't suppress negative temp
    f5b3bd38ae91 thermal: ti-soc-thermal: Fix bogus thermal shutdowns for omap4430
    0c21f1bcafc1 iommu/vt-d: Serialize IOMMU GCMD register modifications
    920d9ffcd481 x86, fakenuma: Fix invalid starting node ID
    1a7e03867a37 tg3: Fix soft lockup when tg3_reset_task() fails.
    b0c40f8a7a0e perf jevents: Fix suspicious code in fixregex()
    6c4ad5444a26 xfs: fix xfs_bmap_validate_extent_raw when checking attr fork of rt files
    58591dd6afda MIPS: add missing MSACSR and upper MSA initialization
    612e2b7ec962 net: gemini: Fix another missing clk_disable_unprepare() in probe
    88405cf0f2bd fix regression in "epoll: Keep a reference on files added to the check list"
    901d22c6b6dc net: ethernet: mlx4: Fix memory allocation in mlx4_buddy_init()
    8e2660c834e3 perf tools: Correct SNOOPX field offset
    37f0a08a3a83 cxgb4: fix thermal zone device registration
    50d284778427 nvme: fix controller instance leak
    f4b830c61b5b nvmet-fc: Fix a missed _irqsave version of spin_lock in 'nvmet_fc_fod_op_done()'
    9ff9f74ed462 netfilter: nfnetlink: nfnetlink_unicast() reports EAGAIN instead of ENOBUFS
    498575898ec4 net: dsa: mt7530: fix advertising unsupported 1000baseT_Half
    c4a427b71cd7 selftests/bpf: Fix massive output from test_maps
    e0a1bebc332d media: cedrus: Add missing v4l2_ctrl_request_hdl_put()
    3fe12f4be001 media: vicodec: add missing v4l2_ctrl_request_hdl_put()
    f28f3cffff27 bnxt: don't enable NAPI until rings are ready
    da7a1676d6c1 xfs: fix boundary test in xfs_attr_shortform_verify
    8227199ceafd bnxt_en: fix HWRM error when querying VF temperature
    927a7629bedd bnxt_en: Fix possible crash in bnxt_fw_reset_task().
    70699d3cc77c bnxt_en: Fix PCI AER error recovery flow
    87547923b6c6 bnxt_en: Check for zero dir entries in NVRAM.
    e7cbba4db7da bnxt_en: Don't query FW when netif_running() is false.
    c11510bb8898 net: ethernet: ti: cpsw: fix clean up of vlan mc entries for host port
    0bd92cdc04e6 gtp: add GTPA_LINK info to msg sent to userspace
    24249fab08c6 dmaengine: pl330: Fix burst length if burst size is smaller than bus width
    719f92de3fff net: arc_emac: Fix memleak in arc_mdio_probe
    268fe5a4c040 ravb: Fixed to be able to unload modules
    8123fa897e65 net: systemport: Fix memleak in bcm_sysport_probe
    a49c0aebf9c4 net: hns: Fix memleak in hns_nic_dev_probe
    210b889fd8ef netfilter: nf_tables: fix destination register zeroing
    576fbd4902fb netfilter: nf_tables: incorrect enum nft_list_attributes definition
    929d07feb94f netfilter: nf_tables: add NFTA_SET_USERDATA if not null
    fb1e97674aa8 mmc: sdhci-acpi: Fix HS400 tuning for AMDI0040
    da8e3e507d2f MIPS: BMIPS: Also call bmips_cpu_setup() for secondary cores
    c5e9e36fc2f8 MIPS: mm: BMIPS5000 has inclusive physical caches
    5f7798f05311 rxrpc: Make rxrpc_kernel_get_srtt() indicate validity
    43cf7e7dfa7b rxrpc: Keep the ACK serial in a var in rxrpc_input_ack()
    242a7ab0ac52 dmaengine: at_hdmac: check return value of of_find_device_by_node() in at_dma_xlate()
    2f2786bb9d40 batman-adv: bla: use netif_rx_ni when not in interrupt context
    fd8b3ef644a4 batman-adv: Fix own OGM check in aggregated OGMs
    2344f2f186fd batman-adv: Avoid uninitialized chaddr when handling DHCP
    89cb604c4226 dmaengine: of-dma: Fix of_dma_router_xlate's of_dma_xlate handling
    1a89606baf31 fsldma: fix very broken 32-bit ppc ioread64 functionality
    6eb88c42dcc9 xen/xenbus: Fix granting of vmalloc'd memory
    0878655a9880 drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init
    b014f2846e6f drm/amd/display: Retry AUX write when fail occurs
    9947928e619a drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps object to 0 in amdgpu_dm_update_backlight_caps
    79d31527dfc3 drm/amd/display: Reject overlay plane configurations in multi-display scenarios
    29bade8e2fc9 s390: don't trace preemption in percpu macros
    c756635246e9 nbd: restore default timeout when setting it to zero
    c1e333e7b8da cpuidle: Fixup IRQ state
    ad3a4efc8c56 drm/omap: fix incorrect lock state
    0a8dcad24424 ceph: don't allow setlease on cephfs
    755fd63ae163 drm/msm/a6xx: fix gmu start on newer firmware
    7a55cf8a20c7 habanalabs: check correct vmalloc return code
    c9436de020a4 habanalabs: validate FW file size
    dddd5003c707 drm/msm: enable vblank during atomic commits
    2c9bc7d9600c nvmet: Disable keep-alive timer when kato is cleared to 0h
    e94a3d76305b hwmon: (applesmc) check status earlier.
    19583b280801 drm/msm: add shutdown support for display platform_driver
    8bc25dea70fe tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
    28ffe70a2e33 drm/msm/dpu: Fix scale params in plane validation
    b2fc347e2126 HID: quirks: Always poll three more Lenovo PixArt mice
    e32f4fa1b24d Linux 5.4.63
    5153710a5ecc scsi: target: tcmu: Optimize use of flush_dcache_page
    bb9949fdfddd scsi: target: tcmu: Fix size in calls to tcmu_flush_dcache_range
    6d2e274f60fc sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra186
    0176db2f2ad5 sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra210
    eda97e9d90db arm64: tegra: Add missing timeout clock to Tegra210 SDMMC
    5cd8c5979e72 arm64: tegra: Add missing timeout clock to Tegra186 SDMMC nodes
    ef8b5f333780 arm64: tegra: Add missing timeout clock to Tegra194 SDMMC nodes
    9d806d68bf97 dt-bindings: mmc: tegra: Add tmclk for Tegra210 and later
    d2ac42e61ecd KVM: arm64: Set HCR_EL2.PTW to prevent AT taking synchronous exception
    ffad02f9e3ea KVM: arm64: Survive synchronous exceptions caused by AT instructions
    1744237ca047 KVM: arm64: Add kvm_extable for vaxorcism code
    538caddbe635 drm/etnaviv: fix TS cache flushing on GPUs with BLT engine
    80743b4bde09 drm/sched: Fix passing zero to 'PTR_ERR' warning v2
    6cadd1e2d8c5 perf record/stat: Explicitly call out event modifiers in the documentation
    4bae1afed432 HID: core: Sanitize event code and type when mapping input
    667514df10a0 HID: core: Correctly handle ReportSize being zero
    933cf1c2c075 Linux 5.4.62
    54ee77961e79 io_uring: Fix NULL pointer dereference in io_sq_wq_submit_work()
    44cf62d388fb ALSA: usb-audio: Update documentation comment for MS2109 quirk
    851d0813ab80 HID: hiddev: Fix slab-out-of-bounds write in hiddev_ioctl_usage()
    c98b6ebd9b55 kbuild: fix broken builds because of GZIP,BZIP2,LZOP variables
    37432a83faab kbuild: add variables for compression tools
    47a41f65afb6 kheaders: explain why include/config/autoconf.h is excluded from md5sum
    7caddaa9f88b kheaders: remove the last bashism to allow sh to run it
    18f48708c3f5 kheaders: optimize header copy for in-tree builds
    a1d0c6e2f334 kheaders: optimize md5sum calculation for in-tree builds
    eb914bae6e17 kheaders: remove unneeded 'cat' command piped to 'head' / 'tail'
    376810e5e9e1 fbmem: pull fbcon_update_vcs() out of fb_set_var()
    6a862aa31ec3 usb: dwc3: gadget: Handle ZLP for sg requests
    7c8b5685662b usb: dwc3: gadget: Fix handling ZLP
    4bc5d90a7dce usb: dwc3: gadget: Don't setup more than requested
    f8e4c5297fcd drm/i915: Fix cmd parser desc matching with masks
    73992639ec78 usb: storage: Add unusual_uas entry for Sony PSZ drives
    2add73c8c00d USB: cdc-acm: rework notification_buffer resizing
    e2e02f260496 USB: gadget: u_f: Unbreak offset calculation in VLAs
    4f529c4d1e43 USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()
    f47ab852bea3 USB: gadget: u_f: add overflow checks to VLA macros
    2534d3dec376 usb: host: ohci-exynos: Fix error handling in exynos_ohci_probe()
    de24343880a6 USB: Ignore UAS for JMicron JMS567 ATA/ATAPI Bridge
    ca29a2a53953 USB: quirks: Ignore duplicate endpoint on Sound Devices MixPre-D
    20b3564c6748 USB: quirks: Add no-lpm quirk for another Raydium touchscreen
    b32ec919ee37 usb: uas: Add quirk for PNY Pro Elite
    ad0bc424fc0a USB: yurex: Fix bad gfp argument
    3623dab2959e drm/amd/pm: correct the thermal alert temperature limit settings
    85ca6f199c77 drm/amd/pm: correct Vega20 swctf limit setting
    9afabefd42fc drm/amd/pm: correct Vega12 swctf limit setting
    60cffee2d951 drm/amd/pm: correct Vega10 swctf limit setting
    2809cf7f6eba drm/amd/powerplay: Fix hardmins not being sent to SMU for RV
    20700b352d10 drm/amdgpu/gfx10: refine mgcg setting
    8fc7a66619e1 drm/amdgpu: Fix buffer overflow in INFO ioctl
    1adf8c19f974 x86/hotplug: Silence APIC only after all interrupts are migrated
    47c8387a963e irqchip/stm32-exti: Avoid losing interrupts due to clearing pending bits by mistake
    927aa9a10f12 genirq/matrix: Deal with the sillyness of for_each_cpu() on UP
    70957a10e1db crypto: af_alg - Work around empty control messages without MSG_MORE
    aca10ab0568a device property: Fix the secondary firmware node handling in set_primary_fwnode()
    df2a6a4a9d68 powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
    b260fb2a02b5 PM: sleep: core: Fix the handling of pending runtime resume requests
    7ded78a8c89e arm64: vdso32: make vdso32 install conditional
    3b7087e07730 xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed
    02166fea639f xhci: Do warm-reset when both CAS and XDEV_RESUME are set
    3ac8545b29ae usb: host: xhci: fix ep context print mismatch in debugfs
    4d3e2a3a0c64 XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt XEN data pointer which contains XEN specific information.
    6623c19042b6 writeback: Fix sync livelock due to b_dirty_time processing
    cb0c74450072 writeback: Avoid skipping inode writeback
    8eab2b531fd3 writeback: Protect inode->i_io_list with inode->i_lock
    2e76a3a1667c serial: 8250: change lock order in serial8250_do_startup()
    f53ebc7c2922 serial: 8250_exar: Fix number of ports for Commtech PCIe cards
    fbb55ec82dd6 serial: stm32: avoid kernel warning on absence of optional IRQ
    64a05aadf936 serial: pl011: Don't leak amba_ports entry on driver register error
    0806b49bba20 serial: pl011: Fix oops on -EPROBE_DEFER
    daae6b962a13 serial: samsung: Removes the IRQ not found warning
    7c57237d74a0 vt_ioctl: change VT_RESIZEX ioctl to check for error return from vc_resize()
    adb76f3f7732 vt: defer kfree() of vc_screenbuf in vc_do_resize()
    db1bb352cc08 USB: lvtest: return proper error code in probe
    96e41fc29e8a fbcon: prevent user font height or width change from causing potential out-of-bounds access
    cd1d270e3e4f btrfs: detect nocow for swap after snapshot delete
    eb576fc43a43 btrfs: fix space cache memory leak after transaction abort
    1d08edc70154 btrfs: check the right error variable in btrfs_del_dir_entries_in_log
    8a3509486f08 btrfs: reset compression level for lzo on remount
    b1a83ee0cbbf blk-mq: order adding requests to hctx->dispatch and checking SCHED_RESTART
    c2035d1e55aa HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands
    db4542b6617b block: loop: set discard granularity and alignment for block device backed loop
    f09dbec9c0c6 block: fix get_max_io_size()
    2f4b202eb1b1 arm64: Allow booting of late CPUs affected by erratum 1418040
    82b05f0838aa arm64: Move handling of erratum 1418040 into C code
    7d44b707aaff powerpc/perf: Fix soft lockups due to missed interrupt accounting
    9c0305c0cfa2 net: gianfar: Add of_node_put() before goto statement
    c656534e5c45 macvlan: validate setting of multiple remote source MAC addresses
    19f669a3609c Revert "scsi: qla2xxx: Fix crash on qla2x00_mailbox_command"
    48765b780ace scsi: qla2xxx: Fix null pointer access during disconnect from subsystem
    36a139cf4146 scsi: qla2xxx: Check if FW supports MQ before enabling
    88274626d110 scsi: qla2xxx: Fix login timeout
    37528b3ee9e1 scsi: ufs: Clean up completed request without interrupt notification
    a39ba0fdcdfd scsi: ufs: Improve interrupt handling for shared interrupts
    d895b0be701c scsi: ufs: Fix possible infinite loop in ufshcd_hold
    1778bebd06b4 scsi: fcoe: Fix I/O path allocation
    a8d26145e112 selftests: disable rp_filter for icmp_redirect.sh
    957066143e6c ASoC: wm8994: Avoid attempts to read unreadable registers
    1d63737b0777 s390/cio: add cond_resched() in the slow_eval_known_fn() loop
    2a8c6149a49a ALSA: hda/realtek: Add model alc298-samsung-headphone
    021a98a87864 can: j1939: transport: j1939_xtp_rx_dat_one(): compare own packets to detect corruptions
    3803312a3c55 netfilter: avoid ipv6 -> nf_defrag_ipv6 module dependency
    35238963c972 drm/amd/display: Switch to immediate mode for updating infopackets
    b92b415fa7b7 drm/amd/powerplay: correct UVD/VCE PG state on custom pptable uploading
    73a0e6280a32 drm/amd/powerplay: correct Vega20 cached smu feature state
    d2da80e0a3e7 spi: stm32: always perform registers configuration prior to transfer
    2844685c661a spi: stm32: fix stm32_spi_prepare_mbr in case of odd clk_rate
    a6daa863d15e spi: stm32: fix fifo threshold level in case of short transfer
    3c15a3c4b155 spi: stm32h7: fix race condition at end of transfer
    a08e95e83e6f fs: prevent BUG_ON in submit_bh_wbc()
    28a56c26a00d ext4: correctly restore system zone info when remount fails
    8e63c86f6580 ext4: handle error of ext4_setup_system_zone() on remount
    e579635669da ext4: handle option set by mount flags correctly
    3a53d012bd26 jbd2: abort journal if free a async write error metadata buffer
    1b36d4fa4b66 ext4: handle read only external journal device
    2e7312ddaf62 ext4: don't BUG on inconsistent journal feature
    40827caf954c jbd2: make sure jh have b_transaction set in refile/unfile_buffer
    e4351ad44d7e spi: stm32: clear only asserted irq flags on interrupt
    d63728afe947 usb: gadget: f_tcm: Fix some resource leaks in some error paths
    262f5fbad941 i2c: rcar: in slave mode, clear NACK earlier
    883ed72723ef i2c: core: Don't fail PRP0001 enumeration when no ID table exist
    2fc8fa50ebee null_blk: fix passing of REQ_FUA flag in null_handle_rq
    88994acafd96 nvme: multipath: round-robin: fix single non-optimized path case
    97f30414a2e0 nvme-fc: Fix wrong return value in __nvme_fc_init_request()
    05c608f630b9 blkcg: fix memleak for iolatency
    872a2b3182ee blk-mq: insert request not through ->queue_rq into sw/scheduler queue
    9054d5844092 hwmon: (nct7904) Correct divide by 0
    1475314530bb bfq: fix blkio cgroup leakage v4
    2295664518c3 block: Fix page_is_mergeable() for compound pages
    3e9eb1e893ba drm/msm/adreno: fix updating ring fence
    effd3b89f7e5 block: virtio_blk: fix handling single range discard request
    cc3a73f245cb block: respect queue limit of max discard segment
    8f409e764c4b media: gpio-ir-tx: improve precision of transmitted signal due to scheduling
    6ba04701b801 ALSA: usb-audio: Add capture support for Saffire 6 (USB 1.1)
    5861e84d7145 cpufreq: intel_pstate: Fix EPP setting via sysfs in active mode
    1b7b2d45b31e PCI: qcom: Add missing reset for ipq806x
    ea552383a9d5 PCI: qcom: Change duplicate PCI reset to phy reset
    29ecf28be997 PCI: qcom: Add missing ipq806x clocks in PCIe driver
    6d11320bed41 EDAC/{i7core,sb,pnd2,skx}: Fix error event severity
    87cc96bb11b9 EDAC: skx_common: get rid of unused type var
    3bf42b2e8d67 EDAC: sb_edac: get rid of unused vars
    75aaa8fa7672 mm/vunmap: add cond_resched() in vunmap_pmd_range
    a2038eb833a5 drm/amd/display: Fix dmesg warning from setting abm level
    8522b1bec88e drm/amd/display: Add additional config guards for DCN
    992e51ff0e4b drm/amd/display: Trigger modesets on MST DSC connectors
    b730fb14434f drm/ingenic: Fix incorrect assumption about plane->index
    8dc47d858fea gpu/drm: ingenic: Use the plane's src_[x,y] to configure DMA length
    302b9e189962 cma: don't quit at first error when activating reserved areas
    aed14b1b5c0e mm/cma.c: switch to bitmap_zalloc() for cma bitmap allocation
    965d3d5ce355 mm: fix kthread_use_mm() vs TLB invalidate
    72574434da87 mm/shuffle: don't move pages between zones and don't read garbage memmaps
    483b956a16a0 btrfs: only commit delayed items at fsync if we are logging a directory
    3eddcc71fe8a btrfs: only commit the delayed inode when doing a full fsync
    d5f5b15d3ea4 btrfs: factor out inode items copy loop from btrfs_log_inode()
    a0cfda9cb3a1 s390/numa: set node distance to LOCAL_DISTANCE
    67f8b390b15e drm/xen-front: Fix misused IS_ERR_OR_NULL checks
    02611bcaafe5 drm/xen: fix passing zero to 'PTR_ERR' warning
    fe376f1b12d2 PM / devfreq: rk3399_dmc: Fix kernel oops when rockchip,pmu is absent
    b7cca731b486 PM / devfreq: rk3399_dmc: Disable devfreq-event device when fails
    a0f69c6f5e0b PM / devfreq: rk3399_dmc: Add missing of_node_put()
    961bfe1277ae usb: cdns3: gadget: always zeroed TRB buffer when enable endpoint
    2c0000f409ec sched/uclamp: Fix a deadlock when enabling uclamp static key
    88435320ebc1 sched/uclamp: Protect uclamp fast path code with static key
    93709d8ade00 Revert "ath10k: fix DMA related firmware crashes on multiple devices"
    da56eb03ea94 arm64: Fix __cpu_logical_map undefined issue
    12a9bec2bd4e efi: provide empty efi_enter_virtual_mode implementation
    b2defeb19bff brcmfmac: Set timeout value when configuring power save
    7aac56d8b0ee USB: sisusbvga: Fix a potential UB casued by left shifting a negative value
    e77f71c6341a powerpc/spufs: add CONFIG_COREDUMP dependency
    653ae33b030b KVM: arm64: Fix symbol dependency in __hyp_call_panic_nvhe
    a84a6eb935ba media: davinci: vpif_capture: fix potential double free
    6b0010ed7140 hugetlbfs: prevent filesystem stacking of hugetlbfs
    c67c6e1f54aa EDAC/ie31200: Fallback if host bridge device is already initialized
    41191f8c57a1 scsi: fcoe: Memory leak fix in fcoe_sysfs_fcf_del()
    a002274db527 ceph: do not access the kiocb after aio requests
    01540d5e7c1b ceph: fix potential mdsc use-after-free crash
    9da791b5410e scsi: iscsi: Do not put host in iscsi_set_flashnode_param()
    050292f138a3 btrfs: make btrfs_qgroup_check_reserved_leak take btrfs_inode
    1f52b85f6c79 btrfs: file: reserve qgroup space after the hole punch range is locked
    7d6689df48de locking/lockdep: Fix overflow in presentation of average lock-time
    2adf6ec63db2 drm/nouveau: Fix reference count leak in nouveau_connector_detect
    19e81f6325a9 drm/nouveau: fix reference count leak in nv50_disp_atomic_commit
    d23d52e38cc9 drm/nouveau/drm/noveau: fix reference count leak in nouveau_fbcon_open
    45e30390f50f f2fs: fix use-after-free issue
    4cba87943046 HID: quirks: add NOGET quirk for Logitech GROUP
    6734eeb6c2f0 cec-api: prevent leaking memory through hole in structure
    bd4593030332 ALSA: hda: Add support for Loongson 7A1000 controller
    f4107f633a29 mips/vdso: Fix resource leaks in genvdso.c
    71e7e02c0590 rtlwifi: rtl8192cu: Prevent leaking urb
    3a84491364e1 ARM: dts: ls1021a: output PPS signal on FIPER2
    4410fd0c378e PCI: Fix pci_create_slot() reference count leak
    201838142c52 omapfb: fix multiple reference count leaks due to pm_runtime_get_sync
    22d859fe1bdc f2fs: fix error path in do_recover_data()
    110c5a5a6854 selftests/powerpc: Purge extra count_pmc() calls of ebb selftests
    0450a50c914e scsi: target: Fix xcopy sess release leak
    774cc7c882f8 xfs: Don't allow logging of XFS_ISTALE inodes
    40b450375c80 scsi: lpfc: Fix shost refcount mismatch when deleting vport
    815060a8ec2a drm/amdgpu/display: fix ref count leak when pm_runtime_get_sync fails
    8290f9d4695f drm/amdgpu: fix ref count leak in amdgpu_display_crtc_set_config
    3753eff4c69a drm/amd/display: fix ref count leak in amdgpu_drm_ioctl
    c911da7b6673 drm/amdgpu: fix ref count leak in amdgpu_driver_open_kms
    40d0bf2b6e99 drm/radeon: fix multiple reference count leak
    9c88b27ac444 drm/amdkfd: Fix reference count leaks.
    1174ed705dda iommu/iova: Don't BUG on invalid PFNs
    f0a066af0f37 mfd: intel-lpss: Add Intel Tiger Lake PCH-H PCI IDs
    d98ea48810e6 scsi: target: tcmu: Fix crash on ARM during cmd completion
    ab2d90e58ae1 blktrace: ensure our debugfs dir exists
    fc93c091de22 media: pci: ttpci: av7110: fix possible buffer overflow caused by bad DMA value in debiirq()
    1dc0ed18219a powerpc/xive: Ignore kmemleak false positives
    88eb00cb39ce arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
    d8cc881483d8 mfd: intel-lpss: Add Intel Emmitsburg PCH PCI IDs
    fd5908860a17 ASoC: tegra: Fix reference count leaks.
    7d60cd2a6e08 ASoC: img-parallel-out: Fix a reference count leak
    8150a0e3d796 ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt
    a53f67368c98 ALSA: hda/hdmi: Use force connectivity quirk on another HP desktop
    348da2f8566b ALSA: hda/realtek: Fix pin default on Intel NUC 8 Rugged
    bcf40820b4fd ALSA: pci: delete repeated words in comments
    b45944e2b39e ALSA: hda/hdmi: Add quirk to force connectivity
    266d21a57093 ipvlan: fix device features
    e1334c4f4aec net/sched: act_ct: Fix skb double-free in tcf_ct_handle_fragments() error flow
    97a74349cf82 net: ena: Make missed_tx stat incremental
    6c2e795f95cd tipc: fix uninit skb->data in tipc_nl_compat_dumpit()
    d429362b3de4 net/smc: Prevent kernel-infoleak in __smc_diag_dump()
    4d2fe0addc38 net: sctp: Fix negotiation of the number of data streams.
    4ef63e365466 net: qrtr: fix usage of idr in port assignment to socket
    4ae9ebf9e8ea net: nexthop: don't allow empty NHA_GROUP
    6ed89176755c net: Fix potential wrong skb->protocol in skb_vlan_untag()
    b5e34120b06a gre6: Fix reception with IP6_TNL_F_RCV_DSCP_COPY
    730443f4c48a binfmt_flat: revert "binfmt_flat: don't offset the data start"
    669fc3b38ce2 powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 4090a909ade3ac38bb14b978776daffc152f64d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 12c3daab0f..97cb7d934f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e65e9ff22c5c42c9ae57a4cce45fbf91a7e7ae3b"
-SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
+SRCREV_machine ?= "b170a5953260ea7d7bdfcf223fb92d138eb7db67"
+SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.61"
+LINUX_VERSION ?= "5.4.64"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index bc3a1e50e0..7d836593c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.61"
+LINUX_VERSION ?= "5.4.64"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f30ce7653a038eb05ef0503d0d15c7c6ec33cdc5"
-SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
+SRCREV_machine_qemuarm ?= "3bd01ef1ebb9b2a9bbae3c35eb9d640cd1ab9da7"
+SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f20aa6c618..f59126ce7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "487ecd38aaa59c22302930e8a9697c62c9d85fe5"
-SRCREV_machine_qemuarm64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_machine_qemumips ?= "ad1d747e7343bc9851bff62c4279060094c6eb59"
-SRCREV_machine_qemuppc ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_machine_qemuriscv64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_machine_qemux86 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_machine_qemux86-64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_machine_qemumips64 ?= "4fe8438e9dea8d0a00f82003277f36785aac9e3d"
-SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
+SRCREV_machine_qemuarm ?= "33ab5549b39d7bbfc067f13527bfa817250c69a3"
+SRCREV_machine_qemuarm64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_machine_qemumips ?= "7954ad760bd317039a9ad44300a8bf1a34107fc8"
+SRCREV_machine_qemuppc ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_machine_qemuriscv64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_machine_qemux86 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_machine_qemux86-64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_machine_qemumips64 ?= "91fb319534f5206619aa04556dbf32d49afa1080"
+SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
+SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.61"
+LINUX_VERSION ?= "5.4.64"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

