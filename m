Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E94E728EA
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.27709.1696017902682974398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjN02yjl;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-452951b27d0so6937551137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017902; x=1696622702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WZlNaVF4RjQob4FzyqxPYRQ6u8jlYdgjvWSA0XBTns=;
        b=JjN02yjl99ToQOYt0XHlLbdoLWBVNWduyR7uwUCG/pxls07aPcQDYfnIXoX/o4bL9q
         ks0ANyR/OPjduasxIhO0P4yf040jq2j20ASIBD4n+EBV0INdgJNzu2jo/k7/oIf8u1Ph
         xarX/xIdNP4fmTbGIOQ/4q44/XEXu0PquGkPZPEJniRmWhVSrNsjKyLGRqxt7IdQ2+dj
         eL/rb40LI2lJHRaWLJhTxEyZ6p3ll7auMskiKYSAhuIBCdicL90y5I5v/lxRAwF2aW6L
         z6NbDeayqHgjza1gWAyvA8Ngh3F/Dh8DmaTvxF4xAPWVejjKiQdMF7jqVTF6SUKqPOAg
         +rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017902; x=1696622702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WZlNaVF4RjQob4FzyqxPYRQ6u8jlYdgjvWSA0XBTns=;
        b=sAncD7R0EDLlBfdzS+7Fzf8ddHC0bRwvd9m7Z8M3rbiGnR4AeyW1Qa7iodBp21JNHY
         l1oYnmTDFDSwpoD0TPb0sxAMFVdRh53fE4oG8C3VgG2Nc01WFQopNNyEPDLXzCpVxUOY
         enarh62yYGhtxkEcydhxiHxIRda8zokWS/NdY8AkTLCvBftMX6ok8odfhTcEgCtV4Fvs
         mPI8tJBGs2j0BWlgW+qz/X82hDTauPBUG1xVSf2imU260a2+pKHkdWr4YWRWdHbyavU5
         obIA0YiNlupVXoiCuPma9Rknff3XhdC73PmVVBbdeuIO10zXyz2boKNSBK2C6p/XhvY7
         3jgQ==
X-Gm-Message-State: AOJu0Yx2t4wgR1GzXzLHr4k+7Xa5FO/YL0tVD1v/5uAWSvhi3bTHTyaM
	5Jf57vSkMrleI2q6nuJW7b8uKKtEPMCI9A==
X-Google-Smtp-Source: AGHT+IHoq7lWKKU9BbTFXck3IUWkU5/5ydAB4SaVJzxuWWQWKHVmCfvXb9lx3aA8Y4QUMmo6H1xxow==
X-Received: by 2002:a05:6102:8f:b0:452:c783:4738 with SMTP id t15-20020a056102008f00b00452c7834738mr4883165vsp.28.1696017901302;
        Fri, 29 Sep 2023 13:05:01 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto/6.1: update to v6.1.53
