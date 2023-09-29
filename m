Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34181E728F5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:12:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.27870.1696018330959649906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcKFIGCO;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77428e40f71so730865785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018330; x=1696623130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHdIwyuhFwq4d2Gx+nxKrwRDNx1ZVfEySEwFETbMWRs=;
        b=jcKFIGCOOK39+HLNYE2jeQLzUf47JB54HmG3udeYZEIsExKuUAIf2B13lLsMVAk4co
         tfwdOck8y3Yb6VuKpIxayseUfasyRYIIWT+fzihG9ruAoimbTtbTgRqTwy/FJADjajHq
         hyoubTNApkEw6I9dXjoowLmnGK55ITMCZGdGVliAsWMw0IIVQ68IQTuSCG1xNe9tVEUl
         oqZuQp8566fDPt2sDICY+V2lZI9puTh82IW0wkHcd9o3nebwLFOUP2ejif6Z/wMZwbOg
         iu9tFIeGBydK/wQQhVby5q3t55EqtHbhlwzO2qA4M9uAtvvv8ci+Oz4ofhOJ5HFPrpy6
         s6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018330; x=1696623130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHdIwyuhFwq4d2Gx+nxKrwRDNx1ZVfEySEwFETbMWRs=;
        b=lMTLd3ffa+mhJhFtoEwrkTzNBMlo9i5tufjLx8h+5Ba3fmGQsqHSxTryrbK9MnD0VJ
         uZbJh8cUzefABkSNWK/1F7XZEweDKX5hSAfywwlQrtdZ/fVwaNp2ix6UQ/mq4P64lBLV
         Qb4+r65eLS+/pr8dchb6iLw5XPgI40nIz7bfkLntGxjWt/hR4MuOyPCSutGlUVEo3I8U
         fUmyXZppk4HbIaxmliw8WUrO9SkuzhIGy6qe7x36VV9dSr1rnoMt3l4FDpvzyr+sYixX
         k8hnfMKfpwq/Y1AqN3uroN8Nt+Z5jAWC9GnepvouQzQ3AmFPYZyeGr1AYmguXvdTxWFA
         XgsQ==
X-Gm-Message-State: AOJu0Yz8A4ZDxeoTIpo6Hvd2toJVEflKA2iyJdacDDUnK7tJlcIn9WwD
	4fEx/ZX+zE01h4AXS25+VJdtx1PhkhWWKw==
X-Google-Smtp-Source: AGHT+IGAK/V7d5DeXTjHqXV6SS/K1gN7bqlnWJdkcw226/Qe34GwuFoXgsQnDzlUSc8HR552U0Mp2g==
X-Received: by 2002:ae9:f444:0:b0:76c:707e:8fdc with SMTP id z4-20020ae9f444000000b0076c707e8fdcmr5090542qkl.6.1696018329928;
        Fri, 29 Sep 2023 13:12:09 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r25-20020a05620a03d900b00767e2668536sm7202583qkm.17.2023.09.29.13.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:12:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.15: update to v5.15.129
