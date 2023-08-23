Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D4FEE49B6
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:47 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13073.1692801406628159485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Y7XB0Als;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bf1935f6c2so38784115ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801405; x=1693406205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAhaaax6NYoclZTg/u9o0/9p7+KffGxzI8kIGh8smNM=;
        b=Y7XB0AlsXwPD+s0a/8AwU+cVRPYqddNf/kcGHgTwtoFJAVCDe58O7L5EuNtAW7m8IG
         ISGjO1QUw8T8WRqiZzU/Ws1dDbryHfuE1KsEzN9QqCRohlRyjZzg9udv0Xx1MwL09fKr
         o7kXYBlXJkYbKJdZCbVnksmk/4dF7TCLxjXIY46W6i6nArWKLGMGuKi6GeIPQmivVNyp
         85BbDhBscaPBO0xpnykvoZ5kFy0CctvdBNOlFyR08cXF/y7FebIaS9CZrTP36iLapD2y
         HpfG59aOkti4jP8fr8f6t637IvhDSBV78UneCOpT187/XctS9fG8zWpFBZvkLnHDivhc
         3e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801405; x=1693406205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAhaaax6NYoclZTg/u9o0/9p7+KffGxzI8kIGh8smNM=;
        b=DLD3JDiSfc+8kOjjD73qmRpwUb5M8egQhsPmOmdeIbicE7e17IXcWgQwdMNcsVbWo8
         Q+eMcVL6xC4/924Ar8xnu42Xwi7y+EdwM52/Bg0U8DfiWuqDtYNVHbvuTL8YGL0wgEbD
         WjzW9dBYFZYMTZ8rN0+tGLqHkYLf4lHfDm99s3HLLnwjOXTGv2r5yAl8sCiNtWInOWlQ
         Gm0m3imXWEPNF6yyVJG0aMsxlJAHVJ8y8sXLWjGHNPcY6b02HVoA0h9E4xTAkQZsSkfS
         kTShdh6SAM25smKrszb1ymbJXMinPHQuGP/pGlpHOu0o4eE7L7xc0HrIUKgFOz43nvOk
         p7ew==
X-Gm-Message-State: AOJu0YzxcrZQV9TGFtRbK9mZ5uYrhXdjenQ7BhUJc06INXvxBrBmi8Hk
	aK6ptxjK18OfNS6Oy9xmzFRmCR/u+i1+s9Up3Ng=
X-Google-Smtp-Source: AGHT+IH4Byx4XfJVChK/JMpT1S3EZpoAcSKz6sv6D9SpzJnuzUM247kXWr868/34pUqxKMPxgcST4Q==
X-Received: by 2002:a17:903:32c1:b0:1bc:edd:e891 with SMTP id i1-20020a17090332c100b001bc0edde891mr16555745plr.1.1692801405001;
        Wed, 23 Aug 2023 07:36:45 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/36] linux-yocto/5.15: update to v5.15.122