Date: Fri, 29 Sep 2023 16:04:48 -0400
Message-Id: <fa2657673e1445e035dc73ab0bfea5653901e7ad.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188423

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    09045dae0d90 Linux 6.1.53
    41cb5369cb80 udf: initialize newblock to 0
    c74b1cd93f26 clk: Avoid invalid function names in CLK_OF_DECLARE()
    59e0dd5bef6c treewide: Fix probing of devices in DT overlays
    abb597c85acb clk: Mark a fwnode as initialized when using CLK_OF_DECLARE() macro
    b372816ad610 md: fix regression for null-ptr-deference in __md_stop()
    adac9f0ddd2b NFSv4.2: Rework scratch handling for READ_PLUS (again)
    779563475162 NFSv4.2: Fix a potential double free with READ_PLUS
    d9ece8c0269f md: Free resources in __md_stop
    ba6a70adb557 Revert "drm/amd/display: Do not set drr on pipe commit"
    1dd387668d5b tracing: Zero the pipe cpumask on alloc to avoid spurious -EBUSY
    e43a7ae58d00 serial: sc16is7xx: fix regression with GPIO configuration
    8aaef0a3eb1b serial: sc16is7xx: remove obsolete out_thread label
    cc8a853c2d5f perf/x86/uncore: Correct the number of CHAs on EMR
    e1eb0419126f x86/sgx: Break up long non-preemptible delays in sgx_vepc_release()
    f705617bab47 USB: core: Fix oversight in SuperSpeed initialization
    8186596a6635 USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()
    d309fa69c2e3 USB: core: Change usb_get_device_descriptor() API
    90b01f8df568 USB: core: Unite old scheme and new scheme descriptor reads
    0d3b5fe47938 usb: typec: bus: verify partner exists in typec_altmode_attention
    9b7cd3fe01f0 usb: typec: tcpm: set initial svdm version based on pd revision
    33a31064211c of: property: fw_devlink: Add a devlink for panel followers
    7f3d84cfaec7 cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
    08c86156361c crypto: stm32 - fix loop iterating through scatterlist for DMA
    73e64c5eeddf s390/dasd: fix string length handling
    f9a3d6f037c9 s390/ipl: add missing secure/has_secure file to ipl type 'unknown'
    6489ec010786 s390/dcssblk: fix kernel crash with list_add corruption
    8bf567b63c2a arm64: sdei: abort running SDEI handlers during crash
    e95d7a8a6edd pstore/ram: Check start of empty przs during init
    351705a44621 mmc: renesas_sdhi: register irqs before registering controller
    a3f6c1447db8 platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
    e6e6a5f50f58 x86/MCE: Always save CS register on AMD Zen IF Poison errors
    d08b39bb3dff fsverity: skip PKCS#7 parser when keyring is empty
    40a1ef4bb092 net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
    342d130205f1 X.509: if signature is unsupported skip validation
    3d5fed8c79d9 r8169: fix ASPM-related issues on a number of systems with NIC version from RTL8168h
    ba50e7773a99 x86/sev: Make enc_dec_hypercall() accept a size instead of npages
    f8a7f10a1dcc dccp: Fix out of bounds access in DCCP error handler
    9667854e69a7 dlm: fix plock lookup when using multiple lockspaces
    c96c67991aac bpf: Fix issue in verifying allow_ptr_leaks
    b23c96589ff7 drm/amd/display: Add smu write msg id fail retry process
    5ad3e534605e parisc: Fix /proc/cpuinfo output for lscpu
    316a4a329a4d procfs: block chmod on /proc/thread-self/comm
    5e4e9900e6fa block: don't add or resize partition on the disk with GENHD_FL_NO_PART
    1654635bed83 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
    5a3e327dc3fd ntb: Fix calculation ntb_transport_tx_free_entry()
    88c7931f81d8 ntb: Clean up tx tail index on link down
    4f4af6b8b7a2 ntb: Drop packets when qp link is down
    e95e31a8607d PCI/PM: Only read PCI_PM_CTRL register when available
    223fc5352054 PCI: hv: Fix a crash in hv_pci_restore_msi_msg() during hibernation
    4443f3695d58 PCI: Free released resource after coalescing
    316f3984298a scsi: mpt3sas: Perform additional retries if doorbell read returns 0
    6c4f87e52331 Revert "scsi: qla2xxx: Fix buffer overrun"
    ab8c52977fe0 media: venus: hfi_venus: Write to VIDC_CTRL_INIT after unmasking interrupts
    25934d8f6eb2 media: dvb: symbol fixup for dvb_attach()
    fd4d61f85e76 ALSA: hda/cirrus: Fix broken audio on hardware with two CS42L42 codecs.
    ba0b46166b8e arm64: csum: Fix OoB access in IP checksum code for negative lengths
    ad661951a98f i3c: master: svc: fix probe failure when no i3c device exist
    cc9bf2d62f19 LoongArch: mm: Add p?d_leaf() definitions
    5a8b2c1665ca xtensa: PMU: fix base address for the newer hardware
    9a9b8596c3dc drm/amd/display: register edp_backlight_control() for DCN301
    47636d32a0ee backlight/lv5207lp: Compare against struct fb_info.device
    83166d03a5b7 backlight/bd6107: Compare against struct fb_info.device
    b4ab337aad09 backlight/gpio_backlight: Compare against struct fb_info.device
    8fa9cb58445d io_uring: break iopolling on signal
    4a3e0d51c3e1 XArray: Do not return sibling entries from xa_load()
    7a7f11283392 ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()
    09cb2a71b2e9 ipmi_si: fix a memleak in try_smi_init()
    dafe7acfedfb PCI: rockchip: Use 64-bit mask on MSI 64-bit PCI address
    823f52daef12 media: i2c: Add a camera sensor top level menu
    ceedc62a3bc8 media: i2c: ccs: Check rules is non-NULL
    fea9dd8653ff cpu/hotplug: Prevent self deadlock on CPU hot-unplug
    4245ca8f4051 mm/vmalloc: add a safer version of find_vm_area() for debug
    157c46360cf3 scsi: core: Fix the scsi_set_resid() documentation
    2344b1397651 printk: ringbuffer: Fix truncating buffer size min_t cast
    3f7a4e88e40e rcu: dump vmalloc memory info safely
    8ad2e7efb2ce ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
    8918025feb2f PM / devfreq: Fix leak in devfreq_dev_release()
    d2e906c72597 igb: set max size RX buffer when store bad packet is enabled
    04c3eee4e13f skbuff: skb_segment, Call zero copy functions before using skbuff frags
    4921f9349b66 netfilter: xt_sctp: validate the flag_info count
    1c164c1e9e93 netfilter: xt_u32: validate user space input
    bcdb4a5c42b0 netfilter: nft_exthdr: Fix non-linear header modification
    7ca0706c68ad netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
    6678912b4df1 igmp: limit igmpv3_newpack() packet size to IP_MAX_MTU
    ad8900dd8a56 virtio_ring: fix avail_wrap_counter in virtqueue_add_packed
    4927edc23edc cpufreq: Fix the race condition while updating the transition_task of policy
    96db43aced39 Drivers: hv: vmbus: Don't dereference ACPI root object handle
    e351933e4a14 dmaengine: ste_dma40: Add missing IRQ check in d40_probe
    43a57ca7dd90 um: Fix hostaudio build errors
    222b85e748eb mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
    eaf4c78982ae mtd: spi-nor: Check bus width while setting QE bit
    3e313b6c470d leds: trigger: tty: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead
    f741121a2251 leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false
    a253c416e67d leds: multicolor: Use rounded division when calculating color components
    2804cc350804 leds: pwm: Fix error code in led_pwm_create_fwnode()
    cae0787e408c rpmsg: glink: Add check for kstrdup
    f309ac8a4db9 phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
    8f0f5452cb1b phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate
    0d86292e3fbb phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
    50fa01243dd5 dmaengine: idxd: Modify the dependence of attribute pasid_enabled
    6453a2fbc804 mtd: rawnand: brcmnand: Fix mtd oobsize
    74c85396bd73 tracing: Fix race issue between cpu buffer write and swap
    fb34716c9ee6 tracing: Remove extra space at the end of hwlat_detector/mode
    ca5e8427e20d x86/speculation: Mark all Skylake CPUs as vulnerable to GDS
    55a448e8d863 tick/rcu: Fix false positive "softirq work is pending" messages
    69b8d7bf834c platform/x86/amd/pmf: Fix a missing cleanup path
    2763732ec1e6 HID: multitouch: Correct devm device reference for hidinput input_dev name
    f283805d9843 HID: uclogic: Correct devm device reference for hidinput input_dev name
    6e5960954151 HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()
    cf38960386f3 RDMA/efa: Fix wrong resources deallocation order
    9d9a40530383 RDMA/siw: Correct wrong debug message
    bbd1b1b5082c RDMA/siw: Balance the reference of cep->kref in the error path
    3f39698e7e84 Revert "IB/isert: Fix incorrect release of isert connection"
    81ff633a88be amba: bus: fix refcount leak
    db18d5e3eee4 serial: tegra: handle clk prepare error in tegra_uart_hw_init()
    93e908545361 interconnect: qcom: bcm-voter: Use enable_maks for keepalive voting
    e9ef8b5099d5 interconnect: qcom: bcm-voter: Improve enable_mask handling
    1d085c6a25fa interconnect: qcom: sm8450: Enable sync_state
    5a5fb3b1754f scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock
    f06c7d823ab5 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
    f01cfec8d345 RDMA/irdma: Prevent zero-length STAG registration
    5fa1552877ce coresight: trbe: Fix TRBE potential sleep in atomic context
    848cd6f24aa7 cgroup:namespace: Remove unused cgroup_namespaces_init()
    0d545a8e77cb Revert "f2fs: fix to do sanity check on extent cache correctly"
    3f60a36ed6e3 f2fs: Only lfs mode is allowed with zoned block device feature
    33d4c00725b0 f2fs: judge whether discard_unit is section only when have CONFIG_BLK_DEV_ZONED
    4d7e804f49a0 f2fs: fix to avoid mmap vs set_compress_option case
    3a2cf76cfb8f media: i2c: rdacm21: Fix uninitialized value
    86a41ad0128a media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
    85fb0b963f2b media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
    0790c0914059 media: ov2680: Add ov2680_fill_format() helper function
    90fbf01c8080 media: ov2680: Don't take the lock for try_fmt calls
    e0b6edf4a346 media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
    6d51cdf66b9f media: ov2680: Fix vflip / hflip set functions
    7263c39fd711 media: ov2680: Fix ov2680_bayer_order()
    ef9055e9a768 media: ov2680: Remove auto-gain and auto-exposure controls
    9e6e509c08f6 media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
    2b9d0a65d133 media: ov5640: Fix initial RESETB state and annotate timings
    5074c70795d4 media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
    a4cd2c3eff18 HID: input: Support devices sending Eraser without Invert
    297992e5c635 drivers: base: Free devm resources when unregistering a device
    66eb45e7d5fc USB: gadget: f_mass_storage: Fix unused variable warning
    324da2f3ee73 USB: gadget: core: Add missing kerneldoc for vbus_work
    365ce3f86bb1 docs: ABI: fix spelling/grammar in SBEFIFO timeout interface
    c90182cffbff media: venus: hfi_venus: Only consider sys_idle_indicator on V1
    d52509fdb29c media: go7007: Remove redundant if statement
    0294e2475092 media: cec: core: add adap_unconfigured() callback
    d6610151ae22 media: cec: core: add adap_nb_transmit_canceled() callback
    6ced15ff1746 platform/x86: dell-sysman: Fix reference leak
    45e3181d7995 iommu/vt-d: Fix to flush cache of PASID directory table
    d9c47d2bf307 iommu/qcom: Disable and reset context bank before programming
    a30f26dc3ad9 fsi: aspeed: Reset master errors after CFAM reset
    d020963638f2 IB/uverbs: Fix an potential error pointer dereference
    4dca13c30b9e RDMA/hns: Fix CQ and QP cache affinity
    2368ce8cd5ad RDMA/hns: Fix inaccurate error label name in init instance
    93c986805f4e RDMA/hns: Fix incorrect post-send with direct wqe of wr-list
    c48b0b30ac92 RDMA/hns: Fix port active speed
    117a1b903baf iommu/sprd: Add missing force_aperture
    fadc62aa82d2 iommu/mediatek: Fix two IOMMU share pagetable issue
    f81325a709dd iommu/mediatek: Remove unused "mapping" member from mtk_iommu_data
    343ccde5ade7 extcon: cht_wc: add POWER_SUPPLY dependency
    d3e075a3f099 kernfs: add stub helper for kernfs_generic_poll()
    91a05d4c12ce driver core: Call dma_cleanup() on the test_remove path
    58a3b87be681 driver core: test_async: fix an error code
    636f5b8a6601 dma-buf/sync_file: Fix docs syntax
    ae867cab6bc9 interconnect: qcom: qcm2290: Enable sync state
    7e1476f27751 coresight: tmc: Explicit type conversions to prevent integer overflow
    ee8f58b40e4a RDMA/irdma: Replace one-element array with flexible-array member
    af6fd0b3bccf scsi: qedf: Do not touch __user pointer in qedf_dbg_fp_int_cmd_read() directly
    dd8ce1c9ff49 scsi: qedf: Do not touch __user pointer in qedf_dbg_debug_cmd_read() directly
    472f2497a4c8 scsi: qedf: Do not touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly
    70518f3aaf5a RDMA/rxe: Fix incomplete state save in rxe_requester
    59a4f61feccf RDMA/rxe: Split rxe_run_task() into two subroutines
    0ad56bf59dc3 x86/APM: drop the duplicate APM_MINOR_DEV macro
    6d209ed70f9c serial: sprd: Fix DMA buffer leak issue
    70f7513342f4 serial: sprd: Assign sprd_port after initialized to avoid wrong access
    21608d2ba565 iio: accel: adxl313: Fix adxl313_i2c_id[] table
    25feffb3fbd5 scsi: qla4xxx: Add length check when parsing nlattrs
    1806edae979f scsi: be2iscsi: Add length check when parsing nlattrs
    85b8c282d185 scsi: iscsi: Add strlen() check in iscsi_if_set{_host}_param()
    bb8d101b835a scsi: iscsi: Add length check for nlattr payload
    2737d82760ae scsi: iscsi: Rename iscsi_set_param() to iscsi_if_set_param()
    bdc4f8f68171 scsi: RDMA/srp: Fix residual handling
    67b02818e209 usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
    858322c409e0 media: mediatek: vcodec: fix resource leaks in vdec_msg_queue_init()
    bdc00039fd1b media: mediatek: vcodec: fix potential double free
    a356b60031d1 media: mediatek: vcodec: Return NULL if no vdec_fb is found
    b4ee61e5a110 media: amphion: ensure the bitops don't cross boundaries
    932d84a8a808 media: amphion: fix UNUSED_VALUE issue reported by coverity
    60f6392bdede media: amphion: fix UNINIT issues reported by coverity
    bddd678fd286 media: amphion: fix REVERSE_INULL issues reported by coverity
    3930d62f5d7c media: amphion: fix CHECKED_RETURN issues reported by coverity
    9ada33ee83dd media: rkvdec: increase max supported height for H.264
    715c0200b480 media: mtk-jpeg: Fix use after free bug due to uncanceled work
    62ea218a7e7f media: amphion: add helper function to get id name
    745f40a96c7f media: amphion: reinit vpu if reqbufs output 0
    6f0d0f5613d7 dt-bindings: extcon: maxim,max77843: restrict connector properties
    dd0dadb93844 scsi: hisi_sas: Fix normally completed I/O analysed as failed
    ab0719d7b6e4 scsi: hisi_sas: Fix warnings detected by sparse
    79a1a8f83869 RDMA/siw: Fabricate a GID on tun and loopback devices
    a96892a40fce media: cx24120: Add retval check for cx24120_message_send()
    2b6e20ef0585 media: dvb-usb: m920x: Fix a potential memory leak in m920x_i2c_xfer()
    323ee5fc980b media: dib7000p: Fix potential division by zero
    90e0ea8e9b26 drivers: usb: smsusb: fix error handling code in smsusb_init_device
    92e2dcf9412f iommu: rockchip: Fix directory table address encoding
    13ed255248df iommu/amd/iommu_v2: Fix pasid_state refcount dec hit 0 warning on pasid unbind
    25afb3e03bf8 media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()
    aeb79a1778cb media: i2c: tvp5150: check return value of devm_kasprintf()
    d7d47edf78c9 media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables
    79e2cc5c4c10 media: ov5640: fix low resolution image abnormal issue
    5643c936d1b8 RDMA/qedr: Remove a duplicate assignment in irdma_query_ah()
    8199a46af2ea cgroup/cpuset: Inherit parent's load balance state in v2
    590b45e5cd12 pNFS: Fix assignment of xprtdata.cred
    4030ace74d8b NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
    fdbc9637bf82 NFS: Guard against READDIR loop when entry names exceed MAXNAMELEN
    6d08bd22fa29 NFSD: da_addr_body field missing in some GETDEVICEINFO replies
    02a29a2455b0 fs: lockd: avoid possible wrong NULL parameter
    f27f759f4cd4 jfs: validate max amount of blocks before allocation.
    b648f5717581 ext4: fix unttached inode after power cut with orphan file feature enabled
    f17d5efaafba powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
    e83f5e21089b powerpc/mpc5xxx: Add missing fwnode_handle_put()
    4515f1676d8d powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=n
    ebbfe48dd15f nfs/blocklayout: Use the passed in gfp flags
    4c8568cf4c45 powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
    a5b6b008e358 powerpc: Don't include lppaca.h in paca.h
    18d51547fe2f NFSv4.2: Fix READ_PLUS size calculations
    fccdafa51de0 NFSv4.2: Fix up READ_PLUS alignment
    5c47974263e8 NFSv4.2: Fix READ_PLUS smatch warnings
    886959f425b6 NFSv4.2: Rework scratch handling for READ_PLUS
    e12e13952b0c wifi: ath10k: Use RMW accessors for changing LNKCTL
    811ec8bc68f3 wifi: ath11k: Use RMW accessors for changing LNKCTL
    7f4c9c44d1b9 net/mlx5: Use RMW accessors for changing LNKCTL
    433330fb1296 drm/radeon: Use RMW accessors for changing LNKCTL
    a0f0daf60bc1 drm/amdgpu: Use RMW accessors for changing LNKCTL
    ed6483fac428 powerpc/perf: Convert fsl_emb notifier to state machine callbacks
    1d58a9246989 powerpc/fadump: reset dump area size if fadump memory reserve fails
    ab8094db59e1 nvdimm: Fix dereference after free in register_nvdimm_pmu()
    500a6ff9c2a8 nvdimm: Fix memleak of pmu attr_groups in unregister_nvdimm_pmu()
    f6f300ecc196 vfio/type1: fix cap_migration information leak
    aae5a866d397 powerpc/radix: Move some functions into #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
    dd9241fc4b19 clk: imx: composite-8m: fix clock pauses when set_rate would be a no-op
    cc7e04d7ff92 clk: imx8mp: fix sai4 clock
    fcaf148b20f0 clk: imx: imx8ulp: update SPLL2 type
    e1139dea2c02 clk: imx: pllv4: Fix SPLL2 MULT range
    402e73f64597 clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
    6c88c9d9c630 PCI/ASPM: Use RMW accessors for changing LNKCTL
    952da7c6e199 PCI: pciehp: Use RMW accessors for changing LNKCTL
    f2d7da8fafed PCI: Add locking to RMW PCI Express Capability Register accessors
    3108f7c78884 PCI: Allow drivers to request exclusive config regions
    8a5e87f9e93c pinctrl: mcp23s08: check return value of devm_kasprintf()
    8562df72cff2 PCI: Mark NVIDIA T4 GPUs to avoid bus reset
    f3229c9cb634 PCI: microchip: Correct the DED and SEC interrupt bit offsets
    9daefd22756e clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
    a1801d14a891 clk: qcom: reset: Use the correct type of sleep/delay based on length
    a4ff4b54f388 kvm/vfio: ensure kvg instance stays around in kvm_vfio_group_add()
    fef33ca5e28c kvm/vfio: Prepare for accepting vfio device fd
    cc16a50d5088 clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
    e0f5698757ab ext4: avoid potential data overflow in next_linear_group
    772ca4bc1d0d ext4: correct grp validation in ext4_mb_good_group
    d5fc7d681320 EDAC/igen6: Fix the issue of no error events
    8f43c4000cdf clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
    d1a5f22abab4 clk: sunxi-ng: Modify mismatched function name
    d96799ee3b78 PCI/DOE: Fix destroy_work_on_stack() race
    4a43285900cd drivers: clk: keystone: Fix parameter judgment in _of_pll_clk_init()
    d96da888dcd7 PCI: qcom-ep: Switch MHI bus master clock off during L1SS
    c53d53006d7f PCI: apple: Initialize pcie->nvecs before use
    7618133eda26 clk: rockchip: rk3568: Fix PLL rate setting for 78.75MHz
    eb613f81d034 clk: qcom: gcc-sc8280xp: Add missing GDSCs
    57fc62c50690 dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
    06d3a7e03c61 clk: qcom: gcc-sc8280xp: Add missing GDSC flags
    747848b4afea clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
    9cba16beca66 clk: qcom: gpucc-sm6350: Fix clock source names
    6ace98cb617b clk: qcom: gpucc-sm6350: Introduce index-based clk lookup
    74a1194cce60 ipmi:ssif: Fix a memory leak when scanning for an adapter
    2e7d90a81b9c ipmi:ssif: Add check for kstrdup
    abbd28d04c36 ALSA: ac97: Fix possible error value of *rac97
    53996463f8c3 of: unittest: Fix overlay type in apply/revert check
    3fb210cd521c of: overlay: Call of_changeset_init() early
    b13b0c84a4af ASoC: SOF: amd: clear dsp to host interrupt status
    c4b06324fc44 md: raid0: account for split bio in iostat accounting
    cc54fa43de67 md/raid0: Fix performance regression for large sequential writes
    cd1dd83888d7 md/raid0: Factor out helper for mapping and submitting a bio
    c227aa141660 md: add error_handlers for raid0 and linear
    bc82cd1e7ff2 firmware: cs_dsp: Fix new control name check
    711fb9260620 md/raid5-cache: fix null-ptr-deref for r5l_flush_stripe_to_raid()
    ac9e103f282a md/raid5-cache: fix a deadlock in r5l_exit_log()
    26bf790b8e99 bus: ti-sysc: Fix cast to enum warning
    5abfee5e4076 arm64: dts: qcom: sc8280xp-x13s: Unreserve NC pins
    b386c3e16956 arm64: dts: qcom: msm8996: Fix dsi1 interrupts
    c6035ee015b9 arm64: dts: qcom: msm8998: Add missing power domain to MMSS SMMU
    cab4cdb2a4bd arm64: dts: qcom: msm8998: Drop bus clock reference from MMSS SMMU
    67b4726cb87e arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
    867aa88c9efa drm/mediatek: Fix potential memory leak if vmap() fail
    1e47d1ac20e3 ARM: dts: qcom: ipq4019: correct SDHCI XO clock
    4d6a25792fc1 drm/mediatek: Remove freeing not dynamic allocated memory
    635051576f0e bus: ti-sysc: Fix build warning for 64-bit build
    b625a6eaf2bf drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabilities
    0c323430e470 io_uring: fix drain stalls by invalid SQE
    9183c4fe9141 block/mq-deadline: use correct way to throttling write requests
    9ca08adb75fb audit: fix possible soft lockup in __audit_inode_child()
    607eda339b60 drm/msm/a2xx: Call adreno_gpu_init() earlier
    f27dff881f0b drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_create()
    d41ceafe3d24 smackfs: Prevent underflow in smk_set_cipso()
    d1994bb5947c drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
    bd3a6b6d5dd8 firmware: meson_sm: fix to avoid potential NULL pointer dereference
    2965015006ef drm/msm/mdp5: Don't leak some plane state
    0cd481c27b03 soc: qcom: smem: Fix incompatible types in comparison
    3b1f1999a300 drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask
    9b372d2fdc44 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
    92eaa1840301 drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
    4174f889c4c1 drm/repaper: Reduce temporary buffer size in repaper_fb_dirty()
    d544c89bb1cd drm/armada: Fix off-by-one error in armada_overlay_get_property()
    0ef736fec614 ARM: dts: BCM53573: Fix Tenda AC9 switch CPU port
    976eca4cbd37 arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
    43cc228099c5 of: unittest: fix null pointer dereferencing in of_unittest_find_node_by_name()
    4ab834ff9fbf drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
    508383dc278c drm/msm: Update dev core dump to not print backwards
    f9b9c6b0d451 md/md-bitmap: hold 'reconfig_mutex' in backlog_store()
    e970bc3828b7 md/md-bitmap: remove unnecessary local variable in backlog_store()
    3829cb3caeda md/raid10: use dereference_rdev_and_rrdev() to get devices
    27acd8c13183 md/raid10: factor out dereference_rdev_and_rrdev()
    097f30f0cef8 md: restore 'noio_flag' for the last mddev_resume()
    835cbfebc1c5 md: Change active_io to percpu
    3db392257008 md: Factor out is_md_suspended helper
    8dcc23191a6d drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
    13f5c43e0921 arm64: dts: qcom: msm8996-gemini: fix touchscreen VIO supply
    5ccd294df265 arm64: dts: qcom: sdm845: Fix the min frequency of "ice_core_clk"
    4aaced381c69 arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
    a80621bb23dc ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
    b9fa4e10b5cf drm: adv7511: Fix low refresh rate register for ADV7533/5
    1a7314734743 ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
    9a91a5466ab1 ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
    4e184a73203c ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
    075ee661ba67 drm/bridge: anx7625: Use common macros for HDCP capabilities
    ba1ca2cf4d00 drm/bridge: anx7625: Use common macros for DP power sequencing commands
    d309b170ea70 x86/mm: Fix PAT bit missing from page protection modify mask
    00c0b2825bb5 block: don't allow enabling a cache on devices that don't support it
    e5e0ec8ff160 block: cleanup queue_wc_store
    7db90dd1c5a4 drm/etnaviv: fix dumping of active MMU context
    800bf8a2226e arm64: tegra: Fix HSUART for Smaug
    ee5e1d6480ef arm64: dts: qcom: pmi8994: Add missing OVP interrupt
    31fe89ccf5a0 arm64: dts: qcom: pm660l: Add missing short interrupt
    cd1ba241d21e arm64: dts: qcom: pm6150l: Add missing short interrupt
    6fd913f0f63f arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup again
    0f0e6963705a arm64: tegra: Fix HSUART for Jetson AGX Orin
    f5ff6897094f ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
    ab5154ae26c4 ARM: dts: BCM53573: Add cells sizes to PCIe node
    ee1d740374aa ARM: dts: BCM53573: Drop nonexistent #usb-cells
    fd28ce30b525 drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
    1f3b03863ef5 firmware: ti_sci: Use system_state to determine polling
    0765a80c160d ARM: dts: stm32: Add missing detach mailbox for DHCOM SoM
    e3c7b7ce7cd6 ARM: dts: stm32: Update to generic ADC channel binding on DHSOM systems
    9d77a7fc5d04 ARM: dts: stm32: Add missing detach mailbox for Odyssey SoM
    c0929f2bbd68 ARM: dts: stm32: YAML validation fails for Odyssey Boards
    aa72079a1952 ARM: dts: stm32: Add missing detach mailbox for emtrion emSBC-Argon
    0746cab4768d ARM: dts: stm32: adopt generic iio bindings for adc channels on emstamp-argon
    a5274a79ef3a ARM: dts: stm32: YAML validation fails for Argon Boards
    e62c091b6dfa ARM: dts: stm32: Rename mdio0 to mdio
    e8d6e54daf1a arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA coherent
    c755b194d793 arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
    5aa1969ce7c4 arm64: dts: qcom: pmr735b: fix thermal zone name
    de4688dcc0f6 arm64: dts: qcom: pm8350b: fix thermal zone name
    0f52060fa1db arm64: dts: qcom: pm8350: fix thermal zone name
    8fd3533f4bce arm64: dts: qcom: sm8350: Use proper CPU compatibles
    db336dcb0127 arm64: dts: qcom: sm8350: Add missing LMH interrupts to cpufreq
    0c32fba73549 arm64: dts: qcom: sm8350: Fix CPU idle state residency times
    c97633eaf571 arm64: dts: qcom: sdm845-tama: Set serial indices and stdout-path
    8622340505dc arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
    82c3d3490b6b arm64: dts: qcom: sc8280xp: Add missing SCM interconnect
    e5bf98ceac1e arm64: dts: qcom: sc8280xp-crd: Correct vreg_misc_3p3 GPIO
    4c7477d0daaa arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
    7852d207882c arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
    4a36d16cdf3c arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
    537346ff2a60 arm64: dts: qcom: msm8916-l8150: correct light sensor VDDIO supply
    d244c92988ab arm64: dts: qcom: sm8250: correct dynamic power coefficients
    e2040c110138 arm64: dts: qcom: sm6350: Fix ZAP region
    ba7ff6085b80 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
    fb4a774a6627 soc: qcom: ocmem: Add OCMEM hardware version print
    7bdeb7679f4c ASoC: stac9766: fix build errors with REGMAP_AC97
    c2c6dfc04237 drm/hyperv: Fix a compilation issue because of not including screen_info.h
    a9fa161b8356 drm/amd/display: Do not set drr on pipe commit
    3027e200dd58 quota: fix dqput() to follow the guarantees dquot_srcu should provide
    d57af071cf40 quota: add new helper dquot_active()
    fdcc50d506f3 quota: rename dquot_active() to inode_quota_active()
    622789ebe197 quota: factor out dquot_write_dquot()
    25193037e083 ASoC: cs43130: Fix numerator/denominator mixup
    aa449fa41e10 drm/bridge: tc358764: Fix debug print parameter order
    45107f9ca863 netrom: Deny concurrent connect().
    a1e820fc7808 net/sched: sch_hfsc: Ensure inner classes have fsc curve
    85da5ec0681e sfc: Check firmware supports Ethernet PTP filter
    ea701e0eba7e cteonxt2-pf: Fix backpressure config for multiple PFC priorities to work simultaneously
    1b7f266e0219 octeontx2-pf: Fix PFC TX scheduler free
    80de42d9af97 octeontx2-pf: Refactor schedular queue alloc/free calls
    23a7b872898b hwmon: (tmp513) Fix the channel number in tmp51x_is_visible()
    8b2fb4b671b3 mlxsw: core_hwmon: Adjust module label names based on MTCAP sensor counter
    6406a95c4a5e mlxsw: i2c: Limit single transaction buffer size
    2fc240094031 mlxsw: i2c: Fix chunk size setting in output mailbox buffer
    ec9538da6ce4 net: arcnet: Do not call kfree_skb() under local_irq_disable()
    cb09afe905cb ice: avoid executing commands on other ports when driving sync
    90e7778660c9 wifi: ath9k: use IS_ERR() with debugfs_create_dir()
    4a8fadcf3748 arm64: mm: use ptep_clear() instead of pte_clear() in clear_flush()
    a33ae132eec2 Bluetooth: btusb: Do not call kfree_skb() under spin_lock_irqsave()
    7e7197e4d6a1 wifi: mwifiex: avoid possible NULL skb pointer dereference
    7930fa4ca871 mac80211: make ieee80211_tx_info padding explicit
    4381d6083254 wifi: nl80211/cfg80211: add forgotten nla_policy for BSS color attribute
    4c340bfddce6 wifi: ath9k: protect WMI command response buffer replacement with a lock
    8ba31f946a6d wifi: ath9k: fix races between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx
    7984c381bbc1 samples/bpf: fix broken map lookup probe
    c813db76bc15 samples/bpf: fix bio latency check with tracepoint
    ef67f3a959a7 ARM: dts: Add .dts files missing from the build
    cde525d61178 wifi: mwifiex: Fix missed return in oob checks failed path
    84081b4baafb wifi: mwifiex: fix memory leak in mwifiex_histogram_read()
    9257a1d6f272 net: annotate data-races around sk->sk_lingertime
    844d60cc5efc fs: ocfs2: namei: check return value of ocfs2_add_entry()
    a485a4bd8238 lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
    065d5f17096e lwt: Fix return values of BPF xmit ops
    0159a21b9d8e hwrng: iproc-rng200 - Implement suspend and resume calls
    92651ce45ba1 crypto: caam - fix unchecked return value error
    841d2fffd09f ice: ice_aq_check_events: fix off-by-one check when filling buffer
    0f50641222f5 net-memcg: Fix scope of sockmem pressure indicators
    8d61adfb5918 selftests/bpf: Clean up fmod_ret in bench_rename test script
    eafa3465c8d9 selftests/bpf: Fix repeat option when kfunc_call verification fails
    d6702008fc9c net: tcp: fix unexcepted socket die when snd_wnd is 0
    81d8e9f59df6 Bluetooth: hci_sync: Avoid use-after-free in dbg for hci_add_adv_monitor()
    bd39b5524047 Bluetooth: hci_sync: Don't double print name in add/remove adv_monitor
    94617b736c25 Bluetooth: Fix potential use-after-free when clear keys
    9246d9310cd6 Bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    c4cb61c5f976 crypto: api - Use work queue in crypto_destroy_instance
    501f77cfce8a crypto: stm32 - Properly handle pm_runtime_get failing
    6fc09c8d765e kbuild: rust_is_available: fix confusion when a version appears in the path
    4f8c55ae5d58 kbuild: rust_is_available: add check for `bindgen` invocation
    bb15fb4e497e kbuild: rust_is_available: fix version check when CC has multiple arguments
    6c7182b9c87e kbuild: rust_is_available: remove -v option
    90978b2ff422 selftests/bpf: fix static assert compilation issue for test_cls_*.c
    c015029dfc89 wifi: mwifiex: fix error recovery in PCIE buffer descriptor management
    3975e21d4d01 wifi: mwifiex: Fix OOB and integer underflow when rx packets
    49b6db89ab28 wifi: mt76: mt7915: fix power-limits while chan_switch
    2dd5c7f4200a can: gs_usb: gs_usb_receive_bulk_callback(): count RX overflow errors also in case of OOM
    ce60bfc24c88 spi: tegra20-sflash: fix to check return value of platform_get_irq() in tegra_sflash_probe()
    f5f7aa2b6b8f wifi: mt76: testmode: add nla_policy for MT76_TM_ATTR_TX_LENGTH
    c0ce0fb76610 bpf: reject unhashed sockets in bpf_sk_assign
    99331d7c6ee2 udp: re-score reuseport groups when connected sockets are present
    328b85e7b14f wifi: mt76: mt7921: fix non-PSC channel scan fail
    6bf4ccafb356 wifi: rtw89: debug: Fix error handling in rtw89_debug_priv_btc_manual_set()
    39a6b4bbc573 regmap: rbtree: Use alloc_flags for memory allocations
    684431894e06 hwrng: pic32 - use devm_clk_get_enabled
    79a8ea5bf421 hwrng: nomadik - keep clock enabled while hwrng is registered
    73d97508ab11 tcp: tcp_enter_quickack_mode() should be static
    01964c630824 crypto: qat - change value of default idle filter
    912310dd841b bpf: Fix an error in verifying a field in a union
    780f072f4fad bpf: Clear the probe_addr for uprobe
    0cfbadb15351 libbpf: Fix realloc API handling in zero-sized edge cases
    fc7ed36a31b1 bpftool: Use a local bpf_perf_event_value to fix accessing its fields
    0b20dc1edd88 bpftool: Use a local copy of BPF_LINK_TYPE_PERF_EVENT in pid_iter.bpf.c
    840c64d96e39 bpftool: Define a local bpf_perf_link to fix accessing its fields
    4d5f00b2fa2c bpftool: use a local copy of perf_event to fix accessing :: Bpf_cookie
    010c6a02e6e1 selftests/bpf: Fix bpf_nf failure upon test rerun
    6f2b84248bab cpufreq: powernow-k8: Use related_cpus instead of cpus in driver.exit()
    91f76271ec43 x86/efistub: Fix PCI ROM preservation in mixed mode
    fcf78a17bbb9 cpufreq: amd-pstate-ut: Fix kernel panic when loading the driver
    14920fb907f0 cpufreq: amd-pstate-ut: Remove module parameter access
    7da6250d2967 thermal/of: Fix potential uninitialized value access
    7c7093256806 ACPI: x86: s2idle: Fix a logic error parsing AMD constraints table
    a99f32b81ca1 ACPI: x86: s2idle: Post-increment variables when getting constraints
    8ee6d04ef24b irqchip/loongson-eiointc: Fix return value checking of eiointc_index
    14e37e08b4e1 s390/paes: fix PKEY_TYPE_EP11_AES handling for secure keyblobs
    f326e37a210e s390/pkey: fix PKEY_TYPE_EP11_AES handling for sysfs attributes
    f98ea9abc1f7 s390/pkey: fix PKEY_TYPE_EP11_AES handling in PKEY_GENSECK2 IOCTL
    87d452a076d1 s390/pkey: fix/harmonize internal keyblob headers
    7d31730c5d81 selftests/futex: Order calls to futex_lock_pi
    048d1a8b9da8 perf/imx_ddr: don't enable counter0 if none of 4 counters are used
    5fce29ab20cb sched/rt: Fix sysctl_sched_rr_timeslice intial value
    dfadde169774 arm64/fpsimd: Only provide the length to cpufeature for xCR registers
    8efd0420290e arm64/sme: Don't use streaming mode to probe the maximum SME VL
    1d9a735d4e45 x86/decompressor: Don't rely on upper 32 bits of GPRs being preserved
    be361e5ec4b2 sched/psi: Select KERNFS as needed
    287aeeb731e9 arm64/ptrace: Clean up error handling path in sve_set_common()
    9d8f66d6de83 selftests/resctrl: Close perf value read fd on errors
    f046a88cbadd selftests/resctrl: Unmount resctrl FS if child fails to run benchmark
    d4b1f43944c5 selftests/resctrl: Don't leak buffer in fill_cache()
    1051a1c5dd26 selftests/resctrl: Add resctrl.h into build deps
    5d343b49078d OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
    e0322a255a22 refscale: Fix uninitalized use of wait_queue_head_t
    085fe4323841 ARM: ptrace: Restore syscall skipping for tracers
    916ca8192201 ARM: ptrace: Restore syscall restart tracing
    ed134f284b4e vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
    1cdf51b4e5ef selftests/harness: Actually report SKIP for signal tests
    c13e6edbad1a tmpfs: verify {g,u}id mount options correctly
    254c396da3a2 iomap: Remove large folio handling in iomap_invalidate_folio()
    b553ac4894e7 fs: Fix error checking for d_hash_and_lookup()
    e12214c7ad13 eventfd: prevent underflow for eventfd semaphores
    9720f894286e reiserfs: Check the return value from __getblk()
    0c7e6ff75e6c tools/resolve_btfids: Fix setting HOSTCFLAGS
    1ad863e91af8 tools/resolve_btfids: Pass HOSTCFLAGS as EXTRA_CFLAGS to prepare targets
    a2a9f5bcccab tools/resolve_btfids: Tidy HOST_OVERRIDES
    b3f1d78c672e tools/resolve_btfids: Compile resolve_btfids as host program
    833a654b510b tools/resolve_btfids: Alter how HOSTCC is forced
    2457021a4f07 tools/resolve_btfids: Install subcmd headers
    d35187340a8a tools/resolve_btfids: Use pkg-config to locate libelf
    05026e944bd2 tools lib subcmd: Add dependency test to install_headers
    424fd5693246 tools lib subcmd: Make install_headers clearer
    a07388d1a773 tools lib subcmd: Add install target
    b9c54fd37668 Revert "net: macsec: preserve ingress frame ordering"
    786e09ae59f0 Revert "PCI: tegra194: Enable support for 256 Byte payload"
    f725ae7f0e2b Input: i8042 - add quirk for TUXEDO Gemini 17 Gen1/Clevo PD70PN
    b990ac56447c udf: Handle error when adding extent to a file
    6ac8f2c8362a udf: Check consistency of Space Bitmap Descriptor
    7ac1467f9472 drm/amd/display: ensure async flips are only accepted for fast updates
    8f965b5b525d net: Avoid address overwrite in kernel_connect
    8c737d950c2b KVM: x86/mmu: Add "never" option to allow sticky disabling of nx_huge_pages
    45e3dfbf0e0c KVM: x86/mmu: Use kstrtobool() instead of strtobool()
    181831df9de8 tpm: Enable hwrng only for Pluton on AMD CPUs
    9c8dab18f830 crypto: rsa-pkcs1pad - Use helper to set reqsize
    63f1117db590 cpufreq: intel_pstate: set stale CPU frequency to minimum
    c50fdd533448 of: property: Simplify of_link_to_phandle()
    8f647ac91a22 platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    10f358cd4b0e tracing: Introduce pipe_cpumask to avoid race on trace_pipes
    41103f7f688a net: sfp: handle 100G/25G active optical cables in sfp_parse_support
    f24681b8162b ALSA: seq: oss: Fix racy open/close of MIDI devices
    ab5c5c10d066 LoongArch: Fix the write_fcsr() macro
    9920a52362a0 LoongArch: Let pmd_present() return true when splitting pmd
    790587097c01 scsi: lpfc: Fix incorrect big endian type assignment in bsg loopback path
    1a7f80f33a59 scsi: storvsc: Always set no_report_opcodes
    7d1ac3c2eb70 scsi: aacraid: Reply queue mapping to CPUs based on IRQ affinity
    dcfd75bca8cf sctp: handle invalid error codes without calling BUG()
    fbd3ae6997fb cifs: fix max_credits implementation
    8a424afa08c5 cifs: fix sockaddr comparison in iface_cmp
    ea13eff14ef2 bnx2x: fix page fault following EEH recovery
    179b9b062fe8 netlabel: fix shift wrapping bug in netlbl_catmap_setlong()
    78ef22febd68 wifi: mac80211: Use active_links instead of valid_links in Tx
    41b446e4904a wifi: cfg80211: remove links only on AP
    5251c835324b drm/amdgpu: Match against exact bootloader status
    f20bee49dc2a net: hns3: restore user pause configure when disable autoneg
    c61d10461279 scsi: qedi: Fix potential deadlock on &qedi_percpu->p_work_lock
    24d9cc933597 scsi: lpfc: Remove reftag check in DIF paths
    c70b9758eebe platform/x86/amd/pmf: Fix unsigned comparison with less than zero
    acf4ec3b4244 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM
    59c4b9a2caf4 powerpc/powermac: Use early_* IO variants in via_calibrate_decr()
    54d3fba7d8c5 wifi: brcmfmac: Fix field-spanning write in brcmf_scan_params_v2_to_v1()
    71f5a7f1745c net: usb: qmi_wwan: add Quectel EM05GV2
    a2b5a9654a1d net: annotate data-races around sk->sk_{rcv|snd}timeo
    94515e9aa84c net: dsa: microchip: KSZ9477 register regmap alignment to 32 bit boundaries
    848477e08391 Revert "wifi: ath6k: silence false positive -Wno-dangling-pointer warning on GCC 12"
    51edd7383b1e vmbus_testing: fix wrong python syntax for integer value comparison
    98f933716a52 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM
    473a55cfc131 kprobes: Prohibit probing on CFI preamble symbol
    896e9e57784c security: keys: perform capable check only on privileged operations
    0ffed24af577 staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
    55954eea708f ALSA: usb-audio: Update for native DSD support quirks
    d676d02be8e2 ata: pata_arasan_cf: Use dev_err_probe() instead dev_err() in data_xfer()
    fbf4048d8fba ovl: Always reevaluate the file signature for IMA
    ae1cb9656ef4 drm/amd/display: Exit idle optimizations before attempt to access PHY
    faa77cf5f28f drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family
    d7b1aa3e2098 drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX Curr Clock
    7c2d13fb9bab platform/x86: huawei-wmi: Silence ambient light sensor
    5c5628287bac platform/x86: asus-wmi: Fix setting RGB mode on some TUF laptops
    aeee50c15291 platform/x86: think-lmi: Use kfree_sensitive instead of kfree
    dea41980d793 platform/x86/intel/hid: Add HP Dragonfly G2 to VGBS DMI quirks
    7d0f7924ef61 platform/x86: intel: hid: Always call BTNL ACPI method
    eb54ad1ed620 ALSA: usb-audio: Add quirk for Microsoft Modern Wireless Headset
    9c1263320163 ASoC: atmel: Fix the 8K sample parameter in I2SC master
    2e780a9f4ac1 ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0
    a1fbf45a24d3 ASoC: rt711: fix for JD event handling in ClockStop Mode0
    82e17577b66f ASoc: codecs: ES8316: Fix DMIC config
    10999df817cb ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
    952af5cfd5b4 fs/nls: make load_nls() take a const parameter
    d28f76be7952 s390/dasd: fix hanging device after request requeue
    d563f679a268 s390/dasd: use correct number of retries for ERP requests
    a41f2f6aff5e m68k: Fix invalid .section syntax
    328fcde050ff ethernet: atheros: fix return value check in atl1c_tso_csum()
    0f7b43a5776b ASoC: nau8821: Add DMI quirk mechanism for active-high jack-detect
    eb746c4750a8 ASoC: da7219: Check for failure reading AAD IRQ events
    3c59ad8d6e8e ASoC: da7219: Flush pending AAD IRQ when suspending
    330d900620df ksmbd: fix out of bounds in init_smb2_rsp_hdr()
    99a2426b135e ksmbd: no response from compound read
    becb5191d1d5 ksmbd: validate session id and tree id in compound request
    9776024ee06b ksmbd: fix out of bounds in smb3_decrypt_req()
    513eac8b8530 9p: virtio: make sure 'offs' is initialized in zc_request
    05d88512e833 9p: virtio: fix unlikely null pointer deref in handle_rerror
    72c90ebb2dc5 media: pci: cx23885: fix error handling for cx23885 ATSC boards
    eb3c2b3519bf media: pulse8-cec: handle possible ping error
    0b6e7170ccdf media: amphion: use dev_err_probe
    026e918b3670 phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
    2981ff271d52 Revert "MIPS: unhide PATA_PLATFORM"
    b60802573357 media: uapi: HEVC: Add num_delta_pocs_of_ref_rps_idx field
    36148a9b144c powerpc/boot: Disable power10 features after BOOTAFLAGS assignment
    4e005f5dd5b0 ALSA: hda/realtek: Enable 4 amplifiers instead of 2 on a HP platform
    f4bd9a43152e ARM: dts: imx: Set default tuning step for imx7d usdhc
    7f483ce4699a Revert "Revert drm/amd/display: Enable Freesync Video Mode by default"
    6ab081571f6a scsi: ufs: Try harder to change the power mode
    9fc3adc6d0fe Partially revert "drm/amd/display: Fix possible underflow for displays with large vblank"
    918639847212 Revert "bridge: Add extack warning when enabling STP in netns."

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.1.inc               | 38 +++++++++++++++----
 .../linux/linux-yocto-rt_6.1.bb               |  6 +--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 +--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++-------
 4 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 52523c6709..94a312b311 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-08 09:54:36.039631 for version 6.1.52
