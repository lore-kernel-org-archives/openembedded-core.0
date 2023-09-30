Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360DFE748E9
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:45 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.47416.1696102843649531891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q8oWsL8u;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.52, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1dce0c05171so6899924fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102842; x=1696707642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDmQubCFR19nq4C45h7utQWHsvbhL46QQEBCdJc7BIA=;
        b=q8oWsL8uV6pqyuyLsy8tuM8ZE4y2gnBIWJKotiEmC500mP2zu6Z1eStqPMbiOKaj8N
         fIshOBf5CH/vk2p/jjIbvHSP09C9lVOZrMah1HMJKzLbDu0z5mpjeIkpKKI/hUnUE6iA
         CJwOCMZR/AmNuPEOq4XS+eyDtuLSnvAA5ULlTmfSlo5LfT88dkc7XXsXLJhCvoPJzLeG
         wciK5NV1FiL9QXAI/DSiq84hI5cSikRdkq7sHw9elMOgsjBajYDy5k1nj3/yQTa0JLUq
         eCBlTBAuSUDNRaX3P3ONrBrLU9V9sS0o8+RW1PUEyKa73vIr7DopiJgzkrDMrfR0vwUK
         TXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102842; x=1696707642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDmQubCFR19nq4C45h7utQWHsvbhL46QQEBCdJc7BIA=;
        b=hnOiN25kDMlBspXSRrbuGZx8pILx+94N+UeSmkJrEK23LmFGgu8eUZyBE4AkZgaHVh
         8O7EwUVRTFVkuvI2t5+8XJa6+FoHUnQuaDW8G47Z21NrdJAOqnjXp6kWmnZUt7q2gJat
         Dw3cPS4Q+LRjHkZ2AvgqyPJiHywH/lwuQyknphqqkDhLxczoOf5oAM8ld6TJOEqN2j/H
         yhO96zhrtVEcIqaMAhwvXv1wdDtAM3vY1Ku7XYINxz1lmEcXNDwI64JvjHW0VorEG6yN
         PPesCFqtC53JUlP95ar8VXYVdlk47b7asYkYSU9GLp0KMNkR4R3LKcLuQ4DgR2uoI70o
         FIqQ==
X-Gm-Message-State: AOJu0YwCCPET3pPJagOowENoK1TMxiMNOEzHBl3jDZj/+VjTfhLFV/41
	xQyajn2Hq+yRqOFVGFKNfiOm1Y/yu5MH5WQ618g=
X-Google-Smtp-Source: AGHT+IGjYR37pK0j2BaV3jPUAGRPRw0jr0t87fqfKmszMwibb5uE/9C4IL2H3lWTQ21FPhG2ZhHFmQ==
X-Received: by 2002:a05:6871:821:b0:1d5:e15c:5dba with SMTP id q33-20020a056871082100b001d5e15c5dbamr10173996oap.45.1696102842304;
        Sat, 30 Sep 2023 12:40:42 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/13] linux-yocto/5.4: update to v5.4.257
