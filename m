Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5FBC4167D
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:40 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.1247.1668559117412875724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkXv/cuq;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h21so9866318qtu.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOJz7iz0JceqG/xypv6J2uTgUapRDGE2AUiuekGPF14=;
        b=FkXv/cuqmD7R0ND5oyV9n+5RH6Gq5wyRyj6b80h3uZ4HIcDdiwpO7XPdlyJCARnsm1
         xbZe96M+u41uRNdkAY2dB/ujdHoUnn5jVovAsJTTMUu7Yc/p7QEMktoI549N8ZFrIUgu
         kP5UQqlWrM4cqkrzTAel2fHR8jeJfcYm+vJ/oW63LrNASbFn4FES/1JyfoWoqOrPqoCA
         VB4Xr8lyMQNg0cMTRNR0VToSI450V2uTBP2ndzAv/gvQy6O7n6zhAVoJ3R46r+7LJXW3
         iLNISgW3S44Yn4qgKJ8CKgd5X8Fhllf5NXi9fXAgsem9nkdiOSTJUGtF3PXAqzCw27LF
         Onww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOJz7iz0JceqG/xypv6J2uTgUapRDGE2AUiuekGPF14=;
        b=E/1LHPFbUiDcw4gxfVEOF5qxrBLQ3TeN+66Zif/ApsnIfsAasOfyuW07sEHfgziVmA
         BOJAWtb8Zf/NvsLu2qra9xxu0az2m6DYTznFM1aGSe37CQWygpaLZk7DkZmlk1RcEexy
         qUvCezBuF5W6hx7ZqL5hfcbE+6drDwscXcU0ItfvTM+EoQNJvy97usCIAW+DjmO57m4t
         VLbCv0EXKaKObxX/eLT1RFkAKZZpQUdkjtpTHnXF9txA6VSduYvLrXpqzbn96ALB+c58
         +nQhj0ZiDMCeNQF621rcJMZs2s9DWqKbCYcfZkSBpmj6eOfeANpuc9U6KLQAfeSIgJmh
         DJaQ==
X-Gm-Message-State: ANoB5pnh8ZRAij+/z27dVfwY4ZgZRd5UfWa2Lz5P0UX2W+enyLbLIUPM
	OM1d5rOaxOiT7Kx5AO8NaKisWdMNggTIZQ==
X-Google-Smtp-Source: AA0mqf4uBXHlNqB1TZR7V98wqwhHK/lepqusJAOgoshYgYScmS0RaTNso50/emy+8jfyYUsw4P57JA==
X-Received: by 2002:a05:622a:598f:b0:3a5:2307:9ee6 with SMTP id gb15-20020a05622a598f00b003a523079ee6mr19095052qtb.473.1668559115555;
        Tue, 15 Nov 2022 16:38:35 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:34 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto/5.19: update to v5.19.17
