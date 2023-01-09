Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEF8C678D5
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:24 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.59789.1673224752473637853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gtyqOP87;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id d13so5201469qvj.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZD1/sQF/11KAQcaPp+Wrmfuu1l1KwDrwwJy03ow3EDQ=;
        b=gtyqOP87myTuc1g2idRa6uaERLMgq1F3JRcHMko3yrkO8hVmfZvPSbaJwiA7W9xBay
         GQYbQOkIWoWFry3XZlJiJwK+olE7cPasFGsb//p3VQ/z1i+tyvhDtDbHmjD2kUu7iHhU
         Evrj5y4q8tVHRAEXc2IZfb1RqSN43sViQgdI4ZJI19vkyEecufNfczMOQu3JVJuvLGAQ
         W4T6yvu8fEY4GC3+4ct3a/7OIE24M6its6XZdDVXGSYmUyYn/EgsuAgRcnOswK2/fNRR
         q64+v+y6rwIR4KLho4nNFrDat8BjNOdwDlyjclRcB1dD5UphIkW2fQocaxHTSLQv1+8g
         W2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZD1/sQF/11KAQcaPp+Wrmfuu1l1KwDrwwJy03ow3EDQ=;
        b=AjLm/0ER4YJIKKKgjFA6i5fioZYLEP1qVwFQaFNRN2RJ3htc/sNmhFg0Iclw6/K1YF
         SFu+PDYQ6XVZwqgl6eABXVzXnWSAI0xMwXjfhk6CNiYP8qHKB4JT/nnmMh1LW9dzNVdv
         GQYtANZxOqkFdW5gK4KQwW1orW0XQoQHMVXlKAE5ltl3cG6EKW9xXpIm/4LeJ88mdxZV
         FVf7BcHQ1mTvw3eWI41TZE3XYJDKIa12MwBENj/9ESH6yHrhpBBLqSMVqsJB2zM6TQ5W
         SxA5+11jE4STNkN623wSdzQrHBReNTxrx3naIMnzBGSITvum5Bb/IyQxQukgpC5TFOyy
         HATA==
X-Gm-Message-State: AFqh2krzJkf6C2YVyYjFxhWq7qROs+/ceWYD1pgElIDyJID+EeTVc9Q8
	vRHVWaxhTmB6bIkdeTsVuF+MNen7qhUaaw==
X-Google-Smtp-Source: AMrXdXvirHbFpli3AF/B/vBBwbhtLx6OSTRuoBbaAdtrE9JXwGvRE9pPp8IU/Qs0DZKJSkdRrYbZnQ==
X-Received: by 2002:a0c:e107:0:b0:532:23a5:8271 with SMTP id w7-20020a0ce107000000b0053223a58271mr9944517qvk.8.1673224757951;
        Sun, 08 Jan 2023 16:39:17 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] linux-yocto/6.1: update to v6.1.3
