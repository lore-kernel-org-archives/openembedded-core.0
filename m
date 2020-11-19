Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.14293.1605813481488196135
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HDu/8asJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id f93so5204044qtb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x+1S+tfvmuvMhWBM9XnxHt7UVy7fF0+3cjkM3Gc4ud0=;
        b=HDu/8asJp3G3Z5s2lGwZehrJ2OHuY/P1iOOEkZU2YUwrgzQNKId02H2pcC9tXpSix7
         fSq47WEXa9E5CArhcZl62IwFKZaG2sPI8n3IgCYxs2K0pPBXnaZjh21tZnYMTCucmNA+
         bJjbGowu24ck80Mg2/bHJLIomgz3OVOMWfK8gCA9zia4n3GUrmqOgpSYpQBB+pLqmWDT
         +PEsFvnj5Bwl6V6Oy2Z31hg9RGv7hQmWxwevEkqtnm46Nf/XMVopphG5SG+buVPCRTBA
         zaXa0dzwnyt/lyeCnpk6K4DC8aWoWWzTwOLAVfCo4cX3PoB5EH6cSMyJ7pzxE1iy+/Dm
         vrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+1S+tfvmuvMhWBM9XnxHt7UVy7fF0+3cjkM3Gc4ud0=;
        b=ip6/jIaybWb12bw8gC9QYN9LJff0zgjLpj33Mw+oQqFZGzlzZGPLcVNXK4vMiHmBEZ
         +AXMXQZT+ijr4kLMQCAhMpolqRhg/535AR++G2aMzswwVHy48WATQNNIa1Gr87qPmiqP
         70nDj9G/uLOkwrG+dWLYFUcC0G4wJCHKctxaKDqDg59mg8S5nSSjxNPp1apdKLJJyVuD
         TtiEEy8Uq/fXRZ+UZG51igFd2EejPfpbxH16ZVslrohoy/QtBYBGbq68pJ0yXxSc+qEO
         aiIv2B310WyvgYG9nxWW5YCLP1d3TLH1FmfNk/G6Aodz7nmy1JYuD/vD7GcwoJUA6tDr
         3n1w==
X-Gm-Message-State: AOAM531hgBAMmfvHqk18bToCSIKykdbHkb48YysgyBpBUIM0hA+lHvCU
	uTsfTkfX3752WqPEa6azBJw=
X-Google-Smtp-Source: ABdhPJz99XND54jbfwD1JHRd31FiuQ//Eki6dgBDzYloztASbTJ9YhB9OrERCA40Zt75c93yft6f5Q==
X-Received: by 2002:ac8:7687:: with SMTP id g7mr12398763qtr.103.1605813480410;
        Thu, 19 Nov 2020 11:18:00 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:59 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/5.4: update to v5.4.78
