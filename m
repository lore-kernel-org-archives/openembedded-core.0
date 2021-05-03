Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.33000.1620046482565639371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mOae6O2k;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id h3so2436062qve.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Is3w9bgZdl68iZfTLpB0Ug6mrVFdPoCf0WEa05VZQS0=;
        b=mOae6O2k9C8tVAtITD4r/+L4Nan9NSUh4TV+ZNTruee55I1h3UphHZzV9f4OrNZjWA
         mxf4ra2ioXud9b+BGOj4WdsyFUONSTwiBAXlE7b+HabRkEVk7tjBAg2vI3eTpuiQVClC
         3RVMIRRvEZ8m+5LNl2mfomrgZlmUvzkqPwBL8PmKZtddXCd35jib/rMoi9PF/Xd/zVHQ
         TNBqDpErCnE/hA4XvvFJJl6Vx/5q5ixpk2oRtq8dTgUe57UoRt3fAX98P+0EELXLXuOT
         GR4dK1PJyaryNfpWo6RoIFiD5ScTkRQLOHZueT6F9P/T7D2+OpSaBlLkoBH0vPXS27n+
         RxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Is3w9bgZdl68iZfTLpB0Ug6mrVFdPoCf0WEa05VZQS0=;
        b=p/qapvRj4PP2BFg2LMUkZ55mbF9Xm39v7Pg5+NuKwDVfqL8yiKjAzaCErrzKLymcdL
         CbR4s6i2Sk4ynF++OUlXJ9HpaZfd5obhnBBpqddKjEpsNIwsqINDXQdd4p5YOLx/j5qB
         M8OyHOCXQvymK1JGNti04fOy13V3FA4OSOfi9oW4LWMmTUoicqoZQ9Ax5B4Lh8UaCz8E
         4r9u9+GiPqkOTx4knzpHDJtpaYuPS20M1MZo6lMDRjDKKdZ/dNsbxwPoqJXFLwHvHBge
         KItSJSm9avmcW2iLHCJ3wYz1Fj+FFJrQ4hVsdSd1KglwyUASANDcMlKI9ouxEf68rt0c
         gx0Q==
X-Gm-Message-State: AOAM532j7kjTvwHN75RxHVcK2iNRAwAxUMH1Wl/yOoqPYQDU0VdST1vy
	QzlgNuWJT07Vuc2pqyNaD6sed1w5ycv73A==
X-Google-Smtp-Source: ABdhPJzvGowyFyC2EXdYAbPIn3Bg/lsRsTPHE/cEOHFIwZeYk3tG/3wazD3e0EdaFwaOBvpKPb0t/A==
X-Received: by 2002:a0c:e601:: with SMTP id z1mr19593969qvm.62.1620046481605;
        Mon, 03 May 2021 05:54:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.10: update to v5.10.34