Date: Sat, 30 Sep 2023 09:40:10 -1000
Message-Id: <0111b5b152c1bcff0ab26cf8632ca9002237f070.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188478

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a140610d8aff Linux 5.4.257
    42900fd140c8 net/sched: Retire rsvp classifier
    b3637835ac99 drm/amdgpu: fix amdgpu_cs_p1_user_fence
    650ebbba5c15 mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
    b1ef1f2f3737 ext4: fix rec_len verify error
    e4efb0aaf288 scsi: megaraid_sas: Fix deadlock on firmware crashdump
    44654114fb6f i2c: aspeed: Reset the i2c controller when timeout occurs
    ce47fe53f78b tracefs: Add missing lockdown check to tracefs_create_dir()
    b6c042d4ac6a nfsd: fix change_info in NFSv4 RENAME replies
    952e477f9080 tracing: Have option files inc the trace array ref count
    ff8cf370d359 tracing: Have current_trace inc the trace array ref count
    a70c6e57316b btrfs: fix lockdep splat and potential deadlock after failure running delayed items
    8e8dcc0f1518 attr: block mode changes of symlinks
    a8403f9fd402 md/raid1: fix error: ISO C90 forbids mixed declarations
    349640248b5e selftests: tracing: Fix to unmount tracefs for recovering environment
    5b50c95cf842 btrfs: compare the correct fsid/metadata_uuid in btrfs_validate_super
    b61aad18b38a btrfs: add a helper to read the superblock metadata_uuid
    bd0fe5489102 btrfs: move btrfs_pinned_by_swapfile prototype into volumes.h
    a04cce3e79c6 perf tools: Add an option to build without libbfd
    f3701ef61fd7 perf jevents: Make build dependency on test JSONs
    a12e9ba7f346 tools features: Add feature test to check if libbfd has buildid support
    964e025ceefd kobject: Add sanity check for kset->kobj.ktype in kset_register()
    545d1070ed7c media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
    44d72e9edd1b serial: cpm_uart: Avoid suspicious locking
    2cbe6a88fbdd scsi: target: iscsi: Fix buffer overflow in lio_target_nacl_info_show()
    9cd6b3802d7c usb: gadget: fsl_qe_udc: validate endpoint index for ch9 udc
    abe0cd279aee media: pci: cx23885: replace BUG with error return
    641e60223971 media: tuners: qt1010: replace BUG_ON with a regular error
    991c77fe18c6 media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()
    8dc5b370254a media: anysee: fix null-ptr-deref in anysee_master_xfer
    0c02eb70b1dd media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
    beb9550494e7 media: dw2102: Fix null-ptr-deref in dw2102_i2c_transfer()
    b49c6e5dd236 media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer
    7ffe14fce742 powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
    5873df019512 jfs: fix invalid free of JFS_IP(ipimap)->i_imap in diUnmount
    b12ccbfdf653 fs/jfs: prevent double-free in dbUnmount() after failed jfs_remount()
    a7fde3d46ac6 ext2: fix datatype of block number in ext2_xattr_set2()
    25a68f2286be md: raid1: fix potential OOB in raid1_remove_disk()
    77918680ab07 bus: ti-sysc: Configure uart quirks for k3 SoC
    279e32b79d03 drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()
    3beb97bed860 wifi: mac80211_hwsim: drop short frames
    6773ea9982dc alx: fix OOB-read compiler warning
    fd1a177d2ccb mmc: sdhci-esdhc-imx: improve ESDHC_FLAG_ERR010450
    ff75c853b7db tpm_tis: Resend command to recover from data transfer errors
    61f5453e9706 crypto: lib/mpi - avoid null pointer deref in mpi_cmp_ui()
    d1473fc030d3 wifi: mwifiex: fix fortify warning
    38eb4ef67f60 wifi: ath9k: fix printk specifier
    93f4a0b74413 devlink: remove reload failed checks in params get/set callbacks
    aadb178c5123 hw_breakpoint: fix single-stepping when using bpf_overflow_handler
    cb37e7fa2339 perf/smmuv3: Enable HiSilicon Erratum 162001900 quirk for HIP08/09
    4de282f49135 ACPI: video: Add backlight=native DMI quirk for Lenovo Ideapad Z470
    d0a13c395e22 kernel/fork: beware of __put_task_struct() calling context
    3bf4463e40a1 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
    117fb80cd1e6 locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
    7afbfde45d66 btrfs: output extra debug info if we failed to find an inline backref
    6079dc77c6f3 autofs: fix memory leak of waitqueues in autofs_catatonic_mode
    8c027a5798f1 parisc: Drop loops_per_jiffy from per_cpu struct
    4316b8294503 drm/amd/display: Fix a bug when searching for insert_above_mpcc
    1ce8362b4ac6 kcm: Fix error handling for SOCK_DGRAM in kcm_sendmsg().
    b5fc6fd660ab ixgbe: fix timestamp configuration code
    f9f3ce7719eb net/tls: do not free tls_rec on async operation in bpf_exec_tx_verdict()
    08d36f317c40 platform/mellanox: mlxbf-tmfifo: Drop jumbo frames
    0507815ae94b mlxbf-tmfifo: sparse tags for config access
    7efc9e97f6e2 platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no more descriptors
    479c71cda14b kcm: Fix memory leak in error path of kcm_sendmsg()
    c565533407cd r8152: check budget for r8152_poll()
    653fbddbdfc6 net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
    ba6673824efa net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
    5624f26a3574 net: ipv4: fix one memleak in __inet_del_ifa()
    e757ca9c1ca1 clk: imx8mm: Move 1443X/1416X PLL clock structure to common place
    75e0bd976154 ARM: dts: BCM5301X: Extend RAM to full 256MB for Linksys EA6500 V2
    5f71716772b8 usb: typec: bus: verify partner exists in typec_altmode_attention
    14fe0f8627f8 usb: typec: tcpm: Refactor tcpm_handle_vdm_request
    979f8743f373 usb: typec: tcpm: Refactor tcpm_handle_vdm_request payload handling
    6ca8e31480b5 perf tools: Handle old data in PERF_RECORD_ATTR
    dffa46d0ca52 perf hists browser: Fix hierarchy mode header
    6095dd28217e mtd: rawnand: brcmnand: Fix potential false time out warning
    aae45746f4ae mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
    09417fbf12f8 mtd: rawnand: brcmnand: Fix crash during the panic_write
    aa64f6f0ce7e btrfs: use the correct superblock to compare fsid in btrfs_validate_super
    6eb1fc314ce4 btrfs: don't start transaction when joining with TRANS_JOIN_NOSTART
    b0d236e3afac fuse: nlookup missing decrement in fuse_direntplus_link
    0e918d7c00da ata: pata_ftide010: Add missing MODULE_DESCRIPTION
    e03ac1773414 ata: sata_gemini: Add missing MODULE_DESCRIPTION
    118db787bab3 sh: boards: Fix CEU buffer size passed to dma_declare_coherent_memory()
    89099d73b2dd net: hns3: fix the port information display when sfp is absent
    a44602888bbe netfilter: nfnetlink_osf: avoid OOB read
    62c363e6041c ip_tunnels: use DEV_STATS_INC()
    a5dffc12038f idr: fix param name in idr_alloc_cyclic() doc
    6b0cb9c05584 s390/zcrypt: don't leak memory if dev_set_name() fails
    c149b61301fe igb: Change IGB_MIN to allow set rx/tx value between 64 and 80
    4a5defbfe88b igbvf: Change IGBVF_MIN to allow set rx/tx value between 64 and 80
    c805b8741476 igc: Change IGC_MIN to allow set rx/tx value between 64 and 80
    8047a4898498 kcm: Destroy mutex in kcm_exit_net()
    a6d11571b91d net: sched: sch_qfq: Fix UAF in qfq_dequeue()
    f1ba9a03b166 af_unix: Fix data race around sk->sk_err.
    1ffed3ea8750 af_unix: Fix data-races around sk->sk_shutdown.
    5d91b7891f4a af_unix: Fix data-race around unix_tot_inflight.
    adcf4e069358 af_unix: Fix data-races around user->unix_inflight.
    e13db62db9ef net: ipv6/addrconf: avoid integer underflow in ipv6_create_tempaddr
    23b4b1a069e9 veth: Fixing transmit return status for dropped packets
    0133bc289720 igb: disable virtualization features on 82580
    41f10a4d78fe net: read sk->sk_family once in sk_mc_loop()
    cd12efc54ff8 ipv4: annotate data-races around fi->fib_dead
    01585fa32650 sctp: annotate data-races around sk->sk_wmem_queued
    04301da4d870 pwm: lpc32xx: Remove handling of PWM channels
    565f7bb0b3fe watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow auto-load
    7a0e41223e98 perf top: Don't pass an ERR_PTR() directly to perf_session__delete()
    c5be10f1bf61 x86/virt: Drop unnecessary check on extended CPUID level in cpu_has_svm()
    1d0cc1a9c4bd perf annotate bpf: Don't enclose non-debug code with an assert()
    c7cc4dc2473c kconfig: fix possible buffer overflow
    0158dab8e8b8 NFSv4/pnfs: minor fix for cleanup path in nfs4_get_device_info
    64c5e916fabe soc: qcom: qmi_encdec: Restrict string length in decode
    5c7608d976ab clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
    b88626c47217 parisc: led: Reduce CPU overhead for disk & lan LED computation
    536f30922556 parisc: led: Fix LAN receive and transmit LEDs
    cbfffe51221b lib/test_meminit: allocate pages up to order MAX_ORDER
    9b7f6e500969 drm/ast: Fix DRAM init on AST2200
    8ffa40ff64aa fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
    6d5eb57a02a5 scsi: qla2xxx: Remove unsupported ql2xenabledif option
    e24bc58113d1 scsi: qla2xxx: Turn off noisy message log
    05935f9106f1 scsi: qla2xxx: Fix erroneous link up failure
    61641000ad33 scsi: qla2xxx: fix inconsistent TMF timeout
    f966dc8c2d18 net/ipv6: SKB symmetric hash should incorporate transport ports
    d31331e2df6e drm: fix double free for gbo in drm_gem_vram_init and drm_gem_vram_create
    34eb4bd9152c udf: initialize newblock to 0
    206d2b7bafc0 usb: typec: tcpci: clear the fault status bit
    824421868102 serial: sc16is7xx: fix broken port 0 uart init
    159bc8c6b5db sc16is7xx: Set iobase to device index
    355ac795843f cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
    5e7d0acc69b5 crypto: stm32 - fix loop iterating through scatterlist for DMA
    306e356d583d s390/ipl: add missing secure/has_secure file to ipl type 'unknown'
    e972231db29b pstore/ram: Check start of empty przs during init
    b6c9d040191f fsverity: skip PKCS#7 parser when keyring is empty
    712491c9abf2 net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
    15b3727108c7 X.509: if signature is unsupported skip validation
    7a7dd70cb954 dccp: Fix out of bounds access in DCCP error handler
    1c675c937cb2 dlm: fix plock lookup when using multiple lockspaces
    8cd1c5cec6c9 parisc: Fix /proc/cpuinfo output for lscpu
    0337bb53cb7d procfs: block chmod on /proc/thread-self/comm
    2e1f12ce0da7 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
    eb1fa4819d9c ntb: Fix calculation ntb_transport_tx_free_entry()
    b2a6a169c222 ntb: Clean up tx tail index on link down
    94491412a2af ntb: Drop packets when qp link is down
    ff3bb51e2136 media: dvb: symbol fixup for dvb_attach()
    b047ac1528a1 xtensa: PMU: fix base address for the newer hardware
    2791a2a69a2c backlight/lv5207lp: Compare against struct fb_info.device
    bc86f29e1281 backlight/bd6107: Compare against struct fb_info.device
    3dd8ff569596 backlight/gpio_backlight: Compare against struct fb_info.device
    c2e1ce4fa498 ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()
    f53ab5a2bf20 ipmi_si: fix a memleak in try_smi_init()
    e7f97980f735 ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
    29811f4b8255 PM / devfreq: Fix leak in devfreq_dev_release()
    c2ad60ed38b8 igb: set max size RX buffer when store bad packet is enabled
    d44403ec0676 skbuff: skb_segment, Call zero copy functions before using skbuff frags
    64831fb6a204 netfilter: xt_sctp: validate the flag_info count
    28ce8495b559 netfilter: xt_u32: validate user space input
    109e830585e8 netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
    3d54e9949930 igmp: limit igmpv3_newpack() packet size to IP_MAX_MTU
    ec6ad9d99ef4 virtio_ring: fix avail_wrap_counter in virtqueue_add_packed
    12fcca2ee445 cpufreq: Fix the race condition while updating the transition_task of policy
    fe5dd3950178 dmaengine: ste_dma40: Add missing IRQ check in d40_probe
    e0f2d85ea3d0 um: Fix hostaudio build errors
    88d508faf3dd mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
    efa7f31669f0 rpmsg: glink: Add check for kstrdup
    d2473df751d2 phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
    f36a06988c19 phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate
    b0d5d77b14b4 phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
    90e037cabc2c tracing: Fix race issue between cpu buffer write and swap
    ac78921ec246 x86/speculation: Mark all Skylake CPUs as vulnerable to GDS
    df7ca43fe090 HID: multitouch: Correct devm device reference for hidinput input_dev name
    cf48a7ba5c09 HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()
    011daffb53ce RDMA/siw: Correct wrong debug message
    35a78898cdfd RDMA/siw: Balance the reference of cep->kref in the error path
    9b6296861a5a Revert "IB/isert: Fix incorrect release of isert connection"
    03db4fe7917b amba: bus: fix refcount leak
    93a4aefa5745 serial: tegra: handle clk prepare error in tegra_uart_hw_init()
    d2bf25674cea scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock
    b1e3199bade0 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
    103b41e97275 media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
    009b1202a099 media: ov2680: Fix vflip / hflip set functions
    560624cf1d3a media: ov2680: Fix ov2680_bayer_order()
    218b60bc06bc media: ov2680: Remove auto-gain and auto-exposure controls
    768d4d230c02 media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
    c04ae531eea6 media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
    916219c523e0 media: i2c: ov5640: Configure HVP lines in s_power callback
    93c518d28600 USB: gadget: f_mass_storage: Fix unused variable warning
    0d8c6770983e media: go7007: Remove redundant if statement
    38269b9ec843 iommu/vt-d: Fix to flush cache of PASID directory table
    a94aaffe9290 IB/uverbs: Fix an potential error pointer dereference
    c3a679853826 driver core: test_async: fix an error code
    27a218419c86 dma-buf/sync_file: Fix docs syntax
    c9e6c1fefcd5 coresight: tmc: Explicit type conversions to prevent integer overflow
    463934ca5d98 scsi: qedf: Do not touch __user pointer in qedf_dbg_fp_int_cmd_read() directly
    668ce8d508a3 scsi: qedf: Do not touch __user pointer in qedf_dbg_debug_cmd_read() directly
    06a2dde58f40 scsi: qedf: Do not touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly
    e26d52128691 x86/APM: drop the duplicate APM_MINOR_DEV macro
    c65be6ad55e5 serial: sprd: Fix DMA buffer leak issue
    730d1b7ec94c serial: sprd: Assign sprd_port after initialized to avoid wrong access
    dff8066579c0 serial: sprd: remove redundant sprd_port cleanup
    a7d80271a150 serial: sprd: getting port index via serial aliases only
    47f3be62eab5 scsi: qla4xxx: Add length check when parsing nlattrs
    bc66e701ca8f scsi: be2iscsi: Add length check when parsing nlattrs
    161d4509dde4 scsi: iscsi: Add strlen() check in iscsi_if_set{_host}_param()
    bc4fbf2dab31 usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
    de4345fe4312 media: mediatek: vcodec: Return NULL if no vdec_fb is found
    02c0ea731f31 media: cx24120: Add retval check for cx24120_message_send()
    75d6ef197c48 media: dvb-usb: m920x: Fix a potential memory leak in m920x_i2c_xfer()
    74697b417624 media: dib7000p: Fix potential division by zero
    afd90d353f80 drivers: usb: smsusb: fix error handling code in smsusb_init_device
    4bc5ffaf8ac4 media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()
    008b334af84a media: v4l2-fwnode: simplify v4l2_fwnode_parse_link
    064e156e9f66 media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
    7a9619e38c2b NFS: Guard against READDIR loop when entry names exceed MAXNAMELEN
    16282aeca44b NFSD: da_addr_body field missing in some GETDEVICEINFO replies
    93a14ab67582 fs: lockd: avoid possible wrong NULL parameter
    d3351799be41 jfs: validate max amount of blocks before allocation.
    65bf8a196ba2 powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
    650803f93dd8 nfs/blocklayout: Use the passed in gfp flags
    68ba08ab40c5 wifi: ath10k: Use RMW accessors for changing LNKCTL
    ab28c56192f5 drm/radeon: Use RMW accessors for changing LNKCTL
    d835a13232c0 drm/radeon: Prefer pcie_capability_read_word()
    06c0c15ab03c drm/radeon: Replace numbers with PCI_EXP_LNKCTL2 definitions
    30e633dbcd4c drm/radeon: Correct Transmit Margin masks
    108ce391d6da drm/amdgpu: Use RMW accessors for changing LNKCTL
    7085f1aab194 drm/amdgpu: Prefer pcie_capability_read_word()
    62a1c1bd45d8 drm/amdgpu: Replace numbers with PCI_EXP_LNKCTL2 definitions
    adf810206cca drm/amdgpu: Correct Transmit Margin masks
    7f9129b66c87 PCI: Add #defines for Enter Compliance, Transmit Margin
    81d1de3b9793 powerpc/fadump: reset dump area size if fadump memory reserve fails
    7159a27b1ac1 clk: imx: composite-8m: fix clock pauses when set_rate would be a no-op
    044ff5356a3b PCI/ASPM: Use RMW accessors for changing LNKCTL
    73d73556ed1d PCI: pciehp: Use RMW accessors for changing LNKCTL
    e7e3268ae9b7 PCI: Mark NVIDIA T4 GPUs to avoid bus reset
    a611e38d5b94 clk: sunxi-ng: Modify mismatched function name
    9ad9cca12b10 drivers: clk: keystone: Fix parameter judgment in _of_pll_clk_init()
    de677f4379fa ipmi:ssif: Fix a memory leak when scanning for an adapter
    ef0d286989b1 ipmi:ssif: Add check for kstrdup
    90fddb87892e ALSA: ac97: Fix possible error value of *rac97
    0b1e48e4dccb of: unittest: Fix overlay type in apply/revert check
    0a6f39488c38 drm/mediatek: Fix potential memory leak if vmap() fail
    f6364fa751d7 audit: fix possible soft lockup in __audit_inode_child()
    43f0c2bb16af smackfs: Prevent underflow in smk_set_cipso()
    b8a61df6f404 drm/msm/mdp5: Don't leak some plane state
    1f3d0e65d111 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
    dbdc828991ae drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
    4db0a85cf865 drm/armada: Fix off-by-one error in armada_overlay_get_property()
    dadf0d0dfcc8 of: unittest: fix null pointer dereferencing in of_unittest_find_node_by_name()
    def1fd88ae97 drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
    c1ff601e1aa5 drm/tegra: Remove superfluous error messages around platform_get_irq()
    1603f086200a md/md-bitmap: hold 'reconfig_mutex' in backlog_store()
    630be0110e6a md/bitmap: don't set max_write_behind if there is no write mostly device
    a8f8c4e7281c drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
    c6b423ab655c arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
    69d9fb39480c ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
    e6fc20a5425b drm: adv7511: Fix low refresh rate register for ADV7533/5
    88d32b9ad274 ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
    dfe36c23abf9 ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
    febead00308f ARM: dts: s5pv210: correct ethernet unit address in SMDKV210
    00b3f8004bdc ARM: dts: s5pv210: use defines for IRQ flags in SMDKV210
    9dff1deb2507 ARM: dts: s5pv210: add RTC 32 KHz clock in SMDKV210
    df9929c61c9d ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
    c20456c2cd29 ARM: dts: s3c64xx: align pinctrl with dtschema
    a355d140eb49 ARM: dts: s3c6410: align node SROM bus node name with dtschema in Mini6410
    e5deee40fa04 ARM: dts: s3c6410: move fixed clocks under root node in Mini6410
    d38b67da1572 drm/etnaviv: fix dumping of active MMU context
    5b8c8527a2c3 ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
    5680c01363ea ARM: dts: BCM53573: Add cells sizes to PCIe node
    17a5848bdca0 ARM: dts: BCM53573: Drop nonexistent "default-off" LED trigger
    c01cbe6c0345 drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
    d40c192e1198 quota: fix dqput() to follow the guarantees dquot_srcu should provide
    dd918952b1ed quota: add new helper dquot_active()
    88c0cdfe10fb quota: rename dquot_active() to inode_quota_active()
    29d7249bb61c quota: factor out dquot_write_dquot()
    f2f64c2951a3 quota: avoid increasing DQST_LOOKUPS when iterating over dirty/inuse list
    1e4f7ce32a1d drm/bridge: tc358764: Fix debug print parameter order
    835f0a848a8b netrom: Deny concurrent connect().
    da13749d5ff7 net/sched: sch_hfsc: Ensure inner classes have fsc curve
    83382eafc745 mlxsw: i2c: Limit single transaction buffer size
    b2d7f0f313b8 mlxsw: i2c: Fix chunk size setting in output mailbox buffer
    400ef5f79c90 net: arcnet: Do not call kfree_skb() under local_irq_disable()
    f306bbdce631 wifi: ath9k: use IS_ERR() with debugfs_create_dir()
    231086e6a363 wifi: mwifiex: avoid possible NULL skb pointer dereference
    5f6f00bcf947 wifi: ath9k: protect WMI command response buffer replacement with a lock
    ff703b5f3f3c wifi: ath9k: fix races between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx
    df1753eae74b wifi: mwifiex: Fix missed return in oob checks failed path
    8f717752f94e wifi: mwifiex: fix memory leak in mwifiex_histogram_read()
    ab4810042cdd fs: ocfs2: namei: check return value of ocfs2_add_entry()
    dbe64279ae34 lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
    67f8f2bae8e7 lwt: Fix return values of BPF xmit ops
    12bf7d9cc6af hwrng: iproc-rng200 - Implement suspend and resume calls
    4f1ca8e39732 hwrng: iproc-rng200 - use semicolons rather than commas to separate statements
    6c015ebce180 crypto: caam - fix unchecked return value error
    ec348676c7d0 Bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    0ce06035ea67 crypto: stm32 - Properly handle pm_runtime_get failing
    34de9f1d6359 wifi: mwifiex: fix error recovery in PCIE buffer descriptor management
    87f8c5442373 mwifiex: switch from 'pci_' to 'dma_' API
    29eca8b7863d wifi: mwifiex: Fix OOB and integer underflow when rx packets
    042aeb45e484 can: gs_usb: gs_usb_receive_bulk_callback(): count RX overflow errors also in case of OOM
    516f21f21068 spi: tegra20-sflash: fix to check return value of platform_get_irq() in tegra_sflash_probe()
    4fb6fcc04a99 regmap: rbtree: Use alloc_flags for memory allocations
    57935355dc67 tcp: tcp_enter_quickack_mode() should be static
    75b8b5b52985 bpf: Clear the probe_addr for uprobe
    a0fa690894c1 cpufreq: powernow-k8: Use related_cpus instead of cpus in driver.exit()
    991b7c260476 perf/imx_ddr: don't enable counter0 if none of 4 counters are used
    07415be140d0 x86/decompressor: Don't rely on upper 32 bits of GPRs being preserved
    6dbac48ea344 x86/boot: Annotate local functions
    c418814fae86 x86/asm: Make more symbols local
    3eb241e47d05 OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
    5d3975e36c64 tmpfs: verify {g,u}id mount options correctly
    48c54877ce33 fs: Fix error checking for d_hash_and_lookup()
    0c8c20538115 new helper: lookup_positive_unlocked()
    0a2b1eb8a9ce eventfd: prevent underflow for eventfd semaphores
    3e9617d63edf eventfd: Export eventfd_ctx_do_read()
    f59ff666989c reiserfs: Check the return value from __getblk()
    e74903b5fbc9 Revert "net: macsec: preserve ingress frame ordering"
    b36c4a731aae udf: Handle error when adding extent to a file
    7648ea9896b3 udf: Check consistency of Space Bitmap Descriptor
    3e2265cda14e powerpc/32s: Fix assembler warning about r0
    aea73dde7180 net: Avoid address overwrite in kernel_connect
    d7d42f114252 platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    6614af25e142 ALSA: seq: oss: Fix racy open/close of MIDI devices
    601dc776a09a scsi: storvsc: Always set no_report_opcodes
    107f5cad230b cifs: add a warning when the in-flight count goes negative
    f31618e4fc00 sctp: handle invalid error codes without calling BUG()
    8d7395d0ea5e bnx2x: fix page fault following EEH recovery
    c1ce2f09573e netlabel: fix shift wrapping bug in netlbl_catmap_setlong()
    499eb477f76b scsi: qedi: Fix potential deadlock on &qedi_percpu->p_work_lock
    d0189e40c2d1 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM
    617d1d0e1730 net: usb: qmi_wwan: add Quectel EM05GV2
    5d2481bc924e clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM
    3899c1d158c5 security: keys: perform capable check only on privileged operations
    97ed1be29bf0 platform/x86: huawei-wmi: Silence ambient light sensor
    762c352dfc41 platform/x86: intel: hid: Always call BTNL ACPI method
    0e3f0e55974c ASoC: atmel: Fix the 8K sample parameter in I2SC master
    0b718d1d5780 ASoc: codecs: ES8316: Fix DMIC config
    b796adfc9869 fs/nls: make load_nls() take a const parameter
    35a9b057bfd4 s390/dasd: fix hanging device after request requeue
    d7768b33d0fd s390/dasd: use correct number of retries for ERP requests
    a21ff228f0e1 m68k: Fix invalid .section syntax
    4dfc0d1edad3 vxlan: generalize vxlan_parse_gpe_hdr and remove unused args
    d65c5ef975d1 ethernet: atheros: fix return value check in atl1c_tso_csum()
    ea95a0111494 ASoC: da7219: Check for failure reading AAD IRQ events
    216953c3de60 ASoC: da7219: Flush pending AAD IRQ when suspending
    b6f827c3f8db 9p: virtio: make sure 'offs' is initialized in zc_request
    b6fefef07dca pinctrl: amd: Don't show `Invalid config param` errors
    99a73016a5e1 nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    724474dfaa98 nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    efe8244ba960 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    6b701dab1993 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    bee7f3a49469 serial: sc16is7xx: fix bug when first setting GPIO direction
    a6650d27ab2c Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
    5876cae6d6ef staging: rtl8712: fix race condition
    a17c6efa1413 HID: wacom: remove the battery when the EKR is off
    e4f5ad7b539a USB: serial: option: add FOXCONN T99W368/T99W373 product
    837f6647b2bf USB: serial: option: add Quectel EM05G variant (0x030e)
    1d2432804815 modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    6938ef59e3ff rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    0e0914f9a899 net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    6b39bd898bb0 mmc: au1xmmc: force non-modular build and remove symbol_get usage
    7a67c5d93292 ARM: pxa: remove use of symbol_get()
    e83f5d13cb73 erofs: ensure that the post-EOF tails are all zeroed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fefbb63209..148712b6f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ccbf907f43d15ffd113a58e77986ece2b9cd0b53"
-SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
+SRCREV_machine ?= "85315779726690bf22e615a8f5e2ab9f3ea8e580"
+SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.256"
+LINUX_VERSION ?= "5.4.257"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index febbf1cb7e..89fda1c71b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.256"
+LINUX_VERSION ?= "5.4.257"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b3176395ae2665d4d417c7b78dfb43dcf49462a9"
-SRCREV_machine ?= "88509f87ebd23e35482a3e7acd6f88a1ca209f9a"
-SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
+SRCREV_machine_qemuarm ?= "dd581fe8efd97479b60c1169c77d2e9e37fdbd42"
+SRCREV_machine ?= "739b4ff36fdf4203e60448f252dd4afcd8871046"
+SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index b5e85bd3ea..e10e542663 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "80d0730537aad4de79fc587a65ed7819790dcc6f"
-SRCREV_machine_qemuarm64 ?= "d569fe3e1a114ddcac5c4af67814405a614147ad"
-SRCREV_machine_qemumips ?= "0a41991fe10d34d22e87c276911142d2f1a67a93"
-SRCREV_machine_qemuppc ?= "1034463b20b1154014d1d6ffe87d018842ad094b"
-SRCREV_machine_qemuriscv64 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
-SRCREV_machine_qemux86 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
-SRCREV_machine_qemux86-64 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
-SRCREV_machine_qemumips64 ?= "60ddf305567af22536ec5c85d1af614a3b5bbfad"
-SRCREV_machine ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
-SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
+SRCREV_machine_qemuarm ?= "af8795f548930f376f648b3c38c96ea9adeca302"
+SRCREV_machine_qemuarm64 ?= "08b2d42ab0000a6f12d816c0828632c162f5173a"
+SRCREV_machine_qemumips ?= "37c8da56986328d9030015e1a80beaa90babab30"
+SRCREV_machine_qemuppc ?= "3cd238f6056560888f7f717c569ca4a1fe16ccc9"
+SRCREV_machine_qemuriscv64 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
+SRCREV_machine_qemux86 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
+SRCREV_machine_qemux86-64 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
+SRCREV_machine_qemumips64 ?= "44fbd145164885c2ba73a8ddcb09fd6f3ab0d59c"
+SRCREV_machine ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
+SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.256"
+LINUX_VERSION ?= "5.4.257"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


