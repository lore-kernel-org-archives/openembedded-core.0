Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.9944.1596457832895077425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 05:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rrIsKZl7;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id x69so34917389qkb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H5rHszatZgg3KPuKEOb8MMplF1449I25PzufaQctllM=;
        b=rrIsKZl7HJ2qRj57Nb5l0ponkjIjCjfHqgqHozAoOVjm5Eb/GButDFeF0Dz9MIFxIq
         jy0zDNhZN3Q4qCE8WWPWgIn9Nt9wTDmIisrValbONQ54AHNAOOodEwZumo8rz903Up4j
         RQsoH05m1MZ8V6kPyex+dOurmz+ULyPqV6G5/wEn1Xv9iQRSaUX7nlAmrzPQRZxDVZLq
         QjUZsiWbTFVSsm9cUxCAp/Doi5UQgiaFrjSFGhZmb6MWTZJQCDp34u7KTNlKd9FCGci9
         SJ2dW1cyHoTT2dtIvtkoWLjJAoadMTX6UtMy6st0/q0q3h+Yflr3BfonvkUVP+8fhLS8
         794A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H5rHszatZgg3KPuKEOb8MMplF1449I25PzufaQctllM=;
        b=uSmgAcEahKmoCbjUiQkRGSHuNqTkxxpbldK82LpCS+Njoxr4e5haXl+R5qn9mVYs2+
         zfd5yF9CF/ohmDuns+Q1elkCX+iBXtkFLjv2WCGT3VqufEHnuN69a6aXWewZJekMJjYh
         opUjc1Cmg3waxLngIiRtRdQBG/I7/EtsrWE0xydosxG3hzNexNzAFDsedJj584ZQuRfp
         t/fHJqszNSzpuuuQti3+lADDw+BbSsrx60GUtU5zCV+7H5Vr47EqNuqd/sVEt/y5s/8y
         54fs7lRrihe/Xq62Ybzn6BSCnxP9y6HX6VzzIYtIMOGrd7QvAZt3qQvzHpir7TESLJ9p
         a6OQ==
X-Gm-Message-State: AOAM533K9+qyFRICPAsyCGI5SgypgV+zuwwTCloPJ5U733WXm3SL8Wj8
	CGfFC0TCIn6r6oqIvOQGnLtKF2uP57AAIg==
X-Google-Smtp-Source: ABdhPJyVR2K1qY6wY32qvjd7EkXMQdM70fFEvEUb0lMfPENC7r7Pv1pXu5Zy8hnQj1saob+qLl9U0A==
X-Received: by 2002:a05:620a:a05:: with SMTP id i5mr15092411qka.444.1596457831511;
        Mon, 03 Aug 2020 05:30:31 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id z14sm20184299qtn.92.2020.08.03.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 05:30:30 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.4: update to v5.4.53
