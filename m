Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E2C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:44 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.23722.1643255744201628334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X35xvQZU;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id w8so1527294qkw.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ren599JuNTvbROTA0MIbkKeC8Mds01qnqwGzm+SPHfs=;
        b=X35xvQZU3G8fdSVs3XSKOzTd2tklWBsVpvUcqMk/9pJRzTNEbMFInvyWe7VCBI7lpA
         +jnw/VPvzSQk2TUIsrP6cQ9hciaU6w61pskdagZWYt0xHKtgyCa08lrzomb0kyXkDRuN
         RH6AhsSrxCDqL9ab2kOCAf5qeVoNQJ4lBArvLNIvbGCLYVwrWWnKozmrbQ3qs8sBLew9
         JnZQMDuSZ6A9vSIxQWpbslccPPNtNPJYZZ3SnCO0ke7UzDKy6qfN8uX6eBNruRiup4Xn
         4Y1ZwchVg/O4VEFpKZX1O6U9V6/1wFWOAbevEy0tfUsB+VzT34R8WYVjPsXXb+MGeDAc
         /nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ren599JuNTvbROTA0MIbkKeC8Mds01qnqwGzm+SPHfs=;
        b=wQzwHlHjC2KbWqU0KFNrfBB51zzGFvFZGyZJTWZw1Xn5Eiti4dUZIrHFUBSR+Vo+sT
         VX+Pi2ia7/ju0FQ7mhALyEpKvjjDDEhqE2uUmaG+Rv4W16CNWz3LujYwu2uxFqeYvwYR
         ViftdUkI3tywXjfyoPfQBaWuIe8zL+SBP3q2SRzKnxhVzrqEW1SCbQzcK5pcY1QbvM//
         er4GQwRnHI+KXAN1ooyjd7IFPeGqIWFUSy8RrualIG4wcdLBTGLDyCnNUnZplO339zhH
         Pg6XyNN7OUX79jE7C0wqPZ1iJV8At6WmM9Aolo5jdiPQrJN7M3FK3yAPI/CiOFc6/3gM
         7mDw==
X-Gm-Message-State: AOAM533Ej2fqjmeJuCEQxGgKiX2RJk+kyFQTDCgKeow5jOI7sz2mk0os
	vUTb6xgN4oBULqAFsq7Cp/3JNmEuuypMuA==
X-Google-Smtp-Source: 
 ABdhPJyzeXD1J48vnLUVFoqe8hxfcv2stavpZIRh6JUyV6SocV0jvKnOhaCNLJkozB4EGLDx7DmAaA==
X-Received: by 2002:a05:620a:d93:: with SMTP id
 q19mr1387306qkl.427.1643255743268;
        Wed, 26 Jan 2022 19:55:43 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/5.10: update to v5.10.93
Date: Wed, 26 Jan 2022 22:55:34 -0500
Message-Id: 
 <efd47f2955d4c19611104c76f05d8fd7328791ac.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643255467.git.bruce.ashfield@gmail.com>
References: <cover.1643255467.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161002

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    fd187a492557 Linux 5.10.93
    bed97c903621 mtd: fixup CFI on ixp4xx
    f50803b519c3 powerpc/pseries: Get entry and uaccess flush required bits from H_GET_CPU_CHARACTERISTICS
    68c1aa82be00 ALSA: hda/realtek: Re-order quirk entries for Lenovo
    4d15a17d065d ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
    d7b41464f1b7 ALSA: hda: ALC287: Add Lenovo IdeaPad Slim 9i 14ITL5 speaker quirk
    87246ae94b73 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master after reboot from Windows
    9c27e513fb33 ALSA: hda/realtek: Add speaker fixup for some Yoga 15ITL5 devices
    4c7fb4d519e5 KVM: x86: remove PMU FIXED_CTR3 from msrs_to_save_all
    6b8c3a185377 firmware: qemu_fw_cfg: fix kobject leak in probe error path
    889c73305b48 firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
    ff9588cf1592 firmware: qemu_fw_cfg: fix sysfs information leak
    358a4b054abe rtlwifi: rtl8192cu: Fix WARNING when calling local_irq_restore() with interrupts enabled
    93c4506f9f8b media: uvcvideo: fix division by zero at stream start
    4c3f70be6f3a video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
    161e43ab8cc1 9p: only copy valid iattrs in 9P2000.L setattr implementation
    0e6c0f3f4055 KVM: s390: Clarify SIGP orders versus STOP/RESTART
    413b427f5fff KVM: x86: Register Processor Trace interrupt hook iff PT enabled in guest
    723acd75a062 perf: Protect perf_guest_cbs with RCU
    eadde287a62e vfs: fs_context: fix up param length parsing in legacy_parse_param
    c5f38277163e remoteproc: qcom: pil_info: Don't memcpy_toio more than is provided
    5d88e24b23af orangefs: Fix the size of a memory allocation in orangefs_bufmap_alloc()
    0084fefe2960 devtmpfs regression fix: reconfigure on each mount
    ee40594c95ae kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 695356c482..a8e8e604a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "73ddd15bb13083c63f183814223b1f064f707964"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine ?= "ba47a407fe04203adb0ab5e164597c958cd9e334"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e4b389367b..32e42cbda4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "05c74d1b7b9b5ce5b386e2dbb787f1b00bbfdcb8"
-SRCREV_machine ?= "3c4b46871c0220942e07fc2c73ba94ac04b0d9ca"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine:qemuarm ?= "ceb1f194e59c9dd3bdd83d51bb0994f3db23bf61"
+SRCREV_machine ?= "878e5c1469550bb0f8778d16d4adbe7d48b0b28d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 412a872e62..3a0a43bc0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1e8e1a5927984c545448b4b15974addf670b0f5d"
-SRCREV_machine:qemuarm64 ?= "c42d48cae11e605f70cfc6f64dbc23711bfbf8cf"
-SRCREV_machine:qemumips ?= "0366c14c30f0ca1f9d4a793632ba9cdc86e7225e"
-SRCREV_machine:qemuppc ?= "4570b1179fe4eda809fa2b89a06e6acf95e35fc8"
-SRCREV_machine:qemuriscv64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemuriscv32 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemux86 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemux86-64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemumips64 ?= "f2a78b852f4afb30a5e453a8b1eac3e785cbfc39"
-SRCREV_machine ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine:qemuarm ?= "50c0e06718fb2b264619ce8d82608877d1e62a81"
+SRCREV_machine:qemuarm64 ?= "7907c5eb81e9a51307b5269d546999ebf47d9d59"
+SRCREV_machine:qemumips ?= "e9c51de36554662082afc08c6e54599b310c7951"
+SRCREV_machine:qemuppc ?= "77f361ea5eb293dcfe122ecb65f33ba32fd12501"
+SRCREV_machine:qemuriscv64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemuriscv32 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemux86 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemux86-64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemumips64 ?= "b668a352c94a8c29e585608e8302cacb1350f5ed"
+SRCREV_machine ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