Date: Thu, 19 Nov 2020 14:17:52 -0500
Message-Id: <beacebfbd591fa235b6c4044f945cb67c47b67f4.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    315443293a2d Linux 5.4.78
    9fda2e762498 Convert trailing spaces and periods in path components
    ebc24aeb8694 net: sch_generic: fix the missing new qdisc assignment bug
    c5cf5c7b585c perf/core: Fix race in the perf_mmap_close() function
    c6b1616f5472 perf scripting python: Avoid declaring function pointers with a visibility attribute
    b74fe3186471 x86/speculation: Allow IBPB to be conditionally enabled on CPUs with always-on STIBP
    6958fbd52e79 powerpc/603: Always fault when _PAGE_ACCESSED is not set
    5af9d48acbee drm/i915: Correctly set SFC capability for video engines
    6fcf4141b9a2 r8169: fix potential skb double free in an error path
    78f6fac0814e tipc: fix memory leak in tipc_topsrv_start()
    c59039a088bd net/x25: Fix null-ptr-deref in x25_connect
    7e332a5c0e2c net: Update window_clamp if SOCK_RCVBUF is set
    25786fb512f7 net: udp: fix UDP header access on Fast/frag0 UDP GRO
    016e70d176ff net/af_iucv: fix null pointer dereference on shutdown
    22ee23fe1cc9 IPv6: Set SIT tunnel hard_header_len to zero
    98901bff58d9 swiotlb: fix "x86: Don't panic if can not alloc buffer for swiotlb"
    2cd21fe5bcc4 pinctrl: amd: fix incorrect way to disable debounce filter
    fa76dd3c1df3 pinctrl: amd: use higher precision for 512 RtcClk
    c6a6168a31e1 drm/gma500: Fix out-of-bounds access to struct drm_device.vblank[]
    974e3a7002a0 don't dump the threads that had been already exiting when zapped.
    039c8dcd2b15 mmc: renesas_sdhi_core: Add missing tmio_mmc_host_free() at remove
    e1d706eeeaf7 mmc: sdhci-of-esdhc: Handle pulse width detection erratum for more SoCs
    2a6cba6d3d72 gpio: pcie-idio-24: Enable PEX8311 interrupts
    7b6790ae3a94 gpio: pcie-idio-24: Fix IRQ Enable Register value
    819bf3b0d969 gpio: pcie-idio-24: Fix irq mask when masking
    68dae71b7cde selinux: Fix error return code in sel_ib_pkey_sid_slow()
    33e53f2cac19 btrfs: fix potential overflow in cluster_pages_for_defrag on 32bit arch
    9de4ffb70150 ocfs2: initialize ip_next_orphan
    ac18b128cfd6 reboot: fix overflow parsing reboot cpu number
    fa6265f8fb9e Revert "kernel/reboot.c: convert simple_strtoul to kstrtoint"
    bd4d106f3122 mm/slub: fix panic in slab_alloc_node()
    84778a43ae59 jbd2: fix up sparse warnings in checkpoint code
    2192d905df0d futex: Don't enable IRQs unconditionally in put_pi_state()
    761fb6829238 mei: protect mei_cl_mtu from null dereference
    e2b2c390ec9e virtio: virtio_console: fix DMA memory allocation for rproc serial
    57626d77ef1e xhci: hisilicon: fix refercence leak in xhci_histb_probe
    cbad9668929c usb: cdc-acm: Add DISABLE_ECHO for Renesas USB Download mode
    f988e9c85cfb uio: Fix use-after-free in uio_unregister_device()
    1654bf2d9f0e thunderbolt: Add the missed ida_simple_remove() in ring_request_msix()
    06c1895fe71b thunderbolt: Fix memory leak if ida_simple_get() fails in enumerate_services()
    11c14da8d005 KVM: arm64: Don't hide ID registers from userspace
    2033dd885297 btrfs: dev-replace: fail mount if we don't have replace item with target device
    5af9630036ef btrfs: fix min reserved size calculation in merge_reloc_root
    8266c23124c1 btrfs: ref-verify: fix memory leak in btrfs_ref_tree_mod
    062c9b04f6eb ext4: unlock xattr_sem properly in ext4_inline_data_truncate()
    a6ca4c7ec44c ext4: correctly report "not supported" for {usr,grp}jquota when !CONFIG_QUOTA
    52e3a55bc253 erofs: derive atime instead of leaving it empty
    09b0d47b7952 perf: Fix get_recursion_context()
    70867a9dbf57 vrf: Fix fast path output packet handling with async Netfilter rules
    2ab9c76986e4 cosa: Add missing kfree in error path of cosa_write
    c0a6cc9e11f4 of/address: Fix of_node memory leak in of_dma_is_coherent
    f10d238aad93 xfs: fix a missing unlock on error in xfs_fs_map_blocks
    0e2ad69bd4b5 lan743x: fix "BUG: invalid wait context" when setting rx mode
    b45f52a20879 xfs: fix brainos in the refcount scrubber's rmap fragment processor
    7cbf708b1b9a xfs: fix rmap key and record comparison functions
    3bd97b33be41 xfs: set the unwritten bit in rmap lookup flags in xchk_bmap_get_rmapextents
    08e213bef291 xfs: fix flags argument to rmap lookup when converting shared file rmaps
    a8ee686597fb igc: Fix returning wrong statistics
    81dcfdb9a015 nbd: fix a block_device refcount leak in nbd_release
    c602ad2b52dc bpf: Zero-fill re-used per-cpu map element
    dfcb33773877 SUNRPC: Fix general protection fault in trace_rpc_xdr_overflow()
    b9e8f9d139bd net/mlx5: Fix deletion of duplicate rules
    e74e514c8cca pinctrl: aspeed: Fix GPI only function problem.
    d2e61c5202e6 bpf: Don't rely on GCC __attribute__((optimize)) to disable GCSE
    443ae3655f8c ARM: 9019/1: kprobes: Avoid fortify_panic() when copying optprobe template
    c0be7a34c889 pinctrl: intel: Set default bias in case no particular value given
    88ccabbd2066 mfd: sprd: Add wakeup capability for PMIC IRQ
    58953e87343d tick/common: Touch watchdog in tick_unfreeze() on all CPUs
    3322f7289e50 spi: bcm2835: remove use of uninitialized gpio flags variable
    572e545d80ea tpm_tis: Disable interrupts on ThinkPad T490s
    713a3a94bee0 i2c: sh_mobile: implement atomic transfers
    37a048d790c3 riscv: Set text_offset correctly for M-Mode
    6d8b43376990 selftests: proc: fix warning: _GNU_SOURCE redefined
    ab10b7def421 amd/amdgpu: Disable VCN DPG mode for Picasso
    4faa1fabc645 i2c: mediatek: move dma reset before i2c reset
    b66c7cdedd1e vfio/pci: Bypass IGD init in case of -ENODEV
    c6be53caf1c8 vfio: platform: fix reference leak in vfio_platform_open
    4d6f536e34d6 s390/smp: move rcu_cpu_starting() earlier
    984d77507439 iommu/amd: Increase interrupt remapping table limit to 512 entries
    a889cd3d350d nvme-tcp: avoid repeated request completion
    9d14f5225dbb nvme-rdma: avoid repeated request completion
    531b55cce9cd nvme-tcp: avoid race between time out and tear down
    d0e888a20dfd nvme-rdma: avoid race between time out and tear down
    0ca279c859d7 nvme: introduce nvme_sync_io_queues
    c473b3e56c1d scsi: mpt3sas: Fix timeouts observed while reenabling IRQ
    b61e157d9f64 scsi: scsi_dh_alua: Avoid crash during alua_bus_detach()
    bf1cedc12f58 tracing: Fix the checking of stackidx in __ftrace_trace_stack
    e57c04697030 cfg80211: regulatory: Fix inconsistent format argument
    a3f0db0d2320 cfg80211: initialize wdev data earlier
    67bb2e4d41de mac80211: fix use of skb payload instead of header
    c1cbb64c100d drm/amd/pm: do not use ixFEATURE_STATUS for checking smc running
    48083640a47b drm/amd/pm: perform SMC reset on suspend/hibernation
    f449b902badb drm/amdgpu: perform srbm soft reset always on SDMA resume
    7f6df0b085ce scsi: hpsa: Fix memory leak in hpsa_init_one()
    325455358e54 gfs2: check for live vs. read-only file system in gfs2_fitrim
    edeff05a1f10 gfs2: Add missing truncate_inode_pages_final for sd_aspace
    99dcfc517d17 gfs2: Free rd_bits later in gfs2_clear_rgrpd to fix use-after-free
    42eaa22aaf2e ALSA: hda: Reinstate runtime_allow() for all hda controllers
    0a4c091673ca ALSA: hda: Separate runtime and system suspend
    9b7e6b670df7 selftests: pidfd: fix compilation errors due to wait.h
    9110e2f2633d selftests/ftrace: check for do_sys_openat2 in user-memory test
    1737ea0c5775 usb: gadget: goku_udc: fix potential crashes in probe
    e60490354191 opp: Reduce the size of critical section in _opp_table_kref_release()
    fe2dc1093c61 usb: dwc3: pci: add support for the Intel Alder Lake-S
    e22142a9a2a9 ASoC: cs42l51: manage mclk shutdown delay
    0fc0befe0bfa ASoC: qcom: sdm845: set driver name correctly
    b668352c4aad ath9k_htc: Use appropriate rs_datalen type
    42501604363f KVM: x86: don't expose MSR_IA32_UMWAIT_CONTROL unconditionally
    d2cef3bae14b KVM: arm64: ARM_SMCCC_ARCH_WORKAROUND_1 doesn't return SMCCC_RET_NOT_REQUIRED
    213e1238cacc random32: make prandom_u32() output unpredictable
    327af342ca9b tpm: efi: Don't create binary_bios_measurements file for an empty log
    0685eb84ad56 xfs: fix scrub flagging rtinherit even if there is no rt device
    2f6cbef32718 xfs: flush new eof page on truncate to avoid post-eof corruption
    66ce8bfad6f6 can: flexcan: flexcan_remove(): disable wakeup completely
    0b657367309e can: flexcan: remove FLEXCAN_QUIRK_DISABLE_MECR quirk for LS1021A
    56c56af0a3a1 can: peak_canfd: pucan_handle_can_rx(): fix echo management when loopback is on
    a23ee9956612 can: peak_usb: peak_usb_get_ts_time(): fix timestamp wrapping
    44b2c4beff8a can: peak_usb: add range checking in decode operations
    d6c34afab0ed can: xilinx_can: handle failure cases of pm_runtime_get_sync
    51920ca7519c can: ti_hecc: ti_hecc_probe(): add missed clk_disable_unprepare() in error path
    b9c4a9a07c4a can: j1939: j1939_sk_bind(): return failure if netdev is down
    0ab4c839409a can: j1939: swap addr and pgn in the send example
    5bde65abe166 can: can_create_echo_skb(): fix echo skb generation: always use skb_clone()
    183f1af506fe can: dev: __can_get_echo_skb(): fix real payload length return value for RTR frames
    ab46748bf988 can: dev: can_get_echo_skb(): prevent call to kfree_skb() in hard IRQ context
    3d0954767918 can: rx-offload: don't call kfree_skb() from IRQ context
    e201588fad54 afs: Fix warning due to unadvanced marshalling pointer
    9946509a027b iommu/vt-d: Fix a bug for PDP check in prq_event_thread
    2825a5bf3ca5 ALSA: hda: prevent undefined shift in snd_hdac_ext_bus_get_link()
    22901751d269 perf tools: Add missing swap for ino_generation
    b36f78fd48e9 perf trace: Fix segfault when trying to trace events by cgroup
    d261d0bd9066 powerpc/eeh_cache: Fix a possible debugfs deadlock
    1c8fe343a79d netfilter: ipset: Update byte and packet counters regardless of whether they match
    ad017cf5dace netfilter: nf_tables: missing validation from the abort path
    56907fa27b94 netfilter: use actual socket sk rather than skb sk when routing harder
    6234710dc634 xfs: set xefi_discard when creating a deferred agfl free log intent item
    933f911136e2 ASoC: codecs: wcd9335: Set digital gain range correctly
    5cb904da85ed net: xfrm: fix a race condition during allocing spi
    4e438ca1b629 hv_balloon: disable warning when floor reached
    bb2b60242c8e genirq: Let GENERIC_IRQ_IPI select IRQ_DOMAIN_HIERARCHY
    bb8c6bd53cc0 ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup function
    a8ec66026dd8 btrfs: reschedule when cloning lots of extents
    0ee771e96954 btrfs: sysfs: init devices outside of the chunk_mutex
    c58fa93b1409 btrfs: tracepoints: output proper root owner for trace_find_free_extent()
    e24516cf62f9 usb: dwc3: gadget: Reclaim extra TRBs after request completion
    ab031673e2ab usb: dwc3: gadget: Continue to process pending requests
    504cfb5e3bca PCI: qcom: Make sure PCIe is reset before init for rev 2.1.0
    9dfbc2f82ac8 KVM: arm64: Force PTE mapping on fault resulting in a device mapping
    95fda70d3955 nbd: don't update block size after device is started
    160777b19b86 time: Prevent undefined behaviour in timespec64_to_ns()
    5a39fb2f22fd drm/i915/gem: Flush coherency domains on first set-domain-ioctl
    2544d06afd8d Linux 5.4.77
    19f6d91bdad4 powercap: restrict energy meter to root access
    ec9c6b417e27 Linux 5.4.76
    c3d60c695712 arm64: dts: marvell: espressobin: Add ethernet switch aliases
    b7f7474b3921 perf/core: Fix a memory leak in perf_event_parse_addr_filter()
    21ab13af8c50 xfs: flush for older, xfs specific ioctls
    258d01b1577e PM: runtime: Resume the device earlier in __device_release_driver()
    37f75c6aa8dd PM: runtime: Drop pm_runtime_clean_up_links()
    874dfb5c6aa3 PM: runtime: Drop runtime PM references to supplier on link removal
    fbfca92c7840 ARC: stack unwinding: avoid indefinite looping
    d61edc06002f drm/panfrost: Fix a deadlock between the shrinker and madvise path
    b9d91fa92164 usb: mtu3: fix panic in mtu3_gadget_stop()
    b0d03a1bdb3c USB: Add NO_LPM quirk for Kingston flash drive
    290fcf3e0c0c usb: dwc3: ep0: Fix delay status handling
    86875e1d6426 tty: serial: fsl_lpuart: LS1021A has a FIFO size of 16 words, like LS1028A
    8febdfb5973d tty: serial: fsl_lpuart: add LS1028A support
    d5d3cca9d61f USB: serial: option: add Telit FN980 composition 0x1055
    7f7be9341b86 USB: serial: option: add LE910Cx compositions 0x1203, 0x1230, 0x1231
    b7f74775c2bb USB: serial: option: add Quectel EC200T module support
    9d34dbab6ef4 USB: serial: cyberjack: fix write-URB completion race
    62c4b2b21e3b serial: txx9: add missing platform_driver_unregister() on error in serial_txx9_init
    085fc4784e4b serial: 8250_mtk: Fix uart_get_baud_rate warning
    b33a1039564c s390/pkey: fix paes selftest failure with paes and pkey static build
    beeb658cfd35 fork: fix copy_process(CLONE_PARENT) race with the exiting ->real_parent
    642181fe3567 vt: Disable KD_FONT_OP_COPY
    cfd9d7137759 Revert "coresight: Make sysfs functional on topologies with per core sink"
    8ee6a0f25457 arm64/smp: Move rcu_cpu_starting() earlier
    eceb94287dbf drm/nouveau/gem: fix "refcount_t: underflow; use-after-free"
    7d0de6f87257 drm/nouveau/nouveau: fix the start/end range for migration
    4dab0fd40323 usb: cdns3: gadget: suspicious implicit sign extension
    937753df482c ACPI: NFIT: Fix comparison to '-ENXIO'
    16476c2b26ca drm/vc4: drv: Add error handding for bind
    a04cec1dd293 nvmet: fix a NULL pointer dereference when tracing the flush command
    8c9c03432500 nvme-rdma: handle unexpected nvme completion data length
    2fd9e60760ef vsock: use ns_capable_noaudit() on socket create
    2149aa583068 scsi: ibmvscsi: Fix potential race after loss of transport
    1247f4e29188 drm/amdgpu: add DID for navi10 blockchain SKU
    fd4fb5080725 scsi: core: Don't start concurrent async scan on same host
    3c52715ceaae blk-cgroup: Pre-allocate tree node on blkg_conf_prep
    f77756ea6641 blk-cgroup: Fix memleak on error path
    914fc5524261 drm/sun4i: frontend: Fix the scaler phase on A33
    f743f73f42a7 drm/sun4i: frontend: Reuse the ch0 phase for RGB formats
    6d7b41a67687 drm/sun4i: frontend: Rework a bit the phase data
    147e3743cf7a of: Fix reserved-memory overlap detection
    6e02c29e4ac4 x86/kexec: Use up-to-dated screen_info copy to fill boot params
    3283d4d78412 arm64: dts: meson: add missing g12 rng clock
    69e0e917c7c8 ARM: dts: sun4i-a10: fix cpu_alert temperature
    2716e78a6486 futex: Handle transient "ownerless" rtmutex state correctly
    ec5f524e0293 tracing: Fix out of bounds write in get_trace_buf
    9f6883fce694 spi: bcm2835: fix gpio cs level inversion
    f352cca84625 regulator: defer probe when trying to get voltage from unresolved supply
    a69af5baed80 ftrace: Handle tracing when switching between context
    3058420f40fb ftrace: Fix recursion check for NMI test
    cfaf010cf345 mtd: spi-nor: Don't copy self-pointing struct around
    aef59b5e5bdf ring-buffer: Fix recursion protection transitions between interrupt context
    2cd71743e7ff gfs2: Wake up when sd_glock_disposal becomes zero
    d2286457bd83 mm: always have io_remap_pfn_range() set pgprot_decrypted()
    1b8490d6b809 kthread_worker: prevent queuing delayed work from timer_fn when it is being canceled
    b1d16be4f2f4 lib/crc32test: remove extra local_irq_disable/enable
    c1f729c7dec0 mm: mempolicy: fix potential pte_unmap_unlock pte error
    f7c2913d606b ALSA: usb-audio: Add implicit feedback quirk for MODX
    26a871cf86cb ALSA: usb-audio: Add implicit feedback quirk for Qu-16
    a46e830d017e ALSA: usb-audio: add usb vendor id as DSD-capable for Khadas devices
    65457e345f3c ALSA: usb-audio: Add implicit feedback quirk for Zoom UAC-2
    72ce616ed55a ALSA: hda/realtek - Enable headphone for ASUS TM420
    f7d0f7242405 ALSA: hda/realtek - Fixed HP headset Mic can't be detected
    61402d61a2af Fonts: Replace discarded const qualifier
    e5ea79bb19f8 sfp: Fix error handing in sfp_probe()
    9b5458effeee sctp: Fix COMM_LOST/CANT_STR_ASSOC err reporting on big-endian platforms
    26ffb8916059 powerpc/vnic: Extend "failover pending" window
    92e65059beda net: usb: qmi_wwan: add Telit LE910Cx 0x1230 composition
    8e3c047f814b ip_tunnel: fix over-mtu packet send fail without TUNNEL_DONT_FRAGMENT flags
    ac343efb572c ionic: check port ptr before use
    6ef3bcc25a3e gianfar: Account for Tx PTP timestamp in the skb headroom
    5b66a5b6a9e2 gianfar: Replace skb_realloc_headroom with skb_cow_head for PTP
    7bf7b7c385a1 chelsio/chtls: fix always leaking ctrl_skb
    14d755a4815e chelsio/chtls: fix memory leaks caused by a race
    57bb59f9d8fb cadence: force nonlinear buffers to be cloned
    1695fca8a923 ptrace: fix task_join_group_stop() for the case when current is traced
    76e5bba75a63 tipc: fix use-after-free in tipc_bcast_get_mode
    ca16a42f5f0d arm64: Change .weak to SYM_FUNC_START_WEAK_PI for arch/arm64/lib/mem*.S
    d94589900d98 arm64: lib: Use modern annotations for assembly functions
    3e7050661d95 arm64: asm: Add new-style position independent function annotations
    840d8c9b3e5f linkage: Introduce new macros for assembler symbols
    1ca84322ab5b ASoC: Intel: Skylake: Add alternative topology binary name
    e05dfcff26e9 drm/i915: Drop runtime-pm assert from vgpu io accessors
    d321f127eb51 drm/i915/gt: Delay execlist processing for tgl
    5bcd18bf8082 drm/i915: Break up error capture compression loops with cond_resched()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 4db2b33aef..104ada2db5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1fe1ef9c7272caf75d92b3e9166a0f29c4f06141"
-SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
+SRCREV_machine ?= "97576fb7447efba82eb025bde3ae9ceb29939d5e"
+SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.75"
+LINUX_VERSION ?= "5.4.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f6ed7f35ea..d8784c49ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.75"
+LINUX_VERSION ?= "5.4.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "83d064534da33ab41108a786d917068f282a9bf2"
-SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
+SRCREV_machine_qemuarm ?= "6cf3b1d30bc7ac9bd86190129b3cbbdd04b8b236"
+SRCREV_machine ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0330a9d159..c24e5ddc87 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "879db1ae1856cf5a9fe4609fdbcbe2e3c7bade5f"
-SRCREV_machine_qemuarm64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_machine_qemumips ?= "190c3ce9c2dbc709c3dcf02d8cfa80adc8a063d2"
-SRCREV_machine_qemuppc ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_machine_qemuriscv64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_machine_qemux86 ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_machine_qemux86-64 ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_machine_qemumips64 ?= "98b1fc2eafc28e5c198e23579e38a76626c66182"
-SRCREV_machine ?= "356914747645db5ceba98b22acdfa060ef1764af"
-SRCREV_meta ?= "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
+SRCREV_machine_qemuarm ?= "b3bafed66cf1be24caaa9c876d7d9a8298df831b"
+SRCREV_machine_qemuarm64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_machine_qemumips ?= "36c2a0b1caef0b2dd6b5777d1939c383238536a8"
+SRCREV_machine_qemuppc ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_machine_qemuriscv64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_machine_qemux86 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_machine_qemux86-64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_machine_qemumips64 ?= "971a3cedf9a2a7774fa072b9a13380fb59fd605b"
+SRCREV_machine ?= "370ef947d5b1470e858bae5a300110566c994b9f"
+SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.75"
+LINUX_VERSION ?= "5.4.78"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

