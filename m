Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515F2C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:37 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.103963.1679670926954935920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VudBaJXV;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id oe8so1803376qvb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeWtVeD3+pz02eDnqyUI1UabXBX5TULZye7nS6Qi0xA=;
        b=VudBaJXVa52TBfx7mhG1Pg2YnTeUVaOwzSi7NsPEBsSP5kBJR6hYBkh0+0kwW4XV3/
         vzKwWI598fEi0wUM/t2JCaNreCQjd7HvvyUmWjtG0AtuGQ2dhzmzFRunJco7lcoAdTDy
         nhHyuZEhqKiGSdoLUJg6J3ByePJYEO9IX8kDntAEHBMFXdbAzs2vMu/ZYaywutebyEl7
         sQux6tOESDmgg/v7A8E70gw4a8LN7NNOpcn6k8NizVnaXh8dNCkU7+ivf5yeNNFYdGHJ
         uMYREPGntLM7qJi5tnKKb0lyH7TSCpUvscU1pydbRiL2zpxOubS32p3tb6/eIY8E89Tx
         lTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeWtVeD3+pz02eDnqyUI1UabXBX5TULZye7nS6Qi0xA=;
        b=yxXGZ/wxN8hBqAMuh+b9EBjW6JzazILPKsKJVMr2jK775gw0WfFTPPPiSVPaO70Ewz
         6wfvLkfEhQN7GqhRM8q5r5fHzjibzUuddLpYkLG+4NmEQqTklHONdQtHeYjnENtA8UXg
         Vy4t58T2gSnRaar6j5ZTZxQh+zIHB2mv+mLY/+qy/O5/iek/7gbHK1d/SkS7ms4LcraC
         OzOYDgeWEEw4wKvjVw3LQQA2x8dNAuvWD2iUNPNbB7oRxOofdliRxja+MQKqQqhRDMa4
         vbV6OF3IzItg7EYO4PhPlvalpzp0Nths91LAyffgV2ZGuvC6kJ/D+5fSu1c967RyFWpz
         xQ8g==
X-Gm-Message-State: AAQBX9fSYnluWd+tfRG8BvUryl0a1QolpOwZMr/H+PQhrBrQkGnTXa84
	kAXQAnaTxU9/TOgxTLi553GiSpT8K9XO0g==
X-Google-Smtp-Source: AKy350ZIVn4DgielQsxEabV/MgQVTMhTKZUnPGmy9da3KooiU38eMg2C+aKQFv0F7BszkLXPBksoTg==
X-Received: by 2002:ad4:5ca7:0:b0:5cc:e059:efa3 with SMTP id q7-20020ad45ca7000000b005cce059efa3mr4967374qvh.23.1679670925680;
        Fri, 24 Mar 2023 08:15:25 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id ek5-20020ad45985000000b005dd8b93459fsm748200qvb.55.2023.03.24.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:15:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4][dunfell] linux-yocto/5.4: update to v5.4.237
