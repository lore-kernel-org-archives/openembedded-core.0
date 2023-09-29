Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89023E728EB
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.27706.1696017901762943310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U9bAwJjU;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1bba7717d3bso7411789fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017901; x=1696622701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyyqEQ5kjV2gu/Q88R1kaQxXZTujB8tOC/0vecyegdk=;
        b=U9bAwJjUMdPnp6aMrdeiUg6Prca6Fp4HKNfHTbp647+GPtHsaO57bCMCg23OWPkrJd
         EWZiU12qZtBj3Et1XTheuE6UclHThvU4BZ6dGdd9kIvGaHsAqZXSbVzz8gGzjO8XXyZC
         rEkFajnYtVX/tMY31V/4KF23hdc9UY8lkZbGU452HmH1PfdAgZop8YpOyJmyfL2zcEsJ
         v1tx9w2xGjzRoeDXxVXpBVno9gPB46aYf6uDF7hovH5uexnd/uG200eBU6hIVuUfW8Ib
         a8zsT68G9Ndd8uiMxsXw945TyCgHV/dXwCeFSbnN+BGVSEx+P0OTtOoKBrojHkijU8YT
         9kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017901; x=1696622701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyyqEQ5kjV2gu/Q88R1kaQxXZTujB8tOC/0vecyegdk=;
        b=mJ4rSUAsknRDN50L0msIK11gljnfoIU/mA8rq/w+vO8sCokpDkb2r5lT6oIo2fB/Po
         vnTqRNn7Dq6ulHy1+gzYfRdBpDrz6k65343X25Qr5yqlzwbdKlw8Gehh1/99tfXb5/ZN
         ioRrfAnDM3UU7zcqgWkGl0zen6q86H0wArbSR/sSWzX40SZHWqcTSN7n4zRC1N/DEEMe
         vD40qptFILYBHpINtiJ/4vqHoa3OffHOFqJy2sktAYCpRz4oc5aCAUdlTblbMEtn+JRE
         tbpGM2pKFZ+sxwKFDOO8C26jpGd4ZvIJzVSE+oV8UnPB3fRzwB8Zx4f8N7bu6KM+Xlw3
         eyiw==
X-Gm-Message-State: AOJu0YwUp4cmjTNf24uJZ2O9Cc920qvdG0umfOapjGkmr46YXmxA9BUg
	w2tpPkYE4IJxH065oJ77sk+ZK0MWKxPghw==
X-Google-Smtp-Source: AGHT+IGR7XHaUjwFTMZZ2U3v34SLNtmXhH8ausscQj4i0xMP7GhidCY/ITCRbCtkMHojWmhJWKBdBg==
X-Received: by 2002:a05:6870:2186:b0:1e1:aae:7867 with SMTP id l6-20020a056870218600b001e10aae7867mr6227464oae.54.1696017900327;
        Fri, 29 Sep 2023 13:05:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:04:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] linux-yocto/6.4: update to v6.4.16
