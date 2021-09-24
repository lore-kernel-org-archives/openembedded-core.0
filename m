Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.8855.1632492992612977022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qGpAmdi2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id a7so6589948plm.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wqzbOxKoOz34flq2FgUd9bzTC4eDCU9Lu6fBRJVy81Y=;
        b=qGpAmdi2IzOi8SML6PAkgdX1obeO5Y2UCDTCfQoMTcAxUxyQpDy6bK8Z2CtbrAQi/T
         fEY+782xHdNyy7TDoZgKFvmI8nlxxGrviCUDVcyr/CQWPIZA5mmlklKERKLS/FLLTI+X
         Lga6Skva3tgmhVGI7UVKiwTp2HzvnUOcAFDWndqubRYOlTlM+G8MkkZUf6auCMTP32zm
         /7UJTsFRNJn1nwsZGWUQhUtnWu+Z6ZyYgD8r/umYsEIOownAmJ1yigQLgqJgGpc8IqOf
         yAbmesDwUMEzPdzhBydObJSVxL218K1ZE2+oil02+OHkBaXNCB7rGuzebXd2g11T8c7l
         aJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqzbOxKoOz34flq2FgUd9bzTC4eDCU9Lu6fBRJVy81Y=;
        b=fXWjCG8UD3OmpG9zBQxAzifJxaymVxkfHJZvLq2XEjLqUwoEvhBsBJrwsXFX2jykbY
         p75ThAFX4x2I9cg/Uqjspdy3ao/S8aeeYpT9wlZmL1Z5TISH9pQQs7kRjZ0K01bnSUiN
         3aAqdYSG+J86rkSTq9Pt5qBecwGJHac7avtBcLEBWjZR/9x++ihvmyylUf4q1Cyil6tI
         I6ECbdqxESnmnQGgrZFtVMjJxYrxrXZV40BaN5e8Ww5Qb2PLZ0wicprKI04SAU9R9a/l
         vXPODjKKc5fCv1/AHMyR4unJHAMqwC8uZMAcJAF58+8uhsp1gTwUiqTDCcP2fCmc2Ego
         l+bA==
X-Gm-Message-State: AOAM530MG+IHWiTShIplS4z686HOQtrTiPGLxlQ0axtbAXg3yOgvlJ/6
	enqDVF2frLPHcqD3d/hrf2aXYBpGka9hRxeWMgI=
X-Google-Smtp-Source: ABdhPJyfZW8tl7OieOUrVW9iMqS+fkllhclrNzehIpWLiARmO17H9FzvdrqoVErpTnIskEOuN9IUBA==
X-Received: by 2002:a17:90a:7e90:: with SMTP id j16mr2505877pjl.139.1632492991599;
        Fri, 24 Sep 2021 07:16:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/25] linux-yocto/5.4: update to v5.4.143
