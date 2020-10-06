Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.1806.1602011086818624336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h0wUxjW1;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id ev17so4239962qvb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=voHYdLFwXF/CHn5o4vQN//hthM9zJXJrIUCWIv+vtpc=;
        b=h0wUxjW12BxWlzeB9lNxf3eSHMBMBz15f6jev/rZGO3ADKlp8UT3hwN2oDeTv4f+O4
         euKEhPjElGrPOSmXDOWyd65Ocd0AkkF5bXZt9UGYwZ2ARn4hySVh2/NNiK93BO9vDKI6
         0H4807dFgBatOR7UFAsu+/yV9/jpTWcynFnKcXNS8A9bJZR17+zXyPIp0QFwXRilQvze
         noX0Qx/eJA/rrsL6MKyjOMxd63WOfTV2KSn6FCaWHCGI+JKjDILbN4BteIkGlWhoz/vX
         gNDKyCJGmomdVUGeQGiKiYSbwK1zceYplhFQaJGwreVJs7iv9c/KafBjKjsjm8C9527m
         eXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=voHYdLFwXF/CHn5o4vQN//hthM9zJXJrIUCWIv+vtpc=;
        b=pNfRsGBPfTvkM6T2TehnDSREW4YGRopT5G4sM7nTVs6CczQ3e4grCcfLm/Er0NCzij
         CbS/uU5kos3tR1oEucCUPfVeNZNER3i4Z5ZxiT/fSa70tV9eqnRqqBQTom8097rXytO0
         079NiVhI0epKDhIslaWryNS9Q7gReLpZoDuCEI0yLdubs84YjuDe8jqQhu+wbPyvxkRc
         M49CON+1Q4goj8qedQ+O+k7yeX1qTdAo6rSn9AGBFUQGr/JCEyvbg37w0KxZhiwyQ8uo
         duSr9dOV7x3S/Cf5sS3TfK7gQ2qftEtbS+8N5ywEe1ITLTwn13e63SJ3bRgUFlu3XXkN
         o6Kw==
X-Gm-Message-State: AOAM533jB2xZM17pv+/UESm14KRzmKhOAlGbCgX/ddp64u2ZcZkjCuD9
	O03JQYPoaGZebmmWEeGBMoaVjxMIKwMPiL2k
X-Google-Smtp-Source: ABdhPJz8R4MFCqzZRt0VgsfH4pqHjRCnS2geAecgEph1KNdcXmkrENVBRuu23peBjvRGNOkYYSYlSQ==
X-Received: by 2002:a0c:e788:: with SMTP id x8mr5802750qvn.27.1602011085509;
        Tue, 06 Oct 2020 12:04:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.4: update to v5.4.69
