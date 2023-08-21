Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BF9EE49B0
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:44:57 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.289.1692632690957681346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b+XtXfK0;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76da121478dso112628585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632690; x=1693237490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My+EtPGQgvrSJBe0tglSK1dJlJrDuSJCce6hnTlKsrY=;
        b=b+XtXfK09ss/Rfr5+ciCc0S9IkrQCAtSzKUk8dt8YHoek9KDBESjUnNJKxwWat1usY
         bzrrGquFLCRiRjG0CwA2Y2Z8e8RueJvAztARgKG1AYUiAFVMmqIYet13UUEhfmJZssbz
         MPz65c6jdns9XtVL6eCv+YvCdz8uxrPvBxmj7YZO2pGRuRet9FYYpOVx1lJ89nXWy3+f
         3Bn5OSbevROEkjsHGpqYZzW8HRgd0V8kKK3dA8mjHGpbK8tGHDeJtpT9ZzIbNsjq+fD6
         numKCXgQKWwAMS7oDM2WHxauFJFsv7Gsj5mwq0c2+zrVLZVQSUqCIlPz1sBdyN2oMHTA
         XNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632690; x=1693237490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=My+EtPGQgvrSJBe0tglSK1dJlJrDuSJCce6hnTlKsrY=;
        b=Cy4Ozd+hIWfMj9xg+/O4mKsxF+zu0k6PC4lmVal1itskE9XSsDG0NhyP6yOycFplKP
         lHM69D4Pk4PiHGWFunIPxe/lNopdGruZSUsy9gUfM5CgXQOVTH7l2x3gDw3dgACQ6/GX
         ebG3chRzu1kXJ3mzF+WW9UVLIakctlu9TKtKYm+amSukynrq+rlR7wg/SRuWkymh7lhz
         oKLjIEjNxZh75d28JiYPozQ3BRlxFydPYOM694CNOQiyLefSuq+M4sFmV0AxvEeW4s/V
         upIh1Jxifx8nGmk5Na1VfJE8C12/MG9nzfY8WKC0zKAktY/h94peeA06KitOlM5Xhmd5
         +TPw==
X-Gm-Message-State: AOJu0YzuZ7CuNirnaU+wIh5b7dEPsBEsjt2xYAYIKmjF+tOVr0EN4e02
	ai0WlQoLvNraqH7Qxh4Z7II=
X-Google-Smtp-Source: AGHT+IEX7jTEB/VY5Cvp4jYvbC6F5beIFJ8hrhy2Ugp3hwLRY274Qg0vZBGpeTfqWl8lLTmHFwNn8g==
X-Received: by 2002:a0c:aace:0:b0:63c:f2ba:ee82 with SMTP id g14-20020a0caace000000b0063cf2baee82mr6975569qvb.31.1692632689653;
        Mon, 21 Aug 2023 08:44:49 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/6.4: update to v6.4.10
