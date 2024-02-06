Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076AEC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:56 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.4294.1707252827035230335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JcUjm5lI;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-783d4b3ad96so381780585a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252826; x=1707857626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtZNdTrmwYXTO2xsl8bTDoMUhmWo7VGlQAemMF1zygY=;
        b=JcUjm5lIsx6lnX/V4ztdu5py0hrX30qxOvuJjG4HE7gFcVcDk7rCuiXBvPBEieK/aa
         Cz4xOsM+/UbA1JlZTSsesBQl6mLj+jywgjjoWCW8/Dnlyo4BEybt1ziOpgE/J/O7VUhp
         fpZL0G1srQz4fpmtfIXbG4ccQJrsVMRiPitE171RLjom3GuGgZkhNPDxb18EpyPFXQPH
         DSZfNkLuJkjVJAZ6IQYo+iptSn9cDJ+Bpw1r8K7eNB/+KBEUmK1YwJDix8iRajdPYGVh
         8t7aWFrC7rGYVGb0vizwH4TqYIm44NktzpjLRL3iid8VN62yZo+A6qBspvnot5wF0O67
         qP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252826; x=1707857626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtZNdTrmwYXTO2xsl8bTDoMUhmWo7VGlQAemMF1zygY=;
        b=W1/Ws6OanPAQNhrOWHgpjuqp/CEmzBLXj9lSLhgsqcacJ7J7R5aTMzJyHr+zCTpE8j
         OOAjqCPbstyO5vD+FainsA+6fWPBVdLauxIkkihBVaaf8dlxS1BtYuCY/oegktxLuLCt
         tF3gcPoztnkfAFyRJrrcRkXnMjkxc0TQzF2Yu8A/BzyOj3MmWn0Ao0iXeyfNBywb6/Rg
         oqEhnjPPawTe+dOyWAJ0OPXNHMH00OzTm+ndMA9rty8Ies6gEmHT27cKzwxgN2J7RjpO
         4yqVLMp5QrS4so9XLS7edu4keBmWRfyRZreWTVMO5HGLdz7q2z4eHNif92mqy+vo0LFc
         wqzg==
X-Gm-Message-State: AOJu0YzzU830OTOaYTaWXf6gnPAlLXm8scD62F5D/gln8PgzMjKx2gKs
	sHKOArYk6mTPglWii7qPD/CG8Q+CuF+GbVOWSCCMrq7s24XA59mjJGmwPX77lJYpAQ==
X-Google-Smtp-Source: AGHT+IE30r2cGXzsb5ptxP+iKav8JJbO0KVoBALx1u1VdLB2tM6ETv56bfUDCfzXqu++FddxaEjHBw==
X-Received: by 2002:a05:620a:a84:b0:783:fdc2:51e8 with SMTP id v4-20020a05620a0a8400b00783fdc251e8mr3633146qkg.6.1707252825382;
        Tue, 06 Feb 2024 12:53:45 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.6: update to v6.6.15
