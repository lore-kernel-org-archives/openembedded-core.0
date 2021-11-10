Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A8EC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.11532.1636549648250830956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8EmUYsr;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id bk22so2367615qkb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KPBNvGayEwuRBK/nDudeBwkNLj/ZHAyy/JLXxju1+QI=;
        b=k8EmUYsredJ/CMgonr6bqwP1oC7ia1hfjZtApphWH5cQAnVp1USAk/WErwcO4Bm4DY
         8dbL6twE9JvkZX50An7e9SCk9K57iJMdB/VZm60vWIYZv0/dmiV/1Yx40GdBwuRU1yD/
         YHOqkceWMuhpETY9Uh7bM6cdk2rq86Crq0qcnIs88n70ePUgcWN+5Rs6UEi8DOV46gqK
         IRmzu+idjSotaEyBF5DWdM5SwzUW2DYWfBUkkprmadtu2IdSmVWiL1mHvmlKe/fLDYos
         WhZ/XINrLxhEo/DqNNYnfNUnyO6BxSmX1Ke4DWx7qqfbI6WqqS5OvK/vSlKeY6Jyv/jx
         dpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KPBNvGayEwuRBK/nDudeBwkNLj/ZHAyy/JLXxju1+QI=;
        b=7JAhF2QBs5l2b6/NKaWUAcDX2xzmp29CTuPicwXWv83TGIMp1VkaHOYYIrXfncmkF8
         DuEAT+g9w8BVc0alHxyyhcPL2MUS2uFZ7OFQmK/z976Qs1EG0SbLabY89389kyGuXJ59
         9hHE9R01knMRFrvQ+NbY7DTJY6YVwLpTqt8ab7MoY58ubR8TNQCua+e5aQxNs3QpUoDd
         H73QXQRE5bUl+/AABeEK/26k8s9m2Thyc+Fc7d9kCVwcCJY4OANppTGicapZzjkvd3gC
         zqT/uea6KdyoJ6pxGgbRQEuIOwj1YCD0nclN3Uhij1TLPqpxVybUuzfCikArZkBolUMZ
         WZtA==
X-Gm-Message-State: AOAM532Bp5GvVeFhR0zdFZ87DqnPGKvmIOc2ZWgItR205mOAeMmNu7bH
	/n2FFGAj+h5OBlQ6z+M3xa+eMLQxn9kuzg==
X-Google-Smtp-Source: 
 ABdhPJxFYzsdD6AVcShtPGuy3LBmB4RXPivHY44o6H/sSHOXjUCs20oQ9imz7msTf9Hpy5WphFPXJA==
X-Received: by 2002:a37:2ec4:: with SMTP id
 u187mr12210780qkh.62.1636549647299;
        Wed, 10 Nov 2021 05:07:27 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/5.15: update to v5.15.1
Date: Wed, 10 Nov 2021 08:07:14 -0500
Message-Id: 
 <91019659913bca50434e594f8f8a0d917518a3e0.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158070

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    b6abb62daa55 Linux 5.15.1
    569fd073a954 ALSA: usb-audio: Add quirk for Audient iD14
    fd5f954b690c Revert "drm/i915/gt: Propagate change in error status to children on unhold"
    8af3a335b553 drm/amd/display: Revert "Directly retrain link from debugfs"
    6ecad8906f05 drm/amdgpu: revert "Add autodump debugfs node for gpu reset v8"
    a273384cf1af Revert "wcn36xx: Disable bmps when encryption is disabled"
    57f31b313231 ARM: 9120/1: Revert "amba: make use of -1 IRQs warn"
    110d5f4421ed Revert "soc: imx: gpcv2: move reset assert after requesting domain power up"
    f17dca0ab3f3 drm/amdkfd: fix boot failure when iommu is disabled in Picasso.
    f5e3b7f0f0b7 Revert "usb: core: hcd: Add support for deferring roothub registration"
    421f91bf0451 Revert "xhci: Set HCD flag to defer primary roothub registration"
    cb667140875a media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
    abc558fd0f89 sfc: Fix reading non-legacy supported link modes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e79ff27ddc..879f2be677 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6f51b8d2b7dcecfffa6262c622bc252aa298ffbe"
-SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
+SRCREV_machine ?= "b9ff38638d2398b647629e768713eefb0fc6707a"
+SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15"
+LINUX_VERSION ?= "5.15.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2cf2209182..6035dc47f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15"
+LINUX_VERSION ?= "5.15.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "5fbef884c98a51679ab4ab566568b1e89123c011"
-SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
+SRCREV_machine:qemuarm ?= "098dbfb0e6d95ae958e1003738fb0dc90a81691b"
+SRCREV_machine ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index af73fe3ed1..0fd49d78cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "83100b68b82b6f2dabb72b7f707fcfd6d2d06f96"
-SRCREV_machine:qemuarm64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemumips ?= "efcb751af175ea5e17234b05305829c97fb1e7a5"
-SRCREV_machine:qemuppc ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemuriscv64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemuriscv32 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemux86 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemux86-64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_machine:qemumips64 ?= "2cf7c4b42019c88e1e6e56b660eacf355058f8b8"
-SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
-SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
+SRCREV_machine:qemuarm ?= "47b7bd92b84e0ad136d45956e86039ad7307c892"
+SRCREV_machine:qemuarm64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemumips ?= "e2dd4de2dfebf97237b87c414d0582016f64d5b1"
+SRCREV_machine:qemuppc ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemuriscv64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemuriscv32 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemux86 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemux86-64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_machine:qemumips64 ?= "066b9f8175fc7136c15768204ba71d3fddc2f4f8"
+SRCREV_machine ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
+SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "3c163f0b1d3bbab61e4b3c38b960f6e478489580"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "8bb7eca972ad531c9b149c0a51ab43a417385813"
+SRCREV_machine:class-devupstream ?= "b6abb62daa5511c4a3eaa30cbdb02544d1f10fa2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15"
+LINUX_VERSION ?= "5.15.1"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


