Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C0AC4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:41:57 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.28721.1671471709599657327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CsKvTey8;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id o12so6713188qvn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0ViyPzwobCwlMsIsGvEjWC61LcaHIivEpqPYnxdr58=;
        b=CsKvTey8m2+FROm7yRm33tlqv8irkWiqO+1UnAicofT4NL+XrGweVlG7v49HucDEjw
         u6+KL/lkQLbj7i9Fkpykx6EWrD+TwQN425y8KHwa1dcGDq7onxQTlS0kwokpfAndbIjF
         dVOWc52LS+0NXDv4tM4hGefUPWnrLtY3zwJWRDx2dwcjmeCVQg+nS3CHjISn+czUlEeK
         t3187u5isOuYQwCICGj/fqPxMr2bDsc/y8Lu6p5PMHlXGpM4HvTwymw2tZjbUURBpAL8
         ihuennItK5cSGaeWQCEUElz9cU8oE453WALA0KwJQ7J9mcPzxrb+5aQkiEhKszVIo8SF
         5w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0ViyPzwobCwlMsIsGvEjWC61LcaHIivEpqPYnxdr58=;
        b=GTsr/alD5xSUD7XtOV6zF4MpBe6659nHu5oA99NSpzonQGldtRGzkr/rgQjuKcao1I
         DIumV177D1O9b1y1ZOI07pNeor3FRsXcjLxR4WuZGyWzaME1oHcjWtoN6ilx8XKbR96f
         ll+a1iVFg2NAkSvvGxJJZKJPadVErI0xcLBxup3egshL70Zzox99OFT8Bsw2PZtjjg6B
         hjYJCoN3jNMS5Tx+sjy1pLzDLiwCjCe7hfg4MmjHlNCBPYplEVBvnX1dour80uHgUOxb
         F5F0+TJCnGNiCP0svB7CVgy1g35toNCHVHpOotbvsl9kDbB1tNIRNKc/rXZRSMBQzNMU
         OaEw==
X-Gm-Message-State: AFqh2ko0ErdjpXOpLIq8feQ5LRblNJw50cny1lRHRlnDxEeYXIGYKwmo
	8lQSQUDi6n6vYVpeA4//Anq8qw6lljc=
X-Google-Smtp-Source: AMrXdXvkzt3mgpUUdXdWC/glW6mkDDW69XEMdlyoB/V4ql3HfVC+nvNh2xceJP5F+/ewrg8/nkU8mA==
X-Received: by 2002:a05:6214:108c:b0:4b4:a3d5:57e1 with SMTP id o12-20020a056214108c00b004b4a3d557e1mr13036427qvr.16.1671471708252;
        Mon, 19 Dec 2022 09:41:48 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006fa31bf2f3dsm7477624qko.47.2022.12.19.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:41:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4][dunfell] linux-yocto/5.4: update to v5.4.221
