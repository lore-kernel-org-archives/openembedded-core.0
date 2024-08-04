Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2763CC3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.30064.1722791313639377224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1CYrVM2e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7163489149eso6994132a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791313; x=1723396113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wU9xvMk7VzqSoisnn6iH+NSAYevI9izpi2NL6Pnmqck=;
        b=1CYrVM2ecVCq1BJ/MnyeLuBZ35hpEZ32VRxpfS8npBcKz9KUphkBDG1D7VGOmZq8Ya
         6yHjLU+lpd/K3DZ7wCbtumKKf5hh3T32orvv3hmMtOnHhInPrJVPjfqvk4a2Sve2LNSA
         bfx0EKbPfIPIlaAbbJwQrPe4RJKxolYJxcHLCJ4hP6ql6Sj4Fu9qbprd0yY12hluuhL6
         X7pQNrM09HBD2d9pj3y/xWVs13LVjhqgSl59/49y51OTOr5XZcF3+CpW/pxZJCNdwOzi
         55v5+GbIKqyJez4aodEFUHF9F5HyEiS/6SnyqVB4qAI6oeZCpn01/8/hVo1doLidAwTQ
         wnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791313; x=1723396113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wU9xvMk7VzqSoisnn6iH+NSAYevI9izpi2NL6Pnmqck=;
        b=Ykh/ME9H2aYB216qQINaclfV7wyx0oTrxwkk11vwKvF17Gu9sUixEmy1BJyqhZXWqD
         9ieEJVvOxU/I7aV556jA415RGub7oYKNIpQi9h156s6Jvo+qNs5hovoCNlGHDLoB/SEX
         WUL+nPn/4Z8cmfaucKomOBHBwwH6j3kY/8mNfAHJ8YO526xxRkVhI6tMcwHbCqkIo47y
         rIOVX6puyJaQTH1xmxpXYjdPZd9kPePGyhCqI2pNQoWAALxZMgefrdzv+f8v/zbt2+/n
         QxktsSJTNE76etpNO5cWPwPcXSDp2hPcDdmGO35ZDXVRIaBYe6376zt/ezuPKdJFrfBN
         gLLA==
X-Gm-Message-State: AOJu0YyozIGe45kshp4OL7qdIeBhMWq9j6f3J0OV9kxvl3YRcYIMV9KD
	rzvh5TPM0dW6m4NmvqoHZj5TgQSBtFqg5gCT5Ul1rKZlGHG1PgiAeTc7oeIAZlcucMX/sWT/RGk
	LjAkLXQ==
X-Google-Smtp-Source: AGHT+IGKWYPOaERlE0EuqSuPpecm5LlpKrD7IV2DThB/8mtRcmqmp8+lFQcgVu7lJyFFH7je7NeWUw==
X-Received: by 2002:a17:90a:ba81:b0:2c9:6ad7:659d with SMTP id 98e67ed59e1d1-2cff9414400mr11590406a91.6.1722791312451;
        Sun, 04 Aug 2024 10:08:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] linux-yocto/5.15: update to v5.15.164
