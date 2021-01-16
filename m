Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.4740.1610769442413607253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 19:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dx5sDCbF;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d15so2164177qtw.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 19:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcPMBVWmREVO/x+kjuFMqFLrQa/h7vPJBrFF8+Ezu+E=;
        b=dx5sDCbF6FzTAIslRWjK/TfFfxAW9yPoVJHWPE0mqqqu8qbqxXdKEmuvmPTA4vq1nk
         +n/6RLOxOlra6XbPB55WGwu36FWIZT2wlAsH6tMw73m2vTgmLwXb+g5Z8dw5gVPTEUy3
         SJRBi5RJZ/VutWc9Kg/eI01A/m+Z/EgVb7HXiR0V4jBUVPzPVAKfZ3orj/TxepCuj5Og
         lNi9IDl4ABXcvAZzMzXXoB5GX5ps7VoOY1ptE/CCZ+sLQMa5d6DP4FeLJyZ9/TjJqnUu
         RvkazGKisY2v9BE+LoVVjUFQxVO/gt4Mql0JKZgnwYWpNdCjmt17YcZpTuTAmdOAoMb1
         ONVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcPMBVWmREVO/x+kjuFMqFLrQa/h7vPJBrFF8+Ezu+E=;
        b=rtlRsL2R0kchd4Y9J30zId13QE/KFimKzSKzSN32twCql7y/veD739NN2P0cSMpzJh
         RVLFqrj7mxcdWGVAbUe6Wkaf//59i6S5loC2xYaiW19WLlRJpN3IgMOSl3CBH9S49+Nf
         FTRICuQSm85xLBHE2rKcFh/3KI2JyeBmdnT4eG8LLvzcmbbiLBg155Yj9wNQkQ23nbVd
         RYbgfjpSdR+8rrxQDnFtRtze1X1SYAtt9dwyBVCbIrrzyUOlJrhBBQJn/FMJiLu4dfOY
         Q2Gu9isn128c+OC9UxspeHaxScIxtxZdk6q8hK3SqPXgSPoHYAEVs0GcWyfMgww6ivC4
         nBQA==
X-Gm-Message-State: AOAM533kxHX32rPU/m/Ei0E+St8aesk3uzK5lnyskrsiW7R5KVXmi2A5
	Xzqaguf/ry810FzQpYTMNf8NUxqPxE6fig==
X-Google-Smtp-Source: ABdhPJzrK0yMhtGPJpKVypk4LuL916Y5DkVecAYseCRB1ytdnOEigOOAYIlNHCOl6QkU+5Dcka6DLw==
X-Received: by 2002:ac8:5dc8:: with SMTP id e8mr1189736qtx.249.1610769441415;
        Fri, 15 Jan 2021 19:57:21 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f17sm5943639qtv.68.2021.01.15.19.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 19:57:20 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: remove 5.8 recipes
Date: Fri, 15 Jan 2021 22:57:19 -0500
Message-Id: <20210116035719.23310-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.8 is EOL upstream, and we now have 5.10 available as the
latest -stable kernel.

We'll keep 5.4, 5.10 and -dev (5.11) as the active kernels
for the upcoming release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               | 44 ---------------
 .../linux/linux-yocto-tiny_5.8.bb             | 32 -----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 55 -------------------
 3 files changed, 131 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
deleted file mode 100644
index d20b8b10ab..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-KBRANCH ?= "v5.8/standard/preempt-rt/base"
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
-SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.8.18"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
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
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
deleted file mode 100644
index a5135155d5..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.8/standard/tiny/base"
-KBRANCH_qemuarm  ?= "v5.8/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.8.18"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
-SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
deleted file mode 100644
index f6ebefbf1b..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-KBRANCH ?= "v5.8/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "v5.8/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v5.8/standard/qemuarm64"
-KBRANCH_qemumips ?= "v5.8/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v5.8/standard/qemuppc"
-KBRANCH_qemuriscv64  ?= "v5.8/standard/base"
-KBRANCH_qemux86  ?= "v5.8/standard/base"
-KBRANCH_qemux86-64 ?= "v5.8/standard/base"
-KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "14b463d0e5c1e2ff354244420f9bbc7f0ab80533"
-SRCREV_machine_qemuarm64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_machine_qemumips ?= "8d8d9afb396f154f366f32948fdff3cf4e269841"
-SRCREV_machine_qemuppc ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_machine_qemuriscv64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
-SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
-
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE_qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.18"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-- 
2.19.1

