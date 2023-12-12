Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAB1C41535
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:32 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.2943.1702391309378400671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FnPRcnMu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce6b62746dso3423031b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391308; x=1702996108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E76PFSYp1ALunidAybtDVcPEGYTkYcePAiPgiLWhVP8=;
        b=FnPRcnMuS0KLj3KrEegm3yykT93Yg69xcpDDLnZh+L8fzt9rgsG0RWGWcWzq6jOOvM
         iax0DJYRtWhgvOLPeulrhyO3Rmuo9Dhf8Mpnq/3AWP8I0ssc495KW6F/5AmlW9A2mUWJ
         5s4zr4/t75dq64a/DwTrTGeu593sSp08TGH7OGi4llGB+1pnLKzzYMsCzwxpUyXdpYEG
         Qdmv6NP4UR83tjnjv1f4hEpg9w74ueyN1hTBUYlf1ZesU7TBANUWV/LsqGmYKuWYZ4Sb
         0Yr8PzSBFkvtYt7dbXyovHq7KPiWI/INXbGEJQQbwHD8/23LAhnd4hnY7TNIZlMudDyC
         rONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391308; x=1702996108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E76PFSYp1ALunidAybtDVcPEGYTkYcePAiPgiLWhVP8=;
        b=Kahcr9ruRaPiIt9A1yFEQh1SPf9k7lKse9mxsIlOtZcpxsDfN/6F/sZmfUKY78KUCb
         l+7eJSlkoFGSnYX10lLId0GNEn8thrGT1chlCP2pk0IWf012znbIlqDo6j9HNMiL1h1a
         bDD+0aqhX574jQmxUmS4Q6R7Cd42MUgVZcE+6XajTDk7yvRHgHfL2RTWSw9rtmGewDSS
         AIV+H9xfmr3e1fxRC7c4ssb8PhM4mrcKDpmObxn2G8DolF2nZSvwwRRHeKoN9SbZKQLS
         7Lo8RwWFAkn0UMoWFhTalgw4lXETAgX2RnoqbtabFfCJQTjjOpeC5CNu0vaQXgBUZ8Tw
         hLtQ==
X-Gm-Message-State: AOJu0YwuudeLaaP/s4vvIBT5fkvvAhFZMvj0Sqq1thVJAKD+tpD9OGDj
	8HkjzSFHTm2i5e2Dy6p5AzYpETyLHzQ2PkOmvGM=
X-Google-Smtp-Source: AGHT+IFlVaQ7c6cALaJftrV0tQBYqb4/jbou2qpoAsMjHpynMfh8w7PCckedPAwR9oVJaORd55x2Lw==
X-Received: by 2002:a05:6a20:938b:b0:18f:97c:8237 with SMTP id x11-20020a056a20938b00b0018f097c8237mr3421889pzh.65.1702391307872;
        Tue, 12 Dec 2023 06:28:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 24/29] linux-yocto/6.5: update to v6.5.13