Date: Mon,  3 May 2021 08:54:32 -0400
Message-Id: <0375134ec6499c21325556fd4b82b8b798301e4c.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1620046297.git.bruce.ashfield@gmail.com>
References: <cover.1620046297.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    0aa66717f684 Linux 5.10.34
    47d54b990103 mei: me: add Alder Lake P device id.
    2a442f11407e iwlwifi: Fix softirq/hardirq disabling in iwl_pcie_gen2_enqueue_hcmd()
    8bd8301ccc11 Linux 5.10.33
    8a661bad6cee USB: CDC-ACM: fix poison/unpoison imbalance
    90642ee9eb58 net: hso: fix NULL-deref on disconnect regression
    31720f9e87c0 x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access
    bed21bed2e79 ia64: tools: remove duplicate definition of ia64_mf() on ia64
    ba0910ad1c57 ia64: fix discontig.c section mismatches
    f4a777bcc8d1 csky: change a Kconfig symbol name to fix e1000 build error
    393200a1b095 kasan: fix hwasan build for gcc
    f2b46286e326 cavium/liquidio: Fix duplicate argument
    1bfefd866195 xen-netback: Check for hotplug-status existence before watching
    509ae27a1874 arm64: kprobes: Restore local irqflag if kprobes is cancelled
    da99331fc6ce s390/entry: save the caller of psw_idle
    d33031a894d2 dmaengine: tegra20: Fix runtime PM imbalance on error
    66d0cf7dcaa1 net: geneve: check skb is large enough for IPv4/IPv6 header
    6ce64437224d ARM: dts: Fix swapped mmc order for omap3
    db010ba54a96 dmaengine: xilinx: dpdma: Fix race condition in done IRQ
    e8d9a93ec46e dmaengine: xilinx: dpdma: Fix descriptor issuing on video group
    eb2c81ee764d soc: qcom: geni: shield geni_icc_get() for ACPI boot
    8c4bfe30eb55 HID: wacom: Assign boolean values to a bool variable
    e913cbc952c3 HID cp2112: fix support for multiple gpiochips
    f691dc86411d HID: alps: fix error return code in alps_input_configured()
    079e32723f78 HID: google: add don USB id
    ffe249b4fc2c perf map: Fix error return code in maps__clone()
    4d0cfb3713bc perf auxtrace: Fix potential NULL pointer dereference
    ab112cc573cc perf/x86/kvm: Fix Broadwell Xeon stepping in isolation_ucodes[]
    6f8315e5d951 perf/x86/intel/uncore: Remove uncore extra PCI dev HSWEP_PCI_PCU_3
    82fa9ced35d8 locking/qrwlock: Fix ordering in queued_write_lock_slowpath()
    b642e493a9a0 bpf: Tighten speculative pointer arithmetic mask
    2982ea926b5c bpf: Refactor and streamline bounds check into helper
    f3c4b01689d3 bpf: Allow variable-offset stack access
    f79efcb0075a bpf: Permits pointers on stack for helper calls
    edc5d1601389 arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS
    83d93d05376a pinctrl: core: Show pin numbers for the controllers with base = 0
    fc2454cc0c4b block: return -EBUSY when there are open partitions in blkdev_reread_part
    2bbd8aafde36 pinctrl: lewisburg: Update number of pins in community
    a8cd07e4400d vdpa/mlx5: Set err = -ENOMEM in case dma_map_sg_attrs fails
    bf84ef2dd2cc KEYS: trusted: Fix TPM reservation for seal/unseal
    9857fccd653c gpio: omap: Save and restore sysconfig
    71777492b745 vhost-vdpa: protect concurrent access to vhost device iotlb

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6b6b7ac785..bbac0d0336 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9a09bd7febd325064c9f291ebcda2186fa514884"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine ?= "400fbf5b14a0c88afb7c31d65be56fb9d6214c81"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index df76483244..f08dc68a6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2524b7aa4cdc2185862648c257c8774628d87226"
-SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine_qemuarm ?= "bf33b78f5136873b6d2ec6274908cf688341bc9e"
+SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cdc3fd1cdd..d26f02283f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "058fd44194d6c2a83506870bae3aca31c7f8be29"
-SRCREV_machine_qemuarm64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemumips ?= "c723ea1bc1fa3fd81f3e0ae2ba030898c40f7548"
-SRCREV_machine_qemuppc ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemuriscv64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemuriscv32 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemux86 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemux86-64 ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_machine_qemumips64 ?= "9c9b0edd160d0bbef687e574f2975fc54cf46843"
-SRCREV_machine ?= "178f87941032ff7065775ddd0f2bd668322c97c1"
-SRCREV_meta ?= "6eb23a018005ebef5a4265738f2643deedaba4e2"
+SRCREV_machine_qemuarm ?= "78e8e722eec4434024c5db3e0d59da0b128c7647"
+SRCREV_machine_qemuarm64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemumips ?= "b5c0852a90709e77f7a3d185d1745e6a1f66b77c"
+SRCREV_machine_qemuppc ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemuriscv64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemuriscv32 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemux86 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemux86-64 ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_machine_qemumips64 ?= "bf264e264d2141a4fb61d515573c27935e67ecfa"
+SRCREV_machine ?= "85c17ad073e9249f261cc550e8ada89a900d7d9a"
+SRCREV_meta ?= "bca3bfbc7473963f53aeefa74cb7a6e60b50831f"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.32"
+LINUX_VERSION ?= "5.10.34"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

