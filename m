Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02654C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:40 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.23721.1643255738820736805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GdRpeaKl;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 71so1543955qkf.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDL+A1gnsTKIahN5qWyRLlCaUx8rvmWDB7seiLuEZXM=;
        b=GdRpeaKl6qeEwOBfPTNZv3oS/t7gvXxc60LoGPYXuWQG20B+lxSJnpFR+I8U+zhiLa
         5I8AkPXgNWcksHMfCHIK/9FmoOMu6wH31oN27CaSJexVXQ3wUJsZSEibEtV4nGrbspBv
         9nGmYi2r6qpBb9/aLdeDqZ3zqmf/ZbfRO28qLdONYHm3iEL96hdP6NonwHjacq/+MkqQ
         sh1YRybWULMKolkQKxhhJN1fMIB+MldE5sbFf2qS0ZNY8hNjXLvKn1gGbvjdLqSVqBSs
         XnhgTyEakYsDOHX4rFoIanJ4bc8Mo03BJXs3GRwOf0juU925K3PcriGWlw090tDb2+zJ
         uIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDL+A1gnsTKIahN5qWyRLlCaUx8rvmWDB7seiLuEZXM=;
        b=vOyVx+8Yqp6e/QrgC+dNPgVUdYJaos4QGHLziMvHJzjv+NUYTKjG0g4fAKvJnCyf2r
         4atwRJRzIarGqHZsAo9qZAx5etHqqL+AgtbDciLj1Kk8B9SZB3rZU2en/n0xmwW+vlKN
         TpNOoSNBM7lFCBK557Rizl9Got0aUfmVMNLuznbltx9kZRaSdwMGgYEw93wqDO1BNzTC
         x35qNsgeiUkbCa+civiVzcn3kbrBAIXfsouLf+NbDCMWlyadnFNHfomNiS145+B5mJxN
         NUZaXp2FcQLK2XuHPhgkyLvc/KuTlIZw45ogjb5BwN0XaRp8R0IYbILs+CSmjFhA6kIZ
         Bsgg==
X-Gm-Message-State: AOAM5333pvkWN5X9icn1WOeLfmtdX4ZACHDHg61G3YkuovGf/O63Xs4j
	t619kaP2AO7wOQ4CXMQChCOoblTGV9o3dw==
X-Google-Smtp-Source: 
 ABdhPJxM4ZmV5JdZ8MLDYzr/72dawsnA546HdNV5GSGNIYwVYlL8pKfvN2V7R0jD7h75IiR4pgZZQw==
X-Received: by 2002:a05:620a:109c:: with SMTP id
 g28mr1399721qkk.560.1643255737914;
        Wed, 26 Jan 2022 19:55:37 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.15: update to v5.15.15
Date: Wed, 26 Jan 2022 22:55:29 -0500
Message-Id: 
 <e84d7acfc663d9657fec8e9b0387e23b2f68bd83.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643255467.git.bruce.ashfield@gmail.com>
