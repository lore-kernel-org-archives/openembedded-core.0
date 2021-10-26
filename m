Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E6AC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:34 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.569.1635272733502348118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SwHwP7LV;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id v10so45976qvb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ds8WfFYLC/+e6L5WTEeV2NI/rkD7Bx0SX/DgSeZ8zco=;
        b=SwHwP7LVIgkgpQ9X0Ol3LeDVzf8DgSEVDsHsXCE+Rp0XP2LlkZ4/LC3Fgp5DDGJDK6
         HQlxeg+07QHAusMlPJh/FGD7e++jHOK/8jKMVQoQj8gJgL56hMgaDQNaXe4fImYe6P9K
         VtjLZTYZEZcCsK0fEKmTv3WQCjNtD2U6Od4nQqgtzO9lXt12RVD6kMgYXOK0xkmswTxC
         urShj0E2zf4GHqKFjTZIN9ZV9HMm+MDWrodoURmGaATe5D2AhLfz0vjeREbmsRHurhhx
         yllvmRJ1OAF/Oyg0pNvzBg34hlfsZHxt/R6tjeksNbkVkQW8bqWE8IHRZKTLmaPG2yVf
         IT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ds8WfFYLC/+e6L5WTEeV2NI/rkD7Bx0SX/DgSeZ8zco=;
        b=AHj9kk4PW8WlGaTrBTIsNrjn8RED75rZLRL95lRQov3/5qiGJ/FYdGQKd5j/vk8eI+
         hWEXtNOggwQquCCMQ/bGEkkOW7PlzN5N4KAmpqwRxBHe9xMiMKdroeKwkYZR1OlC2DPP
         9TrNkEeZQIXrN0NuheXAPnVkdCoDI5eyweESMm0F617G4M1I6xMF3VRLkj9tcXmfJVt6
         RBRVNlMSFnE7Oz1dYqDFVIq+RCDGfBddUa94BKfvjVMgJMtDDZb5BxA50NMGCB+Ntsv7
         5M5Ezoj0rrfwFSdQmtNeGVT7URpYRMpUUrxCbZz6yahiUNVrIs53NwjyOHw2eVvjJnYl
         IBwA==
X-Gm-Message-State: AOAM531ib1u0d38D+AX22ofreZS0SY/zDBvSttNeiSpmVLdvSJ8P+rcY
	AiPeB3IFLGIIQf9pJVv21NhLOPvjiiDlTg==
X-Google-Smtp-Source: 
 ABdhPJxFcBFV9PaJyM619X0kP1xdiLPOXtgNMHlxAzmvnod4sPC89bX4wws+Lu+Xj/EqgcgxqQBHFQ==
X-Received: by 2002:ad4:5949:: with SMTP id eo9mr10899575qvb.44.1635272732451;
        Tue, 26 Oct 2021 11:25:32 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/5.10: update to v5.10.75
Date: Tue, 26 Oct 2021 14:25:24 -0400
Message-Id: 
 <b49974a74541318c9cb284d1d603479d4805eb60.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1635272591.git.bruce.ashfield@gmail.com>
