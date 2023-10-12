Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89883C46CA1
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:13 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.18836.1697132348733512951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWLFe06q;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41819a68143so7687961cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132348; x=1697737148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D88R7DyJATDTrLS2J42B4WCQcmZoo2ltCvTYm0zar+s=;
        b=fWLFe06q2GXG3OSLMGG+FHLrPUPgGfLtbPzWrCpWPySGFiO/LnI5b9/dBSKmTutqTp
         aGHZaimkjBeNEISgscA2ky0PdtJykVjPvCJYEejkG/VLPa3jUWuUDgbmutxba+MrEe5o
         b3gEyuFygfM6Btr+UKZzzWqeI3QES6m4ziT7NqPKUs7EgcFZor7+A1ZybC6MPt4oIrSE
         3uiduGhYjrilT0ylG4euSRVOPYS7w1owojC71TXNKSxkBR/+hqtQlaqxZuBXCFQDXBcq
         +h0pRr7QTJguREsQz6VGxFMtnsuxzKfzr06yCWuDZ0XU/SB+sW4HNBIhj11pkGQ/XEPC
         IKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132348; x=1697737148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D88R7DyJATDTrLS2J42B4WCQcmZoo2ltCvTYm0zar+s=;
        b=jTDrNSpoKZjPBAh4qQStTudDgVGZRjJaUS+7z5FmLd/75n3/Hhkzv0thopwWR2yEki
         wrD1T3XZ8cIMfimTHkkFrsxUaLztwn6A+dS8EsWQOEks1Hk1VSBJwGCgPhYMscdurvm0
         PUHDUa2r41K2ecZcBrn/arV9P99jZqNF67cs7mS498ukKuJTtzzkh4JCS75wh0jhpTJs
         nnkFzxTHFJIY/erECeoKx+s0IYvaTmZ6QU0M0WGsd8Il2ADyHDlEzlGrLpEExM/0oyC1
         y7Nw5r+xxVna0EucKY+SsMN/JofVLapyYDn/1LH+Lyh40O1/CkZnAwcIbQtarnWvXCbz
         Xx3g==
X-Gm-Message-State: AOJu0YxF9sZjvP/DZSecw3nqtiHMmaADyRg5ew48JVKQZ6DZfdufeenQ
	wUKOjqBS5IpXcyQKG3TQlhpHzXYJ4JEENsMH
X-Google-Smtp-Source: AGHT+IFlRQxk946qAp9KVgp4Xgrf+SrUlTe71i9SxVQdZ+dt87V0Yuyag6fkvmqC9DI3t8RjRMI08g==
X-Received: by 2002:a05:622a:1183:b0:418:a0f:90ef with SMTP id m3-20020a05622a118300b004180a0f90efmr29155131qtk.20.1697132347471;
        Thu, 12 Oct 2023 10:39:07 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/6.5: update to v6.5.6
