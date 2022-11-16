Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65372C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.1246.1668559114418168992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iA2yD9S0;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id x18so10723444qki.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHbu6Xnt1s9/ETs+gGjnXSAjyXM5faAY6FAcpoQ5YGE=;
        b=iA2yD9S0HVTBDw7F2COjO8yEVqiC0bAW8KiWvpvjxH2dzpN8PNKVHtvP43OeD3oSZS
         XqItL2TGBk1AsOD70bzGtCAgHobk5fRkanzGvJk90ORzIQunNfOyLfNOlLvFn2VyoHE+
         pNz3yI8gWegzYbuMmKwovJrRUqafTRvjqYJhkuhOQ54vnb05Js2e3EbCELC6BUEgYPEV
         i1BjxLzlyKkx+mm9HGgMV1B32B/uMkdesIRzHN25xBJt87DGKSAQJUDiTCHqbi+qnWXv
         3VZd+d6Nh9jmUDJCr3rseYGOAj7GVMGy5G1D+GmD0W2PTGp4TEQq/sx9yVwrFuZR6sBm
         Opcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHbu6Xnt1s9/ETs+gGjnXSAjyXM5faAY6FAcpoQ5YGE=;
        b=cAtEoBj7lrmqENeZ4Kxc2Z7+DMbAZ0vNRc981ttxF2it4QuyqOcsbuho/e+ACUgRw5
         wewWrNIRb4W+2FYER478uJ4d+CrTV0ah+PquRLcU9FDtp8HaX+fcp4Tc+3oBstpyaY1P
         sxbDIlOEhXmE4cRhyekIYRJu3MMXgjdSG079q7e5kkiorcPggg0jjBH650fVm2jhSF6y
         rFPlBDvOl3lnPmkKKSpahL9vlHC9ztMQxslH64SPmQrw6Ua5ULDfEvT6c1OerQEA370I
         zCnGPDl9jWrHXGLf+TdxH+LdWZxdPiv2lL0JAJCoPgSAuBhb58F5Qaty36U5DHL7Dlkh
         +jWw==
X-Gm-Message-State: ANoB5pmAwbZI+2Z47LyCHtoqp9o/MeVqRW4DxOtKoMNX133io8WPnpI/
	qg9Sw5cyPiCF6Is61OPx7wOvFClYdSUl7Q==
X-Google-Smtp-Source: AA0mqf5lsAdm+6PCeT2LNyznIW84gqhPJsIm1tHs8y6UdCmSo/Z4jqUwPm/s/s7CUxcshtpHlCmwLA==
X-Received: by 2002:a37:b86:0:b0:6f6:8c12:e12c with SMTP id 128-20020a370b86000000b006f68c12e12cmr17485413qkl.396.1668559113347;
        Tue, 15 Nov 2022 16:38:33 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/5.19: update to v5.19.16
