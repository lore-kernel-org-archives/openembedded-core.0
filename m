Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A26AE6FE3B
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 17:45:57 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.5013.1725644752747374633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 10:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dMXLtuGl;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a803a4f6dfso146720585a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644752; x=1726249552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmJ4N/qRAdTCndgNnFvEEpI7J4vQrLsSIZtgAzD6wjE=;
        b=dMXLtuGlc9w2qDvqp/czLbIRorqNQRy0Tgs1fULvDvHQiDYUdcCxBW1rjSN4wvOQQp
         NX9JkXlXCG1SWqhbjLm+1Zn1ID/hUXsRqV+pO0+Vo3Ajgt6J20UjY12MFZDlHeq7ecVq
         6bDcX9iHLduaE81Vp9jRWSnXOxs3QugQ81ziDO8FQrG7YAvQYInTOtvUFZKjvir6LHs4
         BsQ6iIsQHXCwCoMOmxb7pihhkWdtyuP1TVFS6ZqPR3N8/dX/I+1GA7M8638mspH5yIXc
         1w0uNn+JwhFPRsS5z4z1Eup5T9VEw/iSFpZEhyIP135p6/LtLYhhw/ujTU1flYKcLjCy
         l32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644752; x=1726249552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmJ4N/qRAdTCndgNnFvEEpI7J4vQrLsSIZtgAzD6wjE=;
        b=huxBBfS8Zqjj531tKD2sC3oQHx5XUvQSiFMZmIDrqJmiAiHWTqTWiJzlk0+3EJbLcJ
         IzVQIuhszMOaakjDCIpnK1nkAOwENbZl7knpLvmuqjpSm3paQHo/a2KrtcaXc70solkK
         JjEBAq7ROSOrVBxs13yNWe86RwlbZ0+/sb0HFBO+wP3AgwY2RQoh9EYkddVG4CfDwpKe
         CTob5QYrHsXSsS6/S2Lkb1WRm+za6HQbgaBqq4N1Ls64GHQbtUC6Hx9Q/625UGIJqQsH
         TnPZwoiGIrufHV0ZpR1KUpBVNo0/4RMgfLVWntFnXvqLzpGqZfIGHm4LrZMf5DV2L6cq
         /WpQ==
X-Gm-Message-State: AOJu0YzI+RebQ7jOA9JcDXu40gQuvliBYyDkS8hXyJzD27Y0aVq9gJBv
	Q3b9RNmOh331h5tAT444cx4z4cH3A+vTIKwN2CUw3UpKXXOt7xFHxnEIdw==
X-Google-Smtp-Source: AGHT+IHAcmRl0Tlg1ot3TQ1RKdoG7Co4nJRfbJ3Uo9piupZrhotO36CSIvXsvsDdo8Eij9ep6Gv4Hg==
X-Received: by 2002:a05:620a:2552:b0:7a8:39e:d342 with SMTP id af79cd13be357-7a8041c6f2cmr2971729485a.34.1725644751303;
        Fri, 06 Sep 2024 10:45:51 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efea9c1sm188589385a.75.2024.09.06.10.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:45:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.10: update to v6.10.7
