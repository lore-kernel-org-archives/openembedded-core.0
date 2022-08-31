Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7347C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:11 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.26445.1661956804106427048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8WGRWNnx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id o4so14333910pjp.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=/3uY0C5lfMDdJQqH/7TSAHe0XXMDvfl/+r9nTw8rfFQ=;
        b=8WGRWNnx/W1fRX+BTlsD0nuZQ1UomV6tTbwhYoin39ySJhhS8tFVAqg5OAnIqhQQJV
         n/NnWdZS9AoJDZdKKyRvLnLh0zENigIhZ1P3iwTVhps431xpZxmZ/TFugV3z3gi3zpyI
         N0JybNhZw7MbZbtNDjXslwsj+csL9AgrIGQCjncdRAuctLXtjYHv4iz0YDqj+ekgCnop
         18jcT4Xo/cjXO15y3Bi0yYzzWRbfQGNWLE1TfwV4o2enhwQpyy2XHqH4zCJsrEsGz1Oo
         kx+F57uqjwAiMA0/OGW5krWSM5QVzautJG/oko7pCPipjcHiTmv+icA0GykXOlJRe4/x
         tzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=/3uY0C5lfMDdJQqH/7TSAHe0XXMDvfl/+r9nTw8rfFQ=;
        b=indX3xmj+tHiYtXHFUhjsXBbVEV/VcWKsCDibEEKQI8d7aL9VpOccowENiPwpH29m5
         PmTUCVwu52X8V3AYJaIWt/cfy/HJM8LMJGR/AOS+WqpKYNCOXC6J3sCCTSUeViFYm3gu
         /5EPZTSpm1IU20CGSSjTgHXMMP69LNK9O8TdKYqXsktr0L//YSj220TqA8egRxnBqiXU
         n6BdLXxqLwpkYsY562eS++23qIXVQRqr47o3bSfGXgGoK5ffaC7fIEUDOvrv+m0VCsBF
         fCC02q1R/OUVP88GGrfRjgegNzdPMTyqPMSz8L1516CAt2VYoJg5jYNWDPsPBZ0Kw8vg
         G1wQ==
X-Gm-Message-State: ACgBeo3d6x4hfTvuxsSFqyIXzXWKtmgAbUKLMzCfctFeTr3W6GJt2yts
	5u0RdoOK0d8AKEH6PY6t67+fRfwx479ElLUs
X-Google-Smtp-Source: 
 AA6agR6Bt8jf32z//Sje4swwBsV9lyEKNXDtDPwRQuBF5GAH//8ybLdOZfDc0mUDvm2ORrxvmTOPAw==
X-Received: by 2002:a17:903:234d:b0:173:132e:d50d with SMTP id
 c13-20020a170903234d00b00173132ed50dmr25561020plh.30.1661956798954;
        Wed, 31 Aug 2022 07:39:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.39.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:39:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] linux-yocto/5.15: update to v5.15.62