Date: Tue, 12 Dec 2023 04:27:30 -1000
Message-Id: <68d222aca43bfa31ac425da1084f33470864ff19.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192228

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4631960b4700 Linux 6.5.13
    a9d6c0c5a6bd net/mlx5e: Track xmit submission to PTP WQ after populating metadata map
    c712654d6f36 net/mlx5e: Avoid referencing skb after free-ing in drop path of mlx5e_sq_xmit_wqe
    2c9de867ca28 tracing: Have trace_event_file have ref counters
    1f59a2a92855 powerpc/powernv: Fix fortify source warnings in opal-prd.c
    7aded92aeb75 drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
    353bc3849241 drm/amd/display: Enable fast plane updates on DCN3.2 and above
    5b14cf37b9f0 drm/amd/display: fix a NULL pointer dereference in amdgpu_dm_i2c_xfer()
    562176ea823a drm/amd/display: Fix DSC not Enabled on Direct MST Sink
    5b37ee61b89d drm/amd/display: Guard against invalid RPTR/WPTR being set
    f3385c9b8ed4 drm/amdgpu: Fix possible null pointer dereference
    ed8fc80b1950 drm/amdgpu: lower CS errors to debug severity
    b827ed7014a0 drm/amdgpu: fix error handling in amdgpu_bo_list_get()
    7c6574dd032c drm/amdgpu: fix error handling in amdgpu_vm_init
    8c3b198fac82 drm/amdgpu: don't use ATRM for external devices
    6f6177558004 drm/amdgpu: add a retry for IP discovery init
    a5bd0c0d3189 drm/amdgpu: fix GRBM read timeout when do mes_self_test
    045d5eec88d2 drm/amdgpu: don't use pci_is_thunderbolt_attached()
    02eb46bb2150 drm/amdgpu/smu13: drop compute workload workaround
    5392874af8ab drm/amd/pm: Fix error of MACO flag setting code
    5d614170fa1f drm/i915: Flush WC GGTT only on required platforms
    1e019d6bcb44 drm/i915: Fix potential spectre vulnerability
    0990bd1ff1bf drm/i915: Bump GLK CDCLK frequency when driving multiple pipes
    9dfc6bc4a6a2 drm/i915/mtl: Support HBR3 rate with C10 phy and eDP in MTL
    59d2eee68804 drm: bridge: it66121: ->get_edid callback must not return err pointers
    f0a11733bd03 drm/amd/pm: Handle non-terminated overdrive commands.
    e3b83d87c93e ext4: fix racy may inline data check in dio write
    8b7e09f9b955 ext4: properly sync file size update after O_SYNC direct IO
    13859f9e6493 ext4: add missed brelse in update_backups
    edfb7b8d36ab ext4: remove gdb backup copy for meta bg in setup_new_flex_group_blocks
    079d796c58f2 ext4: correct the start block of counting reserved clusters
    8547701c3b0a ext4: correct return value of ext4_convert_meta_bg
    ec51fb39b173 ext4: mark buffer new if it is unwritten to avoid stale data exposure
    a9ceb3e26c7c ext4: correct offset of gdb backup in non meta_bg group to update_backups
    aaa3bd727255 ext4: apply umask if ACL support is disabled
    d1769a4c92b3 ext4: make sure allocate pending entry not fail
    a937cf1c90d1 ext4: fix race between writepages and remount
    cdbfce536cfa Revert "net: r8169: Disable multicast filter for RTL8168H and RTL8107E"
    e33abcd82f9c media: qcom: camss: Fix csid-gen2 for test pattern generator
    51792b41ee52 media: qcom: camss: Fix invalid clock enable bit disjunction
    4122d47ad139 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3
    c25c6d618eda media: qcom: camss: Fix missing vfe_lite clocks check
    d8cd7a8645c2 media: qcom: camss: Fix VFE-480 vfe_disable_output()
    e428d0f3e42f media: qcom: camss: Fix VFE-17x vfe_disable_output()
    820b967c0384 media: qcom: camss: Fix vfe_get() error jump
    2dbb91675d6b media: qcom: camss: Fix pm_domain_on sequence in probe
    967a522b5123 mmc: sdhci-pci-gli: GL9750: Mask the replay timer timeout of AER
    ddb96a13b277 r8169: add handling DASH when DASH is disabled
    89a0fc500471 r8169: fix network lost after resume on DASH systems
    533108f04a57 selftests: mptcp: fix fastclose with csum failure
    c8e74731fff0 mptcp: fix setsockopt(IP_TOS) subflow locking
    e729027888e9 mptcp: add validity check for sending RM_ADDR
    342b528c0e84 mptcp: deal with large GSO size
    9a7982259028 mm: kmem: drop __GFP_NOFAIL when allocating objcg vectors
    77227943445e mm: fix for negative counter: nr_file_hugepages
    641061405579 mmc: sdhci-pci-gli: A workaround to allow GL9750 to enter ASPM L1.2
    5fb6a480a0fa riscv: kprobes: allow writing to x0
    c93d4b75f58e riscv: correct pt_level name via pgtable_l5/4_enabled
    85efe51890ef riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
    05b2911ac941 riscv: put interrupt entries into .irqentry.text
    8d497507ce26 riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace zihintpause
    9c3115d8549a LoongArch: Mark __percpu functions as always inline
    4ce011ebb640 NFSD: Update nfsd_cache_append() to use xdr_stream
    90ceb1e85869 nfsd: fix file memleak on client_opens_release
    3cdc6b90ef59 dm-verity: don't use blocking calls from tasklets
    f6af719e355d dm-bufio: fix no-sleep mode
    02d2f24aaeee drm/mediatek/dp: fix memory leak on ->get_edid callback error path
    d82dbbb169f2 drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
    f310c613afdf media: ccs: Correctly initialise try compose rectangle
    da2617b32b4d media: venus: hfi: add checks to handle capabilities from firmware
    bc3ade714672 media: venus: hfi: fix the check to handle session buffer requirement
    8da410e429d2 media: venus: hfi_parser: Add check to keep the number of codecs within range
    c7f45dd39318 media: sharp: fix sharp encoding
    3163d9bf64e5 media: lirc: drop trailing space from scancode transmit
    9de787139b02 f2fs: split initial and dynamic conditions for extent_cache
    6fca08fd3085 f2fs: avoid format-overflow warning
    ea8df211997b f2fs: set the default compress_level on ioctl
    e08a8d94f982 f2fs: do not return EFSCORRUPTED, but try to run online repair
    3ec63129137e i2c: i801: fix potential race in i801_block_transaction_byte_by_byte
    1c5ffd27c542 gfs2: don't withdraw if init_threads() got interrupted
    e92237ba0704 net: phylink: initialize carrier state at creation
    55c7b046cd1f net: dsa: lan9303: consequently nested-lock physical MDIO
    82c9a9456b82 net: ethtool: Fix documentation of ethtool_sprintf()
    d67fce6b1368 s390/ap: fix AP bus crash on early config change callback invocation
    bc73f5ef079c i2c: designware: Disable TX_EMPTY irq while waiting for block length byte
    0e094322aad6 sbsa_gwdt: Calculate timeout with 64-bit math
    3a0a398bedeb lsm: fix default return value for inode_getsecctx
    b564c10d4e95 lsm: fix default return value for vm_enough_memory
    695a358a3905 Revert "i2c: pxa: move to generic GPIO recovery"
    db205ac66fda Revert ncsi: Propagate carrier gain/loss events to the NCSI controller
    30fb55283841 ALSA: hda/realtek: Add quirks for HP Laptops
    d9d0d1c1d880 ALSA: hda/realtek: Enable Mute LED on HP 255 G10
    1bc8a597307c ALSA: hda/realtek - Enable internal speaker of ASUS K6500ZC
    966b51c45080 ALSA: hda/realtek - Add Dell ALC295 to pin fall back table
    96865995ccd2 ALSA: hda/realtek: Enable Mute LED on HP 255 G8
    746820e6963a ALSA: info: Fix potential deadlock at disconnection
    0b214ccbc778 btrfs: zoned: wait for data BG to be finished on direct IO allocation
    f13f25184a9f xfs: recovery should not clear di_flushiter unconditionally
    64af62c8977a cifs: Fix encryption of cleared, but unset rq_iter data buffers
    50f4b57fc561 cifs: do not reset chan_max if multichannel is not supported at mount
    48a8c1891851 cifs: force interface update before a fresh session setup
    9bf434f12957 cifs: reconnect helper should set reconnect for the right channel
    b9bb9607b1fc smb: client: fix potential deadlock when releasing mids
    6db94d08359c smb: client: fix use-after-free in smb2_query_info_compound()
    89929ea46f9c smb: client: fix use-after-free bug in cifs_debug_data_proc_show()
    ef97cb5e93f7 smb3: fix caching of ctime on setxattr
    2d29a938bf62 smb3: allow dumping session and tcon id to improve stats analysis and debugging
    e0748969c6d7 smb3: fix touch -h of symlink
    34e11da3eb40 smb3: fix creating FIFOs when mounting with "sfu" mount option
    e28562567c72 fs: add ctime accessors infrastructure
    45fa91b09bdb xhci: Enable RPM on controllers that support low-power states
    b57e254d5ef4 parisc/power: Fix power soft-off when running on qemu
    339ac29c6811 parisc/pgtable: Do not drop upper 5 address bits of physical address
    c1b8ef9d7b8f parisc: Prevent booting 64-bit kernels on PA1.x machines
    6fc3231df968 mm/hugetlb: use nth_page() in place of direct struct page manipulation
    45b910169533 mm/hugetlb: prepare hugetlb_follow_page_mask() for FOLL_PIN
    a231a59ec94c rcutorture: Fix stuttering races and other issues
    c85633590547 torture: Make torture_hrtimeout_ns() take an hrtimer mode parameter
    05eb10004221 torture: Move stutter_wait() timeouts to hrtimers
    3bdabd7be640 torture: Make torture_hrtimeout_*() use TASK_IDLE
    aac54ca1a64c torture: Add lock_torture writer_fifo module parameter
    525bcb9c290c torture: Add a kthread-creation callback to _torture_create_kthread()
    ecc89436729b PCI: Lengthen reset delay for VideoPropulsion Torrent QN16e card
    776edaebd616 PCI: qcom-ep: Add dedicated callback for writing to DBI2 registers
    b5b24f7693fe pmdomain: imx: Make imx pgc power domain also set the fwnode
    d2cc57f71327 pmdomain: amlogic: Fix mask for the second NNA mem PD domain
    47ceb5151c49 pmdomain: bcm: bcm2835-power: check if the ASB register is equal to enable
    37179fcc916b cxl/port: Fix delete_endpoint() vs parent unregistration race
    92ce68f7db0a cxl/region: Fix x1 root-decoder granularity calculations
    276c11fba093 i3c: master: svc: fix random hot join failure since timeout error
    d85cce9a5cbc i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
    ccf8c93a3cdb i3c: master: svc: fix check wrong status register in irq handler
    de3f849e2fb9 i3c: master: svc: fix ibi may not return mandatory data byte
    f448576547a1 i3c: master: svc: fix wrong data return when IBI happen during start frame
    3cce94303f3d i3c: master: svc: fix race condition in ibi work thread
    7dc6161114a3 i3c: master: cdns: Fix reading status register
    9090c5537c93 cxl/region: Do not try to cleanup after cxl_region_setup_targets() fails
    3c6facb35781 mtd: cfi_cmdset_0001: Byte swap OTP info
    b3759b87052f mm: make PR_MDWE_REFUSE_EXEC_GAIN an unsigned long
    cabf0ae76cc5 mm/memory_hotplug: use pfn math in place of direct struct page manipulation
    bec1ed638f26 mm/cma: use nth_page() in place of direct struct page manipulation
    569955a7bfa9 s390/cmma: fix detection of DAT pages
    61c903a28d73 s390/mm: add missing arch_set_page_dat() call to vmem_crst_alloc()
    6c4a91f9bb4a dmaengine: stm32-mdma: correct desc prep when channel running
    5f74466e7a1e mcb: fix error handling for different scenarios when parsing
    b2f00346f57b driver core: Release all resources during unbind before updating device links
    6d6b2578403a tracing: Have the user copy of synthetic event address use correct context
    1d221014dba1 selftests/clone3: Fix broken test under !CONFIG_TIME_NS
    8c3fa52a46ff i2c: core: Run atomic i2c xfer when !preemptible
    f81088082b15 kernel/reboot: emergency_restart: Set correct system_state
    21468aca2b52 quota: explicitly forbid quota files from being encrypted
    3925c0fb5932 jbd2: fix potential data lost in recovering journal raced with synchronizing fs bdev
    e0fe12248779 ASoC: codecs: wsa-macro: fix uninitialized stack variables with name prefix
    19ed109e1aba hid: lenovo: Resend all settings on reset_resume for compact keyboards
    496c5ca14f39 selftests/resctrl: Reduce failures due to outliers in MBA/MBM tests
    49ff765672bb selftests/resctrl: Move _GNU_SOURCE define into Makefile
    a91a4e52bfe7 selftests/resctrl: Remove duplicate feature check from CMT test
    23e60a15bbd0 selftests/resctrl: Fix uninitialized .sa_flags
    6f33bfaa762b ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
    94da565664b0 ASoC: soc-dai: add flag to mute and unmute stream during trigger
    e31eb7d9b7e4 netfilter: nf_tables: split async and sync catchall in two functions
    e3e68e617bfa netfilter: nf_tables: remove catchall element in GC sync path
    0d29174959bc ima: detect changes to the backing overlay file
    f2f0144e826b ima: annotate iint mutex to avoid lockdep false positive warnings
    4ce77b023d42 mfd: qcom-spmi-pmic: Fix revid implementation
    5487d746f77c mfd: qcom-spmi-pmic: Fix reference leaks in revid helper
    db76d11bdad1 leds: trigger: netdev: Move size check in set_device_name
    c8a439e96aaa arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size
    0361d86f8a06 arm64: dts: qcom: ipq9574: Fix hwlock index for SMEM
    a7c6fa8ecdd3 ACPI: FPDT: properly handle invalid FPDT subtables
    8398f2209474 firmware: qcom_scm: use 64-bit calling convention only when client is 64-bit
    68d8d8c659ac arm64: dts: qcom: ipq8074: Fix hwlock index for SMEM
    1fe0d9fa75ce arm64: dts: qcom: ipq5332: Fix hwlock index for SMEM
    6a3866dbdcf3 thermal: intel: powerclamp: fix mismatch in get function for max_idle
    5b2ed3c04a06 btrfs: don't arbitrarily slow down delalloc if we're committing
    94fda7ef2f1c rcu: kmemleak: Ignore kmemleak false positives when RCU-freeing objects
    ca6769551657 PM: hibernate: Clean up sync_read handling in snapshot_write_next()
    54a964575b7a PM: hibernate: Use __get_safe_page() rather than touching the list
    3480c1cd3bcf dt-bindings: timer: renesas,rz-mtu3: Fix overflow/underflow interrupt names
    59fef3cc602a arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM
    11b83785f525 rcu/tree: Defer setting of jiffies during stall reset
    1dc5f364e065 svcrdma: Drop connection after an RDMA Read error
    6aaf7cd8bdfe wifi: wilc1000: use vmm_table as array in wilc struct
    6a1cbc40579e PCI: exynos: Don't discard .remove() callback
    34198b3c544e PCI: kirin: Don't discard .remove() callback
    560ba0deb73e PCI/ASPM: Fix L1 substate handling in aspm_attr_store_common()
    d7769b51d85e mmc: Add quirk MMC_QUIRK_BROKEN_CACHE_FLUSH for Micron eMMC Q2J54A
    65204e28a0d0 mmc: sdhci_am654: fix start loop index for TAP value parsing
    c1008f77e6c9 mmc: vub300: fix an error code
    09d9d8b40a33 ksmbd: fix slab out of bounds write in smb_inherit_dacl()
    8434e0237913 ksmbd: handle malformed smb1 message
    b464f6c8df07 ksmbd: fix recursive locking in vfs helpers
    94e6378e1a70 clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    499ebc29b6d6 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    75f9b1a3ec29 clk: visconti: Fix undefined behavior bug in struct visconti_pll_provider
    2718027d6bca clk: socfpga: Fix undefined behavior bug in struct stratix10_clock_data
    ea131894f000 powercap: intel_rapl: Downgrade BIOS locked limits pr_warn() to pr_debug()
    d3f1a2c43827 cpufreq: stats: Fix buffer overflow detection in trans_stats()
    7a238a80e03d parisc/power: Add power soft-off when running on qemu
    423d3944a2ae parisc/pdc: Add width field to struct pdc_model
    4fb88c548be1 parisc/agp: Use 64-bit LE values in SBA IOMMU PDIR table
    74d2059dc4dd arm64: module: Fix PLT counting when CONFIG_RANDOMIZE_BASE=n
    bd31e534721a arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer
    d193f28146cf PCI: keystone: Don't discard .probe() callback
    01359f23420e PCI: keystone: Don't discard .remove() callback
    e0cecc2aa28d KEYS: trusted: Rollback init_trusted() consistently
    4745bd98ad9e KEYS: trusted: tee: Refactor register SHM usage
    ebd1f4898c3b sched/core: Fix RQCF_ACT_SKIP leak
    c62bad84b73d genirq/generic_chip: Make irq_remove_generic_chip() irqdomain aware
    611dda46d77d mmc: meson-gx: Remove setting of CMD_CFG_ERROR
    774de37c147f wifi: ath12k: fix dfs-radar and temperature event locking
    d908ca431e20 wifi: ath12k: fix htt mlo-offset event locking
    cf9c7d783a2b wifi: ath11k: fix gtk offload status event locking
    423762f02182 wifi: ath11k: fix htt pktlog locking
    1fd878e17501 wifi: ath11k: fix dfs radar event locking
    a9ad6fa9e582 wifi: ath11k: fix temperature event locking
    117ccba0288b regmap: Ensure range selector registers are updated after cache sync
    3055b7335604 ACPI: resource: Do IRQ override on TongFang GMxXGxx
    c85312edf701 parisc: Add nop instructions after TLB inserts
    d8cd49ff1fa3 mm/damon/sysfs: check error from damon_sysfs_update_target()
    2e4dec8e1ba6 mm/damon/sysfs-schemes: handle tried regions sysfs directory allocation failure
    fadc9f448f56 mm/damon/sysfs-schemes: handle tried region directory allocation failure
    47b6fa90875d mm/damon/core: avoid divide-by-zero during monitoring results update
    d44b509ba8af mm/damon: implement a function for max nr_accesses safe calculation
    dff884772b03 mm/damon/ops-common: avoid divide-by-zero during region hotness calculation
    771f3a57fdd1 mm/damon/lru_sort: avoid divide-by-zero in hot threshold calculation
    e93ac6410de3 dm crypt: account large pages in cc->n_allocated_pages
    369f7c467211 fbdev: stifb: Make the STI next font pointer a 32-bit signed offset
    836db2e7e456 iommufd: Fix missing update of domains_itree after splitting iopt_area
    38fae890594a watchdog: move softlockup_panic back to early_param
    81c5d125ff14 mm/damon/sysfs: update monitoring target regions for online input commit
    239a5a730e2a mm/damon/sysfs: remove requested targets when online-commit inputs
    93a063073cc4 PCI/sysfs: Protect driver's D3cold preference from user space
    5d93cb1ff604 hvc/xen: fix event channel handling for secondary consoles
    f17cba693e8a hvc/xen: fix error path in xen_hvc_init() to always register frontend driver
    b0ba80e8a6fe hvc/xen: fix console unplug
    fa71a72cd641 tty: serial: meson: fix hard LOCKUP on crtscts mode
    82ed32865a03 tty/sysrq: replace smp_processor_id() with get_cpu()
    9e4b54247cfd proc: sysctl: prevent aliased sysctls from getting passed to init
    0e8e06574ca4 audit: don't WARN_ON_ONCE(!current->mm) in audit_exe_compare()
    6ccef3ff7e79 audit: don't take task_lock() in audit_exe_compare() code path
    3eacee28b152 sched: psi: fix unprivileged polling against cgroups
    c242318d0b92 mmc: sdhci-pci-gli: GL9755: Mask the replay timer timeout of AER
    b1f329180409 KVM: x86: Fix lapic timer interrupt lost after loading a snapshot.
    d09a0eaf01b2 KVM: x86: Clear bit12 of ICR after APIC-write VM-exit
    080e6d79066f KVM: x86: Ignore MSR_AMD64_TW_CFG access
    144b8472b699 KVM: x86: hyper-v: Don't auto-enable stimer on write from user-space
    e22352ec91e2 x86/cpu/hygon: Fix the CPU topology evaluation for real
    2d0463ee5add x86/apic/msi: Fix misconfigured non-maskable MSI quirk
    4a142ea152ba x86/PCI: Avoid PME from D3hot/D3cold for AMD Rembrandt and Phoenix USB4
    72a40e561f3d crypto: x86/sha - load modules based on CPU features
    8f15a7e3c054 scsi: ufs: core: Fix racing issue between ufshcd_mcq_abort() and ISR
    07bc6e424419 scsi: qla2xxx: Fix system crash due to bad pointer access
    32e63c396f78 scsi: ufs: qcom: Update PHY settings only when scaling to higher gears
    09bcc704da4b scsi: megaraid_sas: Increase register read retry rount from 3 to 30 for selected registers
    fc3166ddfbe8 scsi: mpt3sas: Fix loop logic
    69327243558f bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE | BPF_END
    a101d1262799 bpf: Fix check_stack_write_fixed_off() to correctly spill imm
    a32e62eb903a randstruct: Fix gcc-plugin performance mode to stay in group
    6cfee0c86eee powerpc/perf: Fix disabling BHRB and instruction sampling
    6066567c5bd2 perf intel-pt: Fix async branch flags
    4edc7e66c014 media: venus: hfi: add checks to perform sanity on queue pointers
    2c86b24095fc drivers: perf: Check find_first_bit() return value
    8d60852e8cc9 perf: arm_cspmu: Reject events meant for other PMUs
    bf8e10503008 i915/perf: Fix NULL deref bugs with drm_dbg() calls
    c8ace8d25274 perf/core: Fix cpuctx refcounting
    109b452cc842 cifs: fix check of rc in function generate_smb3signingkey
    eeba3f02bb99 cifs: spnego: add ';' in HOST_KEY_LEN
    95cd9b8efb1c scsi: ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1
    8c7037da3d0e tools/power/turbostat: Enable the C-state Pre-wake printing
    b309f567636a tools/power/turbostat: Fix a knl bug
    9b2e63f1bea6 macvlan: Don't propagate promisc change to lower dev in passthru
    b4c2de028ea4 net: sched: do not offload flows with a helper in act_ct
    ba8d40609562 net/mlx5e: Check return value of snprintf writing to fw_version buffer for representors
    5f36c6760cc9 net/mlx5e: Check return value of snprintf writing to fw_version buffer
    3d764c41725c net/mlx5e: Reduce the size of icosq_str
    aee07f286930 net/mlx5: Increase size of irq name buffer
    42b11d1293e5 net/mlx5e: Update doorbell for port timestamping CQ before the software counter
    647eb36aaeca net/mlx5e: Add recovery flow for tx devlink health reporter for unhealthy PTP SQ
    e729382c297e net/mlx5e: Make tx_port_ts logic resilient to out-of-order CQEs
    11bffa0c4ef2 net/mlx5: Consolidate devlink documentation in devlink/mlx5.rst
    57fb34e36fad net/mlx5e: Fix pedit endianness
    3585f0b2afda net/mlx5e: fix double free of encap_header in update funcs
    ac2dd6c892e4 net/mlx5e: fix double free of encap_header
    8b9491d50ca4 net/mlx5: Decouple PHC .adjtime and .adjphase implementations
    e87fa62ebc59 io_uring/fdinfo: remove need for sqpoll lock for thread/pid retrieval
    a533c9763c3f gve: Fixes for napi_poll when budget is 0
    cb9e4507cca7 pds_core: fix up some format-truncation complaints
    9c9d97c88536 pds_core: use correct index to mask irq
    b435b4573240 net: stmmac: avoid rx queue overrun
    c40a19f57010 net: stmmac: fix rx budget limit check
    72caa17c14b4 netfilter: nf_tables: bogus ENOENT when destroying element which does not exist
    1a605657adc5 netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()
    cbb43d024952 netfilter: nf_conntrack_bridge: initialize err to 0
    eae0b295ce16 af_unix: fix use-after-free in unix_stream_read_actor()
    b971f116733c net: ethernet: cortina: Fix MTU max setting
    458cc008c723 net: ethernet: cortina: Handle large frames
    fbe560020a5f net: ethernet: cortina: Fix max RX frame define
    87c49806a37f bonding: stop the device in bond_setup_by_slave()
    fa9dac68ce73 ptp: annotate data-race around q->head and q->tail
    e9c309ded295 blk-mq: make sure active queue usage is held for bio_integrity_prep()
    36fcea86f71d xen/events: fix delayed eoi list handling
    ebbb5baa134a ppp: limit MRU to 64K
    230dc06e2495 net: mvneta: fix calls to page_pool_get_stats
    b70f095b30ee tipc: Fix kernel-infoleak due to uninitialized TLV value
    e4514960282d net: hns3: fix VF wrong speed and duplex issue
    96f9229c8459 net: hns3: fix VF reset fail issue
    cdae6292604c net: hns3: fix variable may not initialized problem in hns3_init_mac_addr()
    be1f703f39ef net: hns3: fix out-of-bounds access may occur when coalesce info is read via debugfs
    3a948d0aed3d net: hns3: fix incorrect capability bit display for copper port
    3d7e5e30124b net: hns3: add barrier in vf mailbox reply process
    53ba90be73c1 net: hns3: fix add VLAN fail issue
    0ad883132835 xen/events: avoid using info_for_irq() in xen_send_IPI_one()
    fdd76a1e9353 tty: Fix uninit-value access in ppp_sync_receive()
    8872dc638c24 ipvlan: add ipvlan_route_v6_outbound() helper
    d239d81b660b net: set SOCK_RCU_FREE before inserting socket into hashtable
    d31958f65e48 bpf: fix precision backtracking instruction iteration
    732b237269e0 bpf: handle ldimm64 properly in check_cfg()
    9aea191c29e1 gcc-plugins: randstruct: Only warn about true flexible arrays
    ae8ea4e20067 vhost-vdpa: fix use after free in vhost_vdpa_probe()
    ba9626b4c2bb vdpa_sim_blk: allocate the buffer zeroed
    50aa75671d30 drm/i915/tc: Fix -Wformat-truncation in intel_tc_port_init
    5e43db2d8c1d gfs2: Silence "suspicious RCU usage in gfs2_permission" warning
    a00a7a028bcd riscv: provide riscv-specific is_trap_insn()
    377befc2e809 RISC-V: hwprobe: Fix vDSO SIGSEGV
    1cdb52ffd660 SUNRPC: Fix RPC client cleaned up the freed pipefs dentries
    b8919192ab62 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
    5d215bd58b1e SUNRPC: Add an IS_ERR() check back to where it was
    3c51fac1ae19 NFSv4.1: fix handling NFS4ERR_DELAY when testing for session trunking
    37c6ca6a1931 drm/i915/mtl: avoid stringop-overflow warning
    8250fdd1daa3 mtd: rawnand: meson: check return value of devm_kasprintf()
    6fc0bc01eef1 mtd: rawnand: intel: check return value of devm_kasprintf()
    0b8fb1758ef6 SUNRPC: ECONNRESET might require a rebind
    cc0ccee308e8 dt-bindings: serial: fix regex pattern for matching serial node children
    61576b7a0f28 samples/bpf: syscall_tp_user: Fix array out-of-bound access
    923697c686e7 samples/bpf: syscall_tp_user: Rename num_progs into nr_tests
    64cdff87126d sched/core: Optimize in_task() and in_interrupt() a bit
    de9b4f65e9e2 wifi: iwlwifi: Use FW rate for non-data frames
    e651a075d817 mtd: rawnand: tegra: add missing check for platform_get_irq()
    c19a8794bf4f pwm: Fix double shift bug
    81663506ed83 drm/amdgpu: fix software pci_unplug on some chips
    5764e6c861f2 ALSA: hda/realtek: Add quirk for ASUS UX7602ZM
    1acf0293d713 drm/qxl: prevent memory leak
    4e35ae99f85d ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings
    fe4eb2157d8c i2c: dev: copy userspace array safely
    1493baaf09e3 riscv: VMAP_STACK overflow detection thread-safe
    c99fff688529 kgdb: Flush console before entering kgdb on panic
    6d8653b1a7a8 drm/amd/display: Avoid NULL dereference of timing generator
    10ec5a97f8f5 media: imon: fix access to invalid resource for the second interface
    163c0a38dfaf media: ccs: Fix driver quirk struct documentation
    359f6509b342 media: cobalt: Use FIELD_GET() to extract Link Width
    ba5c85a4f30c gfs2: fix an oops in gfs2_permission
    212f112fe5e9 gfs2: ignore negated quota changes
    6928a428218e media: ipu-bridge: increase sensor_name size
    be36843c9691 media: vivid: avoid integer overflow
    93bddd6529f1 media: gspca: cpia1: shift-out-of-bounds in set_flicker
    3cb79a365e7c i3c: master: mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.
    017278f14114 virtio-blk: fix implicit overflow on virtio_max_dma_size
    ef0de19402e5 i2c: sun6i-p2wi: Prevent potential division by zero
    43306cc76119 i2c: fix memleak in i2c_new_client_device()
    f10b93471818 i2c: i801: Add support for Intel Birch Stream SoC
    7c2b91b30d74 i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
    454a176943a2 9p: v9fs_listxattr: fix %s null argument warning
    e0f8790383ef 9p/trans_fd: Annotate data-racy writes to file::f_flags
    a65245d663ee usb: gadget: f_ncm: Always set current gadget in ncm_bind()
    95d3f58e1d4e usb: host: xhci: Avoid XHCI resume delay if SSUSB device is not present
    ecf58b678d4b f2fs: fix error handling of __get_node_page
    184b4e42d929 f2fs: fix error path of __f2fs_build_free_nids
    38f43d43f20a soundwire: dmi-quirks: update HP Omen match
    5b13bb603d05 usb: ucsi: glink: use the connector orientation GPIO to provide switch events
    5a6afa6a8427 usb: dwc3: core: configure TX/RX threshold for DWC3_IP
    11fbc8357820 phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs
    d86b03dc9041 phy: qualcomm: phy-qcom-eusb2-repeater: Use regmap_fields
    5fe0d30ecdc4 dt-bindings: phy: qcom,snps-eusb2-repeater: Add magic tuning overrides
    4a24a3182624 tty: vcc: Add check for kstrdup() in vcc_probe()
    5440e83534ee thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
    b028f89c56e9 iio: adc: stm32-adc: harden against NULL pointer deref in stm32_adc_probe()
    d6703d4a0686 mfd: intel-lpss: Add Intel Lunar Lake-M PCI IDs
    807ee5504236 exfat: support handle zero-size directory
    e9cf5b36ef98 HID: Add quirk for Dell Pro Wireless Keyboard and Mouse KM5221W
    5b6af0a7196a crypto: hisilicon/qm - prevent soft lockup in receive loop
    9e7c0059fbe1 ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro YT3-X90 quirk
    4113955cb689 PCI: Use FIELD_GET() in Sapphire RX 5600 XT Pulse quirk
    4c525492f1c5 misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller
    1567af9a411c PCI: dwc: Add missing PCI_EXP_LNKCAP_MLW handling
    89973bbce2c8 PCI: dwc: Add dw_pcie_link_set_max_link_width()
    27622f8b50ba PCI: Disable ATS for specific Intel IPU E2000 devices
    0ac15627471b PCI: Extract ATS disabling to a helper function
    5bb6d731d45e PCI: Use FIELD_GET() to extract Link Width
    f6fe7261b92b scsi: libfc: Fix potential NULL pointer dereference in fc_lport_ptp_setup()
    668b8ec30762 PCI: Do error check on own line to split long "if" conditions
    db8e4d8567a7 atm: iphase: Do PCI error checks on own line
    4faeebe638ca PCI: mvebu: Use FIELD_PREP() with Link Width
    7f7d54926b39 PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Link Width fields
    def5e864ca2d gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
    fe7c1a0c2b25 ALSA: hda: Fix possible null-ptr-deref when assigning a stream
    c23ff8ea21bd ARM: 9320/1: fix stack depot IRQ stack filter
    9de5ae56f4f3 HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround
    665b44e55c27 jfs: fix array-index-out-of-bounds in diAlloc
    88b7894a8f87 jfs: fix array-index-out-of-bounds in dbFindLeaf
    dca403bb035a fs/jfs: Add validity check for db_maxag and db_agpref
    491085258185 fs/jfs: Add check for negative db_l2nbperpage
    d2af4ef80601 scsi: ibmvfc: Remove BUG_ON in the case of an empty event pool
    75a2656260fe scsi: hisi_sas: Set debugfs_dir pointer to NULL after removing debugfs
    b3e52db0e9d1 RDMA/hfi1: Use FIELD_GET() to extract Link Width
    f5437f4a3ec9 ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification from firmware
    e134f3aba98e crypto: pcrypt - Fix hungtask for PADATA_RESET
    355946538c39 ASoC: SOF: Pass PCI SSID to machine driver
    e670059e8c20 ASoC: soc-card: Add storage for PCI SSID
    0adc6613c263 ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
    9da3382085dc selftests/efivarfs: create-read: fix a resource leak
    a7e2f27557df arm64: dts: ls208xa: use a pseudo-bus to constrain usb dma size
    5b4574b663d0 drm/amd: check num of link levels when update pcie param
    3b0135937936 drm/amd/display: fix num_ways overflow error
    1f20cb1da4dd drm/amd: Disable PP_PCIE_DPM_MASK when dynamic speed switching not supported
    820daf9ffe2b drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NULL
    d33a35b13cbf drm/amdkfd: Fix shift out-of-bounds issue
    16f77d4264c4 drm/panel: st7703: Pick different reset sequence
    8c6c85a07376 drm/amdgpu/vkms: fix a possible null pointer dereference
    22d7ec972cd9 drm/radeon: fix a possible null pointer dereference
    9268bfd76beb drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference
    4fa930ba046d drm/panel: fix a possible null pointer dereference
    b0702ee4d811 drm/amdgpu: Fix potential null pointer derefernce
    7c68283f3166 drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga
    6dffdddfca81 drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
    dec5469ce9f5 drm/msm/dp: skip validity check for DP CTS EDID checksum
    1eacb4c96e73 drm: vmwgfx_surface.c: copy user-array safely
    301e597e7b81 drm_lease.c: copy user-array safely
    c7acf02df167 kernel: watch_queue: copy user-array safely
    b0ed017a2b97 kernel: kexec: copy user-array safely
    5562f0a42844 string.h: add array-wrappers for (v)memdup_user()
    811539a2ec93 drm/amd/display: use full update for clip size increase of large plane source
    e9b638de04b0 drm/amd: Update `update_pcie_parameters` functions to use uint8_t arguments
    c772eacbd6d0 drm/amdkfd: Fix a race condition of vram buffer unref in svm code
    3ec74308f17a drm/amdgpu: not to save bo in the case of RAS err_event_athub
    77eee682f437 md: don't rely on 'mddev->pers' to be set in mddev_suspend()
    c2a7847c0d4b drm/edid: Fixup h/vsync_end instead of h/vtotal
    de7550fe430f drm/amd/display: add seamless pipe topology transition check
    356dee34f5db drm/amd/display: Don't lock phantom pipe on disabling
    f1035d36fd45 drm/amd/display: Blank phantom OTG before enabling
    11c3ebd1d2b7 drm/komeda: drop all currently held locks if deadlock happens
    c7f81cd3e9c9 drm/amdkfd: ratelimited SQ interrupt messages
    d6f17735d8da drm/gma500: Fix call trace when psb_gem_mm_init() fails
    54d7dd51345a platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e
    99171d81c5bc of: address: Fix address translation when address-size is greater than 2
    3df4c7945390 platform/chrome: kunit: initialize lock for fake ec_dev
    ad1b721c9d16 gpiolib: acpi: Add a ignore interrupt quirk for Peaq C1010
    6165ae149eaa tsnep: Fix tsnep_request_irq() format-overflow warning
    6a2c311fd0dc ACPI: EC: Add quirk for HP 250 G7 Notebook PC
    fc666d1b4751 Bluetooth: Fix double free in hci_conn_cleanup
    0048ddf045bd Bluetooth: btusb: Add date->evt_skb is NULL check
    dd860dff8058 wifi: iwlwifi: mvm: fix size check for fw_link_id
    cc8de9383c72 bpf: Ensure proper register state printing for cond jumps
    cb2cfbec0982 vsock: read from socket's error queue
    104922ba6602 net: sfp: add quirk for FS's 2.5G copper SFP
    aa47f6382bd1 wifi: ath10k: Don't touch the CE interrupt registers after power up
    b2e99ba69ce6 wifi: ath12k: mhi: fix potential memory leak in ath12k_mhi_register()
    fb3a71a8383f net: annotate data-races around sk->sk_dst_pending_confirm
    37e1a89a8728 net: annotate data-races around sk->sk_tx_queue_mapping
    437538c00f19 wifi: mt76: mt7921e: Support MT7992 IP in Xiaomi Redmibook 15 Pro (2023)
    cde2a1d8c9da net: sfp: add quirk for Fiberstone GPON-ONU-34-20BI
    8d95caf80366 ACPI: APEI: Fix AER info corruption when error status data has multiple sections
    dfe13eaab043 wifi: ath12k: fix possible out-of-bound write in ath12k_wmi_ext_hal_reg_caps()
    0b8e7c1169a6 wifi: ath10k: fix clang-specific fortify warning
    79527c21a3ce wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()
    c4992b79fadc wifi: ath9k: fix clang-specific fortify warnings
    327b92e8cb52 bpf: Detect IP == ksym.end as part of BPF program
    54a6152da499 atl1c: Work around the DMA RX overflow issue
    adc2474d823f wifi: mac80211: don't return unset power in ieee80211_get_tx_power()
    6100f6013af0 wifi: mac80211_hwsim: fix clang-specific fortify warning
    b8966720c3a0 wifi: ath12k: Ignore fragments from uninitialized peer in dp
    ed0ac28cbc2a wifi: plfxlc: fix clang-specific fortify warning
    66e460eeaa70 x86/mm: Drop the 4 MB restriction on minimal NUMA node memory size
    d112c682c47f workqueue: Provide one lock class key per work_on_cpu() callsite
    335a47ed71e3 cpu/hotplug: Don't offline the last non-isolated CPU
    2ca04946b4ea smp,csd: Throw an error if a CSD lock is stuck for too long
    d4d2297d04bf srcu: Only accelerate on enqueue time
    c05cbfcb6eee clocksource/drivers/timer-atmel-tcb: Fix initialization on SAM9 hardware
    8ea7a452dc7d clocksource/drivers/timer-imx-gpt: Fix potential memory leak
    161a323c60d0 selftests/lkdtm: Disable CONFIG_UBSAN_TRAP in test config
    8c3b1175d152 srcu: Fix srcu_struct node grpmask overflow on 64-bit systems
    2424410f94a9 perf/core: Bail out early if the request AUX area is out of bound
    c485c94c0b8b x86/retpoline: Make sure there are no unconverted return thunks due to KCSAN
    ec298b958cb0 lib/generic-radix-tree.c: Don't overflow in peek()
    96612b6f99d5 btrfs: abort transaction on generation mismatch when marking eb as dirty
    e36407713163 locking/ww_mutex/test: Fix potential workqueue corruption

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e28367970d90ffdd501c1876a950e645486bdaf1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 1a0107aa7c..62020312f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6c68332cd558b8d3ec194abb9d0cdc7324c668f3"
-SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
+SRCREV_machine ?= "1d89cd73350cad73ecf330ad3785e6d8bdec092d"
+SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.12"
+LINUX_VERSION ?= "6.5.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 8766ffd218..f57bc47b37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.12"
+LINUX_VERSION ?= "6.5.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c4b1d3779649c9e212fe516dcecc9d674402f1b6"
-SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
+SRCREV_machine ?= "95753fe2a7d507646224fe973e2a4fc48cb7694d"
+SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index abd9b28249..1233140f8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9b735951de2e2d7697beac1258bfc05232213339"
-SRCREV_machine:qemuarm64 ?= "652142e0a8372f0df82300ee97a441b5bb26ee17"
-SRCREV_machine:qemuloongarch64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_machine:qemumips ?= "6a36d582f1d415abac7c73701d1554f2b1e3c789"
-SRCREV_machine:qemuppc ?= "f95f50a6507d1c6a82bcd30bde6613dedf52b6b7"
-SRCREV_machine:qemuriscv64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_machine:qemuriscv32 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_machine:qemux86 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_machine:qemux86-64 ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_machine:qemumips64 ?= "972de1c66fa87eaba9d55fa27803a46b7441abe2"
-SRCREV_machine ?= "2e8b8729afa122ecdf4e0555f5c650782ee6d48c"
-SRCREV_meta ?= "7ff7145071562b060dedb7a7805958a31e5f0ba3"
+SRCREV_machine:qemuarm ?= "3fdf15eaa1db1b6fd1de804d03c6b4a10c2c3f4b"
+SRCREV_machine:qemuarm64 ?= "70210986a1c554098fb6f75f6cd10ab85171506a"
+SRCREV_machine:qemuloongarch64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemumips ?= "338cee0966e9ea856a696df0a9f5432f74b06270"
+SRCREV_machine:qemuppc ?= "2fbe7b92bda7afe7aca6e58b0ac124f2a26737ee"
+SRCREV_machine:qemuriscv64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemuriscv32 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemux86 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemux86-64 ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_machine:qemumips64 ?= "ff5efc72e961cf345f935ac14cdcaa9843ec5b23"
+SRCREV_machine ?= "7fe59b2e3f40a94ce4477854264e219aeb972990"
+SRCREV_meta ?= "867a6bdef9701f378f5a9ce66a713daa22598649"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fa1be4637aadf1116091ddc508ad594ff021942f"
+SRCREV_machine:class-devupstream ?= "4631960b4700dd53f5cebb4f7055fd00ccd556ce"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.12"
+LINUX_VERSION ?= "6.5.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