Date: Tue, 15 Nov 2022 19:38:20 -0500
Message-Id: <ba0cc5c90cebab2c14b489cdc8625df57be47a66.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173365

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d235c2b1f470 Linux 5.19.16
    279116cb0bc5 misc: pci_endpoint_test: Fix pci_endpoint_test_{copy,write,read}() panic
    d472808756b3 misc: pci_endpoint_test: Aggregate params checking for xfer
    d0ecbd70f080 Input: xpad - fix wireless 360 controller breaking after suspend
    d1a1dbe71f73 Input: xpad - add supported devices as contributed on github
    ac719db96b23 mctp: prevent double key removal and unref
    3aecb0895aac wifi: cfg80211: update hidden BSSes to avoid WARN_ON
    fa63b5f6f885 wifi: mac80211: fix crash in beacon protection for P2P-device
    2bee6f75e3c6 wifi: mac80211_hwsim: avoid mac80211 warning on bad rate
    1d73c990e9ba wifi: cfg80211: avoid nontransmitted BSS list corruption
    46b23a955958 wifi: cfg80211: fix BSS refcounting bugs
    867184200c05 wifi: cfg80211: ensure length byte is present before access
    e6d77ac0132d wifi: mac80211: fix MBSSID parsing use-after-free
    74abb1952a03 wifi: cfg80211/mac80211: reject bad MBSSID elements
    42ea11a81ac8 wifi: cfg80211: fix u8 overflow in cfg80211_update_notlisted_nontrans()
    848bb8517e41 random: use expired timer rather than wq for mixing fast pool
    111824744645 random: avoid reading two cache lines on irq randomness
    ee42204c1cd5 Revert "crypto: qat - reduce size of mapped region"
    3a8f93f3779e Revert "powerpc/rtas: Implement reentrant rtas call"
    bd9c917efcf8 Revert "usb: dwc3: Don't switch OTG -> peripheral if extcon is present"
    d42228fc2cad Revert "USB: fixup for merge issue with "usb: dwc3: Don't switch OTG -> peripheral if extcon is present""
    5857b9cd9b91 USB: serial: qcserial: add new usb-id for Dell branded EM7455
    6ae8aa5dcf0d scsi: stex: Properly zero out the passthrough command structure
    55e19a4c111e efi: Correct Macmini DMI match in uefi cert quirk
    a0d53923bf91 ALSA: hda/realtek: Add quirk for HP Zbook Firefly 14 G9 model
    59ac9fa0e33f ALSA: hda: Fix position reporting on Poulsbo
    b42a64428abe random: clamp credited irq bits to maximum mixed
    e1f8820bf83f random: restore O_NONBLOCK support
    ae2e80078145 nvme-pci: set min_align_mask before calculating max_hw_sectors
    6c58865f1acd ceph: don't truncate file in atomic_open
    090fcfb6edeb nilfs2: replace WARN_ONs by nilfs_error for checkpoint acquisition failure
    4755fcd84424 nilfs2: fix leak of nilfs_root in case of writer thread creation failure
    394b2571e9a7 nilfs2: fix use-after-free bug of struct nilfs_root
    caf2c6b58043 nilfs2: fix NULL pointer dereference at nilfs_bmap_lookup_at_level()
    51dd976781da Linux 5.19.15
    04bd2a779511 Revert "clk: ti: Stop using legacy clkctrl names for omap4 and 5"
    c4635cf3d845 Bluetooth: use hdev->workqueue when queuing hdev->{cmd,ncmd}_timer works
    6954cee88268 bpf: Fix resetting logic for unreferenced kptrs
    292b46c49675 net: ethernet: mtk_eth_soc: fix state in __mtk_foe_entry_clear
    9783292253fd bpf: Gate dynptr API behind CAP_BPF
    7d3f5d0353b4 rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
    165ae42fc1cf mmc: core: Terminate infinite loop in SD-UHS voltage switch
    b2afdaddaa8c mmc: core: Replace with already defined values for readability
    0b0f40745ab4 gpiolib: acpi: Add a quirk for Asus UM325UAZ
    aa476c7b6375 gpiolib: acpi: Add support to ignore programming an interrupt
    a9d2ce58126c USB: serial: ftdi_sio: fix 300 bps rate for SIO
    9de74019cd44 usb: mon: make mmapped memory read only
    c2423912d5c9 i2c: davinci: fix PM disable depth imbalance in davinci_i2c_probe
    71c41e04d9d8 don't use __kernel_write() on kmap_local_page()
    5dac20360a7b perf/x86/intel: Fix unchecked MSR access error for Alder Lake N
    3682460b9327 drm/amd/display: increase dcn315 pstate change latency
    94d49c380b9a drm/amd/display: Fix DP MST timeslot issue when fallback happened
    4fb0b18590c6 drm/amd/display: skip audio setup when audio stream is enabled
    3c15b295ae2f drm/amd/display: update gamut remap if plane has changed
    89d387065803 drm/amd/display: Assume an LTTPR is always present on fixed_vs links
    d1137c3c03d8 drm/amd/display: Fix double cursor on non-video RGB MPO
    32c1dde16f0a KVM: s390: Pass initialized arg even if unused
    5b4e1c1ffba3 net: atlantic: fix potential memory leak in aq_ndev_close()
    cfaf7f090a40 arch: um: Mark the stack non-executable to fix a binutils warning
    a460f846d580 gpio: ftgpio010: Make irqchip immutable
    d71f03dbcc17 um: Cleanup compiler warning in arch/x86/um/tls_32.c
    c7105d2a77a6 um: Cleanup syscall_handler_t cast in syscalls_32.h
    9cdbc61abaa0 ALSA: hda/hdmi: Fix the converter reuse for the silent stream
    7480deff597a net: marvell: prestera: add support for for Aldrin2
    be248292a483 net/ieee802154: fix uninit value bug in dgram_sendmsg
    ce57f7b2e614 scsi: qedf: Fix a UAF bug in __qedf_probe()
    5f2f00509496 drm/amdgpu/mes: zero the sdma_hqd_mask of 2nd SDMA engine for SDMA 6.0.1
    f8895cfb48b0 ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
    7e834ee927a5 wifi: iwlwifi: don't spam logs with NSS>2 messages
    229769759ef8 dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
    e38f67582567 dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
    92f8963831f1 dmaengine: xilinx_dma: Fix devm_platform_ioremap_resource error handling
    666f5be3593c arm64: dts: rockchip: fix upper usb port on BPI-R2-Pro
    edc5c66d15f9 firmware: arm_scmi: Add SCMI PM driver remove routine
    8e880f30946f firmware: arm_scmi: Harden accesses to the sensor domains
    41bf1b0ad953 firmware: arm_scmi: Improve checks in the info_get operations
    81de80330fa6 fs: fix UAF/GPF bug in nilfs_mdt_destroy
    8529dfb5ef72 xsk: Inherit need_wakeup flag for shared sockets
    7ebe331054cf docs: update mediator information in CoC docs
    3b760c94de19 hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero
    19a4cb1c4eb8 Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
    8dc610c9478c sparc: Unbreak the build

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 87a3aff41a..c2398a3a59 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "92f22179274bd656239b8aa70eb655473abf68f5"
-SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
+SRCREV_machine ?= "127fc6310660dd27804f6f27c57574ba61761ab5"
+SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.14"
+LINUX_VERSION ?= "5.19.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 0cd8a2bfab..8b9a702685 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.14"
+LINUX_VERSION ?= "5.19.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
+SRCREV_machine ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index a6fcf10579..7af4e8835b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8150698489c801b7aa4a641d4feec1de1b2ea07c"
-SRCREV_machine:qemuarm64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemumips ?= "8d7dc30e65155e4a6a217b054cf54252ace8c724"
-SRCREV_machine:qemuppc ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemuriscv64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemuriscv32 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemux86 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemux86-64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_machine:qemumips64 ?= "930822733328e39e8698bfac5a4e4e8d6a25b4d5"
-SRCREV_machine ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
-SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
+SRCREV_machine:qemuarm ?= "4a8660a840a9f9beede5a5a45dc48031b4416ff0"
+SRCREV_machine:qemuarm64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemumips ?= "6f3e66bc642900e59b6d831c0b8a0cf3aa1a62ce"
+SRCREV_machine:qemuppc ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemuriscv64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemuriscv32 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemux86 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemux86-64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_machine:qemumips64 ?= "544923be2a8b7b540209f35fa0b6e893ac39a599"
+SRCREV_machine ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
+SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "30c780ac0f9fc09160790cf58f07ef3b92097ceb"
+SRCREV_machine:class-devupstream ?= "d235c2b1f470f012bda26844aabf26321b1c446a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.14"
+LINUX_VERSION ?= "5.19.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


