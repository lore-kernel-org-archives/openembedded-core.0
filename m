Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8856C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:57:52 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.820.1637704672061366980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qNIv5s/9;
 spf=pass (domain: gmail.com, ip: 209.85.219.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id jo22so279873qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kNh93wFRG3ZIh5UsykBehNRbfob4uDsK+ZZ6acREJfo=;
        b=qNIv5s/99q9N3YC3AqeGLJYKpHzfNXJ4L2NnGjoRCKPU+hEKqziuiLOIFLecOWsQj0
         2AgwJT4rqadPUcqFw6XdvafdA6JUBn886YrvtGobs9fBzGx/3xhpmcuewdjZ2rdrtl29
         E2EMV70iq72wkwXvaNckfYr1zmC5J3mDGGNVmvbkTGXljzJD2OLKi4UxsyRDbl+URjUg
         yyKql6a6DfdsFbHOYhI9BolKsuaQ0XxtaerQb/uFQnWs7cmEPLinaamnX/zvOKXxoubn
         YoNmw9BOHlq+a6rFEogd/C1w5pBGbGSiG76E2vLDaq2hAefzphjZPgBcT0sZqtHqhibg
         JTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kNh93wFRG3ZIh5UsykBehNRbfob4uDsK+ZZ6acREJfo=;
        b=0xxyIm3lHuvxtZ8cqfsxRjRQ0WZ96Eqtli9yy/QvxofMWzl2yy9BYnxeRAVv5uh/yl
         LrxuYfho1IxuqRtAFZ/+seR6n68SsZGo8msMgTC6gj703RsnmGG6QN36GHD+DdUy302K
         nLSIStBMvzeufuK48YCUS9kEttS2jM+nflBG+pe5BlH7kMXi4E1Gf/z55qa5XyX1RLHS
         2shNzL0A1czjCDD34aZGN47zOAjrIZell33MGZ+KEVJFGf3ANykMWpS9BJv61RN4r538
         heWyy6AFbzSdjVcrQIcvjJDMZ3X9Y9mbtLUw7dUxED8GTnCuxXcsJ1gsrHOI7+k1JmUp
         vxyw==
X-Gm-Message-State: AOAM530yEhvps9UVqlsJVLevMGWJiFZaz9PNpGoK0LZIsYm5PYnPPpCS
	Wh6ksCXlVKvUUljc0QzF7jk=
X-Google-Smtp-Source: 
 ABdhPJzHq5tYVNJU+ExJABDsSGHnQAm8kul5w06iEu5uTFAXaqUQKNIjUezfJq6Ky0QccVS+5Rcd7A==
X-Received: by 2002:a05:6214:27e3:: with SMTP id
 jt3mr668347qvb.44.1637704671139;
        Tue, 23 Nov 2021 13:57:51 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:57:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 01/20] linux-yocto/5.15: update to v5.15.2
Date: Tue, 23 Nov 2021 16:57:28 -0500
Message-Id: 
 <09f5e305ca560d93a958e339edefc5f868bd3157.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158622

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    7cc36c3e14ae Linux 5.15.2
    5dbe126056fb rsi: fix control-message timeout
    7d6f8d3bab72 media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init
    4787caef521c staging: r8188eu: fix memleak in rtw_wx_set_enc_ext
    8f60f9f6ee24 staging: rtl8192u: fix control-message timeouts
    9033490a3fef staging: r8712u: fix control-message timeout
    3a66e8a661a4 comedi: vmk80xx: fix bulk and interrupt message timeouts
    47b4636ebdbe comedi: vmk80xx: fix bulk-buffer overflow
    06ac746d57e6 comedi: vmk80xx: fix transfer-buffer overflows
    d6a727a681a3 comedi: ni_usb6501: fix NULL-deref in command paths
    20cebb8b620d comedi: dt9812: fix DMA buffers on stack
    e7fb722586a2 isofs: Fix out of bound access for corrupted isofs image
    a65c9afe9f2f staging: rtl8712: fix use-after-free in rtl8712_dl_fw
    a0041453ff9e btrfs: fix lzo_decompress_bio() kmap leakage
    d5dd3b44488b kfence: default to dynamic branch instead of static keys mode
    93ce7441001f kfence: always use static branches to guard kfence_alloc()
    5e57d171e2e6 binder: don't detect sender/target during buffer cleanup
    6e8813eadf8b binder: use cred instead of task for getsecid
    3f3c31dd0f8c binder: use cred instead of task for selinux checks
    ff1bd01f490b binder: use euid from cred instead of using task
    ec7c20d41714 Revert "proc/wchan: use printk format instead of lookup_symbol_name()"
    2e93afda0520 usb-storage: Add compatibility quirk flags for iODD 2531/2541
    ad5df979295b usb: musb: Balance list entry in musb_gadget_queue
    72a9bf9bb16a usb: gadget: Mark USB_FSL_QE broken on 64-bit
    adb1902a1246 usb: ehci: handshake CMD_RUN instead of STS_HALT
    aa8a82d6db0b Revert "x86/kvm: fix vcpu-id indexed array sizes"
    26ac7dec7ff0 KVM: x86: avoid warning with -Wbitwise-instead-of-logical

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 879f2be677..d5c11b8d33 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b9ff38638d2398b647629e768713eefb0fc6707a"
-SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
+SRCREV_machine ?= "ada3579e989bfe75d8598ab993347157dc4611c2"
+SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.1"
+LINUX_VERSION ?= "5.15.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 6035dc47f1..49e74252e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.1"
+LINUX_VERSION ?= "5.15.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "098dbfb0e6d95ae958e1003738fb0dc90a81691b"
-SRCREV_machine ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
+SRCREV_machine:qemuarm ?= "0daad4eb78782be97ce4d91f2d455ccc2d238991"
+SRCREV_machine ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0fd49d78cb..51259617a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "47b7bd92b84e0ad136d45956e86039ad7307c892"
-SRCREV_machine:qemuarm64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemumips ?= "e2dd4de2dfebf97237b87c414d0582016f64d5b1"
-SRCREV_machine:qemuppc ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemuriscv64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemuriscv32 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemux86 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemux86-64 ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_machine:qemumips64 ?= "066b9f8175fc7136c15768204ba71d3fddc2f4f8"
-SRCREV_machine ?= "5a8ec126c297dd9e410eb23685003f670f8f3d57"
-SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
+SRCREV_machine:qemuarm ?= "e185d8ca70e102b1f99736b15f5e8ee1ab62d081"
+SRCREV_machine:qemuarm64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemumips ?= "51982f22cf688d426ae919380cb19fcde3cd0d1a"
+SRCREV_machine:qemuppc ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemuriscv64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemuriscv32 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemux86 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemux86-64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_machine:qemumips64 ?= "95b7f92bb1eec8532be3a5e50726a0643ab2fae9"
+SRCREV_machine ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
+SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "5bcd50d6b0cde22583768dc1acf304259364ddbc"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "b6abb62daa5511c4a3eaa30cbdb02544d1f10fa2"
+SRCREV_machine:class-devupstream ?= "7cc36c3e14ae0af800a3a5d20cb17d0c168fc956"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.1"
+LINUX_VERSION ?= "5.15.2"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