Date: Mon, 21 Aug 2023 11:44:37 -0400
Message-Id: <ec50487df0255e3d7ad152e689ba85f9fcbbaf89.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186452

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    b269b0268d41 Linux 6.4.10
    c9c0b889e2d3 x86/CPU/AMD: Do not leak quotient data after a division by 0
    493c80a4f20b drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control and in the CS
    43f5167d2cdc drm/i915/gt: Support aux invalidation on all engines
    e66e37671c18 drm/i915/gt: Poll aux invalidation register bit on invalidation
    10be2cb87f0a drm/i915/gt: Rename flags with bit_group_X according to the datasheet
    73400908a97b drm/i915/gt: Add workaround 14016712196
    17b66e10b134 drm/i915/gt: Ensure memory quiesced before invalidation
    c0660d36ecd8 drm/i915: Add the gen12_needs_ccs_aux_inv helper
    7f87080d2e97 ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node
    544fdf64d698 selftests/rseq: Play nice with binaries statically linked against glibc 2.35+
    33f735ef8dfe drm/amdgpu: Use apt name for FW reserved region
    61977b1526ba drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning
    bbfa34c97d8b powerpc/mm/altmap: Fix altmap boundary check
    49e57caf967a mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
    65df5d2ecc2c mtd: spi-nor: avoid holes in struct spi_mem_op
    45d69917a4af clk: mediatek: mt8183: Add back SSPM related clocks
    182ac84852a8 mtd: rawnand: rockchip: Align hwecc vs. raw page helper layouts
    550322382c5c mtd: rawnand: rockchip: fix oobfree offset and description
    b3e2e796be07 mtd: rawnand: omap_elm: Fix incorrect type in assignment
    a126124c86c5 io_uring: annotate offset timeout races
    af0f716ad3b0 f2fs: fix to do sanity check on direct node in truncate_dnode()
    f775ceb0cb53 btrfs: remove BUG_ON()'s in add_new_free_space()
    27f92aad4f17 ext2: Drop fragment support
    d160941e1537 mm/gup: do not return 0 from pin_user_pages_fast() for bad args
    4abda85197ba fs: Protect reconfiguration of sb read-write from racing writes
    0dd3e0c31bf3 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_submit_urb
    6da717fc5d90 debugobjects: Recheck debug_objects_enabled before reporting
    10426afe65c8 Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
    e28f376dd8df fs/sysv: Null check to prevent null-ptr-deref bug
    e0a30f9d1a5e kasan,kmsan: remove __GFP_KSWAPD_RECLAIM usage from kasan/kmsan
    664dbb356f67 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_load_attr_list()
    33391c7e1a2a mm: kmem: fix a NULL pointer dereference in obj_stock_flush_required()
    11e760b5e7f2 file: reinstate f_pos locking optimization for regular files
    158b3678c86b clk: imx93: Propagate correct error in imx93_clocks_probe()
    ee9968d72af8 sunvnet: fix sparc64 build error after gso code split
    5415dde3e76a Revert "page cache: fix page_cache_next/prev_miss off by one"
    6df7dd9270c5 drm/i915/gt: Cleanup aux invalidation registers
    ed7ac41cfcef drm/i915: Fix premature release of request's reusable memory
    49b3b979e79f drm/ttm: check null pointer before accessing when swapping
    e3c24712441e open: make RESOLVE_CACHED correctly test for O_TMPFILE
    64b7ae70678b arm64/ptrace: Don't enable SVE when setting streaming SVE
    0d22576f1903 arm64/ptrace: Flush FP state when setting ZT0
    cfb2b39db538 arm64/fpsimd: Sync FPSIMD state with SVE for SME only systems
    789c015d9a18 arm64/fpsimd: Clear SME state in the target task when setting the VL
    0693012274fd arm64/fpsimd: Sync and zero pad FPSIMD state for streaming SVE
    434ebb3960b7 parisc/mm: preallocate fixmap page tables at init
    410b0d2d54e6 powerpc/ftrace: Create a dummy stackframe to fix stack unwind
    f2556c93c388 smb: client: fix dfs link mount against w2k8
    063c9ce8e74e bpf: Disable preemption in bpf_event_output
    7bb7b479d111 rbd: prevent busy loop when requesting exclusive lock
    73626b70b361 x86/hyperv: Disable IBT when hypercall page lacks ENDBR instruction
    01c3a34f5ed7 wifi: mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)
    ea6cce8d6899 net: tap_open(): set sk_uid from current_fsuid()
    36161e7d40e7 net: tun_chr_open(): set sk_uid from current_fsuid()
    040d7f19f206 arm64: dts: stratix10: fix incorrect I2C property for SCL signal
    a0ac32cf61e5 bpf: Disable preemption in bpf_perf_event_output
    d92b04b2eae0 riscv: Export va_kernel_pa_offset in vmcoreinfo
    501a38b801f4 mtd: rawnand: meson: fix OOB available bytes for ECC
    6c26c42e076e mtd: spinand: winbond: Fix ecc_get_status
    fa4cfb7d204c mtd: spinand: toshiba: Fix ecc_get_status
    e705b1680001 exfat: release s_lock before calling dir_emit()
    e1a73ba43cf8 exfat: check if filename entries exceeds max filename length
    0c5c3e8a2550 exfat: use kvmalloc_array/kvfree instead of kmalloc_array/kfree
    3d4d2e55b31c firmware: arm_scmi: Drop OF node reference in the transport channel setup
    0b39dfaf255b ceph: defer stopping mdsc delayed_work
    c29cc7eef96b USB: zaurus: Add ID for A-300/B-500/C-700
    7d4b6fd65815 libceph: fix potential hang in ceph_osdc_notify()
    b31ef844d430 Documentation: kdump: Add va_kernel_pa_offset for RISCV64
    d678df66b1af scsi: storvsc: Limit max_sectors for virtual Fibre Channel devices
    2c2aa8d0e2a5 scsi: zfcp: Defer fc_rport blocking until after ADISC response
    0c8515842b82 rust: allocator: Prevent mis-aligned allocation
    3a2543be8a7e test/vsock: remove vsock_perf executable on `make clean`
    d6d195f2e7b1 tcp_metrics: fix data-race in tcpm_suck_dst() vs fastopen
    fd147efc9610 tcp_metrics: annotate data-races around tm->tcpm_net
    6f27b67fc329 tcp_metrics: annotate data-races around tm->tcpm_vals[]
    d8064e2859ae tcp_metrics: annotate data-races around tm->tcpm_lock
    cbe9433586be tcp_metrics: annotate data-races around tm->tcpm_stamp
    f47cff05d3b3 tcp_metrics: fix addr_same() helper
    9defb2b3843c prestera: fix fallback to previous version on same major version
    ac2b423db9b1 net/mlx5e: Set proper IPsec source port in L4 selector
    a1e071efa766 net/mlx5: fs_core: Skip the FTs in the same FS_TYPE_PRIO_CHAINS fs_prio
    b1aa1b267b91 net/mlx5: fs_core: Make find_closest_ft more generic
    23c195ce6f4a vxlan: Fix nexthop hash size
    3326c711f18d ip6mr: Fix skb_under_panic in ip6mr_cache_report()
    29d6fe395087 s390/qeth: Don't call dev_close/dev_open (DOWN/UP)
    199fde04bd87 net: dcb: choose correct policy to parse DCB_ATTR_BCN
    893096a7e5fd bnxt_en: Fix max_mtu setting for multi-buf XDP
    ae0e135dc900 bnxt_en: Fix page pool logic for page size >= 64K
    5d015db7e60d selftest: net: Assert on a proper value in so_incoming_cpu.c.
    0c1763e20c66 net: netsec: Ignore 'phy-mode' on SynQuacer in DT mode
    d948a2ab44ea net: korina: handle clk prepare error in korina_probe()
    18e647c01749 net: ll_temac: fix error checking of irq_of_parse_and_map()
    1b7c8cbbd6f6 bpf: sockmap: Remove preempt_disable in sock_map_sk_acquire
    a836184b670f net/sched: cls_route: No longer copy tcf_result on update to avoid use-after-free
    7d848d718aeb net/sched: cls_fw: No longer copy tcf_result on update to avoid use-after-free
    4b717802428f net/sched: cls_u32: No longer copy tcf_result on update to avoid use-after-free
    937345720d18 bpf, cpumap: Handle skb as well when clean up ptr_ring
    ecb45b852af5 bpf, cpumap: Make sure kthread is running before map update returns
    382535c063de bpf: Centralize permissions checks for all BPF map types
    514b9c25ffe6 bpf: Inline map creation logic in map_create() function
    3cf214f2755b bpf: Move unprivileged checks into map_create() and bpf_prog_load()
    0acc483f9b4d octeon_ep: initialize mbox mutexes
    34115ad1e5b5 bnxt: don't handle XDP in netpoll
    f7cdae9fbda2 ice: Fix RDMA VSI removal during queue rebuild
    a54bf862ccad net: usb: lan78xx: reorder cleanup operations to avoid UAF bugs
    57b3fe08ae06 net/sched: taprio: Limit TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME to INT_MAX.
    7e7c4fdee5c7 net: annotate data-races around sk->sk_priority
    9ceaff1556dc net: add missing data-race annotation for sk_ll_usec
    eb2604f073ee net: add missing data-race annotations around sk->sk_peek_off
    b76d2fa662b7 net: annotate data-races around sk->sk_mark
    ea47de09819b net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
    4b5bda4502dd net: add missing READ_ONCE(sk->sk_sndbuf) annotation
    4685a86b9f25 net: add missing READ_ONCE(sk->sk_rcvlowat) annotation
    98ee7a0fe181 net: annotate data-races around sk->sk_max_pacing_rate
    d0e273bc559b net: annotate data-race around sk->sk_txrehash
    6269d3eaf443 net: annotate data-races around sk->sk_reserved_mem
    5ac34598be7b net: gro: fix misuse of CB in udp socket lookup
    bbe07adbaf39 net: move gso declarations and functions to their own files
    3e0d2545f94a qed: Fix scheduling in a tasklet while getting stats
    3a234a486791 net: stmmac: tegra: Properly allocate clock bulk data
    ea496e48d656 mISDN: hfcpci: Fix potential deadlock on &hc->lock
    de14cff7164d net: sched: cls_u32: Fix match key mis-addressing
    4034838ab0d5 perf test uprobe_from_different_cu: Skip if there is no gcc
    76d0f82f68a2 net: dsa: fix value check in bcm_sf2_sw_probe()
    00757f58e37b rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDGE_MODE length
    95b2e27b1139 bpf: Add length check for SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing
    471f59b34553 net/mlx5: Unregister devlink params in case interface is down
    3280f8a40190 net/mlx5: fs_chains: Fix ft prio if ignore_flow_level is not supported
    bd964343338e net/mlx5e: kTLS, Fix protection domain in use syndrome when devlink reload
    02a84eb2af6b net/mlx5e: xsk: Fix crash on regular rq reactivation
    58a113a35846 net/mlx5e: xsk: Fix invalid buffer access for legacy rq
    36697c592cd0 net/mlx5e: Move representor neigh cleanup to profile cleanup_tx
    90c226e46785 net/mlx5e: Fix crash moving to switchdev mode when ntuple offload is set
    2e76da7bda60 net/mlx5e: Don't hold encap tbl lock if there is no encap action
    0302414ca593 net/mlx5: Honor user input for migratable port fn attr
    cc94d516c3a9 net/mlx5e: fix return value check in mlx5e_ipsec_remove_trailer()
    c265d8c2e255 net/mlx5: fix potential memory leak in mlx5e_init_rep_rx
    622d71d99124 net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_reformat_ctx
    957702c389a8 net/mlx5e: fix double free in macsec_fs_tx_create_crypto_table_groups
    1d23e51cc6a6 wifi: cfg80211: Fix return value in scan logic
    0ab6fac37032 perf pmu arm64: Fix reading the PMU cpu slots in sysfs
    b845249a4e5e erofs: fix wrong primary bvec selection on deduplicated extents
    53980121e1a6 KVM: s390: fix sthyi error handling
    601e467e29a9 s390/vmem: split pages when debug pagealloc is enabled
    cfa54fb51357 word-at-a-time: use the same return type for has_zero regardless of endianness
    0326a5bd6f58 ARM: dts: at91: sam9x60: fix the SOC detection
    08491e1cadd6 ARM: dts: at91: use generic name for shutdown controller
    ccec3e7f2b79 ARM: dts: at91: use clock-controller name for sckc nodes
    51a34cb21fd6 ARM: dts: at91: use clock-controller name for PMC nodes
    a5bdeb37a053 firmware: arm_scmi: Fix chan_free cleanup on SMC
    5dcc40b28c3f soc: imx: imx8mp-blk-ctrl: register HSIO PLL clock as bus_power_dev child
    2b41891b9cc1 ARM: dts: nxp/imx: limit sk-imx53 supported frequencies
    8626358813be lib/bitmap: workaround const_eval test build failure
    9851630bbd45 firmware: arm_scmi: Fix signed error return values handling
    32e44b7d7acc firmware: smccc: Fix use of uninitialised results structure
    4cfbe33a8897 arm64: dts: freescale: Fix VPU G2 clock
    25ee70d51d0a arm64: dts: imx8mn-var-som: add missing pull-up for onboard PHY reset pinmux
    d5d5cbb0d051 arm64: dts: phycore-imx8mm: Correction in gpio-line-names
    3fe4b022bbb5 arm64: dts: phycore-imx8mm: Label typo-fix of VPU
    599c6d1ce1b6 arm64: dts: imx8mm-venice-gw7904: disable disp_blk_ctrl
    132d600e52a7 arm64: dts: imx8mm-venice-gw7903: disable disp_blk_ctrl
    5ed4b021a3ba iommu/arm-smmu-v3: Document nesting-related errata
    c7af8840f215 iommu/arm-smmu-v3: Add explicit feature for nesting
    8f2c8d8a8dec iommu/arm-smmu-v3: Document MMU-700 erratum 2812531
    f6a58dbe36d7 iommu/arm-smmu-v3: Work around MMU-600 erratum 1076982
    93a0b7d43de5 mm: lock_vma_under_rcu() must check vma->anon_vma under vma lock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 2f051844d8..892794a142 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "121d700ad4b877fab9238a92356ad32506ef70d5"
-SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
+SRCREV_machine ?= "c5e2054d6dd1e4d87bc05758b03c8414b6229bdc"
+SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.9"
+LINUX_VERSION ?= "6.4.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 64dfb3a379..546aeea7bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.9"
+LINUX_VERSION ?= "6.4.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
+SRCREV_machine ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index d0d96c4d10..3be24d60e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "16af0b21320a78b21d5d9ded1188e398352d262a"
-SRCREV_machine:qemuarm64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemuloongarch64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemumips ?= "de46701cb3ac494b27ae70f1475efb855e9d817a"
-SRCREV_machine:qemuppc ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemuriscv64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemuriscv32 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemux86 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemux86-64 ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_machine:qemumips64 ?= "47d7881e76d678cc9dc034f0acdd1bc416fa05bb"
-SRCREV_machine ?= "72bad8cd7540f07ab54e08b83ad106dec0df123c"
-SRCREV_meta ?= "88ed9ec49099d69f9546d21137191fd747d06ec4"
+SRCREV_machine:qemuarm ?= "98ab6b8c56f20616739f11d78f9ce5e0f142e897"
+SRCREV_machine:qemuarm64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemuloongarch64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemumips ?= "ea17dea03919f5923b5948473fda920b9a6c2823"
+SRCREV_machine:qemuppc ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemuriscv64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemuriscv32 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemux86 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemux86-64 ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_machine:qemumips64 ?= "d8138296adb9b11a94fcc42d345e49bbb1dd5ede"
+SRCREV_machine ?= "d58a0ccc079a8173c41eca28d801f07eb806d3e5"
+SRCREV_meta ?= "b7b65d4e9a3f7910d9590c325798a6d012087555"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "38ca69782268c8e9578ba2f1fccf931f643eb8da"
+SRCREV_machine:class-devupstream ?= "b269b0268d4121d033721775d6e0c1114acfe50b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.9"
+LINUX_VERSION ?= "6.4.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