Date: Thu, 12 Oct 2023 13:38:57 -0400
Message-Id: <32879ba321d343c168e55c271b8e3652a95729a8.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697132218.git.bruce.ashfield@gmail.com>
References: <cover.1697132218.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0c3f363d1c15 Linux 6.5.6
    5e286056667a ASoC: amd: yc: Fix a non-functional mic on Lenovo 82TL
    44befc89397e mm, memcg: reconsider kmem.limit_in_bytes deprecation
    471ce44a1f30 memcg: drop kmem.limit_in_bytes
    3f47b0391bae rbd: take header_rwsem in rbd_dev_refresh() only when updating
    907f4f29789e rbd: decouple parent info read-in from updating rbd_dev
    d1de64c03983 rbd: decouple header read-in from updating rbd_dev->header
    d0373eb1a755 rbd: move rbd_dev_refresh() definition
    43b63e088887 drm/meson: fix memory leak on ->hpd_notify callback
    79aec38ba852 drm/amd/display: fix the ability to use lower resolution modes on eDP
    fc69646fc8f5 drm/amdkfd: Use gpu_offset for user queue's wptr
    bc15bb91460a fs: binfmt_elf_efpic: fix personality for ELF-FDPIC
    1d6b34da02b5 power: supply: ab8500: Set typing and props
    883d5811c528 power: supply: rk817: Add missing module alias
    280fe281c89b drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top
    c81803b432c6 i915: Limit the length of an sg list to the requested length
    b6bb3bcb8238 ata: libata-sata: increase PMP SRST timeout to 10s
    5514987aef4a ata: libata-core: Do not register PM operations for SAS ports
    78b7119f3bed ata: libata-core: Fix port and device removal
    dfc77502d6e7 ata: libata-core: Fix ata_port_request_pm() locking
    459ee86211d4 tracing/user_events: Align set_bit() address for all archs
    0c116005af55 fs/smb/client: Reset password pointer to NULL
    ddf013bc905e thermal: sysfs: Fix trip_point_hyst_store()
    5aaa6b31f149 net: thunderbolt: Fix TCPv6 GSO checksum calculation
    5fb40c7de8d7 bpf: Fix BTF_ID symbol generation collision in tools/
    7037b8dc206a bpf: Fix BTF_ID symbol generation collision
    f2a76aeeee1b bpf: Add override check to kprobe multi link attach
    8bcf70d787f7 media: uvcvideo: Fix OOB read
    d82b1eaf9071 btrfs: properly report 0 avail for very full file systems
    ef1054fb901a btrfs: fix race between reading a directory and adding entries to it
    73b4e302165b btrfs: set last dir index to the current last index when opening dir
    59a051389e14 btrfs: file_remove_privs needs an exclusive lock in direct io write
    7bcb92540536 btrfs: refresh dir last index during a rewinddir(3) call
    fed9f0c06f65 ring-buffer: Update "shortest_full" in polling
    01cba4eece7d ring-buffer: Fix bytes info in per_cpu buffer stats
    8067b844c920 cxl/pci: Fix appropriate checking for _OSC while handling CXL RAS registers
    560e15b9b48f cxl/port: Fix cxl_test register enumeration regression
    7bc7cbf9ef69 mm: memcontrol: fix GFP_NOFS recursion in memory.high enforcement
    eaf409c8d4b1 mm: page_alloc: fix CMA and HIGHATOMIC landing on the wrong buddy list
    51988be187b0 mm/slab_common: fix slab_caches list corruption after kmem_cache_destroy()
    4fbc764c91eb mm: mempolicy: keep VMA walk if both MPOL_MF_STRICT and MPOL_MF_MOVE are specified
    23264bdc2bad selftests/mm: fix awk usage in charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may cause error
    6b522001693a mm/damon/vaddr-test: fix memory leak in damon_do_test_apply_three_regions()
    2f5a4cff85fa arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
    ee24e16620cd cxl/mbox: Fix CEL logic for poison and security commands
    3397cc43c6dd drm/tests: Fix incorrect argument in drm_test_mm_insert_range
    1bd4f97552d4 timers: Tag (hr)timer softirq as hotplug safe
    26a70537ffc0 ACPI: NFIT: Fix incorrect calculation of idt size
    532f992935e3 NFSv4: Fix a state manager thread deadlock regression
    975df6b0c34c Revert "SUNRPC dont update timeout value on connection reset"
    e8d3df1df766 sched/rt: Fix live lock between select_fallback_rq() and RT push
    9f3f2a3acdfb kernel/sched: Modify initial boot task idle setup
    fefec7fbd90a ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
    af57b1747772 i2c: i801: unregister tco_pdev in i801_probe() error path
    a4f5f1e846d8 io_uring/fs: remove sqe->rw_flags checking from LINKAT
    47cd820721d6 ata: libata-scsi: ignore reserved bits for REPORT SUPPORTED OPERATION CODES
    2bbeebe203d2 scsi: sd: Do not issue commands to suspended disks on shutdown
    dc5ab9e18489 scsi: sd: Differentiate system and runtime start/stop management
    b1a076133d4c ata: libata-scsi: link ata port and scsi device
    2447c5b947bd LoongArch: Add support for 64_PCREL relocation type
    d5725efed545 LoongArch: Add support for 32_PCREL relocation type
    fa9874928dcb LoongArch: numa: Fix high_memory calculation
    e10bf1871b11 LoongArch: Define relocation types for ABI v2.10
    eb9681d36bbc LoongArch: Fix lockdep static memory detection
    e9b20aa75921 ALSA: hda: Disable power save for solving pop issue on Lenovo ThinkCentre M70q
    d8bbfab02d1a ALSA: rawmidi: Fix NULL dereference at proc read
    3eb82c2bd446 crypto: sm2 - Fix crash caused by uninitialized context
    28df4646ad8b nilfs2: fix potential use after free in nilfs_gccache_submit_read_data()
    3345cc5f02f1 serial: 8250_port: Check IRQ data before use
    37ee7bd247fc scsi: core: ata: Do no try to probe for CDL on old drives
    2bff660e0ff3 Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
    f8d2e6429139 misc: rtsx: Fix some platforms can not boot and move the l1ss judgment to probe
    02447cd84afc mptcp: process pending subflow error on close
    6be989cb472e mptcp: move __mptcp_error_report in protocol.c
    2bef7c8c3950 mptcp: fix bogus receive window shrinkage with multiple subflows
    9e52fd594992 KVM: x86/mmu: Stop zapping invalidated TDP MMU roots asynchronously
    f1f5d279d7e8 KVM: x86/mmu: Do not filter address spaces in for_each_tdp_mmu_root_yield_safe()
    f654c202a318 KVM: x86/mmu: Open code leaf invalidation from mmu_notifier
    c416989d0b8e KVM: SVM: Fix TSC_AUX virtualization setup
    822425a9d40c KVM: SVM: INTERCEPT_RDTSCP is never intercepted anyway
    cf43b304b695 x86/srso: Add SRSO mitigation for Hygon processors
    1348f7f15d7c x86/sgx: Resolves SECS reclaim vs. page fault for EAUG race
    3d0d8a6ea424 spi: zynqmp-gqspi: fix clock imbalance on probe failure
    3283a1bce9bb iommu/arm-smmu-v3: Fix soft lockup triggered by arm_smmu_mm_invalidate_range
    71c7428d0dc1 ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
    2f0d613bfca0 perf build: Define YYNOMEM as YYNOABORT for bison < 3.81
    c8745e60f29d fbdev/sh7760fb: Depend on FB=y
    19878758accf LoongArch: Set all reserved memblocks on Node#0 at initialization
    560e49419100 LoongArch: Use _UL() and _ULL()
    55aba54dea4a i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low
    73ab62301400 gfs2: fix glock shrinker ref issues
    f057b2c710a0 tsnep: Fix NAPI polling with budget 0
    11a5377e0925 tsnep: Fix ethtool channels
    e36aa9fa253b tsnep: Fix NAPI scheduling
    10ee8a00cb0e net: hsr: Add __packed to struct hsr_sup_tlv.
    c656c63e6264 ncsi: Propagate carrier gain/loss events to the NCSI controller
    c91f3228fa94 powerpc/watchpoints: Annotate atomic context in more places
    3799888a6b88 powerpc/watchpoint: Disable pagefaults when getting user instruction
    98ac791d4000 powerpc/watchpoints: Disable preemption in thread_change_pc()
    633f3563b2a4 ASoC: SOF: Intel: MTL: Reduce the DSP init timeout
    f0bd27149966 NFSv4.1: fix zero value filehandle in post open getattr
    1e1f2aeb7337 media: vb2: frame_vector.c: replace WARN_ONCE with a comment
    767176f849bf ASoC: SOF: sof-audio: Fix DSP core put imbalance on widget setup failure
    dfc15af9edfd ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
    4a8e6742b0d0 memblock tests: fix warning ‘struct seq_file’ declared inside parameter list
    b46983198d21 memblock tests: fix warning: "__ALIGN_KERNEL" redefined
    c12eda0a22ce ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()
    12bf8311da03 firmware: cirrus: cs_dsp: Only log list of algorithms in debug build
    682659829e96 ASoC: cs42l42: Avoid stale SoundWire ATTACH after hard reset
    a5188f7fedaf ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
    068b0f7e07bd ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
    daac7df91691 ALSA: hda: intel-sdw-acpi: Use u8 type for link index
    df28f6bbc8aa ASoC: rt5640: Only cancel jack-detect work on suspend if active
    8db07f90f281 bpf: Clarify error expectations from bpf_clone_redirect
    1d50dcc52012 spi: intel-pci: Add support for Granite Rapids SPI serial flash
    75ebf2efb708 ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
    5c96cfcf7057 spi: stm32: add a delay before SPI disable
    d83f069fcbe2 spi: nxp-fspi: reset the FLSHxCR1 registers
    db7632bd3845 Add DMI ID for MSI Bravo 15 B7ED
    c2b53434df7a ata: libata-eh: do not thaw the port twice in ata_eh_reset()
    e86c64afbbec ata: libata-eh: do not clear ATA_PFLAG_EH_PENDING in ata_eh_reset()
    1aaff2ce9493 smb3: correct places where ENOTSUPP is used instead of preferred EOPNOTSUPP
    22e6d783a330 scsi: pm80xx: Avoid leaking tags when processing OPC_INB_SET_CONTROLLER_CONFIG command
    6ee6128efb3a scsi: pm80xx: Use phy-specific SAS address when sending PHY_START command
    4ce28dbbbedf riscv: errata: fix T-Head dcache.cva encoding
    b62561b266f8 nvme-pci: do not set the NUMA node of device if it has none
    9e35b16b2fa6 objtool: Fix _THIS_IP_ detection for cold functions
    109063d6b222 drm/amdgpu: Handle null atom context in VBIOS info ioctl
    bfd7ecee601d drm/amdkfd: Checkpoint and restore queues on GFX11
    ea3f2bff5ab7 drm/amdgpu: fallback to old RAS error message for aqua_vanjaram
    a663c199b4d6 drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV
    c634d78245b2 drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
    c1faca7fa88c drm/amd/display: Don't check registers, if using AUX BL control
    8e47e585b630 drm/amdkfd: Update CU masking for GFX 9.4.3
    8ffd9453dc2b drm/amdkfd: Update cache info reporting for GFX v9.4.3
    830807d1fb11 drm/amdgpu: Store CU info from all XCCs for GFX v9.4.3
    652ba144b190 thermal/of: add missing of_node_put()
    99c535d97092 platform/x86: asus-wmi: Support 2023 ROG X16 tablet mode
    511784d9e480 platform/mellanox: mlxbf-bootctl: add NET dependency into Kconfig
    164eaebff0af efi/x86: Ensure that EFI_RUNTIME_MAP is enabled for kexec
    79c6bb2be2c0 ata: sata_mv: Fix incorrect string length computation in mv_dump_mem()
    812e69bfc445 net/smc: bugfix for smcr v2 server connect success statistic
    75fc9e99b3a7 ring-buffer: Do not attempt to read past "commit"
    c06f3b07566f selftests: fix dependency checker script
    806bd126ec5d btrfs: assert delayed node locked when removing delayed item
    8e35b261e381 ring-buffer: Avoid softlockup in ring_buffer_resize()
    6c9ceeaa275e selftests/ftrace: Correctly enable event in instance-event.tc
    f75e0670d511 scsi: ufs: core: Poll HCS.UCRDY before issuing a UIC command
    129dbfdd8281 scsi: ufs: core: Move __ufshcd_send_uic_cmd() outside host_lock
    01345a59c6e0 scsi: qedf: Add synchronization between I/O completions and abort
    ef26ca55348b parisc: irq: Make irq_stack_union static to avoid sparse warning
    f1fb571e9141 parisc: drivers: Fix sparse warning
    b398e1bef223 parisc: iosapic.c: Fix sparse warnings
    4f944136c63a parisc: ccio-dma: Fix sparse warnings
    503b10a1a507 parisc: sba-iommu: Fix sparse warnigs
    24aa18b6345a parisc: sba: Fix compile warning wrt list of SBA devices
    dd46b3ac7322 nvme-fc: Prevent null pointer dereference in nvme_fc_io_getuuid()
    4e149d524678 spi: sun6i: fix race between DMA RX transfer completion and RX FIFO drain
    b3c21c9c7289 spi: sun6i: reduce DMA RX transfer width to single byte
    77562272fbf3 ASoC: amd: yc: Add DMI entries to support Victus by HP Gaming Laptop 15-fb0xxx (8A3E)
    e562de67dc91 bpf: Annotate bpf_long_memcpy with data_race
    fe2b811a02c3 dma-debug: don't call __dma_entry_alloc_check_leak() under free_entries_lock
    47f82395f04a ceph: drop messages from MDS when unmounting
    65edea77d700 x86/reboot: VMCLEAR active VMCSes before emergency reboot
    8a017a273b87 NFSD: Fix zero NFSv4 READ results when RQ_SPLICE_OK is not set
    d7863b8f5a4e i2c: npcm7xx: Fix callback completion ordering
    b226972a04ff gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip
    c4648be6b9b3 accel/ivpu: Use cached buffers for FW loading
    59908c76cef7 accel/ivpu: Do not use wait event interruptible
    915847cceb71 i915/guc: Get runtime pm in busyness worker only if already active
    0f61048992ce firmware: arm_ffa: Don't set the memory region attributes for MEM_LEND
    5dbead1a5af8 arm64: dts: imx: Add imx8mm-prt8mm.dtb to build
    55f82f3a1850 arm64: dts: imx8mm-evk: Fix hdmi@3d node
    5648afd7c15b soc: imx8m: Enable OCOTP clock for imx8mm before reading registers
    3cb0f98499e3 arm64: dts: imx8mp-beacon-kit: Fix audio_pll2 clock
    9d8631d09868 arm64: dts: imx8mp: Fix SDMA2/3 clocks
    b949646c3dea selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
    59d64197508f powerpc/stacktrace: Fix arch_stack_walk_reliable()
    70326b46b6a0 power: supply: rk817: Fix node refcount leak
    fe25f30cc326 xtensa: boot/lib: fix function prototypes
    4d00e9ed40d4 xtensa: umulsidi3: fix conditional expression
    6a08d2ca6ca9 xtensa: boot: don't add include-dirs
    21d2beffef85 xtensa: iss/network: make functions static
    27eb66bdf50a xtensa: add default definition for XCHAL_HAVE_DIV32
    50d14cd5a67e firmware: imx-dsp: Fix an error handling path in imx_dsp_setup_channels()
    d9b092769b58 power: supply: core: fix use after free in uevent
    25ef0a06f126 power: supply: rt9467: Fix rt9467_run_aicl()
    274d39581c80 power: supply: ucs1002: fix error code in ucs1002_get_property()
    3eb2c018708a swiotlb: use the calculated number of areas
    8f66e484d4bd bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up
    748b24475001 ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkctrl warning on boot
    9b42678b1ad0 ARM: dts: ti: omap: Fix bandgap thermal cells addressing for omap3/4
    e4e01cd5219c clk: tegra: fix error return case for recalc_rate
    99b5d9adf441 clk: si521xx: Fix regmap write accessor
    b0fe3096662c clk: si521xx: Use REGCACHE_FLAT instead of NONE
    72df907bef8f clk: sprd: Fix thm_parents incorrect configuration
    3a847712a1f6 power: supply: mt6370: Fix missing error code in mt6370_chg_toggle_cfo()
    3aeffe442077 firmware: arm_scmi: Fixup perf power-cost/microwatt support
    a6575f349ffa firmware: arm_scmi: Harden perf domain info access
    4d3f6b2a2f13 bus: ti-sysc: Fix missing AM35xx SoC matching
    45071e27a00c bus: ti-sysc: Use fsleep() instead of usleep_range() in sysc_reset()
    27dc0d54b296 spi: spi-gxp: BUG: Correct spi write return value
    45e91af6a929 MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled
    52093779b183 vfio/mdev: Fix a null-ptr-deref bug for mdev_unregister_parent()
    56ad3015e39e btrfs: reset destination buffer when read_extent_buffer() gets invalid range
    aaa8ceca93fa direct_write_fallback(): on error revert the ->ki_pos update from buffered write
    82dacd0ca0d9 arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
    2b4c845a613b drm/amd/display: fix a regression in blank pixel data caused by coding mistake
    5934e2ab73f5 drm/amd/display: Update DPG test pattern programming
    4b839049cc5c ASoC: cs35l56: Disable low-power hibernation mode
    2c4cc4d787a5 drm/amdgpu: set completion status as preempted for the resubmission
    cb665adeec45 i2c: xiic: Correct return value check for xiic_reinit()
    9553546feb29 i2c: mux: gpio: Add missing fwnode_handle_put()
    8406f0fe2ebd i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()
    395f07124431 gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
    76569e3819e0 cifs: Fix UAF in cifs_demultiplex_thread()
    674a8a9f7848 proc: nommu: fix empty /proc/<pid>/maps
    ffe07e1d1a97 proc: nommu: /proc/<pid>/maps: release mmap read lock
    dcdbc22ce055 cxl/region: Match auto-discovered region decoders by HPA range
    3ea4d0745dd4 igc: Expose tx-usecs coalesce setting to user
    2e800300b524 octeontx2-pf: Do xdp_do_flush() after redirects.
    e07515c57749 bnxt_en: Flush XDP for bnxt_poll_nitroa0()'s NAPI
    801cadbde2dd net: ena: Flush XDP packets on error.
    80d51aa81e26 locking/seqlock: Do the lockdep annotation before locking in do_write_seqcount_begin_nested()
    5a6ad94b6274 drm/virtio: clean out_fence on complete_submit
    eb74cf25a8c8 i915/pmu: Move execlist stats initialization to execlist specific setup
    1751e4498046 net/handshake: Fix memory leak in __sock_create() and sock_alloc_file()
    a10813260193 net: hinic: Fix warning-hinic_set_vlan_fliter() warn: variable dereferenced before check 'hwdev'
    20a93d402b6f netfilter: ipset: Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP
    5e5754e9e77c netfilter: nf_tables: disable toggling dormant table state more than once
    9a226a189aa1 vxlan: Add missing entries to vxlan_get_size()
    069ac51c37a6 net: rds: Fix possible NULL-pointer dereference
    2eebf58ce030 locking/atomic: scripts: fix fallback ifdeffery
    cac50d9f5d87 team: fix null-ptr-deref when team device type is changed
    f2ef4cb4d418 net: bridge: use DEV_STATS_INC()
    5b7321f5384d net: hns3: add 5ms delay before clear firmware reset irq source
    4d22d1d8d5ad net: hns3: fix fail to delete tc flower rules during reset issue
    43302d93a495 net: hns3: only enable unicast promisc when mac table full
    07810b795ce4 net: hns3: fix GRE checksum offload issue
    8399206e694c net: hns3: add cmdq check for vf periodic service task
    e3cb8b2c391b x86/srso: Fix SBPB enablement for spec_rstack_overflow=off
    96834afc3e49 x86/srso: Don't probe microcode in a guest
    afae367e91c8 x86/srso: Set CPUID feature bits independently of bug or mitigation status
    67418b4b4f13 x86/srso: Fix srso_show_state() side effect
    fdcc085dec3c x86/asm: Fix build of UML with KASAN
    744eeabd7157 platform/x86: intel_scu_ipc: Fail IPC send if still busy
    618aa01f7ff5 platform/x86: intel_scu_ipc: Don't override scu in intel_scu_ipc_dev_simple_command()
    09e1a620f708 platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
    341a8fd4eef4 platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
    4b53879b9f50 net: hsr: Properly parse HSRv1 supervisor frames.
    d2dfbc0e3b7a x86/mm, kexec, ima: Use memblock_free_late() from ima_free_kexec_buffer()
    1512d8f45d3c dccp: fix dccp_v4_err()/dccp_v6_err() again
    82c302f3eb99 powerpc/dexcr: Move HASHCHK trap handler
    1f55797de0ef powerpc/perf/hv-24x7: Update domain value check
    502386ae61f9 scsi: iscsi_tcp: restrict to TCP sockets
    cda20fcddf53 ipv4: fix null-deref in ipv4_link_failure
    f82def005375 igc: Fix infinite initialization loop with early XDP redirect
    04fe6c09129b ionic: fix 16bit math issue when PAGE_SIZE >= 64KB
    c3bfd4588b89 netfilter, bpf: Adjust timeouts of non-confirmed CTs in bpf_ct_insert_entry()
    eefc7f7f6a52 i40e: Fix VF VLAN offloading when port VLAN is configured
    3680526cbbee iavf: schedule a request immediately after add/delete vlan
    abab434231b5 iavf: add iavf_schedule_aq_request() helper
    867009dcfbd1 ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful
    d4d1fdaaace7 iavf: do not process adminq tasks when __IAVF_IN_REMOVE_TASK is set
    21645c352038 octeon_ep: fix tx dma unmap len values in SG
    6a2dbdd1f0f2 ASoC: imx-audmix: Fix return error with devm_clk_get()
    62a09e61afa2 ASoC: hdaudio.c: Add missing check for devm_kstrdup
    ac451e0a4700 ALSA: seq: ump: Fix -Wformat-truncation warning
    48e105a2a1a1 net/core: Fix ETH_P_1588 flow dissector
    959a41af6a8f selftests: tls: swap the TX and RX sockets in some tests
    e4f3cc315dc2 net: microchip: sparx5: Fix possible memory leaks in vcap_api_kunit
    7e7c9e2de0d1 net: microchip: sparx5: Fix possible memory leaks in test_vcap_xn_rule_creator()
    ef75ee8184ea net: microchip: sparx5: Fix possible memory leak in vcap_api_encode_rule_test()
    af47fc1fa713 net: microchip: sparx5: Fix memory leak for vcap_api_rule_add_actionvalue_test()
    79c19b1e55ea net: microchip: sparx5: Fix memory leak for vcap_api_rule_add_keyvalue_test()
    4e579e8297a3 ASoC: SOF: ipc4-topology: fix wrong sizeof argument
    ef2b3d6e6a33 memblock tests: Fix compilation errors.
    144ed54ed6ec uapi: stddef.h: Fix __DECLARE_FLEX_ARRAY for C++
    721045f22e1a uapi: stddef.h: Fix header guard location
    cc17adeef726 Compiler Attributes: counted_by: Adjust name and identifier expansion
    1f5b5fdb6727 netfilter: nf_tables: Fix entries val in rule reset audit log
    130fa1f00cb0 netfilter: conntrack: fix extension size table
    38afb9f69871 ALSA: hda/realtek: Splitting the UX3402 into two separate models
    10e7799c43f8 selftests/bpf: fix unpriv_disabled check in test_verifier
    364f95cd7026 bpf: Fix a erroneous check after snprintf()
    1b32bfcae2db ASoC: rt5640: Fix IRQ not being free-ed for HDA jack detect mode
    9d9211b46965 ASoC: rt5640: Enable the IRQ on resume after configuring jack-detect
    55b34a5041a0 ASoC: rt5640: Do not disable/enable IRQ twice on suspend/resume
    eae3f68df4d6 ASoC: rt5640: fix typos
    b049adc8602d ASoC: rt5640: Fix sleep in atomic context
    4dcbd5acd51d ASoC: rt5640: Revert "Fix sleep in atomic context"
    0c1fb88020c8 ALSA: seq: Avoid delivery of events for disabled UMP groups
    66ea3d810245 ALSA: docs: Fix a typo of midi2_ump_probe option for snd-usb-audio
    8680cf1f96a7 bpf: Avoid dummy bpf_offload_netdev in __bpf_prog_dev_bound_init
    232f0ba4d692 bpf: Avoid deadlock when using queue and stack maps from NMI
    6c2e14525d45 netfilter: nf_tables: disallow element removal on anonymous sets
    ae57621daf86 ASoC: meson: spdifin: start hw on dai probe
    13f385f99147 netfilter: nf_tables: disallow rule removal from chain binding
    4aea243b6853 netfilter: nf_tables: fix memleak when more than 255 elements expired
    12c8124b9e21 netfilter: nft_set_hash: try later when GC hits EAGAIN on iteration
    db15e180fa4b netfilter: nft_set_pipapo: stop GC iteration if GC transaction allocation fails
    1e478aa1bfec netfilter: nft_set_pipapo: call nft_trans_gc_queue_sync() in catchall GC
    1b37e05e9b4b netfilter: nft_set_rbtree: use read spinlock to avoid datapath contention
    52bb9b7a5333 ext4: do not let fstrim block system suspend
    5b4773177e28 ext4: move setting of trimmed bit into ext4_try_to_trim_range()
    6f41e50bf16a ext4: replace the traditional ternary conditional operator with with max()/min()
    d10fd53393cc btrfs: remove BUG() after failure to insert delayed dir index item
    e6dbd0bb6946 btrfs: improve error message after failure to add delayed dir index item
    d9f5537479d4 netfs: Only call folio_start_fscache() one time for each folio
    b839de5296cc gfs2: Fix another freeze/thaw hang
    6f54da8aaee7 media: via: Use correct dependency for camera sensor drivers
    4945a4af1495 media: v4l: Use correct dependency for camera sensor drivers
    d1db10f1918d NFSv4.1: fix pnfs MDS=DS session trunking
    0317d19e26e3 NFSv4.1: use EXCHGID4_FLAG_USE_PNFS_DS for DS server
    7b5955944a94 SUNRPC: Mark the cred for revalidation if the server rejects it
    5110e5473f83 NFS/pNFS: Report EINVAL errors from connect() to the server
    8d847b5c51c1 NFS: More fixes for nfs_direct_write_reschedule_io()
    ad986ce7ef8a NFS: Use the correct commit info in nfs_join_page_group()
    0449e8f4ceff NFS: More O_DIRECT accounting fixes for error paths
    8d11e1e0aa21 NFS: Fix O_DIRECT locking issues
    2aed39c39e9e NFS: Fix error handling for O_DIRECT write scheduling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index f70d77e06a..24ee65d676 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "712b8fb1342bf829c9ca1e649adc9d112b9c209f"
-SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
+SRCREV_machine ?= "ce1898ae324b07c07206c71cd7dd41d03ddc1348"
+SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.5"
+LINUX_VERSION ?= "6.5.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 716c922c13..4e3c5b5296 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.5"
+LINUX_VERSION ?= "6.5.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
+SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 64399e1e8d..66860bbb9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ff312905898c587e8c8e1b82b59c01b6933c6339"
-SRCREV_machine:qemuarm64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemuloongarch64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemumips ?= "889d009f6f39c91fedb8c7431c2ce649f05a04a9"
-SRCREV_machine:qemuppc ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemuriscv64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemuriscv32 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemux86 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemux86-64 ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_machine:qemumips64 ?= "97c93107649bc6f7fafdf6c3a8b3521f4bfe2246"
-SRCREV_machine ?= "49e3d8448aeaecd8e2bb6b481f26b76514dbe0f5"
-SRCREV_meta ?= "06cf3d8830fda41ff271eec7da6e3c8425df790f"
+SRCREV_machine:qemuarm ?= "4de408a1596ac4035a54580aa639715f1e79e6a4"
+SRCREV_machine:qemuarm64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemuloongarch64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemumips ?= "7c93410587a81d4867c606454133b1be4d6376a8"
+SRCREV_machine:qemuppc ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemuriscv64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemuriscv32 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemux86 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemux86-64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_machine:qemumips64 ?= "a47a17e0dc4753b39804de29aedbc67db90d8a3a"
+SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
+SRCREV_meta ?= "31d86e2adece1709756f6d5d5b2a50cd033a451f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2309983b0ac063045af3b01b0251dfd118d45449"
+SRCREV_machine:class-devupstream ?= "0c3f363d1c150050b2ecec2af04f3c96fa2c66de"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.5"
+LINUX_VERSION ?= "6.5.6"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


