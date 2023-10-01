Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64185E748F6
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:35 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.62424.1696176033546171582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cazcshu+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-577fb90bb76so8627090a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176032; x=1696780832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOaGqPYDqTZDK12hNPHEj2+VwqJmuYQ3lYI1KgVWfEM=;
        b=cazcshu+kLkcDV3r/4Crd1AkEl/iWV820HPnBM6RYXqMd+utcOE8EQzIeCqo9BmVTG
         3VTLzyouZoH8IRE0/RqqXpiJKhcVyOHSX5/Dj5XpU7xXZfT+lGcL9hiMnJCTuoh7yfRm
         xt9XSC6tucCx1ZdUXnIcT3y5+WRq+Zm+Fh/gbOqGcDouSRYLuncYJkV8q9rVFPCf8Fa5
         MtevxwWEbsOA+HroK7+TPq0UvZ0Aejn4vWotcie6DmQJUBFqoHQdaSVyJZB3r2S5IMJy
         VUP/7m3/KJ9hYrQJXZEpZeyuHhpPckd4SHAa1+kv36ZIlXu6nKcawVPgTvF8EPgsvc/r
         cKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176032; x=1696780832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOaGqPYDqTZDK12hNPHEj2+VwqJmuYQ3lYI1KgVWfEM=;
        b=nH8QBRDwPFV+ZvnM2M9gdtY7Tsb6R6xqswBR3khH7PfNmUluzM32j5wmE7X4Ef/O01
         fPQ3EpLHL/YhDiJhCPZwW6OXO0F+pREwHw0Z4L6wLREc/woZIdBrtwN+E88JWuBi6kut
         y9RejUdLEY/zxELYnswQU4oerjLqIaxnV9EzYijejk7pm9ukqANNQPS/GRwCz4XYNg/s
         Ol1MHAl0ccCpMTz59lBccJI/3Nb0mZY3kn23bycni79GKqy3kQUAzV89wxZ3y48cNCvX
         v3O0cOkEh07GiicFUVvGFXC0VOMCNKWqF49MeMl7BqS/JHiUDvbVWJDAlWH3jm6LD6S+
         0NJw==
X-Gm-Message-State: AOJu0YxQGdT940EzKCr5lPUuZZOx0JGIzJVHh1vNqZN/T/IjPcX6rpzg
	FChxt4yZqEHbjs+hnNM2OxoZUUuzSi2ZvH9vZDB+qQ==
X-Google-Smtp-Source: AGHT+IG3L2KkPWc1w9yaTn9QqVjbJIsSMfQZJNe4t1VFXLAmzA/zafp9Bj0RUeYahQHPwV2a1qoOfw==
X-Received: by 2002:a05:6a21:2702:b0:152:e902:8aa with SMTP id rm2-20020a056a21270200b00152e90208aamr6826002pzb.34.1696176032325;
        Sun, 01 Oct 2023 09:00:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/23] linux-yocto/5.15: update to v5.15.129
Date: Sun,  1 Oct 2023 05:59:55 -1000
Message-Id: <aeddbeb2a3c82fe7ed639bfcca3bff3998e31f7a.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188497

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


