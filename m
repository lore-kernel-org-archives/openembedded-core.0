Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70F4C00528
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.32113.1688959239455684906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dKF5oQdR;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-635e3ceb152so19603646d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959238; x=1691551238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15cxdAYlXORaD16fK/paUQEcclMox+/RK4SlZH8cL/o=;
        b=dKF5oQdRu1zQe/uIcdrHH2jtO5DoVbVvKM1s/6nhCqH+g4CtXi4AhSsJh8rphOwoY8
         RDXHAb4RpTDZlgwJYfetiA27uTzyacdrF3Nc9XNbnD6Z6xAi76StBrzvnMJpBhXAAPG0
         YCqf46kaEczo0YHcwmzfmLW6SCG9ZTudgt2bQ6LL6I8dKl7FZrl4Sc8y6GPylPxpk0gv
         /dUjTt1Vg+uywp3D/TFOHk0aGtZ9evDY420JTwLou1sfXBUtLIZMCUrrH1fduSY+2kFo
         jPVxcAxTfqUFsSdq/kFN/Zu0a6gwTGHohKZw/oxJl95aFhK+0LpAGsJsMl7NwCjiQJnI
         cA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959238; x=1691551238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15cxdAYlXORaD16fK/paUQEcclMox+/RK4SlZH8cL/o=;
        b=Ik4qcAYC8TAWKYIVZl1Xu5Siv9WaprIDVm+COWsCCiM12hmulZBsflRhy9NDc6SkF+
         HjYe/0ZPM/MsBatyEjxfnqgp4y0lmk72DgSytzTW3HEDVOSbuXqaptwGYOtQL5S4KjED
         h8OKtdp6dYNNLoCafJs3Hix/dnWZRPwJKbY+tQYXlhciinY1ohCdn8UcKw01J3oJwoDy
         63k7zqHYH1AzVgoaUADBy59C4TgA5GOBJIzmWlAYs16D5ASxN+O3cUq36F5uojsaiHDw
         3K173AbzaIaHxzzBEsh+M18YkS9LFrqFC6RvkA5RqJqDLh4IPWAU0inzVu93pQG7Wr0U
         tPyg==
X-Gm-Message-State: ABy/qLZyvc1t/SXZdMGC0JIbBcWirk8tN+o8+HGe9bU0697l6kG9p9TN
	IfkrKar5SFsHiHwn64cKlRJ19ss1B4I=
X-Google-Smtp-Source: APBJJlF3ruEFnfpBtYp7OnYI3FnZjzc13tVe0QsZjOiJ2TCcwn8KprgDMDyBHnqLmmUjn0syAaOzLg==
X-Received: by 2002:a0c:e042:0:b0:630:14e0:9827 with SMTP id y2-20020a0ce042000000b0063014e09827mr8699833qvk.28.1688959238330;
        Sun, 09 Jul 2023 20:20:38 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/15] linux-yocto/6.4: update to v6.4.2
