Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B96C38142
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:42:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.6248.1661305354398984523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PitOGZZg;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id w18so11669701qki.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pEu0s7JADRYkyd564S0mnfXEybqptqiTdfdJ2U/xQQo=;
        b=PitOGZZgfhUmtPKCuXVA9MWQdEllgCe1Bu/DbXkJt95FuUz72Cy5yNstt0a9aHE/6k
         TWdXnCXcqE4/ChcBPSALJUxM2+5eRSeZrNVflFT9q8ex0cDt2jmPFj+zeZhl9Z0YtUbz
         dxbC1nat9ldMBG+l/oZV8SEc09Xhh4fQgJobA6bwvP5OU2yGtYkggrg3cCJn0VI6GYj9
         B1qSgamE/0aGuaQpZqETT9DZI3DqhoRdQpoQ2iq1CSWdCZcrauNDhhSZGIDlzzqjEf6f
         tiWg/j8quiGdJl05ktHLxqGwRnI/wRU2Ed0un5HF9ppczEDv1eVEf3Zyz1QqaqN/JXgc
         V/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pEu0s7JADRYkyd564S0mnfXEybqptqiTdfdJ2U/xQQo=;
        b=vkDh1t53bm0sqMFEzDR5ZnNAnAXe5OzMhRmlmiDYTmaoRyY9iYKNRI9JYicZS+8ErU
         Eqy+InIl6kOV64EnDd14JJFOUHUk9dUAvS76jkGBexo4KW7PUGh2uiBoyl/ZvXlPx4F+
         iW5ZlJ3TpuFkNvKrcqYYu/6a4BrY5pTJoWL58PiBtao71nNCJEf0JwZaOK+jUyzw+dSa
         kpeKiGTqcgvvOW57Uo+y/Pqxayoi7GkKt7f6XItOPDC0G/0XdNwHekU+cJ14KsP53+yB
         h9cV6ceIObMobHMgRPT8dQzuybKXW+cES/53UuYmfP09Hw8qjpjBtrfo2ADVS/c45Kpi
         Basg==
X-Gm-Message-State: ACgBeo1w4prBcfV9Dr9G3uW4LyaCVtRZZrvmR3Qyve/2Mazfegnmf1Wu
	rOT5aZHpsNCFA428HHyFBE1t9DC4Vt4=
X-Google-Smtp-Source: 
 AA6agR7MUHcjxTs3HyTdiy10pCdd206wh3Df4voy8f05oefCbUSoP0YH2YmDhJd7/Pilotfu/FnelQ==
X-Received: by 2002:a05:620a:408e:b0:6a7:1815:a431 with SMTP id
 f14-20020a05620a408e00b006a71815a431mr17874757qko.551.1661305352616;
        Tue, 23 Aug 2022 18:42:32 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a454400b006bbe7ded98csm11110003qkp.112.2022.08.23.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:42:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.19: update to v5.19.3
Date: Tue, 23 Aug 2022 21:42:23 -0400
Message-Id: 
 <61e8bcb808f25527c83bf48d6692118f4a570047.1661305178.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1661305178.git.bruce.ashfield@gmail.com>
