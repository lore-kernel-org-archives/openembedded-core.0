Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC6C41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.4328.1714705222237340237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXBC3qVI;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6a073f10e8eso39575536d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705221; x=1715310021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uWRmq+L2AKXnzKLZimi7bPoU8Wa0CpHm1RLUpNSwvg=;
        b=UXBC3qVIuB1XknBjLtKxlZAq1H+ph7l+HJt2hC4l0SwJapM0vBRt+v3jtdnXt4N+kU
         DnDqHkpruC7jVLHF4MA1WTZSSe5rw8Rc2mLC4+TP/VMWK6dmE4UZ0FE7huCNyaTPS3io
         i84B0btufN1yq6EyTraKuRFjcSmJw4cfSxax7S5DxbjxirBRK+wzun3Ch8uQO47jkdkE
         2WWcH37h/vLBBpt+RNdLAfZV0kBPVagNwPLlpULtci7uXdOLPHiibivU3G+p0LjGap3K
         eB+W7a9v1EnzT+dRCq7JBXByZRu20xg5WOi+EuEXVvLCexBFRd0uQLn+0gIBWwD2IhUM
         LteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705221; x=1715310021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uWRmq+L2AKXnzKLZimi7bPoU8Wa0CpHm1RLUpNSwvg=;
        b=R/AZAxH/IHOKcAr6pmCtmFArc1oBwkEYHkn9elskAg9OuvF0WBW0l1cZmde0LmLQt7
         krUsmBHeUrbOyeLzLBGRkGXfV3kBcaIt2qWDq1rWWIEPWUZYLOYBG3l5z7SWyQoOQM7l
         YBGE2FfRZD7sdJSqFEujYTLpIX60mBwkQU0Zq9yMjZo+dzuFY3FyU2oVZAoSSk7kanEe
         D/Ck7ypbYpuSe397MAM+ijqJcTpUdFcDJwmPoN+G5fOabvM7r9lfgbzr5ML6dy2ha3Ke
         TDFKqvBOSVCer3sNJC1/UQd96SDRZfOXcx0NR4YtJMV9X0mwGDWgXnUKQQtJC1DNwGMu
         ncVA==
X-Gm-Message-State: AOJu0YyokZW1CNK510ARWIBIgEQboiwqBhi1UZbBgpS3YvvAVuGIwB7K
	yjbH441bBawIS3nUmkGInrq9fBCWUCI7Bprn/YQl+DhTUsEJqBd9+2gb6w==
X-Google-Smtp-Source: AGHT+IGX9TIPi3xp891Qr2tlN+Vck0y/E8SQabggLrDr5xr1H3YpUu2NourVuIwaXEkqbyq4Qp0dwA==
X-Received: by 2002:a05:6214:e69:b0:6a0:cd65:5996 with SMTP id jz9-20020a0562140e6900b006a0cd655996mr1603928qvb.8.1714705220807;
        Thu, 02 May 2024 20:00:20 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/10] linux-yocto/6.1: update to v6.1.82