Date: Sun,  4 Aug 2024 10:08:13 -0700
Message-Id: <e9d8b15dcc9cdbe33add676572c85d66f46b087c.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202957

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    7e89efd3ae1c Linux 5.15.164
    e5e5e63c506b tap: add missing verification for short frame
    589382f50b4a tun: add missing verification for short frame
    2d3cef3d7a5d wifi: rt2x00: use explicitly signed or unsigned types
    53e21cfa68a7 filelock: Fix fcntl/close race recovery compat path
    2a6c1811f806 ALSA: pcm_dmaengine: Don't synchronize DMA channel when DMA is paused
    3390c35a2fe4 arm64: dts: qcom: sdm630: Disable SS instance in Parkmode for USB
    01a1bb207e96 arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
    0b71bad5f49f ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    8f83ba8d0642 ALSA: hda/realtek: Enable headset mic on Positivo SU C1400
    35652dfa8cc9 fs/ntfs3: Validate ff offset
    7e21574195a4 jfs: don't walk off the end of ealist
    53de17ad01cb ocfs2: add bounds checking to ocfs2_check_dir_entry()
    21c14c556ccc net: relax socket state check at accept time.
    243b1b2f139b Add gitignore file for samples/fanotify/ subdirectory
    057aca5c4c0c docs: Fix formatting of literal sections in fanotify docs
    9b4e471059a2 samples: Make fs-monitor depend on libc and headers
    11874ffea7b0 samples: Add fs error monitoring example
    544fa213f15d drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
    b0f923261647 wifi: mac80211: disable softirqs for queued frame handling
    1e865019cef3 mm/damon/core: merge regions aggressively when max_nr_regions is unmet
    22f7794ef5a3 minmax: relax check to allow comparison between unsigned arguments and signed constants
    7ed91c5560df minmax: allow comparisons of 'int' against 'unsigned char/short'
    d53b5d862acd minmax: allow min()/max()/clamp() if the arguments have the same signedness.
    1c2ee5bc9f11 minmax: fix header inclusions
    d470787b25e6 minmax: clamp more efficiently by avoiding extra comparison
    998f03984e25 minmax: sanity check constant bounds when clamping
    ed6e37e30826 tracing: Define the is_signed_type() macro once
    6efc874e7dec spi: mux: set ctlr->bits_per_word_mask
    d02d8c1dacaf hfsplus: fix uninit-value in copy_name
    119aa28dc296 selftests/vDSO: fix clang build errors and warnings
    77737885d55b spi: imx: Don't expect DMA for i.MX{25,35,50,51,53} cspi devices
    52fb34cf68f6 riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
    5f569a230160 fs: better handle deep ancestor chains in is_subdir()
    a2b201f83971 drm/radeon: check bo_va->bo is non-NULL before using it
    d2ce562a5aff Bluetooth: hci_core: cancel all works upon hci_unregister_dev()
    30095db9fde5 scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed
    4fad7fef847b powerpc/eeh: avoid possible crash when edev->pdev changes
    e59822f9d700 powerpc/pseries: Whitelist dtl slub object for copying to userspace
    144563729741 net: mac802154: Fix racy device stats updates by DEV_STATS_INC() and DEV_STATS_ADD()
    7d562640dfe3 net: usb: qmi_wwan: add Telit FN912 compositions
    2f0f5d8b70d6 ALSA: dmaengine_pcm: terminate dmaengine before synchronize
    e8c3061cb064 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
    8a69529f2259 btrfs: qgroup: fix quota root leak after quota disable failure
    6a0a5134b811 platform/x86: lg-laptop: Use ACPI device handle when evaluating WMAB/WMBB
    c71589ef09be platform/x86: lg-laptop: Change ACPI device id
    cb7b8762fa59 platform/x86: lg-laptop: Remove LGEX0815 hotkey handling
    b87e028350b0 platform/x86: wireless-hotkey: Add support for LG Airplane Button
    cf521049fcd0 s390/sclp: Fix sclp_init() cleanup on failure
    9adc74c11a0e can: kvaser_usb: fix return value for hif_usb_send_regout
    47b807eacc43 ASoC: ti: omap-hdmi: Fix too long driver name
    d04dff8e6419 ASoC: ti: davinci-mcasp: Set min period size using FIFO config
    6114985177db ALSA: dmaengine: Synchronize dma channel after drop()
    c4bbeb8f129f bytcr_rt5640 : inverse jack detect for Archos 101 cesium
    7fc6558e274e Input: i8042 - add Ayaneo Kun to i8042 quirk table
    079deeff7285 Input: elantech - fix touchpad state on resume for Lenovo N24
    ff53b50bb2c2 mips: fix compat_sys_lseek syscall
    e3316c1ab38d ALSA: hda/realtek: Add more codec ID to no shutup pins list
    0e566b1d3f6d drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
    b26c8c85463e KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group()
    a43cc0558530 wifi: cfg80211: wext: add extra SIOCSIWSCAN data check
    c5942a14f795 nvme: avoid double free special payload
    7d5b199be28e mei: demote client disconnect warning on suspend to debug
    2ffe891b8df2 fs/file: fix the check in find_next_fd()
    da0fec30a73f kconfig: remove wrong expr_trans_bool()
    f6ea77184d70 kconfig: gconf: give a proper initial state to the Save button
    9b873bdaae64 null_blk: fix validation of block size
    91c203d37e69 arm64: armv8_deprecated: Fix warning in isndep cpuhp starting process
    feac2391e26b ila: block BH in ila_output()
    7b40527d2e25 net: ipv6: rpl_iptunnel: block BH in rpl_output() and rpl_input()
    502b144d8805 Input: silead - Always support 10 fingers
    07fb3ed9f8de selftests/openat2: Fix build warnings on ppc64
    a0d2c3a6bbca wifi: mac80211: fix UBSAN noise in ieee80211_prep_hw_scan()
    eaa06c9daea9 wifi: iwlwifi: mvm: properly set 6 GHz channel direct probe option
    36d6128a7f6a wifi: iwlwifi: mvm: Handle BIGTK cipher in kek_kck cmd
    aa74f7e51279 wifi: iwlwifi: mvm: d3: fix WoWLAN command version lookup
    38219c50a3a6 wifi: mac80211: handle tasklet frames before stopping
    34dbc62992f8 wifi: mac80211: mesh: init nonpeer_pm to active by default in mesh sdata
    a3c944359fa0 tools/power/cpupower: Fix Pstate frequency reporting on AMD Family 1Ah CPUs
    044a7bfca888 ACPI: EC: Avoid returning AE_OK on errors in address space handler
    284daacf260b ACPI: EC: Abort address space access upon error
    22413eee9c4e scsi: qedf: Set qed_slowpath_params to zero before use
    c3cbe53d9467 scsi: qedf: Wait for stag work during unload
    ab66639f72df scsi: qedf: Don't process stag work during unload and recovery
    9ffd72041f04 scsi: core: alua: I/O errors for ALUA state transitions
    f818708eeeae scsi: core: Fix a use-after-free
    0f98f40eb1ed bpf: Fix overrunning reservations in ringbuf
    48ec3929916f ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
    903a9ab8a087 ARM: 9324/1: fix get_user() broken with veneer
    52c87ab18c76 filelock: Remove locks reliably when fcntl/close race is detected
    05bbd8d1e92b gcc-plugins: Rename last_stmt() for GCC 14+
    7c6d66f0266f Linux 5.15.163
    f0655a5c8f3e i2c: rcar: fix error code in probe()
    181a157af8a4 kbuild: Make ld-version.sh more robust against version string changes
    db56615e96c4 x86/bhi: Avoid warning in #DB handler due to BHI mitigation
    c4dbe18342b7 x86/entry/64: Remove obsolete comment on tracing vs. SYSRET
    9877f867929d i2c: rcar: clear NO_RXDMA flag after resetting
    7e44655c1fc5 i2c: testunit: avoid re-issued work after read message
    ec1bba809f7c i2c: rcar: ensure Gen3+ reset does not disturb local targets
    02268d026499 i2c: rcar: introduce Gen4 devices
    ff7879da5368 i2c: rcar: reset controller is mandatory for Gen3+
    504cc0036286 i2c: rcar: Add R-Car Gen4 support
    f42afb065917 i2c: mark HostNotify target address as used
    72dd9b813fa3 i2c: rcar: bring hardware to known state when probing
    7000b438dda9 nilfs2: fix kernel bug on rename operation of broken directory
    e30bc19a9ee8 bpf: Allow reads from uninit stack
    2272e2db38f2 ipv6: prevent NULL dereference in ip6_output()
    e79f46ba8e55 ipv6: annotate data-races around cnf.disable_ipv6
    6f98a223d696 wireguard: send: annotate intentional data race in checking empty queue
    21a0f8567f75 wireguard: queueing: annotate intentional data race in cpu round robin
    b4764f0ad3d6 wireguard: allowedips: avoid unaligned 64-bit memory accesses
    20cf67dcb7db libceph: fix race between delayed_work() and ceph_monc_stop()
    519547760f16 Fix userfaultfd_api to return EINVAL as expected
    b3e1890bc34d ALSA: hda/realtek: Limit mic boost on VAIO PRO PX
    26af2ccfc62d ALSA: hda/realtek: Enable Mute LED on HP 250 G7
    fb9e1ee1aec1 ALSA: hda/realtek: add quirk for Clevo V5[46]0TU
    679df0bcd5c4 nvmem: core: only change name to fram for current attribute
    d2135fbc0566 nvmem: meson-efuse: Fix return value of nvmem callbacks
    da5989e5eb35 nvmem: rmem: Fix return value of rmem_read()
    ae3808a85a92 hpet: Support 32-bit userspace
    2bd8534a1b83 USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
    72b8ee0d9826 usb: gadget: configfs: Prevent OOB read/write in usb_string_copy()
    840940bfb3a1 USB: Add USB_QUIRK_NO_SET_INTF quirk for START BP-850k
    b14aa5673e0a USB: serial: mos7840: fix crash on resume
    e75428344a1a USB: serial: option: add Rolling RW350-GL variants
    9d672c574208 USB: serial: option: add Netprisma LCUK54 series modules
    d2e942dc1cf0 USB: serial: option: add support for Foxconn T99W651
    8c2bf484186a USB: serial: option: add Fibocom FM350-GL
    3fc4c03f7cba USB: serial: option: add Telit FN912 rmnet compositions
    e068685443cf USB: serial: option: add Telit generic core-dump composition
    c0d03cdd8ac8 net: ks8851: Fix potential TX stall after interface reopen
    04317a2471c2 tcp: avoid too many retransmit packets
    3c65bfcbf075 tcp: use signed arithmetic in tcp_rtx_probe0_timed_out()
    15c010d365f8 octeontx2-af: fix issue with IPv4 match for RSS
    ab3a1c3888f3 octeontx2-af: fix issue with IPv6 ext match for RSS
    71d0f15894b8 octeontx2-af: extend RSS supported offload types
    74c5bc3394bb octeontx2-af: fix detection of IP layer
    b65406f56e7d octeontx2-af: fix a issue with cpt_lf_alloc mailbox
    bacb3fc5ed55 octeontx2-af: update cpt lf alloc mailbox
    e4dc9e89f45f octeontx2-af: replace cpt slot with lf id on reg write
    8cd976031e0d ARM: davinci: Convert comma to semicolon
    8338f57eb16b s390: Mark psw in __load_psw_mask() as __unitialized
    2b4d68df3f57 net/sched: Fix UAF when resolving a clash
    ddf516e50bf8 udp: Set SOCK_RCU_FREE earlier in udp_lib_get_port().
    7320fbdf46b9 ethtool: netlink: do not return SQI value if link is down
    ebc5c6304577 ppp: reject claimed-as-LCP but actually malformed packets
    a4a4c03ec069 net: ethernet: mtk-star-emac: set mac_managed_pm when probing
    69ad5fa0ce7c net: ethernet: lantiq_etop: fix double free in detach
    15298ff0f6d2 net: lantiq_etop: add blank line after declaration
    b399a68054df i40e: Fix XDP program unloading while removing the driver
    19904d03dbb8 net: fix rc7's __skb_datagram_iter()
    02ad323fa248 octeontx2-af: Fix incorrect value output on error path in rvu_check_rsrc_availability()
    195b7bcdfc5a skmsg: Skip zero length skb in sk_msg_recvmsg
    bd5b2b612211 tcp: fix incorrect undo caused by DSACK of TLP retransmit
    ba719855a854 vfs: don't mod negative dentry count when on shrinker list
    b422e6335f12 fs/dcache: Re-use value stored to dentry->d_flags instead of re-reading
    02a896426075 filelock: fix potential use-after-free in posix_lock_inode
    bc17f2377818 mm: prevent derefencing NULL ptr in pfn_section_valid()
    88fb258f1baf nilfs2: fix incorrect inode allocation from reserved inodes
    6d1108b041d3 null_blk: Do not allow runt zone with zone capacity smaller then zone size
    f07bcd8bba80 nfc/nci: Add the inconsistency check between the input data length and count
    f44608dd0211 kbuild: fix short log for AS in link-vmlinux.sh
    b4fed1443a65 nvmet: fix a possible leak when destroy a ctrl during qp establishment
    5f7bf7660300 platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
    cf628b9279c6 platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6" tablet
    f8f08fba924e regmap-i2c: Subtract reg size from max_write
    397bfe1bd928 nvme: adjust multiples of NVME_CTRL_PAGE_SIZE in offset
    0d30f73012a3 dma-mapping: benchmark: avoid needless copy_to_user if benchmark fails
    9668700a039d nvme-multipath: find NUMA path only for online numa-node
    0959e10fa346 ALSA: hda/realtek: Enable headset mic of JP-IK LEAP W502 with ALC897
    6b521f82cb2e fs/ntfs3: Mark volume as dirty if xattr is broken
    3503372d0bf7 i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr
    1dda25e2415c clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
    feef460321a5 media: dw2102: fix a potential buffer overflow
    a38e02265c68 ima: Avoid blocking in RCU read-side critical section
    0edae06b4c22 bnx2x: Fix multiple UBSAN array-index-out-of-bounds
    ddc382f7d1a6 mtd: rawnand: rockchip: ensure NVDDR timings are rejected
    e8a8ee4c3c34 mtd: rawnand: Bypass a couple of sanity checks during NAND identification
    56ca9e7f80cf mtd: rawnand: Ensure ECC configuration is propagated to upper layers
    452e09c57444 drm/amdgpu/atomfirmware: silence UBSAN warning
    f48dd3f19614 drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes
    2820005edae1 Revert "mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again"
    0b15ed086a68 fsnotify: Do not generate events for O_PATH file descriptors
    bf47bedf8dd7 can: kvaser_usb: Explicitly initialize family in leafimx driver_info struct
    4ca6013cd18e Bluetooth: qca: Fix BT enable failure again for QCA6390 after warm reboot
    522b39bd7163 btrfs: fix adding block group to a reclaim list and the unused list during reclaim
    a25e85361845 mm: avoid overflows in dirty throttling logic
    df13f3cb4af3 mm: optimize the redundant loop of mm_update_owner_next()
    b11e8fb93ea5 nilfs2: add missing check for inode numbers on directory entries
    3be4dcc8d7be nilfs2: fix inode number range checks
    96839f3f5882 Revert "igc: fix a log entry using uninitialized netdev"
    663e1b693b5c gpiolib: of: add polarity quirk for TSC2005
    03b2e1c9de47 gpiolib: of: add a quirk for reset line polarity for Himax LCDs
    caee6db7e811 gpiolib: of: factor out code overriding gpio line polarity
    8366720519ea inet_diag: Initialize pad field in struct inet_diag_req_v2
    f48b0cd338cf selftests: make order checking verbose in msg_zerocopy selftest
    ab52b1141648 selftests: fix OOM in msg_zerocopy selftest
    bfd14e5915c2 bonding: Fix out-of-bounds read in bond_option_arp_ip_targets_set()
    3325628cb36b netfilter: nf_tables: unconditionally flush pending work before notifier
    bb80a7911218 riscv: kexec: Avoid deadlock in kexec crash path
    15185f6d5ac3 wifi: wilc1000: fix ies_len type in connect path
    ccdc8fa32f79 net: allow skb_datagram_iter to be called from any context
    9de67fb2faf9 e1000e: Fix S0ix residency on corporate systems
    e19fa952c2c1 KVM: s390: fix LPSWEY handling
    ef7c428b425b tcp_metrics: validate source addr length
    b340526c9ef3 UPSTREAM: tcp: fix DSACK undo in fast recovery to call tcp_try_to_open()
    8786e4786181 tools/power turbostat: Remember global max_die_id
    4889f117755b s390/pkey: Wipe sensitive data on failure
    5ca26334fc8a jffs2: Fix potential illegal address access in jffs2_free_inode
    3364c2ed1c24 bpf: Avoid uninitialized value in BPF_CORE_READ_BITFIELD
    c7196357b22a igc: fix a log entry using uninitialized netdev
    b185e48079fe powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
    7955c2e2399b kunit: Fix timeout message
    137a06dc0ff8 orangefs: fix out-of-bounds fsid access
    eb28c161b926 powerpc/64: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=n
    abc10b55a6f5 i2c: i801: Annotate apanel_addr as __ro_after_init
    bd5620439959 media: dvb-frontends: tda10048: Fix integer overflow
    70c9219effc5 media: s2255: Use refcount_t instead of atomic_t for num_channels
    cdb63c962fd3 media: dvb-frontends: tda18271c2dd: Remove casting during div
    8c2c3cca816d net: dsa: mv88e6xxx: Correct check for empty list
    dc7f14d00d0c wifi: mt76: replace skb_put with skb_put_zero
    2e2980458888 Input: ff-core - prefer struct_size over open coded arithmetic
    292edf27c19c firmware: dmi: Stop decoding on broken entry
    21e8f5b88a6f sctp: prefer struct_size over open coded arithmetic
    3367598d65cd media: dw2102: Don't translate i2c read into write
    afaaebdee9bb drm/amd/display: Skip finding free audio for unknown engine_id
    0b3702f9d43d drm/amd/display: Check pipe offset before setting vblank
    fbb0701af973 drm/amd/display: Check index msg_id before read or write
    c6e777356f54 drm/amdgpu: Initialize timestamp for some legacy SOCs
    71dd42861537 crypto: aead,cipher - zeroize key buffer after use
    0a8a91932b27 scsi: qedf: Make qedf_execute_tmf() non-preemptible
    d73cb8862e4d IB/core: Implement a limit on UMAD receive List
    ecdcf002d1fc media: dvb-usb: dib0700_devices: Add missing release_firmware()
    fb007bc69acb media: dvb: as102-fe: Fix as10x_register_addr packing
    17fe8b75aaf0 drm/lima: fix shared irq handling on driver remove
    e8053aa2ecc4 locking/mutex: Introduce devm_mutex_init()
    5e3070adafca Compiler Attributes: Add __uninitialized macro
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 99b0cb09ba..49e580f7e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "17d344e1e72d797a5f4bbc4b552912989f9e6922"
-SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
+SRCREV_machine ?= "ac5e398055e97136165efed6894a43ed8653f889"
+SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.162"
+LINUX_VERSION ?= "5.15.164"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ca7494308f..aca30cedc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.162"
+LINUX_VERSION ?= "5.15.164"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "84b0c24c303ac61747604a657c5a94bf313ab087"
-SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
+SRCREV_machine ?= "eadae004a94c5d0493b1f8a468fba0be26992a06"
+SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index b3cfdeebdf..0209ed1ad0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1fd4f503830570e254661a8cfd9be7d3592e8b64"
-SRCREV_machine:qemuarm64 ?= "737d528a03d2fc1d83a33c6a527ffdc15f33652c"
-SRCREV_machine:qemumips ?= "b9dfd0af3606636b3a24d8de53c81d78e74b3d3d"
-SRCREV_machine:qemuppc ?= "5ec9de7723a3d560c932a37d88da115ef1d938c8"
-SRCREV_machine:qemuriscv64 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
-SRCREV_machine:qemuriscv32 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
-SRCREV_machine:qemux86 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
-SRCREV_machine:qemux86-64 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
-SRCREV_machine:qemumips64 ?= "861eb0361f55f33d7dedd9dc2bcb90ccc2d82cfa"
-SRCREV_machine ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
-SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
+SRCREV_machine:qemuarm ?= "8b286046b21b66a29e230ad7351b860b6aa2c550"
+SRCREV_machine:qemuarm64 ?= "fff468175b7b8245d6fc879838c5aa18ee14b4ed"
+SRCREV_machine:qemumips ?= "62db590dcb8639442872980bc2d25c0b671b52cf"
+SRCREV_machine:qemuppc ?= "c07fd78bfccea5b38cdeda707b3501b5b477175a"
+SRCREV_machine:qemuriscv64 ?= "62668d7a159c070de488aa68681641f59389b4cd"
+SRCREV_machine:qemuriscv32 ?= "62668d7a159c070de488aa68681641f59389b4cd"
+SRCREV_machine:qemux86 ?= "62668d7a159c070de488aa68681641f59389b4cd"
+SRCREV_machine:qemux86-64 ?= "62668d7a159c070de488aa68681641f59389b4cd"
+SRCREV_machine:qemumips64 ?= "519192c1b0ece4ee37c31977e62031aa8de75cfb"
+SRCREV_machine ?= "62668d7a159c070de488aa68681641f59389b4cd"
+SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f45bea23c39cbd0d9b89d6b43563b02aa2dfe5de"
+SRCREV_machine:class-devupstream ?= "7e89efd3ae1cfa05fe918588a92628b9bbeda4b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.162"
+LINUX_VERSION ?= "5.15.164"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