References: <cover.1643255467.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160997

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    760a85303c5a Linux 5.15.15
    54a457ad2c97 staging: greybus: fix stack size warning with UBSAN
    48d56b00c352 drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
    e29bd72f5c76 staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()
    46c7ff13dfe8 media: Revert "media: uvcvideo: Set unique vdev name based in type"
    e0bb3bf81cc4 platform/x86/intel: hid: add quirk to support Surface Go 3
    26b66120a896 random: fix crash on multiple early calls to add_bootloader_randomness()
    2d5b4a96a60e random: fix data race on crng init time
    f5aaea746b36 random: fix data race on crng_node_pool
    3fbbf56948b2 can: gs_usb: gs_can_start_xmit(): zero-initialize hf->{flags,reserved}
    1079b56de4af can: isotp: convert struct tpcon::{idx,len} to unsigned int
    1026f710bd55 can: gs_usb: fix use of uninitialized variable, detach device on reception of invalid USB data
    72bd750d1122 mfd: intel-lpss: Fix too early PM enablement in the ACPI ->probe()
    78a19e506bdc veth: Do not record rx queue hint in veth_xmit
    3a29fd88f3ad Bluetooth: btbcm: disable read tx power for MacBook Air 8,1 and 8,2
    7b8a6d60e0d5 Bluetooth: btbcm: disable read tx power for some Macs with the T2 Security chip
    d5eeefa335af Bluetooth: add quirk disabling LE Read Transmit Power
    49e63682cb3b mmc: sdhci-pci: Add PCI ID for Intel ADL
    6f4da584ec4e ath11k: Fix buffer overflow when scanning with extraie
    02f3458289d2 USB: Fix "slab-out-of-bounds Write" bug in usb_hcd_poll_rh_status
    0284c0ca3db6 USB: core: Fix bug in resuming hub's handling of wakeup requests
    0544baa4f761 ARM: dts: exynos: Fix BCM4330 Bluetooth reset polarity in I9100
    402aff59a748 Bluetooth: bfusb: fix division by zero in send path
    db74ee79c9f7 Bluetooth: btusb: Add support for Foxconn QCA 0xe0d0
    c6bd1c35bd84 Bluetooth: btintel: Fix broken LED quirk for legacy ROM devices
    a366a81dcbb1 Bluetooth: btusb: Add support for Foxconn MT7922A
    5e1b03c32535 Bluetooth: btusb: Add two more Bluetooth parts for WCN6855
    e81cef21ea8a Bluetooth: btusb: Add one more Bluetooth part for WCN6855
    f39825f4fc35 fget: clarify and improve __fget_files() implementation
    edaf018b898f Bluetooth: btusb: Add the new support IDs for WCN6855
    a053e9619bb9 Bluetooth: btusb: Add one more Bluetooth part for the Realtek RTL8852AE
    e36a4d9c0bb8 Bluetooth: btusb: enable Mediatek to support AOSP extension
    dcfa2d7a9a9f Bluetooth: btusb: fix memory leak in btusb_mtk_submit_wmt_recv_urb()
    4a5557693f07 Bbluetooth: btusb: Add another Bluetooth part for Realtek 8852AE
    a1e59284193b Bluetooth: btusb: Add support for IMC Networks Mediatek Chip(MT7921)
    fe9ddfd236a6 Bluetooth: btusb: Add the new support ID for Realtek RTL8852A
    3f502147ffc3 Bluetooth: btusb: Add protocol for MediaTek bluetooth devices(MT7922)
    e8efe8369944 bpf: Fix out of bounds access from invalid *_or_null type verification
    f39ffc6f9c60 staging: r8188eu: switch the led off during deinit
    cf5b6bd2c792 workqueue: Fix unbind_workers() VS wq_worker_running() race
    0ed0be755276 s390/kexec: handle R_390_PLT32DBL rela in arch_kexec_apply_relocations_add()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4713e45c2f..c4ab573524 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "799919ec2113ffcec02207ea67abdc629f3bbebe"
-SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
+SRCREV_machine ?= "777a9b34fb8c964fb6b69f787fe3bbdfd0adb37b"
+SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.14"
+LINUX_VERSION ?= "5.15.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b5397529ac..bd3fb3bf50 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.14"
+LINUX_VERSION ?= "5.15.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a499d1d7ad7cee5ddea8a737bfd0c44b109b63b6"
-SRCREV_machine ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
+SRCREV_machine:qemuarm ?= "72627ebc46d5883cf76a3e03beabe8b108e04047"
+SRCREV_machine ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index daa83eb9fe..5843aff5f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "03294d897ba8374d172b5c035e8c5698f676a1d7"
-SRCREV_machine:qemuarm64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemumips ?= "84d8700593a35c850938994e080422bd354245ce"
-SRCREV_machine:qemuppc ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemuriscv64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemuriscv32 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemux86 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemux86-64 ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_machine:qemumips64 ?= "4b8ef0714dd9fe90b5f92fab297926c482a58b88"
-SRCREV_machine ?= "f77b2ba7d575bca40670dd20fcafa4574d9e56f1"
-SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
+SRCREV_machine:qemuarm ?= "d685426cf1b93301b84f6b3dbc991f597fd706ab"
+SRCREV_machine:qemuarm64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemumips ?= "6ff6cd4991c2d99a4814dc6ad054efef7a04d63e"
+SRCREV_machine:qemuppc ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemuriscv64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemuriscv32 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemux86 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemux86-64 ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_machine:qemumips64 ?= "b9298c1913cfa71d93adb1da7aec3af9e11c9de0"
+SRCREV_machine ?= "3f365e00205a8bb6d2161c55d6ad93139fc6279e"
+SRCREV_meta ?= "0255d115fd41140e340604d0203e14d8095b176a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "d114b082bef784345bfac1e1d5c17257005284f2"
+SRCREV_machine:class-devupstream ?= "760a85303c5a2aeb811f92c76b8dca4c13bf3416"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.14"
+LINUX_VERSION ?= "5.15.15"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


