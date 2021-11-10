Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8BAC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:08:53 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.11568.1636549733044171092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I6j/klaY;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id j17so2005911qtx.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z0Tkq2i4kzT16jlZwQnBPuL1U9m8klc/Cp8CdEllheg=;
        b=I6j/klaY83rpbpxXq+X5tG9quooD9GcTwR/CtaYEqJhsNJJ5c6qtOV21sxpHpM92xt
         YDQrjDbGNAna7kZcGkRsb+f2F1kekcRxMFgK7uqcJUgJicRFyDi6x29ifha+0mbaJuCp
         /WkuszJHSK9iEiuQIQ/QeHipuwKCRFZsBxEMVnBLbf60DCkj3T0C39l/sqSiKJRLle8S
         Y1dj3Lp0NkFmqgMM9hlAqJr8YJPZi6JByHRZJUDjZWjzrNlorfx0QlSz9BogQvck4gyN
         z4IZqR28ylg9N49mdIcrkPD6H2E5IblJ2yFFcDQWquqpb8Q3jvZ2S2vbn9sZtgX/Vuv/
         +98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z0Tkq2i4kzT16jlZwQnBPuL1U9m8klc/Cp8CdEllheg=;
        b=wNnKg52JCS2l3V/nGM+xalzZ3oGBGwyycJMOUWv9tPbSiKuIySEtHFegMHjhLZkBys
         riaGSIIISIU1stfPodiOYt/xWlxhYGMoORAIheje7m5MWC1iFK7OLNmOi9eIyh2sl+wt
         fshut17fxuRXOLChhvx/vsgjvocymEeAChtKhcgfV2N7ujVIHhn5GH6y/VHB3Y3lsqjj
         WqKlyIIhu8psz3NePZAPv5LgFWXP0fM0AXI12W48sxn7DJgrYXVpMWxF+dx4WGE0j947
         MCaLMVYBqY4H0Z1V3Z+jNXFdydQ1A+MvCkyuHeL6XytSSFqwsX0FM7mbqJLk+AY/iyrU
         mAvQ==
X-Gm-Message-State: AOAM533zBYYtjkkgJ8Mpr85NATi3cHCvSrbufWrwRsZ89rhnvyYJRpkI
	TXJnhNeeGWOeYDvsUf+7zqmO2A/M3UZtjA==
X-Google-Smtp-Source: 
 ABdhPJzsHeTFVzqnNu31ZQqzL9eUWpRrEcjx6VbrFrqd27Z/m84ooqeVh93AzB0OSyi8JTzNYMhO2g==
X-Received: by 2002:ac8:59cc:: with SMTP id
 f12mr17394434qtf.397.1636549731776;
        Wed, 10 Nov 2021 05:08:51 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 k85sm2017996qke.134.2021.11.10.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:08:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.4: update to v5.4.155
