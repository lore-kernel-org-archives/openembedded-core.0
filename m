Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3738FC04E69
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.16751.1690487046205384026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=vNCNbpha;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2682b4ca7b7so817243a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487045; x=1691091845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ear8dMfSGonVw+06wqiumHv7IxCbIwWgECHphSVftJ8=;
        b=vNCNbphayoCKFV4iQfZXtuSz7btBi7JUeu6XSoyfDusuSEjREdG6W09eQl5Tm/FIXI
         V6+t0pqVNg9/cNippr4RyuZWg6OrFpMLOTKGUZ6mfaFcrcNWEFMjvda1+OAAQXHVVUPH
         0LKrswlwFE7SvKo1meWjikfSN4OFGJ3w8uaGYoDrcB6eTWC0r/PWRRolSZRVfq74DXuY
         li1VTjnErrWfxl3rTVmvZR7FoJmiOFSGT6rZhVc0E/E9vm79IY8XZgOdOrjE6AcYZ/8/
         IvqxEB6uKA/UELugkw8FR5J4dfm/RSvklIKrUyiy4qkTXUYivglkEcOkphCi8c5mZD9M
         jJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487045; x=1691091845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ear8dMfSGonVw+06wqiumHv7IxCbIwWgECHphSVftJ8=;
        b=g+lh50Wt0esdr+wze7nY2ryIc1McaVtFWmBeFp91iIzoNUpXOAuhoip6fwfpA1LxT4
         qOuVRYB/Iql0GzxqE00GQJ+l2rUfJxey9Anu5bT8p9YYgZzWFqsDBYlq7UQa+pj/FLi2
         urmSIOmkFF9TKy2rfBuSCb57ZtV1ZCZngFIL1g1s82hBPr928fG3+P015MXs22NbcLeE
         DlPUs79E1x+0WC6hsVwQomU1VmIfQ2AyrP+PlaS68lpXscvOgCgu+0qQtTrK9xUqLjhE
         iFAJNQCGJfORR5CFYi2W2m/z8JFwYmiou8Ns9eT5w2rnYF8BIE7tUkfsALxfOeft24iw
         NVug==
X-Gm-Message-State: ABy/qLZz1TIJpg1uhIcn7CdkP/JcldqG8QLq5Ddv+AksRXMDJwPfkM0E
	GV2RHfbj3BCb7tykf66CJ76Rmze7WkGdqPU5YwQ=
X-Google-Smtp-Source: APBJJlEjdUHOaIMvBU5Wo7mMC+8KjOSCKOsIp/sXoP6OApSpjln4nvuD5HgdlrJhqbzKR0G9Djf0Kg==
X-Received: by 2002:a17:90a:6e48:b0:263:6a7e:c239 with SMTP id s8-20020a17090a6e4800b002636a7ec239mr231648pjm.37.1690487045232;
        Thu, 27 Jul 2023 12:44:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/27] linux-yocto/6.1: update to v6.1.37
Date: Thu, 27 Jul 2023 09:43:24 -1000
Message-Id: <4abc100a81401373edaa3c5859e4bf94e8dc3d0d.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184981

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d43c9ebcb0308d9178f6f44c02cac13de126c92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 47d2e72c3b..3245c3eab2 100644
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
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.36"
+LINUX_VERSION ?= "6.1.37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