Date: Tue,  6 Feb 2024 15:53:33 -0500
Message-Id: <dff65feed490a271b59c31dc122a07a8d6fb16cd.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195032

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    51f354b815c4 Linux 6.6.15
    ee82479f5d74 thermal: trip: Drop lockdep assertion from thermal_zone_trip_id()
    0e9999661575 serial: core: fix kernel-doc for uart_port_unlock_irqrestore()
    de66d97add11 x86/entry/ia32: Ensure s32 is sign extended to s64
    500ad5da1df3 tick/sched: Preserve number of idle sleeps across CPU hotplug events
    af7ab5da390e clocksource: Skip watchdog check for large watchdog intervals
    5966ed9caae3 genirq: Initialize resend_node hlist for all interrupt descriptors
    33f49a68352d mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
    40cb184ec84e cxl/region：Fix overflow issue in alloc_hpa()
    099fee35bb09 drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
    d21fbe290c33 MIPS: lantiq: register smp_ops on non-smp platforms
    0232a19a0e21 spi: fix finalize message on error return
    d69a84cbbc30 cifs: fix stray unlock in cifs_chan_skip_or_disable
    1bd81374bc2f spi: spi-cadence: Reverse the order of interleaved write and read operations
    26e85f7b0a16 spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
    9f30ab3bec2e cpufreq/amd-pstate: Fix setting scaling max/min freq values
    ee4a2ef15153 drm/bridge: anx7625: Ensure bridge is suspended in disable()
    1539adf760c3 block: Move checking GENHD_FL_NO_PART to bdev_add_partition()
    902a4aab0e04 spi: intel-pci: Remove Meteor Lake-S SoC PCI ID from the list
    cd6f39f7df66 ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd
    16b70a75daa7 gpio: eic-sprd: Clear interrupt after set the interrupt type
    a1703748bbaf firmware: arm_scmi: Use xa_insert() when saving raw queues
    1c6d42e55d6c firmware: arm_scmi: Use xa_insert() to store opps
    dea5460b09eb drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
    38a31370ba4d drm/exynos: fix accidental on-stack copy of exynos_drm_plane
    e791a345fa73 memblock: fix crash when reserved memory is not added to memory
    0b2e0fea95af drm/bridge: parade-ps8640: Make sure we drop the AUX mutex in the error case
    52044fb2abe8 drm/bridge: parade-ps8640: Ensure bridge is suspended in .post_disable()
    4f59acbe0837 drm/bridge: sii902x: Fix audio codec unregistration
    56f96cf6eb11 drm/bridge: sii902x: Fix probing race issue
    7ed0974c1648 drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02
    0ae3437f4185 drm: panel-simple: add missing bus flags for Tianma tm070jvhg[30/33]
    b2ca364dc531 drm/bridge: parade-ps8640: Wait for HPD when doing an AUX transfer
    5ff487d180dc drm/amdgpu/gfx11: set UNORD_DISPATCH in compute MQDs
    b59ea95e72e0 drm/amdgpu/gfx10: set UNORD_DISPATCH in compute MQDs
    5ff670093596 drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
    8aa99aa455be drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
    6a0c7eb466db drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49 V8.0
    02cfae7d6278 drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT
    e017ec3807d4 drm/i915/lnl: Remove watchdog timers for PSR
    46ac4e1f9a9d btrfs: zoned: optimize hint byte for zoned allocator
    b1e30e2ff6eb btrfs: zoned: factor out prepare_allocation_zoned()
    4739a8a989db serial: sc16is7xx: fix unconditional activation of THRI interrupt
    a38e80d02eba serial: sc16is7xx: Use port lock wrappers
    984095ad73f5 serial: core: Provide port lock wrappers
    9128bfbc5c80 mm: migrate: fix getting incorrect page mapping during page migration
    9d23fab89ace mm: migrate: record the mlocked page status to remove unnecessary lru drain
    d10ff0b3eaf6 thermal: gov_power_allocator: avoid inability to reset a cdev
    77451ef587aa thermal: core: Store trip pointer in struct thermal_instance
    3a3bbc6911f5 thermal: trip: Drop redundant trips check from for_each_thermal_trip()
    cca763863768 media: i2c: imx290: Properly encode registers as little-endian
    8798fdc28463 media: v4l2-cci: Add support for little-endian encoded registers
    8d2cd1724e80 media: v4l: cci: Add macros to obtain register width and address
    36bf2a8fb0ae media: v4l: cci: Include linux/bits.h
    68e51bdb1194 pipe: wakeup wr_wait after setting max_usage
    67f457955ba8 fs/pipe: move check to pipe_has_watch_queue()
    019ccc66d56a thermal: intel: hfi: Add syscore callbacks for system-wide PM
    0caf5dd01adf thermal: intel: hfi: Disable an HFI instance when all its CPUs go offline
    de791353675f thermal: intel: hfi: Refactor enabling code into helper functions
    4690558e756c net/bpf: Avoid unused "sin_addr_len" warning when CONFIG_CGROUP_BPF is not set
    b565f41b9f20 drm/amd/display: Fix uninitialized variable usage in core_link_ 'read_dpcd() & write_dpcd()' functions
    dcda362dc5b4 drm/amdgpu/pm: Fix the power source flag error
    6aa5ede66651 drm/amd/display: Fix late derefrence 'dsc' check in 'link_set_dsc_pps_packet()'
    d3af41be094a drm/amd/display: Align the returned error code with legacy DP
    fbc4ee5ca79b drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A
    22ae604aea14 drm/amd/display: Fix variable deferencing before NULL check in edp_setup_replay()
    b788696f9ed0 drm/amdgpu: correct the cu count for gfx v11
    7510670bb46a drm/bridge: nxp-ptn3460: simplify some error checking
    6266b3a312b7 Revert "drm/amd/display: fix bandwidth validation failure on DCN 2.1"
    107a11637f43 drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
    50eb6bf4aca2 drm/amd/display: fix bandwidth validation failure on DCN 2.1
    45aafb507575 drm: Allow drivers to indicate the damage helpers to ignore damage clips
    1055077473e3 drm/virtio: Disable damage clipping if FB changed since last page-flip
    87b3b45ce7b4 drm: Disable the cursor plane on atomic contexts with virtualized drivers
    adc0787f0c0e drm/tidss: Fix atomic_flush check
    080f932a35d5 drm: Fix TODO list mentioning non-KMS drivers
    c1074ae81805 drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
    d7afdf360f4a drm: Don't unref the same fb many times by mistake due to deadlock handling
    0d87d67f447d Revert "drm/i915/dsi: Do display on sequence later on icl+"
    212b686863b4 cpufreq: intel_pstate: Refine computation of P-state for given frequency
    c9c63d6a4541 gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
    a0ebcdab1951 xfs: read only mounts with fsopen mount API are busted
    8b5bacce2d13 drm/amdgpu: Fix the null pointer when load rlc firmware
    e256f6d36496 Revert "drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync"
    9b5e1b93c83e firmware: arm_scmi: Check mailbox/SMT channel for consistency
    9863a53100f4 ksmbd: fix global oob in ksmbd_nl_policy
    847e1eb30e26 platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
    ace6fb9da63e platform/x86: intel-uncore-freq: Fix types in sysfs callbacks
    6653118b176a netfilter: nf_tables: reject QUEUE/DROP verdict parameters
    e5888acbf1a3 netfilter: nft_chain_filter: handle NETDEV_UNREGISTER for inet/ingress basechain
    4d53556d87cd hv_netvsc: Calculate correct ring size when PAGE_SIZE is not 4 Kbytes
    b7d2eee1f538 nfsd: fix RELEASE_LOCKOWNER
    870171899d75 wifi: iwlwifi: fix a memory corruption
    841460c14f88 exec: Fix error handling in begin_new_exec()
    801474eac6f9 rbd: don't move requests to the running list on errors
    ec794a752819 btrfs: don't abort filesystem when attempting to snapshot deleted subvolume
    5556a872e9e9 btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
    be725b06a4c3 btrfs: don't warn if discard range is not aligned to sector
    ad854a86da15 btrfs: tree-checker: fix inline ref size in error messages
    2b772a75963f btrfs: ref-verify: free ref cache before clearing mount opt
    3eaf00d2f81f btrfs: avoid copying BTRFS_ROOT_SUBVOL_DEAD flag to snapshot of subvolume being deleted
    6f74989f5909 btrfs: zoned: fix lock ordering in btrfs_zone_activate()
    642b9c520ef2 btrfs: scrub: avoid use-after-free when chunk length is not 64K aligned
    d60ff1d313e6 tsnep: Fix XDP_RING_NEED_WAKEUP for empty fill ring
    3fc1e534993b tsnep: Remove FCS for XDP data path
    a7be76ca102c net: fec: fix the unhandled context fault from smmu
    09d60387d8c1 selftests: bonding: do not test arp/ns target with mode balance-alb/tlb
    20b98e3c493a fjes: fix memleaks in fjes_hw_setup
    31e5a8cdc8c9 i40e: update xdp_rxq_info::frag_size for ZC enabled Rx queue
    f95b542f3a81 i40e: set xdp_rxq_info::frag_size
    6ae1d209c6a5 xdp: reflect tail increase for MEM_TYPE_XSK_BUFF_POOL
    c61f2bf87065 ice: update xdp_rxq_info::frag_size for ZC enabled Rx queue
    e1ae4a6b3ad7 intel: xsk: initialize skb_frag_t::bv_offset in ZC drivers
    339a48b0564c ice: remove redundant xdp_rxq_info registration
    8a7dffa16bb3 i40e: handle multi-buffer packets that are shrunk by xdp prog
    728e112df761 ice: work on pre-XDP prog frag count
    82ee4781b820 xsk: fix usage of multi-buffer BPF helpers for ZC XDP
    1474a8aff1d3 bpf: Add bpf_sock_addr_set_sun_path() to allow writing unix sockaddr from bpf
    6d71331eb044 bpf: Propagate modified uaddrlen from cgroup sockaddr programs
    b6e1a1b3b270 xsk: make xsk_buff_pool responsible for clearing xdp_buff::flags
    cce713664548 xsk: recycle buffer in case Rx queue was full
    bf47ffc1a527 selftests: netdevsim: fix the udp_tunnel_nic test
    8c63896d993c selftests: net: fix rps_default_mask with >32 CPUs
    938729484cfa net: mvpp2: clear BM pool before initialization
    6264994be8f2 net: stmmac: Wait a bit for the reset to take effect
    c1be9784f3ad netfilter: nf_tables: validate NFPROTO_* family
    2989f1c4c2c7 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
    9882495d02ec netfilter: nft_limit: reject configurations that cause integer overflow
    0d58883c3c60 rcu: Defer RCU kthreads wakeup when CPU is dying
    2897c981ee63 net/mlx5e: fix a potential double-free in fs_any_create_groups
    b21db3f1ab79 net/mlx5e: fix a double-free in arfs_create_groups
    5fe8c422eb05 net/mlx5e: Ignore IPsec replay window values on sender side
    268353082293 net/mlx5e: Allow software parsing when IPsec crypto is enabled
    ee8ad3d2f34e net/mlx5: Use mlx5 device constant for selecting CQ period mode for ASO
    5deca3981243 net/mlx5: DR, Can't go to uplink vport on RX rule
    fc56e47ca071 net/mlx5: DR, Use the right GVMI number for drop action
    5160ae8da385 net/mlx5: Bridge, fix multicast packets sent to uplink
    63a77caa1d72 net/mlx5: Bridge, Enable mcast in smfs steering mode
    5d3f7d302008 net/mlx5: Fix a WARN upon a callback command failure
    74cec142f89b net/mlx5e: Fix peer flow lists handling
    40e0d0746390 net/mlx5e: Fix operation precedence bug in port timestamping napi_poll context
    9ed46144cff3 net/sched: flower: Fix chain template offload
    d42566f50090 selftests: fill in some missing configs for net
    050855e311ab ipv6: init the accept_queue's spinlocks in inet6_create
    b17ca9a469f8 netlink: fix potential sleeping issue in mqueue_flush_file
    ff149e92ee90 selftest: Don't reuse port for SO_INCOMING_CPU test.
    74b85edb206f tcp: Add memory barrier to tcp_push()
    a53411e805e0 afs: Hide silly-rename files from userspace
    a1eebe76e187 tracing: Ensure visibility when inserting an element into tracing_map
    1c45256e5990 netfs, fscache: Prevent Oops in fscache_put_cache()
    7a73190ea557 net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
    784207bd2ed1 net: micrel: Fix PTP frame parsing for lan8814
    34ffe229f7a6 tun: add missing rx stats accounting in tun_xdp_act
    33a8980008c4 tun: fix missing dropped counter in tun_xdp_act
    e855dded4b70 net: fix removing a namespace with conflicting altnames
    ef8ad3071dfa udp: fix busy polling
    f1f34a515fb1 llc: Drop support for ETH_P_TR_802_2.
    cafd3ad3fe03 llc: make llc_ui_sendmsg() more robust against bonding changes
    da2d1d362754 vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
    7cf36993f805 bnxt_en: Prevent kernel warning when running offline self test
    55830bded231 bnxt_en: Wait for FLR to complete during probe
    168e7e599860 tcp: make sure init the accept_queue's spinlocks once
    8590162a455b selftests: bonding: Increase timeout to 1200s
    a164c2922675 net/smc: fix illegal rmb_desc access in SMC-D connection dump
    587c58929761 wifi: mac80211: fix potential sta-link leak
    3f5aab7efd40 SUNRPC: use request size to initialize bio_vec in svc_udp_sendto()
    14bafd198066 cifs: after disabling multichannel, mark tcon for reconnect
    fe8c187fc22f cifs: fix a pending undercount of srv_count
    30b1d56452ec cifs: fix lock ordering while disabling multichannel
    f56fc61bb531 Revert "drm/amd: Enable PCIe PME from D3"
    c7890937cf36 selftests/bpf: check if max number of bpf_loop iterations is tracked
    bfc5c19b4b48 bpf: keep track of max number of bpf_loop callback iterations
    5cac3cb678ba selftests/bpf: test widening for iterating callbacks
    1a5a03617bb9 bpf: widening for callback iterators
    6b99fe48f515 selftests/bpf: tests for iterating callbacks
    b43550d7d58e bpf: verify callbacks as if they are called unknown number of times
    f661df8fe0b5 bpf: extract setup_func_entry() utility function
    bb8bf2d3caf5 bpf: extract __check_reg_arg() utility function
    e030da5f517c selftests/bpf: track string payload offset as scalar in strobemeta
    d9631d0d8c93 selftests/bpf: track tcp payload offset as scalar in xdp_synproxy
    ae5e9c3ced95 bpf: print full verifier states on infinite loop detection
    00808be797c1 selftests/bpf: test if state loops are detected in a tricky case
    c8f6d285825f bpf: correct loop detection for iterators convergence
    7f764ea0c8e6 selftests/bpf: tests with delayed read/precision makrs in loop body
    ab470fefce28 bpf: exact states comparison for iterator convergence checks
    b8615d7ff2b3 bpf: extract same_callsites() as utility function
    4c6352f35eb2 bpf: move explored_state() closer to the beginning of verifier.c
    364366f5bbd9 dt-bindings: net: snps,dwmac: Tx coe unsupported
    4c78c771f3aa ksmbd: Add missing set_freezable() for freezable kthread
    f5ef78c4ab44 ksmbd: send lease break notification on FILE_RENAME_INFORMATION
    9554d4934b81 ksmbd: don't increment epoch if current state and request state are same
    e9ec6665de8f ksmbd: fix potential circular locking issue in smb2_set_ea()
    fc0db77b182b ksmbd: set v2 lease version on lease upgrade
    90b8cbd90abb serial: Do not hold the port lock when setting rx-during-tx GPIO
    26c3817cc8ff mm: page_alloc: unreserve highatomic page blocks before oom
    4e32f5998f44 LoongArch/smp: Call rcutree_report_cpu_starting() earlier
    5c0471daa8c7 serial: sc16is7xx: improve do/while loop in sc16is7xx_irq()
    8ed85bdd1f2f serial: sc16is7xx: remove obsolete loop in sc16is7xx_port_irq()
    fbce37f616ba serial: sc16is7xx: fix invalid sc16is7xx_lines bitfield in case of probe error
    084c24e788d9 serial: sc16is7xx: convert from _raw_ to _noinc_ regmap functions for FIFO
    9879e1bec3c0 serial: sc16is7xx: change EFR lock to operate on each channels
    2f6ae16a5874 serial: sc16is7xx: remove unused line structure member
    fc3de570cb30 serial: sc16is7xx: remove global regmap from struct sc16is7xx_port
    f769407d0194 serial: sc16is7xx: remove wasteful static buffer in sc16is7xx_regmap_name()
    452ed2b218b1 serial: sc16is7xx: improve regmap debugfs by using one regmap per port
    1db06b3d7d4b rename(): fix the locking of subdirectories
    70064241f222 mm/sparsemem: fix race in accessing memory_section->usage
    62efb1e656f4 mm/rmap: fix misplaced parenthesis of a likely()
    e6cdfb699ebf selftests: mm: hugepage-vmemmap fails on 64K page size systems
    ff8cb8bc46ca kexec: do syscore_shutdown() in kernel_kexec
    17be0ede8a6d ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    6c4c57669de4 efi: disable mirror feature during crashkernel
    ce51369287dd nouveau/vmm: don't set addr on the fail path to avoid warning
    49a76c08bcfc rtc: Extend timeout for waiting for UIP to clear to 1s
    9d20185601a0 rtc: Add support for configuring the UIP timeout for RTC reads
    d2d8ceb74834 rtc: mc146818-lib: Adjust failure return code for mc146818_get_time()
    905d9e1c69b2 rtc: Adjust failure return code for cmos_set_alarm()
    484514580275 rtc: cmos: Use ACPI alarm for non-Intel x86 systems too
    58eb5c07f417 arm64: entry: fix ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
    569156e4fa34 arm64/sme: Always exit sme_alloc() early with existing storage
    f5da59f2bbce arm64: errata: Add Cortex-A510 speculative unprivileged load workaround
    236a9bf2a7ec arm64: Rename ARM64_WORKAROUND_2966298
    eab6917e1016 riscv: mm: Fixup compat mode boot failure
    724103429a2d riscv: mm: Fixup compat arch_get_mmap_end
    8254d54d00eb media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
    26f3ae1aa854 media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.
    9399d61bf561 media: i2c: st-mipid02: correct format propagation
    095cb607f146 mmc: mmc_spi: remove custom DMA mapped buffers
    1653a8102868 mmc: core: Use mrq.sbc in close-ended ffu
    72a28c92839c media: videobuf2-dma-sg: fix vmap callback
    7af40dfdbd30 scripts/get_abi: fix source path leak
    1d64a1029884 docs: kernel_abi.py: fix command injection
    c018ab3e31b1 dlm: use kernel_connect() and kernel_bind()
    820831de220c lsm: new security_file_ioctl_compat() hook
    8b901f4f46bd ARM: dts: qcom: sdx55: fix USB SS wakeup
    42edeeb3da5c arm64: dts: qcom: sdm670: fix USB SS wakeup
    40fb94eb9805 arm64: dts: qcom: sdm670: fix USB DP/DM HS PHY interrupts
    30d15a0d16f1 arm64: dts: qcom: sc8180x: fix USB SS wakeup
    7553301a2ae9 arm64: dts: qcom: sc8180x: fix USB DP/DM HS PHY interrupts
    00804fab7c62 arm64: dts: qcom: sm8150: fix USB SS wakeup
    b0a9aec35033 arm64: dts: qcom: sm8150: fix USB DP/DM HS PHY interrupts
    8936cca43946 arm64: dts: qcom: sdm845: fix USB SS wakeup
    07859a93fc14 arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
    551d4f3776af ARM: dts: qcom: sdx55: fix USB DP/DM HS PHY interrupts
    8c80b6c37038 arm64: dts: qcom: Add missing vio-supply for AW2013
    02f867d270e4 arm64: dts: qcom: sc7280: fix usb_1 wakeup interrupt types
    9e1951a81455 arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
    e0e55b6ec189 arm64: dts: qcom: sm8150: fix USB wakeup interrupt types
    0b6f48245b50 arm64: dts: qcom: sdm670: fix USB wakeup interrupt types
    353463dfcb71 arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
    cc16b9cd186f arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
    54435ef291e1 arm64: dts: qcom: msm8939: Make blsp_dma controlled-remotely
    ebd09d8143fd arm64: dts: qcom: msm8916: Make blsp_dma controlled-remotely
    0eecce600714 arm64: dts: rockchip: Fix rk3588 USB power-domain clocks
    dc2e88e05d12 arm64: dts: rockchip: configure eth pad driver strength for orangepi r1 plus lts
    68c2defafaaa arm64: dts: sprd: fix the cpu node for UMS512
    6d86a53d8409 ARM: dts: qcom: sdx55: fix pdc '#interrupt-cells'
    bc81ecbd2a4e ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
    ee9c5e0f9528 ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
    ed3fe21f74c0 arm64: dts: qcom: sc8280xp-crd: fix eDP phy compatible
    664aaf12edc2 ARM: dts: imx6q-apalis: add can power-up delay on ixora board
    46942efb9e87 parisc/power: Fix power soft-off button emulation on qemu
    3583edd4d786 parisc/firmware: Fix F-extend for PDC addresses
    ce16274a6b8d bus: mhi: host: Add spinlock to protect WP access when queueing TREs
    eaefb9464031 bus: mhi: host: Drop chan lock before queuing buffers
    a9ebfc405fe1 bus: mhi: host: Add alignment check for event ring read pointer
    4a5a77c92bac mips: Fix max_mapnr being uninitialized on early stages
    1960f2b534da nbd: always initialize struct msghdr completely
    582014b08cb8 s390/vfio-ap: do not reset queue removed from host config
    f5b218ecc860 s390/vfio-ap: reset queues associated with adapter for queue unbound from driver
    60ad66fe639f s390/vfio-ap: reset queues filtered from the guest's AP config
    556efad373cb s390/vfio-ap: let on_scan_complete() callback filter matrix and update guest's APCB
    dabc0fe4a98e s390/vfio-ap: loop over the shadow APCB when filtering guest's AP configuration
    c69d82119761 s390/vfio-ap: always filter entire AP matrix
    075c01f60bee soc: fsl: cpm1: qmc: Fix rx channel reset
    07d45e912521 soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
    d0160e74e943 soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
    240fd0215d3f media: ov01a10: Enable runtime PM before registering async sub-device
    000339cb5d27 media: ov13b10: Enable runtime PM before registering async sub-device
    92d25e02ee16 media: ov9734: Enable runtime PM before registering async sub-device
    4e6cef3fae5c rpmsg: virtio: Free driver_override when rpmsg_remove()
    252ae106eacf media: imx355: Enable runtime PM before registering async sub-device
    532a5557da68 soc: qcom: pmic_glink_altmode: fix port sanity check
    f7190b6101e6 mtd: rawnand: Clarify conditions to enable continuous reads
    c376f862ecca mtd: rawnand: Prevent sequential reads with on-die ECC engines
    b1dca19b105c mtd: rawnand: Fix core interference with sequential reads
    f813840066ca mtd: rawnand: Prevent crossing LUN boundaries during sequential reads
    38c12f10990a mtd: maps: vmu-flash: Fix the (mtd core) switch to ref counters
    a979f56aa4b9 PM / devfreq: Fix buffer overflow in trans_stat_show
    c1f525a1470f s390/vfio-ap: unpin pages on gisc registration failure
    d68ac38895e8 crypto: s390/aes - Fix buffer overread in CTR mode
    ecabe8cd456d hwrng: core - Fix page fault dead lock on mmap-ed hwrng
    7692e29d191c PM: hibernate: Enforce ordering during image compression/decompression
    b1a67a0d1ace crypto: api - Disallow identical driver names
    f36d200a80a3 erofs: fix lz4 inplace decompression
    7ebf812b7019 crypto: lib/mpi - Fix unexpected pointer access in mpi_ec_init
    5e570e600b24 btrfs: sysfs: validate scrub_speed_max value
    3da8706499cc OPP: Pass rounded rate to _set_opp()
    1107f0ecc9ff arm64: properly install vmlinuz.efi
    e681e29d1f59 PM: sleep: Fix possible deadlocks in core system-wide PM code
    e400343c6eb2 async: Introduce async_schedule_dev_nocall()
    a40683bb7bcd async: Split async_schedule_node_domain()
    da9008da9640 ext4: allow for the last group to be marked as trimmed
    f70557d48215 powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
    cc29591dacdf cifs: update iface_last_update on each query-and-update
    50e8363ecc85 cifs: handle servers that still advertise multichannel after disabling
    07e864089a0e cifs: reconnect worker should take reference on server struct unconditionally
    3a0ef868fb8a Revert "cifs: reconnect work should have reference on server struct"
    3e1615361b6f cifs: handle when server stops supporting multichannel
    5075e9f4e046 cifs: handle when server starts supporting multichannel
    173ddac64b47 cifs: reconnect work should have reference on server struct
    c395f798a7f2 cifs: handle cases where a channel is closed
    38298acb7899 smb: client: fix parsing of SMB3.1.1 POSIX create context
    5157319fc52e sh: ecovec24: Rename missed backlight field from fbdev to dev
    3b4b35d7cd63 scsi: core: Kick the requeue list after inserting when flushing
    a720833e6b8a riscv: Fix an off-by-one in get_early_cmdline()
    cf4669c30a8a scsi: ufs: core: Remove the ufshcd_hba_exit() call from ufshcd_async_scan()
    e23d6ba5029b dmaengine: idxd: Move dma_free_coherent() out of spinlocked context
    7f0ccfad2031 dmaengine: fix NULL pointer in channel unregistration function
    3dc9e1c7e00f dmaengine: fsl-edma: fix eDMAv4 channel allocation issue
    e4e845c8ddd2 iio: adc: ad7091r: Enable internal vref if external vref is not supplied
    89c4e63324e2 iio: adc: ad7091r: Allow users to configure device events
    c70a7684b1a5 iio: adc: ad7091r: Set alert bit in config register
    97d574fce644 net: stmmac: Prevent DSA tags from breaking COE
    b643b836c639 net: stmmac: Tx coe sw fallback
    cfaa04a3ab50 soundwire: fix initializing sysfs for same devices on different buses
    154cfc3d2738 soundwire: bus: introduce controller_id
    9744575e6955 serial: core: set missing supported flag for RX during TX GPIO
    28c85cd0a671 serial: core: Simplify uart_get_rs485_mode()
    e961f8c6966a docs: kernel_feat.py: fix potential command injection
    db6e7e5fd442 docs: sparse: add sparse.rst to toctree
    a4bc5da72eae docs: sparse: move TW sparse.txt to TW dev-tools
    98817289bcec Linux 6.6.14
    aab69ef76970 Revert "Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d""
    9860938cff26 arm64: dts: armada-3720-turris-mox: set irq type for RTC
    6cb583c4e18b Revert "KEYS: encrypted: Add check for strsep"
    93d357caf7e7 riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
    e6611cb236e0 i2c: s3c24xx: fix transferring more than one message in polling mode
    b7fd4552a67d i2c: s3c24xx: fix read transfers in polling mode
    3cc283fd16fb ipv6: mcast: fix data-race in ipv6_mc_down / mld_ifc_work
    a991cd35c477 selftests: mlxsw: qos_pfc: Adjust the test to support 8 lanes
    7788f557e2f7 mlxsw: spectrum_router: Register netdevice notifier before nexthop
    2f5e15657404 mlxsw: spectrum_acl_tcam: Fix stack corruption
    817840d125a3 mlxsw: spectrum_acl_tcam: Fix NULL pointer dereference in error path
    b1f0207078a5 mlxsw: spectrum_acl_erp: Fix error flow of pool allocation failure
    96e84339ddf8 loop: fix the the direct I/O support check when used on top of block devices
    2ae2e7cf658d ethtool: netlink: Add missing ethnl_ops_begin/complete
    53cea04da861 arm64/ptrace: Don't flush ZA/ZT storage when writing ZA via ptrace
    99719bb0c281 kdb: Fix a potential buffer overflow in kdb_local()
    8836df02124f io_uring: adjust defer tw counting
    b019406e5ad9 ipvs: avoid stat macros calls from preemptible context
    bf6b3b6d110f netfilter: nf_tables: reject NFT_SET_CONCAT with not field length description
    87e5fb6d1cc2 netfilter: nf_tables: skip dead set elements in netlink dump
    dc45bb00e66a netfilter: nf_tables: do not allow mismatch field size and set key length
    9325e3188a9c netfilter: bridge: replace physindev with physinif in nf_bridge_info
    96c510a53181 netfilter: propagate net to nf_bridge_get_physindev
    075dcb3caba9 netfilter: nf_queue: remove excess nf_bridge variable
    4979db9bc52e netfilter: nfnetlink_log: use proper helper for fetching physinif
    295de7fb5a61 netfilter: nft_limit: do not ignore unsupported flags
    a016aacadfde netfilter: nf_tables: reject invalid set policy
    08aca65997fb net: netdevsim: don't try to destroy PHC on VFs
    72b45857b724 mptcp: relax check on MPC passive fallback
    9aeb09f4d85a LoongArch: BPF: Prevent out-of-bounds memory access
    e9ed74393c09 net: dsa: vsc73xx: Add null pointer check to vsc73xx_gpio_probe
    e8d3872b617c bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    fed034d23ebc net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls
    e6acd12ffcd0 selftests: bonding: Change script interpreter
    836e236b878a drm/amdgpu: fall back to INPUT power for AVG power via INFO IOCTL
    1515db19c4a3 drm/amdkfd: fixes for HMM mem allocation
    0d15f6d75c2f ASoC: SOF: ipc4-loader: remove the CPC check warnings
    52acfebcea00 gpio: mlxbf3: add an error code check in mlxbf3_gpio_probe
    fd526aa39f04 dt-bindings: gpio: xilinx: Fix node address in gpio
    f9071d939f20 net: ravb: Fix dma_addr_t truncation in error case
    02e368eb1444 net: tls, fix WARNIING in __sk_msg_free
    7dc290d787ae bpf: Avoid iter->offset making backward progress in bpf_iter_udp
    2a62beb0f59f bpf: iter_udp: Retry with a larger batch size without going back to the previous bucket
    9eb6088560e3 net: netdev_queue: netdev_txq_completed_mb(): fix wake condition
    342c88f406c2 net: add more sanity check in virtio_net_hdr_to_skb()
    823ba1d21060 erofs: fix inconsistent per-file compression format
    586814ed68f7 erofs: simplify compression configuration parser
    d2e919b6e66b udp: annotate data-races around up->pending
    3a7517c53eab net: stmmac: Fix ethool link settings ops for integrated PCS
    8b6075046470 block: ensure we hold a queue reference when using queue limits
    d4368227ba9c mptcp: refine opt_mp_capable determination
    c119bcd94693 mptcp: use OPTION_MPTCP_MPJ_SYN in subflow_check_req()
    ad3e8f5c3d5c mptcp: use OPTION_MPTCP_MPJ_SYNACK in subflow_finish_connect()
    4701d3282359 mptcp: strict validation before using mp_opt->hmac
    4029820677b2 mptcp: mptcp_parse_option() fix for MPTCPOPT_MP_JOIN
    0048a13b19f6 ALSA: hda: Properly setup HDMI stream
    7770a4387576 net: phy: micrel: populate .soft_reset for KSZ9131
    1cb0cd1eff8d net: micrel: Fix PTP frame parsing for lan8841
    05f7e34647d2 amt: do not use overwrapped cb area
    80a7a98b315d net: ethernet: ti: am65-cpsw: Fix max mtu to fit ethernet frames
    fcaa3a2c12d6 octeontx2-af: CN10KB: Fix FIFO length calculation for RPM2
    5c4017a25260 rxrpc: Fix use of Don't Fragment flag
    c47345350346 net: qualcomm: rmnet: fix global oob in rmnet_policy
    930ce7a5c0a8 s390/pci: fix max size calculation in zpci_memcpy_toio()
    b1d3db6740d0 ASoC: mediatek: sof-common: Add NULL check for normal_link string
    a765609f22d7 PCI: mediatek-gen3: Fix translation window size calculation
    423de3f3844c PCI: keystone: Fix race condition when initializing PHYs
    2ed3d3532890 nvmet-tcp: Fix the H2C expected PDU len calculation
    79e9dfd7f89a nvme: trace: avoid memcpy overflow warning
    4652eb817623 nvmet: re-fix tracing strncpy() warning
    45f80b2f230d hisi_acc_vfio_pci: Update migration data pointer correctly on saving/resume
    0b6f0be074fd spi: coldfire-qspi: Remove an erroneous clk_disable_unprepare() from the remove function
    1a5369728c2d cxl/port: Fix missing target list lock
    4e0d6791935e perf db-export: Fix missing reference count get in call_path_from_sample()
    5ed4d3e6ad40 serial: apbuart: fix console prompt on qemu
    05ba3df0e405 serial: imx: Correct clock error message in function probe()
    821ad0089c69 usb: xhci-mtk: fix a short packet issue of gen1 isoc-in transfer
    5c0392fdafb0 apparmor: avoid crash when parsed profile name is empty
    337c86dc8af9 apparmor: fix possible memory leak in unpack_trans_table
    a2b2b3011878 cxl/region: fix x9 interleave typo
    8fdeaf400823 perf stat: Fix hard coded LL miss units
    35bcf6bf324d perf env: Avoid recursively taking env->bpf_progs.lock
    2f00fd8d50a7 nvmet-tcp: fix a crash in nvmet_req_complete()
    24e05760186d nvmet-tcp: Fix a kernel panic when host sends an invalid H2C PDU length
    790321e4ae6e apparmor: Fix ref count leak in task_kill
    5125a3029965 vdpa: Fix an error handling path in eni_vdpa_probe()
    e2717302fbc2 power: supply: Fix null pointer dereference in smb2_probe
    98b8a550da83 iommu: Don't reserve 0-length IOVA region
    fd83ff901d69 usb: gadget: webcam: Make g_webcam loadable again
    915fb4043c5e spmi: mtk-pmif: Serialize PMIF status check and command submission
    19e321c3eedd usb: cdc-acm: return correct error code on unsupported break
    2433f050d31a tty: use 'if' in send_break() instead of 'goto'
    eefdb1be0c8b tty: don't check for signal_pending() in send_break()
    ecf27e476587 tty: early return from send_break() on TTY_DRIVER_HARDWARE_BREAK
    96227df8462d PCI: epf-mhi: Fix the DMA data direction of dma_unmap_single()
    ad671dfce2d9 bus: mhi: ep: Pass mhi_ep_buf_info struct to read/write APIs
    bd4f6f1f8948 bus: mhi: ep: Use slab allocator where applicable
    23bab2b8e099 bus: mhi: ep: Do not allocate event ring element on stack
    46bd939d85ed perf unwind-libunwind: Fix base address for .eh_frame
    c05c54f0cdff perf unwind-libdw: Handle JIT-generated DSOs properly
    c8d6d5d080b0 perf genelf: Set ELF program header addresses properly
    2f4c1c3580e4 perf hisi-ptt: Fix one memory leakage in hisi_ptt_process_auxtrace_event()
    f8d47ca6785c perf header: Fix one memory leakage in perf_event__fprintf_event_update()
    2c664df0b201 iio: adc: ad9467: fix scale setting
    a98f6c657c60 iio: adc: ad9467: add mutex to struct ad9467_state
    0c7b8f883159 iio: adc: ad9467: don't ignore error codes
    8690cd46c86b iio: adc: ad9467: fix reset gpio handling
    1075fafe8d3c selftests/sgx: Skip non X86_64 platform
    88fe67d40044 selftests/sgx: Include memory clobber for inline asm in test enclave
    5a734a0ec4e3 selftests/sgx: Fix uninitialized pointer dereferences in encl_get_entry
    c4aee34ea772 selftests/sgx: Fix uninitialized pointer dereference in error path
    763cd6874631 serial: imx: fix tx statemachine deadlock
    2b327d0fe0d2 software node: Let args be NULL in software_node_get_reference_args
    afc7dd4e03b7 acpi: property: Let args be NULL in __acpi_node_get_property_reference
    a5e1c3fe5764 base/node.c: initialize the accessor list before registering
    ac95df46de7f perf stat: Exit perf stat if parse groups fails
    9cc93a61cd79 perf mem: Fix error on hybrid related to availability of mem event in a PMU
    f54149b92083 perf vendor events arm64 AmpereOne: Rename BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT
    358b1c992ec0 vfio/pds: Fix calculations in pds_vfio_dirty_sync
    c7e8c0e61da5 perf test record user-regs: Fix mask for vg register
    e9b7b8b3ac2c libapi: Add missing linux/types.h header to get the __u64 type on io.h
    bee4ceb8ea40 perf header: Fix segfault on build_mem_topology() error path
    cd8dd51d5986 perf test: Remove atomics from test_loop to avoid test failures
    28d8fe6641e7 iommu: Map reserved memory as cacheable if device is coherent
    887a558d0298 serial: 8250: omap: Don't skip resource freeing if pm_runtime_resume_and_get() failed
    5b3e25efe16e PCI: Avoid potential out-of-bounds read in pci_dev_for_each_resource()
    b450e335fb18 power: supply: bq256xx: fix some problem in bq256xx_hw_init
    eb45e4bb14d3 power: supply: cw2015: correct time_to_empty units in sysfs
    69bec5f534ca MIPS: Alchemy: Fix an out-of-bound access in db1550_dev_setup()
    b6e72854e019 MIPS: Alchemy: Fix an out-of-bound access in db1200_dev_setup()
    9b2f64ba99bf riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
    e1e1058828ed riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC
    5254434a8cf2 riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings
    8633e74002cd riscv: Fix module_alloc() that did not reset the linear mapping permissions
    8db56df4a954 riscv: Check if the code to patch lies in the exit section
    e111d2319a44 um: virt-pci: fix platform map offset
    66c8b147fe04 mips: Fix incorrect max_low_pfn adjustment
    6ea50107247c mips: dmi: Fix early remap on MIPS32
    ac0de86fa7f5 srcu: Use try-lock lockdep annotation for NMI-safe access.
    fa1a1bad0f1c mfd: intel-lpss: Fix the fractional clock divider flags
    f53d8c6c6ecc mfd: tps6594: Add null pointer check to tps6594_device_init()
    bd4d5b6fe15d leds: aw200xx: Fix write to DIM parameter
    ab27da1edb56 leds: aw2013: Select missing dependency REGMAP_I2C
    3ef1130deee9 mfd: syscon: Fix null pointer dereference in of_syscon_register()
    9fc58cb20765 mfd: cs42l43: Correct SoundWire port list
    3c90b3b0436e mfd: rk8xx: fixup devices registration with PLATFORM_DEVID_AUTO
    df633f4c964a ARM: 9330/1: davinci: also select PINCTRL
    7ce742553789 serial: sc16is7xx: set safe default SPI clock frequency
    9d528a81df2f serial: sc16is7xx: add check for unsupported SPI modes during probe
    53956bf45e68 HID: wacom: Correct behavior when processing some confidence == false touches
    41199d2dbd00 HID: sensor-hub: Enable hid core report processing for all devices
    7faef79764d2 iio: adc: ad7091r: Pass iio_dev to event handler
    7c7ddf45868a KVM: x86/pmu: Reset the PMU, i.e. stop counters, before refreshing
    57bbd59ae013 KVM: x86/pmu: Move PMU reset logic to common x86 code
    65b201bf3e9a KVM: arm64: vgic-its: Avoid potential UAF in LPI translation cache
    42604bd5e49d KVM: arm64: vgic-v4: Restore pending state on host userspace write
    db448ac982e4 x86/kvm: Do not try to disable kvmclock if it was not enabled
    3206a188cfe1 PCI: mediatek: Clear interrupt status before dispatching handler
    43501b6c5abf PCI: dwc: endpoint: Fix dw_pcie_ep_raise_msix_irq() alignment support
    eaf6412618f5 x86/pci: Reserve ECAM if BIOS didn't include it in PNP0C02 _CRS
    e54c4dd4137c PCI/P2PDMA: Remove reference to pci_p2pdma_map_sg()
    5a473e32088c cxl/port: Fix decoder initialization when nr_targets > interleave_ways
    0dfcefc97300 Revert "nSVM: Check for reserved encodings of TLB_CONTROL in nested VMCB"
    68325c8c1aeb Revert "net: rtnetlink: Enslave device before bringing it up"
    ed00d917056b net: stmmac: fix ethtool per-queue statistics
    c84a711ad622 wifi: mwifiex: fix uninitialized firmware_stat
    2b3d7e12ec90 wifi: mwifiex: configure BSSID consistently when starting AP
    60220f0a551d wifi: mwifiex: add extra delay for firmware ready
    516ec80072c4 wifi: rtlwifi: Convert LNKCTL change to PCIe cap RMW accessors
    1f018dfa3725 wifi: rtlwifi: Remove bogus and dangerous ASPM disable/enable code
    c30d0fcb5d68 wifi: mt76: fix broken precal loading from MTD for mt7915
    509b9e745148 iommu/dma: Trace bounce buffer usage when mapping buffers
    979dc1cbd865 iommu/arm-smmu-qcom: Add missing GMU entry to match table
    8c8bcd45e9b1 bpf: Fix re-attachment branch in bpf_tracing_prog_attach
    f56e715ef1c1 Bluetooth: Fix atomicity violation in {min,max}_key_size_set
    2e54968baba3 rootfs: Fix support for rootfstype= when root= is given
    6dcd88460747 md/raid1: Use blk_opf_t for read and write operations
    e5f2b4b62977 pwm: Fix out-of-bounds access in of_pwm_single_xlate()
    080d2c608bce pwm: jz4740: Don't use dev_err_probe() in .request()
    7baa33837ee2 netfilter: nf_tables: check if catch-all set element is active in next generation
    a6bd8182137a block: Fix iterating over an empty bio with bio_for_each_folio_all
    8955324cc9f9 block: Remove special-casing of compound pages
    cb16cc1abda1 block: add check that partition length needs to be aligned with block size
    847e6947afd3 drm/amd: Enable PCIe PME from D3
    d37dbde71112 scsi: mpi3mr: Block PEL Enable Command on Controller Reset and Unrecoverable State
    fc6742c16be9 scsi: mpi3mr: Clean up block devices post controller reset
    3ddc8b84f657 scsi: mpi3mr: Refresh sdev queue depth after controller reset
    ca8e1a5d55ce scsi: target: core: add missing file_{start,end}_write()
    af50048fc351 scsi: ufs: core: Simplify power management during async scan
    2db6388d8a7f fbdev: flush deferred IO before closing
    1e3b051e9714 fbdev: flush deferred work in fb_deferred_io_fsync()
    2aceb3a8262c fbdev/acornfb: Fix name of fb_ops initializer macro
    0241f4c2caad io_uring: ensure local task_work is run on wait timeout
    c239b77ea4d6 io_uring/rw: ensure io->bytes_done is always initialized
    2c487fbf2230 io_uring: don't check iopoll if request completes
    d15de929f066 LoongArch: Fix and simplify fcsr initialization on execve()
    a8b91a92d4d6 ceph: select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
    08e6c8230051 ksmbd: only v2 leases handle the directory
    24290ba94cd0 ksmbd: fix UAF issue in ksmbd_tcp_new_connection()
    a2b21ef1ea4c ksmbd: validate mech token in session setup
    3b2291360cce ALSA: hda/realtek: Enable headset mic on Lenovo M70 Gen5
    2e59001eadde ALSA: hda/realtek: Enable mute/micmute LEDs and limit mic boost on HP ZBook
    0979e180845d ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq2xxx
    0d7b0c4a70e8 ALSA: oxygen: Fix right channel of capture volume mixer
    57886e83d190 serial: omap: do not override settings for RS485 support
    f9a7caccf21e serial: 8250_exar: Set missing rs485_supported flag
    45d709f3970e serial: imx: Ensure that imx_uart_rs485_config() is called with enabled clock
    67043c0a6ed5 serial: core, imx: do not set RS485 enabled if it is not supported
    bd4a210c09e4 serial: 8250_bcm2835aux: Restore clock error handling
    9a965fba11f3 serial: core: make sure RS485 cannot be enabled when it is not supported
    cd1508c80dab serial: core: fix sanitizing check for RTS settings
    b68581313078 dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: fix path to header
    c8e0fb0da88f usb: mon: Fix atomicity violation in mon_bin_vma_fault
    da4e9d5cc567 usb: typec: class: fix typec_altmode_put_partner to put plugs
    745a4b352724 Revert "usb: typec: class: fix typec_altmode_put_partner to put plugs"
    9f8b94b93ca5 usb: cdns3: Fix uvc fail when DMA cross 4k boundery since sg enabled
    2e56239b8e1d usb: cdns3: fix iso transfer error when mult is not zero
    0153e32b3cc1 usb: cdns3: fix uvc failure work since sg support enabled
    420fa3cb092f usb: chipidea: wait controller resume finished for wakeup irq
    61a06c5bb603 Revert "usb: dwc3: don't reset device side if dwc3 was configured as host-only"
    e8d48c2282a9 Revert "usb: dwc3: Soft reset phy on probe for host"
    334bdf3351d9 usb: dwc3: gadget: Queue PM runtime idle on disconnect event
    e9deab5be0c4 usb: dwc3: gadget: Handle EP0 request dequeuing properly
    73e20c2f48f8 usb: dwc: ep0: Update request status in dwc3_ep0_stall_restart
    f09cfc753944 usb: phy: mxs: remove CONFIG_USB_OTG condition for mxs_phy_is_otg_host()
    53eea0d939e3 Revert "usb: gadget: f_uvc: change endpoint allocation in uvc_function_bind()"
    7fc3dd358aa0 tick-sched: Fix idle and iowait sleeptime accounting vs CPU hotplug
    b38014874530 powerpc/64s: Increase default stack size to 32KB
    c5c1ff390400 clocksource/drivers/timer-ti-dm: Fix make W=n kerneldoc warnings
    67f16bf2cc16 binder: fix race between mmput() and do_exit()
    78376d441560 xen-netback: don't produce zero-size SKB frags
    3a99f15ce9d0 Revert "drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole"
    9853f1307efe rust: Ignore preserve-most functions
    881720dcf6df Input: atkbd - use ab83 as id when skipping the getid command
    9da397e5d48d mips/smp: Call rcutree_report_cpu_starting() earlier
    1f714a0373ac binder: fix unused alloc->free_async_space
    fda6e06e01a9 binder: fix async space check for 0-sized buffers
    06173edfc770 keys, dns: Fix size check of V1 server-list header
    3db79d21cf9c selftests/bpf: Add assert for user stacks in test_task_stack
    5f93225dc925 Revert "kernfs: convert kernfs_idr_lock to an irq safe raw spinlock"
    3058183333a5 kernfs: convert kernfs_idr_lock to an irq safe raw spinlock
    b57196a5ec5e class: fix use-after-free in class_register()
    aea1965c5de5 of: unittest: Fix of_count_phandle_with_args() expected value message
    71ec48abc549 fbdev: imxfb: fix left margin setting
    b64d09a4e859 of: Fix double free in of_parse_phandle_with_args_map
    acf50ff9360e ksmbd: validate the zero field of packet header
    d998ade03ef2 kselftest/alsa - conf: Stringify the printed errno in sysfs_get()
    efd7d5e1e6e2 kselftest/alsa - mixer-test: Fix the print format specifier warning
    45cbaa25b331 kselftest/alsa - mixer-test: fix the number of parameters to ksft_exit_fail_msg()
    ecfaeb66b1f0 drm/amd/display: avoid stringop-overflow warnings for dp_decide_lane_settings()
    ae7cbf935b9a drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init
    5024cce888e1 drm/amdkfd: Confirm list is non-empty before utilizing list_first_entry in kfd_topology.c
    2d8f9e4e1d9f IB/iser: Prevent invalidating wrong MR
    4147d76f988a gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
    ba3f1a346bf1 gpiolib: provide gpio_device_find()
    799233ad1eb8 gpiolib: make gpio_device_get() and gpio_device_put() public
    9b0cc30d26c3 drm/amdkfd: Fix type of 'dbg_flags' in 'struct kfd_process'
    37d1757808b0 mmc: sdhci_omap: Fix TI SoC dependencies
    3e6319ca61c1 mmc: sdhci_am654: Fix TI SoC dependencies
    03035872e178 ALSA: scarlett2: Add clamp() in scarlett2_mixer_ctl_put()
    821fbaeaaae2 ALSA: scarlett2: Add missing error checks to *_ctl_get()
    66fb87fac545 ALSA: scarlett2: Allow passing any output to line_out_remap()
    996fde492ad9 ALSA: scarlett2: Add missing error check to scarlett2_usb_set_config()
    43a9b3f6e6ef ALSA: scarlett2: Add missing error check to scarlett2_config_save()
    bf4599610ef6 ASoC: rt5645: Drop double EF20 entry from dmi_platform_data[]
    c17134d3aea9 pwm: stm32: Fix enable count for clk in .probe()
    5eb8da9b3ef7 pwm: stm32: Use hweight32 in stm32_pwm_detect_channels
    f1da0b7a092a clk: fixed-rate: fix clk_hw_register_fixed_rate_with_accuracy_parent_hw
    a3fb4404e3d4 clk: qcom: dispcc-sm8550: Update disp PLL settings
    053f354733aa clk: qcom: gcc-sm8550: Mark RCGs shared where applicable
    a7a5ec56a012 clk: qcom: gcc-sm8550: use collapse-voting for PCIe GDSCs
    62f53fe9e8c2 clk: qcom: gcc-sm8550: Mark the PCIe GDSCs votable
    b5782964b08f clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag
    975aaaddc226 accel/habanalabs: fix information leak in sec_attest_info()
    5ada13fb6770 drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
    5a316acb135b ASoC: tas2781: add support for FW version 0x0503
    18e58248b2aa ASoC: amd: vangogh: Drop conflicting ACPI-based probing
    1e6132acba6a clk: si5341: fix an error code problem in si5341_output_clk_set_rate
    2e4806d2b78f clk: rs9: Fix DIF OEn bit placement on 9FGV0241
    f2c13661c2a6 watchdog: rti_wdt: Drop runtime pm reference count when watchdog is unused
    57b39f0b07cd watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
    04ec5525479b watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO
    1ee2762cf0fb watchdog: set cdev owner before adding
    37b67480609f drivers: clk: zynqmp: update divider round rate logic
    9b2dcd1b38c2 drivers: clk: zynqmp: calculate closest mux rate
    f35668e633e9 clk: sp7021: fix return value check in sp7021_clk_probe()
    2aea9c0498ca clk: qcom: videocc-sm8150: Add missing PLL config property
    9fcf47d8f909 clk: qcom: videocc-sm8150: Update the videocc resets
    07b4cf396c34 dt-bindings: clock: Update the videocc resets for sm8150
    cf8a10d41f13 f2fs: fix to check return value of f2fs_recover_xattr_data
    0c5d08b1c98e drm/amd/pm: fix a double-free in amdgpu_parse_extended_power_table
    4c9a96dd6d4a gpu/drm/radeon: fix two memleaks in radeon_vm_init
    95084632a65d drivers/amd/pm: fix a use-after-free in kv_parse_power_table
    fb1936cb5872 drm/amd/pm: fix a double-free in si_dpm_init
    5bc4f16118c5 drm/amdgpu/debugfs: fix error code when smc register accessors are NULL
    37e452306ae2 drm/mediatek: Fix underrun in VDO1 when switches off the layer
    f3e63240003e drm/mediatek: Remove the redundant driver data for DPI
    3aa7196bcd3b drm/mediatek: Return error if MDP RDMA failed to enable the clock
    173b247231bb drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
    4ae0cd31688f drm/msm/dpu: Set input_sel bit for INTF
    0afe652a69d8 clk: renesas: rzg2l: Check reset monitor registers
    fc61c3c5e0f6 clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()
    ee3e64d1dac6 media: dvb-frontends: m88ds3103: Fix a memory leak in an error handling path of m88ds3103_probe()
    de28d63ad35c media: dvbdev: drop refcount on error path in dvb_device_open()
    7bf0cba7f7e8 f2fs: fix to update iostat correctly in f2fs_filemap_fault()
    412eee2c894a f2fs: fix to check compress file in f2fs_move_file_range()
    4535be487804 f2fs: fix to wait on block writeback for post_read case
    fa08600a6c0b drm/panel: st7701: Fix AVCL calculation
    6ce256eab4d4 drm/msm/adreno: Fix A680 chip id
    f2295f176989 media: rkisp1: Fix media device memory leak
    0e09b6dd83b1 media: dt-bindings: media: rkisp1: Fix the port description for the parallel interface
    c9354bffaa5b media: imx-mipi-csis: Drop extra clock enable at probe()
    0e3535ee779f media: imx-mipi-csis: Fix clock handling in remove()
    54ce93d7e66e media: bttv: add back vbi hack
    e8fa30fa7157 media: bttv: start_streaming should return a proper error code
    5e00f6c3a350 clk: qcom: gpucc-sm8150: Update the gpu_cc_pll1 config
    e785018a7f06 RDMA/hns: Fix memory leak in free_mr_init()
    1e2c9e741824 media: cx231xx: fix a memleak in cx231xx_init_isoc
    3258bc1f8cc8 drm/bridge: tc358767: Fix return value on error case
    99705f3f345f drm/bridge: cdns-mhdp8546: Fix use of uninitialized variable
    0564e8a42791 drm/radeon/trinity_dpm: fix a memleak in trinity_parse_power_table
    a26634b3ce21 drm/radeon/dpm: fix a memleak in sumo_parse_power_table
    0b813a6a0087 drm/radeon: check the alloc_workqueue return value in radeon_crtc_init()
    3bbef34ea819 drm/msm/dpu: correct clk bit for WB2 block
    4687cb57578a drm/panfrost: Ignore core_mask for poweroff and disable PWRTRANS irq
    61dfc4317425 ASoC: SOF: topology: Use partial match for disconnecting DAI link and DAI widget
    a410d58117d6 ASoC: Intel: sof_sdw_rt_sdca_jack_common: ctx->headset_codec_dev = NULL
    3fbfbea3eeb0 ASoC: Intel: glk_rt5682_max98357a: fix board id mismatch
    b7062628caea media: v4l: async: Fix duplicated list deletion
    af9d39677c91 drm/drv: propagate errors from drm_modeset_register_all()
    ae795abe7b3e drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
    ff9f375c21d9 drm/msm/dpu: Add missing safe_lut_tbl in sc8180x catalog
    3925b83c3586 drm/msm/mdp4: flush vblank event on disable
    13bb7bfc2580 ASoC: cs35l33: Fix GPIO name and drop legacy include
    9c010be07fd9 drm/imx/lcdc: Fix double-free of driver data
    417d134e72f5 drm/tidss: Fix dss reset
    11e2dc2ff842 drm/tidss: Check for K2G in in dispc_softreset()
    4fcfe757860b drm/tidss: Return error value from from softreset
    d44143cdd0d1 drm/tidss: Move reset to the end of dispc_init()
    18bd4d184675 drm/radeon: check return value of radeon_ring_lock()
    056484916a13 drm/radeon/r100: Fix integer overflow issues in r100_cs_track_check()
    0413e8869171 drm/radeon/r600_cs: Fix possible int overflows in r600_cs_check_reg()
    d3c0b49aaa12 f2fs: fix to avoid dirent corruption
    c111350d673a drm/bridge: Fix typo in post_disable() description
    c082791b6a46 media: amphion: Fix VPU core alias name
    251743c4065c media: rkvdec: Hook the (TRY_)DECODER_CMD stateless ioctls
    682588d38ad9 media: verisilicon: Hook the (TRY_)DECODER_CMD stateless ioctls
    f581023e3207 media: visl: Hook the (TRY_)DECODER_CMD stateless ioctls
    2cb808af7746 media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
    2cf0005d3155 media: pvrusb2: fix use after free on context disconnection
    c56a4ad4068d drm/tilcdc: Fix irq free on unload
    a8657406e12a drm/bridge: tpd12s015: Drop buggy __exit annotation for remove function
    9f91aa1ef918 drm/nouveau/fence:: fix warning directly dereferencing a rcu pointer
    a23571137dd1 drm/panel-elida-kd35t133: hold panel in reset for unprepare
    e9c9fd317ab0 drm/panel: nv3051d: Hold panel in reset for unprepare
    ada27426b0d6 RDMA/hns: Fix inappropriate err code for unsupported operations
    fff32018b025 RDMA/usnic: Silence uninitialized symbol smatch warnings
    305f1f46d738 drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()
    4e042f022255 drm/dp_mst: Fix fractional DSC bpp handling
    16af1e7f5ea6 Revert "drm/omapdrm: Annotate dma-fence critical section in commit path"
    9ab5837f77a1 Revert "drm/tidss: Annotate dma-fence critical section in commit path"
    c5d4224a4d16 ARM: davinci: always select CONFIG_CPU_ARM926T
    687c5d52fe53 ip6_tunnel: fix NEXTHDR_FRAGMENT handling in ip6_tnl_parse_tlv_enc_lim()
    2968901d72b9 rxrpc: Fix skbuff cleanup of call's recvmsg_queue and rx_oos_queue
    04c1f0f2505a mlxbf_gige: Enable the GigE port in mlxbf_gige_open
    42b242c62bc1 mlxbf_gige: Fix intermittent no ip issue
    73f7da5fd124 net/sched: act_ct: fix skb leak and crash on ooo frags
    a33c741ca699 blk-cgroup: fix rcu lockdep warning in blkg_lookup()
    63c3c44ff4c5 sctp: fix busy polling
    9702e7fb6399 sctp: support MSG_ERRQUEUE flag in recvmsg()
    b54d78d57985 bpf: sockmap, fix proto update hook to avoid dup calls
    3d81183a5b9c wifi: cfg80211: parse all ML elements in an ML probe response
    6b3946813382 wifi: cfg80211: correct comment about MLD ID
    08a8ae5a8018 arm64: dts: rockchip: Fix led pinctrl of lubancat 1
    eeeb228c5f23 null_blk: don't cap max_hw_sectors to BLK_DEF_MAX_SECTORS
    0f37a5c9d366 Bluetooth: btmtkuart: fix recv_buf() return value
    8cd6c0600725 Bluetooth: btnxpuart: fix recv_buf() return value
    f8a5c402ae34 Bluetooth: Fix bogus check for re-auth no supported with non-ssp
    f1ee0ffbc024 netfilter: nf_tables: validate chain type update if available
    f5ab4e73c9e1 netfilter: nf_tables: mark newset as dead on transaction abort
    e6f3f39676a5 wifi: iwlwifi: assign phy_ctxt before eSR activation
    a2a4bb509b78 wifi: iwlwifi: fix out of bound copy_from_user
    076ca7429666 wifi: iwlwifi: mvm: send TX path flush in rfkill
    c3e1a02a8ab2 wifi: iwlwifi: mvm: set siso/mimo chains to 1 in FW SMPS request
    df14b372030c wifi: rtlwifi: rtl8192se: using calculate_bit_shift()
    076d81a78371 wifi: rtlwifi: rtl8192ee: using calculate_bit_shift()
    6bbaf100a355 wifi: rtlwifi: rtl8192de: using calculate_bit_shift()
    4342f9646953 wifi: rtlwifi: rtl8192ce: using calculate_bit_shift()
    96cd7b10e949 wifi: rtlwifi: rtl8192cu: using calculate_bit_shift()
    b2127790622c wifi: rtlwifi: rtl8192c: using calculate_bit_shift()
    2293d95f8765 wifi: rtlwifi: rtl8188ee: phy: using calculate_bit_shift()
    1b2260bc3403 wifi: rtlwifi: add calculate_bit_shift()
    3bc29c780aca bpf: Use c->unit_size to select target cache during free
    63ddf081e111 bpf: Use pcpu_alloc_size() in bpf_mem_free{_rcu}()
    62752b673247 bpf: Re-enable unit_size checking for global per-cpu allocator
    2e5181afb329 arm64: dts: qcom: sc8180x: Fix up PCIe nodes
    8f1b6d23fec4 arm64: dts: qcom: sc8180x: switch PCIe QMP PHY to new style of bindings
    8d0c268ffcb3 arm64: dts: qcom: sc8180x: Mark PCIe hosts cache-coherent
    c811f0246b2c arm64: dts: qcom: sm8550: Update idle state time requirements
    ff8434b61cbb arm64: dts: qcom: sm8550: Separate out X3 idle state
    55c87e64a3c0 arm64: dts: qcom: ipq6018: fix clock rates for GCC_USB0_MOCK_UTMI_CLK
    afea6ffbed36 arm64: dts: qcom: sc7280: Mark SDHCI hosts as cache-coherent
    ed49fd2d46a4 block: add check of 'minors' and 'first_minor' in device_add_disk()
    004e05c28c57 soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset
    11b4803210af arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
    2d1cd59a34d1 arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
    0f5532bd692f arm64: dts: qcom: sm6375: Hook up MPM
    4a208efdf54d arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
    19e578b69968 soc: qcom: llcc: Fix dis_cap_alloc and retain_on_pc configuration
    793ca465722a arm64: dts: qcom: acer-aspire1: Correct audio codec definition
    3d83b820bff9 bpf: Limit the number of kprobes when attaching program to multiple kprobes
    5735054af3d3 bpf: Limit the number of uprobes when attaching program to multiple uprobes
    849ca053beb0 dma-mapping: clear dev->dma_mem to NULL after freeing it
    94e5f64283a1 virtio/vsock: send credit update during setting SO_RCVLOWAT
    925c22d43835 virtio/vsock: fix logic which reduces credit update messages
    7b32e63f8814 ipmr: support IP_PKTINFO on cache report IGMP msg
    d01b4a9296ec selftests/net: fix grep checking for fib_nexthop_multiprefix
    d048dced8ea5 bpf: Fix a race condition between btf_put() and map_free()
    42357465a069 ARM: dts: stm32: don't mix SCMI and non-SCMI board compatibles
    d4a84572bcb1 scsi: hisi_sas: Correct the number of global debugfs registers
    d1932df3c4ba scsi: hisi_sas: Rollback some operations if FLR failed
    9e1986cd8a93 scsi: hisi_sas: Check before using pointer variables
    ec2499b80e1c scsi: hisi_sas: Replace with standard error code return value
    8d8f671e45de scsi: ufs: qcom: Fix the return value when platform_get_resource_byname() fails
    8f67e87e1602 scsi: ufs: qcom: Fix the return value of ufs_qcom_ice_program_key()
    95fff86aa8d2 arm64: dts: imx8mm: Reduce GPU to nominal speed
    9cd79bc11ffa arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control
    218c08c5b2bd arm64: dts: xilinx: Apply overlays to base dtbs
    89665b3daea4 block: Set memalloc_noio to false on device_add_disk() error path
    1e1fe2bd87ac selftests/bpf: Relax time_tai test for equal timestamps in tai_forward
    85e60760d255 wifi: iwlwifi: don't support triggered EHT CQI feedback
    15173a169723 wifi: mt76: mt7921: fix country count limitation for CLC
    f8fa25bf6654 arm64: dts: mediatek: mt8186: fix address warning for ADSP mailboxes
    9bd3a1881724 arm64: dts: mediatek: mt8186: Fix alias prefix for ovl_2l0
    11f272928e24 arm64: dts: mediatek: mt8195: revise VDOSYS RDMA node name
    4b0d8f4a68aa arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
    64ebe7abc1c0 dt-bindings: media: mediatek: mdp3: correct RDMA and WROT node with generic names
    0954982db828 bpf: Fix accesses to uninit stack slots
    ad140fc856f0 bpf: Guard stack limits against 32bit overflow
    7f7bed74ba64 arm64: dts: hisilicon: hikey970-pmic: fix regulator cells properties
    08b91babccbb bpf: Fix verification of indirect var-off stack access
    e89d025d331c wifi: mt76: mt7921s: fix workqueue problem causes STA association fail
    88199cbc75fe wifi: mt76: mt7915: also MT7981 is 3T3R but nss2 on 5 GHz band
    a37cd935b586 wifi: mt76: mt7915: fix EEPROM offset of TSSI flag on MT7981
    d03559452a8a wifi: mt76: mt7996: fix rate usage of inband discovery frames
    041f75b38b1e wifi: mt76: mt7996: fix the size of struct bss_rate_tlv
    5e22c8a04173 wifi: mt76: mt7915: fallback to non-wed mode if platform_get_resource fails in mt7915_mmio_wed_init()
    b9b61d159006 wifi: mt76: fix typo in mt76_get_of_eeprom_from_nvmem function
    27aca54b0d14 arm64: dts: qcom: sm8550: fix USB wakeup interrupt types
    d7206c3bb4b5 arm64: dts: qcom: sc7280: fix usb_2 wakeup interrupt types
    22a31cc7a022 arm64: dts: qcom: sa8775p: fix USB wakeup interrupt types
    20455e11993b arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
    028a26553eb2 arm64: dts: qcom: sc7280: Fix up GPU SIDs
    52fafbe79b25 arm64: dts: qcom: sm8350: Fix DMA0 address
    9f3f5494456c arm64: dts: qcom: sm6125: add interrupts to DWC3 USB controller
    22817db3aa32 arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
    747dee115c14 arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
    5ea916f16be3 arm64: dts: qcom: qrb2210-rb1: use USB host mode
    da58aea81a3b arm64: dts: qcom: qrb2210-rb1: Hook up USB3
    76fed8a4c507 scsi: fnic: Return error if vmalloc() failed
    8dc15b067059 bpf: fix check for attempt to corrupt spilled pointer
    25a17a269b44 selftests/net: specify the interface when do arping
    f91cd728b10c bpf: Defer the free of inner map when necessary
    1c40ec6b8e06 bpf: Add map and need_defer parameters to .map_fd_put_ptr()
    decc738819ea arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
    b9a97215c346 arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
    bc3400294110 arm64: dts: qcom: sa8775p: Make watchdog bark interrupt edge triggered
    a52f6d78ff65 arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
    70d0d1bfe5e1 arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
    b06a86234872 arm64: dts: qcom: sdm845: Make watchdog bark interrupt edge triggered
    940ce0fee709 arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
    6252b33a3101 arm64: dts: qcom: sc7280: Mark some nodes as 'reserved'
    6157194e6400 arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
    5fd1287784a2 arm64: dts: qcom: sm8550: correct TX Soundwire clock
    2eda1c797441 arm64: dts: qcom: sm8450: correct TX Soundwire clock
    9bdbc3a00a67 arm64: dts: qcom: sc8180x-primus: Fix HALL_INT polarity
    c961ca51345a dt-bindings: arm: qcom: Fix html link
    498e1c55baf7 ARM: dts: qcom: sdx65: correct SPMI node name
    4371540a33ca ARM: dts: qcom: sdx65: correct PCIe EP phy-names
    0866f6427b45 bpf: enforce precision of R0 on callback return
    530cec617f5a md: synchronize flush io with array reconfiguration
    3bb89deccac5 selftests/bpf: Fix erroneous bitmask operation
    5b5ddf21b978 wifi: rtw88: sdio: Honor the host max_req_size in the RX path
    c2d3b657c968 arm64: dts: ti: iot2050: Re-add aliases
    87e2d91d4cec arm64: dts: ti: k3-am65-main: Fix DSS irq trigger type
    92e2eaa44a7f arm64: dts: ti: k3-am62a-main: Fix GPIO pin count in DT nodes
    6aa025f6df94 wifi: rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
    65d10f83acff scsi: bfa: Use the proper data type for BLIST flags
    7615536a3746 firmware: ti_sci: Fix an off-by-one in ti_sci_debugfs_create()
    1c83c7089dea net/ncsi: Fix netlink major/minor version numbers
    50871569183e ARM: dts: qcom: apq8064: correct XOADC register address
    ba538ae4d709 wifi: libertas: stop selecting wext
    e9327c72bc77 wifi: ath11k: Defer on rproc_get failure
    a341738951bf bpf: Add crosstask check to __bpf_get_stack
    de0b27e6326e bpf, lpm: Fix check prefixlen before walking trie
    153267f9513f wifi: rtw88: fix RX filter in FIF_ALLMULTI flag
    2ed15a3a3f4a wifi: plfxlc: check for allocation failure in plfxlc_usb_wreq_async()
    ddcb3b444659 ARM: dts: qcom: msm8226: provide dsi phy clocks to mmcc
    d5bc0233ddae arm64: dts: qcom: sc8280xp-x13s: add missing camera LED pin config
    47e3ec86cf6f arm64: dts: qcom: sc8280xp-x13s: Use the correct DP PHY compatible
    d579dfaa0908 arm64: dts: qcom: qrb4210-rb2: don't force usb peripheral mode
    6e007fac81cf asm-generic: Fix 32 bit __generic_cmpxchg_local
    75aa038d9f6e pNFS: Fix the pnfs block driver's calculation of layoutget size
    bcdb16220a58 SUNRPC: fix _xprt_switch_find_current_entry logic
    8d43b944cab0 NFSv4.1/pnfs: Ensure we handle the error NFS4ERR_RETURNCONFLICT
    4ffac0013421 NFS: Use parent's objective cred in nfs_access_login_time()
    b4b7dd1cb608 blocklayoutdriver: Fix reference leak of pnfs_device_node
    060d799775f6 csky: fix arch_jump_label_transform_static override
    7d9e5bed036a crypto: scomp - fix req->dst buffer overflow
    c660aa7784b7 crypto: sahara - do not resize req->src when doing hash operations
    08489b1994cb crypto: sahara - fix processing hash requests with req->nbytes < sg->length
    3c3eb0f8bb26 crypto: sahara - improve error handling in sahara_sha_process()
    db6efd4da2ee crypto: sahara - fix wait_for_completion_timeout() error handling
    7593631a53c5 crypto: sahara - fix ahash reqsize
    b123af8beb89 crypto: sahara - handle zero-length aes requests
    326288412716 crypto: sahara - avoid skcipher fallback code duplication
    63cdfacb0a70 crypto: virtio - Wait for tasklet to complete on device remove
    528a422b94b3 dlm: fix format seq ops type 4
    4f234d5fcd82 gfs2: fix kernel BUG in gfs2_quota_cleanup
    067a7c48c2c7 gfs2: Fix kernel NULL pointer dereference in gfs2_rgrp_dump
    5248b445a579 fs: indicate request originates from old mount API
    90219ce71683 erofs: fix memory leak on short-lived bounced pages
    a34946ec3de8 pstore: ram_core: fix possible overflow in persistent_ram_init_ecc()
    52f0b4a30f20 crypto: hisilicon/zip - save capability registers in probe process
    b06a6d5e9d99 crypto: hisilicon/sec2 - save capability registers in probe process
    e8d4877e5c7f crypto: hisilicon/hpre - save capability registers in probe process
    1e8102e22c88 crypto: hisilicon/qm - add a function to set qm algs
    b7a03a0f15c2 crypto: hisilicon/zip - add zip comp high perf mode configuration
    eaf9954929e5 crypto: hisilicon/qm - save capability registers in qm init process
    dffc3483c84e crypto: sahara - fix error handling in sahara_hw_descriptor_create()
    4167eb9412d4 crypto: sahara - fix processing requests with cryptlen < sg->length
    ab82cb379a5a crypto: sahara - fix ahash selftest failure
    489bfd8f8a64 crypto: sahara - fix cbc selftest failure
    dd31964d9eca crypto: sahara - remove FLAGS_NEW_KEY logic
    8084b788c2fb crypto: safexcel - Add error handling for dma_map_sg() calls
    e136daaa10e4 crypto: af_alg - Disallow multiple in-flight AIO requests
    1e9d70723398 crypto: ccp - fix memleak in ccp_init_dm_workarea
    b94f7e34d6a2 crypto: sa2ul - Return crypto_aead_setkey to transfer the error
    c4c54fce9ec5 crypto: virtio - Handle dataq logic with tasklet
    6d9f17829eb6 crypto: jh7110 - Correct deferred probe return
    2831f4d3bfa6 crypto: rsa - add a check for allocation failure
    089ff0eeb785 selinux: Fix error priority for bind with AF_UNSPEC on PF_INET6 socket
    70481755ed77 drivers/thermal/loongson2_thermal: Fix incorrect PTR_ERR() judgment
    628fb8986479 cpuidle: haltpoll: Do not enable interrupts when entering idle
    cfd7c9d260dc mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
    5e9908878034 kunit: debugfs: Fix unchecked dereference in debugfs_print_results()
    335176dd8eba thermal: core: Fix NULL pointer dereference in zone registration error path
    c4323f66f39e ACPI: extlog: Clear Extended Error Log status when RAS_CEC handled the error
    2920ac9d7e79 ACPI: LPSS: Fix the fractional clock divider flags
    ed492c4739e1 spi: sh-msiof: Enforce fixed DTDL for R-Car H3
    48be1364dd38 efivarfs: Free s_fs_info on unmount
    0049fe7e4a85 efivarfs: force RO when remounting if SetVariable is not supported
    408bbd1e1746 calipso: fix memory leak in netlbl_calipso_add_pass()
    5dd08ac0bc65 cpufreq: scmi: process the result of devm_of_clk_add_hw_provider()
    8271d397a9ff platform/x86/intel/vsec: Fix xa_alloc memory leak
    b1432249f169 spi: cadence-quadspi: add missing clk_disable_unprepare() in cqspi_probe()
    69c2d6e40d97 KEYS: encrypted: Add check for strsep
    d1ac288b2742 ACPI: LPIT: Avoid u32 multiplication overflow
    39af144b6d01 ACPI: video: check for error while searching for backlight device parent
    f58ec36850ae mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
    d83b2b32ba0f spi: spi-zynqmp-gqspi: fix driver kconfig dependencies
    bf1bf09e6b59 perf/x86/intel/uncore: Fix NULL pointer dereference issue in upi_fill_topology()
    20c09814782b sched/fair: Update min_vruntime for reweight_entity() correctly
    024352f7928b powerpc/imc-pmu: Add a null pointer check in update_events_in_group()
    69f95c5e9220 powerpc/powernv: Add a null pointer check in opal_powercap_init()
    a14c55eb461d powerpc/powernv: Add a null pointer check in opal_event_init()
    dd8422ff271c powerpc/powernv: Add a null pointer check to scom_debug_init_one()
    bc063bf0934b powerpc/rtas: Avoid warning on invalid token argument to sys_rtas()
    2b03b50d1d88 powerpc/hv-gpci: Add return value check in affinity_domain_via_partition_show function
    0a16df5beb82 selftests/powerpc: Fix error handling in FPU/VMX preemption tests
    01f0876efc26 KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with MSR_EE
    267980ea1081 KVM: PPC: Book3S HV: Introduce low level MSR accessor
    abcaadd4ce4a KVM: PPC: Book3S HV: Use accessors for VCPU registers
    412acaf9e213 drivers/perf: hisi: Fix some event id for HiSilicon UC pmu
    b60f26de4ecf perf/arm-cmn: Fix HN-F class_occup_id events
    df16afba2378 powerpc/pseries/memhp: Fix access beyond end of drmem array
    c927d8aff942 powerpc/44x: select I2C for CURRITUCK
    08beb0d4362b x86: Fix CPUIDLE_FLAG_IRQ_ENABLE leaking timer reprogram
    f7aac5fede0b powerpc: add crtsavres.o to always-y instead of extra-y
    e1c865112415 EDAC/thunderx: Fix possible out-of-bounds string access
    91e7cc27b896 x86/mce/inject: Clear test status value
    2de76cf01e57 x86/lib: Fix overflow when counting digits

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 374fd80318..af8027c51a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "55f4682a75d1673cd78504a7342918c1b5dc4d16"
-SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
+SRCREV_machine ?= "f1ed79ed10e0107924041bfdb685230407343857"
+SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.13"
+LINUX_VERSION ?= "6.6.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d391292488..274d9a4456 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.13"
+LINUX_VERSION ?= "6.6.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
+SRCREV_machine ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 9f2fd64b34..7a47bac057 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d35039de8e71f9cd91e0056a3b107f5b02766bdb"
-SRCREV_machine:qemuarm64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemuloongarch64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemumips ?= "7b5332f480366b75d8c676482731a6b388ff5b0f"
-SRCREV_machine:qemuppc ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemuriscv64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemuriscv32 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemux86 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemux86-64 ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_machine:qemumips64 ?= "5915b5fa9b827e29cf1946dc0f92ab2b481de011"
-SRCREV_machine ?= "43f7233f561431ae4c0e745985921bc84095a39e"
-SRCREV_meta ?= "c32ab927d38291b1d2003ff491aa2ad4b60e1241"
+SRCREV_machine:qemuarm ?= "40ac68226069c0bff98d4b63ad65c8086d419f5a"
+SRCREV_machine:qemuarm64 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemuloongarch64 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemumips ?= "70e1400404bd19cd911c4fd853d5d784bf0ae3c6"
+SRCREV_machine:qemuppc ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemuriscv64 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemuriscv32 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemux86 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemux86-64 ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:qemumips64 ?= "16005cbeaf56e311827be25638e0a9373c89d134"
+SRCREV_machine ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "62b19b564504d027296502e0e30baf5fe0ef080a"
+SRCREV_machine:class-devupstream ?= "51f354b815c44f1e423edb3f089ceece9bd26976"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.13"
+LINUX_VERSION ?= "6.6.15"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