Date: Wed, 23 Aug 2023 04:35:42 -1000
Message-Id: <b135d73eccf54fc6afa07c2d8f4ba25c234469e2.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186593

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    5c6a716301d9 Linux 5.15.122
    be824fdb827d x86/cpu/amd: Add a Zenbleed fix
    5398be2c48aa x86/cpu/amd: Move the errata checking functionality up
    cdd3cdb682f4 Linux 5.15.121
    30580f3a3301 drm/atomic: Fix potential use-after-free in nonblocking commits
    ab2fa2fafb21 net/sched: sch_qfq: reintroduce lmax bound check for MTU
    204d7c36e8e7 MIPS: kvm: Fix build error with KVM_MIPS_DEBUG_COP0_COUNTERS enabled
    522ee1b3030f scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
    0715da51391d scsi: qla2xxx: Pointer may be dereferenced
    541af83572c9 scsi: qla2xxx: Correct the index of array
    1ccd52b790a6 scsi: qla2xxx: Check valid rport returned by fc_bsg_to_rport()
    5a52a2e14fe8 scsi: qla2xxx: Fix potential NULL pointer dereference
    89250e775dcc scsi: qla2xxx: Fix buffer overrun
    4406fe8a96a9 scsi: qla2xxx: Avoid fcport pointer dereference
    748d8f8698a2 scsi: qla2xxx: Array index may go out of bound
    079c8264ed9f scsi: qla2xxx: Wait for io return on terminate rport
    25d63eb730b8 tracing/probes: Fix to update dynamic data counter if fetcharg uses it
    8277bcacf165 tracing/probes: Fix not to count error code to total length
    610193a23fd5 selftests: mptcp: depend on SYN_COOKIES
    c8b375871eb8 selftests: mptcp: sockopt: return error if wrong mark
    3b5d9b7b8759 tracing: Fix null pointer dereference in tracing_err_log_open()
    391da52c8777 xtensa: ISS: fix call to split_if_spec
    179feeeef62f ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()
    bb14a93bccc9 ring-buffer: Fix deadloop issue on reading trace_pipe
    3e36cc94d6e6 net: ena: fix shift-out-of-bounds in exponential backoff
    b763e6342429 samples: ftrace: Save required argument registers in sample trampolines
    954792db9f61 tracing: Fix memory leak of iter->temp when reading trace_pipe
    97f54b330c79 tracing/histograms: Add histograms to hist_vars if they have referenced variables
    b45a33897f54 s390/decompressor: fix misaligned symbol build error
    1856cf9132f6 bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
    7269c250dd9d Revert "8250: add support for ASIX devices with a FIFO bug"
    20f7c4d51c94 soundwire: qcom: fix storing port config out-of-bounds
    39a0e723d350 opp: Fix use-after-free in lazy_opp_tables after probe deferral
    0ff4a97ac20f meson saradc: fix clock divider mask length
    e5fdd73c883b xhci: Show ZHAOXIN xHCI root hub speed correctly
    6eaedbffec55 xhci: Fix TRB prefetch issue of ZHAOXIN hosts
    328b18a42a57 xhci: Fix resume issue of some ZHAOXIN hosts
    d9c91ef5d8da ceph: don't let check_caps skip sending responses for revoke msgs
    db8ca8d9b4df libceph: harden msgr2.1 frame segment length checks
    974ac045a05a firmware: stratix10-svc: Fix a potential resource leak in svc_create_memory_pool()
    becf8c69b7e7 tty: serial: imx: fix rs485 rx after tx
    9dd8091959bc tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
    073dbbe57437 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
    21e2fe510aee serial: atmel: don't enable IRQs prematurely
    af4e0ce2af8a drm/ttm: Don't leak a resource on swapout move error
    22c16c896cbf drm/amdgpu: avoid restore process run into dead loop.
    85b9335d8e0b drm/amd/display: Correct `DMUB_FW_VERSION` macro
    9ced7e65c3c4 drm/amdgpu: fix clearing mappings for BOs that are always valid in VM
    0121d83ddfc8 drm/rockchip: vop: Leave vblank enabled in self-refresh
    941a395e969b drm/atomic: Allow vblank-enabled + self-refresh "disable"
    54163ad21e17 fs: dlm: return positive pid value for F_GETLK
    866bf37b7c10 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
    4f61488541bb md/raid0: add discard support for the 'original' layout
    3435c5674e67 mfd: pm8008: Fix module autoloading
    560c458340a9 misc: pci_endpoint_test: Re-init completion for every test
    14bdee38e96c misc: pci_endpoint_test: Free IRQs before removing the device
    eec34da87bc6 PCI: rockchip: Set address alignment for endpoint mode
    750fd00a0a37 PCI: rockchip: Use u32 variable to access 32-bit registers
    875d7a7f851a PCI: rockchip: Fix legacy IRQ generation for RK3399 PCIe endpoint core
    7b0026977a51 PCI: rockchip: Add poll and timeout to wait for PHY PLLs to be locked
    049d774b8b9b PCI: rockchip: Write PCI Device ID to correct register
    20c62b3c1e4d PCI: rockchip: Assert PCI Configuration Enable bit after probe
    e8cc74b6b446 PCI: qcom: Disable write access to read only registers for IP v2.3.3
    7b2f1ddc943a PCI: Add function 1 DMA alias quirk for Marvell 88SE9235
    1d24c5b10dbb PCI/PM: Avoid putting EloPOS E2/S2/H2 PCIe Ports in D3cold
    f930cf3f21fd dm integrity: reduce vmalloc space footprint on 32-bit architectures
    70564215ad92 hwrng: imx-rngc - fix the timeout for init and self check
    de984faecddb jfs: jfs_dmap: Validate db_l2nbperpage while mounting
    d04a3ff04c93 ext4: only update i_reserved_data_blocks on successful block allocation
    c327b83c59ee ext4: turn quotas off if mount failed after enabling quotas
    8830523440a6 ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
    c7514dceb7b9 ext4: fix wrong unit use in ext4_mb_new_blocks
    5523851fad60 ext4: get block from bh in ext4_free_blocks for fast commit replay
    ba92af119b31 ext4: fix wrong unit use in ext4_mb_clear_bb
    951ee9c9bb05 ext4: Fix reusing stale buffer heads from last failed mounting
    cd517f9a9d07 MIPS: KVM: Fix NULL pointer dereference
    fd89522a6198 MIPS: Loongson: Fix cpu_probe_loongson() again
    0e1854f87be8 erofs: fix compact 4B support for 16k block size
    e4e7f67cc14e arm64: errata: Add detection for TRBE overwrite in FILL mode
    affdbc8fbc7a powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
    9f1627d8b0a4 misc: fastrpc: Create fastrpc scalar with correct buffer count
    faea67e6a508 powerpc: Fail build if using recordmcount with binutils v2.37
    7eeed3ed1a6c mm/damon/ops-common: atomically test and clear young on ptes and pmds
    7efc5bee2473 net: bcmgenet: Ensure MDIO unregistration has clocks enabled
    626c1c291302 mtd: rawnand: meson: fix unaligned DMA buffers handling
    e08295290c53 tpm: tpm_vtpm_proxy: fix a race condition in /dev/vtpmx creation
    936adde9c338 pinctrl: amd: Only use special debounce behavior for GPIO 0
    0bcf6b12e699 pinctrl: amd: Detect and mask spurious interrupts
    dff67c64f67b pinctrl: amd: Detect internal GPIO0 debounce handling
    cc5050add034 pinctrl: amd: Fix mistake in handling clearing pins at startup
    982c29e0d27a f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
    333feb7ba84f fs/ntfs3: Check fields while reading
    04d2c9a6cb5c nvme-pci: fix DMA direction of unmapping integrity data
    c58e45fbeaa8 nvme-pci: remove nvme_queue from nvme_iod
    91d3554ab1fc net/sched: sch_qfq: account for stab overhead in qfq_enqueue
    8e0326cbc4d5 net/sched: sch_qfq: refactor parsing of netlink parameters
    78a0900e8dbc net/sched: make psched_mtu() RTNL-less safe
    31976c68be26 netdevsim: fix uninitialized data in nsim_dev_trap_fa_cookie_write()
    8a128e601f36 riscv: mm: fix truncation warning on RV32
    3bd945532d0d net/sched: flower: Ensure both minimum and maximum ports are specified
    d26299f50f5e bpf: cpumap: Fix memory leak in cpu_map_update_elem
    099abb1cd229 wifi: airo: avoid uninitialized warning in airo_get_rate()
    0e9ebc17457a erofs: fix fsdax unavailability for chunk-based regular files
    41ccbc2ecb63 erofs: decouple basic mount options from fs_context
    ed84618f8da2 erofs: avoid infinite loop in z_erofs_do_read_page() when reading beyond EOF
    e649333bcfe1 octeontx2-pf: Add additional check for MCAM rules
    c62da24de388 drm/i915: Fix one wrong caching mode enum usage
    567397dd8e7b riscv, bpf: Fix inconsistent JIT image generation
    4e4e1f99bb47 bpf, riscv: Support riscv jit to provide bpf_line_info
    420d30d36725 igc: Fix inserting of empty frame for launchtime
    efc7f2593724 igc: Fix launchtime before start of cycle
    d29387922b85 kernel/trace: Fix cleanup logic of enable_trace_eprobe
    7aefc43277e5 platform/x86: wmi: Break possible infinite loop when parsing GUID
    02081e57188b platform/x86: wmi: move variables
    f3583db8980a platform/x86: wmi: use guid_t and guid_equal()
    3b6fef411030 platform/x86: wmi: remove unnecessary argument
    82abd1c37d3b ipv6/addrconf: fix a potential refcount underflow for idev
    1d63fdf6d3ed NTB: ntb_tool: Add check for devm_kcalloc
    0aa187a99935 NTB: ntb_transport: fix possible memory leak while device_register() fails
    7e475cf97c47 ntb: intel: Fix error handling in intel_ntb_pci_driver_init()
    3326ecef63ca NTB: amd: Fix error handling in amd_ntb_pci_driver_init()
    fe1a2ed41162 ntb: idt: Fix error handling in idt_pci_driver_init()
    7f2153c1ae89 udp6: fix udp6_ehashfn() typo
    3fabca5d9cae icmp6: Fix null-ptr-deref of ip6_null_entry->rt6i_idev in icmp6_dev().
    ea438eed94ac net: prevent skb corruption on frag list segmentation
    02474292a442 net: bgmac: postpone turning IRQs off to avoid SoC hangs
    1417dd787a5e ionic: remove WARN_ON to prevent panic_on_warn
    aa915d12c1cc gve: Set default duplex configuration to full
    5b55f2d6ef40 net/sched: cls_fw: Fix improper refcount update leads to use-after-free
    1d263bbdc5c6 net: mvneta: fix txq_map in case of txq_number==1
    4a4804e6ae84 bpf: Fix max stack depth check for async callbacks
    1b555dff835c scsi: qla2xxx: Fix error code in qla2x00_start_sp()
    6e8af127ddbd igc: Handle PPS start time programming for past time values
    809ea3a3eb3e igc: set TP bit in 'supported' and 'advertising' fields of ethtool_link_ksettings
    82ac62d76a00 net/mlx5e: Check for NOT_READY flag state after locking
    4892e1e548b5 net/mlx5e: fix memory leak in mlx5e_ptp_open
    c61303ae2ce0 net/mlx5e: fix double free in mlx5e_destroy_flow_table
    f4b1f2625186 igc: Remove delay during TX ring configuration
    b3540c0de848 drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags
    9dbc0fa2e85a drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
    486b2551b068 drm/panel: simple: Add connector_type for innolux_at043tn24
    eb947403518e ksmbd: validate session id and tree id in the compound request
    3813eee5154d ksmbd: fix out-of-bound read in smb2_write
    35f450f54dca ksmbd: validate command payload size
    08871ede8318 ksmbd: use ksmbd_req_buf_next() in ksmbd_smb2_check_message()
    d528faa9e828 workqueue: clean up WORK_* constant types, clarify masking
    aed37b12a253 net: lan743x: Don't sleep in atomic context
    d9e1cfae8d8e io_uring: add reschedule point to handle_tw_list()
    f8307d862ca4 io_uring: Use io_schedule* in cqring wait
    ecb9443b203f block/partition: fix signedness issue for Amiga partitions
    478a7a30c33c tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
    75308d64c050 wireguard: netlink: send staged packets when setting initial private key
    8c660cfd7230 wireguard: queueing: use saner cpu selection wrapping
    870dcc31c0cf netfilter: nf_tables: prevent OOB access in nft_byteorder_eval
    041e2ac88cae netfilter: nf_tables: do not ignore genmask when looking up chain by id
    6f03ce2f1abc netfilter: conntrack: Avoid nf_ct_helper_hash uses after free
    2bd6f13734ce netfilter: nf_tables: unbind non-anonymous set if rule construction fails
    30235c245700 fanotify: disallow mount/sb marks on kernel internal pseudo fs
    d97481c7b273 ovl: fix null pointer dereference in ovl_get_acl_rcu()
    db42d2bf4f21 fs: no need to check source
    86b93cbfe104 leds: trigger: netdev: Recheck NETDEV_LED_MODE_LINKUP on dev rename
    ecc8d95067e4 ARM: orion5x: fix d2net gpio initialization
    1c401bb99394 ARM: dts: qcom: ipq4019: fix broken NAND controller properties override
    02b5d96f7dd0 ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
    5f35f98e5609 ASoC: mediatek: mt8173: Fix irq error path
    6e7f6b4b5ca0 btrfs: do not BUG_ON() on tree mod log failure at __btrfs_cow_block()
    bdc8a582e1a4 btrfs: fix extent buffer leak after tree mod log failure at split_node()
    7ba0da31dd4a btrfs: fix race when deleting quota root from the dirty cow roots list
    bacd1c80e3b6 btrfs: reinsert BGs failed to reclaim
    d1ca553f9431 btrfs: bail out reclaim process if filesystem is read-only
    d8e172616fb7 btrfs: delete unused BGs while reclaiming BGs
    12b6d6849898 btrfs: add handling for RAID1C23/DUP to btrfs_reduce_alloc_profile
    dd15d1c5c22d fs: avoid empty option when generating legacy mount string
    79b9ab357b6f jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
    5ca021be5211 ipvs: increase ip_vs_conn_tab_bits range for 64BIT
    6db001a7ed75 fs: Lock moved directories
    40f99ad8e2c2 fs: Establish locking order for unrelated directories
    8fdae421c26f Revert "f2fs: fix potential corruption when moving a directory"
    eca9c3d86dd0 ext4: Remove ext4 locking of moved directory
    487f229efea8 shmem: use ramfs_kill_sb() for kill_sb method of ramfs-based tmpfs
    17bdba70a802 autofs: use flexible array in ioctl structure
    e7acd18e5ec3 integrity: Fix possible multiple allocation in integrity_inode_get()
    f4e0809d3adc um: Use HOST_DIR for mrproper
    f67b0e3081f2 bcache: Fix __bch_btree_node_alloc to make the failure behavior consistent
    991e9c186a8a bcache: Remove unnecessary NULL point check in node allocations
    cbdd5b3322f7 bcache: fixup btree_cache_wait list damage
    99d0599742be mmc: sdhci: fix DMA configure compatibility issue when 64bit DMA mode is used.
    c893918bf4d8 mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS
    4a489c8e9cc8 mmc: core: disable TRIM on Micron MTFC4GACAJCN-1M
    5b555f250069 mmc: core: disable TRIM on Kingston EMMC04G-M627
    8e2983536613 io_uring: wait interruptibly for request completions on exit
    e5da56c682f1 NFSD: add encoding of op_recall flag for write delegation
    8a77b1d4663f i2c: qup: Add missing unwind goto in qup_i2c_probe()
    5bf90e5e793a btrfs: do not BUG_ON() on tree mod log failure at balance_level()
    e15eb4ec862c extcon: usbc-tusb320: Convert to i2c's .probe_new()
    112c15d0974f i2c: xiic: Don't try to handle more interrupt events after error
    9eaef43fef90 i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in xiic_process()
    0fa0cd1f98c1 apparmor: fix missing error check for rhashtable_insert_fast
    196f6c71905a sh: dma: Fix DMA channel offset calculation
    6342e46566f6 s390/qeth: Fix vipa deletion
    307623bae629 octeontx-af: fix hardware timestamp configuration
    deee40944a75 net: dsa: tag_sja1105: fix MAC DA patching from meta frames
    e4db7f4369eb pptp: Fix fib lookup calls.
    a4284246fca2 riscv: move memblock_allow_resize() after linear mapping is ready
    ae682149bc00 net/sched: act_pedit: Add size check for TCA_PEDIT_PARMS_EX
    edd944b70ad2 xsk: Honor SO_BINDTODEVICE on bind
    428ccde9242a tcp: annotate data races in __tcp_oow_rate_limited()
    0dad52a840d6 net: bridge: keep ports without IFF_UNICAST_FLT in BR_PROMISC mode
    ada440952d5e powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
    f3380d895e28 ntfs: Fix panic about slab-out-of-bounds caused by ntfs_listxattr()
    e425e2ba9336 octeontx2-af: Add validation before accessing cgx and lmac
    eeaf264cd43f octeontx2-af: Fix mapping for NIX block from CGX connection
    d58d718136f8 f2fs: fix error path handling in truncate_dnode()
    c0dd447558c6 mailbox: ti-msgmgr: Fill non-message tx data fields with 0x0
    217b6ea8cf7b spi: bcm-qspi: return error if neither hif_mspi nor mspi is available
    2e2e5f9300a1 net: dsa: vsc73xx: fix MTU configuration
    b8aedf29db12 ibmvnic: Do not reset dql stats on NON_FATAL err
    6a5a705fa8ad Add MODULE_FIRMWARE() for FIRMWARE_TG357766.
    a6527128feeb net/sched: act_ipt: add sanity checks on table name and hook locations
    1fba2510b52f sctp: fix potential deadlock on &net->sctp.addr_wq_lock
    baa76d9b6163 media: cec: i2c: ch7322: also select REGMAP
    677c5707ec38 drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times
    2a0acbc6b7cd rtc: st-lpc: Release some resources in st_rtc_probe() in case of error
    7834580ca104 md/raid10: fix the condition to call bio_end_io_acct()
    d623fd42a019 pwm: mtk_disp: Fix the disable flow of disp_pwm
    db3c7f3eb85f pwm: ab8500: Fix error code in probe()
    05b35ea06d26 pwm: sysfs: Do not apply state to already disabled PWMs
    aa12faec2314 pwm: imx-tpm: force 'real_period' to be zero in suspend
    07e229f06eba phy: tegra: xusb: check return value of devm_kzalloc()
    f7454b8fd21f mfd: stmpe: Only disable the regulators if they are enabled
    a9ccf140a2a0 KVM: s390/diag: fix racy access of physical cpu number in diag 9c handler
    2070f3e0bc76 KVM: s390: vsie: fix the length of APCB bitmap
    52f371952a71 mfd: stmfx: Nullify stmfx->vdd in case of error
    b1dbc919c166 mfd: stmfx: Fix error path in stmfx_chip_init
    9783c2ec8d04 nvmem: rmem: Use NVMEM_DEVID_AUTO
    e6bd54f4977b test_firmware: return ENOMEM instead of ENOSPC on failed memory allocation
    22c7e378b06b serial: 8250_omap: Use force_suspend and resume for system suspend
    10f6656c9575 Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"
    76ac2acb7554 mfd: intel-lpss: Add missing check for platform_get_resource
    0e8b1a28351b usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
    f232c1caac3c usb: common: usb-conn-gpio: Set last role to unknown before initial detection
    dfda400a4d04 usb: dwc3: qcom: Fix an error handling path in dwc3_qcom_probe()
    81ecef54d8c6 usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()
    f219ea71ee0f KVM: s390: fix KVM_S390_GET_CMMA_BITS for GFNs in memslot holes
    de846dec7aee media: atomisp: gmin_platform: fix out_len in gmin_get_config_dsm_var()
    7ad558baf6d0 media: venus: helpers: Fix ALIGN() of non power of two
    3bedb7a27353 mfd: rt5033: Drop rt5033-battery sub-device
    a77616f5a3c3 coresight: Fix loss of connection info when a module is unloaded
    ca9e766c8a49 kernfs: fix missing kernfs_idr_lock to remove an ID from the IDR
    e7ecade51b48 serial: 8250: lock port for UART_IER access in omap8250_irq()
    c1a4ad35c566 serial: 8250: lock port for stop_rx() in omap8250_irq()
    c2194a361087 usb: hide unused usbfs_notify_suspend/resume functions
    ecf26d6e1b54 usb: phy: phy-tahvo: fix memory leak in tahvo_usb_probe()
    b10200650e1e extcon: Fix kernel doc of property capability fields to avoid warnings
    44e383e22af0 extcon: Fix kernel doc of property fields to avoid warnings
    a8ea7ed644cb usb: gadget: u_serial: Add null pointer check in gserial_suspend
    b626cd5e4a87 usb: dwc3: qcom: Fix potential memory leak
    1cee6f04105f clk: qcom: ipq6018: fix networking resets
    6ad5ded420f5 clk: qcom: reset: support resetting multiple bits
    40844343a885 clk: qcom: reset: Allow specifying custom reset delay
    cab904bf50c4 media: i2c: Correct format propagation for st-mipid02
    784a8027b8ac media: usb: siano: Fix warning due to null work_func_t function pointer
    1e1af31c4c5d media: videodev2.h: Fix struct v4l2_input tuner index comment
    a3727915b350 media: usb: Check az6007_read() return value
    2a50c146cb3b clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
    8d762ad8006e clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
    10e2b1c5d819 serial: 8250: omap: Fix freeing of resources on failed register
    a1a5c5606048 usb: dwc2: Fix some error handling paths
    fa1547b47195 usb: dwc2: platform: Improve error reporting for problems during .remove()
    0a9c0fa3e91a sh: j2: Use ioremap() to translate device tree address into kernel memory
    629e97f0c862 w1: fix loop in w1_fini()
    cb263e9b6d76 w1: w1_therm: fix locking behavior in convert_t
    fbf4ace39b2e SUNRPC: Fix UAF in svc_tcp_listen_data_ready()
    92905470a125 block: increment diskseq on all media change events
    8744a9eda7c1 block: change all __u32 annotations to __be32 in affs_hardblocks.h
    de4d538380f6 block: add overflow checks for Amiga partition support
    bc0129a644f0 block: fix signed int overflow in Amiga partition support
    92a37fc52272 ALSA: jack: Fix mutex call in snd_jack_report()
    2f533bcb0717 ALSA: hda/realtek: Add quirk for Clevo NPx0SNx
    5bcdfe1544f2 iio: accel: fxls8962af: fixup buffer scan element type
    8cc75ce657a4 iio: accel: fxls8962af: errata bug only applicable for FXLS8962AF
    92cee2da5b45 iio: adc: ad7192: Fix internal/external clock selection
    f88a05ef447f iio: adc: ad7192: Fix null ad7192_state pointer access
    b84998a407a8 phy: tegra: xusb: Clear the driver reference in usb-phy dev
    8585c6cb0381 usb: dwc3: gadget: Propagate core init errors to UDC during pullup
    9cd1627ff0f1 USB: serial: option: add LARA-R6 01B PIDs
    fb348857e7b6 io_uring: ensure IOPOLL locks around deferred work
    4909d0ad1728 bootmem: remove the vmemmap pages from kmemleak in free_bootmem_page
    902256de2b95 ACPI: utils: Fix acpi_evaluate_dsm_typed() redefinition error
    b3889a5990b5 ksmbd: avoid field overflow warning
    ef26b05023e7 efi/libstub: Disable PCI DMA before grabbing the EFI memory map
    5c883c42bd78 kbuild: Disable GCOV for *.mod.o
    3d9f6fc71de5 hwrng: st - keep clock enabled while hwrng is registered
    cd5bd4b7130c dax/kmem: Pass valid argument to memory_group_register_static
    2a327c8c315a dax: Introduce alloc_dev_dax_id()
    9c2f993b6ca9 dax: Fix dax_mapping_release() use after free
    63fb45ddc491 SMB3: Do not send lease break acknowledgment if all file handles have been closed
    7f6023610b4e NFSv4.1: freeze the session table upon receiving NFS4ERR_BADSESSION
    6d9f814b265c crypto: qat - unmap buffers before free for RSA
    718f30e30b3e crypto: qat - unmap buffer before free for DH
    3894f5880f96 crypto: qat - Use helper to set reqsize
    30682e121475 crypto: kpp - Add helper to set reqsize
    41bd35a16196 crypto: qat - use reference to structure in dma_map_single()
    a3fcd2d23df9 crypto: qat - replace get_current_node() with numa_node_id()
    9560559cba40 crypto: qat - honor CRYPTO_TFM_REQ_MAY_SLEEP flag
    f6ee18555b40 ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
    5e0424cd8a44 modpost: fix off by one in is_executable_section()
    7c0c62e5574f crypto: marvell/cesa - Fix type mismatch warning
    6bfdced5b6be modpost: fix section mismatch message for R_ARM_{PC24,CALL,JUMP24}
    cd7806eec34f modpost: fix section mismatch message for R_ARM_ABS32
    7543ffe03af6 crypto: nx - fix build warnings when DEBUG_FS is not enabled
    b030d239256c modpost: remove broken calculation of exception_table_entry size
    c76d991b6f01 hwrng: virtio - Fix race on data_avail and actual data
    64410e7b0306 hwrng: virtio - always add a pending request
    9a9ef9652941 hwrng: virtio - don't waste entropy
    f5634d21541e hwrng: virtio - don't wait on cleanup
    91806246e4e9 hwrng: virtio - add an internal buffer
    36874844f7b5 powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
    271c25008a08 powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
    fafeeb398df1 riscv: uprobes: Restore thread.bad_cause
    3786416e1fa2 powerpc: update ppc_save_regs to save current r1 in pt_regs
    b08d9a11df37 powerpc: simplify ppc_save_regs
    d3a0d96c16e5 powerpc/powernv/sriov: perform null check on iov before dereferencing iov
    0a95dd17a73b pinctrl: at91-pio4: check return value of devm_kasprintf()
    50aa3e6abbb2 pinctrl: microchip-sgpio: check return value of devm_kasprintf()
    f7d92313002b powerpc/64s: Fix VAS mm use after free
    5e79521da11f perf dwarf-aux: Fix off-by-one in die_get_varname()
    ac6c849428fb perf script: Fix allocation of evsel->priv related to per-event dump files
    939bf462a125 powerpc/signal32: Force inlining of __unsafe_save_user_regs() and save_tm_user_regs_unsafe()
    7d25fc45c42c powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
    d4f3531cd2c3 kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
    196f18dd7f0e pinctrl: cherryview: Return correct value if pin in push-pull mode
    c92365c3f390 perf bench: Add missing setlocale() call to allow usage of %'d style formatting
    e456d9b2dd23 perf bench: Use unbuffered output when pipe/tee'ing to a file
    c02b496d9294 PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    d1bfe6ca7328 PCI: ftpci100: Release the clock resources
    7fe2876aac63 PCI: pciehp: Cancel bringup sequence if card is not present
    dfbf41e4fc16 scsi: 3w-xxxx: Add error handling for initialization failure in tw_probe()
    9856c0de4905 PCI/ASPM: Disable ASPM on MFD function removal to avoid use-after-free
    6053df4da4fc pinctrl: bcm2835: Handle gpiochip_add_pin_range() errors
    b1de5105d29b scsi: qedf: Fix NULL dereference in error handling
    48e6b7602e9b PCI: vmd: Reset VMD config register between soft reboots
    34c701b52d04 PCI: cadence: Fix Gen2 Link Retraining process
    a326cf0107b1 clk: Fix memory leak in devm_clk_notifier_register()
    a0e7e33b8c2d ASoC: imx-audmix: check return value of devm_kasprintf()
    62f29ca45f83 ovl: update of dentry revalidate flags after copy up
    a089ec635ae9 drivers: meson: secure-pwrc: always enable DMA domain
    8ca6b2add2c0 clk: ti: clkctrl: check return value of kasprintf()
    b700e5d4feb0 clk: keystone: sci-clk: check return value of kasprintf()
    06759faca0ef clk: si5341: free unused memory on probe failure
    34b11a9a7d39 clk: si5341: check return value of {devm_}kasprintf()
    4ade98acef5a clk: si5341: return error if one synth clock registration fails
    9875046f147a clk: cdce925: check return value of kasprintf()
    d8832e85a1ae clk: vc5: check memory returned by kasprintf()
    f180408f164c drm/msm/dpu: correct MERGE_3D length
    e45377cfe1db arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
    30111c478b97 arm64: dts: mediatek: Add cpufreq nodes for MT8192
    3c3f3d35f5e0 drm/msm/dp: Free resources after unregistering them
    ec3b55b2c91d drm/msm/dpu: do not enable color-management if DSPPs are not available
    300e26e3e648 ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
    fd1c117bb5d7 clk: tegra: tegra124-emc: Fix potential memory leak
    2f276dd9c0f8 clk: clocking-wizard: Fix Oops in clk_wzrd_register_divider()
    141d87977b81 arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k
    bcea444ab4c0 clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
    50b5ddde8fad clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
    1fb12e7716e7 RDMA/bnxt_re: Avoid calling wake_up threads from spin_lock context
    79226176cdd1 RDMA/bnxt_re: wraparound mbox producer index
    bf35c202a3f0 drm/msm/a5xx: really check for A510 in a5xx_gpu_init
    4300a47e4017 amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
    9b8087950b4c drm/radeon: fix possible division-by-zero errors
    b979dc54b6c7 drm/amd/display: Fix artifacting on eDP panels when engaging freesync video mode
    52c2b295e377 drm/amdkfd: Fix potential deallocation of previously deallocated memory.
    95afd2c7c7d2 ARM: dts: BCM5301X: fix duplex-full => full-duplex
    838534e86cbc hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272
    31c90fa8416f hwmon: (adm1275) Allow setting sample averaging
    3ff1062bd09b hwmon: (gsc-hwmon) fix fan pwm temperature scaling
    535eafe7158b ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx
    8909898d0b6c ARM: dts: stm32: Fix audio routing on STM32MP15xx DHCOM PDK2
    555ddd671cf3 arm64: dts: ti: k3-j7200: Fix physical address of pin
    716efd08985e fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
    95cb88a85361 arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
    06c6fdaa111a ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier
    8ac3083a26d3 RDMA/hns: Fix hns_roce_table_get return value
    8d158b32cba6 IB/hfi1: Fix wrong mmu_node used for user SDMA packet after invalidate
    b2ffd8212ef4 IB/hfi1: Use bitmap_zalloc() when applicable
    192ab380657e RDMA/irdma: avoid fortify-string warning in irdma_clr_wqes
    f5ca4d358b9a soc/fsl/qe: fix usb.c build errors
    9dcc95e3fc51 ARM: dts: meson8: correct uart_B and uart_C clock references
    1b4d08bdc055 ASoC: es8316: Do not set rate constraints for unsupported MCLKs
    b324de100d3c ASoC: es8316: Increment max value for ALC Capture Target Volume control
    38d04765ad93 memory: brcmstb_dpfe: fix testing array offset after use
    17b723acee4e ARM: dts: stm32: Shorten the AV96 HDMI sound card name
    9c14802f14db arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to kukui
    8f08ff836c28 arm64: dts: qcom: apq8096: fix fixed regulator name property
    2e8c8fd792a0 ARM: omap2: fix missing tick_broadcast() prototype
    016aeb9a7604 ARM: ep93xx: fix missing-prototype warnings
    314850a4d0c6 drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
    04f16697d351 arm64: dts: qcom: apq8016-sbc: Fix 1.8V power rail on LS expansion
    7ce11e909828 arm64: dts: qcom: apq8016-sbc: Fix regulator constraints
    8d139a395dbe arm64: dts: qcom: Drop unneeded extra device-specific includes
    078578f608ba arm64: dts: qcom: apq8016-sbc: fix mpps state names
    25d624af5a86 arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
    d7d784424aa0 arm64: dts: qcom: apq8016-sbc: Update modem and WiFi firmware path
    6a843066e0ec arm64: dts: qcom: db820c: Move blsp1_uart2 pin states to msm8996.dtsi
    23f7e4bf8905 arm64: dts: qcom: sdm845: correct camss unit address
    dea5289b05f2 arm64: dts: qcom: sdm630: correct camss unit address
    b12e9fb2819a arm64: dts: qcom: msm8996: correct camss unit address
    5a8bbab2b14b arm64: dts: qcom: msm8994: correct SPMI unit address
    46474b10dcd7 arm64: dts: qcom: msm8916: correct camss unit address
    b4ed5be2ea31 ARM: dts: gta04: Move model property out of pinctrl node
    70b8eeb7c67e drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
    2422edc2256c drm/msm/disp/dpu: get timing engine status from intf status register
    adac5cf6092e drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
    6882389691e1 RDMA/bnxt_re: Fix to remove an unnecessary log
    b41dd1d896d1 RDMA/bnxt_re: Remove a redundant check inside bnxt_re_update_gid
    9ccca79eb353 RDMA/bnxt_re: Use unique names while registering interrupts
    ced019c1f9ea RDMA/bnxt_re: Fix to remove unnecessary return labels
    adc129e89497 RDMA/bnxt_re: Disable/kill tasklet only if it is enabled
    f95ff838ac39 clk: imx: scu: use _safe list iterator to avoid a use after free
    f564dd710971 arm64: dts: microchip: sparx5: do not use PSCI on reference boards
    3752e6a98e10 bus: ti-sysc: Fix dispc quirk masking bool variables
    6d07673027f4 ARM: dts: stm32: Move ethernet MAC EEPROM from SoM to carrier boards
    a14e6f9392dc drm/panel: sharp-ls043t1le01: adjust mode settings
    6b5a02a57265 drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
    ec43cfdcbd36 Input: adxl34x - do not hardcode interrupt trigger type
    fd6cdc56ee28 ARM: dts: meson8b: correct uart_B and uart_C clock references
    5899bc4058e8 ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
    ba51c4072f9a drm/vram-helper: fix function names in vram helper doc
    019f013e8b92 drm/bridge: tc358768: fix THS_TRAILCNT computation
    ed8bfa046153 drm/bridge: tc358768: fix TXTAGOCNT computation
    cec2271095d2 drm/bridge: tc358768: fix THS_ZEROCNT computation
    47b8546301a9 drm/bridge: tc358768: fix TCLK_TRAILCNT computation
    a07e6484f915 drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
    34b805ab386c drm/bridge: tc358768: fix TCLK_ZEROCNT computation
    9e0668ecef6e drm/bridge: tc358768: fix PLL target frequency
    81bb5e859f2e drm/bridge: tc358768: fix PLL parameters computation
    6451b3274fb3 drm/bridge: tc358768: always enable HS video mode
    26a0ba5d1654 Input: drv260x - sleep between polling GO bit
    efb61a718540 drm/amd/display: Explicitly specify update type per plane info change
    53e0a5ba9deb radeon: avoid double free in ci_dpm_init()
    6173df9026d0 drm/amd/display: Add logging for display MALL refresh setting
    a4b0164fc18b netlink: Add __sock_i_ino() for __netlink_diag_dump().
    04daf3f67497 ipvlan: Fix return value of ipvlan_queue_xmit()
    eb720f669b6d netfilter: nf_conntrack_sip: fix the ct_sip_parse_numerical_param() return value.
    c052797ac368 netfilter: conntrack: dccp: copy entire header to stack buffer, not just basic one
    5848ad42507d lib/ts_bm: reset initial match offset for every block of text
    fc8429f8d868 net: nfc: Fix use-after-free caused by nfc_llcp_find_local
    60ec0058c72f nfc: llcp: simplify llcp_sock_connect() error paths
    91f4ef204e73 sfc: fix crash when reading stats while NIC is resetting
    9ced40bf849e net: axienet: Move reset before 64-bit DMA detection
    ebd6d2077a08 gtp: Fix use-after-free in __gtp_encap_destroy().
    4f22f55dc80d selftests: rtnetlink: remove netdevsim device after ipsec offload test
    029d892b05fc bonding: do not assume skb mac_header is set
    619384319b13 netlink: do not hard code device address lenth in fdb dumps
    a641240b7e07 netlink: fix potential deadlock in netlink_set_err()
    d4aee9512ae0 net: stmmac: fix double serdes powerdown
    cfe147bdd094 igc: Fix race condition in PTP tx code
    c729f590fe41 can: length: fix bitstuffing count
    4bc47970179a bpf: Fix bpf socket lookup from tc/xdp to respect socket VRF bindings
    a254e029b742 bpf: Call __bpf_sk_lookup()/__bpf_skc_lookup() directly via TC hookpoint
    9eb2651c67b5 bpf: Factor out socket lookup functions for the TC hookpoint.
    a66cce0339a6 bpf: Omit superfluous address family check in __bpf_skc_lookup
    7e3d771f85c3 wifi: ath9k: convert msecs to jiffies where needed
    248fc11128f9 wifi: iwlwifi: mvm: indicate HW decrypt for beacon protection
    365cd15e8fcb wifi: cfg80211: rewrite merging of inherited elements
    3b9de981fe7f wifi: iwlwifi: pcie: fix NULL pointer dereference in iwl_pcie_irq_rx_msix_handler()
    d0f665eee9c3 iwlwifi: don't dump_stack() when we get an unexpected interrupt
    a6db476ff38c wifi: iwlwifi: pull from TXQs with softirqs disabled
    a572c6852b51 rtnetlink: extend RTEXT_FILTER_SKIP_STATS to IFLA_VF_INFO
    48c2d1455a6a wifi: ath9k: Fix possible stall on ath9k_txq_list_has_key()
    8c561a59c6cd memstick r592: make memstick_debug_get_tpc_name() static
    79c0fbf8f359 kexec: fix a memory leak in crash_shrink_memory()
    ed8d827f4313 watchdog/perf: more properly prevent false positives with turbo modes
    c29d8d1f56c3 watchdog/perf: define dummy watchdog_update_hrtimer_threshold() on correct config
    15b37d2b4a02 wifi: rsi: Do not set MMC_PM_KEEP_POWER in shutdown
    4391fa180856 wifi: rsi: Do not configure WoWlan in shutdown hook if not enabled
    ac4bf9426af9 selftests/bpf: Fix check_mtu using wrong variable type
    95b4b940f0fb wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes
    ef24fe436bab wifi: ray_cs: Fix an error handling path in ray_probe()
    0700d878b0d2 wifi: ray_cs: Drop useless status variable in parse_addr()
    d696cbbe43db wifi: ray_cs: Utilize strnlen() in parse_addr()
    93890d057317 wifi: wl3501_cs: Fix an error handling path in wl3501_probe()
    eaffd568a248 wl3501_cs: use eth_hw_addr_set()
    c6143548e634 wifi: atmel: Fix an error handling path in atmel_probe()
    5a0a312d3490 wifi: orinoco: Fix an error handling path in orinoco_cs_probe()
    f5bb5474f40d wifi: orinoco: Fix an error handling path in spectrum_cs_probe()
    ec856ca3b0ac regulator: core: Streamline debugfs operations
    fc2f8b9054eb regulator: core: Fix more error checking for debugfs_create_dir()
    534508689e89 bpftool: JIT limited misreported as negative value on aarch64
    e7e0b6e066f0 nfc: llcp: fix possible use of uninitialized variable in nfc_llcp_send_connect()
    edeb029dd9ad spi: dw: Round of n_bytes to power of 2
    ac6158b5c4db bpf: Don't EFAULT for {g,s}setsockopt with wrong optlen
    71754ee427d7 libbpf: fix offsetof() and container_of() to work with CO-RE
    3e7ee33b95e0 sctp: add bpf_bypass_getsockopt proto callback
    a32a89bb0459 wifi: mwifiex: Fix the size of a memory allocation in mwifiex_ret_802_11_scan()
    a55f88dd156f wifi: wilc1000: fix for absent RSN capabilities WFA testcase
    e215a8a4283a spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
    e92f61e0701e samples/bpf: Fix buffer overflow in tcp_basertt
    c77eb01a6e41 libbpf: btf_dump_type_data_check_overflow needs to consider BTF_MEMBER_BITFIELD_SIZE
    ad5425e70789 wifi: ath9k: avoid referencing uninit memory in ath9k_wmi_ctrl_rx
    06da826e3b7d wifi: ath9k: fix AR9003 mac hardware hang check register offset calculation
    79305655961d igc: Enable and fix RX hash usage by netstack
    38a9d7dac3ad pstore/ram: Add check for kstrdup
    745cec2bd3b3 ima: Fix build warnings
    41da2c318cf1 evm: Fix build warnings
    757b06fb026c evm: Complete description of evm_inode_setattr()
    85872ffac4d8 locking/atomic: arm: fix sync ops
    cf78062aa988 x86/mm: Fix __swp_entry_to_pte() for Xen PV guests
    bd4c759d31ca perf/ibs: Fix interface via core pmu events
    87666a7d3e40 kselftest: vDSO: Fix accumulation of uninitialized ret when CLOCK_REALTIME is undefined
    f766d45ab294 rcu/rcuscale: Stop kfree_scale_thread thread(s) after unloading rcuscale
    bfe210f62518 rcu/rcuscale: Move rcu_scale_*() after kfree_scale_cleanup()
    751cb9511764 rcuscale: Move shutdown from wait_event() to wait_event_idle()
    a6d33ea30575 rcuscale: Always log error message
    e610497ba1ce rcutorture: Correct name of use_softirq module parameter
    c756e8a227c4 thermal/drivers/sun8i: Fix some error handling paths in sun8i_ths_probe()
    e2b32b0c5f0a cpufreq: intel_pstate: Fix energy_performance_preference for passive
    b51194170f9a ARM: 9303/1: kprobes: avoid missing-declaration warnings
    4864c82cb8b5 powercap: RAPL: Fix CONFIG_IOSF_MBI dependency
    2c06e0e0102f perf/arm-cmn: Fix DTC reset
    3c4f5aee3795 PM: domains: fix integer overflow issues in genpd_parse_state()
    289e2054eeb6 clocksource/drivers/cadence-ttc: Fix memory leak in ttc_timer_probe
    5017132f2f92 tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    0670c4c567b2 posix-timers: Prevent RT livelock in itimer_delete()
    f222873711a5 svcrdma: Prevent page release when nothing was received
    6689782746a3 irqchip/jcore-aic: Fix missing allocation of IRQ descriptors
    e6b7362290ba md/raid10: fix io loss while replacement replace rdev
    f4368a462b1f md/raid10: fix null-ptr-deref of mreplace in raid10_sync_request
    3c76920e547d md/raid10: fix wrong setting of max_corr_read_errors
    d3bf54a69bce md/raid10: fix overflow of md/safe_mode_delay
    a134dd582c0d md/raid10: check slab-out-of-bounds in md_bitmap_get_counter
    eb120c0aff5c blk-iocost: use spin_lock_irqsave in adjust_inuse_and_calc_cost
    1bc29ba9598c x86/resctrl: Only show tasks' pid in current pid namespace
    d9c194281bc8 fs: pipe: reveal missing function protoypes
    25aa2ad37c21 netfilter: nf_tables: drop map element references from preparation phase

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 25bd49d03af0e20808c26744e35fe7f416981017)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8361787bdb..a44cfa042f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0b2e44360ea08b441883f16826c4720546a0886c"
-SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
+SRCREV_machine ?= "116b31284aee597f71b1e608b4c0fd33fae483a8"
+SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.120"
+LINUX_VERSION ?= "5.15.122"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 517aede49c..502d6cc679 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.120"
+LINUX_VERSION ?= "5.15.122"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bb0cc3f9542c03fba314f5da44e91556c641706f"
-SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
+SRCREV_machine ?= "ba5a5a74beb8160940ac4a7bae7b3ba4bb2ae8a4"
+SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index dc2cd79f97..babd72dce9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "938c0c130bc6403d7e54ffc026a1eb32d10b34f9"
-SRCREV_machine:qemuarm64 ?= "d248c07ace0f6bf2a94eaba26a2bdbdbcfb2ec15"
-SRCREV_machine:qemumips ?= "19fdaea3b322820eb042622e68ede3cc99cdf87f"
-SRCREV_machine:qemuppc ?= "8db87cbed6574bec3ece05bf4cbb275fd3497f50"
-SRCREV_machine:qemuriscv64 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
-SRCREV_machine:qemuriscv32 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
-SRCREV_machine:qemux86 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
-SRCREV_machine:qemux86-64 ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
-SRCREV_machine:qemumips64 ?= "f7673229ddb5c9f3d77b5fb521c98f7dcd20f2ea"
-SRCREV_machine ?= "74c80e559b24dd2c75214e4affc86d71f3d8cc8a"
-SRCREV_meta ?= "820b9bdb192ae263be93e609da415c570d5acc79"
+SRCREV_machine:qemuarm ?= "359aed9e8617e74cc294c5ed7ab1ba545f3c64da"
+SRCREV_machine:qemuarm64 ?= "97e944b9f7bcc62d6dbd5457a73da3e8324efde7"
+SRCREV_machine:qemumips ?= "a8df61307d1b0dc24568183c680eacb3ec16f80c"
+SRCREV_machine:qemuppc ?= "2db940bee2b844eee8e29dc1f9b7ecae118a2455"
+SRCREV_machine:qemuriscv64 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
+SRCREV_machine:qemuriscv32 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
+SRCREV_machine:qemux86 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
+SRCREV_machine:qemux86-64 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
+SRCREV_machine:qemumips64 ?= "28984d668cee9c13a6e7d107d65f4923f3c7db7a"
+SRCREV_machine ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
+SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d54cfc420586425d418a53871290cc4a59d33501"
+SRCREV_machine:class-devupstream ?= "5c6a716301d915055c7bd6d935f7a4fccec2649c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.120"
+LINUX_VERSION ?= "5.15.122"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


