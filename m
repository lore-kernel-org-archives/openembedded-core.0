Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA8C4167D
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.16780.1667744277907670133
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2B012c8g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id z26so8455216pff.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lhu1PQw0E15CaIPokassYYT8NLQndb+DyRRMC/wV0U0=;
        b=2B012c8gZoxY9PZmJD6yTzy1BX8xI8gzSXVKRiXZcE+M4SABFr2x178R90ou7svVwR
         xH+zcfIRM3BFRQqPNTe+UuX/QoKzOKnKMunbQBkxNnyXAbI16aB+Mf5Ojrzt/xhFrLFc
         FuOhtSpCfML9Jcp6iOjbXazTgTmQR231i5kwCbdZRlYs0bRazRbxB6/l+9yBfNQ4DUN4
         +FnysG7EVUeLxJQhKnnPqoG1BNLwsxN0A/ISMmbbmYgW4MLK6JWfJibWcVFSLmh4XRkB
         HumrOxcJ9lCpbPA/W5IviIfUj59TZCMQCKIorlTEV91Uj0aHDgctUZpi4D8jtT0BisxC
         eDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lhu1PQw0E15CaIPokassYYT8NLQndb+DyRRMC/wV0U0=;
        b=k55yJ0GYbkBAH07GtWWGu5pY8EdUArWNVEtvIRPvkLqXVLfzA8i32+WCk3yCxyxCdm
         IIDjBUh3T1HVpAVKMRL5t5i+CB03qZUFLjAEe7p9vWfbvkz5+Dk/q4E9Rikwpu1Cnemo
         utDYvuRXshmrboZ4+6S1UG8ohjOh3T9sk2OHI7zVzf+vjS7o+NwFvuVs0t1ysh/OmGuA
         4hO517sIKWqv+TI3oiOKEJFinexMjjoWaKHUNerY6zB0tY2v6bkRsYcXEdTQkqiFp3VE
         5j9IbOoLjuHZ/QU/5LUjB/Zy37eZYrbRDszoEuv/gd3vZzpa32y4DulS+lY4lZhxsCNt
         TkHw==
X-Gm-Message-State: ACrzQf3hHyu/2fUFGLpjR8iapg4xlScJlkrKUecHX7dm1Noo+lcsWrq6
	rkUJxGURWej5pmvn5HLTRFeJZIUSmq9Vqjle
X-Google-Smtp-Source: AMsMyM6Uwl7GCqGpleRGajTmklhL+tQBL1Pw5cK0hAwVJVxmwqZlcorUAGmuvCIPbqDzj9fbrpU5gw==
X-Received: by 2002:aa7:88d5:0:b0:56d:8d62:5f44 with SMTP id k21-20020aa788d5000000b0056d8d625f44mr34986279pff.72.1667744276508;
        Sun, 06 Nov 2022 06:17:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/34] linux-yocto/5.15: update to v5.15.72
