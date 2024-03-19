Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D68CD11DB
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:58 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.30639.1710889308851659454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oy1TwMJk;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ddf26eba3cso4287757a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889308; x=1711494108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mPTClJodLaOFSJHyRKt9NUElhPpl/xkDvJQikFdE5g=;
        b=Oy1TwMJkeZew6HaGg3XmHNxh+PdzJMBbkva42Ecg5DDELSLKPL0GoCYf5t/i2b1d/q
         ZklJ7Bwe2e5m69JViHQ9hbQfFrg/1L5JEH7eR1Jx4rFsLYOpuNBC0E1nL/MEH+vnQPZe
         w/2OdoNk9gmxPC5yDRtphhnaCBUEc7rYaQsXMkeMjM5wUgTkqdDCrJKAobPl/uwDnOqY
         bj829Bq+wOnORuDUQJAMXA0CjsbKpq5Br3A+HhPVrL6vIrdvGBPtEiDak7vb5u2TZCMm
         +usAw9io5Wjf8BcCv6/S0CksbW/nJvq2QrusFGT82+NqW77nYJU1YCXAEBlRL6V84962
         CKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889308; x=1711494108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mPTClJodLaOFSJHyRKt9NUElhPpl/xkDvJQikFdE5g=;
        b=H+lHXQ0FbL6jvVkAnA8aZGo20QdT5duUt1jxLy23xoOsa5PKmnELn5w8w/XYJRT1gE
         sz6i3NhzbZ4eYttcOH9dZKXOy65flVqPIqQ6BweXGbW6Hz2zIO227l+PvBfvNUP9xHbv
         8yPnnnGwfO36W3u4Irl2l7MINFKgHFUzR8eYKnqlbOLQws6ZcWNeSzUQtn2g2p3duhUp
         zaggGuKH+SX8EPTrGV2W+Ydi7EfposL8NKqPhJ19+Dv8vnzOu9P/5ormUB+EbJ1RogS8
         s7ElnBinqYit7mFKhxhnzMYO1vGoL8Jt4bpsPF7Xc57p8au8881JwATam4/XnOYlhfqV
         9Rfg==
X-Gm-Message-State: AOJu0YzSfJRnSjDfM+okSux58F1FrVMdp/KWp6o4WNyBCyUjPTSm8Qw8
	ZRaK3Fy3o8SzMg0iBeiXjyzNeBookpaI/siJLFckZx0sg5sBuMmu4KXQyY0z
X-Google-Smtp-Source: AGHT+IEIcKvGstYPNWPDg4Q/VukXXgDBPrmGaAvr2XPqstuQ8IerpgobaMxwRRBGMUkJcxJQlIDOfg==
X-Received: by 2002:a9d:7c87:0:b0:6e6:a810:b365 with SMTP id q7-20020a9d7c87000000b006e6a810b365mr1046620otn.37.1710889307633;
        Tue, 19 Mar 2024 16:01:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/6.6: update to v6.6.22
