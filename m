Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C367E6FE43
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 18:03:07 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.5458.1725645778362672901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 11:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLr7AXHC;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4568780a168so13684351cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 11:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725645777; x=1726250577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YiiF1byAq5emLxzok5qUYqIr6W26Sj4C7oSVhpLl2o=;
        b=RLr7AXHCfXrqSBfN4Zg5WMVHAm8juOi1s3nUNJnVQHJTl2OGhftzGt/rG6Q2Vr3fb7
         7KIbXPBjXcFMWI7g60VDODmkUMnXW+eiJOU5IWv41nxu/BhCpczejNKUyAYhgV6jtZ04
         WrG8AB+gwjYvPDrtZby1rdIshTG7FCkp6ZqGpWTdTy7oj9LW8ywZMu0rNiouOTq/0Mhu
         0GK12dnoempUsc8s6e3VUAoGwyPwkevPhSqpCUogqpUODKw4algYTxlB8PMfYqCxqYVA
         QcSsY9UpirLEbdQNhYk7scmivjebOLB0sQJfqTLo69NEcz9N0wOPQMLQmBYyhbOhfjVi
         WPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645777; x=1726250577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YiiF1byAq5emLxzok5qUYqIr6W26Sj4C7oSVhpLl2o=;
        b=J4TjnXR8niXUqt/wJN2EcUAo3PJ+qKaiRQMHQPGQMTE46WUi3Zj51XNligquBTYj04
         R5hb9b0KTPtKH8MKB+2XT0p07dYitJQSRssWXVSDcPPSvqAU7pAnJCp9lEnt2k4nFwHg
         lE9Vchre9XMpOavIjP/Aj9C8u3Zty2W/X5gN9WBYbLnGrpnaV3ibx+ZeTGLBFskEHHQF
         XXHBvqQTwqusWpLBKWOkCwSLqwJ7N6mcDeGIOcObsW7hkZ702l1XjZB0WSbag0uslxyG
         KlrVvHNUXtI7MPMly6ocrfB+CHK7MPLlPsSFoEN9r8cwshnCxMZ5hXUZaKLukhkodYyE
         59jQ==
X-Gm-Message-State: AOJu0Yw1slRDW+OMW4dkJX24OXTmKTyG7a5/RXiZQ/Rm3InbdDtLLNtE
	JGvECve0pYwol2EYIDzJnOn//AoRgNjMW8oUaAq9B6VYRburdPZLJG9CNQ==
X-Google-Smtp-Source: AGHT+IH0/BG0xaVGztPO4Tq+QPnnqbAk1i3wjGKBj6EoyeF/bKpr6GP5/WN+Onz1KxzGQm0G/sgt1g==
X-Received: by 2002:a05:622a:144c:b0:457:c776:e350 with SMTP id d75a77b69052e-4580c75a11dmr34270761cf.46.1725645776525;
        Fri, 06 Sep 2024 11:02:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801a15393sm18136871cf.3.2024.09.06.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:02:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] linux-yocto/5.15: update to v5.15.166
