Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688D5FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.2242.1666838223121837844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SIvPU5W9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so4898613pji.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5k/yY7xt7Da5AeotzTVZge2RmjKDre1iX5rnJo6fCk=;
        b=SIvPU5W9AG7Sgg8ZS+gc9NKCpUXECXG5mZf6qH4kmzbEBcoPDkLBTFStwNsQ7tenrp
         wwfgUlrnaLC8Ec2d3vg+uKMlLc5NlWF6K5RgWrJA0lJiPDt+4JiZFxPBEJIxXP/vo2Cs
         9vtnhQg8qybsep/8IpWQpCJNW+N1PeFmBBLD5nPlAD/H/VcmlMr5n4yNIa3ZKFKKOVNX
         JRcwKuZQSjlvmF4VcS2v/Umm9d2A8+k+PiFw4nafyvx7cWvszAQkwON1b6nunBf3XFm6
         jD2pyDunoMCO/4gRT9zvN2RxSPnMuwHcnLu+7RX3jq1SDHwdi+GOsc+uYBO7gzNlnYig
         +dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5k/yY7xt7Da5AeotzTVZge2RmjKDre1iX5rnJo6fCk=;
        b=hKZOxjx/NfmqOIwhr69ff6qkXVUoOtbL2LM37vmTL3pn2+sYaoRxbaxJssShiw2sm7
         r/7fBYZOCu7enZ8gOuZm2OAgISjkM59fyUU/6ucgpXJScLJ3L3V+9CHXouOold9k76YA
         ahr7g+99Rz6SxhSpZYjzMNnnDSyikPgCQd8wDVwkilwjKC1AlLiLJVVnbUOlvVZ6ZgYy
         qIJryR4k95EnqnAFf4PSN2iatteP7I5eqAUEtr0L/5fSv+qSvqp6p0SUNMuux9RUjv6Y
         mgSN8YrIWyOlQLqJiGiOwuMRLEydA+I+nY0H4rTMMgfkUvMOUXa7IZEw94lqQSsLs8nq
         3J0A==
X-Gm-Message-State: ACrzQf0pLlmxq4mfZGPVEP8NbSYbM2Fnqc/cDZ/zBDEoQTq19KXghXqr
	prj+6s8n5/6HdeNWkl06LxFtDVAhyvnnyzvP
X-Google-Smtp-Source: AMsMyM5/jabbswSoKDlA3L2nix8Wmj7wgDAuQNBoOSrmqyDmO19BRaDsCIRneRQU8cLstRW02RCdjA==
X-Received: by 2002:a17:903:24e:b0:179:b755:b82f with SMTP id j14-20020a170903024e00b00179b755b82fmr45495922plh.34.1666838221642;
        Wed, 26 Oct 2022 19:37:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] linux-yocto/5.10: update to v5.10.147
