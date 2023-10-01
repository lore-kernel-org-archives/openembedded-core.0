Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6FEE748F7
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.62425.1696176036466672190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KiUA2EP3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c60cec8041so82605145ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176035; x=1696780835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpNwxdBxSKEaNUdLlMVh+Ufwp63Z9gyv5yk8Lro4xd8=;
        b=KiUA2EP3mMuGAi9gS33vJx+jbOLMJ5XjuFWHU7miIOoZtXoySVeF3Xs2xKBPUivSYA
         YnpKO7E585A5wxX3jSu3xQKn4JhAgJJ1J4k3gB6WORFfWS+JBVc9g0oxLgza+wiGW6bB
         BHFcz7ww7lNRevdb1YlH9vTeI1NpyFbBZMOI+IhtIBX0rf//3Z6lo6JqEp8KUeb9Iir+
         fHzwRaMy5fLnFUkXsJpPtus+4pC02NffraItXqg+LSKovZqGGbznwgh6pEi3KxAOYN/h
         xT2mAmEvOQDWx062wVIc0LTmSuE1yixSyAXZXw3bVBDLgWunWOCiuvBft0lo3VphE5w/
         MIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176035; x=1696780835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpNwxdBxSKEaNUdLlMVh+Ufwp63Z9gyv5yk8Lro4xd8=;
        b=CpKlV2CqyJpfx1X2rq3K6Y9wkM7Lrw3bfrbiLSafVjn3QOFEayfKpvH1aTh4q7vCoK
         i9lykFvOd1f1JlbUtSf5X3+66wQINmEj+N5Xo0H8BH+1ULZQhc4dBmDIt+HKR/B8YS7J
         o+653JSlXpt7l2rwJY7+siBzzF6FFBrk7dOIjZcQ4+DmPRDlYMGcB+kK/eJ114xiXelf
         GL7znqc/2RupC/l7+FZOIpgPtGRZWpBKCMkDPWuq3gTZxOUnVdzHtT+yczuqmem8sAYz
         zep5H4Y2tDt7mBGpKI3dZa75ysIKvOQqiFr94Cgqpcw0D1Jm6kSjeKN0mXkbqmUlEz3R
         peLQ==
X-Gm-Message-State: AOJu0YxwSOMsImDU9QiUL/qhNMa3IoKY/SP1ZnAMBweV8Lvv9a8OdbVt
	F2DIJv1Kwq3CNe4BGkwbznqhfKTNyRG/yn2sO+dQcw==
X-Google-Smtp-Source: AGHT+IF8q9JLYYxDCbN7Z36mVo3g/oWKw5G8SGrarql7P4igBLGEQj+jlsCFWCbbwO3z2QXVXvdqXA==
X-Received: by 2002:a17:902:f688:b0:1c7:615a:8dea with SMTP id l8-20020a170902f68800b001c7615a8deamr1635910plg.66.1696176034571;
        Sun, 01 Oct 2023 09:00:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/23] linux-yocto/5.15: update to v5.15.133
