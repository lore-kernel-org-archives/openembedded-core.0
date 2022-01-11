Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597D1C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:21 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.11464.1641924020598640184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G4K4iOYv;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id r139so19803636qke.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwAUtphE+nmGPwt5aP3n4pz5XIOtYe7hVL+SANxPx80=;
        b=G4K4iOYv0/TFPvat1b1aUnke0s8E8t0W4iBcRX5VuQGnQZCMl+gQ4VkgnxaHDjlvgY
         fGz66tRrAIrRX5eRtZ/gDONOVGO+eIGRUZIq9jxnCj2ty32EwHXuhMcZ8ZsvVF9AQb66
         1ICU6FzBEJ9qRuDa3/ywa0rm5Ik2oxLSPsNGH1qRlvMoFBBswpjp10NxWDe7KuTd1B9H
         XMe5+XFBARikRCh09Gh3pcOGP/KqqXkcLdvGmVgwCn9iGJEX9JlOB/SwjtU4VZIQzP/U
         ZCkGK1hiO8UFEwHnRHmOOlwgjLr4RVIuvUlwSOAe0IOJcLRR3QVdN8iqvVqLzAOe2pNd
         T4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwAUtphE+nmGPwt5aP3n4pz5XIOtYe7hVL+SANxPx80=;
        b=8DlTAm4w5rXNltVLtByBx781QoCpDEI5d9PiLms0JukDa3+B1zjCPlHGXJH6pJsKLg
         2GlIcQwS03eJj87ij/V7ve+vwp2tls4hZhxsZL/0oE/90UqMwr+9GehKN4Mempy2WwHr
         m//uWYNTeYTPHhF1/tLChCSmoKyVxanohxKk/tTpNVD/MrhuI/iGNgIiZaz1P5wzLLj9
         HfQpU3xTNIPWJ94sQog3jNMw7XpofvTrM8WPpX//aYxgoYtuTa3s6RzmRu72p4h2K9NU
         9svZ9J3FnuBEdwQ32p7Pv3xjyJaUZhOfaRW173IBjBgbnN5ek6MLkA/NdnPnnjBnrojm
         jBQg==
X-Gm-Message-State: AOAM531n/XT/mQvp/gcBuliZzv7qA8POGZ+Fv0gN++QNRGSFH3VBL2jz
	HwViAQRys6Z2EJ2uYMoTizsC5utJ5E269Q==
X-Google-Smtp-Source: 
 ABdhPJwUJTCt39gdLxdkiHOXDjmmNCTPV80KTrVkzKhIQVS7aJbHFt+swCkEAcbSX4MyCXsa/oYHng==
X-Received: by 2002:ae9:e812:: with SMTP id a18mr3826812qkg.719.1641924008573;
        Tue, 11 Jan 2022 10:00:08 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] linux-yocto: drop 5.14 recipes
Date: Tue, 11 Jan 2022 12:59:57 -0500
Message-Id: 
 <a8b05b9913c284a6f506ea347dbf3c28dc2709c9.1641923694.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160434

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.14 is EOL upstream on korg, so we drop our 5.14 recipes
from master. 5.10 and 5.15 + the dev kernel continue to be
active.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              | 45 ------------
 .../linux/linux-yocto-tiny_5.14.bb            | 32 ---------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 -------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
deleted file mode 100644
index 6f22173b1e..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.14/standard/preempt-rt/base"
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
-SRCREV_machine ?= "b18aaa90f5ce15336aacf4cc24c7a086aeb4bc84"
-SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.14.21"
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
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
deleted file mode 100644
index d44fac6094..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.14/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.14/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.14.21"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine:qemuarm ?= "159f57f8e022351d5193e51c02c951f2e255db1a"
-SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
deleted file mode 100644
index b5be96b7c9..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-KBRANCH ?= "v5.14/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.14/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.14/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.14/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.14/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.14/standard/base"
-KBRANCH:qemuriscv32  ?= "v5.14/standard/base"
-KBRANCH:qemux86  ?= "v5.14/standard/base"
-KBRANCH:qemux86-64 ?= "v5.14/standard/base"
-KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "5ca7fd91b258a07ed1b6f38593ff8c48cc574b1c"
-SRCREV_machine:qemuarm64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemumips ?= "1e7a6d0d29015bf1f383cf5f52fc451c1969561d"
-SRCREV_machine:qemuppc ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemuriscv64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemuriscv32 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemux86 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemux86-64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_machine:qemumips64 ?= "f6646a344afbf6cacc91cbeaaec4240b372dd192"
-SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the same
-# meta SRCREV as the linux-yocto-standard builds. Select your version using the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND = "devupstream:target"
-DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "545728d9e08593767dd55192b0324dd4f9b71151"
-PN:class-devupstream = "linux-yocto-upstream"
-KBRANCH:class-devupstream = "v5.14/base"
-
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.21"
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
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.19.1