Date: Fri, 29 Sep 2023 16:12:02 -0400
Message-Id: <20230929201203.3516768-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929201203.3516768-1-bruce.ashfield@gmail.com>
References: <20230929201203.3516768-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188434

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    9e43368a3393 Linux 5.15.129
    d48016d74836 mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer
    1c41cd30d5cd mm: memory-failure: fix unexpected return value in soft_offline_page()
    0712721e4f4f mm: memory-failure: kill soft_offline_free_page()
    efd02b5cadd5 dma-buf/sw_sync: Avoid recursive lock during fence signal
    8dbf913520c4 pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
    f1c0402b8e22 clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
    10bc3eddc605 scsi: core: raid_class: Remove raid_component_add()
    d3d57cdbfda4 scsi: snic: Fix double free in snic_tgt_create()
    ef56cc8889be can: raw: add missing refcount for memory leak fix
    930f3f164964 drm/i915: Fix premature release of request's reusable memory
    3cb86cc565df cgroup/cpuset: Free DL BW in case can_attach() fails
    ffff4fc4bad7 sched/deadline: Create DL BW alloc, free & check overflow interface
    86aa90795979 cgroup/cpuset: Iterate only if DEADLINE tasks are present
    43d8cbfefa7c sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets
    d0eb4917f4d3 sched/cpuset: Bring back cpuset_mutex
    918879de0e23 cgroup/cpuset: Rename functions dealing with DEADLINE accounting
    78efab71a649 torture: Fix hang during kthread shutdown phase
    c8fb97dd7fe6 nfsd: use vfs setgid helper
    01966511868e nfs: use vfs setgid helper
    a7a1849899aa x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabling OSXSAVE in CR4
    ad79f943c869 x86/fpu: Invalidate FPU state correctly on exec()
    b190cf1f277a drm/display/dp: Fix the DP DSC Receiver cap size
    c8aab333d41a drm/vmwgfx: Fix shader stage validation
    b53ed415163e PCI: acpiphp: Use pci_assign_unassigned_bridge_resources() only for non-root bus
    60ba1bfa036a media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
    544cd10defa1 of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    f1d4a5881856 of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
    ce66cd478636 radix tree: remove unused variable
    898c8c5b1114 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
    ff90a4c6edf8 batman-adv: Hold rtnl lock during MTU update via netlink
    ea38c0d9aaa2 batman-adv: Fix batadv_v_ogm_aggr_send memory leak
    7f3f72eb8f5b batman-adv: Fix TT global entry leak when client roamed back
    f7667b49880a batman-adv: Do not get eth header before batadv_check_management_packet
    3f9312dd7581 batman-adv: Don't increase MTU when set by user
    cde5a240d72d batman-adv: Trigger events for auto adjusted MTU
    22426e1ce679 selinux: set next pointer before attaching to list
    711595bfdccf nfsd: Fix race to FREE_STATEID and cl_revoked
    bd1697e12230 NFS: Fix a use after free in nfs_direct_join_group()
    5f642613746e mm: add a call to flush_cache_vmap() in vmap_pfn()
    440c10034b4d ALSA: ymfpci: Fix the missing snd_card_free() call at probe error
    5cc7d81cf576 clk: Fix slab-out-of-bounds error in devm_clk_release()
    0f72859acfa2 NFSv4: Fix dropped lock for racing OPEN and delegation return
    9c025420fef2 ibmveth: Use dcbf rather than dcbfl
    7e546bd08943 Revert "KVM: x86: enable TDP MMU by default"
    67af12f5582b net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
    4451457d61e0 net/ncsi: make one oem_gma function for all mfr id
    f683f4be802b bonding: fix macvlan over alb bond support
    0fa8046e923a net: remove bond_slave_has_mac_rcu()
    f0ec97fca629 rtnetlink: Reject negative ifindexes in RTM_NEWLINK
    00247cfd2b69 rtnetlink: return ENODEV when ifname does not exist and group is given
    75cfb7de44e5 netfilter: nf_tables: fix out of memory error handling
    f22954f8c58f netfilter: nf_tables: flush pending destroy work before netlink notifier
    ff34403fef98 net/sched: fix a qdisc modification with ambiguous command request
    30624ea3f8b6 igc: Fix the typo in the PTM Control macro
    f697c3ead109 igb: Avoid starting unnecessary workqueues
    d7823d752ce1 ice: fix receive buffer size miscalculation
    ace1b0ae3097 net: validate veth and vxcan peer ifindexes
    335be585416d net: bcmgenet: Fix return value check for fixed_phy_register()
    60a5034584ea net: bgmac: Fix return value check for fixed_phy_register()
    5b52c9ba42c0 ipvlan: Fix a reference count leak warning in ipvlan_ns_exit()
    2bad37b6f675 dccp: annotate data-races in dccp_poll()
    9b015360e86f sock: annotate data-races around prot->memory_pressure
    c52c6c0223e1 octeontx2-af: SDP: fix receive link config
    ce6e2b14bc09 tracing: Fix memleak due to race between current_tracer and trace
    ef748360ba91 tracing: Fix cpu buffers unavailable due to 'record_disabled' missed
    fdf5804d7475 can: raw: fix lockdep issue in raw_release()
    278fccf587dd drm/amd/display: check TG is non-null before checking if enabled
    a955e6a0e39d drm/amd/display: do not wait for mpc idle if tg is disabled
    e0bd4f0c60b4 can: raw: fix receiver memory leak
    b832174b7f89 jbd2: fix a race when checking checkpoint buffer busy
    9c31bb2684f8 jbd2: remove journal_clean_one_cp_list()
    d91783e6864a jbd2: remove t_checkpoint_io_list
    a0ab49e7a758 ALSA: pcm: Fix potential data race at PCM memory allocation helpers
    2e56d380daa9 fbdev: fix potential OOB read in fast_imageblit()
    14163f4a4fa6 fbdev: Fix sys_imageblit() for arbitrary image widths
    5b60bd9081a9 fbdev: Improve performance of sys_imageblit()
    166f0bf4560b MIPS: cpu-features: Use boot_cpu_type for CPU type based features
    8f106e97409d MIPS: cpu-features: Enable octeon_cache by cpu_type
    d1d0b239f974 fs: dlm: fix mismatch of plock results from userspace
    77d334c44681 fs: dlm: use dlm_plock_info for do_unlock_close
    f9a33cc7d946 fs: dlm: change plock interrupted message to debug again
    7ac088841ffb fs: dlm: add pid to debug log
    df9c842ab0a4 dlm: replace usage of found with dedicated list iterator variable
    33e9c610e337 dlm: improve plock logging if interrupted
    d9ce077f8b1f PCI: acpiphp: Reassign resources on bridge if necessary
    8cc8645dd3e1 xprtrdma: Remap Receive buffers after a reconnect
    91a707507e83 NFSv4: fix out path in __nfs4_get_acl_uncached
    323b830eebd1 NFSv4.2: fix error handling in nfs42_proc_getxattr
    5de0a325c45e objtool/x86: Fix SRSO mess

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index aac789f1f6..acac15d2e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6035f480ffca194cd0565a718d73ea675c0ff20a"
-SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
+SRCREV_machine ?= "821659458e4746c3f4fa690a8744cd23efa8a666"
+SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.128"
+LINUX_VERSION ?= "5.15.129"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c2b14290d3..cc8e6ee393 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.128"
+LINUX_VERSION ?= "5.15.129"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9617ac269548314043e14de79f663e6d805a534a"
-SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
+SRCREV_machine ?= "bbc3bff691a772d78872031baa1ef2d90506fdfb"
+SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 17faabd65b..10277b9d1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4a0228c3af6ce6776b3b8d63422cbdfe42794f08"
-SRCREV_machine:qemuarm64 ?= "9bf77a387c75c5b40a93bd1c252fa2f8057ec35b"
-SRCREV_machine:qemumips ?= "747b0a4f90c11f9225623c4147d783eacc817236"
-SRCREV_machine:qemuppc ?= "997cb3bb3f0ac601c062e6c206c4fbff158cab16"
-SRCREV_machine:qemuriscv64 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
-SRCREV_machine:qemuriscv32 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
-SRCREV_machine:qemux86 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
-SRCREV_machine:qemux86-64 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
-SRCREV_machine:qemumips64 ?= "8ea0652d340b59490387640bbb57669be5f8b47c"
-SRCREV_machine ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
-SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
+SRCREV_machine:qemuarm ?= "d121a9301bef475d9619285e71d18809020221ef"
+SRCREV_machine:qemuarm64 ?= "8af42265e53233f47b1d9a6a9722e06e624d5fb2"
+SRCREV_machine:qemumips ?= "08bcb48e4efd9c46079b2274b7d038763dafe550"
+SRCREV_machine:qemuppc ?= "24d636e08d3c92b47b4c398cad7a50ebb61acb28"
+SRCREV_machine:qemuriscv64 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
+SRCREV_machine:qemuriscv32 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
+SRCREV_machine:qemux86 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
+SRCREV_machine:qemux86-64 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
+SRCREV_machine:qemumips64 ?= "4c41aa28a3b367a568f005d7ce35ef7c7f314bfd"
+SRCREV_machine ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
+SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5ddfe5cc87167343bd4c17f776de7b7aa1475b0c"
+SRCREV_machine:class-devupstream ?= "8f790700c974345ab78054e109beddd84539f319"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.128"
+LINUX_VERSION ?= "5.15.129"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


