Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.244.1621289826548786347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P3uqoBGb;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id 1so6125908qtb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0wehesCv5LGWDmRRFYZ3GztBXfnFrxOuh/MnAAEWuM=;
        b=P3uqoBGbc59vfFiSAve5sX7vd+WaR/jVCxusrADPV17Test49GwNPhJDFdVNK4AkT6
         PARJ32E3Dp+V2pi1fQJF5wAlsobYP+ppU8A+tkT51HZ5NN6j/uem4YD3QbVVtf/Wi5RD
         bIdt1a9KYFcnVSvu2huCAhY/ebQS7OZc/JABybMna2nWrGpheHFJjaK6mPS+6phcQiHS
         I0QU/uVp54+HD3zmo4tlrvnuSwyQif5U8Bg8cNmhaJ8AeippN1q7uKsl3Nu6SyAB0gPk
         BrREpQid5pAH2AbAdHcQvUzQQFBrMomOOdjUfYiRU8zbAPuC0VR5fjkJrQJmd/cZxeRC
         gSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0wehesCv5LGWDmRRFYZ3GztBXfnFrxOuh/MnAAEWuM=;
        b=n55aBjGMvA9MM+rK/7YyjVeT+5GHVW6VlexjOGiwiNr6xckGf2ZbsJpy68TcXY3ACb
         qByrFg4TvZU2DlkGAt2Vket/BVHlKprrqN3OaS0iJB5Q1sLepIe4jysC/p44HOk+6L+Z
         vxfShhPu6QA75LxarImPGf3ju/Cd7IOYa7OVCtn1Azzo+kRK5KEKCbOblMFAE3fT52iK
         SzyBWRKMqrHREtP5ygyZSPUYXJRnwyT7Ia9DOnzxDq6/Yt9qArRYZFePq+CfnKUTxwyW
         uDmVkhWyn7DIzQtqL+iYIZnNq2cf7odZQV6dlfRONVPxTqhThjDQs5GdG9VgNl6BSGYR
         tXYA==
X-Gm-Message-State: AOAM533KswLC4agUcMiT5O3LkpVji9XA2WLNxkqLK0tFYdjabGTnzxyF
	rITtKSNfBLvrCg6WkpqkBl4=
X-Google-Smtp-Source: ABdhPJz3L4vYCBNo7CDdrswlaq1FTf09o/roIYDciPIzjrGogRA9zR6CAEwYay9SnimXxcb9uMzPWQ==
X-Received: by 2002:ac8:5250:: with SMTP id y16mr1697424qtn.36.1621289825709;
        Mon, 17 May 2021 15:17:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:05 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/5.4: update to v5.4.117
Date: Mon, 17 May 2021 18:16:54 -0400
Message-Id: <814668126904950a2f5145eb72eefd75ce630dd3.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    b5dbcd05792a Linux 5.4.117
    0ee3bfc2c31e vfio: Depend on MMU
    b246759284d6 perf/core: Fix unconditional security_locked_down() call
    a1e6a0d1e6cf ovl: allow upperdir inside lowerdir
    8198962021fd scsi: ufs: Unlock on a couple error paths
    91aa2644a3ab platform/x86: thinkpad_acpi: Correct thermal sensor allocation
    164f74391822 USB: Add reset-resume quirk for WD19's Realtek Hub
    5922dfc42ac8 USB: Add LPM quirk for Lenovo ThinkPad USB-C Dock Gen2 Ethernet
    314192f055d9 ALSA: usb-audio: Add MIDI quirk for Vox ToneLab EX
    6cede11149bf perf ftrace: Fix access to pid in array when setting a pid filter
    ad4659935e11 perf data: Fix error return code in perf_data__create_dir()
    cbc6b467610c iwlwifi: Fix softirq/hardirq disabling in iwl_pcie_gen2_enqueue_hcmd()
    c7166a529e2b avoid __memcat_p link failure
    8ba25a9ef9b9 bpf: Fix leakage of uninitialized bpf stack under speculation
    53e0db429b37 bpf: Fix masking negation logic upon negative dst register
    b0c8fe7ef797 iwlwifi: Fix softirq/hardirq disabling in iwl_pcie_enqueue_hcmd()
    43b515c52942 igb: Enable RSS for Intel I211 Ethernet Controller
    354520d3ea81 net: usb: ax88179_178a: initialize local variables before use
    55714a57f369 ACPI: x86: Call acpi_boot_table_init() after acpi_table_upgrade()
    b3041510f0fc ACPI: tables: x86: Reserve memory occupied by ACPI tables
    91b08c5319a5 mips: Do not include hi and lo in clobber list for R6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index f82c6b335b..608dac4588 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b62ae8bedb024e67e7c5cda51840454a4170c858"
-SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
+SRCREV_machine ?= "ccf88860c16c9f2fae90da1ba46074b09d98a0a2"
+SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.116"
+LINUX_VERSION ?= "5.4.117"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 1c3fe73ae5..61779fbcf6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.116"
+LINUX_VERSION ?= "5.4.117"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "80bd6016a9bdaed4b66ddffffa8c8e62d7c1f8a6"
-SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
+SRCREV_machine_qemuarm ?= "2c64c9c438ec34cbdef929338fea304b726cac3f"
+SRCREV_machine ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 5245530229..c1270bc78e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e71df0530eefcac1b3248329e385bcefbad6336e"
-SRCREV_machine_qemuarm64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_machine_qemumips ?= "07445052fdd15e60b30dc5ae9d162c2e6bba47d1"
-SRCREV_machine_qemuppc ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_machine_qemuriscv64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_machine_qemux86 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_machine_qemux86-64 ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_machine_qemumips64 ?= "b36d79d6f2aaf9dadec352f611e7b9becf2b9a55"
-SRCREV_machine ?= "ea7a54fa402727f3c4bc4a1904d4a9590e7c8b85"
-SRCREV_meta ?= "b89df7433ea8124d3092805391b78808df4147a7"
+SRCREV_machine_qemuarm ?= "00362a9e9116bf12dd4ae468caf822b85106cc7c"
+SRCREV_machine_qemuarm64 ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_machine_qemumips ?= "603a0985e29b703dbb535c72f08eb6f9119e0863"
+SRCREV_machine_qemuppc ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_machine_qemuriscv64 ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_machine_qemux86 ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_machine_qemux86-64 ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_machine_qemumips64 ?= "21a474630e254696cfd46f1ee9c202ab8e85e38f"
+SRCREV_machine ?= "2744384587f1de0551f517cc7be1984077e95329"
+SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.116"
+LINUX_VERSION ?= "5.4.117"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

