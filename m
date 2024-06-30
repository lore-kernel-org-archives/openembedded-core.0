Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1907BC3065B
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:49 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.4374.1719778119333796115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EfrojAHi;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9cc66c649so1492672b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778118; x=1720382918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8tEa2KGxm7SxQsaVSHlQMjk5sSdYcoBwcohowm0hN4=;
        b=EfrojAHihmlkZeyKbe1VUGYASZLFFyD0zCiBaxFiulCDkQ4RZfvrQHVIeL5JLiLxTM
         kNxmaQQg2PTQdfoGR+VUJHZISdgYenXNEDIr1t7wXocQ7ve8F7X+VLkLQqYsT5/dHPr2
         XN7QXmd4RKXN9KDtj/JApY4xoegmFWtS28Sp2F2u9rjR5LAsAvpUjv1xKUHP7xz67oz8
         25QDMm1n4SnfBQT/J4sXJ4J21H9V+vCYYKfXBYLJubyWhsrZmLPLf4RXxzysDaZETkfC
         ziVuvbUG8yFm7GXI4Oi73Pnde4OBU2tj0cZdv061auTUVAZ9XhBz7HZtFrvRCNM2ehws
         x+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778118; x=1720382918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8tEa2KGxm7SxQsaVSHlQMjk5sSdYcoBwcohowm0hN4=;
        b=ZVFlfUZrCABITREUM3JY2/vEpZKwqyjI3mUPtChm2SjzjozA+SfafSP2Pw9OZ/Uoy7
         8DyvtZ6fFtMiA0YEh49ETnJg0HBDTgB+DN591Riln0+ZYX5HAZHt+f7NP5nYmj/EwTkf
         g8XV6KQE1es6B6+rnuALw/Swxq70u+jLNe7CqlUPO7JguEXuSYegQIYUTYtoagOp2w+1
         3WtMsgFUCDi2wXkXuWbydxwOPooEREnVT0x4j5TFIf/1akLJAsrWe/ZQV7BH982OHhSW
         WxpkqSiysbn6cyRQaMz3G6vtr61ZQiopjzuNGHGJ72D8S6uW/9uFJ48UI6BhkUVv9/B8
         uAMA==
X-Gm-Message-State: AOJu0YzhGdZrysA6PVQ8KLlDgszWlzF0AxjesOhWGP7DsmuabdqTban7
	oUTjRjpPk22ltpKZNqJlb01MZspFaPUmTZJyZxFstjQZRhwPNkKMps769P0ShM5wm9VP1OsaiEE
	ucKw=
X-Google-Smtp-Source: AGHT+IFuHdO205VaK+r2p1EfrVSjA0FLRUuUOWdZttuWlF6Wt8mXSzWOdNpSfnk+sYsaV3sb0N3jtw==
X-Received: by 2002:a05:6808:13cb:b0:3d2:257b:2b5e with SMTP id 5614622812f47-3d6b55903c2mr6053694b6e.50.1719778116878;
        Sun, 30 Jun 2024 13:08:36 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/35] linux-yocto/6.6: update to v6.6.30