Date: Wed, 26 Oct 2022 16:36:34 -1000
Message-Id: <68f28c7cba5e9d111668f26fe6486ceda07cdce9.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172180

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    014862eecf03 Linux 5.10.147
    98f722cc2438 ALSA: hda/hdmi: fix warning about PCM count when used with SOF
    b12d0489e402 x86/alternative: Fix race in try_get_desc()
    374d4c307534 KVM: x86: Hide IA32_PLATFORM_DCA_CAP[31:0] from the guest
    a8e6cde5062f clk: iproc: Do not rely on node name for correct PLL setup
    cf41711aa4a7 clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
    83db457b41a8 selftests: Fix the if conditions of in test_extra_filter()
    84cab3531ff7 net: stmmac: power up/down serdes in stmmac_open/release
    743a6e53cf1c nvme: Fix IOC_PR_CLEAR and IOC_PR_RELEASE ioctls for nvme devices
    469dc5fd9a58 nvme: add new line after variable declatation
    2c248c468162 cxgb4: fix missing unlock on ETHOFLD desc collect fail path
    fde656dbc372 net: sched: act_ct: fix possible refcount leak in tcf_ct_init()
    fa065e60811a usbnet: Fix memory leak in usbnet_disconnect()
    57959392f7f0 Input: melfas_mip4 - fix return value check in mip4_probe()
    330b77578168 Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"
    359e73edd3be ASoC: tas2770: Reinit regcache on reset
    8884a192f95e soc: sunxi: sram: Fix debugfs info for A64 SRAM C
    4e2ede7cb9b5 soc: sunxi: sram: Fix probe function ordering issues
    50fbc81f80d2 soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()
    0fdc3ab9b438 soc: sunxi: sram: Prevent the driver from being unbound
    3e0405c69bc9 soc: sunxi: sram: Actually claim SRAM regions
    a658f0bc72cb reset: imx7: Fix the iMX8MP PCIe PHY PERST support
    8934aea1a46c ARM: dts: am33xx: Fix MMCHS0 dma properties
    cce5dc03338e scsi: hisi_sas: Revert "scsi: hisi_sas: Limit max hw sectors for v3 HW"
    625899cd06e1 swiotlb: max mapping size takes min align mask into account
    6f478fe8c3fb media: rkvdec: Disable H.264 error detection
    ac828e241691 media: dvb_vb2: fix possible out of bound access
    be2cd261ca51 mm: fix madivse_pageout mishandling on non-LRU page
    1002d5fef406 mm/migrate_device.c: flush TLB while holding PTL
    a54fc5369113 mm: prevent page_frag_alloc() from corrupting the memory
    466a26af2d10 mm/page_alloc: fix race condition between build_all_zonelists and page allocation
    9b751b4dc350 mmc: hsq: Fix data stomping during mmc recovery
    36b10cde0c44 mmc: moxart: fix 4-bit bus width and remove 8-bit bus width
    02d55a837e1a libata: add ATA_HORKAGE_NOLPM for Pioneer BDR-207M and BDR-205
    e72a435fa30c net: mt7531: only do PLL once after the reset
    a48daecd0994 ntfs: fix BUG_ON in ntfs_lookup_inode_by_name()
    1d71422bd483 ARM: dts: integrator: Tag PCI host with device_type
    dab144c5dd07 clk: ingenic-tcu: Properly enable registers before accessing timers
    6c5742372b2d Input: snvs_pwrkey - fix SNVS_HPVIDR1 register address
    8cf377baf0c3 net: usb: qmi_wwan: Add new usb-id for Dell branded EM7455
    0695e590de3c thunderbolt: Explicitly reset plug events delay back to USB4 spec value
    efdff5339462 usb: typec: ucsi: Remove incorrect warning
    e5ee7b77ac9b uas: ignore UAS for Thinkplus chips
    5f91ceea6c14 usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
    1e4b856fc0bb uas: add no-uas quirk for Hiksemi usb_disk
    6ac5b52e3f35 btrfs: fix hang during unmount when stopping a space reclaim worker
    29d849c3de57 ALSA: hda: Fix Nvidia dp infoframe
    24070d32c6ec ALSA: hda/hdmi: let new platforms assign the pcm slot dynamically
    c1256c531d67 ALSA: hda/tegra: Reset hardware
    ded9e8964d00 ALSA: hda/tegra: Use clk_bulk helpers
    b2ad53fbc0e1 thunderbolt: Add support for Intel Maple Ridge single port controller
    53e6282dde62 thunderbolt: Add support for Intel Maple Ridge
    62aea694445d Linux 5.10.146
    c18383218c31 ext4: make directory inode spreading reflect flexbg size
    a968542d7e24 ext4: limit the number of retries after discarding preallocations blocks
    958b0ee23f5a ext4: fix bug in extents parsing when eh_entries == 0 and eh_depth > 0
    25117265152e devdax: Fix soft-reservation memory description
    0fa11239c4d3 i2c: mlxbf: Fix frequency calculation
    48ee0a864d1a i2c: mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
    4f6db1f9219e i2c: mlxbf: incorrect base address passed during io write
    2f58c47c36d3 i2c: imx: If pm_runtime_get_sync() returned 1 device access is possible
    90f1c0025be0 workqueue: don't skip lockdep work dependency in cancel_work_sync()
    4dfc96d8d730 drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
    58101a9cfc5f drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
    3ae1dede22e3 drm/amd/display: Limit user regamma to a valid value
    867b2b2b6802 drm/amdgpu: use dirty framebuffer helper
    c5812807e416 drm/gma500: Fix BUG: sleeping function called from invalid context errors
    ec2bf249bdff Drivers: hv: Never allocate anything besides framebuffer from framebuffer memory region
    2a2e503a62e5 cifs: always initialize struct msghdr smb_msg completely
    877231b0e678 cifs: use discard iterator to discard unneeded network data more efficiently
    09867977fcc2 drm/amdgpu: Fix check for RAS support
    8c6fd05cf887 vfio/type1: fix vaddr_get_pfns() return in vfio_pin_page_external()
    f31ea57c1183 usb: xhci-mtk: fix issue of out-of-bounds array access
    f5fcc9d6d71d s390/dasd: fix Oops in dasd_alias_get_start_dev due to missing pavgroup
    fb189aa1be09 serial: tegra-tcu: Use uart_xmit_advance(), fixes icount.tx accounting
    e1993864a935 serial: tegra: Use uart_xmit_advance(), fixes icount.tx accounting
    7f11386733ab serial: Create uart_xmit_advance()
    fda04a0bab7f drm/amd/amdgpu: fixing read wrong pf2vf data in SRIOV
    4bc4b6419e65 selftests: forwarding: add shebang for sch_red.sh
    8844c750eeb0 net: sched: fix possible refcount leak in tc_new_tfilter()
    75ca7f44dab6 net: sunhme: Fix packet reception for len < RX_COPY_THRESHOLD
    d76151a8131e net/smc: Stop the CLC flow if no link to map buffers on
    fd938b4ce0fb drm/mediatek: dsi: Move mtk_dsi_stop() call back to mtk_dsi_poweroff()
    c99062160688 perf kcore_copy: Do not check /proc/modules is unchanged
    28d185095e51 perf jit: Include program header in ELF files
    78926cf76291 can: gs_usb: gs_can_open(): fix race dev->can.state condition
    ebd97dbe3c55 netfilter: ebtables: fix memory leak when blob is malformed
    b043a525a3f5 netfilter: nf_tables: fix percpu memory leak at nf_tables_addchain()
    710e3f526bd2 netfilter: nf_tables: fix nft_counters_enabled underflow at nf_tables_addchain()
    1e7e55374d01 net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs
    586def6ebed1 net/sched: taprio: avoid disabling offload when it was never enabled
    aa400ccadf59 net: socket: remove register_gifconf
    8bd98cfbfcb0 net: enetc: move enetc_set_psfp() out of the common enetc_set_features()
    f0a057f49b8d wireguard: netlink: avoid variable-sized memcpy on sockaddr
    b7b385959894 wireguard: ratelimiter: disable timings test by default
    ddd47f1cd67d net: ipa: properly limit modem routing table use
    8c1454d5493b net: ipa: kill IPA_TABLE_ENTRY_SIZE
    53b1715e283e net: ipa: DMA addresses are nicely aligned
    48afea293a89 net: ipa: avoid 64-bit modulus
    3ae25aca3f89 net: ipa: fix table alignment requirement
    c2cf0613d1ff net: ipa: fix assumptions about DMA address size
    d58815af8979 of: mdio: Add of_node_put() when breaking out of for_each_xx
    9101e54c95cf drm/hisilicon: Add depends on MMU
    bac7328fc0d7 drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled
    b3b41d4d95d3 sfc: fix null pointer dereference in efx_hard_start_xmit
    b4afd3878f96 sfc: fix TX channel offset when using legacy interrupts
    2dbf487d6b38 i40e: Fix set max_tx_rate when it is lower than 1 Mbps
    65ee2bcc8990 i40e: Fix VF set max MTU size
    15e9724f6bb3 iavf: Fix set max MTU size with port VLAN and jumbo frames
    ccddb1db4b3c iavf: Fix bad page state
    21b535fe5ecb MIPS: Loongson32: Fix PHY-mode being left unspecified
    a4121785a3a3 MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
    1ac50c1ad40f drm/panel: simple: Fix innolux_g121i1_l01 bus_format
    90fbcb26d666 net: team: Unsync device addresses on ndo_stop
    e2b94a11223a net: bonding: Unsync device addresses on ndo_stop
    dc209962c093 net: bonding: Share lacpdu_mcast_addr definition
    2b9aba0c5d58 scsi: mpt3sas: Fix return value check of dma_get_required_mask()
    e7fafef9830c scsi: mpt3sas: Force PCIe scatterlist allocations to be within same 4 GB region
    351f2d2c357f net: phy: aquantia: wait for the suspend/resume operations to finish
    d298fc2eefd6 net: core: fix flow symmetric hash
    e90001e1dd96 net: let flow have same hash in two directions
    ab4a733874ea ipvlan: Fix out-of-bound bugs caused by unset skb->mac_header
    14446a1bc2a8 iavf: Fix cached head and tail value for iavf_get_tx_pending
    5d75fef3e61e netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
    9a5d7e0acb41 netfilter: nf_conntrack_irc: Tighten matching on DCC message
    369ec4dab097 netfilter: nf_conntrack_sip: fix ct_sip_walk_headers
    66f9470ffe42 arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
    aa11dae059a4 dmaengine: ti: k3-udma-private: Fix refcount leak bug in of_xudma_dev_get()
    1cc871fe6d31 arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz
    3ca272b231d6 drm/mediatek: dsi: Add atomic {destroy,duplicate}_state, reset callbacks
    39f97714f3e2 arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob
    dce466286944 xfs: validate inode fork size against fork format
    a6bfdc157f85 xfs: reorder iunlink remove operation in xfs_ifree
    e811a534ec2f xfs: fix up non-directory creation in SGID directories
    4e74179a164d interconnect: qcom: icc-rpmh: Add BCMs to commit list in pre_aggregate
    a60babeb60ff KVM: SEV: add cache flush to solve SEV cache incoherency issues
    379ac7905ff3 mm/slub: fix to return errno if kmalloc() fails
    fa57bb9b1ab5 can: flexcan: flexcan_mailbox_read() fix return value for drop = true
    12fda27a412b riscv: fix a nasty sigreturn bug...
    657803b918e0 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    bdea98b98f84 gpio: mockup: fix NULL pointer dereference when removing debugfs
    bd5958ccfc45 wifi: mt76: fix reading current per-tid starting sequence number for aggregation
    85f9a2d51e72 efi: libstub: check Shim mode using MokSBStateRT
    3490ebe43505 efi: x86: Wipe setup_data on pure EFI boot
    c5ee36018d32 media: flexcop-usb: fix endpoint type check
    0d99b180ce68 iommu/vt-d: Check correct capability for sagaw determination
    213cdb2901e9 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
    10c7e52d9585 ALSA: hda/realtek: Add quirk for ASUS GA503R laptop
    4cd84a9518e0 ALSA: hda/realtek: Add pincfg for ASUS G533Z HP jack
    2f7cad4ecd0b ALSA: hda/realtek: Add pincfg for ASUS G513 HP jack
    62ce31979fd5 ALSA: hda/realtek: Re-arrange quirk table entries
    d4bad13828f0 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5570 laptop
    62b0824c2c69 ALSA: hda/realtek: Add quirk for Huawei WRT-WX9
    c78bce842d47 ALSA: hda: add Intel 5 Series / 3400 PCI DID
    f109dd1607f8 ALSA: hda/tegra: set depop delay for tegra
    a1926f11d9aa USB: serial: option: add Quectel RM520N
    4d1d91a6343e USB: serial: option: add Quectel BG95 0x0203 composition
    3a26651a7856 USB: core: Fix RST error in hub.c
    381f77b6a69a arm64/bti: Disable in kernel BTI when cross section thunks are broken
    050de2898039 arm64: Restrict ARM64_BTI_KERNEL to clang 12.0.0 and newer
    561d86bd0e28 Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"
    578d644edc7d vfio/type1: Unpin zero pages
    abb560abdf47 vfio/type1: Prepare for batched pinning with struct vfio_batch
    38cb9b868369 vfio/type1: Change success value of vaddr_get_pfn()
    c4adbfa9cea7 Revert "usb: add quirks for Lenovo OneLink+ Dock"
    905e8be5284b usb: cdns3: fix issue with rearming ISO OUT endpoint
    8fcb5f027b39 usb: cdns3: fix incorrect handling TRB_SMM flag for ISOC transfer
    f457bb21984b usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    b9e5c47e3357 usb: add quirks for Lenovo OneLink+ Dock
    345bdea212e3 tty: serial: atmel: Preserve previous USART mode if RS485 disabled
    730f78c51bdc serial: atmel: remove redundant assignment in rs485_config
    b3f2adf42621 mmc: core: Fix inconsistent sd3_bus_mode at UHS-I SD voltage switch failure
    7780b3dda212 usb: xhci-mtk: relax TT periodic bandwidth allocation
    99f48a3a6eec usb: xhci-mtk: allow multiple Start-Split in a microframe
    b19f9f412216 usb: xhci-mtk: add some schedule error number
    402fa9214e12 usb: xhci-mtk: add a function to (un)load bandwidth info
    c2e7000b137b usb: xhci-mtk: use @sch_tt to check whether need do TT schedule
    a2566a8dc5da usb: xhci-mtk: add only one extra CS for FS/LS INTR
    b1e11bc66cfd usb: xhci-mtk: get the microframe boundary for ESIT
    9c28189bb654 usb: dwc3: gadget: Avoid duplicate requests to enable Run/Stop
    ff23c7277fb4 usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
    ab046365c91c usb: dwc3: gadget: Refactor pullup()
    db27874477fd usb: dwc3: gadget: Prevent repeat pullup()
    6bd182beef5d usb: dwc3: Issue core soft reset before enabling run/stop
    b83692feb09c usb: dwc3: gadget: Avoid starting DWC3 gadget during UDC unbind
    2a358ad19c3e usb: typec: intel_pmc_mux: Add new ACPI ID for Meteor Lake IOM device
    c267bb83340e usb: typec: intel_pmc_mux: Update IOM port status offset for AlderLake
    7b0db849ea03 drm/amdgpu: make sure to init common IP before gmc
    9d18013dac86 drm/amdgpu: Separate vf2pf work item init from virt data exchange
    87a4e51fb8d6 drm/amdgpu: indirect register access for nv12 sriov
    9f55f36f749a drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega
    4a77e6ef2057 Linux 5.10.145
    ca5539d42164 ALSA: hda/sigmatel: Fix unused variable warning for beep power change
    9f267393b036 cgroup: Add missing cpus_read_lock() to cgroup_attach_task_all()
    06e194e1130c video: fbdev: pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write
    3fefe614ed80 mksysmap: Fix the mismatch of 'L0' symbols in System.map
    3e6d2eff5661 MIPS: OCTEON: irq: Fix octeon_irq_force_ciu_mapping()
    72602bc62013 afs: Return -EAGAIN, not -EREMOTEIO, when a file already locked
    517a0324db6e net: usb: qmi_wwan: add Quectel RM520N
    a36fd2d8d69c ALSA: hda/tegra: Align BDL entry to 4KB boundary
    e41b97a27780 ALSA: hda/sigmatel: Keep power up while beep is enabled
    b95a5ef4c054 wifi: mac80211_hwsim: check length for virtio packets
    c505fee07b3d rxrpc: Fix calc of resend age
    35da670ed13e rxrpc: Fix local destruction being repeated
    891d5c46f282 regulator: pfuze100: Fix the global-out-of-bounds access in pfuze100_regulator_probe()
    c2ef959e33b2 ASoC: nau8824: Fix semaphore unbalance at error paths
    107c6b60582c Revert "serial: 8250: Fix reporting real baudrate value in c_ospeed field"
    e00582a36198 video: fbdev: i740fb: Error out if 'pixclock' equals zero
    f63ddf62d0c8 tools/include/uapi: Fix <asm/errno.h> for parisc and xtensa
    331eba80cbd7 cifs: don't send down the destination address to sendmsg for a SOCK_STREAM
    f3fbd08e7ca3 cifs: revalidate mapping when doing direct writes
    a9398cb81cdc of/device: Fix up of_dma_configure_id() stub
    6a27acda3d6a tracing: hold caller_addr to hardirq_{enable,disable}_ip
    65dd251c516d parisc: ccio-dma: Add missing iounmap in error path in ccio_probe()
    1f24b0a7ca41 drm/meson: Fix OSD1 RGB to YCbCr coefficient
    4d3d2e384b22 drm/meson: Correct OSD1 global alpha value
    24196210b198 gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx
    4d065f835658 NFSv4: Turn off open-by-filehandle and NFS re-export for NFSv4.0
    2f16f5b582cd pinctrl: sunxi: Fix name for A100 R_PIO
    ee4369260e77 of: fdt: fix off-by-one error in unflatten_dt_nodes()
    cae6172a9464 net: dsa: mv88e6xxx: allow use of PHYs on CPU and DSA ports
    4a6c6041e8d8 platform/x86/intel: hid: add quirk to support Surface Go 3
    8faabaf112c9 usb: cdns3: gadget: fix new urb never complete if ep cancel previous requests
    cd226d8c1b4a powerpc/pseries/mobility: ignore ibm, platform-facilities updates
    d5ee5a9e47f3 powerpc/pseries/mobility: refactor node lookup during DT update
    4dbe84b9b66c dmaengine: bestcomm: fix system boot lockups
    7bbdf49e2624 parisc: Flush kernel data mapping in set_pte_at() when installing pte for user page
    b00a56e64713 parisc: Optimize per-pagetable spinlocks
    59819f0aafd0 serial: 8250: Fix reporting real baudrate value in c_ospeed field
    9230af9188a2 KVM: PPC: Tick accounting should defer vtime accounting 'til after IRQ handling
    6bae47548188 KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs
    99c2dfe47a9c Linux 5.10.144
    744f98f71dc6 Input: goodix - add compatible string for GT1158
    c7f4c203d18c soc: fsl: select FSL_GUTS driver for DPIO
    35371fd68807 x86/ftrace: Use alternative RET encoding
    4586df06a020 x86/ibt,ftrace: Make function-graph play nice
    33015556a943 Revert "x86/ftrace: Use alternative RET encoding"
    891f03f688de mm: Fix TLB flush for not-first PFNMAP mappings in unmap_region()
    dd3aa77d5d72 usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
    5ce017619c30 platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes
    fc2c14c2cde9 perf/arm_pmu_platform: fix tests for platform_get_irq() failure
    187908079d94 drm/amd/amdgpu: skip ucode loading if ucode_size == 0
    c598e2704c3b nvmet-tcp: fix unhandled tcp states in nvmet_tcp_state_change()
    1cae6f8e1765 Input: iforce - add support for Boeder Force Feedback Wheel
    de2aa495230b ieee802154: cc2520: add rc code in cc2520_tx()
    3815e66c2183 gpio: mockup: remove gpio debugfs when remove device
    1b8b5384e83a tg3: Disable tg3 device on system reboot to avoid triggering AER
    704d1f2ac6dc hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
    ef033e619e4d HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
    cff2b3a50c69 drm/msm/rd: Fix FIFO-full deadlock
    fac2c299efc6 Input: goodix - add support for GT1158
    218b71e32f9a tracefs: Only clobber mode/uid/gid on remount if asked
    0a81ddfc20cc iommu/vt-d: Correctly calculate sagaw value of IOMMU
    5ce1b0a0c27c ARM: dts: imx6qdl-kontron-samx6i: fix spi-flash compatible
    a381cac2ab08 ARM: dts: imx: align SPI NOR node name with dtschema

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7ce21f0719..1f8c5ac50f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "932359383ea84843300c03ee6633881de1af488b"
-SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
+SRCREV_machine ?= "02eb724ea2893ad5e002f68a02137e738bcdbfa3"
+SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.143"
+LINUX_VERSION ?= "5.10.147"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 760b2be437..3d69571b42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.143"
+LINUX_VERSION ?= "5.10.147"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "f794496466680c6dbd36cb34b3e0884d0ee48d2d"
-SRCREV_machine ?= "8173de3a22ec3395be1ae01dbe823d076313641a"
-SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
+SRCREV_machine:qemuarm ?= "faa3a54d0b5f1b1538b6cb23a0f897571c3dbd63"
+SRCREV_machine ?= "ad1a2bb304ee3e96330c8b21b9257af12a636384"
+SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index bf43f77100..e192406649 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1cfbadeee39ed8d3a8840586a57eee0cf1686f62"
-SRCREV_machine:qemuarm64 ?= "12f0f8c4af04c4d4cb7762b7a2e5cfaa917f8fe9"
-SRCREV_machine:qemumips ?= "4b9e240c03b2b60be378ae2cc9a321922201de8f"
-SRCREV_machine:qemuppc ?= "7914a529e3ccd64f347439d5cabc202d24af3ea0"
-SRCREV_machine:qemuriscv64 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
-SRCREV_machine:qemuriscv32 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
-SRCREV_machine:qemux86 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
-SRCREV_machine:qemux86-64 ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
-SRCREV_machine:qemumips64 ?= "05365e1787c60331f88bec98dd0fcca08ce78b06"
-SRCREV_machine ?= "8cf777336c9b7160ffdf1e8d7e4d8ee0cd8cdb37"
-SRCREV_meta ?= "92c947578207d27db250ee7250bacc11d9d80d4f"
+SRCREV_machine:qemuarm ?= "e2240e46237b37b9513c499b9fa3bcf48457739c"
+SRCREV_machine:qemuarm64 ?= "2d0288dbda90298b31ac96572fa618ec699c6c34"
+SRCREV_machine:qemumips ?= "32b951885ae1b49e5f7e2c9588f537241e4d3aa8"
+SRCREV_machine:qemuppc ?= "f02e31aa61cf6051aa674005b334f472316b9c80"
+SRCREV_machine:qemuriscv64 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
+SRCREV_machine:qemuriscv32 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
+SRCREV_machine:qemux86 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
+SRCREV_machine:qemux86-64 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
+SRCREV_machine:qemumips64 ?= "0ca215b63d2bf06eeeb4c69ceed8537fd68e3d2e"
+SRCREV_machine ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
+SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.143"
+LINUX_VERSION ?= "5.10.147"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