Date: Tue, 15 Nov 2022 19:38:22 -0500
Message-Id: <95a5c6b5d65666eba355bca61fcb87e752505ad2.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173367

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    2b525314c7b5 Linux 5.19.17
    65ea3311ce7c drm/i915/bios: Use hardcoded fp_timing size for generating LFP data pointers
    a34bc0ff223f drm/i915/bios: Validate fp_timing terminator presence
    6ba258c8082f drm/i915: Rename block_size()/block_offset()
    25151f50686e ext4: continue to expand file system when the target size doesn't reach
    5d671a666c69 HID: uclogic: Add missing suffix for digitalizers
    8b922cab735b lib/Kconfig.debug: Add check for non-constant .{s,u}leb128 support to DWARF5
    a2f91e15ceaf Kconfig.debug: add toolchain checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
    01d15d7f3bb1 Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5
    6cfc3d5b06fe kbuild: Add skip_encoding_btf_enum64 option to pahole
    d8861de1c35b drm/amd/display: Fix build breakage with CONFIG_DEBUG_FS=n
    43f49952df6a powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context
    df0da3fc1311 net/ieee802154: don't warn zero-sized raw_sendmsg()
    7b5a94b4dccd Revert "net/ieee802154: reject zero-sized raw_sendmsg()"
    a2852ff5df30 Revert "drm/amd/display: correct hostvm flag"
    72fedefeaaee net: ethernet: ti: davinci_mdio: fix build for mdio bitbang uses
    7a5dc0f4bc45 blk-wbt: fix that 'rwb->wc' is always set to 1 in wbt_init()
    9d4f4dc3cd38 ALSA: usb-audio: Fix last interface check for registration
    0ad680a71ef6 net: ieee802154: return -EINVAL for unknown addr type
    dd691973f67b mm: hugetlb: fix UAF in hugetlb_handle_userfault
    bd3183508842 perf intel-pt: Fix system_wide dummy event for hybrid
    41e4f3b62546 perf intel-pt: Fix segfault in intel_pt_print_info() with uClibc
    18e98d56fdf8 perf: Skip and warn on unknown format 'configN' attrs
    d53d82a9c515 clk: bcm2835: Round UART input clock up
    4fc3d834cad9 clk: bcm2835: Make peripheral PLLC critical
    72b67ce35bcc usb: typec: ucsi: Don't warn on probe deferral
    1d5ad0a874dd fsi: occ: Prevent use after free
    fbcf76240a30 hwmon (occ): Retry for checksum failure
    63a681bcc32a blk-mq: use quiesced elevator switch when reinitializing queues
    6163a5ae097b usb: idmouse: fix an uninit-value in idmouse_open
    fcf82e4553db nvmet-tcp: add bounds check on Transfer Tag
    1ce3c83795b7 nvme: copy firmware_rev on each init
    24e2357041c8 nvme: handle effects after freeing the request
    18c37236b0b0 ext2: Use kvmalloc() for group descriptor array
    2ad8143884b9 scsi: tracing: Fix compile error in trace_array calls when TRACING is disabled
    a5be64ff6d21 staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
    6b2052b365f8 staging: rtl8723bs: fix potential memory leak in rtw_init_drv_sw()
    65bb21134ffc Revert "usb: storage: Add quirk for Samsung Fit flash"
    a5ec6978e657 usb: dwc3: core: Enable GUCTL1 bit 10 for fixing termination error after resume bug
    dd4d06dc5c12 arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
    6289a58d4f19 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
    a9ccd2ab1bec usb: musb: Fix musb_gadget.c rxstate overflow bug
    a40ad4752360 usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
    2cab058f2b14 md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d
    6a0781b8a46d eventfd: guard wake_up in eventfd fs calls as well
    f3ae6aac9e0e HID: nintendo: check analog user calibration for plausibility
    78b0ef14896f HSI: ssi_protocol: fix potential resource leak in ssip_pn_open()
    2d38886ae036 HID: roccat: Fix use-after-free in roccat_read()
    24ba97974ef3 soundwire: intel: fix error handling on dai registration issues
    d4188d2e2842 soundwire: cadence: Don't overwrite msg->buf during write commands
    864934cbe72c bcache: fix set_at_max_writeback_rate() for multiple attached devices
    e225ca58f63a ata: libahci_platform: Sanity check the DT child nodes number
    cc6f0855bf8d blk-throttle: prevent overflow while calculating wait time
    fb5f569bcda8 staging: vt6655: fix potential memory leak
    038e4aa71281 power: supply: adp5061: fix out-of-bounds read in adp5061_get_chg_type()
    b737f60538ab usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
    78e83cfc64b5 iommu/arm-smmu-v3: Make default domain type of HiSilicon PTT device to identity
    62006a72b05e nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
    53b6d7e49998 scsi: 3w-9xxx: Avoid disabling device if failing to enable it
    e0b16bfbd3a4 dmaengine: ti: k3-udma: Reset UDMA_CHAN_RT byte counters to prevent overflow
    04e7cd8c8563 scsi: lpfc: Fix null ndlp ptr dereference in abnormal exit path for GFT_ID
    1f7181ce5891 usb: host: xhci-plat: suspend/resume clks for brcm
    e2df82b8e742 usb: host: xhci-plat: suspend and resume clocks
    72dbdd00fb2a RDMA/rxe: Delete error messages triggered by incoming Read requests
    f2cf53ed2ce2 clk: zynqmp: pll: rectify rate rounding in zynqmp_pll_round_rate
    fb98ebac0169 media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
    704838040f3b media: cx88: Fix a null-ptr-deref bug in buffer_prepare()
    d66fea97671f clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    5f11e22d1d5a ARM: 9242/1: kasan: Only map modules if CONFIG_KASAN_VMALLOC=n
    0d10683a2cd3 ARM: 9234/1: stacktrace: Avoid duplicate saving of exception PC value
    91bcc794c72e ARM: 9233/1: stacktrace: Skip frame pointer boundary check for call_with_stack()
    819a61301275 btrfs: call __btrfs_remove_free_space_cache_locked on cache load failure
    42817b55ea97 btrfs: don't print information about space cache or tree every remount
    a5658aac9fbb btrfs: scrub: try to fix super block errors
    1d520f11f5f4 btrfs: scrub: properly report super block errors in system log
    8e0798d8fc25 btrfs: dump extra info if one free space cache has more bitmaps than it should
    dd0368cc7dd7 arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply
    aa7dbed46a13 arm64: dts: imx8mm-kontron: Use the VSELECT signal to switch SD card IO voltage
    f7205229eed2 kselftest/arm64: Fix validatation termination record after EXTRA_CONTEXT
    010d3fd16a07 ARM: dts: imx6sx-udoo-neo: don't use multiple blank lines
    a78bbaa94455 ARM: dts: imx6sl: use tabs for code indent
    e68c078e2f4b ARM: dts: imx6sx: add missing properties for sram
    91e4ed75545b ARM: dts: imx6sll: add missing properties for sram
    295a1403c79c ARM: dts: imx6sl: add missing properties for sram
    37b648d675c9 ARM: dts: imx6qp: add missing properties for sram
    a6cbafacd5a4 ARM: dts: imx6dl: add missing properties for sram
    008b63067257 ARM: dts: imx6q: add missing properties for sram
    8dc0c1860e38 ARM: dts: imx7d-sdb: config the max pressure for tsc2046
    9fb0373188af ARM: dts: imx6: delete interrupts property if interrupts-extended is set
    5861c094874d drm/amdkfd: Fix UBSAN shift-out-of-bounds warning
    7e8d44956459 drm/amd/display: polling vid stream status in hpo dp blank
    68a6337c14ab drm/amd/display: Remove interface for periodic interrupt 1
    fc211b16a558 drm/dp: Don't rewrite link config when setting phy test pattern
    de2b6ebe0cb7 drm/meson: remove drm bridges at aggregate driver unbind time
    f11aa996fc01 drm/meson: explicitly remove aggregate driver at module unload time
    9190d287f7a6 drm/meson: reorder driver deinit sequence to fix use-after-free bug
    fc273ad2e3f5 drm/amdgpu: fix initial connector audio value
    50f9f5d15eae drm/amd/display: correct hostvm flag
    b892c57a3a04 drm/amdgpu: SDMA update use unlocked iterator
    9a0b26c494d3 ASoC: SOF: add quirk to override topology mclk_id
    6a4c1ca1f3fb ASoC: SOF: pci: Change DMI match info to support all Chrome platforms
    3c72d295e79e ALSA: intel-dspconfig: add ES8336 support for AlderLake-PS
    6c28e90c8fd0 platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
    14992b9f184b platform/x86: hp-wmi: Setting thermal profile fails with 0x06
    c1f00121bf31 platform/chrome: cros_ec: Notify the PM of wake events during resume
    a4b478254264 drm: panel-orientation-quirks: Add quirk for Aya Neo Air
    d52193da78bd drm: panel-orientation-quirks: Add quirk for Anbernic Win600
    a7f778799d49 drm/vc4: vec: Fix timings for VEC modes
    0f1bddc91d55 ALSA: usb-audio: Register card at the last interface
    3f2cfb29dceb drm/admgpu: Skip CG/PG on SOC21 under SRIOV VF
    3509d768e206 drm/amdgpu: Skip the program of MMMC_VM_AGP_* in SRIOV on MMHUB v3_0_0
    3e3be30aa035 drm: bridge: dw_hdmi: only trigger hotplug event on link change
    c6b6279bfdc5 platform/x86: pmc_atom: Improve quirk message to be less cryptic
    fc285549f454 udmabuf: Set ubuf->sg = NULL if the creation of sg table fails
    1533340aa907 drm/amd/display: fix overflow on MIN_I64 definition
    b2e4323e0020 gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()
    e71fe9b97fae drm/komeda: Fix handling of atomic commits in the atomic_commit_tail hook
    2d6708ea5c20 drm: Prevent drm_copy_field() to attempt copying a NULL pointer
    7ab28b8e182e drm: Use size_t type for len variable in drm_copy_field()
    38ba098ef1b6 drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()
    2e896abccf99 r8152: Rate limit overflow messages
    2a75f83ba81c i2c: designware-pci: Group AMD NAVI quirk parts together
    6ffde6e03085 Bluetooth: L2CAP: Fix user-after-free
    44bd0d19c580 bpf: use bpf_prog_pack for bpf_dispatcher
    d72bc08770fa bpf: Adjust kprobe_multi entry_ip for CONFIG_X86_KERNEL_IBT
    35f5e70bdfa7 net: If sock is dead don't access sock's sk_wq in sk_stream_wait_memory
    19fced8ecda1 hwmon: (sht4x) do not overflow clamping operation on 32-bit platforms
    68ff5178d965 wifi: rt2x00: correctly set BBP register 86 for MT7620
    784881e9e7be wifi: rt2x00: set SoC wmac clock register
    227e5eb1bb5a wifi: rt2x00: set VGC gain for both chains of MT7620
    0202c5803d64 wifi: rt2x00: set correct TX_SW_CFG1 MAC register for MT7620
    36576de88fbe wifi: rt2x00: don't run Rt5592 IQ calibration on MT7620
    a9fc0a42ccbf can: bcm: check the result of can_send() in bcm_can_tx()
    eb0a9375bbd8 selftests/bpf: Free the allocated resources after test case succeeds
    c72dad9a1d37 bnxt_en: replace reset with config timestamps
    ef055094df4c Bluetooth: hci_sysfs: Fix attempting to call device_add multiple times
    e812142450e0 Bluetooth: L2CAP: initialize delayed works at l2cap_chan_create()
    26bdfc875559 wifi: rtw89: fix rx filter after scan
    d4b4f6ff8ff1 wifi: rtw89: free unused skb to prevent memory leak
    b32b0cd0eddb wifi: mt76: mt7921: reset msta->airtime_ac while clearing up hw value
    72ef896e80b6 wifi: ath11k: mhi: fix potential memory leak in ath11k_mhi_register()
    9f2395316e48 regulator: core: Prevent integer underflow
    52b43d6402bc Bluetooth: btintel: Mark Intel controller to support LE_STATES quirk
    27574a3f421c wifi: brcmfmac: fix use-after-free bug in brcmf_netdev_start_xmit()
    47c838195c7d iavf: Fix race between iavf_close and iavf_reset_task
    8a648bb49115 rtw89: ser: leave lps with mutex
    56d96f8f9bbd wifi: ath11k: Register shutdown handler for WCN6750
    f3bdba4440d8 xfrm: Update ipcomp_scratches with NULL when freed
    a948da5aba02 net-next: Fix IP_UNICAST_IF option behavior for connected sockets
    7d1e5f5ee93d net: axienet: Switch to 64-bit RX/TX statistics
    05785ba834f2 x86/apic: Don't disable x2APIC if locked
    650fa7d1af15 thunderbolt: Add back Intel Falcon Ridge end-to-end flow control workaround
    0d2649b288b7 wifi: ath9k: avoid uninit memory read in ath9k_htc_rx_msg()
    a9c5c9ce7e58 x86/mce: Retrieve poison range from hardware
    6762c85aaee4 tcp: annotate data-race around tcp_md5sig_pool_populated
    77939e5bcc50 openvswitch: Fix overreporting of drops in dropwatch
    b3fa7d5d5eaa openvswitch: Fix double reporting of drops in dropwatch
    bc3e22550bbb net: ethernet: ti: davinci_mdio: Add workaround for errata i2329
    13180cb88a7b ice: set tx_tstamps when creating new Tx rings via ethtool
    8735e5c122b6 bpftool: Clear errno after libcap's checks
    4d4dcfa6b4e8 wifi: brcmfmac: fix invalid address access when enabling SCAN log level
    e7863058e529 wifi: ath10k: Set tx credit to one for WCN3990 snoc based devices
    6ea71246b7a0 NFSD: fix use-after-free on source server when doing inter-server copy
    14bde62cef7c NFSD: Return nfserr_serverfault if splice_ok but buf->pages have data
    7b593b50f20c x86/entry: Work around Clang __bdos() bug
    d12ad2bb3feb ACPI: x86: Add a quirk for Dell Inspiron 14 2-in-1 for StorageD3Enable
    aff390ceb399 ARM: decompressor: Include .data.rel.ro.local
    6e2a347b3042 thermal: intel_powerclamp: Use get_cpu() instead of smp_processor_id() to avoid crash
    6216b685b8f4 powercap: intel_rapl: fix UBSAN shift-out-of-bounds issue
    dced4eaa9143 MIPS: BCM47XX: Cast memcmp() of function to (void *)
    25b364cb9b72 cpufreq: intel_pstate: Add Tigerlake support in no-HWP mode
    90bfc9ae875d ACPI: tables: FPDT: Don't call acpi_os_map_memory() on invalid phys address
    ed42391164e6 fortify: Fix __compiletime_strlen() under UBSAN_BOUNDS_LOCAL
    bf873a25c552 ACPI: video: Add Toshiba Satellite/Portege Z830 quirk
    8ce338db7440 cpufreq: amd_pstate: fix wrong lowest perf fetch
    aaa63801145a rcu: Back off upon fill_page_cache_func() allocation failure
    eaa91f54df78 rcu: Avoid triggering strict-GP irq-work when RCU is idle
    eb97e60a9eae fs: dlm: fix race in lowcomms
    d1bfec0f742c module: tracking: Keep a record of tainted unloaded modules only
    b9ffdfc1bedb selftest: tpm2: Add Client.__del__() to close /dev/tpm* handle
    0c3d50b49337 f2fs: fix to account FS_CP_DATA_IO correctly
    1f4d5d31ddff f2fs: fix race condition on setting FI_NO_EXTENT flag
    a3e69948da57 ACPI: APEI: do not add task_work to kernel thread to avoid memory leak
    57bf2897692b thermal/drivers/qcom/tsens-v0_1: Fix MSM8939 fourth sensor hw_id
    ccc9abee86c5 random: schedule jitter credit for next jiffy, not in two jiffies
    371fa5129af5 crypto: cavium - prevent integer overflow loading firmware
    8f5eee162e55 crypto: marvell/octeontx - prevent integer overflows
    9bb18a8bb311 kbuild: rpm-pkg: fix breakage when V=1 is used
    6f7b372ec68f linux/export: use inline assembler to populate symbol CRCs
    00b64949b8c2 kbuild: remove the target in signal traps when interrupted
    fc9a0aa83614 tracing/osnoise: Fix possible recursive locking in stop_per_cpu_kthreads
    f433d954d032 tracing: kprobe: Make gen test module work in arm and riscv
    1e7a061f0c52 tracing: kprobe: Fix kprobe event gen test module on exit
    544763643a24 iommu/iova: Fix module config properly
    c28acd0039fa cifs: return correct error in ->calc_signature()
    c3a130431c55 clocksource/drivers/timer-gxp: Add missing error handling in gxp_timer_probe
    3da5b75beef0 clocksource/drivers/arm_arch_timer: Fix handling of ARM erratum 858921
    429348d4f675 crypto: qat - fix DMA transfer direction
    5b48d7f97a57 crypto: inside-secure - Change swab to swab32
    8900bf5bb269 crypto: ccp - Release dma channels before dmaengine unrgister
    85bc736a18b8 crypto: akcipher - default implementation for setting a private key
    bd0438f534b2 iommu/omap: Fix buffer overflow in debugfs
    893aa489388f cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset
    8fa437e48007 crypto: hisilicon/qm - fix missing put dfx access
    dcd7b39a599a crypto: qat - fix default value of WDT timer
    12fe03cee274 hwrng: imx-rngc - Moving IRQ handler registering after imx_rngc_irq_mask_clear()
    5ade5762b4a5 cgroup: Honor caller's cgroup NS when resolving path
    d398cb165d19 crypto: ccp - Fail the PSP initialization when writing psp data file failed
    25dddddafe6e hwrng: arm-smccc-trng - fix NO_ENTROPY handling
    f8a983d6e01b crypto: hisilicon/zip - fix mismatch in get/set sgl_sge_nr
    50d4feadcc95 crypto: sahara - don't sleep when in softirq
    f03add92f4b2 powerpc/pseries/vas: Pass hw_cpu_id to node associativity HCALL
    4eac4f6a86ae powerpc/kprobes: Fix null pointer reference in arch_prepare_kprobe()
    dba386d93409 powerpc: Fix SPE Power ISA properties for e500v1 platforms
    a47254a9adac powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
    5e3186b70002 powerpc/64: mark irqs hard disabled in boot paca
    ef58c97f97d3 powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
    99ac12f287d6 x86/hyperv: Fix 'struct hv_enlightened_vmcs' definition
    fd4b22c4b1f0 powerpc: Fix fallocate and fadvise64_64 compat parameter combination
    4140fd90c93e cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
    b57099a6aa9e powerpc/powernv: add missing of_node_put() in opal_export_attrs()
    a2c3374dc364 powerpc/pci_dn: Add missing of_node_put()
    9c7b092253c3 powerpc/sysdev/fsl_msi: Add missing of_node_put()
    5c140a35c1d6 powerpc/math_emu/efp: Include module.h
    6f20506c3e9d powerpc/configs: Properly enable PAPR_SCM in pseries_defconfig
    a1f321051e0d ipc: mqueue: fix possible memory leak in init_mqueue_fs()
    908bfb4f5ff8 mailbox: bcm-ferxrm-mailbox: Fix error check for dma_map_sg
    adc15eefb417 mailbox: mpfs: account for mbox offsets while sending
    0b921157ee9f mailbox: mpfs: fix handling of the reg property
    5edb0618919e clk: ast2600: BCLK comes from EPLL
    a9f69663ad57 clk: ti: dra7-atl: Fix reference leak in of_dra7_atl_clk_probe
    7125637a6cc4 clk: ti: Balance of_node_get() calls for of_find_node_by_name()
    43c589b7a187 clk: imx: scu: fix memleak on platform_device_add() fails
    13fc676c7185 clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
    c20099c19cb3 clk: baikal-t1: Add SATA internal ref clock buffer
    4dc50ce40b59 clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
    6e2394f58dd1 clk: baikal-t1: Fix invalid xGMAC PTP clock divider
    4dcae3385ced clk: vc5: Fix 5P49V6901 outputs disabling when enabling FOD
    03c55521879a spmi: pmic-arb: correct duplicate APID to PPID mapping logic
    69e1e6a82ef4 usb: mtu3: fix failed runtime suspend in host only mode
    c1914501c134 dmaengine: ioat: stop mod_timer from resurrecting deleted timer in __cleanup()
    23c9084645f0 clk: mediatek: Migrate remaining clk_unregister_*() to clk_hw_unregister_*()
    1a328477ea17 clk: mediatek: fix unregister function in mtk_clk_register_dividers cleanup
    05ff2207fa04 clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate changes
    fddb8f871a1f clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
    85c7a6837ea7 mfd: da9061: Fix Failed to set Two-Wire Bus Mode.
    e878673f5635 mfd: sm501: Add check for platform_driver_register()
    deaafe55a1d0 mfd: fsl-imx25: Fix check for platform_get_irq() errors
    c337ff96ef9e mfd: lp8788: Fix an error handling path in lp8788_irq_init() and lp8788_irq_init()
    ab94a72c82cc mfd: lp8788: Fix an error handling path in lp8788_probe()
    9bb4cb60c032 mfd: fsl-imx25: Fix an error handling path in mx25_tsadc_setup_irq()
    36905589383f mfd: intel_soc_pmic: Fix an error handling path in intel_soc_pmic_i2c_probe()
    8c24097d6fb9 fsi: core: Check error number after calling ida_simple_get
    52dd1b675ed9 RDMA/rxe: Fix resize_finish() in rxe_queue.c
    8dec72315988 clk: qcom: gcc-sm6115: Override default Alpha PLL regs
    a1ba69d624a1 clk: qcom: apss-ipq6018: mark apcs_alias0_core_clk as critical
    897dbbc57d71 scsi: iscsi: iscsi_tcp: Fix null-ptr-deref while calling getpeername()
    c5922e8e42b8 scsi: iscsi: Run recv path from workqueue
    bd16ec67e995 scsi: iscsi: Add recv workqueue helpers
    38a118abf5cc scsi: iscsi: Rename iscsi_conn_queue_work()
    4e750e0d8e48 scsi: pm8001: Fix running_req for internal abort commands
    f7a785177611 scsi: libsas: Fix use-after-free bug in smp_execute_task_sg()
    dae33133f255 serial: 8250: Fix restoring termios speed after suspend
    c6ce163bb827 firmware: google: Test spinlock on panic path to avoid lockups
    eec8e868bdc9 slimbus: qcom-ngd: Add error handling in of_qcom_slim_ngd_register
    e8ce7655fd1f slimbus: qcom-ngd-ctrl: allow compile testing without QCOM_RPROC_COMMON
    a9e9806d1c31 staging: vt6655: fix some erroneous memory clean-up loops
    2afdd2d9cf27 phy: qualcomm: call clk_disable_unprepare in the error handling
    d554c14eb73e tty: serial: fsl_lpuart: disable dma rx/tx use flags in lpuart_dma_shutdown
    97e79713db81 serial: 8250: Toggle IER bits on only after irq has been set up
    737594536dc3 drivers: serial: jsm: fix some leaks in probe
    79c3afb55942 usb: dwc3: core: fix some leaks in probe
    77333f9cc3e1 usb: gadget: function: fix dangling pnp_string in f_printer.c
    a6ba28c41804 xhci: Don't show warning for reinit on known broken suspend
    df4bf3a2371f IB: Set IOVA/LENGTH on IB_MR in core/uverbs layers
    43e2f80cda29 RDMA/cm: Use SLID in the work completion as the DLID in responder side
    c0fd5d4d8fd7 md/raid5: Remove unnecessary bio_put() in raid5_read_one_chunk()
    edce7cb3d8d1 md/raid5: Ensure stripe_fill happens on non-read IO with journal
    41ca95033a0c md: Replace snprintf with scnprintf
    b892ff7dc03e mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
    9d4c05ea9461 ata: fix ata_id_has_dipm()
    cb0e2986c81a ata: fix ata_id_has_ncq_autosense()
    23be940d99d0 ata: fix ata_id_has_devslp()
    295ef6a0327d ata: fix ata_id_sense_reporting_enabled() and ata_id_has_sense_reporting()
    74ad141e995a RDMA/siw: Fix QP destroy to wait for all references dropped.
    0c14f795a9ea RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.
    f741a9c64e4e RDMA/srp: Fix srp_abort()
    b72d09c37696 RDMA/irdma: Validate udata inlen and outlen
    4665894629c8 RDMA/irdma: Align AE id codes to correct flush code and event
    5e871bacc5b9 mtd: rawnand: fsl_elbc: Fix none ECC mode
    5f344bd994da mtd: rawnand: intel: Remove undocumented compatible string
    79cea59c1348 mtd: rawnand: intel: Read the chip-select line from the correct OF node
    876ee3ce4c02 phy: phy-mtk-tphy: fix the phy type setting issue
    bea05e8f3b7a phy: amlogic: phy-meson-axg-mipi-pcie-analog: Hold reference returned by of_get_parent()
    d86b5cab8e6b remoteproc: Harden rproc_handle_vdev() against integer overflow
    e51207113b36 mtd: devices: docg3: check the return value of devm_ioremap() in the probe
    f5e41e860a3a clk: qcom: sm6115: Select QCOM_GDSC
    d074a8721b40 dyndbg: drop EXPORTed dynamic_debug_exec_queries
    a5389101936a dyndbg: let query-modname override actual module name
    6fe65c4de7f1 dyndbg: fix module.dyndbg handling
    7059d5c462fb dyndbg: fix static_branch manipulation
    0cb8d0d420d4 usb: gadget: f_fs: stricter integer overflow checks
    d4a8ec5cc7ff dmaengine: hisilicon: Add multi-thread support for a DMA channel
    60d48e197289 dmaengine: hisilicon: Fix CQ head update
    435c85735572 dmaengine: hisilicon: Disable channels when unregister hisi_dma
    4b05c3e771a6 dmaengine: idxd: avoid deadlock in process_misc_interrupts()
    6afdab9bdad1 phy: rockchip-inno-usb2: Return zero after otg sync
    1b5a931594f7 fpga: prevent integer overflow in dfl_feature_ioctl_set_irq()
    843433a02e34 misc: ocxl: fix possible refcount leak in afu_ioctl()
    8a02209e256d clk: mediatek: mt8195-infra_ao: Set pwrmcu clocks as critical
    f6794d82c0d5 clk: mediatek: clk-mt8195-vdo1: Reparent and set rate on vdo1_dpintf's parent
    79b90df9b9e8 clk: mediatek: clk-mt8195-vdo0: Set rate on vdo0_dp_intf0_dp_intf's parent
    aedd895b3820 RDMA/rxe: Fix the error caused by qp->sk
    bb33fa65da77 RDMA/rxe: Fix "kernel NULL pointer dereference" error
    22b93530bbe6 media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init
    1b2f6d1d5abf media: uvcvideo: Use entity get_cur in uvc_ctrl_set
    deb8f32ae4b1 media: uvcvideo: Fix memory leak in uvc_gpio_parse
    73bf38baa8ac media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()
    325de494d8ce media: amphion: fix a bug that vpu core may not resume after suspend
    47fd2c400869 media: amphion: don't change the colorspace reported by decoder.
    50c335d99773 media: amphion: adjust the encoder's value range of gop size
    96fe4befacef media: amphion: insert picture startcode after seek for vc1g format
    e15db9a24df1 tty: xilinx_uartps: Fix the ignore_status
    9eabf73391b6 media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
    99e30bd761c5 clk: qcom: gcc-sdm660: Use floor ops for SDCC1 clock
    fcc076fecca6 HSI: omap_ssi_port: Fix dma_map_sg error check
    e25f56f8bdf6 HSI: omap_ssi: Fix refcount leak in ssi_probe
    00f6ce0d1baf clk: samsung: exynosautov9: correct register offsets of peric0/c1
    8cd228892759 clk: tegra20: Fix refcount leak in tegra20_clock_init
    8e1fe3025393 clk: tegra: Fix refcount leak in tegra114_clock_init
    1a6d97139b0a clk: tegra: Fix refcount leak in tegra210_clock_init
    a065f836c938 clk: sprd: Hold reference returned by of_get_parent()
    2c4137393bcf clk: berlin: Add of_node_put() for of_get_parent()
    42ecb6c427ee clk: qoriq: Hold reference returned by of_get_parent()
    23e0893862ba clk: oxnas: Hold reference returned by of_get_parent()
    3c3292f490e7 clk: st: Hold reference returned by of_get_parent()
    0068ca80dcfa clk: meson: Hold reference returned by of_get_parent()
    40c485c8b1f7 usb: common: debug: Check non-standard control requests
    dd1db668449d RDMA/mlx5: Don't compare mkey tags in DEVX indirect mkey
    30e20981b08a iio: magnetometer: yas530: Change data type of hard_offsets to signed
    39eb39a592fb iio: ABI: Fix wrong format of differential capacitance channel ABI.
    144ef27e46e0 iio: inkern: fix return value in devm_of_iio_channel_get_by_name()
    4e416e52185f iio: inkern: only release the device node when done with it
    8394db2d4ffb iio: adc: at91-sama5d2_adc: disable/prepare buffer on suspend/resume
    e0b504be6e42 iio: adc: at91-sama5d2_adc: lock around oversampling and sample freq
    44f46f904d8c iio: adc: at91-sama5d2_adc: check return status for pressure and touch
    b8c127184bc5 iio: adc: at91-sama5d2_adc: fix AT91_SAMA5D2_MR_TRACKTIM_MAX
    82c66c46f73b iomap: iomap: fix memory corruption when recording errors during writeback
    0530055d5b96 ARM: dts: exynos: fix polarity of VBUS GPIO of Origen
    0f77b6b2ba70 arm64: ftrace: fix module PLTs with mcount
    75e60ad770e2 ext4: don't run ext4lazyinit for read-only filesystems
    59cdd0794d59 ARM: Drop CMDLINE_* dependency on ATAGS
    c665b41db852 ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    0d54c26d0ade arm64: dts: ti: k3-j7200: fix main pinmux range
    a39307c7c750 soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA
    2f91772a5f8a ia64: export memory_add_physaddr_to_nid to fix cxl build error
    664c6b13332a ARM: dts: kirkwood: lsxl: remove first ethernet port
    e3ab51897adc ARM: dts: kirkwood: lsxl: fix serial line
    1764fd62a86c ARM: dts: turris-omnia: Fix mpp26 pin name and comment
    b3f82935c77a dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
    bba8ed1946c0 arm64: dts: renesas: r9a07g043: Fix SCI{Rx,Tx} interrupt types
    4522a6fe84cb arm64: dts: renesas: r9a07g054: Fix SCI{Rx,Tx} interrupt types
    964cf7f0d477 arm64: dts: renesas: r9a07g044: Fix SCI{Rx,Tx} interrupt types
    02e3b6404d26 ARM: dts: imx6qdl-kontron-samx6i: hook up DDC i2c bus
    c1bc4ab733ec soc: qcom: smem_state: Add refcounting for the 'state->of_node'
    8fb6112bd49c soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
    e0b55fd272ae locks: fix TOCTOU race when granting write lease
    daab421fc2dc memory: of: Fix refcount leak bug in of_lpddr3_get_ddr_timings()
    62ccab6e3376 memory: of: Fix refcount leak bug in of_get_ddr_timings()
    44db35ceb947 memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
    7cdc122f28d7 ALSA: hda/hdmi: Don't skip notification handling during PM operation
    8679d5305080 ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
    bac2dd72fcfb ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
    f54f599c8e2f ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
    530b9c0e4121 ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
    16226421b10a ASoC: stm: Fix PM disable depth imbalance in stm32_i2s_probe
    eb7bcd48fc8e ASoC: stm32: spdifrx: Fix PM disable depth imbalance in stm32_spdifrx_probe
    aa7f877d2d07 ASoC: stm32: dfsdm: Fix PM disable depth imbalance in stm32_adfsdm_probe
    06821c68d9ed mmc: wmt-sdmmc: Fix an error handling path in wmt_mci_probe()
    2e2c57f660a6 ALSA: dmaengine: increment buffer pointer atomically
    ec692f0b5100 ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
    40aba726b2cd ASoC: codecs: tx-macro: fix kcontrol put
    60f6d4f9d903 virtio-gpu: fix shift wrapping bug in virtio_gpu_fence_event_create()
    6ad40bbb2c25 drm/vmwgfx: Fix memory leak in vmw_mksstat_add_ioctl()
    dea487355691 ALSA: usb-audio: Properly refcounting clock rate
    7a2bead03557 drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
    512c4d444c69 drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
    ab03e61c5cf7 drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices
    b58efaf656ab ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API
    beffe91431ba mmc: au1xmmc: Fix an error handling path in au1xmmc_probe()
    8b8da09da270 drm/amdgpu: Fix memory leak in hpd_rx_irq_create_workqueue()
    e55261beb86a drm/omap: dss: Fix refcount leak bugs
    d1087cfd4370 ASoC: SOF: mediatek: mt8195: Import namespace SND_SOC_SOF_MTK_COMMON
    2a3c55862c67 drm/bochs: fix blanking
    fc8eea8ec3ca drm/virtio: set fb_modifiers_not_supported
    d6e150e84f16 ALSA: hda: beep: Simplify keep-power-at-enable behavior
    45416de9ad46 ASoC: wm_adsp: Handle optional legacy support
    3f8546391e03 ASoC: rsnd: Add check for rsnd_mod_power_on
    93e06be3f518 drm/bridge: it6505: Fix the order of DP_SET_POWER commands
    21764467ab39 drm/bridge: megachips: Fix a null pointer dereference bug
    be6ad75a500e drm/amdgpu: add missing pci_disable_device() in amdgpu_pmops_runtime_resume()
    2c9db240575c platform/chrome: cros_ec_typec: Correct alt mode index
    862f641cadf1 platform/x86: msi-laptop: Fix resource cleanup
    21cd17aedbbf platform/x86: msi-laptop: Fix old-ec check for backlight registering
    f8365e4ae5b1 ASoC: tas2764: Fix mute/unmute
    7960f1a4cb2f ASoC: tas2764: Drop conflicting set_bias_level power setting
    9575bd32c344 ASoC: tas2764: Allow mono streams
    1f35a8afe8db ASoC: soc-pcm.c: call __soc_pcm_close() in soc_pcm_close()
    cfbf43124e0d drm/virtio: Fix same-context optimization
    f143f1d9a8e5 platform/chrome: fix memory corruption in ioctl
    c2fbf1b1fff6 platform/chrome: fix double-free in chromeos_laptop_prepare()
    26f9a766f87b drm/msm: Make .remove and .shutdown HW shutdown consistent
    4e5287acc036 ASoC: mt6359: fix tests for platform_get_irq() failure
    a656ff69fe13 drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()
    79878d6829b5 drm/dp_mst: fix drm_dp_dpcd_read return value checks
    fd85e0eeaa65 drm/bridge: parade-ps8640: Fix regulator supply order
    38edd69b0065 drm/bridge: tc358767: Add of_node_put() when breaking out of loop
    61d0c94c3725 drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
    99fae8294e28 drm/bridge: it6505: Power on downstream device in .atomic_enable
    353ab1c13fdd drm/mipi-dsi: Detach devices when removing the host
    3051f34c0193 drm/bridge: Avoid uninitialized variable warning
    4d4d5bc65920 drm: bridge: adv7511: unregister cec i2c device after cec adapter
    903c2b9bced8 drm: bridge: adv7511: fix CEC power down control register offset
    169aa2664639 net: mvpp2: fix mvpp2 debugfs leak
    b0eb0d577635 once: add DO_ONCE_SLOW() for sleepable contexts
    51d4260585cf net/ieee802154: reject zero-sized raw_sendmsg()
    39365e1b0eb5 net: wwan: iosm: Call mutex_init before locking it
    b47bc8202b31 eth: sp7021: fix use after free bug in spl2sw_nvmem_get_mac_address
    96c0c14135f5 bnx2x: fix potential memory leak in bnx2x_tpa_stop()
    d06ee1cbffc6 eth: lan743x: reject extts for non-pci11x1x devices
    49c1729b5563 net: prestera: acl: Add check for kmemdup
    e2e49822a0a1 af_unix: Fix memory leaks of the whole sk due to OOB skb.
    c380c28ab9b1 net: rds: don't hold sock lock when cancelling work from rds_tcp_reset_callbacks()
    248bed1dbf5a hwmon: (pmbus/mp2888) Fix sensors readouts for MPS Multi-phase mp2888 controller
    742e595f1949 Bluetooth: hci_sync: Fix not indicating power state
    37ad7c5990c0 spi: Ensure that sg_table won't be used after being freed
    ccbfe4d0bce4 tcp: fix tcp_cwnd_validate() to not forget is_cwnd_limited
    0f90099d18e3 sctp: handle the error returned from sctp_auth_asoc_init_active_key
    1f76323ac43f mISDN: fix use-after-free bugs in l1oip timer handlers
    a845a0c4bdec eth: alx: take rtnl_lock on resume
    a99fc6d81816 vhost/vsock: Use kvmalloc/kvfree for larger packets.
    505ac55467df wifi: rtl8xxxu: Fix AIFS written to REG_EDCA_*_PARAM
    7050e56333f1 wifi: rtl8xxxu: gen2: Enable 40 MHz channel width
    71314ed41425 spi: s3c64xx: Fix large transfers with DMA
    27d23b84b244 netfilter: nft_fib: Fix for rpath check with VRF devices
    f520075da484 xfrm: Reinject transport-mode packets through workqueue
    0f1a762184a6 Bluetooth: hci_core: Fix not handling link timeouts propertly
    de0ccb13d9ea i2c: mlxbf: support lock mechanism
    db41ae562b64 cw1200: fix incorrect check to determine if no element is found in list
    e4be1cf9ba24 skmsg: Schedule psock work if the cached skb exists on the psock
    7b24819bd6a2 spi/omap100k:Fix PM disable depth imbalance in omap1_spi100k_probe
    2a354023d3b5 spi: dw: Fix PM disable depth imbalance in dw_spi_bt1_probe
    71d2ef419e04 spi: cadence-quadspi: Fix PM disable depth imbalance in cqspi_probe
    3c5b8e7ca8be x86/cpu: Include the header of init_ia32_feat_ctl()'s prototype
    2042092204f8 wifi: ath11k: fix peer addition/deletion error on sta band migration
    bbcc38c4450e x86/microcode/AMD: Track patch allocation size explicitly
    ba46813ae735 mips: dts: ralink: mt7621: fix external phy on GB-PC2
    8d6b977ddf06 wifi: ath11k: fix number of VHT beamformee spatial streams
    c0bb97a90b13 wifi: ath11k: fix failed to find the peer with peer_id 0 when disconnected
    520b81520191 flow_dissector: Do not count vlan tags inside tunnel payload
    973ddaffd2b7 netfilter: conntrack: revisit the gc initial rescheduling bias
    b3104ef06635 netfilter: conntrack: fix the gc rescheduling delay
    75b2c71ea581 Bluetooth: hci_{ldisc,serdev}: check percpu_init_rwsem() failure
    f8a77dbb8837 wifi: ath11k: Include STA_KEEPALIVE_ARP_RESPONSE TLV header by default
    7de3297a9239 bpf: Ensure correct locking around vulnerable function find_vpid()
    5ae7255b9ab3 net: fs_enet: Fix wrong check in do_pd_setup
    e706cc24b679 Bluetooth: RFCOMM: Fix possible deadlock on socket shutdown/release
    1034d8e08508 wifi: mt76: mt7921e: fix rmmod crash in driver reload test
    f5e6d7ba8329 wifi: mt76: mt7915: do not check state before configuring implicit beamform
    540f17a503db wifi: mt76: mt7915: fix mcs value in ht mode
    ce02cd82abad wifi: mt76: mt7921: add mt7921_mutex_acquire at mt7921_sta_set_decap_offload
    f31aa5196463 wifi: mt76: mt7921: add mt7921_mutex_acquire at mt7921_[start, stop]_ap
    f5275e2e41eb wifi: mt76: connac: fix possible unaligned access in mt76_connac_mcu_add_nested_tlv
    c5bc23134c0c wifi: mt76: mt7915: fix possible unaligned access in mt7915_mac_add_twt_setup
    0160c341d836 wifi: mt76: mt7615: add mt7615_mutex_acquire/release in mt7615_sta_set_decap_offload
    327c14cf7b5f wifi: mt76: sdio: fix transmitting packet hangs
    8b133eb8af67 wifi: mt76: sdio: poll sta stat when device transmits data
    0641218a8143 wifi: mt76: sdio: fix the deadlock caused by sdio->stat_work
    30a09a8ca499 wifi: mt76: mt7921u: fix race issue between reset and suspend/resume
    d2d352124e19 wifi: mt76: mt7921s: fix race issue between reset and suspend/resume
    7aa91aa9daa7 wifi: mt76: mt7921e: fix race issue between reset and suspend/resume
    c24ab2685bc2 wifi: rtl8xxxu: Remove copy-paste leftover in gen2_update_rate_mask
    09ef9d732664 wifi: rtl8xxxu: gen2: Fix mistake in path B IQ calibration
    c586349191fb bpf: btf: fix truncated last_member_type_id in btf_struct_resolve
    bcc34897bd58 spi: meson-spicc: do not rely on busy flag in pow2 clk ops
    5ee77839f3c4 wifi: rtl8xxxu: Fix skb misuse in TX queue selection
    4bf42b30a98e spi: qup: add missing clk_disable_unprepare on error in spi_qup_pm_resume_runtime()
    36ad3e146732 spi: qup: add missing clk_disable_unprepare on error in spi_qup_resume()
    a3db90398a1c selftests/xsk: Avoid use-after-free on ctx
    79329f970ae6 wifi: rtw88: add missing destroy_workqueue() on error path in rtw_core_init()
    d02a74c72258 wifi: wfx: prevent underflow in wfx_send_pds()
    5fff0f1b5d57 wifi: rtl8xxxu: tighten bounds checking in rtl8xxxu_read_efuse()
    7b8389b7e160 wifi: rtw89: pci: correct TX resource checking in low power mode
    edb0fde1f7f3 wifi: rtw89: pci: fix interrupt stuck after leaving low power mode
    85a642c3455f Bluetooth: btusb: mediatek: fix WMT failure during runtime suspend
    dd5273e07984 bpf: Use this_cpu_{inc_return|dec} for prog->active
    ecbbef374ce5 bpf: Use this_cpu_{inc|dec|inc_return} for bpf_task_storage_busy
    75d287186b98 wifi: ath11k: Fix incorrect QMI message ID mappings
    6bfee6eb3d6b bpf: Propagate error from htab_lock_bucket() to userspace
    a759911bd1c6 bpf: Disable preemption when increasing per-cpu map_locked
    dd88139cb53c selftests/xsk: Add missing close() on netns fd
    5f2a838113bd xsk: Fix backpressure mechanism on Tx
    3345cd3612b5 x86/resctrl: Fix to restore to original value when re-enabling hardware prefetch register
    e90195d5bbb9 spi: mt7621: Fix an error message in mt7621_spi_probe()
    f53f2814e914 esp: choose the correct inner protocol for GSO on inter address family tunnels
    d3c1fb19ca1e audit: free audit_proctitle only on task exit
    44fe6d9a0d8d audit: explicitly check audit_context->context enum value
    b35f60d6cf97 bpftool: Fix a wrong type cast in btf_dumper_int
    de5b1600689c wifi: mac80211: allow bw change during channel switch in mesh
    a43b2d121829 wifi: cfg80211: get correct AP link chandef
    caa176c0953c bpf: Fix reference state management for synchronous callbacks
    160b9f792f99 tsnep: Fix TSNEP_INFO_TX_TIME register define
    385072c05eb9 leds: lm3601x: Don't use mutex after it was destroyed
    707d7a774dcc bpf: Cleanup check_refcount_ok
    606cfa079089 bpf: convert cgroup_bpf.progs to hlist
    044bc355cdb5 bpf: Fix non-static bpf_func_proto struct definitions
    2bf916418d21 wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
    aaf7ca471415 wifi: rtlwifi: 8192de: correct checking of IQK reload
    082eb9beed5d x86/paravirt: add extra clobbers with ZERO_CALL_USED_REGS enabled
    221cb89ff40e NFSD: Fix handling of oversized NFSv4 COMPOUND requests
    c2a878095b5c NFSD: Protect against send buffer overflow in NFSv2 READDIR
    692b69ddb786 SUNRPC: Fix svcxdr_init_encode's buflen calculation
    2eea66b010f7 SUNRPC: Fix svcxdr_init_decode's end-of-buffer calculation
    733dd17158f9 nfsd: Fix a memory leak in an error handling path
    e58eef8ee86c objtool: Preserve special st_shndx indexes in elf_update_symbol
    970812475926 ACPI: PCC: Fix Tx acknowledge in the PCC address space handler
    f1f8085da2ca ACPI: PCC: replace wait_for_completion()
    4e714c4c370e ACPI: PCC: Release resources on address space setup failure path
    65cfd9c59fd8 ARM: 9247/1: mm: set readonly for MT_MEMORY_RO with ARM_LPAE
    f6fe0681bdd0 ARM: 9244/1: dump: Fix wrong pg_level in walk_pmd()
    80ec7f839264 ARM: 9243/1: riscpc: Unbreak the build
    f27bafeb9fb4 erofs: use kill_anon_super() to kill super in fscache mode
    b6c8330f5b0f erofs: fix order >= MAX_ORDER warning due to crafted negative i_size
    d7ac29e60d0f MIPS: SGI-IP27: Fix platform-device leak in bridge_platform_create()
    a253f3b59ff0 MIPS: SGI-IP30: Fix platform-device leak in bridge_platform_create()
    8010fece7cd0 sh: machvec: Use char[] for section boundaries
    7c0258acaf71 cpufreq: amd-pstate: Fix initial highest_perf value
    7750f52ce090 thermal: cpufreq_cooling: Check the policy first in cpufreq_cooling_register()
    db4de8bb6171 ntfs3: rework xattr handlers and switch to POSIX ACL VFS helpers
    e5a37972ab86 userfaultfd: open userfaultfds with O_RDONLY
    5e6f29a2ed37 ima: fix blocking of security.ima xattrs of unsupported algorithms
    a2db2328886f selinux: use "grep -E" instead of "egrep"
    d296b4fd4c15 smb3: must initialize two ACL struct fields to zero
    4370ef797420 drm/amd/display: explicitly disable psr_feature_enable appropriately
    6f377e9affd5 drm/amd/display: Fix vblank refcount in vrr transition
    df4d55302ee3 drm/i915: Fix watermark calculations for DG2 CCS+CC modifier
    27bb1962725e drm/i915: Fix watermark calculations for DG2 CCS modifiers
    cd82aaf05c50 drm/i915: Fix watermark calculations for gen12+ CCS+CC modifier
    66b0ea47534c drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
    b6d0783eed82 drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
    a2a457c8166d drm/i915/gt: Use i915_vm_put on ppgtt_create error paths
    3aeda2fe6517 drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
    6dd1b90e56df drm/nouveau/kms/nv140-: Disable interlacing
    5699afbff1fa staging: greybus: audio_helper: remove unused and wrong debugfs usage
    dd8cf031cf9f KVM: VMX: Drop bits 31:16 when shoving exception error code into VMCS
    9bf561c4db89 KVM: nVMX: Don't propagate vmcs12's PERF_GLOBAL_CTRL settings to vmcs02
    a0b4d7524abf KVM: nVMX: Unconditionally purge queued/injected events on nested "exit"
    7984c1386885 KVM: x86/emulator: Fix handing of POP SS to correctly set interruptibility
    dd54b94e72d0 blk-wbt: call rq_qos_add() after wb_normal is initialized
    8b1f9fde48aa blk-throttle: fix that io throttle can only work for single bio
    1e5c75634e3e media: cedrus: Fix endless loop in cedrus_h265_skip_bits()
    c3977e0bcb4b media: cedrus: Set the platform driver data earlier
    b2c57e927470 efi: libstub: drop pointless get_memory_map() call
    f897e1ce696a thunderbolt: Explicitly enable lane adapter hotplug events at startup
    ef828a39d6a7 rpmsg: char: Avoid double destroy of default endpoint
    149198d0b884 tracing: Fix reading strings from synthetic events
    966ffabf6990 tracing: Add "(fault)" name injection to kernel probes
    860e8fbde423 tracing: Move duplicate code of trace_kprobe/eprobe.c into header
    2fcd9e27640f tracing: Do not free snapshot if tracer is on cmdline
    864f10063efc tracing: Add ioctl() to force ring buffer waiters to wake up
    e91ef98eeefd tracing: Wake up waiters when tracing is disabled
    5544f411a4e8 tracing: Wake up ring buffer waiters on closing of the file
    220d170455aa tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
    ceb52ccfb01d ring-buffer: Fix race between reset page and reading page
    f026e18300d8 ring-buffer: Add ring_buffer_wake_waiters()
    79f3d1facbdb ring-buffer: Check pending waiters when doing wake ups as well
    51a51a1a7152 ring-buffer: Have the shortest_full queue be the shortest not longest
    0a2fe268e8f6 ring-buffer: Allow splice to read previous partially read pages
    0abc3bb1706b ftrace: Still disable enabled records marked as disabled
    8f81aee36ba1 ftrace: Properly unset FTRACE_HASH_FL_MOD
    ebf0beb855e2 livepatch: fix race between fork and KLP transition
    caf34de4951d ext4: update 'state->fc_regions_size' after successful memory allocation
    a4058b869e6c ext4: fix potential memory leak in ext4_fc_record_regions()
    c0be17635f03 ext4: fix potential memory leak in ext4_fc_record_modified_inode()
    a4a8c7e51ec2 ext4: fix miss release buffer head in ext4_fc_write_inode
    2bf6f14e9ddc ext4: fix dir corruption when ext4_dx_add_entry() fails
    c2ddd16160de ext4: fix i_version handling in ext4
    c839f6b1e8a6 ext4: place buffer head allocation before handle start
    01e159ec8066 ext4: ext4_read_bh_lock() should submit IO if the buffer isn't uptodate
    f35e65d686cf ext4: unconditionally enable the i_version counter
    44c79a757437 ext4: don't increase iversion counter for ea_inodes
    edb71f055684 ext4: fix check for block being out of directory size
    d0681b447f5b ext4: make ext4_lazyinit_thread freezable
    4a657319cfab ext4: fix null-ptr-deref in ext4_write_info
    89db2b50469b ext4: avoid crash when inline data creation follows DIO write
    40ff52527dae ext2: Add sanity checks for group and filesystem size
    27c7bd35135d jbd2: add miss release buffer head in fc_do_one_pass()
    2e6d9f381c1e jbd2: fix potential use-after-free in jbd2_fc_wait_bufs
    68ed9c76b2af jbd2: fix potential buffer head reference count leak
    aa972fe0f2ab jbd2: wake up journal waiters in FIFO order, not LIFO
    e168f819bfa4 f2fs: fix to do sanity check on summary info
    8f0a47def472 f2fs: fix to do sanity check on destination blkaddr during recovery
    43341cb9547d f2fs: increase the limit for reserve_root
    ce0892c0fcf5 f2fs: flush pending checkpoints when freezing super
    0fa4033d00be f2fs: complete checkpoints during remount
    6ab091560933 f2fs: fix wrong continue condition in GC
    a687c2890fe4 btrfs: set generation before calling btrfs_clean_tree_block in btrfs_init_new_buffer
    b81d8146f51a btrfs: fix missed extent on fsync after dropping extent maps
    0efd9dfc00d6 btrfs: fix race between quota enable and quota rescan ioctl
    dfb9fbc5accf btrfs: enhance unsupported compat RO flags handling
    9bf3abc8bcc6 btrfs: fix alignment of VMA for memory mapped files on THP
    b59deb46a675 fs: record I_DIRTY_TIME even if inode already has I_DIRTY_INODE
    be394e8a205c ksmbd: Fix user namespace mapping
    1c1225288bde ksmbd: Fix wrong return value and message length check in smb2_ioctl()
    230a44aaf9a0 ksmbd: fix endless loop when encryption for response fails
    ff5814fdced4 ksmbd: fix incorrect handling of iterate_dir
    d2c9555cce37 smb3: do not log confusing message when server returns no network interfaces
    a54676340b0e hwrng: core - let sleep be interrupted when unregistering hwrng
    02c871d44090 fbdev: smscufx: Fix use-after-free in ufx_ops_open()
    0ec105bf4176 pinctrl: rockchip: add pinmux_ops.gpio_set_direction callback
    a11544efbcf5 gpio: rockchip: request GPIO mux to pinctrl when setting direction
    6f9a24b4ac16 scsi: qedf: Populate sysfs attributes for vport
    147d397e08a4 scsi: lpfc: Rework MIB Rx Monitor debug info logic
    0c76110a3129 slimbus: qcom-ngd: cleanup in probe error path
    30e704e063cb slimbus: qcom-ngd: use correct error in message of pdr_add_lookup() failure
    5c87da431c18 powerpc/boot: Explicitly disable usage of SPE instructions
    81a12906cb76 powerpc/Kconfig: Fix non existing CONFIG_PPC_FSL_BOOKE
    6396d57b8c4f powercap: intel_rapl: Use standard Energy Unit for SPR Dram RAPL domain
    c5f1c47aaa3f cpufreq: qcom-cpufreq-hw: Fix uninitialized throttled_freq warning
    bc6c0ed253cd NFSD: Protect against send buffer overflow in NFSv3 READ
    ea4c3eee0fd7 NFSD: Protect against send buffer overflow in NFSv2 READ
    9c3224826ec1 NFSD: Protect against send buffer overflow in NFSv3 READDIR
    003505406a50 serial: 8250: Request full 16550A feature probing for OxSemi PCIe devices
    8f9bd3fdc8d3 serial: 8250: Let drivers request full 16550A feature probing
    232509094ea5 serial: stm32: Deassert Transmit Enable on ->rs485_config()
    5064982437a1 serial: cpm_uart: Don't request IRQ too early for console port
    1680dbf51281 PCI: Sanitise firmware BAR assignments behind a PCI-PCI bridge
    4fb4053d90ca xen/gntdev: Accommodate VMA splitting
    0bccddd9b8f0 xen/gntdev: Prevent leaking grants
    6757330b1be5 mm/mmap: undo ->mmap() when arch_validate_flags() fails
    b76e4eb02e9e mm/uffd: fix warning without PTE_MARKER_UFFD_WP compiled in
    e77f4ddc7e11 mm/damon: validate if the pmd entry is present before accessing
    86a913d55c89 mm/hugetlb: fix races when looking up a CONT-PTE/PMD size hugetlb page
    ed5895be34b6 clocksource/drivers/arm_arch_timer: Fix CNTPCT_LO and CNTVCT_LO value
    53177c8253e3 arm64: errata: Add Cortex-A55 to the repeat tlbi list
    c9ded3c93132 arm64: mte: move register initialization to C
    921384209d10 drm/udl: Restore display mode on resume
    60538f6bf14f drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
    86475df5fb57 drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
    846e8a76221a drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init() error
    989164305b93 drm/virtio: Check whether transferred 2D BO is shmem
    5653bd020094 dmaengine: qcom-adm: fix wrong calling convention for prep_slave_sg
    f1dd45a6585a dmaengine: qcom-adm: fix wrong sizeof config in slave_config
    94e002aec466 dmaengine: mxs: use platform_driver_register
    a2fcd90ab840 Revert "drm/amdgpu: use dirty framebuffer helper"
    6bf83b0f7cf7 nvme-multipath: fix possible hang in live ns resize with ANA access
    2bd2774df0ce nvmem: core: Fix memleak in nvmem_register()
    5177bdc38eaa UM: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    0a46c031d03e riscv: Pass -mno-relax only on lld < 15.0.0
    c579c0aa7810 riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb
    98c981715e8f riscv: Make VM_WRITE imply VM_READ
    cf8535076464 riscv: Allow PROT_WRITE-only mmap()
    df30c4feba51 riscv: vdso: fix NULL deference in vdso_join_timens() when vfork
    68a1aac5bdd5 parisc: Fix userspace graphics card breakage due to pgtable special bit
    5017f2f7b138 parisc: fbdev/stifb: Align graphics memory size to 4MB
    140b2b92dbef RISC-V: Make port I/O string accessors actually work
    e08302134d59 RISC-V: Re-enable counter access from userspace
    1379df4c0697 riscv: topology: fix default topology reporting
    32863f41ee77 arm64: topology: move store_cpu_topology() to shared code
    12965b43cc23 regulator: qcom_rpm: Fix circular deferral regression
    878929b56705 net: thunderbolt: Enable DMA paths only after rings are enabled
    e8762009513a hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
    9f329cf8c693 ASoC: wcd934x: fix order of Slimbus unprepare/disable
    942228543a6d ASoC: wcd9335: fix order of Slimbus unprepare/disable
    cc2a1297b07a arm64: dts: qcom: sdm845-mtp: correct ADC settle time
    b3ededa17504 platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
    e4acbd10620f quota: Check next/prev free block number after reading from quota file
    93a3a3e745ed HID: multitouch: Add memory barriers
    19906949ca61 btf: Export bpf_dynptr definition
    1ab6d3030652 fs: dlm: fix invalid derefence of sb_lvbptr
    05b02a81fcca fs: dlm: handle -EBUSY first in lock arg validation
    5fe0184d47e0 fs: dlm: fix race between test_bit() and queue_work()
    a206f7fbe958 i2c: designware: Fix handling of real but unexpected device interrupts
    bcd98bf4093d mmc: sdhci-sprd: Fix minimum clock limit
    3035cc02a499 mmc: sdhci-tegra: Use actual clock rate for SW tuning correction
    ce08a030ef7b mmc: renesas_sdhi: Fix rounding errors
    7f7a491719bf can: kvaser_usb_leaf: Fix CAN state after restart
    d99b9999b4d1 can: kvaser_usb_leaf: Fix TX queue out of sync after restart
    b1f958afb433 can: kvaser_usb_leaf: Fix overread with an invalid command
    3d3c7eb843d8 can: kvaser_usb: Fix use of uninitialized completion
    268bd6b5b8fe mmc: core: Add SD card quirk for broken discard
    b52eecc616c9 usb: add quirks for Lenovo OneLink+ Dock
    07a844821b74 usb: gadget: uvc: Fix argument to sizeof() in uvc_register_video()
    116d6a696498 xhci: dbc: Fix memory leak in xhci_alloc_dbc()
    819f7a73c36b iio: pressure: dps310: Reset chip after timeout
    b871461eda8b iio: pressure: dps310: Refactor startup procedure
    467d556aa12c iio: adc: ad7923: fix channel readings for some variants
    2fabf2d80ce0 iio: ltc2497: Fix reading conversion results
    81c68fb490e2 iio: dac: ad5593r: Fix i2c read protocol requirements
    943eb0ede74e cifs: Fix the error length of VALIDATE_NEGOTIATE_INFO message
    56fc362eb3db cifs: destage dirty pages before re-reading them for cache=none
    bf28cb8811b5 hv_netvsc: Fix race between VF offering and VF association message from host
    796da2e0eff1 io_uring: correct pinned_vm accounting
    b4293c01ee0d io_uring/af_unix: defer registered files gc to io_uring release
    3e7f0e0f3744 io_uring/net: don't update msg_name if not provided
    e45a79863729 io_uring/net: fix fast_iov assignment in io_setup_async_msg()
    9197a1364d41 io_uring/rw: fix unexpected link breakage
    8f0a63743f1e mtd: rawnand: atmel: Unmap streaming DMA mappings
    d60ad28f750b ALSA: hda/realtek: Add Intel Reference SSID to support headset keys
    dc8e0bbf724f ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
    390578404823 ALSA: hda/realtek: Correct pin configs for ASUS G533Z
    9108dee38d22 ALSA: hda/realtek: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
    3965d9b05667 ALSA: usb-audio: Fix NULL dererence at error path
    faa8c1ed77d0 ALSA: usb-audio: Fix potential memory leaks
    a394f0197dd0 ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
    a74003b10bbb ALSA: oss: Fix potential deadlock at unregistration
    eb9af45d0a4a Revert "fs: check FMODE_LSEEK to control internal pipe splicing"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index c2398a3a59..f55be51b64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "127fc6310660dd27804f6f27c57574ba61761ab5"
-SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
+SRCREV_machine ?= "59a2ffca6673305b3b9e3186294feb5437698d18"
+SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.19.16"
+LINUX_VERSION ?= "5.19.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 8b9a702685..41e37dbab1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.19.16"
+LINUX_VERSION ?= "5.19.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
+SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 7af4e8835b..76d9d4b4ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4a8660a840a9f9beede5a5a45dc48031b4416ff0"
-SRCREV_machine:qemuarm64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemumips ?= "6f3e66bc642900e59b6d831c0b8a0cf3aa1a62ce"
-SRCREV_machine:qemuppc ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemuriscv64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemuriscv32 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemux86 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemux86-64 ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_machine:qemumips64 ?= "544923be2a8b7b540209f35fa0b6e893ac39a599"
-SRCREV_machine ?= "dcad83c4e07ac89ae873778ace4efb06dbf4898f"
-SRCREV_meta ?= "db8b42f2f808023c75cb41c89e866fe526ce6876"
+SRCREV_machine:qemuarm ?= "d789efca1869e21f1c275fd2e46f2eada1698f8d"
+SRCREV_machine:qemuarm64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemumips ?= "7216e7029faf5685256b3ce57d3be1c371c56267"
+SRCREV_machine:qemuppc ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemuriscv64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemuriscv32 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemux86 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemux86-64 ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_machine:qemumips64 ?= "4e9603752156d3a0b9fe53309f4bc78d3f4f7df5"
+SRCREV_machine ?= "82689c62701573edb28ef1df2bd83adafd3ca701"
+SRCREV_meta ?= "200c6fddf19c4a54c86dbfbe3d0f64597f5bc0c2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d235c2b1f470f012bda26844aabf26321b1c446a"
+SRCREV_machine:class-devupstream ?= "2b525314c7b57eac29fe8b77a6589428e4a4f6dd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.19/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.19.16"
+LINUX_VERSION ?= "5.19.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