Date: Fri, 24 Sep 2021 04:15:19 -1000
Message-Id: <cc1eb3c7583edd79b9aedb4bb2faadb562734a97.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    fd80923202c6 Linux 5.4.143
    4bf194158102 netfilter: nft_exthdr: fix endianness of tcp option cast
    e4fd994f02c5 fs: warn about impending deprecation of mandatory locks
    41c7f46c89f6 mm: memcontrol: fix occasional OOMs due to proportional memory.low reclaim
    1a3aa81444d3 mm, memcg: avoid stale protection values when cgroup is above protection
    9c1c449dcca0 ASoC: intel: atom: Fix breakage for PCM buffer address setup
    846ba58a7c06 PCI: Increase D3 delay for AMD Renoir/Cezanne XHCI
    548b75f4905e btrfs: prevent rename2 from exchanging a subvol with a directory from different parents
    0fc6a9c2025b ipack: tpci200: fix memory leak in the tpci200_register
    280d66b31797 ipack: tpci200: fix many double free issues in tpci200_pci_probe
    cb7aa5103146 slimbus: ngd: reset dma setup during runtime pm
    abce32d0f7f4 slimbus: messaging: check for valid transaction id
    0786d315f55c slimbus: messaging: start transaction ids from 1 instead of zero
    20c2f141b1e5 tracing / histogram: Fix NULL pointer dereference on strcmp() on NULL event name
    8fbfebe188c0 ALSA: hda - fix the 'Capture Switch' value change notifications
    85e60614d1f6 mmc: dw_mmc: Fix hang on data CRC error
    4f6c9caf7b6c ovl: add splice file read write helper
    85813f1f9e86 iavf: Fix ping is lost after untrusted VF had tried to change MAC
    a498115dcd9c i40e: Fix ATR queue selection
    1b8a8fba7853 ovs: clear skb->tstamp in forwarding path
    84dbbf5482e3 net: mdio-mux: Handle -EPROBE_DEFER correctly
    453486e79ed2 net: mdio-mux: Don't ignore memory allocation errors
    6b70c67849bb net: qlcnic: add missed unlock in qlcnic_83xx_flash_read32
    da92ce364595 virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO
    9aeadce8e33b virtio-net: support XDP when not more queues
    3ed7cf8386c9 vrf: Reset skb conntrack connection on VRF rcv
    447b16028956 bnxt_en: Add missing DMA memory barriers
    c9566df334d0 ptp_pch: Restore dependency on PCI
    a73b9aa14269 net: 6pack: fix slab-out-of-bounds in decode_data
    2bc75713434b bnxt: disable napi before canceling DIM
    a9fb0f155980 bnxt: don't lock the tx queue from napi poll
    1fe038030cc8 bpf: Clear zext_dst of dead insns
    73a45f75a07b vhost: Fix the calculation in vhost_overflow()
    b9a59636c4bf virtio: Protect vqs list access
    b264e37b3517 dccp: add do-while-0 stubs for dccp_pr_debug macros
    9112ebc2990a cpufreq: armada-37xx: forbid cpufreq for 1.2 GHz variant
    cb9a9d5fe636 iommu: Check if group is NULL before remove device
    911a8141efdd Bluetooth: hidp: use correct wait queue when removing ctrl_wait
    5b14c1f16e2d drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
    f92dc3a89dd8 net: usb: lan78xx: don't modify phy_device state concurrently
    be7043679967 ARM: dts: nomadik: Fix up interrupt controller node names
    69aa1a1a569f scsi: core: Fix capacity set to zero after offlinining device
    935de7ec7a4d scsi: core: Avoid printing an error if target_alloc() returns -ENXIO
    7a721a1e1885 scsi: scsi_dh_rdac: Avoid crash during rdac_bus_attach()
    9900e06ae6e6 scsi: megaraid_mm: Fix end of loop tests for list_for_each_entry()
    e37cf26bd56d dmaengine: of-dma: router_xlate to return -EPROBE_DEFER if controller is not yet available
    12d1322d93a6 ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218
    11145efd295b dmaengine: usb-dmac: Fix PM reference leak in usb_dmac_probe()
    9c97a0539288 dmaengine: xilinx_dma: Fix read-after-free bug when terminating transfers
    fc566b5a21f5 USB: core: Avoid WARNings for 0-length descriptor requests
    1bd505c814cc media: drivers/media/usb: fix memory leak in zr364xx_probe
    705660a6d98d media: zr364xx: fix memory leaks in probe()
    79dff2a3f41a media: zr364xx: propagate errors from zr364xx_start_readpipe()
    7305d6d4078f mtd: cfi_cmdset_0002: fix crash when erasing/writing AMD cards
    23f77ad13f81 ath9k: Postpone key cache entry deletion for TXQ frames reference it
    c6feaf806da6 ath: Modify ath_key_delete() to not need full key entry
    b7d593705eb4 ath: Export ath_hw_keysetmac()
    add283e2517a ath9k: Clear key cache explicitly on disabling hardware
    0c049ce432b3 ath: Use safer key clearing with key cache entries
    172b91bbbb49 x86/fpu: Make init_fpstate correct with optimized XSAVE
    81d152c8daf8 ext4: fix EXT4_MAX_LOGICAL_BLOCK macro

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 69958c5631..d4add9b262 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b872fc896dcc555149f26c5dd683f7e6394852d6"
-SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
+SRCREV_machine ?= "f4f6c136157b70468cf54389034aeaa41bbc5538"
+SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.142"
+LINUX_VERSION ?= "5.4.143"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0178d172f8..a2f212e2ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.142"
+LINUX_VERSION ?= "5.4.143"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "4addf3f9e4f68bc7c03ea19ad95f2a4836ac9873"
-SRCREV_machine ?= "964802684eb1495bd1c5f625307b6d41515a3e9a"
-SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
+SRCREV_machine_qemuarm ?= "83b75c59c277ba3f87759cf558f9f230c1ed3bf7"
+SRCREV_machine ?= "1f981e60c9f6162337d2a65c891f2e29d8e1c862"
+SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7e35e082fb..93cf312954 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9b1b66b01c88cf5035d148f37c70b8215c8fde15"
-SRCREV_machine_qemuarm64 ?= "e91700bf8d8130226679954a8137c5f3fd54b81d"
-SRCREV_machine_qemumips ?= "332bc089f06636156b9d5b2a04228c03c680c6d0"
-SRCREV_machine_qemuppc ?= "1bf103767b96923aa6ca76e9e095b04c13ce93cd"
-SRCREV_machine_qemuriscv64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
-SRCREV_machine_qemux86 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
-SRCREV_machine_qemux86-64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
-SRCREV_machine_qemumips64 ?= "7b31f99f9e245d029de7fb9e3480f7b00f846b8f"
-SRCREV_machine ?= "108b8b822e7bbba492deafe60ee86839291c3250"
-SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
+SRCREV_machine_qemuarm ?= "a5fb40d66dcf9b95e82a06724fe8b33a03295af4"
+SRCREV_machine_qemuarm64 ?= "bffde671f5262afb5139ef58b10be043de1d368a"
+SRCREV_machine_qemumips ?= "ac8adae0a4a582e9593b527a14f3a7e407a22e6e"
+SRCREV_machine_qemuppc ?= "022718ee2b3805d465613f05813fd6313cbb988f"
+SRCREV_machine_qemuriscv64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
+SRCREV_machine_qemux86 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
+SRCREV_machine_qemux86-64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
+SRCREV_machine_qemumips64 ?= "46871b96c7f3f1658f4b9875d6645ff7996e98f1"
+SRCREV_machine ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
+SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.142"
+LINUX_VERSION ?= "5.4.143"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

