Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882B4C04A94
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 04:01:37 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.54244.1691467289519017068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 21:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e0ZwHoPG;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-40fc670197aso27814361cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 21:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691467288; x=1692072088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q31w2Z7MZMNipuGw4ObNPNpj86HugP2dUZx8YR5R80=;
        b=e0ZwHoPGHJLkArmSyYNKQD/kyKZSiLkuju6/2wG881bmdAUGHQTOOYidmryPV/CEe/
         ZkNQBfsfeHfBSWD70kz86l9nAVaajGNU4RS85rNfdbJDUcj2Mtgc+qog3x9GbXdJVDkD
         +cOrX/VfmAFX8Gu0jypzJ3XD9IEXps4h1IpOcL3mNayyX913e+z8n9sHNwBsNs27JqtE
         aRWpFfRsbJGhI68xSnK6ISxq3SdY9XYeaHAWr2AaTM2hPQ/F6tz6RL6+IYPbYtKT2om3
         cM4Dtud7m7qJ5+Lkz6wXV4schTp0LckUhVQfmcwMdlNioYYakBV5z/9der38lc+OgQfH
         1enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691467288; x=1692072088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4q31w2Z7MZMNipuGw4ObNPNpj86HugP2dUZx8YR5R80=;
        b=MkhcbLWsvsL6BNhZVwM4htY2JVqFWI7rXkJiMX01bD9zhOoUOSNmnTLoWjuisPHXF/
         ABVyGnB2BXb2z0t+L4YMU1QZ7+3ewDJpBoLpfLRvKInuLeKJe5JSuYo0diU1Hs05TNCh
         CSuL951ycbPRNnl3oC70j2X+LfIl2xVr2Usd9NJ0LSqXfHc852UOshb0cKpfuyb1e+QN
         XgBNQgGxzcS4SUsNeVmHPDyw+FPGUt0EQ3U3nFHSiJLMfqmxpmWv1A+Wov9+ZjDFnXrb
         JpR4gSGyY0jPRw3Zz+P2OQdmN9Mib6J4Cz+wZM8McK7sHCrHCIWnktAu2NTsiyJs2+HN
         MZEg==
X-Gm-Message-State: AOJu0YyUz5R9HAhBNbvFdGUvfstHbiMj6EjQm1u+WaoepmtlTivlfOaw
	/8ApbDh2pTA+pg2tgOPsOEW4feqL3u9B0A==
X-Google-Smtp-Source: AGHT+IHm6utbTzfQs2Z2jI5dkIkT+mprTY9zAy700Wf8DpfAb+wqNh12HjQGwOHr6g+5nmveDAF0Bw==
X-Received: by 2002:a05:622a:120d:b0:40e:2e60:e3d4 with SMTP id y13-20020a05622a120d00b0040e2e60e3d4mr11888050qtx.31.1691467288231;
        Mon, 07 Aug 2023 21:01:28 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r4-20020ac85e84000000b00406b11a54b8sm3112656qtx.7.2023.08.07.21.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 21:01:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/3] linux-yocto/5.10: update to v5.10.188
