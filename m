Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E890C3E8A8
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 22:29:12 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.7250.1668810545273232405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 14:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IpJiPKqd;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id h7so3710884qvs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaLXR1KUAVXuOChHFahZtTXuAtlydQ1KbYye34x6zp8=;
        b=IpJiPKqdOQKFfakSaglk4tmMPKzzmUDCl/UFpjyVIFqilZwPkTIxlRAOfsl9zrUe6k
         0WjW5EnzoHErBC97b4sK98HyqPeXwdpbl62LEdHpoikyFk61oIIdBSogEikvdNg6xR6Q
         5prHc3xIa8yckOQ6eJkFRSCnQ7DT1Qw0PBNMdqZRapQQaJCzCp97MW97idiuJkeCeXo2
         fe+L61Vd0GvpHVD2OMccfbAjVXhLp9bd/0zC7zxzu35Y7L+qdHqS3l0GnrePx/Gxbu+U
         k/zcB/pnFswGfP3Hkor32sQ5Z9zz7+xRn8it2nLXJKJhSKeadLKK3WeENeClmOyhvfsx
         dlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaLXR1KUAVXuOChHFahZtTXuAtlydQ1KbYye34x6zp8=;
        b=nBsITAlFkVX0yDkmJwNB5Qgp72NHs20+urZmA+4c/JwZJPYaDTLCjoOP6loVZn/DSo
         jHHO+lqWHUh9F1CbOv2z76d8ZAK9/DflSKzYti9cO2UD/2Qulb3eTPaa/pk5FFiQtZ5U
         Yz2f/NdZOkUH51CW0wslpVecX1w3FfFw6LGK7uBmu/ibE3+AeIR/Pnlqv5AIx26Nj+O5
         bMeCZhhGGOo6RqKgFCsYn8CPzjWBRboPAebyiWNAQSJzxSfCy3R9DFVVehjTFJ5dc80k
         QYNtSxiDXVR4lrJEMkd2hqqrHCzWqgfX+iTv1NBSU1aqaRTRNXo3tDmqSCJr4H3GScH0
         8XBg==
X-Gm-Message-State: ANoB5pkSsN3g8GYymQCPu3gfBYclgHeC7x435nABLxK/YPg5f5C7DBtk
	4h3E+aGn/+hpsf5Dr/G+Ms/579xhcVUYsg==
X-Google-Smtp-Source: AA0mqf58Zzx37itdr4Xdzw/pQ+ktn9YnNtVQ5mp6lXe2NCFcpFQYWlYFoxW8mVsrt9qaMtzRyOQhbg==
X-Received: by 2002:a0c:eb05:0:b0:4ba:f163:ae2a with SMTP id j5-20020a0ceb05000000b004baf163ae2amr8742863qvp.105.1668810544217;
        Fri, 18 Nov 2022 14:29:04 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h9-20020a05620a284900b006f9ddaaf01esm3304068qkp.102.2022.11.18.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:29:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/15] linux-yocto/5.15: update to v5.15.74
