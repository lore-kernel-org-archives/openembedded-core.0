Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A427EC04A6A
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.32106.1688959231039139916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NPB+3McG;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-635f293884cso22062166d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959230; x=1691551230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFJCoujIbrUVQkMwLD7+JWMOwYdgh/5L0C21U4xqj2s=;
        b=NPB+3McGRlGHoPQnILJAahPmAJ2TPHaE5pHLNcz/PHUvHkMtcex8rVtuEH3Jk8eYxT
         IrZ9HoJKM/7ck99+VEOD8+bkzjGjrMvZokOpogQJ3hhpcvSYPAATgzvjA1dIoGHi81x4
         krk2GS3sX1b4g1uRknJsA4L626NDUZPNC1dgOJtGF7Cl/XI8Q7GCrc/mCWNfmiglqsgA
         S3UKUcbwjy7EKCIM+bFjvFN++XTi+XAJcrILY8iNSONYLyk8Kp3Ig7xLOe5tDhbPxxFo
         wHyaBFQtY+USs5mTsaJ4mLIqA2OGhMjHo1/2g7oeFhR7p0bajKt08TJfIzQafxk2TjSK
         Twhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959230; x=1691551230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFJCoujIbrUVQkMwLD7+JWMOwYdgh/5L0C21U4xqj2s=;
        b=IwRP8eSLnUcIB70Jaf7beuBSlzG8baRx+a3tcWlXeycmMsJaW00HWa02wOKn0UuYX2
         t3moiYyi7ETkDDvApxawiTJpq68gWLUwEbyfcvlIDWDo6wLHfDEtd8ebZmosCi1HULwZ
         rL/oE3umAz3H6RFErh3fj7zHyIQs0TW5FymDOAJpv6kKzzsvCSKo+WdaGfRfjnfnZE+c
         znBXa7E/7xHCnbLi4hvN8MQ0vcxPB7utuKJjbI3kSe0MA3R48X3kJK38dPTWKozyVFBK
         tNtjeDCa8c1X0as3QyAlak9Gtkrs1hLx/VrIKfl+/hB3fZSGyfrJm0CMjJ60ukQGqom/
         PiBg==
X-Gm-Message-State: ABy/qLanVh4Y/43wbjlHtFvRrJ9k7ZVswafpFLA5TCei60kC8iz+hP2x
	FUP9p8iXxU7RIDJxBLDKk/FbBzyvleY=
X-Google-Smtp-Source: APBJJlGq97Fnu6qz/PM7O+OfGsR8/Xw6L4uvkvB8JVE5jjl9SQPedXn74K5GKwR+gaKhhMwCJC0dUw==
X-Received: by 2002:a0c:dc82:0:b0:62d:f170:f6b3 with SMTP id n2-20020a0cdc82000000b0062df170f6b3mr10063644qvk.19.1688959230007;
        Sun, 09 Jul 2023 20:20:30 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/15] linux-yocto/6.1: update to v6.1.37
Date: Sun,  9 Jul 2023 23:20:13 -0400
Message-Id: <f5bdea4df9dce8eb35b8931e6ad0dcd428d6167e.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184044

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0f4ac6b4c5f0 Linux 6.1.37
    323846590c55 xtensa: fix NOMMU build with lock_mm_and_find_vma() conversion
    c2d89256de75 csky: fix up lock_mm_and_find_vma() conversion
    4a1db15878aa parisc: fix expand_stack() conversion
    0a1da2dde461 sparc32: fix lock_mm_and_find_vma() conversion
    00f04a3385f7 Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
    a536383ef030 HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the T651.
    d89750b19681 HID: wacom: Use ktime_t rather than int when dealing with timestamps
    879e79c3aead HID: hidraw: fix data race on device refcount
    cae854249578 fbdev: fix potential OOB read in fast_imageblit()
    e6bbad75712a mm: always expand the stack with the mmap write lock held
    c4b31d1b694e execve: expand new process stack manually ahead of time
    6a6b5616c3d0 mm: make find_extend_vma() fail if write lock not held
    48c232819e77 powerpc/mm: convert coprocessor fault to lock_mm_and_find_vma()
    21ee33d51bf9 mm/fault: convert remaining simple cases to lock_mm_and_find_vma()
    1f4197f050de arm/mm: Convert to using lock_mm_and_find_vma()
    ac764deea709 riscv/mm: Convert to using lock_mm_and_find_vma()
    7227d70acc78 mips/mm: Convert to using lock_mm_and_find_vma()
    82972ea17b47 powerpc/mm: Convert to using lock_mm_and_find_vma()
    b92cd80e5f0b arm64/mm: Convert to using lock_mm_and_find_vma()
    755aa1bc6aaf mm: make the page fault mmap locking killable
    d6a5c7a1a6e5 mm: introduce new 'lock_mm_and_find_vma()' page fault helper
    4e2ad53ababe maple_tree: fix potential out-of-bounds access in mas_wr_end_piv()
    31cde3bdadca can: isotp: isotp_sendmsg(): fix return error fix on TX path
    0af4750eaaed x86/smp: Cure kexec() vs. mwait_play_dead() breakage
    6d3b2e0aef6c x86/smp: Use dedicated cache-line for mwait_play_dead()
    50a1abc67702 x86/smp: Remove pointless wmb()s from native_stop_other_cpus()
    e47037d28b73 x86/smp: Dont access non-existing CPUID leaf
    edadebb349e8 x86/smp: Make stop_other_cpus() more robust
    94a69d699941 x86/microcode/AMD: Load late on both threads too
    84f077802e56 mm, hwpoison: when copy-on-write hits poison, take page offline
    4af5960d7cd4 mm, hwpoison: try to recover from copy-on write faults
    69925a346acb mptcp: ensure listener is unhashed before updating the sk status
    42a018a796d1 mm/mmap: Fix error return in do_vmi_align_munmap()
    a149174ff8bb mm/mmap: Fix error path in do_vmi_align_munmap()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 19758206bc..b01f09b1a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5227a8173cee7256e370750216dbff5eca741134"
-SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
+SRCREV_machine ?= "48cdae83316b7055b4e63f3434ea26b0c04d7c71"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.36"
+LINUX_VERSION ?= "6.1.37"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 48cc6b87fb..529f515db1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.36"
+LINUX_VERSION ?= "6.1.37"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
+SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 5587c0d5b5..4eb2fb11bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5dd09d311b31db8c7b098e14a7857ef8a6e5353d"
-SRCREV_machine:qemuarm64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemuloongarch64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemumips ?= "1d79865ce12928b85ab2ab1756e7aa7ae5cc4938"
-SRCREV_machine:qemuppc ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemuriscv64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemuriscv32 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemux86 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemux86-64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_machine:qemumips64 ?= "7241bd2e494f07582f736ef1604e81ccd4afc7cf"
-SRCREV_machine ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
-SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
+SRCREV_machine:qemuarm ?= "fccbb53f81908991a69214e09ae0eea360410617"
+SRCREV_machine:qemuarm64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuloongarch64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemumips ?= "8370d3d4823bcff9532dd6bb163359f75a5416cd"
+SRCREV_machine:qemuppc ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuriscv64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuriscv32 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemux86 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemux86-64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemumips64 ?= "efe0a0701a1a8c5b6113d6a06b65857f8c84ac9f"
+SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a1c449d00ff8ce2c5fcea5f755df682d1f6bc2ef"
+SRCREV_machine:class-devupstream ?= "0f4ac6b4c5f00f45b7a429c8a5b028a598c6400c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.36"
+LINUX_VERSION ?= "6.1.37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


