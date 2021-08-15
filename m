Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.11951.1629040148214463591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tZPp2uJj;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id t16so12323588qta.9
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4XB1pfHjUzmQupanGoge1J3A1ZrONUud2x6On3blseI=;
        b=tZPp2uJjWQ1YWX7JC+ol5PiW4WKgvbTo409ybw0fg2Xtm6JJUgaSEJyio5X39w1Q4s
         X7qUVM5AQ1ZT2b/vIzRlnfl1P5I5SRaRgCwnt3VTv0UVnHb3jr9qmwXR/4SgpkW9Pg5O
         JxAngQRHrNsozy1a/g/0uWyo5PEZfCUvMDRJiLVhp8TYMxm+aj83G0eELqU3jVCSqhzs
         j+yGeDmrQONDglXWHctmBGIEqJNQG+PMfWMaZ02tzWbP/pBZ9YphMDBzC1dOwyBk+A3W
         Nm+oI0bpidvevZ1T8HycwDOvs3n33fkRPUcW8Mxxp2G/Cu54MrDIDkJ3pYtJZaKW5lOo
         QUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4XB1pfHjUzmQupanGoge1J3A1ZrONUud2x6On3blseI=;
        b=NftEo24TT2tCJCXEhVfwYWh+f6zgWVomLl3LciWcVwjQHtZasZJ6SlGxAeYb2LBIGo
         /nM8QdELxHKNjUxR259IxwmMbPDeWPoDcgtcysOu3ZlzKDKH8KUZD1zlDp+dlra0pK2r
         URv2IR1tEgs/WILFQJ4GgMxLybr58f8b6mhP6RcU3YtF6MwZOnEwRLKLgtLeNn7F3h4p
         jq/FQpmLAxvVCRDHp7TtkNNJiv+t2nXcmEsqC5JRUFtDFwPcT7sw071Bh+/eW7qObIVf
         FKFKdMwCwF6b7e80budiuGZTnHpdJYzrONQwAU2znX2vDybLaDztnNX7bYvjijy8fWmZ
         xCpg==
X-Gm-Message-State: AOAM533uZ/hZa051vflrVQ6VJDE+KUkv/E+5KyMMqDBag9mOx7oJ48Tj
	0RmoutfaHapPRYt/A8FvOfmPj054x6ZFhQ==
X-Google-Smtp-Source: ABdhPJwPZIXWec5qhHgd0A4DqTdoUp7tL5I817C7Vd4VDgRtO+9cPJpQTwzGqaVkbkR+4E6g54k04A==
X-Received: by 2002:a05:622a:1354:: with SMTP id w20mr10080619qtk.51.1629040147321;
        Sun, 15 Aug 2021 08:09:07 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n124sm4690466qkf.119.2021.08.15.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:09:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/5.4: remove recipes
Date: Sun, 15 Aug 2021 11:08:57 -0400
Message-Id: <3b6f234f2d4c169384a9582aeb4e43251d35e1dc.1629039837.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629039837.git.bruce.ashfield@gmail.com>
References: <cover.1629039837.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We have 5.10 and 5.13 as the active recipes in the release/development
branches, so we remove 5.4.

This leaves us with the standard three versions for release (5.10,
5.13 and -dev).

5.4 will continue to be updated in stable/supported releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               | 45 ---------------
 .../linux/linux-yocto-tiny_5.4.bb             | 32 -----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 55 -------------------
 3 files changed, 132 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
deleted file mode 100644
index 405f51d649..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.4/standard/preempt-rt/base"
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
-SRCREV_machine ?= "0ad6f2204daf35fb25df5e9b52383507df813bb4"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.4.139"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
deleted file mode 100644
index b08304579f..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.4/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.4/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.4.139"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine:qemuarm ?= "a80ea6be16b19c18855f831333c93d4f3b55e58a"
-SRCREV_machine ?= "405fce9e3f0314767e38b5e8295b34a24cd97a46"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
deleted file mode 100644
index c6f2294b53..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-KBRANCH ?= "v5.4/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.4/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.4/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.4/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.4/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.4/standard/base"
-KBRANCH:qemux86  ?= "v5.4/standard/base"
-KBRANCH:qemux86-64 ?= "v5.4/standard/base"
-KBRANCH:qemumips64 ?= "v5.4/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "3d243cfd29a57dfe6b04a6a6cf1b1088d107f1f6"
-SRCREV_machine:qemuarm64 ?= "dcac97a2b4469136189f86fe42703026693384be"
-SRCREV_machine:qemumips ?= "ee74231b68518107954078d03d0606910603cf7a"
-SRCREV_machine:qemuppc ?= "76c51679aa6b9c25fe2b5c2052e84197ff2e4e2d"
-SRCREV_machine:qemuriscv64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine:qemux86 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine:qemux86-64 ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_machine:qemumips64 ?= "3396071f8ce8ca148231fee4d2130feeead41926"
-SRCREV_machine ?= "807b4668ff7fe3be031ace442a84d70821ef9571"
-SRCREV_meta ?= "98ba88191b7c489bc0d83b6c87a31b2330fcd886"
-
-# remap qemuarm to qemuarma15 for the 5.4 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.139"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
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