Date: Fri, 18 Nov 2022 17:28:47 -0500
Message-Id: <267b26b2b2a5786a1be902db5364d0eb4b9595a7.1668810409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668810409.git.bruce.ashfield@gmail.com>
References: <cover.1668810409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 22:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173497

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a3f2f5ac9d61 Linux 5.15.74
    de124365a7d2 wifi: mac80211: fix MBSSID parsing use-after-free
    7d998f6b7365 mac80211: fix memory leaks with element parsing
    fee48f3bdd75 mac80211: always allocate struct ieee802_11_elems
    630060f11756 mac80211: mlme: find auth challenge directly
    21df3a583e8e mac80211: move CRC into struct ieee802_11_elems
    864f2d3482f4 mac80211: mesh: clean up rx_bcn_presp API
    e5ebcbb4f967 misc: pci_endpoint_test: Fix pci_endpoint_test_{copy,write,read}() panic
    cb9defecf381 misc: pci_endpoint_test: Aggregate params checking for xfer
    2c657a0cbd48 Input: xpad - fix wireless 360 controller breaking after suspend
    db4db28fccb4 Input: xpad - add supported devices as contributed on github
    d15bb1f6dabe wifi: cfg80211: update hidden BSSes to avoid WARN_ON
    93a3a3255407 wifi: mac80211: fix crash in beacon protection for P2P-device
    fff244e9171b wifi: mac80211_hwsim: avoid mac80211 warning on bad rate
    0a8ee682e4f9 wifi: cfg80211: avoid nontransmitted BSS list corruption
    bfe29873454f wifi: cfg80211: fix BSS refcounting bugs
    9e99ca59ed39 wifi: cfg80211: ensure length byte is present before access
    0a861bd25dad wifi: cfg80211/mac80211: reject bad MBSSID elements
    9a8ef2030510 wifi: cfg80211: fix u8 overflow in cfg80211_update_notlisted_nontrans()
    398e30b67092 random: use expired timer rather than wq for mixing fast pool
    984faa6fc759 random: avoid reading two cache lines on irq randomness
    a937c59863d7 Revert "crypto: qat - reduce size of mapped region"
    0e3ff69ee691 Revert "powerpc/rtas: Implement reentrant rtas call"
    e0295c43166b USB: serial: qcserial: add new usb-id for Dell branded EM7455
    76efb4897bc3 scsi: stex: Properly zero out the passthrough command structure
    5fbbe7e98e9b efi: Correct Macmini DMI match in uefi cert quirk
    8754dc846d03 ALSA: hda: Fix position reporting on Poulsbo
    14f143fb4268 random: clamp credited irq bits to maximum mixed
    be53fa6cf667 random: restore O_NONBLOCK support
    2f96da3fd18f ceph: don't truncate file in atomic_open
    c0c3d3d3ea41 nilfs2: replace WARN_ONs by nilfs_error for checkpoint acquisition failure
    44b1ee304bac nilfs2: fix leak of nilfs_root in case of writer thread creation failure
    cb602c2b654e nilfs2: fix use-after-free bug of struct nilfs_root
    1e512c65b4ad nilfs2: fix NULL pointer dereference at nilfs_bmap_lookup_at_level()
    17aac9b7af2b Linux 5.15.73
    f7b16f51753a Revert "clk: ti: Stop using legacy clkctrl names for omap4 and 5"
    d8b1b64a070e rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
    d58eb80b723d USB: serial: ftdi_sio: fix 300 bps rate for SIO
    5ff80339cdc3 usb: mon: make mmapped memory read only
    278fefd29eea net/mlx5: Disable irq when locking lag_lock
    54f382d4b7f8 wifi: cfg80211: fix MCS divisor value
    0fa249414a6f mm/huge_memory: use pfn_to_online_page() in split_huge_pages_all()
    f1d6894159fc mm/huge_memory: minor cleanup for split_huge_pages_all
    7190afd4cd5f perf parse-events: Identify broken modifiers
    f6f740f6ca3b mmc: core: Terminate infinite loop in SD-UHS voltage switch
    9635e05e015a mmc: core: Replace with already defined values for readability
    f2af62d909ad drm/amd/display: skip audio setup when audio stream is enabled
    d444cfe6d047 drm/amd/display: update gamut remap if plane has changed
    4afcb53474ae drm/amd/display: Assume an LTTPR is always present on fixed_vs links
    5e76ff629a20 drm/amd/display: Fix double cursor on non-video RGB MPO
    e6590139ffa3 net: atlantic: fix potential memory leak in aq_ndev_close()
    005e368a61bc arch: um: Mark the stack non-executable to fix a binutils warning
    5f85191bedba um: Cleanup compiler warning in arch/x86/um/tls_32.c
    6827af886be8 um: Cleanup syscall_handler_t cast in syscalls_32.h
    f386b373e9f7 ALSA: hda/hdmi: Fix the converter reuse for the silent stream
    a36b2dc5c0da net: marvell: prestera: add support for for Aldrin2
    d2588ba1a338 net/ieee802154: fix uninit value bug in dgram_sendmsg
    1030659dac4e scsi: qedf: Fix a UAF bug in __qedf_probe()
    f7126aa3624c ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
    968299cd58b7 dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
    17f55255af4c dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
    b2f275550136 dmaengine: xilinx_dma: Fix devm_platform_ioremap_resource error handling
    fd425b89d040 firmware: arm_scmi: Add SCMI PM driver remove routine
    e092fc3a2892 firmware: arm_scmi: Harden accesses to the sensor domains
    9f81dbb934fb firmware: arm_scmi: Improve checks in the info_get operations
    64b79e632869 fs: fix UAF/GPF bug in nilfs_mdt_destroy
    31bdba07f6b2 powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush
    46c22e7b094f mm: gup: fix the fast GUP race against THP collapse
    88ccea0a4458 xsk: Inherit need_wakeup flag for shared sockets
    f07fbefcea5b docs: update mediator information in CoC docs
    cf26ddb96b4f Makefile.extrawarn: Move -Wcast-function-type-strict to W=1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e573b27c9c..414f7abbc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "47b86b149db08838964584baec1b913c5d67c060"
-SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
+SRCREV_machine ?= "cf39c84e1a884fcd4802640d20142bb506e9d3d0"
+SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.72"
+LINUX_VERSION ?= "5.15.74"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 693750860d..3b85967ca2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.72"
+LINUX_VERSION ?= "5.15.74"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "34404e5be3791dac897da77afa6c7fa00c993f78"
-SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
+SRCREV_machine ?= "61a508a44ed255900245d81ebe11bb5916e3145c"
+SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 792cf41a53..99b5c054f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "84a35b23cf4c520894d0d1b91628eb019dc7901a"
-SRCREV_machine:qemuarm64 ?= "e939c4ebc789805c00a36eaf4a190df6f8f51470"
-SRCREV_machine:qemumips ?= "1adf4e5b574a5d23b4724766890ea74101d04abd"
-SRCREV_machine:qemuppc ?= "7220def162c7b2d3b4f1c6c86de0ecc19ade7d5f"
-SRCREV_machine:qemuriscv64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:qemuriscv32 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:qemux86 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:qemux86-64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:qemumips64 ?= "3840e1613b7fe9cc68e9cdfcaf7afa5e14fa8344"
-SRCREV_machine ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
+SRCREV_machine:qemuarm ?= "af0268ca8969a472d1263e83b0a78f00834b700e"
+SRCREV_machine:qemuarm64 ?= "08b455a0e020e52340bde98e4942eaf43eb12554"
+SRCREV_machine:qemumips ?= "6f7b375ea6a2736168056e6133d01aaea592e696"
+SRCREV_machine:qemuppc ?= "73b9bd277094cae3d4b39b24f79f6e29b7518fc6"
+SRCREV_machine:qemuriscv64 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
+SRCREV_machine:qemuriscv32 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
+SRCREV_machine:qemux86 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
+SRCREV_machine:qemux86-64 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
+SRCREV_machine:qemumips64 ?= "33e8f888ab9242ea807b722c0982e871edc3339f"
+SRCREV_machine ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
+SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c68173b2012b8eba332cf9832f0ad23427d795b5"
+SRCREV_machine:class-devupstream ?= "a3f2f5ac9d61e973e383f17a95cf2aa384e2d0c4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.72"
+LINUX_VERSION ?= "5.15.74"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


