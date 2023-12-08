Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EF2C10DC3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:49 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.11156.1702002824070074020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=r5d3YaHI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d06d42a58aso14940745ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002823; x=1702607623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFSRaoyTvk91KwbZBHdadN0h1J0RGDO8mrCFISG3sUc=;
        b=r5d3YaHIVHT1xK19SMfM7QJTSFmNs9hMh0dlLWg8sNVgMbITZLJY4w/sh6KsvNMWVO
         Ei8RVHTMqVl+UXJM+kkzu7sBrZtglH4RUCja+QawEBmuSAyukK1mjr3aOIc2GuJRSWNR
         n5seuRFkSiq81wWKb+vy9q9FNoEN/1ZkxQgDTVCUa5n8eVmTOPP45YQDT6tVxxKy/5vj
         mDESvfCiiqEuBRJU57+c0jdon+mukr/5yOLriK9xTIIzP4Dg5OoNQKz54nTcHkgDj8Od
         VdWAiLh22EVaiaPq8flM0CjysdxaGxaMAumoVv3dZHmhOSK3VG+E5SID3WeM/kXe+qJU
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002823; x=1702607623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFSRaoyTvk91KwbZBHdadN0h1J0RGDO8mrCFISG3sUc=;
        b=OopdX68aSrSlZOwdKEnYpciknnednOaMHv1BlSBlrX+SlVYmchIUU8OlRFhSaesCKW
         x9fTtp+86R4EFbEOEuhRaOCHAGdn6BUs9vX/QaKKjn90gispguidER6ifUI7/OV8SLRv
         gKD0uSJBVnT0+PlMJFLK35oPdc1Vw7k/5XN07aOkxLVzDnwWQiu3AoxGeAURDG2OFvqt
         LbI3Be9UAuxLaYjlbXIHWmskFMHxPIDPBCCyh7Dh37KyMYl65ub2v9+G5/kLVUJKGuEk
         9CiSTROfDE0To87wKLu0MBwdXfJRNyRGWpKecEvXJSLzyu76v0Bf/xRsbLUQdkoIxl7P
         RcZg==
X-Gm-Message-State: AOJu0YwFco0UNgpKxnK4bTvNFHpU5r28yhe4Eaci1Yzuq92yOEqV1iqf
	MSTFkmbgeUrba/BNl73jsWA1JbZSMrCBgwKfDu8=
X-Google-Smtp-Source: AGHT+IFti++eq/9SmdUnxkBAaPcvNnK8egdXhVaW1PIQ0XAJcBOqt3A5LXYXDIBuPnLUNC8KUHB2rA==
X-Received: by 2002:a17:903:2308:b0:1d0:b3f5:c30c with SMTP id d8-20020a170903230800b001d0b3f5c30cmr4268510plh.98.1702002822925;
        Thu, 07 Dec 2023 18:33:42 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] linux-yocto/5.10: update to v5.10.198
