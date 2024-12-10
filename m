Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB35E77184
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:37 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.4147.1733864788863730039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+mQf8ye;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467838e75ffso9311491cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864788; x=1734469588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slgSsg787I3Ilh07MEWSRwD9XQ+ngezvM7Ri5fKqJiA=;
        b=m+mQf8yeszlDsB4M4RTVFGU1N1GfPEPj9km9GSDMjX9V6OIzD5nVjD9C9NG4Ew0TvQ
         nuuxeTnCoxVwJ8EGUQ/J/ENxtWTm+wPeGP8oxlBXkBV8z2rNXYrT+4FrVWRXn6s5pael
         CFZqlIUX8QErn5v4+0R5XYVj0/Vion12Hj4hZuo3ArpGC0WbNGLpkbL9rs4U0zuizhyE
         qdMTSFRGRH5H+Ng8gJLUw+l7PqGunjg1Cru3NlTobXwSCOmdBC31PNJ4Yd2X7gU975kt
         tmTIJ0UtD16n77Byap+kscH09Mb9ZFGWvS++RKq/9ldQMujw0G4o4Su5q1whwS0JVgUq
         LL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864788; x=1734469588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slgSsg787I3Ilh07MEWSRwD9XQ+ngezvM7Ri5fKqJiA=;
        b=Vyl6/evSrsrV2wMA4B4kpBy0KEotwi9K20FWEevKTgXA0WKTUQrLo/KqaySMxzAQ8c
         8tha4jKSI19iHv7+0pZyJMMF9iPEf2arYsYyOgHsKW4EpBDiSk6YqzBaZdfG3yRtDx4+
         kAY0HQnHAI+5QmyRgW2HNYLKP6+kPoI5r650bb1cSmq5SulWTCPfP1C3uTEhQ4/ouNfz
         2uOIoCRxAjskynSvQhAOxWYb9Ml6sj3UcXpYsvRQQ2YjSQqomL7u8XRu41qcSpy1R7j1
         LZEw3mPXIPsYM06XP1iymr/68ykOHScR8PYvqyTnCthqL3S8V2CtOgl3OMeTdUA+SK2s
         K5NQ==
X-Gm-Message-State: AOJu0Yy1mlGy8yqb8822Pwq5+3322SYapoY/hmb0f3iWiPZD3Eyd0ByO
	DTrBqcwh6p3LIwIFKpZqyt1/AwLAuQjWVnS8WIPfwGYZ02diQJ/RQIJEmerX
X-Gm-Gg: ASbGncuonwaEaLF9AckblJMT8zJ8/vWA14yvd4IlmoKb6MaNqNSDTBXaAcmoxzMlSYO
	sBrFKpiNyLhn8cdOKK5FLPWB0DmXw7mxPQ363ALKhX/zjVA5aomAHUEz6c4r2Xz5IMmmiHEycBQ
	Ryiaco/FeosEpue+eH+aQ+VDvFJIJ6zY6cTkQ/HsRBUowPmIzEwMUO/7IkFuDXII+vwjwvrnwOa
	5YWrmM2j0I9tMgWCcfNaaE4YWeNonqozmzKwVXZkRZ1+ejHVSVwUHj4AVzWFbwN3sNIp25Y+ZPb
	ssRBNyRtWzKro7pWcs6kv5dF3r2s95OAv9ofiLUFz3pdQVXZgxN83SM=
X-Google-Smtp-Source: AGHT+IFnU+kp2V1TT2ZjV2UaMYWfERGEXOI3fARsuWKeVX2qTU3hySKGRlY6DGBAxzlB5WQnTbIBFQ==
X-Received: by 2002:a05:622a:1b16:b0:466:8780:5b24 with SMTP id d75a77b69052e-467892ba821mr6797771cf.18.1733864787832;
        Tue, 10 Dec 2024 13:06:27 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676e091d95sm18415301cf.12.2024.12.10.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:06:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto: drop 6.10
Date: Tue, 10 Dec 2024 16:06:16 -0500
Message-Id: <67ca158fa3e6a36617b0bbc0c739660df4853a52.1733864271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1733864271.git.bruce.ashfield@gmail.com>
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208560

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.10 kernel is EOL upstream, and we have moved our default
to the v6.12 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              | 48 ------------
 .../linux/linux-yocto-tiny_6.10.bb            | 33 --------
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 76 -------------------
 3 files changed, 157 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_6.10.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
deleted file mode 100644
index 7c0425bb27..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-KBRANCH ?= "v6.10/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion_6.10.inc
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
-SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
-
-LINUX_VERSION ?= "6.10.14"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
-
-KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
deleted file mode 100644
index 891dcb596a..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-KBRANCH ?= "v6.10/standard/tiny/base"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion_6.10.inc
-
-LINUX_VERSION ?= "6.10.14"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
-
-PV = "${LINUX_VERSION}+git"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
deleted file mode 100644
index 1d5b8af337..0000000000
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ /dev/null
@@ -1,76 +0,0 @@
-KBRANCH ?= "v6.10/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# CVE exclusions
-include recipes-kernel/linux/cve-exclusion.inc
-include recipes-kernel/linux/cve-exclusion_6.10.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v6.10/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v6.10/standard/qemuarm64"
-KBRANCH:qemumips ?= "v6.10/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v6.10/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v6.10/standard/base"
-KBRANCH:qemuriscv32  ?= "v6.10/standard/base"
-KBRANCH:qemux86  ?= "v6.10/standard/base"
-KBRANCH:qemux86.104 ?= "v6.10/standard/base"
-KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
-KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "e118779b7d6c0be1ebdf9a1f7c4401a7a2daffe1"
-SRCREV_machine:qemuarm64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemuloongarch64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemumips ?= "59775dda87d79c59035b222fd453ff38a2950653"
-SRCREV_machine:qemuppc ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemuriscv64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemuriscv32 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
-SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "af06ad75b8da89e99d2cc0090ce2a7877ef51391"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the same
-# meta SRCREV as the linux-yocto-standard builds. Select your version using the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "47c2f92131c47a37ea0e3d8e1a4e4c82a9b473d4"
-PN:class-devupstream = "linux-yocto-upstream"
-KBRANCH:class-devupstream = "v6.10/base"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.14"
-
-PV = "${LINUX_VERSION}+git"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
-# libteam ptests from meta-oe needs it
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
-# openl2tp tests from meta-networking needs it
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-
-INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
-- 
2.39.2