References: <cover.1661305178.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 01:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169772

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    bf44eed7f2fc Linux 5.19.3
    2d97167d5e37 arm64: kexec_file: use more system keyrings to verify kernel image signature
    6871b2590a0f kexec, KEYS: make the code in bzImage64_verify_sig generic
    9f2ba6f2c52b btrfs: raid56: don't trust any cached sector in __raid56_parity_recover()
    16a621aaba12 btrfs: only write the sectors in the vertical stripe which has data stripes
    c811c98718bc net_sched: cls_route: disallow handle of 0
    58c008d4d398 tee: add overflow check in register_shm_helper()
    daa821e54a74 Revert "mm: kfence: apply kmemleak_ignore_phys on early allocated pool"
    d49914ee4ec9 Linux 5.19.2
    95b05bd36fe0 vxlan: Use ip_tunnel_key flow flags in route lookups
    3229787d4ee8 geneve: Use ip_tunnel_key flow flags in route lookups
    49a407af0c52 ASoC: Intel: avs: Use lookup table to create modules
    8422e81ff42d Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm regression
    2905cd48c184 io_uring: mem-account pbuf buckets
    ee57f8bba811 powerpc/kexec: Fix build failure from uninitialised variable
    2f49bfbba326 Revert "s390/smp: enforce lowcore protection on CPU restart"
    bd27cff9db4f net: dsa: felix: fix min gate len calculation for tc when its first gate is closed
    4ee7e7dd1f99 tracing: Use a copy of the va_list for __assign_vstr()
    4c94e37453ea wifi: cfg80211: remove chandef check in cfg80211_cac_event()
    07f8ea3000f3 wifi: nl80211: acquire wdev mutex earlier in start_ap
    d94f6d845333 wifi: nl80211: relax wdev mutex check in wdev_chandef()
    05330210d279 wifi: nl80211: hold wdev mutex for tid config
    d658df243d3e wifi: cfg80211: handle IBSS in channel switch
    af37d2080c2a mptcp: refine memory scheduling
    d729f0ee99a3 Revert "devcoredump: remove the useless gfp_t parameter in dev_coredumpv and dev_coredumpm"
    2d03f321a589 Revert "mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv"
    cbfe2d7bbcb7 raw: fix a typo in raw_icmp_error()
    3476fa73bd0f raw: remove unused variables from raw6_icmp_error()
    3a6b9f357771 crypto: lib/blake2s - reduce stack frame usage in self test
    1d9f9dcd661f tcp: fix over estimation in sk_forced_mem_schedule()
    62ceb22d7770 Revert "drm/bridge: anx7625: Use DPI bus type"
    ee3f18d90e80 net_sched: cls_route: remove from list when handle is 0
    0e5ca33839fc powerpc64/ftrace: Fix ftrace for clang builds
    bb0be69e1da5 powerpc: Fix eh field when calling lwarx on PPC32
    8acd0e8d0360 xen-blkfront: Apply 'feature_persistent' parameter when connect
    f7a9a465a901 xen-blkback: Apply 'feature_persistent' parameter when connect
    59bb16373e49 xen-blkback: fix persistent grants negotiation
    9a0af34f6e49 tpm: Add check for Failure mode for TPM2 modules
    b75337943f42 tpm: eventlog: Fix section mismatch for DEBUG_SECTION_MISMATCH
    26ad6b0aef0c KEYS: asymmetric: enforce SM2 signature use pkey algo
    96fa141fa295 ext4: fix race when reusing xattr blocks
    0e7e91701e4e ext4: unindent codeblock in ext4_xattr_block_set()
    458aee4a6e5b ext4: remove EA inode entry from mbcache on inode eviction
    9d96996de0d2 ext4: make sure ext4_append() always allocates new block
    193fc6f0de44 ext4: check if directory block is within i_size
    ac5aca9a8085 Documentation: ext4: fix cell spacing of table heading on blockmap table
    fa6482f374fd ext4: fix warning in ext4_iomap_begin as race between bmap and write
    a5e274ec0a0c ext4: correct the misjudgment in ext4_iget_extra_inode
    a926d0b0fa3a ext4: correct max_inline_xattr_value_size computing
    52e6feee51b8 ext4: fix use-after-free in ext4_xattr_set_entry
    4cdc284ffadd ext4: add EXT4_INODE_HAS_XATTR_SPACE macro in xattr.h
    1d637e9b6374 ext4: fix extent status tree race in writeback error recovery path
    86f73cfa98b2 ext4: update s_overhead_clusters in the superblock during an on-line resize
    c0afc0d79d5e ext4: fix reading leftover inlined symlinks
    0ab3e0d31a4e tracing: Use a struct alignof to determine trace event field alignment
    b6679e3c90dd batman-adv: tracing: Use the new __vstring() helper
    cec22fc52922 hugetlb_cgroup: fix wrong hugetlb cgroup numa stat
    700aa4e11a3c mm/damon/reclaim: fix potential memory leak in damon_reclaim_init()
    3990e5b2be3d dm: fix dm-raid crash if md_handle_request() splits bio
    2a9faa704d83 dm raid: fix address sanitizer warning in raid_resume
    b4c6c07c92b6 dm raid: fix address sanitizer warning in raid_status
    f91b4038b636 KVM: nVMX: Attempt to load PERF_GLOBAL_CTRL on nVMX xfer iff it exists
    9863e9fc8ac2 KVM: VMX: Add helper to check if the guest PMU has PERF_GLOBAL_CTRL
    c08044267e79 Revert "KVM: x86/pmu: Accept 0 for absent PMU MSRs when host-initiated if !enable_pmu"
    6a74a619d5ec KVM: x86/pmu: Accept 0 for absent PMU MSRs when host-initiated if !enable_pmu
    d577d6f53610 KVM: x86/pmu: Ignore pmu->global_ctrl check if vPMU doesn't support global_ctrl
    979ec20a64d9 KVM: VMX: Mark all PERF_GLOBAL_(OVF)_CTRL bits reserved if there's no vPMU
    eb8f7dee28cc KVM: x86/pmu: Introduce the ctrl_mask value for fixed counter
    fc1f79039743 s390/unwind: fix fgraph return address recovery
    0a4dbde50754 powerpc/powernv/kvm: Use darn for H_RANDOM on Power9
    71fe2aff460e ACPI: CPPC: Do not prevent CPPC from working in the future
    725cbee29674 intel_idle: make SPR C1 and C1E be independent
    746118c58dff btrfs: join running log transaction when logging new name
    5022f4039a4d btrfs: zoned: wait until zone is finished when allocation didn't progress
    b6735eff2a6f btrfs: zoned: write out partially allocated region
    25934c5214ab btrfs: zoned: activate necessary block group
    407b66b662bb btrfs: zoned: activate metadata block group on flush_space
    33ed56fe558b btrfs: zoned: introduce space_info->active_total_bytes
    17aa1f2aa331 btrfs: store chunk size in space-info struct
    0f43e4fc06e0 btrfs: zoned: disable metadata overcommit for zoned
    f6ad412c647a btrfs: zoned: finish least available block group on data bg allocation
    615535d53153 btrfs: let can_allocate_chunk return error
    d798edf59909 btrfs: convert count_max_extents() to use fs_info->max_extent_size
    096e8eb9639b btrfs: replace BTRFS_MAX_EXTENT_SIZE with fs_info->max_extent_size
    506e8ae21936 btrfs: zoned: revive max_zone_append_bytes
    bf764bdc3728 block: add bdev_max_segments() helper
    3e36602adace btrfs: properly flag filesystem with BTRFS_FEATURE_INCOMPAT_BIG_METADATA
    ff04ffd79cba btrfs: reset block group chunk force if we have to wait
    9fff2b774e93 btrfs: fix error handling of fallback uncompress write
    e160aa87c87a btrfs: ensure pages are unlocked on cow_file_range() failure
    77cf0352146a btrfs: tree-log: make the return value for log syncing consistent
    0c9bb1acd1d1 block: don't allow the same type rq_qos add more than once
    b480d1e9a8c1 locking/csd_lock: Change csdlock_debug from early_param to __setup
    141c2785d940 timekeeping: contribute wall clock to rng on time change
    e2632767927e ARM: Marvell: Update PCIe fixup
    783bc69cc2e0 net/9p: Initialize the iounit field during fid creation
    e4dbe24f4bfd dm thin: fix use-after-free crash in dm_sm_register_threshold_callback
    351db9a03574 tracing/events: Add __vstring() and __assign_vstr() helper macros
    90bafcad8c28 kexec, KEYS, s390: Make use of built-in and secondary keyring for signature verification
    b302cdef14cc kexec: clean up arch_kexec_kernel_verify_sig
    08f7483635ae kexec_file: drop weak attribute from functions
    7c5917256d79 dm writecache: set a default MAX_WRITEBACK_JOBS
    374eece193d0 PCI: qcom: Power on PHY before IPQ8074 DBI register accesses
    54bc741a876c PCI/AER: Iterate over error counters instead of error strings
    c2304c50f4d9 iommu/vt-d: avoid invalid memory access via node_online(NUMA_NO_NODE)
    010fc77570b5 KVM: x86: Signal #GP, not -EPERM, on bad WRMSR(MCi_CTL/STATUS)
    4b9637cd89d9 KVM: set_msr_mce: Permit guests to ignore single-bit ECC errors
    cb604d1c53e6 intel_th: pci: Add Raptor Lake-S CPU support
    c0fd76f69b72 intel_th: pci: Add Raptor Lake-S PCH support
    03c14650165d intel_th: pci: Add Meteor Lake-P support
    4f2d7b46d6b5 firmware: arm_scpi: Ensure scpi_info is not assigned if the probe fails
    071b21aac789 crypto: blake2s - remove shash module
    6013ce2472f3 drm/mediatek: Keep dsi as LP00 before dcs cmds transfer
    03c8facf9dcb drivers/base: fix userspace break from using bin_attributes for cpumap and cpulist
    e622f144b624 csky: abiv1: Fixup compile error
    504090815c1a spmi: trace: fix stack-out-of-bound access in SPMI tracing functions
    6fc0b164bbc3 __follow_mount_rcu(): verify that mount_lock remains unchanged
    950ce0155696 Input: gscps2 - check return value of ioremap() in gscps2_probe()
    b2fc1723eb65 posix-cpu-timers: Cleanup CPU timers before freeing them during exec
    508b99039bc4 SMB3: fix lease break timeout when multiple deferred close handles for the same file.
    799e4f9aab80 x86/olpc: fix 'logical not is only applied to the left hand side'
    663cdda2716b x86/kprobes: Update kcb status flag after singlestepping
    7353c797f794 ftrace/x86: Add back ftrace_expected assignment
    4a1d77bafcbe x86/bugs: Enable STIBP for IBPB mitigated RETBleed
    b66227970875 cifs: fix lock length calculation
    b76d3c729ce0 scsi: qla2xxx: Fix losing FCP-2 targets during port perturbation tests
    326777057854 scsi: qla2xxx: Fix losing target when it reappears during delete
    11e9db717bf1 scsi: qla2xxx: Fix losing FCP-2 targets on long port disable with I/Os
    dc07af0e7c65 scsi: qla2xxx: Wind down adapter after PCIe error
    c3a824d061aa scsi: qla2xxx: Fix erroneous mailbox timeout after PCI error injection
    79b2ac420c3a scsi: qla2xxx: Fix excessive I/O error messages by default
    7dcd49c42b14 scsi: qla2xxx: Fix crash due to stale SRB access around I/O timeouts
    b16f0327fff2 scsi: qla2xxx: Turn off multi-queue for 8G adapters
    182726ce801f scsi: qla2xxx: Fix discovery issues in FC-AL topology
    bff616494e42 scsi: qla2xxx: Fix imbalance vha->vref_count
    484ca52c1ca2 scsi: zfcp: Fix missing auto port scan and thus missing target ports
    9e786e19303d scsi: ufs: core: Correct ufshcd_shutdown() flow
    e2d7cacc6a2a video: fbdev: s3fb: Check the size of screen before memset_io()
    2ce61c39c2a0 video: fbdev: arkfb: Check the size of screen before memset_io()
    c7a3f41e4b13 video: fbdev: vt8623fb: Check the size of screen before memset_io()
    6dab0119adcc f2fs: do not allow to decompress files have FI_COMPRESS_RELEASED
    68d27da7659d x86/entry: Build thunk_$(BITS) only if CONFIG_PREEMPTION=y
    302f7b0fc337 sched/core: Do not requeue task on CPU excluded from cpus_mask
    72f5b286d2b7 sched: Remove the limitation of WF_ON_CPU on wakelist if wakee cpu is idle
    31ef9288a593 sched: Fix the check of nr_running at queue wakelist
    035f2184fed3 tools/thermal: Fix possible path truncations
    15661642511b video: fbdev: arkfb: Fix a divide-by-zero bug in ark_set_pixclock()
    ee9463233a36 x86/numa: Use cpumask_available instead of hardcoded NULL check
    f56607b44c98 sched, cpuset: Fix dl_cpu_busy() panic due to empty cs->cpus_allowed
    32d8d832e31b powerpc/64e: Fix kexec build error
    4971147c5324 tty: serial: qcom-geni-serial: Fix %lu -> %u in print statements
    33d3905b22de scripts/faddr2line: Fix vmlinux detection on arm64
    cca32a4d21ee genelf: Use HAVE_LIBCRYPTO_SUPPORT, not the never defined HAVE_LIBCRYPTO
    3d7b948081a9 powerpc/pci: Fix PHB numbering when using opal-phbid
    866a978c7535 x86/bus_lock: Don't assume the init value of DEBUGCTLMSR.BUS_LOCK_DETECT to be zero
    16a544f1e013 kprobes: Forbid probing on trampoline and BPF code areas
    32adf0c85fa9 perf symbol: Fail to read phdr workaround
    af41cff4ada5 powerpc/cell/axon_msi: Fix refcount leak in setup_msi_msg_address
    79b8eae24b7e powerpc/xive: Fix refcount leak in xive_get_max_prio
    4288eb035ba4 powerpc/spufs: Fix refcount leak in spufs_init_isolated_loader
    ae497726cd09 cifs: Fix memory leak when using fscache
    e0a6bb00d110 f2fs: fix to remove F2FS_COMPR_FL and tag F2FS_NOCOMP_FL at the same time
    fdafb1b1f1c1 f2fs: fix to check inline_data during compressed inode conversion
    cf544749b65e f2fs: fix to invalidate META_MAPPING before DIO write
    e33096849473 perf stat: Revert "perf stat: Add default hybrid events"
    2afd4b24668d s390/smp: enforce lowcore protection on CPU restart
    7a7dc82fa441 tty: serial: fsl_lpuart: correct the count of break characters
    b820594fba89 tty: serial: qcom-geni-serial: Fix get_clk_div_rate() which otherwise could return a sub-optimal clock rate.
    b720d76cd36e serial: 8250_bcm2835aux: Add missing clk_disable_unprepare()
    b5de92e1bb7f selftests/powerpc: Fix matrix multiply assist test
    f35c7f506fb9 powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
    114ed51117be powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
    58942f672c6d pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window
    f762d98f0830 video: fbdev: offb: Include missing linux/platform_device.h
    39691e151e5e powerpc/32: Do not allow selection of e5500 or e6500 CPUs on PPC32
    fbe72bebba77 powerpc/32s: Fix boot failure with KASAN + SMP + JUMP_LABEL_FEATURE_CHECK_DEBUG
    e16c3ac0dc6b powerpc/32: Call mmu_mark_initmem_nx() regardless of data block mapping.
    e7da0b976474 ASoC: mchp-spdifrx: disable end of block interrupt on failures
    4a0ed3a0fbe3 video: fbdev: sis: fix typos in SiS_GetModeID()
    a88ab277cca9 video: fbdev: amba-clcd: Fix refcount leak bugs
    5529988d6ced ASoC: Intel: sof_rt5682: Perform quirk check first in card late probe
    cf9e5cc2a663 watchdog: armada_37xx_wdt: check the return value of devm_ioremap() in armada_37xx_wdt_probe()
    ee1fb8f75abe watchdog: sp5100_tco: Fix a memory leak of EFCH MMIO resource
    f52959044f79 watchdog: f71808e_wdt: Add check for platform_driver_register
    9a49540d29ca ASoC: audio-graph-card2: Add of_node_put() in fail path
    375613cc7b8d ASoC: audio-graph-card: Add of_node_put() in fail path
    d355da79bcdf fuse: Remove the control interface for virtio-fs
    f36974f93d00 ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
    19582e76b209 ASoC: imx-card: use snd_pcm_format_t type for asrc_format
    7a6270553520 ASoC: fsl_easrc: use snd_pcm_format_t type for sample_format
    cbb116843f29 ASoC: fsl-asoc-card: force cast the asrc_format type
    78bbb972d258 ASoC: fsl_asrc: force cast the asrc_format type
    a06d8ce519a0 perf test: Fix test case 83 ('perf stat CSV output linter') on s390
    22272ced5f8e s390/zcore: fix race when reading from hardware system area
    8108b1f01892 s390/crash: fix incorrect number of bytes to copy to user space
    951183192aa4 riscv: spinwait: Fix hartid variable type
    babbfc492c31 perf tools: Fix dso_id inode generation comparison
    fac821e8edea iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
    58031dde446e ASoC: amd: yc: Decrease level of error message
    a29c40814039 mfd: max77620: Fix refcount leak in max77620_initialise_fps
    d9384f4b9d53 mfd: t7l66xb: Drop platform disable callback
    bcc3c1780b27 remoteproc: sysmon: Wait for SSCTL service to come up
    1c4dca58bbb6 remoteproc: qcom: pas: Check if coredump is enabled
    233221d28453 proc: fix a dentry lock race between release_task and lookup
    80741a6a34a1 lib/smp_processor_id: fix imbalanced instrumentation_end() call
    438be61de8d2 kfifo: fix kfifo_to_user() return type
    11f6fec9a014 leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
    43e42c25a232 rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
    b976cd24e87f MIPS: Fixed __debug_virt_addr_valid()
    34b9a188557c net: 9p: fix refcount leak in p9_read_work() error handling
    c9d5188f5151 9p: Add client parameter to p9_req_put()
    2b38ea66703f 9p: Drop kref usage
    59cb621ace21 iommu/exynos: Handle failed IOMMU device registration properly
    fe831fcc9ab3 serial: 8250_bcm7271: Save/restore RTS in suspend/resume
    27e070151cd3 ASoC: SOF: ipc-msg-injector: fix copy in sof_msg_inject_ipc4_dfs_write()
    1e7fe6906e97 ASoC: mt6359: Fix refcount leak bug
    7a63a8c253bf ASoc: audio-graph-card2: Fix refcount leak bug in __graph_get_type()
    6d90c0829fe7 cpufreq: mediatek: fix error return code in mtk_cpu_dvfs_info_init()
    c2eddfcafcff ASoC: SOF: ipc3-topology: Prevent double freeing of ipc_control_data via load_bytes
    ee20cdbedeb2 lib/bitmap: fix off-by-one in bitmap_to_arr64()
    4e43ae1055c8 swiotlb: fail map correctly with failed io_tlb_default_mem
    4d9985f7935a ASoC: SOF: mediatek: fix mt8195 StatvectorSel wrong setting
    6712456b97a8 MIPS: vdso: Utilize __pa() for gic_pfn
    24578ae33973 tty: n_gsm: fix missing corner cases in gsmld_poll()
    96114c3b2695 tty: n_gsm: fix flow control handling in tx path
    e5e39b524473 tty: n_gsm: fix DM command
    9a5143207cad tty: n_gsm: fix wrong T1 retry count handling
    233be4375a88 serial: 8250_fsl: Don't report FE, PE and OE twice
    d4145731e3f8 ASoC: audio-graph-card2.c: use of_property_read_u32() for rate
    8c8d8ff76094 vfio/ccw: Do not change FSM state in subchannel event
    b9c7dddf384e vfio/ccw: Fix FSM state if mdev probe fails
    46580fbbc52c vfio/ccw: Remove UUID from s390 debug log
    606f14d93ac6 remoteproc: qcom: wcnss: Fix handling of IRQs
    0114dd51475c ASoC: imx-card: Fix DSD/PDM mclk frequency
    eaba8754c2d2 MIPS: Loongson64: Fix section mismatch warning
    fc90b34c227c ASoC: qcom: Fix missing of_node_put() in asoc_qcom_lpass_cpu_platform_probe()
    bd5f447061a1 tty: n_gsm: fix resource allocation order in gsm_activate_mux()
    7962a4b90009 tty: n_gsm: fix deadlock and link starvation in outgoing data path
    5320aa45f526 tty: n_gsm: fix race condition in gsmld_write()
    51556905dda5 tty: n_gsm: fix packet re-transmission without open control channel
    2012b064f989 tty: n_gsm: fix non flow control frames during mux flow off
    692e847a8e66 tty: n_gsm: fix missing timer to handle stalled links
    e5e1eed82338 tty: n_gsm: fix wrong queuing behavior in gsm_dlci_data_output()
    5e59c010c686 tty: n_gsm: fix tty registration before control channel open
    07a07c87c0d2 tty: n_gsm: fix user open not possible at responder until initiator open
    5e512be069fa net/ice: fix initializing the bitmap in the switch code
    bba6b12d73d3 vfio: Split migration ops from main device ops
    74b287716998 vfio/mlx5: Protect mlx5vf_disable_fds() upon close device
    8d201dedc793 ASoC: codecs: wsa881x: handle timeouts in resume path
    317a412812d8 serial: 8250_dw: Take port lock while accessing LSR
    1fbdfbaa3cc3 ASoC: samsung: change gpiod_speaker_power and rx1950_audio from global to static variables
    33a44de3fa19 ASoC: soc-core.c: fixup snd_soc_of_get_dai_link_cpus()
    7e83af3dd4a3 powerpc/perf: Optimize clearing the pending PMI and remove WARN_ON for PMI check in power_pmu_disable
    f2ed174e16c3 ASoC: samsung: h1940_uda1380: include proepr GPIO consumer header
    21c09fb18c5a selftests/powerpc: Skip energy_scale_info test on older firmware
    c29335612ff4 rpmsg: Fix possible refcount leak in rpmsg_register_device_override()
    4df1129d46a9 KVM: PPC: Book3s: Fix warning about xics_rm_h_xirr_x
    16da9f84e26f remoteproc: imx_rproc: Fix refcount leak in imx_rproc_addr_init
    55404cf49288 profiling: fix shift too large makes kernel panic
    36e594072bf2 selftests/livepatch: better synchronize test_klp_callbacks_busy
    3f83c4cf1b78 remoteproc: k3-r5: Fix refcount leak in k3_r5_cluster_of_init
    e0a25be0d4cc rpmsg: mtk_rpmsg: Fix circular locking dependency
    86f340c39bd0 rpmsg: char: Add mutex protection for rpmsg_eptdev_open()
    1618c25fb078 ASoC: cs35l45: Add endianness flag in snd_soc_component_driver
    4e2103e82f80 ASoC: codecs: wcd9335: move gains from SX_TLV to S8_TLV
    24d2d825cf87 ASoC: codecs: msm8916-wcd-digital: move gains from SX_TLV to S8_TLV
    f32d8cb34b94 ASoC: SOF: make ctx_store and ctx_restore as optional
    610a3a8a6ce2 serial: 8250_dw: Store LSR into lsr_saved_flags in dw8250_tx_wait_empty()
    3de3d9c97135 serial: 8250_dw: Use serial_lsr_in() in dw8250_handle_irq()
    4ac5b078741c serial: 8250: Get preserved flags using serial_lsr_in()
    623e3648c571 serial: 8250: Create serial_lsr_in()
    597bcd854aa3 serial: pic32: fix missing clk_disable_unprepare() on error in pic32_uart_startup()
    5ec83aa7a9e5 ASoC: mediatek: mt8173-rt5650: Fix refcount leak in mt8173_rt5650_dev_probe
    b32aa0f96070 ASoC: codecs: da7210: add check for i2c_add_driver
    38dc6faef05f ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
    db305f1c33d2 ASoC: max98390: use linux/gpio/consumer.h to fix build
    58567ed2878f ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
    94caca0bd221 ASoC: imx-audmux: Silence a clang warning
    daa1da970dc7 ASoC: samsung: Fix error handling in aries_audio_probe
    ca6c9244e6c9 ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
    426ac3e29201 opp: Fix error check in dev_pm_opp_attach_genpd()
    c50dd37d05ca usb: cdns3: Don't use priv_dev uninitialized in cdns3_gadget_ep_enable()
    ddd896792e17 jbd2: fix assertion 'jh->b_frozen_data == NULL' failure when journal aborted
    21197733e629 ext4: recover csum seed of tmp_inode after migrating to extents
    d65c93290045 jbd2: fix outstanding credits assert in jbd2_journal_commit_transaction()
    38fb0d7f39a1 block: ensure iov_iter advances for added pages
    70edccb32b60 block/bio: remove duplicate append pages code
    e731baf1af61 nvme: catch -ENODEV from nvme_revalidate_zones again
    32bf5d3c61f4 nvme: define compat_ioctl again to unbreak 32-bit userspace.
    4e8fee340f1f nvme: use command_id instead of req->tag in trace_nvme_complete_rq()
    ebe02fcbbe23 mtip32xx: fix device removal
    9502680c58d3 nbd: add missing definition of pr_fmt
    e11ad527774c null_blk: fix ida error handling in null_add_dev()
    bd629539b205 block/rnbd-srv: Set keep_id to true after mutex_trylock
    f05b7cf02123 RDMA/rxe: Fix error unwind in rxe_create_qp()
    5fd7eefeee9b RDMA/mlx5: Add missing check for return value in get namespace flow
    d6d4b5f13b88 of/fdt: declared return type does not match actual return type
    4ef616730a96 selftests: kvm: set rax before vmcall
    86dc66ace193 xen: don't require virtio with grants for non-PV guests
    e5f57aaccbd3 virtio: replace restricted mem access flag with callback
    b737d48db8fe rtla: Fix double free
    4927a4161caa rtla: Fix Makefile when called from -C tools/
    c6bc611f371d selftest/vm: uninitialized variable in main()
    8d958b635632 tools/testing/selftests/vm/hugetlb-madvise.c: silence uninitialized variable warning
    aa0d3fb4e853 selftests/vm: fix errno handling in mrelease_test
    28e414bd9d16 mm/mmap.c: fix missing call to vm_unacct_memory in mmap_region
    1ec3f76a436d android: binder: stop saving a pointer to the VMA
    388326bb1c32 RDMA/srpt: Fix a use-after-free
    7c448f82908e RDMA/srpt: Introduce a reference count in struct srpt_device
    5267f0490620 RDMA/srpt: Duplicate port name members
    239393040423 platform/olpc: Fix uninitialized data in debugfs write
    95ab0d267eee platform/mellanox: mlxreg-lc: Fix error flow and extend verbosity
    341dd8c53ea4 platform/x86: pmc_atom: Match all Lex BayTrail boards with critclk_systems DMI table
    385de404e2b1 tools/power/x86/intel-speed-select: Fix off by one check
    a2bcf7749013 KVM: nVMX: Set UMIP bit CR4_FIXED1 MSR when emulating UMIP
    6ae6abe24030 staging: fbtft: core: set smem_len before fb_deferred_io_init call
    56a7f5974f25 mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
    eb82c0382285 usb: cdns3: change place of 'priv_ep' assignment in cdns3_gadget_ep_dequeue(), cdns3_gadget_ep_enable()
    371a8af4f26e usb: xhci_plat_remove: avoid NULL dereference
    d293cf992a10 USB: serial: fix tty-port initialized comments
    e2e80c37e00d HID: amd_sfh: Handle condition of "no sensors"
    a0dfb4e7b28a PCI: tegra194: Fix link up retry sequence
    ebe2d576ce02 PCI: tegra194: Fix Root Port interrupt handling
    50bf45181c1d RDMA/rxe: Fix rnr retry behavior
    fca288d87f6f RDMA/rxe: For invalidate compare according to set keys in mr
    467a6c2e8e3d HID: alps: Declare U1_UNICORN_LEGACY support
    3d56b64a0669 mmc: cavium-thunderx: Add of_node_put() when breaking out of loop
    baad60b572da mmc: cavium-octeon: Add of_node_put() when breaking out of loop
    f22dc8bd31c4 mmc: core: quirks: Add of_node_put() when breaking out of loop
    2c5760339afa RDMA/rxe: Fix mw bind to allow any consumer key portion
    e5cee6187922 scripts/gdb: fix 'lx-dmesg' on 32 bits arch
    2b7d3d525eee dmaengine: imx-dma: Cast of_device_get_match_data() with (uintptr_t)
    7af0350b25d5 HID: amd_sfh: Add NULL check for hid device
    3c0f8a59f2cc HID: mcp2221: prevent a buffer overflow in mcp_smbus_write()
    b41b0bfdc983 iio: adc: max1027: unlock on error path in max1027_read_single_value()
    dd5e0e25fb39 gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
    a9055dfe437e RDMA/hfi1: fix potential memory leak in setup_base_ctxt()
    ebf55177909f clk: qcom: gcc-msm8939: Fix weird field spacing in ftbl_gcc_camss_cci_clk
    94d80c6d7017 clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled
    3f3ea0aeb261 clk: qcom: Drop mmcx gdsc supply for dispcc and videocc
    64f5669fa714 iio: cros: Register FIFO callback after sensor is registered
    8598b9d0a364 RDMA/rxe: Fix BUG: KASAN: null-ptr-deref in rxe_qp_do_cleanup
    1434de50a5d9 RDMA/siw: Fix duplicated reported IW_CM_EVENT_CONNECT_REPLY event
    94569c55422a RDMA/hns: Fix incorrect clearing of interrupt status register
    b4c9f7db9f01 RDMA/qedr: Fix potential memory leak in __qedr_alloc_mr()
    9890ddd4768b RDMA/rtrs-clt: Replace list_next_or_null_rr_rcu with an inline function
    a14aeefc9853 RDMA/rtrs-srv: Fix modinfo output for stringify
    c12c824822dc RDMA/irdma: Fix setting of QP context err_rq_idx_valid field
    f420fa0def47 RDMA/irdma: Fix VLAN connection with wildcard address
    350ac793a03c RDMA/irdma: Fix a window for use-after-free
    6cb78e41ce2e mm: percpu: use kmemleak_ignore_phys() instead of kmemleak_free()
    7974b2039c52 um: random: Don't initialise hwrng struct with zero
    9e3d119d5d6c KVM: arm64: Fix hypervisor address symbolization
    1be95546e822 interconnect: imx: fix max_node_id
    305a0aa6717d phy: rockchip-inno-usb2: Ignore OTG IRQs in host mode
    d29787a42e24 phy: stm32: fix error return in stm32_usbphyc_phy_init
    043dc5d046b2 eeprom: idt_89hpesx: uninitialized data in idt_dbgfs_csr_write()
    216055fa5e20 usb: dwc3: qcom: fix missing optional irq warnings
    e3cb5a27c6b2 usb: dwc3: core: Do not perform GCTL_CORE_SOFTRESET during bootup
    d0a97d94b7c3 usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
    3503305225ca usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
    8e8769e7fa79 usb: gadget: udc: amd5536 depends on HAS_DMA
    70cee09b16dc xtensa: iss: fix handling error cases in iss_net_configure()
    462a15a38345 xtensa: iss/network: provide release() callback
    e240328df6ad scsi: smartpqi: Fix DMA direction for RAID requests
    a86857e9d309 PCI: qcom: Set up rev 2.1.0 PARF_PHY before enabling clocks
    65e393fddc53 PCI/portdrv: Don't disable AER reporting in get_port_device_capability()
    63c71e83d5b6 KVM: s390: pv: leak the topmost page table when destroy fails
    ef892ef0831b mmc: block: Add single read for 4k sector cards
    dfca1e217298 of: device: Fix missing of_node_put() in of_dma_set_restricted_buffer
    98b2ddfa9471 mmc: sdhci-of-at91: fix set_uhs_signaling rewriting of MC1R
    39be95d1ff7b memstick/ms_block: Fix a memory leak
    8bb0c5a19f06 memstick/ms_block: Fix some incorrect memory allocation
    a42d829b7524 mmc: renesas_sdhi: Get the reset handle early in the probe
    e972c9f132f8 mmc: mxcmmc: Silence a clang warning
    8b902840f6a3 mmc: sdhci-of-esdhc: Fix refcount leak in esdhc_signal_voltage_switch
    517a64610929 dt-bindings: mmc: sdhci-msm: Fix issues in yaml bindings
    ca766e26941c habanalabs: fix double unlock on error in map_device_va()
    e76a9f680817 rtla/utils: Use calloc and check the potential memory allocation failure
    f10541e2d75d staging: rtl8192u: Fix sleep in atomic context bug in dm_fsync_timer_callback
    13ac27023f60 binder: fix redefinition of seq_file attributes
    4914c50670b6 intel_th: msu: Fix vmalloced buffers
    e1d427d46269 intel_th: msu-sink: Potential dereference of null pointer
    fae9da7d4c2c intel_th: Fix a resource leak in an error handling path
    8cc35cd5ae3a scsi: lpfc: Revert RSCN_MEMENTO workaround for misbehaved configuration
    873fb210f1c7 scsi: qla2xxx: Check correct variable in qla24xx_async_gffid()
    b7a75acd7343 phy: qcom-qmp: fix the QSERDES_V5_COM_CMN_MODE register
    81d54873b64b PCI: endpoint: Don't stop controller when unbinding endpoint function
    a93b3f1e1197 dmaengine: sf-pdma: Add multithread support for a DMA channel
    101e55e02cc8 KVM: arm64: Don't return from void function
    432b30f08ca3 soundwire: revisit driver bind/unbind and callbacks
    70ae9224e83b soundwire: bus_type: fix remove and shutdown support
    ccf4269bddbe PCI: dwc: Always enable CDM check if "snps,enable-cdm-check" exists
    3b453f5d06d1 PCI: dwc: Deallocate EPC memory on dw_pcie_ep_init() errors
    d71475e422e7 PCI: dwc: Set INCREASE_REGION_SIZE flag based on limit address
    36dbdb257b3f PCI: dwc: Disable outbound windows only for controllers using iATU
    e711668aae0f PCI: dwc: Add unroll iATU space support to dw_pcie_disable_atu()
    8b3d4d24fc86 PCI: dwc: Stop link on host_init errors and de-initialization
    14b1f65f2f3c phy: rockchip-inno-usb2: Sync initial otg state
    c49616d1f9cf phy: ti: tusb1210: Don't check for write errors when powering on
    d1b5113674c3 mm/mempolicy: fix get_nodes out of bound access
    02b8b1b5a98b kasan: fix zeroing vmalloc memory with HW_TAGS
    35530c163981 mm: introduce clear_highpage_kasan_tagged
    0a5f45aeca9f mm/migration: fix potential pte_unmap on an not mapped pte
    b39dbd9b674b mm/migration: return errno when isolate_huge_page failed
    42c3e36ee76e mm: rmap: use the correct parameter name for DEFINE_PAGE_VMA_WALK
    4a9f35b8729c kernfs: fix potential NULL dereference in __kernfs_remove
    a0c4d1ebfaee clk: qcom: clk-rcg2: Make sure to not write d=0 to the NMD register
    23526845a84b clk: qcom: clk-rcg2: Fail Duty-Cycle configuration if MND divider is not enabled.
    c29bc42790e8 clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
    5467cdf879c7 clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
    a86b76f573b9 clk: qcom: ipq8074: set BRANCH_HALT_DELAY flag for UBI clocks
    950d25e77894 clk: qcom: ipq8074: fix NSS port frequency tables
    abd86837d72e clk: qcom: ipq8074: SW workaround for UBI32 PLL lock
    2086f388fa9e clk: qcom: ipq8074: fix NSS core PLL-s
    0073eda15921 RDMA/rxe: Fix deadlock in rxe_do_local_ops()
    306541576306 RDMA/rxe: Add a responder state for atomic reply
    1dd6ea298dc6 usb: host: xhci: use snprintf() in xhci_decode_trb()
    8444b1369fef clk: qcom: gcc-msm8939: Point MM peripherals to system_mm_noc clock
    b410b931ff3d clk: qcom: gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
    f17eb596f9f7 clk: qcom: gcc-msm8939: Fix bimc_ddr_clk_src rcgr base address
    8a1f5c67422d clk: qcom: gcc-msm8939: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
    38b4908e767f usb: gadget: f_mass_storage: Make CD-ROM emulation works with Windows OS
    517ce24958f0 coresight: syscfg: Update load and unload operations
    471a84356c35 coresight: configfs: Fix unload of configurations on module exit
    9007c92c1b49 clk: qcom: clk-krait: unlock spin after mux completion
    37f908038402 driver core: fix potential deadlock in __driver_attach
    c4eb8f43965b misc: rtsx: Fix an error handling path in rtsx_pci_probe()
    18a32f18062b clk: qcom: camcc-sm8250: Fix halt on boot by reducing driver's init level
    864548b1ccdf mtd: dataflash: Add SPI ID table
    219f5478099c mtd: hyperbus: rpc-if: Fix RPM imbalance in probe error path
    43bfa481072d KVM: x86: Fix errant brace in KVM capability handling
    82f7fac052c3 dmaengine: dw-edma: Fix eDMA Rd/Wr-channels and DMA-direction semantics
    984be156c3b5 scsi: iscsi: Fix session removal on shutdown
    9bb43a58d195 scsi: iscsi: Add helper to remove a session from the kernel
    0ccf5a803820 scsi: iscsi: Allow iscsi_if_stop_conn() to be called from kernel
    c8e8b8b9f23a mwifiex: fix sleep in atomic context bugs caused by dev_coredumpv
    e6a4d422002b devcoredump: remove the useless gfp_t parameter in dev_coredumpv and dev_coredumpm
    2b1a324933bd KVM: selftests: Use vm_create_with_vcpus() in max_guest_memory_test
    5bb7f541d07d KVM: selftests: Convert s390x/diag318_test_handler away from VCPU_ID
    d225591d016b KVM: Don't set Accessed/Dirty bits for ZERO_PAGE
    e4aed16c42ad mm/memremap: fix memunmap_pages() race with get_dev_pagemap()
    7e71aafa652a lib/test_hmm: avoid accessing uninitialized pages
    6d8682d45df4 RDMA/rxe: fix xa_alloc_cycle() error return value check again
    5067b776620e clk: imx: clk-fracn-gppll: correct rdiv
    10348c6693b1 clk: imx: clk-fracn-gppll: Return rate in rate table properly in ->recalc_rate()
    e0fad1a5362c clk: imx: clk-fracn-gppll: fix mfd value
    c94e191f791a clk: imx93: correct nic_media parent
    bcf40bc61c2d clk: imx93: use adc_root as the parent clock of adc1
    9e969b0b91a8 clk: mediatek: reset: Fix written reset bit offset
    4fe070b5d5af iio: temp: maxim_thermocouple: Fix alignment for DMA safety
    4f7a71a85c8e iio: temp: max31865: Fix alignment for DMA safety
    114ffd465579 iio: temp: ltc2983: Fix alignment for DMA safety
    3af5ec85f49d iio: resolver: ad2s90: Fix alignment for DMA safety
    c00e752df981 iio: resolver: ad2s1200: Fix alignment for DMA safety
    59ee01f39242 iio: proximity: as3935: Fix alignment for DMA safety
    5179a573724f iio: potentiometer: mcp4131: Fix alignment for DMA safety
    51143f667527 iio: potentiometer: mcp41010: Fix alignment for DMA safety
    903e5ff430d6 iio: potentiometer: max5481: Fix alignment for DMA safety
    b39859bf3e10 iio: potentiometer: ad5272: Fix alignment for DMA safety
    669a1aca3274 iio: potentiometer: ad5110: Fix alignment for DMA safety
    ad602e334708 iio: imu: mpu6050: Fix alignment for DMA safety
    c5cf267aa73f iio: imu: inv_icm42600: Fix alignment for DMA safety in buffer code.
    bc0f8830ff2e iio: imu: inv_icm42600: Fix alignment for DMA safety
    750b892f6d08 iio: imu: fxos8700: Fix alignment for DMA safety
    48f034120d1e iio: gyro: fxas210002c: Fix alignment for DMA safety
    dd8e2a2b9f63 iio: gyro: adxrs450: Fix alignment for DMA safety
    d10b2c4c9a77 iio: gyro: adis16130: Fix alignment for DMA safety
    3caad4fd0e3e iio: gyro: adis16080: Fix alignment for DMA safety
    e525b3113395 iio: frequency: adrf6780: Fix alignment for DMA safety
    40e10f398c67 iio: frequency: admv4420: Fix alignment for DMA safety
    99994f124d9d iio: frequency: admv1014: Fix alignment for DMA safety
    817d7b7436ae iio: frequency: admv1013: Fix alignment for DMA safety
    ce119d7b5200 iio: frequency: adf4371: Fix alignment for DMA safety
    0d9ce7682d9a iio: frequency: adf4350: Fix alignment for DMA safety
    cc7b3068c795 iio: frequency: ad9523: Fix alignment for DMA safety
    33fcddee1999 iio: dac: ti-dac7612: Fix alignment for DMA safety
    d8aa41f4d8e6 iio: dac: ti-dac7311: Fix alignment for DMA safety
    450562e3d562 iio: dac: ti-dac5571: Fix alignment for DMA safety
    c8942b7c25d5 iio: dac: ti-dac082s085: Fix alignment for DMA safety
    7aa18f077fb0 iio: dac: mcp4922: Fix alignment for DMA safety
    21cd3bb91b1e iio: dac: ltc2688: Fix alignment for DMA safety
    8e23928dcb35 iio: dac: ad8801: Fix alignment for DMA safety
    1d62ff49669f iio: dac: ad7303: Fix alignment for DMA safety
    6819e3ac1aea iio: dac: ad7293: Fix alignment for DMA safety
    3b4f0dca7956 iio: dac: ad5791: Fix alignment for DMA saftey
    369235dc62c4 iio: dac: ad5770r: Fix alignment for DMA safety
    4d20fe3d45c1 iio: dac: ad5766: Fix alignment for DMA safety
    49713818d578 iio: dac: ad5764: Fix alignment for DMA safety
    c0c4bb0311b4 iio: dac: ad5761: Fix alignment for DMA safety
    2d3a77561c42 iio: dac: ad5755: Fix alignment for DMA safety
    3a5423cc991a iio: dac: ad5686: Fix alignment for DMA safety
    9748b6c196e8 iio: dac: ad5592r: Fix alignment for DMA safety
    cee702a2792d iio: dac: ad5504: Fix alignment for DMA safety
    2179debf1e24 iio: dac: ad5449: Fix alignment for DMA safety
    a0bc019a086e iio: dac: ad5421: Fix alignment for DMA safety
    9f7a41a64a4b iio: dac: ad5360: Fix alignment for DMA safety
    cec6ad48e0ad iio: dac: ad5064: Fix alignment for DMA safety
    465b1ba3c527 iio: common: ssp: Fix alignment for DMA safety
    dfa45bd7e092 iio: amplifiers: ad8366: Fix alignment for DMA safety
    5e6b52de1d4f iio: addac: ad74413r: Fix alignment for DMA safety
    aebea06fb01c iio: adc: ti-tlc4541: Fix alignment for DMA safety
    5e89d89ff310 iio: adc: ti-ads8688: Fix alignment for DMA safety
    24e662ec3171 iio: adc: ti-ads8344: Fix alignment for DMA safety
    4120691d18a9 iio: adc: ti-ads7950: Fix alignment for DMA safety
    0c27b6ca864a iio: adc: ti-ads131e08: Fix alignment for DMA safety
    6f0ef2b9d417 iio: adc: ti-ads124s08: Fix alignment for DMA safety
    43e9bfc827e4 iio: adc: ti-adc161s626: Fix alignment for DMA safety
    117923572e4a iio: adc: ti-adc128s052: Fix alignment for DMA safety
    f2755ff2152b iio: adc: ti-adc12138: Fix alignment for DMA safety
    98ac354ba4d6 iio: adc: ti-adc108s102: Fix alignment for DMA safety
    345f2fcfdcf1 iio: adc: ti-adc084s021: Fix alignment for DMA safety
    0de700a5d5f7 iio: adc: ti-adc0832: Fix alignment for DMA safety
    e60398422974 iio: adc: mcp320x: Fix alignment for DMA safety
    b4f25b4a89bb iio: adc: max1241: Fix alignment for DMA safety
    78904462780c iio: adc: max1118: Fix alignment for DMA safety
    24c3652d0036 iio: adc: max11100: Fix alignment for DMA safety
    68427acc936f iio: adc: max1027: Fix alignment for DMA safety
    f48a263998a6 iio: adc: ltc2497: Fix alignment for DMA safety
    0bd54a894e6a iio: adc: ltc2496: Fix alignment for DMA safety
    3ad6dfff2c98 iio: adc: hi8435: Fix alignment for DMA safety
    cfddd869daa1 iio: adc: ad7949: Fix alignment for DMA safety
    a221cace0356 iio: adc: ad7923: Fix alignment for DMA safety
    c97a60f0cca6 iio: adc: ad7887: Fix alignment for DMA safety
    c02e8accbadf iio: adc: ad7768-1: Fix alignment for DMA safety
    caf94260df34 iio: adc: ad7766: Fix alignment for DMA safety
    b724a7797dd7 iio: adc: ad7606: Fix alignment for DMA safety
    50d616f22859 iio: adc: ad7476: Fix alignment for DMA safety
    259dca64b269 iio: adc: ad7298: Fix alignment for DMA safety
    1c7097744e3a iio: adc: ad7292: Fix alignment for DMA safety
    891103bc83a8 iio: adc: ad7280a: Fix alignment for DMA safety
    5c07468ffea9 iio: adc: ad7266: Fix alignment for DMA safety
    83278867c4fd iio: accel: sca3300: Fix alignment for DMA safety
    a9c2ffa21e95 iio: accel: sca3000: Fix alignment for DMA safety
    9e004dc744f8 iio: accel: bma220: Fix alignment for DMA safety
    ab7828ae679e iio: accel: adxl367: Fix alignment for DMA safety
    f6cc98ecb494 iio: accel: adxl355: Fix alignment for DMA safety
    425e34d72cf1 iio: accel: adxl313: Fix alignment for DMA safety
    4fd60ffe4dba iio: core: Fix IIO_ALIGN and rename as it was not sufficiently large
    0b2a557a136b iio: accel: bma400: Add triggered buffer support
    f349ecf3ce13 iio: accel: bma400: conversion to device-managed function
    9158b263330b iio: accel: bma400: Reordering of header files
    f0205ca7df14 iio: sx9324: Fix register field spelling
    2cbdd3e2e597 platform/chrome: cros_ec: Always expose last resume result
    c2e83fa42a12 iio: accel: bma400: Fix the scale min and max macro values
    637e64b29672 scsi: qla2xxx: edif: Reduce N2N thrashing at app_start time
    412eb699641f scsi: qla2xxx: edif: Fix no logout on delete for N2N
    f65746b1cc30 scsi: qla2xxx: edif: Fix session thrash
    8f34bd281066 scsi: qla2xxx: edif: Tear down session if keys have been removed
    003389c2fb26 scsi: qla2xxx: edif: Fix no login after app start
    f95502bc5e52 scsi: qla2xxx: edif: Reduce disruption due to multiple app start
    ba6202e0dacd scsi: qla2xxx: edif: Send LOGO for unexpected IKE message
    a470dc3c0aff netfilter: xtables: Bring SPDX identifier back
    bec6ece7928f dmaengine: dw: dmamux: Fix build without CONFIG_OF
    29ed3385fc91 dmaengine: dw: dmamux: Export the module device table
    40aefcd2cbfc usb: xhci: tegra: Fix error check
    44de43152056 usb: host: ohci-at91: add support to enter suspend using SMC
    a9106aec8b54 usbip: vudc: Don't enable IRQs prematurely
    d9cf13108735 usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()
    50238c4b54c2 usb: ohci-nxp: Fix refcount leak in ohci_hcd_nxp_probe
    8bdff7d44665 usb: gadget: uvc: Fix comment blocks style
    960a8a35a602 usb: cdns3: fix random warning message when driver load
    3a50c917c67d usb: host: Fix refcount leak in ehci_hcd_ppc_of_probe
    e4974ae1bdcf fpga: altera-pr-ip: fix unsigned comparison with less than zero
    e593e22786ed PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains()
    23d4428145ce mtd: st_spi_fsm: Disable clock only after device was unregistered
    13e83bf26a33 mtd: st_spi_fsm: Warn about failure to unregister mtd device
    38a787294b92 mtd: spear_smi: Drop if with an always false condition
    5d7879ddc7a0 mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
    f9acee2cc310 mtd: spear_smi: Don't skip cleanup after mtd_device_unregister() failed
    01bc3840d943 mtd: parsers: ofpart: Fix refcount leak in bcm4908_partitions_fw_offset
    e24af43d0cbe mtd: partitions: Fix refcount leak in parse_redboot_of
    692c85c91846 mtd: sm_ftl: Fix deadlock caused by cancel_work_sync in sm_release
    26e427ac85c2 HID: cp2112: prevent a buffer overflow in cp2112_xfer()
    0a5d73184140 PCI: tegra194: Fix PM error handling in tegra_pcie_config_ep()
    880ece912b95 PCI: microchip: Fix refcount leak in mc_pcie_init_irq_domains()
    d4008e715f54 phy: samsung: exynosautov9-ufs: correct TSRV register configurations
    e1894c10009d KVM: x86/mmu: Drop RWX=0 SPTEs during ept_sync_page()
    4158829aaa64 KVM: SVM: Stuff next_rip on emulated INT3 injection if NRIPS is supported
    ec6c9a27b277 KVM: SVM: Unwind "speculative" RIP advancement if INTn injection "fails"
    bbafa6ea9c57 scsi: qla2xxx: edif: Fix n2n login retry for secure device
    2eba320770e2 scsi: qla2xxx: edif: Fix n2n discovery issue with secure target
    9f4230670199 scsi: qla2xxx: edif: Add retry for ELS passthrough
    8f5aa46923da scsi: qla2xxx: edif: Synchronize NPIV deletion with authentication application
    d2deafaef033 scsi: qla2xxx: edif: Fix potential stuck session in sa update
    47c7d335bc46 scsi: qla2xxx: edif: Add bsg interface to read doorbell events
    86facc271812 scsi: qla2xxx: edif: Wait for app to ack on sess down
    f02c787f7064 scsi: qla2xxx: edif: bsg refactor
    733008cbbd44 scsi: qla2xxx: edif: Reduce Initiator-Initiator thrashing
    1b2263d6c86f of: check previous kernel's ima-kexec-buffer against memory bounds
    a04c62f42a9a clk: renesas: rzg2l: Fix reset status function
    f1e715d4a457 mtd: rawnand: meson: Fix a potential double free issue
    babd7b012465 mtd: maps: Fix refcount leak in ap_flash_init
    f516fbb63873 mtd: maps: Fix refcount leak in of_flash_probe_versatile
    7e7963a5bd6e clk: renesas: r9a06g032: Fix UART clkgrp bitsel
    ec254dac7a40 HID: amd_sfh: Don't show client init failed as error when discovery fails
    cee111db30dc wireguard: allowedips: don't corrupt stack when detecting overflow
    953e57179462 wireguard: ratelimiter: use hrtimer in selftest
    13bd914aee08 net/mlx5e: xsk: Discard unaligned XSK frames on striding RQ
    af146dd5a20d net: usb: make USB_RTL8153_ECM non user configurable
    5fb702d5fa1a dccp: put dccp_qpolicy_full() and dccp_qpolicy_push() in the same lock
    abb489f0335d net: ionic: fix error check for vlan flags in ionic_set_nic_features()
    d6b6604f85ab net: ice: fix error NETIF_F_HW_VLAN_CTAG_FILTER check in ice_vsi_sync_fltr()
    bd26a6f32a8f net: rose: fix netdev reference changes
    17297bf246c0 netdevsim: Avoid allocation warnings triggered from user space
    2eda04bd9474 iavf: Fix 'tc qdisc show' listing too many queues
    289ef53d71ca iavf: Fix max_rate limiting
    8a79ab5706ce wifi: rtw88: check the return value of alloc_workqueue()
    ece188f236db netdevsim: fib: Fix reference count leak on route deletion failure
    fb3ef2bad4cf net: allow unbound socket for packets in VRF when tcp_l3mdev_accept set
    00b9a51766c8 crypto: hisilicon/sec - fix auth key size error
    0bab15d967f3 crypto: inside-secure - Add missing MODULE_DEVICE_TABLE for of
    afc385f3943c crypto: hisilicon/hpre - don't use GFP_KERNEL to alloc mem during softirq
    4294df137445 ax25: fix incorrect dev_tracker usage
    e43f83cea9b4 net/mlx5: Fix driver use of uninitialized timeout
    5097042888bb net/mlx5: DR, Fix SMFS steering info dump format
    b04871077d26 net/mlx5: Adjust log_max_qp to be 18 at most
    0edd855cde3d net/mlx5e: Modify slow path rules to go to slow fdb
    57dd18ed74e9 net/mlx5e: Fix calculations related to max MPWQE size
    e68e4ca1df01 net/mlx5e: xsk: Account for XSK RQ UMRs when calculating ICOSQ size
    0582154d7ce0 net/mlx5e: Fix the value of MLX5E_MAX_RQ_NUM_MTTS
    b84eb73fd899 net/mlx5e: TC, Fix post_act to not match on in_port metadata
    625fd7aebe64 net/mlx5e: Remove WARN_ON when trying to offload an unsupported TLS cipher/version
    d080c5c54839 drm/amd/display: fix signedness bug in execute_synaptics_rc_command()
    7e48502e84fc hantro: Remove incorrect HEVC SPS validation
    4f8e08e88e14 media: cedrus: hevc: Add check for invalid timestamp
    5b92f406a519 wifi: libertas: Fix possible refcount leak in if_usb_probe()
    182d3c1385f4 wifi: iwlwifi: mvm: fix double list_add at iwl_mvm_mac_wake_tx_queue
    409bd72e544f wifi: wil6210: debugfs: fix uninitialized variable use in `wil_write_file_wmi()`
    e52d86e075ad wifi: ath11k: Fix register write failure on QCN9074
    e6cf801a5d80 i2c: mux-gpmux: Add of_node_put() when breaking out of loop
    7d68cf80fc6d bpf: Fix bpf_xdp_pointer return pointer
    51622648d658 bpf: Set flow flag to allow any source IP in bpf_tunnel_key
    6bfa46d718db ip_tunnels: Add new flow flags field to ip_tunnel_key
    7470f4a1c204 btrfs: update stripe_sectors::uptodate in steal_rbio
    d238ff89bc19 i2c: qcom-geni: Use the correct return value
    e2c9b875ba1a i2c: cadence: Support PEC for SMBus block read
    c56eb69b46b5 Bluetooth: Add default wakeup callback for HCI UART driver
    9f923a641731 Bluetooth: hci_sync: Fix not updating privacy_mode
    8f3402853dc2 Bluetooth: hci_sync: Fix resuming scan after suspend resume
    a35f45f986a1 Bluetooth: mgmt: Fix refresh cached connection info
    3b3825557065 Bluetooth: When HCI work queue is drained, only queue chained work
    223633ddf2d1 Bluetooth: hci_intel: Add check for platform_driver_register
    2a2995950908 can: pch_can: pch_can_error(): initialize errc before using it
    bb628a2a5eb7 libbpf: Fix str_has_sfx()'s return value
    f4303216f452 can: error: specify the values of data[5..7] of CAN error frames
    3dafe5f6a00b can: usb_8dev: do not report txerr and rxerr during bus-off
    46968be06cd1 can: kvaser_usb_leaf: do not report txerr and rxerr during bus-off
    7f41778a7c9c can: kvaser_usb_hydra: do not report txerr and rxerr during bus-off
    d159bb5c2794 can: sun4i_can: do not report txerr and rxerr during bus-off
    f3d865a6b791 can: hi311x: do not report txerr and rxerr during bus-off
    fedf098ae2ec can: sja1000: do not report txerr and rxerr during bus-off
    076ead9a1274 can: rcar_can: do not report txerr and rxerr during bus-off
    ec232fbd49c7 can: pch_can: do not report txerr and rxerr during bus-off
    d43f85d3d0b8 libbpf: fix an snprintf() overflow check
    4a5ae176fd0b selftests/bpf: fix a test for snprintf() overflow
    20fd1c3156b5 libbpf: make RINGBUF map size adjustments more eagerly
    3c7256b880b3 bpf: fix potential 32-bit overflow when accessing ARRAY map element
    5b8a885e64ff drm/amdgpu: restore original stable pstate on ctx fini
    4caf84498f76 drm/amdgpu: use the same HDP flush registers for all nbio 2.3.x
    26e5339704e4 drm/amdgpu: use the same HDP flush registers for all nbio 7.4.x
    8e6da6afcec4 wifi: p54: add missing parentheses in p54_flush()
    a88db6a4e73b wifi: p54: Fix an error handling path in p54spi_probe()
    67470920cd3f wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
    fd98ca30211e media: cedrus: h265: Fix logic for not low delay flag
    dfacf78ed98c media: uapi: HEVC: Change pic_order_cnt definition in v4l2_hevc_dpb_entry
    78aed34aeb4f media: cedrus: h265: Fix flag name
    fd0a6e99b61e fs: check FMODE_LSEEK to control internal pipe splicing
    3614c1981fe2 media: ov7251: add missing disable functions on error in ov7251_set_power_on()
    09dca6896531 media: v4l: async: Also match secondary fwnode endpoints
    02653ba89f7e wifi: nl80211: acquire wdev mutex for dump_survey
    1f319b976560 bpf: Fix subprog names in stack traces.
    3693c9ee4556 selftests: timers: clocksource-switch: fix passing errors from child
    78834a56e844 selftests: timers: valid-adjtimex: build fix for newer toolchains
    7d69764fa344 kunit: executor: Fix a memory leak on failure in kunit_filter_tests
    0607c8e8c9b6 libbpf: Fix the name of a reused map
    53cc92e5406d tcp: make retransmitted SKB fit into the send window
    60e66074812d bpf, x86: fix freeing of not-finalized bpf_prog_pack
    7018bd9fac62 bpf, x64: Add predicate for bpf2bpf with tailcalls support in JIT
    1cbe7a02e702 drm/exynos/exynos7_drm_decon: free resources when clk_set_parent() failed.
    1295dae30f30 skmsg: Fix invalid last sg check in sk_msg_recvmsg()
    f61a2101028d mediatek: mt76: eeprom: fix missing of_node_put() in mt76_find_power_limits_node()
    d2aacdcc9fa2 mediatek: mt76: mac80211: Fix missing of_node_put() in mt76_led_init()
    c345cab0415e mt76: mt7615: fix throughput regression on DFS channels
    622bccfef40c mt76: mt7915: fix incorrect testmode ipg on band 1 caused by wmm_idx
    6fd0447b942e mt76: connac: move connac2_mac_write_txwi in mt76_connac module
    d53211a55a87 mt76: connac: move mac connac2 defs in mt76_connac2_mac.h
    6726332ec120 mt76: mt7915: rely on mt76_dev in mt7915_mac_write_txwi signature
    9c2ea17b56cc mt76: mt7921: rely on mt76_dev in mt7921_mac_write_txwi signature
    c477e2f2026b mt76: mt7921: enlarge maximum VHT MPDU length to 11454
    fe9038ec34d1 mt76: mt7921: fix aggregation subframes setting to HE max
    8a8660892edb mt76: mt7921s: fix possible sdio deadlock in command fail
    5158d8cda352 mt76: mt7921: do not update pm states in case of error
    5f43e826d7bb mt76: mt7615: do not update pm stats in case of error
    ec62ee418ec3 wifi: mac80211: move some future per-link data to bss_conf
    7a53ad13c091 wifi: cfg80211: do some rework towards MLO link APIs
    bdefcd8f5494 wifi: mac80211: reject WEP or pairwise keys with key ID > 3
    ae7411046481 mt76: mt7921: not support beacon offload disable command
    001614aa05c1 mt76: mt7921s: fix firmware download random fail
    2fe903bf69eb mt76: mt7915: fix endian bug in mt7915_rf_regval_set()
    2f53ba46d8c9 mt76: mt76x02u: fix possible memory leak in __mt76x02u_mcu_send_msg
    ae0d6b4fb32c mt76: mt7915: fix endianness in mt7915_rf_regval_get
    7496e06d0e6f media: amphion: only insert the first sequence startcode for vc1l format
    59dbfddc11aa media: amphion: sync buffer status with firmware during abort
    5597b3ab8661 media: hantro: Fix RK3399 H.264 format advertising
    44cdc161d9db media: hantro: Be more accurate on pixel formats step_width constraints
    34e14ee53310 media: amphion: defer setting last_buffer_dequeued until resolution changes are processed
    eff68a9e24c3 media: mediatek: vcodec: Initialize decoder parameters for each instance
    a891de07766c media: mediatek: vcodec: decoder: Drop max_{width,height} from mtk_vcodec_ctx
    3bbdbc394f34 media: mediatek: vcodec: decoder: Skip alignment for default resolution
    3bfbe29952be media: mediatek: vcodec: decoder: Fix resolution clamping in TRY_FMT
    325d2362cd86 media: mediatek: vcodec: decoder: Fix 4K frame size enumeration
    2090efd15725 media: atomisp: revert "don't pass a pointer to a local variable"
    8516d329dca4 drm/msm/dpu: Fix for non-visible planes
    70b148acab70 media: amphion: release core lock before reset vpu core
    4b8d0fa094ae media: platform: mtk-mdp: Fix mdp_ipi_comm structure alignment
    a14dede1f9ad crypto: hisilicon - Kunpeng916 crypto driver don't sleep when in softirq
    c9be45e4c69f crypto: hisilicon/sec - don't sleep when in softirq
    69d05f0a4b1d drm/radeon: avoid bogus "vram limit (0) must be a power of 2" warning
    0b07f28c23ff drm/msm/mdp5: Fix global state lock backoff
    dc74006c10ac libbpf, riscv: Use a0 for RC register
    9c8b3f05fb18 drm/msm: Avoid unclocked GMU register access in 6xx gpu_busy
    e2be585bc9ac drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
    3ba59bbe4f30 net: hinic: avoid kernel hung in hinic_get_stats64()
    d6423b405c42 net: hinic: fix bug that ethtool get wrong stats
    7784a5b64200 hinic: Use the bitmap API when applicable
    c999b92841be net: dsa: felix: build as module when tc-taprio is module
    76a2e36b9f2d net: sched: provide shim definitions for taprio_offload_{get,free}
    09ecee270c8b drm/msm: Fix fence rollover issue
    7d25a310048c drm: bridge: sii8620: fix possible off-by-one
    9ff0274708fc drm/msm/hdmi: fill the pwr_regs bulk regulators
    829871d24285 drm/msm/dpu: remove hard-coded linewidth limit for writeback
    62c31466c867 drm/msm/dpu: fix maxlinewidth for writeback block
    4adb1c10124b drm/msm/dpu: move intf and wb assignment to dpu_encoder_setup_display()
    ecbc7aa0d6df drm/mediatek: dpi: Only enable dpi after the bridge is enabled
    37157c7be48c drm/mediatek: dpi: Remove output format of YUV
    295d7518d788 drm/rockchip: Fix an error handling path rockchip_dp_probe()
    4d8f078e12a8 drm/rockchip: vop: Don't crash for invalid duplicate_state()
    c5ca18956420 selftests: net: fib_rule_tests: fix support for running individual tests
    03ddc692424a net: dsa: felix: drop oversized frames with tc-taprio instead of hanging the port
    5d92f062ff1c net: dsa: felix: keep reference on entire tc-taprio config
    a168d6cb2d33 net: dsa: felix: update base time of time-aware shaper when adjusting PTP time
    998b1428772a selftests/xsk: Destroy BPF resources only when ctx refcount drops to 0
    5242f2230d9f crypto: arm64/gcm - Select AEAD for GHASH_ARM64_CE
    b613fba57f3b mm: Account dirty folios properly during splits
    392dea95fc80 drm/vc4: hdmi: Move pixel doubling from Pixelvalve to HDMI block
    ad1c50bd181f drm/vc4: hdmi: Correct HDMI timing registers for interlaced modes
    a868c2473053 drm/vc4: hdmi: Force modeset when bpc or format changes
    f04bdc1f9862 drm/vc4: hdmi: Fix timings for interlaced modes
    b1a412c12da6 drm/vc4: hdmi: Move HDMI reset to pm_resume
    0241244456c1 drm/vc4: hdmi: Switch to pm_runtime_status_suspended
    6ecd49a51e4b drm/vc4: hdmi: Reset HDMI MISC_CONTROL register
    6f2955c531e1 drm/vc4: hdmi: Avoid full hdmi audio fifo writes
    700768082770 drm/vc4: hdmi: Clear unused infoframe packet RAM registers
    f70c25cf34f9 drm/vc4: hdmi: Add all the vc5 HDMI registers into the debugfs dumps
    d84e417fa743 drm/vc4: dsi: Add correct stop condition to vc4_dsi_encoder_disable iteration
    31878b91b753 drm/vc4: dsi: Fix dsi0 interrupt support
    8c43f2a534a6 drm/vc4: dsi: Register dsi0 as the correct vc4 encoder type
    cfb936735c5b drm/vc4: dsi: Correct pixel order for DSI0
    97f9d7fa0946 drm/vc4: dsi: Correct DSI divider calculations
    a4b21735d272 drm/vc4: dsi: Release workaround buffer and DMA
    d5ab3cf69249 drm/vc4: plane: Fix margin calculations for the right/bottom edges
    ea86677f8bb7 drm/vc4: plane: Remove subpixel positioning check
    0ed01803cc93 drm/vc4: kms: Use maximum FIFO load for the HVS clock rate
    5d51e861e9a6 media: mediatek: vcodec: Fix non subdev architecture open power fail
    8b412db51db2 media: tw686x: Fix memory leak in tw686x_video_init
    f560b10b148e media: driver/nxp/imx-jpeg: fix a unexpected return value problem
    d65abbfa6914 media: mediatek: vcodec: Skip SOURCE_CHANGE & EOS events for stateless
    1db89ef68622 media: mediatek: vcodec: Initialize decoder parameters after getting dec_capability
    14bc7f8081a8 media: sta2x11: remove VIRT_TO_BUS dependency
    fc43574e0690 media: v4l2-mem2mem: prevent pollerr when last_buffer_dequeued is set
    d27fed11f40f media: hdpvr: fix error value returns in hdpvr_read
    32c827e30bb4 drm/mcde: Fix refcount leak in mcde_dsi_bind
    08baa39c2a2e media: amphion: output firmware error message
    cea1fefd18f5 media: imx-jpeg: Disable slot interrupt when frame done
    c1e951701992 drm: bridge: adv7511: Add check for mipi_dsi_driver_register
    d87bbd10fc01 crypto: ccp - During shutdown, check SEV data pointer before using
    91d120d579e2 selftests/bpf: Fix rare segfault in sock_fields prog test
    b7960089439a drm/display: Fix build error without CONFIG_OF
    6593952d5803 test_bpf: fix incorrect netdev features
    7e7472c62c6d rcutorture: Fix ksoftirqd boosting timing and iteration
    e887a99b380c torture: Adjust to again produce debugging information
    ca456c5104d4 drm/amdkfd: correct sdma queue number of sdma 6.0.1
    8530292afa33 drm/amd: Don't show warning on reading vbios values for SMU13 3.1
    35a59aee04e9 drm/radeon: fix incorrrect SPDX-License-Identifiers
    5abc81a138f8 wifi: rtw89: 8852a: rfk: fix div 0 exception
    b7c39b1a3d4b wifi: iwlegacy: 4965: fix potential off-by-one overflow in il4965_rs_fill_link_cmd()
    cf8d8810f2e2 wifi: mac80211: set STA deflink addresses
    b66ebac40f64 ath9k: fix use-after-free in ath9k_hif_usb_rx_cb
    488b371e46b7 media: rcar-vin: Fix channel routing for Ebisu
    9d6ee9fbb5c7 media: imx-jpeg: Implement drain using v4l2-mem2mem helpers
    447795ffb17c media: imx-jpeg: Align upwards buffer size
    81fd8e69a689 media: imx-jpeg: Leave a blank space before the configuration data
    111dac25a0bc media: imx-jpeg: Correct some definition according specification
    9e4c0afd0d07 media: Hantro: Correct G2 init qp field
    4c33a0d48eb1 media: amphion: return error if format is unsupported by vpu
    d0b9fbe94735 media: tw686x: Register the irq at the end of probe
    19923b72e0c4 media: camss: csid: fix wrong size passed to devm_kmalloc_array()
    b3db99b49097 media: atmel: atmel-sama7g5-isc: fix warning in configs without OF
    a28d77fe77e6 raw: Fix mixed declarations error in raw_icmp_error().
    04309b5f5d8d raw: convert raw sockets to RCU
    b5c20b86717e raw: use more conventional iterators
    de3d723a3985 ping: convert to RCU lookups, get rid of rwlock
    203a26661e37 net: ag71xx: fix discards 'const' qualifier warning
    c402b8d5d304 crypto: sun8i-ss - fix infinite loop in sun8i_ss_setup_ivs()
    6e51cce3d940 tcp: fix possible freeze in tx path under memory pressure
    f2a3adbc620c selftests/bpf: Don't force lld on non-x86 architectures
    91aab9683578 libbpf: Fix internal USDT address translation logic for shared libraries
    12b0606000d0 i2c: Fix a potential use after free
    56a1d1be57b9 drm/bridge: it6505: Add missing CRYPTO_HASH dependency
    dbe871e3fe6a drm/bridge: anx7625: Zero error variable when panel bridge not present
    098f8dd9894c can: netlink: allow configuring of fixed data bit rates without need for do_set_data_bittiming callback
    08f8288fc254 drm/vkms: check plane_composer->map[0] before using it
    ee746ecf1011 can: netlink: allow configuring of fixed bit rates without need for do_set_bittiming callback
    edf73dbfcfa1 net: fix sk_wmem_schedule() and sk_rmem_schedule() errors
    2e1b1aa1cd82 crypto: sun8i-ss - fix a NULL vs IS_ERR() check in sun8i_ss_hashkey
    0fdb5f86e75f crypto: sun8i-ss - Fix error codes for dma_mapping_error()
    6a38eb8fbb90 crypto: sun8i-ss - fix error codes in allocate_flows()
    524d11a5b488 drm: adv7511: override i2c address of cec before accessing it
    e9d04d1c8db3 libbpf: Fix uprobe symbol file offset calculation logic
    0cde00c48ea2 drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init
    367882a5a944 virtio-gpu: fix a missing check to avoid NULL dereference
    bf38b1eee1bf i2c: mxs: Silence a clang warning
    4ff1ee4c509d i2c: npcm: Correct slave role behavior
    261aeadc7be4 i2c: npcm: Remove own slave addresses 2:10
    308d0d5d98c2 drm/amdgpu/display: Prepare for new interfaces
    3262e5c7523b drm/amdgpu: fix scratch register access method in SRIOV
    2a71a3574fd1 drm/bridge: lt9611uxc: Cancel only driver's work
    013e67e7dd89 drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
    bb5ac08d5bd8 drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
    69d9b8b59e3b drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff function
    3185bbeb5c0e drm/mediatek: Separate poweron/poweroff from enable/disable and define new funcs
    ae5ed32c8e91 drm/mediatek: Modify dsi funcs to atomic operations
    9faff03617af drm/radeon: fix potential buffer overflow in ni_set_mc_special_registers()
    2fd530d17d08 ath11k: Avoid REO CMD failed prints during firmware recovery
    deec1597f3b4 ath11k: Fix incorrect debug_mask mappings
    1f1483361585 ath11k: fix missing skb drop on htc_tx_completion error
    81bb39a0f2f3 libbpf: Fix is_pow_of_2
    26f0067ae603 selftests/bpf: Fix tc_redirect_dtime
    993b2d0ea0bd sample: bpf: xdp_router_ipv4: Allow the kernel to send arp requests
    a838592a9c49 selftests/bpf: Fix test_run logic in fexit_stress.c
    460a4a850bae drm/ssd130x: Only define a SPI device ID table when built as a module
    4815d57050fe drm/mipi-dbi: align max_chunk to 2 in spi_transfer
    313aca98c5fd ath11k: fix IRQ affinity warning on shutdown
    307ce58270b3 ath11k: fix netdev open race
    24d7da5c978f wifi: wilc1000: use correct sequence of RESET for chip Power-UP/Down
    72efb32be108 wifi: rtlwifi: fix error codes in rtl_debugfs_set_write_h2c()
    df59b91dd8af drm: bridge: adv7511: Move CEC definitions to adv7511_cec.c
    2d5e9bce99df drm/panel: Fix build error when CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y && CONFIG_DRM_DISPLAY_HELPER=m
    9255a2b6d79e drm/st7735r: Fix module autoloading for Okaya RH128128T
    ab6360c30706 drm/bridge: lt9611: Use both bits for HDMI sensing
    a056d7ccce73 drm/edid: reset display info in drm_add_edid_modes() for NULL edid
    620949b26c5a ath11k: Init hw_params before setting up AHB resources
    7b4fe5c024d7 ath11k: Fix warning on variable 'sar' dereference before check
    a6b75715fa33 ath10k: do not enforce interrupt trigger type
    9a3c206caadb drm/bridge: tc358767: Make sure Refclk clock are enabled
    a665b500d7ba drm/bridge: tc358767: Handle dsi_lanes == 0 as invalid
    9c5d750da06e drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
    bfcca6234b2a drm/meson: Fix refcount leak in meson_encoder_hdmi_init
    131b4d4f22cc drm/mgag200: Acquire I/O lock while reading EDID
    63e2c558ad4a drm/bridge: anx7625: Use DPI bus type
    58a3eb45e882 drm: bridge: DRM_FSL_LDB should depend on ARCH_MXC
    d6acd77e3b05 drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
    7c242077ee32 drm/i915: remove unused GEM_DEBUG_DECL() and GEM_DEBUG_BUG_ON()
    14053d3e52c8 dt-bindings: display: bridge: ldb: Fill in reg property
    e66205ee2dd3 erofs: update ctx->pos for every emitted dirent
    8aa69de3d0c2 pwm: lpc18xx: Fix period handling
    11f19c910b77 pwm: sifive: Shut down hardware only after pwmchip_remove() completed
    f9a71b807943 pwm: sifive: Ensure the clk is enabled exactly once per running PWM
    1d18eb5b9cec pwm: sifive: Simplify offset calculation for PWMCMP registers
    0545bfd4c8f7 dm: return early from dm_pr_call() if DM device is suspended
    2ebf6f594681 tools/power turbostat: Fix file pointer leak
    a765d1abee82 thermal/tools/tmon: Include pthread and time headers in tmon.h
    1c8729942e7c selftests/seccomp: Fix compile warning when CC=clang
    901e61b5e0f6 io_uring: Don't require reinitable percpu_ref
    674147513db3 io_uring: define a 'prep' and 'issue' handler for each opcode
    95c74abe404d io_uring: move to separate directory
    90812dd1f740 x86/extable: Fix ex_handler_msr() print condition
    876662765695 sched/numa: Initialise numa_migrate_retry
    dcdb6272b7cd sched: only perform capability check on privileged operation
    32f346b7460e nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
    dc4e49f068ca drivers/perf: arm_spe: Fix consistency of SYS_PMSCR_EL1.CX
    ddb603a99fa0 perf: RISC-V: Add of_node_put() when breaking out of for_each_of_cpu_node()
    9987e2d15f51 irqdomain: Report irq number for NOMAP domains
    24be04f0ebfa ARM: dts: qcom: msm8974: Disable remoteprocs by default
    d9f1fa7c4ecf arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
    fd95595c2e23 arm64: dts: qcom: msm8998: Make regulator voltages multiple of step-size
    51dabf18fc72 soc: qcom: socinfo: Fix the id of SA8540P SoC
    c1716ee4af76 soc: qcom: Make QCOM_RPMPD depend on PM
    fc7b19f547bc regulator: of: Fix refcount leak bug in of_get_regulation_constraints()
    8cd41a4f28b6 dm writecache: count number of blocks discarded, not number of discard bios
    f06cbeff2352 dm writecache: count number of blocks written, not number of write bios
    5fef35fc1a12 dm writecache: count number of blocks read, not number of read bios
    d48fa0b50494 dm writecache: return void from functions
    f0762b6a3a40 PM: domains: Ensure genpd_debugfs_dir exists before remove
    f8c44af7dd2d blktrace: Trace remapped requests correctly
    20ee06b89147 hwmon: (drivetemp) Add module alias
    6b1e4b5c2c87 hwmon: (sch56xx-common) Add DMI override table
    67f771726442 spi: tegra20-slink: fix UAF in tegra_slink_remove()
    3c6bd448442b spi: Fix simplification of devm_spi_register_controller
    c6079919817a spi: dw: Fix IP-core versions macro
    53f2de4b7b70 blk-mq: don't create hctx debugfs dir until q->debugfs_dir is created
    8134a099d63b spi: Return deferred probe error when controller isn't yet available
    4b3dd6659694 erofs: avoid consecutive detection for Highmem memory
    96aa2a6a8961 erofs: wake up all waiters after z_erofs_lzma_head ready
    4d0cf5bdea1a arm64: dts: qcom: sc7280: fix PCIe clock reference
    fe327fdc3107 arm64: tegra: Fix SDMMC1 CD on P2888
    61b2143ac99f arm64: tegra: Mark BPMP channels as no-memory-wc
    cbb73c1d32e7 arm64: dts: mt7622: fix BPI-R64 WPS button
    702d2a541af4 arm64: dts: qcom: sm8250: add missing PCIe PHY clock-cells
    4ffad9357b9d arm64: dts: qcom: sc7280: drop PCIe PHY clock index
    531d21b4ce4c arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
    5503176b7d15 arm64: dts: qcom: sm6125: Append -state suffix to pinctrl nodes
    eb007ca7cb59 arm64: dts: qcom: sm6125: Move sdc2 pinctrl from seine-pdx201 to sm6125
    579ea4a0fab9 m68k: virt: Fix missing platform_device_unregister() on error in virt_platform_init()
    d3a380f723b0 ACPI: VIOT: Fix ACS setup
    53d19f5b11e7 arm64: dts: exynosautov9: correct spi11 pin names
    082018a4d574 perf/x86/intel: Fix PEBS data source encoding for ADL
    34d1a1bf6775 perf/x86/intel: Fix PEBS memory access info encoding for ADL
    9cfed7bfb923 arm64: dts: qcom: msm8994: add required ranges to OCMEM
    393114d80c91 arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
    cd25f585c69d stack: Declare {randomize_,}kstack_offset to fix Sparse warnings
    f919fb3d3cf1 lib: overflow: Do not define 64-bit tests on 32-bit
    aa6a7c953513 bus: hisi_lpc: fix missing platform_device_put() in hisi_lpc_acpi_probe()
    d89c0e089f7b ARM: dts: qcom: pm8841: add required thermal-sensor-cells
    6f7698399f90 ARM: dts: qcom: msm8974: add required ranges to OCMEM
    591f0697ccba soc: qcom: aoss: Fix refcount leak in qmp_cooling_devices_register
    ed40a48d0a91 soc: qcom: ocmem: Fix refcount leak in of_get_ocmem
    6ef9abe3e50b ARM: dts: qcom-msm8974: fix irq type on blsp2_uart1
    0a4fa4ce6979 ARM: dts: qcom: replace gcc PXO with pxo_board fixed clock
    408ecbf8fcb7 ACPI: APEI: Fix _EINJ vs EFI_MEMORY_SP
    7040e8bd46b2 regulator: qcom_smd: Fix pm8916_pldo range
    abb65882592c arm64: dts: renesas: r9a07g054l2-smarc: Correct SoC name in comment
    407cc9639100 arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
    3b01353f1825 cpufreq: zynq: Fix refcount leak in zynq_get_revision
    d8b4cea8b38c arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2 pinconf
    31a91afaac9d arm64: dts: qcom: sdm630: fix gpu's interconnect path
    665ac144cfc1 arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
    ebfdc8bd81e6 arm64: dts: qcom: sdm630: disable GPU by default
    c652e0f51665 ARM: OMAP2+: Fix refcount leak in omap3xxx_prm_late_init
    507159facf00 ARM: OMAP2+: Fix refcount leak in omapdss_init_of
    93c55e0dff86 ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
    905ce119d0ee arm64: dts: qcom: sdm845-akatsuki: Round down l22a regulator voltage
    f3edcfd87118 block: fix infinite loop for invalid zone append
    773feecf570e spi: s3c64xx: constify fsd_spi_port_config
    e424ccda9c8b soc: fsl: guts: machine variable might be unset
    ca18e97c52a7 arm64: dts: qcom: sc7180: Remove ipa_fw_mem node on trogdor
    86a2e3ecc91e locking/lockdep: Fix lockdep_init_map_*() confusion
    2f754c81c8b6 arm64: cpufeature: Allow different PMU versions in ID_DFR0_EL1
    10b49de3d9a6 arm64: select TRACE_IRQFLAGS_NMI_SUPPORT
    17e0c2d3c6cc arm64: dts: mt8192: Fix idle-states entry-method
    6f24321f1274 arm64: dts: mt8192: Fix idle-states nodes naming scheme
    9b8a48c34e60 ARM: dts: ast2600-evb-a1: fix board compatible
    58f56c71ad3c ARM: dts: ast2600-evb: fix board compatible
    513283669e50 ARM: dts: ast2500-evb: fix board compatible
    7b9dda6bc7d4 x86/pmem: Fix platform-device leak in error path
    446838f3c935 Revert "ARM: dts: imx6qdl-apalis: Avoid underscore in node name"
    f22cc193e692 arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
    d1fbbb5ded71 soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
    b66dcf146d47 soc: renesas: r8a779a0-sysc: Fix A2DP1 and A2CV[2357] PDR values
    8885081ba0c8 ARM: dts: imx7-colibri-eval-v3: correct can controller comment
    b4b34041c001 ARM: dts: imx7-colibri: move aliases, chosen, extcon and gpio-keys
    10e4b798330c ARM: dts: imx7-colibri: improve wake-up with gpio key
    b31d4563b8bf ARM: dts: imx7-colibri: add usb dual-role switching using extcon
    78130b0585e2 ARM: dts: imx7-colibri: overhaul display/touch functionality
    3c51318638fb ARM: dts: imx7d-colibri-emmc: add cpu1 supply
    6f556550328e ACPI: processor/idle: Annotate more functions to live in cpuidle section
    02b658bfb264 ARM: bcm: Fix refcount leak in bcm_kona_smc_init
    d1f0f5a5b2fa spi: spi-altera-dfl: Fix an error handling path
    73dd39f55a5a arm64: dts: renesas: beacon: Fix regulator node names
    0c1757480a6a meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
    74e1beed4704 wait: Fix __wait_event_hrtimeout for RT/DL tasks
    46cc4c076ac2 kasan: test: Silence GCC 12 warnings
    c3d0c6adf283 io_uring: fix io_uring_cqe_overflow trace format
    dedd558d9765 selinux: Add boundary check in put_entry()
    1fc1f72aad20 selinux: fix memleak in security_read_state_kernel()
    f7042cf9dd40 PM: hibernate: defer device probing when resuming from hibernation
    38639db75316 hwmon: (sht15) Fix wrong assumptions in device remove callback
    a7cb43c8c2f9 ACPI: video: Use native backlight on Dell Inspiron N4010
    bfd4c6710d22 PM: EM: convert power field to micro-Watts precision and align drivers
    3d358d3d94ab hwmon: (dell-smm) Add Dell XPS 13 7390 to fan control whitelist
    bea971964a28 firmware: tegra: Fix error check return value of debugfs_create_file()
    f80893ef01a0 ARM: shmobile: rcar-gen2: Increase refcount for new reference
    77f77632999d arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
    7473b6549385 arm64: dts: qcom: ipq8074: fix NAND node name
    c9d8f42d18c2 arm64: dts: qcom: add missing AOSS QMP compatible fallback
    ce94c8fbdabe arm64: dts: qcom: sc7280: Rename sar sensor labels
    3c5bed5814c3 ARM: dts: qcom: sdx55: Fix the IRQ trigger type for UART
    05b23b33ee91 ACPI: LPSS: Fix missing check in register_device_clock()
    f1a4111e8b6d ACPI: PM: save NVS memory for Lenovo G40-45
    23c643bd7123 ACPI: EC: Drop the EC_FLAGS_IGNORE_DSDT_GPE quirk
    bd58acaf1585 ACPI: EC: Remove duplicate ThinkPad X1 Carbon 6th entry from DMI quirks
    37f0c8977857 ARM: OMAP2+: pdata-quirks: Fix refcount leak bug
    2629d171f3d6 ARM: OMAP2+: display: Fix refcount leak bug
    863ea2ac6f75 spi: synquacer: Add missing clk_disable_unprepare()
    49a7f92d70c0 arm64: dts: qcom: timer should use only 32-bit size
    bcfa4501972d ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
    a3f423e65299 ARM: dts: ux500: Fix Codina accelerometer mounting matrix
    e9c316447c63 ARM: dts: ux500: Fix Janice accelerometer mounting matrix
    dbb9381dcbe2 ARM: dts: BCM5301X: Add DT for Meraki MR26
    9496e3d49da5 ARM: dts: imx6ul: fix qspi node compatible
    47beb55c7c93 ARM: dts: imx6ul: fix lcdif node compatible
    692cf9f9afa9 ARM: dts: imx6ul: fix csi node compatible
    53e75d22f84d ARM: dts: imx6ul: fix keypad compatible
    d538751225ab ARM: dts: imx6ul: change operating-points to uint32-matrix
    44269efa9142 ARM: dts: imx6ul: add missing properties for sram
    6046e410c384 irqchip/mips-gic: Check the return value of ioremap() in gic_of_init()
    2c14f578b5a0 sched/core: Always flush pending blk_plug
    c1491d69334a sched/fair: fix case with reduced capacity CPU
    4d4ccca64e84 genirq: GENERIC_IRQ_IPI depends on SMP
    b1567b995a0c irqchip/mips-gic: Only register IPI domain when SMP is enabled
    8fa8237d2d2b genirq: Don't return error on missing optional irq_request_resources()
    21391488f249 sched/fair: Introduce SIS_UTIL to search idle CPU based on sum of util_avg
    5e63c5fe9123 ext2: Add more validity checks for inode counts
    019aa3dd4ee3 arm64: errata: Remove AES hwcap for COMPAT tasks
    db1fae1a8acd arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags"
    07022e07017e arm64: fix oops in concurrently setting insn_emulation sysctls
    0fc07cf46769 arm64: Do not forget syscall when starting a new thread.
    573a346f3cc2 arm64: stacktrace: use non-atomic __set_bit
    771076199152 arm64: kasan: do not instrument stacktrace.c
    2c1fc32a9ab8 arch: make TRACE_IRQFLAGS_NMI_SUPPORT generic
    92b465c5fec3 x86: Handle idle=nomwait cmdline properly for x86_idle
    503dde612202 epoll: autoremove wakers even more aggressively
    109539c9ba84 netfilter: nf_tables: fix null deref due to zeroed list head
    2f07a81c5d89 netfilter: nf_tables: disallow jump to implicit chain from set element
    92c07fdb6b58 netfilter: nf_tables: upfront validation of data via nft_data_init()
    c921bd1a7f00 netfilter: nf_tables: do not allow RULE_ID to refer to another chain
    58e863f64ee3 netfilter: nf_tables: do not allow CHAIN_ID to refer to another table
    0d0703939752 netfilter: nf_tables: do not allow SET_ID to refer to another table
    f9cb9c823a65 usb: dwc3: gadget: fix high speed multiplier setting
    fd55d4aa3463 usb: dwc3: gadget: refactor dwc3_repare_one_trb
    33ece34cdf1d arm64: dts: uniphier: Fix USB interrupts for PXs3 SoC
    ff4a0a2a0608 ARM: dts: uniphier: Fix USB interrupts for PXs2 SoC
    af64d4caeeb2 Revert "net: usb: ax88179_178a needs FLAG_SEND_ZLP"
    4e5de1c54eca USB: HCD: Fix URB giveback issue in tasklet function
    e1da08e8cded usb: typec: ucsi: Acknowledge the GET_ERROR_STATUS command completion
    bc57850fcb7e coresight: Clear the connection field properly
    7d305823e022 MIPS: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    3fcad718b5c9 powerpc/powernv: Avoid crashing if rng is NULL
    39e29d134ce2 powerpc/ptdump: Fix display of RW pages on FSL_BOOK3E
    b80b14c6c09a powerpc/fsl-pci: Fix Class Code of PCIe Root Port
    87784a09789a powerpc/64e: Fix early TLB miss with KUAP
    9f9bbe3cf758 powerpc: Restore CONFIG_DEBUG_INFO in defconfigs
    65e044ac89c1 ia64, processor: fix -Wincompatible-pointer-types in ia64_get_irr()
    6fe27b55af24 media: [PATCH] pci: atomisp_cmd: fix three missing checks on list iterator
    d3b41aa5348a media: isl7998x: select V4L2_FWNODE to fix build error
    546a2d5c10fa mbcache: add functions to delete entry if unused
    6f01f9e166c6 mbcache: don't reclaim used entries
    5f5784356513 md-raid10: fix KASAN warning
    7f82027b6b74 md-raid: destroy the bitmap after destroying the thread
    65beb95f3251 serial: mvebu-uart: uart2 error bits clearing
    1fdbbe246daf fuse: fix deadlock between atomic O_TRUNC and page invalidation
    4bd9d5d20f34 fuse: write inode in fuse_release()
    ed2ac89f294e fuse: ioctl: translate ENOSYS
    19d747bf8a3d fuse: limit nsec
    8e33102309bd ksmbd: fix heap-based overflow in set_ntacl_dacl()
    02ed2a9b7874 ksmbd: fix use-after-free bug in smb2_tree_disconect
    0f1c9908c8e1 ksmbd: prevent out of bound read for SMB2_WRITE
    9ec5086d14c5 ksmbd: prevent out of bound read for SMB2_TREE_CONNNECT
    ff20f1875889 ksmbd: fix memory leak in smb2_handle_negotiate
    9b9ed61d5ad7 soundwire: qcom: Check device status before reading devid
    84002f936a06 scsi: qla2xxx: Zero undefined mailbox IN registers
    9d08698376c3 scsi: qla2xxx: Fix incorrect display of max frame size
    03d8241112d5 scsi: sg: Allow waiting for commands to complete on removed device
    b0ab91283679 scsi: lpfc: Remove extra atomic_inc on cmd_pending in queuecommand after VMID
    a1135205b0af iio: light: isl29028: Fix the warning in isl29028_remove()
    2c6431d40657 iio: fix iio_format_avail_range() printing for none IIO_VAL_INT
    3e9047989547 um: seed rng using host OS rng
    dacd09269aae um: Remove straying parenthesis
    bb2c0e65f06c mtd: rawnand: arasan: Update NAND bus clock instead of system clock
    37276f51bb4a mtd: rawnand: arasan: Fix clock rate in NV-DDR
    7e06e615279c btrfs: reject log replay if there is unsupported RO compat flag
    be001f9da71e bpf: Fix KASAN use-after-free Read in compute_effective_progs
    261027d9988c drm/amdgpu: Check BO's requested pinning domains against its preferred_domains
    82d87b12e191 drm/tegra: Fix vmapping of prime buffers
    54f0c628c634 drm/nouveau/kms: Fix failure path for creating DP connectors
    5c5b1707884e drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from pm_runtime
    c2bd8f52c6c4 drm/nouveau: Don't pm_runtime_put_sync(), only pm_runtime_put_autosuspend()
    f223ddb6be37 drm/nouveau: fix another off-by-one in nvbios_addr
    b1475e2400c9 drm/dp/mst: Read the extended DPCD capabilities during system resume
    f845dccb5334 drm/hyperv-drm: Include framebuffer and EDID headers
    9c49ac792c63 drm/fb-helper: Fix out-of-bounds access
    071f693b4315 drm/ingenic: Use the highest possible DMA burst size
    701373decc68 drm/vc4: hdmi: Disable audio if dmas property is present but empty
    514b5bfcd352 drm/shmem-helper: Add missing vunmap on error
    2869c17ab606 drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
    c99f19fce608 rtc: rx8025: fix 12/24 hour mode detection on RX-8035
    91e11b151e95 wireguard: selftests: set CONFIG_NONPORTABLE on riscv32
    099e15195dae RISC-V: Update user page mapping only once during start
    fcc37c9de0ed RISC-V: Fix SBI PMU calls for RV32
    a775c75190ff RISC-V: Fix counter restart during overflow for RV32
    f46e3ebf6de1 RISC-V: Add modules to virtual kernel memory layout dump
    14b26f63a080 RISC-V: Fixup schedule out issue in machine_crash_shutdown()
    710559c0d73b RISC-V: Fixup get incorrect user mode PC for kernel mode regs
    09dff3955d75 RISC-V: kexec: Fixup use of smp_processor_id() in preemptible context
    cbb378edebd7 RISC-V: Declare cpu_ops_spinwait in <asm/cpu_ops.h>
    899b5091e4aa RISC-V: cpu_ops_spinwait.c should include head.h
    306aee157d23 riscv: dts: starfive: correct number of external interrupts
    4550f7ed4856 dt-bindings: riscv: fix SiFive l2-cache's cache-sets
    7e9ab8cb4fa5 riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
    73fc099eaefd riscv:uprobe fix SR_SPIE set/clear handling
    844a857bbce3 parisc: io_pgetevents_time64() needs compat syscall in 32-bit compat mode
    62eb0059d8d5 parisc: Check the return value of ioremap() in lba_driver_probe()
    6f0c087a68e5 parisc: Drop pa_swapper_pg_lock spinlock
    5c9e6c5e86a0 parisc: Fix device names in /proc/iomem
    247caf4a87f3 ovl: drop WARN_ON() dentry is NULL in ovl_encode_fh()
    e11fb0a3a39b crypto: ccp - Use kzalloc for sev ioctl interfaces to prevent kernel memory leak
    c8f808dfcc49 fix short copy handling in copy_mc_pipe_to_iter()
    f92421194629 usbnet: smsc95xx: Fix deadlock on runtime resume
    db3b738ae5f7 usbnet: Fix linkwatch use-after-free on disconnect
    730d67bfb916 fbcon: Fix accelerated fbdev scrolling while logo is still shown
    26c1cdde54d7 fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters
    ff58bd0db5cc thermal: sysfs: Fix cooling_device_stats_setup() error code path
    d082cb154f28 fs: Add missing umask strip in vfs_tmpfile
    5db80480c5d5 vfs: Check the truncate maximum size in inode_newsize_ok()
    e0ef23e9b0ad tty: vt: initialize unicode screen buffer
    9c5c8aaed50b tty: 8250: Add support for Brainboxes PX cards.
    37268c7badd3 LoongArch: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    27187e929981 ALSA: hda/realtek: Add a quirk for HP OMEN 15 (8786) mute LED
    e24cb11883a0 ALSA: hda/realtek: Add quirk for another Asus K42JZ model
    ec80fc5fa03b ALSA: hda/cirrus - support for iMac 12,1 model
    5d83b450e217 ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model
    53283a3333c0 KVM: x86/xen: Stop Xen timer before changing IRQ
    9a9b5771e930 KVM: x86/xen: Initialize Xen timer only once
    e27e46d5e5c4 KVM: x86: revalidate steal time cache if MSR value changes
    0043fbede947 KVM: x86: do not report preemption if the steal time cache is stale
    16c6a078c2bb KVM: x86/mmu: Fully re-evaluate MMIO caching when SPTE masks change
    7f04ed0d95db KVM: x86: Tag kvm_mmu_x86_module_init() with __init
    1b36d36624e7 KVM: SVM: Disable SEV-ES support if MMIO caching is disable
    6271f2854b92 KVM: x86/mmu: Treat NX as a valid SPTE bit for NPT
    37aaaa28851a KVM: x86: Set error code to segment selector on LLDT/LTR non-canonical #GP
    a9e394788e6a KVM: x86: Mark TSS busy during LTR emulation _after_ all fault checks
    15c0b55a366a KVM: nVMX: Inject #UD if VMXON is attempted with incompatible CR0/CR4
    dee2cc52b8b7 KVM: nVMX: Account for KVM reserved CR4 bits in consistency checks
    df6cbd82e0a8 KVM: nVMX: Let userspace set nVMX MSR to any _host_ supported value
    cbbd3df6ede5 KVM: x86: Split kvm_is_valid_cr4() and export only the non-vendor bits
    d2b2213dda1e KVM: Do not incorporate page offset into gfn=>pfn cache user address
    e7d52979638f KVM: Fix multiple races in gfn=>pfn cache refresh
    ca4efed09557 KVM: Fully serialize gfn=>pfn cache refresh via mutex
    391931dafc5f KVM: Put the extra pfn reference when reusing a pfn in the gpc cache
    81b640cc9b91 KVM: Drop unused @gpa param from gfn=>pfn cache's __release_gpc() helper
    86145725d4a9 KVM: s390: pv: don't present the ecall interrupt twice
    2eee1dba70f5 KVM: SVM: Don't BUG if userspace injects an interrupt with GIF=0
    53221fa29481 KVM: nVMX: Snapshot pre-VM-Enter DEBUGCTL for !nested_run_pending case
    8f8aa303c494 KVM: nVMX: Snapshot pre-VM-Enter BNDCFGS for !nested_run_pending case
    fe1cdbc5cb2c HID: wacom: Don't register pad_input for touch switch
    455287aff8c6 HID: wacom: Only report rotation for art pen
    02b4d0ec5b82 HID: nintendo: Add missing array termination
    2531fefea554 HID: hid-input: add Surface Go battery quirk
    eb3ebbd26808 lockd: detect and reject lock arguments that overflow
    56761b355ded add barriers to buffer_uptodate and set_buffer_uptodate
    24cdb1e7ee12 wifi: mac80211_hwsim: use 32-bit skb cookie
    ce943930c7a6 wifi: mac80211_hwsim: add back erroneously removed cast
    6d4f073cb2e8 wifi: mac80211_hwsim: fix race condition in pending packet
    a9fba9f20dc9 hwmon: (nct6775) Fix platform driver suspend regression
    36d9ec95598f ASoC: amd: yc: Update DMI table entries
    8d5b8e01e374 ALSA: hda/realtek: Add quirk for Lenovo Yoga9 14IAP7
    a67e67732435 ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
    8438004a7fcb ALSA: hda/realtek: Add quirk for Clevo NV45PZ
    b0d4af0a4763 ALSA: bcd2000: Fix a UAF bug on the error path of probing
    a23e793af145 ALSA: usb-audio: Add quirk for Behringer UMC202HD
    755f49dd4191 nfsd: eliminate the NFSD_FILE_BREAK_* flags
    ed48237d6b0a pNFS/flexfiles: Report RDMA connection errors to the server
    5c5639005dba scsi: Revert "scsi: qla2xxx: Fix disk failure to rediscover"
    fb78ef830e5e Revert "pNFS: nfs3_set_ds_client should set NFS_CS_NOPING"
    98847832313d x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments
    8cd1b2413c5c Makefile: link with -z noexecstack --no-warn-rwx-segments

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 3e8fdad973..60ca638bdd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "057686157785f537d3c8ddd336ec5543fa29ceef"
-SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
+SRCREV_machine ?= "df2290e83a50563688e5ea0be34e091f1c623069"
+SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.1"
+LINUX_VERSION ?= "5.19.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 163f8b476e..c1638f5cc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.1"
+LINUX_VERSION ?= "5.19.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
+SRCREV_machine ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index bd35fd4dcc..15c5aca8da 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0c8188d25f51316fb206d4080d2549ef3b014591"
-SRCREV_machine:qemuarm64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemumips ?= "ca2f5a010898511f597c3ac9164710c45628b991"
-SRCREV_machine:qemuppc ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemuriscv64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemuriscv32 ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemux86 ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemux86-64 ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_machine:qemumips64 ?= "3a5b406270a506682a645819b76b387c8d1c6dae"
-SRCREV_machine ?= "06993dc6c98efb8187b54577f329d244823c640e"
-SRCREV_meta ?= "0af450ed2237ad685ee30cce1b46347429269aef"
+SRCREV_machine:qemuarm ?= "2cbb2d5097fc44a23da635d2ebbccb33df20a34d"
+SRCREV_machine:qemuarm64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemumips ?= "7741c5b2f536b99815329849cca09799cdb82e62"
+SRCREV_machine:qemuppc ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemuriscv64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemuriscv32 ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemux86 ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemux86-64 ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_machine:qemumips64 ?= "4ced38bbd45f6cb623728bd755894928a719edac"
+SRCREV_machine ?= "4d933456709d664a55fdda85304c08567265ad4d"
+SRCREV_meta ?= "5eb0fa93f8490a962ff0c36c14d8def271d75128"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d654f7e29909ce602942a1cd927d56d5aa397ed8"
+SRCREV_machine:class-devupstream ?= "bf44eed7f2fc9af74eb72f4bc415bdd3d11c4bed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.1"
+LINUX_VERSION ?= "5.19.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


