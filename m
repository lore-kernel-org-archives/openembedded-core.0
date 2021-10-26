Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5F0C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:33 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.559.1635272732491261624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YEUTP6oL;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id bi29so1181742qkb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VQOPnNnrBMNNeoOb6cSpWuKPO5SL7ytP6ApSOYefM30=;
        b=YEUTP6oL80IurxaI165NY2azbogxaL4pA45JXBxRRz7gpu0URErE5OVFATRD2id1rm
         AQ75iwFRUljn89S2tYJWQ+zAJ4po6fWWYFg3UtNLP+Z8KCiaojreku1Obee5VmnSk8kf
         AnDX9IqCfE0fn1E88CuIS7Wn2450Hw5TlCeGinzrHNQHV0rKyvBJymTcXPCYlEyR8dYV
         5dRaoT0qFzjNdhIZ3KhLlRrs/VNvPZ5+f7cdf5Vx5d85tUi1uMJYeXcKqFF6E0qNOJks
         1BvnyNpqB4i4GPn8PmO1mtaV9LsQxCvV9CFErMUvXIHi9vu+ciR9ac7zKp9ayT9RxC8z
         PlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQOPnNnrBMNNeoOb6cSpWuKPO5SL7ytP6ApSOYefM30=;
        b=adXedUa6Rlxd3azHiSvYWxsHXH9hffV1Y7epAb+xVl4TvYp1Hoanj45+64QYk8WXEz
         DcX+XllcduOeMGofIANWKk0QTsVSb9pPqU+ZmRXZ9rl3i+cJKjN6RoUjYBtYogzKZ0Vy
         v1zKTh5BPBprKIDdk4abnH/oWwF9unEUUQMeDtq65Le1jrCnmH8E011kUBaVZWkkRWth
         wruxqaq22adOx8wVhhYj1u9s8RIxte6xOfnHjJG4SRu9It9AOs80fld5mgWzrVhxnM6o
         NXEvRZ2dJ7J4mnaX5pmQEOFUxS5Nb5m2Y9eS6DjAh1d1FFWcl2//Nu9L23Q8d49FrAYV
         BDrw==
X-Gm-Message-State: AOAM532A7CpPkt1DfkpvyzZ1RkNgCwNHD3Fz7mCdPpP+AyuWlvnB1wpv
	eX3NmuvFmKB/m2de1xvADZo7NAuMdnGmaA==
X-Google-Smtp-Source: 
 ABdhPJweuaLhgNv2opMz+n8MUTqV9xjJw9t8A1mITLW4vTheLFgeOsq6kesvfs0VeOhR8m8d5TvKXQ==
X-Received: by 2002:a05:620a:1a8f:: with SMTP id
 bl15mr20608367qkb.315.1635272731299;
        Tue, 26 Oct 2021 11:25:31 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.14: update to v5.14.14
Date: Tue, 26 Oct 2021 14:25:23 -0400
Message-Id: 
 <5d9765b9dabd798e3d406c54a73263be3816378b.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1635272591.git.bruce.ashfield@gmail.com>
