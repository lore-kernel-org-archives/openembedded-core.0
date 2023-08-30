Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE6C83F1A
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:00 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.1294.1693417732178663287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=28fN6INe;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.50, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1bbb4bde76dso3880849fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417731; x=1694022531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlnqS31r/qLe3amoekf5oWwH1DKsYEssXyAEEm/nkfE=;
        b=28fN6INe+TXMqNDCvMkOosRoFwR8bjYCXsbuBoAEdJl9dROsCC6oJXCi8OG1UFo272
         fZqkFipE3QIvwyhmOaC/2v+wxeN75S1nRpMswY5Gig9qHDsXp+srXpLRcOi7iQIMBdTg
         3ItOfBdnh/DECkXzyRYDeL411aebq/q1bjVM8D/mpIujFsbSEMEzgah1TwOEDTDescCL
         71lX5bin5gTcYT5x2pkqDJf9EUXVEU0xSPuKhA1BfEm04xa26H2/SLF6XhlWmI5zcEUk
         xLNC6crlFGl1RC6a8onR9WpQ5MjGtWH4W92Zg781cCRRVv5QBeRUi+zY8D5QIV8uOjky
         DKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417731; x=1694022531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlnqS31r/qLe3amoekf5oWwH1DKsYEssXyAEEm/nkfE=;
        b=kA6aa+rqoygodQMUWPH6G7GkTLFE/dUn0HvEErABp2Rv0Z5EgNVJbqQaDCSL+S+Zy9
         4m1WJUzvKhqzypr4P/LLM/22ORXqfgxJSnuYtkNTPCPO7pGilh7E1D6f+PvJZty/ZjeO
         Y0DXtk2HIzWuN3Ba71XVtO8bPtKRuPM/fR4XTtoUb9p6/c6v6MGci7iLSRzliWoXd4jc
         fNmbI8wJ1tMFTdsRUpk1UVPwsgDLqvGtyCv/01DtBQ3aJH9cWnOx0mKvLOU3O3vglPNu
         QwFfQxPt00Sbjbo3HtIqnfSVsB2GzPfAtNQ2pNtYv24vnBVy14fNVvAUtuBNwc6/KFsp
         KWHg==
X-Gm-Message-State: AOJu0Yys1vgs3XnM7LEUF4kwY5KKTFzCVRDZRgFKCCXX/S++Sl8OEwM7
	729UVgIZZr3OVj5tTVt4fmSK01gOifC7FISe/fM=
X-Google-Smtp-Source: AGHT+IEM74GToSG8KqFFoySelbHULMcB5iJ0I2OnnHg3m2dJvAJnoHOqCzLOzQG2HsMlnRZVBjytzg==
X-Received: by 2002:a05:6870:9607:b0:1b7:4a32:4ac6 with SMTP id d7-20020a056870960700b001b74a324ac6mr3379506oaq.31.1693417730973;
        Wed, 30 Aug 2023 10:48:50 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/20] linux-yocto/6.1: update to v6.1.45
