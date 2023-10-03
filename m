Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E97E8FDAF
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:11 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.117.1696361829010432182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tIWSEfH/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3af6cd01323so843446b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361828; x=1696966628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRaLhr9N/BFiByRcH1ePFhflMX1YlqsyfzCunBSAJ/Q=;
        b=tIWSEfH/ll1OC+vF7G2kHje+ltU22iXSyRLyimcg74LVa4PRClChPXY4dKX77n5ucQ
         KVyJw7DXEy2YE9Da8YlvTMpiopo9C01w9Gl3+6+zuZCsK31Yf9sa6ArBUA+tx65NFo5m
         60/Jf+Y21VlEdeSqK97O/rCWrkE5OvW5MGSm9YjVBdki3OzPbgjkPzbeACGK9U5/veOp
         HnEaCZxhYOPni3YX3OJFvqins8ty4aYtDc6Cc7nkGaiWu6lChvWNvHm0vj4bPTJGhZOe
         RmHO83HzXXTFKSAfkCc9R/ps7b5F8m8azUIJRMEn9dgTEJHLzl3EjcPn7SdAA7FYRtkd
         NMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361828; x=1696966628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRaLhr9N/BFiByRcH1ePFhflMX1YlqsyfzCunBSAJ/Q=;
        b=Y84WiASHYbwfQ8Eh3ZzlHooQhjnqwdHPzRCeqSsj4fa5+jGvE1qJEpyjiqz2eQBHbd
         tILUxAmYLeziPISlRbHWSC3eJalJPLjbrjleuulLrvHE3PlFsS7tjj0+QfQim6e2D7KA
         +NFUhhz1qS4D/HcZW1NySuJVi3GqGvbIhUwTRqRpkfrYDvFnxYLRMQMd6TcZpoOFY6eU
         tjo0jB5iwmw1UtvOTq5CUkzbasc9TQ3RMWPVD6KdnobH2A2WLy1XOL0UJB47zmL0BTIH
         UZu/7M+LiX7vrKJzYR6x7izbcSckr8s3ZywitG/iYeKO7PZRgSoMyNt+cElPSIl0eIvb
         75nQ==
X-Gm-Message-State: AOJu0YwEGxIAB4igmifUt7dfOwtv2MIesfjgH6N47qajjbgtd7L3XeVr
	Giw5EWCCOaySPBkz5QlGqAqtJve+P/CinykV7Fw=
X-Google-Smtp-Source: AGHT+IHOBjQZcS77VCAvFbDuh7EHQPJa8teIXUKEJ7oaBHJsz1ySMzs3dtmms+aSWNbDI5A+GL5UYQ==
X-Received: by 2002:a05:6808:29a:b0:3a7:39f6:3f2c with SMTP id z26-20020a056808029a00b003a739f63f2cmr435372oic.55.1696361827887;
        Tue, 03 Oct 2023 12:37:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] linux-yocto/5.10: update to v5.10.194
