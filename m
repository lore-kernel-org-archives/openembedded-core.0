Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4E9C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:15:19 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.8838.1652973309950362266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lemsur8o;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id s22so5055155qta.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gQNfYSb8z2I+dlCnhdzT6W5iQkUCB73hb3DdHplpvpk=;
        b=lemsur8oyQOYTDRziNIDs+JGsJOJFxOlQV/OnVE9/jKAzbLQjw4eeMB1CzYHP8H/wM
         Z5ByMR6VjGN7ypXDG26SyQoNO7ZlOGc+W42m5tdMAogFwrOD2Qg6/Y6S9sS8iX0qZSLV
         m7ZUjPkpUJ0V33kdMs+I6uZtHanfmfjD+LRyUVVhc46ohItMxk0V3iOfSQja5JOrk8Mc
         I945nK0/oDKvetWFHAHKbcLsTv0j5gL3OInHrN50tf9MRucqWnHIL1yQaWg2PW2uuyVw
         BE720mdByJNg5MmIy9uz+0nzoAafLkDSNclyXE5eHEmEzuIQkKAfdrx/tYK8ppVHKowf
         rDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gQNfYSb8z2I+dlCnhdzT6W5iQkUCB73hb3DdHplpvpk=;
        b=kpwNv+lOxC7ZB8YVja7wBfzp5UY9Y141HfRFc3yhlEOG9M7mIKxYaToiNGRKCUQ5Ur
         rhLl2GuGEw8N2eD4QeucUaIDSLSNoSaJBoOgplZwIifU8uhkSihrG3wJRv9D0e1hp8bP
         HE/UfASzdc+iXZ6TjdcrSYvvM9AmT4pNFhjnLJiUb1R2KC69ehzO9LyGlXFT4jQJZxMJ
         NOAGh4OZagmty/v/MLCCsGq5j8l8edO8lNd02dV0zRIdo77mQc3YKRUJsZdYTvbdPugJ
         mzjNcRj8fGix9SaFb1oIsxNCURMDILPLG5CYj2dnSWdXD2anxCOU58b0qsKK/KkxHNiC
         Eh1Q==
X-Gm-Message-State: AOAM533PBtWYrHPCQITmr6KR+1tQ3YzA4qCabXTkgGsjdgv098KbuhPw
	2H1du/NZtSAEmvbuY0gOYaxL2a4Lz/Qjpg==
X-Google-Smtp-Source: 
 ABdhPJwtuiabun7dkhjSQqVMUnKYHcoBLWHlPvmpAHxTbz4NrcC/9D1T4b7O1cvEBrjCOONCs2D+bw==
X-Received: by 2002:ac8:7f87:0:b0:2f9:e10:2930 with SMTP id
 z7-20020ac87f87000000b002f90e102930mr4266021qtj.673.1652973308946;
        Thu, 19 May 2022 08:15:08 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 he17-20020a05622a601100b002f39b99f6c3sm1354898qtb.93.2022.05.19.08.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:15:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/5.15: update to v5.15.37
Date: Thu, 19 May 2022 11:15:01 -0400
Message-Id: 
 <e89db6304ab4030890d1adc014367a08e3b1881e.1652973084.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1652973084.git.bruce.ashfield@gmail.com>
