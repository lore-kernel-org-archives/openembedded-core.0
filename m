Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F83CC04A94
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.53945.1691465761180980199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fMpjw0EX;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7658752ce2fso329740385a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465760; x=1692070560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbZs6sVG73nL20p+yvdQBuD4pQJRqL192MsBwPnSuaY=;
        b=fMpjw0EX7PXwAPsAVpkQt32okj8gnshc6zKlh7p6M8OInqeJAzMCrVYm/nb+AN4JnN
         yVCgvtwS/Nm5P+5QgA0+Y9W4nu/5uoObubyfSXjziVeMi2mcJSzOh9uHYH9l5Jmiicak
         xkIy3YxLbxQlToC8AFWIMDKcNY5Pgt5BU+jta8swR7Az/ES/ppZCQuXMk6vUOEZKYAyB
         vfTbl9HoP54NvEdqCO74xXjaU6V4DOHq8oKs24RotAmyn55SPPkTGB/f24DExA/TVO79
         sx4k+i4ibsb68+sToaxTC/V6Y3wg/YaO5wwQZ4Gqw9GtuoWc2CyuCtvNDCWzVz1fBK7N
         9jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465760; x=1692070560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbZs6sVG73nL20p+yvdQBuD4pQJRqL192MsBwPnSuaY=;
        b=fe1NFMBJwxkE6icic2hpE4IU3Y+0L8URZbRpLKj+guss5Nk6ClAfwZy/5dR8kP4AQh
         IiFehUym7iISIIsmhkckSyOV4KcH70Zi5HzJJlGAffgqBy8EwlySg2/hGvlJ+o+Ct5Dn
         GxVKB7pu968DTQFAEd5FEgms1h8rYazMLj1M0dj7XSabNSPjOOPi47RbIpBxznGOG8bn
         Sww/3C1UBbe52gDkXo0pv4EYvMtzUaVeH4psaGVzYK9RbdMCHz+tM5nxkCg7ETw86w6N
         G1PX43/9nMaHyopQZ06LGRdHcuB49XhaX6fseU3/zG0QRmFU7VJp50n56hHM8TYOHpI1
         GA1A==
X-Gm-Message-State: AOJu0YyrGbk2qK4IBbfVuncITulGwWJ9zm0pJx1wRI4MkUrk2xFsCBZD
	oXWu4k6Oip1ZcXfivjtbtuQ5PshHXIO7xg==
X-Google-Smtp-Source: AGHT+IF3yyZsvNsXcuuRSU/RZx3iUDbN6xORW4fttcIHrIKgXwebPd7MitgKbaIcbdEHpxfuEdqpKg==
X-Received: by 2002:a05:620a:bcc:b0:768:163c:31b4 with SMTP id s12-20020a05620a0bcc00b00768163c31b4mr10570263qki.57.1691465760012;
        Mon, 07 Aug 2023 20:36:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:35:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/6.4: update to v6.4.7