Date: Mon,  3 Aug 2020 08:30:25 -0400
Message-Id: <0f6dedafd5caef5d3c7a57fd7789dd88ef3b41dc.1596457310.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1596457310.git.bruce.ashfield@gmail.com>
References: <cover.1596457310.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    d811d29517d1 Linux 5.4.53
    e6c19fa5b6c6 gpio: pca953x: disable regmap locking for automatic address incrementing
    411c80267541 drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
    517708c47c66 iommu/vt-d: Make Intel SVM code 64-bit only
    41389f739a5e ionic: export features for vlans to use
    5d7e2852d7e6 spi: sprd: switch the sequence of setting WDG_LOAD_LOW and _HIGH
    1245a1e0e1c3 rxrpc: Fix trace string
    07253d24cda3 libceph: don't omit recovery_deletes in target_copy()
    d2ccad3c9ce9 block: fix get_max_segment_size() overflow on 32bit arch
    310d75f274d5 block: fix splitting segments on boundary masks
    f2e57ed2f3f8 drm/i915/gt: Ignore irq enabling on the virtual engines
    64a17e1da02a drm/amdgpu/sdma5: fix wptr overwritten in ->get_wptr()
    9f8d3d2f79ba genirq/affinity: Handle affinity setting on inactive interrupts correctly
    6aae92ed2c42 sched/fair: handle case of task_h_load() returning 0
    b5b774918816 sched: Fix unreliable rseq cpu_id for new tasks
    5c2450ac7c7a arm64: compat: Ensure upper 32 bits of x0 are zero on syscall return
    ed766e740cc9 arm64: ptrace: Consistently use pseudo-singlestep exceptions
    bdb71132992b arm64: ptrace: Override SPSR.SS when single-stepping is enabled
    d3b7bacd1115 thermal/drivers/cpufreq_cooling: Fix wrong frequency converted from power
    025cec59aa17 thermal: int3403_thermal: Downgrade error message
    0ab6b541c6f8 misc: atmel-ssc: lock with mutex instead of spinlock
    746930d17d14 dmaengine: fsl-edma-common: correct DSIZE_32BYTE
    5f3fcbf5b57f dmaengine: mcf-edma: Fix NULL pointer exception in mcf_edma_tx_handler
    9464956544be dmaengine: fsl-edma: Fix NULL pointer exception in fsl_edma_tx_handler
    8fd0d8536805 intel_th: Fix a NULL dereference when hub driver is not loaded
    55d7092cc8f5 intel_th: pci: Add Emmitsburg PCH support
    905f20f4946a intel_th: pci: Add Tiger Lake PCH-H support
    5c698cc5b6f4 intel_th: pci: Add Jasper Lake CPU support
    c5ce2060f487 powerpc/pseries/svm: Fix incorrect check for shared_lppaca_size
    93d1e96b98b2 powerpc/book3s64/pkeys: Fix pkey_access_permitted() for execute disable pkey
    d6a76f8eee21 hwmon: (emc2103) fix unable to change fan pwm1_enable attribute
    9125d5762590 riscv: use 16KB kernel stack on 64-bit
    c28501385945 timer: Fix wheel index calculation on last level
    6c2388e2a12b timer: Prevent base->clk from moving backward
    e9506de7b305 scsi: megaraid_sas: Remove undefined ENABLE_IRQ_POLL macro
    acd3901a62f6 uio_pdrv_genirq: fix use without device tree and no interrupt
    17268122ba5e uio_pdrv_genirq: Remove warning when irq is not specified
    97f1aecb80e9 Input: elan_i2c - add more hardware ID for Lenovo laptops
    1fb81fe5e180 Input: i8042 - add Lenovo XiaoXin Air 12 to i8042 nomux list
    62dd03054918 mei: bus: don't clean driver pointer
    72648019cd52 Revert "zram: convert remaining CLASS_ATTR() to CLASS_ATTR_RO()"
    4dd2ad686704 fuse: Fix parameter for FS_IOC_{GET,SET}FLAGS
    e8f32a9f5aeb fuse: use ->reconfigure() instead of ->remount_fs()
    f96ce4be463a fuse: ignore 'data' argument of mount(..., MS_REMOUNT)
    09b696bd2149 ovl: fix unneeded call to ovl_change_flags()
    93f75b0f0d3b ovl: relax WARN_ON() when decoding lower directory file handle
    6270654c7de9 ovl: inode reference leak in ovl_is_inuse true case.
    4996065307c8 ovl: fix regression with re-formatted lower squashfs
    2cd065b91681 serial: mxs-auart: add missed iounmap() in probe failure and remove
    752641ba871a virtio: virtio_console: add missing MODULE_DEVICE_TABLE() for rproc serial
    8f4c040f45b9 Revert "tty: xilinx_uartps: Fix missing id assignment to the console"
    1bc2c30d861c virt: vbox: Fix guest capabilities mask check
    78d85ca8300e virt: vbox: Fix VBGL_IOCTL_VMMDEV_REQUEST_BIG and _LOG req numbers to match upstream
    cc894ec456c1 USB: serial: option: add Quectel EG95 LTE modem
    4eaf06c9bd35 USB: serial: option: add GosunCn GM500 series
    dcc1df3cdb04 USB: serial: ch341: add new Product ID for CH340
    dff0a4f024fc USB: serial: cypress_m8: enable Simply Automated UPB PIM
    18059e953e1f USB: serial: iuu_phoenix: fix memory corruption
    72596d0b2acd usb: gadget: function: fix missing spinlock in f_uac1_legacy
    01512075a387 usb: chipidea: core: add wakeup support for extcon
    3dd890afedbf usb: dwc2: Fix shutdown callback in platform
    4f0addeba0c0 USB: c67x00: fix use after free in c67x00_giveback_urb
    bd422c7fb477 ALSA: hda/realtek - Enable Speaker for ASUS UX563
    63d318f05e67 ALSA: hda/realtek - Enable Speaker for ASUS UX533 and UX534
    e7bafe0c94cc ALSA: hda/realtek: Enable headset mic of Acer TravelMate B311R-31 with ALC256
    4181b271908a ALSA: hda/realtek: enable headset mic of ASUS ROG Zephyrus G14(G401) series with ALC289
    246b9693026a ALSA: hda/realtek - change to suitable link model for ASUS platform
    71319db6f3b1 ALSA: usb-audio: Fix race against the error recovery URB submission
    25fd7ee3baeb ALSA: line6: Sync the pending work cancel at disconnection
    91a6d4049c58 ALSA: line6: Perform sanity check for each URB creation
    212425802dc6 HID: quirks: Ignore Simply Automated UPB PIM
    c0188ab5bc31 HID: quirks: Always poll Obins Anne Pro 2 keyboard
    e93ab4628452 HID: magicmouse: do not set up autorepeat
    bc94605df1f9 HID: logitech-hidpp: avoid repeated "multiplier = " log messages
    7c4e6cfd922c slimbus: core: Fix mismatch in of_node_get/put
    93b57bf835d2 clk: qcom: gcc: Add missing UFS clocks for SM8150
    cb7b7928310f clk: qcom: gcc: Add GPU and NPU clocks for SM8150
    cc490ea23f33 mtd: rawnand: oxnas: Release all devices in the _remove() path
    f8a2658d0fd7 mtd: rawnand: oxnas: Unregister all devices on error
    4682749ce329 mtd: rawnand: oxnas: Keep track of registered devices
    8463054e3d4e mtd: rawnand: brcmnand: fix CS0 layout
    ee73c81e386d mtd: rawnand: brcmnand: correctly verify erased pages
    e9f5e16f3228 mtd: rawnand: timings: Fix default tR_max and tCCS_min timings
    f1ad0fc9de60 mtd: rawnand: marvell: Fix probe error path
    be953ad71ce9 mtd: rawnand: marvell: Use nand_cleanup() when the device is not yet registered
    5f59ce425f78 mtd: rawnand: marvell: Fix the condition on a return code
    eec70178983f RDMA/mlx5: Verify that QP is created with RQ or SQ
    6b1aaceb0dab soc: qcom: rpmh-rsc: Allow using free WAKE TCS for active request
    e65ee5ad8903 soc: qcom: rpmh-rsc: Clear active mode configuration for wake TCS
    9e56b18ca5a3 soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new data
    9edb7370f893 soc: qcom: rpmh: Update dirty flag only when data changes
    033f56f7d3d6 perf stat: Zero all the 'ena' and 'run' array slot stats for interval mode
    c2e29cac6d89 PCI/PM: Call .bridge_d3() hook only if non-NULL
    d950d2e79f0f habanalabs: Align protection bits configuration of all TPCs
    d79e57db4544 apparmor: ensure that dfa state tables have entries
    b7d9b78ab901 soc: qcom: socinfo: add missing soc_id sysfs entry
    8eeebe37c64e arm: dts: mt7623: add phy-mode property for gmac2
    742b79562142 copy_xstate_to_kernel: Fix typo which caused GDB regression
    319c3c7980c7 regmap: debugfs: Don't sleep while atomic for fast_io regmaps
    f62d7f91afa2 keys: asymmetric: fix error return code in software_key_query()
    c5acd9395d41 arm64: dts: spcfpga: Align GIC, NAND and UART nodenames with dtschema
    2e224b5d3149 ARM: dts: socfpga: Align L2 cache-controller nodename with dtschema
    c8a4452da9f4 xprtrdma: fix incorrect header size calculations
    a75a8aabb2f4 Revert "thermal: mediatek: fix register index error"
    cc3188b3bab2 ARM: dts: Fix dcan driver probe failed on am437x platform
    408ef501b894 fuse: don't ignore errors from fuse_writepages_fill()
    9b810684b1da NFS: Fix interrupted slots by sending a solo SEQUENCE operation
    dc92d84b371f clk: AST2600: Add mux for EMMC clock
    0392f18139aa clk: mvebu: ARMADA_AP_CPU_CLK needs to select ARMADA_AP_CP_HELPER
    36e6ac265fc0 staging: comedi: verify array index is correct before using it
    62013d49bcf6 usb: gadget: udc: atmel: fix uninitialized read in debug printk
    e435865c783f spi: spi-sun6i: sun6i_spi_transfer_one(): fix setting of clock rate
    f979982feb03 dmaengine: dmatest: stop completed threads when running without set channel
    e6b46f01d995 dmaengine: dw: Initialize channel before each transfer
    a6fe5dde5343 iio: adc: ad7780: Fix a resource handling path in 'ad7780_probe()'
    28be430bbf13 bus: ti-sysc: Do not disable on suspend for no-idle
    47ba42786d14 bus: ti-sysc: Fix sleeping function called from invalid context for RTC quirk
    5a23897f7a41 bus: ti-sysc: Fix wakeirq sleeping function called from invalid context
    b2c7d6ce2d5e arm64: dts: meson-gxl-s805x: reduce initial Mali450 core frequency
    cbd8c92a8d51 arm64: dts: meson: add missing gxl rng clock
    1d08f59081e5 phy: sun4i-usb: fix dereference of pointer phy0 before it is null checked
    684a5568df11 dmaengine: sh: usb-dmac: set tx_result parameters
    f5c6ebd5146e soundwire: intel: fix memory leak with devm_kasprintf
    7005a4885a29 iio:health:afe4404 Fix timestamp alignment and prevent data leak.
    ba3788d243cf ALSA: usb-audio: Add registration quirk for Kingston HyperX Cloud Flight S
    1510d8ab7bc9 bus: ti-sysc: Use optional clocks on for enable and wait for softreset bit
    7637bba4c621 ACPI: video: Use native backlight on Acer TravelMate 5735Z
    0a330aa202c9 Input: mms114 - add extra compatible for mms345l
    75ff2767e85c ALSA: usb-audio: Add quirk for Focusrite Scarlett 2i2
    695fcb612bf1 ALSA: usb-audio: Add registration quirk for Kingston HyperX Cloud Alpha S
    18f2cbb28730 ACPI: video: Use native backlight on Acer Aspire 5783z
    dc1e4db658a6 ALSA: usb-audio: Rewrite registration quirk handling
    592b179fa149 mmc: sdhci: do not enable card detect interrupt for gpio cd type
    e60b02922876 doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
    54100aa32f66 ALSA: usb-audio: Create a registration quirk for Kingston HyperX Amp (0951:16d8)
    35aef79e81a1 Input: goodix - fix touch coordinates on Cube I15-TC
    9c16b5e8b5d9 ALSA: usb-audio: Add support for MOTU MicroBook IIc
    d70a6425a6e2 bus: ti-sysc: Detect EDMA and set quirk flags for tptc
    d09e12709acd arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3 controller
    234021eaddcb bus: ti-sysc: Detect display subsystem related devices
    e7e98dd42aae bus: ti-sysc: Handle module unlock quirk needed for some RTC
    e2c37939a795 bus: ti-sysc: Consider non-existing registers too when matching quirks
    f7280837df83 bus: ti-sysc: Rename clk related quirks to pre_reset and post_reset quirks
    69fbdbb4fa0c scsi: sr: remove references to BLK_DEV_SR_VENDOR, leave it enabled
    23a609417361 drm/sun4i: tcon: Separate quirks for tcon0 and tcon1 on A20
    de6d9aa5f7c1 ARM: at91: pm: add quirk for sam9x60's ulp1
    4301497fdc68 HID: quirks: Remove ITE 8595 entry from hid_have_special_driver
    1c96af59a904 mmc: mmci: Support any block sizes for ux500v2 and qcom variant
    cf911ee9f49d ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot
    3ea583b09537 ARM: OMAP2+: Add workaround for DRA7 DSP MStandby errata i879
    8d158e3453eb ARM: OMAP4+: remove pdata quirks for omap4+ iommus
    370cc95c00ae net: sfp: add some quirks for GPON modules
    17918c99abc1 net: sfp: add support for module quirks
    11a6ff1df31e Revert "usb/xhci-plat: Set PM runtime as active on resume"
    4cf55dcd4fa4 Revert "usb/ehci-platform: Set PM runtime as active on resume"
    add6b48ad376 Revert "usb/ohci-platform: Fix a warning when hibernating"
    267516d7009e net: ethernet: mvneta: Add back interface mode validation
    beee39d71e87 net: ethernet: mvneta: Do not error out in non serdes modes
    131ab7a0cdb8 net: macb: call pm_runtime_put_sync on failure path
    fefc7580af39 of: of_mdio: Correct loop scanning logic
    3f2f3edcc075 net: dsa: bcm_sf2: Fix node reference count
    cb2801017057 spi: spi-fsl-dspi: Fix lockup if device is shutdown during SPI transfer
    baf22f66c9cf iio:health:afe4403 Fix timestamp alignment and prevent data leak.
    5f8fe8ab4463 iio:pressure:ms5611 Fix buffer element alignment
    5a6378911f22 iio:humidity:hts221 Fix alignment and data leak issues
    74953efffb3d iio: pressure: zpa2326: handle pm_runtime_get_sync failure
    4ecff6ee264f iio: mma8452: Add missed iio_device_unregister() call in mma8452_probe()
    b4172e024d48 iio: core: add missing IIO_MOD_H2/ETHANOL string identifiers
    ead750685280 iio: magnetometer: ak8974: Fix runtime PM imbalance on error
    0b16921edc61 iio:humidity:hdc100x Fix alignment and data leak issues
    7cc8cad2bef9 iio:magnetometer:ak8974: Fix alignment and data leak issues
    4c7924060fe0 arm64/alternatives: don't patch up internal branches
    77a181fba1e5 i2c: eg20t: Load module automatically if ID matches
    27874115b059 gfs2: read-only mounts should grab the sd_freeze_gl glock
    827139ad9db5 tpm_tis: extra chip->ops check on error path in tpm_tis_core_init
    a8f13826f9c6 arm64/alternatives: use subsections for replacement sequences
    91e81d2262e7 cifs: prevent truncation from long to int in wait_for_free_credits
    43046f786714 dt-bindings: mailbox: zynqmp_ipi: fix unit address
    ea9d6016b1a4 m68k: mm: fix node memblock init
    560dbf34dec8 m68k: nommu: register start of the memory with memblock
    c3adbd37c054 blk-mq-debugfs: update blk_queue_flag_name[] accordingly for new flags
    9025a5589c03 thermal/drivers: imx: Fix missing of_node_put() at probe time
    c4db485dd3f2 x86/fpu: Reset MXCSR to default in kernel_fpu_begin()
    d2bfb9eb439c drm/exynos: fix ref count leak in mic_pre_enable
    f886b67c6b28 drm/exynos: Properly propagate return value in drm_iommu_attach_device()
    0885be75f1be drm/msm/dpu: allow initialization of encoder locks during encoder init
    5d6891a5a627 drm/msm: fix potential memleak in error branch
    f608a77e0cc9 arm64: arch_timer: Disable the compat vdso for cores affected by ARM64_WORKAROUND_1418040
    86e3c7c70c63 arm64: arch_timer: Allow an workaround descriptor to disable compat vdso
    71d65a3fc628 arm64: Introduce a way to disable the 32bit vdso
    36d60eba862d ip: Fix SO_MARK in RST, ACK and ICMP packets
    38b122c0af04 cgroup: Fix sock_cgroup_data on big-endian.
    94886c86e833 cgroup: fix cgroup_sk_alloc() for sk_clone_lock()
    171644727abf tcp: md5: allow changing MD5 keys in all socket states
    8ee263bd11af tcp: md5: refine tcp_md5_do_add()/tcp_md5_hash_key() barriers
    30d015f5ecd9 vlan: consolidate VLAN parsing code and limit max parsing depth
    f40c3a8438fc tcp: md5: do not send silly options in SYNCOOKIES
    1c8bad567b5d tcp: md5: add missing memory barriers in tcp_md5_do_add()/tcp_md5_hash_key()
    f52293aefe18 tcp: make sure listeners don't initialize congestion-control state
    7eec9f331223 tcp: fix SO_RCVLOWAT possible hangs under high mem pressure
    9b7fd81cf9b6 sched: consistently handle layer3 header accesses in the presence of VLANs
    aafe9dd13f42 net: usb: qmi_wwan: add support for Quectel EG95 LTE modem
    edbde451bf3f net_sched: fix a memory leak in atm_tc_init()
    d55dad8b1d89 net: dsa: microchip: set the correct number of ports
    64d782212646 net: Added pointer check for dst->ops->neigh_lookup in dst_neigh_lookup_skb
    a70a667736ed llc: make sure applications use ARPHRD_ETHER
    73e42f4d2d13 l2tp: remove skb_dst_set() from l2tp_xmit_skb()
    f8646548ee46 ipv6: Fix use of anycast address with loopback
    75270f819666 ipv6: fib6_select_path can not use out path for nexthop objects
    1418b60e998b ipv4: fill fl4_icmp_{type,code} in ping_v4_sendmsg
    7b42410d3556 genetlink: remove genl_bind
    aef7a9e21aa6 bridge: mcast: Fix MLD2 Report IPv6 payload length check
    587ccf092e28 net: rmnet: fix lower interface leak
    d06c17fcd7c0 net: atlantic: fix ip dst and ipv6 address filters
    de93c1c104ac crypto: atmel - Fix build error of CRYPTO_AUTHENC
    1f21bb70d7b1 crypto: atmel - Fix selection of CRYPTO_AUTHENC
    c57b1153a58a Linux 5.4.52
    1a70857590f7 s390/maccess: add no DAT mode to kernel_write
    627d15eecb61 s390: Change s390_kernel_write() return type to match memcpy()
    d64dc6118a0f pwm: jz4740: Fix build failure
    d13a78d13d2c perf scripts python: exported-sql-viewer.py: Fix unexpanded 'Find' result
    64e8b913c30b perf scripts python: exported-sql-viewer.py: Fix zero id in call tree 'Find' result
    2038998170b0 perf scripts python: exported-sql-viewer.py: Fix zero id in call graph 'Find' result
    e51a811c242e perf scripts python: export-to-postgresql.py: Fix struct.pack() int argument
    299ffecbd530 dm writecache: reject asynchronous pmem devices
    49a7ac29f6a0 blk-mq: consider non-idle request as "inflight" in blk_mq_rq_inflight()
    2dfd182451d9 s390/mm: fix huge pte soft dirty copying
    0d62bc7e960f s390/setup: init jump labels before command line parsing
    e6de7cbbcacb ARC: elf: use right ELF_ARCH
    854827a2697a ARC: entry: fix potential EFA clobber when TIF_SYSCALL_TRACE
    37634f502b53 mmc: meson-gx: limit segments to 1 when dram-access-quirk is needed
    b9fe45efa671 dm: use noio when sending kobject event
    ede24894e8bf drm/amdgpu: don't do soft recovery if gpu_recovery=0
    ef8164f03a86 drm/radeon: fix double free
    026f830e0ba3 btrfs: fix double put of block group with nocow
    808b2b3ea85a btrfs: fix fatal extent_buffer readahead vs releasepage race
    5a046d75acf7 Revert "ath9k: Fix general protection fault in ath9k_hif_usb_rx_cb"
    baef8d1027b0 bpf: Check correct cred for CAP_SYSLOG in bpf_dump_raw_ok()
    e5541c6347b7 kprobes: Do not expose probe addresses to non-CAP_SYSLOG
    314ac273f005 module: Do not expose section addresses to non-CAP_SYSLOG
    0d5d9413a692 module: Refactor section attr into bin attribute
    2a6c8d3d0dd0 kallsyms: Refactor kallsyms_show_value() to take cred
    79aaeec71271 KVM: arm64: Fix kvm_reset_vcpu() return code being incorrect with SVE
    a494529add3f KVM: x86: Mark CR4.TSD as being possibly owned by the guest
    d29a79fa7559 KVM: x86: Inject #GP if guest attempts to toggle CR4.LA57 in 64-bit mode
    3f108b168002 KVM: x86: bit 8 of non-leaf PDPEs is not reserved
    388429498641 KVM: arm64: Annotate hyp NMI-related functions as __always_inline
    b956ec9afc2e KVM: arm64: Stop clobbering x0 for HVC_SOFT_RESTART
    a20aa35b839a KVM: arm64: Fix definition of PAGE_HYP_DEVICE
    9b742b6a3b78 ALSA: hda/realtek: Enable headset mic of Acer Veriton N4660G with ALC269VC
    8254cddab9a4 ALSA: hda/realtek: Enable headset mic of Acer C20-820 with ALC269VC
    c6fbfa6dd96b ALSA: hda/realtek - Enable audio jacks of Acer vCopperbox with ALC269VC
    615313fe4294 ALSA: hda/realtek - Fix Lenovo Thinkpad X1 Carbon 7th quirk subdevice id
    92b598132eec ALSA: usb-audio: Add implicit feedback quirk for RTX6001
    caead988fe61 ALSA: usb-audio: add quirk for MacroSilicon MS2109
    02b2f10e5c9f ALSA: hda - let hs_mic be picked ahead of hp_mic
    3496a18a1c3b ALSA: opl3: fix infoleak in opl3
    4a215725dec7 IB/hfi1: Do not destroy link_wq when the device is shut down
    607fbc27d75f IB/hfi1: Do not destroy hfi1_wq when the device is shut down
    6a882fb7232d mlxsw: pci: Fix use-after-free in case of failed devlink reload
    c9dcb4929ce2 mlxsw: spectrum_router: Remove inappropriate usage of WARN_ON()
    f62f896a56a2 net: macb: fix call to pm_runtime in the suspend/resume functions
    ad396c483dd5 net: macb: mark device wake capable when "magic-packet" property present
    5d744ee94b49 net: macb: fix wakeup test in runtime suspend/resume routines
    15442ef56405 bnxt_en: fix NULL dereference in case SR-IOV configuration fails
    65fb9bbee611 net/mlx5e: Fix 50G per lane indication
    ce27893535ca net/mlx5: Fix eeprom support for SFP module
    f277e0be69d4 qed: Populate nvm-file attributes while reading nvm config partition.
    e89b828ae357 IB/mlx5: Fix 50G per lane indication
    97d6855ac57d cxgb4: fix all-mask IP address comparison
    2a4c5ff12f42 nbd: Fix memory leak in nbd_add_socket
    06cee3572ed5 arm64: kgdb: Fix single-step exception handling oops
    9e8f4623e292 RDMA/siw: Fix reporting vendor_part_id
    1c54d0d9c4e6 ALSA: compress: fix partial_drain completion state
    175b5aa7b964 net: hns3: fix use-after-free when doing self test
    ab8c4fd863f4 net: hns3: add a missing uninit debugfs when unload driver
    5c0192d28513 smsc95xx: avoid memory leak in smsc95xx_bind
    81ed1f9fd0b3 smsc95xx: check return value of smsc95xx_reset
    3959bf65fe48 perf intel-pt: Fix PEBS sample for XMM registers
    da4b6eff382b perf intel-pt: Fix recording PEBS-via-PT with registers
    9ca67a453273 perf report TUI: Fix segmentation fault in perf_evsel__hists_browse()
    2d15663304f5 netfilter: conntrack: refetch conntrack after nf_conntrack_update()
    d9b8206e5323 net: dsa: microchip: set the correct number of ports
    fd3a612d9828 IB/sa: Resolv use-after-free in ib_nl_make_request()
    b0259e7056b1 net: cxgb4: fix return error value in t4_prep_fw
    92002d59ecee net: mvneta: fix use of state->speed
    4f412ae89e78 netfilter: ipset: call ip_set_free() instead of kfree()
    b709a08bc4d7 bpf, sockmap: RCU dereferenced psock may be used outside RCU block
    2000bb546525 bpf, sockmap: RCU splat with redirect and strparser error or TLS
    4625f4d5e4bf drm/mediatek: Check plane visibility in atomic_update
    a062088e675f nl80211: don't return err unconditionally in nl80211_start_ap()
    d63806c30706 gpio: pca953x: Fix GPIO resource leak on Intel Galileo Gen 2
    137e7782bddd gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2
    91f8d05b4b56 net: qrtr: Fix an out of bounds read qrtr_endpoint_post()
    1128ed7e1dd0 sched/core: Check cpus_mask, not cpus_ptr in __set_cpus_allowed_ptr(), to fix mask corruption
    4e9631a90830 x86/entry: Increase entry_stack size to a full page
    010f93079a26 nvme-rdma: assign completion vector correctly
    074ae0cd8407 block: release bip in a right way in error path
    b1b252d8d9c5 usb: dwc3: pci: Fix reference count leak in dwc3_pci_resume_work
    2485b6afadd7 scsi: mptscsih: Fix read sense data size
    10533390da7c ARM: imx6: add missing put_device() call in imx6q_suspend_init()
    15fa5dfaa4e8 cifs: update ctime and mtime during truncate
    9c732cccb04b s390/kasan: fix early pgm check handler execution
    a9c816494dc2 drm: panel-orientation-quirks: Use generic orientation-data for Acer S1003
    fcab0d2f1b91 drm: panel-orientation-quirks: Add quirk for Asus T101HA panel
    b7556e7ca381 iommu/vt-d: Don't apply gfx quirks to untrusted devices
    1a570b8faea4 powerpc/kvm/book3s64: Fix kernel crash with nested kvm & DEBUG_VIRTUAL
    4e4ddeee7aff ibmvnic: continue to init in CRQ reset returns H_CLOSED
    ce4a93b9e607 i40e: protect ring accesses with READ- and WRITE_ONCE
    2e5a3586ca27 ixgbe: protect ring accesses with READ- and WRITE_ONCE
    203cfe694e9d net: ethernet: mvneta: Add 2500BaseX support for SoCs without comphy
    996bd0778a37 net: ethernet: mvneta: Fix Serdes configuration for SoCs without comphy
    8f23c0dcd096 spi: spidev: fix a potential use-after-free in spidev_release()
    010de5718162 spi: spidev: fix a race between spidev_release and spidev_remove
    44b6e192e05f ALSA: hda: Intel: add missing PCI IDs for ICL-H, TGL-H and EKL
    04197a8184e7 ASoC: SOF: Intel: add PCI ID for CometLake-S
    b1589bb5b04e drm: mcde: Fix display initialization problem
    408ddca5c737 gpu: host1x: Detach driver on unregister
    d78a975525f3 drm/tegra: hub: Do not enable orphaned window group
    dbe5fef1c2b1 drm/ttm: Fix dma_fence refcnt leak when adding move fence
    6bfa3b616c52 ARM: dts: omap4-droid4: Fix spi configuration and increase rate
    3965fe7c0a77 perf/x86/rapl: Fix RAPL config variable bug
    5f121ba6b625 perf/x86/rapl: Move RAPL support to common x86 code
    14e8708fffee regmap: fix alignment issue
    2ec3c8329aca spi: spi-fsl-dspi: Fix lockup if device is removed during SPI transfer
    6b64220baf4a spi: spi-fsl-dspi: Adding shutdown hook
    eb676bef0224 KVM: s390: reduce number of IO pins to 1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index caa5b4ef53..1bff5f45ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "508b4e6ada7f78b3ef5a9dbdd182d13dffe00123"
-SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
+SRCREV_machine ?= "8f1dfb355fc1dbbba06c5dd7d94ddb313b56b88f"
+SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.51"
+LINUX_VERSION ?= "5.4.53"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 86e133f9f2..e126968373 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.51"
+LINUX_VERSION ?= "5.4.53"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d4c9ad88abadd22f7b2785e8a101523fe9a74dc0"
-SRCREV_machine ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
+SRCREV_machine_qemuarm ?= "1930155dd075918f317d00ce6b190306ebf3a794"
+SRCREV_machine ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e79793b5f0..5489e917ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "601e67d37274e4a0890bcdbe6660c2dbd08d3b97"
-SRCREV_machine_qemuarm64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_machine_qemumips ?= "c8543a84037b88da45d0d825216187b42d0c509a"
-SRCREV_machine_qemuppc ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_machine_qemuriscv64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_machine_qemux86 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_machine_qemux86-64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_machine_qemumips64 ?= "c741fec6daabb449d08c9f96052be1477fe3c968"
-SRCREV_machine ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
-SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
+SRCREV_machine_qemuarm ?= "420ba5a7bfcd58536e7df52eb434d9ffbddbcbe5"
+SRCREV_machine_qemuarm64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemumips ?= "f621e48d6e00b26d51069eeae64f2bb479afcafc"
+SRCREV_machine_qemuppc ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemuriscv64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemux86 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemux86-64 ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_machine_qemumips64 ?= "4bf6fb25f1d73cae1486a4782bd52082ccc6715e"
+SRCREV_machine ?= "ca698a8d9c4af186ffac417a3632351bac498971"
+SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.51"
+LINUX_VERSION ?= "5.4.53"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

