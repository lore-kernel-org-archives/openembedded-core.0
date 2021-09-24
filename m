Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.402.1632496223956104224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MOaO0F70;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id a14so6428621qvb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SuUc0XC6+hS38N9GUVUEYC8LeIyofdLVkgptN5NndU=;
        b=MOaO0F70GDvY6NqzkD6+jOMOGUnO0RWty18I5XleuFkVxqjK0FSz+vXwvLIMd4LF8o
         hmtJ1qx+Aou/XAO8uGjboZN8N2fVm6ApzQDqhDKHQ1FVXGtRiRxSevATTZUrn4RB1bTk
         PHWu0DHFBuqfAAww5NPwSd7LQvMKKnW6jPk510jxf5ak1xH+clECyX8leiCtqBWIzGfc
         se0+WwvZhELDFM4HjSlvq4cXl+zulSOsz57IqpBeIAGH/LWp2idSf9eFxcIlKrF8iK38
         DpGlpJa6wUC5tWplatfQGeFL1JmuokJwg6t1VKGDqX/sMAKeJl4uPLjAdaLaEEmWNVp1
         Vh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SuUc0XC6+hS38N9GUVUEYC8LeIyofdLVkgptN5NndU=;
        b=7BkpI9sdGghpaCrE5IG2Fe+KP0USLgZa2AL84WsblDwDsJH20qooEiOtSXqwKZJzfR
         xyonxVyECmKm2g8xLmxtMy3vXbHYD2Qy+3CT1MmqAWv28IpZF1jKYuhVouynlz4dmLbM
         qwtCRCylSB4FlhMchh3Z5Jx/zykTAfKaX0zlTGOhLze6sv0SQ7jZOWItwp7pESiMjSts
         aPu43He1JZj+zOZg7wcKYwJTqp3wafhDL7cEGLPRYnZDJwUn/SrWdety/51lRG69UlFD
         fztxxs2hDpN6YhfhZEbJv/m8dDl1EbpeB/zLg+FOw2/9UyDbbjNl1Hr3KjdrlKv3rZXK
         K03Q==
X-Gm-Message-State: AOAM533Qk2zbg+Ao6kQDKeaS1IJNVpe3c3b2oUNuz838RBarHdDLCDyp
	bioZF8gzTZKAdtRBOhJ+ChNi2wGVQ7lTMw==
X-Google-Smtp-Source: ABdhPJzSoZzGHYgtS5LUWvt8J5HpbQ+9DMDKzQhtkR/bxysNPmNXHGpva26AN9q2nbRKhBDrfc37Fw==
X-Received: by 2002:a05:6214:134c:: with SMTP id b12mr10652060qvw.33.1632496222850;
        Fri, 24 Sep 2021 08:10:22 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id k203sm6439797qke.124.2021.09.24.08.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:10:22 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.13: drop recipes
Date: Fri, 24 Sep 2021 11:10:15 -0400
Message-Id: <277e22e0df3ce3ab3f9f271bfb8743a2b3f067c4.1632495931.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632495931.git.bruce.ashfield@gmail.com>
References: <cover.1632495931.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.13 is EOL upstream, and we've moved to 5.14 for the release, so
we drop the versioned recipes. The kernel tree and branches will
stay available for use, but other layers must create recipes if
they wish to continue with 5.13.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              | 45 ------------
 .../linux/linux-yocto-tiny_5.13.bb            | 32 ---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 68 -------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.13.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
deleted file mode 100644
index 0b534c3fbc..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.13/standard/preempt-rt/base"
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
-SRCREV_machine ?= "eaf308f87d26c526da01d90bfb3581e2f40e32e7"
-SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
-
-LINUX_VERSION ?= "5.13.15"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
deleted file mode 100644
index 5b71d75aef..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-KBRANCH ?= "v5.13/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.13/standard/tiny/arm-versatile-926ejs"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.13.15"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine:qemuarm ?= "94f45ad50950df80adbf1a8e1bbc110abff5bbc4"
-SRCREV_machine ?= "3bd6397a9acc2cd13228c09097d61c8d1aa3bbdf"
-SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
deleted file mode 100644
index a17bddf0f4..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ /dev/null
@@ -1,68 +0,0 @@
-KBRANCH ?= "v5.13/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.13/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.13/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.13/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.13/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.13/standard/base"
-KBRANCH:qemuriscv32  ?= "v5.13/standard/base"
-KBRANCH:qemux86  ?= "v5.13/standard/base"
-KBRANCH:qemux86-64 ?= "v5.13/standard/base"
-KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "482fd531f2e6ce11c2f2815b90e91452009f18ee"
-SRCREV_machine:qemuarm64 ?= "c75650fdc9635f92e0b04c0da0336141f1f8fa54"
-SRCREV_machine:qemumips ?= "f8be183487cb429e66e49a2cfd989847c9298a3e"
-SRCREV_machine:qemuppc ?= "e55911fc5834f4d5aa527f885cab0ab2a0dbb4b9"
-SRCREV_machine:qemuriscv64 ?= "7280c93f5599946db3add473eeb05b34c364938d"
-SRCREV_machine:qemuriscv32 ?= "7280c93f5599946db3add473eeb05b34c364938d"
-SRCREV_machine:qemux86 ?= "7280c93f5599946db3add473eeb05b34c364938d"
-SRCREV_machine:qemux86-64 ?= "7280c93f5599946db3add473eeb05b34c364938d"
-SRCREV_machine:qemumips64 ?= "07540093c1a8f876fc6f9410aecc3d7d417780ed"
-SRCREV_machine ?= "7280c93f5599946db3add473eeb05b34c364938d"
-SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the same
-# meta SRCREV as the linux-yocto-standard builds. Select your version using the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND = "devupstream:target"
-DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "b8c3cc76091b35ad6a3d31cfe152870a6467611f"
-PN:class-devupstream = "linux-yocto-upstream"
-KBRANCH:class-devupstream = "v5.13/base"
-
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.15"
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

