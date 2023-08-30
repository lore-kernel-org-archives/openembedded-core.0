Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCECC83F18
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.1287.1693417726332851719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AqfVj0SM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so4183125b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417725; x=1694022525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnG9WiVN2imHNhAHnS8BjSWlPMfaX/Ms2OUARgR5Eog=;
        b=AqfVj0SMIUpGP1xtMl5HJ4dM1GyRoMVkMLH8xE4n+2ymYTFmFW+3DzeG+iBUIlwi8b
         FrjUBy1j+ajxmAR30ZIzIL79NDiDf+oyiRcjNqOqIB+qaqwZZr4I5CymTWlNRRcyrYtf
         kGsBT4xGUSiZWGNB9ApF9kzZvOqJMi7TltKsARSotZtHH+hXznooGwu4tGjjjms4HR8U
         M0P3r1Y2ZpJHGIbm13p5YI2/FgAf93ONR0d3M9aaHMp+o3J53kE8af78M6PJGUw31J6K
         yJodrFhmEAwtrref/udfDydJMSxo6TXfe8LpW8et5T0CUlteFQHGK6E9CmtYpcAPowYS
         iaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417725; x=1694022525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnG9WiVN2imHNhAHnS8BjSWlPMfaX/Ms2OUARgR5Eog=;
        b=LJjafUoTIsETCZJxpIp1om8Vb59JdIL6VEvfYbez3mU9LEX+/Gi2/5pSJkAM+32Y5E
         s70j4+b1UfCIEylJlAOySofQeF4DOo51ppBu0xRfPX2h3Y8N6nUbXMNhIQdC9/KIzvUQ
         5qOQzAtKeUmN/KBXGIW2hKwiN1g2+AZvAK0hh0OQ3fzJbb51su9oq9vKYsvjRPuzfOl0
         ETntzLQLqD8T6cboweU7ndruq1aeZyBzd7aVDe+qU896L7kVImIUrKdmg0sTDZnd+PMQ
         8KtDK8Zgu+UyfaAtnevOQJF+hARvcxS4ZPeKBVmzSwZEkwL3jXzNjIpTBmLG6M08qA78
         lzWg==
X-Gm-Message-State: AOJu0YyC18rEq7C54KDAUW35QEFQxKY0rHNhwLlXH1kbFrQ3yHsTShvg
	aeVb8QHb+njZ4eP+kHirNPGTMWgZ6I+FhUJ32s8=
X-Google-Smtp-Source: AGHT+IHoAaAzVn1QqdQ4TTExJhYzSTuf2xs7ijNqpbiQn/TDZg/gdjKe2do4W1QponJ7XFCy9unzxA==
X-Received: by 2002:aa7:88d0:0:b0:68a:3671:288b with SMTP id k16-20020aa788d0000000b0068a3671288bmr3358986pff.2.1693417724438;
        Wed, 30 Aug 2023 10:48:44 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/20] linux-yocto/6.1: update to v6.1.41
