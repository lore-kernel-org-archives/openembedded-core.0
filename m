Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA4BC41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.8990.1720096058175232415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zkPt2Pcc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fa9f540f45so3152925ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096057; x=1720700857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0lTaeBiHYI8ZdffVkUy5itAhpYwQooeNHVSmMVohbQ=;
        b=zkPt2PccOHJ+nCVtFqwBeaDb/HJ2h2SkM8GCsbvjKReoyxPJeiGshGpfLDjAc/r0Ur
         tgmjfqHU+Hr+jEEPrY1Je0Uc8EgHd8u/kYfJoMdT3zSRrqzRAvmT/mCljaz8Fj4qWJxN
         YHyGE8gGJWUvEzZzvUBBdzg/FOYtJfzavdEIVLuHwOGUAdyAuU3rj9Ly0RHNaobiIveH
         gZF6OwbjFpMO0HNYKuOzQe3DM/FTM5wed9Y4qxn3ev1DUuc+WL4zC6V2wPm4Iets8omt
         2753wdtNNaG5pq9VH/m6Zukq495FkrGwCnYdahYZjaEVa2sUPZnIy+hu1loDVbtzbRpg
         yANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096057; x=1720700857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0lTaeBiHYI8ZdffVkUy5itAhpYwQooeNHVSmMVohbQ=;
        b=SnijMX9BdhuUaZOlFhougPkCaZgp2bW+s2sKeIj5wviyW1hbWQUQCR1vcBsRvpwmf7
         s178SAR7zyETW9MZEI7BjwcQAHQe1h8Sl1ljXGHwsmMZAmKoYgdk3gPDczIYTH0NUzFF
         C+gp7BHAJsXIJYxggtXRqiCNqfnYmuh05+P8TO2QrZdgy/PjBdaWTD5XQfnllKYLfEbI
         bUBII8D8ZMsWtEUj4WtMcv5ty/W5GG4Xga7OqAZA5DcUCVCCY2Rt+CtZomISlQ6cBGjW
         1lT1DyAaMALb+d+rMZZztkXySQbOq6jaRjU4Jn+QJ5wdus4Kg9bMQd+wM2EpPxMT1eeX
         5mvw==
X-Gm-Message-State: AOJu0Yyii1BqmHKsu1650+gUjPm54c5LafbUvoqIVFsyKPa5X3ZdKop1
	uqZLDboR0WTvQPUgaclcgUNOS9qt1np6ZvKfTzpT0I845WNaiOUMo57C8IjPxnMxPEWYn1i6xC/
	D
X-Google-Smtp-Source: AGHT+IFXjccK/GL+v0S8XtQbTwJTZBld4WGyfzsqSEvIaMvCjI7b/mrXIETN3aGn7Z8CI+psTqBvaQ==
X-Received: by 2002:a17:902:e84d:b0:1f9:fca9:742a with SMTP id d9443c01a7336-1fb33f0b447mr10570195ad.57.1720096055415;
        Thu, 04 Jul 2024 05:27:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/21] linux-yocto/6.6: update to v6.6.34
