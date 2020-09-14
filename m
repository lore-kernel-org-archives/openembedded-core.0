Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.457.1600122866732319653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KRsR1qEo;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id r8so1575317qtp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0VAbJwNJ7zWC0UKiP6G6arBWKhB0+Nt2B0atpszj5WI=;
        b=KRsR1qEow8zVfMoEOuoOTVQtzKVsKmpznHWUE+54PMhK+QRDXfxOhVSGhokRz9ojBz
         kw5HyvQMH9NvYfnTpsaU264DvyqoPsL3vUm9D6EurL2lsN8m7a0EjpoLlj7Tte4Suigg
         sJKmeALyrTkKTaRWDlqWN3SPeUaRFn4uuleDZbYp+tBm7PxJuiT1pTVfQpV0FpxOhEi8
         qaAvcZIzg6h/vfd9pKcBjK1ij0mZiW/U/idXQNcGhqBEZ/+72EDQRKzsnMcdVwJKEHBJ
         I31/8+BrkiSDR51vLOoHzL7E6sxuY/PI+GDm93Ovuqu5Wo96XGbSPk0yNkWNo2LKagZg
         7jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0VAbJwNJ7zWC0UKiP6G6arBWKhB0+Nt2B0atpszj5WI=;
        b=nNt6CnP+s/LDDV42hMs/tUybiIs8zdi0Z9jNzFNNzKc94LdVHz0SVlLdEHkwmvt4KR
         DjL0/FXeglMjVafuras3fmP+pywS7DmhMWDQ50r2mKqtqNbxsOrQ7xI0SzFbcWLb9YQu
         DlNlsMEnayPNMkG2hdAuac24pdWJzizAq7gcvOQgZ14uo4lLKAAKVUOPxf17z+Ja+R8e
         shiJ0eSfoT0e5f53N408ySJRpepvb9x9u3RsFcAlnZD66v20cGkn+eUOTWgu+A0M8n5N
         s62PiE/bvXkov9cNCo+pNd6ll+dFK7fxM6xfItnS/uG/E+3Sepx0j6Cz8aOIvNB5mtV2
         NtUw==
X-Gm-Message-State: AOAM530wnCCqW0XEoVnN8drNvdOo+OD/cLU2ilHLuCz7MnbHdbpR/KpJ
	e6VNN3viMDsvQCEAwwPo1UA=
X-Google-Smtp-Source: ABdhPJwIcpLFax1ODQh+RM0UTjt3kzvqUYc4e9DvDKsqjXB/6VJMbOIQWUxMGtC7eeV8Fo97HvtYDA==
X-Received: by 2002:aed:3882:: with SMTP id k2mr3063113qte.308.1600122865496;
        Mon, 14 Sep 2020 15:34:25 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v131sm16355770qka.97.2020.09.14.15.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:34:24 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.8: update to v5.8.8
