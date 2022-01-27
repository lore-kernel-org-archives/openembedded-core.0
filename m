Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF161C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 03:55:43 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.24383.1643255743227991863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=INCst835;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id k9so1736550qvv.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULxKTyXxbSxIwXyA91P/pPL5i+pkIPMGtYSFu58/JiU=;
        b=INCst835J1ZL3NzI1fsPButAMydpEhvRP8NNQkJt1xtlT1ARAxT1SGnlhOpK9g8tyE
         vE6wVRw2hUekBM8qVEoxvnYeitEKOxAWlhH4tjpMrvrw/MxjuCcml78Qr3tOrMbjy9hs
         9M18hTCb7JsPh9Pvcxqt3TcQXtGuANN65B4PUrOMgZ9PmwO68gmbVCe8kgk/WSzVdOsk
         bllpt5iZCq8z1JygkV/dhVY8Y9WEEFQmyp1hhyJMpftKuRB0yePvmi4ZLP+gx4LIG4Td
         hq/t5B58g7TKIj1a1ZFTSp8W4FPc8zLBlOmJ7ihQcNwh/BtU7PNXfA74pMjZKTkFbMPT
         8ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULxKTyXxbSxIwXyA91P/pPL5i+pkIPMGtYSFu58/JiU=;
        b=dyyu0G5Fsx/QxTRrrOPQcupL/GnP9L7FUoHpgOqBffMt67nJmcpkjt3w5hoh7ZI3TM
         EJ2dIkKb3GAEZjNSFqB4E0aUK2BTd4Y7220n8AWZM5t8PkWzYZV7aS27jO1TUQI8KiCY
         o/O1FPgH3PIakChY1Z6eOFHNzA4xu306yln5Iv04IIyPiW/+2IPhwx/xzVbmykHHt6Bc
         wrGMNYNpxTVFq0voHENDEgOZn7A/hm0KWF5kTF3uDQ10IMdSaIPvt+V+kL6vSW+K0fzo
         S/pMxiphulSj5tn04ua/h40rQxcAf/CzbrxkjsfWF4xhlEMiGJGaZ3U+qxQMmgl68WG0
         R2QA==
X-Gm-Message-State: AOAM533pMsAmYvz5waekhVnWtjPru1ct+2cKOe1QKVkZUtISyQ3qLc85
	EDz4Gc8jovV/Onhi9xAemkDaoFy7sfiiuw==
X-Google-Smtp-Source: 
 ABdhPJzJpzJbVMsnTN/3cOGFegbHLpAfqFsABcW2Qedlx4XCq//h4M5C7nJZKkD3KLwMKF+9d20VKA==
X-Received: by 2002:a05:6214:2a83:: with SMTP id
 jr3mr1701089qvb.68.1643255742275;
        Wed, 26 Jan 2022 19:55:42 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id m6sm639405qti.85.2022.01.26.19.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 19:55:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.15: update to v5.15.16
Date: Wed, 26 Jan 2022 22:55:33 -0500
Message-Id: 
 <e70d486ae5dc995ffb3bd30309473a348e1c0d1a.1643255467.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643255467.git.bruce.ashfield@gmail.com>
