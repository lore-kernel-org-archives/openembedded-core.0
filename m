Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38553C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:40:13 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.28625.1675269611507037360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8CWAxQr;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id x18so13594410qvl.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVpcrp9/C/BqC3Y+sMSXJF/5Nds+aoPTsZ+ET8pbGRo=;
        b=Y8CWAxQrvmDNElWEaP5ylFmsJJ3ZuCkx4JTksFfEW4nUyv/pJYKGAG4oal92wGoXhI
         Nv04knzy9D8HJ3r8AXkDh0NgFV3JbpZfCuaVGUlZQuvmkUAzTASxtoytLnC42/CzN6HJ
         xac1LgpvbBiyorIM2IybW0sZOS6bQcj237ru6hCSENeJ2YN+/lOU8ge1rt5BA8m9gY2Y
         m223TM59vqj0tdNj8Dbr5VSm+/pZ6fMKstTtK5q3xOw5JiCJUa8hVa/Ea8zZcVHRxPwV
         rhRBLnSfEE2wyQa6yKtD/hABMSCo6aGmJHc/QBd0cxmDxcjE1oQGOiwTIVMilbTulile
         ePVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVpcrp9/C/BqC3Y+sMSXJF/5Nds+aoPTsZ+ET8pbGRo=;
        b=oAgH4t9switwjwjPP7Bo+0fIYaw0dpRg238FFBKaVXV11c2t/ny8XmHMAi9s5CTAwA
         gOJR9Fy6vskHurTjIZU5J2+m0HwiuKI4IHr3wS3QTQgpLp3+Buzoyfp+a7CgnndCdtcS
         IEQRJQ2F61rg9c+TLOhg9IRFZPbGNB0T+XtbZ/+n+KIkM4W0XYqoj4/uHLK1i6/5PJfK
         gDia/04VpBkyC8Deom0R9LL52zjXSHD5E620BuWJyeJGa4Dh1bBNY2wxmW+GpINhQygh
         lheLR/tIJ2UiXn/CKS4kgSSjXLlg781r67ygCnUmZLJ6X8DcMPhWr5u4pbDufE2L4FX4
         BbbA==
X-Gm-Message-State: AO0yUKX/3ImI0YaPSZgZW3kSY+InaB9N3NH47oAlgyC83y/AMXUMSShf
	5HibPlrBv9IvG6Akgb1Q8KsIt3W9hT43Jw==
X-Google-Smtp-Source: AK7set9V2uejewGru/5hreeL8+GBj69kCNQfNPBfbdLYJFZgFgWC7R6//4ou5A9ZHuLkBqP9GsWmuQ==
X-Received: by 2002:a05:6214:5a08:b0:53a:a554:8391 with SMTP id lu8-20020a0562145a0800b0053aa5548391mr4566908qvb.19.1675269610436;
        Wed, 01 Feb 2023 08:40:10 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id ou29-20020a05620a621d00b0070638ad5986sm12301519qkn.85.2023.02.01.08.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:40:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [2/2][dunfell] linux-yocto/5.4: update to v5.4.230