+# Generated at 2023-09-15 17:26:47.557521+00:00 for version 6.1.53
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.52"
+    this_version = "6.1.53"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4518,9 +4518,9 @@ CVE_STATUS[CVE-2022-4382] = "cpe-stable-backport: Backported in 6.1.8"
 
 CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
 
-# CVE-2022-44032 has no known resolution
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44033 has no known resolution
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-44034 has no known resolution
 
@@ -4532,13 +4532,13 @@ CVE_STATUS[CVE-2022-45869] = "fixed-version: Fixed from version 6.1rc7"
 
 # CVE-2022-45885 has no known resolution
 
-# CVE-2022-45886 has no known resolution
+CVE_STATUS[CVE-2022-45886] = "cpe-stable-backport: Backported in 6.1.33"
 
-# CVE-2022-45887 has no known resolution
+CVE_STATUS[CVE-2022-45887] = "cpe-stable-backport: Backported in 6.1.33"
 
 # CVE-2022-45888 needs backporting (fixed from 6.2rc1)
 
-# CVE-2022-45919 has no known resolution
+CVE_STATUS[CVE-2022-45919] = "cpe-stable-backport: Backported in 6.1.33"
 
 CVE_STATUS[CVE-2022-45934] = "fixed-version: Fixed from version 6.1"
 
