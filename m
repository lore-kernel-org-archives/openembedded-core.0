Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9051E77199
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:08:26 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.31001.1735913297940068588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=khyDODIJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dd01781b56so48350126d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913297; x=1736518097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1NPXr3i89Q9m6ZD7QJnkv8wFSlDZmwXn1JP9XHHwfo=;
        b=khyDODIJc+pr8dPA7u58N97M6/p6xE7AxftsH5g6I4WZmQwQEYfoz8Xxms1Y1va06z
         JR6vqf8xYbdL1Rl+DbOIxHehYdF7+PRdLCM0CztnuUOG7Oxhhoua8DIMxkv3aw81rOF5
         sqLbpa/9uXT7DRFNmbm/V/vuqKVbjPzEVq0y09xmVmZVp1GlqeSjQCEh6yh0zP1S33BJ
         vD+nINl1bqLPmiUSbRua9mL6m/+PtzNJApiaFTbXciqI2oLHTKOODrjEGn7yAFewNR/I
         dGZq8jg47qSKNynH8eSk6CReyfQj8W+781tHKsJpp6NeMBlhOsivJ7n0LB7TJiJyhdZ2
         PotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913297; x=1736518097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1NPXr3i89Q9m6ZD7QJnkv8wFSlDZmwXn1JP9XHHwfo=;
        b=TS7oiiiPXmExoBeWGPbEqYDA882EQNrPYXRfsis6D7sJJls/79+XYj0tDjamFUXjv/
         9A+hyTUHa/j4/6PX4GqBAJewky+8pHQJnlOvtaUL2GrlRKBDNWAPw1JupoXZJYTsevnB
         238ypL3pfl4uBCQHVBQnA8vwiEAfv54Yfv/xtQha4MZ58Z3G92h8EbieBZ4i+Ncx06Ym
         2LrKQDjKG9SBIQ3RjQLwdZ8VaxbBbkUBDQo/lic2QJpK3bT2QiKGGixf17MfprBb4lI/
         GzoAIPC1NOPHcQupML2RPnyGEnRcwsmPEWq//6OgkIM5bMzYtymWKLkUh1EU3jb0qVu3
         yeiA==
X-Gm-Message-State: AOJu0YxokElPZdZGjZSbpAm/Nm9xoxusy2mxDbztoGDSIpIHkERet2zz
	GDgapEhzfxwpSxnFxG4cN4iCoqULihBn0AKa7T8YpJRQtFLSJsBGabreyOpg7EE=
X-Gm-Gg: ASbGncuabM0v5V+cy6U/5DZePMwXg+4cV9uWl4bAr4u6uQdDtavfyFx9S1b+1quyT81
	GIO5fszoH/UdYkZR8mh+OcTJ479SDPnZsOUpzQ6vlTeV7mGrpkj425Agm1jzerEw8TAsE9GC+ew
	ePJFyLMQkswP/ft+ckqB69fBxW9qXVuAbL4d2sT00p73DvMys3FikNr5P8GnVHgXXUuIpnUoMM7
	DxlkKqeeBnIDP+lctFVqrdIw9LK8E97AJySLBFDEtuZOSxJzG0wctiJPE8rxLucqjKGKLaB4xm4
	N9oyElleVpOxOUHJU4bwZ7+SM9PR+pTjIS/ATfYZLdtIBipuTrxQMSzumg==
X-Google-Smtp-Source: AGHT+IHlJPQn92NoGMcTqIXakRHbZnd4fspl52jyORVMRE5qNzCuAyYhkAT5Bt+bIR/IYmYymcjR8Q==
X-Received: by 2002:a05:6214:250e:b0:6d8:d5f6:8c75 with SMTP id 6a1803df08f44-6dd2334bcd5mr779123406d6.12.1735913296401;
        Fri, 03 Jan 2025 06:08:16 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddbe688b33sm18748286d6.84.2025.01.03.06.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:08:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/6.6: update to v6.6.66