Date: Wed, 30 Aug 2023 07:48:10 -1000
Message-Id: <b4aa19866091e52290c445f8bc9cb0051f9438da.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186908

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    5302e81aa209 Linux 6.1.41
    ed9b87010aa8 x86/cpu/amd: Add a Zenbleed fix
    5fc203d8d3ed x86/cpu/amd: Move the errata checking functionality up
    75389113731b Linux 6.1.40
    9879d6e1ca87 net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
    e2c3356907a5 net/ncsi: make one oem_gma function for all mfr id
    e4a0e09b79bd drm/atomic: Fix potential use-after-free in nonblocking commits
    d34a3470ed40 net/sched: sch_qfq: reintroduce lmax bound check for MTU
    ff06cd411aa0 swiotlb: mark swiotlb_memblock_alloc() as __init
    d64b70df23e8 Revert "drm/amd: Disable PSR-SU on Parade 0803 TCON"
    fbfb6b7cb2f7 MIPS: kvm: Fix build error with KVM_MIPS_DEBUG_COP0_COUNTERS enabled
    fec55ec03545 scsi: qla2xxx: Fix end of loop test
    f459d586fdf1 scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
    b06d1b525364 scsi: qla2xxx: Pointer may be dereferenced
    b88b1241fb1c scsi: qla2xxx: Correct the index of array
    e466930717ef scsi: qla2xxx: Check valid rport returned by fc_bsg_to_rport()
    ce2cdbe530b0 scsi: qla2xxx: Fix potential NULL pointer dereference
    2dddbf8de128 scsi: qla2xxx: Fix buffer overrun
    477bc74ad1ad scsi: qla2xxx: Avoid fcport pointer dereference
    2b3bdef089b9 scsi: qla2xxx: Array index may go out of bound
    d994ac7c7842 scsi: qla2xxx: Fix mem access after free
    90770dad1eb3 scsi: qla2xxx: Wait for io return on terminate rport
    1802e5d0988a scsi: qla2xxx: Fix hang in task management
    35985b0741c1 scsi: qla2xxx: Fix task management cmd fail due to unavailable resource
    843665c4266d scsi: qla2xxx: Fix task management cmd failure
    ff92567d906e scsi: qla2xxx: Multi-que support for TMF
    95e34129f37e tracing/user_events: Fix struct arg size match check
    a95c1fede27d tracing/probes: Fix to update dynamic data counter if fetcharg uses it
    837f92d27f55 tracing/probes: Fix not to count error code to total length
    2f41d35b58c8 selftests: mptcp: pm_nl_ctl: fix 32-bit support
    ee352299a678 selftests: mptcp: depend on SYN_COOKIES
    08daab11f344 selftests: mptcp: userspace_pm: report errors with 'remove' tests
    4098a4318298 selftests: mptcp: userspace_pm: use correct server port
    c118baa05fb9 selftests: mptcp: sockopt: return error if wrong mark
    671486793f72 selftests: mptcp: connect: fail if nft supposed to work
    938d5b7a75e1 tracing: Fix null pointer dereference in tracing_err_log_open()
    fbcd0c2b569f fprobe: Ensure running fprobe_exit_handler() finished before calling rethook_free()
    ce3ec57faff5 fprobe: Release rethook after the ftrace_ops is unregistered
    2e9a46e46786 pwm: meson: fix handling of period/duty if greater than UINT_MAX
    ba1ede19e601 pwm: meson: modify and simplify calculation in meson_pwm_get_state
    9a2c57fd3284 PM: QoS: Restore support for default value on frequency QoS
    15ec83da4311 perf/x86: Fix lockdep warning in for_each_sibling_event() on SPR
    22fc9fd72307 xtensa: ISS: fix call to split_if_spec
    6a05de6da58a cifs: if deferred close is disabled then close files immediately
    bd8cd38d3ac6 drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
    11dc77a645b7 drm/amd/pm: share the code around SMU13 pcie parameters update
    99fe81d219df ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()
    8b0b63fdac6b ring-buffer: Fix deadloop issue on reading trace_pipe
    90947ebf8794 net: ena: fix shift-out-of-bounds in exponential backoff
    b1a726ad33e5 regmap-irq: Fix out-of-bounds access when allocating config buffers
    aeb62beaf9cb perf: RISC-V: Remove PERF_HES_STOPPED flag checking in riscv_pmu_start()
    e2c7a05a48e5 samples: ftrace: Save required argument registers in sample trampolines
    9d6a260bbfbc nvme: don't reject probe due to duplicate IDs for single-ported PCIe devices
    be970e22c53d tracing: Fix memory leak of iter->temp when reading trace_pipe
    5fd32eb6fa0a tracing/histograms: Add histograms to hist_vars if they have referenced variables
    0a1dc6377afc dm: verity-loadpin: Add NULL pointer check for 'bdev' parameter
    08aaeda414f7 s390/decompressor: fix misaligned symbol build error
    2ebf4ddcc657 bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
    599c0ebdb5cc Revert "8250: add support for ASIX devices with a FIFO bug"
    801daff00780 soundwire: qcom: fix storing port config out-of-bounds
    76ab057de777 opp: Fix use-after-free in lazy_opp_tables after probe deferral
    be06ffa8f4ac meson saradc: fix clock divider mask length
    610ddd79fc6a xhci: Show ZHAOXIN xHCI root hub speed correctly
    892ef7593000 xhci: Fix TRB prefetch issue of ZHAOXIN hosts
    8e273a2190b5 xhci: Fix resume issue of some ZHAOXIN hosts
    829361479860 ceph: don't let check_caps skip sending responses for revoke msgs
    0471d907d8c1 ceph: fix blindly expanding the readahead windows
    d545ff97cf43 ceph: add a dedicated private data for netfs rreq
    183c0ae4fafc libceph: harden msgr2.1 frame segment length checks
    cb8a31a56df8 firmware: stratix10-svc: Fix a potential resource leak in svc_create_memory_pool()
    5553d587a371 tty: serial: imx: fix rs485 rx after tx
    f0bf102ef9b0 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
    34f5b826dd50 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
    9fd9e1d09878 serial: atmel: don't enable IRQs prematurely
    f037f6038736 drm/ttm: Don't leak a resource on swapout move error
    fe26d0fa9408 drm/amdgpu: avoid restore process run into dead loop.
    8404d0e274ac drm/amd/display: Add monitor specific edid quirk
    7ad40467fdfb drm/amd/display: Correct `DMUB_FW_VERSION` macro
    ad85fc99d638 drm/amd/display: add a NULL pointer check
    3092beeb25dc drm/amd: Disable PSR-SU on Parade 0803 TCON
    91e69e67d401 drm/amdgpu: fix clearing mappings for BOs that are always valid in VM
    3546f76c7ad8 drm/amd/display: disable seamless boot if force_odm_combine is enabled
    a2ef3163c360 drm/amd/display: Remove Phantom Pipe Check When Calculating K1 and K2
    c4629c757528 drm/amd/display: edp do not add non-edid timings
    31fb25ecbba6 drm/amd/display: fix seamless odm transitions
    c41963e50a55 drm/rockchip: vop: Leave vblank enabled in self-refresh
    db0a9a29912c drm/atomic: Allow vblank-enabled + self-refresh "disable"
    6436ca035bcc scsi: lpfc: Fix double free in lpfc_cmpl_els_logo_acc() caused by lpfc_nlp_not_used()
    7adcc32eb523 fs: dlm: fix mismatch of plock results from userspace
    adeaef5a00dc fs: dlm: make F_SETLK use unkillable wait_event
    2a37d73395a5 fs: dlm: interrupt posix locks only when process is killed
    a1b6adf4b180 fs: dlm: fix cleanup pending ops when interrupted
    3346ffdee42b fs: dlm: return positive pid value for F_GETLK
    be19cb671651 dm init: add dm-mod.waitfor to wait for asynchronously probed block devices
    e30128926a0f md/raid0: add discard support for the 'original' layout
    31df8b9609f3 mfd: pm8008: Fix module autoloading
    7ef181f84ef3 misc: pci_endpoint_test: Re-init completion for every test
    c2dba13bc0c6 misc: pci_endpoint_test: Free IRQs before removing the device
    0813bb2f2cb8 PCI: rockchip: Set address alignment for endpoint mode
    5b15ebec5697 PCI: rockchip: Use u32 variable to access 32-bit registers
    1a48294ade5c PCI: rockchip: Fix legacy IRQ generation for RK3399 PCIe endpoint core
    dfd20ebcae84 PCI: rockchip: Add poll and timeout to wait for PHY PLLs to be locked
    05f55f7530e2 PCI: rockchip: Write PCI Device ID to correct register
    b2e2ffbfd341 PCI: rockchip: Assert PCI Configuration Enable bit after probe
    07d997ef1052 PCI: epf-test: Fix DMA transfer completion detection
    bcd276f1431e PCI: epf-test: Fix DMA transfer completion initialization
    cf0d7b72707d PCI: qcom: Disable write access to read only registers for IP v2.3.3
    c459365ec7ba PCI: Add function 1 DMA alias quirk for Marvell 88SE9235
    465c195e86f3 PCI: Release resource invalidated by coalescing
    3367d4be9b19 PCI/PM: Avoid putting EloPOS E2/S2/H2 PCIe Ports in D3cold
    25cb64ecc384 s390/zcrypt: do not retry administrative requests
    026e46d26aaf scsi: mpi3mr: Propagate sense data for admin queue SCSI I/O
    b933df9dda01 dm integrity: reduce vmalloc space footprint on 32-bit architectures
    ef709350ef0b hwrng: imx-rngc - fix the timeout for init and self check
    c7feb54b1138 jfs: jfs_dmap: Validate db_l2nbperpage while mounting
    9e54fd14bd14 ext2/dax: Fix ext2_setsize when len is page aligned
    33f8dff6e1cb soc: qcom: mdt_loader: Fix unconditional call to scm_pas_mem_setup
    5dc507de0c8d fs: dlm: revert check required context while close
    95d49f79e94d ext4: only update i_reserved_data_blocks on successful block allocation
    deef86fa3005 ext4: turn quotas off if mount failed after enabling quotas
    029c6b106f49 ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
    e861961f3a50 ext4: fix wrong unit use in ext4_mb_new_blocks
    2038d35749c7 ext4: get block from bh in ext4_free_blocks for fast commit replay
    782166ac858a ext4: fix wrong unit use in ext4_mb_clear_bb
    0a90e70efa6a ext4: Fix reusing stale buffer heads from last failed mounting
    bd9cf2a5f9e1 MIPS: KVM: Fix NULL pointer dereference
    d56b7a43a2e0 MIPS: Loongson: Fix cpu_probe_loongson() again
    58d1c81307d2 powerpc/64s: Fix native_hpte_remove() to be irq-safe
    484b8fb1ffb5 powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
    23ab732b961f misc: fastrpc: Create fastrpc scalar with correct buffer count
    16eceb395994 powerpc: Fail build if using recordmcount with binutils v2.37
    5aea2ac37456 tracing/user_events: Fix incorrect return value for writing operation when events are disabled
    a4336343ea36 kasan: add kasan_tag_mismatch prototype
    6d806841f111 net: phy: dp83td510: fix kernel stall during netboot in DP83TD510E PHY driver
    eac0aac07f6a net: bcmgenet: Ensure MDIO unregistration has clocks enabled
    de67dadd5cb3 mtd: rawnand: meson: fix unaligned DMA buffers handling
    bb4e824d6b11 tpm: return false from tpm_amd_is_rng_defective on non-x86 platforms
    ad249709d274 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    f5a734a689e8 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    99b998fb9d7d tpm: tpm_vtpm_proxy: fix a race condition in /dev/vtpmx creation
    00283137001f tpm: Do not remap from ACPI resources again for Pluton TPM
    6d8488509eba pinctrl: amd: Unify debounce handling into amd_pinconf_set()
    dce19c966d4d pinctrl: amd: Drop pull up select configuration
    326b3f17bee8 pinctrl: amd: Use amd_pinconf_set() for all config options
    3cadcab402e1 pinctrl: amd: Only use special debounce behavior for GPIO 0
    57f6d48af46f pinctrl: amd: Revert "pinctrl: amd: disable and mask interrupts on probe"
    1cd1a0151fde pinctrl: amd: Detect and mask spurious interrupts
    15165187947c pinctrl: amd: Fix mistake in handling clearing pins at startup
    8a2d8e17c731 pinctrl: amd: Detect internal GPIO0 debounce handling
    4484ce0e4928 pinctrl: amd: Add fields for interrupt status and wake status
    a56afed6d5a4 pinctrl: amd: Adjust debugfs output
    03590f9be9b9 pinctrl: amd: Add Z-state wake control bits
    a996fec74c38 f2fs: fix deadlock in i_xattr_sem and inode page lock
    2cb10f4e6cca f2fs: fix the wrong condition to determine atomic context
    13e8af958cfa drm/amd/pm: add abnormal fan detection for smu 13.0.0
    e8b6b7b81325 drm/amdgpu: Fix minmax warning
    d7d53c669da9 drm/amdgpu: add the fan abnormal detection feature
    c8c703befd2f drm/amd/pm: revise the ASPM settings for thunderbolt attached scenario
    4596c812916a drm/amdgpu/sdma4: set align mask to 255
    7c880188c710 drm/client: Send hotplug event after registering a client
    40e2ed0e562a cifs: fix session state check in smb2_find_smb_ses
    c4a5fb1ae5d3 ovl: fix null pointer dereference in ovl_get_acl_rcu()
    06b3f0bf418a ovl: let helper ovl_i_path_real() return the realinode
    000a9a72efa4 fs/ntfs3: Check fields while reading
    bf2f2c059f17 nvme-pci: fix DMA direction of unmapping integrity data
    70feebdbfad8 net/sched: sch_qfq: account for stab overhead in qfq_enqueue
    4b3383682405 net/sched: sch_qfq: refactor parsing of netlink parameters
    0aec8dab2be6 wifi: rtw89: debug: fix error code in rtw89_debug_priv_send_h2c_set()
    3d1dc71b8f76 net/sched: make psched_mtu() RTNL-less safe
    1c806e406627 netdevsim: fix uninitialized data in nsim_dev_trap_fa_cookie_write()
    1b125be4e001 riscv: mm: fix truncation warning on RV32
    174cfa0317df net/sched: flower: Ensure both minimum and maximum ports are specified
    b11a9b4f28cb bpf: cpumap: Fix memory leak in cpu_map_update_elem
    4719576d6ed6 wifi: airo: avoid uninitialized warning in airo_get_rate()
    9e6474e5d70c erofs: fix fsdax unavailability for chunk-based regular files
    dc8158a95fd7 erofs: avoid infinite loop in z_erofs_do_read_page() when reading beyond EOF
    83879f72e055 erofs: avoid useless loops in z_erofs_pcluster_readmore() when reading beyond EOF
    27272795a72c octeontx2-pf: Add additional check for MCAM rules
    5a9aecb6651c drm/i915: Fix one wrong caching mode enum usage
    f1e746aedd7d drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner
    ba05762e4a5c riscv, bpf: Fix inconsistent JIT image generation
    13a30e22eac3 nvme: fix the NVME_ID_NS_NVM_STS_MASK definition
    66afb6a54e44 igc: Fix inserting of empty frame for launchtime
    1b87509ef6ad igc: Fix launchtime before start of cycle
    f92a82dc486a kernel/trace: Fix cleanup logic of enable_trace_eprobe
    7772d5c44011 platform/x86: wmi: Break possible infinite loop when parsing GUID
    89726b030373 net: dsa: qca8k: Add check for skb_copy
    436b7cc7eae7 ipv6/addrconf: fix a potential refcount underflow for idev
    5554414227db NTB: ntb_tool: Add check for devm_kcalloc
    8d7b8758665b NTB: ntb_transport: fix possible memory leak while device_register() fails
    bece67815ab4 ntb: intel: Fix error handling in intel_ntb_pci_driver_init()
    d4317d41f000 NTB: amd: Fix error handling in amd_ntb_pci_driver_init()
    4e5daadf8cd0 ntb: idt: Fix error handling in idt_pci_driver_init()
    360db93beb8f udp6: fix udp6_ehashfn() typo
    1462e9d9aa52 icmp6: Fix null-ptr-deref of ip6_null_entry->rt6i_idev in icmp6_dev().
    1731234e8b60 net: prevent skb corruption on frag list segmentation
    685b57a1221c net: bgmac: postpone turning IRQs off to avoid SoC hangs
    dc470466753a ionic: remove WARN_ON to prevent panic_on_warn
    6cc293d29c8f octeontx2-af: Move validation of ptp pointer before its usage
    bb56b7905b7d octeontx2-af: Promisc enable/disable through mbox
    2b4086a66abd gve: Set default duplex configuration to full
    c91fb29bb07e net/sched: cls_fw: Fix improper refcount update leads to use-after-free
    831fbc206529 net: mvneta: fix txq_map in case of txq_number==1
    b2e74dedb057 bpf: Fix max stack depth check for async callbacks
    714d81a5c49f scsi: ufs: ufs-mediatek: Add dependency for RESET_CONTROLLER
    574d5236a82b scsi: qla2xxx: Fix error code in qla2x00_start_sp()
    49f6ac6f1cde blk-crypto: use dynamic lock class for blk_crypto_profile::lock
    d752be635bc4 igc: Handle PPS start time programming for past time values
    246fc961c875 igc: set TP bit in 'supported' and 'advertising' fields of ethtool_link_ksettings
    e962fd5933eb net/mlx5e: Check for NOT_READY flag state after locking
    83a8f7337a14 net/mlx5e: fix memory leak in mlx5e_ptp_open
    75df2fe6d160 net/mlx5e: fix memory leak in mlx5e_fs_tt_redirect_any_create
    7ca1914cbd3b net/mlx5e: fix double free in mlx5e_destroy_flow_table
    68b654e9eb5b igc: Remove delay during TX ring configuration
    dfaed769b935 ice: Fix max_rate check while configuring TX rate limits
    1294311ce9ad drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags
    fd5b64c1cf41 swiotlb: reduce the number of areas to match actual memory pool size
    fc3db7fbdf58 swiotlb: reduce the swiotlb buffer size on allocation failure
    24b24863a012 swiotlb: always set the number of areas before allocating the pool
    02d43b8a4f0a drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
    d48029c655e4 drm/panel: simple: Add connector_type for innolux_at043tn24
    ef572ffa8eb4 ksmbd: fix out of bounds read in smb2_sess_setup
    869ef4f2965b ksmbd: add missing compound request handing in some commands
    2d57a1590f4d workqueue: clean up WORK_* constant types, clarify masking
    4b5ab640aafc net: lan743x: Don't sleep in atomic context
    5a45ed1ae34b HID: amd_sfh: Fix for shift-out-of-bounds
    d0b30d8e4d25 HID: amd_sfh: Rename the float32 variable
    a456e1743881 Linux 6.1.39
    f32dfc802e87 io_uring: Use io_schedule* in cqring wait
    c55b552e0b60 sh: hd64461: Handle virq offset for offchip IRQ base and HD64461 IRQ
    0ff5d219eb8a sh: mach-dreamcast: Handle virq offset in cascaded IRQ demux
    5628b9aa3179 sh: mach-highlander: Handle virq offset in cascaded IRL demux
    fe7daa313d13 sh: mach-r2d: Handle virq offset in cascaded IRL demux
    899cc8f7989d block/partition: fix signedness issue for Amiga partitions
    da012a025f70 tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
    3173bfdf89ac wireguard: netlink: send staged packets when setting initial private key
    561aaadf0d07 wireguard: queueing: use saner cpu selection wrapping
    40f83dd66a82 netfilter: nf_tables: prevent OOB access in nft_byteorder_eval
    fc95c8b02c61 netfilter: nf_tables: do not ignore genmask when looking up chain by id
    05561f822f27 netfilter: conntrack: Avoid nf_ct_helper_hash uses after free
    f14537333405 netfilter: nf_tables: unbind non-anonymous set if rule construction fails
    ad2928e7f3f6 mtd: parsers: refer to ARCH_BCMBCA instead of ARCH_BCM4908
    1bdcffaa0d2c drm/i915/tc: Fix system resume MST mode restore for DP-alt sinks
    99025116f5c6 drm/i915/tc: Fix TC port link ref init for DP MST during HW readout
    eaa0043a8579 drm/i915: Fix TypeC mode initialization during system resume
    a02c6dc0eff2 mm/mmap: Fix extra maple tree write
    9222068bc85b xfs: fix xfs_inodegc_stop racing with mod_delayed_work
    1b206852957c xfs: disable reaping in fscounters scrub
    25c1991f9f77 xfs: check that per-cpu inodegc workers actually run on that cpu
    f6e37e24007d xfs: explicitly specify cpu when forcing inodegc delayed work to run immediately
    6b7c52f373fb fs: no need to check source
    d53879f54b54 blktrace: use inline function for blk_trace_remove() while blktrace is disabled
    ab0bd172d628 leds: trigger: netdev: Recheck NETDEV_LED_MODE_LINKUP on dev rename
    9077ec19adc2 ARM: orion5x: fix d2net gpio initialization
    600b51aa44de ARM: dts: qcom: ipq4019: fix broken NAND controller properties override
    9030a7e83632 regulator: tps65219: Fix matching interrupts for their regulators
    d9eaa90d7dbb ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
    1c9b356bbe99 ASoC: mediatek: mt8173: Fix irq error path
    3929b5dd8fdd btrfs: do not BUG_ON() on tree mod log failure at __btrfs_cow_block()
    bc662a1e1f9f btrfs: fix extent buffer leak after tree mod log failure at split_node()
    a53d78d9a855 btrfs: fix race when deleting quota root from the dirty cow roots list
    9634e5360bd3 btrfs: reinsert BGs failed to reclaim
    d9f1e518ab05 btrfs: add block-group tree to lockdep classes
    3702c5342cf1 btrfs: bail out reclaim process if filesystem is read-only
    856086109515 btrfs: delete unused BGs while reclaiming BGs
    4fadf53fa951 btrfs: add handling for RAID1C23/DUP to btrfs_reduce_alloc_profile
    8fcb478b5508 ipvs: increase ip_vs_conn_tab_bits range for 64BIT
    759e582b1cea usb: typec: ucsi: Mark dGPUs as DEVICE scope
    f2a6ce3eec14 i2c: nvidia-gpu: Remove ccgx,firmware-build property
    7b67af8dea95 i2c: nvidia-gpu: Add ACPI property to align with device-tree
    f40d621387d4 fs: Lock moved directories
    10c159f994b9 fs: Establish locking order for unrelated directories
    6654d2a165e4 Revert "f2fs: fix potential corruption when moving a directory"
    6aaa22ec7310 ext4: Remove ext4 locking of moved directory
    606e463eefed fs: avoid empty option when generating legacy mount string
    6df680709d90 jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
    1f34bf8b442c shmem: use ramfs_kill_sb() for kill_sb method of ramfs-based tmpfs
    23fbff67b06d mm/damon/ops-common: atomically test and clear young on ptes and pmds
    33893c6c1f18 autofs: use flexible array in ioctl structure
    cd52323ac4c1 integrity: Fix possible multiple allocation in integrity_inode_get()
    0cbbb029ffe9 um: Use HOST_DIR for mrproper
    219a9ec09dd1 watch_queue: prevent dangling pipe pointer
    7ecea5ce3dc1 bcache: Fix __bch_btree_node_alloc to make the failure behavior consistent
    68118c339c6e bcache: Remove unnecessary NULL point check in node allocations
    25ec4779d0fb bcache: fixup btree_cache_wait list damage
    97ccc14d114b wifi: mt76: mt7921e: fix init command fail with enabled device
    d8985a0e44bc wifi: ath10k: Serialize wake_tx_queue ops
    1a312d5a8c84 wifi: cfg80211: fix regulatory disconnect for non-MLO
    5b2b6586c5db mmc: sdhci: fix DMA configure compatibility issue when 64bit DMA mode is used.
    30c5f362b6f5 mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS
    69bc3203513c mmc: core: disable TRIM on Micron MTFC4GACAJCN-1M
    182bf07a24c4 mmc: core: disable TRIM on Kingston EMMC04G-M627
    b50d6e06cca7 io_uring: wait interruptibly for request completions on exit
    9440b24fbcb9 irqchip/loongson-pch-pic: Fix initialization of HT vector register
    2b4e43b5ad99 NFSD: add encoding of op_recall flag for write delegation
    f672f2ca9d6f irqchip/loongson-pch-pic: Fix potential incorrect hwirq assignment
    8753eeb2d35a i2c: qup: Add missing unwind goto in qup_i2c_probe()
    b990e3760395 btrfs: do not BUG_ON() on tree mod log failure at balance_level()
    2445a35d05cd extcon: usbc-tusb320: Unregister typec port on driver removal
    ee08e1fc9480 extcon: usbc-tusb320: Convert to i2c's .probe_new()
    d5eb0375d78a dm ioctl: Avoid double-fetch of version
    27987794197e dm ioctl: have constant on the right side of the test
    fd4497aca33b dm: avoid split of quoted strings where possible
    0783867a30b5 dm: fix undue/missing spaces
    15970b0828c1 i2c: xiic: Don't try to handle more interrupt events after error
    e9fbb7c2f65e apparmor: fix missing error check for rhashtable_insert_fast
    8fb11fa48056 sh: dma: Fix DMA channel offset calculation
    b837c6923600 s390/qeth: Fix vipa deletion
    f5ea303502b9 afs: Fix accidental truncation when storing data
    4a141c3c0306 octeontx-af: fix hardware timestamp configuration
    947d741adf66 net: dsa: sja1105: always enable the send_meta options
    079dc659e31f net: dsa: tag_sja1105: fix MAC DA patching from meta frames
    97a6d99c5434 pptp: Fix fib lookup calls.
    0a1b80ff4f72 riscv: move memblock_allow_resize() after linear mapping is ready
    78c6cf1dc7de fanotify: disallow mount/sb marks on kernel internal pseudo fs
    18d78c5552d8 net/sched: act_pedit: Add size check for TCA_PEDIT_PARMS_EX
    67eb4aee2c01 xsk: Honor SO_BINDTODEVICE on bind
    6baa6e4836d7 bpf, btf: Warn but return no error for NULL btf from __register_btf_kfunc_id_set()
    cd398daabeb8 tcp: annotate data races in __tcp_oow_rate_limited()
    ced61418f469 net: fix net_dev_start_xmit trace event vs skb_transport_offset()
    6469dc1c1388 net: dsa: tag_sja1105: fix source port decoding in vlan_filtering=0 bridge mode
    fd03500476c8 net: bridge: keep ports without IFF_UNICAST_FLT in BR_PROMISC mode
    d50baa75c689 powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node
    d33b0ddf7afa powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
    c86a2517df6c ntfs: Fix panic about slab-out-of-bounds caused by ntfs_listxattr()
    a5485a943193 octeontx2-af: Add validation before accessing cgx and lmac
    bd246c92d2d5 octeontx2-af: Fix mapping for NIX block from CGX connection
    c2c5c6d2c474 f2fs: fix error path handling in truncate_dnode()
    cfdb9c1a74d8 mailbox: ti-msgmgr: Fill non-message tx data fields with 0x0
    4033b47642c7 drm/amd: Don't try to enable secure display TA multiple times
    0d4e60e23c7d drm/amdgpu: fix number of fence calculations
    d3dcdb43c872 spi: bcm-qspi: return error if neither hif_mspi nor mspi is available
    d4f5b1dd816d mlxsw: minimal: fix potential memory leak in mlxsw_m_linecards_init
    0b24d3e4b989 net: dsa: vsc73xx: fix MTU configuration
    f67ef8f9f677 ibmvnic: Do not reset dql stats on NON_FATAL err
    c07efe4dbc12 Bluetooth: MGMT: Fix marking SCAN_RSP as not connectable
    40ca66eef3d7 Bluetooth: MGMT: Use BIT macro when defining bitfields
    1a7f268ccc3c Bluetooth: MGMT: add CIS feature bits to controller information
    4aa515393f02 Bluetooth: ISO: use hci_sync for setting CIG parameters
    018b12ff1661 Bluetooth: fix invalid-bdaddr quirk for non-persistent setup
    102f3555cebe Add MODULE_FIRMWARE() for FIRMWARE_TG357766.
    f72104244714 net: dsa: tag_sja1105: always prefer source port information from INCL_SRCPT
    060d36670d50 net: dsa: sja1105: always enable the INCL_SRCPT option
    2f99d19dc620 net: dsa: felix: don't drop PTP frames with tag_8021q when RX timestamping is disabled
    e9dda2b68cb9 net: mscc: ocelot: don't keep PTP configuration of all ports in single structure
    7826202689af net: mscc: ocelot: don't report that RX timestamping is enabled by default
    a252547c8920 spi: spi-geni-qcom: enable SPI_CONTROLLER_MUST_TX for GPI DMA mode
    946edfb7d436 net/sched: act_ipt: add sanity checks on skb before calling target
    a6c9b0f7ba95 net: add a couple of helpers for iph tot_len
    201948effabf net/sched: act_ipt: add sanity checks on table name and hook locations
    1aa5a6a6d28c sctp: fix potential deadlock on &net->sctp.addr_wq_lock
    9dbcfc01d686 media: cec: i2c: ch7322: also select REGMAP
    0623f13959fd f2fs: check return value of freeze_super()
    dcb526d76835 drm/i915/guc/slpc: Apply min softlimit correctly
    61070305d520 drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times
    df53f7a3dbf4 rtc: st-lpc: Release some resources in st_rtc_probe() in case of error
    3781d0e6c11b md/raid10: fix the condition to call bio_end_io_acct()
    07e81c9208d9 pwm: mtk_disp: Fix the disable flow of disp_pwm
    75439e6cd2a3 pwm: ab8500: Fix error code in probe()
    61aad933e53d pwm: sysfs: Do not apply state to already disabled PWMs
    c8fa254b77a3 pwm: imx-tpm: force 'real_period' to be zero in suspend
    29ddfd546063 lib/bitmap: drop optimization of bitmap_{from,to}_arr64
    d986fb02a1ea phy: tegra: xusb: check return value of devm_kzalloc()
    055ea8efdfbb mfd: stmpe: Only disable the regulators if they are enabled
    f7d56de13caa hwtracing: hisi_ptt: Fix potential sleep in atomic context
    34eef9e8c8e3 clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
    94f3bcfcd17c misc: fastrpc: check return value of devm_kasprintf()
    7e3ee25e8c7c cpufreq: mediatek: correct voltages for MT7622 and MT7623
    86bfb18bad60 KVM: s390/diag: fix racy access of physical cpu number in diag 9c handler
    c78ad1060ce9 KVM: s390: vsie: fix the length of APCB bitmap
    e716693f0236 mfd: stmfx: Nullify stmfx->vdd in case of error
    18abe5f4c3c6 mfd: stmfx: Fix error path in stmfx_chip_init
    5bd9dc3e767e bus: fsl-mc: don't assume child devices are all fsl-mc devices
    e27948f329f7 nvmem: rmem: Use NVMEM_DEVID_AUTO
    27918479409d nvmem: sunplus-ocotp: release otp->clk before return
    e3a71d821e24 drivers: fwnode: fix fwnode_irq_get[_byname]()
    51ae92e329f5 device property: Clarify description of returned value in some functions
    73209e3f8ad7 device property: Fix documentation for fwnode_get_next_parent()
    852659fe834a serial: 8250_omap: Use force_suspend and resume for system suspend
    e34817340025 Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"
    22b1e2af69ec mfd: intel-lpss: Add missing check for platform_get_resource
    2e8ab6846063 mfd: wcd934x: Fix an error handling path in wcd934x_slim_probe()
    7a37abf096c2 usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
    04b1c0798deb usb: common: usb-conn-gpio: Set last role to unknown before initial detection
    155bb9b4e32e usb: dwc3: qcom: Fix an error handling path in dwc3_qcom_probe()
    63b3360d43e4 usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()
    90159b329f5c KVM: s390: fix KVM_S390_GET_CMMA_BITS for GFNs in memslot holes
    ebe83e9bb8a6 f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
    15c073e752d2 f2fs: fix potential deadlock due to unpaired node_write lock use
    2e980eb9550d gfs2: Fix duplicate should_fault_in_pages() call
    f5d7f9e15517 sh: Avoid using IRQ0 on SH3 and SH4
    d199218881d7 media: atomisp: gmin_platform: fix out_len in gmin_get_config_dsm_var()
    c8470b7de8b4 media: venus: helpers: Fix ALIGN() of non power of two
    8339bd9181b1 mfd: rt5033: Drop rt5033-battery sub-device
    6d702c7a2203 coresight: Fix loss of connection info when a module is unloaded
    76efcb6cdaf9 i3c: master: svc: fix cpu schedule in spin lock
    c0ed8b804934 lkdtm: replace ll_rw_block with submit_bh
    f5d80ad7b678 kernfs: fix missing kernfs_idr_lock to remove an ID from the IDR
    9c4f52b61804 serial: 8250: lock port for UART_IER access in omap8250_irq()
    3a1ab191e00f serial: core: lock port for start_rx() in uart_resume_port()
    65a7cfc009b3 serial: 8250: lock port for stop_rx() in omap8250_irq()
    44470207dbc5 serial: core: lock port for stop_rx() in uart_suspend_port()
    c494fe1b6663 usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
    b5ab04a19ef1 usb: hide unused usbfs_notify_suspend/resume functions
    dd9b7c89a804 usb: phy: phy-tahvo: fix memory leak in tahvo_usb_probe()
    ac961d0571b4 extcon: Fix kernel doc of property capability fields to avoid warnings
    e4c94de6ca2f extcon: Fix kernel doc of property fields to avoid warnings
    e60a827ac074 usb: gadget: u_serial: Add null pointer check in gserial_suspend
    c3b322b84ab5 usb: dwc3: qcom: Fix potential memory leak
    6aecf5e19b8a staging: vchiq_arm: mark vchiq_platform_init() static
    2ed441a76374 clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
    3c4f7d49909d clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling
    203ab7670432 clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
    b80c4629e966 clk: qcom: ipq6018: fix networking resets
    b20854ef6c49 clk: qcom: reset: support resetting multiple bits
    0e481ef854a5 media: mediatek: vcodec: using decoder status instead of core work count
    42ec6269f98e media: hi846: fix usage of pm_runtime_get_if_in_use()
    1ac45cab77d6 media: i2c: Correct format propagation for st-mipid02
    8abb53c5167c media: usb: siano: Fix warning due to null work_func_t function pointer
    e230146b86b2 media: videodev2.h: Fix struct v4l2_input tuner index comment
    cb8e8950d70e media: amphion: initiate a drain of the capture queue in dynamic resolution change
    c0d500726ce2 media: amphion: drop repeated codec data for vc1g format
    bc43061b42c0 media: amphion: drop repeated codec data for vc1l format
    a8af55f7f487 media: usb: Check az6007_read() return value
    0b3d2aa627ad clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
    792998a8cf6b clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
    f0cafc443c53 clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
    51e5f4e7206d clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
    9812b33d175c serial: 8250: omap: Fix freeing of resources on failed register
    b6e30a54a592 usb: dwc2: Fix some error handling paths
    98b6582b37da usb: dwc2: platform: Improve error reporting for problems during .remove()
    e91366b72c36 sh: j2: Use ioremap() to translate device tree address into kernel memory
    d6dd47743695 f2fs: do not allow to defragment files have FI_COMPRESS_RELEASED
    190bdec8a77f dt-bindings: power: reset: qcom-pon: Only allow reboot-mode pre-pmk8350
    c3f5604abab7 w1: fix loop in w1_fini()
    eab648537764 w1: w1_therm: fix locking behavior in convert_t
    ef047411887f SUNRPC: Fix UAF in svc_tcp_listen_data_ready()
    6f1c81886b0b btrfs: fix race when deleting free space root from the dirty cow roots list
    defc91422764 block: increment diskseq on all media change events
    28b58a8d10b3 block: change all __u32 annotations to __be32 in affs_hardblocks.h
    40d6a1261a9c block: add overflow checks for Amiga partition support
    a4c79ea1e9ed block: fix signed int overflow in Amiga partition support
    3eb4e47a94e3 ALSA: pcm: Fix potential data race at PCM memory allocation helpers
    14eb1a2b6f91 ALSA: jack: Fix mutex call in snd_jack_report()
    83c6725556d4 ALSA: hda/realtek: Add quirk for Clevo NPx0SNx
    21ce551a8592 ALSA: hda/realtek: Enable mute/micmute LEDs and limit mic boost on EliteBook
    e0d7a96b278a mm/mmap: Fix VM_LOCKED check in do_vmi_align_munmap()
    b91748bdbfb1 Revert "drm/amd/display: edp do not add non-edid timings"
    96b1bc9a6f65 iio: accel: fxls8962af: fixup buffer scan element type
    04a579517b88 iio: accel: fxls8962af: errata bug only applicable for FXLS8962AF
    fcdae54e3d2d iio: adc: ad7192: Fix internal/external clock selection
    b61f26a8a048 iio: adc: ad7192: Fix null ad7192_state pointer access
    238edc04ddb9 phy: tegra: xusb: Clear the driver reference in usb-phy dev
    c2a088413438 usb: dwc3: gadget: Propagate core init errors to UDC during pullup
    a0b369620326 USB: serial: option: add LARA-R6 01B PIDs
    f57e2c083040 md/raid1-10: fix casting from randomized structure in raid1_submit_write()
    b6872b4a7d8b x86/efi: Make efi_set_virtual_address_map IBT safe
    97669214944e arm64: sme: Use STR P to clear FFR context field in streaming SVE mode
    be54803be8b9 ksmbd: avoid field overflow warning
    babaab6ef641 smb: client: fix broken file attrs with nodfs mounts
    9fb981a86ae5 cifs: do all necessary checks for credits within or before locking
    4fe07d55a546 cifs: prevent use-after-free by freeing the cfile later
    e28d7a3f4bc5 efi/libstub: Disable PCI DMA before grabbing the EFI memory map
    1e596c181c53 kbuild: Disable GCOV for *.mod.o
    c5696a8a5484 hwrng: st - keep clock enabled while hwrng is registered
    d88158d81617 dax/kmem: Pass valid argument to memory_group_register_static
    7b8106d90572 dax: Introduce alloc_dev_dax_id()
    03859868ab82 dax: Fix dax_mapping_release() use after free
    1bf709b96250 SMB3: Do not send lease break acknowledgment if all file handles have been closed
    c2bf8d7b8f02 NFSv4.1: freeze the session table upon receiving NFS4ERR_BADSESSION
    705317843644 NFSv4.2: fix wrong shrinker_id
    08749a9005de crypto: qat - unmap buffers before free for RSA
    32b09834c3c7 crypto: qat - unmap buffer before free for DH
    da1729e6619c crypto: qat - Use helper to set reqsize
    2db49992fcec crypto: kpp - Add helper to set reqsize
    c14964fe8e95 ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
    dd872d5576cc modpost: fix off by one in is_executable_section()
    64c358c9abae crypto: jitter - correct health test during initialization
    7ab0e37f8064 crypto: marvell/cesa - Fix type mismatch warning
    6852d82e6c59 modpost: fix section mismatch message for R_ARM_{PC24,CALL,JUMP24}
    1df287bd89c7 modpost: fix section mismatch message for R_ARM_ABS32
    5a4adb1eceba crypto: nx - fix build warnings when DEBUG_FS is not enabled
    2be41ef57c5a modpost: remove broken calculation of exception_table_entry size
    22c30022cde6 hwrng: virtio - Fix race on data_avail and actual data
    8f98749d536d vfio/mdev: Move the compat_class initialization to module init
    e2e52c8dfbfd PCI: vmd: Fix uninitialized variable usage in vmd_enable_domain()
    222f64e56b35 PCI: endpoint: functions/pci-epf-test: Fix dma_chan direction
    e14379d026d5 PCI: endpoint: Fix a Kconfig prompt of vNTB driver
    38b64bdb72e0 PCI: endpoint: Fix Kconfig indent style
    4e6c406ccb6f powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
    ea356080c1cf powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
    526129937c47 riscv: uprobes: Restore thread.bad_cause
    d25166e1e9d4 PCI: qcom: Disable write access to read only registers for IP v2.9.0
    1cf0ecb0c74c PCI: qcom: Use DWC helpers for modifying the read-only DBI registers
    8640e941fd39 PCI: qcom: Use lower case for hex
    a350f1077711 PCI: qcom: Sort and group registers and bitfield definitions
    db962c7a711c PCI: qcom: Remove PCIE20_ prefix from register definitions
    865d128cab0d powerpc: update ppc_save_regs to save current r1 in pt_regs
    4cff1be1cbf6 powerpc: simplify ppc_save_regs
    d9a1aaea8560 powerpc/powernv/sriov: perform null check on iov before dereferencing iov
    0af388fce352 pinctrl: at91-pio4: check return value of devm_kasprintf()
    35404a47ba77 pinctrl: microchip-sgpio: check return value of devm_kasprintf()
    4e82f92c349e powerpc/64s: Fix VAS mm use after free
    75d65c1cc439 perf tool x86: Fix perf_env memory leak
    0dafc849b943 perf tool x86: Consolidate is_amd check into single function
    c94376dbd6cb platform/x86/dell/dell-rbtn: Fix resources leaking on error path
    9999a9f004e1 perf dwarf-aux: Fix off-by-one in die_get_varname()
    4e06e8b1f913 platform/x86: thinkpad_acpi: Fix lkp-tests warnings for platform profiles
    4309bd9e984a perf script: Fix allocation of evsel->priv related to per-event dump files
    7cfd31011135 powerpc/signal32: Force inlining of __unsafe_save_user_regs() and save_tm_user_regs_unsafe()
    af0c61c5bba0 powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
    081f642b316f kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
    c32afc7e864c pinctrl: npcm7xx: Add missing check for ioremap
    fc45a8be5e52 pinctrl:sunplus: Add check for kmalloc
    8362ea615803 platform/x86: think-lmi: Correct NVME password handling
    699b59310126 platform/x86: think-lmi: Correct System password interface
    61545eb787fe platform/x86: think-lmi: mutex protection around multiple WMI calls
    d1390b057d59 pinctrl: cherryview: Return correct value if pin in push-pull mode
    1ebe7d40ed7f perf bench: Add missing setlocale() call to allow usage of %'d style formatting
    251c6615a7e9 scsi: lpfc: Revise NPIV ELS unsol rcv cmpl logic to drop ndlp based on nlp_state
    7d3664d24f32 PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    019d4fd93a5a pinctrl: sunplus: Add check for kmalloc
    bc796f65cdc8 PCI: ftpci100: Release the clock resources
    a982c13e11fb PCI: pciehp: Cancel bringup sequence if card is not present
    6c1b079e266b scsi: 3w-xxxx: Add error handling for initialization failure in tw_probe()
    7aecdd47910c PCI/ASPM: Disable ASPM on MFD function removal to avoid use-after-free
    3a080e1b1145 platform/x86: lenovo-yogabook: Set default keyboard backligh brightness on probe()
    fa177f7011c8 platform/x86: lenovo-yogabook: Reprobe devices on remove()
    3e6c92a34660 platform/x86: lenovo-yogabook: Fix work race on remove()
    727fb7083e65 pinctrl: bcm2835: Handle gpiochip_add_pin_range() errors
    c316bde418af scsi: qedf: Fix NULL dereference in error handling
    c52502b67424 PCI: vmd: Reset VMD config register between soft reboots
    ebafa12c8f23 PCI: cadence: Fix Gen2 Link Retraining process
    79e1d940fde5 ASoC: amd: acp: clear pdm dma interrupt mask
    c6764757e843 ARM: dts: lan966x: kontron-d10: fix SPI CS
    712a7f3a06c9 ARM: dts: lan966x: kontron-d10: fix board reset
    49451db71b74 clk: Fix memory leak in devm_clk_notifier_register()
    03a705c1d7cb ASoC: imx-audmix: check return value of devm_kasprintf()
    e4f2a1feebb3 ovl: update of dentry revalidate flags after copy up
    83356d6f0ad2 drivers: meson: secure-pwrc: always enable DMA domain
    511b47f8cb8b clk: ti: clkctrl: check return value of kasprintf()
    67684f0688de clk: keystone: sci-clk: check return value of kasprintf()
    a20450f4735b clk: si5341: free unused memory on probe failure
    11581850a714 clk: si5341: check return value of {devm_}kasprintf()
    0a89a906ba9f clk: si5341: return error if one synth clock registration fails
    5470a0e81f6f clk: cdce925: check return value of kasprintf()
    0b5c9e9695f8 clk: vc5: check memory returned by kasprintf()
    af8affd12375 drm/msm/dpu: correct MERGE_3D length
    0e2c51a16fcb drm/amdgpu: Fix usage of UMC fill record in RAS
    8d68ba92554b drm/amdgpu: Fix memcpy() in sienna_cichlid_append_powerplay_table function.
    643a85190a98 arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
    846c79d2a5f6 arm64: dts: mediatek: Add cpufreq nodes for MT8192
    4e9f1a2367ae drm/msm/dp: Free resources after unregistering them
    ecf02762d476 drm/msm/dsi: Remove incorrect references to slice_count
    ef25872788e5 drm/msm/dsi: Flip greater-than check for slice_count and slice_per_intf
    937da3db61bf drm/msm/dsi: Use DSC slice(s) packet size to compute word count
    bc6d856b1c80 drm/msm/dpu: Fix slice_last_group_size calculation
    7dca0dde50af drm/msm/dpu: do not enable color-management if DSPPs are not available
    d28b83252e15 ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
    96bafece6ff3 clk: tegra: tegra124-emc: Fix potential memory leak
    b35cb0c05b8d clk: clocking-wizard: Fix Oops in clk_wzrd_register_divider()
    9ff9f928c638 clk: bcm: rpi: Fix off by one in raspberrypi_discover_clocks()
    4842a846398a arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k
    7089f1aa0b55 arm64: dts: qcom: sdm845: Flush RSC sleep & wake votes
    6317d0302655 clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
    280a5ff665e1 clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
    9ba3693b0350 clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
    1839032251a6 clk: imx: clk-imxrt1050: fix memory leak in imxrt1050_clocks_probe
    bf7ab557d64a RDMA/bnxt_re: Avoid calling wake_up threads from spin_lock context
    c9be352be9bb RDMA/bnxt_re: wraparound mbox producer index
    154bed0fd609 drm/msm/a5xx: really check for A510 in a5xx_gpu_init
    b10db1d21374 amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
    1afca9e0fe94 RDMA/rxe: Fix access checks in rxe_check_bind_mw
    0cd210c594a6 RDMA/rxe: Replace pr_xxx by rxe_dbg_xxx in rxe_mw.c
    34bbf074f729 RDMA/rxe: Add ibdev_dbg macros for rxe
    78cb71dd609b HID: uclogic: Modular KUnit tests should not depend on KUNIT=y
    1420545b8a15 drm/radeon: fix possible division-by-zero errors
    c1164aeb9691 drm/amd/display: Fix artifacting on eDP panels when engaging freesync video mode
    82934a338b4f soc: mediatek: SVS: Fix MT8192 GPU node name
    fabadad9e28d drm/amdkfd: Fix potential deallocation of previously deallocated memory.
    384717042de8 drm/amd/display: Fix a test dml32_rq_dlg_get_rq_reg()
    36786e2a7331 drm/amd/display: Fix a test CalculatePrefetchSchedule()
    4812faba0a76 clk: Export clk_hw_forward_rate_request()
    90d4c487cd65 ARM: dts: BCM5301X: fix duplex-full => full-duplex
    1ae94553dcfb hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272
    421d35912766 hwmon: (gsc-hwmon) fix fan pwm temperature scaling
    9e633411d143 ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx
    dc2707deeb8d ARM: dts: stm32: Fix audio routing on STM32MP15xx DHCOM PDK2
    03b2c470a136 Input: pm8941-powerkey - fix debounce on gen2+ PMICs
    421ce97657a8 arm64: dts: ti: k3-j7200: Fix physical address of pin
    3b4c21804076 fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
    52b04ac85f5f drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
    6878bdd75718 arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
    5d14292dba95 ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier
    766e0b6f4c96 RDMA/hns: Fix hns_roce_table_get return value
    b99395ab605f IB/hfi1: Fix wrong mmu_node used for user SDMA packet after invalidate
    ebec507398e1 RDMA/irdma: avoid fortify-string warning in irdma_clr_wqes
    750f0a302a10 soc/fsl/qe: fix usb.c build errors
    b2194d7dfc95 ARM: dts: meson8: correct uart_B and uart_C clock references
    863054be8d4d ASoC: es8316: Do not set rate constraints for unsupported MCLKs
    3b575d93020f ASoC: es8316: Increment max value for ALC Capture Target Volume control
    c02f27c2950a ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
    9f79e638d451 memory: brcmstb_dpfe: fix testing array offset after use
    09722ac9f1e5 ARM: dts: stm32: Shorten the AV96 HDMI sound card name
    666be7fef4d3 arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to kukui
    1bdb9751b4c6 arm64: dts: qcom: apq8096: fix fixed regulator name property
    75c019119ebc arm64: dts: qcom: pm7250b: add missing spmi-vadc include
    c63997426da6 ARM: omap2: fix missing tick_broadcast() prototype
    e91ffbd65533 ARM: ep93xx: fix missing-prototype warnings
    deda0761dc61 drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
    25a724c2fa3d drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec
    5044e5f2511c drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
    1d9473b88e01 arm64: dts: qcom: apq8016-sbc: Fix 1.8V power rail on LS expansion
    638d54f5c566 arm64: dts: qcom: apq8016-sbc: Fix regulator constraints
    2ad75715fc48 arm64: dts: qcom: sdm845-polaris: add missing touchscreen child node reg
    266cf247dd88 arm64: dts: qcom: sm8350: correct DMA controller unit address
    42d0fbbbf4ca arm64: dts: qcom: sm8350: Add GPI DMA compatible fallback
    aa14fefca239 arm64: dts: qcom: sdm845: correct camss unit address
    e3789d63a33b arm64: dts: qcom: sdm630: correct camss unit address
    173b6412a5c2 arm64: dts: qcom: msm8996: correct camss unit address
    4d810c12d6e1 arm64: dts: qcom: msm8994: correct SPMI unit address
    98cd40521773 arm64: dts: qcom: msm8916: correct MMC unit address
    aa2d2407f5d2 arm64: dts: qcom: msm8916: correct camss unit address
    0cff84682006 ARM: dts: qcom: msm8974: do not use underscore in node name (again)
    376daf3aa897 drm/bridge: anx7625: Prevent endless probe loop
    4536679f7911 drm/bridge: anx7625: Convert to i2c's .probe_new()
    93a03780357e ARM: dts: gta04: Move model property out of pinctrl node
    af5bcfb4f8b5 clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write
    2128318c9130 iommu/virtio: Return size mapped for a detached domain
    0f2c11ccfdcc iommu/virtio: Detach domain on endpoint release
    ed41f708b35a drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
    f4c6e5d7349e drm/msm/disp/dpu: get timing engine status from intf status register
    74abb8d3cd97 drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
    dd129da1fd74 RDMA/bnxt_re: Fix to remove an unnecessary log
    c37eca42ac6b RDMA/bnxt_re: Remove a redundant check inside bnxt_re_update_gid
    66eb6c47b570 RDMA/bnxt_re: Use unique names while registering interrupts
    f2279e3e3876 RDMA/bnxt_re: Fix to remove unnecessary return labels
    b43b06449870 RDMA/bnxt_re: Disable/kill tasklet only if it is enabled
    280e58d8b0e9 hwmon: (f71882fg) prevent possible division by zero
    08cc7cd2c2a2 clk: imx: scu: use _safe list iterator to avoid a use after free
    3fc9637f37a7 drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
    929b6c6e6a56 arm64: dts: microchip: sparx5: do not use PSCI on reference boards
    13602e613246 bus: ti-sysc: Fix dispc quirk masking bool variables
    46a8dff2103b ARM: dts: stm32: Move ethernet MAC EEPROM from SoM to carrier boards
    7a3c39e34cab drm/vkms: Fix RGB565 pixel conversion
    048b7168acf8 drm: Add fixed-point helper to get rounded integer values
    fa4ee16e814a drm/vkms: isolate pixel conversion functionality
    9d59f5f52cb4 ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
    49fca83f6f3f driver: soc: xilinx: use _safe loop iterator to avoid a use after free
    39bdb97f8720 drm/panel: sharp-ls043t1le01: adjust mode settings
    aeca0e1c3374 drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
    ac96a15163f5 Input: adxl34x - do not hardcode interrupt trigger type
    3134cc51e996 clk: rs9: Fix .driver_data content in i2c_device_id
    6014e7422c8d clk: vc7: Fix .driver_data content in i2c_device_id
    53b5b4d1a80e clk: vc5: Fix .driver_data content in i2c_device_id
    4db655d1b25d bootmem: remove the vmemmap pages from kmemleak in free_bootmem_page
    548b67c0aad4 clk: vc5: Use `clamp()` to restrict PLL range
    50fb32197f60 mm: call arch_swap_restore() from do_swap_page()
    5cf97c2df27f ARM: dts: meson8b: correct uart_B and uart_C clock references
    2b55a9857278 ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
    2dc8b685d99c drm/vram-helper: fix function names in vram helper doc
    8e739c8c6efb drm/bridge: tc358768: fix THS_TRAILCNT computation
    010f68aecde4 drm/bridge: tc358768: fix TXTAGOCNT computation
    7b1931573702 drm/bridge: tc358768: fix THS_ZEROCNT computation
    2545a8d06ad8 drm/bridge: tc358768: fix TCLK_TRAILCNT computation
    587ba0805e4f drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
    06dc491cf4e3 drm/bridge: tc358768: fix TCLK_ZEROCNT computation
    9d56ec0b24bf drm/bridge: tc358768: fix PLL target frequency
    d2aad3c1e400 drm/bridge: tc358768: fix PLL parameters computation
    c4cf126320bc drm/bridge: tc358768: always enable HS video mode
    63f3bc83b1df drm/bridge: ti-sn65dsi83: Fix enable error path
    df3b7e337d71 Input: drv260x - sleep between polling GO bit
    9d27705e3ce1 drm/bridge: it6505: Move a variable assignment behind a null pointer check in receive_timing_debugfs_show()
    9fbe61e3c245 drm/amd/display: Explicitly specify update type per plane info change
    cb86b0e3d9d3 radeon: avoid double free in ci_dpm_init()
    064e33b3591e drm/amd/display: Add logging for display MALL refresh setting
    3b3186c77020 netlink: Add __sock_i_ino() for __netlink_diag_dump().
    f6d2e25c647f ipvlan: Fix return value of ipvlan_queue_xmit()
    d6cf5026af73 netfilter: nf_conntrack_sip: fix the ct_sip_parse_numerical_param() return value.
    5c618daa5038 netfilter: conntrack: dccp: copy entire header to stack buffer, not just basic one
    cfcb9f0a499d lib/ts_bm: reset initial match offset for every block of text
    425d9d3a92df net: nfc: Fix use-after-free caused by nfc_llcp_find_local
    446f55679343 sfc: fix crash when reading stats while NIC is resetting
    94817712b500 ocfs2: Fix use of slab data with sendpage
    8c438ff5d9e3 net: axienet: Move reset before 64-bit DMA detection
    17d6b6354f00 gtp: Fix use-after-free in __gtp_encap_destroy().
    b48c24392d86 selftests: rtnetlink: remove netdevsim device after ipsec offload test
    37b6143376a5 bonding: do not assume skb mac_header is set
    e9331c8fa4c6 netlink: do not hard code device address lenth in fdb dumps
    61ffe8b1ee08 netlink: fix potential deadlock in netlink_set_err()
    509d5d40c249 net: stmmac: fix double serdes powerdown
    12bcb533280b can: kvaser_pciefd: Set hardware timestamp on transmitted packets
    70ace9ba2052 can: kvaser_pciefd: Add function to set skb hwtstamps
    787b4042098f can: length: fix bitstuffing count
    cfb310623413 bpf: Fix bpf socket lookup from tc/xdp to respect socket VRF bindings
    c7415c521abd bpf: Call __bpf_sk_lookup()/__bpf_skc_lookup() directly via TC hookpoint
    5e9b38de6633 bpf: Factor out socket lookup functions for the TC hookpoint.
    e3754e97414e wifi: ath9k: convert msecs to jiffies where needed
    52bc4b89cdee wifi: iwlwifi: mvm: indicate HW decrypt for beacon protection
    ed98f5c07491 mmc: Add MMC_QUIRK_BROKEN_SD_CACHE for Kingston Canvas Go Plus from 11/2019
    f114b159b2c1 wifi: ieee80211: Fix the common size calculation for reconfiguration ML
    ffb0733664cc wifi: cfg80211/mac80211: Fix ML element common size calculation
    132b7129c5fe wifi: cfg80211: fix regulatory disconnect with OCB/NAN
    27268ba34774 wifi: cfg80211: drop incorrect nontransmitted BSS update code
    0862669693cf wifi: cfg80211: rewrite merging of inherited elements
    d875120c3520 wifi: mac80211: Remove "Missing iftype sband data/EHT cap" spam
    2d690495eb27 wifi: iwlwifi: pcie: fix NULL pointer dereference in iwl_pcie_irq_rx_msix_handler()
    657a83f079ba wifi: iwlwifi: pull from TXQs with softirqs disabled
    41b1704fad64 wifi: ath11k: Add missing check for ioremap
    228dd5d5fda0 rtnetlink: extend RTEXT_FILTER_SKIP_STATS to IFLA_VF_INFO
    c682018f5c92 wifi: mac80211: Fix permissions for valid_links debugfs entry
    41fc1c56787f wifi: ath9k: Fix possible stall on ath9k_txq_list_has_key()
    16b5292beeee memstick r592: make memstick_debug_get_tpc_name() static
    93126e39662b mmc: mediatek: Avoid ugly error message when SDIO wakeup IRQ isn't used
    fd4f89302fe0 kexec: fix a memory leak in crash_shrink_memory()
    6525435d147b watchdog/perf: more properly prevent false positives with turbo modes
    a3cf423b582a watchdog/perf: define dummy watchdog_update_hrtimer_threshold() on correct config
    b27af27fc9d5 selftests: cgroup: fix unexpected failure on test_memcg_low
    75704a10eac2 ice: handle extts in the miscellaneous interrupt thread
    77f09d836bc9 wifi: rsi: Do not set MMC_PM_KEEP_POWER in shutdown
    eb205a069081 wifi: rsi: Do not configure WoWlan in shutdown hook if not enabled
    54257a763443 selftests/bpf: Fix check_mtu using wrong variable type
    da79a0bc36c5 wifi: mac80211: recalc min chandef for new STA links
    272240f20df3 wifi: ath10k: Trigger STA disconnect after reconfig complete on hardware restart
    cf5beb8ce97a samples/bpf: xdp1 and xdp2 reduce XDPBUFSIZE to 60
    09740fa9827c wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes
    0d89e50952b5 wifi: ray_cs: Fix an error handling path in ray_probe()
    3d218755c4b6 wifi: wl3501_cs: Fix an error handling path in wl3501_probe()
    d5569b970b81 wifi: atmel: Fix an error handling path in atmel_probe()
    e48b7c2416d9 wifi: orinoco: Fix an error handling path in orinoco_cs_probe()
    9a201822ade5 wifi: orinoco: Fix an error handling path in spectrum_cs_probe()
    4fc6481323df regulator: core: Streamline debugfs operations
    6a241e6b9ed2 regulator: core: Fix more error checking for debugfs_create_dir()
    be84e69082b2 selftests/bpf: Do not use sign-file as testcase
    20109ddd5bea bpf: Fix memleak due to fentry attach failure
    8ea165e1f89d bpf: Remove bpf trampoline selector
    1949721c741b bpftool: JIT limited misreported as negative value on aarch64
    bac93b35f973 nfc: llcp: fix possible use of uninitialized variable in nfc_llcp_send_connect()
    34d04d70194d spi: dw: Round of n_bytes to power of 2
    c6a9fc82fe18 bpf: Don't EFAULT for {g,s}setsockopt with wrong optlen
    34fe7aa8ef1d libbpf: fix offsetof() and container_of() to work with CO-RE
    8404f8de1e23 sctp: add bpf_bypass_getsockopt proto callback
    f21f2ae56210 wifi: mwifiex: Fix the size of a memory allocation in mwifiex_ret_802_11_scan()
    51cb8329f210 wifi: wilc1000: fix for absent RSN capabilities WFA testcase
    ded1a7a570b0 spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
    56c25f2763a1 samples/bpf: Fix buffer overflow in tcp_basertt
    a7434a4dcc71 libbpf: btf_dump_type_data_check_overflow needs to consider BTF_MEMBER_BITFIELD_SIZE
    d1c2ff2bd84c wifi: ath9k: avoid referencing uninit memory in ath9k_wmi_ctrl_rx
    6928d6e9b094 wifi: ath9k: fix AR9003 mac hardware hang check register offset calculation
    bb3a9ed2b11a igc: Enable and fix RX hash usage by netstack
    f57ba91a46d3 pstore/ram: Add check for kstrdup
    2672144b86a1 ima: Fix build warnings
    9085f2ca941f evm: Fix build warnings
    b050ade6e05b evm: Complete description of evm_inode_setattr()
    ea1432a402ab locking/atomic: arm: fix sync ops
    6b54f5c68474 x86/mm: Fix __swp_entry_to_pte() for Xen PV guests
    3745f628c328 perf/ibs: Fix interface via core pmu events
    64d09c0e832d kselftest: vDSO: Fix accumulation of uninitialized ret when CLOCK_REALTIME is undefined
    b8a6ba524d41 rcu/rcuscale: Stop kfree_scale_thread thread(s) after unloading rcuscale
    3506e64ec161 rcu/rcuscale: Move rcu_scale_*() after kfree_scale_cleanup()
    7a3492219408 rcuscale: Move shutdown from wait_event() to wait_event_idle()
    a0a1f1c92488 rcutorture: Correct name of use_softirq module parameter
    b1cdc56bc177 rcu-tasks: Stop rcu_tasks_invoke_cbs() from using never-onlined CPUs
    d58f0f0ce633 rcu: Make rcu_cpu_starting() rely on interrupts being disabled
    5d56a8d670a5 thermal/drivers/sun8i: Fix some error handling paths in sun8i_ths_probe()
    2b7e2251c434 cpufreq: intel_pstate: Fix energy_performance_preference for passive
    50d64210eeb1 ARM: 9303/1: kprobes: avoid missing-declaration warnings
    3f9e54eb38ea PM: domains: Move the verification of in-params from genpd_add_device()
    f1f5248cedde powercap: RAPL: Fix CONFIG_IOSF_MBI dependency
    be9c8c9c84b6 drivers/perf: hisi: Don't migrate perf to the CPU going to teardown
    6b025ec148e8 x86/tdx: Fix race between set_memory_encrypted() and load_unaligned_zeropad()
    c598fefef321 x86/mm: Allow guest.enc_status_change_prepare() to fail
    3e03681f0720 perf/arm-cmn: Fix DTC reset
    6368a71dca09 PM: domains: fix integer overflow issues in genpd_parse_state()
    919dd531ebb7 clocksource/drivers/cadence-ttc: Fix memory leak in ttc_timer_probe
    2d3f42d22f32 tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    77cc52f1b8d7 tick/rcu: Fix bogus ratelimit condition
    e7aff15ba29b posix-timers: Prevent RT livelock in itimer_delete()
    9a534100382a erofs: fix compact 4B support for 16k block size
    ec94df6bcfb0 erofs: simplify iloc()
    423453bb506e svcrdma: Prevent page release when nothing was received
    faf004e98d02 irqchip/jcore-aic: Fix missing allocation of IRQ descriptors
    0cf83d3698fb irqchip/stm32-exti: Fix warning on initialized field overwritten
    aa07e56c6a9c block: fix blktrace debugfs entries leakage
    067c08f78dd1 md/raid1-10: submit write io directly if bitmap is not enabled
    f98b89fbf8fa md/raid1-10: factor out a helper to submit normal write
    fa0f13a8338f md/raid1-10: factor out a helper to add bio to plug
    a5a1ec06ef2f md/raid10: fix io loss while replacement replace rdev
    222cc459d598 md/raid10: fix null-ptr-deref of mreplace in raid10_sync_request
    05d10428e8df md/raid10: fix wrong setting of max_corr_read_errors
    b5cb16d31b8a md/raid10: fix overflow of md/safe_mode_delay
    be1a3ec63a84 md/raid10: check slab-out-of-bounds in md_bitmap_get_counter
    e1379e067b94 nvme-core: fix dev_pm_qos memleak
    bf3c2caab9d1 nvme-core: add missing fault-injection cleanup
    a584cf03ff8b nvme-auth: don't ignore key generation failures when initializing ctrl keys
    43d0724d756a nvme-core: fix memory leak in dhchap_ctrl_secret
    2e9b14130755 nvme-core: fix memory leak in dhchap_secret_store
    0a220ef9dda6 nvme-auth: no need to reset chap contexts on re-authentication
    3999c850e78a nvme-auth: remove symbol export from nvme_auth_reset
    9de0a1dfe3e6 nvme-auth: rename authentication work elements
    3f6c98889780 nvme-auth: rename __nvme_auth_[reset|free] to nvme_auth[reset|free]_dhchap
    ce16368280c9 lockd: drop inappropriate svc_get() from locked_get()
    931bd6758bcc blk-mq: fix potential io hang by wrong 'wake_batch'
    c2a0eb3b2017 virt: sevguest: Add CONFIG_CRYPTO dependency
    7ca5e95f2a3e x86/sev: Fix calculation of end address based on number of pages
    8ceeb3fc86a8 blk-iocost: use spin_lock_irqsave in adjust_inuse_and_calc_cost
    c0df91653586 x86/resctrl: Only show tasks' pid in current pid namespace
    d3b39ea24835 erofs: kill hooked chains to avoid loops on deduplicated compressed images
    daed10290bc7 erofs: move zdata.h into zdata.c
    041ff2c21b00 erofs: remove tagged pointer helpers
    3379f13ebc1e erofs: avoid tagged pointers to mark sync decompression
    3564500b0d1e erofs: clean up cached I/O strategies
    73b9d7ea08e2 block: Fix the type of the second bdev_op_is_zoned_write() argument
    0fd958feaee1 fs: pipe: reveal missing function protoypes
    9f12effd40d7 drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5804204cb92dae78c78f8c0054959e4b2a255a32)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d4488b360c..e8b2566cd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "efb2c857761e865cd7947aab42eaa5ba77ef6ee7"
-SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
+SRCREV_machine ?= "f3cd63990e848c0956ce688ccc0cb2ec3f867e7d"
+SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.38"
+LINUX_VERSION ?= "6.1.41"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 4e45e25975..a7a3d2bdd9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.38"
+LINUX_VERSION ?= "6.1.41"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
+SRCREV_machine ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index be194ffdf9..7667eebb2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a74344429a095a5941cd8dfac532160349344c92"
-SRCREV_machine:qemuarm64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemuloongarch64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemumips ?= "78c81e178f8e2ffbb7c03cd324cf50ee0c5c4cf2"
-SRCREV_machine:qemuppc ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemuriscv64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemuriscv32 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemux86 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemux86-64 ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_machine:qemumips64 ?= "6c6b1170464e1f64f78a45cf7e78d5c678f38f48"
-SRCREV_machine ?= "b110cf9bbc395fe757956839d8110e72368699f4"
-SRCREV_meta ?= "cba89f406c6e07a16018cb77b51950cbae8ec654"
+SRCREV_machine:qemuarm ?= "a8246bf155b45ca59c6ec3d324f4eab9cdc7129f"
+SRCREV_machine:qemuarm64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemuloongarch64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemumips ?= "37550d5e3ac0ac65a8899c82e7e72a2dfe4bb8b5"
+SRCREV_machine:qemuppc ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemuriscv64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemuriscv32 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemux86 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemux86-64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_machine:qemumips64 ?= "9de56faddff17d49695cd2f98a13668c99c48ba4"
+SRCREV_machine ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
+SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "61fd484b2cf6bc8022e8e5ea6f693a9991740ac2"
+SRCREV_machine:class-devupstream ?= "5302e81aa2091d7dd59803f0727d1ba35ed2f929"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.38"
+LINUX_VERSION ?= "6.1.41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