@@ -4786,7 +4786,7 @@ CVE_STATUS[CVE-2023-23559] = "cpe-stable-backport: Backported in 6.1.9"
 
 CVE_STATUS[CVE-2023-23586] = "fixed-version: Fixed from version 5.12rc1"
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+CVE_STATUS[CVE-2023-2430] = "cpe-stable-backport: Backported in 6.1.50"
 
 CVE_STATUS[CVE-2023-2483] = "cpe-stable-backport: Backported in 6.1.22"
 
@@ -4794,6 +4794,8 @@ CVE_STATUS[CVE-2023-25012] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
 
+# CVE-2023-25775 has no known resolution
+
 CVE_STATUS[CVE-2023-2598] = "fixed-version: only affects 6.3rc1 onwards"
 
 # CVE-2023-26242 has no known resolution
@@ -4972,6 +4974,8 @@ CVE_STATUS[CVE-2023-3773] = "cpe-stable-backport: Backported in 6.1.47"
 
 CVE_STATUS[CVE-2023-3776] = "cpe-stable-backport: Backported in 6.1.40"
 
+CVE_STATUS[CVE-2023-3777] = "cpe-stable-backport: Backported in 6.1.42"
+
 CVE_STATUS[CVE-2023-3812] = "fixed-version: Fixed from version 6.1rc4"
 
 CVE_STATUS[CVE-2023-38409] = "cpe-stable-backport: Backported in 6.1.25"