Date: Fri,  3 Jan 2025 09:08:08 -0500
Message-Id: <60d88cb5ac781d45e966ece2f4f0c88e7abdd816.1735913191.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1735913191.git.bruce.ashfield@gmail.com>
References: <cover.1735913191.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209350

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    a66cdcdc9e44 Linux 6.6.66
    35163f642d91 i3c: master: svc: fix possible assignment of the same address to two devices
    43bbc5f8586e i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
    1baed369508b serial: amba-pl011: fix build regression
    5eb15d2f4eb4 platform/x86: asus-wmi: Fix thermal profile initialization
    8bb7b689369e ALSA: usb-audio: Update UMP group attributes for GTB blocks, too
    fe330624b85f usb: dwc3: ep0: Don't reset resource alloc flag
    3706311ea095 net/smc: fix incorrect SMC-D link group matching logic
    7a89f5318252 ALSA: hda: Fix build error without CONFIG_SND_DEBUG
    2daba7d857e4 drm/amdgpu: rework resume handling for display (v2)
    aec3eecce11d ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()
    3e26e24a301e ocfs2: Revert "ocfs2: fix the la space leak when unmounting an ocfs2 volume"
    7a670b420ef2 btrfs: add cancellation points to trim loops
    d11f14a7911e iio: invensense: fix multiple odr switch when FIFO is off
    ed968a1f1f66 xhci: dbc: Fix STALL transfer event handling
    1af5e8b1c9f3 mm/damon/vaddr: fix issue in damon_va_evenly_split_region()
    4358f241594b jffs2: Fix rtime decompressor
    6808a1812a34 jffs2: Prevent rtime decompress memory corruption
    0d5c7fcfa585 KVM: x86/mmu: Ensure that kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()
    67b5ed3b4d36 selftests/ftrace: adjust offset for kprobe syntax error test
    032b4122a92a vfio/mlx5: Align the page tracking max message size with the device capability
    7535956ffe5b Revert "unicode: Don't special case ignorable code points"
    1240225d838b x86: Fix build regression with CONFIG_KEXEC_JUMP enabled
    720792341f5e tracing/eprobe: Fix to release eprobe when failed to add dyn_event
    9d9bd3f7da8a clk: en7523: Initialize num before accessing hws in en7523_register_clocks()
    2a72d5cc83d6 btrfs: fix missing snapshot drew unlock when root is dead during swap activation
    b600d3040285 sched/deadline: Fix warning in migrate_enable for boosted tasks
    01ecd269755e sched/deadline: Move bandwidth accounting into {en,de}queue_dl_entity
    842010e3ca9e sched/deadline: Collect sched_dl_entity initialization
    24617f9ca8c8 sched: Unify more update_curr*()
    7f509457773e sched: Remove vruntime from trace_sched_stat_runtime()
    4db5988bb099 sched: Unify runtime accounting across classes
    654f3294c69e sched/headers: Move 'struct sched_param' out of uapi, to work around glibc/musl breakage
    b2f7d7507982 sched/fair: Rename check_preempt_curr() to wakeup_preempt()
    5787443f556e sched/fair: Rename check_preempt_wakeup() to check_preempt_wakeup_fair()
    b607a3886e61 sched/core: Prevent wakeup of ksoftirqd during idle load balance
    a2b004f5c93d sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy
    f163cf9c6ae9 sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()
    a13b2b9b0b0b mm/mempolicy: fix migrate_to_node() assuming there is at least one VMA in a MM
    cc424890b06b mempolicy: fix migrate_pages(2) syscall return nr_failed
    8f149bcc4d91 sched/numa: fix memory leak due to the overwritten vma->numab_state
    41f65469c33f sched/numa: Fix mm numa_scan_seq based unconditional scan
    42882b583095 io_uring/tctx: work around xa_store() allocation error issue
    c45cec53eeb4 setlocalversion: work around "git describe" performance
    2102ed90f789 smb: client: don't try following DFS links in cifs_tree_connect()
    b32ce4f9e3b7 serial: 8250_dw: Add Sophgo SG2044 quirk
    79f1a5b17bf5 rtc: cmos: avoid taking rtc_lock for extended period of time
    3fbde702748d misc: eeprom: eeprom_93cx6: Add quirk for extra read clock cycle
    691284c2cd33 powerpc/prom_init: Fixup missing powermac #size-cells
    44eb450d8ed5 ASoC: amd: yc: Add quirk for microphone on Lenovo Thinkpad T14s Gen 6 21M1CTO1WW
    8ef9ea1503d0 MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
    cb6d7ffca4be drm/amdgpu/vcn: reset fw_shared when VCPU buffers corrupted on vcn v4.0.3
    ddc2aa0f99e7 ASoC: amd: yc: fix internal mic on Redmi G 2022
    2c810ecfcc95 iio: light: ltr501: Add LTER0303 to the supported devices
    3fc7b49d24b1 usb: chipidea: udc: handle USB Error Interrupt if IOC not set
    57f7979aefdc fs/ntfs3: Fix case when unmarked clusters intersect with zone
    c5f89458a2ea LoongArch: Fix sleeping in atomic context for PREEMPT_RT
    ec1208b13c5e ACPI: x86: Clean up Asus entries in acpi_quirk_skip_dmi_ids[]
    353bc143066d ACPI: x86: Add skip i2c clients quirk for Acer Iconia One 8 A1-840
    295b50e95e90 f2fs: fix to shrink read extent node in batches
    76bdd3b1c256 f2fs: print message if fscorrupted was found in f2fs_new_node_page()
    ffe19e363c6f i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock
    29c80f54e362 PCI: Add ACS quirk for Wangxun FF5xxx NICs
    407476eb5f76 PCI: Add 'reset_subordinate' to reset hierarchy below bridge
    b824ea2af6e0 PCI: Detect and trust built-in Thunderbolt chips
    c37cc784af7e PCI: vmd: Set devices to D0 before enabling PM L1 Substates
    61ee910a0042 PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
    70d65110986e PCI: qcom: Add support for IPQ9574
    a6dc4b4fda2e i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
    880827a141e3 KMSAN: uninit-value in inode_go_dump (5)
    9669b28f81e0 f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
    562334170295 verification/dot2: Improve dot parser robustness
    7a135fd49c3e smb: client: memcpy() with surrounding object base address
    08ab71e0f618 nvdimm: rectify the illogical code within nd_dax_probe()
    9e4828b78e28 thermal/drivers/qcom/tsens-v1: Add support for MSM8937 tsens
    03bf88b1e95d pinctrl: qcom: spmi-mpp: Add PM8937 compatible
    b377ef01a3d9 pinctrl: qcom-pmic-gpio: add support for PM8937
    338368f7fe2d scsi: st: Add MTIOCGET and MTLOAD to ioctls allowed after device reset
    0e5642e73a63 scsi: st: Don't modify unknown block number in MTIOCGET
    f6d6fb563e4b leds: class: Protect brightness_show() with led_cdev->led_access mutex
    8d37cb1c8f1a clk: qcom: tcsrcc-sm8550: add SAR2130P support
    62bd597e1e87 clk: qcom: rpmh: add support for SAR2130P
    80864fe570d5 clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
    c6c58505bfba scsi: lpfc: Call lpfc_sli4_queue_unset() in restart and rmmod paths
    5fe23c57abad bpf: put bpf_link's program when link is safe to be deallocated
    6ff9768a3144 scsi: ufs: core: Make DMA mask configuration more flexible
    2da32aed4a97 pinmux: Use sequential access to access desc->pinmux data
    50ddf4b0e1a4 scsi: hisi_sas: Add cond_resched() for no forced preemption model
    77c9ad0c425a rtla/timerlat: Make timerlat_top_cpu->*_count unsigned long long
    987abe82faa9 tools/rtla: fix collision with glibc sched_attr/sched_set_attr
    aceff9270e86 tracing: Use atomic64_inc_return() in trace_clock_counter()
    d62b8e0c3f36 tracing/ftrace: disable preemption in syscall probe
    1cbb632b515a pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
    fdac3e251d9e netpoll: Use rcu_access_pointer() in __netpoll_setup
    843adffcbb4a net/neighbor: clear error in case strict check is not set
    ed8cf33dead6 rocker: fix link status detection in rocker_carrier_init()
    d7a6ff5dc803 ASoC: hdmi-codec: reorder channel allocation list
    d87c7db6213c Bluetooth: Set quirks for ATS2851
    ac22911f2eed Bluetooth: Support new quirks for ATS2851
    5af48b484ec0 Bluetooth: Add new quirks for ATS2851
    5e50d12cc6e9 Bluetooth: hci_core: Fix not checking skb length on hci_acldata_packet
    36af575822ef Bluetooth: btusb: Add RTL8852BE device 0489:e123 to device tables
    916b577a2cef dsa: qca8k: Use nested lock to avoid splat
    10e8a2dec9ff bpf: Call free_htab_elem() after htab_unlock_bucket()
    07c020c6d14d wifi: brcmfmac: Fix oops due to NULL pointer dereference in brcmf_sdiod_sglist_rw()
    3afd475d5af9 wifi: ipw2x00: libipw_rx_any(): fix bad alignment
    b9e52a96ec92 drm/amdgpu: set the right AMDGPU sg segment limitation
    83c45de6c6ce ALSA: usb-audio: Make mic volume workarounds globally applicable
    a8f7d6963768 virtio-net: fix overflow inside virtnet_rq_alloc
    4e3f73221deb drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov
    69df145daf15 fsl/fman: Validate cell-index value obtained from Device Tree
    3b5d21b56c37 jfs: add a check to prevent array-index-out-of-bounds in dbAdjTree
    e7d376f94f72 jfs: fix array-index-out-of-bounds in jfs_readdir
    c56245baf3fd jfs: fix shift-out-of-bounds in dbSplit
    fd993b2180b4 jfs: array-index-out-of-bounds fix in dtReadFirst
    c212d91070be dma-debug: fix a possible deadlock on radix_lock
    efb054752f2c drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr
    3295bd236450 netlink: specs: Add missing bitset attrs to ethtool spec
    ccc22ebf98df drm/amdgpu: Dereference the ATCS ACPI buffer
    9a1546e775f5 drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for vega20_ih
    87210234e5a2 drm/sched: memset() 'job' in drm_sched_job_init()
    d783451a49d4 net: stmmac: Programming sequence for VLAN packets with split header
    81f4a1e9b654 net: sfp: change quirks for Alcatel Lucent G-010S-P
    556ae6c91145 drm/panel: simple: Add Microchip AC69T88A LVDS Display panel
    ffe1766a3a55 fanotify: allow reporting errors on failure to open fd
    d7a6fb6442b1 wifi: ath5k: add PCI ID for Arcadyan devices
    87b969352d38 wifi: ath5k: add PCI ID for SX76X
    706b07b7b37f net: inet6: do not leave a dangling sk pointer in inet6_create()
    25447c6aaa72 net: inet: do not leave a dangling sk pointer in inet_create()
    b4982fbf1304 net: ieee802154: do not leave a dangling sk pointer in ieee802154_create()
    db207d19adba net: af_can: do not leave a dangling sk pointer in can_create()
    6021ccc2471b Bluetooth: RFCOMM: avoid leaving dangling sk pointer in rfcomm_sock_alloc()
    8ad09ddc63ac Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
    157f08db9412 af_packet: avoid erroring out after sock_init_data() in packet_create()
    b77109f18a8d net/sched: cbs: Fix integer overflow in cbs_set_port_rate()
    159c6df97655 net: ethernet: fs_enet: Use %pa to format resource_size_t
    6c591b8d0153 net: fec_mpc52xx_phy: Use %pa to format resource_size_t
    cf27f38254db samples/bpf: Fix a resource leak
    a52bc92fc47e r8169: don't apply UDP padding quirk on RTL8126A
    fba2b2d0b7cc ALSA: hda/conexant: Use the new codec SSID matching
    f4306ef142bc ALSA: hda: Use own quirk lookup helper
    45e43e721e26 drm/display: Fix building with GCC 15
    6fbdc3980b70 dlm: fix possible lkb_resource null dereference
    5059372280e2 drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()
    1a0f54cb3fea wifi: rtw89: check return value of ieee80211_probereq_get() for RNR
    1159d74ed469 drm/mcde: Enable module autoloading
    0a59c2fe8d67 drm/bridge: it6505: Enable module autoloading
    189dc7030b72 drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK
    33126ee70c56 drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
    290127c6452d drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
    258b997e5119 drm/vc4: hvs: Set AXI panic modes for the HVS
    e0388a95736a drm/vc4: hdmi: Avoid log spam for audio start failure
    6e8348ec4215 HID: magicmouse: Apple Magic Trackpad 2 USB-C driver support
    66ab53850ca1 selftests/resctrl: Protect against array overflow when reading strings
    70e2f30534bb regmap: maple: Provide lockdep (sub)class for maple tree's internal lock
    2129f6faa5df soc: imx8m: Probe the SoC driver as platform driver
    3379f506f059 mmc: sdhci-esdhc-imx: enable quirks SDHCI_QUIRK_NO_LED
    63ddf8a5ec8f mmc: core: Add SD card quirk for broken poweroff notification
    8910c0217d7e media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
    31f9b4a22347 media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera
    f20f3416fe33 media: uvcvideo: RealSense D421 Depth module metadata
    115afb20fdff HID: add per device quirk to force bind to hid-generic
    5b1f34bf3617 spi: spi-fsl-lpspi: Adjust type of scldiv
    28ed7bc5eee0 perf/x86/amd: Warn only on new bits set
    5a4688dbf4ae ACPI: x86: Make UART skip quirks work on PCI UARTs without an UID
    cfa076596dc4 hwmon: (nct6775) Add 665-ACE/600M-CL to ASUS WMI monitoring list
    dca4e74a9185 kcsan: Turn report_filterlist_lock into a raw_spinlock
    e8483ae13100 kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
    4c7baac247ce btrfs: do not clear read-only when adding sprout device
    a5d74fa24752 btrfs: avoid unnecessary device path update for the same device
    a5bc4e030f50 btrfs: don't take dev_replace rwsem on task already holding it
    a69752f1e5de s390/cpum_sf: Handle CPU hotplug remove during sampling
    7c27b25891b0 kselftest/arm64: Log fp-stress child startup errors to stdout
    61005057fd5c epoll: annotate racy check
    af3fde6112b2 x86/mm: Add _PAGE_NOPTISHADOW bit to avoid updating userspace page tables
    cb9945f292a8 kasan: make report_lock a raw spinlock
    625e3f5d13a7 lib: stackinit: hide never-taken branch from compiler
    03ba9477dcca ocfs2: update seq_file index in ocfs2_dlm_seq_next
    07f395d6197c mmc: core: Further prevent card detect during shutdown
    5d8525e5067a mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on Vexia Edu Atla 10 tablet
    f1a99d8645d8 regmap: detach regmap from dev on regmap_exit
    f8abd03f83d5 xsk: fix OOB map writes when deleting elements
    5ea568e71d0c dma-fence: Use kernel's sort for merging fences
    ce97e7891b5d dma-fence: Fix reference leak on fence merge failure path
    4e1cb04a68af dma-buf: fix dma_fence_array_signaled v4
    8e858930695d bpf: fix OOB devmap writes when deleting elements
    94666abe8163 x86/kexec: Restore GDT on return from ::preserve_context kexec
    70d6c1badec3 modpost: Add .irqentry.text to OTHER_SECTIONS
    e2153e479e93 drm/amdgpu/hdp5.2: do a posting read when flushing HDP
    d834d20d2e86 drm/dp_mst: Fix resetting msg rx state after topology removal
    396f697500c8 drm/dp_mst: Verify request type in the corresponding down message reply
    c58947a8d4a5 drm/dp_mst: Fix MST sideband message body length check
    23b5908b11b7 cacheinfo: Allocate memory during CPU hotplug if not done from the primary CPU
    cc05aa2c0117 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR again
    bd74bc9b3a8c smb3.1.1: fix posix mounts to older servers
    ccf435caa314 fs/smb/client: cifs_prime_dcache() for SMB3 POSIX reparse points
    136fca78a66d fs/smb/client: Implement new SMB3 POSIX type
    439224eb2f5b fs/smb/client: avoid querying SMB2_OP_QUERY_WSL_EA for SMB3 POSIX
    c3afea07477b nilfs2: fix potential out-of-bounds memory access in nilfs_find_entry()
    1e30b52edf17 scsi: ufs: core: Add missing post notify for power mode change
    0069928727c2 scsi: ufs: core: sysfs: Prevent div by zero
    38bd792fb676 scsi: qla2xxx: Remove check req_sg_cnt should be equal to rsp_sg_cnt
    15369e774f27 scsi: qla2xxx: Fix use after free on unload
    dbd3f8f3ade1 scsi: qla2xxx: Supported speed displayed incorrectly for VPorts
    968bba7d1d04 scsi: qla2xxx: Fix NVMe and NPIV connect issue
    00e1503aaef7 scsi: qla2xxx: Fix abort in bsg timeout
    bafa26387438 ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360 (NP730QFG)
    00a4369b3a4b ALSA: hda/realtek: Enable mute and micmute LED on HP ProBook 430 G8
    2e50b49ba498 ALSA: usb-audio: add mixer mapping for Corsair HS80
    96035c0093db arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
    8c36240460f9 arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
    cdf81c4a8150 tracing: Fix cmp_entries_dup() to respect sort() comparison rules
    50d66c86262f can: mcp251xfd: mcp251xfd_get_tef_len(): work around erratum DS80000789E 6.
    1ac442f25c19 can: dev: can_set_termination(): allow sleeping GPIOs
    7015d9d4cc70 watchdog: rti: of: honor timeout-sec property
    164d3597d26d ksmbd: fix Out-of-Bounds Write in ksmbd_vfs_stream_write
    27de4295522e ksmbd: fix Out-of-Bounds Read in ksmbd_vfs_stream_read
    7dfbf011a57b LoongArch: Add architecture specific huge_pte_clear()
    a7f0509556fa HID: wacom: fix when get product name maybe null pointer
    81ad32b87eb9 mm: page_alloc: move mlocked flag clearance into free_pages_prepare()
    67a102352bb2 x86/CPU/AMD: WARN when setting EFER.AUTOIBRS if and only if the WRMSR fails
    68570b5c89c5 bpf: Fix exact match conditions in trie_get_next_key()
    2e9ff3f4834c bpf: Handle in-place update for full LPM trie correctly
    c1ab31edd258 bpf: Remove unnecessary kfree(im_node) in lpm_trie_update_elem
    c5325e6e4b6d bpf: Handle BPF_EXIST and BPF_NOEXIST for LPM trie
    67e972130bb6 iio: magnetometer: yas530: use signed integer type for clamp limits
    6d3f4c72019f scatterlist: fix incorrect func name in kernel-doc
    a84d507d3290 ocfs2: free inode when ocfs2_get_init_inode() fails
    6acd8e87b6e1 drm/v3d: Enable Performance Counters before clearing them
    88237f66b142 ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
    602c3038a8a6 scsi: scsi_debug: Fix hrtimer support for ndelay
    59b30afa5786 scsi: sg: Fix slab-use-after-free read in sg_release()
    c169daf3cf39 bpf: Fix narrow scalar spill onto 64-bit spilled scalar slots
    9a420d6b4065 ASoC: SOF: ipc3-topology: fix resource leaks in sof_ipc3_widget_setup_comp_dai()
    77e01dfb4fb2 ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index
    f65d85bc1ffd spi: mpc52xx: Add cancel_work_sync before module remove
    37eef8c2e085 tools: Override makefile ARCH variable if defined, but empty
    8a2d8958585a ALSA: usb-audio: Notify xrun for low-latency mode
    06d43e40e2f9 ALSA: seq: ump: Fix seq port updates per FB info notify
    8ddb4126e6a4 ALSA: ump: Update substream name from assigned FB names
    d3e8e4d62c88 ALSA: seq: ump: Use automatic cleanup of kfree()
    206d56f41a15 tcp_bpf: Fix the sk_mem_uncharge logic in tcp_bpf_sendmsg
    f2f6d999a934 drm/sti: Add __iomem for mixer_dbg_mxn's parameter
    6bc209dbacc5 bpftool: fix potential NULL pointer dereferencing in prog_dump()
    0fcda0c9cb15 xsk: always clear DMA mapping information when unmapping the pool
    d504dc20b768 bpf, vsock: Invoke proto::close on close()
    57c47d3cf1a6 bpf, vsock: Fix poll() missing a queue
    c3799292d639 scsi: ufs: core: Add ufshcd_send_bsg_uic_cmd() for UFS BSG
    12e24d8a005c scsi: ufs: core: Always initialize the UIC done completion
    d5be5ce82a7e drm/bridge: it6505: Fix inverted reset polarity
    485924554390 drm/bridge: it6505: update usleep_range for RC circuit charge time
    f454a3e98c30 i3c: master: Fix dynamic address leak when 'assigned-address' is present
    990da49bfcbf i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
    72863649acec i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
    ac0fed078bc9 i3c: master: svc: Modify enabled_events bit 7:0 to act as IBI enable counter
    07f4c0df0eb3 i3c: master: svc: use slow speed for first broadcast address
    5626d1addc2a i3c: master: support to adjust first broadcast address speed
    a68c391c6321 i3c: master: fix kernel-doc check warning
    8aa36f7e004b i3c: master: svc: add hot join support
    e7217d528ef5 i3c: master: add enable(disable) hot join in sys entry
    ed24ab98242f f2fs: fix to drop all discards after creating snapshot on lvm device
    f3ae93e738db driver core: fw_devlink: Stop trying to optimize cycle detection logic
    dce7a5c7bfa3 driver core: Add FWLINK_FLAG_IGNORE to completely ignore a fwnode link
    5c764791fb7b driver core: fw_devlink: Improve logs for cycle detection
    faa6f8ce1b15 ntp: Remove invalid cast in time offset math
    91d2be8d4bf5 powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
    d68b0e67cff7 powerpc/vdso: Refactor CFLAGS for CVDSO build
    4a9485918a04 iommu/arm-smmu: Defer probe of clients after smmu device bound
    7360a0e798f4 zram: clear IDLE flag in mark_idle()
    9c251d1381ed zram: do not mark idle slots that cannot be idle
    b7c3fd65a3ea zram: split memory-tracking and ac-time tracking
    543d8315c289 mmc: mtk-sd: Fix MMC_CAP2_CRYPTO flag setting
    7e0ccc28fad1 mmc: mtk-sd: fix devm_clk_get_optional usage
    06b7f9295a42 mmc: mtk-sd: Fix error handle of probe function
    a8ece7488716 mmc: mtk-sd: use devm_mmc_alloc_host
    c6a3fa838e51 usb: dwc3: ep0: Don't clear ep0 DWC3_EP_TRANSFER_STARTED
    3df5497b9183 usb: dwc3: ep0: Don't reset resource alloc flag (including ep0)
    65b1f31111ee usb: dwc3: gadget: Rewrite endpoint allocation flow
    395d9b40431c soc: fsl: cpm1: qmc: Set the ret error code on platform_get_irq() failure
    6885d8e7c1e3 soc: fsl: cpm1: qmc: Introduce qmc_{init,exit}_xcc() and their CPM1 version
    c73f53c7aaae soc: fsl: cpm1: qmc: Introduce qmc_init_resource() and its CPM1 version
    f865643723e9 soc: fsl: cpm1: qmc: Re-order probe() operations
    7ca6b9e73db2 soc: fsl: cpm1: qmc: Fix blank line and spaces
    850cee347212 soc/fsl: cpm: qmc: Convert to platform remove callback returning void
    2eb983f69079 serial: amba-pl011: Fix RX stall when DMA is used
    5aea1229e7ea serial: amba-pl011: Use port lock wrappers
    8d2ca6ac3711 gpio: grgpio: Add NULL check in grgpio_probe
    9cc1a6ce157d gpio: grgpio: use a helper variable to store the address of ofdev->dev
    fbc0a0c7718a xhci: Fix control transfer error on Etron xHCI host
    4a2422f67879 xhci: Don't issue Reset Device command to Etron xHCI host
    ec4e6d5944cd xhci: Combine two if statements for Etron xHCI host
    459cda7500ec xhci: remove XHCI_TRUST_TX_LENGTH quirk
    d55694547cd2 xhci: Allow RPM on the USB controller (1022:43f7) by default
    ea6b5d98fea4 KVM: arm64: Don't retire aborted MMIO instruction
    3fe534a02897 KVM: arm64: Change kvm_handle_mmio_return() return polarity
    3265aab0736f net: avoid potential UAF in default_operstate()
    4bd8ced2b9f6 net/mlx5e: Remove workaround to avoid syndrome for internal port
    97ce3a4ec55e geneve: do not assume mac header is set in geneve_xmit_skb()
    711525430d12 mlxsw: spectrum_acl_flex_keys: Use correct key block on Spectrum-4
    e5239f8671a1 mlxsw: spectrum_acl_flex_keys: Constify struct mlxsw_afk_element_inst
    5e7388444095 mlxsw: Mark high entropy key blocks
    64b67f77d993 mlxsw: Edit IPv6 key blocks to use one less block for multicast forwarding
    69f60dda481a mlxsw: spectrum_acl_flex_keys: Add 'ipv4_5b' flex key
    7598e65f990a mlxsw: Add 'ipv4_5' flex key
    e5242c5ff4c8 ethtool: Fix wrong mod state in case of verbose and no_mask bitset
    86c27603514c netfilter: nft_set_hash: skip duplicated elements pending gc run
    90bf312a6b6b netfilter: ipset: Hold module reference while requesting a module
    f6dc30c4698d net: sched: fix erspan_opt settings in cls_flower
    53c7314208c8 netfilter: nft_inner: incorrect percpu area handling under softirq
    f309733a8c9d igb: Fix potential invalid memory access in igb_init_module()
    0a4d8b1e3b28 ixgbe: downgrade logging of unsupported VF API version to debug
    2bf463e6c540 ixgbevf: stop attempting IPSEC offload on Mailbox API 1.5
    4f63de0ef87b net/qed: allow old cards not supporting "num_images" to work
    673d606683ac net/smc: fix LGR and link use-after-free issue
    f0c37002210a net/smc: initialize close_work early to avoid warning
    f59b799e52f7 net/smc: refactoring initialization of smc sock
    21f6f41e82e5 net/smc: {at|de}tach sndbuf to peer DMB if supported
    fe7ef3a10c75 net/smc: add operations to merge sndbuf with peer DMB
    988b81020ad4 net/smc: mark optional smcd_ops and check for support when called
    7e5ef8eb0547 net/smc: compatible with 128-bits extended GID of virtual ISM device
    70cfb64c882c net/smc: define a reserved CHID range for virtual ISM devices
    dd0ab991caf1 net/smc: unify the structs of accept or confirm message for v1 and v2
    8ea4fc3fefa1 net/smc: introduce sub-functions for smc_clc_send_confirm_accept()
    612c04a92730 net/smc: rename some 'fce' to 'fce_v2x' for clarity
    d00d4470bf8c tipc: Fix use-after-free of kernel socket in cleanup_bearer().
    d3ec686a369f dccp: Fix memory leak in dccp_feat_change_recv
    f43d12fd0fa8 net/ipv6: release expired exception dst cached in socket
    797a4c1f5b63 ipv6: introduce dst_rt6_info() helper
    19a788bd40fd net-timestamp: make sk_tskey more predictable in error path
    4d5a573f64e8 platform/x86: asus-wmi: Ignore return value when writing thermal policy
    5a4f732e2a8f platform/x86: asus-wmi: Fix inconsistent use of thermal policies
    6051a4b17f9e platform/x86: asus-wmi: add support for vivobook fan profiles
    426d94815e12 can: j1939: j1939_session_new(): fix skb reference counting
    3c215663b3e2 net: hsr: avoid potential out-of-bound access in fill_frame_info()
    d381c2b0d77e net/sched: tbf: correct backlog statistic for GSO packets
    70966e5bafb7 ptp: Add error handling for adjfine callback in ptp_clock_adjtime
    66127f0d1ecf net: enetc: Do not configure preemptible TCs if SIs do not support
    ea8e9f84ea15 selftests: hid: fix typo and exit code
    2f9bec0a749e netfilter: nft_socket: remove WARN_ON_ONCE on maximum cgroup level
    a9bcc0b70d9b netfilter: x_tables: fix LED ID check in led_tg_check()
    124834133b32 ipvs: fix UB due to uninitialized stack access in ip_vs_protocol_init()
    39df17a12746 can: f81604: f81604_handle_can_bus_errors(): fix {rx,tx}_errors statistics
    c7f3a539b180 can: ems_usb: ems_usb_rx_err(): fix {rx,tx}_errors statistics
    0fef1604a436 can: sun4i_can: sun4i_can_err(): fix {rx,tx}_errors statistics
    bbbc9e190b26 can: sja1000: sja1000_err(): fix {rx,tx}_errors statistics
    98b7477236be can: hi311x: hi3110_can_ist(): fix {rx,tx}_errors statistics
    bf92d477a9a3 can: ifi_canfd: ifi_canfd_handle_lec_err(): fix {rx,tx}_errors statistics
    dce292ffb728 can: m_can: m_can_handle_lec_err(): fix {rx,tx}_errors statistics
    112802200944 can: hi311x: hi3110_can_ist(): fix potential use-after-free
    8ac49d8fc936 can: sun4i_can: sun4i_can_err(): call can_change_state() even if cf is NULL
    c146df8292c6 can: c_can: c_can_handle_bus_err(): update statistics if skb allocation fails
    1cdd3563e147 can: gs_usb: add usb endpoint address detection at driver probe step
    e2282706eb5c can: gs_usb: add VID/PID for Xylanta SAINT3 product family
    b8a0428f1eb2 watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
    d556b4ff5854 watchdog: apple: Actually flush writes after requesting watchdog restart
    babc8a52fe69 watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
    e417b3cb55a7 iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
    943e0aeece93 Linux 6.6.65
    b47d9ffb2d1d openrisc: Use asm-generic's version of fix_to_virt() & virt_to_fix()
    52ab77109035 Revert "x86/pvh: Set phys_base when calling xen_prepare_pvh()"
    dd47f7175940 Revert "x86/pvh: Call C code via the kernel virtual mapping"
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 6b13ce78dd..4554170afc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec2b8ce9a5c287dc48d9643f9f5d5cf1bb3784de"
-SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
+SRCREV_machine ?= "28d4ec344946d273a8ab6f4ae18163bd97096e9d"
+SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.64"
+LINUX_VERSION ?= "6.6.66"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index adf1215ff1..e6f6aadaa5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.64"
+LINUX_VERSION ?= "6.6.66"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
+SRCREV_machine ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 73f3c437db..d6fd411b7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "390fa422d33daad3f6046b7223654f58517eb285"
-SRCREV_machine:qemuarm64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemuloongarch64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemumips ?= "47f3134d3ef0f0ccc24bec6325dc66520045dc00"
-SRCREV_machine:qemuppc ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemuriscv64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemuriscv32 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemux86 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemux86-64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_machine:qemumips64 ?= "37a948fa6a662b8f42fb23009734edaa20dfef22"
-SRCREV_machine ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
-SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
+SRCREV_machine:qemuarm ?= "ac47e2d574643c2f15824f571f00287536385207"
+SRCREV_machine:qemuarm64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemuloongarch64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemumips ?= "88054d5c80cf5d95abb808479640564c45e416d1"
+SRCREV_machine:qemuppc ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemuriscv64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemuriscv32 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemux86 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemux86-64 ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_machine:qemumips64 ?= "c3d3e3fa5f4c9de29e7c0cf3a85d2a959ad4f155"
+SRCREV_machine ?= "77698884d242eb893d8c6de2d49318561ef0b39f"
+SRCREV_meta ?= "82e71c6dcc562dbf7725e5ef994ef2ecd74e704c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "22a054ea1f081d7837cc8e24ad4c7aa36e8bba04"
+SRCREV_machine:class-devupstream ?= "a66cdcdc9e44b4c508190ea3cde5750954d1c4eb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.64"
+LINUX_VERSION ?= "6.6.66"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