Date: Wed, 30 Aug 2023 07:48:13 -1000
Message-Id: <4a7b992e07e9b0d35647df09c0faba7f691e984c.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186911

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    1321ab403b38 Linux 6.1.45
    f2615bb47be4 x86/CPU/AMD: Do not leak quotient data after a division by 0
    673cdde74fd1 Revert "drm/i915: Disable DC states for all commits"
    af7215182417 drm/amdgpu: Use apt name for FW reserved region
    3d0a34c42f0d drm/amdgpu: Remove unnecessary domain argument
    526defeec474 drm/amdgpu: add vram reservation based on vram_usagebyfirmware_v2_2
    99255a2b6849 arm64/ptrace: Don't enable SVE when setting streaming SVE
    c2fdf827f8fc exfat: check if filename entries exceeds max filename length
    e2fb24ce37ca f2fs: don't reset unchangable mount option in f2fs_remount()
    6ba0594a81f9 f2fs: fix to set flush_merge opt and show noflush_merge
    e355972affb6 selftests/rseq: Play nice with binaries statically linked against glibc 2.35+
    56562676102e drm/amd/display: skip CLEAR_PAYLOAD_ID_TABLE if device mst_en is 0
    63eeb50fa110 drm/amd/display: Ensure that planes are in the same order
    740d4cae248a drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning
    a492b8281c36 powerpc/mm/altmap: Fix altmap boundary check
    f4b700c71802 mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
    b71c00256da4 mtd: rawnand: rockchip: Align hwecc vs. raw page helper layouts
    5a8a35b71bd3 mtd: rawnand: rockchip: fix oobfree offset and description
    6c591fce484e mtd: rawnand: omap_elm: Fix incorrect type in assignment
    88b1958fb57d io_uring: annotate offset timeout races
    a78a8bcdc26d f2fs: fix to do sanity check on direct node in truncate_dnode()
    23e72231f828 btrfs: remove BUG_ON()'s in add_new_free_space()
    56c0d76a9722 ext2: Drop fragment support
    295ef44a2aba fs: Protect reconfiguration of sb read-write from racing writes
    1bebbd9b8037 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_submit_urb
    203d58930d4a debugobjects: Recheck debug_objects_enabled before reporting
    29fac1849933 Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
    1416eebaad80 fs/sysv: Null check to prevent null-ptr-deref bug
    ccc6de4d4f34 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_load_attr_list()
    33d9490b27e5 mm: kmem: fix a NULL pointer dereference in obj_stock_flush_required()
    4968484ac8ef file: reinstate f_pos locking optimization for regular files
    7a1178a3671b bpf, cpumap: Make sure kthread is running before map update returns
    8a211e9118d5 clk: imx93: Propagate correct error in imx93_clocks_probe()
    37f6073f7db3 drm/i915/gt: Cleanup aux invalidation registers
    4db8b39418a6 drm/i915: Fix premature release of request's reusable memory
    1fdd16d89c01 drm/ttm: check null pointer before accessing when swapping
    4f03b0471ee0 open: make RESOLVE_CACHED correctly test for O_TMPFILE
    61f96da37dd4 arm64/fpsimd: Sync FPSIMD state with SVE for SME only systems
    654c1dd350c7 arm64/fpsimd: Clear SME state in the target task when setting the VL
    bae353469a28 arm64/fpsimd: Sync and zero pad FPSIMD state for streaming SVE
    b8ea2a46913b powerpc/ftrace: Create a dummy stackframe to fix stack unwind
    36dd8ca330b7 bpf: Disable preemption in bpf_event_output
    ec062367fa0c rbd: prevent busy loop when requesting exclusive lock
    98cccbd0a19a x86/hyperv: Disable IBT when hypercall page lacks ENDBR instruction
    0526119bf59e wifi: mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)
    767800fc402d net: tap_open(): set sk_uid from current_fsuid()
    b6846d7c408b net: tun_chr_open(): set sk_uid from current_fsuid()
    367fdf369dc7 arm64: dts: stratix10: fix incorrect I2C property for SCL signal
    3654ed5daf49 bpf: Disable preemption in bpf_perf_event_output
    680f4d8aec1b mtd: rawnand: meson: fix OOB available bytes for ECC
    67327cadba59 mtd: spinand: toshiba: Fix ecc_get_status
    724ce05212d0 exfat: release s_lock before calling dir_emit()
    1427a7e96fb9 exfat: use kvmalloc_array/kvfree instead of kmalloc_array/kfree
    bc41119995e4 firmware: arm_scmi: Drop OF node reference in the transport channel setup
    a062da58ed97 ceph: defer stopping mdsc delayed_work
    ad82aac732c2 USB: zaurus: Add ID for A-300/B-500/C-700
    be52667ba243 libceph: fix potential hang in ceph_osdc_notify()
    f62faadc791e scsi: storvsc: Limit max_sectors for virtual Fibre Channel devices
    645603ab5fa8 scsi: zfcp: Defer fc_rport blocking until after ADISC response
    f0618c305b41 rust: allocator: Prevent mis-aligned allocation
    cd4bdf8f98ef tcp_metrics: fix data-race in tcpm_suck_dst() vs fastopen
    e53917e7efea tcp_metrics: annotate data-races around tm->tcpm_net
    6dea95d8caff tcp_metrics: annotate data-races around tm->tcpm_vals[]
    fee608e80271 tcp_metrics: annotate data-races around tm->tcpm_lock
    4a77a0f7526c tcp_metrics: annotate data-races around tm->tcpm_stamp
    71f891a25405 tcp_metrics: fix addr_same() helper
    afac854f8221 prestera: fix fallback to previous version on same major version
    72b3aea3450e net/mlx5: fs_core: Skip the FTs in the same FS_TYPE_PRIO_CHAINS fs_prio
    1ca50e5de43a net/mlx5: fs_core: Make find_closest_ft more generic
    7b8717658dff vxlan: Fix nexthop hash size
    691a09eecad9 ip6mr: Fix skb_under_panic in ip6mr_cache_report()
    86818409f989 s390/qeth: Don't call dev_close/dev_open (DOWN/UP)
    ecff20e19320 net: dcb: choose correct policy to parse DCB_ATTR_BCN
    421e02bda057 bnxt_en: Fix max_mtu setting for multi-buf XDP
    e9f11bfc03fb bnxt_en: Fix page pool logic for page size >= 64K
    64763dd851fa net: netsec: Ignore 'phy-mode' on SynQuacer in DT mode
    8afe27770dea net: korina: handle clk prepare error in korina_probe()
    58660666b464 net: ll_temac: fix error checking of irq_of_parse_and_map()
    834422b06c8b bpf: sockmap: Remove preempt_disable in sock_map_sk_acquire
    d4d3b53a4c66 net/sched: cls_route: No longer copy tcf_result on update to avoid use-after-free
    7f691439b29b net/sched: cls_fw: No longer copy tcf_result on update to avoid use-after-free
    aab2d095ce4d net/sched: cls_u32: No longer copy tcf_result on update to avoid use-after-free
    cbd000451885 bpf, cpumap: Handle skb as well when clean up ptr_ring
    4461b2cae326 ice: Fix RDMA VSI removal during queue rebuild
    0b45af982a4d net/sched: taprio: Limit TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME to INT_MAX.
    12d4ba181424 net: annotate data-races around sk->sk_priority
    6326c83ee27e net: add missing data-race annotation for sk_ll_usec
    dd7a1ff07c6c net: add missing data-race annotations around sk->sk_peek_off
    b53468041d20 net: annotate data-races around sk->sk_mark
    c7bb6860645f net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
    10c832159622 net: add missing READ_ONCE(sk->sk_sndbuf) annotation
    0a40103c9191 net: add missing READ_ONCE(sk->sk_rcvlowat) annotation
    be43c8f1c916 net: annotate data-races around sk->sk_max_pacing_rate
    0317c8322d9a net: annotate data-race around sk->sk_txrehash
    60d92bc9c094 net: annotate data-races around sk->sk_reserved_mem
    9da9ea9b132c qed: Fix scheduling in a tasklet while getting stats
    3c42307abe97 mISDN: hfcpci: Fix potential deadlock on &hc->lock
    d652c080b67c net: sched: cls_u32: Fix match key mis-addressing
    22709d85373f perf test uprobe_from_different_cu: Skip if there is no gcc
    5ef5b6e9c17b net: dsa: fix value check in bcm_sf2_sw_probe()
    8dfac8071d58 rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDGE_MODE length
    24772cc31f00 bpf: Add length check for SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing
    d628ba98eb16 net/mlx5e: Move representor neigh cleanup to profile cleanup_tx
    94a0eb9c12be net/mlx5e: Fix crash moving to switchdev mode when ntuple offload is set
    a7b5f001004c net/mlx5e: fix return value check in mlx5e_ipsec_remove_trailer()
    0582a3caaa3e net/mlx5: fix potential memory leak in mlx5e_init_rep_rx
    3169c3854397 net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_reformat_ctx
    c818fff3b6cb net/mlx5e: fix double free in macsec_fs_tx_create_crypto_table_groups
    7a6fad03f54c wifi: cfg80211: Fix return value in scan logic
    05e0952ddb75 erofs: fix wrong primary bvec selection on deduplicated extents
    a759972d2549 KVM: s390: fix sthyi error handling
    f168188174b3 word-at-a-time: use the same return type for has_zero regardless of endianness
    5b53b2b44f0c firmware: arm_scmi: Fix chan_free cleanup on SMC
    6289d5486d36 lib/bitmap: workaround const_eval test build failure
    0ca5de8309f9 firmware: smccc: Fix use of uninitialised results structure
    7b0582dddd7e arm64: dts: freescale: Fix VPU G2 clock
    5841d3d0c352 arm64: dts: imx8mn-var-som: add missing pull-up for onboard PHY reset pinmux
    a24f67b71ad2 arm64: dts: phycore-imx8mm: Correction in gpio-line-names
    753a927c5841 arm64: dts: phycore-imx8mm: Label typo-fix of VPU
    608ac7ea5f05 arm64: dts: imx8mm-venice-gw7904: disable disp_blk_ctrl
    d060bbb2fed8 arm64: dts: imx8mm-venice-gw7903: disable disp_blk_ctrl
    8ddb3183c439 iommu/arm-smmu-v3: Document nesting-related errata
    42d04acf1d9b iommu/arm-smmu-v3: Add explicit feature for nesting
    57ae3671ece5 iommu/arm-smmu-v3: Document MMU-700 erratum 2812531
    e3399bd014e9 iommu/arm-smmu-v3: Work around MMU-600 erratum 1076982
    50c24f0c9407 net: ipa: only reset hashed tables when supported
    93f5b881125e net/mlx5: Free irqs only on shutdown callback
    15c22cd1de50 perf: Fix function pointer case
    c7920f992840 io_uring: gate iowait schedule on having pending requests