Date: Fri, 24 Mar 2023 11:15:20 -0400
Message-Id: <20230324151520.1349287-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
References: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179052

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e4b5c766f505 Linux 5.4.237
    6a16810068e7 s390/dasd: add missing discipline function
    7a934a77f11a UML: define RUNTIME_DISCARD_EXIT
    87fcce7a6f86 sh: define RUNTIME_DISCARD_EXIT
    eb9dbb70cdd5 s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
    219cc98501ff powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
    4eede1173fb5 powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
    d0fcf59038c5 arch: fix broken BuildID for arm64 and riscv
    a4bd6d4df382 x86, vmlinux.lds: Add RUNTIME_DISCARD_EXIT to generic DISCARDS
    1aed78cfda7f drm/i915: Don't use BAR mappings for ring buffers with LLC
    52fc917855ce ipmi:watchdog: Set panic count to proper value on a panic
    dbfae25b0196 ipmi/watchdog: replace atomic_add() and atomic_sub()
    f266cdd6796f media: ov5640: Fix analogue gain control
    fc9bc831509f PCI: Add SolidRun vendor ID
    094a073605b1 macintosh: windfarm: Use unsigned type for 1-bit bitfields
    737985dbcb67 alpha: fix R_ALPHA_LITERAL reloc for large modules
    2fea235ef07f MIPS: Fix a compilation issue
    6b06c4ae64e3 ext4: Fix deadlock during directory rename
    a99a61d9e1bf riscv: Use READ_ONCE_NOCHECK in imprecise unwinding stack mode
    1a517302dbe0 net/smc: fix fallback failed while sendmsg with fastopen
    3a747490f9c3 scsi: megaraid_sas: Update max supported LD IDs to 240
    d800996fcf60 btf: fix resolving BTF_KIND_VAR after ARRAY, STRUCT, UNION, PTR
    9f2e063dcbe2 netfilter: tproxy: fix deadlock due to missing BH disable
    16f3aae1aa2d bnxt_en: Avoid order-5 memory allocation for TPA data
    9dc16be373b3 net: caif: Fix use-after-free in cfusbl_device_notify()
    8018aa0863d6 net: lan78xx: fix accessing the LAN7800's internal phy specific registers from the MAC driver
    1c618f150c82 net: usb: lan78xx: Remove lots of set but unused 'ret' variables
    e4e5006c13f3 selftests: nft_nat: ensuring the listening side is up before starting the client
    783f218940b3 ila: do not generate empty messages in ila_xlat_nl_cmd_get_mapping()
    0a3664a1058d nfc: fdp: add null check of devm_kmalloc_array in fdp_nci_i2c_read_device_properties
    43f33642f260 drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
    8dac5a63cf79 ext4: Fix possible corruption when moving a directory
    891a3cba425c scsi: core: Remove the /proc/scsi/${proc_name} directory earlier
    57f78226b127 cifs: Fix uninitialized memory read in smb3_qfs_tcon()
    a6e44cb21534 SMB3: Backup intent flag missing from some more ops
    1b48c70feefc iommu/vt-d: Fix PASID directory pointer coherency
    985d9fa06b4b irqdomain: Fix domain registration race
    01ed8ff22a5b irqdomain: Change the type of 'size' in __irq_domain_add() to be consistent
    36c5682cbb46 ipmi:ssif: Add a timer between request retries
    e8ba1b693a8b ipmi:ssif: Increase the message retry time
    89fb3fa84883 ipmi:ssif: Remove rtc_us_timer
    d1a7f56b20da ipmi:ssif: resend_msg() cannot fail
    59349bfcffb1 ipmi:ssif: make ssif_i2c_send() void
    5e97dc748d13 iommu/amd: Add a length limitation for the ivrs_acpihid command-line parameter
    774c63f53688 iommu/amd: Fix ill-formed ivrs_ioapic, ivrs_hpet and ivrs_acpihid options
    11852cc78f67 iommu/amd: Add PCI segment support for ivrs_[ioapic/hpet/acpihid] commands
    3cdf19a29cc1 nfc: change order inside nfc_se_io error path
    0d8a6c9a6415 ext4: zero i_disksize when initializing the bootloader inode
    74d775083e9f ext4: fix WARNING in ext4_update_inline_data
    b36093c6f772 ext4: move where set the MAY_INLINE_DATA flag is set
    c24f83849379 ext4: fix another off-by-one fsmap error on 1k block filesystems
    aee90b0278e3 ext4: fix RENAME_WHITEOUT handling for inline directories
    1277ba3db6dc drm/connector: print max_requested_bpc in state debugfs
    e40c1e9da1ec x86/CPU/AMD: Disable XSAVES on AMD family 0x17
    6631c8da02cf fs: prevent out-of-bounds array speculation when closing a file descriptor
    b829e8b6e1a7 Linux 5.4.236
    6e55d8422373 staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh
    9498448b9ede staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script
    6ee84b8b7904 wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use after free for wext"
    126ee8982bfc Linux 5.4.235
    d03bc164f32f dt-bindings: rtc: sun6i-a31-rtc: Loosen the requirements on the clocks
    6ab670546319 media: uvcvideo: Fix race condition with usb_kill_urb
    0b8962c64bd6 media: uvcvideo: Provide sync and async uvc_ctrl_status_event
    2b1c5145b07d tcp: Fix listen() regression in 5.4.229.
    800a1c4c8a7f Bluetooth: hci_sock: purge socket queues in the destruct() callback
    27c64d90d944 x86/resctl: fix scheduler confusion with 'current'
    81da72aaf57a x86/resctrl: Apply READ_ONCE/WRITE_ONCE to task_struct.{rmid,closid}
    bde541a57b42 net: tls: avoid hanging tasks on the tx_lock
    d94fbfcd9a26 phy: rockchip-typec: Fix unsigned comparison with less than zero
    f0ee43d61d8d PCI: Add ACS quirk for Wangxun NICs
    f6d3aee1c663 kernel/fail_function: fix memory leak with using debugfs_lookup()
    195c1e9f454e usb: uvc: Enumerate valid values for color matching
    da4e715a466c USB: ene_usb6250: Allocate enough memory for full object
    117097966866 usb: host: xhci: mvebu: Iterate over array indexes instead of using pointer math
    f5b76a81665e iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_config_word()
    11b4b3b76988 iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_status_word()
    b854c66dd7a8 tools/iio/iio_utils:fix memory leak
    ea9b58789687 mei: bus-fixup:upon error print return values of send and receive
    c7ca2ca12a9f tty: serial: fsl_lpuart: disable the CTS when send break signal
    953a4a352a0c tty: fix out-of-bounds access in tty_driver_lookup_tty()
    70369a11170d staging: emxx_udc: Add checks for dma_alloc_coherent()
    2072ed7c1a4a media: uvcvideo: Silence memcpy() run-time false positive warnings
    e2cc773f1fc3 media: uvcvideo: Quirk for autosuspend in Logitech B910 and C910
    e4c535eccefb media: uvcvideo: Handle errors from calls to usb_string
    4e4e6ca62e77 media: uvcvideo: Handle cameras with invalid descriptors
    7195e642b49a mfd: arizona: Use pm_runtime_resume_and_get() to prevent refcnt leak
    fde59e273b03 firmware/efi sysfb_efi: Add quirk for Lenovo IdeaPad Duet 3
    2cc6a3e98f05 tracing: Add NULL checks for buffer in ring_buffer_free_read_page()
    4cfeb55a10b6 thermal: intel: BXT_PMIC: select REGMAP instead of depending on it
    e23f1d9e6e03 thermal: intel: quark_dts: fix error pointer dereference
    584f664c572f scsi: ipr: Work around fortify-string warning
    e93bda4ebb27 rtc: sun6i: Always export the internal oscillator
    728b047f4ca3 rtc: sun6i: Make external 32k oscillator optional
    9c7c1cf29fc3 vc_screen: modify vcs_size() handling in vcs_read()
    821362a2dfaf tcp: tcp_check_req() can be called from process context
    77606e383ecb ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    dda4f0a424c2 net/sched: act_sample: fix action bind logic
    271eed173642 nfc: fix memory leak of se_io context in nfc_genl_se_io
    f81af781f98c net/mlx5: Geneve, Fix handling of Geneve object id as error code
    4b71f2b54332 9p/rdma: unmap receive dma buffer in rdma_request()/post_recv()
    7cc9dbae8a5f 9p/xen: fix connection sequence
    9d1c625c99c5 9p/xen: fix version parsing
    edfba7b3228a net: fix __dev_kfree_skb_any() vs drop monitor
    cec326443f01 sctp: add a refcnt in sctp_stream_priorities to avoid a nested loop
    aba298b35619 ipv6: Add lwtunnel encap size of all siblings in nexthop calculation
    5d0d38805d32 netfilter: ctnetlink: fix possible refcount leak in ctnetlink_create_conntrack()
    fe65d6f26ba9 watchdog: pcwd_usb: Fix attempting to access uninitialized memory
    59e391b3fc50 watchdog: Fix kmemleak in watchdog_cdev_register
    7c428fc97499 watchdog: at91sam9_wdt: use devm_request_irq to avoid missing free_irq() in error path
    a8816afcaf1d x86: um: vdso: Add '%rcx' and '%r11' to the syscall clobber list
    b5be23f6ae61 ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
    1cb14c06d603 ubi: Fix UAF wear-leveling entry in eraseblk_count_seq_show()
    7fcbc41d762a ubifs: ubifs_writepage: Mark page dirty after writing inode failed
    510b80abe8d2 ubifs: dirty_cow_znode: Fix memleak in error handling path
    0875edcad42f ubifs: Re-statistic cleaned znode count if commit failed
    234c53e57424 ubi: Fix possible null-ptr-deref in ubi_free_volume()
    1f206002c6bc ubifs: Fix memory leak in alloc_wbufs()
    07b60f7452d2 ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()
    9c8be1f165ba ubi: Fix use-after-free when volume resizing failed
    e86d1b2bb716 ubifs: Reserve one leb for each journal head while doing budget
    82c096d0c99a ubifs: do_rename: Fix wrong space budget when target inode's nlink > 1
    bf8f5495849d ubifs: Fix wrong dirty space budget for dirty inode
    f29168fb527c ubifs: Rectify space budget for ubifs_xrename()
    86660306273a ubifs: Rectify space budget for ubifs_symlink() if symlink is encrypted
    4ca0d746226f ubifs: Fix build errors as symbol undefined
    f7adb740f97b ubi: ensure that VID header offset + VID header size <= alloc, size
    6480c3a12755 um: vector: Fix memory leak in vector_config
    01c92f033b27 fs: f2fs: initialize fsdata in pagecache_write()
    c4a89ebe9205 f2fs: use memcpy_{to,from}_page() where possible
    b915fac02098 pwm: stm32-lp: fix the check on arr and cmp registers update
    1abd3858023a pwm: sifive: Always let the first pwm_apply_state succeed
    30a3636fe6e2 pwm: sifive: Reduce time the controller lock is held
    62462a5b4f4d fs/jfs: fix shift exponent db_agl2size negative
    7a6fb69bbcb2 net/sched: Retire tcindex classifier
    b3d346ece979 kbuild: Port silent mode detection to future gnu make.
    68b0cdcfa135 wifi: ath9k: use proper statements in conditionals
    96a8424a27ed drm/radeon: Fix eDP for single-display iMac11,2
    6e6173886f58 drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv
    efc72cceb761 PCI: Avoid FLR for AMD FCH AHCI adapters
    bcc1bafb067d PCI: hotplug: Allow marking devices as disconnected during bind/unbind
    2a50583117b2 PCI/PM: Observe reset delay irrespective of bridge_d3
    40af9a6deed7 scsi: ses: Fix slab-out-of-bounds in ses_intf_remove()
    79ec5dd5fb07 scsi: ses: Fix possible desc_ptr out-of-bounds accesses
    8e454aba7280 scsi: ses: Fix possible addl_desc_ptr out-of-bounds accesses
    467afb1dd630 scsi: ses: Fix slab-out-of-bounds in ses_enclosure_data_process()
    6069e04a922a scsi: ses: Don't attach if enclosure has no components
    70e9a93f0945 scsi: qla2xxx: Fix erroneous link down
    3a564de3a299 scsi: qla2xxx: Fix DMA-API call trace on NVMe LS requests
    05a0f6fa52a8 scsi: qla2xxx: Fix link failure in NPIV environment
    18d347d1b08e ktest.pl: Add RUN_TIMEOUT option with default unlimited
    150ee1fc9080 ktest.pl: Fix missing "end_monitor" when machine check fails
    2f42bfc54d3a ktest.pl: Give back console on Ctrt^C on monitor
    b53d209d717b mm/thp: check and bail out if page in deferred queue already
    24900f35962b mm: memcontrol: deprecate charge moving
    964e9e1288fd media: ipu3-cio2: Fix PM runtime usage_count in driver unbind
    58c0d0b2d474 mips: fix syscall_get_nr
    229edf8d7b76 alpha: fix FEN fault handling
    9787b328c42c rbd: avoid use-after-free in do_rbd_add() when rbd_dev_create() fails
    7055754dd07c ARM: dts: exynos: correct TMU phandle in Odroid XU
    7b6707d66e28 ARM: dts: exynos: correct TMU phandle in Exynos4
    3c4a56ef7c53 dm flakey: don't corrupt the zero page
    a2be4225c31d dm flakey: fix logic when corrupting a bio
    64fbe39232ed thermal: intel: powerclamp: Fix cur_state for multi package system
    6f1959c17d4c wifi: cfg80211: Fix use after free for wext
    342cb34c5285 wifi: rtl8xxxu: Use a longer retry limit of 48
    a92b67e768bd ext4: refuse to create ea block when umounted
    3b28c799a133 ext4: optimize ea_inode block expansion
    87005d0ab5c4 ALSA: hda/realtek: Add quirk for HP EliteDesk 800 G6 Tower PC
    84ed1ade54b8 ALSA: ice1712: Do not left ice->gpio_mutex locked in aureon_add_controls()
    df129eaa2b88 irqdomain: Drop bogus fwspec-mapping error handling
    72232dbe14f9 irqdomain: Fix disassociation race
    2101663687e6 irqdomain: Fix association race
    f9d93201893d ima: Align ima_file_mmap() parameters with mmap_file LSM hook
    4d47cba0741c Documentation/hw-vuln: Document the interaction between IBRS and STIBP
    34c1b60e7a80 x86/speculation: Allow enabling STIBP with legacy IBRS
    979e197968a1 x86/microcode/AMD: Fix mixed steppings support
    727bc2c2856b x86/microcode/AMD: Add a @cpu parameter to the reloading functions
    4c26edf2ea23 x86/microcode/amd: Remove load_microcode_amd()'s bsp parameter
    a0415b79dd3f x86/kprobes: Fix arch_check_optimized_kprobe check within optimized_kprobe range
    ec206a38d3d2 x86/kprobes: Fix __recover_optprobed_insn check optimizing logic
    e4ce333cc66e x86/reboot: Disable SVM, not just VMX, when stopping CPUs
    37459195d971 x86/reboot: Disable virtualization in an emergency if SVM is supported
    87459b9fce2d x86/crash: Disable virt in core NMI crash handler to avoid double shootdown
    ee80fb1dca07 x86/virt: Force GIF=1 prior to disabling SVM (for reboot flows)
    4c9812d9890d KVM: s390: disable migration mode when dirty tracking is disabled
    10c2a20d73e9 KVM: Destroy target device if coalesced MMIO unregistration fails
    38a1f5e9fc56 udf: Fix file corruption when appending just after end of preallocated extent
    d747b31e2925 udf: Detect system inodes linked into directory hierarchy
    ce17ef97de84 udf: Preserve link count of system files
    7bd8d9e1cf56 udf: Do not update file length for failed writes to inline files
    3d20e3b768af udf: Do not bother merging very long extents
    4e41b1c5a272 udf: Truncate added extents on failed expansion
    dee96928d8f4 ocfs2: fix non-auto defrag path not working issue
    669134a66d37 ocfs2: fix defrag path triggering jbd2 ASSERT
    68a47ca95805 f2fs: fix cgroup writeback accounting with fs-layer encryption
    2bef8314fcf9 f2fs: fix information leak in f2fs_move_inline_dirents()
    3776ef785e10 fs: hfsplus: fix UAF issue in hfsplus_put_super
    eda6879272e4 hfs: fix missing hfs_bnode_get() in __hfs_bnode_create
    8ecde537edc3 ARM: dts: exynos: correct HDMI phy compatible in Exynos4
    e71e6fa07fe4 s390/kprobes: fix current_kprobe never cleared after kprobes reenter
    18075c0dc331 s390/kprobes: fix irq mask clobbering on kprobe reenter from post_handler
    c5db76fcddc1 s390: discard .interp section
    a9391f8bc98f ipmi_ssif: Rename idle state and check
    0ff4c222bd05 rtc: pm8xxx: fix set-alarm race
    69b8af77ef6b firmware: coreboot: framebuffer: Ignore reserved pixel color bits
    791402dd0514 wifi: rtl8xxxu: fixing transmisison failure for rtl8192eu
    3132aa35cfc2 nfsd: zero out pointers after putting nfsd_files on COPY setup error
    38b4d3eacb88 dm cache: add cond_resched() to various workqueue loops
    3b46b2cb917e dm thin: add cond_resched() to various workqueue loops
    2c055b6a07af drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5
    718ce68b3a7f pinctrl: at91: use devm_kasprintf() to avoid potential leaks
    4000384684f6 hwmon: (coretemp) Simplify platform device handling
    5026260ac2b2 regulator: s5m8767: Bounds check id indexing into arrays
    12527ae49d0c regulator: max77802: Bounds check regulator id against opmode
    7fae534a304b ASoC: kirkwood: Iterate over array indexes instead of using pointer math
    90c278c6d099 docs/scripts/gdb: add necessary make scripts_gdb step
    3a9a4a9725c6 drm/msm/dsi: Add missing check for alloc_ordered_workqueue
    f9f55fc64928 drm/radeon: free iio for atombios when driver shutdown
    5ccd8d09fee5 HID: Add Mapping for System Microphone Mute
    341a4c04ed48 drm/omap: dsi: Fix excessive stack usage
    d236103782de drm/amd/display: Fix potential null-deref in dm_resume
    5bc391944d9e uaccess: Add minimum bounds check on kernel buffer size
    0467681f0947 coda: Avoid partial allocation of sig_inputArgs
    1a98c4d9263d net/mlx5: fw_tracer: Fix debug print
    21856d5615a7 ACPI: video: Fix Lenovo Ideapad Z570 DMI match
    c727c1eb58e0 wifi: mt76: dma: free rx_head in mt76_dma_rx_cleanup
    51c0dca573c0 m68k: Check syscall_trace_enter() return code
    87363d1ab55e net: bcmgenet: Add a check for oversized packets
    fe00ab1eb3bc ACPI: Don't build ACPICA with '-Os'
    8ec82cfe4e74 ice: add missing checks for PF vsi type
    f81c0d484a0c inet: fix fast path in __inet_hash_connect()
    67e4519afba2 wifi: mt7601u: fix an integer underflow
    423a1297ea72 wifi: brcmfmac: ensure CLM version is null-terminated to prevent stack-out-of-bounds
    f3a324362b5e x86/bugs: Reset speculation control settings on init
    c8157f67b003 timers: Prevent union confusion from unexpected restart_syscall()
    f570968d0154 thermal: intel: Fix unsigned comparison with less than zero
    596d1fea0519 rcu: Suppress smp_processor_id() complaint in synchronize_rcu_expedited_wait()
    17dbe90e13f5 wifi: brcmfmac: Fix potential stack-out-of-bounds in brcmf_c_preinit_dcmds()
    9e8bf9f95f7a blk-iocost: fix divide by 0 error in calc_lcoefs()
    f10001af0f72 ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
    dae4d5ae6b87 udf: Define EFSCORRUPTED error code
    824b167fa8dd rpmsg: glink: Avoid infinite loop on intent for missing channel
    a41bb59eff7a media: usb: siano: Fix use after free bugs caused by do_submit_urb
    2a72e3b6bb08 media: i2c: ov7670: 0 instead of -EINVAL was returned
    d120334278b3 media: rc: Fix use-after-free bugs caused by ene_tx_irqsim()
    448ce1cd5038 media: i2c: ov772x: Fix memleak in ov772x_probe()
    086a80b842bc media: ov5675: Fix memleak in ov5675_init_controls()
    ec6bd0dccd9c powerpc: Remove linker flag from KBUILD_AFLAGS
    44aef56083aa media: platform: ti: Add missing check for devm_regulator_get
    fc85fb57631a remoteproc: qcom_q6v5_mss: Use a carveout to authenticate modem headers
    3acbec356d7e MIPS: vpe-mt: drop physical_memsize
    a3c920040517 MIPS: SMP-CPS: fix build error when HOTPLUG_CPU not set
    1abc7be57c1c powerpc/eeh: Set channel state after notifying the drivers
    7719aba7a39c powerpc/eeh: Small refactor of eeh_handle_normal_event()
    a39becb905b9 powerpc/rtas: ensure 4KB alignment for rtas_data_buf
    0616586eefd0 powerpc/rtas: make all exports GPL
    d8ca49859179 powerpc/pseries/lparcfg: add missing RTAS retry status handling
    421c59c23aba powerpc/pseries/lpar: add missing RTAS retry status handling
    2c5ad2d642a3 clk: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled()
    4d178dc25fb6 powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
    b1c1b6da5ab0 clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
    e3617778eb1b Input: ads7846 - don't check penirq immediately for 7845
    ea9c4fbfda69 Input: ads7846 - don't report pressure for ads7845
    17761a1c7fcd clk: renesas: cpg-mssr: Remove superfluous check in resume code
    8ff19db90352 clk: renesas: cpg-mssr: Use enum clk_reg_layout instead of a boolean flag
    330b70949cb4 clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed
    f34eb1e4336e mtd: rawnand: sunxi: Fix the size of the last OOB region
    cdfdd882fae9 clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
    b419e91378ed clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
    588edb4fb1f1 mfd: pcf50633-adc: Fix potential memleak in pcf50633_adc_async_read()
    6e0a0eb18e04 selftests/ftrace: Fix bash specific "==" operator
    16a35042ff8a sparc: allow PM configs for sparc32 COMPILE_TEST
    090a22f5999d perf tools: Fix auto-complete on aarch64
    5d32f3e9227a perf llvm: Fix inadvertent file creation
    ce43565a6cd1 gfs2: jdata writepage fix
    3524d6da0fe8 cifs: Fix warning and UAF when destroy the MR list
    324c0c34fff1 cifs: Fix lost destroy smbd connection when MR allocate failed
    a22f1ecab6d4 nfsd: fix race to check ls_layouts
    5a195fa41d01 hid: bigben_probe(): validate report count
    9f525559ea39 HID: asus: Fix mute and touchpad-toggle keys on Medion Akoya E1239T
    bc786dfeb792 HID: asus: Add support for multi-touch touchpad on Medion Akoya E1239T
    bad4a822a118 HID: asus: Add report_size to struct asus_touchpad_info
    63792d0ae94e HID: asus: Only set EV_REP if we are adding a mapping
    25e14bf0c894 HID: bigben: use spinlock to safely schedule workers
    715edb0109ca HID: bigben_worker() remove unneeded check on report_field
    12533ad8545c HID: bigben: use spinlock to protect concurrent accesses
    05cb432c0909 ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not declared
    84beaa3e2eec ASoC: dapm: declare missing structure prototypes
    d6250e00bf42 spi: synquacer: Fix timeout handling in synquacer_spi_transfer_one()
    b89d2ed56406 dm: remove flush_scheduled_work() during local_exit()
    e6d9a876d914 hwmon: (mlxreg-fan) Return zero speed for broken fan
    870a0f519ac2 spi: bcm63xx-hsspi: Fix multi-bit mode setting
    dd271f179806 spi: bcm63xx-hsspi: fix pm_runtime
    904b717bb527 scsi: aic94xx: Add missing check for dma_map_single()
    3414be1c8cd1 hwmon: (ltc2945) Handle error case in ltc2945_value_store
    75a1c3f82232 gpio: vf610: connect GPIO label to dev name
    584cb84e2c6d ASoC: soc-compress.c: fixup private_data on snd_soc_new_compress()
    a161f1d92aab drm/mediatek: Clean dangling pointer on bind error path
    b8b166db7885 drm/mediatek: Drop unbalanced obj unref
    367c80fb343f drm/mediatek: Use NULL instead of 0 for NULL pointer
    a0555f90d823 drm/mediatek: remove cast to pointers passed to kfree
    2b59e87c92f0 gpu: host1x: Don't skip assigning syncpoints to channels
    3975ea6eaffe drm/msm/mdp5: Add check for kzalloc
    2a8bb9dce7fd drm: Initialize struct drm_crtc_state.no_vblank from device settings
    9b2f5844903a drm/bridge: Introduce drm_bridge_get_next_bridge()
    bb08be7232ef drm/bridge: Rename bridge helpers targeting a bridge chain
    2c33a6141de2 drm/exynos: Don't reset bridge->next
    dadd30fcc7e3 drm/msm/dpu: Add check for pstates
    a6afb8293ec0 drm/msm/dpu: Add check for cstate
    8f9fdc830d6d drm/msm: use strscpy instead of strncpy
    d7ea84cddf81 drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness
    a9eafb0448ab ALSA: hda/ca0132: minor fix for allocation size
    a80767caeddc ASoC: fsl_sai: initialize is_dsp_mode flag
    95ab6d7905eb pinctrl: stm32: Fix refcount leak in stm32_pctrl_get_irq_domain
    fc34608fa275 drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
    62430b3210c8 gpu: ipu-v3: common: Add of_node_put() for reference returned by of_graph_get_port_by_id()
    31701e54d318 drm/vc4: dpi: Fix format mapping for RGB565
    d66f26b93c13 drm/vc4: dpi: Add option for inverting pixel clock and output enable
    7ddd8a5ecf6f drm/bridge: megachips: Fix error handling in i2c_register_driver()
    d56e589f8b6f drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC
    c879003a6f5e drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
    c82ca67ca01b selftest: fib_tests: Always cleanup before exit
    c31985922ec9 selftests/net: Interpret UDP_GRO cmsg data as an int value
    616574788880 irqchip/irq-bcm7120-l2: Set IRQ_LEVEL for level triggered interrupts
    3947b16613ef irqchip/irq-brcmstb-l2: Set IRQ_LEVEL for level triggered interrupts
    d77209007869 can: esd_usb: Move mislocated storage of SJA1000_ECC_SEG bits in case of a bus error
    3cf2181e438f thermal/drivers/hisi: Drop second sensor hi3660
    21c701cbc84e wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
    b70d56e728ff crypto: crypto4xx - Call dma_unmap_page when done
    a3b75b1e767a wifi: mwifiex: fix loop iterator in mwifiex_update_ampdu_txwinsize()
    c002d2741400 wifi: iwl4965: Add missing check for create_singlethread_workqueue()
    7e594abc0424 wifi: iwl3945: Add missing check for create_singlethread_workqueue
    5de7a4254eb2 treewide: Replace DECLARE_TASKLET() with DECLARE_TASKLET_OLD()
    9198eefd1053 usb: gadget: udc: Avoid tasklet passing a global
    cf04507f425b RISC-V: time: initialize hrtimer based broadcast clock event device
    142bcf724056 m68k: /proc/hardware should depend on PROC_FS
    c4d8c23efed6 crypto: rsa-pkcs1pad - Use akcipher_request_complete
    8c1447495f05 rds: rds_rm_zerocopy_callback() correct order for list_add_tail()
    291e6a682008 libbpf: Fix alen calculation in libbpf_nla_dump_errormsg()
    60aaccf16d1e Bluetooth: L2CAP: Fix potential user-after-free
    d19bd48535fc OPP: fix error checking in opp_migrate_dentry()
    522d319cda95 tap: tap_open(): correctly initialize socket uid
    d92d87000eda tun: tun_chr_open(): correctly initialize socket uid
    11c9c7227273 net: add sock_init_data_uid()
    276ccbc15feb mptcp: add sk_stop_timer_sync helper
    07fceab32096 irqchip/ti-sci: Fix refcount leak in ti_sci_intr_irq_domain_probe
    c7d78d36e19e irqchip/irq-mvebu-gicp: Fix refcount leak in mvebu_gicp_probe
    9e79ac4f70fd irqchip/alpine-msi: Fix refcount leak in alpine_msix_init_domains
    7cce0c9fdd3f net/mlx5: Enhance debug print in page allocation failure
    dbd6ae095674 powercap: fix possible name leak in powercap_register_zone()
    63551e4b7cbc crypto: seqiv - Handle EBUSY correctly
    c61e7d182ee3 crypto: essiv - Handle EBUSY correctly
    bfef5e3e7375 crypto: essiv - remove redundant null pointer check before kfree
    2d1ac2f2e2be crypto: ccp - Failure on re-initialization due to duplicate sysfs filename
    40627e6e291c ACPI: battery: Fix missing NUL-termination with large strings
    bf6dc175a2b5 wifi: ath9k: Fix potential stack-out-of-bounds write in ath9k_wmi_rsp_callback()
    cd8316767099 wifi: ath9k: hif_usb: clean up skbs if ath9k_hif_usb_rx_stream() fails
    c3ff385b948d ath9k: htc: clean up statistics macros
    a49c13eccea4 ath9k: hif_usb: simplify if-if to if-else
    564bc2222bf5 wifi: ath9k: htc_hst: free skb in ath9k_htc_rx_msg() if there is no callback function
    17a0e61cd982 wifi: orinoco: check return value of hermes_write_wordrec()
    573dfeba2d4e ACPICA: nsrepair: handle cases without a return value correctly
    987b0ff1b9d9 lib/mpi: Fix buffer overrun when SG is too long
    b55ada30b5cd genirq: Fix the return type of kstat_cpu_irqs_sum()
    6b9f61c8b821 ACPICA: Drop port I/O validation for some regions
    c300697690e2 crypto: x86/ghash - fix unaligned access in ghash_setkey()
    0c4f20c8fc7d wifi: wl3501_cs: don't call kfree_skb() under spin_lock_irqsave()
    14ba31bb1b66 wifi: libertas: cmdresp: don't call kfree_skb() under spin_lock_irqsave()
    38ef77720371 wifi: libertas: main: don't call kfree_skb() under spin_lock_irqsave()
    1879fe9e4016 wifi: libertas: if_usb: don't call kfree_skb() under spin_lock_irqsave()
    0b7b7347449f wifi: libertas_tf: don't call kfree_skb() under spin_lock_irqsave()
    318005127c80 wifi: brcmfmac: unmap dma buffer in brcmf_msgbuf_alloc_pktid()
    d869a1895052 wifi: brcmfmac: fix potential memory leak in brcmf_netdev_start_xmit()
    a12610e83789 wifi: wilc1000: fix potential memory leak in wilc_mac_xmit()
    a6059cf02a0d wilc1000: let wilc_mac_xmit() return NETDEV_TX_OK
    112c1af02b8f wifi: ipw2200: fix memory leak in ipw_wdev_init()
    ba1d3623fea5 wifi: ipw2x00: don't call dev_kfree_skb() under spin_lock_irqsave()
    0d438ae7bac9 ipw2x00: switch from 'pci_' to 'dma_' API
    28ea268d95e5 wifi: rtlwifi: Fix global-out-of-bounds bug in _rtl8812ae_phy_set_txpower_limit()
    5d171ab48b42 rtlwifi: fix -Wpointer-sign warning
    5dd30d1acc70 wifi: rtl8xxxu: don't call dev_kfree_skb() under spin_lock_irqsave()
    23b34e08de5c wifi: libertas: fix memory leak in lbs_init_adapter()
    1864b22e238c wifi: iwlegacy: common: don't call dev_kfree_skb() under spin_lock_irqsave()
    9004aa391a1a net/wireless: Delete unnecessary checks before the macro call “dev_kfree_skb”
    fe4d7280cf4d wifi: rsi: Fix memory leak in rsi_coex_attach()
    82d68c324497 block: bio-integrity: Copy flags when bio_integrity_payload is cloned
    084cd75643b6 sched/rt: pick_next_rt_entity(): check list_entry
    0ff7ba5e8bbd sched/deadline,rt: Remove unused parameter from pick_next_[rt|dl]_entity()
    ee986d80acde s390/dasd: Fix potential memleak in dasd_eckd_init()
    8bc5a76268fb s390/dasd: Prepare for additional path event handling
    946515fad41a blk-mq: correct stale comment of .get_budget
    2dc5f68fe664 blk-mq: wait on correct sbitmap_queue in blk_mq_mark_tag_wait
    8c225150ea27 blk-mq: remove stale comment for blk_mq_sched_mark_restart_hctx
    260dcf1ccdc6 block: Limit number of items taken from the I/O scheduler in one go
    578c8f09c04b Revert "scsi: core: run queue if SCSI device queue isn't ready and queue is idle"
    2d3c3aa4123a arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
    38af86810d48 ARM: dts: imx7s: correct iomuxc gpr mux controller cells
    7fe5dc2fee91 arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
    8b7aa62f4a3a arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
    d5fbeae6d608 arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
    c5cd41bd10e2 arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
    1e3ec4d1d7f3 arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
    e515d4118583 arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
    1e1b84b0220b ARM: imx: Call ida_simple_remove() for ida_simple_get
    b0a1b2f3ef90 ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
    91ac4bf35ad6 ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()
    af3352c16efd arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
    9dd61d95429b arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
    cba890c4bd9d arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
    69bdc5d01406 arm64: dts: meson-gx: Fix Ethernet MAC address unit name
    ede0334bf4df ARM: zynq: Fix refcount leak in zynq_early_slcr_init
    45b44ba5dfc9 arm64: dts: qcom: qcs404: use symbol names for PCIe resets
    8041f9a2a958 ARM: OMAP2+: Fix memory leak in realtime_counter_init()
    dd08e68d04d0 HID: asus: use spinlock to safely schedule workers
    136a9bcc0ed2 HID: asus: use spinlock to protect concurrent accesses
    9a25b22fd577 HID: asus: Remove check for same LED brightness on set

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 84969d43fe..e0967223b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "187d5fab513b96abf3e2f14fa8dc93b1fc46b30a"
-SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
+SRCREV_machine ?= "f064f6017b7ce09ade0f365e1b7d776dc9e2e168"
+SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.234"
+LINUX_VERSION ?= "5.4.237"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 23ee693f0f..6cdf00763b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.234"
+LINUX_VERSION ?= "5.4.237"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9c10968641ca9017c2f0dd6f7b74f5f59396a573"
-SRCREV_machine ?= "a11f7767b574820390370e80f5c5084830f3ef17"
-SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
+SRCREV_machine_qemuarm ?= "00c3a33c0f772ff1fa8902e8fe8856131c27a9b5"
+SRCREV_machine ?= "0693cbc007cf6a7b335edb5f78542d77b048d5dd"
+SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index b053912072..e95a044099 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1eae19a4e0b117b32f0080c46eb40c563e71d184"
-SRCREV_machine_qemuarm64 ?= "923c7f7cb375e1e5e0db94f5c0bddad4322ed527"
-SRCREV_machine_qemumips ?= "f9eaa41aa8584963e8322b6b2511b23520b71763"
-SRCREV_machine_qemuppc ?= "1fd537c9f8e58d0af31e5584703266e32f7b3f92"
-SRCREV_machine_qemuriscv64 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
-SRCREV_machine_qemux86 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
-SRCREV_machine_qemux86-64 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
-SRCREV_machine_qemumips64 ?= "964dd71b16c99235ab10cede1727f50ebc27eaad"
-SRCREV_machine ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
-SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
+SRCREV_machine_qemuarm ?= "981be716d817e38d2d67269aab3caaa095bd2bdd"
+SRCREV_machine_qemuarm64 ?= "32083245f7eb993b85a33a8d30bd9f41128b6147"
+SRCREV_machine_qemumips ?= "4d002b5ac3b434b21ae58ac15cd73be3ae5ef5a8"
+SRCREV_machine_qemuppc ?= "82b4b51143a6beeb49efa548494bdb5c01f336b2"
+SRCREV_machine_qemuriscv64 ?= "936721bc390034d774b28393bf61808de8899718"
+SRCREV_machine_qemux86 ?= "936721bc390034d774b28393bf61808de8899718"
+SRCREV_machine_qemux86-64 ?= "936721bc390034d774b28393bf61808de8899718"
+SRCREV_machine_qemumips64 ?= "d662d749c441de5a09bfd8870cd10e41b1e27b6b"
+SRCREV_machine ?= "936721bc390034d774b28393bf61808de8899718"
+SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.234"
+LINUX_VERSION ?= "5.4.237"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