Date: Fri,  6 Sep 2024 13:45:42 -0400
Message-Id: <fb5d7b4b1a7e1dd9d53e88e0dd3289fffacb02cd.1725644584.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725644584.git.bruce.ashfield@gmail.com>
References: <cover.1725644584.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 17:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204284

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    24873d2e5fe3 Linux 6.10.7
    cd19f1799c32 Input: MT - limit max slots
    c1e55020534c ksmbd: fix race condition between destroy_previous_session() and smb2 operations()
    91bd3b27fcbc selftests/bpf: Add a test to verify previous stacksafe() fix
    5032f940b366 drm/amdgpu/vcn: not pause dpg for unified queue
    66e126d678fb drm/amdgpu/vcn: identify unified queue in sw init
    1f4153dc7cfd Revert "pidfd: prevent creation of pidfds for kthreads"
    a3211a4c6141 drm/xe: Do not dereference NULL job->fence in trace points
    fbacee4ab66c selftests: mptcp: join: check re-using ID of closed subflow
    766915152862 selftests: mptcp: join: validate fullmesh endp on 1st sf
    0201d65d9806 mptcp: pm: avoid possible UaF when selecting endp
    9e0223e3fdf7 mptcp: pm: fullmesh: select the right ID later
    2673adb0f080 mptcp: pm: only in-kernel cannot have entries with ID 0
    152944a723d9 mptcp: pm: check add_addr_accept_max before accepting new ADD_ADDR
    2060f1efab37 mptcp: pm: only decrement add_addr_accepted for MPJ req
    9849cfc67383 mptcp: pm: only mark 'subflow' endp as available
    3b82c15db71e mptcp: pm: remove mptcp_pm_remove_subflow()
    ef7a65b6b0d4 mptcp: pm: re-using ID of unused flushed subflows
    0273b55f2575 mptcp: pm: re-using ID of unused removed subflows
    47a049b38f56 mptcp: pm: re-using ID of unused removed ADD_ADDR
    f771ed563cf1 thermal: of: Fix OF node leak in of_thermal_zone_find() error paths
    b6b864eee2a8 thermal: of: Fix OF node leak in thermal_of_zone_register()
    c856f30607e8 thermal: of: Fix OF node leak in thermal_of_trips_init() error path
    57ca481fca97 nouveau/firmware: use dma non-coherent allocator
    3f01867a3b9e pmdomain: imx: wait SSAR when i.MX93 power domain on
    d11d730b2467 pmdomain: imx: scu-pd: Remove duplicated clocks
    536457762933 smb3: fix broken cached reads when posix locks
    89523523298a mmc: dw_mmc: allow biu and ciu clocks to defer
    7adac5aee802 mmc: mtk-sd: receive cmd8 data when hs400 tuning fail
    f03ea012a3c0 cgroup/cpuset: Clear effective_xcpus on cpus_allowed clearing only if cpus.exclusive not set
    73d6c6cf8ef6 cgroup/cpuset: fix panic caused by partcmd_update
    2073132f6ed3 KVM: arm64: Make ICC_*SGI*_EL1 undef in the absence of a vGICv3
    7cb972e52bf6 KVM: arm64: vgic-debug: Don't put unmarked LPIs
    43427f98ca06 cxgb4: add forgotten u64 ivlan cast before shift
    709e4c8f78e1 ata: pata_macio: Fix DMA table overflow
    5aa77e5e86b9 Input: i8042 - use new forcenorestore quirk to replace old buggy quirk combination
    361e2b1abe42 Input: i8042 - add forcenorestore quirk to leave controller untouched even on s3
    e2f549443804 iommufd/device: Fix hwpt at err_unresv in iommufd_device_do_replace()
    8a5af26bcbb4 HID: wacom: Defer calculation of resolution until resolution_code is known
    8cbcb6d03d68 MIPS: Loongson64: Set timer mode in cpu-probe
    6c323c3b8089 net: dsa: microchip: fix PTP config failure when using multiple ports
    f1e767fe46d8 net: ngbe: Fix phy mode set to external phy
    976b77dd3d94 s390/ap: Refine AP bus bindings complete processing
    402eb19d09ed platform/x86: ISST: Fix return value on last invalid resource
    4f7a1d0869a8 platform/x86: dell-uart-backlight: Use acpi_video_get_backlight_type()
    5a04cc4450f4 ACPI: video: Add backlight=native quirk for Dell OptiPlex 7760 AIO
    69e3826f3dbf ACPI: video: Add Dell UART backlight controller detection
    9d2b75e27660 drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1
    e562415248f4 drm/amdgpu: Validate TA binary size
    bfbf265172d7 ksmbd: the buffer of smb2 query dir response has at least 1 byte
    75abfcf641d8 scsi: core: Fix the return value of scsi_logical_block_count()
    ee0799103b1a Bluetooth: MGMT: Add error handling to pair_device()
    4101af98ab57 nvme: move stopping keep-alive into nvme_uninit_ctrl()
    cda2ad784ffc smb: client: ignore unhandled reparse tags
    f80bfaddd6fe s390/boot: Fix KASLR base offset off by __START_KERNEL bytes
    a944cba5d576 s390/boot: Avoid possible physmem_info segment corruption
    c380c4525258 thermal/debugfs: Fix the NULL vs IS_ERR() confusion in debugfs_create_dir()
    98aa0330f200 drm/xe: Free job before xe_exec_queue_put
    8ea8f445626b drm/xe: Don't initialize fences at xe_sched_job_create()
    c2e9566230bc drm/xe: Split lrc seqno fence creation up
    317459a6ef20 drm/xe: Decouple job seqno and lrc seqno
    a126cd463b11 drm/xe: Relax runtime pm protection during execution
    b09ef3b762a7 drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
    52a5c47ae9c0 io_uring/kbuf: sanitize peek buffer setup
    ecb15b8ca12c mmc: mmc_test: Fix NULL dereference on allocation failure
    619402552558 drm/xe: Fix tile fini sequence
    b1c9fbed3884 drm/xe: reset mmio mappings with devm
    73da27bf4604 drm/xe/mmio: move mmio_fini over to devm
    f7ecdd9853dd drm/xe: Fix opregion leak
    0ab76ba3e784 drm/xe/display: stop calling domains_driver_remove twice
    32720bad49bd drm/i915/hdcp: Use correct cp_irq_count
    83b24c55373a spi: spi-cadence-quadspi: Fix OSPI NOR failures during system resume
    a13c0863b853 drm/msm: fix the highest_bank_bit for sc7180
    91d09642127a workqueue: Fix spruious data race in __flush_work()
    90a6a844b2d9 workqueue: Fix UBSAN 'subtraction overflow' error in shift_and_mask()
    c45960049676 drm/msm/dpu: take plane rotation into account for wide planes
    1498f752d039 drm/msm/dpu: relax YUV requirements
    8a849648cea6 drm/msm/dpu: limit QCM2290 to RGB formats only
    02193c707231 drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
    3adb8ed9362f drm/msm/dp: reset the link phy params before link training
    3bacf814b6a6 drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
    86d7701fe8d3 drm/msm/dp: fix the max supported bpp logic
    91e9e01dde79 drm/msm/dpu: don't play tricks with debug macros
    c096aba0eb87 s390/iucv: Fix vargs handling in iucv_alloc_device()
    55bdfa45dda3 net: ovs: fix ovs_drop_reasons error
    322803c1f5b0 net: xilinx: axienet: Fix dangling multicast addresses
    e952f7a70fc6 net: xilinx: axienet: Always disable promiscuous mode
    4934f341a647 octeontx2-af: Fix CPT AF register offset calculation
    043a18bb6cf1 netfilter: flowtable: validate vlan header
    95a305ba259b bnxt_en: Fix double DMA unmapping for XDP_REDIRECT
    fc88d6c1f289 ipv6: prevent possible UAF in ip6_xmit()
    56efc2531967 ipv6: fix possible UAF in ip6_finish_output2()
    e44bd76dd072 ipv6: prevent UAF in ip6_send_skb()
    a9a84daa5837 selftests: mlxsw: ethtool_lanes: Source ethtool lib from correct path
    e9d567f92123 udp: fix receiving fraglist GSO packets
    e5bb2988a310 netem: fix return value if duplicate enqueue fails
    f87ce03c652d net: dsa: mv88e6xxx: Fix out-of-bound access
    b52bd8bcb9e8 igb: cope with large MAX_SKB_FRAGS
    0def33090ab3 dpaa2-switch: Fix error checking in dpaa2_switch_seed_bp()
    81c1d306cef9 ice: use internal pf id instead of function number
    41ae0571f174 ice: fix truesize operations for PAGE_SIZE >= 8192
    8ea33d92efcf ice: fix ICE_LAST_OFFSET formula
    d6e5aa2b6038 ice: fix page reuse when PAGE_SIZE is over 8k
    0ecdf86e6158 bonding: fix xfrm state handling when clearing active slave
    89fc1dca79db bonding: fix xfrm real_dev null pointer dereference
    b70b0ddfed31 bonding: fix null pointer deref in bond_ipsec_offload_ok
    8cdd74c48f92 bonding: fix bond_ipsec_offload_ok return type
    0f9b9d280f91 ip6_tunnel: Fix broken GRO
    5bf9e37bdb77 netfilter: nft_counter: Synchronize nft_counter_reset() against reader.
    0cafb0245c34 netfilter: nft_counter: Disable BH in nft_counter_offload_stats().
    9c8d544ed619 kcm: Serialise kcm_sendmsg() for the same socket.
    47e40e5de163 net: mctp: test: Use correct skb for route input check
    f6fd2dbf584a tcp: prevent concurrent execution of tcp_sk_exit_batch
    830ac8d41e79 selftests: udpgro: no need to load xdp for gro
    021c2c0cd5ea selftests: udpgro: report error when receive failed
    dc172f63ff83 tc-testing: don't access non-existent variable on exception
    2ae52a65a850 net/mlx5: Fix IPsec RoCE MPV trace call
    0c12cd4da98e net/mlx5e: XPS, Fix oversight of Multi-PF Netdev changes
    609cd73bf38b net: mscc: ocelot: serialize access to the injection/extraction groups
    be3a532167dd net: mscc: ocelot: fix QoS class for injected packets with "ocelot-8021q"
    2c3fcaaa8d1b net: mscc: ocelot: use ocelot_xmit_get_vlan_info() also for FDMA and register injection
    db83115a0c26 Bluetooth: SMP: Fix assumption of Central always being Initiator
    20cc4139bd93 Bluetooth: hci_core: Fix LE quote calculation
    2179b1c66c08 Bluetooth: HCI: Invert LE State quirk to be opt-out rather then opt-in
    7adc1123d285 kbuild: avoid scripts/kallsyms parsing /dev/null
    024d4a7ce52b kbuild: merge temporary vmlinux for BTF and kallsyms
    f6c020392fd9 Makefile: add $(srctree) to dependency of compile_commands.json target
    b0eccfc2b422 ALSA: hda/tas2781: Use correct endian conversion
    d4e24c82bbdf platform/surface: aggregator: Fix warning when controller is destroyed in probe
    59670ab6f667 wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850
    525b6f47d2a0 dm suspend: return -ERESTARTSYS instead of -EINTR
    fead60a6d5f8 smb/client: avoid possible NULL dereference in cifs_free_subrequest()
    4be6542bdf11 cifs: Add a tracepoint to track credits involved in R/W requests
    a24321b6a31f thermal: gov_bang_bang: Use governor_data to reduce overhead
    bc0e4253b0e9 thermal: gov_bang_bang: Add .manage() callback
    9fc685401004 thermal: gov_bang_bang: Split bang_bang_control()
    faf271f85d16 thermal: gov_bang_bang: Drop unnecessary cooling device target state checks
    8d457d3c6c93 drm/amd/display: Don't register panel_power_savings on OLED panels
    787359c66e1f block: Fix lockdep warning in blk_mq_mark_tag_wait
    807539011292 arm64: Fix KASAN random tag seed initialization
    01b97431191a printk/panic: Allow cpu backtraces to be written into ringbuffer during panic
    18db7e44ef0b powerpc/topology: Check if a core is online
    f915a014d9dd cpu/SMT: Enable SMT only if a core is online
    00df458f8143 io_uring/napi: check napi_enabled in io_napi_add() before proceeding
    b8a04f39453a io_uring/napi: use ktime in busy polling
    487e7454e21c io_uring/napi: Remove unnecessary s64 cast
    fec0f964a985 s390/dasd: Remove DMA alignment
    4d6ac2efa0c7 rust: fix the default format for CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT
    4f687213e2cb rust: suppress error messages from CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT
    623880540747 rust: work around `bindgen` 0.69.0 issue
    d656b82c4b30 drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`
    8361791ec241 ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7
    cb0b74040593 gpio: mlxbf3: Support shutdown() function
    cc6bc2ab1663 iommu: Restore lost return in iommu_report_device_fault()
    e9f6b76a284e kallsyms: Match symbols exactly with CONFIG_LTO_CLANG
    8bab11313b17 kallsyms: Do not cleanup .llvm.<hash> suffix before sorting symbols
    c3ce2e8a568f kallsyms: get rid of code for absolute kallsyms
    76274d10bec8 kbuild: remove PROVIDE() for kallsyms symbols
    9c7a4eace752 kbuild: refactor variables in scripts/link-vmlinux.sh
    de37408d5c26 net: hns3: fix a deadlock problem when config TC during resetting
    9c73b15118f7 net: hns3: use the user's cfg after reset
    9504b5a56ac6 net: hns3: fix wrong use of semaphore up
    f28e75e7646a selftests: net: lib: kill PIDs before del netns
    e09e4c125f2b selftests: net: lib: ignore possible errors
    b4ee8cf1acc5 vsock: fix recursive ->recvmsg calls
    a99423878925 selftest: af_unix: Fix kselftest compilation warnings
    eb83dfb68cf1 netfilter: nf_tables: Add locking for NFT_MSG_GETOBJ_RESET requests
    bf031525a8b9 netfilter: nf_tables: Introduce nf_tables_getobj_single
    044462242abc netfilter: nf_tables: Audit log dump reset after the fact
    025b3326c5c4 netfilter: nf_queue: drop packets with cloned unconfirmed conntracks
    119be227bc04 netfilter: flowtable: initialise extack before use
    3e03b536d945 netfilter: nfnetlink: Initialise extack before use in ACKs
    ba328989d2fa netfilter: allow ipv6 fragments to arrive on different devices
    36e762c99e25 tcp: Update window clamping condition
    76eec7975525 mptcp: correct MPTCP_SUBFLOW_ATTR_SSN_OFFSET reserved size
    5719831ede21 mlxbf_gige: disable RX filters until RX path initialized
    b453a4bbda03 net: ethernet: mtk_wed: fix use-after-free panic in mtk_wed_setup_tc_block_cb()
    e1a0cdd5d898 net: dsa: vsc73xx: check busy flag in MDIO operations
    bc07539a21ac net: dsa: vsc73xx: pass value in phy_write operation
    fde3be436197 net: dsa: vsc73xx: fix port MAC configuration in full duplex mode
    6f642c3bf515 net: axienet: Fix register defines comment description
    91b4850e7165 atm: idt77252: prevent use after free in dequeue_rx()
    0ffaaccb041a net/mlx5e: Correctly report errors for ethtool rx flows
    8e57e66ecbdd net/mlx5e: Take state lock during tx timeout reporter
    23e64933b70c net/mlx5: SD, Do not query MPIR register if no sd_group
    3939d787139e gtp: pull network headers in gtp_dev_xmit()
    afe478f24df5 igc: Fix qbv tx latency by setting gtxoffset
    46b3b56ed2e8 igc: Fix reset adapter logics when tx mode change
    d3822bc81981 igc: Fix qbv_config_change_errors logics
    51424cf6891e igc: Fix packet still tx after gate close by reducing i226 MAC retry buffer
    f49b5d10c87c btrfs: fix invalid mapping of extent xarray state
    6e3987ac310c bpf: Fix a kernel verifier crash in stacksafe()
    9227ee25b564 bpf: Fix updating attached freplace prog in prog_array map
    308b4fc2403b libfs: fix infinite directory reads for offset dir
    b87479dee870 filelock: fix name of file_lease slab cache
    2b97d4573d27 netfs: Fault in smaller chunks for non-large folio mappings
    4c412661ef1d s390/uv: Panic for set and remove shared access UVC errors
    884bf2e60007 pidfd: prevent creation of pidfds for kthreads
    88bf2af33bbf drm/amd/amdgpu: command submission parser for JPEG
    a4e4c93b3f3c drm/amdgpu/jpeg4: properly set atomics vmid field
    b825a42f94e4 drm/amdgpu/jpeg2: properly set atomics vmid field
    72a54e12baf0 drm/amd/display: fix cursor offset on rotation 180
    27d50c733742 drm/amd/display: Enable otg synchronization logic for DCN321
    20d3d99a3b69 drm/amd/display: fix s2idle entry for DCN3.5+
    90b50807067a drm/amd/display: Adjust cursor position
    21b578f1d599 memcg_write_event_control(): fix a user-triggerable oops
    924aabb58ca6 drm/amdgpu: Actually check flags for all context ops.
    e5d0b299147b btrfs: only enable extent map shrinker for DEBUG builds
    6e6cf14fb66a btrfs: tree-checker: add dev extent item checks
    0e40841983f9 btrfs: zoned: properly take lock to read/update block group's zoned variables
    f6b733a34b15 btrfs: only run the extent map shrinker from kswapd tasks
    2115138e2167 btrfs: check delayed refs when we're checking if a ref exists
    1dc4c9631c29 btrfs: send: allow cloning non-aligned extent if it ends at i_size
    e1a885bff557 btrfs: tree-checker: reject BTRFS_FT_UNKNOWN dir type
    f63a724cbabd mm/numa: no task_numa_fault() call if PTE is changed
    c91618816f4d mm/vmalloc: fix page mapping if vm_area_alloc_pages() with high order fallback to order 0
    99d95c312bf7 mm/numa: no task_numa_fault() call if PMD is changed
    71f44df3ec6b alloc_tag: introduce clear_page_tag_ref() helper function
    411afd869462 selftests: memfd_secret: don't build memfd_secret test on unsupported arches
    824dd2e253fb mm/memory-failure: use raw_spinlock_t in struct memory_failure_cpu
    f347118732e0 alloc_tag: mark pages reserved during CMA activation as not tagged
    3f21150c1557 selinux: add the processing of the failure of avc_add_xperms_decision()
    e812b8c210a7 selinux: fix potential counting error in avc_add_xperms_decision()
    0a4d41fa14b2 fs/netfs/fscache_cookie: add missing "n_accesses" check
    1f566eb912d1 wifi: brcmfmac: cfg80211: Handle SSID based pmksa deletion
    462ff7dd86b4 net: mana: Fix doorbell out of order violation and avoid unnecessary doorbell rings
    0c87420f3ac9 media: atomisp: Fix streaming no longer working on BYT / ISP2400 devices
    e6bea6a45f8a net: mana: Fix RX buf alloc_size alignment and atomic op panic
    2febf5fdbf5d md/raid1: Fix data corruption for degraded array with slow disk
    7300dadba49e mm/hugetlb: fix hugetlb vs. core-mm PT locking
    6edb8c9eb98a mm: fix endless reclaim on machines with unaccepted memory
    abdb9ddaaab4 rtla/osnoise: Prevent NULL dereference in error handling
    5fc922bef4ef mseal: fix is_madv_discard()
    6b980b0ab5c8 perf/bpf: Don't call bpf_overflow_handler() for tracing events
    eb961c5a0539 tracing: Return from tracing_buffers_read() if the file has been closed
    500f32bb78c0 i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
    c69d18f0ac70 fix bitmap corruption on close_range() with CLOSE_RANGE_UNSHARE
    9063ab49c11e vfs: Don't evict inode under the inode lru traversing context
    5362312ad97e dm persistent data: fix memory allocation failure
    b6c130059fc5 dm resume: don't return EINVAL when signalled
    2a949267f181 arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    514207d3a591 ACPI: EC: Evaluate _REG outside the EC scope more carefully
    e91d5b47585a ACPICA: Add a depth argument to acpi_execute_reg_methods()
    2853e1376d81 i2c: tegra: Do not mark ACPI devices as irq safe
    5460d1268f58 smb3: fix lock breakage for cached writes
    1e1670cadfad riscv: entry: always initialize regs->a0 to -ENOSYS
    b0a43efe59de riscv: change XIP's kernel_map.size to be size of the entire kernel
    9e3b266afcfe KEYS: trusted: dcp: fix leak of blob encryption key
    652563a7294b KEYS: trusted: fix DCP blob payload length assignment
    505c65de8987 thermal: gov_bang_bang: Call __thermal_cdev_update() directly
    027ac3c50925 KVM: s390: fix validity interception issue when gisa is switched off
    5d4a304338da s390/dasd: fix error recovery leading to data corruption on ESE devices
    1484e013bfd0 ALSA: timer: Relax start tick time check for slave timer elements
    bbd157e20933 ALSA: hda/tas2781: fix wrong calibrated data order
    7ca24cf9163c thunderbolt: Mark XDomain as unplugged when router is removed
    8fb9d412ebe2 xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration
    770cacc75b00 usb: xhci: Check for xhci->interrupters being allocated in xhci_mem_clearup()
    a40cad994de4 usb: misc: ljca: Add Lunar Lake ljca GPIO HID to ljca_gpio_hids[]
    695ef133e750 ALSA: usb-audio: Support Yamaha P-125 quirk entry
    3157994e2405 ALSA: usb-audio: Add delay quirk for VIVO USB-C-XE710 HEADSET
    1371d32b9597 char: xillybus: Check USB endpoints when probing device
    ca9c30ac2e15 char: xillybus: Refine workqueue handling
    aa1a19724fa2 char: xillybus: Don't destroy workqueue from work item running on it
    18a067240817 fuse: Initialize beyond-EOF page contents before setting uptodate
    b7e42e7904d9 netfs, ceph: Revert "netfs: Remove deprecated use of PG_private_2 as a second writeback flag"
    23aabbc68ab8 selinux: revert our use of vma_is_initial_heap()
    6bc7b628343e Revert "usb: typec: tcpm: clear pd_event queue in PORT_RESET"
    321aecb079e9 Revert "serial: 8250_omap: Set the console genpd always on if no console suspend"
    2eb973ee4770 Revert "misc: fastrpc: Restrict untrusted app to attach to privileged PD"
    22736ba2ebc6 Revert "ACPI: EC: Evaluate orphan _REG under EC device"
    a394bca0020d tty: atmel_serial: use the correct RTS flag.
    3ecf625d4acb tty: serial: fsl_lpuart: mark last busy before uart_add_one_port
    78b4c71f55a1 tty: vt: conmakehash: remove non-portable code printing comment header
    7ba498d9d1bb Linux 6.10.6
    4676556ae4a1 Revert "drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()"
    64cd57692a29 Revert "ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error"
    bebe9a9c9c02 media: Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"
    1cb249cf1c9b drm/amdgpu/display: Fix null pointer dereference in dc_stream_program_cursor_position
    2c1dcfccf988 drm/amd/display: Solve mst monitors blank out problem after resume
    9350ba06ee61 binfmt_flat: Fix corruption when not offsetting data start
    d38574ff500b platform/x86: ideapad-laptop: add a mutex to synchronize VPC commands
    fc6c6bb34f5d platform/x86: ideapad-laptop: move ymc_trigger_ec from lenovo-ymc
    c0d39578c35e platform/x86: ideapad-laptop: introduce a generic notification chain
    d5f8a9623920 platform/x86/amd/pmf: Fix to Update HPD Data When ALS is Disabled
    bbc521aac2b3 ALSA: usb: Fix UBSAN warning in parse_audio_unit()
    e8473e125aad fs/ntfs3: Do copy_to_user out of run_lock
    234e6ea0855c jfs: Fix shift-out-of-bounds in dbDiscardAG
    9c2ac38530d1 jfs: fix null ptr deref in dtInsertEntry
    440ab7f97261 fou: remove warn in gue_gro_receive on unsupported protocol
    323ef20b5558 f2fs: fix to cover read extent cache access with lock
    26c07775fb5d f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
    380ea255e9c1 bpf, net: Use DEV_STAT_INC()
    6781b091331d ASoC: cs35l56: Patch CS35L56_IRQ1_MASK_18 to the default value
    15b5b0a069b1 nvme/pci: Add APST quirk for Lenovo N60z laptop
    268a625399c6 LoongArch: Define __ARCH_WANT_NEW_STAT in unistd.h
    f52ca32e1dba drm/amd/display: Prevent IPX From Link Detect and Set Mode
    ac5134f66433 drm/amd/display: Separate setting and programming of cursor
    87443b3c9a31 drm/amd/display: Defer handling mst up request in resume
    90dfbba89ad4 exec: Fix ToCToU between perm check and set-uid/gid usage
    4ead4c82a6d6 Linux 6.10.5
    d924a0be2f21 btrfs: fix double inode unlock for direct IO sync writes
    ec87dd608453 selftests: mptcp: join: test both signal & subflow
    aedbd140d72f selftests: mptcp: join: ability to invert ADD_ADDR check
    0f21cc29bc13 mptcp: pm: do not ignore 'subflow' if 'signal' flag is also set
    f706e2928082 mptcp: pm: don't try to create sf if alloc failed
    a94f269274a5 mptcp: pm: reduce indentation blocks
    9417df61e5e7 drm/amd/display: Change ASSR disable sequence
    c36e922a36bd drm/amd/display: Add null check in resource_log_pipe_topology_update
    7f71acdb075e idpf: fix memleak in vport interrupt configuration
    3831170f7406 btrfs: fix corruption after buffer fault in during direct IO append write
    31a679a88010 Revert "drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update"
    d8d16fc1efb9 Revert "drm/amd/display: Handle HPD_IRQ for internal link"
    3118c43a563d block: use the right type for stub rq_integrity_vec()
    1694a24c3e32 mptcp: pm: deny endp with signal + subflow + port
    88ef794ae683 mptcp: fully established after ADD_ADDR echo on MPJ
    325609c355df drm/radeon: Remove __counted_by from StateArray.states[]
    9d96b91e03cb drm/mgag200: Bind I2C lifetime to DRM device
    667f01bde401 drm/mgag200: Set DDC timeout in milliseconds
    ab023247c809 drm/lima: Mark simple_ondemand governor as softdep
    dc0027ff578d drm/dp_mst: Skip CSN if topology probing is not done yet
    e8857af3944b drm/bridge: analogix_dp: properly handle zero sized AUX transactions
    f70942b5eedf sched/core: Fix unbalance set_rq_online/offline() in sched_cpu_deactivate()
    5a1263d95358 sched/core: Introduce sched_set_rq_on/offline() helper
    d0c87a3c6be1 sched/smt: Fix unbalance sched_smt_present dec/inc
    3cb359667358 sched/smt: Introduce sched_smt_present_inc/dec() helper
    388f1c954019 x86/mtrr: Check if fixed MTRRs exist before saving them
    718ea0de5c9d x86/paravirt: Fix incorrect virt spinlock setting on bare metal
    b909124d3b90 btrfs: avoid using fixed char array size for tree names
    954d55a59b25 net/tcp: Disable TCP-AO static key after RCU grace period
    4589f77c18dd mm: list_lru: fix UAF for memory cgroup
    a6ce683090e5 selftests: mm: add s390 to ARCH check
    384f383c5aa7 eventfs: Use SRCU for freeing eventfs_inodes
    06238772f50f eventfs: Don't return NULL in eventfs_create_dir()
    0e55b31fb9d4 smb3: fix setting SecurityFlags when encryption is required
    da0ffe84fcc1 padata: Fix possible divide-by-0 panic in padata_mt_helper()
    236bb4690773 tracing: Fix overflow in get_free_elt()
    531dc6780d94 tracing: Have format file honor EVENT_FILE_FL_FREED
    230ebcdfb3fa power: supply: axp288_charger: Round constant_charge_voltage writes down
    ad969d3fa335 power: supply: axp288_charger: Fix constant_charge_voltage writes
    2e9ec2e681bf power: supply: qcom_battmgr: return EAGAIN when firmware service is not up
    0a993247a997 LoongArch: Enable general EFI poweroff method
    b4542a5de28c genirq/irqdesc: Honor caller provided affinity in alloc_desc()
    55e54e950813 irqchip/riscv-aplic: Retrigger MSI interrupt on source configuration
    08b2670a8d06 irqchip/xilinx: Fix shift out of bounds
    267d1ae667cf kcov: properly check for softirq context
    df6a03499e1a spmi: pmic-arb: Pass the correct of_node to irq_domain_add_tree
    0e05c806a258 ASoC: amd: yc: Add quirk entry for OMEN by HP Gaming Laptop 16-n0xxx
    533de2f470ba parisc: fix a possible DMA corruption
    858414233941 parisc: fix unaligned accesses in BPF
    51c0b1bb7541 memcg: protect concurrent access to mem_cgroup_idr
    26a02ac723de tty: vt: conmakehash: cope with abs_srctree no longer in env
    6a6730812220 serial: sc16is7xx: fix invalid FIFO access with special register set
    09cfe05e9907 serial: sc16is7xx: fix TX fifo corruption
    68dc02f319b9 serial: core: check uartclk for zero to avoid divide by zero
    e689fcf08f3e timekeeping: Fix bogus clock_was_set() invocation in do_adjtimex()
    61a050c54d7f ntp: Safeguard against time_constant overflow
    061da60716ce tracefs: Use generic inode RCU for synchronizing freeing
    21e694df0e3e tracefs: Fix inode allocation
    aa6b80ac2f39 arm64: dts: ti: k3-am62-verdin-dahlia: Keep CTRL_SLEEP_MOCI# regulator on
    cd490a247ddf driver core: Fix uevent_show() vs driver detach race
    35671ea90c68 ntp: Clamp maxerror and esterror to operating range
    0801d021cdd7 spmi: pmic-arb: add missing newline in dev_err format strings
    98f26387c84d vhost-vdpa: switch to use vmf_insert_pfn() in the fault handler
    312286d281b0 media: v4l: Fix missing tabular column hint for Y14P format
    7dd12f85f150 tick/broadcast: Move per CPU pointer access into the atomic section
    c07a91935136 scsi: ufs: core: Fix hba->last_dme_cmd_tstamp timestamp updating logic
    9c9e0d495beb scsi: ufs: core: Do not set link to OFF state while waking up from hibernation
    f13f1858a28c scsi: ufs: core: Fix deadlock during RTC update
    35bd464ee8e9 scsi: mpi3mr: Avoid IOMMU page faults on REPORT ZONES
    998a01a7f333 usb: gadget: u_audio: Check return codes from usb_ep_enable and config_ep_by_speed.
    0dbdb5ead3f4 usb: gadget: f_fs: restore ffs_func_disable() functionality
    3abba6e6f62f usb: gadget: u_serial: Set start_delayed during suspend
    9f865526d725 usb: gadget: midi2: Fix the response for FB info with block 0xff
    716cba46f73a usb: gadget: core: Check for unset descriptor
    eaf01a990645 usb: typec: fsa4480: Check if the chip is really there
    9db7aabbcf94 USB: serial: debug: do not echo input by default
    c3d0857b7fc2 usb: vhci-hcd: Do not drop references before new references are gained
    33c1f0b2e707 ALSA: hda/hdmi: Yet more pin fix for HP EliteDesk 800 G4
    8fb88d9b40ad ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core Ultra) to quirks
    88e45a2ec16f ALSA: hda: Add HP MP9 G4 Retail System AMS to force connect list
    51d87f11dd19 ALSA: line6: Fix racy access to midibuf
    1ae918806c22 io_uring/net: don't pick multiple buffers for non-bundle send
    006cf6583310 io_uring/net: ensure expanded bundle send gets marked for cleanup
    1f16fdd1fdc8 io_uring/net: ensure expanded bundle recv gets marked for cleanup
    f3ba31ee4c85 drm/test: fix the gem shmem test to map the sg table.
    3599648ea1d9 drm/i915/display: correct dual pps handling for MTL_PCH+
    612cae53e99c drm/client: fix null pointer dereference in drm_client_modeset_probe
    93faaddaeea2 drm/i915/gem: Adjust vma offset for framebuffer mmap offset
    c28d207edfc5 drm/amdgpu: Forward soft recovery errors to userspace
    70275bb960c7 drm/amd/display: Skip Recompute DSC Params if no Stream on Link
    ead9289a51ea drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
    87d601cdc6c5 module: make waiting for a concurrent module loader interruptible
    89f51d7c2cf7 module: warn about excessively long module waits
    bc7467911d66 cifs: cifs_inval_name_dfs_link_error: correct the check for fullpath
    f1c03386567c ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
    399618a25c04 drm/xe: Take ref to VM in delayed snapshot
    cebc39a7b725 drm/xe: Minor cleanup in LRC handling
    578d9752cb52 drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write
    c802eff84c85 drm/xe: Use dma_fence_chain_free in chain fence unused as a sync
    d5a918255bbe drm/xe/rtp: Fix off-by-one when processing rules
    b19482f0239a ALSA: usb-audio: Re-add ScratchAmp quirk entries
    5caa28f90335 spi: spi-fsl-lpspi: Fix scldiv calculation
    1e99ea46e180 drm/amd/display: Replace dm_execute_dmub_cmd with dc_wake_and_execute_dmub_cmd
    81507ec40e6e drm/i915: Attempt to get pages without eviction first
    d302c0bba4f7 drm/i915: Allow evicting to use the requested placement
    457482a0a8ae i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
    d0e357e15b82 drm/atomic: allow no-op FB_ID updates for async flips
    8237f7e43604 ASoC: cs35l56: Handle OTP read latency over SoundWire
    e5421a8b407b ASoC: cs35l56: Revert support for dual-ownership of ASP registers
    d4227e19002a i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume
    5b6baaa7cbd7 ASoC: cs-amp-lib: Fix NULL pointer crash if efi.get_variable is NULL
    0fcc4a5b5b48 kprobes: Fix to check symbol prefixes correctly
    8c7eab0e8abc bpf: kprobe: remove unused declaring of bpf_kprobe_override
    8c8352f492c6 i2c: smbus: Send alert notifications to all devices if source not found
    de831a578f11 ASoC: SOF: Remove libraries from topology lookups
    153773fed3e7 spi: spidev: Add missing spi_device_id for bh2228fv
    1adf51ab4292 ASoC: sti: add missing probe entry for player and reader
    6c3edc4dd32e ASoC: codecs: wsa884x: Correct Soundwire ports mask
    9cddf33a1c25 ASoC: codecs: wsa884x: parse port-mapping information
    e0dfca620796 ASoC: codecs: wsa883x: Correct Soundwire ports mask
    d0b794ea35e6 ASoC: codecs: wsa883x: parse port-mapping information
    1f05464ae0c8 ASoC: codecs: wsa881x: Correct Soundwire ports mask
    ee40a8d92621 ASoC: codecs: wcd939x-sdw: Correct Soundwire ports mask
    784d7c42ed65 ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
    819964b42b8b i2c: smbus: Improve handling of stuck alerts
    04c2c4d836ff nfsd: don't set SVC_SOCK_ANONYMOUS when creating nfsd sockets
    8fc52b4ea61c arm64: errata: Expand speculative SSBS workaround (again)
    754af8d64a20 arm64: cputype: Add Cortex-A725 definitions
    b60768a082c4 arm64: cputype: Add Cortex-X1C definitions
    6f2e3bdbf15d arm64: errata: Expand speculative SSBS workaround
    fc22c58b9517 arm64: errata: Unify speculative SSBS errata logic
    a7f5093b246d arm64: cputype: Add Cortex-X925 definitions
    61ebc5439c31 arm64: cputype: Add Cortex-A720 definitions
    9667fa6bf96c arm64: cputype: Add Cortex-X3 definitions
    2edbb3e8838c net: drop bad gso csum_start and offset in virtio_net_hdr
    f35d394293ed sched/cputime: Fix mul_u64_u64_div_u64() precision for cputime
    7ed155d1176e irqchip/loongarch-cpu: Fix return value of lpic_gsi_to_irq()
    79f72e9ea3cf irqchip/meson-gpio: Convert meson_gpio_irq_controller::lock to 'raw_spinlock_t'
    6a6d54ef81a4 media: intel/ipu6: select AUXILIARY_BUS in Kconfig
    154395895d71 media: ipu-bridge: fix ipu6 Kconfig dependencies
    ac6bd13dabf3 scsi: mpt3sas: Avoid IOMMU page faults on REPORT ZONES
    5ffed5a6a26a scsi: Revert "scsi: sd: Do not repeat the starting disk message"
    76bb99e80671 clocksource: Fix brown-bag boolean thinko in cs_watchdog_read()
    69b801f303df profiling: remove profile=sleep support
    b35cd7f1e969 mm, slub: do not call do_slab_free for kfence object
    2aafcd20c74b SUNRPC: Fix a race to wake a sync task
    f619876ccbfd ext4: sanity check for NULL pointer after ext4_force_shutdown
    2429ea3b4330 s390/sclp: Prevent release of buffer in I/O
    974fccd61758 drm/amd/display: Fix null pointer deref in dcn20_resource.c
    1c047adeaae1 jbd2: avoid memleak in jbd2_journal_write_metadata_buffer
    04fd4f17966c ext4: fix uninitialized variable in ext4_inlinedir_to_tree
    208deb6d8c3c media: xc2028: avoid use-after-free in load_firmware_cb()
    1e68b7ce6bc6 drm/amd/display: Fix NULL pointer dereference for DTN log in DCN401
    d99d79869cdc media: uvcvideo: Fix the bandwdith quirk on USB 3.x
    785c56c9c165 media: uvcvideo: Ignore empty TS packets
    04674c406020 media: i2c: ov5647: replacing of_node_put with __free(device_node)
    1686675405d0 drm/amd/display: Add null checker before passing variables
    3ab61af2901c drm/amd/display: remove dpp pipes on failure to update pipe params
    39b217193729 drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute
    150f56fffe2c drm/amd/display: reduce ODM slice count to initial new dc state only when needed
    37834c8cacd7 drm/amd/display: Wake DMCUB before sending a command for replay feature
    604ea7e92f21 drm/amd/display: Add NULL check for 'afb' before dereferencing in amdgpu_dm_plane_handle_cursor_update
    6fd9b044bde5 media: amphion: Remove lock in s_ctrl callback
    16a8a2a839d1 drm/amd/display: Add null checks for 'stream' and 'plane' before dereferencing
    69a441473fec drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
    e1ab38e99d16 drm/amdgpu: Add lock around VF RLCG interface
    4fd52f7c2c11 drm/admgpu: fix dereferencing null pointer context
    13937a40aae4 drm/amdgpu/pm: Fix the null pointer dereference in apply_state_adjust_rules
    033187a70ba9 drm/amdgpu: Fix the null pointer dereference to ras_manager
    7f56f050f02c drm/amdgpu/pm: Fix the null pointer dereference for smu7
    4d4604ebf8ac drm/xe/xe_guc_submit: Fix exec queue stop race condition
    4c59fc86bf28 drm/amd/amdkfd: Fix a resource leak in svm_range_validate_and_map()
    05c1df9e893d drm/amdgpu/pm: Fix the param type of set_power_profile_mode
    0ee7cfafcc22 drm/amdgpu: fix potential resource leak warning
    4f125f894e5a drm/amd/display: Add delay to improve LTTPR UHBR interop
    3922a520bf3e drm/amd/display: Handle HPD_IRQ for internal link
    458bb83119df drm/xe/preempt_fence: enlarge the fence critical section
    28bbb5011a97 Bluetooth: btnxpuart: Shutdown timer and prevent rearming when driver unloading
    1a5a14707aac btrfs: fix bitmap leak when loading free space cache on duplicate entry
    4879d7294588 btrfs: fix data race when accessing the last_trans field of a root
    9e556d540b9d btrfs: reduce nesting for extent processing at btrfs_lookup_extent_info()
    98251cd60b4d btrfs: do not BUG_ON() when freeing tree block after error
    d3b403209f76 btrfs: do not clear page dirty inside extent_write_locked_range()
    ff012dd4b5ae mlxsw: pci: Lock configuration space of upstream bridge during reset
    e7279593a1e2 net: stmmac: qcom-ethqos: enable SGMII loopback during DMA reset on sa8775p-ride-r3
    2406fa2adfc7 can: mcp251xfd: tef: update workaround for erratum DS80000789E 6 of mcp2518fd
    7bb632e8f820 can: mcp251xfd: tef: prepare to workaround broken TEF FIFO tail index erratum
    9ae2ed6f26c8 wifi: nl80211: don't give key data to userspace
    13663a7c644b bpf: add missing check_func_arg_reg_off() to prevent out-of-bounds memory accesses
    05fb2bf477d3 udf: prevent integer overflow in udf_bitmap_free_blocks()
    a5594c1e03b0 wifi: mac80211: fix NULL dereference at band check in starting tx ba session
    91191059d927 PCI: Add Edimax Vendor ID to pci_ids.h
    67e8a89ffcd3 af_unix: Don't retry after unix_state_lock_nested() in unix_stream_connect().
    33e320ec6cdc wifi: rtw89: pci: fix RX tag race condition resulting in wrong RX length
    a7f41c0179f6 selftests/bpf: Fix send_signal test with nested CONFIG_PARAVIRT
    50d8009a0ac0 net/mlx5e: SHAMPO, Fix invalid WQ linked list unlink
    fc70ac360855 wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()
    ede08585b16d wifi: rtlwifi: handle return value of usb init TX/RX
    bad85b5d9c6a wifi: ath12k: fix race due to setting ATH12K_FLAG_EXT_IRQ_ENABLED too early
    ac3bf6e47fd8 wifi: nl80211: disallow setting special AP channel widths
    9337c3e5a911 thermal: intel: hfi: Give HFI instances package scope
    fe704c7d88cc ACPI: resource: Skip IRQ override on Asus Vivobook Pro N6506MJ
    f4d388559ca6 ACPI: resource: Skip IRQ override on Asus Vivobook Pro N6506MU
    49f2a5da6785 xen: privcmd: Switch from mutex to spinlock for irqfds
    4ededa02c6f5 soc: qcom: icc-bwmon: Allow for interrupts to be shared across instances
    809d5e839811 cpufreq: amd-pstate: auto-load pstate driver by default
    5da2633513b5 cpufreq: amd-pstate: Allow users to write 'default' EPP string
    25d53aad9173 ACPI: SBS: manage alarm sysfs attribute through psy core
    7953227c3c0e ACPI: battery: create alarm sysfs attribute atomically
    417a820de025 clocksource/drivers/sh_cmt: Address race condition for clock events
    aa162aa4aa38 rcu: Fix rcu_barrier() VS post CPUHP_TEARDOWN_CPU invocation
    c31a8f14eadf block: change rq_integrity_vec to respect the iterator
    d59c4d0eb6ad nvme: apple: fix device reference counting
    04fb17e9f95b debugobjects: Annotate racy debug variables
    4811d6e5d9f4 md/raid5: avoid BUG_ON() while continue reshape after reassembling
    e0fa1325d50d md: change the return value type of md_write_start to void
    e6a81438b2df md: do not delete safemode_timer in mddev_suspend
    1e67ea9f7058 rcutorture: Fix rcu_torture_fwd_cb_cr() data race
    5da3af03c9fe platform/chrome: cros_ec_lpc: Add a new quirk for ACPI id
    866c820aee2b Revert "rcu-tasks: Fix synchronize_rcu_tasks() VS zap_pid_ns_processes()"
    72d74d053d18 hwmon: corsair-psu: add USB id of HX1200i Series 2023 psu
    d776c0486b03 gpio: prevent potential speculation leaks in gpio_device_get_desc()
    9a3f1490f9b2 regmap: kunit: Fix memory leaks in gen_regmap() and gen_raw_regmap()
    9bd6911af522 net: dsa: microchip: disable EEE for KSZ8567/KSZ9567/KSZ9896/KSZ9897.
    d9dbfcacc8d7 net: pse-pd: tps23881: include missing bitfield.h header
    3c3a575046d2 net: fec: Stop PPS on driver remove
    16d6cd28f706 net: bcmgenet: Properly overlay PHY and MAC Wake-on-LAN capabilities
    977de64fa2f5 l2tp: fix lockdep splat
    3cde714b0e77 idpf: fix UAFs when destroying the queues
    6b289f8d9153 idpf: fix memory leaks and crashes while performing a soft reset
    abd573e9ad2b bnxt_en : Fix memory out-of-bounds in bnxt_fill_hw_rss_tbl()
    f3d5efe18a11 net: dsa: bcm_sf2: Fix a possible memory leak in bcm_sf2_mdio_register()
    a5cf11cb51cf net/smc: add the max value of fallback reason count
    09e309f3962e Bluetooth: hci_sync: avoid dup filtering when passive scanning with adv monitor
    699ca84febb9 Bluetooth: l2cap: always unlock channel in l2cap_conless_channel()
    dea5daecca8a ice: Fix reset handler
    f3535cfd8c93 net: dsa: microchip: Fix Wake-on-LAN check to not return an error
    9b60320d991d net: linkwatch: use system_unbound_wq
    b2f794b168cf net: bridge: mcast: wait for previous gc cycles when removing port
    c6c5b91424fa net: usb: qmi_wwan: fix memory leak for not ip packets
    87629b6bb46c virtio-net: unbreak vq resizing when coalescing is not negotiated
    f39bdb5f0e13 gve: Fix use of netif_carrier_ok()
    709f88426d88 net: pse-pd: tps23881: Fix the device ID check
    e809a84c8023 sctp: Fix null-ptr-deref in reuseport_add_sock().
    3c5d0871b0af power: supply: rt5033: Bring back i2c_set_clientdata
    3e82abbb5539 smb: client: handle lack of FSCTL_GET_REPARSE_POINT support
    9acf64448adb x86/mm: Fix pti_clone_entry_text() for i386
    df3eecb5496f x86/mm: Fix pti_clone_pgtable() alignment assumption
    6eefe92f2ed0 selftests: ksft: Fix finished() helper exit code on skipped tests
    0c7c3dc54683 perf/x86: Fix smp_processor_id()-in-preemptible warnings
    a9d6d466bcf0 perf/x86: Support counter mask
    ed6a9349ef84 perf/x86/intel: Support the PEBS event mask
    7904a62c5332 perf/x86/amd: Use try_cmpxchg() in events/amd/{un,}core.c
    08118810a987 jump_label: Fix the fix, brown paper bags galore
    862bdc8d30a8 platform/x86/intel/ifs: Initialize union ifs_status to zero
    12663246c4a1 irqchip/mbigen: Fix mbigen node address layout
    5c9618a3b6ea platform/x86: intel-vbtn: Protect ACPI notify handler against recursion
    56a295701bb5 perf/x86/intel/cstate: Add pkg C2 residency counter for Sierra Forest
    0f4ed1ca93f6 perf/x86/intel/cstate: Add Lunarlake support
    16923df3feaf perf/x86/intel/cstate: Add Arrowlake support
    bf846b5a92fd locking/pvqspinlock: Correct the type of "old" variable in pv_kick_node()
    6b2fb1728532 drm/amd/display: Refactor function dm_dp_mst_is_port_support_mode()
    33420ab58bea Linux 6.10.4
    9b49bb5faf40 selftests: mptcp: join: check backup support in signal endp
    f2f239aebe60 selftests: mptcp: join: validate backup in MPJ
    fe2f8f5b2d70 selftests: mptcp: always close input's FD if opened
    9f7492e3b38d selftests: mptcp: fix error path
    00749436d614 mptcp: fix duplicate data handling
    5d756f8865fe mptcp: pm: only set request_bkup flag when sending MP_PRIO
    8586723dd96b mptcp: pm: fix backup support in signal endpoints
    01403733de2d mptcp: fix bad RCVPRUNED mib accounting
    2b471bf003a7 mptcp: mib: count MPJ with backup flag
    adfaef947854 mptcp: fix NL PM announced address accounting
    73e2baa301ee mptcp: distinguish rcv vs sent backup flag in requests
    a702415f3a16 mptcp: fix user-space PM announced address accounting
    752eed6675d2 r8169: don't increment tx_dropped in case of NETDEV_TX_BUSY
    2c9d235defd2 net: wan: fsl_qmc_hdlc: Discard received CRC
    f223d2b4acb7 net: wan: fsl_qmc_hdlc: Convert carrier_lock spinlock to a mutex
    1e9fefa405d4 net: usb: sr9700: fix uninitialized variable use in sr_mdio_read
    63f10d9a2525 io_uring: keep multishot request NAPI timeout current
    976a76a307e2 wifi: mac80211: use monitor sdata with driver only if desired
    6629fb104038 wifi: ath12k: fix soft lockup on suspend
    d872903661c8 nouveau: set placement to original placement on uvmm validate.
    13e485ab4a7c Bluetooth: hci_event: Fix setting DISCOVERY_FINDING for passive scanning
    5d4aa25f47cd drm/v3d: Validate passed in drm syncobj handles in the performance extension
    5c56f104edd0 drm/v3d: Validate passed in drm syncobj handles in the timestamp extension
    ad5fdc48f7a6 drm/v3d: Fix potential memory leak in the performance extension
    9b5033ee2c5a drm/v3d: Fix potential memory leak in the timestamp extension
    73ad583bd493 drm/v3d: Prevent out of bounds access in performance query extensions
    e951cc1c6f80 drm/i915: Fix possible int overflow in skl_ddi_calculate_wrpll()
    2e9e3399caa6 drm/virtio: Fix type of dma-fence context variable
    c85694c4a744 drm/amdgpu: fix contiguous handling for IB parsing v2
    226128518a84 drm/ast: Fix black screen after resume
    b5b011587c83 drm/ast: astdp: Wake up during connector status detection
    af6441e6f3d4 drm/vmwgfx: Fix handling of dumb buffers
    c98ab18b9f31 drm/vmwgfx: Fix a deadlock in dma buf fence polling
    619186e7964e PCI: pciehp: Retain Power Indicator bits for userspace indicators
    36c255db5a25 Revert "ALSA: firewire-lib: operate for period elapse event in process context"
    bf48015786a8 Revert "ALSA: firewire-lib: obsolete workqueue for period update"
    5692e90af3df ALSA: seq: ump: Optimize conversions from SysEx to UMP
    ece30d03d281 ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
    c624c592506a ALSA: usb-audio: Correct surround channels in UAC1 channel map
    aaba54c78f10 mptcp: sched: check both directions for backup
    1171ceccabfd protect the fetch of ->fd[fd] in do_dup2() from mispredictions
    061e41581606 btrfs: make cow_file_range_inline() honor locked_page on error
    8c1847ee3b81 btrfs: do not subtract delalloc from avail bytes
    1467321cd716 btrfs: zoned: fix zone_unusable accounting on making block group read-write again
    6eb1d257986f HID: wacom: Modify pen IDs
    ed66c582d8f2 platform/chrome: cros_ec_proto: Lock device when updating MKBP version
    494b14138201 s390/fpu: Re-add exception handling in load_fpu_state()
    c3f1d4f61d06 ceph: force sending a cap update msg back to MDS for revoke op
    e3144eccc49a rust: SHADOW_CALL_STACK is incompatible with Rust
    bea081b0d453 arm64: jump_label: Ensure patched jump_labels are visible to all CPUs
    2119cf5e5d75 riscv: Fix linear mapping checks for non-contiguous memory regions
    fd7df98c2a76 RISC-V: Enable the IPI before workqueue_online_cpu()
    d4e7db757e2d riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
    f080c6fc86b5 perf: riscv: Fix selecting counters in legacy mode
    d4d3d34a2c6b perf arch events: Fix duplicate RISC-V SBI firmware event name
    5d4aaf16a825 riscv/purgatory: align riscv_kernel_entry
    4041f8c6b582 ipv6: fix ndisc_is_useropt() handling for PIO
    adbb901c848f igc: Fix double reset adapter triggered from a single taprio cmd
    6eac2b62975f net/mlx5e: Add a check for the return value from mlx5_port_set_eth_ptys
    89064d09c56b net/mlx5e: Fix CT entry update leaks of modify header context
    9f1323148493 net/mlx5e: Require mlx5 tc classifier action support for IPsec prio capability
    091268f3c27a net/mlx5: Fix missing lock on sync reset reload
    1fe4ad66e41d net/mlx5: Lag, don't use the hardcoded value of the first port
    ffd9f0a385b8 net/mlx5: Fix error handling in irq_pool_request_irq
    6048dec75455 net/mlx5: Always drain health in shutdown callback
    87dba44e9471 netfilter: iptables: Fix potential null-ptr-deref in ip6table_nat_table_init().
    08ed888b69a2 netfilter: iptables: Fix null-ptr-deref in iptable_nat_table_init().
    0faa80c71ea2 drm/atomic: Allow userspace to use damage clips with async flips
    dee804047d7b drm/atomic: Allow userspace to use explicit sync with atomic async flips
    2873144891d3 ALSA: hda: Conditionally use snooping for AMD HDMI
    40efbeede8e4 s390/mm/ptdump: Fix handling of identity mapping area
    b4f4cf72a15e net: phy: micrel: Fix the KSZ9131 MDI-X status issue
    3d61be3e5b5d net: mvpp2: Don't re-use loop iterator
    b0edc32edcb9 drm/i915/hdcp: Fix HDCP2_STREAM_STATUS macro
    69620522c48c net/iucv: fix use after free in iucv_sock_close()
    fbe74e7ec62a ice: xsk: fix txq interrupt mapping
    41fe958255e1 ice: add missing WRITE_ONCE when clearing ice_rx_ring::xdp_prog
    448040a01738 ice: improve updating ice_{t,r}x_ring::xsk_pool
    064235851a38 ice: toggle netif_carrier when setting up XSK pool
    cc35d9e09db8 ice: modify error handling when setting XSK pool in ndo_bpf
    ec58ff3e1661 ice: replace synchronize_rcu with synchronize_net
    db088e42aa22 ice: don't busy wait for Rx queue disable in ice_qp_dis()
    a29b4548fed5 ice: respect netif readiness in AF_XDP ZC related ndo's
    1dcb9554062e i915/perf: Remove code to update PWR_CLK_STATE for gen12
    37f69a1c3a4f rtnetlink: Don't ignore IFLA_TARGET_NETNSID when ifname is specified in rtnl_dellink().
    310cb7168650 net: axienet: start napi before enabling Rx/Tx
    3f4fa2fb7b08 tcp: Adjust clamping window for applications specifying SO_RCVBUF
    4e3fcca489f0 ethtool: fix setting key and resetting indir at once
    c0f412961653 drm/client: Fix error code in drm_client_buffer_vmap_local()
    99e194a4804c Bluetooth: hci_sync: Fix suspending with wrong filter policy
    0a5899d8a4c6 Bluetooth: btintel: Fail setup on error
    feacd3a96467 ALSA: hda: conexant: Fix headset auto detect fail in the polling mode
    0fb5ef1884be net: phy: realtek: add support for RTL8366S Gigabit PHY
    8bc93b1d6de9 wifi: cfg80211: correct S1G beacon length calculation
    d37dac0dc59a wifi: cfg80211: fix reporting failed MLO links status with cfg80211_connect_done
    3a5b68869dbe sched: act_ct: take care of padding in struct zones_ht_key
    20dc9c50e7af drm/vmwgfx: Trigger a modeset when the screen moves
    b4e635472139 ethtool: rss: echo the context number back
    554bc917615a netlink: specs: correct the spec of ethtool
    bc57f879a420 bnxt_en: Fix RSS logic in __bnxt_reserve_rings()
    865cc600e1bb drm/vmwgfx: Fix overlay when using Screen Targets
    9b35b1ea2602 drm/vmwgfx: Make sure the screen surface is ref counted
    2a1b327d57a8 drm/nouveau: prime: fix refcount underflow
    b501f612fe89 drm/gpuvm: fix missing dependency to DRM_EXEC
    99bdfbb86892 perf tool: fix dereferencing NULL al->maps
    bafa1a95dd21 HID: amd_sfh: Move sensor discovery before HID device initialization
    cc4b131a8665 ARM: 9408/1: mm: CFI: Fix some erroneous reset prototypes
    825da6965666 ARM: 9406/1: Fix callchain_trace() return value
    7893355a0d61 MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
    94c05c544ac2 MIPS: dts: loongson: Fix liointc IRQ polarity
    a178ce8f64b9 MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
    9562e9aa0926 perf/x86/intel: Add a distinct name for Granite Rapids
    6c0793bf8a98 perf/x86/intel: Switch to new Intel CPU model defines
    fef1a538afaa perf: imx_perf: fix counter start and config sequence
    0cd106612396 f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr is valid
    23b865a8f3fb f2fs: fix to avoid use SSR allocate when do defragment
    49dba573ef7c ext4: check the extent status again before inserting delalloc block
    9c1d07d3cffe ext4: factor out a common helper to query extent map
    5a7c40674bb4 mm/migrate: putback split folios when numa hint migration fails
    d14b3b0e3082 mm/migrate: move NUMA hinting fault folio isolation + checks under PTL
    e820fb0e4385 mm/migrate: make migrate_misplaced_folio() return 0 on success
    cd0e079e2752 mm: fix khugepaged activation policy
    82dd589d3009 mm/huge_memory: mark racy access onhuge_anon_orders_always
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index c217ab779b..5d4f83f11a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c0094e55e84db839eb3624a2f99d826dd3cbb3e3"
-SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
+SRCREV_machine ?= "58d857542b4ba97fc3089d167f6351f792693ee0"
+SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.3"
+LINUX_VERSION ?= "6.10.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index f7993bbf15..9c39cb5fc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.3"
+LINUX_VERSION ?= "6.10.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
+SRCREV_machine ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index fb3c244a94..caa5623cdc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4562f66c12f660d40de2c8dc2b53f851ba1d7847"
-SRCREV_machine:qemuarm64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemuloongarch64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemumips ?= "8ef41c4428d1eb040edbae58b685bcba6472ab9b"
-SRCREV_machine:qemuppc ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemuriscv64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemuriscv32 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemux86 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemux86-64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_machine:qemumips64 ?= "c1f8e21e4999d233df12ee60c7a47cad144e7344"
-SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
-SRCREV_meta ?= "e4d2ade39f231ea279f19298c008ba48f4a202e5"
+SRCREV_machine:qemuarm ?= "2b451aac57bb8b34e116d16c66b56176d8686767"
+SRCREV_machine:qemuarm64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemuloongarch64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemumips ?= "c9b841ee5d71bbaad7e70698fe18e8b14fe65f2c"
+SRCREV_machine:qemuppc ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemuriscv64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemuriscv32 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemux86 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemux86-64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_machine:qemumips64 ?= "53591dc9fd63616ba2b0b62fd9c6880ad03b1623"
+SRCREV_machine ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
+SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d29de02effd4e8816333582ed8230d41e14a73dc"
+SRCREV_machine:class-devupstream ?= "24873d2e5fe32f4635cf8406ff3b8d16f6e47505"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.3"
+LINUX_VERSION ?= "6.10.7"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


