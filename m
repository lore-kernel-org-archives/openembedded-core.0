Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB749C43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 03:39:19 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.4064.1666150756552990020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 20:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gE88fJNe;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id cr19so7700825qtb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LajpQeDEJhiF63TxJZzzOaLaQ/o6f52WPdhc7YHwiHw=;
        b=gE88fJNeaXkth5gcl7LyF/DtRe3Zbk16KKS9aoMAV4DuvYx5d883GFNVto/4XWOJWn
         LJi5Igf21PtW6LqIVFtmjl/0DLHTvKr+MvgyMoMBTdHNGRqsjfkQCH5fsPbwhawuKLLe
         oMMtRf0rkTQ3+wcyKaLmluVFMjbs0vI2RZXbY9BrUftJ8ribXJGLP9nsgY30aBrwLE+5
         9LqSD2ct5FsN9szqjxa4/U0GfAn2b3uBpnYxUFUDbaMqQSM4G7jLf2JzqHpTo8kKeYIk
         gGw5LdqVUrBlCGHHoavjiTNmXMFfLqsWDfQ8fbtpWvoKifmYq+0t7q3ByfX5vQPwFXOD
         s4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LajpQeDEJhiF63TxJZzzOaLaQ/o6f52WPdhc7YHwiHw=;
        b=PYW1jPvNF3kj9sNNPkfHWqUp+vpSh8XFRAZzFgDG2hc2rKvVDvLp4cVEV56bcjo8tx
         AUYC2HUPu7jvHwGQ7Lo1zmeReJNhMYc/Z83oNHMUb0i1n+UXDOnuvOcqbzNXhgdaJW2a
         f0ed0cC9NSfCZbe6byz1xjEO/lHirvdgdNqyvK6YulCpmRkPOmJ905jn3WPR8EvtsNfp
         YwjxYwg5jcwHJVytXk9kPD7KEqbU2fDCkvMzI13DnzoqxKIB+xGYSD5E7ZiUuco9h1me
         fwc+IZkpyTYezMJo6xKBqMZ6UCwAVeuz0lcgSAz5K5i03WTl6+qQz+R5k8AHpQvDaSJb
         dNiw==
X-Gm-Message-State: ACrzQf1yUWSTr24JExzXbF8eWrKdYNncORYaIat0EAi/qHa3nZ4JWz6R
	p0HyzbNP8gZE0116gvy2I76eehyjTaq9jg==
X-Google-Smtp-Source: AMsMyM42WXmtOqKqyF/jv74y1TOlc1etRrCM30DKzwWT0+KKSfaQiuiC5Ux6p9FDArrsISfhereJJg==
X-Received: by 2002:a05:622a:199c:b0:39c:e14a:f155 with SMTP id u28-20020a05622a199c00b0039ce14af155mr4993095qtc.73.1666150755154;
        Tue, 18 Oct 2022 20:39:15 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id t16-20020a37ea10000000b006ecc5f5635dsm3793946qkj.113.2022.10.18.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 20:39:14 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/5.19: update to v5.19.14