Date: Thu,  4 Jul 2024 05:27:00 -0700
Message-Id: <537149dc41df976f504512c99e7bb5deafdd283c.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201550

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    76d42e596d89 Linux 6.6.34
    8353b7f70dd2 smp: Provide 'setup_max_cpus' definition on UP too
    50f3931746b5 selftests: net: more strict check in net_helper
    225de871ddf9 smb: client: fix deadlock in smb2_find_smb_tcon()
    9c3095ad40f9 powerpc/bpf: enforce full ordering for ATOMIC operations with BPF_FETCH
    b48f81d2c3dc ALSA: seq: Fix incorrect UMP type for system messages
    44bc51c08d64 btrfs: fix leak of qgroup extent records after transaction abort
    3d08c52ba188 btrfs: fix crash on racing fsync and size-extending write into prealloc
    e5104cbb146f tracefs: Clear EVENT_INODE flag in tracefs_drop_inode()
    4e84ead3f60a eventfs: Keep the directories from having the same inode number as files
    5ade5fbdbbb1 eventfs: Fix a possible null pointer dereference in eventfs_find_events()
    cbc4dacaa5b1 NFS: Fix READ_PLUS when server doesn't support OP_READ_PLUS
    d6ea0e12befb nfs: fix undefined behavior in nfs_block_bits()
    9191b574d7dc EDAC/igen6: Convert PCIBIOS_* return codes to errnos
    8f84ae504348 EDAC/amd64: Convert PCIBIOS_* return codes to errnos
    0a9007271e3f ALSA: ump: Don't accept an invalid UMP protocol number
    3113ff8e496c ALSA: ump: Don't clear bank selection after sending a program change
    e3ae00ee238b ASoC: SOF: ipc4-topology: Fix input format query of process modules without base extension
    1c7891812d85 genirq/irqdesc: Prevent use-after-free in irq_find_at_or_after()
    aed55acbb929 i3c: master: svc: fix invalidate IBI type and miss call client IBI handler
    e049845096e9 s390/cpacf: Make use of invalid opcode produce a link error
    ab278ff72afc s390/cpacf: Split and rework cpacf query functions
    4c0bfb4e867c s390/ap: Fix crash in AP internal function modify_bitmap()
    b2b685c77ee3 parisc: Define sigset_t in parisc uapi header
    6de4da0f1a5f parisc: Define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
    eea3545abf60 ARM: dts: samsung: exynos4412-origen: fix keypad no-autorepeat
    1a48d7cf6ee5 ARM: dts: samsung: smdk4412: fix keypad no-autorepeat
    0da0e880b8c7 ARM: dts: samsung: smdkv310: fix keypad no-autorepeat
    f7f84721fd77 riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board
    a95df6f04f2c ext4: fix mb_cache_entry's e_refcnt leak in ext4_xattr_block_cache_find()
    b0b47084f5d3 ext4: set type of ac_groups_linear_remaining to __u32 to avoid overflow
    3093e586b019 ext4: Fixes len calculation in mpage_journal_page_buffers
    3194771798ef drm/amdkfd: handle duplicate BOs in reserve_bo_and_cond_vms
    58ce0788c75f sparc: move struct termio to asm/termios.h
    5af198c38712 net: fix __dst_negative_advice() race
    ea303a7af85b kdb: Use format-specifiers rather than memset() for padding in kdb_read()
    e00ec562b0e0 kdb: Merge identical case statements in kdb_read()
    958ba65a3590 kdb: Fix console handling when editing and tab-completing commands
    d373d3c633dc kdb: Use format-strings rather than '\0' injection in kdb_read()
    107e825cc448 kdb: Fix buffer overflow during tab-complete
    4c09df400284 wifi: ath10k: fix QCOM_RPROC_COMMON dependency
    f07224c16678 bonding: fix oops during rmmod
    8b732150f2e3 watchdog: rti_wdt: Set min_hw_heartbeat_ms to accommodate a safety margin
    766975238305 selftests/mm: fix build warnings on ppc64
    0eb43c377af5 selftests/mm: compaction_test: fix incorrect write of zero to nr_hugepages
    c55d3564ad25 mm/vmalloc: fix vmalloc which may return null if called with __GFP_NOFAIL
    2eeff6e36cd3 mm: /proc/pid/smaps_rollup: avoid skipping vma after getting mmap_lock again
    cb3ea7684a43 mm/hugetlb: pass correct order_per_bit to cma_declare_contiguous_nid
    f317e97da981 mm/cma: drop incorrect alignment check in cma_init_reserved_mem
    3e64c37fe391 sparc64: Fix number of online CPUs
    35c8cf7b8a71 rtla/timerlat: Fix histogram report when a cpu count is 0
    bb5afc42c42c intel_th: pci: Add Meteor Lake-S CPU support
    8f893e52b9e0 cpufreq: amd-pstate: Fix the inconsistency in max frequency units
    b54d24eb4a67 tpm_tis: Do *not* flush uninitialized work
    19e85d939001 kmsan: do not wipe out origin when doing partial unpoisoning
    99ed145f4611 mm/ksm: fix ksm_zero_pages accounting
    0a82b46a0172 mm/ksm: fix ksm_pages_scanned accounting
    6c1791130b78 net/9p: fix uninit-value in p9_client_rpc()
    400b8fb66c74 net/ipv6: Fix route deleting failure when metric equals 0
    a19b2bc5d0c4 scsi: core: Handle devices which return an unusually large VPD page count
    6d458d0dcca9 HID: i2c-hid: elan: fix reset suspend current leakage
    90dd0592b3b0 i2c: acpi: Unbind mux adapters before delete
    9ee7a77c150b iomap: fault in smaller chunks for non-large folio mappings
    1f3988ca0d7a filemap: add helper mapping_max_folio_size()
    be0ce3f6ffea mm: fix race between __split_huge_pmd_locked() and GUP-fast
    2e083ef23431 kbuild: Remove support for Clang's ThinLTO caching
    c2d443aa1ae3 crypto: qat - Fix ADF_DEV_RESET_SYNC memory leak
    d14104360c27 crypto: ecrdsa - Fix module auto-load on add_key
    cc3306fb04b1 crypto: ecdsa - Fix module auto-load on add-key
    a68c0c55fa4c clk: qcom: clk-alpha-pll: fix rate setting for Stromer PLLs
    9562dbe5cdbb clk: bcm: rpi: Assign ->num before accessing ->hws
    0dc913217fb7 clk: bcm: dvp: Assign ->num before accessing ->hws
    ca6d6d872a8b LoongArch: Override higher address bits in JUMP_VIRT_ADDR
    ae9e39a2fbf5 LoongArch: Add all CPUs enabled by fdt to NUMA node 0
    93ca96f098f8 KVM: arm64: AArch32: Fix spurious trapping of conditional instructions
    5bff951fedac KVM: arm64: Allow AArch32 PSTATE.M to be restored as System mode
    6660e152e5eb KVM: arm64: Fix AArch32 register narrowing on userspace write
    f79edaf73709 KVM: SVM: WARN on vNMI + NMI window iff NMIs are outright masked
    bb430ea4ba31 Revert "drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices"
    7bc52dce0732 drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms
    f0c5c944c6d8 9p: add missing locking around taking dentry fid list
    4eff07025c84 drm/amdgpu/atomfirmware: add intergrated info v2.3 table
    b8385ff814ca fbdev: savage: Handle err return when savagefb_check_var failed
    bd2ad553f18c drm/fbdev-generic: Do not set physical framebuffer address
    22d04790d656 mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO on Asus T100TA
    b5636348f324 mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
    e000578a3ad3 mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not working
    e236bb53fd6b mmc: sdhci-acpi: Sort DMI quirks alphabetically
    d9ae0aa8ff8f mmc: sdhci: Add support for "Tuning Error" interrupts
    c0a16ff432fe mmc: core: Add mmc_gpiod_set_cd_config() function
    7590da4c04dd mmc: davinci: Don't strip remove function when driver is builtin
    a80d1da923f6 media: v4l: async: Fix notifier list entry init
    001b4825c93b media: v4l: async: Don't set notifier's V4L2 device if registering fails
    87100b092462 media: v4l: async: Properly re-initialise notifier entry in unregister
    dde33147c93a media: v4l2-core: hold videodev_lock until dev reg, finishes
    3e7eeba0d345 media: mxl5xx: Move xpt structures off stack
    77c4cd7e0b38 media: mc: mark the media devnode as registered from the, start
    e80d9db99b7b media: mc: Fix graph walk in media_pipeline_start
    2a24da4cf675 arm64: dts: ti: verdin-am62: Set memory size to 2gb
    3f03a4a9e2f5 arm64: dts: hi3798cv200: fix the size of GICR
    ea17c9aeb6c3 arm64: dts: qcom: sc8280xp: add missing PCIe minimum OPP
    4c59282ad9d3 wifi: rtlwifi: rtl8192de: Fix endianness issue in RX path
    50ebdaa25932 wifi: rtlwifi: rtl8192de: Fix low speed with WPA3-SAE
    96e544378e16 wifi: rtlwifi: rtl8192de: Fix 5 GHz TX power
    8539d0b03919 wifi: rtl8xxxu: Fix the TX power of RTL8192CU, RTL8723AU
    7994e88dabcb wifi: rtw89: pci: correct TX resource checking for PCI DMA channel of firmware command
    cd2538e5af49 md/raid5: fix deadlock that raid5d() wait for itself to clear MD_SB_CHANGE_PENDING
    f9e0a4ec4b5d arm64: dts: qcom: qcs404: fix bluetooth device address
    49c23519d698 arm64: tegra: Correct Tegra132 I2C alias
    17695c8d5049 ACPI: resource: Do IRQ override on TongFang GXxHRXx and GMxHGxx
    6a283d64b486 soc: qcom: rpmh-rsc: Enhance check for VRM in-flight request
    0a47ba94ec3d thermal/drivers/qcom/lmh: Check for SCM availability at probe
    3d22872e7740 platform/chrome: cros_ec: Handle events during suspend after resume completion
    0c08b92f9827 proc: Move fdinfo PTRACE_MODE_READ check into the inode .permission operation
    d171c85d74c6 fsverity: use register_sysctl_init() to avoid kmemleak warning
    c5a39f16436a ata: pata_legacy: make legacy_exit() work again
    91d930732554 wifi: rtw89: correct aSIFSTime for 6GHz band
    6479b9f41583 bcache: fix variable length array abuse in btree_iter
    5b0a3dc3e878 drm/amdgpu: add error handle to avoid out-of-bounds
    7d12e918f299 media: lgdt3306a: Add a check against null-pointer-def
    be0155202e43 f2fs: fix to do sanity check on i_xattr_nid in sanity_check_inode()
    2c66a89962a0 drm/sun4i: hdmi: Move mode_set into enable
    8474d4b41617 drm/sun4i: hdmi: Convert encoder to atomic
    68de50dc581c selftests: net: List helper scripts in TEST_FILES Makefile variable
    d7e2ad42a056 selftests: net: included needed helper in the install targets
    a38459118746 selftests/net: synchronize udpgro tests' tx and rx connection
    461db4b51c29 vxlan: Fix regression when dropping packets due to invalid src addresses
    417dbd7be383 mm: ratelimit stat flush from workingset shrinker
    15cc248e7efa erofs: avoid allocating DEFLATE streams before mounting
    184873af8791 mptcp: fix full TCP keep-alive support
    89e11fe49fee mptcp: cleanup SOL_TCP handling
    41089d9c8a45 mptcp: avoid some duplicate code in socket option handling
    0af20700561e riscv: signal: handle syscall restart before get_signal
    9399baa02e4b net: sfp-bus: fix SFP mode detect from bitrate
    ed2d2ead1779 afs: Don't cross .backup mountpoint from backup volume
    b8d50770ec03 mmc: core: Do not force a retune before RPMB switch
    cfa73607eb21 drm/i915/hwmon: Get rid of devm
    140cf97204b5 Linux 6.6.33
    c273cae03895 riscv: stacktrace: fixed walk_stackframe()
    3090c06d50ea riscv: prevent pt_regs corruption for secondary idle threads
    af628d43a822 SUNRPC: Fix loop termination condition in gss_free_in_token_pages()
    c775ffab3e53 f2fs: use f2fs_{err,info}_ratelimited() for cleanup
    4647876e7e4e f2fs: write missing last sum blk of file pinning section
    98ed486436a0 perf sched timehist: Fix -g/--call-graph option failure
    fdc455cd0204 drm/msm/dpu: make error messages at dpu_core_irq_register_callback() more sensible
    2948c1e5d5f4 media: vsp1: Remove unbalanced .s_stream(0) calls
    c353aa21f256 nouveau: report byte usage in VRAM usage.
    d0afcca9ced4 RDMA/bnxt_re: Fix the sparse warnings
    f33052802e3d perf evlist: Add perf_evlist__go_system_wide() helper
    95e33c0f617b perf util: Add a function for replacing characters in a string
    1a705491f35c platform/x86/intel-uncore-freq: Don't present root domain on error
    31729546c144 platform/x86/intel/tpmi: Handle error from tpmi_process_info()
    59f86a290838 genirq/cpuhotplug, x86/vector: Prevent vector leak during CPU offline
    66c92af813bc KVM: x86: Don't advertise guest.MAXPHYADDR as host.MAXPHYADDR in CPUID
    d6873acc3e09 x86/pci: Skip early E820 check for ECAM region
    9dce01f386c9 efi: libstub: only free priv.runtime_map when allocated
    2a2f9b87c477 x86/efistub: Omit physical KASLR when memory reservations exist
    2c95241ac5fc ALSA: timer: Set lower bound of start tick time
    b7c4ef7ba313 ALSA: seq: ump: Fix swapped song position pointer data
    e67cae4255e9 hwmon: (shtc1) Fix property misspelling
    d800e1868f3d hwmon: (intel-m10-bmc-hwmon) Fix multiplier for N6000 board power sensor
    e0216316828f drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel
    042adfbfe8dc drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
    442b5ee91a5e drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
    81c52c0ccc6a powerpc/pseries/lparcfg: drop error message from guest name lookup
    5f1b01a8c8a5 ALSA: seq: Fix yet another spot for system message conversion
    54213c09801e ipvlan: Dont Use skb->sk in ipvlan_process_v{4,6}_outbound
    659ef6fd4934 net: ena: Fix redundant device NUMA node override
    26668c2d449d net: ena: Reduce lines with longer column width boundary
    f826701d02f8 net: dsa: microchip: fix RGMII error in KSZ DSA driver
    2c2e3247e898 spi: stm32: Don't warn about spurious interrupts
    db9312853608 kheaders: use `command -v` to test for existence of `cpio`
    0b01a41e2ce4 drm/i915/gt: Fix CCS id's calculation for CCS mode setting
    d154613d2b3d drm/i915/guc: avoid FIELD_PREP warning
    2b6e818fc609 kconfig: fix comparison to constant symbols, 'm', 'n'
    b939d1e04a90 net/sched: taprio: extend minimum interval restriction to entire cycle too
    aa311596411b net/sched: taprio: make q->picos_per_byte available to fill_sched_entry()
    61134e41db23 netfilter: nft_fib: allow from forward/input without iif selector
    570b4c52096e netfilter: tproxy: bail out if IP has been disabled on the device
    c4f77480e569 netfilter: nft_payload: skbuff vlan metadata mangle support
    75bc6bc559b9 net: ti: icssg-prueth: Fix start counter for ft1 filter
    4448b5eaab86 ALSA: seq: Don't clear bank selection at event -> UMP MIDI2 conversion
    5c3df8c4f45b ALSA: seq: Fix missing bank setup between MIDI1/MIDI2 UMP conversion
    562f8862baea selftests: mptcp: join: mark 'fail' tests as flaky
    99ac814eb13f selftests: mptcp: add ms units for tc-netem delay
    052c9f0c140c selftests: mptcp: simult flows: mark 'unbalanced' tests as flaky
    71e61511c3a5 ice: fix accounting if a VLAN already exists
    98101ca23a35 net: micrel: Fix lan8841_config_intr after getting out of sleep mode
    f0c58df7719f net:fec: Add fec_enet_deinit()
    000a65bf1dc0 bpf: Allow delete from sockmap/sockhash only if update is allowed
    5da6d51d4837 ASoC: cs42l43: Only restrict 44.1kHz for the ASP
    ec361a0ffc33 net: usb: smsc95xx: fix changing LED_SEL bit value updated from EEPROM
    208d04341c8f Octeontx2-pf: Free send queue buffers incase of leaf to inner
    ac325c7f8944 af_unix: Read sk->sk_hash under bindlock during bind().
    302fe8dd147b af_unix: Annotate data-race around unix_sk(sk)->addr.
    f6638e955ca0 enic: Validate length of nl attributes in enic_set_vf_port
    07bbe6668e1e ALSA: hda/realtek: Adjust G814JZR to use SPI init for amp
    cb9c2bd4ec8c ALSA: core: Remove debugfs at disconnection
    b26e0fa2cf8c ALSA: jack: Use guard() for locking
    f58eec14685a bpf: Fix potential integer overflow in resolve_btfids
    a4ee78244445 dma-buf/sw-sync: don't enable IRQ from sync_print_obj()
    de1a0a2d9db8 net/mlx5e: Fix UDP GSO for encapsulated packets
    33933f006d2e net/mlx5e: Use rx_missed_errors instead of rx_dropped for reporting buffer exhaustion
    aa60de63fdd1 net/mlx5e: Fix IPsec tunnel mode offload feature check
    b0a15cde37a8 net/mlx5: Use mlx5_ipsec_rx_status_destroy to correctly delete status rules
    fb035aa9a3f8 net/mlx5: Fix MTMP register capability offset in MCAM register
    e5bdf4eeeb1d net/mlx5: Lag, do bond only if slaves agree on roce state
    07327fcbec97 net: phy: micrel: set soft_reset callback to genphy_soft_reset for KSZ8061
    dedc1dfaa6df drm/amd/display: Enable colorspace property for MST connectors
    ca3b4293dcca nvmet: fix ns enable/disable possible hang
    36989c682505 nvme-multipath: fix io accounting on failover
    87d78f7eb76b nvme-tcp: add definitions for TLS cipher suites
    5a91116b0031 dma-mapping: benchmark: handle NUMA_NO_NODE correctly
    34a816d8735f dma-mapping: benchmark: fix node id validation
    856dc7eb7fbc dma-mapping: benchmark: fix up kthread-related error handling
    a9da6ddaef9e kthread: add kthread_stop_put
    1b5234b2241a spi: Don't mark message DMA mapped when no transfer in it is
    0889e6f20986 netfilter: nft_payload: restore vlan q-in-q match support
    5278e4354a5b netfilter: ipset: Add list flush to cancel_gc
    8f365564af89 netfilter: nfnetlink_queue: acquire rcu_read_lock() in instance_destroy_rcu()
    1547183852dc tpm_tis_spi: Account for SPI header when allocating TPM SPI xfer buffer
    ad4b202da2c4 tracing/probes: fix error check in parse_btf_field()
    c3e439cb04cf kasan, fortify: properly rename memintrinsics
    d346e1475703 ice: Interpret .set_channels() input differently
    e155741ec4f5 drivers/xen: Improve the late XenStore init protocol
    46e72ebc6b35 nfc: nci: Fix handling of zero-length payload packets in nci_rx_work()
    87bdc9f6f58b net: relax socket state check at accept time.
    ab67c2fd3d07 tls: fix missing memory barrier in tls_init
    d470a8090476 net: fec: avoid lock evasion when reading pps_enable
    11f1fb814994 Revert "ixgbe: Manual AN-37 for troublesome link partners for X550 SFI"
    20da5bfd669b i3c: master: svc: change ENXIO to EAGAIN when IBI occurs during start frame
    3dc730aa1b1e i3c: master: svc: return actual transfer data len
    46fb7121fc42 i3c: master: svc: rename read_len as actual_len
    fe52ab31f050 i3c: add actual_len in i3c_priv_xfer
    04207a9c64e0 virtio: delete vq in vp_find_vqs_msix() when request_irq() fails
    7871f32b4564 net: lan966x: Remove ptp traps in case the ptp is not enabled.
    c5caa03d86a7 rv: Update rv_en(dis)able_monitor doc to match kernel-doc
    9f2ad88f9b34 arm64: asm-bug: Add .align 2 to the end of __BUG_ENTRY
    69c47b3763af openvswitch: Set the skbuff pkt_type for proper pmtud support.
    ae08aea3f517 pNFS/filelayout: fixup pNfs allocation modes
    02261d3f9dc7 tcp: Fix shift-out-of-bounds in dctcp_update_alpha().
    ef633ecb5452 regulator: tps6594-regulator: Correct multi-phase configuration
    0e44d6cbe8de ipv6: sr: fix memleak in seg6_hmac_init_algo
    d59ae9314b97 af_unix: Update unix_sk(sk)->oob_skb under sk_receive_queue lock.
    35db7c9d01d9 regulator: tps6287x: Force writing VSEL bit
    f46695d3b08e regulator: pickable ranges: don't always cache vsel
    706dff4ff7a4 rpcrdma: fix handling for RDMA_CM_EVENT_DEVICE_REMOVAL
    f3a8f8670fa6 sunrpc: fix NFSACL RPC retry on soft mount
    511811a7d39c nfs: keep server info for remounts
    0d317bcf81a1 NFSv4: Fixup smatch warning for ambiguous return
    57847c2ec5fb ASoC: tas2781: Fix wrong loading calibrated data sequence
    92503b5caab6 ASoC: tas2552: Add TX path for capturing AUDIO-OUT data
    e53a7f8afcbd nfc: nci: Fix uninit-value in nci_rx_work
    f354dc8c7d32 selftests: net: kill smcrouted in the cleanup logic in amt.sh
    f4df8c7670a7 ipv6: sr: fix missing sk_buff release in seg6_input_core
    521d21fa65cb net: Always descend into dsa/ folder with CONFIG_NET_DSA enabled
    1d95dbaa6ee7 x86/kconfig: Select ARCH_WANT_FRAME_POINTERS again when UNWINDER_FRAME_POINTER=y
    3a487e3cab05 perf/arm-dmc620: Fix lockdep assert in ->event_init()
    01f5809c78e6 xen/x86: add extra pages to unpopulated-alloc if available
    d08e87998339 regulator: bd71828: Don't overwrite runtime voltages
    b1bee9931287 blk-cgroup: Properly propagate the iostat update up the hierarchy
    714e59b5456e blk-cgroup: fix list corruption from reorder of WRITE ->lqueued
    d4a60298ac34 blk-cgroup: fix list corruption from resetting io stat
    3652ac87c993 drm/nouveau: use tile_mode and pte_kind for VM_BIND bo allocations
    6446c1ca2dd2 nouveau: add an ioctl to report vram usage
    929eaf32dde4 nouveau: add an ioctl to return vram bar size.
    38c2fd9aeddc ASoC: mediatek: mt8192: fix register configuration for tdm
    9054c474f9c2 ALSA: hda: cs35l56: Fix lifetime of cs_dsp instance
    f95fde17ed53 ALSA: hda: cs35l56: Initialize all ASP1 registers
    3fd715d61716 ASoC: cs35l56: Fix to ensure ASP1 registers match cache
    6e359be49750 ALSA: hda/cs_dsp_ctl: Use private_free for control cleanup
    1b5cfb411b73 null_blk: Fix the WARNING: modpost: missing MODULE_DESCRIPTION()
    2d062f7468c8 ASoC: tas2781: Fix a warning reported by robot kernel test
    a1955a6df913 drm/msm/a6xx: Avoid a nullptr dereference when speedbin setting fails
    2a09eb7e36cc selftests/powerpc/dexcr: Add -no-pie to hashchk tests
    6ead3eccf67b drm: zynqmp_dpsub: Always register bridge
    f33888b9b686 Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"
    89af84e6514a media: cec: core: avoid confusing "transmit timed out" message
    1af4790bc117 media: cec: core: avoid recursive cec_claim_log_addrs
    cceda163b711 media: cec: cec-api: add locking in cec_release()
    8f40b92f5480 media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
    75aafce64a3a media: sunxi: a83-mips-csi2: also select GENERIC_PHY
    24b9362c9fa5 cxl/region: Fix cxlr_pmem leaks
    d5ac654babea cxl/trace: Correct DPA field masks for general_media & dram events
    8a328396a5fb um: Fix the declaration of kasan_map_memory
    a5cd85608738 um: Fix the -Wmissing-prototypes warning for get_thread_reg
    59e34e390cfd um: Fix the -Wmissing-prototypes warning for __switch_mm
    adb1c558c610 powerpc/pseries: Add failure related checks for h_get_mpp and h_get_ppp
    3d50e4cef2e6 media: flexcop-usb: fix sanity check of bNumEndpoints
    408facc7965e platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
    ec653f4474d7 tools/arch/x86/intel_sdsi: Fix meter_certificate decoding
    8af4923b045b tools/arch/x86/intel_sdsi: Fix meter_show display
    42adfac5d2c7 tools/arch/x86/intel_sdsi: Fix maximum meter bundle length
    c73d3273272b media: mediatek: vcodec: fix possible unbalanced PM counter
    f29a42642069 media: mediatek: vcodec: add encoder power management helper functions
    19bd9537b6bc drm/amdgpu: Fix buffer size in gfx_v9_4_3_init_ cp_compute_microcode() and rlc_microcode()
    bdd5bbe96782 drm/amdgpu: init microcode chip name from ip versions
    a4c638ab2578 Input: cyapa - add missing input core locking to suspend/resume functions
    d410017a7181 media: stk1160: fix bounds checking in stk1160_copy_video()
    3fe7b95312b3 drm/bridge: tc358775: fix support for jeida-18 and jeida-24
    873f67699114 drm/msm/dpu: Add callback function pointer check before its call
    04c2fca45506 drm/msm/dpu: stop using raw IRQ indices in the kernel output
    3bbe257c466f drm/msm/dpu: make the irq table size static
    a70ce2bb1d46 drm/msm/dpu: add helper to get IRQ-related data
    186a82662d13 drm/msm/dpu: extract dpu_core_irq_is_valid() helper
    50cf1608f184 drm/msm/dpu: remove irq_idx argument from IRQ callbacks
    1fe1c9dc21ee fs/ntfs3: Use variable length array instead of fixed size
    109d85a98345 fs/ntfs3: Use 64 bit variable to avoid 32 bit overflow
    6c8054d59066 fs/ntfs3: Check 'folio' pointer for NULL
    92ce7359f988 um: vector: fix bpfflash parameter evaluation
    434a06c38ee1 um: Add winch to winch_handlers before registering winch IRQ
    e98f29bf0b5f um: Fix return value in ubd_init()
    900d54bced61 drm/meson: gate px_clk when setting rate
    22432baba48a drm/mediatek: dp: Fix mtk_dp_aux_transfer return value
    3f388ca6a434 drm/msm/dpu: Always flush the slave INTF on the CTL
    01d8692b0c34 drm/msm/dsi: Print dual-DSI-adjusted pclk instead of original mode pclk
    755575a42c4f media: ov2680: Do not fail if data-lanes property is absent
    08754dd758d5 media: ov2680: Allow probing if link-frequencies is absent
    a7e0a70ac6d3 media: ov2680: Clear the 'ret' variable on success
    9a496f7d1828 media: v4l: Don't turn on privacy LED if streamon fails
    35556d0e1c61 media: v4l2-subdev: Document and enforce .s_stream() requirements
    4031c57f024a Input: pm8xxx-vibrator - correct VIB_MAX_LEVELS calculation
    063d89156f2d mmc: sdhci_am654: Fix ITAPDLY for HS400 timing
    2b8d2a6e5363 mmc: sdhci_am654: Add ITAPDLYSEL in sdhci_j721e_4bit_set_clock
    3433a340630e mmc: sdhci_am654: Add OTAP/ITAP delay enable
    3525baf3a929 mmc: sdhci_am654: Drop lookup for deprecated ti,otap-del-sel
    fa9a2c696ad1 mmc: sdhci_am654: Write ITAPDLY for DDR52 timing
    57205cf9c18a mmc: sdhci_am654: Add tuning algorithm for delay chain
    b003b8c15cbb Input: ims-pcu - fix printf string overflow
    69f245b86cef dt-bindings: adc: axi-adc: add clocks property
    a291998f8a09 dt-bindings: adc: axi-adc: update bindings for backend framework
    51a2049a2c08 eventfs: Have "events" directory get permissions from its parent
    281eaee393c7 eventfs: Free all of the eventfs_inode after RCU
    14aa4f3efc6e eventfs/tracing: Add callback for release of an eventfs_inode
    e5c80b23523b eventfs: Create eventfs_root_inode to store dentry
    11244a432850 serial: sc16is7xx: fix bug in sc16is7xx_set_baud() when using prescaler
    f0eb53ffd8d9 serial: sc16is7xx: replace hardcoded divisor value with BIT() macro
    c6fecd07435f misc/pvpanic-pci: register attributes via pci_driver
    e9194a954c44 misc/pvpanic: deduplicate common code
    f68f3e3f5c9c iio: accel: mxc4005: Reset chip on probe() and resume()
    43424f70535b iio: accel: mxc4005: allow module autoloading via OF compatible
    e26405d5b266 eventfs: Do not differentiate the toplevel events directory
    64a9a930afe9 drm/amd/display: Revert Remove pixle rate limit for subvp
    242f11be47ab drm/amd/display: Remove pixle rate limit for subvp
    cb9f455e27ed gpiolib: acpi: Fix failed in acpi_gpiochip_find() by adding parent node match
    b3b8ba37529c dt-bindings: PCI: rockchip,rk3399-pcie: Add missing maxItems to ep-gpios
    916cf5d6ae97 s390/boot: Remove alt_stfle_fac_list from decompressor
    2102692eb23f s390/ipl: Fix incorrect initialization of nvme dump block
    b34ea5b97561 s390/ipl: Fix incorrect initialization of len fields in nvme reipl block
    2028823f1d71 s390/vdso: Use standard stack frame layout
    0e035cb818c5 s390/vdso: Create .build-id links for unstripped vdso files
    07423c9b4375 kbuild: fix build ID symlinks to installed debug VDSO files
    adacfc6dec4c kbuild: unify vdso_install rules
    a422869153dd s390/vdso: Generate unwind information for C modules
    6bd72dd0f70c s390/vdso64: filter out munaligned-symbols flag for vdso
    379ec9d95c89 LoongArch: Fix callchain parse error with kernel tracepoint events again
    5af155f9b168 perf pmu: Count sys and cpuid JSON events separately
    4ac93db3dd4d perf pmu: Assume sysfs events are always the same case
    930e16ac95b0 perf tools: Add/use PMU reverse lookup from config to name
    923b83bc8692 perf tools: Use pmus to describe type from attribute
    c5aaeae250d3 perf pmu: "Compat" supports regular expression matching identifiers
    f989dc009070 perf pmu: Move pmu__find_core_pmu() to pmus.c
    d37e53e8c826 perf test: Add a test for strcmp_cpuid_str() expression
    a46c6144117a perf stat: Don't display metric header for non-leader uncore events
    7723485af6de usb: fotg210: Add missing kernel doc description
    f0cdc3e248e3 f2fs: fix to add missing iput() in gc_data_segment()
    1003d16ea271 perf daemon: Fix file leak in daemon_session__control
    c546fef47cd5 libsubcmd: Fix parse-options memory leak
    70d6dca40318 serial: sh-sci: protect invalidating RXDMA on shutdown
    9f9341064a9b f2fs: compress: don't allow unaligned truncation on released compress inode
    8d2fc8ae670a f2fs: fix to release node block count in error path of f2fs_new_node_page()
    329edb7c9e3b f2fs: compress: fix to cover {reserve,release}_compress_blocks() w/ cp_rwsem lock
    81c975902b15 f2fs: compress: fix error path of inc_valid_block_count()
    b8a742a8bd6d f2fs: introduce get_available_block_count() for cleanup
    5f8e5a096e2b f2fs: deprecate io_bits
    92b24f04d3e5 f2fs: compress: fix to update i_compr_blocks correctly
    9ec45f857a01 perf symbols: Fix ownership of string in dso__load_vmlinux()
    c3cc46563103 perf maps: Move symbol maps functions to maps.c
    c5314cfa9287 perf thread: Fixes to thread__new() related to initializing comm
    9029a775f0d7 perf report: Avoid SEGV in report__setup_sample_type()
    e50576c7e61f perf ui browser: Avoid SEGV on title
    6902179a415a f2fs: fix block migration when section is not aligned to pow2
    40d76c393cca f2fs: support file pinning for zoned devices
    066cec37094d f2fs: kill heap-based allocation
    61330214b227 f2fs: separate f2fs_gc_range() to use GC for a range
    f0248ba6b640 f2fs: use BLKS_PER_SEG, BLKS_PER_SEC, and SEGS_PER_SEC
    42d48304f64e f2fs: support printk_ratelimited() in f2fs_printk()
    6496d63a1641 f2fs: Clean up errors in segment.h
    e02a267a69aa PCI/EDR: Align EDR_PORT_LOCATE_DSM with PCI Firmware r3.3
    84ae90ba37c1 PCI/EDR: Align EDR_PORT_DPC_ENABLE_DSM with PCI Firmware r3.3
    787b7ddf434f dt-bindings: spmi: hisilicon,hisi-spmi-controller: fix binding references
    913a00ec6b09 extcon: max8997: select IRQ_DOMAIN instead of depending on it
    a8860002cae5 perf ui browser: Don't save pointer to stack memory
    88b88dd7d8c2 perf bench internals inject-build-id: Fix trap divide when collecting just one DSO
    cd99864e1f7f i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()
    bb220136ae51 i2c: cadence: Avoid fifo clear after start
    ec3468221efe ppdev: Add an error check in register_device
    b596340b8552 ppdev: Remove usage of the deprecated ida_simple_xx() API
    370c480410f6 stm class: Fix a double free in stm_register_device()
    4e125b96e333 usb: gadget: u_audio: Clear uac pointer when freed.
    453d3fa9266e usb: gadget: u_audio: Fix race condition use of controls after free during gadget unbind.
    9eb15f24a0b9 dmaengine: idxd: Avoid unnecessary destruction of file_ida
    4ef5468e84d5 dt-bindings: phy: qcom,usb-snps-femto-v2: use correct fallback for sc8180x
    6357221b68e0 dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: fix msm899[68] power-domains
    dc14f0a2c61b watchdog: sa1100: Fix PTR_ERR_OR_ZERO() vs NULL check in sa1100dog_probe()
    d47f51eb1fc3 watchdog: bd9576: Drop "always-running" property
    9b1c063ffc07 watchdog: cpu5wdt.c: Fix use-after-free bug caused by cpu5wdt_trigger
    cd283810f6ae pinctrl: qcom: pinctrl-sm7150: Fix sdc1 and ufs special pins regs
    dedf17b3af39 dt-bindings: pinctrl: mediatek: mt7622: fix array properties
    6954ae017718 VMCI: Fix an error handling path in vmci_guest_probe_device()
    b5f31d1470c4 PCI: of_property: Return error for int_map allocation failure
    97ba21401b89 ovl: remove upper umask handling from ovl_create_upper()
    034968dbd867 leds: pwm: Disable PWM when going to suspend
    a10c3d5ff9a3 pwm: Rename pwm_apply_state() to pwm_apply_might_sleep()
    6bb1efff9b17 perf intel-pt: Fix unassigned instruction op (discovered by MemorySanitizer)
    0053891e2f4f PCI: Wait for Link Training==0 before starting Link retrain
    65ce3fad7d59 microblaze: Remove early printk call from cpuinfo-static.c
    6240bd8981c6 microblaze: Remove gcc flag for non existing early_printk.c file
    a758e99cd644 udf: Convert udf_expand_file_adinicb() to use a folio
    7745b1b785aa udf: Remove GFP_NOFS allocation in udf_expand_file_adinicb()
    4d7d12b643c0 fpga: region: add owner module and take its refcount
    0bd22a4966d5 vfio/pci: fix potential memory leak in vfio_intx_enable()
    e642622550c8 i915: make inject_virtual_interrupt() void
    bb6f7de21d4c coresight: etm4x: Fix access to resource selector registers
    3840a3f37a67 coresight: etm4x: Safe access for TRCQCLTR
    0c575997dee0 coresight: etm4x: Do not save/restore Data trace control registers
    42f016cd8593 coresight: etm4x: Do not hardcode IOMEM access for register restore
    720d27664d7c iio: adc: adi-axi-adc: only error out in major version mismatch
    d3513f1261a0 iio: adc: adi-axi-adc: move to backend framework
    184b2967d578 iio: adc: ad9467: convert to backend framework
    5fc4f0c01cb2 iio: add the IIO backend framework
    e1fc56c40068 iio: buffer-dmaengine: export buffer alloc and free functions
    b70042e4dc7f iio: adc: adi-axi-adc: convert to regmap
    864b42f8b3f3 iio: adc: ad9467: use chip_info variables instead of array
    a679a40bd2ec iio: adc: ad9467: use spi_get_device_match_data()
    08f5bd2032c0 iio: pressure: dps310: support negative temperature values
    d3ced099f31d perf test shell arm_coresight: Increase buffer size for Coresight basic tests
    e61cb35f56f9 perf docs: Document bpf event modifier
    0688c4f7c5e8 coresight: etm4x: Fix unbalanced pm_runtime_enable()
    1083681ea208 riscv: dts: starfive: visionfive 2: Remove non-existing TDM hardware
    1145fda91f70 iio: adc: stm32: Fixing err code to not indicate success
    f84122681853 f2fs: fix to check pinfile flag in f2fs_move_file_range()
    5632bdb4e9be f2fs: fix to relocate check condition in f2fs_fallocate()
    116d824f953a f2fs: compress: fix to relocate check condition in f2fs_ioc_{,de}compress_file()
    1d59aa23a3fa f2fs: compress: fix to relocate check condition in f2fs_{release,reserve}_compress_blocks()
    ff9504c045b5 perf bench uprobe: Remove lib64 from libc.so.6 binary path
    f56632928a6d dt-bindings: PCI: rcar-pci-host: Add missing IOMMU properties
    479e4daae636 dt-bindings: PCI: rcar-pci-host: Add optional regulators
    829afc132f63 perf record: Fix debug message placement for test consumption
    aa4158e31612 perf record: Move setting tracking events before record__init_thread_masks()
    e024e98e81f9 perf evlist: Add evlist__findnew_tracking_event() helper
    28a50a15d1b8 perf tests: Apply attributes to all events in object code reading test
    fca6659b4edc perf tests: Make "test data symbol" more robust on Neoverse N1
    bf386f268b29 arm64: dts: meson: fix S4 power-controller node
    e21a398d22e6 interconnect: qcom: qcm2290: Fix mas_snoc_bimc QoS port assignment
    28f5a08600d0 module: don't ignore sysfs_create_link() failures
    3431d265eab2 serial: sc16is7xx: add proper sched.h include for sched_set_fifo()
    967cb01d0a80 PCI: tegra194: Fix probe path for Endpoint mode
    46c6fc133dc1 greybus: arche-ctrl: move device table to its right location
    749603af8faa serial: max3100: Fix bitwise types
    e8a10089eddb serial: max3100: Update uart_driver_registered on driver removal
    93df2fba6c7d serial: max3100: Lock port->lock when calling uart_handle_cts_change()
    73c6ddb499bb perf annotate: Fix annotation_calc_lines() to pass correct address to get_srcline()
    80e06e547d42 perf annotate: Use global annotation_options
    1157abdc2e03 perf top: Convert to the global annotation_options
    e0af85d60b7a perf report: Convert to the global annotation_options
    dfd02119aef9 perf annotate: Introduce global annotation_options
    260de04387c0 perf annotate: Split branch stack cycles information out of 'struct annotation_line'
    4ddf437cae2c perf machine thread: Remove exited threads by default
    7adc363bc29e perf record: Lazy load kernel symbols
    1f428149492f firmware: dmi-id: add a release callback function
    59767d1e3019 dmaengine: idma64: Add check for dma_set_max_seg_size
    7eeef1e935d2 soundwire: cadence: fix invalid PDI offset
    6ee4ad5dfb15 perf stat: Do not fail on metrics on s390 z/VM systems
    32f615e0a580 usb: typec: ucsi: simplify partner's PD caps registration
    ad864c123b7a usb: typec: ucsi: always register a link to USB PD device
    1ec229afd45c perf annotate: Get rid of duplicate --group option item
    30dc493b8195 counter: linux/counter.h: fix Excess kernel-doc description warning
    d7c4081c54a1 fpga: bridge: add owner module and take its refcount
    2da62a139a62 fpga: manager: add owner module and take its refcount
    4b3609e6c805 f2fs: fix to wait on page writeback in __clone_blkaddrs()
    2b2611a42462 f2fs: multidev: fix to recognize valid zero block address
    ac12df6b9729 phy: qcom: qmp-combo: fix duplicate return in qmp_v4_configure_dp_phy
    518e2c46b5db greybus: lights: check return of get_channel_from_mode
    fe92a949b264 iio: core: Leave private pointer NULL when no private data supplied
    5c53a28ab253 perf probe: Add missing libgen.h header needed for using basename()
    834e603dbe28 perf record: Delete session after stopping sideband thread
    2f593fd9d3cc net: wangxun: fix to change Rx features
    941e1c6d8683 sched/core: Fix incorrect initialization of the 'burst' parameter in cpu_max_write()
    4d9d099ab291 sched/fair: Allow disabling sched_balance_newidle with sched_relax_domain_level
    ee3577c5d33c af_packet: do not call packet_read_pending() from tpacket_destruct_skb()
    f28bdc2ee5d9 netrom: fix possible dead-lock in nr_rt_ioctl()
    57fa96c04ef9 net: qrtr: ns: Fix module refcnt
    4488617e5e99 net: bridge: mst: fix vlan use-after-free
    76282afa17e9 selftests: net: bridge: increase IGMP/MLD exclude timeout membership interval
    1abb37114790 net: bridge: xmit: make sure we have at least eth header len bytes
    00ea83bfb496 modules: Drop the .export_symbol section from the final modules
    4aa2d5fd7ee0 tracing/user_events: Fix non-spaced field matching
    4c40e1b76e6e tracing/user_events: Prepare find/delete for same name events
    2fc3d0ac097b tracing/user_events: Allow events to persist for perfmon_capable users
    3eb127dc408b RDMA/cma: Fix kmemleak in rdma_core observed during blktests nvme/rdma use siw
    e011ea687f2f RDMA/IPoIB: Fix format truncation compilation errors
    382494aa8881 selftests/kcmp: remove unused open mode
    c1d8c429e4d2 SUNRPC: Fix gss_free_in_token_pages()
    a658f011d89d bnxt_re: avoid shift undefined behavior in bnxt_qplib_alloc_init_hwq
    29feea56dedf RDMA/bnxt_re: Adds MSN table capability for Gen P7 adapters
    9a54460b3394 RDMA/bnxt_re: Update the HW interface definitions
    e300b1b95c93 RDMA/bnxt_re: Remove roundup_pow_of_two depth for all hardware queue resources
    f52e649e933a RDMA/bnxt_re: Refactor the queue index update
    0b0d5701a8bf of: module: add buffer overflow check in of_modalias()
    370a86dc97ef ext4: remove the redundant folio_wait_stable()
    07fa88b0f340 ext4: fix potential unnitialized variable
    f4fb561d52e1 sunrpc: removed redundant procp check
    e873f36ec890 drivers/virt/acrn: fix PFNMAP PTE checks in acrn_vm_ram_map()
    d5c75ededb2d virt: acrn: stop using follow_pfn
    c7cca4c61f44 ext4: avoid excessive credit estimate in ext4_tmpfile()
    caaee1b858c2 x86/insn: Add VEX versions of VPDPBUSD, VPDPBUSDS, VPDPWSSD and VPDPWSSDS
    3d22be008bd1 x86/insn: Fix PUSH instruction in x86 instruction decoder opcode map
    6973cb78f0ca clk: qcom: mmcc-msm8998: fix venus clock issue
    631c54f07d78 clk: qcom: dispcc-sm8550: fix DisplayPort clocks
    e91d89de5e71 clk: qcom: dispcc-sm6350: fix DisplayPort clocks
    7ef714778dd0 clk: qcom: dispcc-sm8450: fix DisplayPort clocks
    65e528a69cb3 lib/test_hmm.c: handle src_pfns and dst_pfns allocation failure
    6d06fc4edfb0 clk: renesas: r9a07g043: Add clock and reset entry for PLIC
    6c7455605a30 clk: renesas: r8a779a0: Fix CANFD parent clock
    8696be3a5f66 IB/mlx5: Use __iowrite64_copy() for write combining stores
    03ff3e23adca RDMA/rxe: Fix incorrect rxe_put in error path
    13c7bb72d372 RDMA/rxe: Allow good work requests to be executed
    21b4c6d4d890 RDMA/rxe: Fix seg fault in rxe_comp_queue_pkt
    63cbb3e7044f clk: qcom: clk-alpha-pll: remove invalid Stromer register offset
    1a91f05ca280 clk: rs9: fix wrong default value for clock amplitude
    dd4b239184ee clk: mediatek: mt8365-mm: fix DPI0 parent
    6f541a89ced8 RDMA/hns: Modify the print level of CQE error
    571f79eb1aae RDMA/hns: Use complete parentheses in macros
    b7f2f6d227ce RDMA/hns: Fix GMV table pagesize
    63da190eeb5c RDMA/hns: Fix UAF for cq async event
    22c915af31bd RDMA/hns: Fix deadlock on SRQ async events.
    db415a39ffdb RDMA/hns: Fix return value in hns_roce_map_mr_sg
    6b4f69399291 iommu: Undo pasid attachment only for the devices that have succeeded
    888b03fcd122 clk: mediatek: pllfh: Don't log error for missing fhctl node
    499569c8ab7f RDMA/mlx5: Adding remote atomic access flag to updatable flags
    5880d8ca57d5 RDMA/mlx5: Uncacheable mkey has neither rb_key or cache_ent
    73c5f64cfa85 clk: samsung: exynosautov9: fix wrong pll clock id value
    205b6dd5b799 media: cadence: csi2rx: configure DPHY before starting source stream
    6040fcea4605 drm/edid: Parse topology block for all DispID structure v1.x
    b4c508666981 drm/rockchip: vop2: Do not divide height twice for YUV
    4b3421c2f6f8 media: uvcvideo: Add quirk for Logitech Rally Bar
    dda6efae161d drm/mipi-dsi: use correct return type for the DSC functions
    04b001fa8b79 drm/panel: simple: Add missing Innolux G121X1-L03 format, flags, connector
    bd4fb19e33c8 drm/bridge: anx7625: Update audio status while detecting
    587acea97512 drm/panel: novatek-nt35950: Don't log an error when DSI host can't be found
    7962ae5aadd5 drm/bridge: dpc3433: Don't log an error when DSI host can't be found
    52334bb44f10 drm/bridge: tc358775: Don't log an error when DSI host can't be found
    30cb32c7ec5e drm/bridge: lt9611uxc: Don't log an error when DSI host can't be found
    ae2ac0aef901 drm/bridge: lt9611: Don't log an error when DSI host can't be found
    95b5eba76efe drm/bridge: lt8912b: Don't log an error when DSI host can't be found
    95f959193c32 drm/bridge: icn6211: Don't log an error when DSI host can't be found
    4486576578db drm/bridge: anx7625: Don't log an error when DSI host can't be found
    656fb206aee2 ASoC: tracing: Export SND_SOC_DAPM_DIR_OUT to its value
    42c22b63056c drm: vc4: Fix possible null pointer dereference
    335cc45ef2b8 drm/arm/malidp: fix a possible null pointer dereference
    cc20c87b04db media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries
    1cc6b956ad36 fbdev: sh7760fb: allow modular build
    983e91ad759e media: v4l2-subdev: Fix stream handling for crop API
    c1a3803e5bb9 media: i2c: et8ek8: Don't strip remove function when driver is builtin
    dd271f136601 media: dt-bindings: ovti,ov2680: Fix the power supply names
    db572c397399 media: ipu3-cio2: Request IRQ earlier
    525be5dc8ee0 drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
    554484e46383 drm/msm/dp: allow voltage swing / pre emphasis of 3
    dcf53e6103b2 drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
    0f070f0c3b54 media: radio-shark2: Avoid led_names truncations
    d8076c9e02bb media: rcar-vin: work around -Wenum-compare-conditional warning
    f987b53c28eb media: ngene: Add dvb_ca_en50221_init return value check
    750e384b9b7b ASoC: Intel: avs: Test result of avs_get_module_entry()
    a1780d8a7c26 ASoC: Intel: avs: Fix potential integer overflow
    7976b78631ee ASoC: Intel: avs: Fix ASRC module initialization
    c81b6d64962a selftests: cgroup: skip test_cgcore_lesser_ns_open when cgroup2 mounted without nsdelegate
    be84945440c9 fbdev: sisfb: hide unused variables
    28049d5a74a8 ASoC: SOF: Intel: mtl: Implement firmware boot state check
    f0bf72d1b49e ASoC: SOF: Intel: mtl: Disable interrupts when firmware boot failed
    02be4ce0d0be ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails
    6bdadbee34d9 ASoC: SOF: Intel: lnl: Correct rom_status_reg
    8aeb3dc8b3cd ASoC: SOF: Intel: mtl: Correct rom_status_reg
    368017b1bff7 ASoC: SOF: Intel: pci-mtl: fix ARL-S definitions
    1ef8f0b414ce ASoC: SOF: Intel: pci-mtl: use ARL specific firmware definitions
    46c15b7130fe ASoC: Intel: common: add ACPI matching tables for Arrow Lake
    f0b4617d80c3 powerpc/fsl-soc: hide unused const variable
    af26ea99019c drm/mediatek: Add 0 size check to mtk_drm_gem_obj
    d5689998a093 drm/meson: vclk: fix calculation of 59.94 fractional rates
    1a7254525ca7 ASoC: kirkwood: Fix potential NULL dereference
    4a1dc9721275 fbdev: shmobile: fix snprintf truncation
    87b8dca6e06f ASoC: mediatek: Assign dummy when codec not specified for a DAI link
    9ceb5bd746e1 mtd: rawnand: hynix: fixed typo
    adbd5da08ec6 mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
    a6498eac492b ASoC: Intel: avs: ssm4567: Do not ignore route checks
    48f3fe137323 ASoC: Intel: Disable route checks for Skylake boards
    4e8c8b37ee84 drm/amd/display: Fix potential index out of bounds in color transformation function
    859da9472b4f drm/panel: atna33xc20: Fix unbalanced regulator in the case HPD doesn't assert
    9429b12dfcbd drm/dp: Don't attempt AUX transfers when eDP panels are not powered
    e71399aa6ce1 drm/lcdif: Do not disable clocks on already suspended hardware
    fc49f4d1a15f dev_printk: Add and use dev_no_printk()
    34d80802cb8e printk: Let no_printk() use _printk()
    5fdc39e02494 drm/omapdrm: Fix console with deferred ops
    c00e8fd74950 fbdev: Provide I/O-memory helpers as module
    e79f933ad162 drm/omapdrm: Fix console by implementing fb_dirty
    ec1723175a5f drm/ci: update device type for volteer devices
    aa03f049d453 drm/ci: add subset-1-gfx to LAVA_TAGS and adjust shards
    101bbe559da5 drm/ci: uprev mesa version: fix container build & crosvm
    45755ef11f03 drm/bridge: Fix improper bridge init order with pre_enable_prev_first
    5af2e235b0d5 Bluetooth: HCI: Remove HCI_AMP support
    75d7ac5e225e Bluetooth: hci_event: Remove code to removed CONFIG_BT_HS
    0a8af30a8672 Bluetooth: Remove usage of the deprecated ida_simple_xx() API
    f03d3322a785 Bluetooth: ISO: Fix BIS cleanup
    dfde465d8907 Bluetooth: qca: Fix error code in qca_read_fw_build_info()
    e231034377bc Bluetooth: compute LE flow credits based on recvbuf space
    3ddf170e4a60 net: micrel: Fix receiving the timestamp in the frame for lan8841
    5f9d2dcf7130 mptcp: SO_KEEPALIVE: fix getsockopt support
    d38625f71950 net: fec: remove .ndo_poll_controller to avoid deadlocks
    965d940fb741 ax25: Fix reference count leak issue of net_device
    38eb01edfdaa ax25: Fix reference count leak issues of ax25_dev
    39da6f09e110 ax25: Use kernel universal linked list to implement ax25_dev_list
    a1bf04458311 riscv, bpf: make some atomic operations fully ordered
    46f17e7d4fb5 s390/bpf: Emit a barrier for BPF_FETCH instructions
    1337ec94bc5a net/mlx5: Discard command completions in internal error
    f9caccdd42e9 net/mlx5: Add a timeout to acquire the command queue semaphore
    e93fc8d959e5 net/mlx5: Reload only IB representors upon lag disable/enable
    66a5f6e09c63 net/mlx5: Enable 4 ports multiport E-switch
    3398a40dccb8 ipv6: sr: fix invalid unregister error path
    6c6b74edc911 ipv6: sr: fix incorrect unregister order
    58fd673b0532 ipv6: sr: add missing seg6_local_exit
    78741b4caae1 net: openvswitch: fix overwriting ct original tuple for ICMPv6
    108ec8bf6483 net: usb: smsc95xx: stop lying about skb->truesize
    0688d4e499be af_unix: Fix data races in unix_release_sock/unix_stream_sendmsg
    8f6f82d6a205 net: ethernet: cortina: Locking fixes
    1ebaa96f97cd selftests: net: move amt to socat for better compatibility
    9d601b81f1fc selftests: net: add missing config for amt.sh
    229d4a32b53e selftests: net: add more missing kernel config
    5de5aeb98f9a eth: sungem: remove .ndo_poll_controller to avoid deadlocks
    11dd90c11ad0 net: ipv6: fix wrong start position when receive hop-by-hop fragment
    68d38724cf53 m68k: mac: Fix reboot hang on Mac IIci
    f3baf0f4f92a m68k: Fix spinlock race in kernel thread creation
    979d764ebdcd net: usb: sr9700: stop lying about skb->truesize
    80cb2f61a613 usb: aqc111: stop lying about skb->truesize
    18f59aab33bc HID: amd_sfh: Handle "no sensors" in PM operations
    9d08e7fd44ca wifi: mwl8k: initialize cmd->addr[] properly
    db9214833e58 x86/numa: Fix SRAT lookup of CFMWS ranges with numa_fill_memblks()
    4c62c6c8a006 kernel/numa.c: Move logging out of numa.h
    0d5cfcede0c9 scsi: qla2xxx: Fix debugfs output for fw_resource_count
    563e60927592 scsi: qedf: Ensure the copied buf is NUL terminated
    204714e68015 scsi: bfa: Ensure the copied buf is NUL terminated
    5386f6734dbc HID: intel-ish-hid: ipc: Add check for pci_alloc_irq_vectors
    c3ae972a22f2 selftests/bpf: Fix pointer arithmetic in test_xdp_do_redirect
    1ec7ccb4cd4b kunit: Fix kthread reference
    2d43d30aafb8 selftests: default to host arch for LLVM builds
    381079197e80 selftests/resctrl: fix clang build failure: use LOCAL_HDRS
    3af6ed233a60 selftests/binderfs: use the Makefile's rules, not Make's implicit rules
    ed74398642fc wifi: nl80211: Avoid address calculations via out of bounds array indexing
    166c9d2eef74 libbpf: Fix error message in attach_kprobe_multi
    35e001ce8492 wifi: mt76: mt7603: add wpdma tx eof flag for PSE client reset
    bdd2255fcfe5 wifi: mt76: mt7603: fix tx queue of loopback packets
    1f29d8571fa1 Revert "sh: Handle calling csum_partial with misaligned data"
    78a12934b721 sh: kprobes: Merge arch_copy_kprobe() into arch_prepare_kprobe()
    6675c541f540 bpf: Add BPF_PROG_TYPE_CGROUP_SKB attach type enforcement in BPF_LINK_CREATE
    b33a81e4ecfb wifi: ar5523: enable proper endpoint verification
    39f8a29330f4 bpf: Fix verifier assumptions about socket->sk
    62eb07923f36 wifi: carl9170: add a proper sanity check for endpoints
    d43a8c7ec084 macintosh/via-macii: Fix "BUG: sleeping function called from invalid context"
    7a44f4944b05 net: give more chances to rcu in netdev_wait_allrefs_any()
    a7678a16c25b drivers/perf: hisi: hns3: Actually use devm_add_action_or_reset()
    be1fa711e59c drivers/perf: hisi: hns3: Fix out-of-bound access when valid event group
    8e9aab249217 drivers/perf: hisi_pcie: Fix out-of-bound access when valid event group
    a80814fe9181 pwm: sti: Simplify probe function using devm functions
    cedd7e536935 pwm: sti: Prepare removing pwm_chip from driver data
    00bb933578ac tcp: avoid premature drops in tcp_add_backlog()
    a47027919d69 net: dsa: mv88e6xxx: Avoid EEPROM timeout without EEPROM on 88E6250-family switches
    d1e3dc19d50f net: dsa: mv88e6xxx: Add support for model-specific pre- and post-reset handlers
    d0e874a34863 wifi: ath10k: populate board data for WCN3990
    abd2e7118519 cpufreq: brcmstb-avs-cpufreq: ISO C90 forbids mixed declarations
    e1dcff6e299f scsi: ufs: core: mcq: Fix ufshcd_mcq_sqe_search()
    51929a8db813 selftests/bpf: Fix a fd leak in error paths in open_netns
    e19681ae6cf9 gfs2: do_xmote fixes
    b68b9dd723db gfs2: finish_xmote cleanup
    d6b412c510ac gfs2: Rename gfs2_withdrawn to gfs2_withdrawing_or_withdrawn
    7c2bc932b60d gfs2: Mark withdraws as unlikely
    0636b34b4458 gfs2: Fix potential glock use-after-free on unmount
    18dfb29644a4 gfs2: Remove ill-placed consistency check
    d312fbf6a24e gfs2: No longer use 'extern' in function declarations
    0db3b4e50241 gfs2: Rename gfs2_lookup_{ simple => meta }
    9db1bdd71441 gfs2: Convert gfs2_internal_read to folios
    d92445b23932 gfs2: Get rid of gfs2_alloc_blocks generation parameter
    09f8c676e4b4 wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
    55c54269fbd3 dt-bindings: thermal: loongson,ls2k-thermal: Fix incorrect compatible definition
    5b996de139b3 dt-bindings: thermal: loongson,ls2k-thermal: Add Loongson-2K0500 compatible
    27cacfc0818f dt-bindings: thermal: loongson,ls2k-thermal: Fix binding check issues
    2d5ca6e4a287 thermal/drivers/tsens: Fix null pointer dereference
    95575de7dede wifi: ath12k: fix out-of-bound access of qmi_invoke_handler()
    6ae55c7fa6be x86/purgatory: Switch to the position-independent small code model
    6c6c0afd3510 scsi: hpsa: Fix allocation size for Scsi_Host private data
    52c266b486ee scsi: libsas: Fix the failure of adding phy with zero-address to port
    1ea06a34f79c wifi: iwlwifi: mvm: init vif works only once
    f84b9b25d045 cppc_cpufreq: Fix possible null pointer dereference
    c0ed9a711e33 openrisc: traps: Don't send signals to kernel mode threads
    71d865be7c2f udp: Avoid call to compute_score on multiple sites
    edcdeb8a4fdf x86/pat: Fix W^X violation false-positives when running as Xen PV guest
    29681171ff21 x86/pat: Restructure _lookup_address_cpa()
    308fba77bc23 x86/pat: Introduce lookup_address_in_pgd_attr()
    3e99f060cfd2 cpufreq: exit() callback is optional
    99f3af0a1afd tcp: increase the default TCP scaling ratio
    ca19418abcf7 tcp: define initial scaling factor value as a macro
    a7fba17a0596 selftests/bpf: Fix umount cgroup2 error in test_sockmap
    dc03a3755358 x86/boot/64: Clear most of CR4 in startup_64(), except PAE, MCE and LA57
    abea81e6a722 gfs2: Fix "ignore unlock failures after withdraw"
    21d78e4c3661 gfs2: Don't forget to complete delayed withdraw
    673f7120a6e5 ACPI: disable -Wstringop-truncation
    acb5503dbb9c irqchip/loongson-pch-msi: Fix off-by-one on allocation error path
    a9bbafa46c16 irqchip/alpine-msi: Fix off-by-one in allocation error path
    1d4e1fa2f29a locking/atomic/x86: Correct the definition of __arch_try_cmpxchg128()
    040c3a00247d ACPI: LPSS: Advertise number of chip selects via property
    776bad0b1f63 scsi: ufs: core: Perform read back after disabling UIC_COMMAND_COMPL
    92374b6a5af1 scsi: ufs: core: Perform read back after disabling interrupts
    bfd29d5ea6ea scsi: ufs: core: Perform read back after writing UTP_TASK_REQ_LIST_BASE_H
    872f68019bc6 scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
    8e5ede836b74 scsi: ufs: qcom: Perform read back after writing CGC enable
    d2741b23b1b4 scsi: ufs: qcom: Perform read back after writing unipro mode
    32402b2a9c0b scsi: ufs: qcom: Perform read back after writing REG_UFS_SYS1CLK_1US
    8f01dda10c65 scsi: ufs: qcom: Perform read back after writing reset bit
    b17592380f9d bpf: prevent r10 register from being marked as precise
    7a7d4237e338 bpf: Pack struct bpf_fib_lookup
    f92aebf17026 bpftool: Mount bpffs on provided dir instead of parent dir
    875864670982 wifi: carl9170: re-fix fortified-memset warning
    bc236ebc2ab5 dlm: fix user space lock decision to copy lvb
    0fdbbe7ee7f4 bitops: add missing prototype check
    f3531ac07b4e mlx5: stop warning for 64KB pages
    7dd2a9bb7b75 mlx5: avoid truncating error message
    6541f8ea7623 qed: avoid truncating work queue length
    997a53102a3b enetc: avoid truncating error message
    c5202a38897d ACPI: Fix Generic Initiator Affinity _OSC bit
    2bd572d421e3 sched/fair: Add EAS checks before updating root_domain::overutilized
    c078f2b4921b wifi: iwlwifi: mvm: fix check in iwl_mvm_sta_fw_id_mask
    f0fe67ca7550 wifi: iwlwifi: reconfigure TLC during HW restart
    adde9190997e wifi: iwlwifi: mvm: select STA mask only for active links
    29caa342391c wifi: iwlwifi: mvm: allocate STA links only for active links
    6c166d1646ca wifi: ieee80211: fix ieee80211_mle_basic_sta_prof_size_ok()
    9fa391354a40 x86/boot: Ignore relocations in .notes sections in walk_relocs() too
    22c3d94cd445 wifi: mt76: mt7915: workaround too long expansion sparse warnings
    9cf8052afc94 wifi: ath12k: use correct flag field for 320 MHz channels
    ba3647aa16ae bpftool: Fix missing pids during link show
    424e5ac9761f wifi: ath11k: don't force enable power save on non-running vdevs
    c37466406f07 wifi: brcmfmac: pcie: handle randbuf allocation failure
    014e4e9275de wifi: ath10k: poll service ready message before failing
    e5d98cc3311f block: support to account io_ticks precisely
    99bbbd9aea05 block: fix and simplify blkdevparts= cmdline parsing
    910717920c8c block: refine the EOF check in blkdev_iomap_begin
    e8d340f80977 crypto: qat - specify firmware files for 402xx
    c9566b812c8f md: fix resync softlockup when bitmap size is less than array size
    1fc82121d038 lkdtm: Disable CFI checking for perms functions
    fbadcde1572f soc: qcom: pmic_glink: Make client-lock non-sleeping
    7880dbf4eafe kunit/fortify: Fix mismatched kvalloc()/vfree() usage
    fe3a28db0361 null_blk: Fix missing mutex_destroy() at module removal
    19e9452d731a soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
    0cac39347f4e firmware: qcom: scm: Fix __scm and waitq completion variable initialization
    8fc7934635bb soc: qcom: pmic_glink: notify clients about the current state
    d02c6eb5d3df soc: qcom: pmic_glink: don't traverse clients list without a lock
    840565b1351a s390/mm: Re-enable the shared zeropage for !PV and !skeys KVM guests
    b410a6c84d84 mm/userfaultfd: Do not place zeropages when zeropages are disallowed
    f32f810dcc19 io-wq: write next_work before dropping acct_lock
    af82d8d2179b jffs2: prevent xattr node from overflowing the eraseblock
    c4f49d3fc18a ARM: configs: sunxi: Enable DRM_DW_HDMI
    afb39909bfb5 rcu: Fix buffer overflow in print_cpu_stall_info()
    32d988f48ed2 rcu-tasks: Fix show_rcu_tasks_trace_gp_kthread buffer overflow
    1319dbd64b73 io_uring: use the right type for work_llist empty check
    a750b846c136 s390/cio: fix tracepoint subchannel type field
    b39d0d661752 crypto: x86/sha512-avx2 - add missing vzeroupper
    1c5bce29d0d9 crypto: x86/sha256-avx2 - add missing vzeroupper
    ba0aa694c332 crypto: x86/nh-avx2 - add missing vzeroupper
    4e9293d660bf crypto: ccp - drop platform ifdef checks
    45b92921759a parisc: add missing export of __cmpxchg_u8()
    fd848dc7e2cf nilfs2: fix out-of-range warning
    2ed750b7ae1b ecryptfs: Fix buffer size for tag 66 packet
    25edcae667c3 firmware: raspberrypi: Use correct device for DMA mappings
    d8c42a6e61d8 mm/slub, kunit: Use inverted data to corrupt kmem cache
    d0f14ae223c2 crypto: bcm - Fix pointer arithmetic
    d142957377c2 openpromfs: finish conversion to the new mount API
    396bc5e54b4f nvmet: prevent sprintf() overflow in nvmet_subsys_nsid_exists()
    daa27fd2e17d ksmbd: fix uninitialized symbol 'share' in smb2_tree_connect()
    4f65f4defe4e epoll: be better about file lifetimes
    71de5fc303a7 nvmet: fix nvme status code when namespace is disabled
    ae451994ba9c nvmet-tcp: fix possible memory leak when tearing down a controller
    b6eaa53f95c2 nvme: cancel pending I/O if nvme controller is in terminal state
    2ab74bf2827b nvmet-auth: replace pr_debug() with pr_err() to report an error.
    57a23adbc4f7 nvmet-auth: return the error code to the nvmet_auth_host_hash() callers
    8871cab467a5 nvme: find numa distance only if controller has valid numa id
    214301d0be27 x86/mm: Remove broken vsyscall emulation code from the page fault code
    6c49ba4025ee drm/amdkfd: Flush the process wq before creating a kfd_process
    de23d906b265 drm/amd/display: Disable seamless boot on 128b/132b encoding
    fefcd1c75baf drm/amd/display: Fix DC mode screen flickering on DCN321
    b6fab47b64f6 drm/amd/display: Add VCO speed parameter for DCN31 FPU
    53a7d15331b0 drm/amd/display: Allocate zero bw after bw alloc enable
    e0760e38474c drm/amd/display: Add dtbclk access to dcn315
    422f3259ac65 drm/amdgpu: Fix VRAM memory accounting
    cc73306bf4bb ALSA: hda: intel-dsp-config: harden I2C/I2S codec detection
    9973c0587149 ASoC: da7219-aad: fix usage of device_get_named_child_node()
    ae14ac3bc076 platform/x86: ISST: Add Grand Ridge to HPM CPU list
    3a83d0d284b9 softirq: Fix suspicious RCU usage in __do_softirq()
    107c893e0a5b ALSA: emu10k1: make E-MU FPGA writes potentially more reliable
    af8dc212f74a bpf, x86: Fix PROBE_MEM runtime load check
    37c275727aef fpga: dfl-pci: add PCI subdevice ID for Intel D5005 card
    964794778606 Input: xpad - add support for ASUS ROG RAIKIRI
    59e9cd63a528 KVM: selftests: Add test for uaccesses to non-existent vgic-v2 CPUIF
    02c36fe48100 ASoC: rt715-sdca: volume step modification
    be91170bee15 ASoC: rt715: add vendor clear control register
    91a0bd4e9c60 ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
    968f6983d41e regulator: vqmmc-ipq4019: fix module autoloading
    5c0b06dca44b regulator: qcom-refgen: fix module autoloading
    b084d3f57748 ASoC: rt722-sdca: add headset microphone vrefo setting
    dace61d6dc59 ASoC: rt722-sdca: modify channel number to support 4 channels
    b642f447cfde ASoC: dt-bindings: rt5645: add cbj sleeve gpio property
    7904b066296a ASoC: rt5645: Fix the electric noise due to the CBJ contacts floating
    f6bb8d6c2a64 ASoC: acp: Support microphone from device Acer 315-24p
    58872c444adc ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3
    a73f1e25d581 ALSA: hda: cs35l56: Exit cache-only after cs35l56_wait_for_firmware_boot()
    3ad4d29b6554 regulator: irq_helpers: duplicate IRQ name
    08133330692c ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to Asus T100TAM too
    02580c6afd15 sched/isolation: Fix boot crash when maxcpus < first housekeeping CPU
    1bb875147883 selftests: sud_test: return correct emulated syscall value on RISC-V
    9208e9c8bd0f drm/etnaviv: fix tx clock gating on some GC7000 variants
    b2959fdd3af2 LoongArch: Lately init pmu after smp is online
    976b74fa6084 cpu: Ignore "mitigations" kernel parameter if CPU_MITIGATIONS=n
    d4ed9984871c Revert "net: txgbe: fix clk_name exceed MAX_DEV_ID limits"
    d6a2007376ca Revert "net: txgbe: fix i2c dev name cannot match clkdev"
    39cfce75168c drm/amdgpu/mes: fix use-after-free issue
    67aa2a7b83be drm/amdgpu: Fix the ring buffer size for queue VM flush
    bdbb7611dd2e drm/amdkfd: Add VRAM accounting for SVM migration
    7e1247995853 drm/amd/pm: Restore config space after reset
    04cf241fe5e5 drm/amdgpu: Update BO eviction priorities
    17f689f10fc0 drm/amd/display: Set color_mgmt_changed to true on unsuspend
    85f0812b6d5c net: usb: qmi_wwan: add Telit FN920C04 compositions
    ca2da54610f0 HID: mcp-2221: cancel delayed_work only when CONFIG_IIO is enabled
    e26d4063d223 dt-bindings: rockchip: grf: Add missing type to 'pcie-phy' node
    125c0dcc000f wifi: cfg80211: fix the order of arguments for trace events of the tx_rx_evt class
    ea2121cdc7ab wifi: mac80211: ensure beacon is non-S1G prior to extracting the beacon timestamp field
    0cfadb49ef90 wifi: mac80211: don't use rate mask for scanning
    09133f4b5651 KEYS: asymmetric: Add missing dependencies of FIPS_SIGNATURE_SELFTEST
    21c7e4587e29 KEYS: asymmetric: Add missing dependency on CRYPTO_SIG
    2f103287ef79 ALSA: Fix deadlocks with kctl removals at disconnection
    e644036a3e2b ALSA: core: Fix NULL module pointer assignment at card init
    8d04efceb46f ALSA: hda/realtek: fix mute/micmute LEDs don't work for ProBook 440/460 G11.
    5698ba69326c ksmbd: ignore trailing slashes in share paths
    6772584945b6 ksmbd: avoid to send duplicate oplock break notifications
    579a0c69794b fs/ntfs3: Break dir enumeration if directory contents error
    84906740dc56 fs/ntfs3: Fix case when index is reused during tree transformation
    e4fd2dce71fb fs/ntfs3: Taking DOS names into account during link counting
    df1f6ed23b51 fs/ntfs3: Remove max link count info display during driver init
    a8799662fed1 nilfs2: fix potential hang in nilfs_detach_log_writer()
    f81fd0061066 nilfs2: fix unexpected freezing of nilfs_segctor_sync()
    f9186bba4ea2 nilfs2: fix use-after-free of timer for log writer thread
    d65984358ac0 net: smc91x: Fix m68k kernel compilation for ColdFire CPU
    77237eabdcd9 net: lan966x: remove debugfs directory in probe() error path
    5cd17f0e74cb net: ti: icssg_prueth: Fix NULL pointer dereference in prueth_probe()
    f678c3c33655 tools/nolibc/stdlib: fix memory error in realloc()
    64f0c3bd2dd7 tools/latency-collector: Fix -Wformat-security compile warns
    622ab95fdcfa net: mana: Fix the extra HZ in mana_hwc_send_request
    af3274905b31 ring-buffer: Fix a race between readers and resize checks
    68222d7b4b72 r8169: Fix possible ring buffer corruption on fragmented Tx packets.
    766e3bacc7f9 Revert "r8169: don't try to disable interrupts if NAPI is, scheduled already"
    a9886aad5dfd io_uring: fail NOP if non-zero op flags is passed in
    68a767dd690b Input: try trimming too long modalias strings
    e4a1d0aa0d4d serial: 8520_mtk: Set RTS on shutdown for Rx in-band wakeup
    7e16930d4671 serial: 8250_bcm7271: use default_mux_rate if possible
    c6e1650cf5df speakup: Fix sizeof() vs ARRAY_SIZE() bug
    62c3763dcb03 tty: n_gsm: fix missing receive state reset after mode switch
    774d83b008ec tty: n_gsm: fix possible out-of-bounds in gsm0_receive()
    7b4881da5b19 ftrace: Fix possible use-after-free issue in ftrace_location()
    775de4e954cb selftests/ftrace: Fix BTFARG testcase to check fprobe is enabled correctly
    b1c2d09a40a5 x86/tsc: Trust initial offset in architectural TSC-adjust MSRs
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5d18e5da09b889578fb1f004e41869a81e10081)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index f8d47a9dba..50f4fe0eb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "59b2635b04e2ef8162e52f82e848b81073cea708"
-SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
+SRCREV_machine ?= "e88fd5bf97b83b10f7e93c2af4100cd16d59db63"
+SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.32"
+LINUX_VERSION ?= "6.6.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7378a37521..a330e14468 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.32"
+LINUX_VERSION ?= "6.6.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
+SRCREV_machine ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b64ac78fd1..f67d73d2e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6e4ec0ec5052e3a107ec7e5977ea9282d3642ea7"
-SRCREV_machine:qemuarm64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemuloongarch64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemumips ?= "cab976b23497344b74b7e4cbcb5df732f8630150"
-SRCREV_machine:qemuppc ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemuriscv64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemuriscv32 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemux86 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemux86-64 ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_machine:qemumips64 ?= "aa0c0197b3a0628992e959708a2ad015603e93ad"
-SRCREV_machine ?= "9576b5b9f8e3c78e6c315f475def18e5c29e475a"
-SRCREV_meta ?= "66bebb6789d02e775d4c93d7ca4bf79c2ead4b28"
+SRCREV_machine:qemuarm ?= "a12679d200785775317fb7b7fe9b145cd77187eb"
+SRCREV_machine:qemuarm64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemuloongarch64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemumips ?= "f0ff71ea239e1395c9318d4edd2213a702aa8d19"
+SRCREV_machine:qemuppc ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemuriscv64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemuriscv32 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemux86 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemux86-64 ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_machine:qemumips64 ?= "39f86019c95a6efb4aa3bf4d0185f05bb184d29b"
+SRCREV_machine ?= "64ebf485c56b5375d9196020b3ed92f857283ee0"
+SRCREV_meta ?= "e48b725284bb2889c8c5da8d255ec277f44bf8a0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "91de249b6804473d49984030836381c3b9b3cfb0"
+SRCREV_machine:class-devupstream ?= "76d42e596d895c53abf86daca4e5877fe0088145"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.32"
+LINUX_VERSION ?= "6.6.34"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


