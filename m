Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B81C6FA91
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:58 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.20508.1663597730318159856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H7txusZ2;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id j10so17870629qtv.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rQGtA4vKy6n8mArFxOMVEcSwUtICX7KcklT/cjaabao=;
        b=H7txusZ2YhsbXg303PFqzB6dv3Nd8o8Aed64BKZ1LJQPWHtrMKSyKVT/rVVmFUeO0O
         tUBpg5zQEX+t0TLMot/RfRzA29KQ9MK7i+4pnQkj9e95uXooMjSyvLv8H3GMNWYdbAhV
         kATgaxQy5Aj6YM13uiYAmaMsSTYtmzwP0wzo9eOS2TrMoplcAe5XSCojVb6BJNZBG5Rt
         BMX2aRu2s1cs09++RlRCa2pKrdPOxOBjZt8DMRu06C5yrT1MdCsDJpqedfL2UPMWGYJA
         Zm9R26e7SQnjouSBq1dPO9Sdz/hcjnrScEuxdb9sb9WVEYsWdapjc6dSzFZ0sfLVxUpQ
         74Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rQGtA4vKy6n8mArFxOMVEcSwUtICX7KcklT/cjaabao=;
        b=DpUixcntRdaPwMcpqflFytDwTJ04N5UGndv00tYWIS/ixZG8vjQiHHPqTEe7DBhAEL
         diL1ggmo8qyKWp8sGPVIjJIjZP8gEM+XrMRj2LkNXXUb+LHoawY1xSBGeEbmKkxHBKKd
         Ljqrm15TsK52k7N3KeVA76NvUxGUeTf85mjH2GOzgiNtDF3eNjP6/TAVDykwcBAQlwdx
         6n6ou4iC2WnSCYsUSJnxpH7GIYaw9GPQuw9ax8SDB3CLFEVS6AEOEyGRqsi5yy0w1FH9
         2IQoTuXqb2QJ2Ce8a/2+V9Q+dVIwux3laH237IMAaFPd08EcZD4Lg4795cJy9tluJRxi
         LTiQ==
X-Gm-Message-State: ACrzQf1TtdFfnGGvO0V1VxbSN1rOlxueBmaUL1RufRj3IIcGYGtBxL1U
	U5mDBT0H0pHfS+Q/C3Lol5FsGR2C5ps=
X-Google-Smtp-Source: 
 AMsMyM5p94UzmhJE6SJUCH9Wtw/6rgfLUPtgm983+u1vXgC1QnMu1jYoHX7/lzB0wT/PLj13RkJaRw==
X-Received: by 2002:ac8:5b8c:0:b0:35b:b653:70cb with SMTP id
 a12-20020ac85b8c000000b0035bb65370cbmr15322860qta.477.1663597729122;
        Mon, 19 Sep 2022 07:28:49 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] linux-yocto/5.19: update to v5.19.9