Date: Fri, 29 Sep 2023 16:04:47 -0400
Message-Id: <c910bc60b76635c8e7bac151267a5bd3da84347e.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188422

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ae4e4fc35b42 Linux 6.4.16
    e769d7975a93 Revert "drm/amd/display: Do not set drr on pipe commit"
    e447d28a9313 tracing: Zero the pipe cpumask on alloc to avoid spurious -EBUSY
    69018a9b08a5 revert "memfd: improve userspace warnings for missing exec-related flags".
    62845d4f901d memfd: improve userspace warnings for missing exec-related flags
    6c7e8705677c memfd: do not -EACCES old memfd_create() users with vm.memfd_noexec=2
    c7b4118308f9 selftests/memfd: sysctl: fix MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED
    c144c6030b13 mm/memfd: sysctl: fix MEMFD_NOEXEC_SCOPE_NOEXEC_ENFORCED
    7e3ca33752bd serial: sc16is7xx: fix regression with GPIO configuration
    ccae7cf2d6ff serial: sc16is7xx: remove obsolete out_thread label
    cb3acdc203d6 Bluetooth: HCI: Introduce HCI_QUIRK_BROKEN_LE_CODED
    f9965f7f38c9 Bluetooth: msft: Extended monitor tracking by address filter
    95c5d3fbd3c4 LoongArch: Ensure FP/SIMD registers in the core dump file is up to date
    ccdfcb911967 media: ipu3-cio2: allow ipu_bridge to be a module again
    f51d194b1954 perf/x86/uncore: Correct the number of CHAs on EMR
    604b1b6ee09c x86/build: Fix linker fill bytes quirk/incompatibility for ld.lld
    7447ac0485a5 x86/sgx: Break up long non-preemptible delays in sgx_vepc_release()
    8cded8d95372 USB: core: Fix oversight in SuperSpeed initialization
    b4a074b1fb22 USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()
    256b02f63cc1 USB: core: Change usb_get_device_descriptor() API
    64687c13eb88 USB: core: Unite old scheme and new scheme descriptor reads
    d49547950bf7 usb: typec: bus: verify partner exists in typec_altmode_attention
    2897b36d2482 usb: typec: tcpm: set initial svdm version based on pd revision
    98347c9b1744 of: property: fw_devlink: Add a devlink for panel followers
    2c671c7cb211 cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
    5aa493719d8f crypto: stm32 - fix MDMAT condition
    3b8c7cc94e29 crypto: stm32 - fix loop iterating through scatterlist for DMA
    afe98365be95 HID: logitech-hidpp: rework one more time the retries attempts
    90819a4a919f s390/dasd: fix string length handling
    812736446cf5 s390/ipl: add missing secure/has_secure file to ipl type 'unknown'
    b7ad75c77349 s390/dcssblk: fix kernel crash with list_add corruption
    b15d3cbd2941 iov_iter: Fix iov_iter_extract_pages() with zero-sized entries
    5db357b14d40 regulator: dt-bindings: qcom,rpm: fix pattern for children
    84d16de27327 arm64: sdei: abort running SDEI handlers during crash
    f77990358628 pstore/ram: Check start of empty przs during init
    07239ca76dd6 mmc: renesas_sdhi: register irqs before registering controller
    39c23c941153 platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
    01474630c566 crypto: af_alg - Decrement struct key.usage in alg_set_by_key_serial()
    6eac39659014 x86/MCE: Always save CS register on AMD Zen IF Poison errors
    bffa781398cd fsverity: skip PKCS#7 parser when keyring is empty
    56d2f71c85a4 net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
    cd5d0d13a036 X.509: if signature is unsupported skip validation
    83f19f32125b r8169: fix ASPM-related issues on a number of systems with NIC version from RTL8168h
    6615212d8e13 x86/sev: Make enc_dec_hypercall() accept a size instead of npages
    d8171411a661 dccp: Fix out of bounds access in DCCP error handler
    5c7403f95225 dlm: fix plock lookup when using multiple lockspaces
    5927f0172d28 bpf: Fix issue in verifying allow_ptr_leaks
    247ee56a7865 drm/amd/display: Add smu write msg id fail retry process
    a641e116f929 misc: fastrpc: Pass proper scm arguments for static process init
    3d45037fbc20 parisc: Fix /proc/cpuinfo output for lscpu
    bda2ed2b954e procfs: block chmod on /proc/thread-self/comm
    4e3fc835816d block: don't add or resize partition on the disk with GENHD_FL_NO_PART
    93cb3211912e Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
    223649a6ac7f ntb: Fix calculation ntb_transport_tx_free_entry()
    08c64e0c2f43 ntb: Clean up tx tail index on link down
    c2cd5d993f57 ntb: Drop packets when qp link is down
    b05d301ad46d PCI/PM: Only read PCI_PM_CTRL register when available
    d0687755407b PCI: hv: Fix a crash in hv_pci_restore_msi_msg() during hibernation
    a076e73dd6e6 PCI: Free released resource after coalescing
    512db7829b4a scsi: mpt3sas: Perform additional retries if doorbell read returns 0
    bcd9febc0c72 Revert "scsi: qla2xxx: Fix buffer overrun"
    f36a3430e559 media: nxp: Fix wrong return pointer check in mxc_isi_crossbar_init()
    fa039796edbf media: venus: hfi_venus: Write to VIDC_CTRL_INIT after unmasking interrupts
    74b005d99b3e media: dvb: symbol fixup for dvb_attach()
    a025494d0090 ALSA: hda/cirrus: Fix broken audio on hardware with two CS42L42 codecs.
    a5ad2f87d8e7 arm64: csum: Fix OoB access in IP checksum code for negative lengths
    67c16c941521 io_uring: Don't set affinity on a dying sqpoll thread
    61885936897c i3c: master: svc: fix probe failure when no i3c device exist
    9b445804b15a powerpc/ftrace: Fix dropping weak symbols with older toolchains
    593ad636bac4 LoongArch: mm: Add p?d_leaf() definitions
    86a6b5515e8e xtensa: PMU: fix base address for the newer hardware
    17c6bced492c drm/amd/display: register edp_backlight_control() for DCN301
    cc727eae2a46 backlight/lv5207lp: Compare against struct fb_info.device
    1a5fc6abeef0 backlight/bd6107: Compare against struct fb_info.device
    164a795d91f3 backlight/gpio_backlight: Compare against struct fb_info.device
    dec70164ba78 io_uring: break out of iowq iopoll on teardown
    63059d272c4c io_uring/sqpoll: fix io-wq affinity when IORING_SETUP_SQPOLL is used
    e64db62650d4 io_uring: break iopolling on signal
    7c3be1e33101 io_uring: fix false positive KASAN warnings
    ec5cf2977cff XArray: Do not return sibling entries from xa_load()
    b69c7129a295 riscv: Mark KASAN tmp* page tables variables as static
    d1f8b6832c97 riscv: Move create_tmp_mapping() to init sections
    dd4652a92dad ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()
    1bfcfea0fae0 ipmi_si: fix a memleak in try_smi_init()
    20d1e215c945 PCI: rockchip: Use 64-bit mask on MSI 64-bit PCI address
    f9bfc1a3858c media: i2c: Add a camera sensor top level menu
    636f4076188c media: i2c: ccs: Check rules is non-NULL
    9734e4c0c470 cpu/hotplug: Prevent self deadlock on CPU hot-unplug
    1f55e7667a6a mm/vmalloc: add a safer version of find_vm_area() for debug
    d41edcef2c92 scsi: core: Fix the scsi_set_resid() documentation
    4329b63ce53f printk: ringbuffer: Fix truncating buffer size min_t cast
    dddca4c46ec9 rcu: dump vmalloc memory info safely
    e39e870e1e68 virtio_pmem: add the missing REQ_OP_WRITE for flush bio
    4f973bc0db7c ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
    21a67da7f22b Multi-gen LRU: fix per-zone reclaim
    1640e9c72173 PM / devfreq: Fix leak in devfreq_dev_release()
    6a9abbccaac4 igb: set max size RX buffer when store bad packet is enabled
    f99006e840a4 skbuff: skb_segment, Call zero copy functions before using skbuff frags
    b63b4e114593 netfilter: xt_sctp: validate the flag_info count
    83b995321eaa netfilter: xt_u32: validate user space input
    93450ea57eec netfilter: nft_exthdr: Fix non-linear header modification
    d59b6fc40554 netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
    87f07ec534e3 igmp: limit igmpv3_newpack() packet size to IP_MAX_MTU
    e4ffc47a1c3e net: deal with integer overflows in kmalloc_reserve()
    bf11b89b0a2a virtio_ring: fix avail_wrap_counter in virtqueue_add_packed
    5f2592243ccd virtio_vdpa: build affinity masks conditionally
    7d85dfdf8bd5 cpufreq: Fix the race condition while updating the transition_task of policy
    bb31371c1dcd um: virt-pci: fix missing declaration warning
    9fc162c59edc Drivers: hv: vmbus: Don't dereference ACPI root object handle
    bfcf280533ad dmaengine: idxd: Fix issues with PRS disable sysfs knob
    df212ed77384 dmaengine: idxd: Allow ATS disable update only for configurable devices
    e5d80eb3764c dmaengine: idxd: Expose ATS disable knob only when WQ ATS is supported
    8f5137564c7a dmaengine: idxd: Simplify WQ attribute visibility checks
    fa2e3c484af6 dmaengine: ste_dma40: Add missing IRQ check in d40_probe
    eaa8d097a529 um: Fix hostaudio build errors
    9a61f2c08f30 mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
    c4b5d3659473 mtd: spi-nor: Check bus width while setting QE bit
    0301718d3ab4 leds: trigger: tty: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead
    e2a579c5a997 leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false
    92e1279daf07 leds: multicolor: Use rounded division when calculating color components
    e3aa6884fae9 thermal/drivers/imx8mm: Suppress log message on probe deferral
    db478bcb3161 thermal/drivers/mediatek/lvts_thermal: Manage threshold between sensors
    8e382e9470c0 thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed
    71b7ccc49a98 thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
    30a642a6b666 thermal/drivers/mediatek/lvts_thermal: Use offset threshold for IRQ
    ba01e46105df thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
    436b4b33e048 thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
    bab77f962ce3 leds: pwm: Fix error code in led_pwm_create_fwnode()
    174cf8853857 rpmsg: glink: Add check for kstrdup
    59a069a42682 phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
    e9876c8873fc phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate
    7a35fe6478f7 phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
    c1c4cb6103ae dmaengine: idxd: Modify the dependence of attribute pasid_enabled
    92273c3435bb mtd: rawnand: brcmnand: Fix mtd oobsize
    89c89da92a60 tracing: Fix race issue between cpu buffer write and swap
    e0c6a3679e3b tracing: Remove extra space at the end of hwlat_detector/mode
    5ed4c90a6b56 x86/speculation: Mark all Skylake CPUs as vulnerable to GDS
    d0a267f4e5de tick/rcu: Fix false positive "softirq work is pending" messages
    617326853221 platform/x86/amd/pmf: Fix a missing cleanup path
    1d7833db9fd1 HID: multitouch: Correct devm device reference for hidinput input_dev name
    4c2707dfee58 HID: uclogic: Correct devm device reference for hidinput input_dev name
    e7952f4d621e nvmem: core: Return NULL when no nvmem layout is found
    144becd79c19 HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()
    e79db2f51a56 RDMA/efa: Fix wrong resources deallocation order
    a1ceb3079efb RDMA/siw: Correct wrong debug message
    ef1378f78df2 RDMA/siw: Balance the reference of cep->kref in the error path
    4082b59705ee Revert "IB/isert: Fix incorrect release of isert connection"
    206fadb7278c amba: bus: fix refcount leak
    7a9af64f7b03 serial: tegra: handle clk prepare error in tegra_uart_hw_init()
    86017523b852 interconnect: qcom: bcm-voter: Use enable_maks for keepalive voting
    ccedcb364897 interconnect: qcom: bcm-voter: Improve enable_mask handling
    1d164939335d interconnect: qcom: sm8450: Enable sync_state
    694ddc5bf35a scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock
    eaf18b15a811 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
    ceba966f1d63 RDMA/irdma: Prevent zero-length STAG registration
    9406ad6d6c84 coresight: trbe: Fix TRBE potential sleep in atomic context
    e309f455801f f2fs: fix to account cp stats correctly
    0e2577074b45 f2fs: fix to drop all dirty meta/node pages during umount()
    1c5fb9c7956c f2fs: fix to account gc stats correctly
    53ac32aae7a6 f2fs: refactor struct f2fs_attr macro
    ea35767edc78 Revert "f2fs: fix to do sanity check on extent cache correctly"
    46fc3c4b81bf f2fs: Only lfs mode is allowed with zoned block device feature
    db35eb17bf6d f2fs: fix to avoid mmap vs set_compress_option case
    0625d012793d f2fs: fix spelling in ABI documentation
    d82e45857418 media: i2c: rdacm21: Fix uninitialized value
    49bd577e5897 media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
    38b0ebc048eb media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
    b8bc7bc64819 media: ov2680: Add ov2680_fill_format() helper function
    279a562c4af2 media: ov2680: Don't take the lock for try_fmt calls
    039e14a17a1b media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
    42ac1c0d7fa3 media: ov2680: Fix vflip / hflip set functions
    f3ac838162d3 media: ov2680: Fix ov2680_bayer_order()
    afccb9524a6a media: ov2680: Remove auto-gain and auto-exposure controls
    39a54d5dc777 media: Documentation: Fix [GS]_ROUTING documentation
    47b4081e35c2 media: ov5640: Fix initial RESETB state and annotate timings
    b57b9f888f22 media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
    9990c80ec1ce HID: input: Support devices sending Eraser without Invert
    3bcc4c2a096e drivers: base: Free devm resources when unregistering a device
    9c4ab0088b33 USB: gadget: f_mass_storage: Fix unused variable warning
    e33c789963db USB: gadget: core: Add missing kerneldoc for vbus_work
    f2e92730bfef docs: ABI: fix spelling/grammar in SBEFIFO timeout interface
    4b02eacc0b66 media: ipu-bridge: Do not use on stack memory for software_node.name field
    5bce956b22ad media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3
    3de35e29cfdd media: ipu-bridge: Fix null pointer deref on SSDB/PLD parsing warnings
    91d790ac27eb arm64: defconfig: Drop CONFIG_VIDEO_IMX_MEDIA
    1e4ea9bf3783 media: venus: hfi_venus: Only consider sys_idle_indicator on V1
    c2e304c9564e media: go7007: Remove redundant if statement
    9fa26c6ac168 media: cec: core: add adap_unconfigured() callback
    258e4784b8b5 media: cec: core: add adap_nb_transmit_canceled() callback
    c5402011992b platform/x86: dell-sysman: Fix reference leak
    a793bbfd1a17 iommu/vt-d: Fix to flush cache of PASID directory table
    a3013b402d76 tty: serial: qcom-geni-serial: Poll primary sequencer irq status after cancel_tx
    b3fdfdb5d851 iommu/qcom: Disable and reset context bank before programming
    58c928d4ae4b fsi: aspeed: Reset master errors after CFAM reset
    d95b6f3ba733 IB/uverbs: Fix an potential error pointer dereference
    f23228b2a798 RDMA/hns: Fix CQ and QP cache affinity
    debfbb2c7db0 RDMA/hns: Fix inaccurate error label name in init instance
    bf6f879fde49 RDMA/hns: Fix incorrect post-send with direct wqe of wr-list
    ca0d8f408a45 RDMA/hns: Fix port active speed
    192740d0b9c5 RDMA/bnxt_re: Remove a redundant flag
    37b78dd932f6 iommu: Remove kernel-doc warnings
    a57d054f9785 iommu/sprd: Add missing force_aperture
    fe8258b698e6 iommu/mediatek: Fix two IOMMU share pagetable issue
    0c5b72339bb1 extcon: cht_wc: add POWER_SUPPLY dependency
    d89c70f59e80 kernfs: add stub helper for kernfs_generic_poll()
    d7dd75c5f2b1 driver core: Call dma_cleanup() on the test_remove path
    6c064c764856 driver core: test_async: fix an error code
    3f7e2c325862 dma-buf/sync_file: Fix docs syntax
    7348bea2e865 interconnect: qcom: qcm2290: Enable sync state
    6d0be342a4b8 coresight: tmc: Explicit type conversions to prevent integer overflow
    3489c741f1d7 RDMA/irdma: Replace one-element array with flexible-array member
    6aac7f0d1b86 scsi: qedf: Do not touch __user pointer in qedf_dbg_fp_int_cmd_read() directly
    8f92dd19a154 scsi: qedf: Do not touch __user pointer in qedf_dbg_debug_cmd_read() directly
    8a892c1bc4dd scsi: qedf: Do not touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly
    2f2a6422287f RDMA/rxe: Fix incomplete state save in rxe_requester
    d7dbce161d60 RDMA/rxe: Fix rxe_modify_srq
    da572f6313ae RDMA/rxe: Fix unsafe drain work queue code
    ecd4ff7e934b RDMA/rxe: Move work queue code to subroutines
    b3110e66ad04 x86/APM: drop the duplicate APM_MINOR_DEV macro
    0237f913694d serial: sprd: Fix DMA buffer leak issue
    e8ab4ea0cef5 serial: sprd: Assign sprd_port after initialized to avoid wrong access
    8fafcc478dee iio: accel: adxl313: Fix adxl313_i2c_id[] table
    4ed219753112 scsi: qla4xxx: Add length check when parsing nlattrs
    da4c861ef51e scsi: be2iscsi: Add length check when parsing nlattrs
    3466c1b52457 scsi: iscsi: Add strlen() check in iscsi_if_set{_host}_param()
    714bfe448909 scsi: iscsi: Add length check for nlattr payload
    d431b85179b2 scsi: ufs: Fix residual handling
    d3380a5a9996 scsi: RDMA/srp: Fix residual handling
    a2ecc4a909d4 usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
    b7dbc27301f5 media: mediatek: vcodec: fix resource leaks in vdec_msg_queue_init()
    4fe1f032a22d media: mediatek: vcodec: fix potential double free
    c2b2dcccb629 media: mediatek: vcodec: Return NULL if no vdec_fb is found
    3b5ce3c5e68f media: amphion: ensure the bitops don't cross boundaries
    451a2d7a3587 media: amphion: fix UNUSED_VALUE issue reported by coverity
    7509d455e188 media: amphion: fix UNINIT issues reported by coverity
    e59d0cd8f414 media: amphion: fix REVERSE_INULL issues reported by coverity
    344909ea0ea0 media: amphion: fix CHECKED_RETURN issues reported by coverity
    b436ab2b8c3e media: rkvdec: increase max supported height for H.264
    683ac024116f media: amphion: decoder support display delay for all formats
    8977d9924843 media: mtk-jpeg: Fix use after free bug due to uncanceled work
    bf32ec66ec6e media: verisilicon: Fix TRY_FMT on encoder OUTPUT
    80776261bab0 media: amphion: add helper function to get id name
    f77cbf3c0ccc media: amphion: reinit vpu if reqbufs output 0
    8a1a546c1870 dt-bindings: extcon: maxim,max77843: restrict connector properties
    b27db41b6102 scsi: hisi_sas: Fix normally completed I/O analysed as failed
    fa23b54214cd scsi: hisi_sas: Fix warnings detected by sparse
    beabdccf8b27 RDMA/siw: Fabricate a GID on tun and loopback devices
    e6ebe18eae96 media: cx24120: Add retval check for cx24120_message_send()
    4feed3dfca72 media: dvb-usb: m920x: Fix a potential memory leak in m920x_i2c_xfer()
    2d73f3e7f84a media: dib7000p: Fix potential division by zero
    77e2dc9a18dc drivers: usb: smsusb: fix error handling code in smsusb_init_device
    9ac8d316f6c9 iommu: rockchip: Fix directory table address encoding
    9ccc51be3126 iommu/amd/iommu_v2: Fix pasid_state refcount dec hit 0 warning on pasid unbind
    ed1696f7f92e media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()
    774eb431db60 media: i2c: tvp5150: check return value of devm_kasprintf()
    fd44bb897f4b media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables
    c611001cdc58 media: i2c: imx290: drop format param from imx290_ctrl_update
    0c6b9bd287f5 media: ov5640: fix low resolution image abnormal issue
    dcc031701f44 RDMA/qedr: Remove a duplicate assignment in irdma_query_ah()
    fb4f7c110473 cgroup/cpuset: Inherit parent's load balance state in v2
    05fed99eb117 pNFS: Fix assignment of xprtdata.cred
    118d91d46ba8 NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
    c8aff5b43951 NFS: Guard against READDIR loop when entry names exceed MAXNAMELEN
    efcae97fa425 NFSD: da_addr_body field missing in some GETDEVICEINFO replies
    3dc93111c318 fs: lockd: avoid possible wrong NULL parameter
    ac8a5bd24ca9 jfs: validate max amount of blocks before allocation.
    105f7fd386f6 ext4: fix unttached inode after power cut with orphan file feature enabled
    c46af5858825 powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
    766394d26437 powerpc/mpc5xxx: Add missing fwnode_handle_put()
    5287fa4a0cee powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=n
    ad4293e42b21 nfs/blocklayout: Use the passed in gfp flags
    3c5e8e666794 powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
    445b76b5491a powerpc: Don't include lppaca.h in paca.h
    a2f4cb206bd9 NFSv4.2: Rework scratch handling for READ_PLUS (again)
    770eaf4c3548 NFSv4.2: Fix READ_PLUS size calculations
    039e896302e5 NFSv4.2: Fix READ_PLUS smatch warnings
    847ee94d82e8 wifi: ath10k: Use RMW accessors for changing LNKCTL
    f8dca9806d70 wifi: ath12k: Use RMW accessors for changing LNKCTL
    9697dfa899e8 wifi: ath11k: Use RMW accessors for changing LNKCTL
    6eb6602de213 net/mlx5: Use RMW accessors for changing LNKCTL
    380b0d6305c0 drm/radeon: Use RMW accessors for changing LNKCTL
    0313eb9035aa drm/amdgpu: Use RMW accessors for changing LNKCTL
    cf730b02a776 pinctrl: mediatek: assign functions to configure pin bias on MT7986
    2dccd33ad2a3 pinctrl: mediatek: fix pull_type data for MT7981
    11cc6b7414e6 powerpc/perf: Convert fsl_emb notifier to state machine callbacks
    afcee5bda342 powerpc/fadump: reset dump area size if fadump memory reserve fails
    82824a634672 nvdimm: Fix dereference after free in register_nvdimm_pmu()
    4999f2ec5fde nvdimm: Fix memleak of pmu attr_groups in unregister_nvdimm_pmu()
    cbac29a1caa4 vfio/type1: fix cap_migration information leak
    cb40dc25bdd7 powerpc/radix: Move some functions into #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
    76c86b61b2cb clk: imx: composite-8m: fix clock pauses when set_rate would be a no-op
    d5e329876737 clk: imx8mp: fix sai4 clock
    4c67637f9ca4 clk: imx: imx8ulp: update SPLL2 type
    0310de64b34d clk: imx: pllv4: Fix SPLL2 MULT range
    40fe937de63e clk: qcom: gcc-qdu1000: Register gcc_gpll1_out_even clock
    88c80af75cd1 dt-bindings: clock: Update GCC clocks for QDU1000 and QRU1000 SoCs
    ee6966bb2490 clk: qcom: gcc-qdu1000: Fix clkref clocks handling
    84fbbb177dae clk: qcom: gcc-qdu1000: Fix gcc_pcie_0_pipe_clk_src clock handling
    cbfd73886eb3 clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs
    49a9ac827052 PCI/ASPM: Use RMW accessors for changing LNKCTL
    9d31c101cc3e PCI: pciehp: Use RMW accessors for changing LNKCTL
    df666f21768b PCI: Add locking to RMW PCI Express Capability Register accessors
    754bccefd64e pinctrl: mcp23s08: check return value of devm_kasprintf()
    7da44f84c4fa PCI: Mark NVIDIA T4 GPUs to avoid bus reset
    5183cbfbddcf PCI: microchip: Correct the DED and SEC interrupt bit offsets
    ab600f5aabca clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
    f9917b02df08 clk: qcom: reset: Use the correct type of sleep/delay based on length
    1e54beadc550 kvm/vfio: ensure kvg instance stays around in kvm_vfio_group_add()
    7af1006a6d4a kvm/vfio: Prepare for accepting vfio device fd
    1cb17fd8ef56 clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
    f168ffe4679e ext4: avoid potential data overflow in next_linear_group
    83a9d5f5ec7e ext4: correct grp validation in ext4_mb_good_group
    cfc5b2ad57fc EDAC/igen6: Fix the issue of no error events
    5c3836959104 clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
    c2362ea892f1 clk: sunxi-ng: Modify mismatched function name
    f3ad747e9dc1 clk: qcom: dispcc-sc8280xp: Use ret registers on GDSCs
    c4f9c0a3a6df PCI/DOE: Fix destroy_work_on_stack() race
    727a2c140217 iommufd: Fix locking around hwpt allocation
    68389f0c4af4 EDAC/i10nm: Skip the absent memory controllers
    f35e506eda63 drivers: clk: keystone: Fix parameter judgment in _of_pll_clk_init()
    ef2757b1ea8e PCI: qcom-ep: Switch MHI bus master clock off during L1SS
    b1b0ddd5bf39 PCI: apple: Initialize pcie->nvecs before use
    b0783c17ff0d clk: rockchip: rk3568: Fix PLL rate setting for 78.75MHz
    e00980fb2f10 clk: qcom: gcc-sm7150: Add CLK_OPS_PARENT_ENABLE to sdcc2 rcg
    5f487953feed clk: qcom: gcc-sc8280xp: Add missing GDSCs
    ea4eceef1659 dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
    e065dc315563 clk: qcom: gcc-sc8280xp: Add missing GDSC flags
    3764722d974a clk: qcom: gpucc-sm6350: Fix clock source names
    fc242b27ab34 clk: qcom: gpucc-sm6350: Introduce index-based clk lookup
    7db16d2e791b ipmi:ssif: Fix a memory leak when scanning for an adapter
    2959a03cb7e7 ipmi:ssif: Add check for kstrdup
    3639535d3d9a ALSA: ac97: Fix possible error value of *rac97
    7287ad123658 of: unittest: Fix overlay type in apply/revert check
    be86241bf5d1 of: overlay: Call of_changeset_init() early
    70bd7f65d33d ASoC: SOF: amd: clear dsp to host interrupt status
    293c2dd9ed49 md: raid0: account for split bio in iostat accounting
    f34142ab4e04 md/raid0: Fix performance regression for large sequential writes
    af006dbb3802 md/raid0: Factor out helper for mapping and submitting a bio
    e39ef7880d10 blk-cgroup: Fix NULL deref caused by blkg_policy_data being installed before init
    dc98c6c08692 firmware: cs_dsp: Fix new control name check
    7a8b6d93991b md/raid5-cache: fix null-ptr-deref for r5l_flush_stripe_to_raid()
    71cf23271f01 md/raid5-cache: fix a deadlock in r5l_exit_log()
    4dc84316458d bus: ti-sysc: Fix cast to enum warning
    cd80ed6096ba arm64: dts: qcom: sc8280xp-x13s: Unreserve NC pins
    13c1e578cbf6 arm64: dts: qcom: msm8996: Fix dsi1 interrupts
    fa556a230f3a ARM: dts: qcom: sdx65-mtp: Update the pmic used in sdx65
    5d177cf1261b arm64: dts: qcom: msm8998: Add missing power domain to MMSS SMMU
    cd689615b5fb arm64: dts: qcom: msm8998: Drop bus clock reference from MMSS SMMU
    f74605f26166 arm64: dts: qcom: apq8016-sbc: Rename ov5640 enable-gpios to powerdown-gpios
    afcb5d05e6a0 arm64: dts: qcom: msm8916: Rename &msmgpio -> &tlmm
    da20170162a2 arm64: dts: qcom: msm8916: Define regulator constraints next to usage
    f46343a82419 arm64: dts: qcom: msm8916: Disable audio codecs by default
    8d62b20ab713 arm64: dts: qcom: msm8916: Fix regulator constraints
    d80270a083e8 arm64: dts: qcom: msm8916-longcheer-l8910: Add front flash LED
    aeae9dbc2bee arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
    7b359a6c6c67 drm/mediatek: Fix void-pointer-to-enum-cast warning
    368de6870850 drm/mediatek: Fix potential memory leak if vmap() fail
    7715cf353850 arm64: dts: ti: k3-am62x-sk-common: Update main-i2c1 frequency
    dea34bb4b463 ARM: dts: qcom: ipq4019: correct SDHCI XO clock
    fdd0090d504b arm64: dts: imx8mp-debix: remove unused fec pinctrl node
    e43150707496 drm/mediatek: Add cnt checking for coverity issue
    c5fd246eabe6 drm/mediatek: Remove freeing not dynamic allocated memory
    901eebd45f89 bus: ti-sysc: Fix build warning for 64-bit build
    899a9e6a4520 arm64: dts: ti: k3-j784s4: Fix interrupt ranges for wkup & main gpio
    10a1ed0f2bd9 drm/mediatek: dp: Add missing error checks in mtk_dp_parse_capabilities
    ec2273b61a79 io_uring: fix drain stalls by invalid SQE
    39215fc86d3c block/mq-deadline: use correct way to throttling write requests
    8a40b4913729 audit: fix possible soft lockup in __audit_inode_child()
    f3147cba702e drm/mediatek: Fix uninitialized symbol
    1520151abb5d ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
    d4aa235496a2 ASoC: SOF: Intel: hda-mlink: fix off-by-one error
    9064662f15f4 drm/msm/a6xx: Fix GMU lockdep splat
    f0f805279d52 drm/msm/a2xx: Call adreno_gpu_init() earlier
    e71f68e22e58 drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_create()
    c325854ad86e smackfs: Prevent underflow in smk_set_cipso()
    82e1d82a223e drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
    68f3209546b5 firmware: meson_sm: fix to avoid potential NULL pointer dereference
    5b0dd3a102f6 drm/msm/mdp5: Don't leak some plane state
    1d9b8b32533f soc: qcom: smem: Fix incompatible types in comparison
    602f4e4fc83d arm64: dts: qcom: sm8550-mtp: Add missing supply for L1B regulator
    ce06e7158308 drm/msm/dpu: increase memtype count to 16 for sm8550
    c975defd2904 drm/msm/dpu: drop the regdma configuration
    4121d95da181 drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask
    daf77a87b4d0 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
    8bf2f878f7e8 drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
    34e4e5af4af6 drm/repaper: Reduce temporary buffer size in repaper_fb_dirty()
    971154071555 drm/armada: Fix off-by-one error in armada_overlay_get_property()
    d7b3918b5c58 ARM: dts: BCM53573: Fix Tenda AC9 switch CPU port
    09688ee4aa69 drm/ast: report connection status on Display Port.
    206efac19e9e arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
    c74ae8124f96 of: unittest: fix null pointer dereferencing in of_unittest_find_node_by_name()
    39f5dc484ea2 drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
    560462e45bba drm/msm: Update dev core dump to not print backwards
    0a1db96de334 md/md-bitmap: hold 'reconfig_mutex' in backlog_store()
    7d9b926c4c05 md/md-bitmap: remove unnecessary local variable in backlog_store()
    4574db58e3d4 md/raid10: use dereference_rdev_and_rrdev() to get devices
    e26b8812a79a md/raid10: factor out dereference_rdev_and_rrdev()
    a5dc1f8342fa md: restore 'noio_flag' for the last mddev_resume()
    8267f8119091 ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t values handling
    946c6cbacedb arm64: dts: rockchip: Enable SATA on Radxa E25
    cd3e27ab9811 arm64: dts: rockchip: Fix PCIe regulators on Radxa E25
    72da8b87ee48 drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
    952c04c10287 arm64: dts: qcom: msm8996-gemini: fix touchscreen VIO supply
    113780e10171 arm64: dts: qcom: sdm845: Fix the min frequency of "ice_core_clk"
    00581f3c0ddb arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
    792e06163a3d ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
    ea675751f804 drm: adv7511: Fix low refresh rate register for ADV7533/5
    8db9177e9afc ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
    a91cf971e2ec ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
    9279edc4c4e8 ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
    4da92f5706f6 drm/bridge: anx7625: Use common macros for HDCP capabilities
    04e2a662b551 drm/bridge: anx7625: Use common macros for DP power sequencing commands
    b3498d004191 x86/mm: Fix PAT bit missing from page protection modify mask
    4355a1c3a58c block: don't allow enabling a cache on devices that don't support it
    db22fcbad57c block: cleanup queue_wc_store
    03382577996c drm/etnaviv: fix dumping of active MMU context
    5255cd757321 arm64: tegra: Fix HSUART for Smaug
    ff44df02ae68 arm64: dts: qcom: pmi8994: Add missing OVP interrupt
    8ec1d751e750 arm64: dts: qcom: pmi8950: Add missing OVP interrupt
    d618209fff54 arm64: dts: qcom: pm660l: Add missing short interrupt
    4dce1ca61fe5 arm64: dts: qcom: pm6150l: Add missing short interrupt
    314dd409b863 arm64: dts: qcom: sm8250-sony-xperia: correct GPIO keys wakeup again
    b47970aec2b2 arm64: tegra: Fix HSUART for Jetson AGX Orin
    37c085a977e4 ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
    38d5220f93ec ARM: dts: BCM53573: Add cells sizes to PCIe node
    381cd6c60f4c ARM: dts: BCM53573: Drop nonexistent #usb-cells
    7319280e7e8e ARM: dts: BCM53573: Drop nonexistent "default-off" LED trigger
    8c6ac7470c46 drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
    b99f5bf32fee firmware: ti_sci: Use system_state to determine polling
    c3180fd9cf9e ARM: dts: stm32: Add missing detach mailbox for DHCOR SoM
    9ec5b2ec2233 ARM: dts: stm32: Add missing detach mailbox for DHCOM SoM
    0e0240967ed1 ARM: dts: stm32: Update to generic ADC channel binding on DHSOM systems
    cc0158d90283 ARM: dts: stm32: Add missing detach mailbox for Odyssey SoM
    002cfdf64f0e ARM: dts: stm32: Add missing detach mailbox for emtrion emSBC-Argon
    eaa18625a721 ARM: dts: stm32: adopt generic iio bindings for adc channels on emstamp-argon
    ce5716af92de arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA coherent
    6bdc6c98e008 arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC inclusion
    316b1db0faf9 arm64: dts: qcom: pmk8350: fix ADC-TM compatible string
    e9b6e5f9d89b arm64: dts: qcom: pmr735b: fix thermal zone name
    31578f4a1038 arm64: dts: qcom: pm8350b: fix thermal zone name
    d532b99da1e7 arm64: dts: qcom: pm8350: fix thermal zone name
    7374fbf8099f arm64: dts: qcom: sm8350: Use proper CPU compatibles
    2aec1a1bd316 arm64: dts: qcom: sm8350: Add missing LMH interrupts to cpufreq
    4627ff061385 arm64: dts: qcom: sm8350: Fix CPU idle state residency times
    db0bb434bd62 arm64: dts: qcom: sdm845-tama: Set serial indices and stdout-path
    94d0f87853c7 arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
    4aad17e6971d arm64: dts: qcom: sc8280xp: Add missing SCM interconnect
    c806d12c2a03 arm64: dts: qcom: sc8280xp-crd: Correct vreg_misc_3p3 GPIO
    1bd91f7558cc arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
    ad256c8f3659 arm64: dts: qcom: sm8250-edo: Add GPIO line names for PMIC GPIOs
    b8b24ca8ff62 arm64: dts: qcom: sm8250-edo: Add gpio line names for TLMM
    142d0c2b087d arm64: dts: qcom: msm8916-l8150: correct light sensor VDDIO supply
    62bcbe864e8f arm64: dts: qcom: sm8250: correct dynamic power coefficients
    c9cbf312beca arm64: dts: qcom: sm6350: Fix ZAP region
    49d9276e4e65 arm64: dts: qcom: sm8150: use proper DSI PHY compatible
    a5397aa6c459 arm64: defconfig: enable Qualcomm MSM8996 Global Clock Controller as built-in
    735f8ad47c41 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
    9971747dee9a soc: qcom: ocmem: Add OCMEM hardware version print
    97c55d575318 ASoC: stac9766: fix build errors with REGMAP_AC97
    19e1dfcd0094 drm/hyperv: Fix a compilation issue because of not including screen_info.h
    75b1c7be6ec5 drm/amd/display: Do not set drr on pipe commit
    903fc5d8cb48 quota: fix dqput() to follow the guarantees dquot_srcu should provide
    d6dd76dbd98c quota: add new helper dquot_active()
    ec2b2bcbed47 quota: rename dquot_active() to inode_quota_active()
    c389a4c481ae quota: factor out dquot_write_dquot()
    98d233259a4d drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller
    a24f97271af9 ASoC: cs43130: Fix numerator/denominator mixup
    65306c9e8588 ASoC: soc-compress: Fix deadlock in soc_compr_open_fe
    7a1044ea63d3 drm/bridge: tc358764: Fix debug print parameter order
    4204992fec4a netrom: Deny concurrent connect().
    1f35fe7674cc pds_core: pass opcode to devcmd_wait
    b272690b335c pds_core: check for work queue before use
    4b5207803a13 pds_core: no reset command for VF
    6368086ad037 pds_core: no health reporter in VF
    42da13e048a1 pds_core: protect devlink callbacks from fw_down state
    5293f466d41d net/sched: sch_hfsc: Ensure inner classes have fsc curve
    283b627b0f2f sfc: Check firmware supports Ethernet PTP filter
    bf412083ad97 cteonxt2-pf: Fix backpressure config for multiple PFC priorities to work simultaneously
    19ab2ffa3a86 octeontx2-af: CN10KB: fix PFC configuration
    7682e8bcf255 octeontx2-pf: Fix PFC TX scheduler free
    eb13a9694e07 octeontx2-pf: Refactor schedular queue alloc/free calls
    45a8c9e443b1 hwmon: (tmp513) Fix the channel number in tmp51x_is_visible()
    0a01f59e3316 mlxsw: core_hwmon: Adjust module label names based on MTCAP sensor counter
    634309d070ab mlxsw: i2c: Limit single transaction buffer size
    b97bbe83461b mlxsw: i2c: Fix chunk size setting in output mailbox buffer
    c3971ad85ab2 net: arcnet: Do not call kfree_skb() under local_irq_disable()
    df2307c78147 ice: avoid executing commands on other ports when driving sync
    5dbb17ce201e wifi: ath9k: use IS_ERR() with debugfs_create_dir()
    2dba15a00998 net/mlx5: Dynamic cyclecounter shift calculation for PTP free running clock
    38d98af561d5 arm64: mm: use ptep_clear() instead of pte_clear() in clear_flush()
    53457af71d20 Bluetooth: btusb: Do not call kfree_skb() under spin_lock_irqsave()
    397d58007532 Bluetooth: hci_conn: fail SCO/ISO via hci_conn_failed if ACL gone early
    a30c074f0b5b Bluetooth: hci_sync: Fix UAF in hci_disconnect_all_sync
    4d3ca4a9aaf0 Bluetooth: hci_sync: Fix UAF on hci_abort_conn_sync
    970aaee1d264 Bluetooth: ISO: Notify user space about failed bis connections
    e4511a67fcdb Bluetooth: hci_conn: Consolidate code for aborting connections
    0c57f9ad2c3e wifi: mwifiex: avoid possible NULL skb pointer dereference
    1f4e3e9ba286 bpf: Fix check_func_arg_reg_off bug for graph root/node
    2e0c6551e7f8 mac80211: make ieee80211_tx_info padding explicit
    788b1537d987 wifi: nl80211/cfg80211: add forgotten nla_policy for BSS color attribute
    0bb707be973f wifi: mac80211: fix puncturing bitmap handling in CSA
    af3d2e0f3a54 bpf: Fix a bpf_kptr_xchg() issue with local kptr
    64f72193ec17 wifi: ath9k: protect WMI command response buffer replacement with a lock
    0a4bccf0dcce wifi: ath9k: fix races between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx
    5062a0af2bfa samples/bpf: fix broken map lookup probe
    1c22f35ed878 samples/bpf: fix bio latency check with tracepoint
    2abcf2482821 ARM: dts: Add .dts files missing from the build
    1db16ec15d83 selftests: memfd: error out test process when child test fails
    96c1d7a7d54b wifi: rtw89: 8852b: rfk: fine tune IQK parameters to improve performance on 2GHz band
    ebbac3a52b11 wifi: mwifiex: Fix missed return in oob checks failed path
    5d66b32a6ecf wifi: mwifiex: fix memory leak in mwifiex_histogram_read()
    acf3314a318e net: annotate data-races around sk->sk_lingertime
    5580cb5ae400 net: lan966x: Fix return value check for vcap_get_rule()
    794611ad1e6b fs: ocfs2: namei: check return value of ocfs2_add_entry()
    b49c9a2d85eb scripts/gdb: fix 'lx-lsmod' show the wrong size
    84f40e85bdc1 lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
    d68c17402442 lwt: Fix return values of BPF xmit ops
    d62da65a525e hwrng: iproc-rng200 - Implement suspend and resume calls
    b1c7b72a1b55 crypto: caam - fix unchecked return value error
    cb5311436757 ice: ice_aq_check_events: fix off-by-one check when filling buffer
    45bd8c6729a0 net-memcg: Fix scope of sockmem pressure indicators
    1b6cefd71356 net: hns3: fix wrong rpu tln reg issue
    1d3751be00c3 net: hns3: Support tlv in regs data for HNS3 PF driver
    df34972a33d2 net: hns3: move dump regs function to a separate file
    27d510d038fb selftests/bpf: Clean up fmod_ret in bench_rename test script
    3c228b80d610 selftests/bpf: Fix repeat option when kfunc_call verification fails
    9bb4becae5cf net: tcp: fix unexcepted socket die when snd_wnd is 0
    d9163d5281fb Bluetooth: hci_event: drop only unbound CIS if Set CIG Parameters fails
    736827d56be6 Bluetooth: hci_conn: Always allocate unique handles
    aafda69d4807 Bluetooth: hci_sync: Avoid use-after-free in dbg for hci_add_adv_monitor()
    5282da3305bd Bluetooth: hci_sync: Don't double print name in add/remove adv_monitor
    da19f35868df Bluetooth: Fix potential use-after-free when clear keys
    3a273cd0f47d Bluetooth: hci_conn: Fix hci_le_set_cig_params
    f550c6973e4b Bluetooth: hci_conn: Use kmemdup() to replace kzalloc + memcpy
    25675624455e Bluetooth: hci_conn: Fix not allowing valid CIS ID
    7b1b32172771 Bluetooth: ISO: Fix not checking for valid CIG/CIS IDs
    9c1d36fef5ea Bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    2bc71294d36d Bluetooth: ISO: do not emit new LE Create CIS if previous is pending
    b475c1109251 Bluetooth: ISO: Add support for connecting multiple BISes
    3e740c8876d0 Bluetooth: hci_event: Fix parsing of CIS Established Event
    867a14669096 crypto: api - Use work queue in crypto_destroy_instance
    66ee37d0da84 crypto: stm32 - Properly handle pm_runtime_get failing
    148eaae09226 kbuild: rust_is_available: fix confusion when a version appears in the path
    a329671bf103 kbuild: rust_is_available: add check for `bindgen` invocation
    7bbcdae9f862 kbuild: rust_is_available: fix version check when CC has multiple arguments
    f1b4d5f64e22 kbuild: rust_is_available: remove -v option
    dc958014fa23 bpf: fix bpf_dynptr_slice() to stop return an ERR_PTR.
    da2f98973b70 spi: mpc5xxx-psc: Fix unsigned expression compared with zero
    713f9c030837 selftests/bpf: fix static assert compilation issue for test_cls_*.c
    f12a425a7c74 wifi: ath12k: fix memcpy array overflow in ath12k_peer_assoc_h_he()
    7a031c9eaa3b wifi: ath11k: fix band selection for ppdu received in channel 177 of 5 GHz
    fdfaabfd200b wifi: mwifiex: fix error recovery in PCIE buffer descriptor management
    a7300e3800e9 wifi: mwifiex: Fix OOB and integer underflow when rx packets
    4b447dd2b472 wifi: rtw89: Fix loading of compressed firmware
    5824565c64a3 wifi: mt76: mt7915: fix power-limits while chan_switch
    90e40fee4cca wifi: mt76: mt7915: fix tlv length of mt7915_mcu_get_chan_mib_info
    863893293550 can: tcan4x5x: Remove reserved register 0x814 from writable table
    d273f36ef6be can: gs_usb: gs_usb_receive_bulk_callback(): count RX overflow errors also in case of OOM
    33ac54d56928 spi: tegra20-sflash: fix to check return value of platform_get_irq() in tegra_sflash_probe()
    ca517ee965df wifi: mt76: testmode: add nla_policy for MT76_TM_ATTR_TX_LENGTH
    300e08ebf838 wifi: mt76: mt7915: remove VHT160 capability on MT7915
    01b34b9dc2fc wifi: mt76: mt7915: fix capabilities in non-AP mode
    4f3375f81df7 wifi: mt76: mt7915: fix command timeout in AP stop period
    8aa43cfbb68b bpf: reject unhashed sockets in bpf_sk_assign
    9df141014c65 udp: re-score reuseport groups when connected sockets are present
    8eed5585f76c wifi: mt76: mt7996: fix WA event ring size
    ce5f013e73a6 wifi: mt76: mt7996: use correct phy for background radar event
    9bb9c3dc5eae wifi: mt76: mt7996: fix bss wlan_idx when sending bss_info command
    4c65f54ef70f wifi: mt76: mt7921: fix non-PSC channel scan fail
    814d59814a00 wifi: mt76: mt7915: rework tx bytes counting when WED is active
    1d2e15bca38e wifi: mt76: mt7915: rework tx packets counting when WED is active
    42633efe6bbc wifi: mt76: mt7915: fix background radar event being blocked
    69c3dbb2dcef wifi: mt76: mt7996: fix header translation logic
    f7f6d5d5490b wifi: rtw89: debug: Fix error handling in rtw89_debug_priv_btc_manual_set()
    6e2e442ff054 regmap: rbtree: Use alloc_flags for memory allocations
    50205a72102d regmap: maple: Use alloc_flags for memory allocations
    b60dbf791b0b regmap: Load register defaults in blocks rather than register by register
    88e9c27e1291 hwrng: pic32 - use devm_clk_get_enabled
    76a71852edad hwrng: nomadik - keep clock enabled while hwrng is registered
    b5058b34918a tcp: tcp_enter_quickack_mode() should be static
    b46ef4835b0c crypto: qat - change value of default idle filter
    6d167bf5ac56 bpf: Fix an error in verifying a field in a union
    a61317005384 bpf: Fix an error around PTR_UNTRUSTED
    62c4571f2752 bpf: Clear the probe_addr for uprobe
    179a2a8a7b9a libbpf: Fix realloc API handling in zero-sized edge cases
    9cdf9b27b704 bpftool: Use a local bpf_perf_event_value to fix accessing its fields
    d61c787a8977 bpftool: Use a local copy of BPF_LINK_TYPE_PERF_EVENT in pid_iter.bpf.c
    29b0abab69e0 bpftool: Define a local bpf_perf_link to fix accessing its fields
    564560f3bac6 bpftool: use a local copy of perf_event to fix accessing :: Bpf_cookie
    ff843490981a libbpf: only reset sec_def handler when necessary
    a3e6c8c383cf selftests/bpf: Fix bpf_nf failure upon test rerun
    5ce42c9441f1 cpufreq: tegra194: remove opp table in exit hook
    6e76e74f3438 cpufreq: tegra194: add online/offline hooks
    fdcfcf4ff6d4 cpufreq: powernow-k8: Use related_cpus instead of cpus in driver.exit()
    41b18168d309 x86/efistub: Fix PCI ROM preservation in mixed mode
    84857640c674 cpufreq: amd-pstate-ut: Fix kernel panic when loading the driver
    231bb989098d cpufreq: amd-pstate-ut: Remove module parameter access
    9f8b364827bf thermal/of: Fix potential uninitialized value access
    040ca14f9185 ACPI: x86: s2idle: Fix a logic error parsing AMD constraints table
    be6daa0d449a ACPI: x86: s2idle: Post-increment variables when getting constraints
    04f7ab313c71 irqchip/loongson-eiointc: Fix return value checking of eiointc_index
    4d1566cbc93c s390/paes: fix PKEY_TYPE_EP11_AES handling for secure keyblobs
    a62ba32502b0 s390/pkey: fix PKEY_TYPE_EP11_AES handling for sysfs attributes
    d2b64e45afbb s390/pkey: fix PKEY_TYPE_EP11_AES handling in PKEY_GENSECK2 IOCTL
    db98bf87deea s390/pkey: fix/harmonize internal keyblob headers
    f7595dd677f4 selftests/futex: Order calls to futex_lock_pi
    5b068b48590c perf/imx_ddr: don't enable counter0 if none of 4 counters are used
    ca4b6a5126d2 sched/rt: Fix sysctl_sched_rr_timeslice intial value
    f6f9fd819d0d arm64/fpsimd: Only provide the length to cpufeature for xCR registers
    b8d56aaa23e9 x86/decompressor: Don't rely on upper 32 bits of GPRs being preserved
    d577f577d87a cpuidle: teo: Update idle duration estimate when choosing shallower state
    219ed9a08e96 sched/psi: Select KERNFS as needed
    bbce5b478c0a arm64/ptrace: Clean up error handling path in sve_set_common()
    0bf16f0dff46 selftests/resctrl: Close perf value read fd on errors
    84ddb2c8d5d3 selftests/resctrl: Unmount resctrl FS if child fails to run benchmark
    755fb5181f49 selftests/resctrl: Don't leak buffer in fill_cache()
    aabca80d93a5 selftests/resctrl: Add resctrl.h into build deps
    2813cafbb86d OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
    b427c23cebc5 powercap: arm_scmi: Remove recursion while parsing zones
    de1dbbefac85 clocksource: Handle negative skews in "skew is too large" messages
    e5de968a9032 refscale: Fix uninitalized use of wait_queue_head_t
    28fabbbd5ac6 locking/arch: Avoid variable shadowing in local_try_cmpxchg()
    c0e71cb3ae9d ARM: ptrace: Restore syscall skipping for tracers
    9d75837cedb9 ARM: ptrace: Restore syscall restart tracing
    71512d0d79c8 vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
    cdb1369c0c5b selftests/harness: Actually report SKIP for signal tests
    8a404e5b89b5 tmpfs: verify {g,u}id mount options correctly
    b7b6c1d3c50a iomap: Remove large folio handling in iomap_invalidate_folio()
    c8ca04de0f8a fs: Fix error checking for d_hash_and_lookup()
    5c0dd959b635 eventfd: prevent underflow for eventfd semaphores
    8c079dd85f33 splice: fsnotify_access(in), fsnotify_modify(out) on success in tee
    1b46bd39bd5f splice: fsnotify_access(fd)/fsnotify_modify(fd) in vmsplice
    83ab4d61a6db splice: always fsnotify_access(in), fsnotify_modify(out) on success
    55ce683205ee reiserfs: Check the return value from __getblk()
    f294216e8817 Revert "net: macsec: preserve ingress frame ordering"
    44191fb06d7c Revert "PCI: tegra194: Enable support for 256 Byte payload"
    e46e084eef71 Revert "fuse: in fuse_flush only wait if someone wants the return code"
    f6eb08ff998a Input: i8042 - add quirk for TUXEDO Gemini 17 Gen1/Clevo PD70PN
    926c77b695ba drm/amd/display: ensure async flips are only accepted for fast updates
    e6945cbcb633 Bluetooth: btrtl: Load FW v2 otherwise FW v1 for RTL8852C
    9ccd5bc888f1 net: Avoid address overwrite in kernel_connect
    240a4bbb5c18 KVM: x86/mmu: Add "never" option to allow sticky disabling of nx_huge_pages
    ce5b4e174235 tpm: Enable hwrng only for Pluton on AMD CPUs
    a591c40c8639 cpufreq: intel_pstate: set stale CPU frequency to minimum
    a71a791575b5 sbitmap: fix batching wakeup
    0b9e229d2c3b platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    afdd9839e8b7 tracing: Introduce pipe_cpumask to avoid race on trace_pipes
    6a3e1d42a283 net: sfp: handle 100G/25G active optical cables in sfp_parse_support
    3e7b0cacdcc2 ASoC: cs35l56: Add an ACPI match table
    3f8fb078f850 drm/amd/pm: Fix temperature unit of SMU v13.0.6
    87d743fcfed1 gpiolib: fix reference leaks when removing GPIO chips still in use
    2e3f9bfe44f2 broadcom: b44: Use b44_writephy() return value
    7d9f2277f12b fbdev: goldfishfb: Do not check 0 for platform_get_irq()
    d1e1bdd30ae0 i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk doesn't work
    e1417c7dc3ad ASoC: rt1308-sdw: fix random louder sound
    fd54a813f45b ARM: dts: integrator: fix PCI bus dtc warnings
    81d0b388c10d ALSA: hda/cs8409: Support new Dell Dolphin Variants
    069ee9f4e2fd virtio-mem: check if the config changed before fake offlining memory
    206fa20b9ed1 virtio-mem: keep retrying on offline_and_remove_memory() errors in Sub Block Mode (SBM)
    c6ba4b3706c4 virtio-mem: convert most offline_and_remove_memory() errors to -EBUSY
    5ce0a78d0305 virtio-mem: remove unsafe unplug in Big Block Mode (BBM)
    0c13e9af66cf vdpa/mlx5: Correct default number of queues when MQ is on
    0993d26ddd8e vhost-scsi: Fix alignment handling with windows
    15b41e759d23 arm64: dts: rockchip: correct wifi interrupt flag in Box Demo
    d2c404193844 arm64: dts: rockchip: correct wifi interrupt flag in Rock Pi 4B
    5a7527e882e3 arm64: dts: rockchip: correct wifi interrupt flag in eaidk-610
    f4ecae3e2200 drm/amdgpu: Match against exact bootloader status
    1428c8e82b17 wifi: ath12k: Fix buffer overflow when scanning with extraie
    c21156d79dcd net: hns3: restore user pause configure when disable autoneg
    a27f317c7cdb scsi: qedi: Fix potential deadlock on &qedi_percpu->p_work_lock
    04c50fb24fd2 scsi: lpfc: Remove reftag check in DIF paths
    1185de708ec8 platform/x86/amd/pmf: Fix unsigned comparison with less than zero
    d2007c8a7429 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM
    6e2e2bf0ea55 x86/hyperv: add noop functions to x86_init mpparse functions
    ee66ee99eea6 powerpc/powermac: Use early_* IO variants in via_calibrate_decr()
    ab3c602d1562 wifi: brcmfmac: Fix field-spanning write in brcmf_scan_params_v2_to_v1()
    4cf614ac4c4b net: usb: qmi_wwan: add Quectel EM05GV2
    7ed7c1602c8b net: annotate data-races around sk->sk_{rcv|snd}timeo
    85576b3c2de3 net: dsa: microchip: KSZ9477 register regmap alignment to 32 bit boundaries
    713ce33ed395 Revert "wifi: ath6k: silence false positive -Wno-dangling-pointer warning on GCC 12"
    e70a88462a9f vmbus_testing: fix wrong python syntax for integer value comparison
    15ebed8cb794 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM
    fc18cbdad4cb kprobes: Prohibit probing on CFI preamble symbol
    b702cac249ed security: keys: perform capable check only on privileged operations
    a76d9eebc05e LoongArch: Fix CMDLINE_EXTEND and CMDLINE_BOOTLOADER handling
    df80567bfd6a LoongArch: Only fiddle with CHECKFLAGS if `need-compiler'
    3c57e6ef55b8 staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
    23db7577c53f ALSA: usb-audio: Update for native DSD support quirks
    73adcfe192d3 ata: pata_arasan_cf: Use dev_err_probe() instead dev_err() in data_xfer()
    20c80f8cfbc5 ovl: Always reevaluate the file signature for IMA
    6d5912a386b6 drm/amd/display: Exit idle optimizations before attempt to access PHY
    43a973efd6ae drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family
    4c155ffd3662 drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX Curr Clock
    dc02b0843040 platform/x86: huawei-wmi: Silence ambient light sensor
    9d1d1b51b04a platform/x86: asus-wmi: Fix setting RGB mode on some TUF laptops
    8135100ab935 platform/x86: think-lmi: Use kfree_sensitive instead of kfree
    19e0e540f0ab platform/x86/intel/hid: Add HP Dragonfly G2 to VGBS DMI quirks
    467af1faf4d3 platform/x86: intel: hid: Always call BTNL ACPI method
    d7e80cf43c1a ALSA: usb-audio: Add quirk for Microsoft Modern Wireless Headset
    c6f45378c5e0 ASoC: atmel: Fix the 8K sample parameter in I2SC master
    ff4f04493403 ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0
    731f7f17a835 ASoC: rt711: fix for JD event handling in ClockStop Mode0
    57f727c53464 ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0
    06577fbf5338 ASoc: codecs: ES8316: Fix DMIC config
    76f9c89b61ae ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
    23b0014df6d1 cifs: fix charset issue in reconnection
    e26c5d7d7e7b fs/nls: make load_nls() take a const parameter
    10860d01819f s390/dasd: fix hanging device after request requeue
    0db529ff48aa s390/dasd: use correct number of retries for ERP requests
    2f8cd099c13a m68k: Fix invalid .section syntax
    570cfb82ed1a ethernet: atheros: fix return value check in atl1c_tso_csum()
    ec2e3eb1449c net: hns3: add tm flush when setting tm
    ba98d42dd3d3 thermal: core: constify params in thermal_zone_device_register
    95992abd2b7e ASoC: nau8821: Add DMI quirk mechanism for active-high jack-detect
    b306ec1c8997 ASoC: da7219: Check for failure reading AAD IRQ events
    d87d275ee583 ASoC: da7219: Flush pending AAD IRQ when suspending
    aa669ef229ae ksmbd: fix out of bounds in init_smb2_rsp_hdr()
    fc571afdbf28 ksmbd: no response from compound read
    4c2b350b2e26 ksmbd: validate session id and tree id in compound request
    af4ea4a6842e ksmbd: fix out of bounds in smb3_decrypt_req()
    18a75e28c4e4 9p: virtio: make sure 'offs' is initialized in zc_request
    00d31fe4bf05 9p: virtio: fix unlikely null pointer deref in handle_rerror
    15559ac9d19f media: pci: cx23885: fix error handling for cx23885 ATSC boards
    c42d815cc909 media: pulse8-cec: handle possible ping error
    2c4f2254aa1e media: imx-jpeg: Support to assign slot for encoder/decoder
    7b6ac5ffc0d2 media: amphion: use dev_err_probe
    549ced0c2da6 phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
    acc8bd59e3f0 ksmbd: Fix unsigned expression compared with zero
    3eec4e2ef2f0 Partially revert "drm/amd/display: Fix possible underflow for displays with large vblank"
    e94f8f9e82eb Revert "bridge: Add extack warning when enabling STP in netns."

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.4.inc               | 36 +++++++++++++++----
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++--------
 4 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
index fa3a4aed44..8e5609436f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-08 09:02:15.787032 for version 6.4.15
+# Generated at 2023-09-14 13:53:23.744347+00:00 for version 6.4.16
 
 python check_kernel_cve_status_version() {
-    this_version = "6.4.15"
+    this_version = "6.4.16"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4518,9 +4518,9 @@ CVE_STATUS[CVE-2022-4382] = "fixed-version: Fixed from version 6.2rc5"
 
 CVE_STATUS[CVE-2022-43945] = "fixed-version: Fixed from version 6.1rc1"
 
-# CVE-2022-44032 has no known resolution
+CVE_STATUS[CVE-2022-44032] = "fixed-version: Fixed from version 6.4rc1"
 
-# CVE-2022-44033 has no known resolution
+CVE_STATUS[CVE-2022-44033] = "fixed-version: Fixed from version 6.4rc1"
 
 # CVE-2022-44034 has no known resolution
 
@@ -4532,13 +4532,13 @@ CVE_STATUS[CVE-2022-45869] = "fixed-version: Fixed from version 6.1rc7"
 
 # CVE-2022-45885 has no known resolution
 
-# CVE-2022-45886 has no known resolution
+CVE_STATUS[CVE-2022-45886] = "fixed-version: Fixed from version 6.4rc3"
 
-# CVE-2022-45887 has no known resolution
+CVE_STATUS[CVE-2022-45887] = "fixed-version: Fixed from version 6.4rc3"
 
 CVE_STATUS[CVE-2022-45888] = "fixed-version: Fixed from version 6.2rc1"
 
-# CVE-2022-45919 has no known resolution
+CVE_STATUS[CVE-2022-45919] = "fixed-version: Fixed from version 6.4rc3"
 
 CVE_STATUS[CVE-2022-45934] = "fixed-version: Fixed from version 6.1"
 
@@ -4794,6 +4794,8 @@ CVE_STATUS[CVE-2023-25012] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
 
+# CVE-2023-25775 has no known resolution
+
 CVE_STATUS[CVE-2023-2598] = "fixed-version: Fixed from version 6.4rc1"
 
 # CVE-2023-26242 has no known resolution
@@ -4972,6 +4974,8 @@ CVE_STATUS[CVE-2023-3773] = "cpe-stable-backport: Backported in 6.4.12"
 
 CVE_STATUS[CVE-2023-3776] = "cpe-stable-backport: Backported in 6.4.5"
 
+CVE_STATUS[CVE-2023-3777] = "cpe-stable-backport: Backported in 6.4.7"
+
 CVE_STATUS[CVE-2023-3812] = "fixed-version: Fixed from version 6.1rc4"
 
 CVE_STATUS[CVE-2023-38409] = "fixed-version: Fixed from version 6.3rc7"
@@ -4996,6 +5000,8 @@ CVE_STATUS[CVE-2023-4004] = "cpe-stable-backport: Backported in 6.4.7"
 
 # CVE-2023-4010 has no known resolution
 
+CVE_STATUS[CVE-2023-4015] = "cpe-stable-backport: Backported in 6.4.8"
+
 CVE_STATUS[CVE-2023-40283] = "cpe-stable-backport: Backported in 6.4.10"
 
 CVE_STATUS[CVE-2023-4128] = "cpe-stable-backport: Backported in 6.4.10"
@@ -5012,6 +5018,12 @@ CVE_STATUS[CVE-2023-4155] = "cpe-stable-backport: Backported in 6.4.11"
 
 CVE_STATUS[CVE-2023-4194] = "cpe-stable-backport: Backported in 6.4.10"
 
+CVE_STATUS[CVE-2023-4206] = "cpe-stable-backport: Backported in 6.4.10"
+
+CVE_STATUS[CVE-2023-4207] = "cpe-stable-backport: Backported in 6.4.10"
+
+CVE_STATUS[CVE-2023-4208] = "cpe-stable-backport: Backported in 6.4.10"
+
 CVE_STATUS[CVE-2023-4273] = "cpe-stable-backport: Backported in 6.4.10"
 
 CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
@@ -5024,3 +5036,13 @@ CVE_STATUS[CVE-2023-4394] = "fixed-version: Fixed from version 6.0rc3"
 
 CVE_STATUS[CVE-2023-4459] = "fixed-version: Fixed from version 5.18"
 
+CVE_STATUS[CVE-2023-4563] = "cpe-stable-backport: Backported in 6.4.11"
+
+CVE_STATUS[CVE-2023-4569] = "cpe-stable-backport: Backported in 6.4.12"
+
+CVE_STATUS[CVE-2023-4611] = "cpe-stable-backport: Backported in 6.4.8"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# CVE-2023-4623 has no known resolution
+
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 07e852d584..deb2eea73f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40f6eb23017e1bb31c63e980b6d11bc8e917824b"
-SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
+SRCREV_machine ?= "61c6d869af5ffb90ac64095eafdf8ba513eb21a6"
+SRCREV_meta ?= "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.15"
+LINUX_VERSION ?= "6.4.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 74b830afb4..c81f230139 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.15"
+LINUX_VERSION ?= "6.4.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
+SRCREV_machine ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_meta ?= "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index d17f05eba4..5afd7b1ba7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "47cff83414374714b911719ba588aa6e2816956b"
-SRCREV_machine:qemuarm64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemuloongarch64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemumips ?= "d3a6c87612629a4c1f722b7d93e9a04aec7b22a4"
-SRCREV_machine:qemuppc ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemuriscv64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemuriscv32 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemux86 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemux86-64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_machine:qemumips64 ?= "da59fe1c279b1be0b6b51dc503fe6500fdf84671"
-SRCREV_machine ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
-SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
+SRCREV_machine:qemuarm ?= "871a4762a8f85550898b8992b29d5e1dbf60a459"
+SRCREV_machine:qemuarm64 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemuloongarch64 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemumips ?= "18bb71cbb388dd093c46d1777f607cfbf0d4c03b"
+SRCREV_machine:qemuppc ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemuriscv64 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemuriscv32 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemux86 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemux86-64 ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_machine:qemumips64 ?= "5b9def2ea1065e44847b920c3a4185d0e5c22d58"
+SRCREV_machine ?= "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_meta ?= "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f60d5fd5e950c89a38578ae6f25877de511bb031"
+SRCREV_machine:class-devupstream ?= "ae4e4fc35b4258626644c162a702e2bce2b79190"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.15"
+LINUX_VERSION ?= "6.4.16"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