References: <cover.1652973084.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165896

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4bf7f350c163 Linux 5.15.37
    f59e6886cafb selftests/bpf: Add test for reg2btf_ids out of bounds access
    dcecd95a1357 mm: gup: make fault_in_safe_writeable() use fixup_user_fault()
    4a0123bdb064 btrfs: fallback to blocking mode when doing async dio over multiple extents
    c81c4f566660 btrfs: fix deadlock due to page faults during direct IO reads and writes
    640a6be8e861 gfs2: Fix mmap + page fault deadlocks for direct I/O
    f86f8d27840a iov_iter: Introduce nofault flag to disable page faults
    6e213bc61446 gup: Introduce FOLL_NOFAULT flag to disable page faults
    d3b744791bf0 iomap: Add done_before argument to iomap_dio_rw
    ea7a57858875 iomap: Support partial direct I/O on user copy failures
    a00cc46f97b9 iomap: Fix iomap_dio_rw return value for user copies
    81a7fc397a62 gfs2: Fix mmap + page fault deadlocks for buffered I/O
    38b58498819a gfs2: Eliminate ip->i_gh
    8d363d817353 gfs2: Move the inode glock locking to gfs2_file_buffered_write
    416a705304e5 gfs2: Introduce flag for glock holder auto-demotion
    b25cfbc0e7de gfs2: Clean up function may_grant
    b88b998579ee gfs2: Add wrapper for iomap_file_buffered_write
    1d91c912e7d1 iov_iter: Introduce fault_in_iov_iter_writeable
    30e66b1dfcbb iov_iter: Turn iov_iter_fault_in_readable into fault_in_iov_iter_readable
    923f05a660e6 gup: Turn fault_in_pages_{readable,writeable} into fault_in_{readable,writeable}
    19cbd78fb26a mm: kfence: fix objcgs vector allocation
    10033fa72d41 ARM: dts: socfpga: change qspi to "intel,socfpga-qspi"
    e8749d608847 spi: cadence-quadspi: fix write completion support
    8c39925e98d4 bpf: Fix crash due to out of bounds access into reg2btf_ids.
    379382b347db bpf/selftests: Test PTR_TO_RDONLY_MEM
    2a77c58726ab bpf: Add MEM_RDONLY for helper args that are pointers to rdonly mem.
    15166bb3000f bpf: Make per_cpu_ptr return rdonly PTR_TO_MEM.
    b710f73704d6 bpf: Convert PTR_TO_MEM_OR_NULL to composable types.
    b453361384c2 bpf: Introduce MEM_RDONLY flag
    8d38cde47a7e bpf: Replace PTR_TO_XXX_OR_NULL with PTR_TO_XXX | PTR_MAYBE_NULL
    3c141c82b958 bpf: Replace RET_XXX_OR_NULL with RET_XXX | PTR_MAYBE_NULL
    d58a396fa6c9 bpf: Replace ARG_XXX_OR_NULL with ARG_XXX | PTR_MAYBE_NULL
    a76020980b9f bpf: Introduce composable reg, ret and arg types.
    e52da8e4632f floppy: disable FDRAWCMD by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index afcc715918..5bc02623e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2b74bd6a3a2341f079f914171bc92eadc8a7deaa"
-SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
+SRCREV_machine ?= "0098c71753fab42ea29a58b8c39ae8852a0819b8"
+SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.36"
+LINUX_VERSION ?= "5.15.37"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 9a708804c1..4d2e9facda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.36"
+LINUX_VERSION ?= "5.15.37"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9107fb1e04c2da3d84e1967aeb7f5bc190423d5b"
-SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
+SRCREV_machine ?= "73e5fcde1e4d7b3ef0f122e309bf6feda2214133"
+SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0aef531659..a0af1f93cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b5b62e5ba72e2ed669bbb53dd5707e27d777257e"
-SRCREV_machine:qemuarm64 ?= "3f298fc00a40ed4f32805aba757c22c855f654b9"
-SRCREV_machine:qemumips ?= "6d50f4ff023b65e226fd2e65feaa583d8b177ae3"
-SRCREV_machine:qemuppc ?= "e51976427997a0b6f81e013ca6588e32c33cfeb0"
-SRCREV_machine:qemuriscv64 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_machine:qemuriscv32 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_machine:qemux86 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_machine:qemux86-64 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_machine:qemumips64 ?= "1822ceafc13337881a81edeb7093b0c095d9efca"
-SRCREV_machine ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
+SRCREV_machine:qemuarm ?= "487f0d10355bc4ea900c6cbfb6ba156541449263"
+SRCREV_machine:qemuarm64 ?= "623ef2010028407442669ed9d3a50a86ad4031aa"
+SRCREV_machine:qemumips ?= "d07fd1d207673b466616e5f806d97e2834ef35b2"
+SRCREV_machine:qemuppc ?= "cbe3228711c2f3df43ffb3d865ef09dd91fb7100"
+SRCREV_machine:qemuriscv64 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
+SRCREV_machine:qemuriscv32 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
+SRCREV_machine:qemux86 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
+SRCREV_machine:qemux86-64 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
+SRCREV_machine:qemumips64 ?= "08d20206727ae27296a3acf27a4fc6c9bdb874da"
+SRCREV_machine ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
+SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "45451e8015a91de5d1a512c3e3d7373bbcb58fb0"
+SRCREV_machine:class-devupstream ?= "4bf7f350c1638def0caa1835ad92948c15853916"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.36"
+LINUX_VERSION ?= "5.15.37"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