Date: Mon, 19 Sep 2022 10:28:33 -0400
Message-Id: 
 <f73904a353e6358324ace5fa6bd4a6c136cc85c2.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170871

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d1105a680e66 Linux 5.19.9
    7e64f6423dc0 drm/amd/display: Removing assert statements for Linux
    56bd559bb9d5 drm/amd/display: Add SMU logging code
    32e4b8dbc911 iommu: Fix false ownership failure on AMD systems with PASID activated
    77a2d61334f7 iommu/virtio: Fix interaction with VFIO
    420d20457155 iommu/vt-d: Correctly calculate sagaw value of IOMMU
    ded16152d248 arm64/bti: Disable in kernel BTI when cross section thunks are broken
    7d40396e6d73 hwmon: (asus-ec-sensors) autoload module via DMI data
    447fb910846c hwmon: (asus-ec-sensors) add definitions for ROG ZENITH II EXTREME
    26464ff5cc8e hwmon: (asus-ec-sensors) add missing sensors for X570-I GAMING
    667cada538da hwmon: (asus-ec-sensors) add support for Maximus XI Hero
    4091d4f487e4 hwmon: (asus-ec-sensors) add support for Strix Z690-a D4
    c4a068c4e052 Revert "arm64: kasan: Revert "arm64: mte: reset the page tag in page->flags""
    2652720096ea perf stat: Fix L2 Topdown metrics disappear for raw events
    61e51bae8386 perf evlist: Always use arch_evlist__add_default_attrs()
    9516acba29e3 iommu/vt-d: Fix possible recursive locking in intel_iommu_init()
    53b284a895f0 hwmon: (mr75203) enable polling for all VM channels
    ad460e86ad86 hwmon: (mr75203) fix multi-channel voltage reading
    7055f297801f hwmon: (mr75203) fix voltage equation for negative source input
    8c9fbcaf190a hwmon: (mr75203) update pvt->v_num and vm_num to the actual number of used sensors
    9c6c9aec6896 hwmon: (mr75203) fix VM sensor allocation when "intel,vm-map" not defined
    ee37a7045c76 net: dsa: felix: tc-taprio intervals smaller than MTU should send at least one packet
    c078abef701d time64.h: consolidate uses of PSEC_PER_NSEC
    1ceb383def1e s390/boot: fix absolute zero lowcore corruption on boot
    7c74f03a623d iommu/amd: use full 64-bit value in build_completion_wait()
    f7f13b8d49bf swiotlb: avoid potential left shift overflow
    36512a3ddd39 bonding: accept unsolicited NA message
    53d3c40591ad net: bonding: replace dev_trans_start() with the jiffies of the last ARP/NS
    1749fdc24c54 i40e: Fix ADQ rate limiting for PF
    2b7758a7a9da i40e: Refactor tc mqprio checks
    c95624ba520f kbuild: disable header exports for UML in a straightforward way
    bb6c5b187aaa MIPS: loongson32: ls1c: Fix hang during startup
    37a0883c5824 Smack: Provide read control for io_uring_cmd
    2ad39828ee35 selinux: implement the security_uring_cmd() LSM hook
    13069e1c8fef lsm,io_uring: add LSM hooks for the new uring_cmd file op
    1578775f94d1 ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
    6400eca5a3d2 ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
    f3cf916c93dc hwmon: (tps23861) fix byte order in resistance register
    0f9f9c73da37 perf record: Fix synthesis failure warnings
    1b388709906b perf script: Fix Cannot print 'iregs' field for hybrid systems
    4357706ee8f4 perf dlfilter dlfilter-show-cycles: Fix types for print format
    7bb2200856df libperf evlist: Fix per-thread mmaps for multi-threaded targets
    5ec0821b85ff sch_sfb: Also store skb len before calling child enqueue
    9da303e1e7f9 net: phy: lan87xx: change interrupt src of link_up to comm_ready
    dde284a85f7b io_uring: recycle kbuf recycle on tw requeue
    89fcb70f1acd net/smc: Fix possible access to freed memory in link clear
    e484616810f8 net: ethernet: mtk_eth_soc: check max allowed hash in mtk_ppe_check_skb
    0378b06e612e net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear
    e502794fb858 net: dsa: felix: access QSYS_TAG_CONFIG under tas_lock in vsc9959_sched_speed_set
    27474e8bfcdf net: dsa: felix: disable cut-through forwarding for frames oversized for tc-taprio
    02410f02f6c2 RDMA/irdma: Report RNR NAK generation in device caps
    d9cfeef3a2e6 RDMA/irdma: Return correct WC error for bind operation failure
    02516406f2ea RDMA/irdma: Return error on MR deregister CQP failure
    083f5179fe6f RDMA/irdma: Report the correct max cqes from query device
    ddb0d1d4d4ff nvmet: fix mar and mor off-by-one errors
    9280b9de09fc btrfs: fix the max chunk size and stripe length calculation
    3c20e4cd54eb tcp: fix early ETIMEDOUT after spurious non-SACK RTO
    ba3f445d6d87 nvme-tcp: fix regression that causes sporadic requests to time out
    c3eb461aa56e nvme-tcp: fix UAF when detecting digest errors
    94c34faaafe7 erofs: fix pcluster use-after-free on UP platforms
    5f7f40e0a278 erofs: fix error return code in erofs_fscache_{meta_,}read_folio
    56fd5dcf111b btrfs: zoned: fix mounting with conventional zones
    7b4cc3e4b28a RDMA/mlx5: Set local port to one when accessing counters
    83c43fd872e3 IB/core: Fix a nested dead lock as part of ODP flow
    56ad3f475482 ipv6: sr: fix out-of-bounds read when setting HMAC data.
    17589c4ee370 bonding: add all node mcast address when slave up
    c561ad9802f6 bonding: use unspecified address if no available link local address
    1751bf719df9 RDMA/siw: Pass a pointer to virt_to_page()
    4c9a8adb14d2 block: don't add partitions if GD_SUPPRESS_PART_SCAN is set
    26a6d7d42972 xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
    51705da8cf5e iavf: Detach device during reset task
    38af35bec59a i40e: Fix kernel crash during module removal
    14c1d71b4330 ice: use bitmap_free instead of devm_kfree
    07f40e9f0ff3 ice: Fix DMA mappings leak
    6730c48ed6b0 tcp: TX zerocopy should not sense pfmemalloc status
    57b099b6349a net: introduce __skb_fill_page_desc_noacc
    63e19e592980 tipc: fix shift wrapping bug in map_get()
    8f796f36f5ba sch_sfb: Don't assume the skb is still around after enqueueing to child
    d979f00b0fea Revert "net: phy: meson-gxl: improve link-up behavior"
    c07642fee989 kunit: fix assert_type for comparison macros
    adbb4a4f740f afs: Use the operation issue time instead of the reply time for callbacks
    0ee6ec46de48 rxrpc: Fix an insufficiently large sglist in rxkad_verify_packet_2()
    409a7486c4cf rxrpc: Fix ICMP/ICMP6 error handling
    e9d0362a41d5 ALSA: usb-audio: Register card again for iface over delayed_register option
    9cd9a55ca3df ALSA: usb-audio: Inform the delayed registration more properly
    f2c70f56f762 RDMA/srp: Set scmnd->result only when scmnd is not NULL
    6cf0609154b2 netfilter: nf_conntrack_irc: Fix forged IP logic
    8acba0b39cf3 riscv: dts: microchip: use an mpfs specific l2 compatible
    94ed8eeb8d9a netfilter: nf_tables: clean up hook list when offload flags check fails
    e62ff26f1119 netfilter: br_netfilter: Drop dst references before setting.
    715ab32367f9 ARM: dts: at91: sama5d2_icp: don't keep vdd_other enabled all the time
    495cca3f62c6 ARM: dts: at91: sama5d27_wlsom1: don't keep ldo2 enabled all the time
    b6b94483102d ARM: dts: at91: sama7g5ek: specify proper regulator output ranges
    645ac9718e1f ARM: dts: at91: sama5d2_icp: specify proper regulator output ranges
    2fc2ea1341e6 ARM: dts: at91: sama5d27_wlsom1: specify proper regulator output ranges
    7efca37d3178 ARM: at91: pm: fix DDR recalibration when resuming from backup and self-refresh
    86f07e220b8d ARM: at91: pm: fix self-refresh for sama7g5
    5212d958f651 wifi: wilc1000: fix DMA on stack objects
    374b04cb6e7b RDMA/hns: Remove the num_qpc_timer variable
    090f6a3c4d91 RDMA/hns: Fix wrong fixed value of qp->rq.wqe_shift
    dd20bd803568 RDMA/hns: Fix supported page size
    653500b400d5 soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs
    811b2bfda3d6 RDMA/cma: Fix arguments order in net device validation
    f9c6980d8fdd arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number
    5becc531a3fa RDMA/irdma: Fix drain SQ hang with no completion
    26e27bcb3d3d tee: fix compiler warning in tee_shm_register()
    6e4ce9eb7450 ASoC: SOF: Kconfig: Make IPC_MESSAGE_INJECTOR depend on SND_SOC_SOF
    6db11941aa0f ASoC: SOF: Kconfig: Make IPC_FLOOD_TEST depend on SND_SOC_SOF
    8fb6a79a7e30 regulator: core: Clean up on enable failure
    99fc0f42f834 arm64: dts: freescale: verdin-imx8mp: fix atmel_mxt_ts reset polarity
    ab7db01d23ad arm64: dts: freescale: verdin-imx8mm: fix atmel_mxt_ts reset polarity
    d536d38558bd arm64: dts: imx8mm-venice-gw7901: fix port/phy validation
    0c64a21e6f15 arm64: dts: verdin-imx8mm: add otg2 pd to usbphy
    60a7ee22e6d0 soc: imx: gpcv2: Assert reset before ungating clock
    2a107bcb0502 arm64: dts: ls1028a-qds-65bb: don't use in-band autoneg for 2500base-x
    cf1459d1e593 ARM: dts: imx6qdl-kontron-samx6i: fix spi-flash compatible
    cc868e063033 ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
    8b21a2a7709b ARM: dts: imx6qdl-vicut1.dtsi: Fix node name backlight_led
    6f3deed67b5b RDMA/rtrs-srv: Pass the correct number of entries for dma mapped SGL
    fd666940d277 RDMA/rtrs-clt: Use the right sg_cnt after ib_dma_map_sg
    cffeb3b329ac arm64: dts: imx8mq-tqma8mq: Remove superfluous interrupt-names
    2b44191290fb arm64: dts: imx8mp-venice-gw74xx: fix sai2 pin settings
    15ff1f17847c regmap: spi: Reserve space for register address/padding
    5add5a89bf9a ASoC: qcom: sm8250: add missing module owner
    6bdd557e6c1d arm64: dts: imx8mm-verdin: use level interrupt for mcp251xfd
    459b8801236c arm64: dts: imx8mm-verdin: update CAN clock to 40MHz
    9383a11e4322 Revert "soc: imx: imx8m-blk-ctrl: set power device name"
    cd1e3f999387 ASoC: cs42l42: Only report button state if there was a button interrupt
    048f549c629a spi: bitbang: Fix lsb-first Rx
    2a3090885690 smb3: missing inode locks in zero range
    ef69b108b52c cifs: remove useless parameter 'is_fsctl' from SMB2_ioctl()
    c0deb027c99c cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
    bba6910b3c6d cgroup: Elide write-locking threadgroup_rwsem when updating csses on an empty subtree
    8a8d8a1ad791 scsi: lpfc: Add missing destroy_workqueue() in error path
    41acb064c4e0 scsi: mpt3sas: Fix use-after-free warning
    8974d2ab8473 drm/i915: Implement WaEdpLinkRateDataReload
    3a1381628082 drm/i915/slpc: Let's fix the PCODE min freq table setup for SLPC
    ab620fc788f6 drm/i915/bios: Copy the whole MIPI sequence block
    4484ce97a781 nvmet: fix a use-after-free
    7ea6589d0ff6 driver core: fix driver_set_override() issue with empty strings
    3a6279d243cb drm/amd/display: fix memory leak when using debugfs_lookup()
    0c32a93963e0 sched/debug: fix dentry leak in update_sched_domain_debugfs
    69f8701fe137 debugfs: add debugfs_lookup_and_remove()
    24988042c561 perf: RISC-V: fix access beyond allocated array
    eea55b307d96 kprobes: Prohibit probes in gate area
    5d721bf22293 vfio/type1: Unpin zero pages
    fddebf9a3556 btrfs: zoned: fix API misuse of zone finish waiting
    9a196afce18e btrfs: zoned: set pseudo max append zone limit in zone emulation mode
    42e84c466791 tracing: Fix to check event_mutex is held while accessing trigger list
    3b8291c33b76 tracing: hold caller_addr to hardirq_{enable,disable}_ip
    72e9640edb2d tracefs: Only clobber mode/uid/gid on remount if asked
    8293e61bbf90 ALSA: usb-audio: Fix an out-of-bounds bug in __snd_usb_parse_audio_interface()
    ef38df2b19cc ALSA: usb-audio: Clear fixed clock rate at closing EP
    271f862ebc60 ALSA: usb-audio: Split endpoint setups for hw_params and prepare
    66a0abeea469 ALSA: aloop: Fix random zeros in capture data when using jiffies timer
    74276092fb7f ALSA: hda: Once again fix regression of page allocations with IOMMU
    4204a01ffce9 ALSA: emu10k1: Fix out of bounds access in snd_emu10k1_pcm_channel_alloc()
    723ac5ab2891 ALSA: pcm: oss: Fix race at SNDCTL_DSP_SYNC
    ff939d25ac97 drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
    97c9341e6579 drm/amdgpu: add sdma instance check for gfx11 CGCG
    6f197b4a53f5 x86/sev: Mark snp_abort() noreturn
    eab18703e0fa fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()
    914b3d999d4e fbdev: fbcon: Destroy mutex on freeing struct fb_info
    4b688f85e81f fbdev: omapfb: Fix tests for platform_get_irq() failure
    cebda5e53643 md: Flush workqueue md_rdev_misc_wq in md_alloc()
    a62701db411f net/core/skbuff: Check the return value of skb_copy_bits()
    73085208dd6b cpufreq: check only freq_table in __resolve_freq()
    dae42083b045 thermal/int340x_thermal: handle data_vault when the value is ZERO_SIZE_PTR
    931144e785da netfilter: conntrack: work around exceeded receive window
    31e75db8921c arm64: errata: add detection for AMEVCNTR01 incrementing incorrectly
    078dac729f73 parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
    050e4a4c4c26 parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
    fe7f0ac20b86 Revert "parisc: Show error if wrong 32/64-bit compiler is being used"
    ab2821ca9b6c scsi: ufs: core: Reduce the power mode change timeout
    16cb367daa44 drm/radeon: add a force flush to delay work when radeon
    8e77c29c0ad3 drm/amdgpu: Remove the additional kfd pre reset call for sriov
    cb7eb0aec233 drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
    f589c1fcc70e drm/amdgpu: fix hive reference leak when adding xgmi device
    b9a123550cf0 drm/amdgpu: Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to psp_hw_fini
    b537612692f4 drm/gem: Fix GEM handle release errors
    2af3d5515ea0 scsi: megaraid_sas: Fix double kfree()
    480c7ffec03a scsi: core: Allow the ALUA transitioning state enough time
    cc3f0edf00b1 scsi: qla2xxx: Disable ATIO interrupt coalesce for quad port ISP27XX
    871e0612a88c Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
    77d91ec788e9 soc: fsl: select FSL_GUTS driver for DPIO
    9224d6d81592 fs: only do a memory barrier for the first set_buffer_uptodate()
    3c2238985418 wifi: iwlegacy: 4965: corrected fix for potential off-by-one overflow in il4965_rs_fill_link_cmd()
    f7f3001723e3 wifi: mt76: mt7921e: fix crash in chip reset fail
    d46815a8f26c efi: capsule-loader: Fix use-after-free in efi_capsule_write
    fba41e4fa9ff efi: libstub: Disable struct randomization
    70cb6afe0e2f Linux 5.19.8
    132331c1f605 tty: n_gsm: avoid call of sleeping functions from atomic context
    2af54fe4f713 tty: n_gsm: replace kicktimer with delayed_work
    55f799f2c34a tty: n_gsm: initialize more members at gsm_alloc_mux()
    5aa37f951034 tty: n_gsm: add sanity check for gsm->receive in gsm_receive_buf()
    c6c5bdf73544 drm/i915: Skip wm/ddb readout for disabled pipes
    747a192e4674 drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk
    1dd7a8e7a044 drm/i915/guc: clear stalled request after a reset
    4cde8745d15e drm/i915/backlight: Disable pps power hook for aux based backlight
    0a26889698d8 ALSA: seq: Fix data-race at module auto-loading
    54b8252562e9 ALSA: seq: oss: Fix data-race for max_midi_devs access
    b0dfc4412e61 ALSA: hda/realtek: Add speaker AMP init for Samsung laptops with ALC298
    2473382f79f4 ALSA: memalloc: Revive x86-specific WC page allocations again
    05d101e27cfd net: mac802154: Fix a condition in the receive path
    89b1ca91677f net: Use u64_stats_fetch_begin_irq() for stats fetch.
    df93a4b439ee ip: fix triggering of 'icmp redirect'
    c0445feb80a4 wifi: mac80211: Fix UAF in ieee80211_scan_rx()
    864e280cb3a9 wifi: mac80211: Don't finalize CSA in IBSS mode if state is disconnected
    a4c5cc349768 driver core: Don't probe devices after bus_type.match() probe deferral
    731f903c56ea arm64/kexec: Fix missing extra range for crashkres_low.
    c4c798fe98ad dma-buf/dma-resv: check if the new fence is really later
    1a065e4673cb USB: gadget: Fix obscure lockdep violation for udc_mutex
    bdaac12bb135 usb: gadget: mass_storage: Fix cdrom data transfers on MAC-OS
    e78ca7f51ac5 usb: gadget: f_uac2: fix superspeed transfer
    3cf44c63bc1b usb: xhci-mtk: fix bandwidth release issue
    283a781b9754 usb: xhci-mtk: relax TT periodic bandwidth allocation
    d5eb850b3e88 USB: core: Prevent nested device-reset calls
    3047e3746114 s390: fix nospec table alignments
    ade001d99aea s390/hugetlb: fix prepare_hugepage_range() check for 2 GB hugepages
    56b409037d62 usb-storage: Add ignore-residue quirk for NXP PN7462AU
    2ae507d6a554 USB: cdc-acm: Add Icom PMR F3400 support (0c26:0020)
    459edcb1e133 usb: cdns3: fix incorrect handling TRB_SMM flag for ISOC transfer
    142e8c06e5f9 usb: cdns3: fix issue with rearming ISO OUT endpoint
    62ef6b5f280b usb: dwc2: fix wrong order of phy_power_on and phy_init
    dbf5cb0137dc usb: typec: tcpm: Return ENOTSUPP for power supply prop writes
    e68a2682e997 usb: typec: intel_pmc_mux: Add new ACPI ID for Meteor Lake IOM device
    91416070b62a usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
    3d4044c9e6d2 Revert "usb: typec: ucsi: add a common function ucsi_unregister_connectors()"
    1f45b7e93c94 USB: serial: option: add support for Cinterion MV32-WA/WB RmNet mode
    cce30bc7ae48 USB: serial: option: add Quectel EM060K modem
    2a305d1b9055 USB: serial: option: add support for OPPO R11 diag port
    bda33a5038a9 USB: serial: cp210x: add Decagon UCA device id
    40bc52e14011 USB: serial: ch341: fix disabled rx timer on older devices
    cffe34a4d070 USB: serial: ch341: fix lost character on LCR updates
    735e7d083491 usb: dwc3: fix PHY disable sequence
    492a177db75f usb: dwc3: gadget: Avoid duplicate requests to enable Run/Stop
    5ea9baeecd21 usb: dwc3: disable USB core PHY management
    d9debf9d563e xhci: Add grace period after xHC start to prevent premature runtime suspend.
    d69c738ac931 media: mceusb: Use new usb_control_msg_*() routines
    9d539109b35b usb: dwc3: pci: Add support for Intel Raptor Lake
    4ef3f00c4230 thunderbolt: Check router generation before connecting xHCI
    9fe0e9937257 thunderbolt: Use the actual buffer in tb_async_error()
    06cb054244cc xen-blkfront: Cache feature_persistent value before advertisement
    6d4ee444e8c7 xen-blkfront: Advertise feature-persistent as user requested
    d925c3bf8593 xen-blkback: Advertise feature-persistent as user requested
    9a108bd6d909 mm: pagewalk: Fix race between unmap and page walker
    3aa6a9f84ba2 xen/grants: prevent integer overflow in gnttab_dma_alloc_pages()
    4e2eecb92a18 powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_register()
    3d92ba262865 KVM: x86: Mask off unsupported and unknown bits of IA32_ARCH_CAPABILITIES
    e13ef600a247 gpio: realtek-otto: switch to 32-bit I/O
    97ca48ec17f7 gpio: pca953x: Add mutex_lock for regcache sync in PM
    3263984c7acd hwmon: (gpio-fan) Fix array out of bounds access
    7d54f19f7f4f clk: bcm: rpi: Add missing newline
    c8b04b731d43 clk: bcm: rpi: Prevent out-of-bounds access
    838dff24979d clk: bcm: rpi: Fix error handling of raspberrypi_fw_get_rate
    3a58d2aa45f8 powerpc/papr_scm: Fix nvdimm event mappings
    dd5ec5416171 Input: rk805-pwrkey - fix module autoloading
    5e7ddb091ef2 clk: core: Fix runtime PM sequence in clk_core_unprepare()
    27c26c2a5857 Revert "clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops"
    c25e0ca0d981 clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
    079ea01fc5f0 drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
    d6c8cc2da50f clk: ti: Fix missing of_node_get() ti_find_clock_provider()
    26b03f8039b4 riscv: kvm: move extern sbi_ext declarations to a header
    5424fd0429c5 KVM: VMX: Heed the 'msr' argument in msr_write_intercepted()
    38a6b469bf22 cifs: fix small mempool leak in SMB2_negotiate()
    b2a97babb0a5 binder: fix alloc->vma_vm_mm null-ptr dereference
    603a47f2ae56 binder: fix UAF of ref->proc caused by race condition
    71f7644b444f mmc: core: Fix inconsistent sd3_bus_mode at UHS-I SD voltage switch failure
    bb4be611c2f5 mmc: core: Fix UHS-I SD 1.8V workaround branch
    9f78dda3c3bb landlock: Fix file reparenting without explicit LANDLOCK_ACCESS_FS_REFER
    23475d8ebcca USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
    baf92485d111 firmware_loader: Fix memory leak in firmware upload
    d380d40930a6 firmware_loader: Fix use-after-free during unregister
    e0578e603065 misc: fastrpc: fix memory corruption on open
    c0425c2facd9 misc: fastrpc: fix memory corruption on probe
    5461b547c204 iio: adc: mcp3911: use correct formula for AD conversion
    2838fdab0c3d iio: adc: mcp3911: correct "microchip,device-addr" property
    76608a25fc6c iio: ad7292: Prevent regulator double disable
    3f7f49d8135c iio: light: cm3605: Fix an error handling path in cm3605_probe()
    b533b9d3a0d1 Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag
    3e05af2f827b tty: serial: lpuart: disable flow control while waiting for the transmit engine to complete
    6f130dffc315 musb: fix USB_MUSB_TUSB6010 dependency
    c904fe03c4bd vt: Clear selection before changing the font
    8b08d4f97233 powerpc/rtas: Fix RTAS MSR[HV] handling for Cell
    b29ee1551512 powerpc: align syscall table for ppc32
    8b539b5f058b Revert "powerpc: Remove unused FW_FEATURE_NATIVE references"
    eaffa77b8359 staging: r8188eu: add firmware dependency
    02c09dbb1554 staging: r8188eu: Add Rosewill USB-N150 Nano to device tables
    b1727def8509 staging: rtl8712: fix use after free bugs
    418a52be5d6b tty: serial: atmel: Preserve previous USART mode if RS485 disabled
    a17353e3ce85 serial: fsl_lpuart: RS485 RTS polariy is inverse
    ad936d6dc25b platform/mellanox: mlxreg-lc: Fix locking issue
    daa0d0282b31 platform/mellanox: mlxreg-lc: Fix coverity warning
    357321557920 mm/slab_common: Deleting kobject in kmem_cache_destroy() without holding slab_mutex/cpu_hotplug_lock
    b823c22561d4 soundwire: qcom: fix device status array range
    74d2d7a905d1 net/smc: Remove redundant refcount increase
    1e789ee9b074 Revert "sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb"
    6c4ef0592929 tcp: annotate data-race around challenge_timestamp
    ca94a5066676 sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb
    f865976baa85 kcm: fix strp_init() order and cleanup
    1579573b69d6 mlxbf_gige: compute MDIO period based on i1clk
    4854a59b9a9c cachefiles: make on-demand request distribution fairer
    dae646810dc8 cachefiles: fix error return code in cachefiles_ondemand_copen()
    031089e2eb2e ethernet: rocker: fix sleep in atomic context bug in neigh_timer_handler
    8164b6c32f29 net: lan966x: improve error handle in lan966x_fdma_rx_get_frame()
    81b7493d7415 net: phy: micrel: Make the GPIO to be non-exclusive
    0c6c52285715 net/sched: fix netdevice reference leaks in attach_default_qdiscs()
    fb155f6597cd net: sched: tbf: don't call qdisc_put() while holding tree lock
    c2798203315f drm/i915: fix null pointer dereference
    ca537da42fbd net: dsa: xrs700x: Use irqsave variant for u64 stats update
    321d2a2b9520 nfp: flower: fix ingress police using matchall filter
    c0c1c0241917 openvswitch: fix memory leak at failed datapath creation
    c2cc359e33e5 net: smsc911x: Stop and start PHY during suspend and resume
    615391126f5d net: sparx5: fix handling uneven length packets in manual extraction
    92f7ab56bf35 Bluetooth: hci_sync: hold hdev->lock when cleanup hci_conn
    2f868038a43c Bluetooth: hci_event: Fix checking conn for le_conn_complete_evt
    02e49daf3fa3 Bluetooth: hci_sync: Fix suspend performance regression
    d6b3f3cd7bd7 Bluetooth: hci_event: Fix vendor (unknown) opcode status handling
    2459615a8d7f bpf: Do mark_chain_precision for ARG_CONST_ALLOC_SIZE_OR_ZERO
    10608641b055 bpf: Tidy up verifier check_func_arg()
    840fbb6845ab bpf: Allow helpers to accept pointers with a fixed size
    cdbaf57293f0 Revert "xhci: turn off port power in shutdown"
    7081b2f34ff2 xhci: Fix null pointer dereference in remove if xHC has only one roothub
    1f67a7c661b1 wifi: cfg80211: debugfs: fix return type in ht40allow_map_read()
    57cfdf9edcbc ALSA: hda: intel-nhlt: Correct the handling of fmt_config flexible array
    26eaff38e1fc drm/i915/display: avoid warnings when registering dual panel backlight
    97434cb55bd8 drm/i915/ttm: fix CCS handling
    ba632ad0bacb bpf: Fix a data-race around bpf_jit_limit.
    15f3b89bd521 ieee802154/adf7242: defer destroy_workqueue call
    2914e46f5b03 drm/i915/gvt: Fix Comet Lake
    a1a05d3ae582 bpf, cgroup: Fix kernel BUG in purge_effective_progs
    ca41835c753a ip_tunnel: Respect tunnel key's "flow_flags" in IP tunnels
    257f1447d7c2 bpf: Restrict bpf_sys_bpf to CAP_PERFMON
    10ee118a1756 skmsg: Fix wrong last sg check in sk_msg_recvmsg()
    37e05ea2c5fb iio: adc: mcp3911: make use of the sign bit
    e7cf5a0caba9 peci: aspeed: fix error check return value of platform_get_irq()
    5d5383b8dae2 drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails
    2c75891d56ab xsk: Fix corrupted packets for XDP_SHARED_UMEM
    c77b724cddfb platform/x86: x86-android-tablets: Fix broken touchscreen on Chuwi Hi8 with Windows BIOS
    0d5bed97ff3d platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
    b0d3a4f4c3f3 drm/msm/dsi: Fix number of regulators for SDM660
    847dba3aa345 drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
    b99ab590a5ac drm/msm/dp: delete DP_RECOVERED_CLOCK_OUT_EN to fix tps4
    83cc61f72e6a drm/msm/dpu: populate wb or intf before reset_intf_cfg
    9f490254854f drm/msm/dsi: fix the inconsistent indenting
    adbe8cb18635 drm/msm/dp: make eDP panel as the first connected connector

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 2997a533f7..29b7760298 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "036e789efdca81efc810fa003153c084003828b0"
-SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
+SRCREV_machine ?= "3596666292dcf3fc078090666dc327d233695310"
+SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.7"
+LINUX_VERSION ?= "5.19.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index f1b5b27f61..65b7070e6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.7"
+LINUX_VERSION ?= "5.19.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_meta ?= "ddb7fe05a2e7050ff604639a0dd53a862902b949"
+SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index c28cf309c6..bafe57df0e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5b0372b52b810d2365b210e69227de1dec6c8d2c"
-SRCREV_machine:qemuarm64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemumips ?= "290081f2609d420e94a7ecaa37fc9bab482b77ab"
-SRCREV_machine:qemuppc ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemuriscv64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemuriscv32 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemux86 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemux86-64 ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_machine:qemumips64 ?= "afd431bd55805b5a980774ebf30b5d8aa4da492e"
-SRCREV_machine ?= "764d3890bc156851da21a5d15a70ec118d1b2fdc"
-SRCREV_meta ?= "3f097510e2c93bc7d9ae84231737bd6228386475"
+SRCREV_machine:qemuarm ?= "9111e441d26961e67bef7866919c51b27e794bac"
+SRCREV_machine:qemuarm64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemumips ?= "5f89b6548b6665f3ebec11266f2c7db2793129da"
+SRCREV_machine:qemuppc ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemuriscv64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemuriscv32 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemux86 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemux86-64 ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_machine:qemumips64 ?= "99613988297ac45653cc81319e63b2821645a3ba"
+SRCREV_machine ?= "44a446e91acea4f2f0d35896763224c3b52a3ed5"
+SRCREV_meta ?= "829511f25a4a868d33019ace607dc7f0a14d3105"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7d0a458e1963128ee5a85bf0584bea5e75149946"
+SRCREV_machine:class-devupstream ?= "d1105a680e66b0482bd18048534c58ecabb5c284"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.7"
+LINUX_VERSION ?= "5.19.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