Date: Tue,  8 Aug 2023 00:01:24 -0400
Message-Id: <20230808040124.3231454-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808040124.3231454-1-bruce.ashfield@gmail.com>
References: <20230808040124.3231454-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 04:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185646

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3602dbc57b55 Linux 5.10.188
    edce5fba78cc ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()
    115b19f89353 ftrace: Store the order of pages allocated in ftrace_page
    1a1e793e021d tracing: Fix memory leak of iter->temp when reading trace_pipe
    43e786aa51b8 tracing/histograms: Return an error if we fail to add histogram to hist_vars list
    e3da59f42820 net: phy: prevent stale pointer dereference in phy_init()
    e0ac63e194f4 tcp: annotate data-races around fastopenq.max_qlen
    d01afbfc2f7d tcp: annotate data-races around icsk->icsk_user_timeout
    3cf0a0f11d39 tcp: annotate data-races around tp->notsent_lowat
    9c786d5faf3a tcp: annotate data-races around rskq_defer_accept
    f891375eba6e tcp: annotate data-races around tp->linger2
    9168bd8f54c5 tcp: annotate data-races around icsk->icsk_syn_retries
    7b0084918c5f tcp: Fix data-races around sysctl_tcp_syn(ack)?_retries.
    cf6c06ac7487 net: Introduce net.ipv4.tcp_migrate_req.
    a5c30a518764 tcp: annotate data-races around tp->keepalive_probes
    93715448f116 tcp: annotate data-races around tp->keepalive_intvl
    7b52a78a91fd tcp: annotate data-races around tp->keepalive_time
    1d4f2c4be136 tcp: annotate data-races around tp->tcp_tx_delay
    30e5460d69e6 netfilter: nf_tables: skip bound chain on rule flush
    94c10c0fa51b netfilter: nf_tables: skip bound chain in netns release path
    3a91099ecd59 netfilter: nft_set_pipapo: fix improper element removal
    9c2df17e3cfc netfilter: nf_tables: can't schedule in nft_chain_validate
    533193a23914 netfilter: nf_tables: fix spurious set element insertion failure
    a6f1988780a7 llc: Don't drop packet from non-root netns.
    49e435ca02c7 fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe
    bc9d4d432f78 Revert "tcp: avoid the lookup process failing to get sk in ehash table"
    d06fc7b39199 net:ipv6: check return value of pskb_trim()
    1a478ad1297a net: ipv4: Use kfree_sensitive instead of kfree
    937105d2b0bf tcp: annotate data-races around tcp_rsk(req)->ts_recent
    41b00238699a octeontx2-pf: Dont allocate BPIDs for LBK interfaces
    5bc78ba88905 security: keys: Modify mismatched function name
    b92defe4e8ee iavf: Fix out-of-bounds when setting channels on remove
    a4635f190f33 iavf: Fix use-after-free in free_netdev
    b37bc3b07eab bridge: Add extack warning when enabling STP in netns.
    f6d311b95394 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()
    54aa4c03861e pinctrl: amd: Use amd_pinconf_set() for all config options
    7041605e8594 fbdev: imxfb: warn about invalid left/right margin
    6e88cc510f27 spi: bcm63xx: fix max prepend length
    994c2ceb70ea igb: Fix igb_down hung on surprise removal
    a956c3af70fa wifi: iwlwifi: mvm: avoid baid size integer overflow
    85cf0d5f45cb wifi: wext-core: Fix -Wstringop-overflow warning in ioctl_standard_iw_point()
    2864cc9a1fd1 devlink: report devlink_port_type_warn source device
    b6d9a4062c94 bpf: Address KCSAN report on bpf_lru_list
    532f8bac6041 wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range
    6b0c79aa3307 sched/fair: Don't balance task to its current running CPU
    32020fc2a837 arm64: mm: fix VA-range sanity check
    c71d6934c6ac arm64: set __exception_irq_entry with __irq_entry as a default
    71e3f2354072 ACPI: video: Add backlight=native DMI quirk for Lenovo ThinkPad X131e (3371 AMD version)
    776a72f612a8 ACPI: video: Add backlight=native DMI quirk for Apple iMac11,3
    e090f70ae4cc ACPI: button: Add lid disable DMI quirk for Nextbook Ares 8A
    ae51eb90bcca btrfs: add xxhash to fast checksum implementations
    322377cc909d posix-timers: Ensure timer ID search-loop limit is valid
    634daf6b2c81 md/raid10: prevent soft lockup while flush writes
    b02939413e5c md: fix data corruption for raid456 when reshape restart while grow up
    4a2c62c8d67c nbd: Add the maximum limit of allocated index in nbd_dev_add
    5f84a34b646f debugobjects: Recheck debug_objects_enabled before reporting
    5d5aa5b64887 ext4: correct inline offset when handling xattrs in inode body
    48aa53937584 ASoC: fsl_sai: Disable bit clock with transmitter
    5f2a12f64347 drm/client: Fix memory leak in drm_client_modeset_probe
    105275879a80 drm/client: Fix memory leak in drm_client_target_cloned
    cf254b4f68e4 can: bcm: Fix UAF in bcm_proc_show()
    3e412b6e2b57 regmap: Account for register length in SMBus I/O limits
    8b3dd8d23fa0 regmap: Drop initial version of maximum transfer length fixes
    4935761daa33 selftests: tc: add 'ct' action kconfig dep
    1ab5aa1846a5 selftests: tc: set timeout to 15 minutes
    dad97c205af2 fuse: revalidate: don't invalidate if interrupted
    d2c667cc1831 btrfs: fix warning when putting transaction with qgroups enabled after abort
    4410f4a938ae perf probe: Add test for regression introduced by switch to die_get_decl_file()
    0a6b0ca58685 keys: Fix linking a duplicate key to a keyring's assoc_array
    a26208e184ae ALSA: hda/realtek: Enable Mute LED on HP Laptop 15s-eq2xxx
    ce2a7e7b504c ALSA: hda/realtek - remove 3k pull low procedure
    f09c0ac142c5 drm/atomic: Fix potential use-after-free in nonblocking commits
    9a085fa9b7d6 RDMA/cma: Ensure rdma_addr_cancel() happens before issuing more requests
    73e72a5380a2 net/sched: sch_qfq: reintroduce lmax bound check for MTU
    0b1ce92fabdb scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
    5addd62586a9 scsi: qla2xxx: Pointer may be dereferenced
    e8de73238d5d scsi: qla2xxx: Correct the index of array
    921d68446255 scsi: qla2xxx: Check valid rport returned by fc_bsg_to_rport()
    2bea9c1c9831 scsi: qla2xxx: Fix potential NULL pointer dereference
    eecb8a491c82 scsi: qla2xxx: Fix buffer overrun
    bcd773969a87 scsi: qla2xxx: Array index may go out of bound
    a9fe97fb7b4e scsi: qla2xxx: Wait for io return on terminate rport
    6ea2a408d3e3 tracing/probes: Fix not to count error code to total length
    7060e5aac6dc tracing: Fix null pointer dereference in tracing_err_log_open()
    81fb8a58d4ec xtensa: ISS: fix call to split_if_spec
    5e68f1f3a20f ring-buffer: Fix deadloop issue on reading trace_pipe
    1e760b2d18bf net: ena: fix shift-out-of-bounds in exponential backoff
    1f2a8f083575 samples: ftrace: Save required argument registers in sample trampolines
    1576f0df7b4d tracing/histograms: Add histograms to hist_vars if they have referenced variables
    07edd294b16a s390/decompressor: fix misaligned symbol build error
    5f4a1111ad04 Revert "8250: add support for ASIX devices with a FIFO bug"
    7f2f0e6ec561 meson saradc: fix clock divider mask length
    790e4e82c57d xhci: Show ZHAOXIN xHCI root hub speed correctly
    c52e04c58ded xhci: Fix TRB prefetch issue of ZHAOXIN hosts
    b56a07c2a550 xhci: Fix resume issue of some ZHAOXIN hosts
    8e807eadf0b9 ceph: don't let check_caps skip sending responses for revoke msgs
    c04ed61ebf01 firmware: stratix10-svc: Fix a potential resource leak in svc_create_memory_pool()
    1962717c4649 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
    a49e5a05121c tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
    08673739ed85 serial: atmel: don't enable IRQs prematurely
    4016d36fec63 drm/amd/display: Correct `DMUB_FW_VERSION` macro
    d89bd2ecd39b drm/rockchip: vop: Leave vblank enabled in self-refresh
    b9ec9372a47a drm/atomic: Allow vblank-enabled + self-refresh "disable"
    23d5004ee7aa fs: dlm: return positive pid value for F_GETLK
    5e9aff5b10c2 md/raid0: add discard support for the 'original' layout
    8e3c7776405a misc: pci_endpoint_test: Re-init completion for every test
    cdf9a7e2cdc7 misc: pci_endpoint_test: Free IRQs before removing the device
    8c90c466e38e PCI: rockchip: Set address alignment for endpoint mode
    f1986416cfb4 PCI: rockchip: Use u32 variable to access 32-bit registers
    36eb13031227 PCI: rockchip: Fix legacy IRQ generation for RK3399 PCIe endpoint core
    c417a4c7de1d PCI: rockchip: Add poll and timeout to wait for PHY PLLs to be locked
    ddda61419af3 PCI: rockchip: Write PCI Device ID to correct register
    bec3e0f7f272 PCI: rockchip: Assert PCI Configuration Enable bit after probe
    48e11e7c81b9 PCI: qcom: Disable write access to read only registers for IP v2.3.3
    aca71b004a66 PCI: Add function 1 DMA alias quirk for Marvell 88SE9235
    d3bab5de91c6 PCI/PM: Avoid putting EloPOS E2/S2/H2 PCIe Ports in D3cold
    5a89a5cc817e hwrng: imx-rngc - fix the timeout for init and self check
    47b7eaae08e8 jfs: jfs_dmap: Validate db_l2nbperpage while mounting
    84293af5455b ext4: only update i_reserved_data_blocks on successful block allocation
    0a5d12e7107e ext4: fix wrong unit use in ext4_mb_new_blocks
    514220246aa8 ext4: get block from bh in ext4_free_blocks for fast commit replay
    d054422eb609 ext4: fix wrong unit use in ext4_mb_clear_bb
    be99faf0c4db ext4: Fix reusing stale buffer heads from last failed mounting
    8fbe951d6546 MIPS: Loongson: Fix cpu_probe_loongson() again
    8c723eef989b erofs: fix compact 4B support for 16k block size
    3bd4d316b1a8 misc: fastrpc: Create fastrpc scalar with correct buffer count
    3d1d037f2749 powerpc: Fail build if using recordmcount with binutils v2.37
    fe1ae1fb507a net: bcmgenet: Ensure MDIO unregistration has clocks enabled
    21d5d3eb36bf mtd: rawnand: meson: fix unaligned DMA buffers handling
    9ff7fcb3a2ed tpm: tpm_vtpm_proxy: fix a race condition in /dev/vtpmx creation
    59490249c2c0 pinctrl: amd: Only use special debounce behavior for GPIO 0
    4f77a87ce919 pinctrl: amd: Detect internal GPIO0 debounce handling
    3674b9c056ad pinctrl: amd: Fix mistake in handling clearing pins at startup
    b39ef5b52f10 f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
    f4ff37981235 nvme-pci: fix DMA direction of unmapping integrity data
    8359ee85fd6d net/sched: sch_qfq: account for stab overhead in qfq_enqueue
    5bef780e06d2 net/sched: sch_qfq: refactor parsing of netlink parameters
    1d7ae38daac7 net/sched: make psched_mtu() RTNL-less safe
    d5ca61b7642b netdevsim: fix uninitialized data in nsim_dev_trap_fa_cookie_write()
    9b69cdb6e534 net/sched: flower: Ensure both minimum and maximum ports are specified
    934c85b8ecd1 wifi: airo: avoid uninitialized warning in airo_get_rate()
    4511499138ae erofs: avoid infinite loop in z_erofs_do_read_page() when reading beyond EOF
    bbc500ff3f2c riscv, bpf: Fix inconsistent JIT image generation
    a976adc3bca4 bpf, riscv: Support riscv jit to provide bpf_line_info
    eb3d1d84f3d6 riscv: bpf: Avoid breaking W^X
    7c616437981f riscv: bpf: Move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
    83579a626169 igc: Fix inserting of empty frame for launchtime
    c48e8ee81ad3 igc: Fix launchtime before start of cycle
    cdf5b9af92da platform/x86: wmi: Break possible infinite loop when parsing GUID
    7157ee0de522 platform/x86: wmi: move variables
    4bb2bb69bd9a platform/x86: wmi: use guid_t and guid_equal()
    88dfb592d2c1 platform/x86: wmi: remove unnecessary argument
    2ad31ce40e81 ipv6/addrconf: fix a potential refcount underflow for idev
    8271145523a5 NTB: ntb_tool: Add check for devm_kcalloc
    41c6d8ff71cd NTB: ntb_transport: fix possible memory leak while device_register() fails
    03cfa0653406 ntb: intel: Fix error handling in intel_ntb_pci_driver_init()
    23e09f0a868f NTB: amd: Fix error handling in amd_ntb_pci_driver_init()
    0bb2683b0cde ntb: idt: Fix error handling in idt_pci_driver_init()
    3e8fed805cf3 udp6: fix udp6_ehashfn() typo
    d30ddd7ff15d icmp6: Fix null-ptr-deref of ip6_null_entry->rt6i_idev in icmp6_dev().
    bc3ab5d2ab69 net: prevent skb corruption on frag list segmentation
    cddd04f34124 net: bgmac: postpone turning IRQs off to avoid SoC hangs
    f8cc4fd99a32 ionic: remove WARN_ON to prevent panic_on_warn
    9085429821b4 gve: Set default duplex configuration to full
    80e0e8d5f543 net/sched: cls_fw: Fix improper refcount update leads to use-after-free
    d341f246123e net: mvneta: fix txq_map in case of txq_number==1
    c175603d84d3 scsi: qla2xxx: Fix error code in qla2x00_start_sp()
    b687b7836157 igc: set TP bit in 'supported' and 'advertising' fields of ethtool_link_ksettings
    30c281a77fb1 net/mlx5e: Check for NOT_READY flag state after locking
    de6e6b07974c net/mlx5e: fix double free in mlx5e_destroy_flow_table
    3d4bba694aed igc: Remove delay during TX ring configuration
    2a587b71c532 drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags
    547ab8ea86c1 drm/panel: simple: Add connector_type for innolux_at043tn24
    13c353dc5c2e workqueue: clean up WORK_* constant types, clarify masking
    fc359e5b45da net: lan743x: Don't sleep in atomic context
    dc4a25fa7565 io_uring: add reschedule point to handle_tw_list()
    297883bbcab1 io_uring: Use io_schedule* in cqring wait
    bb2f7e4bfe81 block/partition: fix signedness issue for Amiga partitions
    4f91de9a81bd rcu-tasks: Simplify trc_read_check_handler() atomic operations
    3a64cd01cdd6 rcu-tasks: Mark ->trc_reader_special.b.need_qs data races
    058f077d09ba rcu-tasks: Mark ->trc_reader_nesting data races
    83be9fd7843c tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
    999f3b6104ed wireguard: netlink: send staged packets when setting initial private key
    1b7107040596 wireguard: queueing: use saner cpu selection wrapping
    ea213922249c netfilter: nf_tables: prevent OOB access in nft_byteorder_eval
    4ae2e501331a netfilter: nf_tables: do not ignore genmask when looking up chain by id
    8289d422f5e4 netfilter: conntrack: Avoid nf_ct_helper_hash uses after free
    be6478f5cce6 netfilter: nf_tables: fix scheduling-while-atomic splat
    a07e415be383 netfilter: nf_tables: unbind non-anonymous set if rule construction fails
    a136b7942ad2 netfilter: nf_tables: drop map element references from preparation phase
    21cf0d66ef88 netfilter: nftables: rename set element data activation/deactivation functions
    237f37f7b9f0 netfilter: nf_tables: reject unbound chain set before commit phase
    0205dd16edeb netfilter: nf_tables: reject unbound anonymous set before commit phase
    34d09fe49f59 netfilter: nf_tables: add NFT_TRANS_PREPARE_ERROR to deal with bound set/chain
    d53c295c1f43 netfilter: nf_tables: fix chain binding transaction logic
    8180fc2fadd4 netfilter: nf_tables: incorrect error path handling with NFT_MSG_NEWRULE
    e546e6ebb19d netfilter: nf_tables: add rescheduling points during loop detection walks
    3f51f1157f67 netfilter: nf_tables: use net_generic infra for transaction data
    01248dd65155 sh: pgtable-3level: Fix cast to pointer from integer of different size
    87410743b548 block: add overflow checks for Amiga partition support
    f0aec6c403a0 selftests/bpf: Add verifier test for PTR_TO_MEM spill
    88bffb61bc03 tpm, tpm_tis: Claim locality in interrupt handler
    5bf73af8b382 fanotify: disallow mount/sb marks on kernel internal pseudo fs
    5cb46b80ecda fs: no need to check source
    66a0647cdc56 leds: trigger: netdev: Recheck NETDEV_LED_MODE_LINKUP on dev rename
    5d6fbb624576 ARM: orion5x: fix d2net gpio initialization
    9b0f7940e212 ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
    1dac8584be0c ASoC: mediatek: mt8173: Fix irq error path
    6819bb0b8552 btrfs: fix race when deleting quota root from the dirty cow roots list
    a3fbd156bd2c btrfs: add handling for RAID1C23/DUP to btrfs_reduce_alloc_profile
    59efb8671105 fs: Lock moved directories
    c5b5e72df13d fs: Establish locking order for unrelated directories
    4b03f503b730 Revert "f2fs: fix potential corruption when moving a directory"
    2b563acd2dfa ext4: Remove ext4 locking of moved directory
    5e7d18a52c88 fs: avoid empty option when generating legacy mount string
    988a5d791156 jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
    5fada3751137 shmem: use ramfs_kill_sb() for kill_sb method of ramfs-based tmpfs
    79bef379d55a autofs: use flexible array in ioctl structure
    8bf91a8d4871 integrity: Fix possible multiple allocation in integrity_inode_get()
    9658a03f80b2 um: Use HOST_DIR for mrproper
    a4405f6ee033 bcache: Fix __bch_btree_node_alloc to make the failure behavior consistent
    db9439cef0b5 bcache: Remove unnecessary NULL point check in node allocations
    bcb295778afd bcache: fixup btree_cache_wait list damage
    dc3287206a32 mmc: sdhci: fix DMA configure compatibility issue when 64bit DMA mode is used.
    191628e2d96a mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS
    02c8c2b5f680 mmc: core: disable TRIM on Micron MTFC4GACAJCN-1M
    6f9708e5c110 mmc: core: disable TRIM on Kingston EMMC04G-M627
    28e649dc9947 io_uring: wait interruptibly for request completions on exit
    8482ac2e5a26 NFSD: add encoding of op_recall flag for write delegation
    8d36cb6d1aed i2c: qup: Add missing unwind goto in qup_i2c_probe()
    e41a8e461561 ALSA: jack: Fix mutex call in snd_jack_report()
    e71714ad24d8 i2c: xiic: Don't try to handle more interrupt events after error
    b6eefa7a27a6 i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in xiic_process()
    023bd9dc410c apparmor: fix missing error check for rhashtable_insert_fast
    d1c946552af2 sh: dma: Fix DMA channel offset calculation
    37750131d2a5 s390/qeth: Fix vipa deletion
    9f5548e4214d net: dsa: tag_sja1105: fix MAC DA patching from meta frames
    2758fb81bbc9 pptp: Fix fib lookup calls.
    0b08ff091f31 net/sched: act_pedit: Add size check for TCA_PEDIT_PARMS_EX
    2434a6715f59 xsk: Honor SO_BINDTODEVICE on bind
    b785ba0acc82 tcp: annotate data races in __tcp_oow_rate_limited()
    73f512bedfd4 net: bridge: keep ports without IFF_UNICAST_FLT in BR_PROMISC mode
    9a9d468fdcca powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
    f970b05c9b76 octeontx2-af: Fix mapping for NIX block from CGX connection
    5ded9e8aa53e f2fs: fix error path handling in truncate_dnode()
    358145cc3797 mailbox: ti-msgmgr: Fill non-message tx data fields with 0x0
    32b9c8f7892c spi: bcm-qspi: return error if neither hif_mspi nor mspi is available
    1f3643f9cfca net: dsa: vsc73xx: fix MTU configuration
    c377451012ce Add MODULE_FIRMWARE() for FIRMWARE_TG357766.
    6d2243ab783b sctp: fix potential deadlock on &net->sctp.addr_wq_lock
    620993d5ee5b media: cec: i2c: ch7322: also select REGMAP
    f733a7bfe8f8 rtc: st-lpc: Release some resources in st_rtc_probe() in case of error
    aa70e5dd7268 pwm: sysfs: Do not apply state to already disabled PWMs
    8a0413be8a1e pwm: imx-tpm: force 'real_period' to be zero in suspend
    e4845cdea71e phy: tegra: xusb: check return value of devm_kzalloc()
    442e1a98bd02 mfd: stmpe: Only disable the regulators if they are enabled
    724448d6021d KVM: s390: vsie: fix the length of APCB bitmap
    c5e2f6f2bb66 mfd: stmfx: Nullify stmfx->vdd in case of error
    30ead8b9bf0d mfd: stmfx: Fix error path in stmfx_chip_init
    4d2405147385 test_firmware: return ENOMEM instead of ENOSPC on failed memory allocation
    5b31ac1d6d88 serial: 8250_omap: Use force_suspend and resume for system suspend
    8e00ae25a371 Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"
    a81e1f22e17f mfd: intel-lpss: Add missing check for platform_get_resource
    1dc07edc01d2 usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
    7ade555ac58d usb: common: usb-conn-gpio: Set last role to unknown before initial detection
    0e9e127835c8 usb: dwc3: qcom: Fix an error handling path in dwc3_qcom_probe()
    a6171452085b usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()
    96898fb476d1 KVM: s390: fix KVM_S390_GET_CMMA_BITS for GFNs in memslot holes
    4e8e838fce5e media: atomisp: gmin_platform: fix out_len in gmin_get_config_dsm_var()
    b754ea60e690 media: venus: helpers: Fix ALIGN() of non power of two
    02b22660231d mfd: rt5033: Drop rt5033-battery sub-device
    e52019c09535 coresight: Fix loss of connection info when a module is unloaded
    018eddcb6bef kernfs: fix missing kernfs_idr_lock to remove an ID from the IDR
    a59f64a83516 serial: 8250: lock port for UART_IER access in omap8250_irq()
    8d65d0a2bfd5 serial: 8250: lock port for stop_rx() in omap8250_irq()
    d66ddb61fa23 usb: hide unused usbfs_notify_suspend/resume functions
    56901de56335 usb: phy: phy-tahvo: fix memory leak in tahvo_usb_probe()
    6538e5d9f7eb extcon: Fix kernel doc of property capability fields to avoid warnings
    dac7d7efcb54 extcon: Fix kernel doc of property fields to avoid warnings
    2788a3553f74 usb: gadget: u_serial: Add null pointer check in gserial_suspend
    74f8606ddfa4 usb: dwc3: qcom: Fix potential memory leak
    bdce16c1e650 clk: qcom: ipq6018: fix networking resets
    ee3f494cfc3e clk: qcom: reset: support resetting multiple bits
    35fd1a213fa4 clk: qcom: reset: Allow specifying custom reset delay
    d87ef4e857b7 media: usb: siano: Fix warning due to null work_func_t function pointer
    300388887cbb media: videodev2.h: Fix struct v4l2_input tuner index comment
    5f3f4aa673a0 media: usb: Check az6007_read() return value
    32809afb6063 clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
    bb81ca33ace3 serial: 8250: omap: Fix freeing of resources on failed register
    ed68e8e22ee1 sh: j2: Use ioremap() to translate device tree address into kernel memory
    a7890637b3b9 w1: fix loop in w1_fini()
    a27aeae714cd w1: w1_therm: fix locking behavior in convert_t
    cd5ec3ee52ce SUNRPC: Fix UAF in svc_tcp_listen_data_ready()
    e4a9b3333e67 block: change all __u32 annotations to __be32 in affs_hardblocks.h
    54da6c4c143f block: fix signed int overflow in Amiga partition support
    b6a107c52073 phy: tegra: xusb: Clear the driver reference in usb-phy dev
    fac7be49f1e6 usb: dwc3: gadget: Propagate core init errors to UDC during pullup
    8b0a55b59244 USB: serial: option: add LARA-R6 01B PIDs
    810e401b34c4 io_uring: ensure IOPOLL locks around deferred work
    cd5837564ff5 hwrng: st - keep clock enabled while hwrng is registered
    557e528255d5 dax: Introduce alloc_dev_dax_id()
    94a85474f5e3 dax: Fix dax_mapping_release() use after free
    7c9f5a14d93b NFSv4.1: freeze the session table upon receiving NFS4ERR_BADSESSION
    bab0bf567797 ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
    cb0cdca5c979 modpost: fix off by one in is_executable_section()
    f0350516b9d2 crypto: marvell/cesa - Fix type mismatch warning
    b54069445591 modpost: fix section mismatch message for R_ARM_{PC24,CALL,JUMP24}
    88978ef7fdef modpost: fix section mismatch message for R_ARM_ABS32
    31195ee328e9 crypto: nx - fix build warnings when DEBUG_FS is not enabled
    77471e4912d3 hwrng: virtio - Fix race on data_avail and actual data
    e8f51401d642 hwrng: virtio - always add a pending request
    ffc5ce9c272f hwrng: virtio - don't waste entropy
    d13ea82bfe15 hwrng: virtio - don't wait on cleanup
    5f23dae018c6 hwrng: virtio - add an internal buffer
    aba192bb31df powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
    7afd0de0cc14 powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
    7289ca7a5170 mm: rename p4d_page_vaddr to p4d_pgtable and make it return pud_t *
    bfad11018806 mm: rename pud_page_vaddr to pud_pgtable and make it return pmd_t *
    07c19c0ad4b0 powerpc/powernv/sriov: perform null check on iov before dereferencing iov
    f3c7b95c9991 pinctrl: at91-pio4: check return value of devm_kasprintf()
    b7a38fc3f384 perf dwarf-aux: Fix off-by-one in die_get_varname()
    75a3cb1e2317 perf script: Fix allocation of evsel->priv related to per-event dump files
    647c6d35ccfe perf script: Fixup 'struct evsel_script' method prefix
    958acb479ef2 kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
    5533f0eb0a29 pinctrl: cherryview: Return correct value if pin in push-pull mode
    4b63caf86eda perf bench: Add missing setlocale() call to allow usage of %'d style formatting
    345ee8521655 perf bench: Use unbuffered output when pipe/tee'ing to a file
    f0d2310f6b46 PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    b65fe59b2d62 PCI: ftpci100: Release the clock resources
    cb389e8edf64 PCI: pciehp: Cancel bringup sequence if card is not present
    b9895a4c95f3 scsi: 3w-xxxx: Add error handling for initialization failure in tw_probe()
    7badf4d6f49a PCI/ASPM: Disable ASPM on MFD function removal to avoid use-after-free
    d27238fc83b9 pinctrl: bcm2835: Handle gpiochip_add_pin_range() errors
    ac64019e4d4b scsi: qedf: Fix NULL dereference in error handling
    8e9907e9219f PCI: cadence: Fix Gen2 Link Retraining process
    07be8e60f27f ASoC: imx-audmix: check return value of devm_kasprintf()
    714ba10a6dd1 ovl: update of dentry revalidate flags after copy up
    47f4d875aa54 drivers: meson: secure-pwrc: always enable DMA domain
    5f149d053898 clk: ti: clkctrl: check return value of kasprintf()
    fd9324fa4d81 clk: keystone: sci-clk: check return value of kasprintf()
    0b754f9cfd66 clk: si5341: free unused memory on probe failure
    dc8d0178d506 clk: si5341: check return value of {devm_}kasprintf()
    dc3eef648055 clk: si5341: return error if one synth clock registration fails
    040113980081 clk: si5341: Add sysfs properties to allow checking/resetting device faults
    fc813d05739e clk: si5341: Allow different output VDD_SEL values
    f64fcd3acf1f clk: cdce925: check return value of kasprintf()
    866d4340c6c9 clk: vc5: check memory returned by kasprintf()
    c67a55f7cc8d drm/msm/dp: Free resources after unregistering them
    c3b63584d8c2 drm/msm/dpu: do not enable color-management if DSPPs are not available
    f923a582217b ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
    404e9f741acf clk: tegra: tegra124-emc: Fix potential memory leak
    cb047c13bbf9 clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
    294321349bd3 clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
    e749bc5a9054 RDMA/bnxt_re: Avoid calling wake_up threads from spin_lock context
    9341501e2f7a RDMA/bnxt_re: wraparound mbox producer index
    968e27fd037e amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
    e070120e6d68 drm/radeon: fix possible division-by-zero errors
    a77b80825bf1 drm/amdkfd: Fix potential deallocation of previously deallocated memory.
    245aa7c0233e ARM: dts: BCM5301X: fix duplex-full => full-duplex
    7e2edb84fe7c hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272
    580e9b987b89 hwmon: (adm1275) Allow setting sample averaging
    a3c5d148b78b hwmon: (adm1275) enable adm1272 temperature reporting
    4610efa404be hwmon: (gsc-hwmon) fix fan pwm temperature scaling
    6e12311dcedd ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx
    badeb7fe2450 ARM: dts: stm32: Fix audio routing on STM32MP15xx DHCOM PDK2
    17cd31487dc3 arm64: dts: ti: k3-j7200: Fix physical address of pin
    ce6e0434e502 fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
    34e1e2f3cf5a arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
    6817914c67b7 ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier
    220f86cc19dc RDMA/hns: Fix hns_roce_table_get return value
    9196f44239cf RDMA/hns: Clean the hardware related code for HEM
    aa495b927f9c RDMA/hns: Use refcount_t APIs for HEM
    de1049dd18bd RDMA/hns: Fix coding style issues
    cc1b04b699e6 RDMA: Remove uverbs_ex_cmd_mask values that are linked to functions
    7dcb9ea3ee4b IB/hfi1: Fix wrong mmu_node used for user SDMA packet after invalidate
    6cf8f3d690bb IB/hfi1: Fix sdma.h tx->num_descs off-by-one errors
    2d38866a99ba IB/hfi1: Use bitmap_zalloc() when applicable
    42b6865bf58c soc/fsl/qe: fix usb.c build errors
    9c14d1406662 ARM: dts: meson8: correct uart_B and uart_C clock references
    684a2f180e46 ASoC: es8316: Do not set rate constraints for unsupported MCLKs
    d883e16c7f35 ASoC: es8316: Increment max value for ALC Capture Target Volume control
    105af71974ea memory: brcmstb_dpfe: fix testing array offset after use
    ddc74d6ea3dc ARM: dts: stm32: Shorten the AV96 HDMI sound card name
    392ee3cc995d arm64: dts: qcom: apq8096: fix fixed regulator name property
    c85a076215a9 ARM: omap2: fix missing tick_broadcast() prototype
    aec18da74194 ARM: ep93xx: fix missing-prototype warnings
    b574cd7e4dfc drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
    02d8b008ffee arm64: dts: qcom: msm8996: correct camss unit address
    6d103b1cc133 arm64: dts: qcom: msm8994: correct SPMI unit address
    160ac75a5a82 arm64: dts: qcom: msm8916: correct camss unit address
    e8b131d21638 ARM: dts: gta04: Move model property out of pinctrl node
    b0b180a712ee RDMA/bnxt_re: Fix to remove an unnecessary log
    446092f136d3 RDMA/bnxt_re: Remove a redundant check inside bnxt_re_update_gid
    b54b26ac50a2 RDMA/bnxt_re: Use unique names while registering interrupts
    11bd3882c3a6 RDMA/bnxt_re: Fix to remove unnecessary return labels
    7080ef46ad3d RDMA/bnxt_re: Disable/kill tasklet only if it is enabled
    2a9895df8088 arm64: dts: microchip: sparx5: do not use PSCI on reference boards
    726fdf47c148 bus: ti-sysc: Fix dispc quirk masking bool variables
    8ee24ddf45f0 ARM: dts: stm32: Move ethernet MAC EEPROM from SoM to carrier boards
    617a4da09d77 drm/panel: sharp-ls043t1le01: adjust mode settings
    3c87c98225be drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
    39305592dc97 Input: adxl34x - do not hardcode interrupt trigger type
    e629efc6d602 ARM: dts: meson8b: correct uart_B and uart_C clock references
    bd46ade71497 ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
    20ecae1af578 drm/vram-helper: fix function names in vram helper doc
    46a34e145955 drm/bridge: tc358768: fix THS_TRAILCNT computation
    f2f7d0a4a22a drm/bridge: tc358768: fix TXTAGOCNT computation
    8e47328fe089 drm/bridge: tc358768: fix THS_ZEROCNT computation
    6b9450723bab drm/bridge: tc358768: fix TCLK_TRAILCNT computation
    33abcfbb17b0 drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
    43b2d11ccffb drm/bridge: tc358768: fix TCLK_ZEROCNT computation
    46b741718989 drm/bridge: tc358768: fix PLL target frequency
    825b00c68589 drm/bridge: tc358768: fix PLL parameters computation
    1b4f23fdf27f drm/bridge: tc358768: always enable HS video mode
    4e0fd4f54bea Input: drv260x - sleep between polling GO bit
    2780d5844855 drm/amd/display: Explicitly specify update type per plane info change
    b2213fc60b83 radeon: avoid double free in ci_dpm_init()
    472a615e66b9 netlink: Add __sock_i_ino() for __netlink_diag_dump().
    d10b38036977 ipvlan: Fix return value of ipvlan_queue_xmit()
    5215c0096839 netfilter: nf_conntrack_sip: fix the ct_sip_parse_numerical_param() return value.
    9bdcda7abaf2 netfilter: conntrack: dccp: copy entire header to stack buffer, not just basic one
    36e07e8acfb9 lib/ts_bm: reset initial match offset for every block of text
    96f2c6f272ec net: nfc: Fix use-after-free caused by nfc_llcp_find_local
    a3a1550c4d2e nfc: llcp: simplify llcp_sock_connect() error paths
    cb1aa7cc562c sfc: fix crash when reading stats while NIC is resetting
    6ccfec84f025 net: axienet: Move reset before 64-bit DMA detection
    bccc7ace12e6 gtp: Fix use-after-free in __gtp_encap_destroy().
    4d9cd4b330d8 selftests: rtnetlink: remove netdevsim device after ipsec offload test
    44db85c6e1a1 netlink: do not hard code device address lenth in fdb dumps
    cde7b90e0539 netlink: fix potential deadlock in netlink_set_err()
    0c9e48428f6b net: stmmac: fix double serdes powerdown
    1ba91ffa1a0e igc: Fix race condition in PTP tx code
    660d4e73efb0 wifi: ath9k: convert msecs to jiffies where needed
    150ca0768b50 wifi: cfg80211: rewrite merging of inherited elements
    4e321c18ef92 wifi: iwlwifi: pull from TXQs with softirqs disabled
    2715617c2aad rtnetlink: extend RTEXT_FILTER_SKIP_STATS to IFLA_VF_INFO
    581401cd3cf9 wifi: ath9k: Fix possible stall on ath9k_txq_list_has_key()
    6b22c2c649a1 memstick r592: make memstick_debug_get_tpc_name() static
    6cb477e7226b kexec: fix a memory leak in crash_shrink_memory()
    fdb07728d8ff watchdog/perf: more properly prevent false positives with turbo modes
    ac23d7f41426 watchdog/perf: define dummy watchdog_update_hrtimer_threshold() on correct config
    22da8363e35f wifi: rsi: Do not set MMC_PM_KEEP_POWER in shutdown
    b2aeb97fd470 wifi: rsi: Do not configure WoWlan in shutdown hook if not enabled
    1044187e7249 wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes
    c10c6ea9b3a2 wifi: ray_cs: Fix an error handling path in ray_probe()
    8825991838fc wifi: ray_cs: Drop useless status variable in parse_addr()
    a66e3fd3801a wifi: ray_cs: Utilize strnlen() in parse_addr()
    18d71562f70d wifi: wl3501_cs: Fix an error handling path in wl3501_probe()
    b6f793de619b wl3501_cs: use eth_hw_addr_set()
    cbd44a9e1cf1 net: create netdev->dev_addr assignment helpers
    13cf0e3894d1 wl3501_cs: Fix misspelling and provide missing documentation
    5512db9bd404 wifi: atmel: Fix an error handling path in atmel_probe()
    86ebbcbdc7b1 wifi: orinoco: Fix an error handling path in orinoco_cs_probe()
    fb7d78feb55a wifi: orinoco: Fix an error handling path in spectrum_cs_probe()
    8782dc2504da regulator: core: Streamline debugfs operations
    92bcd8494126 regulator: core: Fix more error checking for debugfs_create_dir()
    78f390aa0eb5 bpftool: JIT limited misreported as negative value on aarch64
    107e849f3c6a nfc: llcp: fix possible use of uninitialized variable in nfc_llcp_send_connect()
    0be9de2ea01e nfc: constify several pointers to u8, char and sk_buff
    ef7fe1b5c4fb libbpf: fix offsetof() and container_of() to work with CO-RE
    b190ced50a5e sctp: add bpf_bypass_getsockopt proto callback
    08f61a349135 bpf: Remove extra lock_sock for TCP_ZEROCOPY_RECEIVE
    c62e2ac02e28 wifi: mwifiex: Fix the size of a memory allocation in mwifiex_ret_802_11_scan()
    3ae910a375b6 wifi: wilc1000: fix for absent RSN capabilities WFA testcase
    795ef550307c spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
    bd3e880dce27 samples/bpf: Fix buffer overflow in tcp_basertt
    250efb4d3f5b wifi: ath9k: avoid referencing uninit memory in ath9k_wmi_ctrl_rx
    0f3f41b47533 wifi: ath9k: fix AR9003 mac hardware hang check register offset calculation
    cbd0f41a5362 igc: Enable and fix RX hash usage by netstack
    a14cb307267b pstore/ram: Add check for kstrdup
    628709a05708 ima: Fix build warnings
    16ec59c03ad2 evm: Complete description of evm_inode_setattr()
    cba85e1cb79f x86/mm: Fix __swp_entry_to_pte() for Xen PV guests
    365f546de584 perf/ibs: Fix interface via core pmu events
    604d6a5ff718 rcu/rcuscale: Stop kfree_scale_thread thread(s) after unloading rcuscale
    d414e24d1509 rcu/rcuscale: Move rcu_scale_*() after kfree_scale_cleanup()
    ecc5e6dbc269 rcuscale: Move shutdown from wait_event() to wait_event_idle()
    b62c816bdb5e rcuscale: Always log error message
    8cd9917c13a7 rcuscale: Console output claims too few grace periods
    456f783b83f8 thermal/drivers/sun8i: Fix some error handling paths in sun8i_ths_probe()
    bacc49b2d561 cpufreq: intel_pstate: Fix energy_performance_preference for passive
    a8bfe527556b ARM: 9303/1: kprobes: avoid missing-declaration warnings
    a50b75c13d37 powercap: RAPL: Fix CONFIG_IOSF_MBI dependency
    23f6efd22644 perf/arm-cmn: Fix DTC reset
    b69868d50df4 PM: domains: fix integer overflow issues in genpd_parse_state()
    ebdff0986513 clocksource/drivers/cadence-ttc: Fix memory leak in ttc_timer_probe
    a2f83a4c7cb5 tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    f1be1ed32daa posix-timers: Prevent RT livelock in itimer_delete()
    b315d57da456 irqchip/jcore-aic: Fix missing allocation of IRQ descriptors
    495cee0e1417 irqchip/jcore-aic: Kill use of irq_create_strict_mappings()
    9d1cccdad080 md/raid10: fix io loss while replacement replace rdev
    2990e2ece18d md/raid10: fix null-ptr-deref of mreplace in raid10_sync_request
    b1d8f38310bc md/raid10: fix wrong setting of max_corr_read_errors
    b3a0bc4a01fa md/raid10: fix overflow of md/safe_mode_delay
    39fa14e824ac md/raid10: check slab-out-of-bounds in md_bitmap_get_counter
    8563b58a4360 blk-iocost: use spin_lock_irqsave in adjust_inuse_and_calc_cost
    3db97cc79b82 x86/resctrl: Only show tasks' pid in current pid namespace
    1a82005f3f63 fs: pipe: reveal missing function protoypes
    f70407e8e027 nubus: Partially revert proc_create_single_data() conversion
    0336c8f07223 drm/amdgpu: Validate VM ioctl flags.
    c484b65f93e0 scripts/tags.sh: Resolve gtags empty index generation
    649104c834ba Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
    02a4c4e225f4 HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the T651.
    9598a647ecc8 HID: wacom: Use ktime_t rather than int when dealing with timestamps
    2bf70b88cc35 fbdev: imsttfb: Fix use after free bug in imsttfb_probe
    5b813734a0d2 video: imsttfb: check for ioremap() failures
    02fbf62df99f can: isotp: isotp_sendmsg(): fix return error fix on TX path
    8667f7113107 x86/smp: Use dedicated cache-line for mwait_play_dead()
    1d0fe3fb5d4b media: atomisp: fix "variable dereferenced before check 'asd'"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5feaa9811a..5b59ebac16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0a7d0eaa4e53eede45702dde31a3580e4cce0034"
-SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
+SRCREV_machine ?= "40d51460c17be51e4ebcdcc54a8ee8c86707c56c"
+SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.187"
+LINUX_VERSION ?= "5.10.188"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 1e401e2499..3a58a1a659 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.187"
+LINUX_VERSION ?= "5.10.188"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "54fe699b2a16739a9fb3905d3a6c6ff7475214ea"
-SRCREV_machine ?= "2fe6f9bdf89df6d468f7e2c7fc070993a11f029a"
-SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
+SRCREV_machine:qemuarm ?= "41daa5d20567419e303d0b684fd3c3c859446d24"
+SRCREV_machine ?= "085bed8577aa6435339ff83339e38dfd9e7994a6"
+SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 93eff2bd58..6807a6b2d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ca4bf25fb041f115ee9144acf175266e7d2c5495"
-SRCREV_machine:qemuarm64 ?= "7ef1d2f467aa45b98241421262e607ec080e0921"
-SRCREV_machine:qemumips ?= "f275b4829346d60d1cb600d4b8195eb6812361fd"
-SRCREV_machine:qemuppc ?= "af1960c76a2c940eee2e7b4c20e07c248b030b02"
-SRCREV_machine:qemuriscv64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
-SRCREV_machine:qemuriscv32 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
-SRCREV_machine:qemux86 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
-SRCREV_machine:qemux86-64 ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
-SRCREV_machine:qemumips64 ?= "2f630e9e4b3c809cf48d8e252477845c405195cc"
-SRCREV_machine ?= "c4d95d557212e22763382fd345d8c7efc92f825f"
-SRCREV_meta ?= "35a34e59a7c16f5f115ab371352ff2712c695d4d"
+SRCREV_machine:qemuarm ?= "66536572b0fe35ac0e5158d69d12641281ab93ef"
+SRCREV_machine:qemuarm64 ?= "00d0178dae976305eaecc7fc119da63930bcf07f"
+SRCREV_machine:qemumips ?= "8cc44bb4c536028438decbb5abf2d8b731898ec0"
+SRCREV_machine:qemuppc ?= "1f2a193c7f82e2f2c7eefc2fa35dce5b96cc3ba9"
+SRCREV_machine:qemuriscv64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
+SRCREV_machine:qemuriscv32 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
+SRCREV_machine:qemux86 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
+SRCREV_machine:qemux86-64 ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
+SRCREV_machine:qemumips64 ?= "2fe172b06a5b6d8840c0c0226a1501b627b9e703"
+SRCREV_machine ?= "d3e6aa7bf695da482f46a6f5575dfd66bd48ba6c"
+SRCREV_meta ?= "9b0d4e338b1bbdd683347cf9365bacfec2169035"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.187"
+LINUX_VERSION ?= "5.10.188"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


