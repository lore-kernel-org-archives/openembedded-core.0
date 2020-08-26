Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.12857.1598450257648708365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 06:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fpwkUBgp;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id t23so1415911qto.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2gpd/97f3BKxBI9YXSNurhft7vQHeElA59voEuuCnM=;
        b=fpwkUBgp3+VTeoxL74uuJWaiIVyelU/xWpwCO/8mH73shM5PIeKHhUmnhX82FM+TjS
         0velbgXAYKPzu/RTd5EwLJRsIjDWXVaNxvp+DBLbq4+ruNHyogkiSqE1Hcx18r19+QKd
         npQlebsBJp4qHPf/jYVwN4ekL1eGuSWaVWzx6RG9b+kU3T+zx/szvO0n27/nic797HvC
         G8gGcmBUdzdietKMwVFddfzY6oILG2OD1/uQfEItYySbeRww7d4vV4auBFrbqvgxDTw2
         qaQhhysqfvxO8lHIjqacpCowTXwsr653v0qamXdcBVVHccP6rK+/awzYs8/3mFv8z5p/
         Dz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2gpd/97f3BKxBI9YXSNurhft7vQHeElA59voEuuCnM=;
        b=SepKOnooLK8VLHcUmUtwjwkeGro3yhWL+ir8otCax1lkZVICFlChvodu1jcSDzL7zW
         LJpIvnKs3wH+wFxUnNp4G7zTDbqpeFnxpQatudlcJNzDgXNI4ShH7I+/VlyJycMRJQcC
         qnJys14ymBK8W1+xbAXOatSscunYuDCtbFi1vQzad6eOx6WvPHLbe2cnp2pUuZZQ94sb
         YlV8e8/aPWD3m2Y/oyzxGSqckMIWzd7HVznCotrzh9XNge2t3PQXE3Sv1ecx6slgYqMI
         O5jVVD9UqOYLMFkKziGQeudVUBm6AO9PVZisc6/S7Z0UCSEtngWqoE8I/b6etKdLP3Ze
         qBZw==
X-Gm-Message-State: AOAM532En3BGaDXnhocedX7KwEo5LC49fRjQSE9b1ebQve91VYDfM5Sg
	DBQPBgRsjriHg98UHg66ojI=
X-Google-Smtp-Source: ABdhPJwY/BdUGy1CFCfoQj0R1HA3S2w0ygEDdTNPUt8qMInkKr6ucwxOWUNPGCnLEykFKKbA0OW5ag==
X-Received: by 2002:ac8:545a:: with SMTP id d26mr14455868qtq.50.1598450256470;
        Wed, 26 Aug 2020 06:57:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a52sm1371737qtc.22.2020.08.26.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 06:57:35 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/5.8: update to v5.8.3
