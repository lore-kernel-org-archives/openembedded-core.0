Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2A6C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.1248.1668559118494967762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KdJ+qVdS;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id e15so9870944qts.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahGaba1suW85o8y6eLGY5f7jIVUtI8q6Xg06D3ybbBY=;
        b=KdJ+qVdS7xul92eQxie0VmDpQ4TTh1aQbsjSbJe8OWMfVDLGk/8eXG8htuIobpsFpR
         a9iey5ykUpMTfxgbVZs3fk2TjkT3eB6Q9sarC+xtY/zE7moubnsm3NbAomMkq9use/W+
         3HXU5iz866XVtr6FEL4u1FahK/a6YBUPoXp/uXdPWvfIxXM4QuJA4czsNUbNS7Ci/MgB
         bDxUqfh01sGNly3sXFDbV4YCFw9yQixy3qrivVbEDyVP6NgyZctVgUgy07RjFb2NnCAc
         Z02bUnD4KxyfZgO2j7WzetKcCJR8FnAYawk8goVh6FghXlaiUqlrUmC2VMq5NTsLyLuY
         MKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahGaba1suW85o8y6eLGY5f7jIVUtI8q6Xg06D3ybbBY=;
        b=EIjOCDOpeZeCc6QTbOBIwCFamhqKboGL1xerjS1fd6yV2dmlnSTiz4/5C9DwCju//X
         Eu7pJSfDasxNj8AgXULneiqY9crYkoCGXTXgx7N+e68+pcpi5/4vf+Yofhn+Kqf2+oCE
         lEl5KFx84/9dkd9PuuqKzv7NUPLihVIx59XiMcFIxdZr0WbV81QSeTw/gwYDXVroRGle
         YciyMKkDNFUlPiZPqEOA3ekV1Ljq4YP9jIoHz9mI+gyNAtP0rjibq3N2YWybZ61hy9mK
         U04lYB1NLgJlt3AtARDGSfxRXBZ4XdCfjVMc/4m7sLLfqbFGgmGb2iitE4YAhqSzymwW
         0ZYw==
X-Gm-Message-State: ANoB5pkwqYkOuEZ91C+iUtcDIJplnWJcBaBIVu0063NEVKnuPh9od5v6
	LzVRZIwqNjTSdPh1bC+tYPv1ukSQa3s9zA==
X-Google-Smtp-Source: AA0mqf69sxyDOrutmTM//9VxFKSt9zXcIc5qQLk1NPpgcubefI8cK/k3A9W1TfBV5l+Bmo98dhOpNg==
X-Received: by 2002:a05:622a:5c14:b0:3a5:7548:b41e with SMTP id gd20-20020a05622a5c1400b003a57548b41emr19205543qtb.0.1668559117092;
        Tue, 15 Nov 2022 16:38:37 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/5.15: update to v5.15.76