Date: Sun, 30 Jun 2024 13:07:35 -0700
Message-Id: <5f252a594eaf30d5da0e26d081a8937ec07bd6c6.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201261

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    7c76aad68f6d kselftest: Add a ksft_perror() helper
    5697d159afef Linux 6.6.30
    15aa09d6d846 bounds: Use the right number of bits for power-of-two CONFIG_NR_CPUS
    57c34bf73128 net/mlx5e: Advertise mlx5 ethernet driver updates sk_buff md_dst for MACsec
    6c3020dc817f macsec: Detect if Rx skb is macsec-related for offloading devices that update md_dst
    ee5dde3aa2fd macsec: Enable devices to advertise whether they update sk_buff md_dst during offloads
    bbc8486eb230 Revert "riscv: kdump: fix crashkernel reserving problem on RISC-V"
    be9857a4d280 ovl: fix memory leak in ovl_parse_param()
    3caf7f49f10f phy: qcom: qmp-combo: fix VCO div offset on v5_5nm and v6
    e3425674ff68 i2c: smbus: fix NULL function pointer dereference
    470d347b14b0 sched/eevdf: Prevent vlag from going out of bounds in reweight_eevdf()
    2cf53d801da7 sched/eevdf: Fix miscalculation in reweight_entity() when se is not curr
    dc21662b5b34 sched/eevdf: Always update V if se->on_rq when reweighting
    73224a5d2180 phy: ti: tusb1210: Resolve charger-det crash if charger psy is unregistered
    b008e327fa57 riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
    a0f0dbbb1bc4 riscv: Fix TASK_SIZE on 64-bit NOMMU
    e4c881d2127c riscv: fix VMALLOC_START definition
    f976eca36cdf dmaengine: idxd: Fix oops during rmmod on single-CPU platforms
    8e3c94767cad dma: xilinx_dpdma: Fix locking
    758071a35d9f dmaengine: idxd: Convert spinlock to mutex to lock evl workqueue
    0e532b993a05 phy: qcom: m31: match requested regulator name with dt schema
    1da7f6abd3ba phy: rockchip: naneng-combphy: Fix mux on rk3588
    743cf2f19d96 phy: rockchip-snps-pcie3: fix clearing PHP_GRF_PCIESEL_CON bits
    d3d3723d70c1 phy: rockchip-snps-pcie3: fix bifurcation on rk3588
    78fe49bd4259 phy: freescale: imx8m-pcie: fix pcie link-up instability
    73e4d4f6f7e2 phy: marvell: a3700-comphy: Fix hardcoded array size
    610f175d2e16 phy: marvell: a3700-comphy: Fix out of bounds read
    935d4c7cdc56 soundwire: amd: fix for wake interrupt handling for clockstop mode
    4b80c0260bde idma64: Don't try to serve interrupts when device is powered off
    6e98921f6f2f dmaengine: tegra186: Fix residual calculation
    3053b681b678 dmaengine: owl: fix register access functions
    2431b5f2650d mm: turn folio_test_hugetlb into a PageType
    25c5f2e05e8e x86/tdx: Preserve shared bit on mprotect()
    2b56188d9bfb phy: qcom: qmp-combo: Fix VCO div offset on v3
    c219ef43672d phy: qcom: qmp-combo: Fix register base for QSERDES_DP_PHY_MODE
    db4ecbf8ee43 mtd: diskonchip: work around ubsan link failure
    1d2809e5d918 udp: preserve the connected status if only UDP cmsg
    8986ea353956 fbdev: fix incorrect address computation in deferred IO
    b2916e14bd5c stackdepot: respect __GFP_NOLOCKDEP allocation flag
    fefe98d3afc4 net: b44: set pause params only when interface is up
    ca958a1b1552 ethernet: Add helper for assigning packet type when dest address does not match device address
    3ecf2249e6e4 ACPI: CPPC: Fix access width used for PCC registers
    6a8fda8a7339 ACPI: CPPC: Fix bit_offset shift in MASK_VAL() macro
    1b890ae474d1 ACPI: CPPC: Use access_width over bit_width for system memory accesses
    03170e657f62 irqchip/gic-v3-its: Prevent double free on error
    d7d7284c2a7c drm/amdgpu: Fix leak when GPU memory allocation fails
    65356a1cc496 drm/amdgpu: Assign correct bits for SDMA HDP flush
    b33d7aaa2d3d drm/amdgpu/sdma5.2: use legacy HDP flush for SDMA2/3
    9b338b25b388 arm64: dts: rockchip: enable internal pull-up for Q7_THRM# on RK3399 Puma
    e64c81111fe9 arm64: dts: qcom: sm8450: Fix the msi-map entries
    93cf1e2e32d2 arm64: dts: qcom: sc8280xp: add missing PCIe minimum OPP
    c15b5c6fabcb LoongArch: Fix access error when read fault on a write-only VMA
    2c733bb795dd LoongArch: Fix callchain parse error with kernel tracepoint events
    8292f4f8dd1b cpu: Re-enable CPU mitigations by default for !X86 architectures
    3a63cee1a5e1 btrfs: fix information leak in btrfs_ioctl_logical_to_ino()
    e498cc00e6b7 btrfs: scrub: run relocation repair when/only needed
    73aa8ea03ac9 btrfs: fix wrong block_start calculation for btrfs_drop_extent_map_range()
    5e2239fef688 btrfs: fallback if compressed IO fails for ENOSPC
    29e94f295bad HID: i2c-hid: remove I2C_HID_READ_PENDING flag to prevent lock-up
    699f8958dece smb3: fix lock ordering potential deadlock in cifs_sync_mid_result
    0fcf7e219448 smb3: missing lock when picking channel
    39ad3d61d23e smb: client: Fix struct_group() usage in __packed structs
    92abee9c4201 mm: support page_mapcount() on page_has_type() pages
    1eb691e806e7 mm: create FOLIO_FLAG_FALSE and FOLIO_TYPE_OPS macros
    56b99a52229d mmc: sdhci-msm: pervent access to suspended controller
    f6c5d21db16a mm/hugetlb: fix missing hugetlb_lock for resv uncharge
    87fc30db0a2b mtd: rawnand: qcom: Fix broken OP_RESET_DEVICE command in qcom_misc_cmd_type_exec()
    67459f1a707a Bluetooth: qca: fix NULL-deref on non-serdev setup
    6b47cdeb786c Bluetooth: qca: fix NULL-deref on non-serdev suspend
    e0813f22c30b Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0bda:0x4853
    4eb706b1b443 Bluetooth: Fix type of len in {l2cap,sco}_sock_getsockopt_old()
    ece94c74e4bf rust: remove `params` from `module` macro example
    4805d764f904 kbuild: rust: force `alloc` extern to allow "empty" Rust files
    2eed4381ee41 kbuild: rust: remove unneeded `@rustc_cfg` to avoid ICE
    3a9337459645 rust: make mutually exclusive with CFI_CLANG
    c34a8052afe5 rust: init: remove impl Zeroable for Infallible
    37ca196aa4d8 rust: don't select CONSTRUCTORS
    3b1ce482e2e6 x86/cpu: Fix check for RDPKRU in __show_regs()
    cec11fa2eb51 fork: defer linking file vma until vma is fully initialized
    612fbf658803 selftests/seccomp: Handle EINVAL on unshare(CLONE_NEWPID)
    f4b1e2cc9fd4 selftests/seccomp: Change the syscall used in KILL_THREAD test
    003af8c23fca selftests/seccomp: user_notification_addfd check nextfd is available
    be383effaee3 Squashfs: check the inode number is not the invalid value of zero
    331b6339c485 squashfs: convert to new timestamp accessors
    ab65b0cf0324 drm/ttm: stop pooling cached NUMA pages v2
    ded1ffea5213 mm, treewide: introduce NR_PAGE_ORDERS
    4c5eaf0cad27 drm/amdgpu: fix visible VRAM handling during faults
    f85a55fb87c2 drm/amdgpu: add shared fdinfo stats
    a4ae24cd04a8 drm: add drm_gem_object_is_shared_for_memory_stats() helper
    9e898211704c mm/madvise: make MADV_POPULATE_(READ|WRITE) handle VM_FAULT_RETRY properly
    49db746d3988 mm/gup: explicitly define and check internal GUP flags, disallow FOLL_TOUCH
    67d2212b6b89 KVM: x86/pmu: Set enable bits for GP counters in PERF_GLOBAL_CTRL at "RESET"
    6393087d931d KVM: x86/pmu: Zero out PMU metadata on AMD if PMU is disabled
    753a277ea086 af_unix: Suppress false-positive lockdep splat for spin_lock() in __unix_gc().
    4e40e624961a tls: fix lockless read of strp->msg_ready in ->poll
    77df3da37d42 net: ethernet: ti: am65-cpts: Fix PTPv1 message type on TX packets
    740717774dc3 ice: fix LAG and VF lock dependency in ice_reset_vf()
    2f7cc2dfc159 iavf: Fix TC config comparison with existing adapter TC config
    a91892696f58 i40e: Report MFS in decimal base instead of hex
    8d6105f63788 i40e: Do not use WQ_MEM_RECLAIM flag for workqueue
    94b00cd6b89b net: ti: icssg-prueth: Fix signedness bug in prueth_init_rx_chns()
    9dfe29373391 net: phy: dp83869: Fix MII mode failure
    8260c980aee7 netfilter: nf_tables: honor table dormant flag from netdev release event path
    cf1a368d190a ARM: dts: imx6ull-tarragon: fix USB over-current polarity
    62041d20f92e eth: bnxt: fix counting packets discarded due to OOM and netpoll
    de1aaefa75be mlxsw: spectrum_acl_tcam: Fix memory leak when canceling rehash work
    ab4ecfb62733 mlxsw: spectrum_acl_tcam: Fix incorrect list API usage
    e890456051fe mlxsw: spectrum_acl_tcam: Fix warning during rehash
    0ae8ff7b6d42 mlxsw: spectrum_acl_tcam: Fix memory leak during rehash
    3da432f3a3d3 mlxsw: spectrum_acl_tcam: Rate limit error message
    311eeaa7b9e2 mlxsw: spectrum_acl_tcam: Fix possible use-after-free during rehash
    feabdac2057e mlxsw: spectrum_acl_tcam: Fix possible use-after-free during activity update
    136fc524eccd mlxsw: spectrum_acl_tcam: Fix race during rehash delayed work
    79736f57da3c mlxsw: spectrum_acl_tcam: Fix race in region ID allocation
    99a9e7fbaf7f mlxsw: Use refcount_t for reference counting
    eaa5e164a211 net: openvswitch: Fix Use-After-Free in ovs_ct_exit
    36054132dfb0 ipvs: Fix checksumming on GSO of SCTP packets
    cd212ca265b3 Bluetooth: qca: set power_ctrl_enabled on NULL returned by gpiod_get_optional()
    1e9a69f247f9 Bluetooth: hci_sync: Using hci_cmd_sync_submit when removing Adv Monitor
    80dfef128cb9 Bluetooth: btusb: mediatek: Fix double free of skb in coredump
    882d614ac6bf Bluetooth: MGMT: Fix failing to MGMT_OP_ADD_UUID/MGMT_OP_REMOVE_UUID
    62e3a7cbd8e6 Bluetooth: hci_event: Fix sending HCI_OP_READ_ENC_KEY_SIZE
    190d33b0a634 Bluetooth: btusb: Fix triggering coredump implementation for QCA
    e4ce6ebc6ea1 gpio: tegra186: Fix tegra186_gpio_is_accessible() check
    2497bebf3110 net: phy: mediatek-ge-soc: follow netdev LED trigger semantics
    2aacd4de4547 net: gtp: Fix Use-After-Free in gtp_dellink
    209967f5f06e net: usb: ax88179_178a: stop lying about skb->truesize
    8240c7308c94 ipv4: check for NULL idev in ip_route_use_hint()
    5e53816d0f87 net: fix sk_memory_allocated_{add|sub} vs softirqs
    fe1e83811c4f net: make SK_MEMORY_PCPU_RESERV tunable
    6a65f015ee48 tools: ynl: don't ignore errors in NLMSG_DONE messages
    4fee8fa86a15 ax25: Fix netdev refcount issue
    cffee39d3615 NFC: trf7970a: disable all regulators on removal
    0142cbb87cf6 net: dsa: mv88e6xx: fix supported_interfaces setup in mv88e6250_phylink_get_caps()
    b50bb5039223 cxl/core: Fix potential payload size confusion in cxl_mem_get_poison()
    e33625b9b598 bnxt_en: Fix the PCI-AER routines
    96ef6582223a bnxt_en: refactor reset close code
    7e8e0e0ea4a2 bridge/br_netlink.c: no need to return void function
    d68dc711d84f icmp: prevent possible NULL dereferences from icmp_build_probe()
    1fb855ae29c0 ARM: dts: microchip: at91-sama7g5ek: Replace regulator-suspend-voltage with the valid property
    94346efd78e8 mlxsw: core_env: Fix driver initialization with old firmware
    ac60e9041177 mlxsw: core: Unregister EMAD trap using FORWARD action
    09040baf8779 net: bcmasp: fix memory leak when bringing down interface
    b5fa073ae9da vxlan: drop packets from invalid src-address
    3ccbec645deb net: libwx: fix alloc msix vectors failed
    21221985378d wifi: mac80211: fix unaligned le16 access
    83a137e6a273 wifi: mac80211: remove link before AP
    115cd0965446 wifi: mac80211_hwsim: init peer measurement result
    1960e9e9c215 drm/gma500: Remove lid code
    bd7e8e5f3031 wifi: iwlwifi: mvm: return uid from iwl_mvm_build_scan_cmd
    2565820d72ee wifi: iwlwifi: mvm: remove old PASN station when adding a new one
    154be74e589c wifi: mac80211: split mesh fast tx cache into local/proxied/forwarded
    1ba4d2adf1aa wifi: mac80211: clean up assignments to pointer cache.
    80ea4ee9f99c ARC: [plat-hsdk]: Remove misplaced interrupt-cells property
    37e204285732 gpio: tangier: Use correct type for the IRQ chip data
    4de13788ee60 arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller
    9f9d12a8153a arm64: dts: rockchip: regulator for sd needs to be always on for BPI-R2Pro
    ff3e2ca62bd7 arm64: dts: mediatek: mt2712: fix validation errors
    ed427ce58d44 arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps with "map-"
    81559c9de353 arm64: dts: mediatek: mt7986: drop invalid thermal block clock
    5a3aa5df8663 arm64: dts: mediatek: mt7986: reorder nodes
    76bb245892ce arm64: dts: mediatek: mt7986: drop "#reset-cells" from Ethernet controller
    b42af715c014 arm64: dts: mediatek: mt7986: drop invalid properties from ethsys
    b626cfb65159 arm64: dts: mediatek: mt7986: reorder properties
    7327c4f0884c arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
    847afa33a2be arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
    999d7695d85e arm64: dts: mediatek: mt7622: fix IR nodename
    837f0b9ae29e arm64: dts: mediatek: mt7622: fix clock controllers
    13f40798f1a7 arm64: dts: mediatek: mt8183-kukui: Use default min voltage for MT6358
    a594104da204 arm64: dts: mediatek: mt8195-cherry: Update min voltage constraint for MT6315
    9d0b70b5b2b5 arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint for MT6315
    0c29f85ad1d7 arm64: dts: mediatek: cherry: Describe CPU supplies
    a61f1a579960 arm64: dts: mediatek: cherry: Add platform thermal configuration
    2928d2baf24e arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex1
    49785030e34f arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex
    346ffd2d39c8 arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdosys
    550ad9aa3ac9 arm64: dts: mediatek: mt8192: Add missing gce-client-reg to mutex
    88b162518b86 arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg
    4142a160b08c arm64: dts: rockchip: Remove unsupported node from the Pinebook Pro dts
    11c51d2944df arm64: dts: rockchip: enable internal pull-up on PCIE_WAKE# for RK3399 Puma
    6eb4c12f1152 arm64: dts: rockchip: fix alphabetical ordering RK3399 puma
    5fa8b9f97b9c arm64: dts: rockchip: enable internal pull-up on Q7_USB_ID for RK3399 Puma
    82fe6445df8b arm64: dts: rockchip: set PHY address of MT7531 switch to 0x1f
    4fb8d6e8e26c HID: logitech-dj: allow mice to use all types of reports
    b7e3f0cbe1d7 HID: intel-ish-hid: ipc: Fix dev_err usage with uninitialized dev->devc
    fc1860a1bf6c cifs: reinstate original behavior again for forceuid/forcegid
    551496743a57 smb: client: fix rename(2) regression against samba
    4a5c16d06593 cifs: Fix reacquisition of volume cookie on still-live connection
    06644f0d7193 drm/tilcdc: Set preferred depth
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 94bc5c798ea701332575cb66a546a4f1e1224d90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 53f413407d..a17e189e8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9bdb085cb6fcfd49586b980ba27cb81e5c76689e"
-SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
+SRCREV_machine ?= "d6479bad645622afeeefff281c6be5339662c701"
+SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.29"
+LINUX_VERSION ?= "6.6.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 44c9a7b1e0..392cbbe9aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.29"
+LINUX_VERSION ?= "6.6.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
+SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 817639bce0..e147fc0d01 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0b90bbe1359b3fd590780119f19dbd0a01e58560"
-SRCREV_machine:qemuarm64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemuloongarch64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemumips ?= "ab44de80a320e30a49150ea74554a937affaf78d"
-SRCREV_machine:qemuppc ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemuriscv64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemuriscv32 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemux86 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemux86-64 ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_machine:qemumips64 ?= "75da5d44c2e54a85a1221ea7d0c04be9aefb7fa1"
-SRCREV_machine ?= "7c76aad68f6d1247e72f024f1e0291067a404f8d"
-SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
+SRCREV_machine:qemuarm ?= "25741eb502ad719afba306e4f3739d79228167d6"
+SRCREV_machine:qemuarm64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemuloongarch64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemumips ?= "6f385885b5cc0a6dd65829173eee6af2901be70d"
+SRCREV_machine:qemuppc ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemuriscv64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemuriscv32 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemux86 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemux86-64 ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_machine:qemumips64 ?= "40b35be7a83982472153cbf0a80fd8ed3f21b053"
+SRCREV_machine ?= "955c18e54b19dae67fdeb54cedc003225bcd9380"
+SRCREV_meta ?= "fca7e62b0d67399b174d9af0a04fc56e85a80fa3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a3463f08104612fc979c41fa54733e925205d3d7"
+SRCREV_machine:class-devupstream ?= "5697d159afef8c475f13a0b7b85f09bd4578106c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.29"
+LINUX_VERSION ?= "6.6.30"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