@@ -4996,6 +5000,8 @@ CVE_STATUS[CVE-2023-4004] = "cpe-stable-backport: Backported in 6.1.42"
 
 # CVE-2023-4010 has no known resolution
 
+CVE_STATUS[CVE-2023-4015] = "cpe-stable-backport: Backported in 6.1.43"
+
 CVE_STATUS[CVE-2023-40283] = "cpe-stable-backport: Backported in 6.1.45"
 
 CVE_STATUS[CVE-2023-4128] = "cpe-stable-backport: Backported in 6.1.45"
@@ -5012,6 +5018,12 @@ CVE_STATUS[CVE-2023-4155] = "cpe-stable-backport: Backported in 6.1.46"
 
 CVE_STATUS[CVE-2023-4194] = "fixed-version: only affects 6.3rc1 onwards"
 
+CVE_STATUS[CVE-2023-4206] = "cpe-stable-backport: Backported in 6.1.45"
+
+CVE_STATUS[CVE-2023-4207] = "cpe-stable-backport: Backported in 6.1.45"
+
+CVE_STATUS[CVE-2023-4208] = "cpe-stable-backport: Backported in 6.1.45"
+
 CVE_STATUS[CVE-2023-4273] = "cpe-stable-backport: Backported in 6.1.45"
 
 CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