Date: Mon, 14 Sep 2020 18:34:16 -0400
Message-Id: <bbfed588ea4bfb9f711b0028cef0485405a9a8e1.1600122415.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1600122415.git.bruce.ashfield@gmail.com>
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    4f447bf95fdc Linux 5.8.8
    830b08e696f7 net: usb: Fix uninit-was-stored issue in asix_read_phy_addr()
    548c1175051d cfg80211: regulatory: reject invalid hints
    9206b03e7fc9 mm/khugepaged.c: fix khugepaged's request size in collapse_file
    951e290ad85b mm/hugetlb: fix a race between hugetlb sysctl handlers
    e2d4e423205e mm/hugetlb: try preferred node first when alloc gigantic page from cma
    3fd08f78f47a mm/migrate: fixup setting UFFD_WP flag
    658e93f1c318 checkpatch: fix the usage of capture group ( ... )
    d3498d5e8775 sdhci: tegra: Add missing TMCLK for data timeout
    55eb0f42f465 kconfig: streamline_config.pl: check defined(ENV variable) before using it
    8c4c56846892 perf record: Correct the help info of option "--no-bpf-event"
    bf8fe7b755c2 io_uring: no read/write-retry on -EAGAIN error and O_NONBLOCK marked file
    a8bf40a7538f mm/rmap: fixup copying of soft dirty and uffd ptes
    9b4a9e89f6e8 mm: madvise: fix vma user-after-free
    98650804fa53 mm: track page table modifications in __apply_to_page_range()
    3eba981cffc9 mm: slub: fix conversion of freelist_corrupted()
    4469ea5972ab dm thin metadata: Fix use-after-free in dm_bm_set_read_only
    b3c76fdbb119 dm thin metadata: Avoid returning cmd->bm wild pointer on error
    d02a33a24825 dm cache metadata: Avoid returning cmd->bm wild pointer on error
    0a495d145f59 dm crypt: Initialize crypto wait structures
    372236a01bc5 dm integrity: fix error reporting in bitmap mode after creation
    2c8ee4951f11 dm mpath: fix racey management of PG initialization
    cc06bdfc211b dm writecache: handle DAX to partitions on persistent memory correctly
    67ba86179fc6 drm/amdgpu: Specify get_argument function for ci_smu_funcs
    dd8a223d0f58 drm/amd/pm: avoid false alarm due to confusing softwareshutdowntemp setting
    696f8cfee025 drm/i915: Fix sha_text population code
    1693c125c0a9 dmaengine: dw-edma: Fix scatter-gather address calculation
    3c761332597d blk-stat: make q->stats->lock irqsafe
    70d22582c3eb blk-iocost: ioc_pd_free() shouldn't assume irq disabled
    57fd9f8eb603 mips/oprofile: Fix fallthrough placement
    dea6f05d372a libata: implement ATA_HORKAGE_MAX_TRIM_128M and apply to Sandisks
    3264d781e1ad s390: fix GENERIC_LOCKBREAK dependency typo in Kconfig
    e37bc36aaff3 io_uring: fix removing the wrong file in __io_sqe_files_update()
    329c9ffc81cf io_uring: set table->files[i] to NULL when io_sqe_file_register failed
    a7a42c1e5023 block: ensure bdi->io_pages is always initialized
    b7df98a8b7b8 block: allow for_each_bvec to support zero len bvec
    2221f41d3fb3 affs: fix basic permission bits to actually work
    9af0c46a7612 media: rc: uevent sysfs file races with rc_unregister_device()
    bff924ee40ae media: rc: do not access device via sysfs after rc_unregister_device()
    91994b8489a3 mmc: sdhci-pci: Fix SDHCI_RESET_ALL for CQHCI for Intel GLK-based controllers
    88df22892d14 mmc: dt-bindings: Add resets/reset-names for Mediatek MMC bindings
    01263d02f5da mmc: mediatek: add optional module reset property
    f8916b54514e arm64: dts: mt7622: add reset node for mmc device
    ab90e0d7a985 ALSA: hda/realtek - Improved routing for Thinkpad X1 7th/8th Gen
    3695decb7771 ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion NT950XCJ-X716A
    c1e0aff25b1b ALSA; firewire-tascam: exclude Tascam FE-8 from detection
    8e83bd51016a ALSA: hda - Fix silent audio output and corrupted input on MSI X570-A PRO
    48510be50e87 ALSA: firewire-digi00x: exclude Avid Adrenaline from detection
    7554ad2ffdad ALSA: hda/hdmi: always check pin power status in i915 pin fixup
    db5d1d51bef1 ALSA: pcm: oss: Remove superfluous WARN_ON() for mulaw sanity check
    dfcfc358e366 ALSA: usb-audio: Add implicit feedback quirk for UR22C
    3284ababd0c4 ALSA: usb-audio: Add basic capture support for Pioneer DJ DJM-250MK2
    2c9ba98fec4d ALSA: ca0106: fix error code handling
    9aa4e2c3da17 Revert "ALSA: hda: Add support for Loongson 7A1000 controller"
    df7a51020021 x86/mm/32: Bring back vmalloc faulting on x86_32
    98f0b4072c94 Bluetooth: Return NOTIFY_DONE for hci_suspend_notifier
    434ed4233877 btrfs: tree-checker: fix the error message for transid error
    6b09009a2eae btrfs: block-group: fix free-space bitmap threshold
    6d12fbd0c4b7 btrfs: set the lockdep class for log tree extent buffers
    7ad3d8ad569c btrfs: set the correct lockdep class for new nodes
    42a2fbd05773 btrfs: allocate scrub workqueues outside of locks
    26cf893236fd btrfs: fix potential deadlock in the search ioctl
    5e85cae6cd52 btrfs: drop path before adding new uuid tree entry
    be69bb028264 arc: fix memory initialization for systems with two memory banks
    ec96b4b7514c ARC: perf: don't bail setup if pct irq missing in device-tree
    7d5026dcd362 xfs: don't update mtime on COW faults
    9c12f371a2ce ext2: don't update mtime on COW faults
    4e99722219f4 x86/debug: Allow a single level of #DB recursion
    231508fa9a6d x86/entry: Fix AC assertion
    f76c4eab5ce9 tracing/kprobes, x86/ptrace: Fix regs argument order for i386
    98176c9f3a77 iommu/vt-d: Handle 36bit addressing for x86-32
    c93d26ef17b4 include/linux/log2.h: add missing () around n in roundup_pow_of_two()
    03ca1f09ab1f net/packet: fix overflow in tpacket_rcv
    4437dfb7777d iommu/amd: Use cmpxchg_double() when updating 128-bit IRTE
    6b0caba52055 iommu/amd: Restore IRTE.RemapEn bit after programming IRTE
    2551a138792a thermal: qcom-spmi-temp-alarm: Don't suppress negative temp
    7da369acd79f thermal: ti-soc-thermal: Fix bogus thermal shutdowns for omap4430
    7583c56d9092 iommu/vt-d: Serialize IOMMU GCMD register modifications
    a9c41d6214a8 x86, fakenuma: Fix invalid starting node ID
    abbb183229ac tg3: Fix soft lockup when tg3_reset_task() fails.
    594adc1bda7a perf bench: The do_run_multi_threaded() function must use IS_ERR(perf_session__new())
    f42f9c0d115e perf stat: Turn off summary for interval mode by default
    c58ff4b470e8 perf jevents: Fix suspicious code in fixregex()
    62a5784285bf xfs: fix xfs_bmap_validate_extent_raw when checking attr fork of rt files
    c10fa9458aa6 MIPS: SNI: Fix SCSI interrupt
    b5c901d96a59 MIPS: add missing MSACSR and upper MSA initialization
    6aef73907338 net: dp83867: Fix WoL SecureOn password
    d7983d7b64c4 nfp: flower: fix ABI mismatch between driver and firmware
    5c9f765dcd4e net: gemini: Fix another missing clk_disable_unprepare() in probe
    f555d57c8f1b net: bcmgenet: fix mask check in bcmgenet_validate_flow()
    41e233bd6412 fix regression in "epoll: Keep a reference on files added to the check list"
    3cdbbaca1681 net: ethernet: mlx4: Fix memory allocation in mlx4_buddy_init()
    5a48e463f50a perf tools: Correct SNOOPX field offset
    f4b9594e02d5 perf intel-pt: Fix corrupt data after perf inject from
    7ea241e7a0a2 perf cs-etm: Fix corrupt data after perf inject from
    8a435d33c261 perf top/report: Fix infinite loop in the TUI for grouped events
    692d06265574 block: fix locking in bdev_del_partition
    bbb1dc4431b0 MIPS: perf: Fix wrong check condition of Loongson event IDs
    89639c177d04 net: ethernet: ti: am65-cpsw: fix rmii 100Mbit link mode
    eec98f743e40 cxgb4: fix thermal zone device registration
    e5d5c3b4e4a2 opp: Don't drop reference for an OPP table that was never parsed
    3484b664521d netfilter: conntrack: do not auto-delete clash entries on reply
    4aa6128188fb nvme: fix controller instance leak
    db8c729bca37 nvmet-fc: Fix a missed _irqsave version of spin_lock in 'nvmet_fc_fod_op_done()'
    4b5158a2f6b7 netfilter: nfnetlink: nfnetlink_unicast() reports EAGAIN instead of ENOBUFS
    e8df547c81d0 net: dsa: mt7530: fix advertising unsupported 1000baseT_Half
    cbd84d8ef3e9 selftests/bpf: Fix massive output from test_maps
    991ca0615902 media: i2c: imx214: select V4L2_FWNODE
    404f3f27b087 net: ethernet: ti: cpsw_new: fix error handling in cpsw_ndo_vlan_rx_kill_vid()
    b3b321d44175 media: cedrus: Add missing v4l2_ctrl_request_hdl_put()
    60e9f3f036f3 media: vicodec: add missing v4l2_ctrl_request_hdl_put()
    72c7309533b4 bnxt: don't enable NAPI until rings are ready
    531c6cb9ad1e xfs: fix boundary test in xfs_attr_shortform_verify
    91565765b6de xfs: finish dfops on every insert range shift iteration
    81fbc28873ef bnxt_en: fix HWRM error when querying VF temperature
    e4d07b93a26b bnxt_en: Fix possible crash in bnxt_fw_reset_task().
    e0543e56fa62 bnxt_en: Fix PCI AER error recovery flow
    214c19832333 bnxt_en: Fix ethtool -S statitics with XDP or TCs enabled.
    376326004a42 bnxt_en: Check for zero dir entries in NVRAM.
    8fd4262bc8e4 bnxt_en: Don't query FW when netif_running() is false.
    b12fefddb43f net: ethernet: ti: cpsw_new: fix clean up of vlan mc entries for host port
    634b47d46f93 net: ethernet: ti: cpsw: fix clean up of vlan mc entries for host port
    e4fe6bfddafe gtp: add GTPA_LINK info to msg sent to userspace
    f276f4e1b743 dmaengine: ti: k3-udma: Fix the TR initialization for prep_slave_sg
    1185d129364a dmaengine: pl330: Fix burst length if burst size is smaller than bus width
    ad32766990e2 bpf: Fix a buffer out-of-bound access when filling raw_tp link_info
    bb3eebda4e22 net: arc_emac: Fix memleak in arc_mdio_probe
    9ea477348bd2 ravb: Fixed to be able to unload modules
    ab1423e5b4d1 net: systemport: Fix memleak in bcm_sysport_probe
    0c14725cb063 net: hns: Fix memleak in hns_nic_dev_probe
    a949770022f4 netfilter: nf_tables: fix destination register zeroing
    b7d77de2fe79 netfilter: nf_tables: incorrect enum nft_list_attributes definition
    e8261af70717 netfilter: nf_tables: add NFTA_SET_USERDATA if not null
    20a7ee03beba perf top: Skip side-band event setup if HAVE_LIBBPF_SUPPORT is not set
    06a1d6e334b0 perf sched timehist: Fix use of CPU list with summary option
    b1c9e29c933e mmc: sdhci-acpi: Fix HS400 tuning for AMDI0040
    17c1b210b6ea MIPS: BMIPS: Also call bmips_cpu_setup() for secondary cores
    f39c875a8eeb MIPS: mm: BMIPS5000 has inclusive physical caches
    feb72ac627bc rxrpc: Make rxrpc_kernel_get_srtt() indicate validity
    26457829b759 rxrpc: Fix loss of RTT samples due to interposed ACK
    e2674459be67 rxrpc: Keep the ACK serial in a var in rxrpc_input_ack()
    eff6dcb0c388 dmaengine: at_hdmac: add missing kfree() call in at_dma_xlate()
    159db733b2ac dmaengine: at_hdmac: add missing put_device() call in at_dma_xlate()
    e3149ca07e92 dmaengine: at_hdmac: check return value of of_find_device_by_node() in at_dma_xlate()
    c6156f0064b1 batman-adv: bla: use netif_rx_ni when not in interrupt context
    cb6560a41c45 batman-adv: Fix own OGM check in aggregated OGMs
    27cc30cdc8f4 batman-adv: Avoid uninitialized chaddr when handling DHCP
    4b805451419c dmaengine: of-dma: Fix of_dma_router_xlate's of_dma_xlate handling
    6f88924528c8 fsldma: fix very broken 32-bit ppc ioread64 functionality
    adaa55616567 xen/xenbus: Fix granting of vmalloc'd memory
    2c97832bae08 drm/amd/display: Fix memleak in amdgpu_dm_mode_config_init
    fe4e01212478 drm/amd/display: Retry AUX write when fail occurs
    a3a943b6f211 drm/amd/display: Keep current gain when ABM disable immediately
    e7ea08312558 drm/amd/display: Fix passive dongle mistaken as active dongle in EDID emulation
    151ed59e03a9 drm/amd/display: Revert HDCP disable sequence change
    af7dceeda116 drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps object to 0 in amdgpu_dm_update_backlight_caps
    47fd4ba5cc95 drm/amd/display: Reject overlay plane configurations in multi-display scenarios
    35950cec8547 drm/amd/display: should check error using DC_OK
    bd5f4d49094c s390: don't trace preemption in percpu macros
    c3bf0387a0a9 nbd: restore default timeout when setting it to zero
    0f6c545bddd3 cpuidle: Fixup IRQ state
    a3c2bcb3e9e3 irqchip/ingenic: Leave parent IRQ unmasked on suspend
    2659c526f928 drm/omap: fix incorrect lock state
    01a28ac6e917 i2c: iproc: Fix shifting 31 bits
    46653857d015 ceph: don't allow setlease on cephfs
    94fd015fe91f hv_utils: drain the timesync packets on onchannelcallback
    6a725c83a08d hv_utils: return error if host timesysnc update is stale
    4f3ffd5fcbf7 gfs2: add some much needed cleanup for log flushes that fail
    2ed484c404e0 drm/msm/a6xx: fix gmu start on newer firmware
    2ad613d97f96 habanalabs: check correct vmalloc return code
    72038388869b habanalabs: validate FW file size
    9a3acad9ae0e habanalabs: set max power according to card type
    3a24b9420ee0 habanalabs: proper handling of alloc size in coresight
    a8d7e5599614 habanalabs: set clock gating according to mask
    fb8b4592f958 habanalabs: validate packet id during CB parse
    b18c6071868c habanalabs: unmap PCI bars upon iATU failure
    4e2beff0b638 drm/msm: enable vblank during atomic commits
    3fe50ada2a56 nvmet: Disable keep-alive timer when kato is cleared to 0h
    64c064ba11c6 hwmon: (applesmc) check status earlier.
    56ed34ea6cd7 drm/msm: add shutdown support for display platform_driver
    87371d858101 tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
    c92e690c5e23 drm/msm/dpu: fix unitialized variable error
    d33d9115be04 drm/msm/dpu: Fix scale params in plane validation
    6ea918a6197d drm/msm/dpu: Fix reservation failures in modeset
    8ca621939d76 HID: quirks: Always poll three more Lenovo PixArt mice
    7cd0d11c6408 hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_1 telemetry for RAA228228
    b72c392fa3e5 Linux 5.8.7
    839ab6a84a9b scsi: target: tcmu: Optimize use of flush_dcache_page
    ba1bc48691d4 nl80211: fix NL80211_ATTR_HE_6GHZ_CAPABILITY usage
    3def2670934b sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra186
    4710fc20adac sdhci: tegra: Remove SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK for Tegra210
    bb8d1ed450ea arm64: tegra: Add missing timeout clock to Tegra210 SDMMC
    eac502d07d49 arm64: tegra: Add missing timeout clock to Tegra186 SDMMC nodes
    da2d25c35435 arm64: tegra: Add missing timeout clock to Tegra194 SDMMC nodes
    991b02edd133 dt-bindings: mmc: tegra: Add tmclk for Tegra210 and later
    495b506743a1 KVM: arm64: Survive synchronous exceptions caused by AT instructions
    71e9e3ce6a2c KVM: arm64: Add kvm_extable for vaxorcism code
    5b1c0ed9ff3c media: media/v4l2-core: Fix kernel-infoleak in video_put_user()
    ff95152b14f2 perf record/stat: Explicitly call out event modifiers in the documentation
    20257b70d5f1 selftests/x86/test_vsyscall: Improve the process_vm_readv() test
    e80a7602b405 mm: fix pin vs. gup mismatch with gate pages
    331524770431 netfilter: nft_set_rbtree: Handle outcomes of tree rotations in overlap detection
    e771e63c0cdc HID: core: Sanitize event code and type when mapping input
    b070b1e20768 HID: core: Correctly handle ReportSize being zero
    66534fe2b940 Linux 5.8.6
    e54835be930d ALSA: usb-audio: Update documentation comment for MS2109 quirk
    a34b7526320e dma-pool: Fix an uninitialized variable bug in atomic_pool_expand()
    f880d69b2810 drm/vmwgfx/ldu: Use drm_mode_config_reset
    01736d379ece drm/vmwgfx/sou: Use drm_mode_config_reset
    4ba591d72a70 drm/vmwgfx/stdu: Use drm_mode_config_reset
    7947e0ba4cca HID: hiddev: Fix slab-out-of-bounds write in hiddev_ioctl_usage()
    9d960a74b43a mm/page_counter: fix various data races at memsw
    b65258eb82cc fbmem: pull fbcon_update_vcs() out of fb_set_var()
    d88c0bef7070 drm/atomic-helper: reset vblank on crtc reset
    e93fd7a49023 io_uring: make offset == -1 consistent with preadv2/pwritev2
    9ab83e1c4a31 io_uring: don't use poll handler if file can't be nonblocking read/written
    b7e397bcba0a io_uring: don't recurse on tsk->sighand->siglock with signalfd
    b727b92fd33b usb: typec: tcpm: Fix Fix source hard reset response for TDA 2.3.1.1 and TDA 2.3.1.2 failures
    d597f82cc262 usb: typec: ucsi: Hold con->lock for the entire duration of ucsi_register_port()
    3c4cd68799f8 usb: typec: ucsi: Rework ppm_lock handling
    84e29c7cf591 usb: typec: ucsi: Fix 2 unlocked ucsi_run_command calls
    4b59dabd3170 usb: typec: ucsi: Fix AB BA lock inversion
    53965c79c2db USB: Fix device driver race
    a18d5d456c00 USB: Also match device drivers using the ->match vfunc
    0ca26ffe3c1f usb: storage: Add unusual_uas entry for Sony PSZ drives
    fad19f628f53 USB: cdc-acm: rework notification_buffer resizing
    afb420486016 usb: dwc3: gadget: Handle ZLP for sg requests
    8301e3aa1c8d usb: dwc3: gadget: Fix handling ZLP
    d884a90cec5a usb: dwc3: gadget: Don't setup more than requested
    3b9953fe5723 USB: gadget: u_f: Unbreak offset calculation in VLAs
    ae6a5394d9fb USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()
    480e17846d32 USB: gadget: u_f: add overflow checks to VLA macros
    ec5c2663d533 usb: host: ohci-exynos: Fix error handling in exynos_ohci_probe()
    27cf2e50545a USB: Ignore UAS for JMicron JMS567 ATA/ATAPI Bridge
    7eb94ea0e8e9 USB: quirks: Ignore duplicate endpoint on Sound Devices MixPre-D
    155288e45c8d USB: quirks: Add no-lpm quirk for another Raydium touchscreen
    2b9be3af1037 usb: uas: Add quirk for PNY Pro Elite
    495f2f1b53d7 USB: yurex: Fix bad gfp argument
    ccc9838fed80 drm/amd/pm: correct the thermal alert temperature limit settings
    56ab34c44e85 drm/amd/pm: correct Vega20 swctf limit setting
    520e40dcea83 drm/amd/pm: correct Vega12 swctf limit setting
    b46df9eab0cd drm/amd/pm: correct Vega10 swctf limit setting
    686a7f065cd8 drm/amd/powerplay: Fix hardmins not being sent to SMU for RV
    cd9c79f79dd4 drm/amdgpu/gfx10: refine mgcg setting
    54dc92e19008 drm/amd/display: use correct scale for actual_brightness
    83ac52039493 drm/amdgpu: Fix buffer overflow in INFO ioctl
    5f5bd9002bb1 drm/modeset-lock: Take the modeset BKL for legacy drivers
    057423349c34 drm/dp_mst: Don't return error code when crtc is null
    dd36e041bd51 drm/etnaviv: fix external abort seen on GC600 rev 0x19
    74e1bbfb842a drm/i915: Fix cmd parser desc matching with masks
    f07523a5b09a x86/hotplug: Silence APIC only after all interrupts are migrated
    bbf423c28efc x86/irq: Unbreak interrupt affinity setting
    66e1e9bda022 irqchip/stm32-exti: Avoid losing interrupts due to clearing pending bits by mistake
    a1b116511aa8 genirq/matrix: Deal with the sillyness of for_each_cpu() on UP
    8cb3561d084e usbip: Implement a match function to fix usbip
    3c491c441942 crypto: af_alg - Work around empty control messages without MSG_MORE
    1d35dfde2a7d device property: Fix the secondary firmware node handling in set_primary_fwnode()
    9a9cc8c9b1c7 powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
    bdae01670694 powerpc/32s: Disable VMAP stack which CONFIG_ADB_PMU
    3b555853d736 PM: sleep: core: Fix the handling of pending runtime resume requests
    17d66e628058 arm64: vdso32: make vdso32 install conditional
    d36a6712d9f1 KVM: arm64: Set HCR_EL2.PTW to prevent AT taking synchronous exception
    13f35a2c0fd5 io-wq: fix hang after cancelling pending hashed work
    96d020ddff6a xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed
    7d31eaa7e295 xhci: Do warm-reset when both CAS and XDEV_RESUME are set
    50a7c735bc0a usb: host: xhci: fix ep context print mismatch in debugfs
    55c0eeabceb7 usb: host: xhci-tegra: fix tegra_xusb_get_phy()
    c08e590b07e4 usb: host: xhci-tegra: otg usb2/usb3 port init
    68adec4646bf usb: renesas-xhci: remove version check
    2b32323f966d XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt XEN data pointer which contains XEN specific information.
    05ae7cf354b7 writeback: Fix sync livelock due to b_dirty_time processing
    d74c235bd59f writeback: Avoid skipping inode writeback
    dd71dd1dc12f writeback: Protect inode->i_io_list with inode->i_lock
    1506fdcde864 io_uring: clear req->result on IOPOLL re-issue
    116790cfa0b8 serial: 8250: change lock order in serial8250_do_startup()
    89171ef86bdc serial: 8250_exar: Fix number of ports for Commtech PCIe cards
    0a60539b4cd9 serial: stm32: avoid kernel warning on absence of optional IRQ
    df26430356bf serial: pl011: Don't leak amba_ports entry on driver register error
    6648c599db7f serial: pl011: Fix oops on -EPROBE_DEFER
    e3f8041d2434 serial: samsung: Removes the IRQ not found warning
    edc8a4eb10cf vt_ioctl: change VT_RESIZEX ioctl to check for error return from vc_resize()
    2392eea66e66 vt: defer kfree() of vc_screenbuf in vc_do_resize()
    e863ac5f53dc USB: lvtest: return proper error code in probe
    34cf1aff169d fbcon: prevent user font height or width change from causing potential out-of-bounds access
    bb77dd02ba16 btrfs: detect nocow for swap after snapshot delete
    b40d12b7da66 btrfs: fix space cache memory leak after transaction abort
    c7e8c6f46869 btrfs: check the right error variable in btrfs_del_dir_entries_in_log
    204ed5f3f628 btrfs: reset compression level for lzo on remount
    b4cbbc1305f0 blk-mq: order adding requests to hctx->dispatch and checking SCHED_RESTART
    649b6c86ccf7 HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON commands
    7aaaf975dd4c block: loop: set discard granularity and alignment for block device backed loop
    7b85140f7060 block: fix get_max_io_size()
    8245d79338b7 hwmon: (gsc-hwmon) Scale temperature to millidegrees
    faf428a8d81c arm64: Allow booting of late CPUs affected by erratum 1418040
    e028fa961a3a arm64: Move handling of erratum 1418040 into C code
    736d8a6a73be bpf: selftests: global_funcs: Check err_str before strstr
    d5a4d2f25d77 libbpf: Fix map index used in error message
    1c20c32e8a2a powerpc/perf: Fix soft lockups due to missed interrupt accounting
    d3499d206c5d ext4: limit the length of per-inode prealloc list
    61aacc3594c9 bpf: Avoid visit same object multiple times
    2d9018e5e6e2 bpf: Fix a rcu_sched stall issue with bpf task/task_file iterator
    3636ca3d046f drm/amdkfd: fix the wrong sdma instance query for renoir
    eb9f5a5bf402 drm/amdgpu: fix NULL pointer access issue when unloading driver
    833e41f79c77 net: gianfar: Add of_node_put() before goto statement
    a8f90da8480c macvlan: validate setting of multiple remote source MAC addresses
    cd8e4a8c7416 Revert "scsi: qla2xxx: Fix crash on qla2x00_mailbox_command"
    a36de930485f scsi: qla2xxx: Fix null pointer access during disconnect from subsystem
    aa6373e5f9d6 scsi: qla2xxx: Check if FW supports MQ before enabling
    3d2419958fc5 scsi: qla2xxx: Fix login timeout
    eb34d23c9473 scsi: qla2xxx: Indicate correct supported speeds for Mezz card
    580ffb7fd621 scsi: qla2xxx: Flush I/O on zone disable
    2626e3b023ff scsi: qla2xxx: Flush all sessions on zone disable
    018360efe867 scsi: scsi_debug: Fix scp is NULL errors
    56f13789a05a scsi: ufs: Clean up completed request without interrupt notification
    91be3977cc34 scsi: ufs: Improve interrupt handling for shared interrupts
    33cf91947c84 scsi: ufs: Fix possible infinite loop in ufshcd_hold
    4ef551cd2f8b scsi: fcoe: Fix I/O path allocation
    5dd18770d919 selftests: disable rp_filter for icmp_redirect.sh
    8e6025686c8a ALSA: usb-audio: ignore broken processing/extension unit
    ee4dd74d0872 ASoC: wm8994: Avoid attempts to read unreadable registers
    42f9f777f953 s390/cio: add cond_resched() in the slow_eval_known_fn() loop
    f3637a82e1f8 ALSA: hda/realtek: Add model alc298-samsung-headphone
    effc2c1250cf drivers/net/wan/hdlc_x25: Added needed_headroom and a skb->len check
    1ca28e0d9e49 dma-pool: Only allocate from CMA when in same memory zone
    47184b9ddf18 dma-pool: fix coherent pool allocations for IOMMU mappings
    b960e50d6172 can: j1939: transport: j1939_xtp_rx_dat_one(): compare own packets to detect corruptions
    da9c02c50991 selftests/bpf: Correct various core_reloc 64-bit assumptions
    751799b3b2ef selftests/bpf: Fix btf_dump test cases on 32-bit arches
    daca0c13cb12 selftest/bpf: Fix compilation warnings in 32-bit mode
    50bc5a55666e tools/bpftool: Fix compilation warnings in 32-bit mode
    b97071cc83f8 libbpf: Prevent overriding errno when logging errors
    e3a5fa63a2e5 netfilter: avoid ipv6 -> nf_defrag_ipv6 module dependency
    810b3c8b656a selftests/bpf: Fix segmentation fault in test_progs
    4a5e1c465e84 drm/amd/display: Switch to immediate mode for updating infopackets
    04e7daa61fd7 drm/amd/display: Fix LFC multiplier changing erratically
    757460fe2351 drm/amd/powerplay: correct UVD/VCE PG state on custom pptable uploading
    eb7eaabb7fb9 drm/amd/powerplay: correct Vega20 cached smu feature state
    5a2bc176c13d spi: stm32: always perform registers configuration prior to transfer
    accab0677047 spi: stm32: fix stm32_spi_prepare_mbr in case of odd clk_rate
    0e92f6b422db spi: stm32: fix fifo threshold level in case of short transfer
    87fb6c0331bc spi: stm32h7: fix race condition at end of transfer
    c13fd34bc607 fs: prevent BUG_ON in submit_bh_wbc()
    e3e46eaa2f33 ext4: correctly restore system zone info when remount fails
    6c30edde8a3a ext4: handle error of ext4_setup_system_zone() on remount
    c27ed2e8d7f8 ext4: handle option set by mount flags correctly
    5482fa036756 jbd2: abort journal if free a async write error metadata buffer
    1ca3e7d0cc00 ext4: abort the filesystem if failed to async write metadata buffer
    c8bf676fff3e drm/virtio: fix memory leak in virtio_gpu_cleanup_object()
    f2fb15e7e037 ext4: skip non-loaded groups at cr=0/1 when scanning for good groups
    a245fa7062a6 ext4: handle read only external journal device
    d558851e5ff4 ext4: don't BUG on inconsistent journal feature
    55be43c8b123 jbd2: make sure jh have b_transaction set in refile/unfile_buffer
    9b04463ab475 spi: stm32: clear only asserted irq flags on interrupt
    a5d6a17faf19 video: fbdev: controlfb: Fix build for COMPILE_TEST=y && PPC_PMAC=n
    7fee32de555b usb: gadget: f_tcm: Fix some resource leaks in some error paths
    2813786a5b89 vdpa: ifcvf: free config irq in ifcvf_free_irq()
    5bd342db2db7 vdpa: ifcvf: return err when fail to request config irq
    b9080a8d8237 i2c: rcar: in slave mode, clear NACK earlier
    f24ffc31709b i2c: core: Don't fail PRP0001 enumeration when no ID table exist
    a416b1e870b1 drm/etnaviv: always start/stop scheduler in timeout processing
    87789f561e39 habanalabs: Fix memory corruption in debugfs
    6f43d2f469bf null_blk: fix passing of REQ_FUA flag in null_handle_rq
    e05f3c879aa8 nvme: multipath: round-robin: fix single non-optimized path case
    afb511ebb78a nvme-fc: Fix wrong return value in __nvme_fc_init_request()
    227064b2ca9e nvmet: fix a memory leak
    614b266f69fe blkcg: fix memleak for iolatency
    b5ce818355a8 blk-mq: insert request not through ->queue_rq into sw/scheduler queue
    3cea38246ad4 hwmon: (nct7904) Correct divide by 0
    4346396a717d bfq: fix blkio cgroup leakage v4
    700d01d85ebb block: Fix page_is_mergeable() for compound pages
    103942e19ae4 drm/msm/adreno: fix updating ring fence
    58794696d3d8 block: virtio_blk: fix handling single range discard request
    b31d83181f99 block: respect queue limit of max discard segment
    e2655c17ee2e nfsd: fix oops on mixed NFSv4/NFSv3 client access
    ccba36760ca3 ALSA: usb-audio: Add capture support for Saffire 6 (USB 1.1)
    be85585a0617 cpufreq: intel_pstate: Fix EPP setting via sysfs in active mode
    ce9d78bce0ef PM / devfreq: Fix the wrong end with semicolon
    6eacb4639e22 PCI: qcom: Add missing reset for ipq806x
    e78ff09ed4c3 PCI: qcom: Change duplicate PCI reset to phy reset
    ff381a46439a PCI: qcom: Add missing ipq806x clocks in PCIe driver
    0b91c538cedb net: openvswitch: introduce common code for flushing flows
    2a80aa3a41d4 arm64: Fix __cpu_logical_map undefined issue
    d91fe6fa0d84 efi: provide empty efi_enter_virtual_mode implementation
    14e6b3725ff0 pinctrl: mediatek: fix build for tristate changes
    08074471105f pinctrl: mediatek: avoid virtual gpio trying to set reg
    f02889decdc2 brcmfmac: Set timeout value when configuring power save
    1bbd2c5daed7 mmc: sdhci-of-arasan: fix timings allocation code
    b082d42f1c17 USB: sisusbvga: Fix a potential UB casued by left shifting a negative value
    7278a1b0a17f dmaengine: idxd: fix PCI_MSI build errors
    2757d46ff9cd powerpc/spufs: add CONFIG_COREDUMP dependency
    34f379956e9d KVM: arm64: Fix symbol dependency in __hyp_call_panic_nvhe
    22c3762014e2 drm/amd/display: fix compilation error on allmodconfig
    ad18857f5958 drm/amd/display: change global buffer to local buffer
    a539e86e8396 media: i2c: imx290: fix reset GPIO pin handling
    22dcf9b459e4 media: davinci: vpif_capture: fix potential double free
    f2231eeadd1b hugetlbfs: prevent filesystem stacking of hugetlbfs
    a11488640c6f EDAC/ie31200: Fallback if host bridge device is already initialized
    3e93d48ee60e i2c: i801: Add support for Intel Tiger Lake PCH-H
    e805b1ffc9be scsi: fcoe: Memory leak fix in fcoe_sysfs_fcf_del()
    3bd5dad493e5 ceph: do not access the kiocb after aio requests
    e9c34e71a043 ceph: fix potential mdsc use-after-free crash
    8ceddd70a682 netfilter: nf_tables: report EEXIST on overlaps
    71e86271b49b scsi: iscsi: Do not put host in iscsi_set_flashnode_param()
    b83f035a0fcc btrfs: make btrfs_qgroup_check_reserved_leak take btrfs_inode
    3b616321576e btrfs: file: reserve qgroup space after the hole punch range is locked
    4754db363cfd locking/lockdep: Fix overflow in presentation of average lock-time
    e95673aa1263 drm/nouveau: Fix reference count leak in nouveau_connector_detect
    62f9a8747340 drm/nouveau: fix reference count leak in nv50_disp_atomic_commit
    84708092d685 drm/nouveau/drm/noveau: fix reference count leak in nouveau_fbcon_open
    02465b9d38c9 f2fs: fix use-after-free issue
    f9bd216ca5bb HID: quirks: add NOGET quirk for Logitech GROUP
    acae5555c9c1 ASoC: Intel: sof_sdw_rt711: remove properties in card remove
    72db989557d9 cec-api: prevent leaking memory through hole in structure
    41399a7d4f50 gpu: host1x: Put gather's BO on pinning error
    4afc97f8ad5f ALSA: hda: Add support for Loongson 7A1000 controller
    674772bf76c9 mips/vdso: Fix resource leaks in genvdso.c
    90019585a606 rtlwifi: rtl8192cu: Prevent leaking urb
    d5d5a10574f8 ARM: dts: ls1021a: output PPS signal on FIPER2
    24a3bc57b937 PCI: Fix pci_create_slot() reference count leak
    19aa529aabea omapfb: fix multiple reference count leaks due to pm_runtime_get_sync
    fcd0ea8ff7f8 MIPS: KVM: Limit Trap-and-Emulate to MIPS32R2 only
    7fafbbefb758 f2fs: fix error path in do_recover_data()
    26bf496cd1b6 f2fs: remove write attribute of main_blkaddr sysfs node
    c06a07ab8a3d selftests/powerpc: Purge extra count_pmc() calls of ebb selftests
    cca4669a9768 scsi: target: Fix xcopy sess release leak
    bce0f660a06a xfs: Don't allow logging of XFS_ISTALE inodes
    2b5055b3aa5b scsi: lpfc: Fix shost refcount mismatch when deleting vport
    04cde704f329 drm/amdgpu/pm: fix ref count leak when pm_runtime_get_sync fails
    4e302836dc79 drm/amdkfd: fix ref count leak when pm_runtime_get_sync fails
    2e91283fdb45 drm/amdgpu/fence: fix ref count leak when pm_runtime_get_sync fails
    e4fdcdb7837c drm/amdgpu/display: fix ref count leak when pm_runtime_get_sync fails
    b86657e328b6 drm/amdgpu: fix ref count leak in amdgpu_display_crtc_set_config
    c04caca229c4 drm/amd/display: fix ref count leak in amdgpu_drm_ioctl
    8b73bed1e964 drm/amdgpu: fix ref count leak in amdgpu_driver_open_kms
    bedae9feaca9 drm/radeon: fix multiple reference count leak
    d312f436dd10 drm/amdkfd: Fix reference count leaks.
    b7850ba6edf0 platform/chrome: cros_ec_sensorhub: Fix EC timestamp overflow
    c71c249310b5 iommu/iova: Don't BUG on invalid PFNs
    8bcd6545f0b4 mfd: intel-lpss: Add Intel Tiger Lake PCH-H PCI IDs
    d7570375e9f2 scsi: target: tcmu: Fix crash on ARM during cmd completion
    4b0badbe3c91 staging: rts5208: fix memleaks on error handling paths in probe
    46381f4d0c1a blktrace: ensure our debugfs dir exists
    2145297ac316 gcc-plugins/stackleak: Don't instrument itself
    27a22e3c1645 media: pci: ttpci: av7110: fix possible buffer overflow caused by bad DMA value in debiirq()
    d75f8e2c9d6a powerpc/xive: Ignore kmemleak false positives
    970f32a28429 arm64: dts: qcom: msm8916: Pull down PDM GPIOs during sleep
    6a5bd8b333b8 mfd: intel-lpss: Add Intel Emmitsburg PCH PCI IDs
    dd80a7201ed7 ASoC: tegra: Fix reference count leaks.
    d5581a8e323c ASoC: img-parallel-out: Fix a reference count leak
    c340a3b9da14 ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt
    7d60c7760631 EDAC/mc: Call edac_inc_ue_error() before panic
    ec24c53a4d0c drm/amdgpu: fix RAS memory leak in error case
    9cc4449aae8c ALSA: hda/hdmi: Use force connectivity quirk on another HP desktop
    3d41fe81e646 ALSA: hda/realtek: Fix pin default on Intel NUC 8 Rugged
    9a87d126b662 ALSA: pci: delete repeated words in comments
    ed2cdce09912 ALSA: hda/hdmi: Add quirk to force connectivity
    d4dadf0c5a07 ASoC: intel/skl/hda - fix probe regression on systems without i915
    bd331906c61b khugepaged: khugepaged_test_exit() check mmget_still_valid()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 8b9dc70aba..e3a483fbe4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_meta ?= "80452c7c245ed02e8dda4b1c519aa270b5e73256"
+SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.5"
+LINUX_VERSION ?= "5.8.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index d0da4edb61..26f34289fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.5"
+LINUX_VERSION ?= "5.8.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5bc60299c57b6dd6d88cd3196e1a3949a4365214"
-SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_meta ?= "80452c7c245ed02e8dda4b1c519aa270b5e73256"
+SRCREV_machine_qemuarm ?= "14a8e34bdcc80797e7b3355241625f13d3396ed8"
+SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index cd34504946..c232614c21 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "683da0bfdf000de0d65dc4a3c66bdc9906735144"
-SRCREV_machine_qemuarm64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_machine_qemumips ?= "a86380b2bc78d8a40af8608569fe8d7f88f1bfd7"
-SRCREV_machine_qemuppc ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_machine_qemuriscv64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_machine_qemux86 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_machine_qemux86-64 ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_machine_qemumips64 ?= "c0568a8edccef3a9bb29c2c4911b8200892c23f2"
-SRCREV_machine ?= "ded3e9afb3262feb367227c63da1f762f893b192"
-SRCREV_meta ?= "80452c7c245ed02e8dda4b1c519aa270b5e73256"
+SRCREV_machine_qemuarm ?= "0e9ceeb178a44d70be22088205d9e6b52f9feb3f"
+SRCREV_machine_qemuarm64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_machine_qemumips ?= "68ccca78b4c670e7db82ee7d5aa289abb4910ebe"
+SRCREV_machine_qemuppc ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_machine_qemuriscv64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_machine_qemux86 ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_machine_qemux86-64 ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_machine_qemumips64 ?= "18d9d696a89282b3c7b9d3a0b4bbe9d5500e9eb3"
+SRCREV_machine ?= "542471b271e827808692640e58f8771ff6bc67dc"
+SRCREV_meta ?= "f79c81e7a7d995f0ddb3114000555b25f4649373"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.5"
+LINUX_VERSION ?= "5.8.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

