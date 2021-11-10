Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F7C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.11527.1636549646424418628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5GHlOpn;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id m25so1947548qtq.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/pqf6/u+hswxMykoUC/S5MQ3sM3KCKHLV75CJuhGcc=;
        b=B5GHlOpnwIOsZqWm1wlSq4aWMik1ooYb1o1d040KGKXiEaz1HSN+EDIzaTgkubLODN
         +eEfuyLaVLqEKYrIdJTPiWjkjPCaXML6LPn9XhuT5q3UAId/WAI/2RZ0d5BQq2SPjbyH
         GHAlr9sCqM0u3Mvc9VfGdt6WPjAItOl3c8/rMuFiMLDDOZNSzaV5xycZcUT0if6SiDOT
         iISeR7WSqzOisvCbks93j2txZYhci4STAfB0ZsrhK5NlOce/NlvPHcY+INWKzNL0uGIC
         m6PLnZNM5GxAJGOFO4RE1niWHnJOuulGACWb85sVctKfh3iFG8o0K+cpBRFKbZ9eqf11
         x89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/pqf6/u+hswxMykoUC/S5MQ3sM3KCKHLV75CJuhGcc=;
        b=xQcMF9luZBfAhreX2IyMW4kMNHQSO/ZmUaD+zNkxKnUWlB+EbEfBh5LNbJZUuJbfZ6
         Mztwjp3Fb/Y/RlmH3GVjNyYsc5ckq8b5sSaZUcINerKnx7BhYrre0HeO4/AiPZWjmpwb
         9Tq6Chc2al1Cu9+SU8S5O7d11XTC/BYCf6WqmJ2yMr8M1LeXyec1zRJEUQNfAC76+eZw
         4ywW3QtHGTZ1y9VjBYu4jC50Ji8QJDOcrbb11eFabaSlxHPelA0JPy5S0Fa8H97RHUnY
         gcgWuSsU8yU5ocf+cZCnlv/MQ7SJiFEvXSolTY5NWDEm6NGkV0Z41CLMc6ayT+ujMObt
         n1NA==
X-Gm-Message-State: AOAM5317vzlk2PEr/KhexnYCqRbSGODUczi3Pm0DwrsmfILasYneZxAy
	X1UuFSP/WS8Sbr5Lq25DUq4QHKticjEFnA==
X-Google-Smtp-Source: 
 ABdhPJzGhJP6T2fZJV73t49kOWmIxHY0fEpqw62u687ad4tEn4CKZWUHu2swOnjZSygt4odxc5P+EA==
X-Received: by 2002:ac8:58d6:: with SMTP id u22mr6821159qta.405.1636549645536;
        Wed, 10 Nov 2021 05:07:25 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.14: update to v5.14.17
Date: Wed, 10 Nov 2021 08:07:13 -0500
Message-Id: 
 <bc3fba5e152bcea276724291c9f6822a88184d78.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158069

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    3dfa869cb79d Linux 5.14.17
    b1dbd891bfe5 ALSA: usb-audio: Add Audient iD14 to mixer map quirk table
    570b5004f827 ALSA: usb-audio: Add Schiit Hel device to mixer map quirk table
    db6d7c4acca3 Revert "drm/i915/gt: Propagate change in error status to children on unhold"
    aac2f6861683 drm/amd/display: Revert "Directly retrain link from debugfs"
    77d029e1e218 drm/amdgpu: revert "Add autodump debugfs node for gpu reset v8"
    9f9e09a59c58 Revert "wcn36xx: Disable bmps when encryption is disabled"
    b9722a7369f8 ARM: 9120/1: Revert "amba: make use of -1 IRQs warn"
    e556fca311ce Revert "soc: imx: gpcv2: move reset assert after requesting domain power up"
    d6a60e6ada49 drm/i915: Remove memory frequency calculation
    7883e13c2494 drm/amdkfd: fix boot failure when iommu is disabled in Picasso.
    a82fa1213d12 Revert "usb: core: hcd: Add support for deferring roothub registration"
    0979b923ff3f Revert "xhci: Set HCD flag to defer primary roothub registration"
    02a476ca886d media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
    ec0c91e2ebb8 vrf: Revert "Reset skb conntrack connection..."
    6467b75cf9d1 sfc: Fix reading non-legacy supported link modes
    f30822c0b4c3 scsi: core: Put LLD module refcnt after SCSI device is released

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index be4c678f65..7e02f83d51 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d1275779725dc0ebe673b10c4617e0c3bb6262d2"
-SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
+SRCREV_machine ?= "672665c11dd86abd71bbad0537e6388c6a5a84ca"
+SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.16"
+LINUX_VERSION ?= "5.14.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 134c4813fc..9ad9549554 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.16"
+LINUX_VERSION ?= "5.14.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "5fa2600d6ad51505a546646e7d4ab85eac23cc54"
-SRCREV_machine ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
+SRCREV_machine:qemuarm ?= "566227d5b0913910467a7736d78cad37e60217f8"
+SRCREV_machine ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 56a61897ba..f034f36d45 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "272e3443b607073023075ee7901933d874a86e6d"
-SRCREV_machine:qemuarm64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemumips ?= "4e6b51635881e6027ea2b61885537e5d427f11f4"
-SRCREV_machine:qemuppc ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemuriscv64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemuriscv32 ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemux86 ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemux86-64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_machine:qemumips64 ?= "be5e677a1904b7f6555a1d619cd379f5031dbe24"
-SRCREV_machine ?= "9e759d64ede1347c5611633962d239661b2198e7"
-SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
+SRCREV_machine:qemuarm ?= "eef94a78151c2227eba9a8468ac611d9507482b5"
+SRCREV_machine:qemuarm64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemumips ?= "607d94618b35382f38ab2bc0d37494372897ae4d"
+SRCREV_machine:qemuppc ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemuriscv64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemuriscv32 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemux86 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemux86-64 ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_machine:qemumips64 ?= "9ed182ebbcd4c77b8f99439d2feb6c4591148324"
+SRCREV_machine ?= "35888b3a9a222963b856c960e8f0c72c2de18d4a"
+SRCREV_meta ?= "b3ac9c40a22d6b00545b7ce51ef6dfb0cb9d2933"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "f63179c1e68ce99d511b683ad05d3829d0e4d9e9"
+SRCREV_machine:class-devupstream ?= "3dfa869cb79d60a2fe66efb4a11517ec7c89de16"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.16"
+LINUX_VERSION ?= "5.14.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


