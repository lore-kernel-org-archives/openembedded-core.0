Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194B3C61D97
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 22:00:02 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.29641.1674597592213612662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 13:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJW2248p;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id g16so12371909qtu.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua0445TAH7KfB47oQnh4Jmp9pw9fQJSi6nSnOeZLGqc=;
        b=kJW2248pOdlj1N0gfj0bv4MDehytcjmXMSznY7Fvi3ISED4OcoC2dBOG8UZsYc3P/+
         7YI8i5KlBuqu4PpXhjHXrzL2aPLjH2A/6cczolqRfWDNPE32cLkAyvm0MMqVRYcyPW/y
         j+Pt2MLWfAk1hcAzMRhh7CuO687O/KODQt7p0EYz3oKlzI6piuXK3+NFFgBamTSb09oS
         Faf9cT3ARtOE+znpMJ0fp9wDVSbl4t9B4l1eNfGBSCG7ss5DRVpzoz8krb2VPM5nKPUo
         W8kGBFkPHsxkwv93bWB9LrbI+nE2rWUk/t+usb3MLr2o/eursy/5SrBGuLH9gJb91UXN
         9SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ua0445TAH7KfB47oQnh4Jmp9pw9fQJSi6nSnOeZLGqc=;
        b=qi9AXfnFnpIqTnKTAgBV+FdEtV5PuNtG+wBHww8PkLog9P9GmhEGnSEzHxcE7IF2D6
         YmnscRxVWWZtsUR28s3deSYKBjPLZQH2n4QmJsiq0FDA8xY3xpE0SdQWjT6NLMQ3B7eV
         5qOhygFCGxda7cj05bEsmy6m8Tuq3fn3u/tQzMSIxxcf2MryTjD/rH/1AaW7xs+zRU5k
         03bpAOIrAAO6mI27TsswHzwF0F70tHjstl0Ngw2fPXNLuWThsu+w6YAM86VDq57bTQrL
         dVOYurPoo3w64YuudSvkWEWi7G8NUYBcooxM/y9tsS0J2RVY1MFUkFIoHJwcCLsOHf9t
         zltA==
X-Gm-Message-State: AFqh2koSJ7W8esoPHBJ4UVi2qE1sL2KYfPSsGLG95lxnWOFtf4SsxB56
	4Ksc0N0UGaMqgrRKQENFGpQlb69xEehX5A==
X-Google-Smtp-Source: AMrXdXtoigvPL6tW2LzUJAJf3mEN6hKxlXVQ3xd8xDeCS1BA2tNlAyiWJPbQc3xhad89LTHZ8YiG+Q==
X-Received: by 2002:ac8:724c:0:b0:3a8:1617:bdac with SMTP id l12-20020ac8724c000000b003a81617bdacmr43663082qtp.5.1674597591016;
        Tue, 24 Jan 2023 13:59:51 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8014c000000b003b0766cd169sm2049813qtg.2.2023.01.24.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 13:59:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.19: drop recipes
Date: Tue, 24 Jan 2023 16:59:46 -0500
Message-Id: <873b13e64c6a078fa6ce9b633592d29d69713334.1674597466.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674597466.git.bruce.ashfield@gmail.com>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 22:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176333

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.19 is no longer getting upstream -stable support, and we've replaced
it with 6.1 as the latest (and default) version. Removing the recipes
to make this clear.

Released branches will still get bugfixes as appropriate.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              | 45 ------------
 .../linux/linux-yocto-tiny_5.19.bb            | 30 --------
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 70 -------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
deleted file mode 100644
index f4d205e613..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.19/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# Skip processing of this recipe if it is not explicitly specified as the
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-# to build multiple virtual/kernel providers, e.g. as dependency of
-# core-image-rt-sdk, core-image-rt.
-python () {
-    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "3101c367eab8952721086b545ad37c301b2a7452"
-SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.19.17"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
deleted file mode 100644
index 95a8a46bbc..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-KBRANCH ?= "v5.19/standard/tiny/base"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.19.17"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
deleted file mode 100644
index 5baa0c1130..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-KBRANCH ?= "v5.19/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.19/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.19/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.19/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.19/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.19/standard/base"
-KBRANCH:qemuriscv32  ?= "v5.19/standard/base"
-KBRANCH:qemux86  ?= "v5.19/standard/base"
-KBRANCH:qemux86-64 ?= "v5.19/standard/base"
-KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "f30404d233fc4cc461a0800fd635f4e9650a20a5"
-SRCREV_machine:qemuarm64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemumips ?= "ceaf2134635845794c24b750f15004096a597256"
-SRCREV_machine:qemuppc ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemuriscv64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemuriscv32 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemux86 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemux86-64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_machine:qemumips64 ?= "acf9ebb1e7d1ceb61a89ec33ca4cc3613287630b"
-SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
-SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the same
-# meta SRCREV as the linux-yocto-standard builds. Select your version using the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2b525314c7b57eac29fe8b77a6589428e4a4f6dd"
-PN:class-devupstream = "linux-yocto-upstream"
-KBRANCH:class-devupstream = "v5.19/base"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.17"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-
-INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
-
-- 
2.34.1


