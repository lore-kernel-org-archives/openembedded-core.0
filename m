Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 623476131F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:55:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id f3so1854293qkh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XMaoaK19RXDSeCnWpEnrPoG/RfrXD847klRcWE2UgG0=;
	b=Pwu4TSrDGSlaxib+PTpc5MTHxni9/qddh8b46X/6PimCYDimNZmUOKtXb3Du08Zcom
	IKT6EcwyCyByxc6FGSclTeTZU0bEP1wllQo4IiigpRhZWgYCYOkX0T4FaWzbCfR+2D1l
	j6opia6olv7LLtFaAzPg4nNRTHXGDI4nQnaoZE32jnF/GMGt+lEwTycd7diiKO+MNSpb
	LAa6HGl3QaSVUwdyM5rteag+lQLF7cSxYDpz9iCIITbunJGf1rbPeyQE9KueJbszsHem
	tcP+eockU/Tr4FHkhdgBDQdaKf8WsAjQPi0HtsE7cmcp9S2WPN2GN/9S6pmFx5ZkHNZE
	kuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XMaoaK19RXDSeCnWpEnrPoG/RfrXD847klRcWE2UgG0=;
	b=oAgv8oyNFk0fqX9vFJiBO5TuQJ/ObzEK60t2sJm6ML2jTcLUVpXhTMEmQdcn9LnfIu
	e/PeJcFpfnymjp1566i36Vtt/u37leK+nbsznxFvObPrksPzw2ydEIonBWzPXo38olnq
	Ud9in8SgiVvpYnOQwZ2mP3yDmVKIMH8LV7ZKOTVrfxXUWXFQAnsKcm/jy1DxpeQjAvDu
	E+URppZDwjXRu1UaL7NxBzfI/Q0Sx6E68k7nwh7MAKiIP8lnuAcYTbUWMdFn8oV6oOtb
	BDXmPXTW3S5jN9JQ2pVHKA85c1+rubLNBJ6u4nEhXUzVBbAsyXQNAUg9w3AR1mK8vHdQ
	DrDA==
X-Gm-Message-State: ANhLgQ0UAlcxk1YWeSj2jtbXjfwTJeAZsGG8TzmMkrIXT8nzX0QjVsJw
	qiFv4N/euzdlUnNmpmOPpTIb+G7JHKEstg==
X-Google-Smtp-Source: ADFU+vvmWWD6PzUGI2w7z+hUrKWEWvSn9KUmFc9UKljugj3VSRfDzqlbVOGCKkqV0VG7DeSGIrGcDg==
X-Received: by 2002:a37:a87:: with SMTP id 129mr3246707qkk.270.1583333730600; 
	Wed, 04 Mar 2020 06:55:30 -0800 (PST)
Received: from localhost.localdomain
	(CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.240.214]) by smtp.gmail.com with ESMTPSA id
	w83sm13455065qkb.83.2020.03.04.06.55.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:55:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Mar 2020 09:55:23 -0500
