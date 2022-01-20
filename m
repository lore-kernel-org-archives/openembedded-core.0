Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5F1C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.2655.1642713866237575734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BOSLO3nm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id w190so628416pfw.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4MyX9Rxjjjc/9WRdZsAUOyl8St77zryaTqnT75FAtsw=;
        b=BOSLO3nmRInOetRj5mXOQsJ7bvwwzuNtct2xgzO32A3FlUCQZOT46lMH3BR0aGonbb
         KRBVt/O2cFFztynEo4GFq8QOURur7+nH2kT9HaBhFRAX+UedjFOWmO3zcPOMhjaLze3L
         HGTUw8WC2HA1v4hztDDE4jkyZYBi6pZDBEDKo1HA1MJqW0eM8m/IUd7ce2vbtqeUYzVz
         5ZyUgNVYaxyvyRpOKcisThAOd8qFQ6tz2yWzxfQ2cAbjQbV3rMPNojlixBp+TP3uk+K2
         khtqDtkTmuVM3+MDPmf6IrAtZQwg1iK3CIGDSmyOghqy5QuVUkugKGWjp34w8ygL3L4x
         +2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4MyX9Rxjjjc/9WRdZsAUOyl8St77zryaTqnT75FAtsw=;
        b=bYqfV481q92c2t4DyMFnnp7Omr77P5ZMRTamzM8fkAviK1WPD4a+uhlPr6MUkT9Ydw
         B9TW8lnBi5fqxfOW9Z2hWYv6s+A4bd0EM+H0BLdqpeGZhyQkaD7vouK3mtVLAxux5YJ8
         nioZSz2FjtkZCtsTuNx4N6R3vg75jvpy4+tP1PM/m5tc/LPion9eGE7oJu8i4gW7poOI
         JYTwkK6bocZS38VDahBc4AZjDQ8hjB+Qdlqsrp9A9ZdIdvNDWkQAfvshIIb/FqaZDalO
         AQNwMvtUZ2aPhSjFOYdka/oVufZYGtv/DPTvJXvSM1I7woC4fioiZM+Y3lI5BWD0gEpo
         Vr9g==
X-Gm-Message-State: AOAM532MRH+VAbaBxZPRzp0/HxmIG5hDJJYSh7Ea77EIeP+MT6dpsJ8B
	tupYT0hqdA5698eGjXrCur5cmmRT5XLAf5qQtr4=
X-Google-Smtp-Source: 
 ABdhPJxNRFmhob99zz91T96wpIrQA2m9+tyop9pk4ww1VvdxYuRmjv9cZUS8BBwilRq4AG/1MiYr1A==
X-Received: by 2002:a65:610b:: with SMTP id z11mr524331pgu.205.1642713865184;
        Thu, 20 Jan 2022 13:24:25 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] linux-yocto/5.4: update to v5.4.172
Date: Thu, 20 Jan 2022 11:23:47 -1000
Message-Id: 
 <78d418fca20f997141d06d9c53194ec4e675860d.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160798

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b7f70762d158 Linux 5.4.172
    f415409551b0 staging: greybus: fix stack size warning with UBSAN
    65c2e7176f77 drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
    86ded7a6cf40 staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()
    a459686f986c media: Revert "media: uvcvideo: Set unique vdev name based in type"
    7e07bedae159 random: fix crash on multiple early calls to add_bootloader_randomness()
    517ab153f503 random: fix data race on crng init time
    90ceecdaa062 random: fix data race on crng_node_pool
    a4fa4377c91b can: gs_usb: gs_can_start_xmit(): zero-initialize hf->{flags,reserved}
    e90a7524b5c8 can: gs_usb: fix use of uninitialized variable, detach device on reception of invalid USB data
    9e9241d3345a drivers core: Use sysfs_emit and sysfs_emit_at for show(device *...) functions
    ada3805f1423 mfd: intel-lpss: Fix too early PM enablement in the ACPI ->probe()
    d08a0a88db88 veth: Do not record rx queue hint in veth_xmit
    a6722b497401 mmc: sdhci-pci: Add PCI ID for Intel ADL
    1199f0928488 USB: Fix "slab-out-of-bounds Write" bug in usb_hcd_poll_rh_status
    43aac50196f3 USB: core: Fix bug in resuming hub's handling of wakeup requests
    ed5c2683b67b Bluetooth: bfusb: fix division by zero in send path
    784e873af3dc Bluetooth: btusb: fix memory leak in btusb_mtk_submit_wmt_recv_urb()
    ad07b60837b2 workqueue: Fix unbind_workers() VS wq_worker_running() race

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 6b1a10476c..9e8281c7a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2e96217d85f653d79f1e691c84aaf178931550a7"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine ?= "e92d76afe6d8592917c0e7b948912c085e661df2"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 80d260cf88..a75570df93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "59c50d08a8c111c9941b53cc3903cafc7b9339f0"
-SRCREV_machine ?= "da1b138e527f276887038d0091980ec5bfbd0824"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine_qemuarm ?= "10b4756eee78aa43ff9ed64da700ec6e8d97ff22"
+SRCREV_machine ?= "6ab93fdc53b64e146e4f16363375c1beb37b82e4"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2d7703ec0e..2d7f7559e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c961afa9250955e8bc4e286fba5942181cdfce45"
-SRCREV_machine_qemuarm64 ?= "0408baf57ccb7975ea0291418f44c1bf241b9792"
-SRCREV_machine_qemumips ?= "1e20719de0a733cf6c9f1f5467a16e8449dd1eb3"
-SRCREV_machine_qemuppc ?= "40c08791a68abb946948e1aea7532dc156e9eaa5"
-SRCREV_machine_qemuriscv64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemux86 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemux86-64 ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_machine_qemumips64 ?= "31c53aae874ab1a677be38ffe29dc0e7084a08f4"
-SRCREV_machine ?= "3889c10487e465acf5a2ecf182be8a9adb8ce863"
-SRCREV_meta ?= "17ac54a7a0b472a035fea8aacd1f31c1fa322ff0"
+SRCREV_machine_qemuarm ?= "8de1da3dc354dedef2e435e694eec6d6e72c9822"
+SRCREV_machine_qemuarm64 ?= "eed7c0a64f3a7a91a130bc2e507304dc8b446a31"
+SRCREV_machine_qemumips ?= "996a9660e4fab70db5cecec9c831141cd03c3d36"
+SRCREV_machine_qemuppc ?= "0197cf5754b1bd4eb035c342af9cc27e8c3339ca"
+SRCREV_machine_qemuriscv64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemux86 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemux86-64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_machine_qemumips64 ?= "fe2769a7c268ed224ec70fd2aaab850e4eef70dc"
+SRCREV_machine ?= "c6b015510134942076c0e111e56357656acf3dd5"
+SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.171"
+LINUX_VERSION ?= "5.4.172"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