Date: Tue,  6 Oct 2020 15:04:33 -0400
Message-Id: <f42036631350f34ab155516b99a6f2e21c503cd3.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    a9518c1aec5b Linux 5.4.69
    9fb8e10b0519 ata: sata_mv, avoid trigerrable BUG_ON
    e11c83520cd0 ata: make qc_prep return ata_completion_errors
    b6e503c0a0ff ata: define AC_ERR_OK
    b4a9fdf062e8 kprobes: Fix compiler warning for !CONFIG_KPROBES_ON_FTRACE
    3d9f39d274ea dm: fix bio splitting and its bio completion order for regular IO
    c9bfb7b4d944 KVM: arm64: Assume write fault on S1PTW permission fault on instruction fetch
    5dcb66f970a8 s390/zcrypt: Fix ZCRYPT_PERDEV_REQCNT ioctl
    4f5260ee0ce3 mm/gup: fix gup_fast with dynamic page table folding
    20a5e4272b65 mm, THP, swap: fix allocating cluster for swapfile by mistake
    198d9f7e905c dmabuf: fix NULL pointer dereference in dma_buf_release()
    aded5dee7fb2 btrfs: fix overflow when copying corrupt csums for a message
    c4ab0a837093 kprobes: tracing/kprobes: Fix to kill kprobes on initmem after boot
    3995f7a60fec kprobes: Fix to check probe enabled before disarm_kprobe_ftrace()
    31efa3b5b592 s390/dasd: Fix zero write for FBA devices
    e92c490f1049 tracing: fix double free
    f05f667f8764 lib/string.c: implement stpcpy
    26a6452b27ec ALSA: hda/realtek: Enable front panel headset LED on Lenovo ThinkStation P520
    2a2ae4831ff7 ALSA: hda/realtek - Couldn't detect Mic if booting with headset plugged
    86f6af05ffa0 ALSA: usb-audio: Add delay quirk for H570e USB headsets
    4cb7f229823c scsi: lpfc: Fix initial FLOGI failure due to BBSCN not supported
    6890a6f5665f x86/ioapic: Unbreak check_timer()
    361a4b17e88d arch/x86/lib/usercopy_64.c: fix __copy_user_flushcache() cache writeback
    fe932d4c9ea2 mm: validate pmd after splitting
    5d4431c9de06 KVM: SVM: Add a dedicated INVD intercept routine
    16788dc19fa1 KVM: x86: Reset MMU context if guest toggles CR4.SMAP or CR4.PKE
    87f7a4910e57 regulator: axp20x: fix LDO2/4 description
    5c58104841fe MIPS: Add the missing 'CPU_1074K' into __get_cpu_type()
    283a3234550c regmap: fix page selection for noinc writes
    47fef0ebc150 regmap: fix page selection for noinc reads
    a8cebb4a5931 ALSA: asihpi: fix iounmap in error handler
    83b9a250d774 lib80211: fix unmet direct dependendices config warning when !CRYPTO
    43cdb648e1da bpf: Fix a rcu warning for bpffs map pretty-print
    d9fadccbf25e batman-adv: mcast: fix duplicate mcast packets from BLA backbone to mesh
    5d8774492819 batman-adv: mcast: fix duplicate mcast packets in BLA backbone from mesh
    24e5e941d804 batman-adv: mcast: fix duplicate mcast packets in BLA backbone from LAN
    b0632590cbec nvme-tcp: fix kconfig dependency warning when !CRYPTO
    8c6ba1878a92 batman-adv: Add missing include for in_interrupt()
    248c25e7725a drm/sun4i: sun8i-csc: Secondary CSC register correction
    12bea822dbe6 net: qed: RDMA personality shouldn't fail VF load
    7e74a6d6f99c net: qede: Disable aRFS for NPAR and 100G
    82dfe9c32dea net: qed: Disable aRFS for NPAR and 100G
    f301585195a0 drm/vc4/vc4_hdmi: fill ASoC card owner
    5e77009e33a1 bpf: Fix clobbering of r2 in bpf_gen_ld_abs
    2e1a95f450d8 mac802154: tx: fix use-after-free
    eb5f810e06da netfilter: conntrack: nf_conncount_init is failing with IPv6 disabled
    b6112ff05f5f batman-adv: mcast/TT: fix wrongly dropped or rerouted packets
    5b0a13a03b8b atm: eni: fix the missed pci_disable_device() for eni_init_one()
    e0117ad11b3e batman-adv: bla: fix type misuse for backbone_gw hash indexing
    a63798d53489 mwifiex: Increase AES key storage size to 256 bits
    f43500892470 clocksource/drivers/h8300_timer8: Fix wrong return value in h8300_8timer_init()
    f77f4586bdd7 ieee802154/adf7242: check status of adf7242_read_reg
    22936fa7a295 ieee802154: fix one possible memleak in ca8210_dev_com_init
    d85044145fdd objtool: Fix noreturn detection for ignored functions
    a53d9b3ae9c8 i2c: core: Call i2c_acpi_install_space_handler() before i2c_acpi_register_devices()
    65f452b7a2c1 drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is
    8c48b7617b7c drm/amd/display: update nv1x stutter latencies
    c48363d19fcb drm/amdkfd: fix a memory leak issue
    b11f2d6b80f4 EDAC/ghes: Check whether the driver is on the safe list correctly
    c7be1f4d4e60 lockdep: fix order in trace_hardirqs_off_caller()
    43d750a0994c s390/init: add missing __init annotations
    fdd60315b931 i2c: aspeed: Mask IRQ status to relevant bits
    66d987b80dc3 RISC-V: Take text_mutex in ftrace_init_nop()
    487e3a1bc9ab ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9 2-in-1
    4a07fbecfa55 ASoC: wm8994: Ensure the device is resumed in wm89xx_mic_detect functions
    7cdb35fc858f ASoC: wm8994: Skip setting of the WM8994_MICBIAS register for WM1811
    927a024487dc ASoC: pcm3168a: ignore 0 Hz settings
    8ebf2b77d7e5 device_cgroup: Fix RCU list debugging warning
    5b84cd71c1da nvme: explicitly update mpath disk capacity on revalidation
    765f47c425aa net: openvswitch: use div_u64() for 64-by-32 divisions
    caa44b67f4d3 ALSA: hda: Workaround for spurious wakeups on some Intel platforms
    862dd508c6f2 ALSA: hda: Always use jackpoll helper for jack update after resume
    1f160738d9a8 perf parse-events: Use strcmp() to compare the PMU name
    4d8d6f71b60f opp: Increase parsed_static_opps in _of_add_opp_table_v1()
    87e6e1957cf0 mt76: fix LED link time failure
    ca1704f177dc ubi: fastmap: Free unused fastmap anchor peb during detach
    74924e407bf7 scsi: qla2xxx: Retry PLOGI on FC-NVMe PRLI failure
    e1ad5cf63e40 perf tests: Fix test 68 zstd compression for s390
    85c417050fc7 btrfs: qgroup: fix data leak caused by race between writeback and truncate
    af60d80598b3 vfio/pci: fix racy on error and request eventfd ctx
    eb7833e0ee01 selftests/x86/syscall_nt: Clear weird flags after each test
    7292e6e9d82c scsi: libfc: Skip additional kref updating work event
    1e15d5237c1e scsi: libfc: Handling of extra kref
    2ad1397c8815 mac80211: skip mpath lookup also for control port tx
    8bfd43a5180f nvme: fix possible deadlock when I/O is blocked
    8b85da354c74 cifs: Fix double add page to memcg when cifs_readpages
    3bb9b0ad76e5 vfio/pci: Clear error and request eventfd ctx after releasing
    781a4bf652b8 NFS: nfs_xdr_status should record the procedure name
    bc65336acddc x86/speculation/mds: Mark mds_user_clear_cpu_buffers() __always_inline
    c63613b93479 mtd: parser: cmdline: Support MTD names containing one or more colons
    f7b07311ff0f rapidio: avoid data race between file operation callbacks and mport_cdev_add().
    92514a7bb941 mm: memcontrol: fix stat-corrupting race in charge moving
    a9e87c5beeb9 mm/swap_state: fix a data race in swapin_nr_pages
    3e4ca8bf5809 ceph: fix potential race in ceph_check_caps
    dac34dd4efc6 PCI: tegra: Fix runtime PM imbalance on error
    5cddba546a00 mtd: rawnand: omap_elm: Fix runtime PM imbalance on error
    63f600d87b05 mtd: rawnand: gpmi: Fix runtime PM imbalance on error
    ec705f9ffbba wlcore: fix runtime pm imbalance in wlcore_regdomain_config
    a0f8499fba8d wlcore: fix runtime pm imbalance in wl1271_tx_work
    7555bb003417 ASoC: img-i2s-out: Fix runtime PM imbalance on error
    13e1951aa3b8 PCI: tegra194: Fix runtime PM imbalance on error
    7415f52e2e95 perf kcore_copy: Fix module map when there are no modules loaded
    ff793fe02ca8 perf metricgroup: Free metric_events on error
    2076ee4ae512 perf util: Fix memory leak of prefix_if_not_in
    b10dd4b3c104 perf stat: Fix duration_time value for higher intervals
    eddcc70de8da perf trace: Fix the selection for architectures to generate the errno name tables
    feaaa88ffce7 perf evsel: Fix 2 memory leaks
    ad9940e377fd KVM: PPC: Book3S HV: Close race with page faults around memslot flushes
    f9c47a0cc513 vfio/pci: fix memory leaks of eventfd ctx
    bb6e9827da75 gpio: rcar: Fix runtime PM imbalance on error
    1aa9de56d762 btrfs: fix double __endio_write_update_ordered in direct I/O
    b3b21823d68e btrfs: don't force read-only after error in drop snapshot
    859748f8cd8c usb: dwc3: Increase timeout for CmdAct cleared by device controller
    5c7f727e8ad6 printk: handle blank console arguments passed in.
    482466b67d87 drm/nouveau/dispnv50: fix runtime pm imbalance on error
    bd39447bad06 drm/nouveau: fix runtime pm imbalance on error
    f6331bfcccc8 drm/nouveau/debugfs: fix runtime pm imbalance on error
    2477158bfd3e e1000: Do not perform reset in reset_task if we are already down
    62962e08b9c3 drm/amdkfd: fix restore worker race condition
    180e60f154a3 arm64/cpufeature: Drop TraceFilt feature exposure from ID_DFR0 register
    196d14cea6a3 scsi: cxlflash: Fix error return code in cxlflash_probe()
    af02933d59bd arm64: acpi: Make apei_claim_sea() synchronise with APEI's irq work
    502bd98a8e27 coresight: etm4x: Fix use-after-free of per-cpu etm drvdata
    c3fa2949c272 USB: EHCI: ehci-mv: fix less than zero comparison of an unsigned int
    89e6cf1c0ab5 fuse: update attr_version counter on fuse_notify_inval_inode()
    e431e923c8a6 fuse: don't check refcount after stealing page
    55c3e7fac92e svcrdma: Fix backchannel return code
    7c972122cab5 powerpc/traps: Make unrecoverable NMIs die instead of panic
    004cb15b1e4c ipmi:bt-bmc: Fix error handling and status check
    09197d39cab3 drm/exynos: dsi: Remove bridge node reference in error handling path in probe function
    7ce7dd0a6f1d ALSA: hda: Fix potential race in unsol event handler
    942a6ff2146a tty: serial: samsung: Correct clock selection logic
    202ae05859ea tipc: fix memory leak in service subscripting
    97cf50cc4e5c KVM: x86: handle wrap around 32-bit address space
    c7a403d16fd7 USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()
    3515b56cc0b7 Bluetooth: Handle Inquiry Cancel error after Inquiry Complete
    b5a49bb741e9 phy: samsung: s5pv210-usb2: Add delay after reset
    e3d47125a42c power: supply: max17040: Correct voltage reading
    44a3faa00887 i2c: tegra: Restore pinmux on system resume
    00519f4da8da mm/slub: fix incorrect interpretation of s->offset
    0eb69a66083e perf mem2node: Avoid double free related to realloc
    bd60439f4950 media: venus: vdec: Init registered list unconditionally
    fa7c336dd1c8 atm: fix a memory leak of vcc->user_back
    9325e9e5abf6 devlink: Fix reporter's recovery condition
    4ac87b6af491 dt-bindings: sound: wm8994: Correct required supplies based on actual implementaion
    8ff65ea6c77c dpaa2-eth: fix error return code in setup_dpni()
    527378a0dfd7 sched/fair: Eliminate bandwidth race between throttling and distribution
    8e32fed034ed arm64: cpufeature: Relax checks for AArch32 support at EL[0-2]
    294e26f89163 sparc64: vcc: Fix error return code in vcc_probe()
    f1723949cf81 staging:r8188eu: avoid skb_clone for amsdu to msdu conversion
    b6cee18cba12 scsi: aacraid: Fix error handling paths in aac_probe_one()
    cd6f892ba542 net: openvswitch: use u64 for meter bucket
    545c261f22b4 KVM: arm64: vgic-its: Fix memory leak on the error path of vgic_add_lpi()
    beb8e0254197 KVM: arm64: vgic-v3: Retire all pending LPIs on vcpu destroy
    4998dc5ff868 drivers: char: tlclk.c: Avoid data race between init and interrupt handler
    a48b609c8dfd bdev: Reduce time holding bd_mutex in sync in blkdev_close()
    c8317e9fc412 perf stat: Force error in fallback on :k events
    4f4e29789525 KVM: Remove CREATE_IRQCHIP/SET_PIT2 race
    e4e024e89cca btrfs: fix setting last_trans for reloc roots
    26d261f32f43 serial: uartps: Wait for tx_empty in console setup
    ab1d9bad6097 scsi: qedi: Fix termination timeouts in session logout
    61192ac4a1f2 ALSA: hda: Skip controller resume if not needed
    51396da04425 mm/mmap.c: initialize align_offset explicitly for vm_unmapped_area
    cb1dfad688ef drm/amdgpu/sriov add amdgpu_amdkfd_pre_reset in gpu reset
    644148cd1537 workqueue: Remove the warning in wq_worker_sleeping()
    74c28abcb301 nvmet-rdma: fix double free of rdma queue
    5e3c0dae5f96 SUNRPC: Don't start a timer on an already queued rpc task
    19b9ff11464e mm/vmscan.c: fix data races using kswapd_classzone_idx
    b569d92b1d03 mm/swapfile: fix data races in try_to_unuse()
    6eed4b3392c6 mm/filemap.c: clear page error before actual read
    336df1dcf92d mm/kmemleak.c: use address-of operator on section symbols
    685a1e317a64 powerpc/perf: Implement a global lock to avoid races between trace, core and thread imc events.
    7cafcc37c57e drm/amdgpu/vcn2.0: stall DPG when WPTR/RPTR reset
    24c56b6fe0ba NFS: Fix races nfs_page_group_destroy() vs nfs_destroy_unlinked_subrequests()
    4667358dab9c PCI: pciehp: Fix MSI interrupt race
    ca767cf0152d ALSA: usb-audio: Fix case when USB MIDI interface has more than one extra endpoint descriptor
    af574e78e7e4 ubifs: Fix out-of-bounds memory access caused by abnormal value of node_len
    49bc26b7653f ubifs: ubifs_add_orphan: Fix a memory leak bug
    17bc3bff02a7 ubifs: ubifs_jnl_write_inode: Fix a memory leak bug
    535943c46dfc PCI: Use ioremap(), not phys_to_virt() for platform ROM
    aa325ff72c80 netfilter: nf_tables: silence a RCU-list warning in nft_table_lookup()
    cf2d7883e84c svcrdma: Fix leak of transport addresses
    5f8174bfb9ff SUNRPC: Fix a potential buffer overflow in 'svc_print_xprts()'
    4f7b6eef7921 scsi: hpsa: correct race condition in offload enabled
    6e3b662d86a5 IB/iser: Always check sig MR before putting it to the free pool
    d5e7198bcf7e RDMA/rxe: Set sys_image_guid to be aligned with HW IB devices
    f812e43e727f xfs: prohibit fs freezing when using empty transactions
    1ed8ad923787 brcmfmac: Fix double freeing in the fmac usb data path
    9aca5e655a29 nvme: Fix controller creation races with teardown flow
    509730002abc nvme: Fix ctrl use-after-free during sysfs deletion
    eef1e9e876e9 nvme-multipath: do not reset on unknown status
    a48cf1c921a7 perf: Use new infrastructure to fix deadlocks in execve
    ba7eb0e48e76 proc: io_accounting: Use new infrastructure to fix deadlocks in execve
    4301db49e556 proc: Use new infrastructure to fix deadlocks in execve
    0cd97836869e kernel/kcmp.c: Use new infrastructure to fix deadlocks in execve
    2f7a0de4e5da selftests/ptrace: add test cases for dead-locks
    d8d15a4c445a exec: Fix a deadlock in strace
    b796d94921ce exec: Add exec_update_mutex to replace cred_guard_mutex
    32d9453c208c tools: gpio-hammer: Avoid potential overflow in main
    3b63e4b7045b cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_work_fn
    1ad72297146d net: axienet: Propagate failure of DMA descriptor setup
    468f2bc2bb5b net: axienet: Convert DMA error handler to a work queue
    79f60d5bd0dd perf cpumap: Fix snprintf overflow check
    47e276e1c40e serial: 8250: 8250_omap: Terminate DMA before pushing data on RX timeout
    09a2cf677105 serial: 8250_omap: Fix sleeping function called from invalid context during probe
    93ec0b575aca serial: 8250_port: Don't service RX FIFO if throttled
    0557e5f8d69c r8169: improve RTL8168b FIFO overflow workaround
    5dc170aee1d1 btrfs: free the reloc_control in a consistent way
    c88596d593ab btrfs: do not init a reloc root if we aren't relocating
    98c921e6be06 perf parse-events: Fix 3 use after frees found with clang ASAN
    048892dfab4d KVM: LAPIC: Mark hrtimer for period or oneshot mode to expire in hard interrupt context
    157ff88660c8 thermal: rcar_thermal: Handle probe error gracefully
    e978d00a3d16 tracing: Use address-of operator on section symbols
    cb9841c5119c drm/msm/a5xx: Always set an OPP supported hardware value
    8db4810dd5cc drm/msm: fix leaks if initialization fails
    5d09e3edf5d9 KVM: PPC: Book3S HV: Treat TM-related invalid form instructions on P9 like the valid ones
    63b7647dd0e1 intel_th: Disallow multi mode on devices where it's broken
    c3e39fa0aa10 RDMA/cm: Remove a race freeing timewait_info
    0300cda5009a nfsd: Don't add locks to closed or closing open stateids
    cdb785710edd rtc: ds1374: fix possible race condition
    45c1212d91f7 rtc: sa1100: fix possible race condition
    22de4a5d5791 tpm: ibmvtpm: Wait for buffer to be set before proceeding
    be4ff3a49c5d ext4: mark block bitmap corrupted when found instead of BUGON
    152875a0f094 xfs: mark dir corrupt when lookup-by-hash fails
    cb72c9f84219 xfs: don't ever return a stale pointer from __xfs_dir3_free_read
    b1f5989a23c1 tty: sifive: Finish transmission before changing the clock
    abbe59ca91f3 media: tda10071: fix unsigned sign extension overflow
    b432ea85ab84 Bluetooth: L2CAP: handle l2cap config request during open state
    ae3dffdbe42b scsi: aacraid: Disabling TM path and only processing IOP reset
    62602774e5aa ath10k: use kzalloc to read for ath10k_sdio_hif_diag_read
    f6acb4ae6b6c perf cs-etm: Correct synthesizing instruction samples
    f7ba2eeb0c6f perf cs-etm: Swap packets for instruction samples
    fc1d08a2023d s390/irq: replace setup_irq() by request_irq()
    37b972bf8070 cpu-topology: Fix the potential data corruption
    2d4e6ce22c58 clk: imx: Fix division by zero warning on pfdv2
    6fc325a4d35d drm/amd/display: Stop if retimer is not available
    10a144b77f64 ARM: OMAP2+: Handle errors for cpu_pm
    d1a749c01d03 drm/amdgpu: increase atombios cmd timeout
    3a220956aaaf mm: avoid data corruption on CoW fault into PFN-mapped VMA
    2da77d2d0d89 perf jevents: Fix leak of mapfile memory
    26005b604cef ext4: fix a data race at inode->i_disksize
    d0c298030382 drm/amd/display: fix image corruption with ODM 2:1 DSC 2 slice
    f2118308295d powerpc/book3s64: Fix error handling in mm_iommu_do_alloc()
    efc95f2ef743 timekeeping: Prevent 32bit truncation in scale64_check_overflow()
    202e2ff9de40 Bluetooth: guard against controllers sending zero'd events
    a94159403430 media: go7007: Fix URB type for interrupt handling
    657e50f8cdbf ASoC: SOF: ipc: check ipc return value before data copy
    29c25e69492b bus: hisi_lpc: Fixup IO ports addresses to avoid use-after-free in host removal
    3193035ec136 random: fix data races at timer_rand_state
    1edfaecc30a9 firmware: arm_sdei: Use cpus_read_lock() to avoid races with cpuhp
    21e2f6bf0863 iavf: use tc_cls_can_offload_and_chain0() instead of chain check
    0d5984ba936b drm/omap: dss: Cleanup DSS ports on initialisation failure
    b4bca7b2a6e2 drm/amd/display: dal_ddc_i2c_payloads_create can fail causing panic
    3e6f9c20bd32 soundwire: bus: disable pm_runtime in sdw_slave_delete
    c4b62a7e52ee dmaengine: tegra-apb: Prevent race conditions on channel's freeing
    cdf63c29af1e dmaengine: stm32-dma: use vchan_terminate_vdesc() in .terminate_all
    f60007c9e914 bpf: Remove recursion prevention from rcu free callback
    e8b95c29cdef x86/pkeys: Add check for pkey "overflow"
    321c5b279313 media: staging/imx: Missing assignment in imx_media_capture_device_register()
    5132f9f3d3e2 dmaengine: stm32-mdma: use vchan_terminate_vdesc() in .terminate_all
    484de771d637 KVM: nVMX: Hold KVM's srcu lock when syncing vmcs12->shadow
    d1da39644709 KVM: x86: fix incorrect comparison in trace event
    a4d17715a852 RDMA/rxe: Fix configuration of atomic queue pair attributes
    45901923749f perf test: Fix test trace+probe_vfs_getname.sh on s390
    e2d439c2000d ALSA: usb-audio: Don't create a mixer element with bogus volume range
    78344a4dc43e mt76: fix handling full tx queues in mt76_dma_tx_queue_skb_raw
    9b42bfb06d37 mt76: clear skb pointers from rx aggregation reorder buffer during cleanup
    1841613e97e7 crypto: chelsio - This fixes the kernel panic which occurs during a libkcapi test
    671e6c9c6b7b clk: stratix10: use do_div() for 64-bit calculation
    ef6eb8121321 locking/lockdep: Decrement IRQ context counters when removing lock chain
    8e88cdd3223a drm/omap: fix possible object reference leak
    41b71eff2777 scsi: lpfc: Fix coverity errors in fmdi attribute handling
    e0ddd176a302 scsi: lpfc: Fix release of hwq to clear the eq relationship
    4935732e8821 scsi: lpfc: Fix RQ buffer leakage when no IOCBs available
    f72a51eab2de selinux: sel_avc_get_stat_idx should increase position index
    d96fcfd58c21 audit: CONFIG_CHANGE don't log internal bookkeeping as an event
    26eae6def780 drm/amd/display: fix workaround for incorrect double buffer register for DLG ADL and TTU
    1f483c3ef050 nfsd: Fix a perf warning
    980040c7ae69 skbuff: fix a data race in skb_queue_len()
    2b22cead0478 ALSA: hda: Clear RIRB status before reading WP
    a13d21ed8526 KVM: fix overflow of zero page refcount with ksm running
    54d9839877f2 Bluetooth: prefetch channel before killing sock
    4c67f0b1eabb mm: pagewalk: fix termination condition in walk_pte_range()
    dac81f1ddce5 mm/swapfile.c: swap_next should increase position index
    8f54d39da5f4 Bluetooth: Fix refcount use-after-free issue
    60d539ff1cd8 tools/power/x86/intel_pstate_tracer: changes for python 3 compatibility
    f15dd13158ad selftests/ftrace: fix glob selftest
    379deeac55da ceph: ensure we have a new cap before continuing in fill_inode
    5a5fa8876291 ar5523: Add USB ID of SMCWUSBT-G2 wireless adapter
    47634c0fc94c ARM: 8948/1: Prevent OOB access in stacktrace
    5093d01f0809 tracing: Set kernel_stack's caller size properly
    0c81861ae903 Bluetooth: btrtl: Use kvmalloc for FW allocations
    821bf0bf652c powerpc/eeh: Only dump stack once if an MMIO loop is detected
    fed639f7e1d5 nfsd: Fix a soft lockup race in nfsd_file_mark_find_or_create()
    4f726a2afb99 s390/cpum_sf: Use kzalloc and minor changes
    26966e89ca14 dmaengine: zynqmp_dma: fix burst length configuration
    d64f6dfdf4ab btrfs: tree-checker: Check leaf chunk item size
    2bbe85d911fe i2c: tegra: Prevent interrupt triggering after transfer timeout
    1e4a6a0e03bc drm/amd/display: Initialize DSC PPS variables to 0
    65f2f192526f scsi: ufs: Fix a race condition in the tracing code
    1ac994f80be2 scsi: ufs: Make ufshcd_add_command_trace() easier to read
    3d05b3072232 ACPI: EC: Reference count query handlers under lock
    95ceefc6f0ce sctp: move trace_sctp_probe_path into sctp_outq_sack
    a9e53499f4de scsi: lpfc: Fix incomplete NVME discovery when target
    64d2887486d1 scsi: qla2xxx: Fix stuck session in GNL
    9f7d28075ae4 opp: Replace list_kref with a local counter
    8c324ef0b466 media: ti-vpe: cal: Restrict DMA to avoid memory corruption
    4a4c78cf0cf7 drm/scheduler: Avoid accessing freed bad job.
    06a90303633f seqlock: Require WRITE_ONCE surrounding raw_seqcount_barrier
    a9d4bca63493 drm/mcde: Handle pending vblank while disabling display
    c89925822f82 ipv6_route_seq_next should increase position index
    046e79cca228 rt_cpu_seq_next should increase position index
    2ba309f086b8 neigh_stat_seq_next() should increase position index
    f508c5d99343 vcc_seq_next should increase position index
    8c926e159afa tipc: fix link overflow issue at socket shutdown
    f99f4372f544 ALSA: hda: enable regmap internal locking
    b56212ddca0f xfs: fix log reservation overflows when allocating large rt extents
    16d40ce11521 module: Remove accidental change of module_enable_x()
    566b1bb7d393 KVM: arm/arm64: vgic: Fix potential double free dist->spis in __kvm_vgic_destroy()
    c306458a2bd0 kernel/sys.c: avoid copying possible padding bytes in copy_to_user
    e95e4ba3efd8 kernel/notifier.c: intercept duplicate registrations to avoid infinite loops
    425582bd448c selftests/bpf: De-flake test_tcpbpf
    3283bd6d19cd arm64: insn: consistently handle exit text
    c8662aa75a42 drm/amdgpu: fix calltrace during kmd unload(v3)
    6a74132beed2 xfs: fix realtime file data space leak
    a04223019c22 s390: avoid misusing CALL_ON_STACK for task stack setup
    a1a6f8a14cb0 xtensa: fix system_call interaction with ptrace
    f9f47ef869eb ASoC: max98090: remove msleep in PLL unlocked workaround
    273589e82cb1 f2fs: stop GC when the victim becomes fully valid
    84b15c4e1550 CIFS: Properly process SMB3 lease breaks
    2005c32ec99e CIFS: Use common error handling code in smb2_ioctl_query_info()
    3ce5297c0b40 SUNRPC: Capture completion of all RPC tasks
    80f766742244 debugfs: Fix !DEBUG_FS debugfs_create_automount
    14bbbfbafef1 mt76: add missing locking around ampdu action
    5eee23bc19a8 mt76: do not use devm API for led classdev
    773dc2922719 scsi: pm80xx: Cleanup command when a reset times out
    714dbaf2f814 gfs2: clean up iopen glock mess in gfs2_create_inode
    a21260928bd3 mmc: core: Fix size overflow for mmc partitions
    cbd2ee90d3c1 ubi: Fix producing anchor PEBs
    40afadc05771 RDMA/iw_cgxb4: Fix an error handling path in 'c4iw_connect()'
    be45bce4ad8e xfs: fix attr leaf header freemap.size underflow
    424388f0c534 fix dget_parent() fastpath race
    797f6c19abce PCI: Avoid double hpmemsize MMIO window assignment
    3161ea673382 RDMA/i40iw: Fix potential use after free
    f3ebf81ee634 RDMA/qedr: Fix potential use after free
    04f4f09502f1 x86/kdump: Always reserve the low 1M when the crashkernel option is specified
    21c82e8d4201 dmaengine: mediatek: hsdma_probe: fixed a memory leak when devm_request_irq fails
    fd3572bd5bc1 bcache: fix a lost wake-up problem caused by mca_cannibalize_lock
    9f81aa5d4493 tracing: Adding NULL checks for trace_array descriptor pointer
    8e0d54aa4005 tracing: Verify if trace array exists before destroying it.
    6405d5c5c5b8 tpm_crb: fix fTPM on AMD Zen+ CPUs
    b3a1fb675eb8 drm/amdgpu/powerplay/smu7: fix AVFS handling with custom powerplay table
    022a2a0728cb mfd: mfd-core: Protect against NULL call-back function pointer
    deb34c91ebd4 mtd: cfi_cmdset_0002: don't free cfi->cfiq in error path of cfi_amdstd_setup()
    bcd4bbf99535 ice: Fix to change Rx/Tx ring descriptor size via ethtool with DCBx
    3642887a4031 drm/amdgpu/powerplay: fix AVFS handling with custom powerplay table
    c5505813d01f clk/ti/adpll: allocate room for terminating null
    5eb67d3843ed f2fs: avoid kernel panic on corruption test
    5657f17bcd9c iomap: Fix overflow in iomap_page_mkwrite
    4c7d4dd210a1 dax: Fix alloc_dax_region() compile warning
    6670a2a397d4 net: silence data-races on sk_backlog.tail
    75a1c456944f powerpc/64s: Always disable branch profiling for prom_init.o
    f5abdca0c2ef scsi: lpfc: Fix kernel crash at lpfc_nvme_info_show during remote port bounce
    1a4c4df21728 scsi: fnic: fix use after free
    4241376371ad PM / devfreq: tegra30: Fix integer overflow on CPU's freq max out
    d550b07e1a3f dm table: do not allow request-based DM to stack on partitions
    e645b649c418 leds: mlxreg: Fix possible buffer overflow
    36f11775da75 xfs: properly serialise fallocate against AIO+DIO
    50afba5c129c drm/amd/display: Free gamma after calculating legacy transfer function
    252e8b514a98 media: smiapp: Fix error handling at NVM reading
    e0731a6503b0 soundwire: intel/cadence: fix startup sequence
    d9adb4deef16 ASoC: kirkwood: fix IRQ error handling
    8b4e9c1bb05a gma/gma500: fix a memory disclosure bug due to uninitialized bytes
    8c355ed61996 xfs: fix inode fork extent count overflow
    ff099d7c845d m68k: q40: Fix info-leak in rtc_ioctl
    bbe4f5e44a75 scsi: aacraid: fix illegal IO beyond last LBA
    2c25b9511178 mm: fix double page fault on arm64 if PTE_AF is cleared
    bdb830d101e7 PCI/IOV: Serialize sysfs sriov_numvfs reads vs writes
    a34a9a4c31e2 ath10k: fix memory leak for tpc_stats_final
    b8ef4aaf6e32 ath10k: fix array out-of-bounds access
    abc15be19f4c scsi: qla2xxx: Add error handling for PLOGI ELS passthrough
    ac559369050f dma-fence: Serialise signal enabling (dma_fence_enable_sw_signaling)
    3e7bf6336084 drm/amdkfd: Fix race in gfx10 context restore handler
    c08ecda2cf31 drm/amd/display: Do not double-buffer DTO adjustments
    1333ce263ad9 media: mc-device.c: fix memleak in media_device_register_entity
    b7316f505fe5 selinux: allow labeling before policy is loaded
    e14f1f8f1bfe scsi: mpt3sas: Free diag buffer without any status check
    6b8fbd9b2db0 scsi: lpfc: Fix pt2pt discovery on SLI3 HBAs
    03c4d42e3c14 kernel/sysctl-test: Add null pointer test for sysctl.c:proc_dointvec()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 96bf49ce88..13f7246f46 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e38963298cea681462c0940c3b9dee0851e7ab85"
-SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
+SRCREV_machine ?= "3a5f7e9a874f0a6e9ad599b4fc6c491db231dd6f"
+SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.68"
+LINUX_VERSION ?= "5.4.69"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f37e134c3f..00e1b65782 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.68"
+LINUX_VERSION ?= "5.4.69"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2744a3e76566b0e9b369c5af54651545ecbdfa19"
-SRCREV_machine ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
+SRCREV_machine_qemuarm ?= "58f39df46d9daf12a095ffe225032ec325612960"
+SRCREV_machine ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 9b4d77a8aa..bcc5003268 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "317c8079734e0cc7d473737677864edcacbabb06"
-SRCREV_machine_qemuarm64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_machine_qemumips ?= "5dbc5fdaa4ca0411cd4deae6c383335c0d35c178"
-SRCREV_machine_qemuppc ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_machine_qemuriscv64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_machine_qemux86 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_machine_qemux86-64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_machine_qemumips64 ?= "a2c444c711717fe8296e875fe2e0961e6ff3627c"
-SRCREV_machine ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
-SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
+SRCREV_machine_qemuarm ?= "561d4f6eb1de32e1448451db86656826cf406eb5"
+SRCREV_machine_qemuarm64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_machine_qemumips ?= "e421f3f2399c153c4d58241cb6d1be926f7efc45"
+SRCREV_machine_qemuppc ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_machine_qemuriscv64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_machine_qemux86 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_machine_qemux86-64 ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_machine_qemumips64 ?= "72d2f11b5f171e196d6b9824b82575d9a7b59e6f"
+SRCREV_machine ?= "cfcdd63145c0d741e57ee3e3e58f794229c6c09c"
+SRCREV_meta ?= "7f765dcb29003bafc9c0ac770147940be6c420b2"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.68"
+LINUX_VERSION ?= "5.4.69"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