@@ -5024,3 +5036,13 @@ CVE_STATUS[CVE-2023-4394] = "fixed-version: Fixed from version 6.0rc3"
 
 CVE_STATUS[CVE-2023-4459] = "fixed-version: Fixed from version 5.18"
 
+# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+
+CVE_STATUS[CVE-2023-4569] = "cpe-stable-backport: Backported in 6.1.47"
+
+CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# CVE-2023-4623 has no known resolution
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 05e0b69331..4168a936bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7327e7ab3b5508182380405a51f2657f5bf669b4"
-SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
+SRCREV_machine ?= "af2faa46d440ee11170ba8233eec0f818988f256"
+SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.52"
+LINUX_VERSION ?= "6.1.53"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 942aa48c02..80a3f06eee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.52"
+LINUX_VERSION ?= "6.1.53"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
+SRCREV_machine ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 000317379f..61f3e532fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3028542fe5ece9dd32c8e3b9b14b2c9f4c9cafac"
-SRCREV_machine:qemuarm64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemuloongarch64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemumips ?= "33c0b5a0c1af6abb4dee11ffa5ece66ffd01d3c8"
-SRCREV_machine:qemuppc ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemuriscv64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemuriscv32 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemux86 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemux86-64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_machine:qemumips64 ?= "ee418f38dbc9794b7976ad11fd74f5a3490c7c5e"
-SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
-SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
+SRCREV_machine:qemuarm ?= "b11af7d1c8b4337347747977173c878e7672eb15"
+SRCREV_machine:qemuarm64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemuloongarch64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemumips ?= "81af09853cc4318fad59e780c830c9cc8ccdc898"
+SRCREV_machine:qemuppc ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemuriscv64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemuriscv32 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemux86 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemux86-64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_machine:qemumips64 ?= "6ec5ef2f6fa90a5823e131805845738453bc553a"
+SRCREV_machine ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
+SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "59b13c2b647e464dd85622c89d7f16c15d681e96"
+SRCREV_machine:class-devupstream ?= "09045dae0d902f9f78901a26c7ff1714976a38f9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.52"
+LINUX_VERSION ?= "6.1.53"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


