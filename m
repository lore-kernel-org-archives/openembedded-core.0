Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F8BC433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:30 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.11533.1636549649837400035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OeZJ+fg9;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 193so2341354qkh.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HBqcZz5Pm+Ne3Vf60QVM1+Mlacg3XoUMkVV6B/4ZjsU=;
        b=OeZJ+fg9uLrwYMPLncfkKuMk9ohJYQ/pvGbTMvMcc/0Zy6eMWaD1HMu6sR9WNbagyX
         vdRptCGd4D12r6nVXlYyVURGTBZdqwAKuvFP74MpGtHuCx6t/8+wX44hfolvm5yLs47O
         InmtXwCePDpautIx/km0NwL2B0rW7hp8Lq8vf950XUtT384yMMk0cH5uZon8yaSPBdBD
         j2OZvxhBKlCdU+OP3hsMzg6dnhDc/oeiMoAY7Glurt/CBTHYj3AiTsPY5HtvPS6QUYFe
         G5JQzl2e/+gA8cIx/1rUE4hFN7SNtac6s09yC2UGT2fvQynBL5G/SQxlQINOIbqLx7Ry
         lMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HBqcZz5Pm+Ne3Vf60QVM1+Mlacg3XoUMkVV6B/4ZjsU=;
        b=XgPQl0qSZN4abo22nRyG+32SRJFd5ufooXiS+nN+VhgHP5dft3g8erIIvTqjkugZ2j
         75uoMuWKcJi+riL7Zmilpaut5xz8wL6hdbbce726hs5qLxVu9Jn1pR8ye97+3N/2DYQr
         3mgu8GRWm6AWSw9yeP57v9KEnIWtVlG86ItdGKWFeCx/+/e+8hqb90vJmc31vVuau39D
         i1rrIuMfwzptJtFobAFbcyCU75uvm4uOvgPwy6pWfd4VLhnsOMeCUczJNwLz1cQ1Sn5J
         Bcv2TbeN9P11W8YgY0gilJwjQUbky6slZ7cJclPr0IqgDclev+IdNbY7At5s2o1QTXyo
         wqCw==
X-Gm-Message-State: AOAM530yZcslslf0DY0NlgFHDifEKWguoG3xACPnMqQBHrBp5t4ySky1
	uf/KIDsAAt0QeoQDDzQ6qoTVIlqQlRVjGw==
X-Google-Smtp-Source: 
 ABdhPJzVQTlGkirolE1QLFV0gjay/IMdcbv7A5ofsLfAQVGYSp5SvtoZ2fl9gABUqG2SHOkrK8pY2Q==
X-Received: by 2002:a05:620a:1232:: with SMTP id
 v18mr12557038qkj.261.1636549648904;
        Wed, 10 Nov 2021 05:07:28 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.10: update to v5.10.78
Date: Wed, 10 Nov 2021 08:07:15 -0500
Message-Id: 
 <55707a271b58b0679d21bad526648926ccf98ada.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158071

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    5040520482a5 Linux 5.10.78
    4c7c0243275b ALSA: usb-audio: Add Audient iD14 to mixer map quirk table
    f3eb44f496ef ALSA: usb-audio: Add Schiit Hel device to mixer map quirk table
    68765fc97762 Revert "wcn36xx: Disable bmps when encryption is disabled"
    f84b791d4c3b ARM: 9120/1: Revert "amba: make use of -1 IRQs warn"
    bbc920fb320f Revert "drm/ttm: fix memleak in ttm_transfered_destroy"
    6d67b2a73b8e mm: khugepaged: skip huge page collapse for special files
    5a7957491e31 Revert "usb: core: hcd: Add support for deferring roothub registration"
    50f46bd30949 Revert "xhci: Set HCD flag to defer primary roothub registration"
    d7fc85f61042 media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
    b93a70bf2b57 net: ethernet: microchip: lan743x: Fix skb allocation failure
    b9c85a71e1b4 vrf: Revert "Reset skb conntrack connection..."
    0382fdf9ae78 sfc: Fix reading non-legacy supported link modes
    748786564a35 Revert "io_uring: reinforce cancel on flush during exit"
    7b57c38d12ae scsi: core: Put LLD module refcnt after SCSI device is released

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index cc9aaf8b27..f666ac0611 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a416eeb4d0bdbba2a133744a465f2c9a46e3a96"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine ?= "12f6a7187b3c8abab5e139dbfdf7f58f265f4169"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7a61793569..86010f106f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c5c9d2c5c8ce7a84f6aebf02b3ae824a4c5f9d56"
-SRCREV_machine ?= "c3e3199c6359736c373aaecc8f447eaec7cf9432"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine:qemuarm ?= "cdec5045c5323846adaf2510e539843d0cfe74ae"
+SRCREV_machine ?= "344c0c38f5b892312b0a1db7f613d2704dd4942f"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 98c1ade1df..2e81068330 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "51e48df3dbbc2b03579e95b296bf7b2625cf456b"
-SRCREV_machine:qemuarm64 ?= "c437750233de239844757e4c79bfd9e9c56e1b0d"
-SRCREV_machine:qemumips ?= "f2acb9e5f819ce240b530851f9e8ed45a8f7d878"
-SRCREV_machine:qemuppc ?= "b36a906729ef754c48d730f15a7f079eb4942356"
-SRCREV_machine:qemuriscv64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine:qemuriscv32 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine:qemux86 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine:qemux86-64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine:qemumips64 ?= "1b436658828965d7f96ff5e532ff0bb6b1099cff"
-SRCREV_machine ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine:qemuarm ?= "f98b917d7826304daeecf11cc52be2562a9304ff"
+SRCREV_machine:qemuarm64 ?= "13ff8a3ae368724e008e3bcd77833611de7962b2"
+SRCREV_machine:qemumips ?= "7b94dec2b0f5b582b97cdb3ac97fe153559869e4"
+SRCREV_machine:qemuppc ?= "652531fb0cc8eb3607109bb8d878253be2d3d534"
+SRCREV_machine:qemuriscv64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine:qemuriscv32 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine:qemux86 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine:qemux86-64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine:qemumips64 ?= "4c817df0fd06350e18693551699c33361e16a193"
+SRCREV_machine ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


