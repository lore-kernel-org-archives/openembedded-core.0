Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446EEC3F6B0
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.723.1659653894534500794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SZZzXx/H;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id a2so769108qkk.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=c4lucAV7g10iQV3AgzUHQo7uMxVBswSkJD1gyogC2yQ=;
        b=SZZzXx/Hx+hVRcAal6QfREUgJPJ/RLCMUx1Ytn1Ur2Sdl5gmPsTe3aKEFBhKNwPCyk
         LOzSCSOgXOLfwdfB1pS/+deucMMvyEbbY/p0sqqNH0BzOMXGAFvcV+/3TnP9U2yPsecx
         R/JHXd7necfTm9hZPkk5sHYD+YO+6im1Vh1X/t+e4X28mZjUg7heE1w2xDRLdtVLAxBa
         F+GEeu9GuSMlnnOTjTSR08SjlZrhb6+jHq3kaSQT2cWJJ0dfjL5eAHjOP+sjWq+F5P7c
         8ukUE6xouqu53ibB+/fQNmkVBWyuJe1p35PJFOBAwzz8SowKVPueOAuFfH5RyccQhWlE
         tU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=c4lucAV7g10iQV3AgzUHQo7uMxVBswSkJD1gyogC2yQ=;
        b=JjNNnAW5peK8bIZGVcChGG5CcSoRd0qFy6Typ3tNsCR//+654vfrNjF/Uih8K8akNR
         xdStKdTn064/uDmVLzB0S+cXwHb1r6ZMhqO/HilavKqolDKEXvDrMQBPg2bDdyh1WD1E
         +c25j2HCCIBRH4mFqQvFO7mFylvIyIZVZTyeeGj66FB4mff1J/tDANEFfFXyB4lc6qgE
         s/kkkGXUA260jXMd9vxQLHzvUuMWtUZFTkuOjLJzpOLaSz0auwj8cvUnxgshYVJl/pVA
         YI23gWpynbMjcf3n5JnZn7kUdyE/H2hzIsw5dSZCVWLxMkccuXJcXORX/+Qx2HCGYBRn
         b7iA==
X-Gm-Message-State: ACgBeo0f5w72tM0Kg4HlL6X2rxD+9OZeR/FzRp/esy+W2bC8DVmUZUfK
	2UGOd+wVgobkca336OKz10RA867XS4ZX+A==
X-Google-Smtp-Source: 
 AA6agR7oZdtyFrtg2Cffyha8XjYsgPa6JdHW+VsMQ37LtST4kmVJQx2EYkuwIPo300yVBUQFAZKaIQ==
X-Received: by 2002:a05:620a:294f:b0:6b4:6915:f52d with SMTP id
 n15-20020a05620a294f00b006b46915f52dmr3237377qkp.159.1659653893488;
        Thu, 04 Aug 2022 15:58:13 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/13] linux-yocto: drop v5.10 reference kernel recipes
Date: Thu,  4 Aug 2022 18:57:47 -0400
Message-Id: 
 <d484320ddcea933d6e2c26ae8b0ed4b8f649472e.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168874

From: Bruce Ashfield <bruce.ashfield@gmail.com>

These will be supported in the -stable and -lts branches, but
no longer will be directly updated master. We continue with
5.15 and 5.19.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              | 45 --------------
 .../linux/linux-yocto-tiny_5.10.bb            | 32 ----------
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 58 -------------------
 3 files changed, 135 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.10.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
deleted file mode 100644
index c86d8b04c6..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.10/standard/preempt-rt/base"
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
-SRCREV_machine ?= "c51a272715b4280bbabaa146153b01ae2c679ab2"
-SRCREV_meta ?= "35bec1ca790cf107235c23bc187d03fc623f346e"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.10.134"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
deleted file mode 100644
index ac41804f2a..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.10/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.10/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.10.134"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine:qemuarm ?= "023d5ad7aa1d0d97bec767aa430c597840cd1e1f"
-SRCREV_machine ?= "7e87a46b7799a31b012acfdc767d5073297c80ad"
-SRCREV_meta ?= "35bec1ca790cf107235c23bc187d03fc623f346e"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
deleted file mode 100644
index 72812214a7..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-KBRANCH ?= "v5.10/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.10/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.10/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.10/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.10/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.10/standard/base"
-KBRANCH:qemuriscv32  ?= "v5.10/standard/base"
-KBRANCH:qemux86  ?= "v5.10/standard/base"
-KBRANCH:qemux86-64 ?= "v5.10/standard/base"
-KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "c2d86f701766458464f6c2db1ed59282e1e8c541"
-SRCREV_machine:qemuarm64 ?= "871dd0aeed30497d7383128c5144d980536d721b"
-SRCREV_machine:qemumips ?= "561aec6fca15c1c0644e170356f1ca7ff970039f"
-SRCREV_machine:qemuppc ?= "38bbf0c43a58ee6d385c14844e42b63797e48b9a"
-SRCREV_machine:qemuriscv64 ?= "7e6d888082597200876e17413ef21a0be8e946db"
-SRCREV_machine:qemuriscv32 ?= "7e6d888082597200876e17413ef21a0be8e946db"
-SRCREV_machine:qemux86 ?= "7e6d888082597200876e17413ef21a0be8e946db"
-SRCREV_machine:qemux86-64 ?= "7e6d888082597200876e17413ef21a0be8e946db"
-SRCREV_machine:qemumips64 ?= "fc85f6d0724fe79bdd7cebe813a6d51361bb1b08"
-SRCREV_machine ?= "7e6d888082597200876e17413ef21a0be8e946db"
-SRCREV_meta ?= "35bec1ca790cf107235c23bc187d03fc623f346e"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.134"
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
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.19.1