Date: Tue, 19 Mar 2024 19:01:31 -0400
Message-Id: <0cbd936cf6b6040b39f00b4463667532879f24c0.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197343

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    06644f0d7193 drm/tilcdc: Set preferred depth
    6a646d9fe8a2 Linux 6.6.22
    4a5b5bfea063 KVM/x86: Export RFDS_NO and RFDS_CLEAR to guests
    77018fb9efe5 x86/rfds: Mitigate Register File Data Sampling (RFDS)
    ddfd38558acc Documentation/hw-vuln: Add documentation for RFDS
    c35ca0968de4 x86/mmio: Disable KVM mitigation when X86_FEATURE_CLEAR_CPU_BUF is set
    e2ee3c628a6f selftests: mptcp: decrease BW in simult flows
    de5c36abf708 readahead: avoid multiple marked readahead pages
    f5572c0323cf KVM: s390: vsie: fix race during shadow creation
    99b86c9b07a3 KVM: s390: add stat counter for shadow gmap events
    995f802abff2 net: pds_core: Fix possible double free in error handling path
    34cab94f7473 netrom: Fix data-races around sysctl_net_busy_read
    db364859ce68 netrom: Fix a data-race around sysctl_netrom_link_fails_count
    d732b8325132 netrom: Fix a data-race around sysctl_netrom_routing_control
    2309b369fae2 netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    db006d7edbf0 netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    4ccad39009e7 netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    7d56ffc51ebd netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    fa3f3ab5c399 netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    5d5c14efc987 netrom: Fix a data-race around sysctl_netrom_transport_timeout
    5731369af2de netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    7e1e25891f09 netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    7510b08c5f5b netrom: Fix a data-race around sysctl_netrom_default_path_quality
    b3b87525b545 erofs: apply proper VMA alignment for memory mapped files on THP
    014a807f1cc9 netfilter: nf_conntrack_h323: Add protection for bmp length out of range
    b7f885cc7029 netfilter: nft_ct: fix l3num expectations with inet pseudo family
    2b505d052807 net/rds: fix WARNING in rds_conn_connect_if_down
    782c5fa6638f net: dsa: microchip: fix register write order in ksz8_ind_write8()
    f562e4c4aab0 cpumap: Zero-initialise xdp_rxq_info struct before running XDP program
    02e3549492db selftests/bpf: Fix up xdp bonding test wrt feature flags
    586a2f410c78 xdp, bonding: Fix feature flags when there are no slave devs anymore
    ff4d6006870f bpf: check bpf_func_state->callback_depth when pruning states
    ed883060c387 net/ipv6: avoid possible UAF in ip6_route_mpath_notify()
    8df393af9e7e igc: avoid returning frame twice in XDP_REDIRECT
    1a770927dc1d net: ice: Fix potential NULL pointer dereference in ice_bridge_setlink()
    671a28603c6b ice: virtchnl: stop pretending to support RSS over AQ or registers
    e83bebb718fd net: sparx5: Fix use after free inside sparx5_del_mact_entry
    0ece581d2a66 geneve: make sure to pull inner header in geneve_rx()
    24d5a89652c9 tracing/net_sched: Fix tracepoints that save qdisc_dev() as a string
    d98d364d98d1 net/mlx5e: Switch to using _bh variant of of spinlock API in port timestamping NAPI poll context
    d1f71615dbb3 net/mlx5e: Use a memory barrier to enforce PTP WQ xmit submission tracking occurs after populating the metadata_map
    b526c3177531 net/mlx5e: Fix MACsec state loss upon state update in offload path
    6d6bb522d74b net/mlx5e: Change the warning when ignore_flow_level is not supported
    c11138f0172f net/mlx5: Check capability for fw_reset
    c8d7228ddda7 net/mlx5: E-switch, Change flow rule destination checking
    ba888f1f5c21 Revert "net/mlx5e: Check the number of elements before walk TC rhashtable"
    3fba8eab2cfc Revert "net/mlx5: Block entering switchdev mode with ns inconsistency"
    4c0b028e7100 ice: reorder disabling IRQ and NAPI in ice_qp_dis
    484c8e3beb0f i40e: disable NAPI right after disabling irqs when handling xsk_pool
    2e60e9531ab9 ixgbe: {dis, en}able irqs in ixgbe_txrx_ring_{dis, en}able
    550fe716031f net: lan78xx: fix runtime PM count underflow on link stop
    f6edcad58cea xfrm: Pass UDP encapsulation in TX packet offload
    d6159bd4c005 mm/vmscan: fix a bug calling wakeup_kswapd() with a wrong zone index
    641eb2d9ab1e ceph: switch to corrected encoding of max_xattr_size in mdsmap
    3b897ea5ee75 dmaengine: fsl-edma: correct max_segment_size setting
    525c13971479 dmaengine: fsl-edma: utilize common dt-binding header file
    fb2f43ed48dd dt-bindings: dma: fsl-edma: Add fsl-edma.h to prevent hardcoding in dts
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
index f22ee2bf21..acafe60e46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4b52adc4ca90b93e65eded97537f844bb3f86621"
-SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
+SRCREV_machine ?= "1c3234ba160c59eb50739f23591a87daf09fac35"
+SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.21"
+LINUX_VERSION ?= "6.6.22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 4a129d157d..4a87482f20 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.21"
+LINUX_VERSION ?= "6.6.22"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
+SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index e1e97ff702..01ecc36c81 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f2dec0d9cb5fec1bd3f6def918c679d7f7a940b3"
-SRCREV_machine:qemuarm64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemuloongarch64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemumips ?= "805c2ac2a30fe9e61d9d58d19654fe29d43df922"
-SRCREV_machine:qemuppc ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemuriscv64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemuriscv32 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemux86 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemux86-64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_machine:qemumips64 ?= "96d26749df27806f3f4b3e75993407846194b83f"
-SRCREV_machine ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
-SRCREV_meta ?= "cc42f74d7d099826d46d3b310fda9c0c7bbb1477"
+SRCREV_machine:qemuarm ?= "0873b6f725956acf2e6d57d720edd8a2177e18ce"
+SRCREV_machine:qemuarm64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemuloongarch64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemumips ?= "6a81581711b1cb35046c637ecfbb6b17a8abbcb5"
+SRCREV_machine:qemuppc ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemuriscv64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemuriscv32 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemux86 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemux86-64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_machine:qemumips64 ?= "6cb075269e42d03857c95ebc8b5f8e154f155add"
+SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
+SRCREV_meta ?= "6a24861d6504575a4a9f92366285332d47c7e111"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "62e5ae5007ef14cf9b12da6520d50fe90079d8d4"
+SRCREV_machine:class-devupstream ?= "6a646d9fe8a2bf8d25817ceddf96dfc5eb5446db"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.21"
+LINUX_VERSION ?= "6.6.22"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


