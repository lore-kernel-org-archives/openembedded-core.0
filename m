Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1848.1602011082295834037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XL9i2MdV;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c2so17883511qkf.10
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBydQNcf0T9640yz1TQrgwaI11nreCh/13YaJBuQY6c=;
        b=XL9i2MdVIx/OcQ2780MhM67XHPPLSLis8hyArvDEl/rHNQi+k5a5OPID9rznlNYrQ7
         QIjAvjPsp5UZnEwnkaYN97OyYEO/pv6VLs6FfrhZT7jr+wsxDf5yVcM5gmqoO9kt9feC
         MAM86eoabU8XnDmuqUoCbkNEOd5WUi81E9TnFlusCnefBiaoJ90nU8tM3gAcXP8jLGIj
         wvxX0CmfjgQ90VkL0ArY9XgRLFVV8rww2rpnC0MSbdrW7A6WL0gRoataj3eW27zWCpqh
         H+biRqPZ6GOL4ysgDqPwsYVIPI8ppca54WNS7tYXvrUqMuEfZfkJB1gv5QFbJvJkt8If
         sYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBydQNcf0T9640yz1TQrgwaI11nreCh/13YaJBuQY6c=;
        b=DpraFfFMDzTr+Mmk9hYH7znLEhmBSQuoi3PCSbhFCbliE86IEfStq8WDFTc7SnY0JG
         QZR5JqtCRtxC2IONubqqx8L+GqTM2m3ZSU+KvCpnaoaSOGvQ41EtgRwTEGLHDIWwtP2t
         91lv3148QwrYoQKIAI3rgrp9RACSpPG/To1uPaxnslMo1dt7Xrlh70qhp3QzNC8q1SvH
         r7jOdZ7Y6eAkQ3nTR69NsKW5Mp9Wj/pmCGvQ5QjkuLCQPvGt6XeKv+5AdDgFLmjMYJS5
         oXalvgCmIv+1l1NyfqNwrxqT9XlxB7t8qX7BxW0VkSdyHI2gln5q2AEJhGaQNFaBW3pz
         ny5w==
X-Gm-Message-State: AOAM532k5JTSo+WlUCPRPuVkgYQwEPfP2KHN+1M5S5zEi4UkFPxVKbp9
	g2mGHrU1LsNzO2UP8UOkDF3xIg/8MPm5OXiN
X-Google-Smtp-Source: ABdhPJyFrW18ttEWJSiYsYWR/Ktr/NZzjqqhaUIN5T190E75xFTBuWPzZq1culxHaYXjoMJpDXx8OQ==
X-Received: by 2002:a37:6183:: with SMTP id v125mr1973757qkb.497.1602011081104;
        Tue, 06 Oct 2020 12:04:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:40 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/5.8: update to v5.8.11
