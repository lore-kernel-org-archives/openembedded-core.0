Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3152C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:01 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.19590.1640182381241999942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KdD0/utb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c7so1985310plg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WMh/LmY2R+MHFKIKWigYbK37QuuM8y4c2deXDgOEs2I=;
        b=KdD0/utbO9LalLhPuaxvW2ziDKleOoNDVgCX0pCzyUmBZuIFiALCoN1W97l/6UQdvO
         NWdkn+uKXWZQKIEQPT1SB81DtkTZFaI2RbZ7Xt275dAlwFeiJEaOxpBzLQQqwegajZjt
         LTWUh6wrAnpIZ+FWOV2oR8PRMnBwahjfEiQUPBACB2vO5UwV+cr8sSYGu8WQ1xuMqEBx
         NjUBTDnbdJU0TOyvJYqOqlTllpQl2q8Uofx5H28ULJDs3TkVKz2QR7MCo269Wd/qt/Zf
         k1XGccj3h6zeh/HrVP+i2MZ8dh8aw//e/rHlzxtrXlE/qPTUHG5b5Od49ztWE0m4VQla
         xz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WMh/LmY2R+MHFKIKWigYbK37QuuM8y4c2deXDgOEs2I=;
        b=zSPTq3x+0bbmFuDOp3YFE0r4ilrAau+tsMIVB8MJtmMKsecsNk0L0c9J57mcUFn6rm
         r/g7jQSqhiDmUHzAKSOdJmecfjj73tFHriJElfSGtBQcugaePWM0CHU5YMDvN802PZ4j
         vDylFsYfMI2vNh9az0RnL24UyRpDOkvZHBf8Xu88U36+Gf39GZj1P+fOd+f2lXwUsfM8
         iV/Hqp9HWdF4DU39Il0rT52nD2lDkHTaBfmLZ41N4JFNXjVtihhRH040hvthhbBWyROo
         Zi5yy7K2ihnFmdp6V3cNrFKqQUdg98CzJRiUqyKRUwK5COHVfYtflYLmgjxaZbj6/VQf
         XT/A==
X-Gm-Message-State: AOAM5322mWVhBadB/jnb9F2CbgFqABxBcY1YAaR0CJVZ58JkM/67yyNt
	7l6pdAeGayOSw73z2uuMR5QN93sQ/YG7y4B2
X-Google-Smtp-Source: 
 ABdhPJyk8w4MrYD16C568ZIB4TUwrdIXHx4EX9urzIN77ek+Fl+S9DkwEk/C9zG0k74v5yQc12NOGw==
X-Received: by 2002:a17:902:e541:b0:149:2af:fa6a with SMTP id
 n1-20020a170902e54100b0014902affa6amr3085387plf.27.1640182380241;
        Wed, 22 Dec 2021 06:13:00 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] linux-yocto/5.4: update to v5.4.159
Date: Wed, 22 Dec 2021 04:12:21 -1000
Message-Id: 
 <9c37c738a645b472175b93431deb47b47a1442e7.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159953

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


