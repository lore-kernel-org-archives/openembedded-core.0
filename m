Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4393C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:12:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.6415.1640013143159506129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eUH5zMg/;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id a1so9964390qtx.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tx3FsbCfXiPRqTFCiYMcWEYs3Yr8GjPbDQpRnYfn6oU=;
        b=eUH5zMg/H2mv4Zz6B+wqQWL16a0Sr9pha9BrpXOxPswJkJCX02WqsK916GKdQdwLlW
         91nsEG+dbZ3OECJYR06AcUryJHn3Zrs4xEIi3X/2aOB4bTwx9ebQq5XVMyYyhGbHJ77u
         cyf5iMbkqtRa4k77IT+aEMVBWVCCBvVOhL9CahEmz96YsESCWy+eyaDs/sMmW2yHGEAF
         Bsv/nMooVDD1YdTLfa7OZHBsFvLMRSmkDIy2M3tg+XWePa0pLZD8k2hsoUE6GF5oAyXk
         TzCVObPAHQr1FDnFDpwFcBFU3iYUjBrNqHB/5Kyxn7eosBxoSoyJDJs16O472TQVSBF5
         E/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tx3FsbCfXiPRqTFCiYMcWEYs3Yr8GjPbDQpRnYfn6oU=;
        b=FFGRRWf4aGii7rzlUcApCVJQLWlFyprM8N0Y+jE0yxyzFe6DgH8Y/Hg9mxmOG6b9f4
         cb/8GIM4SbSyOtaApK/ShSNLhHM4JQXOUasekbvqFESYqraPM1UeRo0BdH+ZZvEvXETm
         kAAMKXIoaT/IQsDVY2A6MRTr/5Uk/pOqWzPE3FME2b0G5Uyvuqvq5qxHjMvfm/POh9lh
         oDsn95K+6CCW4qct+3IIOJuuO/X+ob3jLalfut9A0Mx+KPSYMhXnQjY7vdxRnrP133Ic
         cuzaQCQHJqBc19JYtnmSdWaA1QceX9wXbHeqinjPMQu/9D+aaSAy4Lbt008706qCOaIc
         /Lxg==
X-Gm-Message-State: AOAM53103VSl2xrBkxO+i5XUMUHtbIVDRrTLHzwEEgKopRWUcOJxPQ5p
	EE2JYg+MkfOreqF1KZTuceI43mlhTbc=
X-Google-Smtp-Source: 
 ABdhPJz35TvLCjV+aH4nHli//5z/F5AZ1TLzBd/s5IRwrmi8PowElmvDPffu2q1paJ0LKLZa3lGEEQ==
X-Received: by 2002:a05:622a:153:: with SMTP id
 v19mr12896480qtw.144.1640013142231;
        Mon, 20 Dec 2021 07:12:22 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w10sm15378146qtk.90.2021.12.20.07.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:12:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/5.4: update to v5.4.159
Date: Mon, 20 Dec 2021 10:12:15 -0500
Message-Id: 
 <cc16be65f5dcdead2d7213ff64fc5c066162239b.1640012653.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640012653.git.bruce.ashfield@gmail.com>
References: <cover.1640012653.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159876

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5915b0ea6746 Linux 5.4.159
    abc49cc45d0a rsi: fix control-message timeout
    64e6632ab4c1 media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init
    6c382b63658e staging: rtl8192u: fix control-message timeouts
    f66258cb60e4 staging: r8712u: fix control-message timeout
    88a252ff782c comedi: vmk80xx: fix bulk and interrupt message timeouts
    1ae4715121a5 comedi: vmk80xx: fix bulk-buffer overflow
    199acd8c110e comedi: vmk80xx: fix transfer-buffer overflows
    b0156b7c9649 comedi: ni_usb6501: fix NULL-deref in command paths
    3efb7af8ac43 comedi: dt9812: fix DMA buffers on stack
    6e80e9314f8b isofs: Fix out of bound access for corrupted isofs image
    adc56dbfc4aa printk/console: Allow to disable console output by using console="" or console=null
    589ac131b3ab binder: don't detect sender/target during buffer cleanup
    b60e89b63eb9 usb-storage: Add compatibility quirk flags for iODD 2531/2541
    5c3eba290479 usb: musb: Balance list entry in musb_gadget_queue
    161571745de1 usb: gadget: Mark USB_FSL_QE broken on 64-bit
    d6013265a779 usb: ehci: handshake CMD_RUN instead of STS_HALT
    6d000e1c1625 Revert "x86/kvm: fix vcpu-id indexed array sizes"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 4f278273cb..99451bfadf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1a91fd560dcf8fa9e49fc2f17cb37483201a2b89"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine ?= "e0b42b387dce06a55169f213efd8796912778abc"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 836ea62d8f..f217718c7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9b7cd001c33ea463bbb23fda6a79900ffc88c484"
-SRCREV_machine ?= "80849cd7ef3a77895f8651cec85648578bef9135"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine_qemuarm ?= "7062d2dd2f5e5e7a07616accce62ddc5abb7b570"
+SRCREV_machine ?= "2494d7c8a13b2ce2a41c7bbc8276b5f4f6e61ac1"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0fbfda8f15..18661ff21d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "414c50525aea1ec953cca6d050d5c23db04de269"
-SRCREV_machine_qemuarm64 ?= "ba5e3380aa8a3789907c031beac2ce81d1eb5d50"
-SRCREV_machine_qemumips ?= "177841cfef0bd71b7b4f0e2e8e2ea3100ee4ea7a"
-SRCREV_machine_qemuppc ?= "c3b4b69caef59344d4a59a2327f9f0130db9ccbe"
-SRCREV_machine_qemuriscv64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemux86 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemux86-64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemumips64 ?= "75a3c9aeedd5a8070079d96d0301a303ca3351a8"
-SRCREV_machine ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine_qemuarm ?= "82eedda0c6efa661eccd57dc542c50bef054cb6f"
+SRCREV_machine_qemuarm64 ?= "f0a7a9cbc8f42271f953e6a05b63a797620c8331"
+SRCREV_machine_qemumips ?= "ca5eb4fc25d66165f42348c64c568193fc6407b6"
+SRCREV_machine_qemuppc ?= "11fb8e44b3ffdc3bd7c8703f85f622265c815e69"
+SRCREV_machine_qemuriscv64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemux86 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemux86-64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemumips64 ?= "02faa48ca76a54e5da6e256b0621c09c7cf03051"
+SRCREV_machine ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