Date: Tue,  6 Oct 2020 15:04:30 -0400
Message-Id: <ea0703082d0430c72949052640b4acaf2fde5376.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    16b1d77227fe Linux 5.8.11
    aac156c89083 nvme-loop: set ctrl state connecting after init
    f9aa4d81fa77 mm: memcg: fix memcg reclaim soft lockup
    e37b4e9e1fc9 dax: Fix compilation for CONFIG_DAX && !CONFIG_FS_DAX
    19f02438a81b dm: Call proper helper to determine dax support
    e0c0897ec600 mm/memory_hotplug: drain per-cpu pages again during memory offline
    94d6f8013692 dm/dax: Fix table reference counts
    d11304ec0540 selftests/vm: fix display of page size in map_hugetlb
    685e3d17a7e4 powerpc/dma: Fix dma_map_ops::get_required_mask
    be0d3b6e4442 arm64: paravirt: Initialize steal time when cpu is online
    1407ab558b48 ehci-hcd: Move include to keep CRC stable
    be0291fc11e1 s390/zcrypt: fix kmalloc 256k failure
    6042dcf5b872 s390/pci: fix leak of DMA tables on hard unplug
    e094ddf047cb s390: add 3f program exception handler
    ac3019648329 mm/thp: fix __split_huge_pmd_locked() for migration PMD
    97327790b719 kprobes: fix kill kprobe which has been marked as gone
    9cceeff3757b ksm: reinstate memcg charge on copied pages
    864744288911 x86/boot/compressed: Disable relocation relaxation
    165b69c8f073 serial: core: fix console port-lock regression
    8db58f3a6f16 serial: core: fix port-lock initialisation
    a406d438eba4 serial: 8250_pci: Add Realtek 816a and 816b
    ca5a4fe0fa71 thunderbolt: Retry DROM read once if parsing fails
    0545c936808d Input: i8042 - add Entroware Proteus EL07R4 to nomux and reset lists
    7a907c26212a Input: trackpoint - add new trackpoint variant IDs
    75b98fcaf902 percpu: fix first chunk size calculation for populated bitmap
    b15c40405750 ALSA: hda/realtek - The Mic on a RedmiBook doesn't work
    e908c59ae0a7 ALSA: hda: fixup headset for ASUS GX502 laptop
    c3c48a64c61e Revert "ALSA: hda - Fix silent audio output and corrupted input on MSI X570-A PRO"
    c60801b98e5a i2c: i801: Fix resume bug
    8a9e8484683f usb: typec: ucsi: Prevent mode overrun
    ee0ea57b4f48 usb: typec: ucsi: acpi: Increase command completion timeout value
    e61ab5c7d3af usblp: fix race between disconnect() and read()
    f85eb154c2bf USB: UAS: fix disconnect by unplugging a hub
    1066fcb5a164 USB: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for BYD zhaoxin notebook
    8f600ead97e1 drm/i915: Filter wake_flags passed to default_wake_function
    cb7a0e1d8eea drm/i915/gem: Delay tracking the GEM context until it is registered
    056bda592f48 drm/kfd: fix a system crash issue during GPU recovery
    0a264d8dc84a x86/unwind/fp: Fix FP unwinding in ret_from_fork
    ce2b5fe9e7c6 locking/percpu-rwsem: Use this_cpu_{inc,dec}() for read_count
    abd90e56bcb3 efi: efibc: check for efivars write capability
    d82866f2f729 locking/lockdep: Fix "USED" <- "IN-NMI" inversions
    4278efd55e04 riscv: Add sfence.vma after early page table changes
    a7e4fef63846 i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of DMA_CTRL_ACK
    f686668acfaa i2c: mediatek: Fix generic definitions for bus frequency
    174cfa0a85d7 kconfig: qconf: use delete[] instead of delete to free array (again)
    146206e3d115 iommu/amd: Restore IRTE.RemapEn bit for amd_iommu_activate_guest_mode
    56cc04597bcf iommu/amd: Fix potential @entry null deref
    387f1c6e7d4e arm64: bpf: Fix branch offset in JIT
    e1ddb18d2161 drm/mediatek: Add missing put_device() call in mtk_hdmi_dt_parse_pdata()
    d1025c54ecfd drm/mediatek: Add missing put_device() call in mtk_drm_kms_init()
    a51fc6150df5 drm/mediatek: Add exception handing in mtk_drm_probe() if component init fail
    9a904d3afc88 drm/mediatek: Add missing put_device() call in mtk_ddp_comp_init()
    aa0157adb1c5 drm/mediatek: Use CPU when fail to get cmdq event
    881ed5b2d144 MIPS: SNI: Fix spurious interrupts
    ebb11c9c737c fbcon: Fix user font detection test at fbcon_resize().
    9ac473087258 drm/i915/gem: Reduce context termination list iteration guard to RCU
    a0a9d14cc739 perf test: Free formats for perf pmu parse test
    fe2cdde3e8d2 perf parse-event: Fix memory leak in evsel->unit
    015c08bc4d39 perf evlist: Fix cpu/thread map leak
    91dcf4aea6a5 perf metric: Fix some memory leaks
    d60d09d4e133 perf test: Free aliases for PMU event map aliases test
    f8d4ba31972b MIPS: SNI: Fix MIPS_L1_CACHE_SHIFT
    5c44b2d15e2f perf record: Don't clear event's period if set by a term
    9f76fbfc49dc perf test: Fix the "signal" test inline assembly
    b3233e4ae6d3 Drivers: hv: vmbus: Add timeout to vmbus_wait_for_unload
    9065c93d5640 arm64: Allow CPUs unffected by ARM erratum 1418040 to come in late
    8bf2d2009792 scsi: libsas: Fix error path in sas_notify_lldd_dev_found()
    5037cc230723 Drivers: hv: vmbus: hibernation: do not hang forever in vmbus_bus_resume()
    5fc19caaf6b7 ASoC: core: Do not cleanup uninitialized dais on soc_pcm_open failure
    bdfdc751259e ASoC: Intel: haswell: Fix power transition refactor
    d64aac6b2c54 ASoC: tlv320adcx140: Fix accessing uninitialized adcx140->dev
    7cee8e91e3ad ASoC: meson: axg-toddr: fix channel order on g12 platforms
    b41bd0dce2e8 ASoC: soc-core: add snd_soc_find_dai_with_mutex()
    7031ebb9566d powerpc/book3s64/radix: Fix boot failure with large amount of guest memory
    6d035d5e2c5b drm/mediatek: dsi: Fix scrolling of panel with small hfp or hbp
    eb6acd695420 ASoC: qcom: common: Fix refcount imbalance on error
    3ae4251f2035 ASoC: rt700: Fix return check for devm_regmap_init_sdw()
    a177ede1a20d ASoC: rt715: Fix return check for devm_regmap_init_sdw()
    1e8715398cb5 ASoC: rt711: Fix return check for devm_regmap_init_sdw()
    b78a087abb32 ASoC: rt1308-sdw: Fix return check for devm_regmap_init_sdw()
    574b0af715f0 ASoC: qcom: Set card->owner to avoid warnings
    4c2cd3865663 ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference in autosuspend delay
    fa678750d166 clk: rockchip: Fix initialization of mux_pll_src_4plls_p
    ee5725e6919f clk: davinci: Use the correct size when allocating memory
    26f03f98c056 KVM: MIPS: Change the definition of kvm type
    9fc3d4819f91 spi: Fix memory leak on splited transfers
    13773c6dba30 i2c: algo: pca: Reapply i2c bus settings after reset
    f50a7062223d f2fs: Return EOF on unaligned end of file DIO read
    f200e3825c34 f2fs: fix indefinite loop scanning for free nid
    d7595c8deeba block: only call sched requeue_request() for scheduled requests
    5dec8fe9f89a nvme-tcp: cancel async events before freeing event struct
    64e977c91b88 nvme-rdma: cancel async events before freeing event struct
    70554f7dc455 nvme-fc: cancel async events before freeing event struct
    a640a4a43c64 openrisc: Fix cache API compile issue when not inlining
    c1da3b82db73 cifs: fix DFS mount with cifsacl/modefromsid
    d28c42ad8958 rapidio: Replace 'select' DMAENGINES 'with depends on'
    e0b6509ae4a6 SUNRPC: stop printk reading past end of string
    7e4b9125c899 NFS: Zero-stateid SETATTR should first return delegation
    e917cbad17f2 interconnect: Show bandwidth for disabled paths as zero in debugfs
    03a0df5665d9 spi: spi-loopback-test: Fix out-of-bounds read
    7296270e61f1 regulator: pwm: Fix machine constraints application
    3235c4db152b scsi: lpfc: Extend the RDF FPIN Registration descriptor for additional events
    c37f8c7ca46b scsi: lpfc: Fix FLOGI/PLOGI receive race condition in pt2pt discovery
    6cb6f48d68db scsi: libfc: Fix for double free()
    3972281afdb6 scsi: pm8001: Fix memleak in pm8001_exec_internal_task_abort
    6cbfc91797d4 habanalabs: fix report of RAZWI initiator coordinates
    48ef8d42478f habanalabs: prevent user buff overflow
    201e44aeb011 phy: omap-usb2-phy: disable PHY charger detect
    ddf3bb7322a1 NFSv4.1 handle ERR_DELAY error reclaiming locking state on delegation recall
    237345a3cfca xprtrdma: Release in-flight MRs on disconnect
    cc283bfae1f0 firmware_loader: fix memory leak for paged buffer
    3531913b68be loop: Set correct device size when using LOOP_CONFIGURE
    0fb2de68a876 hv_netvsc: Remove "unlikely" from netvsc_select_queue
    a5da15d1716c dt-bindings: PCI: intel,lgm-pcie: Fix matching on all snps,dw-pcie instances
    3d4987232282 net: handle the return value of pskb_carve_frag_list() correctly
    22f290ab6825 mptcp: sendmsg: reset iter on error
    0c43f56ed9be dt-bindings: spi: Fix spi-bcm-qspi compatible ordering
    38e8e8273535 RDMA/bnxt_re: Restrict the max_gids to 256
    67f65fb8318a Linux 5.8.10
    08cb27d67d53 gcov: add support for GCC 10.1
    10cb6c2e406d drm/msm/gpu: make ringbuffer readonly
    a6915129ae97 usb: typec: intel_pmc_mux: Do not configure SBU and HSL Orientation in Alternate modes
    41e3571c02ec usb: typec: intel_pmc_mux: Do not configure Altmode HPD High
    efec148aa4eb usb: typec: intel_pmc_mux: Un-register the USB role switch
    fd23e24737de usb: typec: ucsi: acpi: Check the _DEP dependencies
    5f98bc578de9 usb: Fix out of sync data toggle if a configured device is reconfigured
    a55d0aa3a917 USB: serial: option: add support for SIM7070/SIM7080/SIM7090 modules
    3c04f365d1f9 USB: serial: option: support dynamic Quectel USB compositions
    64de97011bc9 USB: serial: ftdi_sio: add IDs for Xsens Mti USB converter
    3356a2fe9ba7 usb: core: fix slab-out-of-bounds Read in read_descriptors
    4ee2ea67a64c phy: qcom-qmp: Use correct values for ipq8074 PCIe Gen2 PHY init
    97364c2546d5 staging: greybus: audio: fix uninitialized value issue
    b56b1e392e7e video: fbdev: fix OOB read in vga_8planes_imageblit()
    b2d5d5ea7c56 ARM: dts: vfxxx: Add syscon compatible with OCOTP
    737bfb9d464b arm64: dts: imx8mp: correct sdma1 clk setting
    f17c2fe6ea89 test_firmware: Test platform fw loading on non-EFI systems
    46230cc3ff26 debugfs: Fix module state check condition
    bf4c17b74472 Revert "usb: dwc3: meson-g12a: fix shared reset control use"
    68c125324b5e KVM: fix memory leak in kvm_io_bus_unregister_dev()
    a5ba8c6f24b1 kvm x86/mmu: use KVM_REQ_MMU_SYNC to sync when needed
    1e1f9fd4a852 KVM: arm64: Do not try to map PUDs when they are folded into PMD
    209c934c9708 KVM: VMX: Don't freeze guest when event delivery causes an APIC-access exit
    20782abbbdfe vgacon: remove software scrollback support
    ffa74c8e58b8 fbcon: remove now unusued 'softback_lines' cursor() argument
    245a228891e3 fbcon: remove soft scrollback code
    20a3fda3dc88 RDMA/mlx4: Read pkey table length instead of hardcoded value
    ef5c5dc2c83b RDMA/rxe: Fix the parent sysfs read when the interface has 15 chars
    81f5de838b82 rbd: require global CAP_SYS_ADMIN for mapping and unmapping
    49947f869fdf nvme: Revert: Fix controller creation races with teardown flow
    c10bc9123c25 mmc: sdhci-of-esdhc: Don't walk device-tree on every interrupt
    fe7c9fa20fc2 mmc: sdio: Use mmc_pre_req() / mmc_post_req()
    3f4f13a91d87 drm/msm: Disable the RPTR shadow
    16f3920c6508 drm/msm: Disable preemption on all 5xx targets
    c657e400e735 drm/msm: Split the a5xx preemption record
    8e6a2ad4658b drm/tve200: Stabilize enable/disable
    79e1d5d7e3d1 scsi: target: iscsi: Fix hang in iscsit_access_np() when getting tpg->np_login_sem
    b03e704b29a1 scsi: lpfc: Fix setting IRQ affinity with an empty CPU mask
    731435aa8105 scsi: target: iscsi: Fix data digest calculation
    87f0ffddae01 misc: eeprom: at24: register nvmem only after eeprom is ready to use
    94abb06dc753 regulator: core: Fix slab-out-of-bounds in regulator_unlock_recursive()
    e6724a64b942 regulator: plug of_node leak in regulator_register()'s error path
    6828c2aae0b7 regulator: push allocation in set_consumer_device_supply() out of lock
    557bc4f1f78e regulator: push allocations in create_regulator() outside of lock
    96ccd5a5bc06 regulator: push allocation in regulator_init_coupling() outside of lock
    47052502f040 kobject: Restore old behaviour of kobject_del(NULL)
    a36133cc9cf2 thunderbolt: Disable ports that are not implemented
    171169d8254b btrfs: fix wrong address when faulting in pages in the search ioctl
    ac049e1bd9eb btrfs: free data reloc tree on failed mount
    6368e27c5edb btrfs: fix lockdep splat in add_missing_dev
    731cef38b55e btrfs: require only sector size alignment for parent eb bytenr
    75ee09f3b745 staging: wlan-ng: fix out of bounds read in prism2sta_probe_usb()
    ac0698332870 iio:accel:mma8452: Fix timestamp alignment and prevent data leak.
    e8e7cba15d61 iio:accel:mma7455: Fix timestamp alignment and prevent data leak.
    87efc85d53d7 iio: accel: kxsd9: Fix alignment of local buffer.
    58f091e131d1 iio:chemical:ccs811: Fix timestamp alignment and prevent data leak.
    be0bc3cf9e60 iio:light:max44000 Fix timestamp alignment and prevent data leak.
    6ae35c1825e8 iio:magnetometer:ak8975 Fix alignment and data leak issues.
    1f2b6037d4ff iio:adc:ti-adc081c Fix alignment and data leak issues
    456fd60c5803 iio:adc:max1118 Fix alignment of timestamp and data leak issues
    743c6bc208d9 iio:adc:ina2xx Fix timestamp alignment issue.
    98bd6a0d4237 iio:adc:ti-adc084s021 Fix alignment and data leak issues.
    3df5a17f9c36 iio:accel:bmc150-accel: Fix timestamp alignment and prevent data leak.
    35304bc22976 iio:proximity:mb1232: Fix timestamp alignment and prevent data leak.
    c56598930b1c iio:light:ltr501 Fix timestamp alignment issue.
    678f54268269 iio: cros_ec: Set Gyroscope default frequency to 25Hz
    79d1a06c5940 iio: adc: ti-ads1015: fix conversion when CONFIG_PM is not set
    bd9b60be76ef iio: adc: mcp3422: fix locking on error path
    5deb6f82653d iio: adc: mcp3422: fix locking scope
    d9f376187cb1 gcov: Disable gcov build with GCC 10
    790303eb397d iommu/amd: Do not use IOMMUv2 functionality when SME is active
    5aa21abcedd2 iommu/amd: Do not force direct mapping when SME is active
    4898d0e064b9 drm/amdgpu: Fix bug in reporting voltage for CIK
    e688f4fbb37e drivers/net/wan/hdlc: Change the default of hard_header_len to 0
    3b4c12838a4f ALSA: hda: use consistent HDAudio spelling in comments/docs
    dd8ffea695c8 ALSA: hda: fix a runtime pm issue in SOF when integrated GPU is disabled
    ac9f804a8e5a ALSA: hda: hdmi - add Rocketlake support
    5e091ceb5084 arm64/module: set trampoline section flags regardless of CONFIG_DYNAMIC_FTRACE
    d1df83979d57 cpufreq: intel_pstate: Fix intel_pstate_get_hwp_max() for turbo disabled
    4b65cda38fc8 cpufreq: intel_pstate: Refuse to turn off with HWP enabled
    5412a6f03aca ARC: [plat-hsdk]: Switch ethernet phy-mode to rgmii-id
    eb525e6a5499 HID: elan: Fix memleak in elan_input_configured
    dac76fe22da5 drivers/net/wan/hdlc_cisco: Add hard_header_len
    80b7267b3127 HID: microsoft: Add rumble support for the 8bitdo SN30 Pro+ controller
    38ce1ae8e2c8 HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
    d3a6cfff8e6a nvme-pci: cancel nvme device request before disabling
    e625888ac2aa nvme-rdma: fix reset hang if controller died in the middle of a reset
    ca46ff644ab0 nvme-rdma: fix timeout handler
    3341cac774c1 nvme-rdma: serialize controller teardown sequences
    ed67604770cd nvme-tcp: fix reset hang if controller died in the middle of a reset
    18aca936e2ff nvme-tcp: fix timeout handler
    c0e1cf0f6ac2 nvme-tcp: serialize controller teardown sequences
    c244c493f079 nvme: have nvme_wait_freeze_timeout return if it timed out
    6c63e56986d3 nvme-fabrics: don't check state NVME_CTRL_NEW for request acceptance
    0a12c794513c nvmet-tcp: Fix NULL dereference when a connect data comes in h2cdata pdu
    76101def0120 media: gpio-ir-tx: spinlock is not needed to disable interrupts
    92fb4a758e05 irqchip/eznps: Fix build error for !ARC700 builds
    4422ef388645 ARC: show_regs: fix r12 printing and simplify
    74e4b9ae64a2 xfs: initialize the shortform attr header padding entry
    01199dce4d44 cfg80211: Adjust 6 GHz frequency to channel conversion
    3a8fcf73cbf1 mac80211: reduce packet loss event false positives
    55de6d85df5d wireless: fix wrong 160/80+80 MHz setting
    3fd5156d7fbd drivers/net/wan/lapbether: Set network_header before transmitting
    d910490078ac xfs: fix off-by-one in inode alloc block reservation calculation
    c63f823048a7 net: hns3: Fix for geneve tx checksum bug
    79a1d6470026 drivers/dma/dma-jz4780: Fix race condition between probe and irq handler
    7a08699028e4 ALSA: hda/tegra: Program WAKEEN register for Tegra
    92c93dacd804 ALSA: hda: Fix 2 channel swapping for Tegra
    3e7682611f07 scsi: qedf: Fix null ptr reference in qedf_stag_change_work
    6ee6851f8704 firestream: Fix memleak in fs_open
    74bbd3069881 NFC: st95hf: Fix memleak in st95hf_in_send_cmd
    ca9e7f16d783 drivers/net/wan/lapbether: Added needed_tailroom
    1f5a4b08aec3 netfilter: nft_set_rbtree: Detect partial overlap with start endpoint match
    a0a91436d588 netfilter: conntrack: allow sctp hearbeat after connection re-use
    83cadef120e6 MIPS: Loongson64: Do not override watch and ejtag feature
    36120307971e dmaengine: acpi: Put the CSRT table after using it
    a588a27d36f2 ARC: HSDK: wireup perf irq
    c0823ab23d47 KVM: x86: always allow writing '0' to MSR_KVM_ASYNC_PF_EN
    485d953c997e KVM: nVMX: Fix the update value of nested load IA32_PERF_GLOBAL_CTRL control
    2115ddfc96c0 arm64: dts: ns2: Fixed QSPI compatible string
    be8d961d3d4e ARM: dts: BCM5301X: Fixed QSPI compatible string
    9fd9bb1bd6cc ARM: dts: NSP: Fixed QSPI compatible string
    dc4145dfdc6b ARM: dts: bcm: HR2: Fixed QSPI compatible string
    f360dbeb301f IB/isert: Fix unaligned immediate-data handling
    9f6550695d25 RDMA/rtrs-srv: Set .release function for rtrs srv device during device init
    5bcd37b6bf21 block: Set same_page to false in __bio_try_merge_page if ret is false
    bc1d374adc82 spi: stm32: fix pm_runtime_get_sync() error checking
    e3364a81254b nvme-fabrics: allow to queue requests for live queues
    e8555b6d1dd8 seccomp: don't leak memory when filter install races
    b730cc810f71 block: restore a specific error code in bdev_del_partition
    7ded6f75c325 i2c: npcm7xx: Fix timeout calculation
    70d1f2b7ec59 btrfs: fix NULL pointer dereference after failure to create snapshot
    b6894531a925 spi: stm32: Rate-limit the 'Communication suspended' message
    0a409e1a47ff mmc: sdhci-msm: Add retries when all tuning phases are found valid
    02a5514209ae mmc: sdhci-acpi: Clear amd_sdhci_host on reset
    e341aeac14f1 ARM: dts: imx6sx: fix the pad QSPI1B_SCLK mux mode for uart3
    c01fd1453981 KVM: arm64: Update page shift if stage 2 block mapping not supported
    95de64bc498e drm/sun4i: backend: Disable alpha on the lowest plane on the A20
    272e10fbf4d0 drm/sun4i: backend: Support alpha property on lowest plane
    e856612eed7e drm/sun4i: Fix DE2 YVU handling
    412bbf8b9a22 padata: fix possible padata_works_lock deadlock
    03ad17724b7a interconnect: qcom: Fix small BW votes being truncated to zero
    fdbbeae2b076 Revert "kbuild: use -flive-patching when CONFIG_LIVEPATCH is enabled"
    61591cd38cdf soundwire: fix double free of dangling pointer
    6d1f49ae494d scsi: mpt3sas: Don't call disable_irq from IRQ poll handler
    40158298158d scsi: megaraid_sas: Don't call disable_irq from process IRQ poll
    1398cf27e62f RDMA/core: Fix reported speed and width
    c5452d1e9143 RDMA/core: Fix unsafe linked list traversal after failing to allocate CQ
    f420254168c0 drm/virtio: fix unblank
    8817b6fe0f22 scsi: libsas: Set data_dir as DMA_NONE if libata marks qc as NODATA
    34a5bbcd814c scsi: qla2xxx: Fix regression on sparc64
    cc8785cc8fd4 drm/sun4i: Fix dsi dcs long write function
    a2e7a8bff0ff arm64: dts: imx8mq: Fix TMU interrupt property
    9abd480dbf3b drm/sun4i: add missing put_device() call in sun8i_r40_tcon_tv_set_mux()
    6716ed0d4e11 RDMA/bnxt_re: Remove the qp from list only if the qp destroy succeeds
    f51174da6e51 RDMA/bnxt_re: Fix driver crash on unaligned PSN entry address
    d71b3a81c0ac RDMA/bnxt_re: Static NQ depth allocation
    1e608f9308aa RDMA/bnxt_re: Fix the qp table indexing
    6bcab9b51bab RDMA/bnxt_re: Do not report transparent vlan from QP1
    9a65a5142af4 RDMA/rxe: Fix panic when calling kmem_cache_create()
    2b993e2073a7 RDMA/rxe: Drop pointless checks in rxe_init_ports
    bc7a51ca9cef RDMA/rxe: Fix memleak in rxe_mem_init_user
    81aaf0645c81 RDMA/rtrs-srv: Replace device_register with device_initialize and device_add
    8edf8c890ee2 ARM: dts: imx7d-zii-rmu2: fix rgmii phy-mode for ksz9031 phy
    86047782e0f9 arm64: dts: imx: Add missing imx8mm-beacon-kit.dtb to build
    c29e3108c40c ARM: dts: imx7ulp: Correct gpio ranges
    23057a8452f6 ARM: dts: ls1021a: fix QuadSPI-memory reg range
    82649acf840d selftests/timers: Turn off timeout setting
    2e173929f1d4 ARM: dts: omap5: Fix DSI base address and clocks
    91dff93e5584 ARM: dts: socfpga: fix register entry for timer3 on Arria10
    1dc746dfc129 regulator: remove superfluous lock in regulator_resolve_coupling()
    8dc8bed9be37 regulator: push allocation in regulator_ena_gpio_request() out of lock
    421d06d46437 ARM: dts: logicpd-som-lv-baseboard: Fix missing video
    2a0b7124e5a1 ARM: dts: logicpd-som-lv-baseboard: Fix broken audio
    c486743abc1b ARM: dts: logicpd-torpedo-baseboard: Fix broken audio
    aab25ff4643e ARM: OMAP2+: Fix an IS_ERR() vs NULL check in _get_pwrdm()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index aa01f06d38..288ed9c550 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
+SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.9"
+LINUX_VERSION ?= "5.8.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 76b61222a8..7d56c9b439 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.9"
+LINUX_VERSION ?= "5.8.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "830cb9af40e856615b7a435a4fac57b748ba56d6"
-SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
+SRCREV_machine_qemuarm ?= "4c507a6e4005502b57ffc3ac076bee40b459ea76"
+SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index f8e72533f0..39c6dd41ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d351bf87c9c0e96a1f27f87f16d298bc4470e0b5"
-SRCREV_machine_qemuarm64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_machine_qemumips ?= "93d29a70890b19fb5482ebcab5f3a49301851daf"
-SRCREV_machine_qemuppc ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_machine_qemuriscv64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_machine_qemux86 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_machine_qemux86-64 ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_machine_qemumips64 ?= "4faa049b6b7b51c5d12d20c5e9fcf8e0a3ba8d42"
-SRCREV_machine ?= "31fafe701e2adec65d2b2a74a3e592a358915c67"
-SRCREV_meta ?= "ffbfe61a194537689c782b20da185e7e4daa9ef9"
+SRCREV_machine_qemuarm ?= "db7658ec31b561834ed533fdf3c496a3690ccb94"
+SRCREV_machine_qemuarm64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_machine_qemumips ?= "1e34c536c7d51e384e6da88c100205971c620df4"
+SRCREV_machine_qemuppc ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_machine_qemuriscv64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_machine_qemux86 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_machine_qemux86-64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_machine_qemumips64 ?= "862ad20fc118e3c0d9276b8c47f09dcde1736251"
+SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
+SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.9"
+LINUX_VERSION ?= "5.8.11"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