Date: Wed, 31 Aug 2022 04:39:24 -1000
Message-Id: 
 <6b41953720a47fab28668f4442b1583b787f02c5.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170116

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a0a7e0b2b8b2 Linux 5.15.62
    2a9114b3ec6f btrfs: raid56: don't trust any cached sector in __raid56_parity_recover()
    0d9c713cc30f btrfs: only write the sectors in the vertical stripe which has data stripes
    3eb602ad6a94 x86/ftrace: Use alternative RET encoding
    543138c55518 x86/ibt,ftrace: Make function-graph play nice
    f6632763484c Revert "x86/ftrace: Use alternative RET encoding"
    cb69d4d6f709 ksmbd: fix heap-based overflow in set_ntacl_dacl()
    c76b216753c9 ksmbd: prevent out of bound read for SMB2_WRITE
    5430db94434f net_sched: cls_route: disallow handle of 0
    c12f0e6126ad tee: add overflow check in register_shm_helper()
    3746d62ecf1c io_uring: use original request task for inflight tracking
    374bf3fc1f53 Linux 5.15.61
    17bf429b913b scsi: lpfc: Resolve some cleanup issues following SLI path refactoring
    6e99860de6f4 scsi: lpfc: Fix element offset in __lpfc_sli_release_iocbq_s4()
    9a570069cdbb scsi: lpfc: Fix locking for lpfc_sli_iocbq_lookup()
    f27259515797 drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
    2711bedab26c Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm regression
    449928869475 Revert "net: usb: ax88179_178a needs FLAG_SEND_ZLP"
    fa3040688d75 io_uring: mem-account pbuf buckets
    50446ac34545 drm/meson: Fix refcount leak in meson_encoder_hdmi_init
    a8278cf3f00d drm/msm: Fix dirtyfb refcounting
    3cfd07084b7e tracing/perf: Avoid -Warray-bounds warning for __rel_loc macro
    1889f4135fb2 drm/vc4: change vc4_dma_range_matches from a global to static
    3131a20eee20 net: phy: smsc: Disable Energy Detect Power-Down in interrupt mode
    a25f45ff8856 drm/bridge: tc358767: Fix (e)DP bridge endpoint parsing in dedicated function
    276e1cac8085 Revert "s390/smp: enforce lowcore protection on CPU restart"
    93d28e50cf72 Revert "mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv"
    621b596b29e5 crypto: lib/blake2s - reduce stack frame usage in self test
    aa480f7d74b9 tcp: fix over estimation in sk_forced_mem_schedule()
    4db561ae4a90 mac80211: fix a memory leak where sta_info is not freed
    57bbb691a93b net_sched: cls_route: remove from list when handle is 0
    f467478d15fa tracing: Use a struct alignof to determine trace event field alignment
    5bafa7df79de powerpc: Fix eh field when calling lwarx on PPC32
    c98e956ef489 xen-blkfront: Apply 'feature_persistent' parameter when connect
    ef26b5d530d4 xen-blkback: Apply 'feature_persistent' parameter when connect
    7304be4c985d xen-blkback: fix persistent grants negotiation
    9e7dab7edabd tpm: eventlog: Fix section mismatch for DEBUG_SECTION_MISMATCH
    84075af9fb4a KEYS: asymmetric: enforce SM2 signature use pkey algo
    1be97463696c ext4: fix race when reusing xattr blocks
    470f0a5ef519 ext4: unindent codeblock in ext4_xattr_block_set()
    51877de35d21 ext4: use kmemdup() to replace kmalloc + memcpy
    0b885394fd00 ext4: remove EA inode entry from mbcache on inode eviction
    19dac09bd956 ext4: make sure ext4_append() always allocates new block
    ef6e69026d88 ext4: check if directory block is within i_size
    30dfb75e1f86 ext4: fix warning in ext4_iomap_begin as race between bmap and write
    9a080f8b085a ext4: correct the misjudgment in ext4_iget_extra_inode
    7dbba7916920 ext4: correct max_inline_xattr_value_size computing
    21f6bd5cbdab ext4: fix use-after-free in ext4_xattr_set_entry
    e6321fda51e5 ext4: add EXT4_INODE_HAS_XATTR_SPACE macro in xattr.h
    133b80d5582e ext4: fix extent status tree race in writeback error recovery path
    88bcc518e4ad ext4: update s_overhead_clusters in the superblock during an on-line resize
    3c0a5a0e1c66 tracing: Avoid -Warray-bounds warning for __rel_loc macro
    994dea8549f2 tracing: Add '__rel_loc' using trace event macros
    50235d9a1f1f dm raid: fix address sanitizer warning in raid_resume
    4c233811a495 dm raid: fix address sanitizer warning in raid_status
    34bef00a325a KVM: nVMX: Attempt to load PERF_GLOBAL_CTRL on nVMX xfer iff it exists
    e365c817beef KVM: VMX: Add helper to check if the guest PMU has PERF_GLOBAL_CTRL
    1eedac05b2f3 KVM: x86/pmu: Ignore pmu->global_ctrl check if vPMU doesn't support global_ctrl
    9f1a17222a8b KVM: VMX: Mark all PERF_GLOBAL_(OVF)_CTRL bits reserved if there's no vPMU
    81f723a006e7 KVM: x86/pmu: Introduce the ctrl_mask value for fixed counter
    0ceef1c56875 powerpc/powernv/kvm: Use darn for H_RANDOM on Power9
    0eeb7037a479 ACPI: CPPC: Do not prevent CPPC from working in the future
    2cc23122653f btrfs: properly flag filesystem with BTRFS_FEATURE_INCOMPAT_BIG_METADATA
    b5c541758650 btrfs: reset block group chunk force if we have to wait
    b367f125c80f btrfs: ensure pages are unlocked on cow_file_range() failure
    0b7f5d7a4d2a block: don't allow the same type rq_qos add more than once
    b055781dd947 block: remove the struct blk_queue_ctx forward declaration
    d2cbdbe22b5f locking/csd_lock: Change csdlock_debug from early_param to __setup
    96ba981f09a9 timekeeping: contribute wall clock to rng on time change
    6b841a891d28 ARM: remove some dead code
    7a7188df3eae net/9p: Initialize the iounit field during fid creation
    f83131a3071a dm thin: fix use-after-free crash in dm_sm_register_threshold_callback
    779fd8cb621e kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
    9769bd964d54 dm writecache: set a default MAX_WRITEBACK_JOBS
    10bc71642fad tty: 8250: Add support for Brainboxes PX cards.
    6f47a7594bcf serial: 8250: Add proper clock handling for OxSemi PCIe devices
    96f2c1685b1c serial: 8250: Fold EndRun device support into OxSemi Tornado code
    b49c3b3a911d serial: 8250_pci: Replace dev_*() by pci_*() macros
    5baacb540c5a serial: 8250_pci: Refactor the loop in pci_ite887x_init()
    55e5487ae294 PCI: qcom: Power on PHY before IPQ8074 DBI register accesses
    c5d3873d3e1c PCI/AER: Iterate over error counters instead of error strings
    0b4c0003aeda iommu/vt-d: avoid invalid memory access via node_online(NUMA_NO_NODE)
    f2145a1bf7ab KVM: x86: Signal #GP, not -EPERM, on bad WRMSR(MCi_CTL/STATUS)
    1f71d1f7f491 KVM: set_msr_mce: Permit guests to ignore single-bit ECC errors
    925cc6d6ff8a intel_th: pci: Add Raptor Lake-S CPU support
    6d3c02fd9600 intel_th: pci: Add Raptor Lake-S PCH support
    df6faa9798eb intel_th: pci: Add Meteor Lake-P support
    2b5ef6430c21 scsi: lpfc: Remove extra atomic_inc on cmd_pending in queuecommand after VMID
    b4543dbea84c scsi: lpfc: SLI path split: Refactor SCSI paths
    c56cc7fefc31 scsi: lpfc: SLI path split: Refactor fast and slow paths to native SLI4
    1c5e670d6a5a scsi: lpfc: SLI path split: Refactor lpfc_iocbq
    eb36ec3039ce scsi: lpfc: Fix EEH support for NVMe I/O
    0c29e149b6bb firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails
    b574d1e3e9a2 usbnet: smsc95xx: Fix deadlock on runtime resume
    eaf3a094d892 usbnet: smsc95xx: Forward PHY interrupts to PHY driver to avoid polling
    09201006dac9 usbnet: smsc95xx: Avoid link settings race on interrupt reception
    048872438876 usbnet: smsc95xx: Don't clear read-only PHY interrupt
    c232db672713 drm/vc4: drv: Adopt the dma configuration from the HVS or V3D component
    4a54c13786c5 drm/dp/mst: Read the extended DPCD capabilities during system resume
    3dd33a09f5dc crypto: blake2s - remove shash module
    f96a9815b466 drm/mediatek: Keep dsi as LP00 before dcs cmds transfer
    8aa68065a877 drm/mediatek: Allow commands to be sent during video mode
    1e0ca3d809c3 spmi: trace: fix stack-out-of-bound access in SPMI tracing functions
    8cbc36e7e37a __follow_mount_rcu(): verify that mount_lock remains unchanged
    60c981f4b787 Input: gscps2 - check return value of ioremap() in gscps2_probe()
    9e255ed238fc posix-cpu-timers: Cleanup CPU timers before freeing them during exec
    c9c965fa1974 SMB3: fix lease break timeout when multiple deferred close handles for the same file.
    c273671ae826 x86/olpc: fix 'logical not is only applied to the left hand side'
    1cbf3882cb37 x86/kprobes: Update kcb status flag after singlestepping
    7c91c8da431d ftrace/x86: Add back ftrace_expected assignment
    0b00cb428f74 x86/bugs: Enable STIBP for IBPB mitigated RETBleed
    15f67058a1ee scsi: qla2xxx: Fix losing FCP-2 targets during port perturbation tests
    6f1d5e6979c1 scsi: qla2xxx: Fix losing target when it reappears during delete
    420e449e21b9 scsi: qla2xxx: Fix losing FCP-2 targets on long port disable with I/Os
    3f1102898b7b scsi: qla2xxx: Wind down adapter after PCIe error
    3b38c7f0c6ac scsi: qla2xxx: Fix erroneous mailbox timeout after PCI error injection
    1209da5278eb scsi: qla2xxx: Fix excessive I/O error messages by default
    b7bae3886a30 scsi: qla2xxx: Fix crash due to stale SRB access around I/O timeouts
    a76a155851fc scsi: qla2xxx: Turn off multi-queue for 8G adapters
    505fb1cc4328 scsi: qla2xxx: Fix discovery issues in FC-AL topology
    27a7805a19a7 scsi: qla2xxx: Fix imbalance vha->vref_count
    781a7dabeac2 scsi: zfcp: Fix missing auto port scan and thus missing target ports
    f5183d66c4f4 scsi: ufs: core: Correct ufshcd_shutdown() flow
    ce50d94afcb8 video: fbdev: s3fb: Check the size of screen before memset_io()
    0701df594bc1 video: fbdev: arkfb: Check the size of screen before memset_io()
    4a3cef1eaced video: fbdev: vt8623fb: Check the size of screen before memset_io()
    fff6bb19d56c f2fs: do not allow to decompress files have FI_COMPRESS_RELEASED
    05244b62ae94 f2fs: allow compression for mmap files in compress_mode=user
    608d4c5f9f4d x86/entry: Build thunk_$(BITS) only if CONFIG_PREEMPTION=y
    748d2e9585ae sched/core: Do not requeue task on CPU excluded from cpus_mask
    dd960a0ddd43 sched: Remove the limitation of WF_ON_CPU on wakelist if wakee cpu is idle
    f9ab9bcf53b6 sched: Fix the check of nr_running at queue wakelist
    1584dc3da7b4 tools/thermal: Fix possible path truncations
    236c1502520b video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
    3bb94ff1e794 x86/numa: Use cpumask_available instead of hardcoded NULL check
    147f66d22f58 sched, cpuset: Fix dl_cpu_busy() panic due to empty cs->cpus_allowed
    e51b98166334 sched/deadline: Merge dl_task_can_attach() and dl_cpu_busy()
    8fb62a576178 scripts/faddr2line: Fix vmlinux detection on arm64
    7f060ad6cb86 genelf: Use HAVE_LIBCRYPTO_SUPPORT, not the never defined HAVE_LIBCRYPTO
    e1c355ec7df1 powerpc/pci: Fix PHB numbering when using opal-phbid
    31dad89b16ed x86/bus_lock: Don't assume the init value of DEBUGCTLMSR.BUS_LOCK_DETECT to be zero
    a1edb85e60fd kprobes: Forbid probing on trampoline and BPF code areas
    533a06858b01 perf symbol: Fail to read phdr workaround
    5eaa93caa63a powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
    ea494e8a9852 powerpc/xive: Fix refcount leak in xive_get_max_prio
    69e9fa07b229 powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
    74715fe0726c f2fs: fix to remove F2FS_COMPR_FL and tag F2FS_NOCOMP_FL at the same time
    9536d5451cf4 s390/smp: enforce lowcore protection on CPU restart
    70caac180f14 s390/maccess: rework absolute lowcore accessors
    ac0a3e2131bd s390/smp: cleanup control register update routines
    a002b8641254 s390/smp: cleanup target CPU callback starting
    9287df436294 s390/dump: fix os_info virtual vs physical address confusion
    cf0e42eb04c7 tty: serial: fsl_lpuart: correct the count of break characters
    ef0f4eeaba24 powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
    df466a61f699 powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
    5414409ada0c powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
    14965b8e2952 powerpc/32: Call mmu_mark_initmem_nx() regardless of data block mapping.
    96ead6679803 ASoC: mchp-spdifrx: disable end of block interrupt on failures
    8301c204db28 video: fbdev: sis: fix typos in SiS_GetModeID()
    29f06f1905c3 video: fbdev: amba-clcd: Fix refcount leak bugs
    f28764d10e9f watchdog: armada_37xx_wdt: check the return value of devm_ioremap() in armada_37xx_wdt_probe()
    84ddf527f907 watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO resource
    27d0c621225d ASoC: audio-graph-card: Add of_node_put() in fail path
    642ebdd9579d fuse: Remove the control interface for virtio-fs
    509a5cb39019 ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
    2e1b17ec0423 ASoC: imx-card: use snd_pcm_format_t type for asrc_format
    8ea7f75b87fa ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
    78263868dbe5 ASoC: fsl-asoc-card: force cast the asrc_format type
    10961cbaea2a ASoC: fsl_asrc: force cast the asrc_format type
    b08c3473ee1e s390/zcore: fix race when reading from hardware system area
    f1415771f6a1 s390/crash: fix incorrect number of bytes to copy to user space
    2165fd2bae8a s390/maccess: fix semantics of memcpy_real() and its callers
    ceea1bc15310 s390/dump: fix old lowcore virtual vs physical address confusion
    3ea02fc5d488 perf tools: Fix dso_id inode generation comparison
    c7d4e6cdd14f iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
    facd31bbc799 mfd: max77620: Fix refcount leak in max77620_initialise_fps
    a8aa2a76eec7 mfd: t7l66xb: Drop platform disable callback
    0386a985a802 remoteproc: sysmon: Wait for SSCTL service to come up
    48042b342eae remoteproc: qcom: pas: Check if coredump is enabled
    3336e7c0767f proc: fix a dentry lock race between release_task and lookup
    f28e4d214839 lib/smp_processor_id: fix imbalanced instrumentation_end() call
    74824db8b2fa kfifo: fix kfifo_to_user() return type
    ece6cfe62a10 rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
    f543a9d19c29 MIPS: Fixed __debug_virt_addr_valid()
    8324649b0035 net: 9p: fix refcount leak in p9_read_work() error handling
    273c16d93f86 9p: Add client parameter to p9_req_put()
    3ac76cdab956 9p: Drop kref usage
    eb3eed52a77c 9p: fix a bunch of checkpatch warnings
    79f1a945bcaf iommu/exynos: Handle failed IOMMU device registration properly
    9a06340c9d95 serial: 8250_bcm7271: Save/restore RTS in suspend/resume
    3d69d86b3e9d ASoC: mt6359: Fix refcount leak bug
    1008e81163e8 swiotlb: fail map correctly with failed io_tlb_default_mem
    80f697b57f57 MIPS: vdso: Utilize __pa() for gic_pfn
    447e0f4be850 tty: n_gsm: fix missing corner cases in gsmld_poll()
    c94ea1a49eb8 tty: n_gsm: fix DM command
    fdcd4b065224 tty: n_gsm: fix wrong T1 retry count handling
    583cba5004f0 serial: 8250_fsl: Don't report FE, PE and OE twice
    79ed8856445b vfio/ccw: Do not change FSM state in subchannel event
    2ebb5a55d526 remoteproc: qcom: wcnss: Fix handling of IRQs
    fd3adcb84f7f ASoC: imx-card: Fix DSD/PDM mclk frequency
    7c69f70dc515 ASoC: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
    e46bc8cacdb6 tty: n_gsm: fix resource allocation order in gsm_activate_mux()
    c9754e10f1a5 tty: n_gsm: fix race condition in gsmld_write()
    a7fa41552407 tty: n_gsm: fix packet re-transmission without open control channel
    ace28afbc63f tty: n_gsm: fix non flow control frames during mux flow off
    dd37f6573878 tty: n_gsm: fix missing timer to handle stalled links
    1018139cbb48 tty: n_gsm: fix wrong queuing behavior in gsm_dlci_data_output()
    dfa9b6d34aac tty: n_gsm: fix tty registration before control channel open
    3c8d5fdca881 tty: n_gsm: fix user open not possible at responder until initiator open
    794604fbd716 tty: n_gsm: Delete gsmtty open SABM frame when config requester
    76385916d093 ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
    87b1a9175f08 powerpc/perf: Optimize clearing the pending PMI and remove WARN_ON for PMI check in power_pmu_disable
    b01b18cd3d92 ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
    0dc1663e3fc2 remoteproc: imx_rproc: Fix refcount leak in imx_rproc_addr_init
    f0c151602f9b profiling: fix shift too large makes kernel panic
    49929f3ee8d3 selftests/livepatch: better synchronize test_klp_callbacks_busy
    cf112a52d758 remoteproc: k3-r5: Fix refcount leak in k3_r5_cluster_of_init
    2a7d605d74a2 rpmsg: mtk_rpmsg: Fix circular locking dependency
    f061773b7b55 rpmsg: char: Add mutex protection for rpmsg_eptdev_open()
    c81935d0e056 ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
    a24bb7fe7bab ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
    372b49ba0775 serial: 8250_dw: Store LSR into lsr_saved_flags in dw8250_tx_wait_empty()
    ad7fd9f652bc serial: 8250: dma: Allow driver operations before starting DMA transfers
    f945b12e65c5 serial: 8250: Export ICR access helpers for internal use
    994f2edeeb21 ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
    542861e5e2fa ASoC: codecs: da7210: add check for i2c_add_driver
    7dee72b1bcec ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
    540c7b7385fb ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
    349242e6445a ASoC: imx-audmux: Silence a clang warning
    d69244d0ff1e ASoC: samsung: Fix error handling in aries_audio_probe
    1065c3853258 ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
    13741bb88a93 opp: Fix error check in dev_pm_opp_attach_genpd()
    0edd9f8d13a8 usb: cdns3: Don't use priv_dev uninitialized in cdns3_gadget_ep_enable()
    e62f79827784 jbd2: fix assertion 'jh->b_frozen_data == NULL' failure when journal aborted
    5f9c70833ba6 ext4: recover csum seed of tmp_inode after migrating to extents
    b0e1268a8efd jbd2: fix outstanding credits assert in jbd2_journal_commit_transaction()
    70f70d54f06b block: ensure iov_iter advances for added pages
    a24f05f7ced7 block/bio: remove duplicate append pages code
    54e5b14c9b7f nvme: catch -ENODEV from nvme_revalidate_zones again
    a3f6aeba670e nvme: don't return an error from nvme_configure_metadata
    92a6233585dc nvme: disable namespace access for unsupported metadata
    52cd55a4fb2d nvme: define compat_ioctl again to unbreak 32-bit userspace.
    34552bf35f91 nvme: use command_id instead of req->tag in trace_nvme_complete_rq()
    87e7ba8b0b5b null_blk: fix ida error handling in null_add_dev()
    06f39bc5a7e9 block/rnbd-srv: Set keep_id to true after mutex_trylock
    2ceeb04252e6 RDMA/rxe: Fix error unwind in rxe_create_qp()
    bfb54ad9581d RDMA/rxe: Remove the is_user members of struct rxe_sq/rxe_rq/rxe_srq
    66c735c9a747 RDMA/rxe: Add memory barriers to kernel queues
    931990c820bb RDMA/mlx5: Add missing check for return value in get namespace flow
    0911cadd4f59 of/fdt: declared return type does not match actual return type
    128eeac87618 selftests: kvm: set rax before vmcall
    9fc8d3bee714 mm/mmap.c: fix missing call to vm_unacct_memory in mmap_region
    622ef885a89a android: binder: stop saving a pointer to the VMA
    e60d7e2462bf RDMA/srpt: Fix a use-after-free
    e7e853cdde17 RDMA/srpt: Introduce a reference count in struct srpt_device
    ca120c04bfa8 RDMA/srpt: Duplicate port name members
    28621b38ac57 platform/olpc: Fix uninitialized data in debugfs write
    e389e927e8f1 KVM: nVMX: Set UMIP bit CR4_FIXED1 MSR when emulating UMIP
    ee890b463398 mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
    bfa020146858 usb: cdns3: change place of 'priv_ep' assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()
    477c95578c3a USB: serial: fix tty-port initialized comments
    2988443802fc HID: amd_sfh: Handle condition of "no sensors"
    0d265155501e PCI: tegra194: Fix link up retry sequence
    472db7de9ff5 PCI: tegra194: Fix Root Port interrupt handling
    e4adb10bc5c6 RDMA/rxe: For invalidate compare according to set keys in mr
    3695aa94d789 HID: alps: Declare U1_UNICORN_LEGACY support
    71fdd63bfdbc mmc: cavium-thunderx: Add of_node_put() when breaking out of loop
    209b5d06e989 mmc: cavium-octeon: Add of_node_put() when breaking out of loop
    022c8d3f45fc RDMA/rxe: Fix mw bind to allow any consumer key portion
    45382d69074a scripts/gdb: fix 'lx-dmesg' on 32 bits arch
    9227a870b8e2 scripts/gdb: lx-dmesg: read records individually
    3adcd80b5e10 dmaengine: imx-dma: Cast of_device_get_match_data() with (uintptr_t)
    118e05368e27 HID: amd_sfh: Add NULL check for hid device
    91443c669d28 HID: mcp2221: prevent a buffer overflow in mcp_smbus_write()
    eafb19c8fe04 gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
    e25b828553ae RDMA/hfi1: fix potential memory leak in setup_base_ctxt()
    5870343eabea clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
    c41664346aa6 iio: cros: Register FIFO callback after sensor is registered
    f6e26e1a5f60 RDMA/siw: Fix duplicated reported IW_CM_EVENT_CONNECT_REPLY event
    9fc44cfd1866 RDMA/hns: Fix incorrect clearing of interrupt status register
    7e647a8d5fc0 RDMA/qedr: Fix potential memory leak in __qedr_alloc_mr()
    f851d8097fd9 RDMA/rtrs-clt: Replace list_next_or_null_rr_rcu with an inline function
    527df029be34 RDMA/rtrs-clt: Rename rtrs_clt_sess to rtrs_clt_path
    bab17b761c89 RDMA/rtrs-srv: Rename rtrs_srv_sess to rtrs_srv_path
    f706fcd56858 RDMA/rtrs: Rename rtrs_sess to rtrs_path
    e44928f2db0f RDMA/rtrs: Do not allow sessname to contain special symbols / and .
    8b6dba78922d RDMA/rtrs: Introduce destroy_cq helper
    001f93b39ef7 RDMA/rtrs: Replace duplicate check with is_pollqueue helper
    9c663e73f556 RDMA/rtrs: Fix warning when use poll mode on client side.
    08ff62fff0b1 RDMA/rtrs-srv: Fix modinfo output for stringify
    b801e80e1162 RDMA/irdma: Fix setting of QP context err_rq_idx_valid field
    9f9ef6cb72a3 RDMA/irdma: Fix VLAN connection with wildcard address
    92520864ef9f RDMA/irdma: Fix a window for use-after-free
    62d610cfc16f um: random: Don't initialise hwrng struct with zero
    3bf1085657f8 interconnect: imx: fix max_node_id
    52537ea892a5 phy: stm32: fix error return in stm32_usbphyc_phy_init
    3f2989ed9570 eeprom: idt_89hpesx: uninitialized data in idt_dbgfs_csr_write()
    edd22e6ad249 usb: dwc3: qcom: fix missing optional irq warnings
    116540c1052e usb: dwc3: core: Do not perform GCTL_CORE_SOFTRESET during bootup
    92728470a952 usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
    4070f3c83cd2 usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
    120538461985 usb: gadget: udc: amd5536 depends on HAS_DMA
    7689427e238d xtensa: iss: fix handling error cases in iss_net_configure()
    758145c84fe1 xtensa: iss/network: provide release() callback
    c5641494cd7e scsi: smartpqi: Fix DMA direction for RAID requests
    80f876b26dab PCI: qcom: Set up rev 2.1.0 PARF_PHY before enabling clocks
    c968af565ca6 PCI/portdrv: Don't disable AER reporting in get_port_device_capability()
    81ea65c9aefe KVM: s390: pv: leak the topmost page table when destroy fails
    d795bbde3ff0 mmc: block: Add single read for 4k sector cards
    f8585cad6dea of: device: Fix missing of_node_put() in of_dma_set_restricted_buffer
    5325975c19e3 mmc: sdhci-of-at91: fix set_uhs_signaling rewriting of MC1R
    961d7d12080f memstick/ms_block: Fix a memory leak
    2b12af05848f memstick/ms_block: Fix some incorrect memory allocation
    125534d2591f mmc: renesas_sdhi: Get the reset handle early in the probe
    268afd446ace mmc: mxcmmc: Silence a clang warning
    352377cf7471 mmc: sdhci-of-esdhc: Fix refcount leak in esdhc_signal_voltage_switch
    e3a1eaea6631 staging: rtl8192u: Fix sleep in atomic context bug in dm_fsync_timer_callback
    2c254fe3c5fc binder: fix redefinition of seq_file attributes
    566887bad7ff intel_th: msu: Fix vmalloced buffers
    08ec393b1d30 intel_th: msu-sink: Potential dereference of null pointer
    9b5469573a27 intel_th: Fix a resource leak in an error handling path
    0b154b745d11 scsi: qla2xxx: Check correct variable in qla24xx_async_gffid()
    1a8cc2ed9547 PCI: endpoint: Don't stop controller when unbinding endpoint function
    5ab2782c944e dmaengine: sf-pdma: Add multithread support for a DMA channel
    ebea637e9f4b KVM: arm64: Don't return from void function
    250b46505175 soundwire: revisit driver bind/unbind and callbacks
    3abe387e759a soundwire: bus_type: fix remove and shutdown support
    06a949457a8d PCI: dwc: Always enable CDM check if "snps,enable-cdm-check" exists
    b03a8f1264ea PCI: dwc: Deallocate EPC memory on dw_pcie_ep_init() errors
    981f451f3708 PCI: dwc: Set INCREASE_REGION_SIZE flag based on limit address
    0f5e892c41b9 PCI: dwc: Disable outbound windows only for controllers using iATU
    68c2cda90522 PCI: dwc: Add unroll iATU space support to dw_pcie_disable_atu()
    dbbfb410a3dd PCI: dwc: Stop link on host_init errors and de-initialization
    44652154484e mm/mempolicy: fix get_nodes out of bound access
    0b9f2f2a0488 clk: qcom: clk-rcg2: Make sure to not write d=0 to the NMD register
    522e13ebbf48 clk: qcom: clk-rcg2: Fail Duty-Cycle configuration if MND divider is not enabled.
    433a22104012 clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
    123c76fbc2dd clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
    93ff4172b9b2 clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
    fd60d861624d clk: qcom: ipq8074: fix NSS port frequency tables
    7616ebecd358 clk: qcom: ipq8074: SW workaround for UBI32 PLL lock
    6f74519efa6a clk: qcom: ipq8074: fix NSS core PLL-s
    3b4934a635d9 RDMA/rxe: Fix deadlock in rxe_do_local_ops()
    dac3ecbd1ab8 usb: host: xhci: use snprintf() in xhci_decode_trb()
    26b305f01d62 clk: qcom: gcc-msm8939: Point MM peripherals to system_mm_noc clock
    d605b4125e77 clk: qcom: gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
    558b097f8cdb clk: qcom: gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
    0c787dfc2238 clk: qcom: gcc-msm8939: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
    9ed2640eb883 clk: qcom: clk-krait: unlock spin after mux completion
    733ab0c19bf1 driver core: fix potential deadlock in __driver_attach
    80169b136c89 misc: rtsx: Fix an error handling path in rtsx_pci_probe()
    30f44ddfdb49 clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
    2e79153d2ce9 mtd: dataflash: Add SPI ID table
    7837281f83bc dmaengine: dw-edma: Fix eDMA Rd/Wr-channels and DMA-direction semantics
    3e541526aab6 scsi: iscsi: Fix session removal on shutdown
    ca8936581506 scsi: iscsi: Add helper to remove a session from the kernel
    49f7414a1982 scsi: iscsi: Allow iscsi_if_stop_conn() to be called from kernel
    a78b882c1a9f mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv
    358fbfc1322b mwifiex: Ignore BTCOEX events from the 88W8897 firmware
    26cdeedbb616 KVM: Don't set Accessed/Dirty bits for ZERO_PAGE
    d56c5eac8476 mm/memremap: fix memunmap_pages() race with get_dev_pagemap()
    d18a9085654b memremap: remove support for external pgmap refcounts
    d1e0ceeec04a lib/test_hmm: avoid accessing uninitialized pages
    81b64a9da38f clk: mediatek: reset: Fix written reset bit offset
    31c1072e6b55 iio: accel: bma400: Reordering of header files
    363c82a63478 platform/chrome: cros_ec: Always expose last resume result
    95faac56051b iio: accel: bma400: Fix the scale min and max macro values
    17d7a36dcd46 scsi: qla2xxx: edif: Fix no logout on delete for N2N
    3db6a63bae5f scsi: qla2xxx: edif: Fix session thrash
    4c35b8eb3dc2 scsi: qla2xxx: edif: Tear down session if keys have been removed
    58277fa8333f scsi: qla2xxx: edif: Fix no login after app start
    1138e2da4244 scsi: qla2xxx: edif: Reduce disruption due to multiple app start
    cc5745f2ee40 scsi: qla2xxx: edif: Send LOGO for unexpected IKE message
    154bf040ba53 netfilter: xtables: Bring SPDX identifier back
    8cffaf09336b usb: xhci: tegra: Fix error check
    4240b6e0f3b3 usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()
    59026d5cc615 usb: ohci-nxp: Fix refcount leak in ohci_hcd_nxp_probe
    c0a4b454486b usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
    1e5ec5e90e77 fpga: altera-pr-ip: fix unsigned comparison with less than zero
    0675fe20da7f PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains()
    c99dca4ebc78 mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
    762475464982 mtd: parsers: ofpart: Fix refcount leak in bcm4908_partitions_fw_offset
    8ea607579d30 mtd: partitions: Fix refcount leak in parse_redboot_of
    1ef96afd4f5a mtd: sm_ftl: Fix deadlock caused by cancel_work_sync in sm_release
    8489a20ac481 HID: cp2112: prevent a buffer overflow in cp2112_xfer()
    879bcbbec3e0 PCI: tegra194: Fix PM error handling in tegra_pcie_config_ep()
    c0ad5c7e68d1 PCI: microchip: Fix refcount leak in mc_pcie_init_irq_domains()
    ff1e7aea3ef7 phy: samsung: exynosautov9-ufs: correct TSRV register configurations
    7840dce7966a KVM: SVM: Stuff next_rip on emulated INT3 injection if NRIPS is supported
    2adc7032ec84 KVM: SVM: Unwind "speculative" RIP advancement if INTn injection "fails"
    473ba2ee7641 scsi: qla2xxx: edif: Fix n2n login retry for secure device
    fd2c194089eb scsi: qla2xxx: edif: Fix n2n discovery issue with secure target
    ba051e1fe739 scsi: qla2xxx: edif: Add retry for ELS passthrough
    703e1ccf6ff9 scsi: qla2xxx: edif: Synchronize NPIV deletion with authentication application
    d7d254cc1348 scsi: qla2xxx: edif: Fix inconsistent check of db_flags
    aa7269ee63ec scsi: qla2xxx: edif: Reduce connection thrash
    7b2fbfa4b2cd scsi: qla2xxx: edif: Fix potential stuck session in sa update
    bf890f1408b2 scsi: qla2xxx: edif: Reduce Initiator-Initiator thrashing
    beb5bba5dd13 of: check previous kernel's ima-kexec-buffer against memory bounds
    098b7e83b318 mtd: rawnand: meson: Fix a potential double free issue
    d5730780e9ea mtd: maps: Fix refcount leak in ap_flash_init
    4d67c8f74d80 mtd: maps: Fix refcount leak in of_flash_probe_versatile
    f74bd76a7524 clk: renesas: r9a06g032: Fix UART clkgrp bitsel
    36c27d813e75 HID: amd_sfh: Don't show client init failed as error when discovery fails
    c36369f7db87 wireguard: allowedips: don't corrupt stack when detecting overflow
    73ccc2b153a2 wireguard: ratelimiter: use hrtimer in selftest
    1618e0f1ed59 net: usb: make USB_RTL8153_ECM non user configurable
    8890bdb93ff5 dccp: put dccp_qpolicy_full() and dccp_qpolicy_push() in the same lock
    d4249d465da3 net: ionic: fix error check for vlan flags in ionic_set_nic_features()
    857f390dfdac net: rose: fix netdev reference changes
    bde545304f3d netdevsim: Avoid allocation warnings triggered from user space
    c9d901e17142 iavf: Fix 'tc qdisc show' listing too many queues
    d70ecd933042 iavf: Fix max_rate limiting
    f1974d3042d6 wifi: rtw88: check the return value of alloc_workqueue()
    f671cf48f383 netdevsim: fib: Fix reference count leak on route deletion failure
    51dd6d3beb7f net: allow unbound socket for packets in VRF when tcp_l3mdev_accept set
    8fd69d3df9f4 ipv6: add READ_ONCE(sk->sk_bound_dev_if) in INET6_MATCH()
    68bf74ec95c3 inet: add READ_ONCE(sk->sk_bound_dev_if) in INET_MATCH()
    c8b1baca99cf crypto: hisilicon/sec - fix auth key size error
    996be53de07b crypto: inside-secure - Add missing MODULE_DEVICE_TABLE for of
    0d11ab3db14b crypto: hisilicon/hpre - don't use GFP_KERNEL to alloc mem during softirq
    e5697a0a4529 net/mlx5: Adjust log_max_qp to be 18 at most
    2d800deb8766 net/mlx5e: Fix the value of MLX5E_MAX_RQ_NUM_MTTS
    2109cba576c5 net/mlx5e: Remove WARN_ON when trying to offload an unsupported TLS cipher/version
    22ae7f434f1f media: cedrus: hevc: Add check for invalid timestamp
    d7365590d15b wifi: libertas: Fix possible refcount leak in if_usb_probe()
    4a40af2b0b95 wifi: iwlwifi: mvm: fix double list_add at iwl_mvm_mac_wake_tx_queue
    689e5caf63e9 wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`
    b50f5aa9f527 i2c: mux-gpmux: Add of_node_put() when breaking out of loop
    4fc616e25b66 i2c: cadence: Support PEC for SMBus block read
    aa6da8c32acb Bluetooth: hci_intel: Add check for platform_driver_register
    d1bedcd7947b can: pch_can: pch_can_error(): initialize errc before using it
    5793da4db3a9 can: error: specify the values of data[5..7] of CAN error frames
    3d70b6605a94 can: usb_8dev: do not report txerr and rxerr during bus-off
    bbe42d5dc486 can: kvaser_usb_leaf: do not report txerr and rxerr during bus-off
    0b328f9c7912 can: kvaser_usb_hydra: do not report txerr and rxerr during bus-off
    4b71a3c2a29c can: sun4i_can: do not report txerr and rxerr during bus-off
    dcfcd5fc999b can: hi311x: do not report txerr and rxerr during bus-off
    715ced011394 can: sja1000: do not report txerr and rxerr during bus-off
    b8c29e29059e can: rcar_can: do not report txerr and rxerr during bus-off
    ba0110c2dd03 can: pch_can: do not report txerr and rxerr during bus-off
    cbfcc7c4cc61 libbpf: fix an snprintf() overflow check
    ad3e3212492c selftests/bpf: fix a test for snprintf() overflow
    4388ea680346 wifi: p54: add missing parentheses in p54_flush()
    71fc0615c91e wifi: p54: Fix an error handling path in p54spi_probe()
    074e865b37da wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
    05f3b437c962 media: staging: media: hantro: Fix typos
    6b593bcc6e6d media: hevc: Embedded indexes in RPS
    223b977c1cd4 media: hantro: Simplify postprocessor
    9d36596b5f71 media: hantro: postproc: Fix motion vector space size
    b1385d437e90 media: cedrus: h265: Fix flag name
    f29659bad1d5 fs: check FMODE_LSEEK to control internal pipe splicing
    c9a8a448e5e4 bpf: Fix subprog names in stack traces.
    8ff5be75ae31 selftests: timers: clocksource-switch: fix passing errors from child
    4d3481398287 selftests: timers: valid-adjtimex: build fix for newer toolchains
    070527cc3124 libbpf: Fix the name of a reused map
    273c11d9a900 tcp: make retransmitted SKB fit into the send window
    68f9f522ddf1 drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.
    293c53b7dbf9 skmsg: Fix invalid last sg check in sk_msg_recvmsg()
    c4ff3cef5d96 mediatek: mt76: eeprom: fix missing of_node_put() in mt76_find_power_limits_node()
    f646d94d7aec mediatek: mt76: mac80211: Fix missing of_node_put() in mt76_led_init()
    2837f4e90b13 mt76: mt7921: enlarge maximum VHT MPDU length to 11454
    6e83b10d8c7a mt76: mt7921: fix aggregation subframes setting to HE max
    0fb9387b8584 ieee80211: add EHT 1K aggregation definitions
    67cd6261d38a mt76: mt7615: do not update pm stats in case of error
    f1609c4f4a21 mt76: mt76x02u: fix possible memory leak in __mt76x02u_mcu_send_msg
    1a63d33006dc drm/msm/dpu: Fix for non-visible planes
    340bfec294d5 drm/msm: Avoid dirtyfb stalls on video mode displays (v2)
    7404d09455a0 media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
    d6aee36c2f6f crypto: hisilicon - Kunpeng916 crypto driver don't sleep when in softirq
    aa495dfe7122 crypto: hisilicon/sec - don't sleep when in softirq
    f4e3a8c7e890 drm/msm/mdp5: Fix global state lock backoff
    693f31dc9156 net: hinic: avoid kernel hung in hinic_get_stats64()
    e850a4fc89b0 net: hinic: fix bug that ethtool get wrong stats
    8757ef67ce6b hinic: Use the bitmap API when applicable
    3052197b1175 drm: bridge: sii8620: fix possible off-by-one
    371331ede81d drm/mediatek: dpi: Only enable dpi after the bridge is enabled
    4f541100fb28 drm/mediatek: dpi: Remove output format of YUV
    23b1133bd33b drm/rockchip: Fix an error handling path rockchip_dp_probe()
    703d706b23ac drm/rockchip: vop: Don't crash for invalid duplicate_state()
    668fd740f8a6 selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0
    1fc6ba6d0dae crypto: arm64/gcm - Select AEAD for GHASH_ARM64_CE
    8dc3b5d150b2 drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
    bbb4c0deae82 drm/vc4: hdmi: Fix timings for interlaced modes
    6ffe6a64ef24 drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
    43d393e7cbb9 drm/vc4: hdmi: Avoid full hdmi audio fifo writes
    f30480775a6b drm/vc4: hdmi: Fix HPD GPIO detection
    07d7d4330403 drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable iteration
    21febebc4fcc drm/vc4: dsi: Fix dsi0 interrupt support
    b096779a8276 drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
    fe6ebdb61559 drm/vc4: dsi: Correct pixel order for DSI0
    62b6d4308c2c drm/vc4: dsi: Correct DSI divider calculations
    80e2db799b38 drm/vc4: dsi: Release workaround buffer and DMA
    3d722c01d628 drm/vc4: Use of_device_get_match_data()
    c653b2c6a247 drm/vc4: dsi: Switch to devm_drm_of_get_bridge
    ed486d15084f drm/bridge: Add a function to abstract away panels
    b6fea72ea1aa drm/vc4: plane: Fix margin calculations for the right/bottom edges
    645b294e9bf7 drm/vc4: plane: Remove subpixel positioning check
    0597bcf77489 media: tw686x: Fix memory leak in tw686x_video_init
    ad1a66b40bf8 media: driver/nxp/imx-jpeg: fix a unexpected return value problem
    db01d107c21f media: v4l2-mem2mem: prevent pollerr when last_buffer_dequeued is set
    7ca91b2d870f media: hdpvr: fix error value returns in hdpvr_read
    3123ae6fdd40 drm/mcde: Fix refcount leak in mcde_dsi_bind
    375a6fdf7d54 media: imx-jpeg: Disable slot interrupt when frame done
    54f1c0606695 drm: bridge: adv7511: Add check for mipi_dsi_driver_register
    f831d2882c84 crypto: ccp - During shutdown, check SEV data pointer before using
    8f458e34a804 test_bpf: fix incorrect netdev features
    621595f771a6 rcutorture: Fix ksoftirqd boosting timing and iteration
    489b93ac63d2 rcutorture: Don't cpuhp_remove_state() if cpuhp_setup_state() failed
    5a6ff3e32a0c rcutorture: Warn on individual rcu_torture_init() error conditions
    e32f8c51a650 drm/radeon: fix incorrrect SPDX-License-Identifiers
    88b551561ded wifi: iwlegacy: 4965: fix potential off-by-one overflow in il4965_rs_fill_link_cmd()
    03ca957c5f7b ath9k: fix use-after-free in ath9k_hif_usb_rx_cb
    ebde990e2436 media: imx-jpeg: Implement drain using v4l2-mem2mem helpers
    9ae2d729de63 media: imx-jpeg: Align upwards buffer size
    88355f7b682b media: imx-jpeg: Support dynamic resolution change
    07888b84f370 media: imx-jpeg: Handle source change in a function
    8fcbb2e91e26 media: imx-jpeg: Identify and handle precision correctly
    24eef33c384e media: imx-jpeg: Refactor function mxc_jpeg_parse
    cab2a15969d0 media: imx-jpeg: Set V4L2_BUF_FLAG_LAST at eos
    5709766b078a media: imx-jpeg: use NV12M to represent non contiguous NV12
    cbc257317106 media: imx-jpeg: Add pm-runtime support for imx-jpeg
    c0d98e53e921 media: imx-jpeg: Leave a blank space before the configuration data
    2c784c14938a media: imx-jpeg: Correct some definition according specification
    33196a7ac6fa media: tw686x: Register the irq at the end of probe
    f61c0d97bdc8 media: atmel: atmel-sama7g5-isc: fix warning in configs without OF
    85c317a626b8 crypto: sun8i-ss - fix infinite loop in sun8i_ss_setup_ivs()
    35927d7509ab i2c: Fix a potential use after free
    8b4bba610f52 can: netlink: allow configuring of fixed data bit rates without need for do_set_data_bittiming callback
    d9bd6a965908 can: netlink: allow configuring of fixed bit rates without need for do_set_bittiming callback
    ab5a4e0cbfe3 net: fix sk_wmem_schedule() and sk_rmem_schedule() errors
    d806f3ae4b3c crypto: sun8i-ss - fix error codes in allocate_flows()
    b3cb6006857c crypto: sun8i-ss - do not allocate memory when handling hash requests
    aeecc92f5a68 drm: adv7511: override i2c address of cec before accessing it
    72893aadc001 drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init
    ff0087df198d drm/shmem-helper: Pass GEM shmem object in public interfaces
    4109ff9e7b95 drm/shmem-helper: Export dedicated wrappers for GEM object functions
    a3f82087b768 drm/shmem-helper: Unexport drm_gem_shmem_create_with_handle()
    39caef09666c virtio-gpu: fix a missing check to avoid NULL dereference
    c3a1cfd16445 i2c: mxs: Silence a clang warning
    73778e237003 i2c: npcm: Correct slave role behavior
    cdd51152a100 i2c: npcm: Remove own slave addresses 2:10
    a42f0c4c64fe drm/bridge: lt9611uxc: Cancel only driver's work
    275fed7142ff drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
    e098989a9219 drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
    c901a385b7a1 drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
    87c251d960dc drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs
    2ec80289a7ff drm/mediatek: Modify dsi funcs to atomic operations
    deb603c5928e drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()
    166b0a6171ab ath11k: Fix incorrect debug_mask mappings
    2dc78843fe98 drm/mipi-dbi: align max_chunk to 2 in spi_transfer
    eaff3946a86f ath11k: fix netdev open race
    90b4ec83ef15 wifi: rtlwifi: fix error codes in rtl_debugfs_set_write_h2c()
    438ac9f4f7e4 drm/panel: Fix build error when CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
    c2af61bd0404 drm/st7735r: Fix module autoloading for Okaya RH128128T
    d2d2789fb956 ath10k: do not enforce interrupt trigger type
    037844355198 drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicated function
    3f4829cd4784 drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
    0491709eb3a6 pwm: lpc18xx: Fix period handling
    3475e55bc54d pwm: lpc18xx-sct: Simplify driver by not using pwm_[gs]et_chip_data()
    d0c79cda85b6 pwm: lpc18xx-sct: Reduce number of devm memory allocations
    009b384092ba pwm: sifive: Shut down hardware only after pwmchip_remove() completed
    53d784838a38 pwm: sifive: Ensure the clk is enabled exactly once per running PWM
    5c86cf45f551 pwm: sifive: Simplify offset calculation for PWMCMP registers
    87efb79c5f9e dm: return early from dm_pr_call() if DM device is suspended
    f28d733c318e thermal/tools/tmon: Include pthread and time headers in tmon.h
    226935eabe33 selftests/seccomp: Fix compile warning when CC=clang
    7bc43ab2b90a x86/extable: Fix ex_handler_msr() print condition
    b3d3069a6fc8 nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
    4125108ec842 drivers/perf: arm_spe: Fix consistency of SYS_PMSCR_EL1.CX
    9d2a0422dedc irqdomain: Report irq number for NOMAP domains
    a815cb1088e7 arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
    7c432710198e soc: qcom: Make QCOM_RPMPD depend on PM
    c9df8ff29009 regulator: of: Fix refcount leak bug in of_get_regulation_constraints()
    a638fa974512 dm writecache: count number of blocks discarded, not number of discard bios
    fc988f1ca265 dm writecache: count number of blocks written, not number of write bios
    3a2500b73a17 dm writecache: count number of blocks read, not number of read bios
    880c4513eb33 dm writecache: return void from functions
    764b8892d7da PM: domains: Ensure genpd_debugfs_dir exists before remove
    b4439abfd77e blktrace: Trace remapped requests correctly
    c1a21bf5d012 hwmon: (drivetemp) Add module alias
    415b4ce61308 spi: tegra20-slink: fix UAF in tegra_slink_remove()
    445fb9c19cf4 spi: Fix simplification of devm_spi_register_controller
    6d8e185bf9de blk-mq: don't create hctx debugfs dir until q->debugfs_dir is created
    1c350a597c2d erofs: avoid consecutive detection for Highmem memory
    a34982fd219e arm64: tegra: Fix SDMMC1 CD on P2888
    a7f751d4e830 arm64: tegra: Mark BPMP channels as no-memory-wc
    778b6531fe24 arm64: tegra: Update Tegra234 BPMP channel addresses
    09da10968581 arm64: tegra: Fixup SYSRAM references
    40d72c485a85 arm64: dts: mt7622: fix BPI-R64 WPS button
    759fa566f433 arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
    650d2e76a317 arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
    7847ebb6fcec arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
    c24bbe45965d ACPI: VIOT: Fix ACS setup
    273a7fbb06d6 drivers/iio: Remove all strcpy() uses
    335852f7a976 ACPI: APEI: explicit init of HEST and GHES in apci_init()
    6dc72d0181b4 arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
    1c84883e79a3 stack: Declare {randomize_,}kstack_offset to fix Sparse warnings
    4a020202c391 bus: hisi_lpc: fix missing platform_device_put() in hisi_lpc_acpi_probe()
    a0a9813f1e09 ARM: dts: qcom: pm8841: add required thermal-sensor-cells
    053543ac1d09 soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register
    84a928b44cb3 soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
    e89261b18c4e ARM: dts: qcom-msm8974: fix irq type on blsp2_uart1
    c1fdcd13a610 ACPI: APEI: Fix _EINJ vs EFI_MEMORY_SP
    fc6dbc57f9d1 regulator: qcom_smd: Fix pm8916_pldo range
    179034fb108e cpufreq: zynq: Fix refcount leak in zynq_get_revision
    78ed18a5aa7f arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
    0a8d15d85b19 arm64: dts: qcom: sdm630: fix gpu's interconnect path
    cd6bd95e9b02 arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
    9f3b0a0b87e6 arm64: dts: qcom: sdm630: disable GPU by default
    1bf747824a8c ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
    230ad40a59c9 ARM: OMAP2+: Fix refcount leak in omapdss_init_of
    ddad68dd9742 ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
    925a0117ac68 block: fix infinite loop for invalid zone append
    9abd50506fe4 soc: fsl: guts: machine variable might be unset
    4d6f33865e21 arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on trogdor
    e0067e6d5475 locking/lockdep: Fix lockdep_init_map_*() confusion
    5b418289b060 arm64: cpufeature: Allow different PMU versions in ID_DFR0_EL1
    c66b3b49fe03 arm64: select TRACE_IRQFLAGS_NMI_SUPPORT
    e94388f78e65 arm64: dts: mt8192: Fix idle-states entry-method
    2fe4c39aa379 arm64: dts: mt8192: Fix idle-states nodes naming scheme
    e50541493882 ARM: dts: ast2600-evb-a1: fix board compatible
    5f73deb9afa6 ARM: dts: ast2600-evb: fix board compatible
    6fa1cf1b92f0 ARM: dts: ast2500-evb: fix board compatible
    377a4c5cb7ab x86/pmem: Fix platform-device leak in error path
    5a73493f0d6a arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
    f370fbbd3151 soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
    cb119a1dd929 dt-bindings: iio: accel: Add DT binding doc for ADXL355
    7bbcbfbc314d scsi: hisi_sas: Use managed PCI functions
    c010048e3f71 soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
    e7e4f1cb915e ARM: dts: imx7d-colibri-emmc: add cpu1 supply
    4bd8bc5c77a0 ACPI: processor/idle: Annotate more functions to live in cpuidle section
    bc7f487395f2 ARM: bcm: Fix refcount leak in bcm_kona_smc_init
    1f4bc0604dff spi: spi-altera-dfl: Fix an error handling path
    ebbd1412ce4f arm64: dts: renesas: beacon: Fix regulator node names
    e21744c6a0d4 meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
    a7c16b8966d4 ARM: findbit: fix overflowing offset
    0ff7f81559fa spi: spi-rspi: Fix PIO fallback on RZ platforms
    8e3407e0f5e1 powerpc/64s: Disable stack variable initialisation for prom_init
    e45491556e2a drm/amdgpu: Remove one duplicated ef removal
    abd3622f657e kasan: test: Silence GCC 12 warnings
    7363a69d8ca8 selinux: Add boundary check in put_entry()
    c877c5217145 selinux: fix memleak in security_read_state_kernel()
    2f0e18e0db42 PM: hibernate: defer device probing when resuming from hibernation
    d68601914e00 hwmon: (sht15) Fix wrong assumptions in device remove callback
    fb98663448cb hwmon: (dell-smm) Add Dell XPS 13 7390 to fan control whitelist
    c5a73bd9f11a firmware: tegra: Fix error check return value of debugfs_create_file()
    c53d904973cb ARM: shmobile: rcar-gen2: Increase refcount for new reference
    ef94e7897744 arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
    3a4b3a0ff064 arm64: dts: qcom: ipq8074: fix NAND node name
    c0b8dcbaf37f ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
    01d539d9f538 ACPI: LPSS: Fix missing check in register_device_clock()
    30abb8735892 ACPI: PM: save NVS memory for Lenovo G40-45
    f450635d781f ACPI: EC: Drop the EC_FLAGS_IGNORE_DSDT_GPE quirk
    730b9eb8fb88 ACPI: EC: Remove duplicate ThinkPad X1 Carbon 6th entry from DMI quirks
    75f23d72b6e0 ARM: OMAP2+: pdata-quirks: Fix refcount leak bug
    a89a865dc9f0 ARM: OMAP2+: display: Fix refcount leak bug
    b856645c1849 spi: synquacer: Add missing clk_disable_unprepare()
    cbfe9a2303c8 ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
    e2d106b28460 ARM: dts: ux500: Fix Codina accelerometer mounting matrix
    ceafabd1d4ff ARM: dts: BCM5301X: Add DT for Meraki MR26
    0e4c38c795e7 ARM: dts: imx6ul: fix qspi node compatible
    95ba9c53999e ARM: dts: imx6ul: fix lcdif node compatible
    2db26fa7b9a1 ARM: dts: imx6ul: fix csi node compatible
    5357c3b24cfe ARM: dts: imx6ul: fix keypad compatible
    135155585647 ARM: dts: imx6ul: change operating-points to uint32-matrix
    ca367834a787 ARM: dts: imx6ul: add missing properties for sram
    8df06a275338 wait: Fix __wait_event_hrtimeout for RT/DL tasks
    f0d66189d161 irqchip/mips-gic: Check the return value of ioremap() in gic_of_init()
    f066e015821c sched/core: Always flush pending blk_plug
    f116c621dd1e genirq: GENERIC_IRQ_IPI depends on SMP
    00ffa95ed649 irqchip/mips-gic: Only register IPI domain when SMP is enabled
    f9842ec6839a genirq: Don't return error on missing optional irq_request_resources()
    079651c6cfdc sched/fair: Introduce SIS_UTIL to search idle CPU based on sum of util_avg
    96b18d3a1be0 ext2: Add more validity checks for inode counts
    add4bc9281e8 arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags"
    cc69ef95988b arm64: fix oops in concurrently setting insn_emulation sysctls
    42eede3ae05b arm64: Do not forget syscall when starting a new thread.
    d1e812beae86 arch: make TRACE_IRQFLAGS_NMI_SUPPORT generic
    932b5e65245c x86: Handle idle=nomwait cmdline properly for x86_idle
    9ccb5d391c51 epoll: autoremove wakers even more aggressively
    8a2df34b5bf6 netfilter: nf_tables: fix null deref due to zeroed list head
    257b944464be netfilter: nf_tables: do not allow RULE_ID to refer to another chain
    915015130169 netfilter: nf_tables: do not allow CHAIN_ID to refer to another table
    faafd9286f13 netfilter: nf_tables: do not allow SET_ID to refer to another table
    5ea18ddc1703 usb: dwc3: gadget: fix high speed multiplier setting
    332a8c027aa3 usb: dwc3: gadget: refactor dwc3_repare_one_trb
    f0782cf2dce0 arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC
    148a7fe3cdfc ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
    b76ea430e94f USB: HCD: Fix URB giveback issue in tasklet function
    269c917837c4 usb: typec: ucsi: Acknowledge the GET_ERROR_STATUS command completion
    b49b29ee113a coresight: Clear the connection field properly
    e41db8a9ce69 MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    db68d474cf09 powerpc/powernv: Avoid crashing if rng is NULL
    552a29e47174 powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
    79da7a5f8f0b powerpc/fsl-pci: Fix Class Code of PCIe Root Port
    fdf759059164 PCI: Add defines for normal and subtractive PCI bridges
    ae6620a39748 ia64, processor: fix -Wincompatible-pointer-types in ia64_get_irr()
    74d64284538e media: [PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
    ddc7fadd0504 mbcache: add functions to delete entry if unused
    1250557d3bf3 mbcache: don't reclaim used entries
    0f4d18cbea4a md-raid10: fix KASAN warning
    c5e4cdd44387 md-raid: destroy the bitmap after destroying the thread
    351ec3d68ce0 serial: mvebu-uart: uart2 error bits clearing
    ec8e701f9e20 fuse: ioctl: translate ENOSYS
    daa9cfb86221 fuse: limit nsec
    a54c509c32ad ksmbd: fix use-after-free bug in smb2_tree_disconect
    577619605556 ksmbd: prevent out of bound read for SMB2_TREE_CONNNECT
    dd4e4c811898 ksmbd: fix memory leak in smb2_handle_negotiate
    dead7f484a3b soundwire: qcom: Check device status before reading devid
    71bc3b75e941 scsi: qla2xxx: Zero undefined mailbox IN registers
    a659c7f8114d scsi: qla2xxx: Fix incorrect display of max frame size
    8c004b7dbb34 scsi: sg: Allow waiting for commands to complete on removed device
    fac589fb7646 iio: light: isl29028: Fix the warning in isl29028_remove()
    a76771da2156 iio: fix iio_format_avail_range() printing for none IIO_VAL_INT
    cac7ead0b3ab um: seed rng using host OS rng
    5d096e2dc20b um: Remove straying parenthesis
    2e88f5003399 mtd: rawnand: arasan: Update NAND bus clock instead of system clock
    2ffe64acf7d6 mtd: rawnand: arasan: Fix clock rate in NV-DDR
    89f3a8bbb4a7 btrfs: reject log replay if there is unsupported RO compat flag
    1f8ca9c40e62 bpf: Fix KASAN use-after-free Read in compute_effective_progs
    27f8f5219fe4 drm/amdgpu: fix check in fbdev init
    eb3c69c7c777 drm/amdgpu: Check BO's requested pinning domains against its preferred_domains
    f792acb67deb drm/nouveau/kms: Fix failure path for creating DP connectors
    67cb7be1561a drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from pm_runtime
    f522c189e465 drm/nouveau: Don't pm_runtime_put_sync(), only pm_runtime_put_autosuspend()
    dcf37f58827e drm/nouveau: fix another off-by-one in nvbios_addr
    2806b02bac9c drm/hyperv-drm: Include framebuffer and EDID headers
    97049e69f5a8 drm/vc4: hdmi: Disable audio if dmas property is present but empty
    8589a83c0ae9 drm/shmem-helper: Add missing vunmap on error
    da2a1aa058ac drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
    3ef94852bb33 rtc: rx8025: fix 12/24 hour mode detection on RX-8035
    bb3b601f1414 RISC-V: Add modules to virtual kernel memory layout dump
    150573c60c02 RISC-V: Fixup schedule out issue in machine_crash_shutdown()
    111a049cacc6 RISC-V: Fixup get incorrect user mode PC for kernel mode regs
    22ae2fe45516 RISC-V: kexec: Fixup use of smp_processor_id() in preemptible context
    63fbab985a16 dt-bindings: riscv: fix SiFive l2-cache's cache-sets
    c71e000db853 riscv:uprobe fix SR_SPIE set/clear handling
    7df75cbd1bec parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
    9b67131162dc parisc: Check the return value of ioremap() in lba_driver_probe()
    68949e725c39 parisc: Drop pa_swapper_pg_lock spinlock
    422421cbf39a parisc: Fix device names in /proc/iomem
    35ef2ee74d95 ovl: drop WARN_ON() dentry is NULL in ovl_encode_fh()
    f2a920daa780 crypto: ccp - Use kzalloc for sev ioctl interfaces to prevent kernel memory leak
    4228c037f88e fix short copy handling in copy_mc_pipe_to_iter()
    635fd8953e43 usbnet: Fix linkwatch use-after-free on disconnect
    d0d6186eae61 fbcon: Fix accelerated fbdev scrolling while logo is still shown
    c1e09ee98f3a fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
    06d6eb948e53 thermal: sysfs: Fix cooling_device_stats_setup() error code path
    cd28cf0f69b4 fs: Add missing umask strip in vfs_tmpfile
    5efc5b3baf13 vfs: Check the truncate maximum size in inode_newsize_ok()
    446f123aa602 tty: vt: initialize unicode screen buffer
    6b8d61a9fd96 ALSA: hda/realtek: Add a quirk for HP OMEN 15 (8786) mute LED
    7ad08c1e18c7 ALSA: hda/realtek: Add quirk for another Asus K42JZ model
    5d5b2d1d3663 ALSA: hda/cirrus - support for iMac 12,1 model
    e4b337fb82bf ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
    c840d626472e riscv: set default pm_power_off to NULL
    abedd69baf6e KVM: x86: revalidate steal time cache if MSR value changes
    77e26cdf5ced KVM: x86: do not report preemption if the steal time cache is stale
    69704ca43e08 KVM: x86: Tag kvm_mmu_x86_module_init() with __init
    439fcac3d0e0 KVM: nVMX: Always enable TSC scaling for L2 when it was enabled for L1
    14aebe952f86 KVM: x86: Set error code to segment selector on LLDT/LTR non-canonical #GP
    ccbf3f955ccd KVM: x86: Mark TSS busy during LTR emulation _after_ all fault checks
    2a117667f32f KVM: nVMX: Inject #UD if VMXON is attempted with incompatible CR0/CR4
    3868687afae1 KVM: nVMX: Account for KVM reserved CR4 bits in consistency checks
    76e6038cfa9b KVM: nVMX: Let userspace set nVMX MSR to any _host_ supported value
    9953f86a67e5 KVM: x86: Split kvm_is_valid_cr4() and export only the non-vendor bits
    aeb4c3e1c46f KVM: s390: pv: don't present the ecall interrupt twice
    6afe88fbb40e KVM: SVM: Don't BUG if userspace injects an interrupt with GIF=0
    1f27ca6534f3 KVM: nVMX: Snapshot pre-VM-Enter DEBUGCTL for !nested_run_pending case
    b69b7c1a0d21 KVM: nVMX: Snapshot pre-VM-Enter BNDCFGS for !nested_run_pending case
    5138b0f7cb5b HID: wacom: Don't register pad_input for touch switch
    c5ec7920b566 HID: wacom: Only report rotation for art pen
    109f0544a518 HID: hid-input: add Surface Go battery quirk
    e9ba81ee1cbd lockd: detect and reject lock arguments that overflow
    b437275e894b add barriers to buffer_uptodate and set_buffer_uptodate
    594f1b923813 wifi: mac80211_hwsim: use 32-bit skb cookie
    6b6ed18432ea wifi: mac80211_hwsim: add back erroneously removed cast
    879f766eaa31 wifi: mac80211_hwsim: fix race condition in pending packet
    14acf0290d2d ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
    196d8d34de95 ALSA: hda/realtek: Add quirk for Clevo NV45PZ
    64ca7f50ad96 ALSA: bcd2000: Fix a UAF bug on the error path of probing
    30e8b553e029 ALSA: usb-audio: Add quirk for Behringer UMC202HD
    6a463eb6dfcc nfsd: eliminate the NFSD_FILE_BREAK_* flags
    8eedc616f327 NFSD: Clean up the show_nf_flags() macro
    94d0dd56f817 pNFS/flexfiles: Report RDMA connection errors to the server
    661714de2403 scsi: Revert "scsi: qla2xxx: Fix disk failure to rediscover"
    3593f251f973 Revert "pNFS: nfs3_set_ds_client should set NFS_CS_NOPING"
    b6c05de137c3 x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments
    4c7ee827da2c Makefile: link with -z noexecstack --no-warn-rwx-segments

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 941ab942c1cb2cf984f1d2e27b73c566364c8f9e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 86682d7e96..f374fb593f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "00e089be37ae8128e25ad76999a742d30c94a8b2"
-SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
+SRCREV_machine ?= "cb561ee4438e5961e5c471eee8094737ca873135"
+SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.60"
+LINUX_VERSION ?= "5.15.62"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a5b499a239..f1b6f98c77 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.60"
+LINUX_VERSION ?= "5.15.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d340c7a79d7732c113a14bdaeafb8105518a7a1e"
-SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
+SRCREV_machine ?= "b708cb8412758a382516bdc46f26a0b43c50fb82"
+SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e951416173..26cdfb744a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4f44e132a6125375e0df478c554d7cdd2d9d2eef"
-SRCREV_machine:qemuarm64 ?= "a22cdb03286227fd857bf7fa2b300450731b5beb"
-SRCREV_machine:qemumips ?= "ec404ea5806c491da140012bc7e5079dd2de611d"
-SRCREV_machine:qemuppc ?= "5c3013acab557c83baede63b4cf0d93fb166910e"
-SRCREV_machine:qemuriscv64 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
-SRCREV_machine:qemuriscv32 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
-SRCREV_machine:qemux86 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
-SRCREV_machine:qemux86-64 ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
-SRCREV_machine:qemumips64 ?= "08ee7b823201d23f7fac7177fc3f00ce61e981bf"
-SRCREV_machine ?= "f832b2c67939eecf666126dcde686c50c3e8d358"
-SRCREV_meta ?= "d9823ca27110545274f77718aefbd809c29947e6"
+SRCREV_machine:qemuarm ?= "9b096ff3914926ac68501bf156c2d1368f3ebe6c"
+SRCREV_machine:qemuarm64 ?= "7cb30c5e95067ad12b7c4d371c048c7f5d5c922c"
+SRCREV_machine:qemumips ?= "3210fe826ade54d891cf2120c964d2a0dc3e7393"
+SRCREV_machine:qemuppc ?= "7bfdc3608327b9c471008af370dbffe053f5bed9"
+SRCREV_machine:qemuriscv64 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
+SRCREV_machine:qemuriscv32 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
+SRCREV_machine:qemux86 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
+SRCREV_machine:qemux86-64 ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
+SRCREV_machine:qemumips64 ?= "ef125626d718771f11fab19a3f91cca5ec27f887"
+SRCREV_machine ?= "14879dcc3ca7b24d8650cf117c380a94bb865f40"
+SRCREV_meta ?= "59c8898d450152a0875af340e6f0e72d05aafdfa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7217df81279835a7aee62a07aabb7b8fb8c766f2"
+SRCREV_machine:class-devupstream ?= "a0a7e0b2b8b22901945ea2aef1b65871d718accf"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.60"
+LINUX_VERSION ?= "5.15.62"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