Date: Wed, 26 Aug 2020 09:57:29 -0400
Message-Id: <e9ece9c1af83757337df10f4948ef9406f86abd7.1598450136.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598450136.git.bruce.ashfield@gmail.com>
References: <cover.1598450136.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    a1101e94767e Linux 5.8.3
    60db6233fcdb drm/amd/display: dchubbub p-state warning during surface planes switch
    f80a0daa7f0a drm/amd/display: Fix dmesg warning from setting abm level
    ca4c7f2d2f3e drm/amdgpu: Fix bug where DPM is not enabled after hibernate and resume
    81dfb2e6cef1 drm: fix drm_dp_mst_port refcount leaks in drm_dp_mst_allocate_vcpi
    c4dc000bdef4 drm: Added orientation quirk for ASUS tablet model T103HAF
    516bbc000e24 drm/tidss: fix modeset init for DPI panels
    efe06a004622 drm/omap: force runtime PM suspend on system suspend
    c37097f533d8 drm/dp_mst: Fix the DDC I2C device unregistration of an MST port
    392379d6933a drm/dp_mst: Fix timeout handling of MST down messages
    24232c85a62c drm/dp_mst: Fix the DDC I2C device registration of an MST port
    1ff09cb0376c drm/panfrost: Use kvfree() to free bo->sgts
    01f876a47fc8 drm/i915/gt: Force the GT reset on shutdown
    77fac4e901a1 sh: fault: Fix duplicate printing of "PC:"
    97086157b4e2 sh: landisk: Add missing initialization of sh_io_port_base
    bc0d59fb4df8 perf/x86/rapl: Fix missing psys sysfs attributes
    274522c44276 tools build feature: Quote CC and CXX for their arguments
    c361cf1959bb perf bench mem: Always memset source before memcpy
    6719a2c9e756 ALSA: echoaudio: Fix potential Oops in snd_echo_resume()
    4aadfa123628 crypto: algif_aead - fix uninitialized ctx->init
    de08998ab4c6 mfd: dln2: Run event handler loop under spinlock
    ceb2646520b2 i2c: iproc: fix race between client unreg and isr
    53bad01a3b03 test_kmod: avoid potential double free in trigger_config_run_type()
    f47254f20a4b fs/ufs: avoid potential u32 multiplication overflow
    86593fd4e57f fs/minix: remove expected error message in block_to_path()
    378719932ec7 fs/minix: fix block limit check for V1 filesystems
    9ca9f3ba5686 fs/minix: set s_maxbytes correctly
    617e41f5dac8 lib/test_lockup.c: fix return value of test_lockup_init()
    e39eefbc1708 NFS: Fix flexfiles read failover
    266bc13be47a nfs: Fix getxattr kernel panic and memory overflow
    0e2446523c77 net: qcom/emac: add missed clk_disable_unprepare in error path of emac_clks_phase1_init
    fcd4fd88eb02 s390/Kconfig: add missing ZCRYPT dependency to VFIO_AP
    3745a958bce1 s390/test_unwind: fix possible memleak in test_unwind()
    e160e9079706 drm/vmwgfx: Fix two list_for_each loop exit tests
    6679a59a7ae3 drm/vmwgfx: Use correct vmw_legacy_display_unit pointer
    5e8e8c3d96d4 vdpa: Fix pointer math bug in vdpasim_get_config()
    86e42d0d425b recordmcount: Fix build failure on non arm64
    240c89d0c469 vdpa_sim: init iommu lock
    3a1b4c0eda07 selftests/bpf: Fix silent Makefile output
    94a9bdbc2b35 perf record: Skip side-band event setup if HAVE_LIBBPF_SUPPORT is not set
    e29f7f9a7908 Input: sentelic - fix error return when fsp_reg_write fails
    3396572c3b62 selftests/bpf: Prevent runqslower from racing on building bpftool
    8dfe0e66582c x86/bugs/multihit: Fix mitigation reporting when VMX is not in use
    bff77b49db3e x86/tsr: Fix tsc frequency enumeration bug on Lightning Mountain SoC
    cb511f4b7160 kprobes: Fix compiler warning for !CONFIG_KPROBES_ON_FTRACE
    0b702cd41418 md-cluster: Fix potential error pointer dereference in resize_bitmaps()
    f4c223e3941b watchdog: rti-wdt: balance pm runtime enable calls
    6a35f55743e0 watchdog: initialize device before misc_register
    d9ce6955f923 nfs: nfs_file_write() should check for writeback errors
    ff1345a6663d scsi: lpfc: nvmet: Avoid hang / use-after-free again when destroying targetport
    3fb06144f4af perf evsel: Don't set sample_regs_intr/sample_regs_user for dummy event
    8fab1ff419f5 openrisc: Fix oops caused when dumping stack
    2752dd0c3134 libnvdimm/security: ensure sysfs poll thread woke up and fetch updated attr
    e5896827b71a libnvdimm/security: fix a typo
    8d4e102a6e42 clk: bcm2835: Do not use prediv with bcm2711's PLLs
    ded14d6ee4c0 clk: hsdk: Fix bad dependency on IOMEM
    c394441530fa ubifs: Fix wrong orphan node deletion in ubifs_jnl_update|rename
    9a51a86041f7 ubi: fastmap: Free fastmap next anchor peb during detach
    a62f895d09f3 ubi: fastmap: Don't produce the initial next anchor PEB when fastmap is disabled
    0a8add2a902d nfs: ensure correct writeback errors are returned on close()
    c7383a5fc976 i2c: rcar: avoid race when unregistering slave
    fa08065ef749 tools build feature: Use CC and CXX from parent
    f0a1e40eed15 perf tools: Fix term parsing for raw syntax
    90f68c49988b pwm: bcm-iproc: handle clk_get_rate() return
    b4c53155de51 sched/uclamp: Fix a deadlock when enabling uclamp static key
    b34732c06f4b nvme: fix deadlock in disconnect during scan_work and/or ana_work
    9d96d123cfd0 clk: clk-atlas6: fix return value check in atlas6_clk_init()
    079b5fdb0c0c clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk
    a0eae7915093 f2fs: compress: fix to update isize when overwriting compressed file
    bd4eba735bb7 i2c: rcar: slave: only send STOP event when we have been addressed
    7341629659ae iommu/vt-d: Disable multiple GPASID-dev bind
    9f0585a29430 iommu/vt-d: Warn on out-of-range invalidation address
    11c371d31342 iommu/vt-d: Enforce PASID devTLB field mask
    0d955cbce59e iommu/vt-d: Handle non-page aligned address
    43db463bd0be clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
    04d9e9742b00 clk: qcom: gcc: fix sm8150 GPU and NPU clocks
    07ce10b7e1b4 iommu/omap: Check for failure of a call to omap_iommu_dump_ctx
    38062cc2d562 selftests/powerpc: ptrace-pkey: Don't update expected UAMOR value
    0ff75defefcd selftests/powerpc: ptrace-pkey: Update the test to mark an invalid pkey correctly
    a779a9d11285 selftests/powerpc: ptrace-pkey: Rename variables to make it easier to follow code
    aff4ae8ab739 clk: actions: Fix h_clk for Actions S500 SoC
    0350ac46ba1b f2fs: compress: fix to avoid memory leak on cc->cpages
    ed276b462fde ima: Fail rule parsing when appraise_flag=blacklist is unsupportable
    e5703d615a7c dm rq: don't call blk_mq_queue_stopped() in dm_stop_queue()
    17d4cb0844df gpu: ipu-v3: image-convert: Wait for all EOFs before completing a tile
    5882f8f0013a gpu: ipu-v3: image-convert: Combine rotate/no-rotate irq handlers
    d1e9532db7c5 crypto: caam - Remove broken arc4 support
    8c16295b8ff2 rtc: pl031: fix set_alarm by adding back call to alarm_irq_enable
    b8e8613492b4 rtw88: pci: disable aspm for platform inter-op with module parameter
    06f65dfb3836 mmc: renesas_sdhi_internal_dmac: clean up the code for dma complete
    7dde5bcc8c88 RDMA/counter: Allow manually bind QPs with different pids to same counter
    78866b5a2668 RDMA/counter: Only bind user QPs in auto mode
    977f7c51a63e devres: keep both device name and resource name in pretty name
    465c03e99910 crypto: af_alg - Fix regression on empty requests
    541992e8b0c7 USB: serial: ftdi_sio: clean up receive processing
    0c7343c9432e USB: serial: ftdi_sio: make process-packet buffer unsigned
    faf8b18350b9 selftests/bpf: test_progs avoid minus shell exit codes
    802001c6bb43 selftests/bpf: test_progs use another shell exit on non-actions
    c19bab9bd52d bpf: selftests: Restore netns after each test
    3f3bc4abe537 selftests/bpf: Test_progs indicate to shell on non-actions
    f916752c8708 sched/uclamp: Protect uclamp fast path code with static key
    89ba1d1f43a5 IB/uverbs: Set IOVA on IB MR in uverbs layer
    213e2e4b1a64 media: rockchip: rga: Only set output CSC mode for RGB input
    07da1ff493fd media: rockchip: rga: Introduce color fmt macros and refactor CSC mode logic
    3da33ca81ba0 media: staging: rkisp1: rsz: set default format if the given format is not RKISP1_ISP_SD_SRC
    7e995c6ae760 media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to 'RKISP1_ISP_SD_*'
    ecaf6bdd5f9d media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
    278cc1c2adf9 rtc: cpcap: fix range
    00588429d2e5 RDMA/ipoib: Fix ABBA deadlock with ipoib_reap_ah()
    82fd63e9e683 RDMA/ipoib: Return void from ipoib_ib_dev_stop()
    93b494630c60 drm/amdgpu/debugfs: fix memory leak when pm_runtime_get_sync failed
    480beebce2ff platform/chrome: cros_ec_ishtp: Fix a double-unlock issue
    eee5f6fa24df mtd: rawnand: brcmnand: ECC error handling on EDU transfers
    9cddd0699395 mtd: rawnand: fsl_upm: Remove unused mtd var
    15fae7928aaf octeontx2-af: change (struct qmem)->entry_sz from u8 to u16
    267c6e3375e1 mfd: arizona: Ensure 32k clock is put on driver unbind and error
    e91d82703ad0 crypto: algif_aead - Only wake up when ctx->more is zero
    c8ec6953625d drm/ingenic: Fix incorrect assumption about plane->index
    ee35309eea23 drm/imx: imx-ldb: Disable both channels for split mode in enc->disable()
    88d1439b1e37 libnvdimm: Validate command family indices
    23910283df04 remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load
    c5c2fb5960f1 remoteproc: qcom_q6v5_mss: Validate MBA firmware size before load
    82d82bca4436 remoteproc: qcom: q6v5: Update running state before requesting stop
    c67f637f72c0 gfs2: Never call gfs2_block_zero_range with an open transaction
    ded2937b91eb gfs2: Fix refcount leak in gfs2_glock_poke
    3833a4bdbded perf intel-pt: Fix duplicate branch after CBR
    d761e9bc78ef perf intel-pt: Fix FUP packet state
    6bfbf969292e perf probe: Fix memory leakage when the probe point is not found
    5bd6375e87f4 perf probe: Fix wrong variable warning when the probe point is not found
    9213dd60f181 bootconfig: Fix to find the initargs correctly
    6c76404120cd module: Correctly truncate sysfs sections output
    20d175c70e60 dm: don't call report zones for more than the user requested
    b1735d353e61 dm ebs: Fix incorrect checking for REQ_OP_FLUSH
    e7ec82cbde08 pseries: Fix 64 bit logical memory block panic
    350542d6d513 ceph: handle zero-length feature mask in session messages
    09f891e55e91 ceph: set sec_context xattr on symlink creation
    0b02948e40f9 watchdog: f71808e_wdt: clear watchdog timeout occurred flag
    d413cca0c98d watchdog: f71808e_wdt: remove use of wrong watchdog_info option
    f50b7adc8f4f watchdog: f71808e_wdt: indicate WDIOF_CARDRESET support in watchdog_info.options
    aedfe612fa44 tracing: Use trace_sched_process_free() instead of exit() for pid tracing
    e8b292a11b83 tracing/hwlat: Honor the tracing_cpumask
    06cc3b5c15b1 kprobes: Fix NULL pointer dereference at kprobe_ftrace_handler
    bc394fabc466 ftrace: Setup correct FTRACE_FL_REGS flags for module
    d6cf27cc3c6b mm/memory_hotplug: fix unpaired mem_hotplug_begin/done
    2c381196946e cma: don't quit at first error when activating reserved areas
    34046ed85979 mm/page_counter.c: fix protection usage propagation
    ee4d4fc47086 ocfs2: change slot number type s16 to u16
    167d124d6f1c mm: fix kthread_use_mm() vs TLB invalidate
    0e7e8f15ca99 mm/shuffle: don't move pages between zones and don't read garbage memmaps
    70bd10179433 hugetlbfs: remove call to huge_pte_alloc without i_mmap_rwsem
    09f00c1d6d79 khugepaged: retract_page_tables() remember to test exit
    b77baa470e77 khugepaged: collapse_pte_mapped_thp() protect the pmd lock
    1070cf5eae8c mm/hugetlb: fix calculation of adjust_range_if_pmd_sharing_possible
    11bca2c7a968 khugepaged: collapse_pte_mapped_thp() flush the right range
    3c98843a56f1 ext2: fix missing percpu_counter_inc
    7a3ec44ca8cd MIPS: SGI-IP27: always enable NUMA in Kconfig
    f2dcaa097b09 MIPS: qi_lb60: Fix routing to audio amplifier
    41158a79e505 MIPS: CPU#0 is not hotpluggable
    6fc128de20ba driver core: Avoid binding drivers to dead devices
    b4cbe39b9b47 appletalk: Fix atalk_proc_init() return path
    ea171d825ff0 mac80211: fix misplaced while instead of if
    9f05adac97ed bcache: use disk_{start,end}_io_acct() to count I/O for bcache device
    99ea492e8a1a bcache: fix bio_{start,end}_io_acct with proper device
    add47ff1e482 bcache: avoid nr_stripes overflow in bcache_device_init()
    9c8656abb350 bcache: fix overflow in offset_to_stripe()
    d02401090367 bcache: allocate meta data pages as compound pages
    6c38defccf61 md/raid5: Fix Force reconstruct-write io stuck in degraded raid5
    5a92eba2e0f8 selftests/seccomp: Set NNP for TSYNC ESRCH flag test
    2559f40308f3 net/compat: Add missing sock updates for SCM_RIGHTS
    9e6dc1fe251b pidfd: Add missing sock updates for pidfd_getfd()
    bad7ce89b091 irqchip/gic-v4.1: Ensure accessing the correct RD when writing INVALLR
    dac251560dc0 irqchip/loongson-liointc: Fix misuse of gc->mask_cache
    dd3c73e1e361 net: stmmac: dwmac1000: provide multicast filter fallback
    77f16ebdd22c net: ethernet: stmmac: Disable hardware multicast filter
    0c43968f4ebc media: vsp1: dl: Fix NULL pointer dereference on unbind
    07f56c2d7b35 media: venus: fix multiple encoder crash
    cba406ad893b pinctrl: ingenic: Properly detect GPIO direction when configured for IRQ
    96731791b27e pinctrl: ingenic: Enhance support for IRQ_TYPE_EDGE_BOTH
    2066cba94ce9 powerpc: Fix circular dependency between percpu.h and mmu.h
    995681728df2 powerpc: Allow 4224 bytes of stack expansion for the signal frame
    b30f462438c8 powerpc/ptdump: Fix build failure in hashpagetable.c
    08097161b4c1 cifs: Fix leak when handling lease break for cached root fid
    b8f1063288c7 xtensa: fix xtensa_pmu_setup prototype
    31ec410fda51 xtensa: add missing exclusive access state management
    d593b5ce8b60 iio: imu: st_lsm6dsx: reset hw ts after resume
    9e56debaf8bd iio: dac: ad5592r: fix unbalanced mutex unlocks in ad5592r_read_raw()
    bd2d9b643973 dt-bindings: iio: io-channel-mux: Fix compatible string in example code
    0c7e8af43b20 arm64: perf: Correct the event index in sysfs
    43392e32cafd arm64: dts: qcom: sc7180: Drop the unused non-MSA SID
    fd9cabecacbd btrfs: check correct variable after allocation in btrfs_backref_iter_alloc
    bdbc805d86b0 btrfs: fix return value mixup in btrfs_get_extent
    1dc8956a14e0 btrfs: make sure SB_I_VERSION doesn't get unset by remount
    37a0e89752b4 btrfs: trim: fix underflow in trim length to prevent access beyond device boundary
    994f3284b274 btrfs: fix memory leaks after failure to lookup checksums during inode logging
    9bb2c78829ce btrfs: inode: fix NULL pointer dereference if inode doesn't need compression
    aa39db7b49ee btrfs: only search for left_info if there is no right_info in try_merge_free_space
    6f09bb5c8693 btrfs: fix messages after changing compression level by remount
    29034d5959a2 btrfs: don't show full path of bind mounts in subvol=
    aa80bd09914a btrfs: fix race between page release and a fast fsync
    4f22fd835fd3 btrfs: don't WARN if we abort a transaction with EROFS
    6082e83f0ca6 btrfs: sysfs: use NOFS for device creation
    18a184b5a537 btrfs: return EROFS for BTRFS_FS_STATE_ERROR cases
    6892ee54cc38 btrfs: avoid possible signal interruption of btrfs_drop_snapshot() on relocation tree
    4565cb8dc364 btrfs: add missing check for nocow and compression inode flags
    2e30d1cc1ead btrfs: relocation: review the call sites which can be interrupted by signal
    bdc4fa8be990 btrfs: move the chunk_mutex in btrfs_read_chunk_tree
    ff532ad267d4 btrfs: open device without device_list_mutex
    5199c3d6449a btrfs: pass checksum type via BTRFS_IOC_FS_INFO ioctl
    1c986b7e8c1b btrfs: don't traverse into the seed devices in show_devname
    bbdfe026a767 btrfs: remove no longer needed use of log_writers for the log root tree
    39b0de06b4e5 btrfs: only commit delayed items at fsync if we are logging a directory
    99da62f72cdf btrfs: stop incremening log_batch for the log root tree when syncing log
    4f736d4f97bb btrfs: only commit the delayed inode when doing a full fsync
    bba24e6343de btrfs: ref-verify: fix memory leak in add_block_entry
    917d608fe375 btrfs: preallocate anon block device at first phase of snapshot creation
    711e8ede50ab btrfs: don't allocate anonymous block device for user invisible roots
    f3ff060ccf60 btrfs: free anon block device right after subvolume deletion
    1d6700781ab8 btrfs: allow use of global block reserve for balance item deletion
    0ab7762854c3 PCI: qcom: Add support for tx term offset for rev 2.1.0
    2bc2a8008680 PCI: qcom: Define some PARF params needed for ipq8064 SoC
    1d392f7e229d PCI: Add device even if driver attach failed
    51a692df486f PCI: Mark AMD Navi10 GPU rev 0x00 ATS as broken
    7255adef0c61 PCI/ATS: Add pci_pri_supported() to check device or associated PF
    815260de064b PCI: hotplug: ACPI: Fix context refcounting in acpiphp_grab_context()
    64947da67a3a genirq/PM: Always unlock IRQ descriptor in rearm_wake_irq()
    298510f9339d genirq: Unlock irq descriptor after errors
    2ca0b460bbcb genirq/affinity: Make affinity setting if activated opt-in
    680e115323a3 SMB3: Fix mkdir when idsfromsid configured on mount
    4b12a034cca8 smb3: warn on confusing error scenario with sec=krb5
    4fc48fefc51c ALSA: hda/realtek - Fix unused variable warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index bf1dba1060..8397567996 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
+SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.2"
+LINUX_VERSION ?= "5.8.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 308022ad16..8d95d5f589 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.2"
+LINUX_VERSION ?= "5.8.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a463c9ee9da138e9fd6f602b5a18352ddd241fbd"
-SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
+SRCREV_machine_qemuarm ?= "e5992f87f18d3e99f7448111f99bb1769dc718c7"
+SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 42d76f2b80..4e2043baef 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cdc1a8a82f795aa0bcf60744109798a7cea5816f"
-SRCREV_machine_qemuarm64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_machine_qemumips ?= "b71b28c3ef58e2db03ab3eb6c576a1e9fda7f181"
-SRCREV_machine_qemuppc ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_machine_qemuriscv64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_machine_qemux86 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_machine_qemux86-64 ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_machine_qemumips64 ?= "21530680430bfb9f8a73fba97e6734bd4869a690"
-SRCREV_machine ?= "912adf166eb0688e011154048f5fa0e5863249c3"
-SRCREV_meta ?= "89db4beb484f8eca238bdd57554ebd7b55b78427"
+SRCREV_machine_qemuarm ?= "2285cab1d5ddd24e489dab0d9faa7f3718e86195"
+SRCREV_machine_qemuarm64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_machine_qemumips ?= "18aba2b2d36ac3908500770d4b462c633aaa4e3c"
+SRCREV_machine_qemuppc ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_machine_qemuriscv64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_machine_qemux86 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_machine_qemux86-64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_machine_qemumips64 ?= "f8266b2a44053579c3bb0bde59552b30091ddb83"
+SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
+SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.2"
+LINUX_VERSION ?= "5.8.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