(From OE-Core rev: 9cdf022205d4bfe30ed71a4b1ac2edfb88eff560)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8b3099f472201410cba6c3f30745d3b83e15a21)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 5323ae02ca..8e59cf937e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cd11a96d480a4748f96cb93d323c3eb8bbd8935d"
-SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
+SRCREV_machine ?= "0aa0b7396b5cbfccd69d23b07e095e4c4fa20589"
+SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.44"
+LINUX_VERSION ?= "6.1.45"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3d392cb9cf..c0c93fd3da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.44"
+LINUX_VERSION ?= "6.1.45"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
+SRCREV_machine ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 5b88274587..bafb8fca7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "586e4b8bd93c81f8f5f81f7fe8e945800c4b1190"
-SRCREV_machine:qemuarm64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemuloongarch64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemumips ?= "d476b8a1ff748bab6f12e687cbdea543b28edc63"
-SRCREV_machine:qemuppc ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemuriscv64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemuriscv32 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemux86 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemux86-64 ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_machine:qemumips64 ?= "33526acd1493dc6cf9c26296313888c461fdfa8f"
-SRCREV_machine ?= "a0e01625bc57f4e70ce779097fd99321377e48cc"
-SRCREV_meta ?= "fd76f76e2b84ddc47ade29ca3118ff14c2b9b67e"
+SRCREV_machine:qemuarm ?= "f009f4217b1b00e7de4fde7454a86ff5cc83ceef"
+SRCREV_machine:qemuarm64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemuloongarch64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemumips ?= "3db59f99ef5fddd5dc436d0e58bb9572051e08ed"
+SRCREV_machine:qemuppc ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemuriscv64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemuriscv32 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemux86 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemux86-64 ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_machine:qemumips64 ?= "173a48cfd962bf386bc591f1bb654d88d70cde6c"
+SRCREV_machine ?= "fb0e7ef6dd4b51325abcaab53645962994018135"
+SRCREV_meta ?= "8da434f09dc2892d8ec26325f0856aabccc17bed"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0a4a7855302d56a1d75cec3aa9a6914a3af9c6af"
+SRCREV_machine:class-devupstream ?= "1321ab403b38366a4cfb283145bb2c005becb1e5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.44"
+LINUX_VERSION ?= "6.1.45"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