Date: Sun,  8 Jan 2023 19:39:00 -0500
Message-Id: <38b8c1d7276d234953eb26d0c030009d1454ed56.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175654

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4adc0fbe03a6 Linux 6.1.3
    6a0ef7326e1e kcsan: Instrument memcpy/memset/memmove with newer Clang
    c9ded831e255 SUNRPC: Don't leak netobj memory when gss_read_proxy_verf() fails
    e60fa800a32a tpm: tpm_tis: Add the missed acpi_put_table() to fix memory leak
    b0785edaf649 tpm: tpm_crb: Add the missed acpi_put_table() to fix memory leak
    bf31e3f8077a tpm: acpi: Call acpi_put_table() to fix memory leak
    ba2e7d07dd06 mmc: vub300: fix warning - do not call blocking ops when !TASK_RUNNING
    a35b4bcb4389 block: Do not reread partition table on exclusively open device
    01bb48573069 f2fs: allow to read node block after shutdown
    6028ec01c4f7 f2fs: should put a page when checking the summary info
    b3b3212725ed mm, compaction: fix fast_isolate_around() to stay within boundaries
    97ce99984be1 md: fix a crash in mempool_free
    e9d055b8dfca mfd: mt6360: Add bounds checking in Regmap read/write call-backs
    784a4f995ee2 pnode: terminate at peers of source
    f9aafff5448b ALSA: hda/hdmi: Static PCM mapping again with AMD HDMI codecs
    389d34c2a8b5 ALSA: line6: fix stack overflow in line6_midi_transmit
    e58d1d2eb31b ALSA: line6: correct midi status byte when receiving data from podxt
    bc2e0c5bb97c ovl: update ->f_iocb_flags when ovl_change_flags() modifies ->f_flags
    d84a696c86ac ovl: Use ovl mounter's fsuid and fsgid in ovl_link()
    703fd753a0ba binfmt: Fix error return code in load_elf_fdpic_binary()
    e6d180a35bc0 ACPI: x86: s2idle: Stop using AMD specific codepath for Rembrandt+
    577821f756cf ACPI: x86: s2idle: Force AMD GUID/_REV 2 on HP Elitebook 865
    0478b94c6f91 hfsplus: fix bug causing custom uid and gid being unable to be assigned with mount
    23ac2a31c54f pstore/zone: Use GFP_ATOMIC to allocate zone buffer
    5c3a4cdc5363 pstore: Properly assign mem_type property
    2cec280c4915 kmsan: include linux/vmalloc.h
    dace33a1896e kmsan: export kmsan_handle_urb
    0ce4cc6d269d mm/mempolicy: fix memory leak in set_mempolicy_home_node system call
    4d528dab403b mm, mremap: fix mremap() expanding vma with addr inside vma
    97e14ae08204 rtmutex: Add acquire semantics for rtmutex lock acquisition slow path
    09727bc32f67 futex: Fix futex_waitv() hrtimer debug object leak on kcalloc error
    c86c5cf67f38 HID: plantronics: Additional PIDs for double volume key presses quirk
    79f9b467b8b5 HID: multitouch: fix Asus ExpertBook P2 P2451FA trackpoint
    d465fa2a9add kprobes: kretprobe events missing on 2-core KVM guest
    650b69b17cfd NFSD: fix use-after-free in __nfs42_ssc_open()
    ba50fee6b41b rtc: msc313: Fix function prototype mismatch in msc313_rtc_probe()
    482d990a5dd1 powerpc/rtas: avoid scheduling in rtas_os_term()
    464d10e8d797 powerpc/rtas: avoid device tree lookups in rtas_os_term()
    85cc8a187f2d iommu/mediatek: Fix crash on isr after kexec()
    fcee8a2d4db4 objtool: Fix SEGFAULT
    6d076293e5bf fs/ntfs3: Fix slab-out-of-bounds in r_page
    4d744cee4ca1 fs/ntfs3: Delete duplicate condition in ntfs_read_mft()
    fd8aa71b6571 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()
    590a6943a1d1 fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()
    d6379ce24296 fs/ntfs3: Validate index root when initialize NTFS security
    fe5c3915c373 phy: sun4i-usb: Add support for the H616 USB PHY
    1eacd1fd41b7 phy: sun4i-usb: Introduce port2 SIDDQ quirk
    0da27d8efcdb soundwire: dmi-quirks: add quirk variant for LAPBC710 NUC15
    d34485d40b6a fs/ntfs3: Fix slab-out-of-bounds read in run_unpack
    2f041a19f4eb fs/ntfs3: Validate resident attribute name
    3f6f75e8863f fs/ntfs3: Validate buffer length while parsing index
    b343c40bb7ff fs/ntfs3: Validate attribute name offset
    a7b23037b38b fs/ntfs3: Add null pointer check for inode operations
    2600c80ea7b3 fs/ntfs3: Fix memory leak on ntfs_fill_super() error path
    1621734cd304 fs/ntfs3: Add null pointer check to attr_load_runs_vcn
    9173b89c16a6 fs/ntfs3: Validate data run offset
    0bb9f93ba63a fs/ntfs3: Add overflow check for attribute size
    db91a9c59162 fs/ntfs3: Validate BOOT record_size
    2df487537c77 nvmet: don't defer passthrough commands with trivial effects to the workqueue
    a574e81b37c0 nvme: fix the NVME_CMD_EFFECTS_CSE_MASK definition
    aa9732dae4bc ata: ahci: Fix PCS quirk application for suspend
    1ed959fef5b1 block, bfq: fix uaf for bfqq in bfq_exit_icq_bfqq
    5fe70f9683f8 ACPI: video: Fix Apple GMUX backlight detection
    ba074330a487 ACPI: resource: Add Asus ExpertBook B2502 to Asus quirks
    33b7f0ef4aaf ACPI: resource: do IRQ override on Lenovo 14ALC7
    ee8ec50b9269 ACPI: resource: do IRQ override on XMG Core 15
    d1136b10944e nvme-pci: fix page size checks
    b1814724e0d7 nvme-pci: fix mempool alloc size
    a72f318c704e nvme-pci: fix doorbell buffer value endianness
    ff46a46b7a30 io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups
    3b2728881dcd eventfd: provide a eventfd_signal_mask() helper
    717ed90a6614 eventpoll: add EPOLL_URING_WAKE poll wakeup flag
    d6a980a0da6c Linux 6.1.2
    5f3d8993e095 pwm: tegra: Fix 32 bit build
    70c6f7025014 mfd: qcom_rpm: Use devm_of_platform_populate() to simplify code
    5c692f1ed39d drm/amd/display: revert Disable DRR actions during state commit
    e970e4ee3fc2 media: dvbdev: fix refcnt bug
    539479d00c51 media: dvbdev: fix build warning due to comments
    882056ef3384 net: stmmac: fix errno when create_singlethread_workqueue() fails
    69c2ad94fd0b io_uring: remove iopoll spinlock
    9b5d3f21f1ab io_uring: protect cq_timeouts with timeout_lock
    f9ef51a7055c io_uring/net: fix cleanup after recycle
    b87006265a16 io_uring/net: ensure compat import handlers clear free_iov
    e2c22a38fe29 io_uring: improve io_double_lock_ctx fail handling
    f6a5cada4ff6 io_uring: dont remove file from msg_ring reqs
    16225abb3cbc io_uring: add completion locking for iopoll
    3a6ee45e3ceb io_uring/net: introduce IORING_SEND_ZC_REPORT_USAGE flag
    215f9437dda0 blk-iolatency: Fix memory leak on add_disk() failures
    05382ed9142c scsi: qla2xxx: Fix crash when I/O abort times out
    5cfb9a60ed2d mm/gup: disallow FOLL_FORCE|FOLL_WRITE on hugetlb mappings
    1baf3370e2dc btrfs: do not BUG_ON() on ENOMEM when dropping extent items for a range
    ac551b1f500b ovl: fix use inode directly in rcu-walk mode
    a609bfc1e644 fbdev: fbcon: release buffer when fbcon_do_set_font() failed
    9c9e8be758c6 maple_tree: fix mas_spanning_rebalance() on insufficient data
    8034a1ad67b8 test_maple_tree: add test for mas_spanning_rebalance() on insufficient data
    b7334223cc7e gcov: add support for checksum field
    55b3c66a0d44 floppy: Fix memory leak in do_floppy_init()
    d01f65ac191e spi: fsl_spi: Don't change speed while chipselect is active
    9e977e2642a1 regulator: core: fix deadlock on regulator enable
    1665c3aa251f iio: addac: ad74413r: fix integer promotion bug in ad74413_get_input_current_offset()
    d04481ee5e15 iio: adc128s052: add proper .data members in adc128_of_match table
    49cfd1f61f44 iio: adc: ad_sigma_delta: do not use internal iio_dev lock
    a154b1c139fb iio: fix memory leak in iio_device_register_eventset()
    02ed209aa6f1 reiserfs: Add missing calls to reiserfs_security_free()
    21ca0bfa11bb security: Restrict CONFIG_ZERO_CALL_USED_REGS to gcc or clang > 15.0.6
    967fc34f297e 9p: set req refcount to zero to avoid uninitialized usage
    1f572877e0ea loop: Fix the max_loop commandline argument treatment when it is set to 0
    24117ea4303c HID: mcp2221: don't connect hidraw
    608c6aed7136 HID: wacom: Ensure bootloader PID is usable in hidraw mode
    c3c115368ef9 xhci: Prevent infinite loop in transaction errors recovery for streams
    2f3b51189f7a usb: dwc3: qcom: Fix memory leak in dwc3_qcom_interconnect_init
    2fd6ad7bc560 usb: dwc3: core: defer probe on ulpi_read_id timeout
    d2837c6a1dbc usb: dwc3: Fix race between dwc3_set_mode and __dwc3_set_mode
    1ba53c9c7995 clk: imx: imx8mp: add shared clk gate for usb suspend clk
    7579645760a4 dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
    1a77a5bfe821 arm64: dts: qcom: sm8250: fix USB-DP PHY registers
    299f141f90cd arm64: dts: qcom: sm6350: fix USB-DP PHY registers
    c8e746384488 usb: xhci-mtk: fix leakage of shared hcd when fail to set wakeup irq
    dfbbc47d8672 usb: cdnsp: fix lack of ZLP for ep0
    5b7c3061067e HID: logitech-hidpp: Guard FF init code against non-USB devices
    d95d83041b87 ALSA: hda/hdmi: Add HP Device 0x8711 to force connect list
    05d30f4b6cbe ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
    80202ef4f7cc ALSA: usb-audio: add the quirk for KT0206 device
    67fd112b4b04 ALSA: usb-audio: Workaround for XRUN at prepare
    b669bd94a1c8 dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
    2ca347287d3f dt-bindings: input: iqs7222: Correct minimum slider size
    78e01a98860e dt-bindings: input: iqs7222: Reduce 'linux,code' to optional
    c8ab62f13d66 Input: iqs7222 - add support for IQS7222A v1.13+
    fa25c90ee9a7 Input: iqs7222 - report malformed properties
    201d1baa9a45 Input: iqs7222 - drop unused device node references
    26e69e719a2f ima: Simplify ima_lsm_copy_rule
    475add46170d pstore: Make sure CONFIG_PSTORE_PMSG selects CONFIG_RT_MUTEXES
    810f2cfdfe4e cfi: Fix CFI failure with KASAN
    b4a59fd2e50b afs: Fix lost servers_outstanding count
    6c7b9d12578d perf test: Fix "all PMU test" to skip parametrized events
    a7a2d258101d MIPS: ralink: mt7621: avoid to init common ralink reset controller
    59871742b481 perf probe: Check -v and -q options in the right place
    5d098b5080cb perf tools: Make quiet mode consistent between tools
    01c4004e40b6 perf debug: Set debug_peo_args and redirect_to_stderr variable to correct values in perf_quiet_option()
    86777de67a85 drm/amd/pm: avoid large variable on kernel stack
    e84276c8dd88 pstore: Switch pmsg_lock to an rt_mutex to avoid priority inversion
    d7d99f1a0af0 lkdtm: cfi: Make PAC test work with GCC 7 and 8
    2c5e64f0a8d3 LoadPin: Ignore the "contents" argument of the LSM hooks
    2d57269cabeb drm/i915/display: Don't disable DDI/Transcoder when setting phy test pattern
    7ed4007347b5 ASoC: rt5670: Remove unbalanced pm_runtime_put()
    0fe3a0cd2699 ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in rk_spdif_runtime_resume()
    6df3ccb6aff0 ASoC: wm8994: Fix potential deadlock
    f64bb48f27fb ALSA: hda/hdmi: fix stream-id config keep-alive for rt suspend
    b4b2c4305cf4 ALSA: hda/hdmi: set default audio parameters for KAE silent-stream
    1cc133bee40f ALSA: hda/hdmi: fix i915 silent stream programming flow
    156b0c19c1a4 ASoC: mediatek: mt8183: fix refcount leak in mt8183_mt6358_ts3a227_max98357_dev_probe()
    bebbba710321 ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()
    4cc8431ec77a ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
    a22cfbf78a87 ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
    18a548fdecca ASoC: Intel: Skylake: Fix driver hang during shutdown
    390a1a98288a ASoC: sof_es8336: fix possible use-after-free in sof_es8336_remove()
    48c509f3f121 hwmon: (jc42) Fix missing unlock on error in jc42_write()
    0cd303aad220 orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
    224094902941 orangefs: Fix kmemleak in orangefs_sysfs_init()
    19be31668552 orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
    3ecdca49ca49 scsi: target: iscsi: Fix a race condition between login_work and the login thread
    04371a75a584 drm/sti: Fix return type of sti_{dvo,hda,hdmi}_connector_mode_valid()
    23d2bed04159 drm/fsl-dcu: Fix return type of fsl_dcu_drm_connector_mode_valid()
    d1c8b86b4ab7 scsi: smartpqi: Correct device removal for multi-actuator devices
    41d8a934e2ea scsi: smartpqi: Add new controller PCI IDs
    f2207145693a hugetlbfs: fix null-ptr-deref in hugetlbfs_parse_param()
    74de6f6c8479 scsi: elx: libefc: Fix second parameter type in state callbacks
    cbb17d7087ce Revert "PCI: Clear PCI_STATUS when setting up device"
    fc521abb6ee4 crypto: hisilicon/qm - increase the memory of local variables
    fc80b877f1d0 scsi: ufs: Reduce the START STOP UNIT timeout
    39761417ea7b scsi: lpfc: Fix hard lockup when reading the rx_monitor from debugfs
    cb873c93a7ad crypto: hisilicon/hpre - fix resource leak in remove process
    65a1a20caf72 regulator: core: Fix resolve supply lookup issue
    077bff242c13 Bluetooth: Add quirk to disable MWS Transport Configuration
    9c89dcd53c64 Bluetooth: Add quirk to disable extended scanning
    619523c1ab53 Bluetooth: hci_bcm: Add CYW4373A0 support
    e070ef957b13 ice: synchronize the misc IRQ when tearing down Tx tracker
    b0f25ca1ff9b regulator: core: Use different devices for resource allocation and DT lookup
    f4731395d6db clk: st: Fix memory leak in st_of_quadfs_setup()
    92b0888398e4 media: si470x: Fix use-after-free in si470x_int_in_callback()
    43e5c20a8b44 mmc: sdhci-tegra: Issue CMD and DAT resets together
    11ca98a1ed04 mmc: renesas_sdhi: better reset from HS400 mode
    63604e820f15 mmc: renesas_sdhi: add quirk for broken register layout
    c490e8c3d500 mmc: f-sdh30: Add quirks for broken timeout clock capability
    55513864b418 nfs: fix possible null-ptr-deref when parsing param
    96521aa5bc76 selftests/bpf: Fix conflicts with built-in functions in bpf_iter_ksym
    a4fe51cd6894 hwmon: (nct6775) add ASUS CROSSHAIR VIII/TUF/ProArt B550M
    f5ac749a0b21 wifi: mt76: do not run mt76u_status_worker if the device is not running
    bc6c381df579 regulator: core: fix use_count leakage when handling boot-on
    66d2f118d7d7 libbpf: Avoid enum forward-declarations in public API in C++ mode
    ec58eae6c93a ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into DMI table
    62db9242c1ca drm/amd/display: Fix DTBCLK disable requests and SRC_SEL programming
    ec7475a20ceb drm/amd/display: Use the largest vready_offset in pipe group
    b9f8ed9b01c4 drm/amdgpu: Fix potential double free and null pointer dereference
    3759ae6600e4 ALSA: usb-audio: Add quirk for Tascam Model 12
    33e8a3f61814 blk-mq: fix possible memleak when register 'hctx' failed
    66d26ed30056 media: mediatek: vcodec: Can't set dst buffer to done when lat decode error
    93bbf2ed4281 media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
    9945d05d6693 media: dvbdev: adopts refcnt to avoid UAF
    669fb90507db media: dvb-frontends: fix leak of memory fw
    f299f97a8e29 ethtool: avoiding integer overflow in ethtool_phys_id()
    e6d276dcc920 bpf: Prevent decl_tag from being referenced in func_proto arg
    8f4fb3844a0d bpf: Fix a BTF_ID_LIST bug with CONFIG_DEBUG_INFO_BTF not set
    a866d6fe65ba drm/amd/display: Fix display corruption w/ VSR enable
    ee678b1f52f9 ppp: associate skb with a device at tx
    ba5dd4d3a339 bpf/verifier: Use kmalloc_size_roundup() to match ksize() usage
    f51617c41da1 net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full
    563e45fd5046 mrp: introduce active flags to prevent UAF when applicant uninit
    207501a98683 ipv6/sit: use DEV_STATS_INC() to avoid data-races
    9921d1b68c46 net: add atomic_long_t to net_device_stats fields
    1f116dfd114f nvme-auth: don't override ctrl keys before validation
    43a819c467a1 drm/amd/display: fix array index out of bound error in bios parser
    2ed52650a287 drm/amd/display: Workaround to increase phantom pipe vactive in pipesplit
    d26364596db8 md/raid1: stop mdx_raid1 thread when raid1 array run failed
    27e5d61a8e69 md/raid0, raid10: Don't set discard sectors for request queue
    99bef41f8e8d drivers/md/md-bitmap: check the return value of md_bitmap_get_counter()
    302c0a8ed3bc drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()
    a29f8af3e45f drm/sti: Use drm_mode_copy()
    e398c0ad0c56 drm/rockchip: Use drm_mode_copy()
    b6ebe51e836e drm/msm: Use drm_mode_copy()
    cf0dcf0e8746 drm/amd/display: Disable DRR actions during state commit
    d5368e054eb8 drm/amd/display: Use min transition for SubVP into MPO
    cda74cdc280b s390/lcs: Fix return type of lcs_start_xmit()
    d034fa43af92 s390/netiucv: Fix return type of netiucv_tx()
    636f8534a772 s390/ctcm: Fix return type of ctc{mp,}m_tx()
    36217f676b55 drm/amdgpu: Fix type of second parameter in odn_edit_dpm_table() callback
    1cae33c8f995 drm/amdgpu: Fix type of second parameter in trans_msg() callback
    56483aecf6b2 igb: Do not free q_vector unless new one was allocated
    46675bdbbb5e HID: uclogic: Add support for XP-PEN Deco LW
    84bc0fe76182 HID: input: do not query XP-PEN Deco LW battery
    630ab215956e wifi: brcmfmac: Fix potential NULL pointer dereference in 'brcmf_c_preinit_dcmds()'
    ffb589963df1 wifi: brcmfmac: Fix potential shift-out-of-bounds in brcmf_fw_alloc_request()
    1adbbdce22aa hamradio: baycom_epp: Fix return type of baycom_send_packet()
    1e4953b826e1 net: ethernet: ti: Fix return type of netcp_ndo_start_xmit()
    f186303845a0 bpf: make sure skb->len != 0 when redirecting to a tunneling device
    ab576e2f1c5b drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
    7dccd53ec7dc qed (gcc13): use u16 for fid to be big enough
    a10e1530c424 wifi: ath11k: Fix qmi_msg_handler data structure initialization
    15e6830642e6 HID: apple: enable APPLE_ISO_TILDE_QUIRK for the keyboards of Macs with the T2 chip
    508cc67f9449 HID: apple: fix key translations where multiple quirks attempt to translate the same key
    8b3d6b029a55 blk-mq: avoid double ->queue_rq() because of early timeout
    6ec50ce315f4 drm/rockchip: use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
    22c4f8ef9c62 Revert "drm/amd/display: Limit max DSC target bpp for specific monitors"
    dd76b1c9f692 drm/edid: add a quirk for two LG monitors to get them to work on 10bpc
    2b7e54cdda3f drm/amd/display: prevent memory leak
    f97e6d4af8ea drm/amd/display: skip commit minimal transition state
    6cfa68c7d2ce bnx2: Use kmalloc_size_roundup() to match ksize() usage
    bde272c8758d openvswitch: Use kmalloc_size_roundup() to match ksize() usage
    79a124b588aa wifi: ath10k: Delay the unmapping of the buffer
    34cfc4f03274 ipmi: fix memleak when unload ipmi driver
    488c3ad53ac9 ASoC: Intel: avs: Add quirk for KBL-R RVP platform
    82f4b57e2624 ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
    9aef34e1ae35 wifi: ar5523: Fix use-after-free on ar5523_cmd() timed out
    0b7e6d681e00 wifi: ath9k: verify the expected usb_endpoints are present
    200347eb3b26 brcmfmac: return error when getting invalid max_flowrings from dongle
    35591c246995 media: imx-jpeg: Disable useless interrupt to avoid kernel panic
    da4113e63f17 drm/etnaviv: add missing quirks for GC300
    bfc9d8f27f89 hfs: fix OOB Read in __hfs_brec_find
    96d66b7074cb ACPI: x86: Add skip i2c clients quirk for Medion Lifetab S10346
    ef7cf3c92382 btrfs: do not panic if we can't allocate a prealloc extent state
    a1f90b9a333c ACPI: x86: Add skip i2c clients quirk for Lenovo Yoga Tab 3 Pro (YT3-X90F)
    87c51832b7af x86/apic: Handle no CONFIG_X86_X2APIC on systems with x2APIC enabled by BIOS
    0aac6e60c464 acct: fix potential integer overflow in encode_comp_t()
    a16731fa1b96 nilfs2: fix shift-out-of-bounds due to too large exponent of block size
    62d11ec205ef nilfs2: fix shift-out-of-bounds/overflow in nilfs_sb2_bad_offset()
    64958e12bb98 ACPI: video: Add force_native quirk for Sony Vaio VPCY11S1E
    218c556cded5 ACPI: video: Add force_vendor quirk for Sony Vaio PCG-FRV35
    c6b9b3200298 ACPI: video: Change Sony Vaio VPCEH3U1E quirk to force_native
    478412161af4 ACPI: video: Change GIGABYTE GB-BXBT-2807 quirk to force_none
    c547d7ee0455 thermal/core: Ensure that thermal device is registered in thermal_zone_get_temp
    799881db3e03 ACPICA: Fix error code path in acpi_ds_call_control_method()
    f72e95c2204f ACPI: EC: Add quirk for the HP Pavilion Gaming 15-cx0041ur
    b85f0e292f73 ACPI: processor: idle: Check acpi_fetch_acpi_dev() return value
    3d340b684dce fs: jfs: fix shift-out-of-bounds in dbDiscardAG
    ccb6bdf0b7b6 jfs: Fix fortify moan in symlink
    090bf49833c5 udf: Avoid double brelse() in udf_rename()
    67973caae78e fs: jfs: fix shift-out-of-bounds in dbAllocAG
    aaf8770746da arm64: dts: qcom: sm6350: Add apps_smmu with streamID to SDHCI 1/2 nodes
    a10ff5b8cf86 arm64: dts: qcom: sm8450: disable SDHCI SDR104/SDR50 on all boards
    a91123d4bda4 binfmt_misc: fix shift-out-of-bounds in check_special_flags
    46db95e714ac x86/hyperv: Remove unregister syscore call from Hyper-V cleanup
    16fed31153ce video: hyperv_fb: Avoid taking busy spinlock on panic path
    2e356d6de4c7 ARM: dts: aspeed: rainier,everest: Move reserved memory regions
    992469fb6ca0 arm64: make is_ttbrX_addr() noinstr-safe
    80a3e7ab477b rcu: Fix __this_cpu_read() lockdep warning in rcu_force_quiescent_state()
    1373e1b7206d net: fec: check the return value of build_skb()
    8a37cf11dc78 HID: amd_sfh: Add missing check for dma_alloc_coherent
    7b606804bbf0 mctp: Remove device type check at unregister
    96ea05df9ed5 net: dsa: microchip: remove IRQF_TRIGGER_FALLING in request_threaded_irq
    ae6fb31c0086 cifs: don't leak -ENOMEM in smb2_open_file()
    a37f6d5541b2 mctp: serial: Fix starting value for frame check sequence
    b458d349f875 net: stream: purge sk_error_queue in sk_stream_kill_queues()
    70c8fcab6bf2 myri10ge: Fix an error handling path in myri10ge_probe()
    7d88da597173 rxrpc: Fix missing unlock in rxrpc_do_sendmsg()
    233bfb28d0fa net_sched: reject TCF_EM_SIMPLE case for complex ematch module
    3fcf079958c0 mailbox: zynq-ipi: fix error handling while device_register() fails
    525e54789c2b mailbox: arm_mhuv2: Fix return value check in mhuv2_probe()
    cca61191a894 mailbox: mpfs: read the system controller's status
    331615d837f4 skbuff: Account for tail adjustment during pull operations
    ce321a1cd66b devlink: protect devlink dump by the instance lock
    2838f0736cf0 arm64: dts: mt8183: Fix Mali GPU clock
    6207862836ae soc: mediatek: pm-domains: Fix the power glitch issue
    32d5fa5bdcce openvswitch: Fix flow lookup to use unmasked key
    a02f965d828f selftests: devlink: fix the fd redirect in dummy_reporter_test
    6298cab4d80b devlink: hold region lock when flushing snapshots
    71e000446281 rtc: mxc_v2: Add missing clk_disable_unprepare()
    a7316d07f087 igc: Set Qbv start_time and end_time to end_time if not being configured in GCL
    4a3c071ff325 igc: recalculate Qbv end_time by considering cycle time
    e0d11cda89a2 igc: allow BaseTime 0 enrollment for Qbv
    3770bdee9640 igc: Add checking for basetime less than zero
    94a033ae7d77 igc: Use strict cycles for Qbv scheduling
    99dd830903d6 igc: Enhance Qbv scheduling by using first flag bit
    c13d65dca354 net: dsa: mv88e6xxx: avoid reg_lock deadlock in mv88e6xxx_setup_port()
    5944c25c67de r6040: Fix kmemleak in probe and remove
    1d033ec2d179 unix: Fix race in SOCK_SEQPACKET's unix_dgram_sendmsg()
    e491285b4d08 nfc: pn533: Clear nfc_target before being used
    306526331e7a net: enetc: avoid buffer leaks on xdp_do_redirect() failure
    a44053cf3b9c media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1
    6a1504dd36cd bpf: prevent leak of lsm program after failed attach
    146891d1af80 selftests/bpf: Select CONFIG_FUNCTION_ERROR_INJECTION
    761564d93c82 block, bfq: fix possible uaf for 'bfqq->bic'
    27f94fc22305 mISDN: hfcmulti: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    06fcc7543f30 mISDN: hfcpci: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    793f872866d6 mISDN: hfcsusb: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    b316841b6bdc bonding: do failover when high prio link up
    2d31c6ed4428 bonding: add missed __rcu annotation for curr_active_slave
    ba44c1fe8234 net: macsec: fix net device access prior to holding a lock
    d843ebd860c5 nfsd: under NFSv4.1, fix double svc_xprt_put on rpc_create failure
    f8059a2a2bdf iommu/mediatek: Fix forever loop in error handling
    8a1a38289583 rtc: pcf85063: fix pcf85063_clkout_control
    ed829c3b79b4 rtc: pic32: Move devm_rtc_allocate_device earlier in pic32_rtc_probe()
    abfa5dd91453 rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
    75b2692c90ce netfilter: flowtable: really fix NAT IPv6 offload
    7f47c91e465a mfd: pm8008: Fix return value check in pm8008_probe()
    b8d07df9ede9 mfd: qcom_rpm: Fix an error handling path in qcom_rpm_probe()
    e295ac85d618 mfd: bd957x: Fix Kconfig dependency on REGMAP_IRQ
    3bcc06c5fd48 mfd: axp20x: Do not sleep in the power off handler
    d387d36fcc54 dt-bindings: mfd: qcom,spmi-pmic: Drop PWM reg dependency
    0ab849944365 powerpc/pseries/eeh: use correct API for error log size
    bce7d8e9596d remoteproc: qcom: q6v5: Fix missing clk_disable_unprepare() in q6v5_wcss_qcs404_power_on()
    add474591d6e remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
    f09a52e44263 remoteproc: qcom_q6v5_pas: detach power domains on remove
    4458ed2d9570 remoteproc: qcom_q6v5_pas: disable wakeup on probe fail or remove
    0903a87490a9 remoteproc: qcom: q6v5: Fix potential null-ptr-deref in q6v5_wcss_init_mmio()
    ec97e9a5c2f2 remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
    b773e86fc196 RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
    c786f2ac3010 pwm: mediatek: always use bus clock for PWM on MT7622
    24cc0c9b591a pwm: mtk-disp: Fix the parameters calculated by the enabled flag of disp_pwm
    0bdadab07430 pwm: sifive: Call pwm_sifive_update_clock() while mutex is held
    9a87b1562c37 iommu/sun50i: Remove IOMMU_DOMAIN_IDENTITY
    942218128976 iommu/mediatek: Validate number of phandles associated with "mediatek,larbs"
    8412e5dd24ff iommu/mediatek: Add error path for loop of mm_dts_parse
    21f56af86583 iommu/mediatek: Use component_match_add
    44d7712267d1 iommu/mediatek: Add platform_device_put for recovering the device refcnt
    b5dd27890c6d selftests/powerpc: Fix resource leaks
    01e3641b168c powerpc/hv-gpci: Fix hv_gpci event list
    983e28974755 powerpc/83xx/mpc832x_rdb: call platform_device_put() in error case in of_fsl_spi_probe()
    5429722209ea powerpc/perf: callchain validate kernel stack pointer bounds
    e45e3aae8df8 powerpc: dts: turris1x.dts: Add channel labels for temperature sensor
    c909985dd0c0 kprobes: Fix check for probe enabled in kill_kprobe()
    03d7168103f3 powerpc/pseries: fix plpks_read_var() code for different consumers
    c156df808e11 powerpc/pseries: Return -EIO instead of -EINTR for H_ABORTED error
    1a7657adb06b powerpc/pseries: Fix the H_CALL error code in PLPKS driver
    b38e5a3c469e powerpc/pseries: fix the object owners enum value in plpks driver
    8240299519db powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
    028631dd53a0 powerpc/xmon: Fix -Wswitch-unreachable warning in bpt_cmds
    2d7b6580384e cxl: Fix refcount leak in cxl_calc_capp_routing
    fb3ef6a5af4b powerpc/52xx: Fix a resource leak in an error handling path
    65572a13163f macintosh/macio-adb: check the return value of ioremap()
    76837e7f6b30 macintosh: fix possible memory leak in macio_add_one_device()
    de7eb5500979 iommu/fsl_pamu: Fix resource leak in fsl_pamu_probe()
    b0637f4bd426 iommu/amd: Fix pci device refcount leak in ppr_notifier()
    26427454bebf iommu: Avoid races around device probe
    feca90441248 iommu/mediatek: Check return value after calling platform_get_resource()
    51a7fbc59845 rtc: pcf85063: Fix reading alarm
    6d4dacd4a91a rtc: snvs: Allow a time difference on clock register read
    421091ae0e27 rtc: cmos: Disable ACPI RTC event on removal
    93893e25d979 rtc: cmos: Rename ACPI-related functions
    fbf866b150df rtc: cmos: Eliminate forward declarations of some functions
    fd8b7f41a416 rtc: cmos: Call rtc_wake_setup() from cmos_do_probe()
    054d6b32c576 rtc: cmos: Call cmos_wake_setup() from cmos_do_probe()
    9ba808aec5a1 rtc: pcf2127: Convert to .probe_new()
    59457a0f079e rtc: class: Fix potential memleak in devm_rtc_allocate_device()
    6cb7ea142620 rtc: rzn1: Check return value in rzn1_rtc_probe
    9f2a53f143e8 dmaengine: idxd: Fix crc_val field for completion record
    f2e58e95273c fs/ntfs3: Fix slab-out-of-bounds read in ntfs_trim_fs
    cf66351484ad phy: qcom-qmp-pcie: Fix sm8450_qmp_gen4x2_pcie_pcs_tbl[] register names
    c5ca087f47de phy: qcom-qmp-pcie: Fix high latency with 4x2 PHY when ASPM is enabled
    5d39a1d9a243 phy: qcom-qmp-pcie: Support SM8450 PCIe1 PHY in EP mode
    e83821af6471 phy: qcom-qmp-pcie: support separate tables for EP mode
    d1945ec03ca6 phy: qcom-qmp-pcie: split pcs_misc init cfg for ipq8074 pcs table
    814cd5ca1c77 phy: qcom-qmp-pcie: split register tables into common and extra parts
    984f35f57f74 pwm: tegra: Ensure the clock rate is not less than needed
    49c8cc208464 pwm: tegra: Improve required rate calculation
    67edfd980731 include/uapi/linux/swab: Fix potentially missing __always_inline
    238a935ac0a7 phy: usb: Fix clock imbalance for suspend/resume
    d19f1664c843 phy: usb: Use slow clock for wake enabled suspend
    0bceef84f716 phy: usb: s2 WoL wakeup_count not incremented for USB->Eth devices
    c40b86861146 phy: qcom-qmp-usb: fix sc8280xp PCS_USB offset
    c91e4513bc18 dmaengine: idxd: Make read buffer sysfs attributes invisible for Intel IAA
    f2f10a2db278 iommu/rockchip: fix permission bits in page table entries v2
    92af3bbeb918 iommu/sun50i: Implement .iotlb_sync_map
    9b25137905c8 iommu/sun50i: Fix flush size
    3b95b7b0ddec iommu/sun50i: Fix R/W permission check
    5ad5a837c364 iommu/sun50i: Consider all fault sources for reset
    b4d8bf6c2a77 iommu/sun50i: Fix reset release
    9b5569846a34 iommu/s390: Fix duplicate domain attachments
    6792416576ff phy: qcom-qmp-usb: correct registers layout for IPQ8074 USB3 PHY
    655d02663482 phy: qcom-qmp-usb: drop start and pwrdn-ctrl abstraction
    f674ef5bf4e1 phy: qcom-qmp-usb: clean up status polling
    71c03e6a0525 phy: qcom-qmp-usb: drop power-down delay config
    71098933ea1b phy: qcom-qmp-usb: drop sc8280xp power-down delay
    c6f0977eaa19 phy: qcom-qmp-usb: clean up power-down handling
    d668d34df96a phy: qcom-qmp-pcie: fix ipq6018 initialisation
    73af0c169079 phy: qcom-qmp-pcie: fix ipq8074-gen3 initialisation
    abe9bf8c9501 phy: qcom-qmp-pcie: fix sc8180x initialisation
    0b2e4f939450 phy: qcom-qmp-pcie: replace power-down delay
    b52920f887e6 phy: qcom-qmp-pcie: drop power-down delay config
    aa51fd765fe5 remoteproc: core: Auto select rproc-virtio device id
    d53171d1d0e7 dmaengine: apple-admac: Allocate cache SRAM to channels
    cc743a1d832d dmaengine: idxd: Make max batch size attributes in sysfs invisible for Intel IAA
    0d0382b9c0d5 phy: qcom-qmp-pcie: drop bogus register update
    cd1e1735aeab phy: marvell: phy-mvebu-a3700-comphy: Reset COMPHY registers before USB 3.0 power on
    b259e31d150a fs/ntfs3: Harden against integer overflows
    95afb464c86c fs/ntfs3: Avoid UBSAN error on true_sectors_per_clst()
    2246ac03dd59 RDMA/siw: Fix pointer cast warning
    54af75ddf3c6 perf stat: Do not delay the workload with --delay
    9f4c997cd123 ftrace: Allow WITH_ARGS flavour of graph tracer with shadow call stack
    616c17a2ef99 perf off_cpu: Fix a typo in BTF tracepoint name, it should be 'btf_trace_sched_switch'
    75f7820de933 leds: is31fl319x: Fix setting current limit for is31fl319{0,1,3}
    308eef3e16fd gfs2: Partially revert gfs2_inode_lookup change
    b8131efb89d9 power: supply: fix null pointer dereferencing in power_supply_get_battery_info
    301e40552833 perf branch: Fix interpretation of branch records
    64245114c072 power: supply: bq25890: Ensure pump_express_work is cancelled on remove
    81b0e5d5aa0c power: supply: bq25890: Convert to i2c's .probe_new()
    ebf085a725b6 power: supply: bq25890: Factor out regulator registration code
    7d1e3961725e power: supply: Fix refcount leak in rk817_charger_probe
    b866e8a0b7dc power: supply: ab8500: Fix error handling in ab8500_charger_init()
    42d976bd9766 HSI: omap_ssi_core: Fix error handling in ssi_init()
    5150b76aa2eb power: supply: cw2015: Fix potential null-ptr-deref in cw_bat_probe()
    be11e0951314 power: supply: z2_battery: Fix possible memleak in z2_batt_probe()
    38d35aae1b27 perf symbol: correction while adjusting symbol
    bc05eb64a10c perf trace: Handle failure when trace point folder is missed
    27e9c2ca24ce perf trace: Use macro RAW_SYSCALL_ARGS_NUM to replace number
    01673142a679 perf trace: Return error if a system call doesn't exist
    0fd13791feb6 watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running
    a9b65ba1afcc power: supply: fix residue sysfs file in error handle route of __power_supply_register()
    fa80f145e543 HSI: omap_ssi_core: fix possible memory leak in ssi_probe()
    8159e2f8b60e HSI: omap_ssi_core: fix unbalanced pm_runtime_disable()
    8a9c05d988cc perf stat: Move common code in print_metric_headers()
    1b2a63c33106 perf stat: Use evsel__is_hybrid() more
    6c8d5578180c perf tools: Fix "kernel lock contention analysis" test by not printing warnings in quiet mode
    380304391fa7 led: qcom-lpg: Fix sleeping in atomic
    7aca1cea8fcc fbdev: uvesafb: Fixes an error handling path in uvesafb_probe()
    5976889098e6 fbdev: uvesafb: don't build on UML
    e268a5792536 fbdev: geode: don't build on UML
    4c0d613d7999 fbdev: ep93xx-fb: Add missing clk_disable_unprepare in ep93xxfb_probe()
    1fb436db9c87 fbdev: vermilion: decrease reference count in error path
    e94ae434f659 fbdev: via: Fix error in via_core_init()
    85255669ce72 fbdev: pm2fb: fix missing pci_disable_device()
    3be1f7545369 fbdev: ssd1307fb: Drop optional dependency
    ba9550952f20 thermal/drivers/qcom/lmh: Fix irq handler return value
    f7f3721c78a2 thermal/drivers/qcom/temp-alarm: Fix inaccurate warning for gen2
    6ddc86823973 thermal/of: Fix memory leak on thermal_of_zone_register() failure
    8eeda6567cc4 thermal/drivers/k3_j72xx_bandgap: Fix the debug print message
    db9d0e74a663 thermal/drivers/imx8mm_thermal: Validate temperature range
    5cba61bcd2f7 samples: vfio-mdev: Fix missing pci_disable_device() in mdpy_fb_probe()
    f9ed133381eb ksmbd: Fix resource leak in ksmbd_session_rpc_open()
    7f09fe9fc6ea tracing/hist: Fix issue of losting command info in error_log
    82d1211f673b usb: typec: wusb3801: fix fwnode refcount leak in wusb3801_probe()
    94cca9c33941 usb: storage: Add check for kcalloc
    233348a04bec i2c: ismt: Fix an out-of-bounds bug in ismt_access()
    f7a440c89b6d i2c: mux: reg: check return value after calling platform_get_resource()
    86fdf151b9b8 gpiolib: protect the GPIO device against being dropped while in use by user-space
    ac6ce3cd7a3e gpiolib: cdev: fix NULL-pointer dereferences
    60ff9bd4ffc8 vme: Fix error not catched in fake_init()
    7155f549dbca staging: rtl8192e: Fix potential use-after-free in rtllib_rx_Monitor()
    73df1172bbcc staging: rtl8192u: Fix use after free in ieee80211_rx()
    c8889afcd829 i2c: pxa-pci: fix missing pci_disable_device() on error in ce4100_i2c_probe
    ba090c6debb5 vfio/iova_bitmap: refactor iova_bitmap_set() to better handle page boundaries
    85a5660491b5 chardev: fix error handling in cdev_device_add()
    4a9f1a8b3af2 mcb: mcb-parse: fix error handing in chameleon_parse_gdd()
    0468a585710b drivers: mcb: fix resource leak in mcb_probe()
    216437dd64fc usb: gadget: f_hid: fix refcount leak on error path
    9e08b7f5fa00 usb: gadget: f_hid: fix f_hidg lifetime vs cdev
    6fe1adeabc2a usb: core: hcd: Fix return value check in usb_hcd_setup_local_mem()
    b3862858b678 usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
    0a022b756f74 tracing/user_events: Fix call print_fmt leak
    e4b7d7297d37 coresight: cti: Fix null pointer error on CTI init before ETM
    3c18888bc0b5 coresight: trbe: remove cpuhp instance node before remove cpuhp state
    064bdc340526 counter: stm32-lptimer-cnt: fix the check on arr and cmp registers update
    bc34896cd75a iio: adis: add '__adis_enable_irq()' implementation
    49ac222945d7 iio: temperature: ltc2983: make bulk write buffer DMA-safe
    2f5fd31b2f24 cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
    ab44c182353b cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
    71d2abab374f firmware: raspberrypi: fix possible memory leak in rpi_firmware_probe()
    4e947fc71bec misc: sgi-gru: fix use-after-free error in gru_set_context_option, gru_fault and gru_handle_user_call_os
    ef843ee20576 misc: tifm: fix possible memory leak in tifm_7xx1_switch_media()
    40ff4c2335a9 ocxl: fix pci device refcount leak when calling get_function_0()
    2fce8b3583d1 misc: ocxl: fix possible name leak in ocxl_file_register_afu()
    6dd5fbd243f1 test_firmware: fix memory leak in test_firmware_init()
    a4b84c112d8e habanalabs: fix return value check in hl_fw_get_sec_attest_data()
    03dbb9e2e975 serial: sunsab: Fix error handling in sunsab_init()
    ca89c2eb36ed serial: altera_uart: fix locking in polling mode
    516614a371c2 serial: pch: Fix PCI device refcount leak in pch_request_dma()
    408f64a6de74 serial: stm32: move dma_request_chan() before clk_prepare_enable()
    898a162d5fc4 serial: pl011: Do not clear RX FIFO & RX interrupt in unthrottle.
    64bc5dbc3260 serial: amba-pl011: avoid SBSA UART accessing DMACR register
    99a58ac42d9b USB: gadget: Fix use-after-free during usb config switch
    5b38782cc358 extcon: usbc-tusb320: Update state on probe even if no IRQ pending
    22b60658a902 usb: musb: omap2430: Fix probe regression for missing resources
    20a945280d69 usb: typec: tipd: Fix typec_unregister_port error paths
    63fff60c0066 usb: typec: tipd: Fix spurious fwnode_handle_put in error path
    7bc33793042b usb: typec: tipd: Cleanup resources if devm_tps6598_psy_register fails
    5f125507d227 usb: typec: tcpci: fix of node refcount leak in tcpci_register_port()
    26937dcf067a usb: typec: Check for ops->exit instead of ops->enter in altmode_exit
    85db68fc901d staging: vme_user: Fix possible UAF in tsi148_dma_list_add
    71cfd25e2211 interconnect: qcom: sc7180: fix dropped const of qcom_icc_bcm
    bdfa9f57b2a2 usb: fotg210-udc: Fix ages old endianness issues
    b9dcd53356ea uio: uio_dmem_genirq: Fix deadlock between irq config and handling
    ee180e867ce4 uio: uio_dmem_genirq: Fix missing unlock in irq configuration
    31ef3d554d59 vfio/iova_bitmap: Fix PAGE_SIZE unaligned bitmaps
    f0865e4f2c82 vfio: platform: Do not pass return buffer to ACPI _RST method
    abaedb68a769 class: fix possible memory leak in __class_register()
    9494faf74f8d drivers: staging: r8188eu: Fix sleep-in-atomic-context bug in rtw_join_timeout_handler
    3d97c13a1152 serial: 8250_bcm7271: Fix error handling in brcmuart_init()
    bffec1abc074 serial: tegra: Read DMA status before terminating
    78fddc0ff971 drivers: dio: fix possible memory leak in dio_init()
    6392d71b4bf9 riscv: Fix P4D_SHIFT definition for 3-level page table mode
    dd203468f071 f2fs: fix iostat parameter for discard
    652b2cdb3007 RISC-V: Align the shadow stack
    ee0e9b2c4b9c IB/IPoIB: Fix queue count inconsistency for PKEY child interfaces
    19b7b85773b1 hwrng: geode - Fix PCI device refcount leak
    2e10ecd012ae hwrng: amd - Fix PCI device refcount leak
    84ebdb6b65ad crypto: img-hash - Fix variable dereferenced before check 'hdev->req'
    f2f2c6102ace riscv: Fix crash during early errata patching
    e395fdfec46d RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
    eced7ec0cd89 RISC-V: Fix unannoted hardirqs-on in return to userspace slow-path
    9f4379692ace RDMA/hns: Fix XRC caps on HIP08
    9e711eafabf0 RDMA/hns: Fix error code of CMD
    d78e8b4c862d RDMA/hns: Fix page size cap from firmware
    aaa589124d4c RDMA/hns: Fix PBL page MTR find
    d3238c4d3a46 RDMA/hns: Fix AH attr queried by query_qp
    60549c5224cd RDMA/hns: Fix the gid problem caused by free mr
    bf0ad007e6cb orangefs: Fix sysfs not cleanup when dev init failed
    38c1d5d2f8ae PCI: vmd: Fix secondary bus reset for Intel bridges
    6c8319b90fe7 RDMA/srp: Fix error return code in srp_parse_options()
    8bc0ecf1c382 RDMA/hfi1: Fix error return code in parse_platform_config()
    de888c02ac32 RDMA: Disable IB HW for UML
    3829187387e4 riscv/mm: add arch hook arch_clear_hugepage_flags
    c19ca6553c2d crypto: omap-sham - Use pm_runtime_resume_and_get() in omap_sham_probe()
    22a59bb0aa5a crypto: amlogic - Remove kcalloc without check
    10ed78c85b52 crypto: qat - fix error return code in adf_probe
    c458c9d0ce97 RDMA/nldev: Fix failure to send large messages
    3ee8611a1d0d f2fs: avoid victim selection from previous victim section
    0807071c1b2b f2fs: fix to enable compress for newly created file if extension matches
    1f9d91ffc383 f2fs: set zstd compress level correctly
    65c73bc771d6 RDMA/nldev: Add checks for nla_nest_start() in fill_stat_counter_qps()
    02e0170c4da2 scsi: ufs: core: Fix the polling implementation
    4141cd9e8b33 scsi: snic: Fix possible UAF in snic_tgt_create()
    aef82d16be5a scsi: fcoe: Fix transport not deattached when fcoe_if_init() fails
    4399a8632e5f scsi: ipr: Fix WARNING in ipr_init()
    bc31e6820424 scsi: scsi_debug: Fix possible name leak in sdebug_add_host_helper()
    cfa2f8098a6e scsi: fcoe: Fix possible name leak when device_register() fails
    8698f359f252 scsi: scsi_debug: Fix a warning in resp_report_zones()
    582b0a422642 scsi: scsi_debug: Fix a warning in resp_verify()
    c7e96168a8ca scsi: efct: Fix possible memleak in efct_device_init()
    c2e4692d019a scsi: hpsa: Fix possible memory leak in hpsa_add_sas_device()
    9aa5b09a5548 scsi: hpsa: Fix error handling in hpsa_add_sas_host()
    d17bca3ddfe5 scsi: mpt3sas: Fix possible resource leaks in mpt3sas_transport_port_add()
    8642c72b081e crypto: hisilicon/qm - fix 'QM_XEQ_DEPTH_CAP' mask value
    4841596b93f0 crypto: arm64/sm3 - fix possible crash with CFI enabled
    9c1b30d5c1f7 crypto: arm64/sm3 - add NEON assembly implementation
    23cf91c76489 crypto: x86/sm4 - fix crash with CFI enabled
    e6e4e281be90 crypto: x86/sm3 - fix possible crash with CFI enabled
    ae252643e884 crypto: x86/sha512 - fix possible crash with CFI enabled
    76994f26226e crypto: x86/sha256 - fix possible crash with CFI enabled
    f3b1021db697 crypto: x86/sha1 - fix possible crash with CFI enabled
    8d447b92c3e2 crypto: x86/aria - fix crash with CFI enabled
    5ab743151a62 crypto: x86/aegis128 - fix possible crash with CFI enabled
    ff28b8afb786 padata: Fix list iterator in padata_do_serial()
    6cfa9e60c0f8 padata: Always leave BHs disabled when running ->parallel()
    314398bc1014 crypto: tcrypt - Fix multibuffer skcipher speed test mem leak
    0aa7be66168b scsi: hpsa: Fix possible memory leak in hpsa_init_one()
    21d8b6bd3730 PCI: endpoint: pci-epf-vntb: Fix call pci_epc_mem_free_addr() in error path
    eef5d05cbbd6 dt-bindings: visconti-pcie: Fix interrupts array max constraints
    e75080f9b4ee dt-bindings: imx6q-pcie: Fix clock names for imx6sx and imx8mq
    821f9a18210f RDMA/rxe: Fix NULL-ptr-deref in rxe_qp_do_cleanup() when socket create failed
    fc2c43bf41c8 RDMA/hns: fix memory leak in hns_roce_alloc_mr()
    26cee0603af0 RDMA/irdma: Initialize net_type before checking it
    d9dbd4ca2646 crypto: ccree - Make cc_debugfs_global_fini() available for module init function
    ed8b5ff3b078 RDMA/hfi: Decrease PCI device reference count in error path
    76ca6756bf03 PCI: Check for alloc failure in pci_request_irq()
    c5a6776e44aa RDMA/hns: Fix incorrect sge nums calculation
    2b214368bc0c RDMA/hns: Fix ext_sge num error when post send
    06f73568f553 RDMA/rxe: Fix mr->map double free
    f98601f9abde crypto: hisilicon/qm - add missing pci_dev_put() in q_num_set()
    b5be6724f222 crypto: cryptd - Use request context instead of stack for sub-request
    677f01f396ae crypto: ccree - Remove debugfs when platform_driver_register failed
    953c81ffe384 scsi: scsi_debug: Fix a warning in resp_write_scat()
    70adec0c790f RDMA/irdma: Do not request 2-level PBLEs for CQ alloc
    b4502647c0b2 RDMA/irdma: Fix RQ completion opcode
    1df9f815553d RDMA/irdma: Fix inline for multiple SGE's
    3930245bc845 RDMA/siw: Set defined status for work completion with undefined status
    c1d5a12f930f RDMA/nldev: Return "-EAGAIN" if the cm_id isn't from expected port
    cd06d32a71fb RDMA/core: Make sure "ib_port" is valid when access sysfs node
    8731cb5c7820 RDMA/restrack: Release MR restrack when delete
    cf968790a08f f2fs: fix to avoid accessing uninitialized spinlock
    71bf3550b530 PCI: imx6: Initialize PHY before deasserting core reset
    5d2e13358243 PCI: vmd: Disable MSI remapping after suspend
    fa8a2f3be78e IB/mad: Don't call to function that might sleep while in atomic context
    f3d26a8589df RDMA/siw: Fix immediate work request flush to completion queue
    fdb9c354ac86 scsi: qla2xxx: Fix set-but-not-used variable warnings
    425c9bd06b7a RDMA/irdma: Report the correct link speed
    0b8578dc8477 f2fs: fix to destroy sbi->post_read_wq in error path of f2fs_fill_super()
    b4244ca341ea f2fs: fix the assign logic of iocb
    734e2cf3ee29 f2fs: allow to set compression for inlined file
    fa2e65c1b1c6 f2fs: fix normal discard process
    7e7db55d1e67 f2fs: fix gc mode when gc_urgent_high_remaining is 1
    ae6c960a82c5 f2fs: fix to invalidate dcc->f2fs_issue_discard in error path
    ed88147bfb4e fortify: Do not cast to "unsigned char"
    12695b4b76d4 apparmor: Fix memleak in alloc_ns()
    7417cc5151bc crypto: rockchip - rework by using crypto_engine
    f945afb80f1d crypto: rockchip - remove non-aligned handling
    89117da0102c crypto: rockchip - better handle cipher key
    2edab0edfef5 crypto: rockchip - add fallback for ahash
    ac798fd39e2a crypto: rockchip - add fallback for cipher
    d2ce2922fd39 crypto: rockchip - do not store mode globally
    2aecc5029fcc crypto: rockchip - do not do custom power management
    1550e871120e f2fs: Fix the race condition of resize flag between resizefs
    0ea2ba0d5b4f PCI: pci-epf-test: Register notifier if only core_init_notifier is enabled
    7123963c57ee RDMA/core: Fix order of nldev_exit call
    b5c7878b034c PCI: dwc: Fix n_fts[] array overrun
    756e412cfcac apparmor: Use pointer to struct aa_label for lbs_cred
    51a903281798 scsi: core: Fix a race between scsi_done() and scsi_timeout()
    7b5bc00a59ef crypto: tcrypt - fix return value for multiple subtests
    51592cf71682 crypto: nitrox - avoid double free on error path in nitrox_sriov_init()
    204fdddd4698 crypto: sun8i-ss - use dma_addr instead u32
    8a9db7913497 crypto: hisilicon/qm - re-enable communicate interrupt before notifying PF
    9a6fab168cbc crypto: hisilicon/qm - fix incorrect parameters usage
    f024bf13d4ff apparmor: Fix regression in stacking due to label flags
    72a5b5641cac apparmor: Fix abi check to include v8 abi
    053816fb455f apparmor: fix lockdep warning when removing a namespace
    3d27a436e294 apparmor: fix a memleak in multi_transaction_new()
    14ed46a13aba net: dsa: tag_8021q: avoid leaking ctx on dsa_tag_8021q_register() error path
    06b81b4e669a i40e: Fix the inability to attach XDP program on downed interface
    e0c54906cf67 stmmac: fix potential division by 0
    aff5bca3c2e5 octeontx2-af: cn10k: mcs: Fix a resource leak in the probe and remove functions
    e97a4ad295b0 Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()
    9114e7fa80ce Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
    c1f213a8ccf3 Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
    866b20962954 Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
    91ed02b7977b Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
    08c847f1a163 Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
    d123f2b94b9e Bluetooth: btusb: don't call kfree_skb() under spin_lock_irqsave()
    8eefaa20568d Bluetooth: btintel: Fix missing free skb in btintel_setup_combined()
    09a3b0c9c7c6 Bluetooth: hci_conn: Fix crash on hci_create_cis_sync
    a65b09e3130b Bluetooth: Fix EALREADY and ELOOP cases in bt_status()
    72560759f6e0 Bluetooth: MGMT: Fix error report for ADD_EXT_ADV_PARAMS
    66324c5eb5ee Bluetooth: hci_core: fix error handling in hci_register_dev()
    b17b3203d479 sctp: sysctl: make extra pointers netns aware
    07e28a8f4502 ntb_netdev: Use dev_kfree_skb_any() in interrupt context
    4f9bcc999062 net: lan9303: Fix read error execution path
    a8846b339860 net: ethernet: ti: am65-cpsw: Fix PM runtime leakage in am65_cpsw_nuss_ndo_slave_open()
    512dc6796946 can: tcan4x5x: Fix use of register error status mask
    73a1f06a4b6f can: m_can: Call the RAM init directly from m_can_chip_config
    9f38ec243426 can: tcan4x5x: Remove invalid write in clear_interrupts
    8718e17e0fac net: amd-xgbe: Check only the minimum speed for active/passive cables
    7a7de9a6f198 net: amd-xgbe: Fix logic around active and passive cables
    99a75f34db5b af_unix: call proto_unregister() in the error path in af_unix_init()
    22dbe4a6ea37 net: setsockopt: fix IPV6_UNICAST_IF option for connected sockets
    7cc54e9ffcf5 net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
    df7c78c3ab06 hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
    4bc76162596e net: ethernet: dnet: don't call dev_kfree_skb() under spin_lock_irqsave()
    2a979f087430 net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
    9027ed144a1c net: apple: bmac: don't call dev_kfree_skb() under spin_lock_irqsave()
    6c0fba2b683d net: apple: mace: don't call dev_kfree_skb() under spin_lock_irqsave()
    588d0b8462f5 net/tunnel: wait until all sk_user_data reader finish before releasing the sock
    bb1715a6bfb0 net: farsync: Fix kmemleak when rmmods farsync
    5253d432dd36 ethernet: s2io: don't call dev_kfree_skb() under spin_lock_irqsave()
    71d88c7453ec of: overlay: fix null pointer dereferencing in find_dup_cset_node_entry() and find_dup_cset_prop()
    cbde8b3acbc8 ipvs: use u64_stats_t for the per-cpu counters
    dcae92a24955 drivers: net: qlcnic: Fix potential memory leak in qlcnic_sriov_init()
    446757787baf net: stmmac: fix possible memory leak in stmmac_dvr_probe()
    bfbc4f7f82da net: stmmac: selftests: fix potential memleak in stmmac_test_arpoffload()
    e6730e15df96 net: defxx: Fix missing err handling in dfx_init()
    6af94424012c net: vmw_vsock: vmci: Check memcpy_from_msg()
    bd72ab5e6fc1 clk: socfpga: Fix memory leak in socfpga_gate_init()
    8d64aca5e8f3 bpf: Do not zero-extend kfunc return values
    8682d0a6ee54 blktrace: Fix output non-blktrace event when blk_classic option enabled
    bbb2d35386c1 wifi: brcmfmac: Fix error return code in brcmf_sdio_download_firmware()
    36a2786145ef wifi: rtl8xxxu: Fix the channel width reporting
    8e2d450c4e5b wifi: rtl8xxxu: Add __packed to struct rtl8723bu_c2h
    9d0190d4722a spi: spi-gpio: Don't set MOSI as an input if not 3WIRE mode
    a35323218ff3 clk: samsung: Fix memory leak in _samsung_clk_register_pll()
    c93ecbb21b9a media: staging: stkwebcam: Restore MEDIA_{USB,CAMERA}_SUPPORT dependencies
    0209e70ad496 media: coda: Add check for kmalloc
    05f165ded4a7 media: coda: Add check for dcoda_iram_alloc
    ccb4e8de1e7e media: c8sectpfe: Add of_node_put() when breaking out of loop
    86e52c02e288 regulator: qcom-labibb: Fix missing of_node_put() in qcom_labibb_regulator_probe()
    83a9cd6e0a96 nvme: pass nr_maps explicitly to nvme_alloc_io_tag_set
    5aebe9ba130a mmc: core: Normalize the error handling branch in sd_read_ext_regs()
    1b3f0b02486b memstick/ms_block: Add check for alloc_ordered_workqueue
    d87d565fec52 mmc: renesas_sdhi: alway populate SCC pointer
    eb8431dc4b5a mmc: mmci: fix return value check of mmc_add_host()
    3697d9af93bf mmc: wbsd: fix return value check of mmc_add_host()
    ba91b413983a mmc: via-sdmmc: fix return value check of mmc_add_host()
    f5ce76aeddf0 mmc: meson-gx: fix return value check of mmc_add_host()
    4e1dc24bcfc8 mmc: omap_hsmmc: fix return value check of mmc_add_host()
    85946ceb0fac mmc: atmel-mci: fix return value check of mmc_add_host()
    9229e7a00f5b mmc: litex_mmc: ensure `host->irq == 0` if polling
    eb7a2d516d4f mmc: wmt-sdmmc: fix return value check of mmc_add_host()
    2044b2ea7794 mmc: vub300: fix return value check of mmc_add_host()
    bfd77b194c94 mmc: toshsd: fix return value check of mmc_add_host()
    a522e26a20a4 mmc: rtsx_usb_sdmmc: fix return value check of mmc_add_host()
    ffa9b2a79e3e mmc: rtsx_pci: fix return value check of mmc_add_host()
    5a62cba13851 mmc: pxamci: fix return value check of mmc_add_host()
    d2ead18bc7cc mmc: mxcmmc: fix return value check of mmc_add_host()
    40aa73c70e8a mmc: moxart: fix return value check of mmc_add_host()
    60fafcf2fb7e mmc: alcor: fix return value check of mmc_add_host()
    774d97b5ed7c hwmon: (emc2305) fix pwm never being able to set lower
    4cf53e91f36a hwmon: (emc2305) fix unable to probe emc2301/2/3
    12e677201777 bpftool: Fix memory leak in do_build_table_cb
    adebac5995c9 riscv, bpf: Emit fixed-length instructions for BPF_PSEUDO_FUNC
    86c1f5d5f498 NFSv4.x: Fail client initialisation if state manager thread can't run
    a89715bc9523 NFS: Allow very small rsize & wsize again
    f6a174755c33 NFSv4.2: Set the correct size scratch buffer for decoding READ_PLUS
    05acc401bca3 SUNRPC: Fix missing release socket in rpc_sockname()
    17c49afc694e xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()
    aae4846e8e49 pinctrl: thunderbay: fix possible memory leak in thunderbay_build_functions()
    250eed7b9994 ALSA: mts64: fix possible null-ptr-defer in snd_mts64_interrupt
    0859b2e1d5fa media: ov5640: set correct default link frequency
    3872adf30623 media: saa7164: fix missing pci_disable_device()
    809b48cb2eee ALSA: pcm: Set missing stop_operating flag at undoing trigger start
    5c3568166129 bpf, sockmap: fix race in sock_map_free()
    9283a0f51173 bpf: Add dummy type reference to nf_conn___init to fix type deduplication
    204d0f668d0f hwmon: (jc42) Restore the min/max/critical temperatures on resume
    24186b599624 hwmon: (jc42) Convert register access and caching to regmap/regcache
    f86b2f216636 regulator: core: fix resource leak in regulator_register()
    c72eb6e6e49a configfs: fix possible memory leak in configfs_create_dir()
    d2576d29da71 hsr: Synchronize sequence number updates.
    b5259dcfa3e1 hsr: Synchronize sending frames to have always incremented outgoing seq nr.
    3b79aaa88bab hsr: Disable netpoll.
    1517be0aef6d hsr: Avoid double remove of a node.
    4d2f6c44fd85 hsr: Add a rcu-read lock to hsr_forward_skb().
    41d4bcc624cf Revert "net: hsr: use hlist_head instead of list_head for mac addresses"
    35a6ae235108 clk: qcom: clk-krait: fix wrong div2 functions
    3b317660e43f clk: qcom: lpass-sc7180: Fix pm_runtime usage
    607ccb7d3d35 clk: qcom: lpass-sc7280: Fix pm_runtime usage
    89f19d11aad8 regulator: core: fix module refcount leak in set_supply()
    2d4b9c7e81f3 mt76: mt7915: Fix PCI device refcount leak in mt7915_pci_init_hif2()
    d26fdb1ec5b7 wifi: mt76: do not send firmware FW_FEATURE_NON_DL region
    52f7e2392617 wifi: mt76: mt7921: Add missing __packed annotation of struct mt7921_clc
    eb9102556565 wifi: mt76: fix coverity overrun-call in mt76_get_txpower()
    f11c5a1926c9 wifi: mt76: mt7921: fix wrong power after multiple SAR set
    71e73d3ce2b8 wifi: mt76: mt7915: Fix chainmask calculation on mt7915 DBDC
    13b31708e54f wifi: mt76: mt7915: rework eeprom tx paths and streams init
    5e55a45d9196 wifi: mt76: mt7921: fix reporting of TX AGGR histogram
    6435fc52ef36 wifi: mt76: mt7915: fix reporting of TX AGGR histogram
    1d3ecd157294 wifi: mt76: mt7915: fix mt7915_mac_set_timing()
    c6cd8bacafc2 wifi: mt76: mt7921: fix antenna signal are way off in monitor mode
    ae99debcf6b8 wifi: cfg80211: Fix not unregister reg_pdev when load_builtin_regdb_keys() fails
    92c9732ce7eb wifi: mac80211: fix maybe-unused warning
    9a50a7f64243 wifi: mac80211: fix memory leak in ieee80211_if_add()
    687b6b37c094 wifi: nl80211: Add checks for nla_nest_start() in nl80211_send_iface()
    16984b61ef15 spi: spidev: mask SPI_CS_HIGH in SPI_IOC_RD_MODE
    58cf9f4b79ad bonding: uninitialized variable in bond_miimon_inspect()
    26a844a91ecb bpf, sockmap: Fix data loss caused by using apply_bytes on ingress redirect
    e45de3007ac5 bpf, sockmap: Fix missing BPF_F_INGRESS flag when using apply_bytes
    113236e8f49f bpf, sockmap: Fix repeated calls to sock_put() when msg has more_data
    ff0d392a4255 Input: wistron_btns - disable on UML
    ce7de847f19e netfilter: conntrack: set icmpv6 redirects as RELATED
    f0f1982ddfb4 clk: visconti: Fix memory leak in visconti_register_pll()
    4fa98de4f8c8 ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe
    7c852e8f93f0 drm/i915/bios: fix a memory leak in generate_lfp_data_ptrs
    c65564790048 drm/amdkfd: Fix memory leakage
    a8b54ad7106c drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()
    a6cffe54064a drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
    dba7d8572224 amdgpu/nv.c: Corrected typo in the video capabilities resolution
    dd574ff7a7f2 drm/amd/pm/smu11: BACO is supported when it's in BACO state
    95569b7285dc clk: mediatek: fix dependency of MT7986 ADC clocks
    77c6b6be7e80 ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
    3a2ecd1ec140 wifi: iwlwifi: mvm: fix double free on tx path.
    f52cf83c18cf wifi: rtl8xxxu: Fix use after rcu_read_unlock in rtl8xxxu_bss_info_changed
    fce7e4627364 wifi: plfxlc: fix potential memory leak in __lf_x_usb_enable_rx()
    98dbd1329b4a ALSA: asihpi: fix missing pci_disable_device()
    6f3d56783fbe NFS: Fix an Oops in nfs_d_automount()
    0393e0316cdd NFSv4: Fix a deadlock between nfs4_open_recover_helper() and delegreturn
    b247a9828f66 NFSv4: Fix a credential leak in _nfs4_discover_trunking()
    43fe5686d4a4 NFSv4.2: Fix initialisation of struct nfs4_label
    7c6975209d98 NFSv4.2: Fix a memory stomp in decode_attr_security_label
    4711196ada6b NFSv4.2: Always decode the security label
    860b951e92c3 NFSv4.2: Clear FATTR4_WORD2_SECURITY_LABEL when done decoding
    b88b4035b218 drm/msm/mdp5: fix reading hw revision on db410c platform
    deed9567aae0 ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
    9d997d67e501 ASoC: dt-bindings: wcd9335: fix reset line polarity in example
    a5d99bf9cf77 drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
    6a27110802eb media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC
    2e6203ef474b media: mediatek: vcodec: Core thread depends on core_list
    c703b86a4972 media: mediatek: vcodec: Setting lat buf to lat_list when lat decode error
    43a4ae7b7879 media: mediatek: vcodec: Fix h264 set lat buffer error
    fd975256eb26 media: mediatek: vcodec: Fix getting NULL pointer for dst buffer
    c9411d57c1de media: amphion: lock and check m2m_ctx in event handler
    c0c1903e8733 media: amphion: cancel vpu before release instance
    1ca1405d52c8 media: amphion: try to wakeup vpu core to avoid failure
    5100ab6744e7 media: sun8i-a83t-mipi-csi2: Register async subdev with no sensor attached
    65b3232f9e91 media: sun6i-mipi-csi2: Register async subdev with no sensor attached
    6c1c8499cdb6 media: sun8i-a83t-mipi-csi2: Require both pads to be connected for streaming
    daf248d2d6a5 media: sun6i-mipi-csi2: Require both pads to be connected for streaming
    b1898793777f x86/boot: Skip realmode init code when running as Xen PV guest
    6b60cf73a931 media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()
    ed4293a07c1c media: dvb-core: Fix ignored return value in dvb_register_frontend()
    5e2fa5132995 pinctrl: pinconf-generic: add missing of_node_put()
    d998e985232a clk: imx8mn: fix imx8mn_enet_phy_sels clocks list
    a03b59a0c83d clk: imx8mn: fix imx8mn_sai2_sels clocks list
    4b7b740009fa clk: imx: rename video_pll1 to video_pll
    90b4de668466 clk: imx: replace osc_hdmi with dummy
    99bd07dc8519 clk: imx8mn: rename vpu_pll to m7_alt_pll
    d6ebcae042ce media: mt9p031: Drop bogus v4l2_subdev_get_try_crop() call from mt9p031_init_cfg()
    0f5250e1de5f media: imx: imx7-media-csi: Clear BIT_MIPI_DOUBLE_CMPNT for <16b formats
    3f8b24ab0d00 media: imon: fix a race condition in send_packet()
    f38df8984ef1 media: vimc: Fix wrong function called when vimc_init() fails
    841315c1db6b ASoC: mediatek: mt8186: Correct I2S shared clocks
    5827a5656d5a ASoC: qcom: cleanup and fix dependency of QCOM_COMMON
    b1e4f92dd0c1 ASoC: qcom: Add checks for devm_kcalloc
    a999525c7b69 drbd: destroy workqueue when drbd device was freed
    6c4c5d5e4a0d drbd: remove call to memset before free device/resource/connection
    a1b061cafdbc mtd: maps: pxa2xx-flash: fix memory leak in probe
    616dc895d982 mtd: core: Fix refcount error in del_mtd_device()
    95e90bcc934f clk: microchip: check for null return of devm_kzalloc()
    d87f58c25447 bonding: fix link recovery in mode 2 when updelay is nonzero
    e1abb71ed774 selftests/bpf: Mount debugfs in setns_by_fd
    4074774f55d4 selftests/bpf: Make sure zero-len skbs aren't redirectable
    cbd17cb4df07 drm/i915/guc: make default_lists const data
    d7352b410471 drm/amdgpu: fix pci device refcount leak
    f2ffb8653ea8 clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
    55e44791a547 regulator: core: use kfree_const() to free space conditionally
    83ddd4cc8f25 ALSA: seq: fix undefined behavior in bit shift for SNDRV_SEQ_FILTER_USE_EVENT
    2b951e13bd17 ALSA: pcm: fix undefined behavior in bit shift for SNDRV_PCM_RATE_KNOT
    bfa34e24ced6 ASoC: Intel: avs: Lock substream before snd_pcm_stop()
    51618c1d77af ASoC: Intel: Skylake: Fix Kconfig dependency
    1dc70897f1ac wifi: rtw89: fix physts IE page check
    60dcaf068f42 pinctrl: k210: call of_node_put()
    66d362f16d46 clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB offsets
    258730e8f68f HID: hid-sensor-custom: set fixed size for custom attributes
    21f15d8ffdb4 bpf: Move skb->len == 0 checks into __bpf_redirect
    92f30b33df3d clk: imx93: correct enet clock
    a1981f67d57e clk: imx93: unmap anatop base in error handling path
    1372f4f6fcb1 HID: i2c: let RMI devices decide what constitutes wakeup event
    3751ba4aec0b bpf: Pin the start cgroup in cgroup_iter_seq_init()
    b7c906977301 clk: imx93: correct the flexspi1 clock setting
    c536932b6a2a mtd: spi-nor: Fix the number of bytes for the dummy cycles
    58701a96062f mtd: spi-nor: hide jedec_id sysfs attribute if not present
    d24fd986ae9d net: Return errno in sk->sk_prot->get_port().
    073b50de84cb udp: Clean up some functions.
    53fc231277da net: ethernet: mtk_eth_soc: fix RSTCTRL_PPE{0,1} definitions
    7d4af96be535 media: videobuf-dma-contig: use dma_mmap_coherent
    d72bff7e6cc3 media: amphion: Fix error handling in vpu_driver_init()
    abc73b6739a1 media: platform: exynos4-is: Fix error handling in fimc_md_init()
    9416861170ba media: solo6x10: fix possible memory leak in solo_sysfs_init()
    8a204a0b4a0d media: vidtv: Fix use-after-free in vidtv_bridge_dvb_init()
    48c489fafa46 media: amphion: apply vb2_queue_error instead of setting manually
    e9fbed19ad17 media: amphion: add lock around vdec_g_fmt
    2bf8461ee33c net: ethernet: mtk_eth_soc: do not overwrite mtu configuration running reset routine
    38e2a92cd174 ASoC: amd: acp: Fix possible UAF in acp_dma_open
    917e58a84e85 Input: elants_i2c - properly handle the reset GPIO when power is off
    c4cc41e94d83 mtd: lpddr2_nvm: Fix possible null-ptr-deref
    fee1df5a5835 drm/msm/a6xx: Fix speed-bin detection vs probe-defer
    73b7f8a820d2 wifi: ath10k: Fix return value in ath10k_pci_init()
    4448a8dd1e7c selftests/bpf: fix memory leak of lsm_cgroup
    773bfda35c95 dm: track per-add_disk holder relations in DM
    ce65ef11d37e dm: make sure create and remove dm device won't race with open and close table
    365c351efd4a dm: cleanup close_table_device
    3a3742f6b0a2 dm: cleanup open_table_device
    475bdd75447a block: clear ->slave_dir when dropping the main slave_dir reference
    d2845542a953 ima: Fix misuse of dereference of pointer in template_desc_init_fields()
    c591c48842f0 integrity: Fix memory leakage in keyring allocation error path
    accc7993a780 ALSA: memalloc: Allocate more contiguous pages for fallback case
    0a730f51b02a drm/fourcc: Fix vsub/hsub for Q410 and Q401
    8cf1235a49a3 regulator: qcom-rpmh: Fix PMR735a S3 regulator spec
    a428dcc4a421 wifi: rtw89: Fix some error handling path in rtw89_core_sta_assoc()
    18ef9434379b nvme: return err on nvme_init_non_mdts_limits fail
    8084bd0a64e2 amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
    2f98469c3141 regulator: core: fix unbalanced of node refcount in regulator_dev_lookup()
    3b97e1e894ec nvmet: only allocate a single slab for bvecs
    21b92cf41952 ASoC: pxa: fix null-pointer dereference in filter()
    83a583a36982 drm/mediatek: Modify dpi power on/off sequence.
    8c39a6157c45 selftests/bpf: Fix incorrect ASSERT in the tcp_hdr_options test
    6bbbe4948d46 selftests/bpf: Fix xdp_synproxy compilation failure in 32-bit arch
    69d51c26ea83 ASoC: codecs: wsa883x: use correct header file
    66fdbc0f2445 ASoC: codecs: wsa883x: Use proper shutdown GPIO polarity
    7a779e84b3c4 module: Fix NULL vs IS_ERR checking for module_get_next_page
    0183b7c49cfd wifi: iwlwifi: mei: fix potential NULL-ptr deref after clone
    57f6784d8831 wifi: iwlwifi: mei: avoid blocking sap messages handling due to rtnl lock
    a29e442ee110 wifi: iwlwifi: mei: fix tx DHCP packet for devices with new Tx API
    9829f3a5ae4b wifi: iwlwifi: mei: don't send SAP commands if AMT is disabled
    39138cee7ab9 wifi: iwlwifi: mei: make sure ownership confirmed message is sent
    61dd45b01b20 pinctrl: mediatek: fix the pinconf register offset of some pins
    afe3309dedec dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
    9e203e437310 drm/radeon: Add the missed acpi_put_table() to fix memory leak
    0544ea57f999 bfq: fix waker_bfqq inconsistency crash
    0c57b39033e0 drbd: use blk_queue_max_discard_sectors helper
    961db32e52f4 regmap-irq: Use the new num_config_regs property in regmap_add_irq_chip_fwnode
    2bba26652613 drm: rcar-du: Drop leftovers dependencies from Kconfig
    7f8811ed9853 wifi: rtw89: use u32_encode_bits() to fill MAC quota value
    fb9277b1c82c drm: lcdif: Set and enable FIFO Panic threshold
    735d1820a6b1 rxrpc: Fix ack.bufferSize to be 0 when generating an ack
    5697a0d4a7e1 net, proc: Provide PROC_FS=n fallback for proc_create_net_single_write()
    3c1aac9cef5f virt/sev-guest: Add a MODULE_ALIAS
    91426b258392 clk: renesas: r8a779f0: Fix SCIF parent clocks
    697fc4dfcb6e clk: renesas: r8a779f0: Fix HSCIF parent clocks
    3eb954aac208 media: camss: Do not attach an already attached power domain on MSM8916 platform
    24df4fa3e795 media: camss: Clean up received buffers on failed start of streaming
    c6e31be0f72c wifi: rsi: Fix handling of 802.3 EAPOL frames sent via control port
    7503bb76a141 Input: joystick - fix Kconfig warning for JOYSTICK_ADC
    26c304a3f136 mtd: core: fix possible resource leak in init_mtd()
    bcabe1dc2a34 mtd: Fix device name leak when register device failed in add_mtd_device()
    386cb647b8fb clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
    c4809c3dd342 clk: qcom: dispcc-sm6350: Add CLK_OPS_PARENT_ENABLE to pixel&byte src
    ab6bfd335cf1 clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
    ddbed3b583ac bpf: propagate precision across all frames, not just the last one
    3a59f8bef663 bpf: propagate precision in ALU/ALU64 operations
    fac1282fc80a media: platform: exynos4-is: fix return value check in fimc_md_probe()
    2f558c5208b0 media: vivid: fix compose size exceed boundary
    40356e4c885b media: rkvdec: Add required padding
    926893538b71 media: platform: mtk-mdp3: fix error handling in mdp_probe()
    ef9170c00e1a media: platform: mtk-mdp3: fix error handling about components clock_on
    ab49175a5a88 media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
    12b7733807b6 drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent bits
    043b1493deae drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC values
    0a323c2aa127 drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
    8a80ad33dbd2 drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
    9929c46ccca8 drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
    275b1d41f9b2 drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
    f5bf0e54c47c drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on modulo
    f0282e1d5749 drm/msm/dsi: Remove repeated calculation of slice_per_intf
    36e8894c5676 drm/msm/dsi: Remove useless math in DSC calculations
    4235be829c9e drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional bits
    fae22b0b5b4b bpf: Fix slot type check in check_stack_write_var_off
    ebe6c699ee26 bpf: Clobber stack slot when writing over spilled PTR_TO_BTF_ID
    e7a3542f44fd drm/msm/hdmi: use devres helper for runtime PM management
    8008f1691c15 ima: Handle -ESTALE returned by ima_filter_rule_match()
    e9a22f40f347 drm/msm/mdp5: stop overriding drvdata
    6528971fdce0 drm/ttm: fix undefined behavior in bit shift for TTM_TT_FLAG_PRIV_POPULATED
    465611e81258 drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure
    8b39120d4d9c spi: Update reference to struct spi_controller
    18f36c3eed39 drm/panel/panel-sitronix-st7701: Fix RTNI calculation
    f3ba0b7a4794 drm: lcdif: change burst size to 256B
    521dc068ef5d clk: renesas: r9a06g032: Repair grave increment error
    bd449cadc8db drm/i915/dgfx: Grab wakeref at i915_ttm_unmap_virtual
    6039c79ea54f drm/i915: Encapsulate lmem rpm stuff in intel_runtime_pm
    37ec70c44ec9 drm/i915: Refactor ttm ghost obj detection
    ed52edf44432 drm/i915: Handle all GTs on driver (un)load paths
    12a9b4c4ebd9 drm/rockchip: lvds: fix PM usage counter unbalance in poweron
    2734b3eb7210 drm/amd/display: wait for vblank during pipe programming
    f87cd02c3b65 dw9768: Enable low-power probe on ACPI
    64f61e18286b drm/i915/guc: Fix GuC error capture sizing estimation and reporting
    2fb13ac78aa9 drm/i915/guc: Add error-capture init warnings when needed
    fe9f9b9d06d3 ASoC: dt-bindings: rt5682: Set sound-dai-cells to 1
    0b708cb7f03d clk: renesas: r8a779a0: Fix SD0H clock name
    fb0425321947 clk: renesas: r8a779f0: Fix SD0H clock name
    a8e14234ac26 can: kvaser_usb: Compare requested bittiming parameters with actual parameters in do_set_{,data}_bittiming
    70e91ddbe3b1 can: kvaser_usb: Add struct kvaser_usb_busparams
    87669964867a can: kvaser_usb_leaf: Fix bogus restart events
    e66e75eed961 can: kvaser_usb_leaf: Fix wrong CAN state after stopping
    1eef65b79fce can: kvaser_usb_leaf: Fix improved state not being reported
    6354011aa53c can: kvaser_usb_leaf: Set Warning state even without bus errors
    10081f449a06 can: kvaser_usb: kvaser_usb_leaf: Handle CMD_ERROR_EVENT
    368ee61e7b13 can: kvaser_usb: kvaser_usb_leaf: Rename {leaf,usbcan}_cmd_error_event to {leaf,usbcan}_cmd_can_error_event
    2a07780ad2ff can: kvaser_usb: kvaser_usb_leaf: Get capabilities from device
    8543ac492366 libbpf: Btf dedup identical struct test needs check for nested structs/arrays
    5d68a8c82759 media: exynos4-is: don't rely on the v4l2_async_subdev internals
    3a54b7286893 media: i2c: ov5648: Free V4L2 fwnode data on unbind
    91a8528694a1 soreuseport: Fix socket selection for SO_INCOMING_CPU.
    a5514f2f83a1 venus: pm_helpers: Fix error check in vcodec_domains_get()
    0a132a42b77f media: i2c: ad5820: Fix error path
    436873067841 media: i2c: hi846: Fix memory leak in hi846_parse_dt()
    5459eaca151d drm/i915: Fix compute pre-emption w/a to apply to compute engines
    72b414661dc1 drm/i915/guc: Limit scheduling properties to avoid overflow
    ad8eb8ed0d39 media: mediatek: vcodec: fix h264 cavlc bitstream fail
    246f266634f5 media: cedrus: hevc: Fix offset adjustments
    563d50ec220f media: v4l2-ioctl.c: Unify YCbCr/YUV terms in format descriptions
    5d1a2d2a1183 media: adv748x: afe: Select input port when initializing AFE
    fc6579f00506 media: amphion: reset instance if it's aborted before codec header parsed
    e7d1e0b75264 media: coda: jpeg: Add check for kmalloc
    b9d1093140e2 media: v4l2-ctrls: Fix off-by-one error in integer menu control check
    a7e8439e297e Input: iqs7222 - protect against undefined slider size
    172d4d640750 drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
    782175a60176 selftests/bpf: fix missing BPF object files
    05d55bbd8d27 samples/bpf: Fix MAC address swapping in xdp2_kern
    818b68651cde samples/bpf: Fix map iteration in xdp1_user
    22d569b3d1a0 net: ethernet: adi: adin1110: Fix SPI transfers
    1c65f8f98148 drm/amdgpu/powerplay/psm: Fix memory leak in power state init
    9ccd11718d76 drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly"
    3265e0f2f85a ipmi: kcs: Poll OBF briefly to reduce OBE latency
    0bad12fee5ae ASoC: Intel: avs: Fix potential RX buffer overflow
    b793142e7d6f ASoC: Intel: avs: Fix DMA mask assignment
    e02b42f3fc56 pinctrl: ocelot: add missing destroy_workqueue() in error path in ocelot_pinctrl_probe()
    55442d2f2cfa ata: libata: fix NCQ autosense logic
    76b014f2f595 drm: lcdif: Switch to limited range for RGB to YUV conversion
    ecb0f3d7dd13 libbpf: Fix null-pointer dereference in find_prog_by_sec_insn()
    e0f5361d95aa libbpf: Deal with section with no data gracefully
    622ff59742fe libbpf: Use elf_getshdrnum() instead of e_shnum
    3c48bbf4264f selftest/bpf: Fix error usage of ASSERT_OK in xdp_adjust_tail.c
    bec359a2a48f selftests/bpf: Fix error failure of case test_xdp_adjust_tail_grow
    661e952bc9ef selftest/bpf: Fix memory leak in kprobe_multi_test
    d7dc8fad67fa selftests/bpf: Fix memory leak caused by not destroying skeleton
    13866e924a57 libbpf: Fix memory leak in parse_usdt_arg()
    fbe08093fb23 libbpf: Fix use-after-free in btf_dump_name_dups
    e4ebe4eb7ef5 drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge
    edf05f091cc7 wifi: ath11k: fix firmware assert during bandwidth change for peer sta
    d161b3de52dd wifi: rtl8xxxu: Fix reading the vendor of combo chips
    71fc0ad671a6 wifi: ath9k: hif_usb: Fix use-after-free in ath9k_hif_usb_reg_in_cb()
    08aa0537ec8c wifi: ath9k: hif_usb: fix memory leak of urbs in ath9k_hif_usb_dealloc_tx_urbs()
    588f2f9c7df6 drm/atomic-helper: Don't allocate new plane state in CRTC check
    daf8163bd9ca wifi: mac80211: fix ifdef symbol name
    8f8e5ca4e038 wifi: mac80211: check link ID in auth/assoc continuation
    bb7743955a92 wifi: mac80211: mlme: fix null-ptr deref on failed assoc
    cd5d16539330 wifi: fix multi-link element subelement iteration
    49cafaad0ba5 selftests/bpf: Add missing bpf_iter_vma_offset__destroy call
    cd58eb4338ce platform/mellanox: mlxbf-pmc: Fix event typo
    28dad915abe4 ipc: fix memory leak in init_mqueue_fs()
    b59624258598 rapidio: devices: fix missing put_device in mport_cdev_open
    88579c158e02 hfs: Fix OOB Write in hfs_asc2mac
    caaa3b42a204 relay: fix type mismatch when allocating memory in relay_create_buf()
    ab2f429240b8 eventfd: change int to __u64 in eventfd_signal() ifndef CONFIG_EVENTFD
    cb87af2c19c0 rapidio: fix possible UAF when kfifo_alloc() fails
    c8d1f3d1b25b fs: sysv: Fix sysv_nblocks() returns wrong value
    b6dccca21b1f NFSD: pass range end to vfs_fsync_range() instead of count
    82474db85bab nfsd: return error if nfs4_setacl fails
    d7aa9f777831 lockd: set other missing fields when unlocking files
    5c8e13a2b66a MIPS: OCTEON: warn only once if deprecated link status is being used
    412bd425cc35 MIPS: BCM63xx: Add check for NULL for clk in clk_enable
    dc7224749484 platform/x86: intel_scu_ipc: fix possible name leak in __intel_scu_ipc_register()
    87426ce3bd57 platform/x86: mxm-wmi: fix memleak in mxm_wmi_call_mx[ds|mx]()
    6613f36a2fa5 platform/chrome: cros_ec_typec: zero out stale pointers
    40c73b2ea961 erofs: validate the extent length for uncompressed pclusters
    373b6f350aec erofs: fix missing unmap if z_erofs_get_extent_compressedlen() fails
    618e712b99c7 erofs: Fix pcluster memleak when its block address is zero
    18067e262416 erofs: check the uniqueness of fsid in shared domain in advance
    6a5061dd651c PM: runtime: Do not call __rpm_callback() from rpm_idle()
    4da411086f5a xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()
    b44457b83a03 x86/xen: Fix memory leak in xen_init_lock_cpu()
    f698f88f042c x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
    daea9a0647df uprobes/x86: Allow to probe a NOP instruction with 0x66 prefix
    01f2c2052ea5 ACPICA: Fix use-after-free in acpi_ut_copy_ipackage_to_ipackage()
    404b4b9770d8 clocksource/drivers/timer-ti-dm: Fix missing clk_disable_unprepare in dmtimer_systimer_init_clock()
    6b0a5f9e153e clocksource/drivers/timer-ti-dm: Fix warning for omap_timer_match
    685c4ec6c8d0 cpu/hotplug: Do not bail-out in DYING/STARTING sections
    4070e9cf7220 cpu/hotplug: Make target_store() a nop when target == state
    a1e49256c786 futex: Resend potentially swallowed owner death notification
    fba0ec3a25ee clocksource/drivers/sh_cmt: Access registers according to spec
    9abba4aa6087 rapidio: rio: fix possible name leak in rio_register_mport()
    85fbf58b15c0 rapidio: fix possible name leaks when rio_add_device() fails
    50ab0ca3aff4 ocfs2: fix memory leak in ocfs2_mount_volume()
    92425441949e debugfs: fix error when writing negative value to atomic_t debugfs file
    93148085cb70 lib/notifier-error-inject: fix error when writing -errno to debugfs file
    79be3d5f2ef1 libfs: add DEFINE_SIMPLE_ATTRIBUTE_SIGNED for signed value
    52116d130bcb cpufreq: amd_freq_sensitivity: Add missing pci_dev_put()
    6eda351971be genirq/irqdesc: Don't try to remove non-existing sysfs files
    23ac79e755df nfsd: don't call nfsd_file_put from client states seqfile display
    b04556ef19ed NFSD: Finish converting the NFSv3 GETACL result encoder
    2b825efb0577 NFSD: Finish converting the NFSv2 GETACL result encoder
    f29c2f57cdf7 EDAC/i10nm: fix refcount leak in pci_get_dev_wrapper()
    6a9592cd3482 irqchip/loongson-liointc: Fix improper error handling in liointc_init()
    773c9d7f127f irqchip/wpcm450: Fix memory leak in wpcm450_aic_of_init()
    12f45dc266f8 irqchip: gic-pm: Use pm_runtime_resume_and_get() in gic_probe()
    9e04d2548a02 irqchip/loongson-pch-pic: Fix translate callback for DT path
    e0d8b51bbe84 thermal: core: fix some possible name leaks in error paths
    751f12696d79 platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
    254d2d322721 perf/x86/intel/uncore: Fix reference count leak in __uncore_imc_init_box()
    dc7f07bc1ebb perf/x86/intel/uncore: Fix reference count leak in snr_uncore_mmio_map()
    bd66877c0b3b perf/x86/intel/uncore: Fix reference count leak in hswep_has_limit_sbox()
    a7be6b849b53 perf/x86/intel/uncore: Fix reference count leak in sad_cfg_iio_topology()
    c00901e98b1e ACPI: pfr_update: use ACPI_FREE() to free acpi_object
    ae3075b54fa8 ACPI: pfr_telemetry: use ACPI_FREE() to free acpi_object
    f0d5624fbe37 mailbox: pcc: Reset pcc_chan_count to zero in case of PCC probe failure
    290dd73b943c PNP: fix name memory leak in pnp_alloc_dev()
    fb7f50d9b87a selftests/efivarfs: Add checking of the test return value
    faf8fd9f576a MIPS: vpe-cmp: fix possible memory leak while module exiting
    ab3d47c1fd02 MIPS: vpe-mt: fix possible memory leak while module exiting
    205f5e984d30 cpufreq: qcom-hw: Fix the frequency returned by cpufreq_driver->get()
    a753ee510365 selftests: cgroup: fix unsigned comparison with less than zero
    0b2128b70849 ocfs2: fix memory leak in ocfs2_stack_glue_init()
    890d91b31f48 lib/fonts: fix undefined behavior in bit shift for get_default_font
    b457907d5067 proc: fixup uptime selftest
    21bec0ebb854 timerqueue: Use rb_entry_safe() in timerqueue_getnext()
    790c52369e5d platform/x86: huawei-wmi: fix return value calculation
    51b2ea9e4e53 lib/debugobjects: fix stat count and optimize debug_objects_mem_init
    e9b4dc13d32c perf: Fix possible memleak in pmu_dev_alloc()
    619dd807f993 selftests/ftrace: event_triggers: wait longer for test_event_enable
    14addeebbb0f ACPI: irq: Fix some kernel-doc issues
    bb1878d741ff x86/split_lock: Add sysctl to control the misery mode
    242e23be8f31 cpufreq: qcom-hw: Fix memory leak in qcom_cpufreq_hw_read_lut()
    cfea50b0e597 fs: don't audit the capability check in simple_xattr_list()
    574b10475d69 PM: hibernate: Fix mistake in kerneldoc comment
    fa90769d3f25 x86/sgx: Reduce delay and interference of enclave release
    44de1adb2484 sched/psi: Fix possible missing or delayed pending event
    3878f601e14c alpha: fix syscall entry in !AUDUT_SYSCALL case
    84fe26b06f82 alpha: fix TIF_NOTIFY_SIGNAL handling
    dc0da257ebaf cpuidle: dt: Return the correct numbers of parsed idle states
    e7c542d2cfae sched/uclamp: Cater for uclamp in find_energy_efficient_cpu()'s early exit condition
    cbd8c040409c sched/uclamp: Make cpu_overutilized() use util_fits_cpu()
    324ce6e2c603 sched/uclamp: Make asym_fits_capacity() use util_fits_cpu()
    3b9c1559de8c sched/uclamp: Make select_idle_capacity() use util_fits_cpu()
    75ba48621b33 sched/uclamp: Fix fits_capacity() check in feec()
    d355960543a7 sched/uclamp: Make task_fits_capacity() use util_fits_cpu()
    0ef8dac24646 sched/uclamp: Fix relationship between uclamp and migration margin
    7e4831539706 ovl: remove privs in ovl_fallocate()
    155428ea2026 ovl: remove privs in ovl_copyfile()
    82855e986453 tpm/tpm_crb: Fix error message in __crb_relinquish_locality()
    60eb1529a300 tpm/tpm_ftpm_tee: Fix error handling in ftpm_mod_init()
    1abbeab55631 tpm: Add flag to use default cancellation policy
    05ab9752f975 tpm: tis_i2c: Fix sanity check interrupt enable mask
    63f089c0365e arch: arm64: apple: t8103: Use standard "iommu" node name
    2f82381d0681 pstore: Avoid kcore oops by vmap()ing with VM_IOREMAP
    3c6dfce2c76c ARM: mmp: fix timer_read delay
    65f1ff9011f1 pstore/ram: Fix error return code in ramoops_probe()
    5b81f0c6c60e seccomp: Move copy_seccomp() to no failure path.
    ef400e41a85a drivers/perf: hisi: Fix some event id for hisi-pcie-pmu
    5daa0a727c83 soc: apple: rtkit: Stop casting function pointer signatures
    868d9310c460 soc: apple: sart: Stop casting function pointer signatures
    d20a0234f0d8 arm64: dts: armada-3720-turris-mox: Add missing interrupt for RTC
    a1b28c36ec20 ARM: dts: turris-omnia: Add switch port 6 node
    88b5d11a6d98 ARM: dts: turris-omnia: Add ethernet aliases
    1a8b127d7b15 ARM: dts: armada-39x: Fix assigned-addresses for every PCIe Root Port
    18d8e15a53c6 ARM: dts: armada-38x: Fix assigned-addresses for every PCIe Root Port
    8f4cd6481bbb ARM: dts: armada-375: Fix assigned-addresses for every PCIe Root Port
    0e23b6a16af3 ARM: dts: armada-xp: Fix assigned-addresses for every PCIe Root Port
    aa67f198dc81 ARM: dts: armada-370: Fix assigned-addresses for every PCIe Root Port
    714ae279ac9c ARM: dts: dove: Fix assigned-addresses for every PCIe Root Port
    2460aca3c425 arm64: dts: mt7986: move wed_pcie node
    b2429741cb42 arm64: tegra: Fix non-prefetchable aperture of PCIe C3 controller
    75a0e121937d arm64: tegra: Fix Prefetchable aperture ranges of Tegra234 PCIe controllers
    29ca6ffb0840 arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
    e435f8959aad arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
    81d0b66f185d arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
    bb225f227cb2 arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
    e547c30e963f arm64: dts: mt2712e: Fix unit address for pinctrl node
    cb9bb1895b43 arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
    5e5190363463 arm64: dts: mt6779: Fix devicetree build warnings
    39ce535c4bf1 arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
    ffd7eb587315 arm64: dts: mediatek: mt8195: Fix CPUs capacity-dmips-mhz
    121fa4e630dc ARM: dts: nuvoton: Remove bogus unit addresses from fixed-partition nodes
    3aa5508359f3 riscv: dts: microchip: remove pcie node from the sev kit
    d31b758ee777 arm64: dts: ti: k3-j721s2: Fix the interrupt ranges property for main & wkup gpio intr
    2b2c143237f3 arm64: dts: ti: k3-j7200-mcu-wakeup: Drop dma-coherent in crypto node
    dc7d896b7d50 arm64: dts: ti: k3-j721e-main: Drop dma-coherent in crypto node
    0e2de8570880 arm64: dts: ti: k3-am65-main: Drop dma-coherent in crypto node
    582babe17ea8 perf/smmuv3: Fix hotplug callback leak in arm_smmu_pmu_init()
    adf7c3bbcc81 perf/arm_dmc620: Fix hotplug callback leak in dmc620_pmu_init()
    7772f4de9341 drivers: perf: marvell_cn10k: Fix hotplug callback leak in tad_pmu_init()
    0823732f0aa0 perf: arm_dsu: Fix hotplug callback leak in dsu_pmu_init()
    7f7634d72def arm64: mm: kfence: only handle translation faults
    afafeb0cf5b1 soc: ti: smartreflex: Fix PM disable depth imbalance in omap_sr_probe
    01c972a33cae soc: ti: knav_qmss_queue: Fix PM disable depth imbalance in knav_queue_probe
    5e9e8ee71319 riscv: dts: microchip: fix the icicle's #pwm-cells
    d9d93b6cd047 arm: dts: spear600: Fix clcd interrupt
    9c113e3add61 arm64: dts: qcom: sc7280: Mark all Qualcomm reference boards as LTE
    7d6370223db6 soc/tegra: cbb: Check firewall before enabling error reporting
    b75d11a62bb3 soc/tegra: cbb: Add checks for potential out of bound errors
    d8ed37219e27 soc/tegra: cbb: Update slave maps for Tegra234
    6ede06dde331 soc/tegra: cbb: Use correct master_id mask for CBB NOC in Tegra194
    61eb9624e764 arm64: dts: mt7986: fix trng node name
    5e1a9c98c116 soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()
    0883dc428c95 soc: sifive: ccache: fix missing free_irq() in error path in sifive_ccache_init()
    7ea9128d1a91 soc: sifive: ccache: fix missing iounmap() in error path in sifive_ccache_init()
    48ad27467b00 dt-bindings: pwm: fix microchip corePWM's pwm-cells
    d12b10a78396 arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings
    68093e2e7a41 arm64: dts: renesas: r9a09g011: Fix unit address format error
    4bc03f485add arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock
    e4d95cd9fb15 arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
    8a894fab2d26 arm64: dts: qcom: sm6125: fix SDHCI CQE reg names
    2454706d2645 arm64: dts: qcom: pm6350: Include header for KEY_POWER
    492480a9453e soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index
    a51d57fd6f37 arm64: dts: qcom: sm6350: drop bogus DP PHY clock
    8ab46b95bff6 arm64: dts: qcom: sm8250: drop bogus DP PHY clock
    564a8e6ef47b arm64: dts: qcom: sc7280: fix codec reset line polarity for CRD 1.0/2.0
    efabb772e4bb arm64: dts: qcom: sc7280: fix codec reset line polarity for CRD 3.0/3.1
    c05e7b9c5474 arm64: dts: qcom: sm8250-mtp: fix reset line polarity
    07fe2707eac4 arm64: dts: qcom: msm8996: fix sound card reset line polarity
    4b5f25ae1ba5 arm64: dts: qcom: sm8450: fix UFS PHY registers
    b9002a984c98 arm64: dts: qcom: sm8350: fix UFS PHY registers
    1d488fcb63d3 arm64: dts: qcom: sm8250: fix UFS PHY registers
    b2b777270c94 arm64: dts: qcom: sm8150: fix UFS PHY registers
    e89e8e0648f2 soc: qcom: llcc: make irq truly optional
    91724983c7fd arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary I2S pins
    aceaa757137c arm64: dts: qcom: sm8250: correct LPASS pin pull down
    77777664ccdd arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
    9d043ee0de80 riscv: dts: microchip: fix memory node unit address for icicle
    0eb788089ddb firmware: ti_sci: Fix polled mode during system suspend
    f024ba5e05ab drivers: soc: ti: knav_qmss_queue: Mark knav_acc_firmwares as static
    10ee1f7a0fa0 ARM: dts: stm32: Fix AV96 WLAN regulator gpio property
    0d7d7d9ccf6d ARM: dts: stm32: Drop stm32mp15xc.dtsi from Avenger96
    1c1e7514cf3e objtool, kcsan: Add volatile read/write instrumentation to whitelist
    f3107fca5491 memory: renesas-rpc-if: Clear HS bit during hardware initialization
    85c570c3b33d arm64: dts: fsd: fix drive strength values as per FSD HW UM
    c6c98b75a5db arm64: dts: fsd: fix drive strength macros as per FSD HW UM
    6d2f8d9c14d5 arm64: dts: qcom: msm8916: Drop MSS fallback compatible
    29e76d127ab1 arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
    0094e48d90d5 arm64: dts: qcom: sdm630: fix UART1 pin bias
    40713b3e902a ARM: dts: qcom: apq8064: fix coresight compatible
    56a0ab80c095 arm64: dts: qcom: msm8996: fix GPU OPP table
    fa6d1956270c arm64: dts: qcom: msm8996: fix supported-hw in cpufreq OPP tables
    830c07c7d8dd arm64: dts: qcom: msm8996: Add MSM8996 Pro support
    03cb7d4dacb3 arm64: dts: qcom: sdm845-xiaomi-polaris: fix codec pin conf name
    fbba08a9209f arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
    97e197f5c483 arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
    4d37ecb21de4 arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
    7913fc303d12 usb: musb: remove extra check in musb_gadget_vbus_draw
    e72fab11d350 MIPS: DTS: CI20: fix reset line polarity of the ethernet controller

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d5cf406805..dcfa7f5d6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "72ee515fa8840fdd38fa84d75330b05253f26b80"
-SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
+SRCREV_machine ?= "fd78a53858b7f9195ab53fd98c27736d05bbaf7c"
+SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.1"
+LINUX_VERSION ?= "6.1.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 93bf2e2bf8..c77a90c182 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.1"
+LINUX_VERSION ?= "6.1.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
+SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 67cf09be44..f71c356cc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0c99788b051ad6e9998d1f1faad4d83a78853276"
-SRCREV_machine:qemuarm64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemumips ?= "c5e04f15989e607a92e8f188d8a192f4d4c9e58f"
-SRCREV_machine:qemuppc ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemuriscv64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemuriscv32 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemux86 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemux86-64 ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_machine:qemumips64 ?= "c99762002a808c36fd17f0d8c1158b3fcc2f2b4a"
-SRCREV_machine ?= "17d0acd7d6b43187ac9a8f88a9cc1b283682e693"
-SRCREV_meta ?= "62f8a61df7e306935dee101e7268108956d1baee"
+SRCREV_machine:qemuarm ?= "f3fae08180e0e42fe1d84bc27fadfbe712486e7d"
+SRCREV_machine:qemuarm64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemumips ?= "f33d80dcd64dbdf265f8501370595c9b7672b402"
+SRCREV_machine:qemuppc ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemuriscv64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemuriscv32 ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemux86 ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemux86-64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_machine:qemumips64 ?= "e01e486b21db695c46c12253b92adc7aa0da6d38"
+SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
+SRCREV_meta ?= "b997081241db4b199475893f1008b0418c3b1767"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ebdb69c5b054f115ef5ff72f0bb2aaa1718904e6"
+SRCREV_machine:class-devupstream ?= "4adc0fbe03a69d3189607bf74e82a79c29c08b4a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.1"
+LINUX_VERSION ?= "6.1.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