Date: Mon, 19 Dec 2022 12:41:43 -0500
Message-Id: <20221219174146.64696-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174823

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    b70bfeb98635 Linux 5.4.221
    6bb8769326c4 mm: /proc/pid/smaps_rollup: fix no vma's null-deref
    a351077e589d hv_netvsc: Fix race between VF offering and VF association message from host
    2f1b3377b6fc Makefile.debug: re-enable debug info for .S files
    9220881831c3 ACPI: video: Force backlight native for more TongFang devices
    8ad8fc82eee8 riscv: topology: fix default topology reporting
    60dd3dc2acc4 arm64: topology: move store_cpu_topology() to shared code
    724483b585a1 iommu/vt-d: Clean up si_domain in the init_dmars() error path
    dfc0337c6dce net: hns: fix possible memory leak in hnae_ae_register()
    bc8301ea7e7f net: sched: cake: fix null pointer access issue when cake_init() fails
    b87f88d58f1b net: phy: dp83867: Extend RX strap quirk for SGMII mode
    6453077a00c1 net/atm: fix proc_mpc_write incorrect return value
    4258c473ee03 HID: magicmouse: Do not set BTN_MOUSE on double report
    567f8de358b6 tipc: fix an information leak in tipc_topsrv_kern_subscr
    27ee73c1199e tipc: Fix recognition of trial period
    fa0676d94fa4 ACPI: extlog: Handle multiple records
    13a2719ec89f btrfs: fix processing of delayed tree block refs during backref walking
    b397ce347775 btrfs: fix processing of delayed data refs during backref walking
    96894a4fe6b0 r8152: add PID for the Lenovo OneLink+ Dock
    7f6d2188ec33 arm64: errata: Remove AES hwcap for COMPAT tasks
    aae35081633f media: venus: dec: Handle the case where find_format fails
    fd596e7371ac KVM: arm64: vgic: Fix exit condition in scan_its_table()
    383b7c50f544 ata: ahci: Match EM_MAX_SLOTS with SATA_PMP_MAX_PORTS
    da9793150297 ata: ahci-imx: Fix MODULE_ALIAS
    c00cdfc9bd76 hwmon/coretemp: Handle large core ID value
    3ea7da6a97d5 x86/microcode/AMD: Apply the patch early on every logical thread
    3064c74198cf ocfs2: fix BUG when iput after ocfs2_mknod fails
    c2489774a2f0 ocfs2: clear dinode links count in case of error
    6391ed32b101 xfs: fix use-after-free on CIL context on shutdown
    ac055fee2544 xfs: move inode flush to the sync workqueue
    d3eb14b8ea26 xfs: reflink should force the log out if mounted with wsync
    05e2b279ead4 xfs: factor out a new xfs_log_force_inode helper
    f1172b08bb8e xfs: trylock underlying buffer on dquot flush
    890d7dfff79d xfs: don't write a corrupt unmount record to force summary counter recalc
    8ebd3ba932df xfs: tail updates only need to occur when LSN changes
    87b8a7fb6263 xfs: factor common AIL item deletion code
    4202b103d382 xfs: Throttle commits on delayed background CIL push
    7a8f95bfb9e3 xfs: Lower CIL flush limit for large logs
    f43ff28b0183 xfs: preserve default grace interval during quotacheck
    553e5c8031f5 xfs: fix unmount hang and memory leak on shutdown during quotaoff
    835306dd3f0c xfs: factor out quotaoff intent AIL removal and memory free
    a1e03f160019 xfs: Replace function declaration by actual definition
    fdce40c8fd92 xfs: remove the xfs_qoff_logitem_t typedef
    926ddf7846ee xfs: remove the xfs_dq_logitem_t typedef
    80f78aa76a17 xfs: remove the xfs_disk_dquot_t and xfs_dquot_t
    4776ae328ccb xfs: Use scnprintf() for avoiding potential buffer overflow
    2f55a0389154 xfs: check owner of dir3 blocks
    15b0651f383f xfs: check owner of dir3 data blocks
    bc013efdcf17 xfs: fix buffer corruption reporting when xfs_dir3_free_header_check fails
    6e204b9e67f3 xfs: xfs_buf_corruption_error should take __this_address
    0213ee5f4c93 xfs: add a function to deal with corrupt buffers post-verifiers
    3c88c3c00c97 xfs: rework collapse range into an atomic operation
    3602df3f1f5f xfs: rework insert range into an atomic operation
    7cd181cb2333 xfs: open code insert range extent split helper
    fe18f1af38a7 Linux 5.4.220
    d9fdda5efe76 thermal: intel_powerclamp: Use first online CPU as control_cpu
    c3bb4a7e8cbc inet: fully convert sk->sk_rx_dst to RCU rules
    96e2e21284ca efi: libstub: drop pointless get_memory_map() call
    97238b88583c md: Replace snprintf with scnprintf
    8b766dd70791 ext4: continue to expand file system when the target size doesn't reach
    4a36de894779 net/ieee802154: don't warn zero-sized raw_sendmsg()
    cff6131217e6 Revert "net/ieee802154: reject zero-sized raw_sendmsg()"
    1210359a6854 net: ieee802154: return -EINVAL for unknown addr type
    04df9719df18 io_uring/af_unix: defer registered files gc to io_uring release
    f5dd24a66462 perf intel-pt: Fix segfault in intel_pt_print_info() with uClibc
    036b1f3bca7e clk: bcm2835: Make peripheral PLLC critical
    1eae30c0113d usb: idmouse: fix an uninit-value in idmouse_open
    0d150ccd55db nvmet-tcp: add bounds check on Transfer Tag
    3a3a8d75af4d nvme: copy firmware_rev on each init
    e5d8f05edb36 staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
    072b5a41c5f8 Revert "usb: storage: Add quirk for Samsung Fit flash"
    d6afcab1b48f usb: musb: Fix musb_gadget.c rxstate overflow bug
    9fa81cbd2dd3 usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
    1c00bb624cd0 md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d
    e30c3a9a8881 HID: roccat: Fix use-after-free in roccat_read()
    81247850b8ab bcache: fix set_at_max_writeback_rate() for multiple attached devices
    7cfc77f4fe1d ata: libahci_platform: Sanity check the DT child nodes number
    16a45e78a687 staging: vt6655: fix potential memory leak
    3376a0cf138d power: supply: adp5061: fix out-of-bounds read in adp5061_get_chg_type()
    3575949513ea nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
    22f49d9d6e04 scsi: 3w-9xxx: Avoid disabling device if failing to enable it
    66de92207600 clk: zynqmp: pll: rectify rate rounding in zynqmp_pll_round_rate
    9181af2dbf06 media: cx88: Fix a null-ptr-deref bug in buffer_prepare()
    5dbfcf7b0803 clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    715fe15785b4 btrfs: scrub: try to fix super block errors
    8054f824a725 ARM: dts: imx6sx: add missing properties for sram
    05f789afaf69 ARM: dts: imx6sll: add missing properties for sram
    48d1766b35f3 ARM: dts: imx6sl: add missing properties for sram
    ef4a3baf0042 ARM: dts: imx6qp: add missing properties for sram
    ee239c0340a2 ARM: dts: imx6dl: add missing properties for sram
    82e5191b124a ARM: dts: imx6q: add missing properties for sram
    0b2013ace8df ARM: dts: imx7d-sdb: config the max pressure for tsc2046
    aec01503ba7f mmc: sdhci-msm: add compatible string check for sdm670
    e67c2cda3d60 drm/amdgpu: fix initial connector audio value
    079f64a1ea33 platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
    30a3601c2f59 drm: panel-orientation-quirks: Add quirk for Anbernic Win600
    7de3e3514cab drm/vc4: vec: Fix timings for VEC modes
    8f6cad7c4b68 drm/amd/display: fix overflow on MIN_I64 definition
    cdde55f97298 drm: Prevent drm_copy_field() to attempt copying a NULL pointer
    fb282b4e8aef drm: Use size_t type for len variable in drm_copy_field()
    1d0803b1532d drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()
    61fd56b0a1a3 r8152: Rate limit overflow messages
    7d6f9cb24d2b Bluetooth: L2CAP: Fix user-after-free
    a76462dbdd8b net: If sock is dead don't access sock's sk_wq in sk_stream_wait_memory
    4037270ea6d6 wifi: rt2x00: correctly set BBP register 86 for MT7620
    2021a5aaf835 wifi: rt2x00: set SoC wmac clock register
    f9c053c3e4e9 wifi: rt2x00: set VGC gain for both chains of MT7620
    0facbe608305 wifi: rt2x00: set correct TX_SW_CFG1 MAC register for MT7620
    2f383edcb703 wifi: rt2x00: don't run Rt5592 IQ calibration on MT7620
    fdcc57ef8c1f can: bcm: check the result of can_send() in bcm_can_tx()
    6e85d2ad958c Bluetooth: hci_sysfs: Fix attempting to call device_add multiple times
    776f33c12fdb Bluetooth: L2CAP: initialize delayed works at l2cap_chan_create()
    49c742afd60f wifi: brcmfmac: fix use-after-free bug in brcmf_netdev_start_xmit()
    18373ed500f7 xfrm: Update ipcomp_scratches with NULL when freed
    2c485f4f2a64 wifi: ath9k: avoid uninit memory read in ath9k_htc_rx_msg()
    42d579d91051 tcp: annotate data-race around tcp_md5sig_pool_populated
    ce25d7caf35d openvswitch: Fix overreporting of drops in dropwatch
    a7fe12cea515 openvswitch: Fix double reporting of drops in dropwatch
    06d73f4e6bd6 bpftool: Clear errno after libcap's checks
    56a0ac486341 wifi: brcmfmac: fix invalid address access when enabling SCAN log level
    38ca9ece960d NFSD: Return nfserr_serverfault if splice_ok but buf->pages have data
    5a646c38f648 thermal: intel_powerclamp: Use get_cpu() instead of smp_processor_id() to avoid crash
    49a6ffdaed60 powercap: intel_rapl: fix UBSAN shift-out-of-bounds issue
    ac84b26a1689 MIPS: BCM47XX: Cast memcmp() of function to (void *)
    13f4d3665bf6 ACPI: video: Add Toshiba Satellite/Portege Z830 quirk
    c5ed3a378978 f2fs: fix race condition on setting FI_NO_EXTENT flag
    584561e94260 crypto: cavium - prevent integer overflow loading firmware
    00791e017b5f kbuild: remove the target in signal traps when interrupted
    d59d36aa4c3f iommu/iova: Fix module config properly
    0f224fde6324 crypto: ccp - Release dma channels before dmaengine unrgister
    95c4e20adc3e crypto: akcipher - default implementation for setting a private key
    4010a1afaae1 iommu/omap: Fix buffer overflow in debugfs
    b32a285998d4 cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset
    3317c7d211ef powerpc: Fix SPE Power ISA properties for e500v1 platforms
    6191f0310ebf powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
    f11bce700b7a x86/hyperv: Fix 'struct hv_enlightened_vmcs' definition
    828d19038019 powerpc/powernv: add missing of_node_put() in opal_export_attrs()
    0a5cee97c017 powerpc/pci_dn: Add missing of_node_put()
    1535e14731e9 powerpc/sysdev/fsl_msi: Add missing of_node_put()
    85d23c49336c powerpc/math_emu/efp: Include module.h
    e77a85c3fbfd mailbox: bcm-ferxrm-mailbox: Fix error check for dma_map_sg
    f28eec40785e clk: ast2600: BCLK comes from EPLL
    fc39ebf85d03 clk: ti: dra7-atl: Fix reference leak in of_dra7_atl_clk_probe
    111369bb8cd9 clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
    2ee652f072cf spmi: pmic-arb: correct duplicate APID to PPID mapping logic
    1ea4efc09fee dmaengine: ioat: stop mod_timer from resurrecting deleted timer in __cleanup()
    8498490b3c91 clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
    8542422192d0 mfd: sm501: Add check for platform_driver_register()
    f95ba4aab698 mfd: fsl-imx25: Fix check for platform_get_irq() errors
    6804b4fedee2 mfd: lp8788: Fix an error handling path in lp8788_irq_init() and lp8788_irq_init()
    595d077f3cf5 mfd: lp8788: Fix an error handling path in lp8788_probe()
    b75f4912b371 mfd: fsl-imx25: Fix an error handling path in mx25_tsadc_setup_irq()
    1f4f8b6adb3d mfd: intel_soc_pmic: Fix an error handling path in intel_soc_pmic_i2c_probe()
    b6c2c3059e72 fsi: core: Check error number after calling ida_simple_get
    117331a2a522 scsi: libsas: Fix use-after-free bug in smp_execute_task_sg()
    558a9fcb6ce7 serial: 8250: Fix restoring termios speed after suspend
    c969316eeefb firmware: google: Test spinlock on panic path to avoid lockups
    88b9cc60f26e staging: vt6655: fix some erroneous memory clean-up loops
    83d11dd92a51 phy: qualcomm: call clk_disable_unprepare in the error handling
    29b897ac7b99 tty: serial: fsl_lpuart: disable dma rx/tx use flags in lpuart_dma_shutdown
    744c2d33a88b drivers: serial: jsm: fix some leaks in probe
    9fe0a8c0694c usb: gadget: function: fix dangling pnp_string in f_printer.c
    59e3d41265f3 xhci: Don't show warning for reinit on known broken suspend
    f8ba29ae237e md/raid5: Ensure stripe_fill happens on non-read IO with journal
    9b881a2ca0c6 mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
    22830560eb2f ata: fix ata_id_has_dipm()
    10d52d8dd1cb ata: fix ata_id_has_ncq_autosense()
    99e7e6445154 ata: fix ata_id_has_devslp()
    6ea4b3303abf ata: fix ata_id_sense_reporting_enabled() and ata_id_has_sense_reporting()
    e09caa38e10b RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.
    b21b0d17ad99 mtd: devices: docg3: check the return value of devm_ioremap() in the probe
    3ca6939b5d1a dyndbg: let query-modname override actual module name
    ad0a65517cff dyndbg: fix module.dyndbg handling
    fc797285c40a misc: ocxl: fix possible refcount leak in afu_ioctl()
    7ed37be3a2ce RDMA/rxe: Fix the error caused by qp->sk
    0d773c58d702 RDMA/rxe: Fix "kernel NULL pointer dereference" error
    59b315353252 media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init
    80a955dabb82 tty: xilinx_uartps: Fix the ignore_status
    3e77ac46f290 media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
    3baf53328aee HSI: omap_ssi_port: Fix dma_map_sg error check
    aa9c0598b109 HSI: omap_ssi: Fix refcount leak in ssi_probe
    5d9fb09612de clk: tegra20: Fix refcount leak in tegra20_clock_init
    5984b1d66126 clk: tegra: Fix refcount leak in tegra114_clock_init
    6d3ac23b952f clk: tegra: Fix refcount leak in tegra210_clock_init
    aa3898dec1b6 clk: berlin: Add of_node_put() for of_get_parent()
    fcaff9bc6bbc clk: oxnas: Hold reference returned by of_get_parent()
    ad3a056982b7 clk: meson: Hold reference returned by of_get_parent()
    633c574e0f8b iio: ABI: Fix wrong format of differential capacitance channel ABI.
    0111032d9a02 iio: inkern: only release the device node when done with it
    246af4216379 iio: adc: at91-sama5d2_adc: lock around oversampling and sample freq
    46778752bbd5 iio: adc: at91-sama5d2_adc: check return status for pressure and touch
    d50e3817a4b6 iio: adc: at91-sama5d2_adc: fix AT91_SAMA5D2_MR_TRACKTIM_MAX
    c29c3d32bd01 ARM: dts: exynos: fix polarity of VBUS GPIO of Origen
    e00480d42b1a ARM: Drop CMDLINE_* dependency on ATAGS
    fcad2eef0030 ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    6858d8599c65 ARM: dts: kirkwood: lsxl: remove first ethernet port
    d45424d980e8 ARM: dts: kirkwood: lsxl: fix serial line
    1edbceda073d ARM: dts: turris-omnia: Fix mpp26 pin name and comment
    673db1cf4db8 soc: qcom: smem_state: Add refcounting for the 'state->of_node'
    1e3ed59370c7 soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
    85a40bfb8e7a memory: of: Fix refcount leak bug in of_get_ddr_timings()
    b37f4a711e5d memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
    56c4299f7670 ALSA: hda/hdmi: Don't skip notification handling during PM operation
    45387ca42277 ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
    371d4dbece4d ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
    aa182988c0e6 ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
    28a12e24d125 mmc: wmt-sdmmc: Fix an error handling path in wmt_mci_probe()
    93c86281838c ALSA: dmaengine: increment buffer pointer atomically
    6c85495e5882 drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
    c240431717d6 ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API
    9e421bd9fd29 mmc: au1xmmc: Fix an error handling path in au1xmmc_probe()
    9d7af9b1624d drm/omap: dss: Fix refcount leak bugs
    0c55618aaad3 ALSA: hda: beep: Simplify keep-power-at-enable behavior
    3ac2045d0419 ASoC: rsnd: Add check for rsnd_mod_power_on
    1daf69228e31 drm/bridge: megachips: Fix a null pointer dereference bug
    b33b60afa53c drm: fix drm_mipi_dbi build errors
    a367b7a96a5e platform/x86: msi-laptop: Fix resource cleanup
    a9b32c9fe56d platform/x86: msi-laptop: Fix old-ec check for backlight registering
    e548f9503c4b platform/chrome: fix memory corruption in ioctl
    783c1c5000e8 platform/chrome: fix double-free in chromeos_laptop_prepare()
    8242167cfc83 drm/mipi-dsi: Detach devices when removing the host
    4d4a58c9d4db drm: bridge: adv7511: fix CEC power down control register offset
    72c0d361940a net: mvpp2: fix mvpp2 debugfs leak
    131287ff833d once: add DO_ONCE_SLOW() for sleepable contexts
    03ac583eefc9 net/ieee802154: reject zero-sized raw_sendmsg()
    71e0ab5b7598 bnx2x: fix potential memory leak in bnx2x_tpa_stop()
    360aa7219285 net: rds: don't hold sock lock when cancelling work from rds_tcp_reset_callbacks()
    3625b684a285 tcp: fix tcp_cwnd_validate() to not forget is_cwnd_limited
    382ff4471660 sctp: handle the error returned from sctp_auth_asoc_init_active_key
    466ed722f205 mISDN: fix use-after-free bugs in l1oip timer handlers
    e6d0152c9510 vhost/vsock: Use kvmalloc/kvfree for larger packets.
    c202ad048f50 spi: s3c64xx: Fix large transfers with DMA
    60a7496b40e8 netfilter: nft_fib: Fix for rpath check with VRF devices
    610798a58e72 spi/omap100k:Fix PM disable depth imbalance in omap1_spi100k_probe
    1d8c928ed729 x86/microcode/AMD: Track patch allocation size explicitly
    215c146b4021 bpf: Ensure correct locking around vulnerable function find_vpid()
    4017e91ff25d net: fs_enet: Fix wrong check in do_pd_setup
    08a441a4ad54 wifi: rtl8xxxu: gen2: Fix mistake in path B IQ calibration
    e0bab93245b6 bpf: btf: fix truncated last_member_type_id in btf_struct_resolve
    374dd4e51966 wifi: rtl8xxxu: Fix skb misuse in TX queue selection
    df0b024ade10 spi: qup: add missing clk_disable_unprepare on error in spi_qup_pm_resume_runtime()
    026ffbb07f8f spi: qup: add missing clk_disable_unprepare on error in spi_qup_resume()
    321c51aa59df wifi: rtl8xxxu: tighten bounds checking in rtl8xxxu_read_efuse()
    7993680752bb x86/resctrl: Fix to restore to original value when re-enabling hardware prefetch register
    bbe293db7e67 bpftool: Fix a wrong type cast in btf_dumper_int
    9ee70c3cb4f8 wifi: mac80211: allow bw change during channel switch in mesh
    4494ec1c0bb8 wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
    acc393aecda0 nfsd: Fix a memory leak in an error handling path
    d7f1e7af1ef4 ARM: 9247/1: mm: set readonly for MT_MEMORY_RO with ARM_LPAE
    5abd2626ca37 sh: machvec: Use char[] for section boundaries
    c0f4be8303d0 userfaultfd: open userfaultfds with O_RDONLY
    29d0c45cf16e tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
    b0c2e34be932 selinux: use "grep -E" instead of "egrep"
    56ee9577915d drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
    16435e58e57c gcov: support GCC 12.1 and newer compilers
    b6094c482935 KVM: VMX: Drop bits 31:16 when shoving exception error code into VMCS
    764478646115 KVM: nVMX: Unconditionally purge queued/injected events on nested "exit"
    45779be5ced6 KVM: x86/emulator: Fix handing of POP SS to correctly set interruptibility
    c3a98fc6c2f2 media: cedrus: Set the platform driver data earlier
    3cf2ef86e01a ring-buffer: Fix race between reset page and reading page
    7e06ef0345ea ring-buffer: Check pending waiters when doing wake ups as well
    cc1f35733c19 ring-buffer: Have the shortest_full queue be the shortest not longest
    22707f033d8e ring-buffer: Allow splice to read previous partially read pages
    e755b65a4727 ftrace: Properly unset FTRACE_HASH_FL_MOD
    f66de70930f7 livepatch: fix race between fork and KLP transition
    1211121f0e73 ext4: place buffer head allocation before handle start
    52c7b8d3b75e ext4: make ext4_lazyinit_thread freezable
    3638aa1c7d87 ext4: fix null-ptr-deref in ext4_write_info
    a22f52d88331 ext4: avoid crash when inline data creation follows DIO write
    21ea616f1e59 jbd2: wake up journal waiters in FIFO order, not LIFO
    d1c2d820a2cd nilfs2: fix use-after-free bug of struct nilfs_root
    c99860f9a750 f2fs: fix to do sanity check on summary info
    68b1e607559d f2fs: fix to do sanity check on destination blkaddr during recovery
    c5d8198ce863 f2fs: increase the limit for reserve_root
    26b7c0ac49a3 btrfs: fix race between quota enable and quota rescan ioctl
    3742e9fd552e fbdev: smscufx: Fix use-after-free in ufx_ops_open()
    52895c495b62 powerpc/boot: Explicitly disable usage of SPE instructions
    e3f7e99337c6 PCI: Sanitise firmware BAR assignments behind a PCI-PCI bridge
    cd251d39b134 UM: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    08f03b333c4f riscv: Pass -mno-relax only on lld < 15.0.0
    c61f553ba87c riscv: Allow PROT_WRITE-only mmap()
    09058e5ef7c1 parisc: fbdev/stifb: Align graphics memory size to 4MB
    2c60db6869fe RISC-V: Make port I/O string accessors actually work
    14c06375c853 regulator: qcom_rpm: Fix circular deferral regression
    79b7547eeb37 ASoC: wcd9335: fix order of Slimbus unprepare/disable
    6927ee818fe1 quota: Check next/prev free block number after reading from quota file
    4cf9233eb175 HID: multitouch: Add memory barriers
    477ac1d57f60 fs: dlm: handle -EBUSY first in lock arg validation
    d3961f732d85 fs: dlm: fix race between test_bit() and queue_work()
    4352db1e330a mmc: sdhci-sprd: Fix minimum clock limit
    fbefc5cce481 can: kvaser_usb_leaf: Fix CAN state after restart
    9948b80910e2 can: kvaser_usb_leaf: Fix TX queue out of sync after restart
    76d9afd30ef3 can: kvaser_usb_leaf: Fix overread with an invalid command
    953bb1dfea88 can: kvaser_usb: Fix use of uninitialized completion
    42f7d9339612 usb: add quirks for Lenovo OneLink+ Dock
    37daa23f2850 iio: pressure: dps310: Reset chip after timeout
    228348a9fe5f iio: pressure: dps310: Refactor startup procedure
    974c1f15ac9a iio: dac: ad5593r: Fix i2c read protocol requirements
    d0050ec3ebbc cifs: Fix the error length of VALIDATE_NEGOTIATE_INFO message
    bd09adde6771 cifs: destage dirty pages before re-reading them for cache=none
    8298f20e1149 mtd: rawnand: atmel: Unmap streaming DMA mappings
    8d763c8e6cdb ALSA: hda/realtek: Add Intel Reference SSID to support headset keys
    4c354105176f ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
    a943c4a16bfb ALSA: hda/realtek: Correct pin configs for ASUS G533Z
    19731649623b ALSA: hda/realtek: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
    121fadc0cae5 ALSA: usb-audio: Fix NULL dererence at error path
    988ec0cd0a26 ALSA: usb-audio: Fix potential memory leaks
    de7d80d0fe10 ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
    afb507303ea9 ALSA: oss: Fix potential deadlock at unregistration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5da86988ce..9a68f2680c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "983b2c21d3fa76840461947f3f644dd9442d8e40"
-SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
+SRCREV_machine ?= "c6d759ae0dff9466208b68335bf502446253585f"
+SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.219"
+LINUX_VERSION ?= "5.4.221"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 269ad6e459..0860d27ed7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.219"
+LINUX_VERSION ?= "5.4.221"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a4c846b5cacb954ae98a8eba9e0450812f1db42c"
-SRCREV_machine ?= "ae25c500cf7dae5520897489b3fe49bdf068528b"
-SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
+SRCREV_machine_qemuarm ?= "9f6cf5893f239082af0628843c64bf28712bc3a3"
+SRCREV_machine ?= "602bb6499410dea02c84839a318f9cedea1edbed"
+SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d740333ff4..f9326e4686 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "88065fdc7d5d404312da98b78229996b61f56c21"
-SRCREV_machine_qemuarm64 ?= "ac9667e4dba109088d7ed5922f28d6ef1ba66e9b"
-SRCREV_machine_qemumips ?= "e0dd90f622f78e0ad05797996756528623070da4"
-SRCREV_machine_qemuppc ?= "0d45c84c8240fadec9a36a13d9cf077b6793bcfb"
-SRCREV_machine_qemuriscv64 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
-SRCREV_machine_qemux86 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
-SRCREV_machine_qemux86-64 ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
-SRCREV_machine_qemumips64 ?= "a5cc27ae60c504fc309926d8e72129128befdbd5"
-SRCREV_machine ?= "35826e154ee014b64ccfa0d1f12d36b8f8a75939"
-SRCREV_meta ?= "7e9781b04df1fc0aac9309734bbe23b36c050b42"
+SRCREV_machine_qemuarm ?= "d2e7e83b8c22f5e3ecc668837f3ae0201e042871"
+SRCREV_machine_qemuarm64 ?= "8238c28a0df87b72be92f0809a1dba6b3bc4a816"
+SRCREV_machine_qemumips ?= "5c3d5714e849f7844b82488e828eb00b49c86274"
+SRCREV_machine_qemuppc ?= "01887f1f1117db202e3b5ca06cde1261e7c2d296"
+SRCREV_machine_qemuriscv64 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
+SRCREV_machine_qemux86 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
+SRCREV_machine_qemux86-64 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
+SRCREV_machine_qemumips64 ?= "35b0ae02eb9f6f989e54bd75adf7669f528ef5d9"
+SRCREV_machine ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
+SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.219"
+LINUX_VERSION ?= "5.4.221"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