References: <cover.1635272591.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157448

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    3a9842b42e42 Linux 5.10.75
    3e2873652163 net: dsa: mv88e6xxx: don't use PHY_DETECT on internal PHY's
    3593fa147c86 ionic: don't remove netdev->dev_addr when syncing uc list
    f33890d9bb59 net: mscc: ocelot: warn when a PTP IRQ is raised for an unknown skb
    9c546af181bc nfp: flow_offload: move flow_indr_dev_register from app init to app start
    6da9af2d2531 r8152: select CRC32 and CRYPTO/CRYPTO_HASH/CRYPTO_SHA256
    ecfd4fa15b06 qed: Fix missing error code in qed_slowpath_start()
    51f6e72ca656 mqprio: Correct stats in mqprio_dump_class_stats().
    fdaff7f9e806 platform/x86: intel_scu_ipc: Fix busy loop expiry time
    057ee6843bbb acpi/arm64: fix next_platform_timer() section mismatch error
    c6b2400095ba drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
    2c5658717428 drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
    b28586fb04f3 drm/msm/a6xx: Track current ctx by seqno
    abd11864159b drm/msm/mdp5: fix cursor-related warnings
    91a340768b01 drm/msm: Fix null pointer dereference on pointer edp
    a7b45024f66f drm/edid: In connector_bad_edid() cap num_of_ext by num_blocks read
    d0f0e1710397 drm/panel: olimex-lcd-olinuxino: select CRC32
    a4a37e6516f8 spi: bcm-qspi: clear MSPI spifie interrupt during probe
    d9428f08e1c3 platform/mellanox: mlxreg-io: Fix read access of n-bytes size attributes
    c216cebdd245 platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
    e59d839743b5 mlxsw: thermal: Fix out-of-bounds memory accesses
    7eef482db728 ata: ahci_platform: fix null-ptr-deref in ahci_platform_enable_regulators()
    116932c0e45e pata_legacy: fix a couple uninitialized variable bugs
    50cb95487c26 NFC: digital: fix possible memory leak in digital_in_send_sdd_req()
    3f2960b39f22 NFC: digital: fix possible memory leak in digital_tg_listen_mdaa()
    2f21f06a5e7a nfc: fix error handling of nfc_proto_register()
    ba39f55952a2 vhost-vdpa: Fix the wrong input in config_cb
    84e0f2fc662e ethernet: s2io: fix setting mac address during resume
    e19c10d6e07c net: encx24j600: check error in devm_regmap_init_encx24j600
    f2e1de075018 net: dsa: microchip: Added the condition for scheduling ksz_mib_read_work
    9053c5b4594c net: stmmac: fix get_hw_feature() on old hardware
    12da46cb6a90 net/mlx5e: Mutually exclude RX-FCS and RX-port-timestamp
    4f7bddf8c5c0 net/mlx5e: Fix memory leak in mlx5_core_destroy_cq() error path
    afb0c67dfdb5 net: korina: select CRC32
    33ca85010511 net: arc: select CRC32
    17a027aafd52 gpio: pca953x: Improve bias setting
    d84a69ac410f sctp: account stream padding length for reconf chunk
    6fecdb5b54a5 nvme-pci: Fix abort command id
    2d937cc12c14 ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
    6e6082250b53 ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states
    48613e687e28 ARM: dts: bcm2711: fix MDIO #address- and #size-cells
    6e6e3018d3ce ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address
    76644f94595b tee: optee: Fix missing devices unregister during optee_remove
    07f885682486 iio: dac: ti-dac5571: fix an error code in probe()
    6c0024bcaadc iio: ssp_sensors: fix error code in ssp_print_mcu_debug()
    0fbc3cf7dd9a iio: ssp_sensors: add more range checking in ssp_parse_dataframe()
    abe5b13dd959 iio: adc: max1027: Fix the number of max1X31 channels
    41e84a4f25b6 iio: light: opt3001: Fixed timeout error when 0 lux
    e811506f609a iio: mtk-auxadc: fix case IIO_CHAN_INFO_PROCESSED
    1671cfd31b66 iio: adc: max1027: Fix wrong shift with 12-bit devices
    f931076d32b6 iio: adc128s052: Fix the error handling path of 'adc128_probe()'
    4425d059aa2e iio: adc: ad7793: Fix IRQ flag
    d078043a1775 iio: adc: ad7780: Fix IRQ flag
    a8177f0576fa iio: adc: ad7192: Add IRQ flag
    be8ef91d6166 driver core: Reject pointless SYNC_STATE_ONLY device links
    d5f13bbb5104 drivers: bus: simple-pm-bus: Add support for probing simple bus only devices
    b45923f66eb6 iio: adc: aspeed: set driver data when adc probe.
    ea947267eb6f powerpc/xive: Discard disabled interrupts in get_irqchip_state()
    9e46bdfb55a3 x86/Kconfig: Do not enable AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT automatically
    57e48886401b nvmem: Fix shift-out-of-bound (UBSAN) with byte size cells
    a7bd0dd3f2ed EDAC/armada-xp: Fix output of uncorrectable error counter
    92e6e08ca2b0 virtio: write back F_VERSION_1 before validate
    86e3ad8b759d misc: fastrpc: Add missing lock before accessing find_vma()
    3f0ca245a834 USB: serial: option: add prod. id for Quectel EG91
    ecad614b0c68 USB: serial: option: add Telit LE910Cx composition 0x1204
    bf26bc72dc59 USB: serial: option: add Quectel EC200S-CN module support
    d4b77900cffe USB: serial: qcserial: add EM9191 QDL support
    3147f5721588 Input: xpad - add support for another USB ID of Nacon GC-100
    9d89e2871167 usb: musb: dsps: Fix the probe error path
    3b4275140142 efi: Change down_interruptible() in virt_efi_reset_system() to down_trylock()
    5100dc4489ab efi/cper: use stack buffer for error record decoding
    2c5dd2a8af77 cb710: avoid NULL pointer subtraction
    d40e193abd07 xhci: Enable trust tx length quirk for Fresco FL11 USB controller
    dec944bb7079 xhci: Fix command ring pointer corruption while aborting a command
    dc3e0a20dbb9 xhci: guard accesses to ep_state in xhci_endpoint_reset()
    0ee66290f006 USB: xhci: dbc: fix tty registration race
    9f0d6c781cb5 mei: me: add Ice Lake-N device id.
    e4f7171c2395 x86/resctrl: Free the ctrlval arrays when domain_setup_mon_state() fails
    0e32a2b85c7d btrfs: fix abort logic in btrfs_replace_file_extents
    52924879ed45 btrfs: update refs for any root except tree log roots
    352349aa4948 btrfs: check for error when looking up inode during dir entry replay
    4ed68471bc37 btrfs: deal with errors when adding inode reference during log replay
    95d3aba5febe btrfs: deal with errors when replaying dir entry during log replay
    206868a5b6c1 btrfs: unlock newly allocated extent buffer after error
    e7e3ed5c92b6 drm/msm: Avoid potential overflow in timeout_to_jiffies()
    a31c33aa80a5 arm64/hugetlb: fix CMA gigantic page order for non-4K PAGE_SIZE
    0c97008859ca csky: Fixup regs.sr broken in ptrace
    5dab6e8f141a csky: don't let sigreturn play with priveleged bits of status register
    e3c37135c9ca clk: socfpga: agilex: fix duplicate s2f_user0_clk
    faba7916cdc0 s390: fix strrchr() implementation
    7ef43c0f68fb nds32/ftrace: Fix Error: invalid operands (*UND* and *UND* sections) for `^'
    c3bf276fd7c8 ALSA: hda/realtek: Fix the mic type detection issue for ASUS G551JW
    1099953b32c6 ALSA: hda/realtek: Fix for quirk to enable speaker output on the Lenovo 13s Gen2
    554a5027f536 ALSA: hda/realtek: Add quirk for TongFang PHxTxX1
    0fa256509b9f ALSA: hda/realtek - ALC236 headset MIC recording issue
    1e10c6bf15d2 ALSA: hda/realtek: Add quirk for Clevo X170KM-G
    8a5f01f4b01c ALSA: hda/realtek: Complete partial device name to avoid ambiguity
    c6e5290e6cc1 ALSA: hda - Enable headphone mic on Dell Latitude laptops with ALC3254
    9bb1659ac594 ALSA: hda/realtek: Enable 4-speaker output for Dell Precision 5560 laptop
    7680631ac7ab ALSA: seq: Fix a potential UAF by wrong private_free call order
    4aab156d302c ALSA: pcm: Workaround for a wrong offset in SYNC_PTR compat ioctl
    f077d699c1d2 ALSA: usb-audio: Add quirk for VF0770

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6df672273a..2795887b92 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8048444fc7e44c6fc04a5e0b35d6117fe51c17fc"
-SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
+SRCREV_machine ?= "1d0eb980c3f825c193b07e925090a1a3dd752dbc"
+SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.74"
+LINUX_VERSION ?= "5.10.75"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2e1e5ba97d..94d0473098 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.74"
+LINUX_VERSION ?= "5.10.75"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "e6536f1c95e7201db0ebb64495fe4efcd939f354"
-SRCREV_machine ?= "92dd39e841df0bf33d81965843543c30597688be"
-SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
+SRCREV_machine:qemuarm ?= "773ad5db722c1cbac17a944ab2fd4f1d9d72c55d"
+SRCREV_machine ?= "b1ee56b4baf8a85fa02965b76dbc4ba7de898540"
+SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 243bb3a717..e7f8cc188f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "65c6899db7f84ee81bf9fe7b73b5f5d181636351"
-SRCREV_machine:qemuarm64 ?= "6d43c23b8d3aa1161644880d85b83491f8f39729"
-SRCREV_machine:qemumips ?= "4b9a9768850a12d2e806b87e0ceeab5083495035"
-SRCREV_machine:qemuppc ?= "4db24c929502797874a3cc30a7d04022526b6e8a"
-SRCREV_machine:qemuriscv64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
-SRCREV_machine:qemuriscv32 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
-SRCREV_machine:qemux86 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
-SRCREV_machine:qemux86-64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
-SRCREV_machine:qemumips64 ?= "66e7684e39bbe9b36b8673792a07c51a394c5766"
-SRCREV_machine ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
-SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
+SRCREV_machine:qemuarm ?= "eaf94169288a0cdaa7f919e81b9cde11637328a0"
+SRCREV_machine:qemuarm64 ?= "0a2409ae4ca5c3efc6633891d807c189f8c2e6ec"
+SRCREV_machine:qemumips ?= "73ca3b526488435d4f2a404642078b3b111879af"
+SRCREV_machine:qemuppc ?= "14edaae440f2835071ffacced9f240cdd8cf7094"
+SRCREV_machine:qemuriscv64 ?= "97699547a2625645320510db2237e8619a7954ef"
+SRCREV_machine:qemuriscv32 ?= "97699547a2625645320510db2237e8619a7954ef"
+SRCREV_machine:qemux86 ?= "97699547a2625645320510db2237e8619a7954ef"
+SRCREV_machine:qemux86-64 ?= "97699547a2625645320510db2237e8619a7954ef"
+SRCREV_machine:qemumips64 ?= "9e86c3417c2c6a61a52664ebcfdd541f6af7e099"
+SRCREV_machine ?= "97699547a2625645320510db2237e8619a7954ef"
+SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.74"
+LINUX_VERSION ?= "5.10.75"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