Date: Tue, 15 Nov 2022 19:38:23 -0500
Message-Id: <9e192b979617626aa10dfdd409edb6af113d824b.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173368

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4f5365f77018 Linux 5.15.76
    33fc9e26b7cb mm: /proc/pid/smaps_rollup: fix no vma's null-deref
    b9d8cbe90a0f mmc: core: Add SD card quirk for broken discard
    0ee2f0567a56 Makefile.debug: re-enable debug info for .S files
    117825e9bbb1 x86/Kconfig: Drop check for -mabi=ms for CONFIG_EFI_STUB
    0983205085fa ACPI: video: Force backlight native for more TongFang devices
    289b56715ba6 perf: Skip and warn on unknown format 'configN' attrs
    9d912a385368 mmc: sdhci-tegra: Use actual clock rate for SW tuning correction
    7aeda81191fd tracing: Do not free snapshot if tracer is on cmdline
    57252e7bd491 tracing: Simplify conditional compilation code in tracing_set_tracer()
    20bc6d23f7f6 ksmbd: fix incorrect handling of iterate_dir
    3c8cfcaa2d9a ksmbd: handle smb2 query dir request for OutputBufferLength that is too small
    8754fa5dbc6e arm64: mte: move register initialization to C
    ea7be82fd7e1 fs: dlm: fix invalid derefence of sb_lvbptr
    0365d6af75f9 iommu/vt-d: Clean up si_domain in the init_dmars() error path
    5c95d0c9d0eb iommu/vt-d: Allow NVS regions in arch_rmrr_sanity_check()
    209740fd132e net: phy: dp83822: disable MDI crossover status change interrupt
    ce1234573d18 net: sched: fix race condition in qdisc_graft()
    91f8f5342bee net: hns: fix possible memory leak in hnae_ae_register()
    50c31fa95230 wwan_hwsim: fix possible memory leak in wwan_hwsim_dev_new()
    d2fc83a6b55e sfc: include vport_id in filter spec hash and equal()
    c2e1e59d59fa net: sched: sfb: fix null pointer access issue when sfb_init() fails
    34f2a4eedc8e net: sched: delete duplicate cleanup of backlog and qlen
    154f4c06d9db net: sched: cake: fix null pointer access issue when cake_init() fails
    5efed7578dd4 nvmet: fix workqueue MEM_RECLAIM flushing dependency
    2f2b84b02088 nvme-hwmon: kmalloc the NVME SMART log buffer
    66c56b232839 nvme-hwmon: consistently ignore errors from nvme_hwmon_init
    d77f6908f9ce netfilter: nf_tables: relax NFTA_SET_ELEM_KEY_END set flags requirements
    efa9dd7e679e ionic: catch NULL pointer issue on reconfig
    35ece858660e net: hsr: avoid possible NULL deref in skb_clone()
    e326df21da25 dm: remove unnecessary assignment statement in alloc_dev()
    847301f0ee1c cifs: Fix xid leak in cifs_ses_add_channel()
    8905d13b9ede cifs: Fix xid leak in cifs_flock()
    27cfd3afaab0 cifs: Fix xid leak in cifs_copy_file_range()
    593d877c39aa cifs: Fix xid leak in cifs_create()
    a8df9d0428c7 udp: Update reuse->has_conns under reuseport_lock.
    9749595feb33 scsi: lpfc: Fix memory leak in lpfc_create_port()
    b9122e0e0ea8 net: phylink: add mac_managed_pm in phylink_config structure
    412db9b06d3c net: phy: dp83867: Extend RX strap quirk for SGMII mode
    5ce613051994 net/atm: fix proc_mpc_write incorrect return value
    0eb17faedce7 sfc: Change VF mac via PF as first preference if available.
    0f58940ca3c1 HID: magicmouse: Do not set BTN_MOUSE on double report
    94a171c982b8 i40e: Fix DMA mappings leak
    dbc01c0a4e20 tipc: fix an information leak in tipc_topsrv_kern_subscr
    b294cad6f02e tipc: Fix recognition of trial period
    6161c364e378 ACPI: extlog: Handle multiple records
    40e5fceddfd5 drm/vc4: Add module dependency on hdmi-codec
    6c5041a10324 btrfs: fix processing of delayed tree block refs during backref walking
    af67578d565c btrfs: fix processing of delayed data refs during backref walking
    c439cafce8cf x86/topology: Fix duplicated core ID within a package
    d31f4bc22596 x86/topology: Fix multiple packages shown on a single-package system
    fcc96e89b3ff media: venus: dec: Handle the case where find_format fails
    b22b4823a0a5 media: mceusb: set timeout to at least timeout provided
    5265cc1202a3 media: ipu3-imgu: Fix NULL pointer dereference in active selection access
    1e4e71f9e197 KVM: arm64: vgic: Fix exit condition in scan_its_table()
    5bf2fda26a72 kvm: Add support for arch compat vm ioctls
    112a005d1ded mm,hugetlb: take hugetlb_lock before decrementing h->resv_huge_pages
    2d508b4e6536 drm/amdgpu: fix sdma doorbell init ordering on APUs
    b5606e3ab1f7 cpufreq: qcom: fix memory leak in error path
    d866f5982c15 x86/resctrl: Fix min_cbm_bits for AMD
    8fbe13de1cc7 ata: ahci: Match EM_MAX_SLOTS with SATA_PMP_MAX_PORTS
    5d6a037b3a94 ata: ahci-imx: Fix MODULE_ALIAS
    30cf0dee372b hwmon/coretemp: Handle large core ID value
    2f7171465f26 x86/microcode/AMD: Apply the patch early on every logical thread
    93d7e2b47a72 i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
    14d260f94ff8 cpufreq: qcom: fix writes in read-only memory region
    3006766d247b selinux: enable use of both GFP_KERNEL and GFP_ATOMIC in convert_context()
    1b31cb0065e2 ocfs2: fix BUG when iput after ocfs2_mknod fails
    e469db818ec9 ocfs2: clear dinode links count in case of error
    ded9d535be0d btrfs: enhance unsupported compat RO flags handling
    537412c54712 perf/x86/intel/pt: Relax address filter validation
    8ddc58e0e312 arm64: errata: Remove AES hwcap for COMPAT tasks
    738515cf8bb4 usb: gadget: uvc: improve sg exit condition
    db11d8c72a5d usb: gadget: uvc: giveback vb2 buffer on req complete
    aee340dccf5a usb: gadget: uvc: rework uvcg_queue_next_buffer to uvcg_complete_buffer
    2f54ce7392d7 usb: gadget: uvc: use on returned header len in video_encode_isoc_sg
    d80db2f1450c usb: gadget: uvc: consistently use define for headerlen
    f9681a67503e arm64/mm: Consolidate TCR_EL1 fields
    5b20aacff7ad r8152: add PID for the Lenovo OneLink+ Dock
    bd8a595958a5 Linux 5.15.75
    b6e2c54be37d io-wq: Fix memory leak in worker creation
    7c359e28492f gcov: support GCC 12.1 and newer compilers
    8418c1672c1f thermal: intel_powerclamp: Use first online CPU as control_cpu
    55c824b62067 ext4: continue to expand file system when the target size doesn't reach
    0e63de6d7e4c lib/Kconfig.debug: Add check for non-constant .{s,u}leb128 support to DWARF5
    84cd0b20fada Kconfig.debug: add toolchain checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
    371aaf6b48f5 Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5
    e1591557e3a0 drm/amd/display: Fix build breakage with CONFIG_DEBUG_FS=n
    34f31a2b6679 net/ieee802154: don't warn zero-sized raw_sendmsg()
    de904d0fe1cb Revert "net/ieee802154: reject zero-sized raw_sendmsg()"
    9c65eef9d6c9 net: ethernet: ti: davinci_mdio: fix build for mdio bitbang uses
    d7eadffce032 blk-wbt: fix that 'rwb->wc' is always set to 1 in wbt_init()
    28787ff9fbea ALSA: usb-audio: Fix last interface check for registration
    b8989e95d74e net: ieee802154: return -EINVAL for unknown addr type
    0db2efb3bff8 mm: hugetlb: fix UAF in hugetlb_handle_userfault
    98aada6e2278 io_uring/rw: fix unexpected link breakage
    d6b7efc722a2 io_uring/rw: fix error'ed retry return values
    e857457c6f90 io_uring/rw: fix short rw error handling
    cd148d4e3183 io_uring: correct pinned_vm accounting
    813d8fe5d303 io_uring/af_unix: defer registered files gc to io_uring release
    c69a2324fc6b perf intel-pt: Fix segfault in intel_pt_print_info() with uClibc
    e81bf40b280b clk: bcm2835: Round UART input clock up
    da17cbb229af clk: bcm2835: Make peripheral PLLC critical
    20b8c456df58 usb: idmouse: fix an uninit-value in idmouse_open
    ec8adf767e1c nvmet-tcp: add bounds check on Transfer Tag
    1c6432884010 nvme: copy firmware_rev on each init
    b9b5560b342e ext2: Use kvmalloc() for group descriptor array
    8c067a3051cd scsi: tracing: Fix compile error in trace_array calls when TRACING is disabled
    39bef9c6a91b staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
    b4573a2bad3c staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
    eb24d93e3e01 Revert "usb: storage: Add quirk for Samsung Fit flash"
    3a38985d8bfd usb: dwc3: core: Enable GUCTL1 bit 10 for fixing termination error after resume bug
    9d4f84a15f9c arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
    3c84c7f592c4 usb: musb: Fix musb_gadget.c rxstate overflow bug
    fcd594da0b59 usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
    9e86dffd0b02 md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d
    f8e80792c1a8 eventfd: guard wake_up in eventfd fs calls as well
    c61786dc727d HID: roccat: Fix use-after-free in roccat_read()
    f7f425d61de9 soundwire: intel: fix error handling on dai registration issues
    093a5463aeec soundwire: cadence: Don't overwrite msg->buf during write commands
    1b4ed920b2ff bcache: fix set_at_max_writeback_rate() for multiple attached devices
    eecb5ccc84a1 ata: libahci_platform: Sanity check the DT child nodes number
    70b2adb1d698 blk-throttle: prevent overflow while calculating wait time
    ff8551d411f1 staging: vt6655: fix potential memory leak
    7c8bc374659d power: supply: adp5061: fix out-of-bounds read in adp5061_get_chg_type()
    3d6946180734 iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device to identity
    c0d73be0af8c nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
    9d54de866062 scsi: 3w-9xxx: Avoid disabling device if failing to enable it
    d68da10b0cce dmaengine: ti: k3-udma: Reset UDMA_CHAN_RT byte counters to prevent overflow
    518a2a1cc361 usb: host: xhci-plat: suspend/resume clks for brcm
    f002aa7c0ac5 usb: host: xhci-plat: suspend and resume clocks
    6bcd745c87a0 clk: zynqmp: pll: rectify rate rounding in zynqmp_pll_round_rate
    5c32cbf6ccea media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
    6f21976095c1 media: cx88: Fix a null-ptr-deref bug in buffer_prepare()
    0a07b13af04d clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    3680442cbaee ARM: 9242/1: kasan: Only map modules if CONFIG_KASAN_VMALLOC=n
    4a89c0befca7 btrfs: don't print information about space cache or tree every remount
    39a07058c762 btrfs: scrub: try to fix super block errors
    f3857dd7c03a btrfs: dump extra info if one free space cache has more bitmaps than it should
    d3c6d5be46de arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply
    82046b6a84e0 kselftest/arm64: Fix validatation termination record after EXTRA_CONTEXT
    35365417333d ARM: dts: imx6sx: add missing properties for sram
    602813650cbc ARM: dts: imx6sll: add missing properties for sram
    6a12e1e23cb1 ARM: dts: imx6sl: add missing properties for sram
    8c24dc621bb7 ARM: dts: imx6qp: add missing properties for sram
    47666b9a11a1 ARM: dts: imx6dl: add missing properties for sram
    19fe40c5185d ARM: dts: imx6q: add missing properties for sram
    9361ba779152 ARM: dts: imx7d-sdb: config the max pressure for tsc2046
    0f90671ff93f drm/amd/display: Remove interface for periodic interrupt 1
    88fd06740659 drm/dp: Don't rewrite link config when setting phy test pattern
    668806a8268b mmc: sdhci-msm: add compatible string check for sdm670
    587c7da87721 drm/meson: explicitly remove aggregate driver at module unload time
    d76ff04a72f9 drm/meson: reorder driver deinit sequence to fix use-after-free bug
    d894db35617f drm/amdgpu: fix initial connector audio value
    e3675f688d3b ASoC: SOF: pci: Change DMI match info to support all Chrome platforms
    f16e1b7b3968 platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
    39da49ffa2f3 platform/chrome: cros_ec: Notify the PM of wake events during resume
    74636047845c drm: panel-orientation-quirks: Add quirk for Anbernic Win600
    2810061452f9 drm/vc4: vec: Fix timings for VEC modes
    0506c4eae9a9 ALSA: usb-audio: Register card at the last interface
    39d7a81bbb7a drm: bridge: dw_hdmi: only trigger hotplug event on link change
    dfbed8c92eb8 udmabuf: Set ubuf->sg = NULL if the creation of sg table fails
    a47d92c74b1e drm/amd/display: fix overflow on MIN_I64 definition
    a29f7427041a gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()
    5ff7bec678ca drm/komeda: Fix handling of atomic commits in the atomic_commit_tail hook
    ca163e389f0a drm: Prevent drm_copy_field() to attempt copying a NULL pointer
    df5ac9392648 drm: Use size_t type for len variable in drm_copy_field()
    5ab84b1596b2 drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()
    b3179865cf7e r8152: Rate limit overflow messages
    d1e894f950ad Bluetooth: L2CAP: Fix user-after-free
    124b7c773271 net: If sock is dead don't access sock's sk_wq in sk_stream_wait_memory
    5b94d48898d9 hwmon: (sht4x) do not overflow clamping operation on 32-bit platforms
    a269c3e39087 wifi: rt2x00: correctly set BBP register 86 for MT7620
    b5e6ada5a5d6 wifi: rt2x00: set SoC wmac clock register
    357c89074ae6 wifi: rt2x00: set VGC gain for both chains of MT7620
    92e2e04da567 wifi: rt2x00: set correct TX_SW_CFG1 MAC register for MT7620
    4304b8e07579 wifi: rt2x00: don't run Rt5592 IQ calibration on MT7620
    4a5eab200e43 can: bcm: check the result of can_send() in bcm_can_tx()
    3423a50fa018 Bluetooth: hci_sysfs: Fix attempting to call device_add multiple times
    3ac837cef1fb Bluetooth: L2CAP: initialize delayed works at l2cap_chan_create()
    af46b2b9b096 wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
    e33da263e965 regulator: core: Prevent integer underflow
    d58c8781c0d7 Bluetooth: btintel: Mark Intel controller to support LE_STATES quirk
    232d59eca07f wifi: brcmfmac: fix use-after-free bug in brcmf_netdev_start_xmit()
    37f15edba22d iavf: Fix race between iavf_close and iavf_reset_task
    03155680191e xfrm: Update ipcomp_scratches with NULL when freed
    716c526d666d thunderbolt: Add back Intel Falcon Ridge end-to-end flow control workaround
    b1b4144508ad wifi: ath9k: avoid uninit memory read in ath9k_htc_rx_msg()
    839f563c5dc5 x86/mce: Retrieve poison range from hardware
    1663629bc3ff tcp: annotate data-race around tcp_md5sig_pool_populated
    7b03296b4f7a openvswitch: Fix overreporting of drops in dropwatch
    ffd7a1dcae9a openvswitch: Fix double reporting of drops in dropwatch
    d449d00a8dce net: ethernet: ti: davinci_mdio: Add workaround for errata i2329
    624f03a027f2 ice: set tx_tstamps when creating new Tx rings via ethtool
    2e52d858de3a bpftool: Clear errno after libcap's checks
    75995ce1c926 wifi: brcmfmac: fix invalid address access when enabling SCAN log level
    83b94969751a NFSD: fix use-after-free on source server when doing inter-server copy
    118dc74b2bc0 NFSD: Return nfserr_serverfault if splice_ok but buf->pages have data
    066b1302f2a9 x86/entry: Work around Clang __bdos() bug
    06c56c9d5da8 ACPI: x86: Add a quirk for Dell Inspiron 14 2-in-1 for StorageD3Enable
    6733222f2cc9 ARM: decompressor: Include .data.rel.ro.local
    561490843445 thermal: intel_powerclamp: Use get_cpu() instead of smp_processor_id() to avoid crash
    139bbbd01114 powercap: intel_rapl: fix UBSAN shift-out-of-bounds issue
    a1387ae83e97 MIPS: BCM47XX: Cast memcmp() of function to (void *)
    c2790fede920 cpufreq: intel_pstate: Add Tigerlake support in no-HWP mode
    30eca146c89d ACPI: tables: FPDT: Don't call acpi_os_map_memory() on invalid phys address
    5374638222d0 ACPI: video: Add Toshiba Satellite/Portege Z830 quirk
    7ed95b080334 rcu-tasks: Convert RCU_LOCKDEP_WARN() to WARN_ONCE()
    cf38a05eb1d0 rcu: Back off upon fill_page_cache_func() allocation failure
    3e2d8b89f031 rcu: Avoid triggering strict-GP irq-work when RCU is idle
    27d3e646dd83 fs: dlm: fix race in lowcomms
    b6b87460f4eb selftest: tpm2: Add Client.__del__() to close /dev/tpm* handle
    497d736784e5 f2fs: fix to account FS_CP_DATA_IO correctly
    fb1dcc2a9e4b f2fs: fix race condition on setting FI_NO_EXTENT flag
    6ddbd411a00a ACPI: APEI: do not add task_work to kernel thread to avoid memory leak
    21f1ba52b88c thermal/drivers/qcom/tsens-v0_1: Fix MSM8939 fourth sensor hw_id
    172c8a24fc83 crypto: cavium - prevent integer overflow loading firmware
    12acfa1059ad crypto: marvell/octeontx - prevent integer overflows
    c963ce2fa05d kbuild: rpm-pkg: fix breakage when V=1 is used
    059ce6b68b76 kbuild: remove the target in signal traps when interrupted
    1e9c23db31b6 tracing/osnoise: Fix possible recursive locking in stop_per_cpu_kthreads
    84795de93e1f tracing: kprobe: Make gen test module work in arm and riscv
    867fce09aa20 tracing: kprobe: Fix kprobe event gen test module on exit
    a9990f24adfe iommu/iova: Fix module config properly
    f0cac6cc02a9 cifs: return correct error in ->calc_signature()
    1f1ab76e2515 crypto: qat - fix DMA transfer direction
    393307b99aac crypto: inside-secure - Change swab to swab32
    93538944ab0b crypto: ccp - Release dma channels before dmaengine unrgister
    779a9930f3e1 crypto: akcipher - default implementation for setting a private key
    0c7043a5b5c3 iommu/omap: Fix buffer overflow in debugfs
    046803b74d51 cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset
    771d8aa02dac crypto: hisilicon/qm - fix missing put dfx access
    9bf3ec61a246 crypto: qat - fix default value of WDT timer
    3bfc220e5ce3 hwrng: imx-rngc - Moving IRQ handler registering after imx_rngc_irq_mask_clear()
    507128a0e32d cgroup: Honor caller's cgroup NS when resolving path
    8ffe511b7de7 hwrng: arm-smccc-trng - fix NO_ENTROPY handling
    272093471305 crypto: hisilicon/zip - fix mismatch in get/set sgl_sge_nr
    e0b4ebf59834 crypto: sahara - don't sleep when in softirq
    8484023b5763 powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL
    7f536a8cb62d powerpc/kprobes: Fix null pointer reference in arch_prepare_kprobe()
    1f98f8f43541 powerpc: Fix SPE Power ISA properties for e500v1 platforms
    72c5b7110fba powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
    399afe92f640 x86/hyperv: Fix 'struct hv_enlightened_vmcs' definition
    592b302d8bf6 powerpc: Fix fallocate and fadvise64_64 compat parameter combination
    61af84b3db81 powerpc/powernv: add missing of_node_put() in opal_export_attrs()
    5be9cb6c06fa powerpc/pci_dn: Add missing of_node_put()
    5a13d3f1af1c powerpc/sysdev/fsl_msi: Add missing of_node_put()
    b0c0490b3c57 powerpc/math_emu/efp: Include module.h
    93379dc92de0 powerpc/configs: Properly enable PAPR_SCM in pseries_defconfig
    25a4fb0e1a76 mailbox: bcm-ferxrm-mailbox: Fix error check for dma_map_sg
    b8fcd9ab0f65 mailbox: mpfs: account for mbox offsets while sending
    ba2264359525 mailbox: mpfs: fix handling of the reg property
    fad007a315fe clk: ast2600: BCLK comes from EPLL
    3441076f83aa clk: ti: dra7-atl: Fix reference leak in of_dra7_atl_clk_probe
    9209e6bab75d clk: imx: scu: fix memleak on platform_device_add() fails
    bdf72f2d649b clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
    e338131e980b clk: baikal-t1: Add SATA internal ref clock buffer
    35b766027580 clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
    b2db8b2c5391 clk: baikal-t1: Fix invalid xGMAC PTP clock divider
    435a8a39c6ae clk: vc5: Fix 5P49V6901 outputs disabling when enabling FOD
    b0bc75fe6775 spmi: pmic-arb: correct duplicate APID to PPID mapping logic
    faabbb103d60 usb: mtu3: fix failed runtime suspend in host only mode
    57f66534a41a dmaengine: ioat: stop mod_timer from resurrecting deleted timer in __cleanup()
    8aa96c5bc393 clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
    2dafc5afd9d6 mfd: sm501: Add check for platform_driver_register()
    d43d93dbd8aa mfd: fsl-imx25: Fix check for platform_get_irq() errors
    b940bb3c8154 mfd: lp8788: Fix an error handling path in lp8788_irq_init() and lp8788_irq_init()
    0715005c483e mfd: lp8788: Fix an error handling path in lp8788_probe()
    aec1f073f91f mfd: fsl-imx25: Fix an error handling path in mx25_tsadc_setup_irq()
    53bfc1c3c751 mfd: intel_soc_pmic: Fix an error handling path in intel_soc_pmic_i2c_probe()
    2f921d62c236 fsi: core: Check error number after calling ida_simple_get
    041c79f6aefb RDMA/rxe: Fix resize_finish() in rxe_queue.c
    959d4ee095e9 clk: qcom: gcc-sm6115: Override default Alpha PLL regs
    8e556f557368 clk: qcom: apss-ipq6018: mark apcs_alias0_core_clk as critical
    a26b0658751b scsi: iscsi: iscsi_tcp: Fix null-ptr-deref while calling getpeername()
    e87fb1fcf88f scsi: iscsi: Run recv path from workqueue
    c2af03a7c1b5 scsi: iscsi: Add recv workqueue helpers
    d6aafc21bef1 scsi: iscsi: Rename iscsi_conn_queue_work()
    e45a1516d293 scsi: libsas: Fix use-after-free bug in smp_execute_task_sg()
    6a54f769748b serial: 8250: Fix restoring termios speed after suspend
    a5dba0933834 firmware: google: Test spinlock on panic path to avoid lockups
    60d14575d0ba slimbus: qcom-ngd-ctrl: allow compile testing without QCOM_RPROC_COMMON
    f19e5b7df545 staging: vt6655: fix some erroneous memory clean-up loops
    433c33c554d7 phy: qualcomm: call clk_disable_unprepare in the error handling
    c4293def8860 tty: serial: fsl_lpuart: disable dma rx/tx use flags in lpuart_dma_shutdown
    a91a3c2d8db8 serial: 8250: Toggle IER bits on only after irq has been set up
    6be8e565a4a6 drivers: serial: jsm: fix some leaks in probe
    1d05df7757f4 usb: gadget: function: fix dangling pnp_string in f_printer.c
    ed2c66b75280 xhci: Don't show warning for reinit on known broken suspend
    4d7d8f5cb284 IB: Set IOVA/LENGTH on IB_MR in core/uverbs layers
    e221b4f16e9e RDMA/cm: Use SLID in the work completion as the DLID in responder side
    7a37c58ee72e md/raid5: Remove unnecessary bio_put() in raid5_read_one_chunk()
    b467d9460ec2 md/raid5: Ensure stripe_fill happens on non-read IO with journal
    5d8259c9d191 md: Replace snprintf with scnprintf
    9e92d5ca5424 mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
    058833dbeb8d ata: fix ata_id_has_dipm()
    dad910a6d4a5 ata: fix ata_id_has_ncq_autosense()
    21faddeff7bf ata: fix ata_id_has_devslp()
    204cc767dcb5 ata: fix ata_id_sense_reporting_enabled() and ata_id_has_sense_reporting()
    5c75d608fad5 RDMA/siw: Fix QP destroy to wait for all references dropped.
    308cd50f174c RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.
    e58a0b9100ba RDMA/srp: Fix srp_abort()
    dc9e4ef6b072 RDMA/irdma: Align AE id codes to correct flush code and event
    84ce1a8e36bb mtd: rawnand: fsl_elbc: Fix none ECC mode
    be424a7d5374 mtd: rawnand: intel: Remove undocumented compatible string
    445395900b64 mtd: rawnand: intel: Read the chip-select line from the correct OF node
    cbbf9cca47ac phy: phy-mtk-tphy: fix the phy type setting issue
    e4be7c9495c8 phy: amlogic: phy-meson-axg-mipi-pcie-analog: Hold reference returned by of_get_parent()
    88263152ff56 mtd: devices: docg3: check the return value of devm_ioremap() in the probe
    a0e4ac698891 clk: qcom: sm6115: Select QCOM_GDSC
    aecb632674b7 dyndbg: drop EXPORTed dynamic_debug_exec_queries
    0d4421f2cb54 dyndbg: let query-modname override actual module name
    0c0d9f38b087 dyndbg: fix module.dyndbg handling
    49d85932f7d2 dyndbg: fix static_branch manipulation
    7cb9b20941e1 dmaengine: hisilicon: Add multi-thread support for a DMA channel
    b88630d9aac0 dmaengine: hisilicon: Fix CQ head update
    e84aeeafe8b3 dmaengine: hisilicon: Disable channels when unregister hisi_dma
    b94605f5cb99 fpga: prevent integer overflow in dfl_feature_ioctl_set_irq()
    11bd8bbdf8f6 misc: ocxl: fix possible refcount leak in afu_ioctl()
    c23c5e184550 RDMA/rxe: Fix the error caused by qp->sk
    f2f405af70e6 RDMA/rxe: Fix "kernel NULL pointer dereference" error
    2ea7caa96846 media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init
    23624abbc9c6 media: uvcvideo: Use entity get_cur in uvc_ctrl_set
    6c5da92103bd media: uvcvideo: Fix memory leak in uvc_gpio_parse
    4e2042f1adc7 media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()
    aeffca434426 tty: xilinx_uartps: Fix the ignore_status
    a8d772c7b853 media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
    6225501072d3 HSI: omap_ssi_port: Fix dma_map_sg error check
    691f23a8475f HSI: omap_ssi: Fix refcount leak in ssi_probe
    d6e750535b46 clk: tegra20: Fix refcount leak in tegra20_clock_init
    e7a57fb92af5 clk: tegra: Fix refcount leak in tegra114_clock_init
    417ed4432b1b clk: tegra: Fix refcount leak in tegra210_clock_init
    ca5f338ef165 clk: sprd: Hold reference returned by of_get_parent()
    49343bdf95eb clk: berlin: Add of_node_put() for of_get_parent()
    857b719bede4 clk: qoriq: Hold reference returned by of_get_parent()
    a8cbce0305b2 clk: oxnas: Hold reference returned by of_get_parent()
    e0001a565c16 clk: meson: Hold reference returned by of_get_parent()
    e900ec4c4f74 usb: common: debug: Check non-standard control requests
    c11f48764c8b RDMA/mlx5: Don't compare mkey tags in DEVX indirect mkey
    cd35ad9a7d66 iio: magnetometer: yas530: Change data type of hard_offsets to signed
    23fafc2e2cf6 iio: ABI: Fix wrong format of differential capacitance channel ABI.
    8169da520e8f iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
    504e8807fe5f iio: inkern: only release the device node when done with it
    b0d4fcc3ecb8 iio: adc: at91-sama5d2_adc: disable/prepare buffer on suspend/resume
    5db9b840ac88 iio: adc: at91-sama5d2_adc: lock around oversampling and sample freq
    c5c63736d2a1 iio: adc: at91-sama5d2_adc: check return status for pressure and touch
    5f1654a0e520 iio: adc: at91-sama5d2_adc: fix AT91_SAMA5D2_MR_TRACKTIM_MAX
    017cf3b0a628 ARM: dts: exynos: fix polarity of VBUS GPIO of Origen
    6c93b683ceda arm64: ftrace: fix module PLTs with mcount
    bbf64eb10273 ext4: don't run ext4lazyinit for read-only filesystems
    7a00a2320752 ARM: Drop CMDLINE_* dependency on ATAGS
    2af04fe87ea5 ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    2134214bc403 arm64: dts: ti: k3-j7200: fix main pinmux range
    7247a1d7a46a soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA
    4f7892f24281 ia64: export memory_add_physaddr_to_nid to fix cxl build error
    2ef01657b2d6 ARM: dts: kirkwood: lsxl: remove first ethernet port
    bf7caa3c5caf ARM: dts: kirkwood: lsxl: fix serial line
    42ce4c73a468 ARM: dts: turris-omnia: Fix mpp26 pin name and comment
    96d8f2b43e72 ARM: dts: imx6qdl-kontron-samx6i: hook up DDC i2c bus
    08ada28d1def soc: qcom: smem_state: Add refcounting for the 'state->of_node'
    96e0028debdd soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
    a29b6eb959bd locks: fix TOCTOU race when granting write lease
    7e053784c4c7 memory: of: Fix refcount leak bug in of_lpddr3_get_ddr_timings()
    2680690f9ce4 memory: of: Fix refcount leak bug in of_get_ddr_timings()
    566b143aa511 memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
    10df962300c2 ALSA: hda/hdmi: Don't skip notification handling during PM operation
    cc756b79a5c9 ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
    f9cb3bd55726 ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
    b7dda65fa875 ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
    b2bc9fc56a3e ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
    3c3ef19a8870 mmc: wmt-sdmmc: Fix an error handling path in wmt_mci_probe()
    b14dc262274b ALSA: dmaengine: increment buffer pointer atomically
    f5f1f5ee5048 ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
    f910aca07625 ASoC: codecs: tx-macro: fix kcontrol put
    b47a37ad4a44 drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()
    bdf54d4b0074 drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
    635e7700c5b4 drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
    4f859884673d ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API
    64545b8a9690 mmc: au1xmmc: Fix an error handling path in au1xmmc_probe()
    3ba3814c00a4 drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()
    a5ce83e85d79 drm/omap: dss: Fix refcount leak bugs
    f5f599daa0bc drm/bochs: fix blanking
    928ac9fc1ace ALSA: hda: beep: Simplify keep-power-at-enable behavior
    fbb88a7c84c1 ASoC: rsnd: Add check for rsnd_mod_power_on
    4610e7a4111f drm/bridge: megachips: Fix a null pointer dereference bug
    079c550c57ff drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_runtime_resume()
    c12daccc9017 platform/chrome: cros_ec_typec: Correct alt mode index
    c317d2b8a430 platform/x86: msi-laptop: Fix resource cleanup
    0e21d41bc768 platform/x86: msi-laptop: Fix old-ec check for backlight registering
    6bc81c1b6313 ASoC: tas2764: Fix mute/unmute
    e644497c5361 ASoC: tas2764: Drop conflicting set_bias_level power setting
    35bd912ed6c0 ASoC: tas2764: Allow mono streams
    fd1d3b265784 platform/chrome: fix memory corruption in ioctl
    27bb672c0437 platform/chrome: fix double-free in chromeos_laptop_prepare()
    57dfb855bc9e ASoC: mt6359: fix tests for platform_get_irq() failure
    8a475a7732a5 drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()
    56d2233cf573 drm/dp_mst: fix drm_dp_dpcd_read return value checks
    fe6eb3d0c874 drm/bridge: parade-ps8640: Fix regulator supply order
    60630834fad3 drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
    26c1b4cfe56f drm/mipi-dsi: Detach devices when removing the host
    652042135e08 drm/bridge: Avoid uninitialized variable warning
    f369fb4deed7 drm: bridge: adv7511: unregister cec i2c device after cec adapter
    20609125b8bd drm: bridge: adv7511: fix CEC power down control register offset
    a624161ebe0c net: mvpp2: fix mvpp2 debugfs leak
    7aef5082c56e once: add DO_ONCE_SLOW() for sleepable contexts
    77bfd26cbb61 net/ieee802154: reject zero-sized raw_sendmsg()
    dc4e9cd6d6a6 net: wwan: iosm: Call mutex_init before locking it
    0b6516a4e3eb bnx2x: fix potential memory leak in bnx2x_tpa_stop()
    30bfa5aa7228 net: rds: don't hold sock lock when cancelling work from rds_tcp_reset_callbacks()
    f828333ca90f hwmon: (pmbus/mp2888) Fix sensors readouts for MPS Multi-phase mp2888 controller
    c91b922b4170 spi: Ensure that sg_table won't be used after being freed
    49d429760df7 tcp: fix tcp_cwnd_validate() to not forget is_cwnd_limited
    19d636b663e0 sctp: handle the error returned from sctp_auth_asoc_init_active_key
    7bfa18b05f38 mISDN: fix use-after-free bugs in l1oip timer handlers
    6f1991a940b9 eth: alx: take rtnl_lock on resume
    e28a4e7f0296 vhost/vsock: Use kvmalloc/kvfree for larger packets.
    5dbdd690ed83 wifi: rtl8xxxu: Fix AIFS written to REG_EDCA_*_PARAM
    432eecffcf1b spi: s3c64xx: Fix large transfers with DMA
    1454a26cb1ab netfilter: nft_fib: Fix for rpath check with VRF devices
    7d98b26684cb xfrm: Reinject transport-mode packets through workqueue
    397e880acf44 Bluetooth: hci_core: Fix not handling link timeouts propertly
    1331d3e1f9b5 i2c: mlxbf: support lock mechanism
    9233ab8198d8 skmsg: Schedule psock work if the cached skb exists on the psock
    44f1dc2e821d spi/omap100k:Fix PM disable depth imbalance in omap1_spi100k_probe
    daa5239ea49f spi: dw: Fix PM disable depth imbalance in dw_spi_bt1_probe
    6b941151865e x86/cpu: Include the header of init_ia32_feat_ctl()'s prototype
    3c27a1380798 x86/microcode/AMD: Track patch allocation size explicitly
    3e2b805a68ab wifi: ath11k: fix number of VHT beamformee spatial streams
    5a6827cdc258 netfilter: conntrack: revisit the gc initial rescheduling bias
    9c39ca418ba3 netfilter: conntrack: fix the gc rescheduling delay
    b8917dce2134 Bluetooth: hci_{ldisc,serdev}: check percpu_init_rwsem() failure
    c087c35292ea bpf: Ensure correct locking around vulnerable function find_vpid()
    a0f15af17b7d net: fs_enet: Fix wrong check in do_pd_setup
    ee7c5e814fb2 Bluetooth: RFCOMM: Fix possible deadlock on socket shutdown/release
    57d4f2f8a67b wifi: mt76: mt7915: do not check state before configuring implicit beamform
    dea9093f24d6 wifi: mt76: mt7615: add mt7615_mutex_acquire/release in mt7615_sta_set_decap_offload
    817e8b75ae06 wifi: mt76: sdio: fix transmitting packet hangs
    5dc095a37fbd wifi: rtl8xxxu: Remove copy-paste leftover in gen2_update_rate_mask
    9973f78c19f3 wifi: rtl8xxxu: gen2: Fix mistake in path B IQ calibration
    5d9222c68022 bpf: btf: fix truncated last_member_type_id in btf_struct_resolve
    4ce47c5545d2 spi: meson-spicc: do not rely on busy flag in pow2 clk ops
    36c484bac9ed wifi: rtl8xxxu: Fix skb misuse in TX queue selection
    fefd2269e681 spi: qup: add missing clk_disable_unprepare on error in spi_qup_pm_resume_runtime()
    e22f6499183d spi: qup: add missing clk_disable_unprepare on error in spi_qup_resume()
    37005a948677 selftests/xsk: Avoid use-after-free on ctx
    69995c64e50e wifi: rtw88: add missing destroy_workqueue() on error path in rtw_core_init()
    6f9484e969cb wifi: rtl8xxxu: tighten bounds checking in rtl8xxxu_read_efuse()
    d091771f511d Bluetooth: btusb: mediatek: fix WMT failure during runtime suspend
    f91e25cfa553 bpf: Use this_cpu_{inc|dec|inc_return} for bpf_task_storage_busy
    0e1342510490 bpf: Propagate error from htab_lock_bucket() to userspace
    0b00c6130c1a bpf: Disable preemption when increasing per-cpu map_locked
    68ab7690332a xsk: Fix backpressure mechanism on Tx
    0559a6d96a99 x86/resctrl: Fix to restore to original value when re-enabling hardware prefetch register
    e962e458bf96 spi: mt7621: Fix an error message in mt7621_spi_probe()
    0a16bbc8b030 bpftool: Fix a wrong type cast in btf_dumper_int
    6e8eadfa9bb1 wifi: mac80211: allow bw change during channel switch in mesh
    4ed5155043c9 bpf: Fix reference state management for synchronous callbacks
    3d0a101e7139 leds: lm3601x: Don't use mutex after it was destroyed
    54a3201f3c1f wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
    714536ff6f6c wifi: rtlwifi: 8192de: correct checking of IQK reload
    80a474502ef5 NFSD: Fix handling of oversized NFSv4 COMPOUND requests
    dc7f225090c2 NFSD: Protect against send buffer overflow in NFSv2 READDIR
    cedaf73c8bda SUNRPC: Fix svcxdr_init_encode's buflen calculation
    6b55707ff8b2 SUNRPC: Fix svcxdr_init_decode's end-of-buffer calculation
    aed881630557 nfsd: Fix a memory leak in an error handling path
    5c4b234c44cb objtool: Preserve special st_shndx indexes in elf_update_symbol
    425a2a9469d2 ARM: 9247/1: mm: set readonly for MT_MEMORY_RO with ARM_LPAE
    2647b20e043c ARM: 9244/1: dump: Fix wrong pg_level in walk_pmd()
    93296e7ab774 MIPS: SGI-IP27: Fix platform-device leak in bridge_platform_create()
    993b13abde17 MIPS: SGI-IP27: Free some unused memory
    959855093f94 sh: machvec: Use char[] for section boundaries
    91fafd22f852 thermal: cpufreq_cooling: Check the policy first in cpufreq_cooling_register()
    81fb3ee298d5 ntfs3: rework xattr handlers and switch to POSIX ACL VFS helpers
    33d478eee2b5 userfaultfd: open userfaultfds with O_RDONLY
    10918ebecdc9 ima: fix blocking of security.ima xattrs of unsupported algorithms
    b7af9b8be891 selinux: use "grep -E" instead of "egrep"
    73b8218ef4aa smb3: must initialize two ACL struct fields to zero
    adf428ae46be drm/amd/display: Fix vblank refcount in vrr transition
    60a517452560 drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
    01bd3eaa5371 drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
    20018a252f19 drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
    861f085f81fd drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
    446d40e2a8cb drm/nouveau/kms/nv140-: Disable interlacing
    4dab0d27a421 staging: greybus: audio_helper: remove unused and wrong debugfs usage
    28eb4bdb23e2 KVM: VMX: Drop bits 31:16 when shoving exception error code into VMCS
    4f7b1e7d0f36 KVM: nVMX: Don't propagate vmcs12's PERF_GLOBAL_CTRL settings to vmcs02
    be1a6a61f1b3 KVM: nVMX: Unconditionally purge queued/injected events on nested "exit"
    379de01906eb KVM: x86/emulator: Fix handing of POP SS to correctly set interruptibility
    e3e5baa36879 blk-wbt: call rq_qos_add() after wb_normal is initialized
    e8e0a6f4b8a2 media: cedrus: Fix endless loop in cedrus_h265_skip_bits()
    b76fac61c33f media: cedrus: Set the platform driver data earlier
    b19254eadab3 efi: libstub: drop pointless get_memory_map() call
    5cda4a11b490 thunderbolt: Explicitly enable lane adapter hotplug events at startup
    d9c79fbcbdb6 tracing: Fix reading strings from synthetic events
    b9ab154d22b8 tracing: Add "(fault)" name injection to kernel probes
    8ae88c4842c2 tracing: Move duplicate code of trace_kprobe/eprobe.c into header
    84f4be2093e1 tracing: Add ioctl() to force ring buffer waiters to wake up
    32eb54a986f4 tracing: Wake up waiters when tracing is disabled
    2475de2bc0de tracing: Wake up ring buffer waiters on closing of the file
    48272aa48d80 tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
    d4ab9bc5f56e ring-buffer: Fix race between reset page and reading page
    be60f698c276 ring-buffer: Add ring_buffer_wake_waiters()
    5201dd81aef7 ring-buffer: Check pending waiters when doing wake ups as well
    bc6d4e9d6484 ring-buffer: Have the shortest_full queue be the shortest not longest
    e8d116738514 ring-buffer: Allow splice to read previous partially read pages
    fb96b7489fbd ftrace: Properly unset FTRACE_HASH_FL_MOD
    31dc1727c103 livepatch: fix race between fork and KLP transition
    36997b75bbb3 ext4: update 'state->fc_regions_size' after successful memory allocation
    417b0455a0b6 ext4: fix potential memory leak in ext4_fc_record_regions()
    9b5eb368a86f ext4: fix potential memory leak in ext4_fc_record_modified_inode()
    ef1607c99136 ext4: fix miss release buffer head in ext4_fc_write_inode
    d29fa1ab4e62 ext4: fix dir corruption when ext4_dx_add_entry() fails
    d12471b41674 ext4: place buffer head allocation before handle start
    46e5f470a144 ext4: ext4_read_bh_lock() should submit IO if the buffer isn't uptodate
    1f5e643b3829 ext4: don't increase iversion counter for ea_inodes
    dd366295d1ec ext4: fix check for block being out of directory size
    4a967fe8b043 ext4: make ext4_lazyinit_thread freezable
    533c60a0b97c ext4: fix null-ptr-deref in ext4_write_info
    d8e4af8314df ext4: avoid crash when inline data creation follows DIO write
    56fcd0788f0d jbd2: add miss release buffer head in fc_do_one_pass()
    d11d2ded2939 jbd2: fix potential use-after-free in jbd2_fc_wait_bufs
    e7385c868ee0 jbd2: fix potential buffer head reference count leak
    d87fe290a533 jbd2: wake up journal waiters in FIFO order, not LIFO
    7434626c5eaa hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero
    095493833b18 hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO
    73687c53919f f2fs: fix to do sanity check on summary info
    ed854f10e6af f2fs: fix to do sanity check on destination blkaddr during recovery
    7f10357c9046 f2fs: increase the limit for reserve_root
    0035b84223de f2fs: flush pending checkpoints when freezing super
    ab4958975490 f2fs: complete checkpoints during remount
    0a408c6212c1 btrfs: set generation before calling btrfs_clean_tree_block in btrfs_init_new_buffer
    4b996a3014ef btrfs: fix race between quota enable and quota rescan ioctl
    0d9423034308 fs: record I_DIRTY_TIME even if inode already has I_DIRTY_INODE
    95a520b591c9 ksmbd: Fix user namespace mapping
    a19f316406ea ksmbd: Fix wrong return value and message length check in smb2_ioctl()
    39b685562825 ksmbd: fix endless loop when encryption for response fails
    2b0897e33682 fbdev: smscufx: Fix use-after-free in ufx_ops_open()
    aa7b2c927e4e pinctrl: rockchip: add pinmux_ops.gpio_set_direction callback
    5d97378b3626 gpio: rockchip: request GPIO mux to pinctrl when setting direction
    e0b1c16fdadd scsi: qedf: Populate sysfs attributes for vport
    1d567179f277 slimbus: qcom-ngd: cleanup in probe error path
    fa0aab2e45f0 slimbus: qcom-ngd: use correct error in message of pdr_add_lookup() failure
    ba2159df1806 powerpc/boot: Explicitly disable usage of SPE instructions
    9df2a9cdad5b powercap: intel_rapl: Use standard Energy Unit for SPR Dram RAPL domain
    75d9de25a6f8 NFSD: Protect against send buffer overflow in NFSv3 READ
    2be9331ca606 NFSD: Protect against send buffer overflow in NFSv2 READ
    071a076fd1b7 NFSD: Protect against send buffer overflow in NFSv3 READDIR
    209a94c5192b serial: 8250: Request full 16550A feature probing for OxSemi PCIe devices
    63a3d75cf18c serial: 8250: Let drivers request full 16550A feature probing
    26e5c79e673c PCI: Sanitise firmware BAR assignments behind a PCI-PCI bridge
    7c16d0a4e6a4 xen/gntdev: Accommodate VMA splitting
    1cb73704cb47 xen/gntdev: Prevent leaking grants
    43bed0a13a5c mm/mmap: undo ->mmap() when arch_validate_flags() fails
    2b0072d33eb6 mm/damon: validate if the pmd entry is present before accessing
    91c4eb16e804 arm64: errata: Add Cortex-A55 to the repeat tlbi list
    fc0f921b7e6e drm/udl: Restore display mode on resume
    064093472524 drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
    fb3910436be4 drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() error
    f122bcb34f1a drm/virtio: Check whether transferred 2D BO is shmem
    a95fb5d55af0 dmaengine: mxs: use platform_driver_register
    e7a3334e83f9 Revert "drm/amdgpu: use dirty framebuffer helper"
    4bdedc3b5341 nvme-pci: set min_align_mask before calculating max_hw_sectors
    32aa0b3f0c06 nvme-multipath: fix possible hang in live ns resize with ANA access
    9391cc3a787a nvmem: core: Fix memleak in nvmem_register()
    7efe61dc6aa4 UM: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    81ab826a285d riscv: Pass -mno-relax only on lld < 15.0.0
    7780bb02a069 riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb
    c657b70e8074 riscv: Make VM_WRITE imply VM_READ
    3c3c4fa118a4 riscv: Allow PROT_WRITE-only mmap()
    af3aaee08df8 parisc: fbdev/stifb: Align graphics memory size to 4MB
    dc235db7b79a RISC-V: Make port I/O string accessors actually work
    8c487db000fd riscv: topology: fix default topology reporting
    d46c24f307fb arm64: topology: move store_cpu_topology() to shared code
    fcf0f6cbb653 regulator: qcom_rpm: Fix circular deferral regression
    78d81a8a8ce1 net: thunderbolt: Enable DMA paths only after rings are enabled
    3281e81ce90c hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
    e1ab98ec2bc9 ASoC: wcd934x: fix order of Slimbus unprepare/disable
    a2140a9922d1 ASoC: wcd9335: fix order of Slimbus unprepare/disable
    d0507b36da9f platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
    fcfeecca153d quota: Check next/prev free block number after reading from quota file
    17214cfab73b HID: multitouch: Add memory barriers
    219e4a0f9d68 fs: dlm: handle -EBUSY first in lock arg validation
    34ed22dd2860 fs: dlm: fix race between test_bit() and queue_work()
    7fa5304c4b5b i2c: designware: Fix handling of real but unexpected device interrupts
    f9effcefa8be mmc: sdhci-sprd: Fix minimum clock limit
    a4df91a88c3f can: kvaser_usb_leaf: Fix CAN state after restart
    0c28c2c0cfa2 can: kvaser_usb_leaf: Fix TX queue out of sync after restart
    b8c4f6345e0e can: kvaser_usb_leaf: Fix overread with an invalid command
    de4434d6823c can: kvaser_usb: Fix use of uninitialized completion
    354d768e315d usb: add quirks for Lenovo OneLink+ Dock
    103b459590e1 xhci: dbc: Fix memory leak in xhci_alloc_dbc()
    39f4c90b9995 iio: pressure: dps310: Reset chip after timeout
    bc493cd75466 iio: pressure: dps310: Refactor startup procedure
    5f6bfc1926bb iio: adc: ad7923: fix channel readings for some variants
    1be580ed8403 iio: ltc2497: Fix reading conversion results
    ef4018707df8 iio: dac: ad5593r: Fix i2c read protocol requirements
    60480291c1fc cifs: Fix the error length of VALIDATE_NEGOTIATE_INFO message
    0d814a2199cf cifs: destage dirty pages before re-reading them for cache=none
    15993e9a9b12 hv_netvsc: Fix race between VF offering and VF association message from host
    f9dc33f23153 io_uring/net: don't update msg_name if not provided
    a1bd289c10ac mtd: rawnand: atmel: Unmap streaming DMA mappings
    3e4d2375d154 ALSA: hda/realtek: Add Intel Reference SSID to support headset keys
    41e83faf036c ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
    c01f385c70db ALSA: hda/realtek: Correct pin configs for ASUS G533Z
    0d50e05ecc2c ALSA: hda/realtek: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
    ec439b97d983 ALSA: usb-audio: Fix NULL dererence at error path
    0672215994e2 ALSA: usb-audio: Fix potential memory leaks
    550ca3082ebd ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
    45899fae65e5 ALSA: oss: Fix potential deadlock at unregistration
    5ca155aa79e9 Revert "fs: check FMODE_LSEEK to control internal pipe splicing"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 414f7abbc5..215a14c826 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cf39c84e1a884fcd4802640d20142bb506e9d3d0"
-SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
+SRCREV_machine ?= "8cd14c788563009eeb88f1c5ffb0c0d8bad59943"
+SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.74"
+LINUX_VERSION ?= "5.15.76"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 3b85967ca2..bbbca44b76 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.74"
+LINUX_VERSION ?= "5.15.76"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "61a508a44ed255900245d81ebe11bb5916e3145c"
-SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
+SRCREV_machine ?= "f7afe3f65c15cc4d211ab30bc981493fd5b7d3a0"
+SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 99b5c054f3..f542b3cb11 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "af0268ca8969a472d1263e83b0a78f00834b700e"
-SRCREV_machine:qemuarm64 ?= "08b455a0e020e52340bde98e4942eaf43eb12554"
-SRCREV_machine:qemumips ?= "6f7b375ea6a2736168056e6133d01aaea592e696"
-SRCREV_machine:qemuppc ?= "73b9bd277094cae3d4b39b24f79f6e29b7518fc6"
-SRCREV_machine:qemuriscv64 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
-SRCREV_machine:qemuriscv32 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
-SRCREV_machine:qemux86 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
-SRCREV_machine:qemux86-64 ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
-SRCREV_machine:qemumips64 ?= "33e8f888ab9242ea807b722c0982e871edc3339f"
-SRCREV_machine ?= "f0bee94053065c7cb8eacadfdd6bf739a2042b35"
-SRCREV_meta ?= "74e1a21c730b600c344804c1bc775a6a2ee7b8e6"
+SRCREV_machine:qemuarm ?= "d7819ee61a286d4271fbb9aa8881ec6e70cdbe11"
+SRCREV_machine:qemuarm64 ?= "38180346106d8eb46aca94bf01228fc75d4b70fa"
+SRCREV_machine:qemumips ?= "d774a943b853ed0047169ce6d71249a0f8b77307"
+SRCREV_machine:qemuppc ?= "527f0c70315df84882792510ebf2e778c5980266"
+SRCREV_machine:qemuriscv64 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
+SRCREV_machine:qemuriscv32 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
+SRCREV_machine:qemux86 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
+SRCREV_machine:qemux86-64 ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
+SRCREV_machine:qemumips64 ?= "980c0d78ca192b2d0e63753ff6c5daba7b9e37de"
+SRCREV_machine ?= "d2f773f779186759d9b9a6c403fd8d533a0bff6c"
+SRCREV_meta ?= "a120c990509eccdaa613b264a4f6c187277548df"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a3f2f5ac9d61e973e383f17a95cf2aa384e2d0c4"
+SRCREV_machine:class-devupstream ?= "4f5365f77018349d64386b202b37e8b737236556"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.74"
+LINUX_VERSION ?= "5.15.76"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