Date: Mon,  7 Aug 2023 23:35:50 -0400
Message-Id: <522879e9784766cc6bb6c945a2a29cd1593302fb.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185634

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4e382c2b4683 Linux 6.4.7
    8ab7147dfae7 Revert "drm/amd/display: edp do not add non-edid timings"
    e4f89142977e drm/amd/display: Add polling method to handle MST reply packet
    cae69403a82c drm/amd/display: Clean up errors & warnings in amdgpu_dm.c
    3601729d3d6e scsi: sg: Fix checking return value of blk_get_queue()
    1e391c7f7cf3 scsi/sg: don't grab scsi host module reference
    92e80c692c4b spi: dw: Remove misleading comment for Mount Evans SoC
    e7cf50e41bdc drm/ttm: fix bulk_move corruption when adding a entry
    5339e36dffb7 tracing/histograms: Return an error if we fail to add histogram to hist_vars list
    801d026d61b2 kbuild: rust: avoid creating temporary files
    a448856c3a1c jbd2: recheck chechpointing non-dirty buffer
    da1818adbaa3 net: phy: prevent stale pointer dereference in phy_init()
    4a6ebe88cd96 tcp: annotate data-races around fastopenq.max_qlen
    a1d2126fcb96 tcp: annotate data-races around icsk->icsk_user_timeout
    3c475a047438 tcp: annotate data-races around tp->notsent_lowat
    c52aa6ac5854 tcp: annotate data-races around rskq_defer_accept
    279e1cf49926 tcp: annotate data-races around tp->linger2
    a2da353de8a5 tcp: annotate data-races around icsk->icsk_syn_retries
    80cd1842e2da tcp: annotate data-races around tp->keepalive_probes
    7416761d5b1c tcp: annotate data-races around tp->keepalive_intvl
    b9fcb5916319 tcp: annotate data-races around tp->keepalive_time
    ed49960ee0c2 tcp: annotate data-races around tp->tsoffset
    2b8c25de5195 tcp: annotate data-races around tp->tcp_tx_delay
    bb9c26f32e0c Bluetooth: btusb: Fix bluetooth on Intel Macbook 2014
    1add77db60fe Bluetooth: SCO: fix sco_conn related locking and validity issues
    357ab53c83a5 Bluetooth: hci_conn: return ERR_PTR instead of NULL when there is no link
    bf00c2c8f625 Bluetooth: hci_sync: Avoid use-after-free in dbg for hci_remove_adv_monitor()
    88ad50f2b843 Bluetooth: ISO: fix iso_conn related locking and validity issues
    093a07052406 Bluetooth: hci_event: call disconnect callback before deleting conn
    cef88a0fd8e9 Bluetooth: use RCU for hci_conn_params and iterate safely in hci_sync
    ab87c6b43822 netfilter: nf_tables: skip bound chain on rule flush
    b2bdf3feae26 netfilter: nf_tables: skip bound chain in netns release path
    48dbb5d24c66 netfilter: nft_set_pipapo: fix improper element removal
    d78a37553b12 netfilter: nf_tables: can't schedule in nft_chain_validate
    08ca12fa9237 netfilter: nf_tables: fix spurious set element insertion failure
    540075ceefc6 ALSA: hda/realtek: Fix generic fixup definition for cs35l41 amp
    b7117b723377 llc: Don't drop packet from non-root netns.
    b492d371c622 fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe
    41d5ae320dca net: ethernet: mtk_eth_soc: always mtk_get_ib1_pkt_type
    70a2d37cd86e Revert "tcp: avoid the lookup process failing to get sk in ehash table"
    cba5b13f4053 net:ipv6: check return value of pskb_trim()
    ef0fe1aff76e net: ipv4: Use kfree_sensitive instead of kfree
    7552f8e70c88 tcp: annotate data-races around tcp_rsk(req)->ts_recent
    d546247e49fb tcp: annotate data-races around tcp_rsk(req)->txhash
    67f6f186ccae net: ipv4: use consistent txhash in TIME_WAIT and SYN_RECV
    d5c3b02ffd1c igc: Prevent garbled TX queue with XDP ZEROCOPY
    c6255814ae94 igc: Avoid transmit queue timeout for XDP
    7a4c79329b9c bpf, arm64: Fix BTI type used for freplace attached functions
    275d5743f622 bpf: Repeat check_max_stack_depth for async callbacks
    5e13be2071ac bpf: Fix subprog idx logic in check_max_stack_depth
    521c84b9e107 octeontx2-pf: Dont allocate BPIDs for LBK interfaces
    6a183c72f106 vrf: Fix lockdep splat in output path
    cecb533d126d security: keys: Modify mismatched function name
    532fbfc96d97 iavf: fix reset task race with iavf_remove()
    63d14a431285 iavf: fix a deadlock caused by rtnl and driver's lock circular dependencies
    d55495756d95 iavf: Wait for reset in callbacks which trigger it
    e631b18cc570 iavf: make functions static where possible
    5e9db32eec62 iavf: use internal state to free traffic IRQs
    65ecebc9ac09 iavf: Fix out-of-bounds when setting channels on remove
    8d781a9c5303 iavf: Fix use-after-free in free_netdev
    21d92025e806 drm/i915/perf: add sentinel to xehp_oa_b_counters
    899057ac0fed r8169: fix ASPM-related problem for chip version 42 and 43
    024825dfdc62 net: dsa: microchip: correct KSZ8795 static MAC table access
    6777dfaf7c5a net: sched: cls_bpf: Undo tcf_bind_filter in case of an error
    cec095b3387e net: sched: cls_u32: Undo refcount decrement in case update failed
    025159ed118b net: sched: cls_u32: Undo tcf_bind_filter if u32_replace_hw_knode
    1134ceab9192 net: sched: cls_matchall: Undo tcf_bind_filter in case of failure after mall_set_parms
    04a025b17d83 regulator: da9063: fix null pointer deref with partial DT config
    d923485630d0 ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()
    ca03b327224e ice: prevent NULL pointer deref during reload
    9751240ec462 ice: Unregister netdev and devlink_port only once
    57d25e9905c7 cifs: fix mid leak during reconnection after timeout threshold
    9ee1fce29fe6 iommu/sva: Fix signedness bug in iommu_sva_alloc_pasid()
    52367a236fed gso: fix dodgy bit handling for GSO_UDP_L4
    2fffd17951a1 net: ethernet: mtk_eth_soc: handle probe deferral
    d8415abc62b1 bridge: Add extack warning when enabling STP in netns.
    92348447546f net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()
    445b30171d1f dsa: mv88e6xxx: Do a final check before timing out
    052459702231 arm64: Fix HFGxTR_EL2 field naming
    eb382196e6f6 smb: client: fix missed ses refcounting
    224ff8d6cab5 kallsyms: strip LTO-only suffixes from promoted global functions
    03e37c96e95b spi: s3c64xx: clear loopback bit after loopback test
    0d7c5934f01c btrfs: be a bit more careful when setting mirror_num_ret in btrfs_map_block
    3b1297c4b840 perf build: Fix library not found error when using CSLIBS
    38282a92c304 fbdev: imxfb: Removed unneeded release_mem_region
    1a7ea3b01226 fbdev: imxfb: warn about invalid left/right margin
    46d461f21e34 spi: bcm63xx: fix max prepend length
    6d65f4a71479 pinctrl: renesas: rzg2l: Handle non-unique subnode names
    3775d589ed99 pinctrl: renesas: rzv2m: Handle non-unique subnode names
    d124ab17024c sched/psi: use kernfs polling functions for PSI trigger polling
    cf954dd718e3 sched/fair: Use recent_used_cpu to test p->cpus_ptr
    04db1d8aa6e3 iov_iter: Mark copy_iovec_from_user() noclone
    ea5f73dc7e73 ASoC: qcom: q6apm: do not close GPR port before closing graph
    35e3982b5edc ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
    3a5a0585c6b1 ASoC: codecs: wcd938x: fix mbhc impedance loglevel
    8e7b00649d93 ASoC: amd: acp: fix for invalid dai id handling in acp_get_byte_count()
    14621889cf11 net: hns3: fix strncpy() not using dest-buf length as length issue
    41f63b72a01c igb: Fix igb_down hung on surprise removal
    ed64a07d88c3 wifi: iwlwifi: pcie: add device id 51F1 for killer 1675
    65b76a252b6e wifi: iwlwifi: mvm: avoid baid size integer overflow
    418344157a38 wifi: iwlwifi: Add support for new PCI Id
    8c3178d23156 wifi: wext-core: Fix -Wstringop-overflow warning in ioctl_standard_iw_point()
    bb4d473bab7d wifi: iwlwifi: mvm: Add NULL check before dereferencing the pointer
    21b9e0efb38e devlink: report devlink_port_type_warn source device
    46393b829d1e net: ethernet: litex: add support for 64 bit stats
    133b1cd4d98b wifi: iwlwifi: mvm: fix potential array out of bounds access
    55248d36beb7 wifi: ath11k: fix memory leak in WMI firmware stats
    7382d02160ef wifi: ath12k: Avoid NULL pointer access during management transmit cleanup
    5fc72f4ca44d spi: dw: Add compatible for Intel Mount Evans SoC
    a8a20fed3e05 wifi: mac80211_hwsim: Fix possible NULL dereference
    22f675f335aa wifi: ath11k: add support default regdb while searching board-2.bin for WCN6855
    3534c7b7b329 devlink: make health report on unregistered instance warn just once
    7c4f5ab63e79 bpf: Silence a warning in btf_type_id_size()
    79e43714e686 wifi: rtw88: sdio: Check the HISR RX_REQUEST bit in rtw_sdio_rx_isr()
    0a844d873bf8 bpf: tcp: Avoid taking fast sock lock in iterator
    926a175026fe bpf: drop unnecessary user-triggerable WARN_ONCE in verifierl log
    9acda85c7d0e spi: cadence-quadspi: Add compatible for AMD Pensando Elba SoC
    6e5e83b56f50 bpf: Address KCSAN report on bpf_lru_list
    c7f54ef43499 bpf: Print a warning only if writing to unprivileged_bpf_disabled.
    32ca096e712a wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range
    34eb902050d4 sched/fair: Don't balance task to its current running CPU
    047bbb3730c6 tools/nolibc: ensure stack protector guard is never zero
    c57c2786ffb1 rcu: Mark additional concurrent load from ->cpu_no_qs.b.exp
    ea9b81c7d910 rcu-tasks: Avoid pr_info() with spin lock in cblist_init_generic()
    0c5b5d3f9a4a ACPI: video: Add backlight=native DMI quirk for Dell Studio 1569
    b03c7fcc5ed8 arm64: mm: fix VA-range sanity check
    d3b219e504fc arm64: set __exception_irq_entry with __irq_entry as a default
    aeb3c9a1f3a0 ACPI: resource: Remove "Zen" specific match and quirks
    6e29d9106c83 ACPI: video: Add backlight=native DMI quirk for Lenovo ThinkPad X131e (3371 AMD version)
    dfde1a0d7f99 ACPI: video: Add backlight=native DMI quirk for Apple iMac11,3
    33a43f6247ff ACPI: x86: Add ACPI_QUIRK_UART1_SKIP for Lenovo Yoga Book yb1-x90f/l
    c643c2ff7c3a ACPI: button: Add lid disable DMI quirk for Nextbook Ares 8A
    285941d0d5e7 ACPI: x86: Add skip i2c clients quirk for Nextbook Ares 8A
    597fb60c7513 erofs: Fix detection of atomic context
    951b87d8ba6a btrfs: abort transaction at update_ref_for_cow() when ref count is zero
    d40be032ecd8 btrfs: don't check PageError in __extent_writepage
    689f5fbd897b btrfs: add xxhash to fast checksum implementations
    37175e25edf7 posix-timers: Ensure timer ID search-loop limit is valid
    3e977386521b blk-mq: fix NULL dereference on q->elevator in blk_mq_elv_switch_none
    4cc664e59bf2 scsi: sg: fix blktrace debugfs entries leakage
    fbf50184190d md/raid10: prevent soft lockup while flush writes
    5df4edc59c33 md: fix data corruption for raid456 when reshape restart while grow up
    b0ed8ed0428e FS: JFS: Check for read-only mounted filesystem in txBegin
    fd2db13fb72f FS: JFS: Fix null-ptr-deref Read in txBegin
    1a4d22d8d1bc MIPS: dec: prom: Address -Warray-bounds warning
    f2af019091f9 fs: jfs: Fix UBSAN: array-index-out-of-bounds in dbAllocDmapLev
    8374bcb27120 ALSA: hda/realtek: Add quirks for ROG ALLY CS35l41 audio
    4d50988da0db udf: Fix uninitialized array access for some pathnames
    da2b6f919aa0 ovl: check type and offset of struct vfsmount in ovl_entry
    1af064b17479 HID: add quirk for 03f0:464a HP Elite Presenter Mouse
    6f4e543d277a quota: fix warning in dqgrab()
    50ff4ede9afd quota: Properly disable quotas when add_dquot_ref() fails
    03a67caf8e8d ALSA: emu10k1: roll up loops in DSP setup code for Audigy
    25e634d7f44e drm/radeon: Fix integer overflow in radeon_cs_parser_init
    8f07cd59268c ext4: correct inline offset when handling xattrs in inode body
    4368f59a292f KVM: arm64: vgic-v4: Make the doorbell request robust w.r.t preemption
    e4649d3da3da KVM: arm64: Disable preemption in kvm_arch_hardware_enable()
    a1023d9be174 KVM: arm64: Correctly handle page aging notifiers for unaligned memslot
    88430130cc8c KVM: arm64: timers: Use CNTHCTL_EL2 when setting non-CNTKCTL_EL1 bits
    898540115bed ASoC: codecs: wcd938x: fix soundwire initialisation race
    7f1c9f311858 ASoC: codecs: wcd938x: fix codec initialisation race
    825fe837519a ASoC: codecs: wcd934x: fix resource leaks on component remove
    31ee704c84c4 ASoC: codecs: wcd938x: fix missing mbhc init error handling
    c3586c7b613e ASoC: codecs: wcd938x: fix resource leaks on component remove
    7dacc3c6baed ASoC: tegra: Fix AMX byte map
    39f1fe576e22 ASoC: qdsp6: audioreach: fix topology probe deferral
    ce4059e1c0ac ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
    feedc8f580a6 ASoC: cs35l45: Select REGMAP_IRQ
    9ecc785bf08e ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
    37272bc55bca ASoC: cs42l51: fix driver to properly autoload with automatic module loading
    b22f3782210b ASoC: rt5640: Fix sleep in atomic context
    feb7df108445 ASoC: tegra: Fix ADX byte map
    5d43985c83dd ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode"
    f75eaaff30fa ASoC: fsl_sai: Disable bit clock with transmitter
    a14eeaefb850 drm/amd/display: Keep PHY active for DP displays on DCN31
    1caa548d82c4 drm/amd/display: check TG is non-null before checking if enabled
    951c565c21fb drm/amd/display: Disable MPC split by default on special asic
    cd013a58cf64 drm/amd/display: only accept async flips for fast updates
    8108a494639e drm/client: Fix memory leak in drm_client_modeset_probe
    4b596a6e2d2e drm/client: Fix memory leak in drm_client_target_cloned
    ef21043605e6 drm/nouveau/i2c: fix number of aux event slots
    92d48ce21645 drm/nouveau/kms/nv50-: init hpd_irq_lock for PIOR DP
    f01f7f27ca06 drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR AUX interrupts
    f155c402e9cb drm/amdgpu/pm: make mclk consistent for smu 13.0.7
    d28f75c986de drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
    1ac157c8a7ea drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
    819656cc03de dma-buf/dma-resv: Stop leaking on krealloc() failure
    9d036b953075 accel/qaic: Add consistent integer overflow checks
    57d14cb3bae4 accel/qaic: tighten bounds checking in decode_message()
    1072bace37ff accel/qaic: tighten bounds checking in encode_message()
    4ea5bb40511f selftests: tc: add ConnTrack procfs kconfig
    93e9a6775761 Revert "r8169: disable ASPM during NAPI poll"
    210a8cffc9c1 can: gs_usb: fix time stamp counter initialization
    f3083a981487 can: gs_usb: gs_can_open(): improve error handling
    dfd0aa26e9a0 can: bcm: Fix UAF in bcm_proc_show()
    6f615640f6b2 can: mcp251xfd: __mcp251xfd_chip_set_mode(): increase poll timeout
    292f0453b0d0 arm64/fpsimd: Ensure SME storage is allocated after SVE VL changes
    b9dd213e3c2d ia64: mmap: Consider pgoff when searching for free mapping
    c64ef6d440db regmap: Account for register length in SMBus I/O limits
    3cc626d346d3 of: Preserve "of-display" device name for compatibility
    9e12b9c3eb83 s390/zcrypt: fix reply buffer calculations for CCA replies
    4a3d22e23a9f regmap: Drop initial version of maximum transfer length fixes
    dc3f1650d56e selftests: tc: add 'ct' action kconfig dep
    cdcba752a3d4 accel/qaic: Fix a leak in map_user_pages()
    53db36320255 selftests: tc: set timeout to 15 minutes
    72efe5d44821 btrfs: fix race between balance and cancel/pause
    4bef9a6a75bc fuse: ioctl: translate ENOSYS in outarg
    cca627afb463 btrfs: zoned: fix memory leak after finding block group with super blocks
    40150056dc10 btrfs: fix double iput() on inode after an error during orphan cleanup
    a5880e69cf7f btrfs: set_page_extent_mapped after read_folio in btrfs_cont_expand
    a981a8b5d356 btrfs: raid56: always verify the P/Q contents for scrub
    b1b3f504dcd8 fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT
    c5f559674cc0 fuse: add feature flag for expire-only
    371b35073197 fuse: revalidate: don't invalidate if interrupted
    62dd82bc7a90 btrfs: fix warning when putting transaction with qgroups enabled after abort
    a21a43e4338f btrfs: fix iput() on error pointer after error during orphan cleanup
    c3e395fe7cb1 perf probe: Read DWARF files from the correct CU
    6869b2f022a5 perf probe: Add test for regression introduced by switch to die_get_decl_file()
    ffb4aa1c0564 prctl: move PR_GET_AUXV out of PR_MCE_KILL
    e091bb55af9a keys: Fix linking a duplicate key to a keyring's assoc_array
    f947a6f41c82 selftests/mm: mkdirty: fix incorrect position of #endif
    b724e834032b maple_tree: fix node allocation testing on 32 bit
    74da0d9708fb mm/mlock: fix vma iterator conversion of apply_vma_lock_flags()
    01cba7fcf57f maple_tree: set the node limit when creating a new root node
    33e76576be14 ALSA: hda/realtek: Enable Mute LED on HP Laptop 15s-eq2xxx
    194690a2db25 ALSA: hda/realtek: Add quirk for Clevo NS70AU
    b699e3c54d13 ALSA: hda/realtek - remove 3k pull low procedure
    450d9315d280 io_uring: Fix io_uring mmap() by using architecture-provided get_unmapped_area()
    a3f59cbeaa5d io_uring: treat -EAGAIN for REQ_F_NOWAIT as final for io-wq

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 35fca3c6f4..c34f7aa642 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8df85ca490c0935166bf1e37c31a15cfa67fb367"
-SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
+SRCREV_machine ?= "97762c26512762550f29ee326cc21df3e741efca"
+SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.6"
+LINUX_VERSION ?= "6.4.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 05de2de9ea..fe1cd84b66 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.6"
+LINUX_VERSION ?= "6.4.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
+SRCREV_machine ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 89a584f6eb..0c6ce89d3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "947101803b09cac13712ffa204c7ece607637847"
-SRCREV_machine:qemuarm64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemuloongarch64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemumips ?= "799410b270489281147c70347226ea5cefd97d02"
-SRCREV_machine:qemuppc ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemuriscv64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemuriscv32 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemux86 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemux86-64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_machine:qemumips64 ?= "6b9fb788ba68ef4f89af9394eead8222f39b792e"
-SRCREV_machine ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
-SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
+SRCREV_machine:qemuarm ?= "663ff8d31c3baf34361dbce2af2e5f551cd6958a"
+SRCREV_machine:qemuarm64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemuloongarch64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemumips ?= "86ad6578ddd4fc63ba08f7e451fc0e3282f589df"
+SRCREV_machine:qemuppc ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemuriscv64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemuriscv32 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemux86 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemux86-64 ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_machine:qemumips64 ?= "6467677b2a9876ba711a323a20a03c077ed34ab5"
+SRCREV_machine ?= "93c3b8441a06cc5b065e3373ccff6aa72cf980b6"
+SRCREV_meta ?= "7a654f3f799146d1a9bfbd78ddebdc53510951e9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "79562f63d621517795c125092620cf4e5778ad44"
+SRCREV_machine:class-devupstream ?= "4e382c2b468348d6208e5a18dbf1591a18170889"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.6"
+LINUX_VERSION ?= "6.4.7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