Date: Sun,  6 Nov 2022 04:16:56 -1000
Message-Id: <b4f0bc16db0a18baf9234171edce3206319a2c2d.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172781

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c68173b2012b Linux 5.15.72
    713fa3e4591f drm/i915/gem: Really move i915_gem_context.link under ref protection
    a00ed4e5d5ee x86/alternative: Fix race in try_get_desc()
    c3d4b8970c0d KVM: x86: Hide IA32_PLATFORM_DCA_CAP[31:0] from the guest
    ab5c5787ab5e clk: iproc: Do not rely on node name for correct PLL setup
    e748a084b51c clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
    19f4e1636626 fs: split off setxattr_copy and do_setxattr function from setxattr
    a0e3719e030a vdpa/ifcvf: fix the calculation of queuepair
    4755d9d2c9b0 selftests: Fix the if conditions of in test_extra_filter()
    c83a7606aa65 net: phy: Don't WARN for PHY_UP state in mdio_bus_phy_resume()
    a8cd7e1bc7cd net: stmmac: power up/down serdes in stmmac_open/release
    67c00bcf4231 wifi: mac80211: fix regression with non-QoS drivers
    520e434a082d nvme: Fix IOC_PR_CLEAR and IOC_PR_RELEASE ioctls for nvme devices
    e9d7d809022e net/mlxbf_gige: Fix an IS_ERR() vs NULL bug in mlxbf_gige_mdio_probe
    8b1b908507ce cxgb4: fix missing unlock on ETHOFLD desc collect fail path
    e99c7a61d89e net: sched: act_ct: fix possible refcount leak in tcf_ct_init()
    815381aeff95 usbnet: Fix memory leak in usbnet_disconnect()
    af91321b7372 gpio: mvebu: Fix check for pwm support on non-A8K platforms
    f592ccddac68 Input: melfas_mip4 - fix return value check in mip4_probe()
    ff982b1f325d Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"
    bde7795794f4 drm/bridge: lt8912b: fix corrupted image output
    e103b0e83991 drm/bridge: lt8912b: set hdmi or dvi mode
    473f653a86ee drm/bridge: lt8912b: add vsync hsync
    6a12105d9d4f ASoC: tas2770: Reinit regcache on reset
    75ef73d7d2b3 arm64: dts: qcom: sm8350: fix UFS PHY serdes size
    5664dc84fc2e ASoC: imx-card: Fix refcount issue with of_node_put
    367403bc1cfe soc: sunxi: sram: Fix debugfs info for A64 SRAM C
    68d2f42cf4f6 soc: sunxi: sram: Fix probe function ordering issues
    2f82b5290078 soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()
    861adc2b2037 soc: sunxi: sram: Prevent the driver from being unbound
    8b07378ebe43 soc: sunxi: sram: Actually claim SRAM regions
    d50e0e2f3d94 ARM: dts: am5748: keep usb4_tm disabled
    c48e3db1df25 reset: imx7: Fix the iMX8MP PCIe PHY PERST support
    606229101290 ARM: dts: am33xx: Fix MMCHS0 dma properties
    bfe5dc2101ba swiotlb: max mapping size takes min align mask into account
    a6a3b6b11ac0 media: v4l2-compat-ioctl32.c: zero buffer passed to v4l2_compat_get_array_args()
    ab9d32844742 media: rkvdec: Disable H.264 error detection
    69379139ed78 media: dvb_vb2: fix possible out of bound access
    6287c9e00595 mm,hwpoison: check mm when killing accessing process
    f9aed3d8a029 mm: fix madivse_pageout mishandling on non-LRU page
    1299c1198878 mm/migrate_device.c: flush TLB while holding PTL
    e858f7ac7395 mm: fix dereferencing possible ERR_PTR
    d75ce115625e mm: prevent page_frag_alloc() from corrupting the memory
    23d17e2b04c7 mm/page_alloc: fix race condition between build_all_zonelists and page allocation
    fec2db7a434a mmc: hsq: Fix data stomping during mmc recovery
    4fef6e1fe07c mmc: moxart: fix 4-bit bus width and remove 8-bit bus width
    4f75d0cacd65 libata: add ATA_HORKAGE_NOLPM for Pioneer BDR-207M and BDR-205
    dc248ddf41ea vduse: prevent uninitialized memory accesses
    ea774829699a drm/amdgpu: Add amdgpu suspend-resume code path under SRIOV
    25759a7bc1f4 drm/i915/gt: Restrict forced preemption to the active context
    e0f576335d05 Revert "firmware: arm_scmi: Add clock management to the SCMI power domain"
    5de02ab84aec net: mt7531: only do PLL once after the reset
    56e3f8d56299 mm/damon/dbgfs: fix memory leak when using debugfs_lookup()
    149da9e60b8c ntfs: fix BUG_ON in ntfs_lookup_inode_by_name()
    dc8cdb988453 ARM: dts: integrator: Tag PCI host with device_type
    aa5c3aa3f197 x86/sgx: Do not fail on incomplete sanitization on premature stop of ksgxd
    476c188b9dbe clk: ingenic-tcu: Properly enable registers before accessing timers
    d134b0f7a9b9 can: c_can: don't cache TX messages for C_CAN cores
    6fff203793cb Input: snvs_pwrkey - fix SNVS_HPVIDR1 register address
    006a5085a3a8 net: usb: qmi_wwan: Add new usb-id for Dell branded EM7455
    81e759d71a6b thunderbolt: Explicitly reset plug events delay back to USB4 spec value
    85a70a259916 usb: typec: ucsi: Remove incorrect warning
    ac12a04c8e08 uas: ignore UAS for Thinkplus chips
    528aba78ee01 usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
    0a4e8f384e82 uas: add no-uas quirk for Hiksemi usb_disk
    8484a356cee8 cgroup: cgroup_get_from_id() must check the looked-up kn is a directory
    ae04dd5ef180 cgroup: reduce dependency on cgroup_mutex
    7a64e6dc6cb7 ALSA: hda/realtek: fix speakers and micmute on HP 855 G8
    6a3bee2ead9b ALSA: hda: Fix Nvidia dp infoframe
    f7392f93a2fb ALSA: hda: Fix hang at HD-audio codec unbinding due to refcount saturation
    de5deddfa7e7 ALSA: hda: Do disconnect jacks at codec unbind
    90c7e9b400c7 Linux 5.15.71
    214194610a18 ext4: use locality group preallocation for small closed files
    8a1ac4167dda ext4: avoid unnecessary spreading of allocations among groups
    fd8b82919549 ext4: make mballoc try target group first even with mb_optimize_scan
    21dada4ce19c ext4: limit the number of retries after discarding preallocations blocks
    be4df018c0be ext4: fix bug in extents parsing when eh_entries == 0 and eh_depth > 0
    90bc7b630c6c ext4: make directory inode spreading reflect flexbg size
    95d714d8ad3d devdax: Fix soft-reservation memory description
    27bf7a5d1198 NFSv4: Fixes for nfs4_inode_return_delegation()
    21b0301f2234 drm/amdgpu: don't register a dirty callback for non-atomic
    6eb08245da51 i2c: mlxbf: Fix frequency calculation
    dc2a0c587006 i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
    621c6ab03ac3 i2c: mlxbf: incorrect base address passed during io write
    c242dbf2e36f i2c: imx: If pm_runtime_get_sync() returned 1 device access is possible
    c71ec39be45a workqueue: don't skip lockdep work dependency in cancel_work_sync()
    929ef155e1da fsdax: Fix infinite loop in dax_iomap_rw()
    9aac3819f099 drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
    1c26968caf18 drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
    492db4ffcff3 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
    9539cfc74493 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
    a541c0111818 drm/amd/display: Limit user regamma to a valid value
    33b128f790b6 drm/amdgpu: use dirty framebuffer helper
    f76d6f309a68 drm/amd/pm: disable BACO entry/exit completely on several sienna cichlid cards
    e5ae504c8623 drm/gma500: Fix BUG: sleeping function called from invalid context errors
    e07d9154bb81 Drivers: hv: Never allocate anything besides framebuffer from framebuffer memory region
    5f270b61ee8b drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV
    d3a67c21b18f s390/dasd: fix Oops in dasd_alias_get_start_dev due to missing pavgroup
    faf0e1b5d82b serial: tegra-tcu: Use uart_xmit_advance(), fixes icount.tx accounting
    0aada772fd16 serial: tegra: Use uart_xmit_advance(), fixes icount.tx accounting
    4c7e17270cab serial: Create uart_xmit_advance()
    4199425b1132 serial: fsl_lpuart: Reset prior to registration
    cc1504f6da2e KVM: x86/mmu: Fold rmap_recycle into rmap_add
    dddae48eabfb selftests: forwarding: add shebang for sch_red.sh
    08483e4c0c83 bnxt: prevent skb UAF after handing over to PTP worker
    f8162aed962b net: sched: fix possible refcount leak in tc_new_tfilter()
    bd29ca2b398c net: sunhme: Fix packet reception for len < RX_COPY_THRESHOLD
    ec3a6f4ffe55 bonding: fix NULL deref in bond_rr_gen_slave_id
    db145b8a04fc net/smc: Stop the CLC flow if no link to map buffers on
    5daef0042d2c drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
    a08cba2f50d7 perf tools: Honor namespace when synthesizing build-ids
    1a83f39dc4e1 perf kcore_copy: Do not check /proc/modules is unchanged
    a3b923f449a3 perf jit: Include program header in ELF files
    39dc6ccdd5af perf stat: Fix BPF program section name
    c6d939639fe0 can: gs_usb: gs_can_open(): fix race dev->can.state condition
    e1676adedc17 net: sh_eth: Fix PHY state warning splat during system resume
    71200518bbbf net: ravb: Fix PHY state warning splat during system resume
    d5917b7af7ca netfilter: ebtables: fix memory leak when blob is malformed
    08d7524f366a netfilter: nf_tables: fix percpu memory leak at nf_tables_addchain()
    91aa52652f4b netfilter: nf_tables: fix nft_counters_enabled underflow at nf_tables_addchain()
    c721623efd09 net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs
    f58e43184226 net/sched: taprio: avoid disabling offload when it was never enabled
    510e703e4ed0 net: enetc: deny offload of tc-based TSN features on VF interfaces
    11eb9ed08856 net: enetc: move enetc_set_psfp() out of the common enetc_set_features()
    c60801e4e2b5 wireguard: netlink: avoid variable-sized memcpy on sockaddr
    3ebf690d1cde wireguard: ratelimiter: disable timings test by default
    c2dc533a7edb net: ipa: properly limit modem routing table use
    cbdab7d68f20 of: mdio: Add of_node_put() when breaking out of for_each_xx
    ca86577c10bc drm/hisilicon: Add depends on MMU
    68c4acee6328 drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
    8547c7bfc061 sfc: fix null pointer dereference in efx_hard_start_xmit
    360910b88d14 sfc: fix TX channel offset when using legacy interrupts
    bc750d7127a9 i40e: Fix set max_tx_rate when it is lower than 1 Mbps
    53220b99059a i40e: Fix VF set max MTU size
    7249a653fe5f iavf: Fix set max MTU size with port VLAN and jumbo frames
    030e0688b6b2 mlxbf_gige: clear MDIO gateway lock after read
    93859f6878e7 iavf: Fix bad page state
    e1dbe8a62098 um: fix default console kernel parameter
    7400e2edfc9e MIPS: Loongson32: Fix PHY-mode being left unspecified
    abea65fa7713 MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
    831cf63c043e drm/panel: simple: Fix innolux_g121i1_l01 bus_format
    408d5752b60f net: team: Unsync device addresses on ndo_stop
    f50265a4f3da net: bonding: Unsync device addresses on ndo_stop
    e6b277f7367e net: bonding: Share lacpdu_mcast_addr definition
    8b2ab46b6c63 scsi: mpt3sas: Fix return value check of dma_get_required_mask()
    89df49e561b4 scsi: qla2xxx: Fix memory leak in __qlt_24xx_handle_abts()
    5826a555f77c net: phy: aquantia: wait for the suspend/resume operations to finish
    4d2f1bc9067a net: core: fix flow symmetric hash
    8d06006c7eb7 ipvlan: Fix out-of-bound bugs caused by unset skb->mac_header
    dae9d2abe25b iavf: Fix cached head and tail value for iavf_get_tx_pending
    34447d64b8d2 ice: Don't double unplug aux on peer initiated reset
    816eab147e5c netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
    dc33ffbc361e netfilter: nf_conntrack_irc: Tighten matching on DCC message
    0606c5d5fefd netfilter: nf_conntrack_sip: fix ct_sip_walk_headers
    0babb5bc85ee arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
    dd5a6c5a0875 dmaengine: ti: k3-udma-private: Fix refcount leak bug in of_xudma_dev_get()
    1b0e46d970b4 arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz
    e352fea1d0fc drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks
    43733b6c9fda arm64: dts: rockchip: Fix typo in lisense text for PX30.Core
    2929463a9eff arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob
    166a332463b5 firmware: arm_scmi: Fix the asynchronous reset requests
    1f08a1b26cfc firmware: arm_scmi: Harden accesses to the reset domains
    9ec5a534d77c xfs: validate inode fork size against fork format
    5caa3a127953 xfs: fix xfs_ifree() error handling to not leak perag ref
    9e7b231687fd xfs: reorder iunlink remove operation in xfs_ifree
    28c7ef86b21b vmlinux.lds.h: CFI: Reduce alignment of jump-table to function alignment
    3c3edb82d67b arm64: topology: fix possible overflow in amu_fie_setup()
    2427a04bce86 KVM: x86: Inject #UD on emulated XSETBV if XSAVES isn't enabled
    61703b248be9 mm: slub: fix flush_cpu_slab()/__free_slab() invocations in task context.
    2d6e55e0c038 mm/slub: fix to return errno if kmalloc() fails
    71075d7d4632 net: mana: Add rmb after checking owner bits
    19aea370fd09 can: flexcan: flexcan_mailbox_read() fix return value for drop = true
    bf0197aea195 kasan: call kasan_malloc() from __kmalloc_*track_caller()
    c75288a4902b riscv: fix a nasty sigreturn bug...
    97da736cd11a gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    9b26723e058f gpio: mockup: Fix potential resource leakage when register a chip
    18352095a0d5 gpio: mockup: fix NULL pointer dereference when removing debugfs
    2279e977405b wifi: mt76: fix reading current per-tid starting sequence number for aggregation
    b5bc5a274d54 efi: libstub: check Shim mode using MokSBStateRT
    ef43fee9f211 efi: x86: Wipe setup_data on pure EFI boot
    b173f1f8ef9e thunderbolt: Add support for Intel Maple Ridge single port controller
    65b13f951fe6 usb: dwc3: core: leave default DMA if the controller does not support 64-bit DMA
    7143f6cf58db media: flexcop-usb: fix endpoint type check
    d8a76a2e514f btrfs: fix hang during unmount when stopping a space reclaim worker
    46053262b5f5 btrfs: fix hang during unmount when stopping block group reclaim worker
    b02f86689a5a iommu/vt-d: Check correct capability for sagaw determination
    a963fe6d0eb6 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
    4b2fa20da623 ALSA: hda/realtek: Add quirk for ASUS GA503R laptop
    eb54e457c4ad ALSA: hda/realtek: Add pincfg for ASUS G533Z HP jack
    0898469913cd ALSA: hda/realtek: Add pincfg for ASUS G513 HP jack
    c6a746b4fca5 ALSA: hda/realtek: Re-arrange quirk table entries
    41e974cd6ecb ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5570 laptop
    5421125bbda8 ALSA: hda/realtek: Add quirk for Huawei WRT-WX9
    84481d7a59a2 ALSA: hda: add Intel 5 Series / 3400 PCI DID
    04b5bd5702ab ALSA: hda/tegra: set depop delay for tegra
    e10425c5424b ALSA: core: Fix double-free at snd_card_new()
    10a8c5d7d393 Revert "ALSA: usb-audio: Split endpoint setups for hw_params and prepare"
    06c0204a6e80 USB: serial: option: add Quectel RM520N
    6cf9e8b7e67a USB: serial: option: add Quectel BG95 0x0203 composition
    369b008bbe36 USB: core: Fix RST error in hub.c
    d10d1e9d9f1e drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    6eede01dfd0e Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"
    c02431f43e12 Revert "usb: add quirks for Lenovo OneLink+ Dock"
    8de5e12f587b usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    2db7a7176c45 usb: add quirks for Lenovo OneLink+ Dock
    a72eee6d905e usb: dwc3: gadget: Avoid duplicate requests to enable Run/Stop
    f79a57d4091f usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
    1a9923999459 usb: dwc3: gadget: Refactor pullup()
    7604a210acbb usb: dwc3: gadget: Prevent repeat pullup()
    a0b5d22b0448 usb: dwc3: Issue core soft reset before enabling run/stop
    8d583ba79cde usb: dwc3: gadget: Avoid starting DWC3 gadget during UDC unbind
    167b18f25b96 staging: r8188eu: Add Rosewill USB-N150 Nano to device tables
    add40eda8258 staging: r8188eu: Remove support for devices with 8188FU chipset (0bda:f179)
    55653c548612 drm/amdgpu: make sure to init common IP before gmc
    25a90a11036b drm/amdgpu: Separate vf2pf work item init from virt data exchange
    3e98e33d345e Linux 5.15.70
    21f948cab866 ALSA: hda/sigmatel: Fix unused variable warning for beep power change
    5db17805b6ba cgroup: Add missing cpus_read_lock() to cgroup_attach_task_all()
    39b0235284c7 KVM: SEV: add cache flush to solve SEV cache incoherency issues
    d9bf46e74735 net: Find dst with sk's xfrm policy not ctl_sk
    ab5140c6ddd7 video: fbdev: pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write
    9af7af862cb8 mksysmap: Fix the mismatch of 'L0' symbols in System.map
    2340f23c770d drm/panfrost: devfreq: set opp to the recommended one to configure regulator
    7e8df4920b2a MIPS: OCTEON: irq: Fix octeon_irq_force_ciu_mapping()
    af88da4c737a afs: Return -EAGAIN, not -EREMOTEIO, when a file already locked
    2dd0ae85fb3c net: usb: qmi_wwan: add Quectel RM520N
    a5e949e088bc ALSA: hda/tegra: Align BDL entry to 4KB boundary
    3d25aaf71fe0 ALSA: hda/sigmatel: Keep power up while beep is enabled
    d582756bfc71 wifi: mac80211_hwsim: check length for virtio packets
    17898c3b578a rxrpc: Fix calc of resend age
    1bbcd88c3c99 rxrpc: Fix local destruction being repeated
    87cd4c02bdb1 scsi: lpfc: Return DID_TRANSPORT_DISRUPTED instead of DID_REQUEUE
    f08a320b4b60 regulator: pfuze100: Fix the global-out-of-bounds access in pfuze100_regulator_probe()
    80c7be217ba7 ASoC: nau8824: Fix semaphore unbalance at error paths
    f1d57c4c99c2 arm64: dts: juno: Add missing MHU secure-irq
    59b756da49bf video: fbdev: i740fb: Error out if 'pixclock' equals zero
    899f4160b140 binder: remove inaccurate mmap_assert_locked()
    8c2bbfb0ded3 drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
    0a7d86f156fa drm/amdgpu: move nbio ih_doorbell_range() into ih code for vega
    dcef16f64969 drm/amdgpu: Don't enable LTR if not supported
    710ebf8f1a08 tools/include/uapi: Fix <asm/errno.h> for parisc and xtensa
    309e9f4a17cf parisc: Allow CONFIG_64BIT with ARCH=parisc
    9a72466fb61b cifs: always initialize struct msghdr smb_msg completely
    21c47a08f96a cifs: don't send down the destination address to sendmsg for a SOCK_STREAM
    e1aad8c56090 cifs: revalidate mapping when doing direct writes
    b04e0208d025 of/device: Fix up of_dma_configure_id() stub
    8fd27239ca92 parisc: ccio-dma: Add missing iounmap in error path in ccio_probe()
    5f285e4c47c3 block: blk_queue_enter() / __bio_queue_enter() must return -EAGAIN for nowait
    f86092d12fbb drm/meson: Fix OSD1 RGB to YCbCr coefficient
    d38eb1f37538 drm/meson: Correct OSD1 global alpha value
    89cfddd416ba gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx
    9a173db71a99 NFSv4: Turn off open-by-filehandle and NFS re-export for NFSv4.0
    cd358b2ee56f pinctrl: sunxi: Fix name for A100 R_PIO
    ca2b798e53d4 pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH
    30fccb4fe449 pinctrl: qcom: sc8180x: Fix wrong pin numbers
    cbafdbb6f6ce pinctrl: qcom: sc8180x: Fix gpio_wakeirq_map
    ba6b9f7cc110 of: fdt: fix off-by-one error in unflatten_dt_nodes()
    c23065adf97f tty: serial: atmel: Preserve previous USART mode if RS485 disabled
    1d01d7beccba serial: atmel: remove redundant assignment in rs485_config
    f3450c33411b drm/tegra: vic: Fix build warning when CONFIG_PM=n
    820b689b4a7a Linux 5.15.69
    277674996dcf Input: goodix - add compatible string for GT1158
    b9b39f7332c5 RDMA/irdma: Use s/g array in post send only when its valid
    125c3ae8a936 usb: gadget: f_uac2: fix superspeed transfer
    fa7e0266c239 usb: gadget: f_uac2: clean up some inconsistent indenting
    07609e83c1b9 soc: fsl: select FSL_GUTS driver for DPIO
    3998dc50ebdc mm: Fix TLB flush for not-first PFNMAP mappings in unmap_region()
    cd698131ef5d usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
    6087747599ec platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes
    d4441b810bd8 perf/arm_pmu_platform: fix tests for platform_get_irq() failure
    55032fb14d4a net: dsa: hellcreek: Print warning only once
    985a5d3d491d drm/amd/amdgpu: skip ucode loading if ucode_size == 0
    a1347be8f0ff nvmet-tcp: fix unhandled tcp states in nvmet_tcp_state_change()
    3d380f9d1e2b Input: iforce - add support for Boeder Force Feedback Wheel
    b9682878abee ieee802154: cc2520: add rc code in cc2520_tx()
    3a10e8edee2b gpio: mockup: remove gpio debugfs when remove device
    b4ebcd6d48bc tg3: Disable tg3 device on system reboot to avoid triggering AER
    f715188c23fa hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
    a86c8d1b36a9 HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
    2e3aeb48995a dt-bindings: iio: gyroscope: bosch,bmg160: correct number of pins
    1b80691d5115 drm/msm/rd: Fix FIFO-full deadlock
    a9687a2dc7e1 platform/surface: aggregator_registry: Add support for Surface Laptop Go 2
    49801d5f8b67 Input: goodix - add support for GT1158
    709edbac4c45 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
    90f922646f57 tracefs: Only clobber mode/uid/gid on remount if asked
    3c90af5a773a tracing: hold caller_addr to hardirq_{enable,disable}_ip
    64840a4a2d8e task_stack, x86/cea: Force-inline stack helpers
    0b009e5fd146 x86/mm: Force-inline __phys_addr_nodebug()
    f9571a969973 lockdep: Fix -Wunused-parameter for _THIS_IP_
    dee782da3937 ARM: dts: at91: sama7g5ek: specify proper regulator output ranges
    424ac5929d0a ARM: dts: at91: fix low limit for CPU regulator
    8be25fa7cfd6 ARM: dts: imx6qdl-kontron-samx6i: fix spi-flash compatible
    78eb5e326a0e ARM: dts: imx: align SPI NOR node name with dtschema
    3bb12efc5e4d ACPI: resource: skip IRQ override on AMD Zen platforms
    a68a734b19af NFS: Fix WARN_ON due to unionization of nfs_inode.nrequests

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fbc8840580fe008c2deda50c0d2d5a98e9b6c564)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 6f8648e004..e573b27c9c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dba1b7d90813231782bdeda1bd169c93b35c94e0"
-SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
+SRCREV_machine ?= "47b86b149db08838964584baec1b913c5d67c060"
+SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.68"
+LINUX_VERSION ?= "5.15.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 4f2bb48743..693750860d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.68"
+LINUX_VERSION ?= "5.15.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "33e7eea5c4545a973cf01a849c2b45fa0cd1fa13"
-SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
+SRCREV_machine ?= "34404e5be3791dac897da77afa6c7fa00c993f78"
+SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 2f91fb7a37..792cf41a53 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "efe28b4b16d4a1a19f59b4650a0bfb23ffc8c40e"
-SRCREV_machine:qemuarm64 ?= "66986670c45f63d2ed2078e07aa817ede88025ad"
-SRCREV_machine:qemumips ?= "aeeb80fd7f684aca830adb7daf32cfd80637cf3a"
-SRCREV_machine:qemuppc ?= "5c6387a562af89ec92546c1374a120ac240f14e6"
-SRCREV_machine:qemuriscv64 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
-SRCREV_machine:qemuriscv32 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
-SRCREV_machine:qemux86 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
-SRCREV_machine:qemux86-64 ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
-SRCREV_machine:qemumips64 ?= "20ec37851f4ee9965120937dcf2567f15e72e07a"
-SRCREV_machine ?= "0e51e571701842db33ad96f6ddc8cc6b23230627"
-SRCREV_meta ?= "1128d7bcdcde490d4f35cc00c97f5410bb240d99"
+SRCREV_machine:qemuarm ?= "84a35b23cf4c520894d0d1b91628eb019dc7901a"
+SRCREV_machine:qemuarm64 ?= "e939c4ebc789805c00a36eaf4a190df6f8f51470"
+SRCREV_machine:qemumips ?= "1adf4e5b574a5d23b4724766890ea74101d04abd"
+SRCREV_machine:qemuppc ?= "7220def162c7b2d3b4f1c6c86de0ecc19ade7d5f"
+SRCREV_machine:qemuriscv64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+SRCREV_machine:qemuriscv32 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+SRCREV_machine:qemux86 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+SRCREV_machine:qemux86-64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+SRCREV_machine:qemumips64 ?= "3840e1613b7fe9cc68e9cdfcaf7afa5e14fa8344"
+SRCREV_machine ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
+SRCREV_meta ?= "c6aba7f07aae15d63bccf5b072a6e70602c2bcef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "dd20085f2a88b6cdb12bdcdbd2d7a761c86b184a"
+SRCREV_machine:class-devupstream ?= "c68173b2012b8eba332cf9832f0ad23427d795b5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.68"
+LINUX_VERSION ?= "5.15.72"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