Date: Thu,  2 May 2024 23:00:09 -0400
Message-Id: <20240503030015.374078-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198959

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    d7543167affd Linux 6.1.82
    cf4b8c39b9a0 fs/proc: do_task_stat: use sig->stats_lock to gather the threads/children stats
    d95ef75162f4 fs/proc: do_task_stat: use __for_each_thread()
    9793a3bb531c getrusage: use sig->stats_lock rather than lock_task_sighand()
    2a304d8c922f getrusage: use __for_each_thread()
    d9fe6ef24576 getrusage: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    eba76e4808c9 getrusage: add the "signal_struct *sig" local variable
    01d992088dce drm/amd/display: Fix MST Null Ptr for RV
    f0b6dc034e17 drm/amd/display: Wrong colorimetry workaround
    92cdc9d71ab0 selftests: mptcp: decrease BW in simult flows
    b2e92ab17e44 KVM/x86: Export RFDS_NO and RFDS_CLEAR to guests
    d405b9c03f06 x86/rfds: Mitigate Register File Data Sampling (RFDS)
    29476fac750d Documentation/hw-vuln: Add documentation for RFDS
    8b5760939db9 x86/mmio: Disable KVM mitigation when X86_FEATURE_CLEAR_CPU_BUF is set
    a28f4d1e0bed drm/amdgpu: Reset IH OVERFLOW_CLEAR bit
    2e3ec80ea7ba xhci: handle isoc Babble and Buffer Overrun events properly
    9158ea9395c1 xhci: process isoc TD properly when there was a transaction error mid TD.
    a584c7734a4d selftests: mm: fix map_hugetlb failure on 64K page size systems
    02e16a41e543 selftests/mm: switch to bash from sh
    f0c349708290 readahead: avoid multiple marked readahead pages
    b0b89b470a86 nfp: flower: add hardware offload check for post ct entry
    4e2f0cae0bfe nfp: flower: add goto_chain_index for ct entry
    66d663da8654 drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
    35a0d43cee09 ASoC: codecs: wcd938x: fix headphones volume controls
    5df3b81a567e KVM: s390: vsie: fix race during shadow creation
    51c4435688eb KVM: s390: add stat counter for shadow gmap events
    43464808669b netrom: Fix data-races around sysctl_net_busy_read
    cfedde3058bf netrom: Fix a data-race around sysctl_netrom_link_fails_count
    4c02b9ccbb11 netrom: Fix a data-race around sysctl_netrom_routing_control
    498f1d6da11e netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    46803b776d86 netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    5ac337138272 netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    5deaef2bf564 netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    d28fa5f0e6c1 netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    fed835d41576 netrom: Fix a data-race around sysctl_netrom_transport_timeout
    a47d68d777b4 netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    e439607291c0 netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    dec82a8fc45c netrom: Fix a data-race around sysctl_netrom_default_path_quality
    6e49f3ac43e2 erofs: apply proper VMA alignment for memory mapped files on THP
    39001e3c4200 netfilter: nf_conntrack_h323: Add protection for bmp length out of range
    bce83144ba7e netfilter: nft_ct: fix l3num expectations with inet pseudo family
    998fd719e6d6 net/rds: fix WARNING in rds_conn_connect_if_down
    7faff12e828d net: dsa: microchip: fix register write order in ksz8_ind_write8()
    3420b3ff1ff4 cpumap: Zero-initialise xdp_rxq_info struct before running XDP program
    394334fe2ae3 net/ipv6: avoid possible UAF in ip6_route_mpath_notify()
    63a3c1f3c9ec igc: avoid returning frame twice in XDP_REDIRECT
    afdd29726a6d net: ice: Fix potential NULL pointer dereference in ice_bridge_setlink()
    6293ff942e9c ice: virtchnl: stop pretending to support RSS over AQ or registers
    0de693d68b0a net: sparx5: Fix use after free inside sparx5_del_mact_entry
    c0b22568a9d8 geneve: make sure to pull inner header in geneve_rx()
    44faf8a48294 tracing/net_sched: Fix tracepoints that save qdisc_dev() as a string
    5822c02707da ice: reorder disabling IRQ and NAPI in ice_qp_dis
    8e23edc54a5c i40e: disable NAPI right after disabling irqs when handling xsk_pool
    6632e19acbdc ixgbe: {dis, en}able irqs in ixgbe_txrx_ring_{dis, en}able
    ea2a1052f23c net: lan78xx: fix runtime PM count underflow on link stop
    850bb481890f ceph: switch to corrected encoding of max_xattr_size in mdsmap
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index cd9deafb8d..cb091a7d79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5c94f8a3f0df3075a8b7883ef7675a3ac9bf5e58"
-SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
+SRCREV_machine ?= "ff8fd5f68aadf01de61a8a17d3f7fc69ea873801"
+SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.81"
+LINUX_VERSION ?= "6.1.82"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index faf26e56e8..04cff23ecb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.81"
+LINUX_VERSION ?= "6.1.82"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
+SRCREV_machine ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 36d9d2041e..ce0bd71dd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fd979501e96642c64fa1cc9c81713f4ec098a5c7"
-SRCREV_machine:qemuarm64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemuloongarch64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemumips ?= "217690aa1afe0b40d10f05cc96826a264fa5f0ac"
-SRCREV_machine:qemuppc ?= "df23dc9de645adb30b9df6d7c26f3245aa6a1716"
-SRCREV_machine:qemuriscv64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemuriscv32 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemux86 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemux86-64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_machine:qemumips64 ?= "7c8d52cdd913121fc0b5f1c9393b49ef680931de"
-SRCREV_machine ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
-SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
+SRCREV_machine:qemuarm ?= "a07afa502355c7653fb9999345c25f86cd7c244b"
+SRCREV_machine:qemuarm64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemuloongarch64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemumips ?= "e66e81887065c1501243b6dc862e3cea58f668b0"
+SRCREV_machine:qemuppc ?= "31d1b4e1c6954491122fa3040a5e1a3017ae1462"
+SRCREV_machine:qemuriscv64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemuriscv32 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemux86 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemux86-64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_machine:qemumips64 ?= "34db6af2816a2a565d34e21135a2498e7723df07"
+SRCREV_machine ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
+SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "61adba85cc40287232a539e607164f273260e0fe"
+SRCREV_machine:class-devupstream ?= "d7543167affd372819a94879b8b1e8b9b12547d9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.81"
+LINUX_VERSION ?= "6.1.82"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