Date: Thu,  7 Dec 2023 16:33:11 -1000
Message-Id: <2c379dc34820b80f3f4132437737f0e4d601e36a.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191997

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a8d812240fdd Linux 5.10.198
    660627c71bc1 xen/events: replace evtchn_rwlock with RCU
    1e3d016a9506 mmc: renesas_sdhi: only reset SCC when its pointer is populated
    a7d86a77c33b netfilter: nftables: exthdr: fix 4-byte stack OOB write
    84f6b686df2d netfilter: nf_tables: fix kdoc warnings after gc rework
    c17446c00805 parisc: Restore __ldcw_align for PA-RISC 2.0 processors
    cfc333393ae6 RDMA/mlx5: Fix NULL string error
    0d520cdb0cd0 RDMA/siw: Fix connection failure handling
    5a4a6a47e074 RDMA/uverbs: Fix typo of sizeof argument
    626868282c36 RDMA/cma: Fix truncation compilation warning in make_cma_ports
    7de0e42444e9 RDMA/cma: Initialize ib_sa_multicast structure to 0 when join
    36953b4da78b gpio: pxa: disable pinctrl calls for MMP_GPIO
    6ad972e66870 gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
    d7d8f1a679ec IB/mlx4: Fix the size of a buffer in add_port_entries()
    204c2d485f86 of: dynamic: Fix potential memory leak in of_changeset_action()
    b74f12f98b7f RDMA/core: Require admin capabilities to set system parameters
    ccd87fe7a0f6 dm zoned: free dmz->ddev array in dmz_put_zoned_devices
    82d87c944ea8 cpupower: add Makefile dependencies for install targets
    492241613cf4 sctp: update hb timer immediately after users change hb_interval
    f87658493898 sctp: update transport state when processing a dupcook packet
    ff346b01eba5 tcp: fix delayed ACKs for MSS boundary condition
    677aaa261e7a tcp: fix quick-ack counting to count actual ACKs of new data
    6a24d0661fa3 tipc: fix a potential deadlock on &tx->lock
    b9f1568ba37f net: stmmac: dwmac-stm32: fix resume on STM32 MCU
    3a5142f01758 netfilter: nf_tables: nft_set_rbtree: fix spurious insertion failure
    0ba9348532bd netfilter: handle the connecting collision properly in nf_conntrack_proto_sctp
    b212f361a5d1 net: ethernet: ti: am65-cpsw: Fix error code in am65_cpsw_nuss_init_tx_chns()
    dba849cc9811 net: nfc: llcp: Add lock when modifying device list
    30bc4d7aebe3 net: usb: smsc75xx: Fix uninit-value access in __smsc75xx_read_reg
    d44346dda7d4 net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
    96b2e1090397 ipv4, ipv6: Fix handling of transhdrlen in __ip{,6}_append_data()
    2ea52a2fb8e8 net: fix possible store tearing in neigh_periodic_work()
    6e3d9e5caba8 modpost: add missing else to the "of" check
    225cd4f67bd4 NFSv4: Fix a nfs4_state_manager() race
    d8f2ba9ec358 ima: rework CONFIG_IMA dependency block
    77f82df960cb scsi: target: core: Fix deadlock due to recursive locking
    a9430129d8db ima: Finish deprecation of IMA_TRUSTED_KEYRING Kconfig
    725fd2080559 regmap: rbtree: Fix wrong register marked as in-cache when creating new node
    666cdc43df24 wifi: mt76: mt76x02: fix MT76x0 external LNA gain handling
    54a4faab2baa drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
    93dd471d3a2f bpf: Fix tr dereferencing
    10a18c8bac7f wifi: mwifiex: Fix oob check condition in mwifiex_process_rx_packet
    8c15c1bcc5b5 wifi: iwlwifi: dbg_ini: fix structure packing
    a5f643ab1163 ubi: Refuse attaching if mtd's erasesize is 0
    33420a82067b arm64: Add Cortex-A520 CPU part definition
    81d03e251894 net: prevent rewrite of msg_name in sock_sendmsg()
    72fc02ebfc93 net: replace calls to sock->ops->connect() with kernel_connect()
    1aeff207e295 wifi: mwifiex: Fix tlv_buf_left calculation
    f6f25930fa34 qed/red_ll2: Fix undefined behavior bug in struct qed_ll2_info
    b9c4b3ca9016 scsi: zfcp: Fix a double put in zfcp_port_enqueue()
    04b6b67a3e77 Revert "PCI: qcom: Disable write access to read only registers for IP v2.3.3"
    c2cf152e8bb8 Revert "clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz"
    f94471c0cc31 block: fix use-after-free of q->q_usage_counter
    0d6987d4a34c rbd: take header_rwsem in rbd_dev_refresh() only when updating
    d3d170c5fc06 rbd: decouple parent info read-in from updating rbd_dev
    3ceb306f9b2d rbd: decouple header read-in from updating rbd_dev->header
    7c4f11d73b24 rbd: move rbd_dev_refresh() definition
    d0952ce316d1 drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()
    c33d75a57a81 ring-buffer: Fix bytes info in per_cpu buffer stats
    0ecde7dd766f ring-buffer: remove obsolete comment for free_buffer_page()
    2ad1a1d3d616 NFSv4: Fix a state manager thread deadlock regression
    ec4325e80633 NFS: rename nfs_client_kset to nfs_kset
    598539f38c72 NFS: Cleanup unused rpc_clnt variable
    19f3d5d13b75 spi: zynqmp-gqspi: fix clock imbalance on probe failure
    2cdec9c13f81 spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in zynqmp_qspi_probe
    ae03dafc3761 fs: binfmt_elf_efpic: fix personality for ELF-FDPIC
    8ec1abb59a98 ata: libata-sata: increase PMP SRST timeout to 10s
    dc0bd0f2da5c ata: libata-core: Do not register PM operations for SAS ports
    531d9f6dbfd5 ata: libata-core: Fix port and device removal
    99d308c31923 ata: libata-core: Fix ata_port_request_pm() locking
    eaf449666221 net: thunderbolt: Fix TCPv6 GSO checksum calculation
    72595dbfcae3 bpf: Fix BTF_ID symbol generation collision in tools/
    6a80578bd441 bpf: Fix BTF_ID symbol generation collision
    cbbfdb4bab70 btrfs: properly report 0 avail for very full file systems
    ef47f25e98de ring-buffer: Update "shortest_full" in polling
    b7a0df4c0877 proc: nommu: /proc/<pid>/maps: release mmap read lock
    acc7fc82d0ad Revert "SUNRPC dont update timeout value on connection reset"
    e3b8c9e0fc3c i2c: i801: unregister tco_pdev in i801_probe() error path
    b664e9db8d2c ata: libata-scsi: ignore reserved bits for REPORT SUPPORTED OPERATION CODES
    25872c67de20 ALSA: hda: Disable power save for solving pop issue on Lenovo ThinkCentre M70q
    5a03b42ae1ed netfilter: nf_tables: disallow rule removal from chain binding
    7130a87ca323 nilfs2: fix potential use after free in nilfs_gccache_submit_read_data()
    e14afa4450cb serial: 8250_port: Check IRQ data before use
    6d5c8862932d Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
    14443223e08c Smack:- Use overlay inode label in smack_inode_copy_up()
    297c51c63fe1 smack: Retrieve transmuting information in smack_inode_getsecurity()
    41de7a6b95df smack: Record transmuting in smk_transmuted
    831f18c735e2 nvme-pci: always return an ERR_PTR from nvme_pci_alloc_dev
    fb28f89d50c0 netfilter: nft_exthdr: Fix for unsafe packet data read
    e18216cd0ec7 netfilter: nft_exthdr: Search chunks in SCTP packets only
    152b8ac839c9 watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running
    13b7d49f339a watchdog: iTCO_wdt: No need to stop the timer in probe
    0d599a3f57a5 nvme-pci: do not set the NUMA node of device if it has none
    97e148dcb97d nvme-pci: factor out a nvme_pci_alloc_dev helper
    71357c751fb2 nvme-pci: factor the iod mempool creation into a helper
    38f82cf86096 ACPI: Check StorageD3Enable _DSD property in ACPI code
    67025d565450 cgroup: Fix suspicious rcu_dereference_check() usage warning
    b2788f6d4924 sched/cpuacct: Optimize away RCU read lock
    82756d8a2394 sched/cpuacct: Fix charge percpu cpuusage
    f8e8e72c58c7 sched/cpuacct: Fix user/system in shown cpuacct.usage*
    ef3c728ca0d4 perf build: Define YYNOMEM as YYNOABORT for bison < 3.81
    da91481c5d2b fbdev/sh7760fb: Depend on FB=y
    ffc459a93065 ncsi: Propagate carrier gain/loss events to the NCSI controller
    8c2500228b8f powerpc/watchpoints: Disable preemption in thread_change_pc()
    f5bdbed0361c media: vb2: frame_vector.c: replace WARN_ONCE with a comment
    ebc91848062e bpf: Clarify error expectations from bpf_clone_redirect
    0118244848a5 spi: nxp-fspi: reset the FLSHxCR1 registers
    f6cf19c1b313 ata: libata-eh: do not clear ATA_PFLAG_EH_PENDING in ata_eh_reset()
    2afd8fcee0c4 scsi: pm80xx: Avoid leaking tags when processing OPC_INB_SET_CONTROLLER_CONFIG command
    0decc581e1dc scsi: pm80xx: Use phy-specific SAS address when sending PHY_START command
    f44e66447c4f platform/mellanox: mlxbf-bootctl: add NET dependency into Kconfig
    cee5151c5410 ring-buffer: Do not attempt to read past "commit"
    2956e33fb4f8 selftests: fix dependency checker script
    9ccce21bd77b ring-buffer: Avoid softlockup in ring_buffer_resize()
    5dfcb92905b3 selftests/ftrace: Correctly enable event in instance-event.tc
    38ef4b2e4dca scsi: qedf: Add synchronization between I/O completions and abort
    2081b2a15b08 parisc: irq: Make irq_stack_union static to avoid sparse warning
    f47efdffdc13 parisc: drivers: Fix sparse warning
    d967a9472bf9 parisc: iosapic.c: Fix sparse warnings
    7b2440c2d64f parisc: sba: Fix compile warning wrt list of SBA devices
    c79300599923 dma-debug: don't call __dma_entry_alloc_check_leak() under free_entries_lock
    061f40275338 i2c: npcm7xx: Fix callback completion ordering
    dd81e91b2efc gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip
    b317f69871ef xtensa: boot/lib: fix function prototypes
    be17dfdcc87a xtensa: boot: don't add include-dirs
    a10bfbe599b7 xtensa: iss/network: make functions static
    608af5511a8f xtensa: add default definition for XCHAL_HAVE_DIV32
    3696261859c5 power: supply: ucs1002: fix error code in ucs1002_get_property()
    eff55feb8b87 bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up
    1bc88671960f ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkctrl warning on boot
    a2a592adad7c ARM: dts: Unify pwm-omap-dmtimer node names
    2d9c9589da6a ARM: dts: am335x: Guardian: Update beeper label
    ef83f35ced40 ARM: dts: motorola-mapphone: Drop second ti,wlcore compatible value
    12a28c379ef8 ARM: dts: motorola-mapphone: Add 1.2GHz OPP
    afdc40a74ae3 ARM: dts: motorola-mapphone: Configure lower temperature passive cooling
    093a9a02d4d5 ARM: dts: ti: omap: Fix bandgap thermal cells addressing for omap3/4
    28e5423ad8fb ARM: dts: omap: correct indentation
    50789f37239c clk: tegra: fix error return case for recalc_rate
    0fd5839e2504 bus: ti-sysc: Fix missing AM35xx SoC matching
    1d4d846e2a49 bus: ti-sysc: Use fsleep() instead of usleep_range() in sysc_reset()
    a8ee76d72737 MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled
    d678c078f302 btrfs: reset destination buffer when read_extent_buffer() gets invalid range
    a1f85bc9bc69 ata: ahci: Add Elkhart Lake AHCI controller
    51d190cc98de ata: ahci: Rename board_ahci_mobile
    8061c399c83b ata: ahci: Add support for AMD A85 FCH (Hudson D4)
    0156cce71f8e ata: libata: Rename link flag ATA_LFLAG_NO_DB_DELAY
    9f0d34663025 netfilter: nft_exthdr: Fix non-linear header modification
    ed60b8014c9a netfilter: exthdr: add support for tcp option removal
    10670abe1115 netfilter: nft_exthdr: break evaluation if setting TCP option fails
    45b3eb6afcff netfilter: nf_tables: add and use nft_thoff helper
    39546418b84d netfilter: nf_tables: add and use nft_sk helper
    af844ba799b5 netfilter: nft_exthdr: Support SCTP chunks
    858ca1921639 netfilter: use actual socket sk for REJECT action
    2d9ea86f3c4a media: venus: hfi_venus: Write to VIDC_CTRL_INIT after unmasking interrupts
    c4cc1f690f19 media: venus: hfi: Add a 6xx boot logic
    4596fece3c24 media: venus: core: Add differentiator IS_V6(core)
    3ed9d3dc244b media: venus: hfi: Define additional 6xx registers
    ebccb53232cc media: venus: hfi,pm,firmware: Convert to block relative addressing
    4ccdeb68da0c media: venus: core: Add io base variables for each block
    6d3745bbc334 mmc: renesas_sdhi: register irqs before registering controller
    995ef65e4b5c mmc: tmio: support custom irq masks
    97eb045386de mmc: renesas_sdhi: populate SCC pointer at the proper place
    7217ceb61a47 mmc: renesas_sdhi: probe into TMIO after SCC parameters have been setup
    e492f8125133 Input: i8042 - add quirk for TUXEDO Gemini 17 Gen1/Clevo PD70PN
    677bff659fd3 Input: i8042 - rename i8042-x86ia64io.h to i8042-acpipnpio.h
    3fac8ce48fa9 netfilter: nf_tables: double hook unregistration in netns path
    e51f30826bc5 netfilter: nf_tables: unregister flowtable hooks on netns exit
    5e95c88e9061 i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()
    0a78bcc2d526 gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
    f515112e8337 net: rds: Fix possible NULL-pointer dereference
    466e88548e19 bnxt_en: Flush XDP for bnxt_poll_nitroa0()'s NAPI
    78106529b390 locking/seqlock: Do the lockdep annotation before locking in do_write_seqcount_begin_nested()
    a8dd21118b0f seqlock: Prefix internal seqcount_t-only macros with a "do_"
    ac01a0dd7905 seqlock: Rename __seqprop() users
    a8460ee6c80b seqlock: avoid -Wshadow warnings
    f1893feb20ea netfilter: ipset: Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP
    b44dd92e2afd team: fix null-ptr-deref when team device type is changed
    04cc361f029c net: bridge: use DEV_STATS_INC()
    1671dc1b25e5 net: hns3: add 5ms delay before clear firmware reset irq source
    309af4a39b8e net: hns3: only enable unicast promisc when mac table full
    ae806c74c063 x86/srso: Fix SBPB enablement for spec_rstack_overflow=off
    423ba1b3a5a7 x86/srso: Fix srso_show_state() side effect
    1ec40ef6f765 platform/x86: intel_scu_ipc: Fail IPC send if still busy
    4c5eaf6d8bb4 platform/x86: intel_scu_ipc: Don't override scu in intel_scu_ipc_dev_simple_command()
    441b61d742ef platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
    c463898b6e72 platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
    60d73c62e3e4 dccp: fix dccp_v4_err()/dccp_v6_err() again
    09a1c790e1b9 powerpc/perf/hv-24x7: Update domain value check
    8689c9ace976 ipv4: fix null-deref in ipv4_link_failure
    47907ebeb77a i40e: Fix VF VLAN offloading when port VLAN is configured
    a91861446f1c ASoC: imx-audmix: Fix return error with devm_clk_get()
    c4ecedf980b0 selftests: tls: swap the TX and RX sockets in some tests
    78ef69b6e770 selftests/tls: Add {} to avoid static checker warning
    388c9d3eefae bpf: Avoid deadlock when using queue and stack maps from NMI
    6dc85d848c26 netfilter: nf_tables: disallow element removal on anonymous sets
    a45632f99713 ASoC: meson: spdifin: start hw on dai probe
    09c85f2d21ab netfilter: nf_tables: fix memleak when more than 255 elements expired
    4deaf1316b42 netfilter: nft_set_hash: try later when GC hits EAGAIN on iteration
    26d0e4d632f8 netfilter: nft_set_pipapo: stop GC iteration if GC transaction allocation fails
    b796c4e4bf29 netfilter: nft_set_rbtree: use read spinlock to avoid datapath contention
    c323ed65f66e netfilter: nft_set_rbtree: skip sync GC for new elements in this transaction
    09f2dda1e576 netfilter: nf_tables: defer gc run if previous batch is still pending
    b71dcee2fc9c netfilter: nf_tables: use correct lock to protect gc_list
    23292bdfda5f netfilter: nf_tables: GC transaction race with abort path
    dc0b1f019554 netfilter: nf_tables: GC transaction race with netns dismantle
    4046f2b56e5a netfilter: nf_tables: fix GC transaction races with netns and netlink event exit path
    891ca5dfe3b7 netfilter: nf_tables: don't fail inserts if duplicate has expired
    911dd3cdf108 netfilter: nf_tables: remove busy mark and gc batch API
    77046cb00850 netfilter: nft_set_hash: mark set element as dead when deleting from packet path
    146c76866795 netfilter: nf_tables: adapt set backend to use GC transaction API
    448be0774882 netfilter: nf_tables: GC transaction API to avoid race with control plane
    b15ea4017af8 netfilter: nf_tables: don't skip expired elements during walk
    f8bf7706151a netfilter: nf_tables: integrate pipapo into commit protocol
    9b65bff30a61 tracing: Have event inject files inc the trace array ref count
    f8a86ab3c4a4 ext4: do not let fstrim block system suspend
    c502b09d9bef ext4: move setting of trimmed bit into ext4_try_to_trim_range()
    e78e9f08a24e ext4: replace the traditional ternary conditional operator with with max()/min()
    cbf6a0f65404 ext4: mark group as trimmed only if it was fully scanned
    5eaf4a1e06cf ext4: change s_last_trim_minblks type to unsigned long
    24a86315a353 ext4: scope ret locally in ext4_try_to_trim_range()
    da1895f731f3 ext4: add new helper interface ext4_try_to_trim_range()
    6f5fc957dfb7 ext4: remove the 'group' parameter of ext4_trim_extent
    69c966583022 ata: libahci: clear pending interrupt status
    11d15a115c90 ata: ahci: Drop pointless VPRINTK() calls and convert the remaining ones
    407bf1c140f0 tracing: Increase trace array ref count on enable and filter files
    3f7df02fa0d4 SUNRPC: Mark the cred for revalidation if the server rejects it
    25ae2b2fdb12 NFS/pNFS: Report EINVAL errors from connect() to the server
    26db22a6397b NFS: Use the correct commit info in nfs_join_page_group()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b61c0a98c9..ea27d58ed7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "361bd6dc8f750afb690d28fd9aab33d116b38f68"
-SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
+SRCREV_machine ?= "2da7024055c1fb827608ef2529c22356612f6ddd"
+SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.197"
+LINUX_VERSION ?= "5.10.198"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 6e98407a7b..7de15b3427 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.197"
+LINUX_VERSION ?= "5.10.198"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c27508f48245090385d55b192f866b6ad60a79f7"
-SRCREV_machine ?= "3050ddb1d59017a62d3d7d589a11d168be86b6a3"
-SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
+SRCREV_machine:qemuarm ?= "0456488add9cb4b7d3cd462829c9dc7565bd129e"
+SRCREV_machine ?= "a1c6b99d88f23dcdaeb66e932239e43b4ffb44f0"
+SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index adb4aa69a0..764b2ae52b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "28db2d5b2451e2c6b055dcd65bbe2fa581fa1538"
-SRCREV_machine:qemuarm64 ?= "3f6544c8ee1330484b5c341dcac662ef73836a0e"
-SRCREV_machine:qemumips ?= "7643ee350375086f23ddffbe1613150ce988dce5"
-SRCREV_machine:qemuppc ?= "9320f948b72a073ab0c27f0ca884842bb8eed036"
-SRCREV_machine:qemuriscv64 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
-SRCREV_machine:qemuriscv32 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
-SRCREV_machine:qemux86 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
-SRCREV_machine:qemux86-64 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
-SRCREV_machine:qemumips64 ?= "a3f4193c0ed91cbcfaed2e6cc984eb4906e511e0"
-SRCREV_machine ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
-SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
+SRCREV_machine:qemuarm ?= "55637625329cf574d8e33c94e58562d418d9a342"
+SRCREV_machine:qemuarm64 ?= "259c25670564324f7098c7f5e5fd136e0d708216"
+SRCREV_machine:qemumips ?= "8333009219a39ea271fe238a482423bfa4738703"
+SRCREV_machine:qemuppc ?= "bd719802d7bca16c82af1cb31e3dc254cf8992b8"
+SRCREV_machine:qemuriscv64 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
+SRCREV_machine:qemuriscv32 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
+SRCREV_machine:qemux86 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
+SRCREV_machine:qemux86-64 ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
+SRCREV_machine:qemumips64 ?= "f3dfd049230bbbf54854c21f5b85b8b52e2b2f65"
+SRCREV_machine ?= "5601201f60a8abb5bbb54da99da2a38bfb7a46dd"
+SRCREV_meta ?= "d787ac6931e013c185858482f491f8bfa9fa5177"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.197"
+LINUX_VERSION ?= "5.10.198"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