Message-Id: <8e4937eea468d286d7c8b7f98e673c442c034ad7.1583333447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1583333447.git.bruce.ashfield@gmail.com>
References: <cover.1583333447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.4: update to v5.4.23
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2020 14:55:30 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    bfe3046ecafd Linux 5.4.23
    bb7ffcbec227 ASoC: SOF: Intel: hda: Add iDisp4 DAI
    fb81480206ae bpf: Selftests build error in sockmap_basic.c
    19be2b3eea34 s390/mm: Explicitly compare PAGE_DEFAULT_KEY against zero in storage_key_init_range
    148c8531b69c s390/kaslr: Fix casts in get_random
    e26be2667399 net/mlx5e: Fix crash in recovery flow without devlink reporter
    fca1cdd3417e net/mlx5: Fix sleep while atomic in mlx5_eswitch_get_vepa
    06320052ee69 net/mlx5e: Reset RQ doorbell counter before moving RQ state from RST to RDY
    773dfd2223e3 xen: Enable interrupts when calling _cond_resched()
    9724b3f28dab ata: ahci: Add shutdown to freeze hardware resources of ahci
    8eb92c122840 io_uring: prevent sq_thread from spinning when it should stop
    b0f5f25c5541 rxrpc: Fix call RCU cleanup using non-bh-safe locks
    829e0a0ae2dc netfilter: xt_hashlimit: limit the max size of hashtable
    86502c68b81e ALSA: seq: Fix concurrent access to queue current tick/time
    2b550d1c7ac6 ALSA: seq: Avoid concurrent access to queue flags
    84e041a5df79 ALSA: rawmidi: Avoid bit fields for state flags
    c7deb9612e35 io_uring: fix __io_iopoll_check deadlock in io_sq_thread
    d562fdad84dd arm64: lse: Fix LSE atomics with LLVM
    8132323eb397 bpf, offload: Replace bitwise AND by logical AND in bpf_prog_offload_info_fill
    2463a30f6678 genirq/proc: Reject invalid affinity masks (again)
    c23074e20989 crypto: rename sm3-256 to sm3 in hash_algo_name
    8278f34f6ca8 iommu/vt-d: Fix compile warning from intel-svm.h
    cfde4697ea4d ecryptfs: replace BUG_ON with error handling code
    4c585d1e98d9 ASoC: fsl_sai: Fix exiting path on probing failure
    59c723344aec ASoC: atmel: fix atmel_ssc_set_audio link failure
    125b4a5345e2 staging: greybus: use after free in gb_audio_manager_remove_all()
    2ca19dfafc04 staging: rtl8723bs: fix copy of overlapping memory
    e6535a8c5d98 usb: dwc2: Fix in ISOC request length checking
    ceb1997a2ec3 usb: gadget: composite: Fix bMaxPower for SuperSpeedPlus
    826a43b22ce6 scsi: Revert "target: iscsi: Wait for all commands to finish before freeing a session"
    d92e714a463d scsi: Revert "RDMA/isert: Fix a recently introduced regression related to logout"
    42b4f3c8ec0b drm/msm/dpu: fix BGR565 vs RGB565 confusion
    337cbf3ea855 drm/i915/gt: Protect defer_request() from new waiters
    93805d430c53 drm/bridge: tc358767: fix poll timeouts
    7de50906e772 drm/i915/gvt: more locking for ppgtt mm LRU list
    19f8fb273193 drm/i915/execlists: Always force a context reload when rewinding RING_TAIL
    1e0175a15474 drm/i915/gt: Detect if we miss WaIdleLiteRestore
    341c8e03a90a Revert "dmaengine: imx-sdma: Fix memory leak"
    9ad7f8df34d2 Btrfs: fix deadlock during fast fsync when logging prealloc extents beyond eof
    73e1f2663273 btrfs: don't set path->leave_spinning for truncate
    d3d0fb9d42d3 Btrfs: fix race between shrinking truncate and fiemap
    c383f8ad2a12 Btrfs: fix btrfs_wait_ordered_range() so that it waits for all ordered extents
    9af8e258895f btrfs: do not check delayed items are empty for single transaction cleanup
    6065ca5d013d btrfs: reset fs_root to NULL on error in open_ctree
    37a2e704807a btrfs: fix bytes_may_use underflow in prealloc error condtition
    40ea30638d20 btrfs: destroy qgroup extent records on transaction abort
    7e946e30a46d KVM: apic: avoid calculating pending eoi from an uninitialized val
    dc5537061baf KVM: nVMX: handle nested posted interrupts when apicv is disabled for L1
    16f8553f75b5 KVM: nVMX: clear PIN_BASED_POSTED_INTR from nested pinbased_ctls only when apicv is globally disabled
    0f042f5e98f1 KVM: nVMX: Check IO instruction VM-exit conditions
    c4064f14f744 KVM: nVMX: Refactor IO bitmap checks into helper function
    e5d25003d059 ext4: fix race between writepages and enabling EXT4_EXTENTS_FL
    5195dc6e9365 ext4: rename s_journal_flag_rwsem to s_writepages_rwsem
    6ccdd6616a1c ext4: fix mount failure with quota configured as module
    eac2bb1042b2 ext4: fix potential race between s_flex_groups online resizing and access
    58631f8cbc24 ext4: fix potential race between s_group_info online resizing and access
    bb43897de9b3 ext4: fix potential race between online resizing and write operations
    ded8c21ac49c ext4: add cond_resched() to __ext4_find_entry()
    1673674ccd86 ext4: fix a data race in EXT4_I(inode)->i_disksize
    56b3949a2b5f KVM: x86: don't notify userspace IOAPIC on edge-triggered interrupt EOI
    24dfae91a23a KVM: nVMX: Don't emulate instructions in guest mode
    e61c236dcf34 sched/psi: Fix OOB write when writing 0 bytes to PSI files
    26ae0493c181 drm/i915: Update drm/i915 bug filing URL
    2104c4905a08 drm/i915: Wean off drm_pci_alloc/drm_pci_free
    3e740fa80cc8 drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets
    5e7dda6ddad1 drm/amdgpu/gfx10: disable gfxoff when reading rlc clock
    7e482baf6d70 drm/amdgpu/gfx9: disable gfxoff when reading rlc clock
    f141fac489ee drm/amdgpu/soc15: fix xclk for raven
    95236ae76bf8 mm: Avoid creating virtual address aliases in brk()/mmap()/mremap()
    9bb971b33565 lib/stackdepot.c: fix global out-of-bounds in stack_slabs
    ef32399bf729 mm/sparsemem: pfn_to_page is not valid yet on SPARSEMEM
    198f5aa0f73e mm/vmscan.c: don't round up scan size for online memory cgroup
    8735a5b6e1fb genirq/irqdomain: Make sure all irq domain flags are distinct
    6e304262e393 nvme-multipath: Fix memory leak with ana_log_buf
    e078c8d8971b mm/memcontrol.c: lost css_put in memcg_expand_shrinker_maps()
    aa4f749f8136 Revert "ipc,sem: remove uneeded sem_undo_list lock usage in exit_sem()"
    7b77e5a08224 ACPI: PM: s2idle: Check fixed wakeup events in acpi_s2idle_wake()
    f18121a59b5a MAINTAINERS: Update drm/i915 bug filing URL
    cf3c30a7112c serdev: ttyport: restore client ops on deregistration
    80990c30b776 tty: serial: qcom_geni_serial: Fix RX cancel command failure
    5b0af5e58368 tty: serial: imx: setup the correct sg entry for tx dma
    671ea19c3214 tty/serial: atmel: manage shutdown in case of RS485 or ISO7816 mode
    5ae6e5683755 serial: 8250: Check UPF_IRQ_SHARED in advance
    e0253c422024 x86/cpu/amd: Enable the fixed Instructions Retired counter IRPERF
    88e4901d3ebd x86/mce/amd: Fix kobject lifetime
    de2cce5ae563 x86/mce/amd: Publish the bank pointer only after setup has succeeded
    6df12de90e74 x86/ima: use correct identifier for SetupMode variable
    453692eb5a38 jbd2: fix ocfs2 corrupt when clearing block group bits
    98583fb54c2b arm64: memory: Add missing brackets to untagged_addr() macro
    9b9374cf1ea7 powerpc/hugetlb: Fix 8M hugepages on 8xx
    723a44f2288e powerpc/hugetlb: Fix 512k hugepages on 8xx with 16k page size
    2ffeef3db358 powerpc/entry: Fix an #if which should be an #ifdef in entry_32.S
    04e3f1d1e135 powerpc/tm: Fix clearing MSR[TS] in current when reclaiming on signal delivery
    a03b3cea86fd powerpc/eeh: Fix deadlock handling dead PHB
    9e1fab44502c powerpc/8xx: Fix clearing of bits 20-23 in ITLB miss
    2558e71bbfc5 drm/panfrost: perfcnt: Reserve/use the AS attached to the perfcnt MMU context
    3b8edaada13e staging: rtl8723bs: Fix potential overuse of kernel memory
    4113e08e75d3 staging: rtl8723bs: Fix potential security hole
    de63cd8b5521 staging: rtl8188eu: Fix potential overuse of kernel memory
    ddedb84fcdc8 staging: rtl8188eu: Fix potential security hole
    91aa9e475827 scsi: Revert "target/core: Inline transport_lun_remove_cmd()"
    24aeb16934e8 usb: dwc3: debug: fix string position formatting mixup with ret and len
    6dbf3ea0f566 usb: dwc3: gadget: Check for IOC/LST bit in TRB->ctrl fields
    256cc85f6f86 usb: dwc2: Fix SET/CLEAR_FEATURE and GET_STATUS flows
    c2f07cb7e317 USB: hub: Fix the broken detection of USB3 device in SMSC hub
    e5d078af8e5f USB: hub: Don't record a connect-change event during reset-resume
    5af8add0167c USB: Fix novation SourceControl XL after suspend
    b3c64c8b2fab usb: uas: fix a plug & unplug racing
    e805982b13e3 USB: quirks: blacklist duplicate ep on Sound Devices USBPre2
    4c02497e8f65 USB: core: add endpoint-blacklist quirk
    f9965af8e493 usb: host: xhci: update event ring dequeue pointer on purpose
    5d0faf16f960 xhci: Fix memory leak when caching protocol extended capability PSI tables - take 2
    ef69cf19bda8 xhci: apply XHCI_PME_STUCK_QUIRK to Intel Comet Lake platforms
    02e326360053 xhci: fix runtime pm enabling for quirky Intel hosts
    512dae7753cd xhci: Force Maximum Packet size for Full-speed bulk devices to valid range.
    22ff13ac65cb staging: vt6656: fix sign of rx_dbm to bb_pre_ed_rssi.
    41a53f5b68ec staging: android: ashmem: Disallow ashmem memory from being remapped
    897d5aaf3397 vt: vt_ioctl: fix race in VT_RESIZEX
    21275a431289 vt: selection, handle pending signals in paste_selection
    a2c3858faf3a vt: fix scrollback flushing on background consoles
    1eb78bc92c84 floppy: check FDC index for errors before assigning it
    c5455e3fab20 e1000e: Use rtnl_lock to prevent race conditions between net and pci/pm
    47a7a44650c1 USB: misc: iowarrior: add support for the 100 device
    9b5e87086fa9 USB: misc: iowarrior: add support for the 28 and 28L devices
    c8e28d325c97 USB: misc: iowarrior: add support for 2 OEMed devices
    cfda8551dd59 thunderbolt: Prevent crash if non-active NVMem file is read
    802a8369d21f btrfs: handle logged extent failure properly
    3c4ef8ac8f4b ecryptfs: fix a memory leak bug in ecryptfs_init_messaging()
    7e1dbc6656ff ecryptfs: fix a memory leak bug in parse_tag_1_packet()
    909149bf61da tpm: Initialize crypto_id of allocated_banks to HASH_ALGO__LAST
    9f83363875be ASoC: sun8i-codec: Fix setting DAI data format
    3de0bbe21312 ASoC: codec2codec: avoid invalid/double-free of pcm runtime
    c45877ca9f62 ALSA: hda/realtek - Apply quirk for yet another MSI laptop
    9dc3b7a5833a ALSA: hda/realtek - Apply quirk for MSI GP63, too
    80c1e9c4c484 ALSA: hda: Use scnprintf() for printing texts for sysfs/procfs
    b76e00b67dc6 iommu/qcom: Fix bogus detach logic
    f22dcb31727e Linux 5.4.22
    105542cea2ea rtc: Kconfig: select REGMAP_I2C when necessary
    cea9007ebb95 bcache: properly initialize 'path' and 'err' in register_bcache()
    7967c3299e3f drm/amdgpu/display: handle multiple numbers of fclks in dcn_calcs.c (v2)
    51c9c98a7bbe s390/pci: Recover handle in clp_set_pci_fn()
    332c8b5bc358 mlxsw: spectrum_dpipe: Add missing error path
    399ca7ee9130 fuse: don't overflow LLONG_MAX with end offset
    77912b69a989 virtio_balloon: prevent pfn array overflow
    9c80ae965082 cifs: log warning message (once) if out of disk space
    3f14879fd6ce i40e: Relax i40e_xsk_wakeup's return value when PF is busy
    6fa2bb0d06ca help_next should increase position index
    6b851823ceaa NFS: Fix memory leaks
    0562d37d143a drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_voltage
    c3e3d17d0c5b drm/amdgpu/smu10: fix smu10_get_clock_by_type_with_latency
    17bddc85f980 brd: check and limit max_part par
    7291351c00e1 microblaze: Prevent the overflow of the start
    7ceb32672b1e asm-generic/tlb: add missing CONFIG symbol
    7a48064a42e0 iwlwifi: mvm: Check the sta is not NULL in iwl_mvm_cfg_he_sta()
    1656781d15c0 iwlwifi: mvm: Fix thermal zone registration
    0448387729d9 nvme-pci: remove nvmeq->tags
    1d0fbf3e2687 nvmet: Pass lockdep expression to RCU lists
    d5461fdd9645 irqchip/gic-v3-its: Reference to its_invall_cmd descriptor when building INVALL
    793137b0511c bcache: fix incorrect data type usage in btree_flush_write()
    57a180a630d8 bcache: explicity type cast in bset_bkey_last()
    374eec821858 bcache: fix memory corruption in bch_cache_accounting_clear()
    dc8c75f35374 reiserfs: prevent NULL pointer dereference in reiserfs_insert_item()
    23b88b51de5c lib/scatterlist.c: adjust indentation in __sg_alloc_table
    5a553bd43f59 ocfs2: fix a NULL pointer dereference when call ocfs2_update_inode_fsync_trans()
    799c4c1e389f ocfs2: make local header paths relative to C files
    7a97311de48d btrfs: do not do delalloc reservation under page lock
    a531e6ba85a0 powerpc: Do not consider weak unresolved symbol relocations as bad
    528c36e14b17 radeon: insert 10ms sleep in dce5_crtc_load_lut
    224c0751dfb7 trigger_next should increase position index
    e349287276c2 ftrace: fpid_next() should increase position index
    8a7bfa3d97dc char: hpet: Fix out-of-bounds read bug
    427f39e23326 drm/nouveau/disp/nv50-: prevent oops when no channel method map provided
    39c6932240c5 irqchip/gic-v3: Only provision redistributors that are enabled in ACPI
    074c4c43fce2 drm/amd/display: do not allocate display_mode_lib unnecessarily
    1687b204ae83 rbd: work around -Wuninitialized warning
    bd4e1894166b ceph: check availability of mds cluster on mount after wait timeout
    7288d5338c85 powerpc/mm: Don't log user reads to 0xffffffff
    3ce3df5d00d0 bpf: map_seq_next should always increase position index
    9a178494d05b cifs: fix NULL dereference in match_prepath
    9c5ede115a6e cifs: Fix mount options set in automount
    1d8e40cf86e4 cifs: fix unitialized variable poential problem with network I/O cache lock patch
    a2763f62baa4 iwlegacy: ensure loop counter addr does not wrap and cause an infinite loop
    034c5f26d2bf rtw88: fix potential NULL skb access in TX ISR
    e7e4d0eaa639 hostap: Adjust indentation in prism2_hostapd_add_sta
    32662df2d0bc ALSA: usb-audio: add quirks for Line6 Helix devices fw>=2.82
    2ccaac382af0 ARM: 8951/1: Fix Kexec compilation issue.
    16ec28640dc6 selftests/eeh: Bump EEH wait time to 60s
    93df1b23b157 powerpc/pseries/lparcfg: Fix display of Maximum Memory
    411327180703 jbd2: make sure ESHUTDOWN to be recorded in the journal superblock
    314e25f4b0cf jbd2: switch to use jbd2_journal_abort() when failed to submit the commit record
    b911c5e8686a selftests: bpf: Reset global state between reuseport test runs
    251c53a92b54 alarmtimer: Make alarmtimer platform device child of RTC device
    777baa1baf63 iommu/vt-d: Remove unnecessary WARN_ON_ONCE()
    b5f6bf0fdd71 bcache: fix use-after-free in register_bcache()
    393b8509be33 bcache: rework error unwinding in register_bcache
    f7d8ebf26d23 bcache: cached_dev_free needs to put the sb page
    714cd4a5127a btrfs: Fix split-brain handling when changing FSID to metadata uuid
    dc22bc8a8626 btrfs: separate definition of assertion failure handlers
    3420f1b304b3 media: uvcvideo: Add a quirk to force GEO GC6500 Camera bits-per-pixel value
    3f6c8de753ed powerpc/sriov: Remove VF eeh_dev state when disabling SR-IOV
    9d5fc7f14ef2 drm/nouveau/mmu: fix comptag memory leak
    707518c16ba4 sunrpc: Fix potential leaks in sunrpc_cache_unhash()
    46503858e275 ALSA: hda - Add docking station support for Lenovo Thinkpad T420s
    ea038a5270b5 bpf, btf: Always output invariant hit in pahole DWARF to BTF transform
    f11aefc9961d driver core: platform: fix u32 greater or equal to zero comparison
    843eb0a8cf53 s390/ftrace: generate traced function stack frame
    68c3cc414e08 s390: adjust -mpacked-stack support check for clang 10
    838bddc295a0 x86/decoder: Add TEST opcode to Group3-2
    a4f6948e57f0 objtool: Fix ARCH=x86_64 build error
    59e2355bdfc5 kbuild: use -S instead of -E for precise cc-option test in Kconfig
    ba6ad897c3dc spi: spi-fsl-qspi: Ensure width is respected in spi-mem operations
    dbdc1c12966e ALSA: hda/hdmi - add retry logic to parse_intel_hdmi()
    fa7d320dbbbe irqchip/mbigen: Set driver .suppress_bind_attrs to avoid remove problems
    27f3dc35fd59 regulator: core: Fix exported symbols to the exported GPL version
    18eca3cb5dd9 remoteproc: Initialize rproc_class before use
    496d6c021828 module: avoid setting info->name early in case we can fall back to info->mod->name
    7303a0b0a537 btrfs: device stats, log when stats are zeroed
    f9ab58f9a2ab btrfs: safely advance counter when looking up bio csums
    ebf8e5411888 btrfs: fix possible NULL-pointer dereference in integrity checks
    50b93369668b pwm: Remove set but not set variable 'pwm'
    adf4ab6d8312 ide: serverworks: potential overflow in svwks_set_pio_mode()
    e5c8d3abd927 cmd64x: potential buffer overflow in cmd64x_program_timings()
    419035d75dbe pwm: omap-dmtimer: Remove PWM chip in .remove before making it unfunctional
    e7e6b53fea10 x86/mm: Fix NX bit clearing issue in kernel_map_pages_in_pgd
    225a5b5bee00 f2fs: fix memleak of kobject
    337c7b95e16e regulator: vctrl-regulator: Avoid deadlock getting and setting the voltage
    bf754c88865d ASoC: SOF: Intel: hda: Fix SKL dai count
    84255fe86d07 debugobjects: Fix various data races
    0b2ecef39d8e watchdog/softlockup: Enforce that timestamp is valid on boot
    d8a6a443ff0a perf/x86/amd: Constrain Large Increment per Cycle events
    f2323c374e49 sched/topology: Assert non-NUMA topology masks don't (partially) overlap
    5d13f62b9ef6 sched/core: Fix size of rq::uclamp initialization
    8da6ae7dcb16 arm64: dts: ti: k3-j721e-main: Add missing power-domains for smmu
    88cf251d3c0d KVM: PPC: Remove set but not used variable 'ra', 'rs', 'rt'
    d4870a4343f3 EDAC/sifive: Fix return value check in ecc_register()
    0a8f90d5654d drm/amd/display: fixup DML dependencies
    304982d21e2b arm64: fix alternatives with LLVM's integrated assembler
    f68668292496 arm64: lse: fix LSE atomics with LLVM's integrated assembler
    b04235f1e11d RDMA/mlx5: Don't fake udata for kernel path
    da2d50868e59 ALSA: usb-audio: add implicit fb quirk for MOTU M Series
    5a6f5b327fce crypto: essiv - fix AEAD capitalization and preposition use in help text
    817faa4ed433 scsi: iscsi: Don't destroy session if there are outstanding connections
    12b685be50c7 scsi: ufs-mediatek: add apply_dev_quirks variant operation
    4fa2dd4eebfd scsi: ufs: pass device information to apply_dev_quirks
    0016939be0ee f2fs: free sysfs kobject
    06c34c604b13 f2fs: set I_LINKABLE early to avoid wrong access by vfs
    f51caa62dea1 ALSA: usb-audio: unlock on error in probe
    480494e28a51 iommu/arm-smmu-v3: Use WRITE_ONCE() when changing validity of an STE
    23d3f191a576 kbuild: remove *.tmp file when filechk fails
    1fc9746acbb2 usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
    9112d1ef5a1b perf/imx_ddr: Fix cpu hotplug state cleanup
    994b203b619d drm/vmwgfx: prevent memory leak in vmw_cmdbuf_res_add
    13d368cd1e13 gpiolib: Set lockdep class for hierarchical irq domains
    7f0d9ac2621e dm thin: don't allow changing data device during thin-pool reload
    74f42a77318e drm/nouveau/fault/gv100-: fix memory leak on module unload
    18792937b064 drm/nouveau/drm/ttm: Remove set but not used variable 'mem'
    a94c84c5c4bc drm/nouveau: Fix copy-paste error in nouveau_fence_wait_uevent_handler
    93672fa5b9b3 drm/nouveau/gr/gk20a,gm200-: add terminators to method lists read from fw
    63e00e2c80e5 drm/nouveau/secboot/gm20b: initialize pointer in gm20b_secboot_new()
    760baae7ab35 vme: bridges: reduce stack usage
    76fac0e735c7 bpf: Return -EBADRQC for invalid map type in __bpf_tx_xdp_map
    be1113b4b415 ASoC: SOF: Intel: hda-dai: fix compilation warning in pcm_prepare
    a8b37e32415e driver core: Print device when resources present in really_probe()
    3f6af05d1d1b driver core: platform: Prevent resouce overflow from causing infinite loops
    11c759264c32 visorbus: fix uninitialized variable access
    83f964dd14a7 misc: xilinx_sdfec: fix xsdfec_poll()'s return type
    9087af8639c2 tty: synclink_gt: Adjust indentation in several functions
    71faeca11055 tty: synclinkmp: Adjust indentation in several functions
    a922fa72a860 raid6/test: fix a compilation warning
    6cfe307b5be7 ASoC: atmel: fix build error with CONFIG_SND_ATMEL_SOC_DMA=m
    5bff3c470f84 ALSA: usb-audio: Add boot quirk for MOTU M Series
    d691d1e5836d ARM: dts: rockchip: add reg property to brcmf sub node for rk3188-bqedison2qc
    7c32c479b1e0 arm64: dts: rockchip: add reg property to brcmf sub-nodes
    f9de6fb6e679 arm64: dts: rockchip: fix dwmmc clock name for px30
    989a495ed9a3 clocksource: davinci: only enable clockevents once tim34 is initialized
    48be6f9d2f7e wan: ixp4xx_hss: fix compile-testing on 64-bit
    73f48c1004d4 x86/nmi: Remove irq_work from the long duration NMI handler
    b075c29e816c bnxt: Detach page from page pool before sending up the stack
    1e703d621b9c Input: edt-ft5x06 - work around first register access error
    2b1fd461067f rcu: Use WRITE_ONCE() for assignments to ->pprev for hlist_nulls
    5f0a4eba2a88 efi/x86: Don't panic or BUG() on non-critical error conditions
    5cf01eacd5c2 soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
    75d916c3b393 IB/hfi1: Add RcvShortLengthErrCnt to hfi1stats
    9cfe6c21ff17 IB/hfi1: Add software counter for ctxt0 seq drop
    8689967be56d staging: rtl8188: avoid excessive stack usage
    bfe29951e250 drm/mediatek: Add gamma property according to hardware capability
    6ceef50235d1 udf: Fix free space reporting for metadata and virtual partitions
    03560e4a19fe usbip: Fix unsafe unaligned pointer usage
    e653e1c05423 ARM: dts: stm32: Add power-supply for DSI panel on stm32f469-disco
    6e86c4ce5d3a usb: dwc3: use proper initializers for property entries
    ab7edf7fa651 drm: remove the newline for CRC source name.
    9d89ff3d27e0 RDMA/hns: Avoid printing address of mtt page
    5a2a529974e1 mlx5: work around high stack usage with gcc
    010cdc1be053 drm/amdkfd: Fix permissions of hang_hws
    960671ac5065 iommu/vt-d: Avoid sending invalid page response
    2aab9e9d1f3d iommu/vt-d: Match CPU and IOMMU paging mode
    4ffdfc414d81 ACPI: button: Add DMI quirk for Razer Blade Stealth 13 late 2019 lid switch
    e9e24f2ca9a6 ASoC: Intel: sof_rt5682: Ignore the speaker amp when there isn't one.
    d00a15040454 vfio/spapr/nvlink2: Skip unpinning pages on error exit
    e44b48f5bb64 tools lib api fs: Fix gcc9 stringop-truncation compilation error
    3e32b1282b11 net: phy: fixed_phy: fix use-after-free when checking link GPIO
    4070a491bfcf ALSA: sh: Fix compile warning wrt const
    cf24ed82438c ALSA: hda/realtek - Apply mic mute LED quirk for Dell E7xx laptops, too
    2417ea1d07a5 clk: uniphier: Add SCSSI clock gate for each channel
    6447bfe82922 clk: Use parent node pointer during registration if necessary
    6c7984312d35 ALSA: sh: Fix unused variable warnings
    9f87fff25159 clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock
    d1d92e97260f RDMA/rxe: Fix error type of mmap_offset
    c87c4d442b9f fbdev: fix numbering of fbcon options
    67ca691658f5 ASoC: soc-topology: fix endianness issues
    04361b8961d6 reset: uniphier: Add SCSSI reset control for each channel
    e39aac0e65f1 pinctrl: sh-pfc: sh7269: Fix CAN function GPIOs
    9ed73297980b drm/fbdev: Fallback to non tiled mode if all tiles not present
    d3db7b78e7d6 PM / devfreq: rk3399_dmc: Add COMPILE_TEST and HAVE_ARM_SMCCC dependency
    704582e6a714 PM / devfreq: exynos-ppmu: Fix excessive stack usage
    bc866376d7cd x86/vdso: Provide missing include file
    b5fe09b676de crypto: chtls - Fixed memory leak
    a739564c4c53 net: phy: realtek: add logging for the RGMII TX delay configuration
    4783bf08f8d2 bpf: Print error message for bpftool cgroup show
    8a7aa4feeaea dmaengine: imx-sdma: Fix memory leak
    f99958a96c7f dmaengine: Store module owner in dma_device struct
    93a3eff6fab3 clk: actually call the clock init before any other callback of the clock
    fa0150ba88fa iommu/iova: Silence warnings under memory pressure
    8c358435459b iommu/amd: Only support x2APIC with IVHD type 11h/40h
    b1b7add9d2de iommu/amd: Check feature support bit before accessing MSI capability registers
    0c09d9dc8440 arm64: dts: qcom: db845c: Enable ath10k 8bit host-cap quirk
    ce591c921944 scsi: lpfc: Fix: Rework setting of fdmi symbolic node name registration
    111749fba968 selinux: ensure we cleanup the internal AVC counters on error in avc_update()
    069d2385f381 ARM: dts: r8a7779: Add device node for ARM global timer
    f9b42cb09d8b clk: renesas: rcar-gen3: Allow changing the RPC[D2] clocks
    d80f9dfe47ce drm/mediatek: handle events when enabling/disabling crtc
    57cd234da28c crypto: inside-secure - add unspecified HAS_IOMEM dependency
    df0f4455a12f scsi: aic7xxx: Adjust indentation in ahc_find_syncrate
    f6ebbf46c3a8 scsi: ufs: Complete pending requests in host reset and restore path
    8728001e1e41 nfsd: Clone should commit src file metadata too
    d67d31cb0e92 ACPICA: Disassembler: create buffer fields in ACPI_PARSE_LOAD_PASS1
    3fa5ba7b1912 clk: qcom: smd: Add missing bimc clock
    43ef7ad610dc drm/amdgpu: fix KIQ ring test fail in TDR of SRIOV
    75423fdad259 orinoco: avoid assertion in case of NULL pointer
    5a14db967b72 rtlwifi: rtl_pci: Fix -Wcast-function-type
    f20bc906af52 iwlegacy: Fix -Wcast-function-type
    3acea3092a33 ipw2x00: Fix -Wcast-function-type
    bc8746721cdf b43legacy: Fix -Wcast-function-type
    90053ff023da PCI: Add DMA alias quirk for PLX PEX NTB
    27a35f09367f PCI: Add nr_devfns parameter to pci_add_dma_alias()
    dd77f77004b6 ALSA: usx2y: Adjust indentation in snd_usX2Y_hwdep_dsp_status
    b6c857e5e500 netfilter: nft_tunnel: add the missing ERSPAN_VERSION nla_policy
    1e2b6e5f32aa fore200e: Fix incorrect checks of NULL pointer dereference
    58bc57b373e0 r8169: check that Realtek PHY driver module is loaded
    cdd5b09bcbc0 samples/bpf: Set -fno-stack-protector when building BPF programs
    af77e76625be reiserfs: Fix spurious unlock in reiserfs_fill_super() error handling
    6107a895e383 media: v4l2-device.h: Explicitly compare grp{id,mask} to zero in v4l2_device macros
    cf03458ab2cf selftests/net: make so_txtime more robust to timer variance
    687ef9c269b6 gpu/drm: ingenic: Avoid null pointer deference in plane atomic update
    e07c107a2483 Revert "nfp: abm: fix memory leak in nfp_abm_u32_knode_replace"
    6a05af0b718a PCI: Increase D3 delay for AMD Ryzen5/7 XHCI controllers
    5700b8073f03 PCI: Add generic quirk for increasing D3hot delay
    1e7b1684de37 media: cx23885: Add support for AVerMedia CE310B
    a3a7f90936d7 PCI: iproc: Apply quirk_paxc_bridge() for module as well as built-in
    76ce0e269b4a bus: ti-sysc: Implement quirk handling for CLKDM_NOAUTO
    2fc336213605 ARM: dts: imx6: rdu2: Limit USBH1 to Full Speed
    f3e63a4ddf19 ARM: dts: imx6: rdu2: Disable WP for USDHC2 and USDHC3
    dbe3806c7191 ARM: exynos_defconfig: Bring back explicitly wanted options
    4ece124849a2 clk: imx: Add correct failure handling for clk based helpers
    0685dfa0a2ff padata: validate cpumask without removed CPU during offline
    c3a007435359 arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core
    0e44cd879ba1 selinux: ensure we cleanup the internal AVC counters on error in avc_insert()
    5fed8c513adb opp: Free static OPPs on errors while adding them
    ef6b35dfe142 arm: dts: allwinner: H3: Add PMU node
    5a241d7bf1e6 arm64: dts: allwinner: H5: Add PMU node
    02dfae36b03f arm64: dts: allwinner: H6: Add PMU mode
    5f0a50b0a37d NFC: port100: Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().
    53d9b08dc80d net/wan/fsl_ucc_hdlc: reject muram offsets above 64K
    12ba455b1d28 regulator: rk808: Lower log level on optional GPIOs being not available
    bae02d239a38 ASoC: intel: sof_rt5682: Add support for tgl-max98357a-rt5682
    fa54ae038c95 ASoC: intel: sof_rt5682: Add quirk for number of HDMI DAI's
    4c50665fc968 modules: lockdep: Suppress suspicious RCU usage warning
    fa0316aaf094 arm64: dts: rockchip: Fix NanoPC-T4 cooling maps
    3a28e0701264 drm/panel: simple: Add Logic PD Type 28 display support
    c3c3f3449b8c drm/amdgpu: Ensure ret is always initialized when using SOC15_WAIT_ON_RREG
    ddbdf757a7ef ath10k: correct the tlv len of ath10k_wmi_tlv_op_gen_config_pno_start
    69c12b79e9e2 drm/amdgpu: remove 4 set but not used variable in amdgpu_atombios_get_connector_info_from_object_table
    ad9728b377a6 bpf, sockhash: Synchronize_rcu before free'ing map
    25c85d8574d8 drm/amdkfd: Fix a bug in SDMA RLC queue counting under HWS mode
    dff5d0fc77a5 clk: qcom: rcg2: Don't crash if our parent can't be found; return an error
    8d122cd0d266 clk: qcom: Don't overwrite 'cfg' in clk_rcg2_dfs_populate_freq()
    8ba34cdadba3 kconfig: fix broken dependency in randconfig-generated .config
    39a708219509 block, bfq: do not plug I/O for bfq_queues with no proc refs
    b0d5c881d36e drivers/block/zram/zram_drv.c: fix error return codes not being returned in writeback_store
    53aaa9f1a638 Btrfs: keep pages dirty when using btrfs_writepage_fixup_worker
    3aa694d0e112 KVM: s390: ENOTSUPP -> EOPNOTSUPP fixups
    25cbba5d4e14 nbd: add a flush_workqueue in nbd_start_device
    201fdd62bb23 tracing: Simplify assignment parsing for hist triggers
    7bc84d854017 drm/amd/display: Retrain dongles when SINK_COUNT becomes non-zero
    806f57ec2b52 rtc: i2c/spi: Avoid inclusion of REGMAP support when not needed
    b752d473b1fb selftests: settings: tests can be in subsubdirs
    6f65dd66ea6f brcmfmac: sdio: Fix OOB interrupt initialization on brcm43362
    abf8d588e3b1 rtw88: fix rate mask for 1SS chip
    3eee03d0ffb8 ath10k: Correct the DMA direction for management tx buffers
    494c30b80550 ext4, jbd2: ensure panic when aborting with zero errno
    8343f165f3d4 ARM: 8952/1: Disable kmemleak on XIP kernels
    8c72748e9f6a tracing: Fix very unlikely race of registering two stat tracers
    75225eee8715 tracing: Fix tracing_stat return values in error handling paths
    8be3ac46ef80 powerpc/iov: Move VF pdev fixup into pcibios_fixup_iov()
    256e52a1a915 s390/pci: Fix possible deadlock in recover_store()
    37ea6d15b197 wan/hdlc_x25: fix skb handling
    77b131f652d4 dmaengine: fsl-qdma: fix duplicated argument to &&
    d30a4882e630 udf: Allow writing to 'Rewritable' partitions
    a3536e5589c7 pwm: omap-dmtimer: Simplify error handling
    971579fae1b4 x86/sysfb: Fix check for bad VRAM size
    7828a927b850 clk: ti: dra7: fix parent for gmac_clkctrl
    2d7fa7564bc4 ext4: fix deadlock allocating bio_post_read_ctx from mempool
    c982320078dd jbd2: clear JBD2_ABORT flag before journal_reset to update log tail info when load journal
    56953ccd7f00 kselftest: Minimise dependency of get_size on C library interfaces
    6aa96ec9c196 drm/amd/display: Clear state after exiting fixed active VRR state
    c7fc72092134 clocksource/drivers/bcm2835_timer: Fix memory leak of timer
    9f0414eed212 usb: dwc2: Fix IN FIFO allocation
    2cea5895b69d usb: gadget: udc: fix possible sleep-in-atomic-context bugs in gr_probe()
    531d0ac5fbbd drm/nouveau/nouveau: fix incorrect sizeof on args.src an args.dst
    d34ecf4949de spi: fsl-lpspi: fix only one cs-gpio working
    9f3a2e147f0e drm/amdgpu/sriov: workaround on rev_id for Navi12 under sriov
    750a95d63746 uio: fix a sleep-in-atomic-context bug in uio_dmem_genirq_irqcontrol()
    b2f28d11f2a1 raid6/test: fix a compilation error
    448563605d98 net: ethernet: ixp4xx: Standard module init
    b5d649f14470 sparc: Add .exit.data section.
    c09d0bd924ac MIPS: Loongson: Fix potential NULL dereference in loongson3_platform_init()
    ed140997f80c efi/x86: Map the entire EFI vendor string before copying it
    04a5bebd7789 pinctrl: baytrail: Do not clear IRQ flags on direct-irq enabled pins
    9ad79d4fa032 IB/core: Let IB core distribute cache update events
    f606721660a6 kernel/module: Fix memleak in module_add_modinfo_attrs()
    fc3c0fc85d69 media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdisp_device_run()
    bc4730880281 char/random: silence a lockdep splat with printk()
    0b455673e7c4 x86/fpu: Deactivate FPU state after failure during state load
    9b743915bd00 iommu/vt-d: Fix off-by-one in PASID allocation
    739abce96dd0 gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_irq_map/unmap()
    e715aa99c502 clk: meson: meson8b: make the CCF use the glitch-free mali mux
    271b18405eb0 powerpc/powernv/iov: Ensure the pdn for VFs always contains a valid PE number
    2f812301bacf clk: at91: sam9x60: fix programmable clock prescaler
    e1e1cdbc646f media: sun4i-csi: Fix [HV]sync polarity handling
    65fbde986aef media: sun4i-csi: Fix data sampling polarity handling
    f5076ea1bc9d media: sun4i-csi: Deal with DRAM offset
    cb514c01f6e4 media: i2c: mt9v032: fix enum mbus codes and frame sizes
    ecb8ea6f93e5 media: ov5640: Fix check for PLL1 exceeding max allowed rate
    9c76a7b28edc pxa168fb: Fix the function used to release some memory in an error handling path
    4a8bb7ce9f0b drm/msm/adreno: fix zap vs no-zap handling
    4aa148666a70 drm/mipi_dbi: Fix off-by-one bugs in mipi_dbi_blank()
    d21cc4ea7a82 printk: fix exclusive_console replaying
    f46afae807aa pinctrl: sh-pfc: sh7264: Fix CAN function GPIOs
    fcc0000109b0 gianfar: Fix TX timestamping with a stacked DSA driver
    c324effa6d9d ALSA: ctl: allow TLV read operation for callback type of element in locked case
    4125714ce1d6 ext4: fix ext4_dax_read/write inode locking sequence for IOCB_NOWAIT
    348a7ccdb9f0 leds: pca963x: Fix open-drain initialization
    4e2d5e3eb865 drm/amd/display: Map ODM memory correctly when doing ODM combine
    b3224bf30709 PCI: Fix pci_add_dma_alias() bitmask size
    071963d37143 brcmfmac: Fix use after free in brcmf_sdio_readframes()
    55195593a8c6 brcmfmac: Fix memory leak in brcmf_p2p_create_p2pdev()
    c4d0a90b5029 cpu/hotplug, stop_machine: Fix stop_machine vs hotplug order
    4d7f8ca608b2 clk: meson: pll: Fix by 0 division in __pll_params_to_rate()
    343fc9a26887 media: meson: add missing allocation failure check on new_buf
    85275286d118 f2fs: call f2fs_balance_fs outside of locked page
    678b25bfd983 f2fs: preallocate DIO blocks when forcing buffered_io
    255edefeb0b8 rcu: Fix data-race due to atomic_t copy-by-value
    b7725deb9d61 rcu: Fix missed wakeup of exp_wq waiters
    3ece067c12e1 rcu/nocb: Fix dump_tree hierarchy print always active
    2339f7a55c84 drm/qxl: Complete exception handling in qxl_device_init()
    3deb6e993ec4 wil6210: fix break that is never reached because of zero'ing of a retry counter
    281ebbcdee49 ath10k: Fix qmi init error handling
    726196728c2c drm/gma500: Fixup fbdev stolen size usage evaluation
    60e055d59d0e net/sched: flower: add missing validation of TCA_FLOWER_FLAGS
    58cd462bc5b1 net/sched: matchall: add missing validation of TCA_MATCHALL_FLAGS
    d9bc012b4a47 net: dsa: tag_qca: Make sure there is headroom for tag
    42dd56266b9f net/smc: fix leak of kernel memory to user space
    f1f2eea30d19 enic: prevent waking up stopped tx queues over watchdog reset
    8f22873582a7 core: Don't skip generic XDP program execution for cloned SKBs
    2d636a1263be Linux 5.4.21
    c10cfc131c0b mmc: core: Rework wp-gpio handling
    b0ad23142a2a gpio: add gpiod_toggle_active_low()
    2cbbe28c734b KVM: x86/mmu: Fix struct guest_walker arrays for 5-level paging
    ac3aea49cc35 ext4: choose hardlimit when softlimit is larger than hardlimit in ext4_statfs_project()
    9275ae515385 jbd2: do not clear the BH_Mapped flag when forgetting a metadata buffer
    f09998f7a11f jbd2: move the clearing of b_modified flag to the journal_unmap_buffer()
    0e365eafbcaa Revert "drm/sun4i: drv: Allow framebuffer modifiers in mode config"
    590d35beddcc NFSv4.1 make cachethis=no for writes
    7bee7eabf0ed perf stat: Don't report a null stalled cycles per insn metric
    1164c3380958 KVM: x86: Mask off reserved bit from #DB exception payload
    ec86856b4672 arm64: dts: fast models: Fix FVP PCI interrupt-map property
    51a610a5c88d cifs: fix mount option display for sec=krb5i
    db5a68ffad2a mac80211: fix quiet mode activation in action frames
    671338889e8f hwmon: (pmbus/ltc2978) Fix PMBus polling of MFR_COMMON definitions.
    98509dfe6f25 perf/x86/intel: Fix inaccurate period in context switch for auto-reload
    1d2a31baf6b6 spmi: pmic-arb: Set lockdep class for hierarchical irq domains
    9f6f61c61a84 sched/uclamp: Reject negative values in cpu_uclamp_write()
    115402ee80ce s390/time: Fix clk type in get_tod_clock
    ae88de70c254 RDMA/core: Fix protection fault in get_pkey_idx_qp_list
    2c753af06f23 RDMA/rxe: Fix soft lockup problem due to using tasklets in softirq
    8662e612ae4c RDMA/hfi1: Fix memory leak in _dev_comp_vect_mappings_create
    b860a4524217 RDMA/iw_cxgb4: initiate CLOSE when entering TERM
    c60c4b4b6bf2 RDMA/core: Fix invalid memory access in spec_filter_size
    8a14f01c4d0f IB/umad: Fix kernel crash while unloading ib_umad
    6603342a6060 IB/rdmavt: Reset all QPs when the device is shut down
    b16dfda32ca5 IB/hfi1: Close window for pq and request coliding
    327f33e54c7f IB/hfi1: Acquire lock to release TID entries when user file is closed
    e30e30c042fe IB/mlx5: Return failure when rts2rts_qp_counters_set_id is not supported
    cf0ea974b6a2 drivers: ipmi: fix off-by-one bounds check that leads to a out-of-bounds write
    5e9f573dc8e7 nvme: fix the parameter order for nvme_get_log in nvme_get_fw_slot_info
    fa3c053b8313 bus: moxtet: fix potential stack buffer overflow
    279c15b917ec drm/panfrost: Make sure the shrinker does not reclaim referenced BOs
    3ea7f138cec1 drm/vgem: Close use-after-free race in vgem_gem_create
    9ea66515918e s390/uv: Fix handling of length extensions
    9e6874da9446 s390/pkey: fix missing length of protected key on return
    ebc3ddc1a255 perf/x86/amd: Add missing L2 misses event spec to AMD Family 17h's event map
    db6f68908bce KVM: nVMX: Use correct root level for nested EPT shadow page tables
    ce8b9b8032bd EDAC/mc: Fix use-after-free and memleaks during device removal
    b2e977a9731f EDAC/sysfs: Remove csrow objects on errors
    03f6c2bf9562 cifs: make sure we do not overflow the max EA buffer size
    ff04f342f8c4 xprtrdma: Fix DMA scatter-gather list mapping imbalance
    22f15745c4e7 arm64: ssbs: Fix context-switch when SSBS is present on all CPUs
    4267ba3bac6d gpio: xilinx: Fix bug where the wrong GPIO register is written to
    8791bb8f8471 ARM: npcm: Bring back GPIOLIB support
    cafaf6bcce60 btrfs: log message when rw remount is attempted with unclean tree-log
    2655c88c03e8 btrfs: print message when tree-log replay starts
    f3cdf024ed19 btrfs: ref-verify: fix memory leaks
    bf4a9715a914 Btrfs: fix race between using extent maps and merging them
    c43f560acc85 ext4: improve explanation of a mount failure caused by a misconfigured kernel
    94f0fe04da78 ext4: add cond_resched() to ext4_protect_reserved_inode
    5b0a26514d6c ext4: fix checksum errors with indexed dirs
    449e607322d7 ext4: fix support for inode sizes > 1024 bytes
    f080204b677d ext4: don't assume that mmp_nodename/bdevname have NUL
    86c30da1b684 ALSA: usb-audio: Add clock validity quirk for Denon MC7000/MCX8000
    67d49871f8e4 ALSA: usb-audio: sound: usb: usb true/false for bool return type
    c3b35c87e5b6 ACPI: PM: s2idle: Prevent spurious SCIs from waking up the system
    303740645567 ACPICA: Introduce acpi_any_gpe_status_set()
    0671627a5faa ACPI: PM: s2idle: Avoid possible race related to the EC GPE
    b9f78af90d92 ACPI: EC: Fix flushing of pending work
    25487999ca3a ALSA: usb-audio: Apply sample rate quirk for Audioengine D1
    2b7e7004970a ALSA: hda/realtek - Fix silent output on MSI-GL73
    1e73c5eae8c6 ALSA: hda/realtek - Add more codec supported Headset Button
    c28273b42c95 ALSA: usb-audio: Fix UAC2/3 effect unit parsing
    2323beb68436 Input: synaptics - remove the LEN0049 dmi id from topbuttonpad list
    efca0d73501a Input: synaptics - enable SMBus on ThinkPad L470
    c6426ba5731b Input: synaptics - switch T470s to RMI4 by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 964d2fe674..1c238c9b88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e3a0470f1ebedce56d1c924f8ac8d3638f52304c"
-SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
+SRCREV_machine ?= "f617c0993374d56792e266e37606d424166b1edd"
+SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.20"
+LINUX_VERSION ?= "5.4.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 47fcc98d93..193bd9ba77 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.20"
+LINUX_VERSION ?= "5.4.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f0aeaeffb8ba6d0c24f9f0212fd7a11866c918b8"
-SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
+SRCREV_machine_qemuarm ?= "d361ce4ddedafa6d504d726c5da098d32f46886e"
+SRCREV_machine ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 53d5652446..ab7c646fec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "aa91aac123d12d9d4f420862238a437781fe3825"
-SRCREV_machine_qemuarm64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_machine_qemumips ?= "6cb162ab5262318fc52a7cbef86afcf48c6b2449"
-SRCREV_machine_qemuppc ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_machine_qemuriscv64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_machine_qemux86 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_machine_qemux86-64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_machine_qemumips64 ?= "fcbec8b4f0f2f24a31ce5c6e6439c69f7512fb31"
-SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
-SRCREV_meta ?= "13a856e7e5df0d8f951bd4060ac441cf35925c9e"
+SRCREV_machine_qemuarm ?= "3745c440f4781ffaab809f999c14da1abd3457bb"
+SRCREV_machine_qemuarm64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_machine_qemumips ?= "eb0e84ae58eb7a88a48bdbddfb53095228840974"
+SRCREV_machine_qemuppc ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_machine_qemuriscv64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_machine_qemux86 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_machine_qemux86-64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_machine_qemumips64 ?= "7ca67eee407193dff5132da8bacc036f670faaea"
+SRCREV_machine ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
+SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.20"
+LINUX_VERSION ?= "5.4.23"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


