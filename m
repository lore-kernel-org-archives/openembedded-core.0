Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A819FC25B76
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.3821.1714704048122694732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjXw+Pyf;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78efd533a00so609173985a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704047; x=1715308847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1j5P4YMhqFxKKwEg5IxPgmCjKoBNDsuaroyWOaoaLk=;
        b=TjXw+Pyfr6RtTt7Geyvf639zAIPuxgEsnoZ1V9ghmZS6rVFtBOvmTtYNeFMICmBBcQ
         RT9wEo1B1yTcna6Q1D2bjBwt0GRTzaJGCkfmaLlcrNthxuzSv4LRDrj2vsfZxsvKTIQc
         7FWy91guFQ7uioDI5eWojecpzMwhEGDKN/sipkBAJlDZZIi0rDEqPqVWGZhA9hoCEHcc
         QPu98WAaLsbbp+0lltBWMbbSAkzsMse4rDx/5ry8JuTymJ9iU89LTHWtD76lZTYwsDHT
         n6ZaWpIn31gwoT/aUnZ6o8FQRg0BNGbWhILJy2q4OfaZU7k28IzzWlhKfgAW/zTNzB/J
         MO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704047; x=1715308847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1j5P4YMhqFxKKwEg5IxPgmCjKoBNDsuaroyWOaoaLk=;
        b=AVz+k8eIRm996RFapdLceSJxarhWjUDcM+SE5DHHXNS+Uszk+GOPFgQWB79OteLu6r
         nKGFpWSb9gXPXvj/QJQCA+Yn6sG1tKB37Lay/aEs/fmUArPd6/oRi/ztdbx6yIO9NznR
         uMhYqKUj7r/ms7PORpHaWUEpzFci14ltn7l2KA9KBiD/acowbfiVtYvD9Lp7VA1Trz1F
         CCbu5x6LZ35i+UUGPjLrNa4TQqxcFsVfD+ypso/zz9MJzPBSvsB2PZnh5jV238hgmQE0
         uPfatJcnGbhOKLe5iShhSAgO6Hxin5jlZZEyID3E4hY5UkoYEvpUz8T8QRHgSHbbYd2w
         RVnw==
X-Gm-Message-State: AOJu0YyOn4VQRZCYuQjJncb194fGUohsfzd0VmDylchof/OXy/HzqVfe
	4PCOIKWRRwY0PDVKjczmgfKWJuNOl+G9UEOrNyLa28h0upwrmUZt
X-Google-Smtp-Source: AGHT+IE3sQCRDG/DOgfuxo1J+jwWdc8+l9fUZlRgydS8Mx8dWs1FwHUQ0L1PLoUID003yOP1T/z6yA==
X-Received: by 2002:a05:620a:36e3:b0:792:7f71:ec27 with SMTP id cz35-20020a05620a36e300b007927f71ec27mr334144qkb.75.1714704046747;
        Thu, 02 May 2024 19:40:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] linux-yocto/6.6: update to v6.6.25
Date: Thu,  2 May 2024 22:40:31 -0400
Message-Id: <fb392327373a8648bca8b4113535e22da0515c57.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198934

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    e475741af1eb Linux 6.6.25
    a99d7274a2b1 Revert "workqueue.c: Increase workqueue name length"
    d8354f268d92 Revert "workqueue: Move pwq->max_active to wq->max_active"
    35bf38dd162b Revert "workqueue: Factor out pwq_is_empty()"
    957578ec33d4 Revert "workqueue: Replace pwq_activate_inactive_work() with [__]pwq_activate_work()"
    5debbff9539c Revert "workqueue: Move nr_active handling into helpers"
    e3ee73b57a2e Revert "workqueue: Make wq_adjust_max_active() round-robin pwqs while activating"
    f3c11cb27a8b Revert "workqueue: RCU protect wq->dfl_pwq and implement accessors for it"
    bfb429f37052 Revert "workqueue: Introduce struct wq_node_nr_active"
    6741dd3fd38e Revert "workqueue: Implement system-wide nr_active enforcement for unbound workqueues"
    a75ac2693d73 Revert "workqueue: Don't call cpumask_test_cpu() with -1 CPU in wq_update_node_max_active()"
    7bff1820bcfa Revert "workqueue: Shorten events_freezable_power_efficient name"
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 2f788667f0..5071550640 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7290738691e931c361f5391a47189e40477cc2a2"
-SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
+SRCREV_machine ?= "9f39c8adfc6025293e5ff131f7bb4f728edd0c99"
+SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.24"
+LINUX_VERSION ?= "6.6.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 4f9474efae..a4af8c8a16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.24"
+LINUX_VERSION ?= "6.6.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
+SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 65a3e9a97d..583dade097 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "47c23d5ba2db28b76e62e152bf4601f30ffbb1a6"
-SRCREV_machine:qemuarm64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemuloongarch64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemumips ?= "d433ef0d8830772213f0d667478d675e778cfbc1"
-SRCREV_machine:qemuppc ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemuriscv64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemuriscv32 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemux86 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemux86-64 ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_machine:qemumips64 ?= "480ddad109153a5cadd6c625d93044d7d93ce8bd"
-SRCREV_machine ?= "2f64879b557ec6baccf27afdd4d02a46051b65bc"
-SRCREV_meta ?= "03ec143a0ca70ff92968bc4ea919e936ab9e8572"
+SRCREV_machine:qemuarm ?= "e76632ff3899f47234405672a658156bb0079d52"
+SRCREV_machine:qemuarm64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemuloongarch64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemumips ?= "744b6e2f70062732f48de0918ca8c56f5de408dd"
+SRCREV_machine:qemuppc ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemuriscv64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemuriscv32 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemux86 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemux86-64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_machine:qemumips64 ?= "936a9ceb126dfb2cc4b38229cab68636263ecfab"
+SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
+SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9467d7a12f970e7f12adcba143b0c9b9d1a9e72d"
+SRCREV_machine:class-devupstream ?= "e475741af1ebe2c92ee4a3f49e55749a84770a12"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.24"
+LINUX_VERSION ?= "6.6.25"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