Date: Tue,  3 Oct 2023 09:36:46 -1000
Message-Id: <5bdf0da0372084ca312428f4e2585833fc732e9b.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188656

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    006d5847646b Linux 5.10.194
    d93ba6e46e5f rcu-tasks: Add trc_inspect_reader() checks for exiting critical section
    3e22624f8fd3 rcu-tasks: Wait for trc_read_check_handler() IPIs
    9190c1f0aed1 rcu-tasks: Fix IPI failure handling in trc_wait_for_one_reader
    ad4f8c117b8b rcu: Prevent expedited GP from enabling tick on offline CPU
    268e92252277 Revert "MIPS: Alchemy: fix dbdma2"
    79ea9eb723b7 Revert "drm/amdgpu: install stub fence into potential unused fence pointers"
    be4ccafc077f mhi: pci_generic: Fix implicit conversion warning
    df3427204f1d ARM: module: Use module_init_layout_section() to spot init sections
    b59cfee8d8a2 arm64: module: Use module_init_layout_section() to spot init sections
    943ed7dc5ee4 arm64: module-plts: inline linux/moduleloader.h
    ecd62c85120d module: Expose module_init_layout_section()
    4566606fe3a4 Linux 5.10.193
    b3ac2c1d725b mm,hwpoison: fix printing of page flags
    7f92be110c0f ASoC: Intel: sof_sdw: include rt711.h for RT711 JD mode
    32f71ef62737 mm: memory-failure: fix unexpected return value in soft_offline_page()
    20c2db79f157 mm: memory-failure: kill soft_offline_free_page()
    406166a3acd7 mm: fix page reference leak in soft_offline_page()
    749630ce9147 mm,hwpoison: refactor get_any_page
    0df5eaab03ed dma-buf/sw_sync: Avoid recursive lock during fence signal
    7592a392b3e1 pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
    91cbf41a9d8b clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
    148a86651caf scsi: core: raid_class: Remove raid_component_add()
    5d02f4320a95 scsi: snic: Fix double free in snic_tgt_create()
    d643d3f322e8 ASoC: rt711: add two jack detection modes
    c7b26063fcae drm/i915: Fix premature release of request's reusable memory
    2d69f68ad409 cgroup/cpuset: Free DL BW in case can_attach() fails
    4603c2a104bc sched/deadline: Create DL BW alloc, free & check overflow interface
    c9546921a4b9 cgroup/cpuset: Iterate only if DEADLINE tasks are present
    5ac05ce56843 sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets
    b950133d9a73 sched/cpuset: Bring back cpuset_mutex
    312713e3eae3 cgroup/cpuset: Rename functions dealing with DEADLINE accounting
    b2125926ba66 timers/nohz: Switch to ONESHOT_STOPPED in the low-res handler when the tick is stopped
    ae4f109b954d tick: Detect and fix jiffies update stall
    c7e91047d345 torture: Fix hang during kthread shutdown phase
    4bc6a4fca1f0 x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabling OSXSAVE in CR4
    9e0c0b4ce541 drm/display/dp: Fix the DP DSC Receiver cap size
    8735d1c66c7c drm/vmwgfx: Fix shader stage validation
    ff0639b222e7 PCI: acpiphp: Use pci_assign_unassigned_bridge_resources() only for non-root bus
    da4e9eff0f1e media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
    d2540b5f5aa1 of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    851f686ed0f5 radix tree: remove unused variable
    3b9a61570bc1 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
    72e4a5a28ebf batman-adv: Hold rtnl lock during MTU update via netlink
    ee1d443eefb2 batman-adv: Fix batadv_v_ogm_aggr_send memory leak
    0c6da1d84921 batman-adv: Fix TT global entry leak when client roamed back
    6f5d10c0ac60 batman-adv: Do not get eth header before batadv_check_management_packet
    7c0959088366 batman-adv: Don't increase MTU when set by user
    480f2a129d8d batman-adv: Trigger events for auto adjusted MTU
    0dbedf9afee3 selinux: set next pointer before attaching to list
    a54c2048cd75 nfsd: Fix race to FREE_STATEID and cl_revoked
    7c262127d264 NFS: Fix a use after free in nfs_direct_join_group()
    f3c5697aae62 mm: add a call to flush_cache_vmap() in vmap_pfn()
    c9a0e31d9239 clk: Fix slab-out-of-bounds error in devm_clk_release()
    f979b92db1f5 NFSv4: Fix dropped lock for racing OPEN and delegation return
    0a809e01578b ibmveth: Use dcbf rather than dcbfl
    ffde5f9e8876 bonding: fix macvlan over alb bond support
    615ea2603dc8 net: remove bond_slave_has_mac_rcu()
    c8e1e17dee53 rtnetlink: Reject negative ifindexes in RTM_NEWLINK
    7b79dabd639c rtnetlink: return ENODEV when ifname does not exist and group is given
    d64cdb9cb629 netfilter: nf_tables: fix out of memory error handling
    5db1249c70b1 net/sched: fix a qdisc modification with ambiguous command request
    3847137cd167 igb: Avoid starting unnecessary workqueues
    fa7d7a7f007b ice: fix receive buffer size miscalculation
    70dfdbba3070 net: validate veth and vxcan peer ifindexes
    67c8d7ef54df net: bcmgenet: Fix return value check for fixed_phy_register()
    92b20b1569eb net: bgmac: Fix return value check for fixed_phy_register()
    0b39e3070a00 ipvlan: Fix a reference count leak warning in ipvlan_ns_exit()
    8162b73eef40 dccp: annotate data-races in dccp_poll()
    403cc3e6253d sock: annotate data-races around prot->memory_pressure
    005b6572d039 octeontx2-af: SDP: fix receive link config
    b8205dfed681 tracing: Fix memleak due to race between current_tracer and trace
    9c2ceffd4e36 tracing: Fix cpu buffers unavailable due to 'record_disabled' missed
    0498107394d4 rbd: prevent busy loop when requesting exclusive lock
    5f1697523367 rbd: retrieve and check lock owner twice before blocklisting
    2547026bb8c4 rbd: make get_lock_owner_info() return a single locker or NULL
    145248ebe0b2 libceph, rbd: ignore addr->type while comparing in some cases
    61c303cfb135 drm/amd/display: check TG is non-null before checking if enabled
    b964eb37c020 drm/amd/display: do not wait for mpc idle if tg is disabled
    7e11c58b2620 ALSA: pcm: Fix potential data race at PCM memory allocation helpers
    8c3a4c3b6485 dm integrity: reduce vmalloc space footprint on 32-bit architectures
    4fdfd3d2f09a dm integrity: increase RECALC_SECTORS to improve recalculate speed
    570f52137e9a fbdev: fix potential OOB read in fast_imageblit()
    31131cce2455 fbdev: Fix sys_imageblit() for arbitrary image widths
    209a84a14c0c fbdev: Improve performance of sys_imageblit()
    188edaaaad21 MIPS: cpu-features: Use boot_cpu_type for CPU type based features
    61913b303b31 MIPS: cpu-features: Enable octeon_cache by cpu_type
    bda55fb5ca61 fs: dlm: fix mismatch of plock results from userspace
    c3a1c4d996bf fs: dlm: use dlm_plock_info for do_unlock_close
    d503919895d8 fs: dlm: change plock interrupted message to debug again
    1652bcbf9e71 fs: dlm: add pid to debug log
    e850cd32df9f dlm: replace usage of found with dedicated list iterator variable
    7b44c1f383a1 dlm: improve plock logging if interrupted
    cd689b59129f PCI: acpiphp: Reassign resources on bridge if necessary
    e82757215295 xprtrdma: Remap Receive buffers after a reconnect
    8a64aadc29ba NFSv4: fix out path in __nfs4_get_acl_uncached
    c6aecc29d29e objtool/x86: Fix SRSO mess

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 +++---
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index eb10643530..8736873d65 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b56fef81989515b6107c389373158235efa26138"
-SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
+SRCREV_machine ?= "d68870980bca82eec6f5040ccb404717c0cac622"
+SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.192"
+LINUX_VERSION ?= "5.10.194"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 255a79288a..4ee674f35e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.192"
+LINUX_VERSION ?= "5.10.194"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "31f6d39bde4a241280ff357f0f052e56af1332e8"
 SRCREV_machine ?= "a9ebc91a4f1376324425811eee0a6628553d7d6e"
-SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
+SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e37c4c21e0..e4d7443df2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6d1f4e2827227663603efe419dc601860608862b"
+SRCREV_machine:qemuarm ?= "bd08a530f711f7b511d70fc142169ceed446cfdb"
 SRCREV_machine:qemuarm64 ?= "8edb39e7f3399ef6f97a416069777d0230ad68bc"
-SRCREV_machine:qemumips ?= "c37227bf802d3c489639a031f1cd8ee9e51ba044"
+SRCREV_machine:qemumips ?= "582345c4ecdf0ba60551d25aa87656c2a039ad55"
 SRCREV_machine:qemuppc ?= "f00b3a49bc6e9ca12497cf50080c391e59696d06"
-SRCREV_machine:qemuriscv64 ?= "11b247211e00c610587b27a762e4814f56723958"
-SRCREV_machine:qemuriscv32 ?= "11b247211e00c610587b27a762e4814f56723958"
-SRCREV_machine:qemux86 ?= "11b247211e00c610587b27a762e4814f56723958"
-SRCREV_machine:qemux86-64 ?= "11b247211e00c610587b27a762e4814f56723958"
-SRCREV_machine:qemumips64 ?= "0c17abc2a99b68c19099df5b61653729f6d17f76"
-SRCREV_machine ?= "11b247211e00c610587b27a762e4814f56723958"
-SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
+SRCREV_machine:qemuriscv64 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
+SRCREV_machine:qemuriscv32 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
+SRCREV_machine:qemux86 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
+SRCREV_machine:qemux86-64 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
+SRCREV_machine:qemumips64 ?= "5b4830e32f3bd6fd82e93f60bf2e5da462419d31"
+SRCREV_machine ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
+SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.192"
+LINUX_VERSION ?= "5.10.194"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


