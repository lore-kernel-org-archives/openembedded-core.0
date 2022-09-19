Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A682FC6FA93
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web09.20495.1663597721532727290
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HAY2kgjk;
 spf=pass (domain: gmail.com, ip: 209.85.222.193,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id c19so18648687qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xuiVYgXbf6N4un9MZILCZ/Cgz9wHfGC/9VIvUuzYw6c=;
        b=HAY2kgjkx7hcFqgUbTX/hMq9nmi/TJr1z026pPoF5uks154Za585meti91I0NShUbc
         PXWK2CKEtYOeofQc647Qlt7KiV9DGRN1flXKTix8z1kC16UuTQzUn4u/H+ZsWveGCt4v
         MoIMDFCALPG9v1/Atfe30Y5tW4YcVEe7xt1LYM6Ja+YPNYI5NQV0gCpf9xUoCxw0UKgG
         zfPhBA1qa+7aQwHMBoLO4MRvqzw5JRoh/CT9U58pZ9/cRnRQ/kwC6nP2rxH1GEQWJFNI
         xr2ACbAjEKsQc+WSl6s5FUAK4f8/F811BBJMxfe/1G14dmSXm4U8w3Q5BF00jqTKRjGk
         I12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xuiVYgXbf6N4un9MZILCZ/Cgz9wHfGC/9VIvUuzYw6c=;
        b=LM7Thd22PLWtaBirHbPwtE3BQ6y0vD2vx+jq4fapd5P5BARttVcrCdOsY+VqbMVSud
         9Fs3RFUUBdAN+BxsqMNlsXNIUQDJK54mTBi4XTmfff4IzkgMKQzWJBrdQGDZgGVWB2Vg
         EXe7ynLgTJO8uatwyj4BaScHBzbeL808FTU77n3oFNrmO3N/KPMuhnNHBBhuqs12/EZR
         jhH+aOy+MRJA+P8LHVPjvq/Er7iC8+xV9wm5hw6vo5yxEIAslGsRLmP+Zrn84aI8INOP
         RyVsh/nN/V5qgGTs9hahP8B8H1zfdd9b66hZfRIeo1MvwUDhyRV3eVdTBpwuL2cDzF6p
         Ru0Q==
X-Gm-Message-State: ACrzQf23PF59TH5iKxeFRP5C80v4+R3U3RxLe/4jdrefoeJwzRxDQpND
	FUClCeaORSmq0yrP7+dWLvJta+WRhrA=
X-Google-Smtp-Source: 
 AMsMyM6oTNjs2QEttWgSeynv8Fk7GyQdqVoZHT7AJBWok0QyXAuPu58F+HY/PZazyUcrL1SKGE7JYQ==
X-Received: by 2002:a05:620a:4614:b0:6cc:9eb5:98b0 with SMTP id
 br20-20020a05620a461400b006cc9eb598b0mr13312254qkb.631.1663597720336;
        Mon, 19 Sep 2022 07:28:40 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/5.15: update to v5.15.63
Date: Mon, 19 Sep 2022 10:28:26 -0400
Message-Id: 
 <db804a7e29016790b3ae84bce171c1356f9db772.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170864

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    addc9003c2e8 Linux 5.15.63
    b92be74cb2da xfs: reject crazy array sizes being fed to XFS_IOC_GETBMAP*
    1350a4cdfbe6 xfs: revert "xfs: actually bump warning counts when we send warnings"
    12689d950d75 xfs: fix soft lockup via spinning in filestream ag selection loop
    bbc256bf904d xfs: fix overfilling of reserve pool
    90f414686bc4 xfs: always succeed at setting the reserve pool size
    07e17dcd03e0 xfs: remove infinite loop when reserving free block pool
    130b5965da3a xfs: reserve quota for target dir expansion when renaming files
    5e7f687ca727 xfs: reserve quota for dir expansion when linking/unlinking files
    139e6fc6e7a7 xfs: flush inodegc workqueue tasks before cancel
    d66d392c72a6 scsi: ufs: ufs-mediatek: Fix build error and type mismatch
    1a9f5411837a can: j1939: j1939_sk_queue_activate_next_locked(): replace WARN_ON_ONCE with netdev_warn_once()
    e7403632c015 MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
    e740e787f066 video: fbdev: i740fb: Check the argument of i740_calc_vclk()
    0bdec5eed69c venus: pm_helpers: Fix warning in OPP during probe
    e3c9e9452a8e powerpc/64: Init jump labels before parse_early_param()
    ecdba236bc35 smb3: check xattr value length earlier
    3c201130cc81 f2fs: fix to do sanity check on segment type in build_sit_entries()
    5a01e45b925a f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
    3895d353f45a ALSA: control: Use deferred fasync helper
    409e6a799283 ALSA: timer: Use deferred fasync helper
    60110fd26623 ALSA: core: Add async signal helpers
    a5ec4cd45b52 powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
    8641e0bbb5ef ovl: warn if trusted xattr creation fails
    0480540da5a2 powerpc/32: Don't always pass -mcpu=powerpc to the compiler
    3d5d2dc1dc08 powerpc/32: Set an IBAT covering up to _einittext during init
    6568e52b281c watchdog: export lockup_detector_reconfigure
    c5a8d0512018 RISC-V: Add fast call path of crash_kexec()
    64f94e6e1fab riscv: mmap with PROT_WRITE but no PROT_READ is invalid
    e751030eb844 riscv: dts: canaan: Add k210 topology information
    23069475daeb riscv: dts: sifive: Add fu740 topology information
    21d784398a04 ASoC: rsnd: care default case on rsnd_ssiu_busif_err_irq_ctrl()
    9774b96bce7d modules: Ensure natural alignment for .altinstructions and __bug_table sections
    2097c7835162 iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
    7822d994eb95 mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
    c983edb06239 vfio: Clear the caps->buf to NULL after free
    a1d8021d2130 KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
    17c32546166d tty: serial: Fix refcount leak bug in ucc_uart.c
    ce0432aa8944 lib/list_debug.c: Detect uninitialized lists
    72b850a2a996 ext4: avoid resizing to a partial cluster size
    0e734f91cb1c ext4: avoid remove directory when directory is corrupted
    d9b94c3ace54 drivers:md:fix a potential use-after-free bug
    a600ed25e3d9 nvmet-tcp: fix lockdep complaint on nvmet_tcp_wq flush during queue teardown
    e59ef9b07130 md: Notify sysfs sync_completed in md_reap_sync_thread()
    2dc9615abfbc phy: samsung: phy-exynos-pcie: sanitize init/power_on callbacks
    405ea6d70684 openrisc: io: Define iounmap argument as volatile
    d1fc64bf4526 dmaengine: sprd: Cleanup in .remove() after pm_runtime_get_sync() failed
    d0e2b8e36911 selftests/kprobe: Do not test for GRP/ without event failures
    3645ed60ac07 csky/kprobe: reclaim insn_slot on kprobe unregistration
    fda4bff43bcd RDMA/rxe: Limit the number of calls to each tasklet
    54aa6c49361b dmaengine: dw-axi-dmac: ignore interrupt if no descriptor
    af76e6fdcf92 dmaengine: dw-axi-dmac: do not print NULL LLI during error
    e799817b67b3 um: add "noreboot" command line option for PANIC_TIMEOUT=-1 setups
    405f655ee7f6 PCI/ACPI: Guard ARM64-specific mcfg_quirks
    addff638c417 cxl: Fix a memory leak in an error handling path
    5e24cd70355e pinctrl: intel: Check against matching data instead of ACPI companion
    67b5870a35bb mmc: tmio: avoid glitches when resetting
    0f5916516d86 habanalabs/gaudi: mask constant value before cast
    b09e5ab18c9f habanalabs/gaudi: fix shift out of bounds
    1693fe9ba2ef coresight: etm4x: avoid build failure with unrolled loops
    94aadba8d000 gadgetfs: ep_io - wait until IRQ finishes
    9c8e2e607270 scsi: lpfc: Fix possible memory leak when failing to issue CMF WQE
    b92506dc51f8 scsi: lpfc: Prevent buffer overflow crashes in debugfs with malformed user input
    0af01d2c5edd clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
    25041029389b zram: do not lookup algorithm in backends table
    50de5045815e uacce: Handle parent device removal or parent driver module rmmod
    17d58499dc9c clk: qcom: ipq8074: dont disable gcc_sleep_clk_src
    348274a6bb7f vboxguest: Do not use devm for irq
    b9c31d4ae9be usb: dwc2: gadget: remove D+ pull-up while no vbus with usb-role-switch
    fbdbd61a36d8 usb: renesas: Fix refcount leak bug
    0fc62bbc9531 usb: host: ohci-ppc-of: Fix refcount leak bug
    4d6bab8d366a scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
    35c3ec7d7a51 clk: ti: Stop using legacy clkctrl names for omap4 and 5
    00c274bc5bfa drm/meson: Fix overflow implicit truncation warnings
    b01d6bfdf2e4 irqchip/tegra: Fix overflow implicit truncation warnings
    49968090f921 PCI: aardvark: Fix reporting Slot capabilities on emulated bridge
    fb76cdd21662 usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
    de6aa7abfebf usb: gadget: uvc: calculate the number of request depending on framesize
    8e142744f0e9 usb: cdns3: fix random warning message when driver load
    c3c1dbad3a2d usb: cdns3 fix use-after-free at workaround 2
    08c0a77b2aec platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
    da56759a4a35 PCI: Add ACS quirk for Broadcom BCM5750x NICs
    6fc955b58acf HID: multitouch: new device class fix Lenovo X12 trackpad sticky
    57b5be2bd1e0 KVM: arm64: Reject 32bit user PSTATE on asymmetric systems
    cb332a666e3f KVM: arm64: Treat PMCR_EL1.LC as RES1 on asymmetric systems
    c682fb70a7df net: qrtr: start MHI channel after endpoit creation
    98e28de472ef drm/sun4i: dsi: Prevent underflow when computing packet sizes
    fe71d84c1a6c drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
    6ee1310f4d14 ASoC: SOF: Intel: hda: Fix potential buffer overflow by snprintf()
    3142b5f09e55 ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
    88db4a22d954 drm/imx/dcss: get rid of HPD warning message
    1c7e569c0ece tracing/eprobes: Fix reading of string fields
    830426469f77 gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
    a2cafe242874 kbuild: fix the modules order between drivers and libs
    8ee44abe4cae igb: Add lock to avoid data race
    471295311960 stmmac: intel: Add a missing clk_disable_unprepare() call in intel_eth_pci_remove()
    334554aab154 fec: Fix timer capture timing in `fec_ptp_enable_pps()`
    c56e1fcb3091 i40e: Fix to stop tx_timeout recovery if GLOBR fails
    bd1fd0a02e9a regulator: pca9450: Remove restrictions for regulator-name
    09e512a659e4 i2c: imx: Make sure to unregister adapter on remove()
    b4ac11967e8c ice: Ignore EEXIST when setting promisc mode
    e84c6321f357 net: dsa: sja1105: fix buffer overflow in sja1105_setup_devlink_regions()
    caa80c1f8316 net: dsa: don't warn in dsa_port_set_state_now() when driver doesn't support it
    b0672895d8be net: genl: fix error path memory leak in policy dumping
    232fab59a65a net: dsa: felix: fix ethtool 256-511 and 512-1023 TX packet counters
    29c5956061c9 net: dsa: microchip: ksz9477: fix fdb_dump last invalid entry
    ffb155944333 net: fix potential refcount leak in ndisc_router_discovery()
    c7118a579106 net: moxa: pass pdev instead of ndev to DMA functions
    a44a1a14211d mlxsw: spectrum: Clear PTP configuration after unregistering the netdevice
    dd236b62d25e net: dsa: mv88e6060: prevent crash on an unused port
    c0434f0e0586 net/sunrpc: fix potential memory leaks in rpc_sysfs_xprt_state_change()
    dd32ea395658 spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
    1d9e75c3d8cd powerpc/pci: Fix get_phb_number() locking
    e58d1a96e93b netfilter: nf_tables: check NFT_SET_CONCAT flag if field_count is specified
    7ac21b920ee6 netfilter: nf_tables: disallow NFT_SET_ELEM_CATCHALL and NFT_SET_ELEM_INTERVAL_END
    0df32f45be40 netfilter: nf_tables: NFTA_SET_ELEM_KEY_END requires concat and interval flags
    46f64e6325ee netfilter: nf_tables: validate NFTA_SET_ELEM_OBJREF based on NFT_SET_OBJECT flag
    8a6775ede639 netfilter: nf_tables: really skip inactive sets when allocating name
    b59bee8b05b0 netfilter: nf_tables: possible module reference underflow in error path
    3be4d59808bb netfilter: nf_tables: disallow NFTA_SET_ELEM_KEY_END with NFT_SET_ELEM_INTERVAL_END flag
    81dcb3b80475 fs/ntfs3: uninitialized variable in ntfs_set_acl_ex()
    8a38a73cb406 netfilter: nf_tables: use READ_ONCE and WRITE_ONCE for shared generation id access
    cacdddfefe8d ASoC: codec: tlv320aic32x4: fix mono playback via I2S
    18b5a57e7d96 ASoC: tas2770: Fix handling of mute/unmute
    8eab21065492 ASoC: tas2770: Drop conflicting set_bias_level power setting
    0a63bc250cc1 ASoC: tas2770: Allow mono streams
    480bf1e299a4 ASoC: tas2770: Set correct FSYNC polarity
    b318b9dd2ac6 ASoC: SOF: debug: Fix potential buffer overflow by snprintf()
    743dc4377bba iavf: Fix reset error handling
    dab6b551f5ba iavf: Fix adminq error handling
    8af269e5bdf4 nios2: add force_successful_syscall_return()
    c9f78def8856 nios2: restarts apply only to the first sigframe we build...
    3bee7b77d917 nios2: fix syscall restart checks
    f794d1fe6e52 nios2: traced syscall does need to check the syscall number
    80cae5d810d2 nios2: don't leave NULLs in sys_call_table[]
    35d5fd70e8c8 nios2: page fault et.al. are *not* restartable syscalls...
    c293e8abc09e fs/ntfs3: Fix missing i_op in ntfs_read_mft
    efdcf4df7a36 fs/ntfs3: Do not change mode if ntfs_set_ea failed
    78e4aebc35b3 fs/ntfs3: Fix double free on remount
    8feb84857915 fs/ntfs3: Don't clear upper bits accidentally in log_replay()
    8e8e1a84dac7 fs/ntfs3: Fix NULL deref in ntfs_update_mftmirr
    ecda80a345ca fs/ntfs3: Fix using uninitialized value n when calling indx_read
    69979b5e308f dpaa2-eth: trace the allocated address instead of page struct
    f39b424b4301 perf tests: Fix Track with sched_switch test for hybrid case
    5958ef867b9d perf parse-events: Fix segfault when event parser gets an error
    e8ab87549bbe perf probe: Fix an error handling path in 'parse_perf_probe_command()'
    51471b697303 geneve: fix TOS inheriting for ipv4
    a5d7ce086fe9 atm: idt77252: fix use-after-free bugs caused by tst_timer
    75b810104e40 xen/xenbus: fix return type in xenbus_file_read()
    d98b50d5b72d nfp: ethtool: fix the display error of `ethtool -m DEVNAME`
    5c21186c5f3a NTB: ntb_tool: uninitialized heap data in tool_fn_write()
    cffd1cefcdd7 tools build: Switch to new openssl API for test-libcrypto
    86ff5446b4da kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    f546faa216d0 ceph: don't leak snap_rwsem in handle_cap_grant
    3e7ee4dd1ea4 tools/vm/slabinfo: use alphabetic order when two values are equal
    d27e1834dee2 ceph: use correct index when encoding client supported features
    e49c17867c61 spi: dt-bindings: zynqmp-qspi: add missing 'required'
    b847ea541b1f spi: dt-bindings: cadence: add missing 'required'
    506fc3cab986 dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
    4e96aa5b46d4 dt-bindings: arm: qcom: fix MSM8994 boards compatibles
    5aa6548c0803 dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
    e7a0e9ee5b12 dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
    3632c642cacc dt-bindings: gpio: zynq: Add missing compatible strings
    52d8f48f85f7 vsock: Set socket state back to SS_UNCONNECTED in vsock_connect_timeout()
    e4c0428f8a6f vsock: Fix memory leak in vsock_connect()
    38b2ab9adf50 plip: avoid rcu debug splat
    133a08a3093b ipv6: do not use RT_TOS for IPv6 flowlabel
    5c9e5c44f89d mlx5: do not use RT_TOS for IPv6 flowlabel
    02b2b7372727 geneve: do not use RT_TOS for IPv6 flowlabel
    f150c1f84775 ACPI: property: Return type of acpi_add_nondev_subnodes() should be bool
    06337b9c255d octeontx2-af: Fix key checking for source mac
    dc5be2d4f928 octeontx2-af: Fix mcam entry resource leak
    f9a36fa5367e octeontx2-af: suppress external profile loading warning
    e0fe6aa19a80 octeontx2-af: Apply tx nibble fixup always
    17c3ea739979 octeontx2-pf: Fix NIX_AF_TL3_TL2X_LINKX_CFG register configuration
    0a02159ae636 Input: exc3000 - fix return value check of wait_for_completion_timeout
    a4a945641aca pinctrl: qcom: sm8250: Fix PDC map
    fed2247253dc pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
    be82dc052155 pinctrl: amd: Don't save/restore interrupt status and wake status bits
    c1c7a7c950e6 pinctrl: qcom: msm8916: Allow CAMSS GP clocks to be muxed
    9272265f2f76 pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
    79eb8e9e38f3 dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
    8b7bf35d301d selftests: forwarding: Fix failing tests with old libnet
    c506c9a97120 net: bgmac: Fix a BUG triggered by wrong bytes_compl
    eb2d9dc79f5f net: bcmgenet: Indicate MAC is in charge of PHY PM
    47ac7b2f6a1f net: phy: Warn about incorrect mdio_bus_phy_resume() state
    c4d09fd1e18b devlink: Fix use-after-free after a failed reload
    d3723eab1119 virtio_net: fix memory leak inside XPD_TX with mergeable
    9721e238c24c SUNRPC: Reinitialise the backchannel request buffers before reuse
    d3c262f584df SUNRPC: Fix xdr_encode_bool()
    63e921d4edb3 sunrpc: fix expiry of auth creds
    3f16630fa23b m68k: coldfire/device.c: protect FLEXCAN blocks
    422a02a77159 net: atlantic: fix aq_vec index out of range error
    98dc8fb08299 can: j1939: j1939_session_destroy(): fix memory leak of skbs
    890aba507802 can: mcp251x: Fix race condition on receive interrupt
    6648647599e0 bpf: Check the validity of max_rdwr_access for sock local storage map iterator
    03ca12e583f1 bpf: Acquire map uref in .init_seq_private for sock{map,hash} iterator
    e51b568ea2c8 bpf: Acquire map uref in .init_seq_private for sock local storage map iterator
    2f56304a0cf9 bpf: Acquire map uref in .init_seq_private for hash map iterator
    370805f0e72b bpf: Acquire map uref in .init_seq_private for array map iterator
    18a994e0661c bpf: Don't reinit map value in prealloc_lru_pop
    41fd6cc88aaf BPF: Fix potential bad pointer dereference in bpf_sys_bpf()
    a4cf3dadd1fa NFSv4/pnfs: Fix a use-after-free bug in open
    1e9fd95c27d8 NFSv4.1: RECLAIM_COMPLETE must handle EACCES
    281c6a47416b NFSv4: Fix races in the legacy idmapper upcall
    b32780cda567 NFSv4.1: Handle NFS4ERR_DELAY replies to OP_SEQUENCE correctly
    0696115a3230 NFSv4.1: Don't decrease the value of seq_nr_highest_sent
    6aea903916c1 Documentation: ACPI: EINJ: Fix obsolete example
    bf7ebebce2c2 apparmor: Fix memleak in aa_simple_write_to_buffer()
    64103ea35773 apparmor: fix reference count leak in aa_pivotroot()
    c62f2f56e086 apparmor: fix overlapping attachment computation
    e89b95f91e63 apparmor: fix setting unconfined mode on a loaded profile
    3104c8a0dc5f apparmor: fix aa_label_asxprint return check
    a683a0d87a22 apparmor: Fix failed mount permission check error message
    31b35b689123 apparmor: fix absroot causing audited secids to begin with =
    017b0ea49262 apparmor: fix quiet_denied for file rules
    8bc5ed70ef58 can: ems_usb: fix clang's -Wunaligned-access warning
    43ae96645898 dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be optional
    2294f43a07ea ALSA: usb-audio: More comprehensive mixer map for ASUS ROG Zenith II
    2fb8f62ee335 tracing: Have filter accept "common_cpu" to be consistent
    dac2b60345ef tracing/probes: Have kprobes and uprobes use $COMM too
    b489aca082a2 tracing/eprobes: Have event probes be consistent with kprobes and uprobes
    a11ce7bfbdb7 tracing/eprobes: Do not hardcode $comm as a string
    ba53c21ce977 tracing/eprobes: Do not allow eprobes to use $stack, or % for regs
    0d7970e8702b tracing/perf: Fix double put of trace event when init fails
    14674e47ff49 x86/kprobes: Fix JNG/JNLE emulation
    860efae12788 cifs: Fix memory leak on the deferred close
    6379a9af7cfc btrfs: fix lost error handling when looking up extended ref on log replay
    7ac430e319e9 btrfs: reset RO counter on block group if we fail to relocate
    78f8c2370e3d btrfs: unset reloc control if transaction commit fails in prepare_to_relocate()
    d8fc9df94b88 mmc: meson-gx: Fix an error handling path in meson_mmc_probe()
    6c4541d6b881 mmc: pxamci: Fix an error handling path in pxamci_probe()
    8b7ed38c38e1 mmc: pxamci: Fix another error handling path in pxamci_probe()
    23179d5b7c39 ata: libata-eh: Add missing command name
    82a27c185544 drm/amd/display: Check correct bounds for stream encoder instances for DCN303
    76672cd326c1 drm/ttm: Fix dummy res NULL ptr deref bug
    016b71479f46 drm/nouveau: recognise GA103
    1b7e0482abd0 locking/atomic: Make test_and_*_bit() ordered on failure
    852f6a784a4b rds: add missing barrier to release_refill
    d26beb910904 x86/mm: Use proper mask when setting PUD mapping
    177bf3542009 KVM: Unconditionally get a ref to /dev/kvm module when creating a VM
    e9a6a3bd97c7 ALSA: hda/realtek: Add quirk for Clevo NS50PU, NS70PU
    5d396df4631a ALSA: info: Fix llseek return value when using callback

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9e37494a4b..491ad581eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cb561ee4438e5961e5c471eee8094737ca873135"
-SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
+SRCREV_machine ?= "bd0d026c3b3f16f17e7cce662d0f3445bf2e0ff3"
+SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.62"
+LINUX_VERSION ?= "5.15.63"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2de32ffecd..daa9a5da1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.62"
+LINUX_VERSION ?= "5.15.63"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b708cb8412758a382516bdc46f26a0b43c50fb82"
-SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
+SRCREV_machine ?= "8c746c932d6fea7adb9ca3cb26e0ada2bc07692d"
+SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 40c430aee3..ad5998f9b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9b096ff3914926ac68501bf156c2d1368f3ebe6c"
-SRCREV_machine:qemuarm64 ?= "7cb30c5e95067ad12b7c4d371c048c7f5d5c922c"
-SRCREV_machine:qemumips ?= "3210fe826ade54d891cf2120c964d2a0dc3e7393"
-SRCREV_machine:qemuppc ?= "7bfdc3608327b9c471008af370dbffe053f5bed9"
-SRCREV_machine:qemuriscv64 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
-SRCREV_machine:qemuriscv32 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
-SRCREV_machine:qemux86 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
-SRCREV_machine:qemux86-64 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
-SRCREV_machine:qemumips64 ?= "ef125626d718771f11fab19a3f91cca5ec27f887"
-SRCREV_machine ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
-SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
+SRCREV_machine:qemuarm ?= "56410660d15b6bb785a6569bfbb6bdd2de3fd490"
+SRCREV_machine:qemuarm64 ?= "495078c5c3b85396123957716d27e3c6e76e55bc"
+SRCREV_machine:qemumips ?= "91cbf6ccca019d98f15fa742c0ee043f82023499"
+SRCREV_machine:qemuppc ?= "8a5e533a94fe71a62ba5149ba8e9600992178715"
+SRCREV_machine:qemuriscv64 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
+SRCREV_machine:qemuriscv32 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
+SRCREV_machine:qemux86 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
+SRCREV_machine:qemux86-64 ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
+SRCREV_machine:qemumips64 ?= "06a0a76ce428c1d13a680dd9a58dc123714d164c"
+SRCREV_machine ?= "5b83bd12dfbee299506e0c39aea3343f47a6f8c7"
+SRCREV_meta ?= "8fa8d5e477034473ed7532fe20006b5f2bc87aa0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a0a7e0b2b8b22901945ea2aef1b65871d718accf"
+SRCREV_machine:class-devupstream ?= "addc9003c2e895fe8a068a66de1de6fdb4c6ac60"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.62"
+LINUX_VERSION ?= "5.15.63"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