Date: Wed, 10 Nov 2021 08:08:45 -0500
Message-Id: <20211110130847.40746-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20211110130847.40746-1-bruce.ashfield@gmail.com>
References: <20211110130847.40746-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:08:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158074

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4f508aa9dd3b Linux 5.4.155
    32d2ce0b9499 ionic: don't remove netdev->dev_addr when syncing uc list
    abaf8e8b9081 r8152: select CRC32 and CRYPTO/CRYPTO_HASH/CRYPTO_SHA256
    a4f7d2246e3b qed: Fix missing error code in qed_slowpath_start()
    62d96bb68b4e mqprio: Correct stats in mqprio_dump_class_stats().
    fa272e835325 acpi/arm64: fix next_platform_timer() section mismatch error
    32ac4ed32b9a drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
    46200989580c drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
    f302be08e3de drm/msm: Fix null pointer dereference on pointer edp
    0d5ef1e87554 drm/panel: olimex-lcd-olinuxino: select CRC32
    9225d57f51e2 platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
    ae0993739e14 mlxsw: thermal: Fix out-of-bounds memory accesses
    97e6dcb41625 ata: ahci_platform: fix null-ptr-deref in ahci_platform_enable_regulators()
    b9352ed9b983 pata_legacy: fix a couple uninitialized variable bugs
    2bde4aca56db NFC: digital: fix possible memory leak in digital_in_send_sdd_req()
    7ab488d7228a NFC: digital: fix possible memory leak in digital_tg_listen_mdaa()
    69b3a13f0d08 nfc: fix error handling of nfc_proto_register()
    2731eaac1965 ethernet: s2io: fix setting mac address during resume
    4c2eb80fc90b net: encx24j600: check error in devm_regmap_init_encx24j600
    0904e1be2a92 net: stmmac: fix get_hw_feature() on old hardware
    06251ea8d1d9 net/mlx5e: Mutually exclude RX-FCS and RX-port-timestamp
    19a01522c5d0 net: korina: select CRC32
    32b57d897eff net: arc: select CRC32
    2880dc130236 gpio: pca953x: Improve bias setting
    d88774539539 sctp: account stream padding length for reconf chunk
    232c485c6bcd iio: dac: ti-dac5571: fix an error code in probe()
    69696951de5a iio: ssp_sensors: fix error code in ssp_print_mcu_debug()
    10ecff1522eb iio: ssp_sensors: add more range checking in ssp_parse_dataframe()
    ac0688bcd151 iio: light: opt3001: Fixed timeout error when 0 lux
    3c00d93297ff iio: mtk-auxadc: fix case IIO_CHAN_INFO_PROCESSED
    cf4b39907a82 iio: adc128s052: Fix the error handling path of 'adc128_probe()'
    580c09a9ef9e iio: adc: aspeed: set driver data when adc probe.
    1904050cacd7 powerpc/xive: Discard disabled interrupts in get_irqchip_state()
    5683ed468fa0 x86/Kconfig: Do not enable AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT automatically
    0594f1d048d8 nvmem: Fix shift-out-of-bound (UBSAN) with byte size cells
    d07571672c90 EDAC/armada-xp: Fix output of uncorrectable error counter
    dba8834baed3 virtio: write back F_VERSION_1 before validate
    1b39a67856cc USB: serial: option: add prod. id for Quectel EG91
    41e178c138d9 USB: serial: option: add Telit LE910Cx composition 0x1204
    848eac2cb785 USB: serial: option: add Quectel EC200S-CN module support
    958e98ca522c USB: serial: qcserial: add EM9191 QDL support
    733dcc08e97b Input: xpad - add support for another USB ID of Nacon GC-100
    9ab5d539bc97 usb: musb: dsps: Fix the probe error path
    278e483dc793 efi: Change down_interruptible() in virt_efi_reset_system() to down_trylock()
    27a847dbc962 efi/cper: use stack buffer for error record decoding
    6e35a5e9267d cb710: avoid NULL pointer subtraction
    e71ce4a81ed4 xhci: Enable trust tx length quirk for Fresco FL11 USB controller
    01c2dcb67e71 xhci: Fix command ring pointer corruption while aborting a command
    7ce7d4a46d6e xhci: guard accesses to ep_state in xhci_endpoint_reset()
    783579057c90 mei: me: add Ice Lake-N device id.
    9264bd22d701 x86/resctrl: Free the ctrlval arrays when domain_setup_mon_state() fails
    10b77e16b35b watchdog: orion: use 0 for unset heartbeat
    9acf1c10f1da btrfs: check for error when looking up inode during dir entry replay
    625565fd80ae btrfs: deal with errors when adding inode reference during log replay
    6e2ac49b21ea btrfs: deal with errors when replaying dir entry during log replay
    005a07c9acd6 btrfs: unlock newly allocated extent buffer after error
    e9f457f056c5 csky: Fixup regs.sr broken in ptrace
    a6f4ea748aa8 csky: don't let sigreturn play with priveleged bits of status register
    98544ca6cbae s390: fix strrchr() implementation
    5959e22e0767 nds32/ftrace: Fix Error: invalid operands (*UND* and *UND* sections) for `^'
    2e41b9c8461f ALSA: hda/realtek: Fix the mic type detection issue for ASUS G551JW
    90cf96afa347 ALSA: hda/realtek - ALC236 headset MIC recording issue
    33627fa4db3e ALSA: hda/realtek: Add quirk for Clevo X170KM-G
    e96079ab1c4e ALSA: hda/realtek: Complete partial device name to avoid ambiguity
    dd3f04831523 ALSA: seq: Fix a potential UAF by wrong private_free call order
    825786f72326 ALSA: usb-audio: Add quirk for VF0770
    43d93325265b ovl: simplify file splice

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index dbd8ab3bb0..b7deb35287 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1f04ded6552fb7ceb6b01768d1a11a828c67c212"
-SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
+SRCREV_machine ?= "b02e867b0f32d3a2a6f74a4ce0622da02fc2f64d"
+SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.154"
+LINUX_VERSION ?= "5.4.155"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ca73895d7f..3df9c478df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.154"
+LINUX_VERSION ?= "5.4.155"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "03c343c7f0392cc71eedc9ba0f05b0ebe02d45eb"
-SRCREV_machine ?= "4ef13608e3bc691718485e28fc6b78fa58c50d58"
-SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
+SRCREV_machine_qemuarm ?= "43bbfba52ea9da370694e070fc0a9dfac656075c"
+SRCREV_machine ?= "34ea81635909c42198e86298c0d4544a3e3530c2"
+SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7ed524efea..c46b2526d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9cc72430854edf4b980ece62e234629168e69b07"
-SRCREV_machine_qemuarm64 ?= "eb73aaed8bd13cffd05d699a6745408965708d7b"
-SRCREV_machine_qemumips ?= "6d7d1235cb7e9f9cb1071e630ea79a88a90f86fd"
-SRCREV_machine_qemuppc ?= "c22f5f06e64f63837c677cf09158131b9531c2d4"
-SRCREV_machine_qemuriscv64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
-SRCREV_machine_qemux86 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
-SRCREV_machine_qemux86-64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
-SRCREV_machine_qemumips64 ?= "4cf95264615ab852cdadd478c37554ab7fd1ea14"
-SRCREV_machine ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
-SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
+SRCREV_machine_qemuarm ?= "f4e3842e04fc154f280aa93e590aac66a136dd4f"
+SRCREV_machine_qemuarm64 ?= "848ee4a4a53a07cc1c0d2fc35f4c65466949e15a"
+SRCREV_machine_qemumips ?= "88b6eeb87f18d6bfc7986a272c4b6822bafb2ed5"
+SRCREV_machine_qemuppc ?= "58318412f0f5d5a25767d2444ff8198378b74f8d"
+SRCREV_machine_qemuriscv64 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
+SRCREV_machine_qemux86 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
+SRCREV_machine_qemux86-64 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
+SRCREV_machine_qemumips64 ?= "70b1c7289102ce9981713c42f3f11950fb6a1bc7"
+SRCREV_machine ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
+SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.154"
+LINUX_VERSION ?= "5.4.155"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