References: <cover.1643255467.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 03:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161001

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    63dcc388662c Linux 5.15.16
    ce2e7b97e588 mtd: fixup CFI on ixp4xx
    9dada19e1096 ALSA: hda/realtek: Re-order quirk entries for Lenovo
    4942295ec2af ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
    f76d5f9391a5 ALSA: hda/tegra: Fix Tegra194 HDA reset failure
    7c452ca7bc7b ALSA: hda: ALC287: Add Lenovo IdeaPad Slim 9i 14ITL5 speaker quirk
    8b046b2a63c6 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master after reboot from Windows
    5b57c0efec9a ALSA: hda/realtek: Use ALC285_FIXUP_HP_GPIO_LED on another HP laptop
    c104edbb5a3f ALSA: hda/realtek: Add speaker fixup for some Yoga 15ITL5 devices
    3a1e48069798 KVM: x86: remove PMU FIXED_CTR3 from msrs_to_save_all
    adf791cf905a perf annotate: Avoid TUI crash when navigating in the annotation of recursive functions
    8840daa2f629 firmware: qemu_fw_cfg: fix kobject leak in probe error path
    db3337ba6e4a firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
    bb08a4d10164 firmware: qemu_fw_cfg: fix sysfs information leak
    898e91c32d04 rtlwifi: rtl8192cu: Fix WARNING when calling local_irq_restore() with interrupts enabled
    c671cb0b0087 media: uvcvideo: fix division by zero at stream start
    e2ece45f9450 video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
    7760404e8487 9p: only copy valid iattrs in 9P2000.L setattr implementation
    c2e7561ba7a8 remoteproc: qcom: pas: Add missing power-domain "mxc" for CDSP
    252435941c33 KVM: s390: Clarify SIGP orders versus STOP/RESTART
    6e8b6dcec07c KVM: x86: don't print when fail to read/write pv eoi memory
    19f2dfb1a1f6 KVM: x86: Register Processor Trace interrupt hook iff PT enabled in guest
    07667f43f8a8 KVM: x86: Register perf callbacks after calling vendor's hardware_setup()
    18c16cef8179 perf: Protect perf_guest_cbs with RCU
    e192ccc17ecf vfs: fs_context: fix up param length parsing in legacy_parse_param
    c78c39a91dd4 remoteproc: qcom: pil_info: Don't memcpy_toio more than is provided
    b07490067dbc orangefs: Fix the size of a memory allocation in orangefs_bufmap_alloc()
    ce258c74f8d9 drm/amd/display: explicitly set is_dsc_supported to false before use
    d5df26479c82 devtmpfs regression fix: reconfigure on each mount

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8b0b5b0931..e59a4cfad1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d10340bf85a641be37765a0a8c0d64af0139c69f"
-SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
+SRCREV_machine ?= "3500b1673d3c5cdab46d497c5d492e81cc0a6a13"
+SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.15"
+LINUX_VERSION ?= "5.15.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c944470eba..2c81e3c005 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.15"
+LINUX_VERSION ?= "5.15.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "959e4fa00d69b9a33e51aedc4d1a9d18a605e3c2"
-SRCREV_machine ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
+SRCREV_machine:qemuarm ?= "67b4c868eafbd63c437d0e79523c3bdc5f3aa834"
+SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9b606bdfe7..ea10de30cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8877f633dc88af575ba57c3c7d2e62e479430306"
-SRCREV_machine:qemuarm64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemumips ?= "d89783603e405b35e8cda7d8762401a751dbd216"
-SRCREV_machine:qemuppc ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemuriscv64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemuriscv32 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemux86 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemux86-64 ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_machine:qemumips64 ?= "70ec3b7566512fb11e08613a8a2b5051a1f79dc3"
-SRCREV_machine ?= "720b61fc400b51918b8ae95d0fd0e79256214d78"
-SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
+SRCREV_machine:qemuarm ?= "453d02534c0a02adf3c45d10c3654ff4b8fef05c"
+SRCREV_machine:qemuarm64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemumips ?= "df874c475e84e375b21c1f71ad7c3ab5cab22218"
+SRCREV_machine:qemuppc ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemuriscv64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemuriscv32 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemux86 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemux86-64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_machine:qemumips64 ?= "6f4bc07807d1e17fde099baadf60752fca51fee8"
+SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
+SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "91c0a39cfecc9f88f12308acbb2d5f3e4d836852"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "760a85303c5a2aeb811f92c76b8dca4c13bf3416"
+SRCREV_machine:class-devupstream ?= "63dcc388662c3562de94d69bfa771ae4cd29b79f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.15"
+LINUX_VERSION ?= "5.15.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