Date: Sun,  1 Oct 2023 05:59:56 -1000
Message-Id: <c9dd6124cf15fe8c2f9670bd1da02d59b43a0421.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188498

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    b911329317b4 Linux 5.15.133
    e3a29b80e9e6 interconnect: Teach lockdep about icc_bw_lock order
    c6244cd00c97 drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma
    08569c92f7f3 net/sched: Retire rsvp classifier
    6b080fa8aae1 drm/amdgpu: fix amdgpu_cs_p1_user_fence
    6386a2d4dc01 drm/amd/display: fix the white screen issue when >= 64GB DRAM
    e04b7073bdce ext4: fix rec_len verify error
    93763d58705a scsi: pm8001: Setup IRQs on resume
    72a22696cf19 scsi: megaraid_sas: Fix deadlock on firmware crashdump
    54603e8a88bc ata: libata: disallow dev-initiated LPM transitions to unsupported states
    01c7c38a90bc i2c: aspeed: Reset the i2c controller when timeout occurs
    763d39f4e8fb tracefs: Add missing lockdown check to tracefs_create_dir()
    bf195968e362 nfsd: fix change_info in NFSv4 RENAME replies
    bf38c1d29f8b tracing: Have option files inc the trace array ref count
    85ad4688b7a7 tracing: Have current_trace inc the trace array ref count
    962e6723239b tracing: Have tracing_max_latency inc the trace array ref count
    380bbd46d61c btrfs: release path before inode lookup during the ino lookup ioctl
    779c3cf2749c btrfs: fix lockdep splat and potential deadlock after failure running delayed items
    f9c78afcee46 ovl: fix incorrect fdput() on aio completion
    05a7289a5d4b ovl: fix failed copyup of fileattr on a symlink
    8bcb80293be7 attr: block mode changes of symlinks
    d30af15e460f md/raid1: fix error: ISO C90 forbids mixed declarations
    abdfde037712 samples/hw_breakpoint: fix building without module unloading
    58787ff3d023 x86/purgatory: Remove LTO flags
    8abf1ec895d5 x86/boot/compressed: Reserve more memory for page tables
    e1a27664fcf5 scsi: lpfc: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    f0fd24f1fae0 selftests: tracing: Fix to unmount tracefs for recovering environment
    dded6b81ad68 scsi: qla2xxx: Fix NULL vs IS_ERR() bug for debugfs_create_dir()
    1d5caeac9655 drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
    b9f0572b38c1 btrfs: compare the correct fsid/metadata_uuid in btrfs_validate_super
    cba491ee38e2 btrfs: add a helper to read the superblock metadata_uuid
    cb3671a2eeac btrfs: move btrfs_pinned_by_swapfile prototype into volumes.h
    f16fe29368fd perf test shell stat_bpf_counters: Fix test on Intel
    ad73216e006f perf test: Remove bash construct from stat_bpf_counters.sh test
    d8f81baeb9eb MIPS: Use "grep -E" instead of "egrep"
    dfe961b1e476 mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
    56cf9f446b33 mtd: rawnand: brcmnand: Allow SoC to provide I/O operations
    34fcb59437a7 jbd2: correct the end of the journal recovery scan range
    a4605449cc9f jbd2: rename jbd_debug() to jbd2_debug()
    db6c90f2671c jbd2: kill t_handle_lock transaction spinlock
    e9270898222a jbd2: fix use-after-free of transaction_t race
    b0412dd1c24b jbd2: refactor wait logic for transaction updates into a common function
    f980bf1586ef printk: Consolidate console deferred printing
    9be2957f014d interconnect: Fix locking for runpm vs reclaim
    f3f6bf22a4f5 kobject: Add sanity check for kset->kobj.ktype in kset_register()
    81bbe6667024 media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
    d4ef3c9c7947 usb: ehci: add workaround for chipidea PORTSC.PEC bug
    c829d25e26fb serial: cpm_uart: Avoid suspicious locking
    5353df78c226 scsi: target: iscsi: Fix buffer overflow in lio_target_nacl_info_show()
    b97aaf9faf89 tools: iio: iio_generic_buffer: Fix some integer type and calculation
    60a71fd1910e usb: gadget: fsl_qe_udc: validate endpoint index for ch9 udc
    c861a61be6d3 usb: cdns3: Put the cdns set active part outside the spin lock
    930c60e13947 media: pci: cx23885: replace BUG with error return
    48bb6a9fa5cb media: tuners: qt1010: replace BUG_ON with a regular error
    2a33fc57133d media: dvb-usb-v2: gl861: Fix null-ptr-deref in gl861_i2c_master_xfer
    5b1ea100ad36 media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()
    3dd5846a8739 media: anysee: fix null-ptr-deref in anysee_master_xfer
    033b0c0780ad media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
    903566208ae6 media: dw2102: Fix null-ptr-deref in dw2102_i2c_transfer()
    d9ef84a7c222 media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer
    ca49cef3acaa PCI: fu740: Set the number of MSI vectors
    d35e7ae10eb8 powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
    46870eea5496 ARM: 9317/1: kexec: Make smp stop calls asynchronous
    ef7311101ca4 jfs: fix invalid free of JFS_IP(ipimap)->i_imap in diUnmount
    aa5b019a3e0f fs/jfs: prevent double-free in dbUnmount() after failed jfs_remount()
    7ac65c29b6c2 ext2: fix datatype of block number in ext2_xattr_set2()
    4f96c0665f9f md: raid1: fix potential OOB in raid1_remove_disk()
    f3e9fc7b02b9 bus: ti-sysc: Configure uart quirks for k3 SoC
    3157aa794c75 drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()
    78bc9d25997a drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN31
    5eca70c14b31 ALSA: hda: intel-dsp-cfg: add LunarLake support
    e8ba418d4926 samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
    961df5a3f5cc arm64: dts: qcom: sm8250-edo: correct ramoops pmsg-size
    49cd54900078 arm64: dts: qcom: sm8150-kumano: correct ramoops pmsg-size
    1e0a38bb840a arm64: dts: qcom: sm6125-pdx201: correct ramoops pmsg-size
    201071956ec6 drm/bridge: tc358762: Instruct DSI host to generate HSE packets
    c64ee9dd3358 wifi: mac80211_hwsim: drop short frames
    66594a1e6ddd netfilter: ebtables: fix fortify warnings in size_entry_mwt()
    fedd9377dd9c wifi: mac80211: check S1G action frame size
    e08333e2abae alx: fix OOB-read compiler warning
    2b0a093cdf59 mmc: sdhci-esdhc-imx: improve ESDHC_FLAG_ERR010450
    0a1f87f0ca76 tpm_tis: Resend command to recover from data transfer errors
    67589d247909 crypto: lib/mpi - avoid null pointer deref in mpi_cmp_ui()
    389106425dee wifi: wil6210: fix fortify warnings
    ddb8f358b5e0 wifi: mwifiex: fix fortify warning
    a7ebe459c72e wifi: ath9k: fix printk specifier
    3de6b6ab69e2 wifi: ath9k: fix fortify warnings
    6b0adfafb073 crypto: lrw,xts - Replace strlcpy with strscpy
    dc100292e503 devlink: remove reload failed checks in params get/set callbacks
    7b7964cd9db3 ACPI: x86: s2idle: Catch multiple ACPI_TYPE_PACKAGE objects
    eda268b5b7ad hw_breakpoint: fix single-stepping when using bpf_overflow_handler
    6e743b7261ef perf/imx_ddr: speed up overflow frequency of cycle
    f9a2c79c2970 perf/smmuv3: Enable HiSilicon Erratum 162001900 quirk for HIP08/09
    ed1afb597280 ACPI: video: Add backlight=native DMI quirk for Lenovo Ideapad Z470
    f685311dbe05 scftorture: Forgive memory-allocation failure if KASAN
    4f03fba096bf rcuscale: Move rcu_scale_writer() schedule_timeout_uninterruptible() to _idle()
    f1ceff37ac6b kernel/fork: beware of __put_task_struct() calling context
    430787056dd3 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
    766e56faddbe locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
    6994f806c6d1 btrfs: output extra debug info if we failed to find an inline backref
    71eeddcad734 autofs: fix memory leak of waitqueues in autofs_catatonic_mode
    35ecaa3632bf Linux 5.15.132
    0c0d79f3366a pcd: fix error codes in pcd_init_unit()
    893978f1b4d1 drm/amd/display: Fix a bug when searching for insert_above_mpcc
    0b8e09b39ef3 MIPS: Only fiddle with CHECKFLAGS if `need-compiler'
    55d2e7c1ab8e kcm: Fix error handling for SOCK_DGRAM in kcm_sendmsg().
    e80228b27487 ixgbe: fix timestamp configuration code
    5b55dac919ec ipv6: fix ip6_sock_set_addr_preferences() typo
    481bd6dcc5fe net/tls: do not free tls_rec on async operation in bpf_exec_tx_verdict()
    3600c0dc0deb platform/mellanox: mlxbf-pmc: Fix reading of unprogrammed events
    07c0abc80604 platform/mellanox: mlxbf-pmc: Fix potential buffer overflows
    7c34ea34516d platform/mellanox: mlxbf-tmfifo: Drop jumbo frames
    694035201aac platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no more descriptors
    97275339c34c kcm: Fix memory leak in error path of kcm_sendmsg()
    864da4a5d5eb r8152: check budget for r8152_poll()
    fbdc4e9908b2 net: dsa: sja1105: hide all multicast addresses from "bridge fdb show"
    6a4480c5e6eb hsr: Fix uninit-value access in fill_frame_info()
    072324cfab9b net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
    5bb09dddc724 net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
    06b4934ab2b5 net/smc: use smc_lgr_list.lock to protect smc_lgr_list.list iterate in smcr_port_add
    aea3801c234d kselftest/runner.sh: Propagate SIGTERM to runner child
    2f1e86014d0c net: ipv4: fix one memleak in __inet_del_ifa()
    f086e859ddc2 ARM: dts: BCM5301X: Extend RAM to full 256MB for Linksys EA6500 V2
    8173d9027031 ARM: dts: samsung: exynos4210-i9100: Fix LCD screen's physical size
    072cd213c64f block: don't add or resize partition on the disk with GENHD_FL_NO_PART
    c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_PART
    6c06a7f6b41c block: move GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE to disk->event_flags
    8247ff0d5036 block: move GENHD_FL_NATIVE_CAPACITY to disk->state
    5ad42b999a42 pcd: cleanup initialization
    7607bc7fe6cc pcd: move the identify buffer into pcd_identify
    242bbe218814 perf hists browser: Fix the number of entries for 'e' key
    4d7a8a44e030 perf tools: Handle old data in PERF_RECORD_ATTR
    a8f91f480c62 perf hists browser: Fix hierarchy mode header
    4ee1cf2a5bcc MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression
    df4d8d5ab647 drm/amd/display: prevent potential division by zero errors
    3b51d016bbbf mtd: rawnand: brcmnand: Fix potential false time out warning
    2353b7bb61e4 mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
    b59ff750bf80 mtd: rawnand: brcmnand: Fix crash during the panic_write
    ca5218aef9e5 btrfs: use the correct superblock to compare fsid in btrfs_validate_super
    f3260733894a btrfs: don't start transaction when joining with TRANS_JOIN_NOSTART
    7ef0e8b812e0 btrfs: free qgroup rsv on io failure
    5fd6f40d17e8 fuse: nlookup missing decrement in fuse_direntplus_link
    65b6890c3d01 ata: pata_ftide010: Add missing MODULE_DESCRIPTION
    0b62825dc6c3 ata: sata_gemini: Add missing MODULE_DESCRIPTION
    81dd61cb1caa ata: pata_falcon: fix IO base selection for Q40
    20bc2c470369 lib: test_scanf: Add explicit type cast to result initialization in test_number_prefix()
    4315b4a95ecf ext4: add correct group descriptors and reserved GDT blocks to system zone
    ef5fea70e591 jbd2: check 'jh->b_transaction' before removing it from checkpoint
    6778a3857266 jbd2: fix checkpoint cleanup performance regression
    6b195e07a2cf dmaengine: sh: rz-dmac: Fix destination and source data size setting
    0476f2016ddc ARC: atomics: Add compiler barrier to atomic operations...
    3375186d5e3f net/mlx5: Free IRQ rmap and notifier on kernel shutdown
    2348a375ee16 sh: boards: Fix CEU buffer size passed to dma_declare_coherent_memory()
    f5160dc17e81 net: hns3: remove GSO partial feature bit
    6d548b7cb216 net: hns3: fix the port information display when sfp is absent
    cc3c67e08169 net: hns3: fix invalid mutex between tc qdisc and dcb ets command issue
    2c9643fa6360 net: hns3: fix debugfs concurrency issue between kfree buffer and read
    8bfa87cf4a86 net: hns3: fix byte order conversion issue in hclge_dbg_fd_tcam_read()
    19280e8dfb52 netfilter: nfnetlink_osf: avoid OOB read
    1ad7b189cc14 netfilter: nftables: exthdr: fix 4-byte stack OOB write
    347f765176db net: dsa: sja1105: complete tc-cbs offload support on SJA1110
    cb4494cfe4b7 net: dsa: sja1105: fix -ENOSPC when replacing the same tc-cbs too many times
    77b850b84d21 net: dsa: sja1105: fix bandwidth discrepancy between tc-cbs software and offload
    d11109c03d6e ip_tunnels: use DEV_STATS_INC()
    fcfb5842ef9c idr: fix param name in idr_alloc_cyclic() doc
    131cd74a8e38 s390/zcrypt: don't leak memory if dev_set_name() fails
    12de76fdddb5 igb: Change IGB_MIN to allow set rx/tx value between 64 and 80
    7c2f90b1c213 igbvf: Change IGBVF_MIN to allow set rx/tx value between 64 and 80
    f4c5640d6d38 igc: Change IGC_MIN to allow set rx/tx value between 64 and 80
    9210b3dd74ac octeontx2-af: Fix truncation of smq in CN10K NIX AQ enqueue mbox handler
    1840f08c2a1b kcm: Destroy mutex in kcm_exit_net()
    6ea277b2c626 net: sched: sch_qfq: Fix UAF in qfq_dequeue()
    3868de7c5361 af_unix: Fix data race around sk->sk_err.
    d95456660fae af_unix: Fix data-races around sk->sk_shutdown.
    e5edc6e44a88 af_unix: Fix data-race around unix_tot_inflight.
    9151ed4b0061 af_unix: Fix data-races around user->unix_inflight.
    907fbed65cec net: phy: micrel: Correct bit assignments for phy_device flags
    5d2d3f2300c3 net: ipv6/addrconf: avoid integer underflow in ipv6_create_tempaddr
    77dd55f5ec6a veth: Fixing transmit return status for dropped packets
    56603b2c82e3 igb: disable virtualization features on 82580
    149bc7834d6f ipv4: ignore dst hint for multipath routes
    e18b49495a52 drm/i915/gvt: Drop unused helper intel_vgpu_reset_gtt()
    5979985f2d6b xsk: Fix xsk_diag use-after-free error during socket cleanup
    49acc5c5b280 net: fib: avoid warn splat in flow dissector
    ed4e0adfa407 net: read sk->sk_family once in sk_mc_loop()
    e0b483a0584f ipv4: annotate data-races around fi->fib_dead
    74df0319e4e2 sctp: annotate data-races around sk->sk_wmem_queued
    973a4c302d7f net/sched: fq_pie: avoid stalls in fq_pie_timer()
    5e22217c1142 pwm: lpc32xx: Remove handling of PWM channels
    676152264dec watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow auto-load
    d6aa2be1379d perf top: Don't pass an ERR_PTR() directly to perf_session__delete()
    79bd17c99ec9 perf vendor events: Drop some of the JSON/events for power10 platform
    1356eaceef34 perf vendor events: Update the JSON/events descriptions for power10 platform
    24481d5c7413 x86/virt: Drop unnecessary check on extended CPUID level in cpu_has_svm()
    6e9863165674 perf annotate bpf: Don't enclose non-debug code with an assert()
    184be0d59242 Input: tca6416-keypad - fix interrupt enable disbalance
    0b79f5a19cfb Input: tca6416-keypad - always expect proper IRQ number in i2c client
    1e3167aa4ba2 backlight: gpio_backlight: Drop output GPIO direction check for initial power state
    6fc8bdc3cf4c pwm: atmel-tcb: Fix resource freeing in error path and remove
    6b2bb1a1a63c pwm: atmel-tcb: Harmonize resource allocation order
    d4734ef765eb pwm: atmel-tcb: Convert to platform remove callback returning void
    c3bc668581e7 perf trace: Really free the evsel->priv area
    8e96f741b328 perf trace: Use zfree() to reduce chances of use after free
    414cf7a2cc87 kconfig: fix possible buffer overflow
    be9ce0dbde4f gfs2: low-memory forced flush fixes
    751facd3634c gfs2: Switch to wait_event in gfs2_logd
    d0245b066971 kbuild: do not run depmod for 'make modules_sign'
    05333a6a21e3 bus: mhi: host: Skip MHI reset if device is in RDDM
    e2964c98ec31 NFSv4/pnfs: minor fix for cleanup path in nfs4_get_device_info
    da302f1d476a NFS: Fix a potential data corruption
    0db19df21be5 clk: qcom: mss-sc7180: fix missing resume during probe
    f64f682be7c8 clk: qcom: q6sstop-qcs404: fix missing resume during probe
    b2f39b813d1e soc: qcom: qmi_encdec: Restrict string length in decode
    e61db8922631 clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
    a8474506c912 clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
    a69b951c8398 dt-bindings: clock: xlnx,versal-clk: drop select:false
    ead2436cf05e pinctrl: cherryview: fix address_space_handler() argument
    8859f58c1790 parisc: led: Reduce CPU overhead for disk & lan LED computation
    2655e1d970cf parisc: led: Fix LAN receive and transmit LEDs
    7ad44409cd3b lib/test_meminit: allocate pages up to order MAX_ORDER
    2d8138cea71d clk: qcom: turingcc-qcs404: fix missing resume during probe
    9f5db4ab19f8 drm/ast: Fix DRAM init on AST2200
    cfc47807a482 clk: qcom: camcc-sc7180: fix async resume during probe
    309c27162afe fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
    4316e951f164 scsi: qla2xxx: Fix firmware resource tracking
    7b89c3727bff scsi: qla2xxx: Error code did not return to upper layer
    15a71bb25beb scsi: qla2xxx: Fix smatch warn for qla_init_iocb_limit()
    106392156273 scsi: qla2xxx: Flush mailbox commands on chip reset
    def49a05aef4 scsi: qla2xxx: Remove unsupported ql2xenabledif option
    be12c9f4c60c scsi: qla2xxx: Fix TMF leak through
    4322f3de9f21 scsi: qla2xxx: Fix session hang in gnl
    a4708402c458 scsi: qla2xxx: Turn off noisy message log
    b0453b0cf506 scsi: qla2xxx: Fix erroneous link up failure
    5934b2125f5b scsi: qla2xxx: Fix command flush during TMF
    4a16a46c8481 scsi: qla2xxx: fix inconsistent TMF timeout
    f1ea164be545 scsi: qla2xxx: Fix deletion race condition
    683945b17724 scsi: qla2xxx: Limit TMF to 8 per function
    fde268c234d1 scsi: qla2xxx: Adjust IOCB resource on qpair create
    c29848249f78 io_uring: break iopolling on signal
    0def123f1254 io_uring: break out of iowq iopoll on teardown
    1a0aba2bf293 io_uring: always lock in io_apoll_task_func
    2920cc4c64a1 net/ipv6: SKB symmetric hash should incorporate transport ports
    529bcc70c49c udf: initialize newblock to 0
    fae2d591f3cb Revert "drm/amdgpu: install stub fence into potential unused fence pointers"
    f01e21d6c7ed md/md-bitmap: remove unnecessary local variable in backlog_store()
    99a8d14d7965 tracing: Zero the pipe cpumask on alloc to avoid spurious -EBUSY
    05c581ad3e7b perf/x86/uncore: Correct the number of CHAs on EMR
    861cfdc51f22 x86/sgx: Break up long non-preemptible delays in sgx_vepc_release()
    7e3ddbea87a9 USB: core: Fix oversight in SuperSpeed initialization
    7fe9d8799606 USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()
    eda9a2966582 USB: core: Change usb_get_device_descriptor() API
    56c49a3328e9 USB: core: Unite old scheme and new scheme descriptor reads
    0ad6bad31da6 usb: typec: bus: verify partner exists in typec_altmode_attention
    31220bd89c22 usb: typec: tcpm: set initial svdm version based on pd revision
    3acc6b9f266f cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
    cb65ad51f1bd crypto: stm32 - fix loop iterating through scatterlist for DMA
    9ab2c149c2e7 s390/ipl: add missing secure/has_secure file to ipl type 'unknown'
    6aff2732577c arm64: sdei: abort running SDEI handlers during crash
    fedecaeef888 pstore/ram: Check start of empty przs during init
    8d68582b93e6 mmc: renesas_sdhi: register irqs before registering controller
    5294144b6ad2 fsverity: skip PKCS#7 parser when keyring is empty
    86608e1b0c6f net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
    51ffed9ca1a4 X.509: if signature is unsupported skip validation
    6ecf09699eb1 dccp: Fix out of bounds access in DCCP error handler
    7a2978e8d3c0 dlm: fix plock lookup when using multiple lockspaces
    703cf47d47ba parisc: Fix /proc/cpuinfo output for lscpu
    49a49d442075 procfs: block chmod on /proc/thread-self/comm
    44f6ec589353 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
    d73d3787c9d1 ntb: Fix calculation ntb_transport_tx_free_entry()
    da0c7293f4db ntb: Clean up tx tail index on link down
    bfa051f650a7 ntb: Drop packets when qp link is down
    8f4edcd65534 scsi: mpt3sas: Perform additional retries if doorbell read returns 0
    58388f2958f6 Revert "scsi: qla2xxx: Fix buffer overrun"
    bd188d1e3855 media: venus: hfi_venus: Write to VIDC_CTRL_INIT after unmasking interrupts
    6e9632a01e6d media: dvb: symbol fixup for dvb_attach()
    9a43563cfd6b arm64: csum: Fix OoB access in IP checksum code for negative lengths
    a0a49da2a79a i3c: master: svc: fix probe failure when no i3c device exist
    a905ac21b2ab xtensa: PMU: fix base address for the newer hardware
    8742dbf9c25d backlight/lv5207lp: Compare against struct fb_info.device
    568132f74cb1 backlight/bd6107: Compare against struct fb_info.device
    4e7b4ddc900c backlight/gpio_backlight: Compare against struct fb_info.device
    3b018c3d1016 ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()
    cbb7d8a4b4be ipmi_si: fix a memleak in try_smi_init()
    6043dd31f771 PCI: rockchip: Use 64-bit mask on MSI 64-bit PCI address
    aba1bf197467 media: i2c: ccs: Check rules is non-NULL
    df64819dd6a0 mm/vmalloc: add a safer version of find_vm_area() for debug
    20b7d0a62ad1 scsi: core: Fix the scsi_set_resid() documentation
    20990d6a8543 printk: ringbuffer: Fix truncating buffer size min_t cast
    0a22f9c17b1a rcu: dump vmalloc memory info safely
    d479c841b18d ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
    111bafa210ae PM / devfreq: Fix leak in devfreq_dev_release()
    be7353af5b35 igb: set max size RX buffer when store bad packet is enabled
    d5790386595d skbuff: skb_segment, Call zero copy functions before using skbuff frags
    267a29f8bfdb netfilter: xt_sctp: validate the flag_info count
    b3d07714ad24 netfilter: xt_u32: validate user space input
    a9e6142e5f8f netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
    3e48f741e98a igmp: limit igmpv3_newpack() packet size to IP_MAX_MTU
    de16cb7986f2 virtio_ring: fix avail_wrap_counter in virtqueue_add_packed
    d6f80ddb9eda cpufreq: Fix the race condition while updating the transition_task of policy
    42d8c7fa0bf6 dmaengine: ste_dma40: Add missing IRQ check in d40_probe
    329d0f168c8f um: Fix hostaudio build errors
    58d17e766093 mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
    679a71b31179 mtd: spi-nor: Check bus width while setting QE bit
    8869fd166f23 leds: trigger: tty: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead
    0f715ea7d36e leds: multicolor: Use rounded division when calculating color components
    1a68bef23726 leds: pwm: Fix error code in led_pwm_create_fwnode()
    abd740db896b rpmsg: glink: Add check for kstrdup
    b45cf29f97a2 phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
    40d637359f3f phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate
    52942a47d034 phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
    31d7e6c7689b mtd: rawnand: brcmnand: Fix mtd oobsize
    6182318ac046 tracing: Fix race issue between cpu buffer write and swap
    548f48ec1915 tracing: Remove extra space at the end of hwlat_detector/mode
    2ba8bb00720a x86/speculation: Mark all Skylake CPUs as vulnerable to GDS
    dde88ab4e45b HID: multitouch: Correct devm device reference for hidinput input_dev name
    4fb28379b3c7 HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()
    1bb42aca7a96 Revert "IB/isert: Fix incorrect release of isert connection"
    4f1807fddd9b amba: bus: fix refcount leak
    1c3701373463 serial: tegra: handle clk prepare error in tegra_uart_hw_init()
    076fb40cf27a scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock
    c4772759abe1 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
    6248f4305378 cgroup:namespace: Remove unused cgroup_namespaces_init()
    04824d50e6b5 media: i2c: rdacm21: Fix uninitialized value
    f3572eef8551 media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
    205f71744176 media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
    89ecb4b40094 media: ov2680: Add ov2680_fill_format() helper function
    784d1b83ae2c media: ov2680: Don't take the lock for try_fmt calls
    dbb717b4ee68 media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
    4c1a5c2885d4 media: ov2680: Fix vflip / hflip set functions
    958905ed42b8 media: ov2680: Fix ov2680_bayer_order()
    cdd5fca7200d media: ov2680: Remove auto-gain and auto-exposure controls
    322a805ffdff media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
    abba34017e16 media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
    1717f67be875 USB: gadget: f_mass_storage: Fix unused variable warning
    121b8d30f42c media: venus: hfi_venus: Only consider sys_idle_indicator on V1
    f6b483ead6dc media: go7007: Remove redundant if statement
    d079a3e1ccdd platform/x86: dell-sysman: Fix reference leak
    426bd7418701 iommu/vt-d: Fix to flush cache of PASID directory table
    9dc6f660815a iommu/qcom: Disable and reset context bank before programming
    3274e32fc969 fsi: aspeed: Reset master errors after CFAM reset
    7a17deca33e1 IB/uverbs: Fix an potential error pointer dereference
    42d111304dd7 RDMA/hns: Fix CQ and QP cache affinity
    b051c3bf3bdf RDMA/hns: Fix incorrect post-send with direct wqe of wr-list
    154822356e4d RDMA/hns: Fix port active speed
    de4aca5b284e iommu/sprd: Add missing force_aperture
    46b76f13f1ad driver core: test_async: fix an error code
    a6992ecefe5d dma-buf/sync_file: Fix docs syntax
    d3256d80406c coresight: tmc: Explicit type conversions to prevent integer overflow
    93a5b461a4e1 RDMA/irdma: Replace one-element array with flexible-array member
    97097ea2f37e scsi: qedf: Do not touch __user pointer in qedf_dbg_fp_int_cmd_read() directly
    1c996be7f233 scsi: qedf: Do not touch __user pointer in qedf_dbg_debug_cmd_read() directly
    cb6d20a8b5d7 scsi: qedf: Do not touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly
    2f0d202d82b9 x86/APM: drop the duplicate APM_MINOR_DEV macro
    f34508d934c4 serial: sprd: Fix DMA buffer leak issue
    c54c66d904fa serial: sprd: Assign sprd_port after initialized to avoid wrong access
    f61fc650c478 scsi: qla4xxx: Add length check when parsing nlattrs
    46ad449efde1 scsi: be2iscsi: Add length check when parsing nlattrs
    4bd57d889099 scsi: iscsi: Add strlen() check in iscsi_if_set{_host}_param()
    e9bac3cc744f scsi: iscsi: Add length check for nlattr payload
    9285efd95996 scsi: iscsi: Rename iscsi_set_param() to iscsi_if_set_param()
    7231d60d41c4 scsi: RDMA/srp: Fix residual handling
    484ddaa90b7e usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
    cbb8f7097e11 media: mediatek: vcodec: Return NULL if no vdec_fb is found
    18dc93de9019 media: rkvdec: increase max supported height for H.264
    f1e7d999f37e scsi: hisi_sas: Fix normally completed I/O analysed as failed
    46d1b2a3d5a6 scsi: hisi_sas: Fix warnings detected by sparse
    e454e985950b scsi: hisi_sas: Modify v3 HW SATA completion error processing
    7caac45b52f4 scsi: hisi_sas: Modify v3 HW SSP underflow error processing
    f64d02822b82 media: cx24120: Add retval check for cx24120_message_send()
    7ca7cd02114a media: dvb-usb: m920x: Fix a potential memory leak in m920x_i2c_xfer()
    fb24b65aaccd media: dib7000p: Fix potential division by zero
    56a3d8ae4576 drivers: usb: smsusb: fix error handling code in smsusb_init_device
    d1b51b130d32 iommu: rockchip: Fix directory table address encoding
    a50d60b8f2af iommu/amd/iommu_v2: Fix pasid_state refcount dec hit 0 warning on pasid unbind
    caf058833b6f media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()
    711e9e44f6c4 media: i2c: tvp5150: check return value of devm_kasprintf()
    30d4380eb030 media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables
    663114dfc178 RDMA/qedr: Remove a duplicate assignment in irdma_query_ah()
    1473e40b3912 pNFS: Fix assignment of xprtdata.cred
    fb7ddc1138b0 NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
    53a1e5ab1b11 NFS: Guard against READDIR loop when entry names exceed MAXNAMELEN
    19a648a07572 NFSD: da_addr_body field missing in some GETDEVICEINFO replies
    b0f127a7c635 fs: lockd: avoid possible wrong NULL parameter
    8f994b830dd0 jfs: validate max amount of blocks before allocation.
    f6a84ef1d080 ext4: fix unttached inode after power cut with orphan file feature enabled
    a9ddbfed5346 powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
    a70c8de30514 nfs/blocklayout: Use the passed in gfp flags
    2935443dc9c2 powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
    75dcb650a7ef powerpc: Don't include lppaca.h in paca.h
    cefcb002c5c9 PCI: layerscape: Add workaround for lost link capabilities during reset
    4be323c73797 PCI: layerscape: Add the endpoint linkup notifier support
    69c712389e1f PCI: dwc: Add start_link/stop_link inlines
    aac0a9a1577b wifi: ath10k: Use RMW accessors for changing LNKCTL
    3539bab5f9de wifi: ath11k: Use RMW accessors for changing LNKCTL
    ea670d0146a3 net/mlx5: Use RMW accessors for changing LNKCTL
    348ef09df984 drm/radeon: Use RMW accessors for changing LNKCTL
    5468237382ed drm/amdgpu: Use RMW accessors for changing LNKCTL
    00f79e78bf4b powerpc/perf: Convert fsl_emb notifier to state machine callbacks
    a26a5e4be2c4 powerpc/fadump: reset dump area size if fadump memory reserve fails
    13fd667db999 vfio/type1: fix cap_migration information leak
    6b708243d3d9 powerpc/radix: Move some functions into #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
    dbde1d9c54e2 clk: imx: composite-8m: fix clock pauses when set_rate would be a no-op
    824e97302fd8 clk: imx8mp: fix sai4 clock
    66ef144dbdf9 PCI/ASPM: Use RMW accessors for changing LNKCTL
    f46fa8ab8d82 PCI: pciehp: Use RMW accessors for changing LNKCTL
    759d978e831b pinctrl: mcp23s08: check return value of devm_kasprintf()
    02faf0bd6fdc PCI: Mark NVIDIA T4 GPUs to avoid bus reset
    4c20a4143276 PCI: microchip: Correct the DED and SEC interrupt bit offsets
    377f7aeddda0 clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
    1c4a98c55fa3 clk: qcom: reset: Use the correct type of sleep/delay based on length
    bd4eff9c835a clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
    b1cb8bf42b36 ext4: avoid potential data overflow in next_linear_group
    3e24082f1682 ext4: correct grp validation in ext4_mb_good_group
    febacbefe451 EDAC/igen6: Fix the issue of no error events
    964f62caac08 clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
    f1399e1543e7 clk: sunxi-ng: Modify mismatched function name
    92913d32e719 drivers: clk: keystone: Fix parameter judgment in _of_pll_clk_init()
    3ad53071fe85 ipmi:ssif: Fix a memory leak when scanning for an adapter
    7792869495b6 ipmi:ssif: Add check for kstrdup
    53abafedfeb7 ALSA: ac97: Fix possible error value of *rac97
    48fc5717b249 of: unittest: Fix overlay type in apply/revert check
    01bb96ad3808 of: overlay: Call of_changeset_init() early
    30f04a41e7d7 md: raid0: account for split bio in iostat accounting
    9643cc0b1771 md/raid0: Fix performance regression for large sequential writes
    17fbf7da491f md/raid0: Factor out helper for mapping and submitting a bio
    d04f1e322f52 md: add error_handlers for raid0 and linear
    d8b6adb84041 md: Set MD_BROKEN for RAID1 and RAID10
    a68fabdad970 bus: ti-sysc: Fix cast to enum warning
    7636dfc42b66 arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
    fff4d36247e8 drm/mediatek: Fix potential memory leak if vmap() fail
    e5758ad9a34f drm/mediatek: Remove freeing not dynamic allocated memory
    97274bea0136 bus: ti-sysc: Fix build warning for 64-bit build
    cc6b09671d0c io_uring: fix drain stalls by invalid SQE
    0152e7758cc4 audit: fix possible soft lockup in __audit_inode_child()
    48e4c4819039 drm/msm/a2xx: Call adreno_gpu_init() earlier
    76c3ad12441f drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_create()
    32e060927351 smackfs: Prevent underflow in smk_set_cipso()
    502dfc5875ba firmware: meson_sm: fix to avoid potential NULL pointer dereference
    c0b1eee64870 drm/msm/mdp5: Don't leak some plane state
    d0b82c217feb drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask
    b7b0c48851c4 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
    8025396b76e9 drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
    27eee65b2e31 drm/armada: Fix off-by-one error in armada_overlay_get_property()
    cc9254b24a4b arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
    ea5bc6f5aa09 of: unittest: fix null pointer dereferencing in of_unittest_find_node_by_name()
    4197eeb55f4b drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
    9712279e9743 drm/msm: Update dev core dump to not print backwards
    8ef5d1f16d92 md/md-bitmap: hold 'reconfig_mutex' in backlog_store()
    382638364711 md/bitmap: don't set max_write_behind if there is no write mostly device
    a3d36107ee48 md/raid10: use dereference_rdev_and_rrdev() to get devices
    94ca5eed9530 md/raid10: factor out dereference_rdev_and_rrdev()
    246bac7d3c3e drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
    de93b4711ac2 arm64: dts: qcom: sdm845: Fix the min frequency of "ice_core_clk"
    a9e56fa8a0ca arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
    db0ba312542d ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
    c4413633ef78 drm: adv7511: Fix low refresh rate register for ADV7533/5
    57b6d92c79e9 ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
    b7f47031e319 ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
    2f0246b3c7ff ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
    d12beb1b1ee5 ARM: dts: s3c64xx: align pinctrl with dtschema
    188f2d41fa5d x86/mm: Fix PAT bit missing from page protection modify mask
    1dd43e1e54d5 drm/etnaviv: fix dumping of active MMU context
    1634fe406c34 arm64: dts: qcom: pmi8994: Add missing OVP interrupt
    4b7eb5e2c1c4 arm64: dts: qcom: Move WLED num-strings from pmi8994 to sony-xperia-tone
    92919d98e673 arm64: dts: qcom: pmi8994: Remove hardcoded linear WLED enabled-strings
    365909857242 arm64: dts: qcom: pm660l: Add missing short interrupt
    ea48fd91df12 arm64: dts: qcom: correct SPMI WLED register range encoding
    eee01e0d6abe arm64: dts: qcom: pmi8998: Add node for WLED
    b788afdbfd5a arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup again
    2840d9b9c875 ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
    b35f3ca1877e ARM: dts: BCM53573: Add cells sizes to PCIe node
    bed08bb83292 drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
    261e69456617 arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA coherent
    12a93e53eaf0 arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
    4c9a637258bb arm64: dts: qcom: sm8350: Use proper CPU compatibles
    4c918fb77dea arm64: dts: qcom: sm8350: Add missing LMH interrupts to cpufreq
    9c022ab2db40 arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
    bda65ecaec97 arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
    6119aaced94f arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
    c0dc9d7d3f2b arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
    d2d698daa1fa arm64: dts: qcom: sm8250: correct dynamic power coefficients
    510bae3d37f7 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
    b08c7a31baeb soc: qcom: ocmem: Add OCMEM hardware version print
    dc04034502e6 ASoC: stac9766: fix build errors with REGMAP_AC97
    89602de9a2d7 quota: fix dqput() to follow the guarantees dquot_srcu should provide
    1df46e717ee9 quota: add new helper dquot_active()
    bd0a6452f070 quota: rename dquot_active() to inode_quota_active()
    5b8240223407 quota: factor out dquot_write_dquot()
    6c6efd3a1d06 drm/bridge: tc358764: Fix debug print parameter order
    a48e7def0006 netrom: Deny concurrent connect().
    4cf994d3f4ff net/sched: sch_hfsc: Ensure inner classes have fsc curve
    edb5b1b3b9f8 hwmon: (tmp513) Fix the channel number in tmp51x_is_visible()
    a85fd8116555 mlxsw: i2c: Limit single transaction buffer size
    7790b6a2f5f0 mlxsw: i2c: Fix chunk size setting in output mailbox buffer
    510e0cbd6408 net: arcnet: Do not call kfree_skb() under local_irq_disable()
    93a572b9d42f wifi: ath9k: use IS_ERR() with debugfs_create_dir()
    5138beea8e7f Bluetooth: btusb: Do not call kfree_skb() under spin_lock_irqsave()
    d7fd24b8d1bb wifi: mwifiex: avoid possible NULL skb pointer dereference
    71ce8be48bf0 wifi: nl80211/cfg80211: add forgotten nla_policy for BSS color attribute
    11f93fff6e8a wifi: ath9k: protect WMI command response buffer replacement with a lock
    6904c7afd512 wifi: ath9k: fix races between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx
    cec7db9ea031 samples/bpf: fix broken map lookup probe
    89f19a9a055d wifi: mwifiex: Fix missed return in oob checks failed path
    308eb3a609ac wifi: mwifiex: fix memory leak in mwifiex_histogram_read()
    9c00731bf05d fs: ocfs2: namei: check return value of ocfs2_add_entry()
    f683992d30ee lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
    e3f647e4b642 lwt: Fix return values of BPF xmit ops
    4ff998134025 hwrng: iproc-rng200 - Implement suspend and resume calls
    5a70ab6b59b2 crypto: caam - fix unchecked return value error
    660b6b1c5cf8 ice: ice_aq_check_events: fix off-by-one check when filling buffer
    55fab9389d65 net-memcg: Fix scope of sockmem pressure indicators
    41c40d84838d selftests/bpf: Clean up fmod_ret in bench_rename test script
    50c78e71446d net: tcp: fix unexcepted socket die when snd_wnd is 0
    942d8cefb022 Bluetooth: Fix potential use-after-free when clear keys
    7b0243d26a71 Bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    048545d9fc64 crypto: api - Use work queue in crypto_destroy_instance
    56cb7bbefcaf crypto: stm32 - Properly handle pm_runtime_get failing
    e3c4a6b073e4 selftests/bpf: fix static assert compilation issue for test_cls_*.c
    43423b3e0467 wifi: mwifiex: fix error recovery in PCIE buffer descriptor management
    7c54b6fc39eb wifi: mwifiex: Fix OOB and integer underflow when rx packets
    a20b96cf6925 wifi: mt76: mt7915: fix power-limits while chan_switch
    5c75a4379589 can: gs_usb: gs_usb_receive_bulk_callback(): count RX overflow errors also in case of OOM
    890843254f38 spi: tegra20-sflash: fix to check return value of platform_get_irq() in tegra_sflash_probe()
    2ff9ac0cf25f wifi: mt76: testmode: add nla_policy for MT76_TM_ATTR_TX_LENGTH
    802008e8c73a ipv6: Add reasons for skb drops to __udp6_lib_rcv
    7dcbc0bb0e5c bpf: reject unhashed sockets in bpf_sk_assign
    caa2883b1885 udp: re-score reuseport groups when connected sockets are present
    b60dfa4559d8 regmap: rbtree: Use alloc_flags for memory allocations
    34f1180658d9 hwrng: pic32 - use devm_clk_get_enabled
    5af3c8676b36 hwrng: nomadik - keep clock enabled while hwrng is registered
    14c6d1e80847 tcp: tcp_enter_quickack_mode() should be static
    7b75b4c90a9e bpf: Clear the probe_addr for uprobe
    75d3960be702 bpftool: Use a local bpf_perf_event_value to fix accessing its fields
    8ea6871116d5 cpufreq: powernow-k8: Use related_cpus instead of cpus in driver.exit()
    be2092d2a703 x86/efistub: Fix PCI ROM preservation in mixed mode
    9eb25ea7b65d ACPI: x86: s2idle: Fix a logic error parsing AMD constraints table
    26097a7f28b3 ACPI: x86: s2idle: Post-increment variables when getting constraints
    8a962f11a95b s390/paes: fix PKEY_TYPE_EP11_AES handling for secure keyblobs
    7833a74f8d00 s390/pkey: fix/harmonize internal keyblob headers
    208383d68510 selftests/futex: Order calls to futex_lock_pi
    c7802ff51adc perf/imx_ddr: don't enable counter0 if none of 4 counters are used
    0a872a0521c8 x86/decompressor: Don't rely on upper 32 bits of GPRs being preserved
    3af6f77e8090 selftests/resctrl: Close perf value read fd on errors
    4505ad996b66 selftests/resctrl: Unmount resctrl FS if child fails to run benchmark
    c68a196e7ff6 selftests/resctrl: Don't leak buffer in fill_cache()
    fdcb63afd3f6 selftests/resctrl: Add resctrl.h into build deps
    b2ba11ed4d10 selftests/resctrl: Make resctrl_tests run using kselftest framework
    e0478944f4a5 OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
    ec9d118ad99d refscale: Fix uninitalized use of wait_queue_head_t
    e280033ef135 ARM: ptrace: Restore syscall skipping for tracers
    4c3f33904dea ARM: ptrace: Restore syscall restart tracing
    0481251b7cd6 selftests/harness: Actually report SKIP for signal tests
    060ca3f7899a tmpfs: verify {g,u}id mount options correctly
    d412e9b34b90 fs: Fix error checking for d_hash_and_lookup()
    a4229f93bc54 eventfd: prevent underflow for eventfd semaphores
    cedb8719333d reiserfs: Check the return value from __getblk()
    c1a4117f1544 Revert "net: macsec: preserve ingress frame ordering"
    40671f90d5b5 udf: Handle error when adding extent to a file
    099bf90d7fc4 udf: Check consistency of Space Bitmap Descriptor
    7039aa1be9cc of: kexec: Mark ima_{free,stable}_kexec_buffer() as __init
    759d51eda2d0 net: Avoid address overwrite in kernel_connect
    7c4cce5700b9 arm64: lib: Import latest version of Arm Optimized Routines' strncmp
    104df1c695c1 crypto: rsa-pkcs1pad - Use helper to set reqsize
    273f4615314f platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    9ef5c25bcf1b tracing: Introduce pipe_cpumask to avoid race on trace_pipes
    8c1b60dad0f5 ALSA: seq: oss: Fix racy open/close of MIDI devices
    fa05aea28195 scsi: lpfc: Fix incorrect big endian type assignment in bsg loopback path
    f0bf8a071134 scsi: storvsc: Always set no_report_opcodes
    e9e62419e797 sctp: handle invalid error codes without calling BUG()
    3714bb4a1df8 bnx2x: fix page fault following EEH recovery
    53b8cc2f9685 netlabel: fix shift wrapping bug in netlbl_catmap_setlong()
    867cdd7f9544 drm/amdgpu: Match against exact bootloader status
    0863204deb3c net: hns3: restore user pause configure when disable autoneg
    ac93def0dbb4 scsi: qedi: Fix potential deadlock on &qedi_percpu->p_work_lock
    bef6c89a92d0 scsi: lpfc: Remove reftag check in DIF paths
    b439e33a8c93 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM
    156b803194ae wifi: brcmfmac: Fix field-spanning write in brcmf_scan_params_v2_to_v1()
    87ea5e89407e net: usb: qmi_wwan: add Quectel EM05GV2
    e1313fa9d2e3 vmbus_testing: fix wrong python syntax for integer value comparison
    5faad57ba6c7 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM
    e13f0dd5fbe2 kprobes: Prohibit probing on CFI preamble symbol
    ee49b97cb5ae security: keys: perform capable check only on privileged operations
    f44f50305de2 ata: pata_arasan_cf: Use dev_err_probe() instead dev_err() in data_xfer()
    a85c523aeccd ovl: Always reevaluate the file signature for IMA
    3faa126258a9 drm/amd/display: Exit idle optimizations before attempt to access PHY
    c152ca4f219b platform/x86: huawei-wmi: Silence ambient light sensor
    a9988b9c7a31 platform/x86/intel/hid: Add HP Dragonfly G2 to VGBS DMI quirks
    7f3901b04c8f platform/x86: intel: hid: Always call BTNL ACPI method
    23151421ed01 ASoC: atmel: Fix the 8K sample parameter in I2SC master
    c934d2a6970c ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0
    20587011d271 ASoC: rt711: fix for JD event handling in ClockStop Mode0
    b41f79896456 ASoc: codecs: ES8316: Fix DMIC config
    cc2b0a2055dc ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
    5b64fc2471f9 fs/nls: make load_nls() take a const parameter
    f85908f6bfd2 s390/dasd: fix hanging device after request requeue
    a4845e694893 s390/dasd: use correct number of retries for ERP requests
    e062aa1acf9b m68k: Fix invalid .section syntax
    bbfa7d712b24 vxlan: generalize vxlan_parse_gpe_hdr and remove unused args
    b10215ffdb01 ethernet: atheros: fix return value check in atl1c_tso_csum()
    6bb94f46d31a ASoC: da7219: Check for failure reading AAD IRQ events
    279a6dad0cd9 ASoC: da7219: Flush pending AAD IRQ when suspending
    d424c636b750 ksmbd: no response from compound read
    82373d1b763e ksmbd: fix out of bounds in smb3_decrypt_req()
    20d449a08749 9p: virtio: make sure 'offs' is initialized in zc_request
    c4269c7258d9 media: pci: cx23885: fix error handling for cx23885 ATSC boards
    17d75773b66e media: pulse8-cec: handle possible ping error
    f281a3739399 phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
    dfff9c91cbb0 ARM: dts: imx: Set default tuning step for imx7d usdhc
    4e364cab1331 ARM: dts: imx: Adjust dma-apbh node name
    99319298fd9a ARM: dts: imx7s: Drop dma-apb interrupt-names
    1dc2c12854b6 ARM: dts: imx: update sdma node name format
    aff03380bda4 Linux 5.15.131
    cd8ab566cf17 usb: typec: tcpci: clear the fault status bit
    403b2e940910 usb: typec: tcpci: move tcpci.h to include/linux/usb/
    f29483873e24 pinctrl: amd: Don't show `Invalid config param` errors
    b911bef132a0 nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    1c6ddf739f15 nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    f6e61aef5c5d tcpm: Avoid soft reset when partner does not support get_status
    da0e7d435e31 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    72eca651d732 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    907216337bea serial: sc16is7xx: fix bug when first setting GPIO direction
    45d9611ebff2 serial: sc16is7xx: fix broken port 0 uart init
    f90e267dd27e serial: qcom-geni: fix opp vote on shutdown
    46d13013b574 wifi: mt76: mt7921: do not support one stream on secondary antenna only
    a5c2a467e9e7 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
    f49294ad6898 staging: rtl8712: fix race condition
    d17cec60e87c HID: wacom: remove the battery when the EKR is off
    842c7da3eee2 usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
    276a906f81a7 usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
    60f938e84fbb ALSA: usb-audio: Fix init call orders for UAC1
    e949dd2a9b6b USB: serial: option: add FOXCONN T99W368/T99W373 product
    c41411d8b333 USB: serial: option: add Quectel EM05G variant (0x030e)
    09baa839d415 modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    997a194914c4 rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    3d0f6408601b net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    da95090821c4 mmc: au1xmmc: force non-modular build and remove symbol_get usage
    e3e68100c036 ARM: pxa: remove use of symbol_get()
    bb5bf157b5be ksmbd: replace one-element array with flex-array member in struct smb2_ea_info
    2e3f57f74c0a ksmbd: fix wrong DataOffset validation of create context
    b3ad7f39fd85 erofs: ensure that the post-EOF tails are all zeroed
    8f790700c974 Linux 5.15.130
    69347c334071 rcu-tasks: Add trc_inspect_reader() checks for exiting critical section
    8046fb611f70 rcu-tasks: Wait for trc_read_check_handler() IPIs
    da22db901cc1 rcu-tasks: Fix IPI failure handling in trc_wait_for_one_reader
    a0249d365ac8 rcu: Prevent expedited GP from enabling tick on offline CPU
    7aec063d6029 ARM: module: Use module_init_layout_section() to spot init sections
    4a8976052acd arm64: module: Use module_init_layout_section() to spot init sections
    f8a74159d116 arm64: module-plts: inline linux/moduleloader.h
    363bbb5008e5 module: Expose module_init_layout_section()
    758e3d0cb753 ACPI: thermal: Drop nocrt parameter

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index acac15d2e9..e0c0ca75b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "821659458e4746c3f4fa690a8744cd23efa8a666"
-SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
+SRCREV_machine ?= "5ed6828a27530bc00cc2fb04f2d2ea3ac2cb7f69"
+SRCREV_meta ?= "929bb5cf4d6cc49061f61341508ec12fd2f22db1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.129"
+LINUX_VERSION ?= "5.15.133"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index cc8e6ee393..afe87d5d0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.129"
+LINUX_VERSION ?= "5.15.133"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bbc3bff691a772d78872031baa1ef2d90506fdfb"
-SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
+SRCREV_machine ?= "5a7d2f3bd8beda38572df4381722d3be525456b6"
+SRCREV_meta ?= "929bb5cf4d6cc49061f61341508ec12fd2f22db1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 10277b9d1c..f38457f7fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d121a9301bef475d9619285e71d18809020221ef"
-SRCREV_machine:qemuarm64 ?= "8af42265e53233f47b1d9a6a9722e06e624d5fb2"
-SRCREV_machine:qemumips ?= "08bcb48e4efd9c46079b2274b7d038763dafe550"
-SRCREV_machine:qemuppc ?= "24d636e08d3c92b47b4c398cad7a50ebb61acb28"
-SRCREV_machine:qemuriscv64 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
-SRCREV_machine:qemuriscv32 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
-SRCREV_machine:qemux86 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
-SRCREV_machine:qemux86-64 ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
-SRCREV_machine:qemumips64 ?= "4c41aa28a3b367a568f005d7ce35ef7c7f314bfd"
-SRCREV_machine ?= "ba24506cdeee4abb7f94cc4678131e01bccfa344"
-SRCREV_meta ?= "c16749e4e0a2f8a903c36d44f7125dd423600c57"
+SRCREV_machine:qemuarm ?= "3c179d81e35db973bf0e1ce29533ebcbacf59eab"
+SRCREV_machine:qemuarm64 ?= "2d42957c8fe4fd81adf61232b475d6f09393ef6c"
+SRCREV_machine:qemumips ?= "f281f9161a213e2428c0f1ac66de0588203e8070"
+SRCREV_machine:qemuppc ?= "3e28c1dc0fe41251516694e81a4915dc650f13f7"
+SRCREV_machine:qemuriscv64 ?= "1f24338cb789ef1f09485ceff38173d2b6d9b412"
+SRCREV_machine:qemuriscv32 ?= "1f24338cb789ef1f09485ceff38173d2b6d9b412"
+SRCREV_machine:qemux86 ?= "1f24338cb789ef1f09485ceff38173d2b6d9b412"
+SRCREV_machine:qemux86-64 ?= "1f24338cb789ef1f09485ceff38173d2b6d9b412"
+SRCREV_machine:qemumips64 ?= "2afb645f88de7f44fd4205a0eea3aa25132ddc64"
+SRCREV_machine ?= "1f24338cb789ef1f09485ceff38173d2b6d9b412"
+SRCREV_meta ?= "929bb5cf4d6cc49061f61341508ec12fd2f22db1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8f790700c974345ab78054e109beddd84539f319"
+SRCREV_machine:class-devupstream ?= "b911329317b4218e63baf78f3f422efbaa7198ed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.129"
+LINUX_VERSION ?= "5.15.133"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