Date: Fri,  6 Sep 2024 14:02:47 -0400
Message-Id: <20240906180247.376758-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906180247.376758-1-bruce.ashfield@gmail.com>
References: <20240906180247.376758-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 18:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204292

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    14e468424d3e Linux 5.15.166
    a979b02d8519 apparmor: fix policy_unpack_test on big endian systems
    85449b28ff6a scsi: aacraid: Fix double-free on probe failure
    7770f1d8b9ef igc: Fix qbv tx latency by setting gtxoffset
    10e5089c833e igc: Fix reset adapter logics when tx mode change
    a46f5faa600f phy: zynqmp: Enable reference clock correctly
    16d197fa12a5 usb: cdnsp: fix for Link TRB with TC
    80af8b9cf65d usb: cdnsp: fix incorrect index in cdnsp_get_hw_deq function
    18bdd20aaae7 usb: core: sysfs: Unmerge @usb3_hardware_lpm_attr_group in remove_power_attributes()
    d51374c59c62 usb: dwc3: st: add missing depopulate in probe error path
    060f41243ad7 usb: dwc3: st: fix probed platform device ref count on probe error path
    111277b881de usb: dwc3: core: Prevent USB core invalid event buffer address access
    96f7322e8e9f usb: dwc3: omap: add missing depopulate in probe error path
    bb30c8863479 USB: serial: option: add MeiG Smart SRM825L
    59f93e9c4b08 cdc-acm: Add DISABLE_ECHO quirk for GE HealthCare UI Controller
    eaff392c1e34 soc: qcom: cmd-db: Map shared memory as WC, not WB
    7535db0624a2 nfc: pn533: Add poll mod list filling check
    b00950a088f7 net: busy-poll: use ktime_get_ns() instead of local_clock()
    4643b91691e9 gtp: fix a potential NULL pointer dereference
    7a8d98b6d648 ethtool: check device is present when getting link settings
    131ee27d0c5c dmaengine: dw: Add memory bus width verification
    e219cf9c8c16 dmaengine: dw: Add peripheral bus width verification
    e144fc9ccc57 phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume
    c401845e328b phy: xilinx: phy-zynqmp: dynamic clock support for power-save
    65697691a0ee phy: xilinx: add runtime PM support
    5d946850692f PM: runtime: Add DEFINE_RUNTIME_DEV_PM_OPS() macro
    69fae8ed3136 PM: core: Add EXPORT[_GPL]_SIMPLE_DEV_PM_OPS macros
    1b993cb3efbc PM: core: Remove DEFINE_UNIVERSAL_DEV_PM_OPS() macro
    a8d2245fede0 soundwire: stream: fix programming slave ports for non-continous port maps
    124f20c5f6e5 net:rds: Fix possible deadlock in rds_message_put
    4e8d6ac8fc9f cgroup/cpuset: Prevent UAF in proc_cpuset_show()
    221e3b1297e7 ata: libata-core: Fix null pointer dereference on error
    8ad4838040e5 drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
    bebef79bdce3 Revert "MIPS: Loongson64: reset: Prioritise firmware service"
    218b482f009a mptcp: sched: check both backup in retrans
    0af4407532cb net: mana: Fix race of mana_hwc_post_rx_wqe and new hwc response
    68b22b246886 wifi: mwifiex: duplicate static structs used in driver instances
    6341c2856785 pinctrl: single: fix potential NULL dereference in pcs_get_function()
    ce3c431c1f45 pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
    19c8fce75da0 btrfs: run delayed iputs when flushing delalloc
    da6a85d19788 drm/amdgpu: Using uninitialized value *size when calling amdgpu_vce_cs_reloc
    ce0aa899c909 tools: move alignment-related macros to new <linux/align.h>
    95f73d01f547 Input: MT - limit max slots
    c6a73b7469f0 Bluetooth: hci_ldisc: check HCI_UART_PROTO_READY flag in HCIUARTGETPROTO
    93ca1e5c7fa9 mm/numa: no task_numa_fault() call if PTE is changed
    1e6440eb42f9 mm/numa: no task_numa_fault() call if PMD is changed
    3fbfd4881879 ALSA: timer: Relax start tick time check for slave timer elements
    4d2daf3c332f hwmon: (ltc2992) Fix memory leak in ltc2992_parse_dt()
    4d3a389f6f46 Revert "drm/amd/display: Validate hw_points_num before using it"
    dce1400991d9 mmc: dw_mmc: allow biu and ciu clocks to defer
    96b076e8ee5b KVM: arm64: Make ICC_*SGI*_EL1 undef in the absence of a vGICv3
    ae857158b811 cxgb4: add forgotten u64 ivlan cast before shift
    d78daaf7bb3b HID: microsoft: Add rumble support to latest xbox controllers
    e73ffa997c0e HID: wacom: Defer calculation of resolution until resolution_code is known
    34842918cb9c MIPS: Loongson64: Set timer mode in cpu-probe
    848c8fb6591f scsi: core: Fix the return value of scsi_logical_block_count()
    951d6cb5eaac Bluetooth: MGMT: Add error handling to pair_device()
    e40515582141 mmc: mmc_test: Fix NULL dereference on allocation failure
    9b8b65211a88 drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
    5c28ce95f8a3 drm/msm/dp: reset the link phy params before link training
    330dced39b4f drm/msm/dpu: don't play tricks with debug macros
    46cb057ee90b net: xilinx: axienet: Fix dangling multicast addresses
    a0699decdd6a net: xilinx: axienet: Always disable promiscuous mode
    c05155cc4557 netfilter: flowtable: validate vlan header
    975f764e96f7 ipv6: prevent possible UAF in ip6_xmit()
    e891b36de161 ipv6: fix possible UAF in ip6_finish_output2()
    24e93695b123 ipv6: prevent UAF in ip6_send_skb()
    52d99a69f3d5 netem: fix return value if duplicate enqueue fails
    a10d0337115a net: dsa: mv88e6xxx: Fix out-of-bound access
    fd7008c3296c net: dsa: mv88e6xxx: replace ATU violation prints with trace points
    932bf7cf9bb6 net: dsa: mv88e6xxx: read FID when handling ATU violations
    a66828e6b877 dpaa2-switch: Fix error checking in dpaa2_switch_seed_bp()
    90306305726e ice: fix ICE_LAST_OFFSET formula
    5c69cc8fde38 bonding: fix xfrm state handling when clearing active slave
    2f72c6a66bcd bonding: fix xfrm real_dev null pointer dereference
    2f5bdd68c1ce bonding: fix null pointer deref in bond_ipsec_offload_ok
    9e69809e46b0 bonding: fix bond_ipsec_offload_ok return type
    78ad3172b5a9 ip6_tunnel: Fix broken GRO
    e85e6b5c45a6 netfilter: nft_counter: Synchronize nft_counter_reset() against reader.
    dec350d1c0f7 netfilter: nft_counter: Disable BH in nft_counter_offload_stats().
    fa6c23fe6dca kcm: Serialise kcm_sendmsg() for the same socket.
    38188b4d6d3e tc-testing: don't access non-existent variable on exception
    a981ae674dc2 Bluetooth: SMP: Fix assumption of Central always being Initiator
    351e82525d37 Bluetooth: hci_core: Fix LE quote calculation
    b444f5de60f5 platform/surface: aggregator: Fix warning when controller is destroyed in probe
    916a3a8a7870 net: mana: Fix doorbell out of order violation and avoid unnecessary doorbell rings
    210f4cbfa561 dm suspend: return -ERESTARTSYS instead of -EINTR
    f80d537d4c6b media: solo6x10: replace max(a, min(b, c)) by clamp(b, a, c)
    a510b574a9ec nfsd: make svc_stat per-network namespace instead of global
    ceefe749669c nfsd: remove nfsd_stats, make th_cnt a global counter
    5bbefe83fa72 nfsd: make all of the nfsd stats per-network namespace
    73c43bccf25c nfsd: expose /proc/net/sunrpc/nfsd in net namespaces
    2108ae12cc19 nfsd: rename NFSD_NET_* to NFSD_STATS_*
    143a0f5eb5e3 sunrpc: use the struct net as the svc proc private
    6719776e61e0 sunrpc: remove ->pg_stats from svc_program
    aba2fe2de144 sunrpc: pass in the sv_stats struct through svc_create_pooled
    c78169c08203 nfsd: stop setting ->pg_stats for unused stats
    c66f8801300e sunrpc: don't change ->sv_stats if it doesn't exist
    d7b5ab28bd5c NFSD: Fix frame size warning in svc_export_parse()
    b4b0e9d87afb NFSD: Rewrite synopsis of nfsd_percpu_counters_init()
    5ec81b48797b NFSD: Refactor the duplicate reply cache shrinker
    bde5bdf88f2c NFSD: Replace nfsd_prune_bucket()
    eefe7b37988d NFSD: Rename nfsd_reply_cache_alloc()
    a8f1afef7764 NFSD: Refactor nfsd_reply_cache_free_locked()
    8549384d0f65 nfsd: move init of percpu reply_cache_stats counters back to nfsd_init_net
    70fdee548c03 nfsd: move reply cache initialization into nfsd startup
    da2a0c623181 block: use "unsigned long" for blk_validate_block_size().
    1f6b62392453 gtp: pull network headers in gtp_dev_xmit()
    0feeaedf39b5 hrtimer: Prevent queuing of hrtimer without a function callback
    003e907cdd5c nvmet-rdma: fix possible bad dereference when freeing rsps
    ca842d364e48 ext4: set the type of max_zeroout to unsigned int to avoid overflow
    7b9eff4b0591 irqchip/gic-v3-its: Remove BUG_ON in its_vpe_irq_domain_alloc
    0f47e4fd6f34 usb: dwc3: core: Skip setting event buffers for host only controllers
    3b47bb2288c5 platform/x86: lg-laptop: fix %s null argument warning
    1b5b9e551339 clocksource: Make watchdog and suspend-timing multiplication overflow safe
    7462b116b9a6 s390/iucv: fix receive buffer virtual vs physical address confusion
    537a6bf1c284 openrisc: Call setup_memory() earlier in the init sequence
    a5991dfc631a NFS: avoid infinite loop in pnfs_update_layout.
    733049770886 nvmet-tcp: do not continue for invalid icreq
    5334e51afb35 net: hns3: add checking for vf id of mailbox
    9018928d35aa Bluetooth: bnep: Fix out-of-bound access
    e8d4c2465ff9 usb: gadget: fsl: Increase size of name buffer for endpoints
    4759856c8b06 f2fs: fix to do sanity check in update_sit_entry
    4c80c19eab42 btrfs: delete pointless BUG_ON check on quota root in btrfs_qgroup_account_extent()
    dc323a57cdda btrfs: change BUG_ON to assertion in tree_move_down()
    427d7cb3a91e btrfs: send: handle unexpected data in header buffer in begin_cmd()
    7b6acbc2596f btrfs: handle invalid root reference found in may_destroy_subvol()
    dead0848c21d btrfs: change BUG_ON to assertion when checking for delayed_node root
    01d720ddf816 powerpc/boot: Only free if realloc() succeeds
    de34590df6a3 powerpc/boot: Handle allocation failure in simple_realloc()
    4a8de7a7fc2b parisc: Use irq_enter_rcu() to fix warning at kernel/context_tracking.c:367
    ef1d6d795e87 memory: stm32-fmc2-ebi: check regmap_read return value
    06cb3463aa58 x86: Increase brk randomness entropy for 64-bit systems
    ddf899fc6f7e md: clean up invalid BUG_ON in md_ioctl
    70f5ab8e4693 netlink: hold nlk->cb_mutex longer in __netlink_dump_start()
    1052160a674d clocksource/drivers/arm_global_timer: Guard against division by zero
    a6394f5ee523 virtiofs: forbid newlines in tags
    cec155470cc9 drm/lima: set gp bus_stop bit before hard reset
    d41f32523b77 net/sun3_82586: Avoid reading past buffer in debug output
    ad533c5aa38a media: drivers/media/dvb-core: copy user arrays safely
    3ecf37c04e97 scsi: lpfc: Initialize status local variable in lpfc_sli4_repost_sgl_list()
    673d4e5d36eb fs: binfmt_elf_efpic: don't use missing interpreter's properties
    a5f1d30c51c4 media: pci: cx23885: check cx23885_vdev_init() return
    0f8049e4a15f quota: Remove BUG_ON from dqget()
    bfbab62ca69f fuse: fix UAF in rcu pathwalks
    187d844f2e98 afs: fix __afs_break_callback() / afs_drop_open_mmap() race
    10fb6af80d73 ext4: do not trim the group with corrupted block bitmap
    865759a97916 nvmet-trace: avoid dereferencing pointer too early
    ee17eabe4c5b powerpc/xics: Check return value of kasprintf in icp_native_map_one_cpu
    3a39e6b47a7f memory: tegra: Skip SID programming if SID registers aren't set
    5750e353e619 arm64: Fix KASAN random tag seed initialization
    8afc79eb9bf5 hwmon: (ltc2992) Avoid division by zero
    9da4530b434e IB/hfi1: Fix potential deadlock on &irq_src_lock and &dd->uctxt_lock
    ad98666362ac wifi: iwlwifi: fw: Fix debugfs command sending
    3a819bf04e71 wifi: iwlwifi: abort scan when rfkill on but device enabled
    240788757061 gfs2: setattr_chown: Add missing initialization
    84d75e35b4cc scsi: spi: Fix sshdr use
    41eae1d713cd media: qcom: venus: fix incorrect return value
    145769ae51f5 binfmt_misc: cleanup on filesystem umount
    10e2c63a82c3 staging: ks7010: disable bh on tx_dev_lock
    d8b1d3b05885 drm/amd/display: Validate hw_points_num before using it
    b24c10bf2517 staging: iio: resolver: ad2s1210: fix use before initialization
    2a4035049606 media: radio-isa: use dev_name to fill in bus_info
    abd6fa88a7cc i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
    640912de8298 i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
    164164e3d55b s390/smp,mcck: fix early IPI handling
    93200b564991 RDMA/rtrs: Fix the problem of variable not initialized fully
    ad8e66837efb i2c: riic: avoid potential division by zero
    8e3799649d9b wifi: cw1200: Avoid processing an invalid TIM IE
    2af058a26c06 wifi: mac80211: fix BA session teardown race
    89795eeba6d1 wifi: cfg80211: check wiphy mutex is held for wdev mutex
    b4373d9235b6 ssb: Fix division by zero issue in ssb_calc_clock_rate
    fdb349e7f8c3 ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7
    195918217448 net: hns3: fix a deadlock problem when config TC during resetting
    93d9ca2a1e91 net: hns3: fix wrong use of semaphore up
    6c4a0ba674f4 netfilter: nf_queue: drop packets with cloned unconfirmed conntracks
    356beb911b63 netfilter: flowtable: initialise extack before use
    fa2545118a7c netfilter: allow ipv6 fragments to arrive on different devices
    81de530a377a mptcp: correct MPTCP_SUBFLOW_ATTR_SSN_OFFSET reserved size
    5e4d2efaae90 mlxbf_gige: disable RX filters until RX path initialized
    86a7a8732cc7 mlxbf_gige: Remove two unused function declarations
    b799db9fbcca net: dsa: vsc73xx: check busy flag in MDIO operations
    65fa752e3a98 net: dsa: vsc73xx: use read_poll_timeout instead delay loop
    db9f552d4542 net: dsa: vsc73xx: pass value in phy_write operation
    eb5c3021ef3b net: axienet: Fix register defines comment description
    24cf390a5426 atm: idt77252: prevent use after free in dequeue_rx()
    4339641cdb3e net/mlx5e: Correctly report errors for ethtool rx flows
    eadfff2743d6 igc: Fix packet still tx after gate close by reducing i226 MAC retry buffer
    82481cb0007d igc: remove I226 Qbv BaseTime restriction
    adfe17bd41ed igc: Correct the launchtime offset
    d6955574bbf0 s390/uv: Panic for set and remove shared access UVC errors
    f92cbcc68833 drm/amdgpu/jpeg2: properly set atomics vmid field
    0fbe2a72e853 memcg_write_event_control(): fix a user-triggerable oops
    df368d0d5fbb drm/amdgpu: Actually check flags for all context ops.
    dfe7d9c6ff79 btrfs: tree-checker: add dev extent item checks
    3337cb632718 selinux: fix potential counting error in avc_add_xperms_decision()
    5053581fe5df fix bitmap corruption on close_range() with CLOSE_RANGE_UNSHARE
    0f00902172b2 bitmap: introduce generic optimized bitmap_size()
    0dbb75302f99 btrfs: rename bitmap_set_bits() -> btrfs_bitmap_set_bits()
    ac8d72e84dfd s390/cio: rename bitmap_size() -> idset_bitmap_size()
    6331ca6e2aee fs/ntfs3: add prefix to bitmap_size() and use BITS_TO_U64()
    cda54ec82c0f vfs: Don't evict inode under the inode lru traversing context
    8d604da7c7a9 dm persistent data: fix memory allocation failure
    5541aec7ff0f dm resume: don't return EINVAL when signalled
    fbea98895fe9 arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    a665e3b7ac7d s390/dasd: fix error recovery leading to data corruption on ESE devices
    23ce6ba3b954 thunderbolt: Mark XDomain as unplugged when router is removed
    365ef7c4277f xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration
    ccdc892fd7ac ALSA: usb-audio: Support Yamaha P-125 quirk entry
    8e3d14c32fab ALSA: usb-audio: Add delay quirk for VIVO USB-C-XE710 HEADSET
    25ee8b290820 char: xillybus: Check USB endpoints when probing device
    98ee65d9e2ac char: xillybus: Refine workqueue handling
    409b495f8e33 char: xillybus: Don't destroy workqueue from work item running on it
    8c78303eafbf fuse: Initialize beyond-EOF page contents before setting uptodate
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 459268e821..9a616c6580 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "648e2b0d0a1c9a9bb317bdb55b29993f2e0af2d0"
-SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
+SRCREV_machine ?= "66fb50de38a98582ec630efde6e48779cf1ad8a9"
+SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.165"
+LINUX_VERSION ?= "5.15.166"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 56934b4969..bb64fc455d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.165"
+LINUX_VERSION ?= "5.15.166"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8dae928d1dd4ddfbc311ba6260984e110f739183"
-SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
+SRCREV_machine ?= "38da3ed27e665b67bab0063860ee41eb65d77a37"
+SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 639d68c277..377ae22e80 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "de43915ea5c320615b33faac4c978fb5198a5c0f"
-SRCREV_machine:qemuarm64 ?= "431eb5ac3e3e1a4b59dbc3a24187a73342149608"
-SRCREV_machine:qemumips ?= "d2ad175f9908bdd74b52cfffdd63dffe5c3fc58b"
-SRCREV_machine:qemuppc ?= "302b961f25eb7a0810e10642fde14d66dee71431"
-SRCREV_machine:qemuriscv64 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
-SRCREV_machine:qemuriscv32 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
-SRCREV_machine:qemux86 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
-SRCREV_machine:qemux86-64 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
-SRCREV_machine:qemumips64 ?= "84c58d392f4efc9c8e070ed134be1cae96942805"
-SRCREV_machine ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
-SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
+SRCREV_machine:qemuarm ?= "b289f21c7b9243734e00379101f3c95ebb141a5b"
+SRCREV_machine:qemuarm64 ?= "37bacb1a9110a39a0e993b74136209f78706a803"
+SRCREV_machine:qemumips ?= "c94b9753f5b0c765642d735b691247d2c1fb839d"
+SRCREV_machine:qemuppc ?= "c8834e0bad0de37a2d70a07fdc52e7460d685611"
+SRCREV_machine:qemuriscv64 ?= "a78a1043113066981d74825afce38bca3063664f"
+SRCREV_machine:qemuriscv32 ?= "a78a1043113066981d74825afce38bca3063664f"
+SRCREV_machine:qemux86 ?= "a78a1043113066981d74825afce38bca3063664f"
+SRCREV_machine:qemux86-64 ?= "a78a1043113066981d74825afce38bca3063664f"
+SRCREV_machine:qemumips64 ?= "28da2017909cb5a715a71c53654cc098e61821cd"
+SRCREV_machine ?= "a78a1043113066981d74825afce38bca3063664f"
+SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fa93fa65db6e232b5f2226dd86c9f066ec6dfd97"
+SRCREV_machine:class-devupstream ?= "14e468424d3edcf23167133d6ee2f3e3c6c5a022"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.165"
+LINUX_VERSION ?= "5.15.166"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