Date: Tue, 18 Oct 2022 23:39:10 -0400
Message-Id: <7867dfbbcf3145d9bac67c11e5bf564c838e2fe1.1666150638.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1666150638.git.bruce.ashfield@gmail.com>
References: <cover.1666150638.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 03:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171952

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    30c780ac0f9f Linux 5.19.14
    b11cc6399c56 damon/sysfs: fix possible memleak on damon_sysfs_add_target
    381eae6b1dc3 x86/alternative: Fix race in try_get_desc()
    1e624467e41f x86/cacheinfo: Add a cpu_llc_shared_mask() UP variant
    b1bad76d6a18 KVM: x86: Hide IA32_PLATFORM_DCA_CAP[31:0] from the guest
    f45380a17be5 perf tests record: Fail the test if the 'errs' counter is not zero
    77d5e98fb6f0 perf test: Fix test case 87 ("perf record tests") for hybrid systems
    b781430cd770 net: ethernet: mtk_eth_soc: fix mask of RX_DMA_GET_SPORT{,_V2}
    c81bca132fc6 net: mscc: ocelot: fix tagged VLAN refusal while under a VLAN-unaware bridge
    79a55020c989 clk: imx93: drop of_match_ptr
    539cc4ac04f8 clk: iproc: Do not rely on node name for correct PLL setup
    61560f315371 drm/i915/gt: Perf_limit_reasons are only available for Gen11+
    b1dd83f321dc clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
    3e8d61faead0 vdpa/mlx5: Fix MQ to support non power of two num queues
    b3b8359fafb4 virtio-blk: Fix WARN_ON_ONCE in virtio_queue_rq()
    bffdf0421ba8 vdpa/ifcvf: fix the calculation of queuepair
    9f9687bfd884 ice: xsk: drop power of 2 ring size restriction for AF_XDP
    01c2475d0c21 ice: xsk: change batched Tx descriptor cleaning
    dcf42724aacb selftests: Fix the if conditions of in test_extra_filter()
    929a2f6e93a8 net: phy: Don't WARN for PHY_UP state in mdio_bus_phy_resume()
    07eb54aa93d7 net: stmmac: power up/down serdes in stmmac_open/release
    ec1a5138428f wifi: mac80211: fix memory corruption in minstrel_ht_update_rates()
    a84813338208 wifi: mac80211: fix regression with non-QoS drivers
    3afc354e1084 wifi: cfg80211: fix MCS divisor value
    e8027e26ad58 nvme: Fix IOC_PR_CLEAR and IOC_PR_RELEASE ioctls for nvme devices
    ab3abb72bec2 net/mlxbf_gige: Fix an IS_ERR() vs NULL bug in mlxbf_gige_mdio_probe
    8b1d17a8d8ba cxgb4: fix missing unlock on ETHOFLD desc collect fail path
    3687a0c03863 net: sched: act_ct: fix possible refcount leak in tcf_ct_init()
    75b276c0537e usbnet: Fix memory leak in usbnet_disconnect()
    1a39d83193c6 perf parse-events: Remove "not supported" hybrid cache events
    44ff610a3cd4 perf print-events: Fix "perf list" can not display the PMU prefix for some hybrid cache events
    c4a07387a4b0 perf parse-events: Break out tracepoint and printing
    9ac8b5bae9f2 gpio: mvebu: Fix check for pwm support on non-A8K platforms
    314df2265c04 Input: melfas_mip4 - fix return value check in mip4_probe()
    3cd81a694233 Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"
    e126ad29ec71 net: macb: Fix ZynqMP SGMII non-wakeup source resume failure
    5c94fcc0e87f drm/bridge: lt8912b: fix corrupted image output
    6fe84153067b drm/bridge: lt8912b: set hdmi or dvi mode
    8d2b780e1ed6 drm/bridge: lt8912b: add vsync hsync
    18bf2334b0b3 ASoC: tas2770: Reinit regcache on reset
    a0977f22b8a7 arm64: dts: qcom: sm8350: fix UFS PHY serdes size
    2c8028dd3f8a clk: microchip: mpfs: make the rtc's ahb clock critical
    ab5081ce9f9c clk: microchip: mpfs: fix clk_cfg array bounds violation
    8e8516fe1a64 ASoC: imx-card: Fix refcount issue with of_node_put
    1317541f0dae soc: sunxi: sram: Fix debugfs info for A64 SRAM C
    450080540800 soc: sunxi: sram: Fix probe function ordering issues
    e4768a5b0a30 soc: sunxi: sram: Prevent the driver from being unbound
    44a9633e9e16 soc: sunxi: sram: Actually claim SRAM regions
    24d6230edfc2 ARM: dts: am5748: keep usb4_tm disabled
    6f1364939969 reset: imx7: Fix the iMX8MP PCIe PHY PERST support
    38d9f71a04c2 ARM: dts: am33xx: Fix MMCHS0 dma properties
    3cf3c17fd66f media: v4l2-compat-ioctl32.c: zero buffer passed to v4l2_compat_get_array_args()
    fa20a7dcd56b media: mediatek: vcodec: Drop platform_get_resource(IORESOURCE_IRQ)
    b901652568f3 media: rkvdec: Disable H.264 error detection
    3a35e67f6b29 media: dvb_vb2: fix possible out of bound access
    e88a7c1831d4 mm,hwpoison: check mm when killing accessing process
    fcc9261c2b5f mm/hugetlb: correct demote page offset logic
    f9cedf6b357e mm: bring back update_mmu_cache() to finish_fault()
    3094c01fb1e3 mm: fix madivse_pageout mishandling on non-LRU page
    edbaf99db91b mm/migrate_device.c: copy pte dirty bit to page
    e85ab5ae17bd mm/migrate_device.c: add missing flush_cache_page()
    ca7d59a4b5f3 mm/migrate_device.c: flush TLB while holding PTL
    82a00edf23e4 mm: fix dereferencing possible ERR_PTR
    a346ba002906 mm/page_isolation: fix isolate_single_pageblock() isolation behavior
    faee7721e795 mm: prevent page_frag_alloc() from corrupting the memory
    0cddc19ddb05 mm/page_alloc: fix race condition between build_all_zonelists and page allocation
    437484d936ac mm: gup: fix the fast GUP race against THP collapse
    c6e2a0587215 mmc: hsq: Fix data stomping during mmc recovery
    1209607a7133 mmc: moxart: fix 4-bit bus width and remove 8-bit bus width
    b41808bfa049 mptcp: fix unreleased socket in accept queue
    5368d1a17ec5 mptcp: factor out __mptcp_close() without socket lock
    16220537557a mm: fix BUG splat with kvmalloc + GFP_ATOMIC
    2c5a04961201 libata: add ATA_HORKAGE_NOLPM for Pioneer BDR-207M and BDR-205
    38d854c4a11c vduse: prevent uninitialized memory accesses
    4a1230f34f06 drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV
    5af714ceebae drm/i915/gt: Restrict forced preemption to the active context
    193153f7cc2a powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush
    a129cce68908 Revert "firmware: arm_scmi: Add clock management to the SCMI power domain"
    b48abca42e0a net: mt7531: only do PLL once after the reset
    1f4ceb7daf36 mm/damon/dbgfs: fix memory leak when using debugfs_lookup()
    decf4f5c01a8 x86/uaccess: avoid check_object_size() in copy_from_user_nmi()
    9653cc040a7d ntfs: fix BUG_ON in ntfs_lookup_inode_by_name()
    d0ebc7ef65e3 ARM: dts: integrator: Tag PCI host with device_type
    76335c4156ed frontswap: don't call ->init if no ops are registered
    26a1ca1f9fbb x86/sgx: Do not fail on incomplete sanitization on premature stop of ksgxd
    19f89548ed86 wifi: mac80211: ensure vif queues are operational after start
    d87926a7448c clk: ingenic-tcu: Properly enable registers before accessing timers
    179fd43179a1 can: c_can: don't cache TX messages for C_CAN cores
    983dd7223a9b Input: snvs_pwrkey - fix SNVS_HPVIDR1 register address
    6aac871bca33 net: usb: qmi_wwan: Add new usb-id for Dell branded EM7455
    266ee6ee24ea thunderbolt: Explicitly reset plug events delay back to USB4 spec value
    d916978b6976 usb: typec: ucsi: Remove incorrect warning
    1d54281c91d7 uas: ignore UAS for Thinkplus chips
    be014a8d8925 usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
    4a66ab5bfaea uas: add no-uas quirk for Hiksemi usb_disk
    a3ed03b3ce4d counter: 104-quad-8: Fix skipped IRQ lines during events configuration
    036eeda2212a counter: 104-quad-8: Implement and utilize register structures
    c096ac781807 counter: 104-quad-8: Utilize iomap interface
    640e0b97dfa9 perf record: Fix cpu mask bit setting for mixed mmaps
    bcd04b006c78 tools/perf: Fix out of bound access to cpu mask array
    d948e6c57793 riscv: make t-head erratas depend on MMU
    1bae99844613 Linux 5.19.13
    781e43179640 Revert "drm/i915: Extract intel_edp_fixup_vbt_bpp()"
    da42e25ec54a Revert "drm/i915/pps: Split pps_init_delays() into distinct parts"
    5f86062caf4d Revert "drm/i915/bios: Split parse_driver_features() into two parts"
    3f2631ce3c8f Revert "drm/i915/bios: Split VBT parsing to global vs. panel specific parts"
    139d38c14725 Revert "drm/i915/bios: Split VBT data into per-panel vs. global parts"
    10c7b3919e6d Revert "drm/i915/dsi: filter invalid backlight and CABC ports"
    bef6a9b54730 Revert "drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display 11+"
    9182c86a0456 Revert "drm/i915/display: Fix handling of enable_psr parameter"
    58df6af8cea3 Linux 5.19.12
    547262c5b373 ext4: make directory inode spreading reflect flexbg size
    cdefe8dd61c9 ext4: fixup possible uninitialized variable access in ext4_mb_choose_next_group_cr1()
    48a12961e800 Revert "block: freeze the queue earlier in del_gendisk"
    398a0fdb38d9 ext4: use buckets for cr 1 block scan instead of rbtree
    52e8d671393c ext4: use locality group preallocation for small closed files
    405a609430a6 ext4: avoid unnecessary spreading of allocations among groups
    b82d312ff30f ext4: make mballoc try target group first even with mb_optimize_scan
    17eb9845f20f ext4: limit the number of retries after discarding preallocations blocks
    2f5e9de15e4f ext4: fix bug in extents parsing when eh_entries == 0 and eh_depth > 0
    034ef0c47e31 devdax: Fix soft-reservation memory description
    27d5563e8f5f Makefile.debug: re-enable debug info for .S files
    6ba8627f72a4 Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
    c4f8b89f3ffc certs: make system keyring depend on built-in x509 parser
    c2eab6faf82b drm/amdgpu: don't register a dirty callback for non-atomic
    7f0dcbb0e557 i2c: mux: harden i2c_mux_alloc() against integer overflows
    4925e5e94ae9 i2c: mlxbf: Fix frequency calculation
    3b5ab5fbe69e i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
    5a7547ee0d24 i2c: mlxbf: incorrect base address passed during io write
    e46e177fd8ed i2c: imx: If pm_runtime_get_sync() returned 1 device access is possible
    c9245ea442a8 workqueue: don't skip lockdep work dependency in cancel_work_sync()
    60644dffac87 fsdax: Fix infinite loop in dax_iomap_rw()
    8054beba353b pmem: fix a name collision
    c62322e62662 gpio: mt7621: Make the irqchip immutable
    2d57e46fa45b drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
    4822afcff82c drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
    6f14c55dc8e7 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
    8836e42e8b00 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
    88e7896936e0 drm/amd/display: Limit user regamma to a valid value
    9757b3ad4498 drm/amdgpu: Skip reset error status for psp v13_0_0
    83dfcae61be8 drm/amdgpu: add HDP remap functionality to nbio 7.7
    386ca6720b34 drm/amdgpu: change the alignment size of TMR BO to 1M
    8442bc8426d1 drm/amdgpu: use dirty framebuffer helper
    444574f828cd drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards
    a5de08013672 gpio: ixp4xx: Make irqchip immutable
    7718cac88524 drm/gma500: Fix (vblank) IRQs not working after suspend/resume
    55c077d97fa6 drm/gma500: Fix WARN_ON(lock->magic != lock) error
    a6ed7624bf4d drm/gma500: Fix BUG: sleeping function called from invalid context errors
    9812e9ed3419 Drivers: hv: Never allocate anything besides framebuffer from framebuffer memory region
    98756ca2584e block: Do not call blk_put_queue() if gendisk allocation fails
    2f092fd2ce24 block: call blk_mq_exit_queue from disk_release for never added disks
    47f57236ba40 blk-mq: fix error handling in __blk_mq_alloc_disk
    0d0f5ca7f241 drm/i915/display: Fix handling of enable_psr parameter
    650a2e79d176 s390/dasd: fix Oops in dasd_alias_get_start_dev due to missing pavgroup
    54be62deede4 phy: marvell: phy-mvebu-a3700-comphy: Remove broken reset support
    1e9571887f97 cgroup: cgroup_get_from_id() must check the looked-up kn is a directory
    a899ba61958e serial: tegra-tcu: Use uart_xmit_advance(), fixes icount.tx accounting
    f986bfe60020 serial: tegra: Use uart_xmit_advance(), fixes icount.tx accounting
    f387ca14c73f serial: Create uart_xmit_advance()
    dc4b06e21691 serial: fsl_lpuart: Reset prior to registration
    f3f5f26c53ef io_uring: ensure that cached task references are always put on exit
    b4b3bc3f8501 selftests: forwarding: add shebang for sch_red.sh
    32afa1f23e42 bnxt: prevent skb UAF after handing over to PTP worker
    0559d91ee3a2 net: sched: fix possible refcount leak in tc_new_tfilter()
    9fc7a9f0a6e9 net: sunhme: Fix packet reception for len < RX_COPY_THRESHOLD
    2c8e8ab53acf bonding: fix NULL deref in bond_rr_gen_slave_id
    6c537124ea61 net: phy: micrel: fix shared interrupt on LAN8814
    32ac8c92919c net/smc: Stop the CLC flow if no link to map buffers on
    56c167a564b6 ice: Fix ice_xdp_xmit() when XDP TX queue number is not sufficient
    b65c53369786 drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
    6acb3e83b508 perf tools: Honor namespace when synthesizing build-ids
    ee7036166b91 perf kcore_copy: Do not check /proc/modules is unchanged
    e71a088d6a97 perf jit: Include program header in ELF files
    306c17dead99 perf stat: Fix cpu map index in bperf cgroup code
    98992697b30b perf stat: Fix BPF program section name
    031b4f40487e can: gs_usb: gs_can_open(): fix race dev->can.state condition
    18979d10300e gpio: tqmx86: fix uninitialized variable girq
    16189cccd46e net: sh_eth: Fix PHY state warning splat during system resume
    199ddf9d3726 net: ravb: Fix PHY state warning splat during system resume
    235c47f437a1 netfilter: nf_ct_ftp: fix deadlock when nat rewrite is needed
    38cf372b17f0 netfilter: ebtables: fix memory leak when blob is malformed
    985b031667c3 netfilter: nf_tables: fix percpu memory leak at nf_tables_addchain()
    8bcad2a93131 netfilter: nf_tables: fix nft_counters_enabled underflow at nf_tables_addchain()
    d8d9a6995858 ice: Fix interface being down after reset with link-down-on-close flag on
    c14cdf15cde3 ice: config netdev tc before setting queues number
    dff2fa324207 net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs
    c7c9c7eb305a net/sched: taprio: avoid disabling offload when it was never enabled
    68a5def1d2c8 ipv6: Fix crash when IPv6 is administratively disabled
    23022b74b1a2 net: enetc: deny offload of tc-based TSN features on VF interfaces
    2fdebdfcd98f net: enetc: move enetc_set_psfp() out of the common enetc_set_features()
    92f7d44de3be wireguard: netlink: avoid variable-sized memcpy on sockaddr
    3b263cc13340 wireguard: ratelimiter: disable timings test by default
    a4eadca702df sfc/siena: fix null pointer dereference in efx_hard_start_xmit
    b454f12cfedd sfc/siena: fix TX channel offset when using legacy interrupts
    c9ba2948db9d net: ipa: properly limit modem routing table use
    506638752e92 of: mdio: Add of_node_put() when breaking out of for_each_xx
    68197205b3f6 drm/hisilicon: Add depends on MMU
    6201c365a0ef gve: Fix GFP flags when allocing pages
    e969486525be bnxt_en: fix flags to check for supported fw version
    b3b952168ee1 sfc: fix null pointer dereference in efx_hard_start_xmit
    5f623a77cfc2 sfc: fix TX channel offset when using legacy interrupts
    b6bea8101f97 netdevsim: Fix hwstats debugfs file permissions
    0b145d3da801 i40e: Fix set max_tx_rate when it is lower than 1 Mbps
    ab1af66d4de9 i40e: Fix VF set max MTU size
    2ffdf364b845 iavf: Fix set max MTU size with port VLAN and jumbo frames
    36da184d2196 mlxbf_gige: clear MDIO gateway lock after read
    c3f9f3089ed5 iavf: Fix bad page state
    3b27f829b7f6 um: fix default console kernel parameter
    f8c3861243be MIPS: Loongson32: Fix PHY-mode being left unspecified
    7c1f2373be0a MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
    c673c6ceac53 mm/slab_common: fix possible double free of kmem_cache
    183b87c4d18d drm/panel: simple: Fix innolux_g121i1_l01 bus_format
    88b08afb0d80 net: team: Unsync device addresses on ndo_stop
    a4761e45c86c net: bonding: Unsync device addresses on ndo_stop
    b1b48d9e60cb net: bonding: Share lacpdu_mcast_addr definition
    38aa25adcd4d scsi: mpt3sas: Fix return value check of dma_get_required_mask()
    6a4236ed47f5 scsi: qla2xxx: Fix memory leak in __qlt_24xx_handle_abts()
    16b5647f1a55 arm64: dts: imx8mp-venice-gw74xx: fix port/phy validation
    af0c754d4f60 net: phy: aquantia: wait for the suspend/resume operations to finish
    26735f395b30 ARM: dts: lan966x: Fix the interrupt number for internal PHYs
    d5241ea15778 arm64: dts: imx8mp-venice-gw74xx: fix ksz9477 cpu port
    f675f5955ab8 arm64: dts: imx8mp-venice-gw74xx: fix CAN STBY polarity
    392bd6ce1ba9 drm/mediatek: Fix wrong dither settings
    fc8454d54478 arm64: dts: tqma8mqml: Include phy-imx8-pcie.h header
    31ce3c688ddc wifi: iwlwifi: Mark IWLMEI as broken
    9fe1e2da965a net: core: fix flow symmetric hash
    b583e6b25bf9 ipvlan: Fix out-of-bound bugs caused by unset skb->mac_header
    0ad4e4f4d1c4 iavf: Fix cached head and tail value for iavf_get_tx_pending
    7c945e5b4787 ice: Fix crash by keep old cfg when update TCs more than queues
    149979e87eb7 ice: Don't double unplug aux on peer initiated reset
    633c81c04496 netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
    510ea9eae5ee netfilter: nf_conntrack_irc: Tighten matching on DCC message
    f28e376e4c1e netfilter: nf_conntrack_sip: fix ct_sip_walk_headers
    5f394e885eaf arm64: dts: imx8mm-verdin: extend pmic voltages
    3e39beb4efa5 arm64: dts: rockchip: Remove 'enable-active-low' from rk3566-quartz64-a
    efd3a3e464c6 arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
    9350ed92dfe0 arm64: dts: rockchip: fix property for usb2 phy supply on rk3568-evb1-v10
    5e6d95bd6c9d arm64: dts: rockchip: fix property for usb2 phy supply on rock-3a
    a17df55bf6d5 dmaengine: ti: k3-udma-private: Fix refcount leak bug in of_xudma_dev_get()
    869c94dfd900 arm64: dts: imx8ulp: add #reset-cells for pcc
    f478a456a30d arm64: dts: imx8mn: remove GPU power domain reset
    124c330f4071 arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz
    9182be042c3e arm64: dts: imx8mm: Reverse CPLD_Dn GPIO label mapping on MX8Menlo
    164f2c710a78 drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks
    87d4bdeacff8 arm64: dts: rockchip: Fix typo in lisense text for PX30.Core
    8a906e3a18bb arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob
    6b8c338e1b88 arm64: dts: rockchip: Lower sd speed on quartz64-b
    daacedde25f0 firmware: arm_scmi: Fix the asynchronous reset requests
    8e65edf0d376 firmware: arm_scmi: Harden accesses to the reset domains
    e31fa6648542 batman-adv: Fix hang up with small MTU hard-interface
    117737acc4b3 vmlinux.lds.h: CFI: Reduce alignment of jump-table to function alignment
    bb6d99e27cbe arm64: topology: fix possible overflow in amu_fie_setup()
    42c7fc41020c perf/arm-cmn: Add more bits to child node address offset field
    7a764b44d346 KVM: x86: Inject #UD on emulated XSETBV if XSAVES isn't enabled
    eec722138aee KVM: x86: Always enable legacy FP/SSE in allowed user XFEATURES
    c5f118361297 KVM: x86: Reinstate kvm_vcpu_arch.guest_supported_xcr0
    df6cb39335cf mm: slub: fix flush_cpu_slab()/__free_slab() invocations in task context.
    02bcd951aa3c mm/slub: fix to return errno if kmalloc() fails
    cbaddace599e net: mana: Add rmb after checking owner bits
    7221020d79cc can: flexcan: flexcan_mailbox_read() fix return value for drop = true
    b6c2ad616dd4 kasan: call kasan_malloc() from __kmalloc_*track_caller()
    dc8864f4fd01 xen/xenbus: fix xenbus_setup_ring()
    f799e0568d6c drm/i915/gem: Really move i915_gem_context.link under ref protection
    92881e068ee1 drm/i915/gem: Flush contexts on driver release
    08ac12569010 riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
    558003a84a3c riscv: fix a nasty sigreturn bug...
    b1489043d3b9 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    41f857033c44 gpio: mockup: Fix potential resource leakage when register a chip
    af0bfabf06c7 gpio: mockup: fix NULL pointer dereference when removing debugfs
    74ce6f1e0f3b wifi: mt76: fix reading current per-tid starting sequence number for aggregation
    1dd2a948a178 efi: libstub: check Shim mode using MokSBStateRT
    96dc4e2c5283 efi: x86: Wipe setup_data on pure EFI boot
    7a27a04f4ef6 thunderbolt: Add support for Intel Maple Ridge single port controller
    d6f28143bccb usb: dwc3: core: leave default DMA if the controller does not support 64-bit DMA
    af830c831d40 media: flexcop-usb: fix endpoint type check
    53b48f0672d5 libperf evlist: Fix polling of system-wide events
    eecada16bcc4 btrfs: zoned: wait for extent buffer IOs before finishing a zone
    c338bea1fec5 btrfs: fix hang during unmount when stopping a space reclaim worker
    cf7769a47e65 btrfs: fix hang during unmount when stopping block group reclaim worker
    17244f71765d exfat: fix overflow for large capacity partition
    2e238bba8a7e iommu/vt-d: Check correct capability for sagaw determination
    ecec349af8c7 ALSA: hda/realtek: Add a quirk for HP OMEN 16 (8902) mute LED
    28e07bb27ba4 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
    1f65164bc605 ALSA: hda/realtek: Add quirk for ASUS GA503R laptop
    0632fb7f2158 ALSA: hda/realtek: Add pincfg for ASUS G533Z HP jack
    76b75705c941 ALSA: hda/realtek: Add pincfg for ASUS G513 HP jack
    2035227cd000 ALSA: hda/realtek: Re-arrange quirk table entries
    3637770602ac ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5570 laptop
    73c4ae35ff11 ALSA: hda/realtek: Add quirk for Huawei WRT-WX9
    61c19a35f0d2 ALSA: hda: add Intel 5 Series / 3400 PCI DID
    d6cb6e424a60 ALSA: hda: Fix Nvidia dp infoframe
    6e91ec54e7f1 ALSA: hda: Fix hang at HD-audio codec unbinding due to refcount saturation
    abb050dabd7d ALSA: hda/tegra: set depop delay for tegra
    1c5a0a1f4d15 ALSA: core: Fix double-free at snd_card_new()
    e0e17c7bbdf4 Revert "ALSA: usb-audio: Split endpoint setups for hw_params and prepare"
    d744140498a3 USB: serial: option: add Quectel RM520N
    3db2ec3a6724 USB: serial: option: add Quectel BG95 0x0203 composition
    e82a8ff62709 USB: core: Fix RST error in hub.c
    fd0b4fd54892 drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    2e7eb4c1e8af scsi: core: Fix a use-after-free
    d27b66257db1 block: simplify disk shutdown
    fdb28e968815 block: stop setting the nomerges flags in blk_cleanup_queue
    ab85cb5297f7 block: remove QUEUE_FLAG_DEAD
    633e819de9fa xfrm: fix XFRMA_LASTUSED comment
    2776911d4a98 Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"
    8039621a78e5 Revert "usb: add quirks for Lenovo OneLink+ Dock"
    7c64dd4dbf90 smb3: use filemap_write_and_wait_range instead of filemap_write_and_wait
    c7ae5c403d68 usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    9b56515aeeff usb: add quirks for Lenovo OneLink+ Dock
    0cdde8460c30 smb3: fix temporary data corruption in insert range
    49523a473220 smb3: fix temporary data corruption in collapse range
    cc914c37e55f smb3: Move the flush out of smb2_copychunk_range() into its callers
    f6bb739e61eb drm/i915/dsi: fix dual-link DSI backlight and CABC ports for display 11+
    d9d2625dafe2 drm/i915/dsi: filter invalid backlight and CABC ports
    fc6aff984b1c drm/i915/bios: Split VBT data into per-panel vs. global parts
    2af21ae876cf drm/i915/bios: Split VBT parsing to global vs. panel specific parts
    5da3f1bfb88e drm/i915/bios: Split parse_driver_features() into two parts
    ad719d5cc7cb drm/i915/pps: Split pps_init_delays() into distinct parts
    a0f7cdd69ca3 drm/i915: Extract intel_edp_fixup_vbt_bpp()
    fcf22aefe871 Linux 5.19.11
    4d8637f1d672 Revert "iommu/vt-d: Fix possible recursive locking in intel_iommu_init()"
    36371c3adb7a ALSA: hda/sigmatel: Fix unused variable warning for beep power change
    ddd2edc276e0 ALSA: hda/sigmatel: Keep power up while beep is enabled
    99bc25748e39 cgroup: Add missing cpus_read_lock() to cgroup_attach_task_all()
    7051efc07d72 dt-bindings: apple,aic: Fix required item "apple,fiq-index" in affinity description
    20b3f49e9498 net: Find dst with sk's xfrm policy not ctl_sk
    e68db1a89fc9 drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
    9189056c223b drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
    989d23d88520 drm/amdgpu: Don't enable LTR if not supported
    e6189420e34f drm/amdgpu: make sure to init common IP before gmc
    dd52bde6767e drm/i915: Set correct domains values at _i915_vma_move_to_active
    871b9d5c68d8 drm/i915/gt: Fix perf limit reasons bit positions
    b31c81d633d8 tools/include/uapi: Fix <asm/errno.h> for parisc and xtensa
    ac12a96d1d35 parisc: Allow CONFIG_64BIT with ARCH=parisc
    46c716a31fcd blk-lib: fix blkdev_issue_secure_erase
    c2c7f67fd12d cifs: always initialize struct msghdr smb_msg completely
    eea8626615a0 cifs: don't send down the destination address to sendmsg for a SOCK_STREAM
    2c3f439480c0 cifs: revalidate mapping when doing direct writes
    d50c30b66f04 io_uring/msg_ring: check file type before putting
    6f5ceeb59d09 of/device: Fix up of_dma_configure_id() stub
    6ebcd3a8f5d2 parisc: ccio-dma: Add missing iounmap in error path in ccio_probe()
    248c48ced209 block: blk_queue_enter() / __bio_queue_enter() must return -EAGAIN for nowait
    d31efde8d45d drm/i915/guc: Cancel GuC engine busyness worker synchronously
    6731a2193bc8 drm/i915/guc: Don't update engine busyness stats too frequently
    b0dc9560acd2 drm/i915/vdsc: Set VDSC PIC_HEIGHT before using for DP DSC
    fc689a286139 drm/rockchip: vop2: Fix eDP/HDMI sync polarities
    ca52cf493f97 drm/meson: Fix OSD1 RGB to YCbCr coefficient
    e681b2df3ad4 drm/meson: Correct OSD1 global alpha value
    99ed392209cc drm/panel-edp: Fix delays for Innolux N116BCA-EA1
    c60087415670 Revert "SUNRPC: Remove unreachable error condition"
    4d9f296e78b0 NFSv4.2: Update mode bits after ALLOCATE and DEALLOCATE
    2f0a154b16ab gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx
    51e024dcaf08 NFSv4: Turn off open-by-filehandle and NFS re-export for NFSv4.0
    dce19409fb74 SUNRPC: Fix call completion races with call_decode()
    fe0a6a2369d8 pinctrl: sunxi: Fix name for A100 R_PIO
    4b1366bf4ed1 pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH
    8e33176cd475 pinctrl: qcom: sc8180x: Fix wrong pin numbers
    50207584d3f5 pinctrl: qcom: sc8180x: Fix gpio_wakeirq_map
    2133f4513116 of: fdt: fix off-by-one error in unflatten_dt_nodes()
    b80678c1e00a Linux 5.19.10
    0541ab4d0330 Input: goodix - add compatible string for GT1158
    693ccecee083 RDMA/irdma: Use s/g array in post send only when its valid
    1989b17301f8 gpio: 104-idio-16: Make irq_chip immutable
    b240650a6600 gpio: 104-dio-48e: Make irq_chip immutable
    e18b2e3310f0 LoongArch: Fix arch_remove_memory() undefined build error
    6023efd94e54 LoongArch: Fix section mismatch due to acpi_os_ioremap()
    0b38a5072464 platform/x86: asus-wmi: Increase FAN_CURVE_BUF_LEN to 32
    fe5872fd1684 usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
    2fdf0a1ff474 platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes
    719b2021d778 perf/arm_pmu_platform: fix tests for platform_get_irq() failure
    3d513ebf8c3b net: dsa: hellcreek: Print warning only once
    c624b5659a28 drm/amd/amdgpu: skip ucode loading if ucode_size == 0
    f566cb9f4057 nvmet-tcp: fix unhandled tcp states in nvmet_tcp_state_change()
    e8d5aa9c67ed nvme-pci: add NVME_QUIRK_BOGUS_NID for Lexar NM610
    137f1493f151 drm/amd/pm: use vbios carried pptable for all SMU13.0.7 SKUs
    2052738ece42 drm/amdgpu: disable FRU access on special SIENNA CICHLID card
    12c20186d84e Input: iforce - add support for Boeder Force Feedback Wheel
    47e83e6ebf99 ieee802154: cc2520: add rc code in cc2520_tx()
    bc55c1677edb gpio: mockup: remove gpio debugfs when remove device
    35c0b78d0d42 r8152: add PID for the Lenovo OneLink+ Dock
    84d8959393a0 tg3: Disable tg3 device on system reboot to avoid triggering AER
    6b1bcd579fc5 Bluetooth: MGMT: Fix Get Device Flags
    fbb701e51ee2 hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
    37c3dcfc4730 HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
    65d983566887 dt-bindings: iio: gyroscope: bosch,bmg160: correct number of pins
    50a1ffa557cf kvm: x86: mmu: Always flush TLBs when enabling dirty logging
    c87f1f99e26e peci: cpu: Fix use-after-free in adev_release()
    f25a547e7c76 drm/msm/rd: Fix FIFO-full deadlock
    df01ac6582e1 platform/surface: aggregator_registry: Add support for Surface Laptop Go 2
    f05939158a41 Input: goodix - add support for GT1158
    37c81d9f1d1b ACPI: resource: skip IRQ override on AMD Zen platforms
    f26649e59b4f RDMA/mlx5: Fix UMR cleanup on error flow of driver init
    d8f7bff9a426 RDMA/mlx5: Add a umr recovery flow
    ada0ccc4a137 RDMA/mlx5: Rely on RoCE fw cap instead of devlink when setting profile
    ddc58af02675 net/mlx5: Use software VHCA id when it's supported
    630a75548b88 net/mlx5: Introduce ifc bits for using software vhca id
    3bd8fdde3826 iommu/vt-d: Fix kdump kernels boot failure with scalable mode

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index b3e9fbae62..87a3aff41a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bc8af638c00f28a46e77e34056079087638f6e65"
-SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
+SRCREV_machine ?= "92f22179274bd656239b8aa70eb655473abf68f5"
+SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.9"
+LINUX_VERSION ?= "5.19.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 466b7063b4..0cd8a2bfab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.9"
+LINUX_VERSION ?= "5.19.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
+SRCREV_machine ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index f882972e35..a6fcf10579 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "446661f6a3b07535304497c1a51d9cab95f48f0b"
-SRCREV_machine:qemuarm64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemumips ?= "98da147618fca3da29cf1c6ab9c53f24de2c587c"
-SRCREV_machine:qemuppc ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemuriscv64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemuriscv32 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemux86 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemux86-64 ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_machine:qemumips64 ?= "53842054198d851b5deb5810afaf126156efbb54"
-SRCREV_machine ?= "65a9a22786a6710fc7b4edb7cfae80dd83f591f1"
-SRCREV_meta ?= "350b544d077955b599b54ab364f6227d96a90455"
+SRCREV_machine:qemuarm ?= "8150698489c801b7aa4a641d4feec1de1b2ea07c"
+SRCREV_machine:qemuarm64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemumips ?= "8d7dc30e65155e4a6a217b054cf54252ace8c724"
+SRCREV_machine:qemuppc ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemuriscv64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemuriscv32 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemux86 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemux86-64 ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_machine:qemumips64 ?= "930822733328e39e8698bfac5a4e4e8d6a25b4d5"
+SRCREV_machine ?= "23ee2ef634b3fb51be429623fa1927b1d5c3e95c"
+SRCREV_meta ?= "1cd6a86d7aa5d42ce72097d011c907bd4ea354ec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d1105a680e66b0482bd18048534c58ecabb5c284"
+SRCREV_machine:class-devupstream ?= "30c780ac0f9fc09160790cf58f07ef3b92097ceb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.9"
+LINUX_VERSION ?= "5.19.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


