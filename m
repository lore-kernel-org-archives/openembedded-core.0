Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6778C6FA91
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.20365.1663597722951479320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QKy9Qj6a;
 spf=pass (domain: gmail.com, ip: 209.85.160.196,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id w2so17057429qtv.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4+T1Zro7okz3dyaRWUW/C9dGS//7kewt0V9L1nBWii0=;
        b=QKy9Qj6aozj1LMhB/8esnGfFjUTiM791oAw4/hqUr3JowrkJfaBH8/lOKGmE8Yb+77
         eC1Zpe1UNlg+OUEc58drvM6rYKwIErsEMSMi6vLHhmGnf1ov3n1rydVi0ziJhG52D3Vf
         Rd6OOs7mvfVxrpS7d6LazoLH3LaMxxBsR3PFb/wPWeC1CqxGUFf35xyv0fcgszDRAD0I
         NsdFk892gahNYI5s/cfeHMN6Jg70T+OjMgvqf5maQd6jj+mAHjG4BKRyIhmNtqoidvBE
         ebiVjw+r8IxAH66JbLa9hoXXFK21a8x9jIUFDNTeFQUTc3CyqOmsAJGGL3oajPpOnoTx
         Qlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4+T1Zro7okz3dyaRWUW/C9dGS//7kewt0V9L1nBWii0=;
        b=d8llzMB28ZZXC/BFM6tzrjpYTmiFETpQMxbLBqqQ96d9tE69pbLzwMt4kYVAPfzI27
         fI0qiOBzJUJo4nOyJEoOF4b+aCzQlaimOjyFhT4LCnGgIiGxvchbJ7xygwW4av1LEgp8
         Dm9LLA6nHY9Qv5KPQrdMfBok6D4I7fIkEGVVWyoADTyVIGnA03NcrxVMCFA43gFN9bUp
         HW6740RSeST9V2iJwR59GSu+2rhXtRJuMOvYW8hKzmPMBGHut/AMekTJ2KK8cPWAoxFd
         hOMXMFeOyDpt6aWvlMHfwqlT7QVKsTmazYRnaT1Hx8HNwd/NsEE1152mIBa22h9DEPYs
         0mCw==
X-Gm-Message-State: ACrzQf3ESVR8HYtB3mzJTcM+8j0rpnHzay3L3cJgE2csbioNHrkOtzPI
	kU4EjfGen3WC2JpluJDZ9axy057Q8ao=
X-Google-Smtp-Source: 
 AMsMyM6UZ9u+b8bqna4cn8ttSTKXFIc74r5ApqM06DQNbRPjYAzjilYmuqUnGUFTIfTKlO6Yf8AV3A==
X-Received: by 2002:a05:622a:13c7:b0:35b:ba86:17b1 with SMTP id
 p7-20020a05622a13c700b0035bba8617b1mr15146682qtk.33.1663597721640;
        Mon, 19 Sep 2022 07:28:41 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/5.19: update to v5.19.5
Date: Mon, 19 Sep 2022 10:28:27 -0400
Message-Id: 
 <8dd8b65d2c0697a6b7475143f05491fd66aa2d5f.1663597409.git.bruce.ashfield@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170865

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    1916ff079c77 Linux 5.19.5
    d98703d4ce01 kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    0b0649b1d27a Linux 5.19.4
    c19305ce5228 Revert "ALSA: hda: Fix page fault in snd_hda_codec_shutdown()"
    127e3bb0dae1 scsi: ufs: ufs-mediatek: Fix build error and type mismatch
    7000ad53ec1b f2fs: fix null-ptr-deref in f2fs_get_dnode_of_data
    ceb6e2e0ef30 f2fs: revive F2FS_IOC_ABORT_VOLATILE_WRITE
    a050bbba5e11 MIPS: tlbex: Explicitly compare _PAGE_NO_EXEC against 0
    f350812e2d15 video: fbdev: i740fb: Check the argument of i740_calc_vclk()
    8d4eccd78461 venus: pm_helpers: Fix warning in OPP during probe
    8f9357313cdc powerpc/64: Init jump labels before parse_early_param()
    6a77b03098b1 smb3: check xattr value length earlier
    14128541cf81 f2fs: fix to do sanity check on segment type in build_sit_entries()
    43ce0a0bda2c f2fs: fix to avoid use f2fs_bug_on() in f2fs_new_node_page()
    a2555ea40e38 ALSA: control: Use deferred fasync helper
    fe87784ab3a8 ALSA: pcm: Use deferred fasync helper
    2dffd9478f76 ALSA: timer: Use deferred fasync helper
    2e1a19a391d0 ALSA: core: Add async signal helpers
    fb952a7683ae powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
    ea64c14beb0f ovl: warn if trusted xattr creation fails
    1c5be8157340 ASoC: codecs: va-macro: use fsgen as clock
    8044f035b0c7 powerpc/32: Don't always pass -mcpu=powerpc to the compiler
    f0919caa1639 powerpc/32: Set an IBAT covering up to _einittext during init
    c2f242d95875 powerpc/pseries/mobility: set NMI watchdog factor during an LPM
    d1bac78a8c18 powerpc/watchdog: introduce a NMI watchdog's factor
    409135fdaca6 watchdog: export lockup_detector_reconfigure
    ce60aca6f7aa ASoC: Intel: sof_nau8825: Move quirk check to the front in late probe
    abed2fd437f0 ASoC: Intel: sof_es8336: ignore GpioInt when looking for speaker/headset GPIO lines
    73626a23b370 ASoC: Intel: sof_es8336: Fix GPIO quirks set via module option
    728ba1b70fb6 ASoC: SOF: Intel: hda: add sanity check on SSP index reported by NHLT
    2b7d0c2a4fba ALSA: hda/realtek: Enable speaker and mute LEDs for HP laptops
    d79c34048804 RISC-V: Add fast call path of crash_kexec()
    f41d0c601081 riscv: mmap with PROT_WRITE but no PROT_READ is invalid
    2fef71da84f5 ASoC: nau8821: Don't unconditionally free interrupt
    a57f15f876f3 riscv: dts: canaan: Add k210 topology information
    beb779e43398 riscv: dts: sifive: Add fu740 topology information
    a1ab94899083 ASoC: rsnd: care default case on rsnd_ssiu_busif_err_irq_ctrl()
    7218511f0a31 ASoC: SOF: sof-client-probes: Only load the driver if IPC3 is used
    48945246cf80 ASoC: SOF: Intel: hda-ipc: Do not process IPC reply before firmware boot
    230f646085d1 ASoC: SOF: Intel: cnl: Do not process IPC reply before firmware boot
    62c8639072ae modules: Ensure natural alignment for .altinstructions and __bug_table sections
    e02db5c2c2ee ALSA: hda: Fix page fault in snd_hda_codec_shutdown()
    6a0105e779e3 ASoC: Intel: avs: Set max DMA segment size
    b4f50e13d7ea iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
    a80016c40cc7 mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
    a7a4866734de vfio: Clear the caps->buf to NULL after free
    6f61c957050d KVM: PPC: Book3S HV: Fix "rm_exit" entry in debugfs timings
    f6ed634eedb1 tty: serial: Fix refcount leak bug in ucc_uart.c
    6f531f0c5c7f lib/list_debug.c: Detect uninitialized lists
    0082e99a9074 ext4: avoid resizing to a partial cluster size
    a2522041d248 ext4: block range must be validated before use in ext4_mb_clear_bb()
    baa9f14ff470 ext4: avoid remove directory when directory is corrupted
    eb3a4f73f43f drivers:md:fix a potential use-after-free bug
    22d908afbd76 nvmet-tcp: fix lockdep complaint on nvmet_tcp_wq flush during queue teardown
    0fce640d81e2 md/raid5: Make logic blocking check consistent with logic that blocks
    2a320a192cae md: Notify sysfs sync_completed in md_reap_sync_thread()
    51854ee9535c phy: samsung: phy-exynos-pcie: sanitize init/power_on callbacks
    55faab828d23 openrisc: io: Define iounmap argument as volatile
    e004a35e8148 Revert "RDMA/rxe: Create duplicate mapping tables for FMRs"
    aa6e96cb2165 dmaengine: sprd: Cleanup in .remove() after pm_runtime_get_sync() failed
    32a979841d79 dmaengine: tegra: Add terminate() for Tegra234
    59e659594420 selftests/kprobe: Do not test for GRP/ without event failures
    e0cd4d17ce33 csky/kprobe: reclaim insn_slot on kprobe unregistration
    0a5e36832ffd RDMA/rxe: Limit the number of calls to each tasklet
    f03d253ba719 ACPI: PPTT: Leave the table mapped for the runtime usage
    a28c93fd39ad mmc: renesas_sdhi: newer SoCs don't need manual tap correction
    3d05aeebbde8 dmaengine: dw-axi-dmac: ignore interrupt if no descriptor
    ad764df73ae5 dmaengine: dw-axi-dmac: do not print NULL LLI during error
    30b2f5fc6482 of: overlay: Move devicetree_corrupt() check up
    462f8d4cbc96 um: add "noreboot" command line option for PANIC_TIMEOUT=-1 setups
    5fecb67738e6 PCI/ACPI: Guard ARM64-specific mcfg_quirks
    c2557780ee78 cxl: Fix a memory leak in an error handling path
    300ae4fd800b pinctrl: intel: Check against matching data instead of ACPI companion
    15670c28103d scsi: ufs: ufs-exynos: Change ufs phy control sequence
    ef577017cdcc mmc: tmio: avoid glitches when resetting
    325da44d085e habanalabs/gaudi: mask constant value before cast
    19958bf4ef31 habanalabs/gaudi: fix shift out of bounds
    6a4aa11781f5 habanalabs/gaudi: invoke device reset from one code block
    fb806b52acb0 habanalabs: add terminating NULL to attrs arrays
    c209db797d64 coresight: etm4x: avoid build failure with unrolled loops
    2b06d5d97c0e gadgetfs: ep_io - wait until IRQ finishes
    4eb7a1beff03 scsi: lpfc: Fix possible memory leak when failing to issue CMF WQE
    2d544e9d19c1 scsi: lpfc: Prevent buffer overflow crashes in debugfs with malformed user input
    92f837825053 clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
    a8b7e9534550 zram: do not lookup algorithm in backends table
    842a89d91a94 uacce: Handle parent device removal or parent driver module rmmod
    459411b9f018 clk: qcom: ipq8074: dont disable gcc_sleep_clk_src
    e5cd88146e79 vboxguest: Do not use devm for irq
    9f69ec6766aa usb: dwc2: gadget: remove D+ pull-up while no vbus with usb-role-switch
    0483ffc02ebb scsi: iscsi: Fix HW conn removal use after free
    5c4b699193eb usb: renesas: Fix refcount leak bug
    403132881e66 usb: host: ohci-ppc-of: Fix refcount leak bug
    4bd8b3b68a7b usb: typec: mux: Add CONFIG guards for functions
    e6a1adbf1f2b scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
    67c830a6de83 clk: ti: Stop using legacy clkctrl names for omap4 and 5
    588e52fbc36d drm/meson: Fix overflow implicit truncation warnings
    74edc1e11ef3 irqchip/tegra: Fix overflow implicit truncation warnings
    f6ad16176b70 scsi: ufs: core: Add UFSHCD_QUIRK_HIBERN_FASTAUTO
    99c6d37aeffa scsi: ufs: core: Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
    db0c485f4ac2 PCI: aardvark: Fix reporting Slot capabilities on emulated bridge
    8ec370e0a50f usb: gadget: uvc: call uvc uvcg_warn on completed status instead of uvcg_info
    c2d17078980a usb: gadget: uvc: calculate the number of request depending on framesize
    6fd50446e7c9 usb: cdns3 fix use-after-free at workaround 2
    2700f6072f22 staging: r8188eu: add error handling of rtw_read32
    93883ec2d6aa staging: r8188eu: add error handling of rtw_read16
    eac7d9f47ad4 staging: r8188eu: add error handling of rtw_read8
    582b3175deea platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
    ba397e2c31da PCI: Add ACS quirk for Broadcom BCM5750x NICs
    ccb19dba9ded HID: multitouch: new device class fix Lenovo X12 trackpad sticky
    2d419ac1f333 thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir mode
    f5b5faedc498 x86/kvm: Fix "missing ENDBR" BUG for fastop functions
    fe5a22a2925a x86/ibt, objtool: Add IBT_NOSEAL()
    e124bab08a51 net: mscc: ocelot: report ndo_get_stats64 from the wraparound-resistant ocelot->stats
    e07a74dc0fed net: mscc: ocelot: make struct ocelot_stat_layout array indexable
    3aa635bf2f8f net: mscc: ocelot: fix race between ndo_get_stats64 and ocelot_check_stats_work
    0d05a558033e net: mscc: ocelot: turn stats_lock into a spinlock
    62ef55aa4381 KVM: arm64: Reject 32bit user PSTATE on asymmetric systems
    e4a36b051ca7 KVM: arm64: Treat PMCR_EL1.LC as RES1 on asymmetric systems
    1b38e3b423f0 drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex
    fb837f5b8346 drm/sun4i: dsi: Prevent underflow when computing packet sizes
    3e53531c1813 drm/bridge: lvds-codec: Fix error checking of drm_of_lvds_get_data_mapping()
    efd4b62d109f drm/amdgpu: Avoid another list of reset devices
    b431cffb4883 drm/i915/ttm: don't leak the ccs state
    8dec38e19f69 drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
    02a22d62051a drm/imx/dcss: get rid of HPD warning message
    a5494b6ed31b can: j1939: j1939_sk_queue_activate_next_locked(): replace WARN_ON_ONCE with netdev_warn_once()
    5ba9bafa2ce0 gcc-plugins: Undefine LATENT_ENTROPY_PLUGIN when plugin disabled for a file
    6c61b45ecee9 kbuild: fix the modules order between drivers and libs
    64c0c233a885 igb: Add lock to avoid data race
    9400aeb419d3 stmmac: intel: Add a missing clk_disable_unprepare() call in intel_eth_pci_remove()
    994c8f12be24 dt-bindings: display: sun4i: Add D1 TCONs to conditionals
    330eccd73fc0 fec: Fix timer capture timing in `fec_ptp_enable_pps()`
    b72e5b045746 tools/rtla: Fix command symlinks
    5d4dc30b4c96 blk-mq: run queue no matter whether the request is the last request
    7c9ebb648cde i40e: Fix to stop tx_timeout recovery if GLOBR fails
    56ba4d6853ec regulator: pca9450: Remove restrictions for regulator-name
    15ccc6fa8153 i40e: Fix tunnel checksum offload with fragmented traffic
    6bce25a155b2 i2c: imx: Make sure to unregister adapter on remove()
    5fc790e349ad modpost: fix module versioning when a symbol lacks valid CRC
    0e933ded5079 ice: Ignore error message when setting same promiscuous mode
    bc6770eb90ff ice: Fix clearing of promisc mode with bridge over bond
    26fce11f927c ice: Ignore EEXIST when setting promisc mode
    6db6964e33a3 ice: Fix double VLAN error when entering promisc mode
    d46c877935e4 ice: Fix VF not able to send tagged traffic with no VLAN filters
    af1b0d1547dd ice: Fix call trace with null VSI during VF reset
    18c800b1844d ice: Fix VSI rebuild WARN_ON check for VF
    79f86b862416 net: dsa: sja1105: fix buffer overflow in sja1105_setup_devlink_regions()
    7e2bb2db0dd8 net: dsa: don't warn in dsa_port_set_state_now() when driver doesn't support it
    26b6acd36582 net: genl: fix error path memory leak in policy dumping
    636f5ac8cb27 net: mscc: ocelot: fix address of SYS_COUNT_TX_AGING counter
    89caf1cf7a01 net: mscc: ocelot: fix incorrect ndo_get_stats64 packet counters
    d0faa1d50d3d net: dsa: felix: fix ethtool 256-511 and 512-1023 TX packet counters
    b7d1edd299d9 net: dsa: microchip: ksz9477: fix fdb_dump last invalid entry
    cd3c02963b7e net: sched: fix misuse of qcpu->backlog in gnet_stats_add_queue_cpu
    ce12ce2e8864 net: rtnetlink: fix module reference count leak issue in rtnetlink_rcv_msg
    7998043d31d0 net: fix potential refcount leak in ndisc_router_discovery()
    ec6612958fc8 net: moxa: pass pdev instead of ndev to DMA functions
    df5423131456 mlxsw: spectrum: Clear PTP configuration after unregistering the netdevice
    bb0422d00a2a virtio_net: fix endian-ness for RSS
    a1a75f78a293 net: qrtr: start MHI channel after endpoit creation
    f3a4b5582961 net: dsa: mv88e6060: prevent crash on an unused port
    76fbeb1662b1 net/sunrpc: fix potential memory leaks in rpc_sysfs_xprt_state_change()
    181c691581d0 spi: meson-spicc: add local pow2 clock ops to preserve rate between messages
    90f195c01a2e powerpc/pci: Fix get_phb_number() locking
    05414b8644e0 netfilter: nf_tables: check NFT_SET_CONCAT flag if field_count is specified
    a6232edba59e netfilter: nf_tables: disallow NFT_SET_ELEM_CATCHALL and NFT_SET_ELEM_INTERVAL_END
    ad48276cd5b4 netfilter: nf_tables: NFTA_SET_ELEM_KEY_END requires concat and interval flags
    3ccd3c8a0384 netfilter: nf_tables: validate NFTA_SET_ELEM_OBJREF based on NFT_SET_OBJECT flag
    f4fbfbccc0a9 netfilter: nf_tables: fix scheduling-while-atomic splat
    822943b48f0f netfilter: nf_tables: really skip inactive sets when allocating name
    1e52e6cfec63 netfilter: nf_tables: possible module reference underflow in error path
    4fe99df73467 netfilter: nf_ct_irc: cap packet search space to 4k
    61705b872f3c netfilter: nf_ct_ftp: prefer skb_linearize
    08147d81e88b netfilter: nf_ct_h323: cap packet size at 64k
    44cc2be58b87 netfilter: nf_ct_sane: remove pseudo skb linearization
    8f4882fa0ed3 netfilter: nf_tables: disallow NFTA_SET_ELEM_KEY_END with NFT_SET_ELEM_INTERVAL_END flag
    78c5b279e1fc fs/ntfs3: uninitialized variable in ntfs_set_acl_ex()
    e5aff1b8cf9f netfilter: nf_tables: use READ_ONCE and WRITE_ONCE for shared generation id access
    19c942f7d2af netfilter: nfnetlink: re-enable conntrack expectation events
    211c7bb7ee46 RDMA/cxgb4: fix accept failure due to increased cpl_t5_pass_accept_rpl size
    2e88dc32f66b RDMA/mlx5: Use the proper number of ports
    7cc625c5632f IB/iser: Fix login with authentication
    069b05cc3eec ASoC: codec: tlv320aic32x4: fix mono playback via I2S
    f8c579901388 ASoC: tas2770: Fix handling of mute/unmute
    c02a92a57733 ASoC: tas2770: Drop conflicting set_bias_level power setting
    9fc6cac273a2 ASoC: tas2770: Allow mono streams
    e755dc032d11 ASoC: tas2770: Set correct FSYNC polarity
    6a840e8ef6b6 ASoC: DPCM: Don't pick up BE without substream
    f7915c5614a7 ASoC: SOF: Intel: hda: Fix potential buffer overflow by snprintf()
    a67971a17604 ASoC: SOF: debug: Fix potential buffer overflow by snprintf()
    840311a09f75 ASoC: Intel: avs: Fix potential buffer overflow by snprintf()
    94e45c0cd8fd iavf: Fix deadlock in initialization
    0828e27971f1 iavf: Fix reset error handling
    b305c7e9363f iavf: Fix NULL pointer dereference in iavf_get_link_ksettings
    35c63581fdef iavf: Fix adminq error handling
    65f8463017ec nios2: add force_successful_syscall_return()
    e79673500d7b nios2: restarts apply only to the first sigframe we build...
    857b2561aae8 nios2: fix syscall restart checks
    66a496c6d784 nios2: traced syscall does need to check the syscall number
    6e489481f5db nios2: don't leave NULLs in sys_call_table[]
    69f5278fba36 nios2: page fault et.al. are *not* restartable syscalls...
    8089a1bc27b4 fs/ntfs3: Fix missing i_op in ntfs_read_mft
    228be1f6986e fs/ntfs3: Do not change mode if ntfs_set_ea failed
    0fd64f062c8d fs/ntfs3: Fix double free on remount
    4209b285adb8 fs/ntfs3: Don't clear upper bits accidentally in log_replay()
    bf6089dc01ba fs/ntfs3: Fix NULL deref in ntfs_update_mftmirr
    2d6663d0de7b fs/ntfs3: Fix using uninitialized value n when calling indx_read
    174e6c2d0898 dpaa2-eth: trace the allocated address instead of page struct
    e8471a8848bb perf tests: Fix Track with sched_switch test for hybrid case
    129fe9d509f8 perf parse-events: Fix segfault when event parser gets an error
    8f89e5c8daf8 i2c: qcom-geni: Fix GPI DMA buffer sync-back
    7dfea65b004f perf probe: Fix an error handling path in 'parse_perf_probe_command()'
    ec82f4a9bd3a nvme-fc: fix the fc_appid_store return value
    14e379559747 geneve: fix TOS inheriting for ipv4
    7a369dc87b66 fscache: don't leak cookie access refs if invalidation is in progress or failed
    af412b252550 atm: idt77252: fix use-after-free bugs caused by tst_timer
    a32429e10a94 tsnep: Fix tsnep_tx_unmap() error path usage
    970999be4cf3 xen/xenbus: fix return type in xenbus_file_read()
    dc2f4da09ba0 nfp: ethtool: fix the display error of `ethtool -m DEVNAME`
    776efefcaf80 NTB: ntb_tool: uninitialized heap data in tool_fn_write()
    8f60a0e33d31 tools build: Switch to new openssl API for test-libcrypto
    d7e676b7dc6a kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
    f1347e13865a tools/testing/cxl: Fix cxl_hdm_decode_init() calling convention
    a291c7d289fa vdpa_sim_blk: set number of address spaces and virtqueue groups
    6d5428b2940d vdpa_sim: use max_iotlb_entries as a limit in vhost_iotlb_init
    358781831c10 clk: imx93: Correct the edma1's parent clock
    a090cc69699e ceph: don't leak snap_rwsem in handle_cap_grant
    279b52d7541c tools/vm/slabinfo: use alphabetic order when two values are equal
    14d9cf9852f8 tools/testing/cxl: Fix decoder default state
    52f636e1904c ceph: use correct index when encoding client supported features
    c969b0537dac spi: dt-bindings: qcom,spi-geni-qcom: allow three interconnects
    3be10a1426b0 dt-bindings: opp: opp-v2-kryo-cpu: Fix example binding checks
    f32e6d5c94ad spi: dt-bindings: zynqmp-qspi: add missing 'required'
    5ec9bbdd28b5 spi: dt-bindings: cadence: add missing 'required'
    50416c20c243 dt-bindings: PCI: qcom: Fix reset conditional
    e0513e565f70 dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
    5476edddbb50 dt-bindings: arm: qcom: fix MSM8994 boards compatibles
    23c3019a432c dt-bindings: arm: qcom: fix MSM8916 MTP compatibles
    0a33e50a1478 dt-bindings: arm: qcom: fix Longcheer L8150 compatibles
    7950545bbf1d dt-bindings: gpio: zynq: Add missing compatible strings
    6401143e6800 vsock: Set socket state back to SS_UNCONNECTED in vsock_connect_timeout()
    8ff5db3c1b3d vsock: Fix memory leak in vsock_connect()
    c3ea09259eb2 plip: avoid rcu debug splat
    8f427e275cd5 ipv6: do not use RT_TOS for IPv6 flowlabel
    923c65b5adf9 mlx5: do not use RT_TOS for IPv6 flowlabel
    1fa0d54bd693 vxlan: do not use RT_TOS for IPv6 flowlabel
    13904ed832a9 geneve: do not use RT_TOS for IPv6 flowlabel
    29fea5c51a5c ACPI: property: Return type of acpi_add_nondev_subnodes() should be bool
    c8af1ddc42a7 octeontx2-af: Fix key checking for source mac
    cc32347f4811 octeontx2-af: Fix mcam entry resource leak
    df1c025e3834 octeontx2-af: suppress external profile loading warning
    c28ff6c14449 octeontx2-af: Apply tx nibble fixup always
    a7fdd85eef55 octeontx2-pf: Fix NIX_AF_TL3_TL2X_LINKX_CFG register configuration
    342682efc690 dt-bindings: input: iqs7222: Extend slider-mapped GPIO to IQS7222C
    94683976b16c dt-bindings: input: iqs7222: Correct bottom speed step size
    90857411e91e dt-bindings: input: iqs7222: Remove support for RF filter
    179331884af6 Input: iqs7222 - remove support for RF filter
    5384b932e259 Input: iqs7222 - handle reset during ATI
    2aa156cbc4bd Input: iqs7222 - acknowledge reset before writing registers
    7d45f72dcb76 Input: iqs7222 - protect volatile registers
    4d5f2539375f Input: iqs7222 - fortify slider event reporting
    aa7ab02564ba Input: iqs7222 - correct slider event disable logic
    a1e2d6c849c1 Input: mt6779-keypad - match hardware matrix organization
    478b58ac0bb0 Input: exc3000 - fix return value check of wait_for_completion_timeout
    d35d9269dd0e rtc: spear: set range max
    51f58c8042c7 pinctrl: qcom: sm8250: Fix PDC map
    80a98362e6c6 dt-bindings: pinctrl: mt8186: Add and use drive-strength-microamp
    1c408081ff68 pinctrl: sunxi: Add I/O bias setting for H6 R-PIO
    ec63eefb7ca8 dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp
    f87b8f577d47 dt-bindings: pinctrl: mt8195: Fix name for mediatek,rsel-resistance-in-si-unit
    4d8e2fa66adb pinctrl: amd: Don't save/restore interrupt status and wake status bits
    72400a60f6d3 pinctrl: qcom: msm8916: Allow CAMSS GP clocks to be muxed
    587ac8ac00a1 pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
    cc4ac4cc41d1 dt-bindings: pinctrl: mt8192: Use generic bias instead of pull-*-adv
    ada8cbf7d50a dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
    0869aab075e8 pinctrl: renesas: rzg2l: Return -EINVAL for pins which have input disabled
    4a202e4d71d1 dt-bindings: arm: qcom: fix Alcatel OneTouch Idol 3 compatibles
    4ec24eef9325 selftests: forwarding: Fix failing tests with old libnet
    054233aa9f05 net: atm: bring back zatm uAPI
    da1421a29d3b net: bgmac: Fix a BUG triggered by wrong bytes_compl
    8e432f157c3e net: dsa: felix: suppress non-changes to the tagging protocol
    0bae8f44d88e net: phy: c45 baset1: do not skip aneg configuration if clock role is not specified
    3837c9b318d0 net: bcmgenet: Indicate MAC is in charge of PHY PM
    7dc0ed411de3 net: phy: Warn about incorrect mdio_bus_phy_resume() state
    26bef5616255 devlink: Fix use-after-free after a failed reload
    2b54e14535bc virtio-blk: Avoid use-after-free on suspend/resume
    18e383afbd70 virtio_net: fix memory leak inside XPD_TX with mergeable
    3718ea043945 virtio: VIRTIO_HARDEN_NOTIFICATION is broken
    5a6221c44181 ASoC: qdsp6: q6apm-dai: unprepare stream if its already prepared
    08c6c65891d8 SUNRPC: Don't reuse bvec on retransmission of the request
    7116a23f3d75 SUNRPC: Reinitialise the backchannel request buffers before reuse
    ed1e2e39f083 SUNRPC: Fix xdr_encode_bool()
    99cdd380b812 sunrpc: fix expiry of auth creds
    d9da937bbe70 m68k: coldfire/device.c: protect FLEXCAN blocks
    23bf15547653 net: atlantic: fix aq_vec index out of range error
    a0278dbeaaf7 can: j1939: j1939_session_destroy(): fix memory leak of skbs
    dad7f33c95e1 can: mcp251x: Fix race condition on receive interrupt
    595fce48524e bpf: Check the validity of max_rdwr_access for sock local storage map iterator
    153a74518c0d bpf: Acquire map uref in .init_seq_private for sock{map,hash} iterator
    be66774a7767 bpf: Acquire map uref in .init_seq_private for sock local storage map iterator
    b6bd5ea6a3d4 bpf: Acquire map uref in .init_seq_private for hash map iterator
    a80118919088 bpf: Acquire map uref in .init_seq_private for array map iterator
    62ec78d96dcb bpf: Don't reinit map value in prealloc_lru_pop
    b429d0b9a7a0 bpf: Disallow bpf programs call prog_run command.
    1f6db7148ed7 BPF: Fix potential bad pointer dereference in bpf_sys_bpf()
    401d71c9cfb0 selftests: mptcp: make sendfile selftest work
    8caf5c15b528 mptcp: do not queue data on closed subflows
    6139039c8fc5 mptcp: move subflow cleanup in mptcp_destroy_common()
    1738a3087605 mptcp, btf: Add struct mptcp_sock definition when CONFIG_MPTCP is disabled
    b03d1117e9be NFSv4/pnfs: Fix a use-after-free bug in open
    2d56bdbffbbb NFSv4.1: RECLAIM_COMPLETE must handle EACCES
    e2d1cdbc8b59 NFSv4: Fix races in the legacy idmapper upcall
    776f95d6cfc1 NFSv4.1: Handle NFS4ERR_DELAY replies to OP_SEQUENCE correctly
    25c4488ba447 NFSv4.1: Don't decrease the value of seq_nr_highest_sent
    dd29648fcf69 net: tap: NULL pointer derefence in dev_parse_header_protocol when skb->dev is null
    da5eec7c6585 netfilter: nf_tables: fix crash when nf_trace is enabled
    e74a1e2a4d83 Documentation: ACPI: EINJ: Fix obsolete example
    6583edbf459d apparmor: Fix memleak in aa_simple_write_to_buffer()
    3ca40ad7afae apparmor: fix reference count leak in aa_pivotroot()
    7a1fffe96355 apparmor: fix overlapping attachment computation
    f91f50b890b1 apparmor: fix setting unconfined mode on a loaded profile
    705bfe4b620e apparmor: fix aa_label_asxprint return check
    78ae04ce32b8 apparmor: Fix failed mount permission check error message
    af665613132c apparmor: fix absroot causing audited secids to begin with =
    a84ad486f3d2 apparmor: fix quiet_denied for file rules
    eca83750658d can: ems_usb: fix clang's -Wunaligned-access warning
    b2301e243028 dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be optional
    b6bf741058c4 ALSA: hda: Fix crash due to jack poll in suspend
    c7f5b9dc9bbe ALSA: usb-audio: More comprehensive mixer map for ASUS ROG Zenith II
    8fe47d647ba9 tracing: Have filter accept "common_cpu" to be consistent
    511c5968711e tracing/probes: Have kprobes and uprobes use $COMM too
    47cc883f21fa tracing/eprobes: Have event probes be consistent with kprobes and uprobes
    df99a48b6b11 tracing/eprobes: Fix reading of string fields
    9f1c65a325fa tracing/eprobes: Do not hardcode $comm as a string
    7c262114a576 tracing/eprobes: Do not allow eprobes to use $stack, or % for regs
    543b4a1dc28f tracing/perf: Fix double put of trace event when init fails
    f624910db300 x86/kprobes: Fix JNG/JNLE emulation
    60b6d38add7b cifs: Fix memory leak on the deferred close
    17c3edc70ff3 drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()
    26d7e3fcf0af drm/i915/gt: Batch TLB invalidations
    99a4dbc0328d drm/i915/gt: Skip TLB invalidations once wedged
    a965f1822eab drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
    2f121b71c263 drm/i915/gt: Ignore TLB invalidations on idle engines
    119ac4818a22 drm/amdgpu: change vram width algorithm for vram_info v3_0
    01d0ea8d3db1 btrfs: fix warning during log replay when bumping inode link count
    1f7e9cfbfbdc btrfs: fix lost error handling when looking up extended ref on log replay
    28546ac03682 btrfs: reset RO counter on block group if we fail to relocate
    5d741afed0ba btrfs: unset reloc control if transaction commit fails in prepare_to_relocate()
    d37c5f24d1c8 mmc: meson-gx: Fix an error handling path in meson_mmc_probe()
    2de2030f37d4 mmc: pxamci: Fix an error handling path in pxamci_probe()
    21d4c35e8dc3 mmc: pxamci: Fix another error handling path in pxamci_probe()
    97f0f52c4ea5 ata: libata-eh: Add missing command name
    ae2e4f9d983e s390/ap: fix crash on older machines based on QCI info missing
    4c31dca17996 drm/amd/display: Check correct bounds for stream encoder instances for DCN303
    2cb62b2f68c8 drm/amdgpu: Only disable prefer_shadow on hawaii
    9bd970d40972 drm/ttm: Fix dummy res NULL ptr deref bug
    7ed00422d72b drm/nouveau: recognise GA103
    1e60eaa88436 locking/atomic: Make test_and_*_bit() ordered on failure
    05d197ff4935 drm/i915/gem: Remove shared locking on freeing objects
    1d04f5d855eb rds: add missing barrier to release_refill
    60bfd51fed8b x86/mm: Use proper mask when setting PUD mapping
    865e08b77c24 KVM: Unconditionally get a ref to /dev/kvm module when creating a VM
    8a1d6aa0de7a RDMA: Handle the return code from dma_resv_wait_timeout() properly
    fb986ecaea46 ALSA: hda/realtek: Add quirk for Clevo NS50PU, NS70PU
    c9c994320d66 ALSA: info: Fix llseek return value when using callback

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index c12bec3e4e..a6f0c41f49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "df2290e83a50563688e5ea0be34e091f1c623069"
-SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
+SRCREV_machine ?= "a950b78ae8d483ec47ff8ec67d7b8b57913ef591"
+SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.3"
+LINUX_VERSION ?= "5.19.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 339f7f69a6..dbe06fca42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.3"
+LINUX_VERSION ?= "5.19.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
+SRCREV_machine ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 0ff28aa952..ffc6518cfc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2cbb2d5097fc44a23da635d2ebbccb33df20a34d"
-SRCREV_machine:qemuarm64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemumips ?= "7741c5b2f536b99815329849cca09799cdb82e62"
-SRCREV_machine:qemuppc ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemuriscv64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemuriscv32 ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemux86 ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemux86-64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_machine:qemumips64 ?= "4ced38bbd45f6cb623728bd755894928a719edac"
-SRCREV_machine ?= "4d933456709d664a55fdda85304c08567265ad4d"
-SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
+SRCREV_machine:qemuarm ?= "b099ff4206267fc928cbaf32b8f5e517589290ca"
+SRCREV_machine:qemuarm64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemumips ?= "4406ca2b5acede33604c50aa512caa2c15a540f2"
+SRCREV_machine:qemuppc ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemuriscv64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemuriscv32 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemux86 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemux86-64 ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_machine:qemumips64 ?= "73d355234ca6a4b7dd2277617c73a26392880544"
+SRCREV_machine ?= "2b8e2d66fbacf6b213220d87659ab9f9adaf86c3"
+SRCREV_meta ?= "2531046e2da0438e704deb8798fc18c6f2799afd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "bf44eed7f2fc9af74eb72f4bc415bdd3d11c4bed"
+SRCREV_machine:class-devupstream ?= "1916ff079c77dc38275493cc18e22fe18532fb0f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.3"
+LINUX_VERSION ?= "5.19.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