Date: Sun,  9 Jul 2023 23:20:22 -0400
Message-Id: <f323c65f341047bc8520c419de4e3aec1a64119f.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184053

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d7defc5b8d42 Linux 6.4.2
    ba0f198721f4 arch/arm64/mm/fault: Fix undeclared variable error in do_page_fault()
    57db8dc02888 drm/amdgpu: Validate VM ioctl flags.
    cc39da6c58c4 dm ioctl: Avoid double-fetch of version
    c27c99d4458f docs: Set minimal gtags / GNU GLOBAL version to 6.6.5
    16167ccafbb3 scripts/tags.sh: Resolve gtags empty index generation
    b1c2d0ded4dc hugetlb: revert use of page_cache_next_miss()
    a03f2f4bd490 nubus: Partially revert proc_create_single_data() conversion
    1c70f4df65ac Revert "cxl/port: Enable the HDM decoder capability for switch ports"
    5dda60d23104 nfs: don't report STATX_BTIME in ->getattr
    926eae6ede9b execve: always mark stack as growing down during early stack setup
    dfb27a766896 PCI/ACPI: Call _REG when transitioning D-states
    f933605c1767 PCI/ACPI: Validate acpi_pci_set_power_state() parameter
    f23cf6986b87 tools/nolibc: x86_64: disable stack protector for _start
    8911865ae284 xtensa: fix lock_mm_and_find_vma in case VMA not found
    593776794734 Linux 6.4.1
    2aad4f30f4e4 xtensa: fix NOMMU build with lock_mm_and_find_vma() conversion
    87d780e048bd csky: fix up lock_mm_and_find_vma() conversion
    0d98e5325f1f parisc: fix expand_stack() conversion
    23d1e960cd12 sparc32: fix lock_mm_and_find_vma() conversion
    7a11f6e08edf Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
    e6d864166aaf HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the T651.
    05b47034e248 HID: hidraw: fix data race on device refcount
    14fdcf965dc5 fbdev: fix potential OOB read in fast_imageblit()
    00d5932e09d7 mm/khugepaged: fix regression in collapse_file()
    f450d0307644 gup: add warning if some caller would seem to want stack expansion
    d0198363f910 HID: wacom: Use ktime_t rather than int when dealing with timestamps
    fb32951c8903 mm: always expand the stack with the mmap write lock held
    af099fa739b8 execve: expand new process stack manually ahead of time
    b2d6752dbfe7 mm: make find_extend_vma() fail if write lock not held
    accf6d0c5832 powerpc/mm: convert coprocessor fault to lock_mm_and_find_vma()
    203cfe05efc8 mm/fault: convert remaining simple cases to lock_mm_and_find_vma()
    4e3fb74f6050 arm/mm: Convert to using lock_mm_and_find_vma()
    7e99b9821acc riscv/mm: Convert to using lock_mm_and_find_vma()
    929eb6b2a690 mips/mm: Convert to using lock_mm_and_find_vma()
    b6f36565369c powerpc/mm: Convert to using lock_mm_and_find_vma()
    7a1383601b7c arm64/mm: Convert to using lock_mm_and_find_vma()
    d939d8c154f1 mm: make the page fault mmap locking killable
    b11fa3d22ac0 mm: introduce new 'lock_mm_and_find_vma()' page fault helper
    f5fcf6555a2a maple_tree: fix potential out-of-bounds access in mas_wr_end_piv()
    b6e1ef3cd6d8 can: isotp: isotp_sendmsg(): fix return error fix on TX path
    3f2719a1c382 cpufreq: amd-pstate: Make amd-pstate EPP driver name hyphenated
    9e97e46e3210 x86/smp: Cure kexec() vs. mwait_play_dead() breakage
    cc37b1184236 x86/smp: Use dedicated cache-line for mwait_play_dead()
    4726d74f697f x86/smp: Remove pointless wmb()s from native_stop_other_cpus()
    8b1b43c42100 x86/smp: Dont access non-existing CPUID leaf
    f9abe01d5d68 x86/smp: Make stop_other_cpus() more robust
    9a500542a1dc x86/microcode/AMD: Load late on both threads too

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index d1316e23a1..bd340adc15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "369f3a1d2f3947bb0587f4ae8b15dd8803125de9"
-SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
+SRCREV_machine ?= "0c7d2016a3a548fd8f7caf7b1f46abd71008cd5c"
+SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4"
+LINUX_VERSION ?= "6.4.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 6ad96d215c..6490c69b93 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4"
+LINUX_VERSION ?= "6.4.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
+SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 85fcb33b3e..e514251673 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7e1be3b6ae5d05b30112b68fb92cad00b8ffdf49"
-SRCREV_machine:qemuarm64 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemuloongarch64 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemumips ?= "de409c37f1d2c5eacea9c33dc42117cb107aa305"
-SRCREV_machine:qemuppc ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemuriscv64 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemuriscv32 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemux86 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemux86-64 ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_machine:qemumips64 ?= "b14484af5492f03c8afc25f3684c8ae86a78295f"
-SRCREV_machine ?= "40dfcb393658098382d48669718a1cb16674c833"
-SRCREV_meta ?= "0b4a5500b775a9429c933ebb6d54d018ca921106"
+SRCREV_machine:qemuarm ?= "89ab6408aa244552f100996ac5a2b49379bf9a2b"
+SRCREV_machine:qemuarm64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemuloongarch64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemumips ?= "7abe3962401b09a7768acc879070671308c04163"
+SRCREV_machine:qemuppc ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemuriscv64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemuriscv32 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemux86 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemux86-64 ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_machine:qemumips64 ?= "4dddf5763b3a26b7892ed75d02bcb9c25a3fe703"
+SRCREV_machine ?= "2bf4f46721ce8095f156566128a9feee2da09d20"
+SRCREV_meta ?= "8a09ea80e6905baf80940dc8c4fe9326bd8d19e2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6995e2de6891c724bfeb2db33d7b87775f913ad1"
+SRCREV_machine:class-devupstream ?= "d7defc5b8d422ba19ab762a96cf1b1eb158aa5a8"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4"
+LINUX_VERSION ?= "6.4.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