Date: Wed,  1 Feb 2023 11:40:07 -0500
Message-Id: <20230201164007.2205984-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201164007.2205984-1-bruce.ashfield@gmail.com>
References: <20230201164007.2205984-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176569

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    90245959a5b9 Linux 5.4.230
    29487eed37ae mm/khugepaged: fix collapse_pte_mapped_thp() to allow anon_vma
    7242fc8c2f5e x86/fpu: Use _Alignof to avoid undefined behavior in TYPE_ALIGN
    2b1375fac0de drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
    763a74e1de74 drm/amd/display: Fix set scaling doesn's work
    39e0844a1e96 drm/i915: re-disable RC6p on Sandy Bridge
    ffef77794fb5 gsmi: fix null-deref in gsmi_get_variable
    b4461af0a5e6 serial: atmel: fix incorrect baudrate setup
    55f9aca283d5 dmaengine: tegra210-adma: fix global intr clear
    5d99369685a6 serial: pch_uart: Pass correct sg to dma_unmap_sg()
    97697a252ba0 dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible string documentation
    aa1b22daa019 usb-storage: apply IGNORE_UAS only for HIKSEMI MD202 on RTL9210
    a21da7f7aae6 usb: gadget: f_ncm: fix potential NULL ptr deref in ncm_bitrate()
    83b0aac55df0 usb: gadget: g_webcam: Send color matching descriptor per frame
    004fbb049b84 usb: typec: altmodes/displayport: Fix pin assignment calculation
    a1478ef59b0e usb: typec: altmodes/displayport: Add pin assignment helper
    040e0d1281c7 usb: host: ehci-fsl: Fix module alias
    8d5740ad8f76 USB: serial: cp210x: add SCALANCE LPE-9000 device id
    9a39f4626b36 USB: gadgetfs: Fix race between mounting and unmounting
    1bc1fdd73f3d cifs: do not include page data when checking signature
    89ac597e3e80 btrfs: fix race between quota rescan and disable leading to NULL pointer deref
    61cad0c61cdb mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
    4f96ae71d336 comedi: adv_pci1760: Fix PWM instruction handling
    f11a68916422 usb: core: hub: disable autosuspend for TI TUSB8041
    556dfdb226ce misc: fastrpc: Fix use-after-free race condition for maps
    4b5c44e924a5 misc: fastrpc: Don't remove map on creater_process and device_release
    04eb41ec9611 USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100
    7ebb3ecab1ff USB: serial: option: add Quectel EM05CN modem
    32165699a08d USB: serial: option: add Quectel EM05CN (SG) modem
    81affe3b469e USB: serial: option: add Quectel EC200U modem
    a7c19d94b899 USB: serial: option: add Quectel EM05-G (RS) modem
    5966eda55028 USB: serial: option: add Quectel EM05-G (CS) modem
    eece7a6c97cf USB: serial: option: add Quectel EM05-G (GR) modem
    96b02125dd68 prlimit: do_prlimit needs to have a speculation check
    afcb4e0ab843 xhci: Detect lpm incapable xHC USB3 roothub ports from ACPI tables
    84e2e57769af usb: acpi: add helper to check port lpm capability using acpi _DSM
    8a6e963bf280 xhci: Add a flag to disable USB3 lpm on a xhci root port level.
    cf6e5d3c2de1 xhci: Add update_hub_device override for PCI xHCI hosts
    133b902378e4 xhci: Fix null pointer dereference when host dies
    9891e5c73cab usb: xhci: Check endpoint is valid before dereferencing it
    643f7da7828d xhci-pci: set the dma max_seg_size
    890792b57990 ALSA: hda/realtek - Turn on power early
    e60730280b57 drm/i915/gt: Reset twice
    2e3e2649ea38 efi: fix userspace infinite retry read efivars after EFI runtime services page fault
    b0ba060d3287 nilfs2: fix general protection fault in nilfs_btree_insert()
    53dd833fd0a2 Add exception protection processing for vd in axi_chan_handle_err function
    33a4d05138df wifi: brcmfmac: fix regression for Broadcom PCIe wifi devices
    557e85ff9afe f2fs: let's avoid panic if extent_tree is not created
    7165dd4c3b07 RDMA/srp: Move large values to a new enum for gcc13
    19304ffb7b38 net/ethtool/ioctl: return -EOPNOTSUPP if we have no phy stats
    4de1a5af1be3 selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID
    a869f7b05411 pNFS/filelayout: Fix coalescing test for single DS

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 36159ac5b0..222c8708a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "430278c953a6c3614604a2852ba836039663bb65"
-SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
+SRCREV_machine ?= "053238af99b52ce5ffb19755cdfeb10f206463da"
+SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.229"
+LINUX_VERSION ?= "5.4.230"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 6abed4169f..2727a9b094 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.229"
+LINUX_VERSION ?= "5.4.230"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d8143ca5ca26eeedcb7935aeb47adcd532e94969"
-SRCREV_machine ?= "3ecac0457b3095be2824b28d025aad72fe5f5e25"
-SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
+SRCREV_machine_qemuarm ?= "8517d03dcde5d19a2fd9493433275b3790450ae5"
+SRCREV_machine ?= "d05044bfcb54db9a3dfb9cccd3a39c2c07d844b1"
+SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3e346b0093..c5c846deb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "df7aef2e323db780b804567cd7cf4b9c55e4622d"
-SRCREV_machine_qemuarm64 ?= "4b94e6b1d6938c9e32947fa10376c7ed2e5f914d"
-SRCREV_machine_qemumips ?= "98ca7afaec302294afbc336c3b266ebf60432fe1"
-SRCREV_machine_qemuppc ?= "921849d498a19c70e61c8ba708394c0c1351b21b"
-SRCREV_machine_qemuriscv64 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
-SRCREV_machine_qemux86 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
-SRCREV_machine_qemux86-64 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
-SRCREV_machine_qemumips64 ?= "7ea86c799c5fc1a7cbbb379dcfbd045c4e404406"
-SRCREV_machine ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
-SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
+SRCREV_machine_qemuarm ?= "c3e35e461a4f880bfe3d007c763fe4ff1670621f"
+SRCREV_machine_qemuarm64 ?= "5604d6b87d39cd4eb427762610f505d5659ce73f"
+SRCREV_machine_qemumips ?= "d0ef5b5eea98083cbb30d42bb191b280d2637a02"
+SRCREV_machine_qemuppc ?= "79202d38795f70dd5c7601cbc8d1c54ecb831ad9"
+SRCREV_machine_qemuriscv64 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
+SRCREV_machine_qemux86 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
+SRCREV_machine_qemux86-64 ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
+SRCREV_machine_qemumips64 ?= "eafe1aabab778a089d20f0c686902a7a7215b57e"
+SRCREV_machine ?= "c32d5a645da049cf72f9e6b819c32609c7effcec"
+SRCREV_meta ?= "9c5bb858a6f5a9b1cc2e585e74e8517387863fd7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.229"
+LINUX_VERSION ?= "5.4.230"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


