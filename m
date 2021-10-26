Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946A4C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:31 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.558.1635272730571731548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ci8yIxQ5;
 spf=pass (domain: gmail.com, ip: 209.85.219.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id v2so43044qve.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvhZjxVthFN6TmLS5JafznRNFeBMfjIz6OBkgA06ScU=;
        b=ci8yIxQ5ajfyy+C2XIJ7p6QCADSxYIY2GIYIZk8K0FDbs9g2+ug/blv97Rz1g/5Ew6
         UwFyey5plhNLyDOOeuoliD5f4hT8WrnVaMUZV1AoNR5uuL+mbP0SOuqigthJRkHeUmtJ
         mRmdgsB6d7utj5lgBWtC1P4n/5tbOybtoeGzqzaFh2olv5EWaP1vhpgBmgKFt/EA0Yoi
         UnkyKFX/4Swe025tqXSEjSD6I8NjO4BtgvTNeYITwyw4kX8fUri3JT47dympcpeBHw6d
         7huUUbXU6vU77huZuhuSg4m8BMR0bmgw1KlFIrKWqGCLPEvCo7Rrq77t9eOHms9jOzUk
         KjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvhZjxVthFN6TmLS5JafznRNFeBMfjIz6OBkgA06ScU=;
        b=Nyv4ItTJffTW2efmm3DgqH81zYMRSKGw6jSxYIX/kMZSNHlo979F2+hhJ2j3oo3wZ4
         6MSr9nkHSnQgotlNuDTUuzB6NOk+9G5TGsRXbBe5zlxRPpxmEDbd6pymU+V9x0pvoagn
         MrHqpAzpTeIBBwYldzZGYFfmshfmF0F9xtEeVsPr19TUw55tZwXsxDoaY7MzvnNvT8hE
         CrS1g/bBzIbDxlkvB3NTimnZFWws7Jm8FVmytg2u0sFyUDaFKWpbYXvTAlf2XWNpXs5s
         kK9bjXEn/KOgGkz/P++XPjWfh45gmrEHmhh2jvAaJADwc0RjP69h1OTZ8f6t9FPuwaBl
         PikA==
X-Gm-Message-State: AOAM532tH0jzEaOsJSWo6ODlmwCB4ziT2+iKvqzXbmtm/GTPD5r5pgI/
	MHxSA9CWh2hw0R0/3WR2c8ROXXYGmW3Kow==
X-Google-Smtp-Source: 
 ABdhPJyowae1rMY3O3pp0aSauAYExYLkAd27pI44tAeQ1gcqIX3HWApEHWqy7MB7Nuu6765O9cOfXQ==
X-Received: by 2002:a05:6214:1c42:: with SMTP id
 if2mr13556584qvb.39.1635272729655;
        Tue, 26 Oct 2021 11:25:29 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.10: update to v5.10.74
Date: Tue, 26 Oct 2021 14:25:21 -0400
Message-Id: 
 <8bf26c3e04693c2c69c6c74aa3c036d5b54f0138.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1635272591.git.bruce.ashfield@gmail.com>
References: <cover.1635272591.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157445

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    77434fe5a077 Linux 5.10.74
    42b49f012b6a hwmon: (pmbus/ibm-cffps) max_power_out swap changes
    bb893f075431 sched: Always inline is_percpu_thread()
    bdae2a083436 perf/core: fix userpage->time_enabled of inactive events
    57c7ca3d5592 scsi: virtio_scsi: Fix spelling mistake "Unsupport" -> "Unsupported"
    d993d1e1c411 scsi: ses: Fix unsigned comparison with less than zero
    621ddffb70db drm/amdgpu: fix gart.bo pin_count leak
    a5ba615fbeb3 net: sun: SUNVNET_COMMON should depend on INET
    db868b45324d vboxfs: fix broken legacy mount signature checking
    42c871d38e3d mac80211: check return value of rhashtable_init
    bda06aff03a1 net: prevent user from passing illegal stab size
    3d68c7b0ab5b hwmon: (ltc2947) Properly handle errors when looking for the external clock
    194e8a4f0acd m68k: Handle arrivals of multiple signals correctly
    977aee58142a mac80211: Drop frames from invalid MAC address in ad-hoc mode
    9ec9a975ea37 netfilter: nf_nat_masquerade: defer conntrack walk to work queue
    5182d6db80bb netfilter: nf_nat_masquerade: make async masq_inet6_event handling generic
    bcb647c1e15d ASoC: SOF: loader: release_firmware() on load failure to avoid batching
    f6952b1e22c2 HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs
    ddc4ba737bcb netfilter: ip6_tables: zero-initialize fragment offset
    ddf026d6ae9a HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
    0bcfa99e8fae ASoC: Intel: sof_sdw: tag SoundWire BEs as non-atomic
    14cbfeeee41b ext4: correct the error path of ext4_write_inline_data_end()
    d7a15e1e4fd7 ext4: check and update i_disksize properly

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 415b3aae1b..6df672273a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "752916079819b4b927698e9b78fad4ebd1da9552"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine ?= "8048444fc7e44c6fc04a5e0b35d6117fe51c17fc"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 58026e50bb..2e1e5ba97d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "9a44d3d70a39e75019eb41ebfdf9160ef1526b39"
-SRCREV_machine ?= "a9f78c623e84c13ac7ea5543a2acf61c2c9305d4"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine:qemuarm ?= "e6536f1c95e7201db0ebb64495fe4efcd939f354"
+SRCREV_machine ?= "92dd39e841df0bf33d81965843543c30597688be"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9079a1d063..243bb3a717 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8ccb3082c292a47758878414fd8ee338ca504842"
-SRCREV_machine:qemuarm64 ?= "c297d04cab775cdc684197fff6b1d6e012508898"
-SRCREV_machine:qemumips ?= "b184a88315097655916305d07acb55ee5dba55c2"
-SRCREV_machine:qemuppc ?= "a335585297e61e06eec5aef16858f033d4694027"
-SRCREV_machine:qemuriscv64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemuriscv32 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemux86 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemux86-64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemumips64 ?= "edefdb4bbcfe38521b1ac16eb5a6dcda1564e853"
-SRCREV_machine ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine:qemuarm ?= "65c6899db7f84ee81bf9fe7b73b5f5d181636351"
+SRCREV_machine:qemuarm64 ?= "6d43c23b8d3aa1161644880d85b83491f8f39729"
+SRCREV_machine:qemumips ?= "4b9a9768850a12d2e806b87e0ceeab5083495035"
+SRCREV_machine:qemuppc ?= "4db24c929502797874a3cc30a7d04022526b6e8a"
+SRCREV_machine:qemuriscv64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemuriscv32 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemux86 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemux86-64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemumips64 ?= "66e7684e39bbe9b36b8673792a07c51a394c5766"
+SRCREV_machine ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