References: <cover.1635272591.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157447

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    fe024e004fa3 Linux 5.14.14
    9513ce07f05b ionic: don't remove netdev->dev_addr when syncing uc list
    6b55eadb0b1d net: dsa: felix: break at first CPU port during init and teardown
    9d2cec10ea9e net: mscc: ocelot: cross-check the sequence id from the timestamp FIFO with the skb PTP header
    23a6801c0585 net: mscc: ocelot: deny TX timestamping of non-PTP packets
    de32ef6d79dd net: mscc: ocelot: warn when a PTP IRQ is raised for an unknown skb
    3b4241817601 net: mscc: ocelot: avoid overflowing the PTP timestamp FIFO
    34fd7a2e375a net: mscc: ocelot: make use of all 63 PTP timestamp identifiers
    f7697d70d76b nfp: flow_offload: move flow_indr_dev_register from app init to app start
    9d162f541ba3 block/rnbd-clt-sysfs: fix a couple uninitialized variable bugs
    61616be89997 ice: fix locking for Tx timestamp tracking flush
    99eef638a327 r8152: select CRC32 and CRYPTO/CRYPTO_HASH/CRYPTO_SHA256
    821dca5635e2 qed: Fix missing error code in qed_slowpath_start()
    1a4554e94f0d mptcp: fix possible stall on recvmsg()
    4fd74935619f mqprio: Correct stats in mqprio_dump_class_stats().
    395218b5c7e0 platform/x86: intel_scu_ipc: Fix busy loop expiry time
    b4fb645a7412 acpi/arm64: fix next_platform_timer() section mismatch error
    6302ce26eceb drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
    3c403c4c0580 drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
    f1457eea4ccd drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready
    d59e44e7821a drm/msm/a3xx: fix error handling in a3xx_gpu_init()
    3962d626eb3e drm/msm/a4xx: fix error handling in a4xx_gpu_init()
    20cfa89cd7e1 drm/msm/a6xx: Track current ctx by seqno
    00ba7a3951f4 drm/msm/submit: fix overflow check on 64-bit architectures
    2d28dafbc88e drm/msm/mdp5: fix cursor-related warnings
    46c8ddede027 drm/msm: Fix null pointer dereference on pointer edp
    09f3946bb452 drm/edid: In connector_bad_edid() cap num_of_ext by num_blocks read
    8b0462c25eff drm/panel: olimex-lcd-olinuxino: select CRC32
    dc4f4acadabf spi: bcm-qspi: clear MSPI spifie interrupt during probe
    2a51f25a7ed9 spi: spidev: Add SPI ID table
    b461c8553474 platform/mellanox: mlxreg-io: Fix read access of n-bytes size attributes
    1da4f33681b5 platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
    df8e58716afb mlxsw: thermal: Fix out-of-bounds memory accesses
    2d14f8a9f1b7 ata: ahci_platform: fix null-ptr-deref in ahci_platform_enable_regulators()
    55b033b82dde pata_legacy: fix a couple uninitialized variable bugs
    6432d7f1d1c3 NFC: digital: fix possible memory leak in digital_in_send_sdd_req()
    564249219e5b NFC: digital: fix possible memory leak in digital_tg_listen_mdaa()
    e005ba2235b6 nfc: fix error handling of nfc_proto_register()
    0b84e32840b7 vhost-vdpa: Fix the wrong input in config_cb
    2d902349653c ethernet: s2io: fix setting mac address during resume
    322c0e534963 net: encx24j600: check error in devm_regmap_init_encx24j600
    38eaccdcc811 net: dsa: fix spurious error message when unoffloaded port leaves bridge
    383239a33cf2 net: dsa: microchip: Added the condition for scheduling ksz_mib_read_work
    b1752d2f4fc2 net: dsa: mv88e6xxx: don't use PHY_DETECT on internal PHY's
    f71c73a1275c net: phy: Do not shutdown PHYs in READY state
    568feb737f5e net: stmmac: fix get_hw_feature() on old hardware
    947442b62090 net/mlx5e: Switchdev representors are not vlan challenged
    2f306483d547 net/mlx5e: Mutually exclude RX-FCS and RX-port-timestamp
    ed8aafea4fec net/mlx5e: Fix memory leak in mlx5_core_destroy_cq() error path
    0d9ddf515cde net/smc: improved fix wait on already cleared link
    844b62f61709 net: korina: select CRC32
    af9a33bfff34 net: arc: select CRC32
    81099749174e gpio: pca953x: Improve bias setting
    9025c92a6cc7 gpio: 74x164: Add SPI device ID table
    4f0bc44b9191 sctp: account stream padding length for reconf chunk
    5ccd69157a9a nvme-pci: Fix abort command id
    9036542c2bef clk: renesas: rzg2l: Fix clk status function
    abab28387755 ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
    264e77ee3987 ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states
    06560ba731e2 firmware: arm_ffa: Add missing remove callback to ffa_bus_type
    b2da1ae1941d firmware: arm_ffa: Fix __ffa_devices_unregister
    a0dfb710735d ARM: dts: bcm2711: fix MDIO #address- and #size-cells
    83fe15846c48 ARM: dts: bcm283x: Fix VEC address for BCM2711
    2a7374dd882d ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address
    a009758b28f3 tee: optee: Fix missing devices unregister during optee_remove
    362d067a231d tracing: Fix missing osnoise tracer on max_latency
    ce5c6dd07473 iio: dac: ti-dac5571: fix an error code in probe()
    8d3fd8fdf2cb fpga: ice40-spi: Add SPI device ID table
    645e2c994b6a eeprom: at25: Add SPI ID table
    362fe6c8d5ab eeprom: 93xx46: fix MODULE_DEVICE_TABLE
    42c587653cb7 eeprom: 93xx46: Add SPI device ID table
    1a5ba478c41c Input: resistive-adc-touch - fix division by zero error on z1 == 0
    6ad4dc9602fa iio: ssp_sensors: fix error code in ssp_print_mcu_debug()
    af8aae7a1257 iio: ssp_sensors: add more range checking in ssp_parse_dataframe()
    3903e5404214 iio: adc: max1027: Fix the number of max1X31 channels
    43e399d862ef iio: accel: fxls8962af: return IRQ_HANDLED when fifo is flushed
    56e3bcdf6b9b iio: light: opt3001: Fixed timeout error when 0 lux
    07415de29ded iio: mtk-auxadc: fix case IIO_CHAN_INFO_PROCESSED
    04e03b907022 iio: adis16475: fix deadlock on frequency set
    06a6230a5683 iio: adc: max1027: Fix wrong shift with 12-bit devices
    45b54f7f6ae7 iio: adc128s052: Fix the error handling path of 'adc128_probe()'
    2c675f25eb35 iio: adis16480: fix devices that do not support sleep mode
    696eef458c31 iio: adc: ad7793: Fix IRQ flag
    c9e8c11b1a84 iio: adc: ad7780: Fix IRQ flag
    d8f72ea6ccfd iio: adc: ad7192: Add IRQ flag
    10dea2bc52e4 driver core: Reject pointless SYNC_STATE_ONLY device links
    e733c7a6f754 drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
    11d6dbd807aa iio: adc: aspeed: set driver data when adc probe.
    74c078866ff4 powerpc/xive: Discard disabled interrupts in get_irqchip_state()
    202975c570d2 x86/Kconfig: Do not enable AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT automatically
    128f38289215 x86/fpu: Mask out the invalid MXCSR bits properly
    bce9adf0b5ea Revert "virtio-blk: Add validation for block size in config space"
    f2935e790419 virtio-blk: remove unneeded "likely" statements
    0e822e5413da nvmem: Fix shift-out-of-bound (UBSAN) with byte size cells
    eb1e9f2ec683 EDAC/armada-xp: Fix output of uncorrectable error counter
    2c2e626d9ba4 virtio: write back F_VERSION_1 before validate
    d22592f1fd8d misc: fastrpc: Add missing lock before accessing find_vma()
    6df4c42e0b60 USB: serial: option: add prod. id for Quectel EG91
    b39adce3afe1 USB: serial: option: add Telit LE910Cx composition 0x1204
    8372fb17ebf2 USB: serial: option: add Quectel EC200S-CN module support
    1e2c4a11a59b USB: serial: qcserial: add EM9191 QDL support
    96703298fc51 Input: xpad - add support for another USB ID of Nacon GC-100
    ff9249aab398 usb: musb: dsps: Fix the probe error path
    85c6f477b357 efi: Change down_interruptible() in virt_efi_reset_system() to down_trylock()
    3b7951e32193 efi/cper: use stack buffer for error record decoding
    746b00a48688 cb710: avoid NULL pointer subtraction
    2b6c75bf9202 xhci: Enable trust tx length quirk for Fresco FL11 USB controller
    e54abefe703a xhci: Fix command ring pointer corruption while aborting a command
    fa3093d37cce xhci: add quirk for host controllers that don't update endpoint DCS
    eacfdec26656 xhci: guard accesses to ep_state in xhci_endpoint_reset()
    db96c1d87c95 USB: xhci: dbc: fix tty registration race
    7c0af62f11c3 mei: hbm: drop hbm responses on early shutdown
    fe87a580929e mei: me: add Ice Lake-N device id.
    ce8f1faa8140 x86/resctrl: Free the ctrlval arrays when domain_setup_mon_state() fails
    0294b7ccb00b module: fix clang CFI with MODULE_UNLOAD=n
    0e309e1152fc btrfs: fix abort logic in btrfs_replace_file_extents
    f86531a3115f btrfs: update refs for any root except tree log roots
    5dbc0d798074 btrfs: check for error when looking up inode during dir entry replay
    439cce2df925 btrfs: deal with errors when adding inode reference during log replay
    790dbfcd43a0 btrfs: deal with errors when replaying dir entry during log replay
    0adda9f173f1 btrfs: unlock newly allocated extent buffer after error
    697ee8c3d3fa drm/msm: Avoid potential overflow in timeout_to_jiffies()
    2479f72f5328 drm/msm: Do not run snapshot on non-DPU devices
    95a9523afb3d drm/nouveau/fifo: Reinstate the correct engine bit programming
    0af9c042cd6e arm64/hugetlb: fix CMA gigantic page order for non-4K PAGE_SIZE
    f66b6d61f2e3 drm/fbdev: Clamp fbdev surface size if too large
    2c7820141702 csky: Fixup regs.sr broken in ptrace
    f8e8e5448c77 csky: don't let sigreturn play with priveleged bits of status register
    46f067744387 clk: socfpga: agilex: fix duplicate s2f_user0_clk
    d429630cde94 s390: fix strrchr() implementation
    8ca9745efe35 dm rq: don't queue request to blk-mq during DM suspend
    d856f5d13d65 ACPI: PM: Include alternate AMDI0005 id in special behaviour
    6e506f07c5b5 dm: fix mempool NULL pointer race when completing IO
    594a97f7617b nds32/ftrace: Fix Error: invalid operands (*UND* and *UND* sections) for `^'
    24262c6439c6 mtd: rawnand: qcom: Update code word value for raw read
    f7744bdec09f spi: atmel: Fix PDC transfer setup bug
    26a88eedfc88 platform/x86: amd-pmc: Add alternative acpi id for PMC controller
    1a707ec090e9 platform/x86: gigabyte-wmi: add support for B550 AORUS ELITE AX V2
    52d44bd028c1 ALSA: hda/realtek: Fix the mic type detection issue for ASUS G551JW
    8c5628cbb26e ALSA: hda/realtek: Fix for quirk to enable speaker output on the Lenovo 13s Gen2
    9a13d0f9c3d9 ALSA: hda/realtek: Add quirk for TongFang PHxTxX1
    f8d3c17e1c37 ALSA: hda/realtek - ALC236 headset MIC recording issue
    1f923b81f49e ALSA: hda/realtek: Add quirk for Clevo X170KM-G
    07015c2e0f35 ALSA: hda/realtek: Complete partial device name to avoid ambiguity
    a2fc31b3699a ALSA: hda - Enable headphone mic on Dell Latitude laptops with ALC3254
    72653bfc9b9d ALSA: hda/realtek: Enable 4-speaker output for Dell Precision 5560 laptop
    14137ae740cb ALSA: seq: Fix a potential UAF by wrong private_free call order
    dfd5633ae775 ALSA: usb-audio: Fix a missing error check in scarlett gen2 mixer
    1a98c3c68795 ALSA: pcm: Workaround for a wrong offset in SYNC_PTR compat ioctl
    ca3dccb96511 ALSA: usb-audio: Add quirk for VF0770

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 3d53a32d40..e5dc3c30c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cddeec4e197612a11f5a3d746a15825c66040830"
-SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
+SRCREV_machine ?= "725e45fd0b3b344905a44398b1d7ba64b76c6af2"
+SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.13"
+LINUX_VERSION ?= "5.14.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 0683912eb2..0da8ae5e69 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.13"
+LINUX_VERSION ?= "5.14.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ace292aaba53e26d1888bebda95bbadfd417c2a5"
-SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
+SRCREV_machine:qemuarm ?= "bdbb56b345a04855091cbf667c70d761f417ddff"
+SRCREV_machine ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 2d4600746c..ed20557183 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0ecde89d921e617656eaf267c6229732761ceb60"
-SRCREV_machine:qemuarm64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemumips ?= "ccb44d7db58f17783101bbc1550d67c4d0edf46f"
-SRCREV_machine:qemuppc ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemuriscv64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemuriscv32 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemux86 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemux86-64 ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_machine:qemumips64 ?= "b8f18794a5a6bb9c6d0190a2006dfbd82f0f5916"
-SRCREV_machine ?= "ca50fa43acc878c2590a7f5cb93aef0ba17591aa"
-SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
+SRCREV_machine:qemuarm ?= "3e04a89e8e89fe2f799cd201f6994ff515ca95c1"
+SRCREV_machine:qemuarm64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemumips ?= "566b7915f715e00e4ebb2a4121239de4cb1f33b5"
+SRCREV_machine:qemuppc ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemuriscv64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemuriscv32 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemux86 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemux86-64 ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_machine:qemumips64 ?= "13d9e1b6481efec1e72733134e83b981e0adf6bb"
+SRCREV_machine ?= "28c011f5b095822798d2a8320f104abc0fc216cd"
+SRCREV_meta ?= "11430e73de6cbc577b69ab4844250346146eb3cf"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "dc308bdf001acd203ed912852bafbf779696d507"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "b9ed054073957b91d758135fdf277b3f77b5f2f1"
+SRCREV_machine:class-devupstream ?= "fe024e004fa31dc64d18440c006b02cd8d722a03"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.13"
+LINUX_VERSION ?= "5.14.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


