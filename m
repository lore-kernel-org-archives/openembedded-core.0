Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.4352.1612322651204966304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ag/8T6l5;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id n14so11040687qvg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vRkCwBpj1yoQAQGVcVZfeJkCTuKVxcYWeGKGI9rjrmE=;
        b=ag/8T6l5o2OHUGjtE/3uAGdz6z0GySkXwOr1uKzQ2yo6Pt4ZPwWWCczXmf+rdP3AGi
         liJrmqqHTpioza6oPYvu2Z/YhQx3NoW8fx1n7rADxII1ArZk3cmbxwRsIa2Kyq/E2M88
         gk+rLStiDm71Jd8zX4+gauKcczIOwA4G94PN5Pbo7vCXPFugX3HW2aW4hw+//BWJRGQ9
         vxY5tVBFF0SmvOS5yk3BJKhKJpCWUNmIieJHjqoqywqbfD2Klki2xVLEcFzXL471zQNA
         S8uu0DkEPPu85ma3igvL0upN+tdWtItdQsPU5UEyWeoUeoE3sSjNxjVlx0G+O1XD6Q8Y
         z9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vRkCwBpj1yoQAQGVcVZfeJkCTuKVxcYWeGKGI9rjrmE=;
        b=gHDp9/h6iptg2KHcfor0sKsOJroDS7zhARXb2URCfrAsoE3YGqkw3UIY9T0W35fj8L
         HQdgsBF6wSlE6Fx23vggXh+4IbC02VcJ2/YdsfKu0Z2VU0Pn4nvxQOMn3KCjidFq9eay
         TL7wTawOfa5pYdfYDh11+AeQU6rWaXKcv6xYL/XflOwyzcHR/qvfXFVZO8sR7LoVhN6x
         YYeKEtmw1XRRqbARbUMhAb5VbAcAEGCbny2cTsqbadEU20dtNsWUl6neFy3LZZJu/aTW
         O/gmg+e4vderfwRJ5vWszBr+YVgw2bS/ywvwbLXTd4FQjdtW+Vb4zqAwA4fxEb9jwTDu
         MMZw==
X-Gm-Message-State: AOAM5320s6KBanP/0HzL/nEOjL/uysw0T4g5nEUGWyxr9Eeepxo9mx/Z
	I8rBh7Y+AxEKvE3SCmDarjs=
X-Google-Smtp-Source: ABdhPJyvaEA5finYlX0drQj6WpEBe7tnkxbKA1U3y80RfNinVDYCwpYThw92htcBK7KGR3W+BuyCtg==
X-Received: by 2002:a0c:c688:: with SMTP id d8mr1268937qvj.8.1612322650153;
        Tue, 02 Feb 2021 19:24:10 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:09 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.10: update to v5.10.8
Date: Tue,  2 Feb 2021 22:23:59 -0500
Message-Id: <1f0e8f9c3aaed469b2cb117fb048f5fd160a6aa2.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    7a1519a74f3d Linux 5.10.8
    b77681d400f4 tools headers UAPI: Sync linux/fscrypt.h with the kernel sources
    27c6968cfb76 drm/panfrost: Remove unused variables in panfrost_job_close()
    75e5e51acf59 regmap: debugfs: Fix a reversed if statement in regmap_debugfs_init()
    43f6ea41408b net: drop bogus skb with CHECKSUM_PARTIAL and offset beyond end of trimmed packet
    481097d66174 block: fix use-after-free in disk_part_iter_next
    61e8c02ae6d6 can: isotp: isotp_getname(): fix kernel information leak
    6f7a362e1c6f block/rnbd-clt: avoid module unload race with close confirmation
    be665727363f xsk: Rollback reservation at NETDEV_TX_BUSY
    9ad0375ed292 xsk: Fix race in SKB mode transmit with shared cq
    610e2c5699f8 KVM: arm64: Don't access PMCR_EL0 when no PMU is available
    c5c22948f235 selftests: fib_nexthops: Fix wrong mausezahn invocation
    e336a772cdcb net: mvneta: fix error message when MTU too large for XDP
    729319e4f177 drm/i915/dp: Track pm_qos per connector
    e7f0992529b2 net: mvpp2: disable force link UP during port init procedure
    734bd3f8256b regulator: qcom-rpmh-regulator: correct hfsmps515 definition
    ae4db0bc5cde arm64: cpufeature: remove non-exist CONFIG_KVM_ARM_HOST
    344f59a93151 wan: ds26522: select CONFIG_BITREVERSE
    c9698380b01a regmap: debugfs: Fix a memory leak when calling regmap_attach_dev
    6defee43fe54 net/mlx5e: Fix two double free cases
    699804e07641 net/mlx5e: Fix memleak in mlx5e_create_l2_table_groups
    b23accd11a89 nvme-tcp: Fix possible race of io_work and direct send
    31a3520409ff bpftool: Fix compilation failure for net.o with older glibc
    2a21faa9c596 iommu/intel: Fix memleak in intel_irq_remapping_alloc
    39b3204e54c1 iommu/vt-d: Fix misuse of ALIGN in qi_flush_piotlb()
    2bbe923d7a84 zonefs: select CONFIG_CRC32
    771865dc5a6e lightnvm: select CONFIG_CRC32
    432071f6af70 block: rsxx: select CONFIG_CRC32
    0d813da1bde0 wil6210: select CONFIG_CRC32
    e208085c82f7 phy: dp83640: select CONFIG_CRC32
    f03e2257df3c qed: select CONFIG_CRC32
    41dcfc0cb955 arm64: mm: Fix ARCH_LOW_ADDRESS_LIMIT when !CONFIG_ZONE_DMA
    d4a7eb9fbfcc dmaengine: xilinx_dma: fix mixed_enum_type coverity warning
    c16e7cfc1baf dmaengine: xilinx_dma: fix incompatible param warning in _child_probe()
    e72371fab4ea dmaengine: xilinx_dma: check dma_async_device_register return value
    41f95d84fcf5 dmaengine: milbeaut-xdmac: Fix a resource leak in the error handling path of the probe function
    ceb97fbe4816 dmaengine: mediatek: mtk-hsdma: Fix a resource leak in the error handling path of the probe function
    fcd04aa9b52c interconnect: qcom: fix rpmh link failures
    6a0e580ded88 interconnect: imx: Add a missing of_node_put after of_device_is_available
    e5689d84ebd8 bcache: set bcache device into read-only mode for BCH_FEATURE_INCOMPAT_OBSO_LARGE_BUCKET
    8f243682e5ed i2c: mediatek: Fix apdma and i2c hand-shake timeout
    d908dd5c1064 i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated
    7a30d664c949 spi: stm32: FIFO threshold level - fix align packet size
    c75a66726d7e spi: spi-geni-qcom: Fix geni_spi_isr() NULL dereference in timeout case
    932e130e3dc8 cpufreq: powernow-k8: pass policy rather than use cpufreq_cpu_get()
    a885713b0c03 spi: spi-geni-qcom: Fail new xfers if xfer/cancel/abort pending
    175465cb6d87 can: kvaser_pciefd: select CONFIG_CRC32
    9fc286ed3926 can: m_can: m_can_class_unregister(): remove erroneous m_can_clk_stop()
    9b990788d84d can: tcan4x5x: fix bittiming const, use common bittiming from m_can driver
    4abc2dbd8822 selftests/bpf: Clarify build error if no vmlinux
    e095ac6bc3ea dmaengine: dw-edma: Fix use after free in dw_edma_alloc_chunk()
    75dfd242b46a i2c: sprd: use a specific timeout to avoid system hang up issue
    0a27398d8969 ARM: OMAP2+: omap_device: fix idling of devices during probe
    797335659e58 fanotify: Fix sys_fanotify_mark() on native x86-32
    797c128d3c7d HID: wacom: Fix memory leakage caused by kfifo_alloc
    bca9046c36d3 ionic: start queues before announcing link up
    6aebfdacad97 scsi: lpfc: Fix variable 'vport' set but not used in lpfc_sli4_abts_err_handler()
    8543acf02563 net/mlx5: Check if lag is supported before creating one
    1e5b0a2300bb net/mlx5e: In skb build skip setting mark in switchdev mode
    dd7cce96dd37 net/mlx5e: ethtool, Fix restriction of autoneg with 56G
    39e86d3ca489 net/mlx5: Use port_num 1 instead of 0 when delete a RoCE address
    d6d3f9de7a06 net: dsa: lantiq_gswip: Exclude RMII from modes that report 1 GbE
    af9b4ab6ee6d s390/qeth: fix L2 header access in qeth_l3_osa_features_check()
    af0c184ea106 s390/qeth: fix locking for discipline setup / removal
    1214d69a2bfc s390/qeth: fix deadlock during recovery
    5fb8a3116cd0 nexthop: Bounce NHA_GATEWAY in FDB nexthop groups
    eaa7a6c39d10 nexthop: Unlink nexthop group entry in error path
    6486bc0a3400 nexthop: Fix off-by-one error in error path
    2e7635299fbf octeontx2-af: fix memory leak of lmac and lmac->name
    ab8e7a1af3f2 chtls: Fix chtls resources release sequence
    23e696e2f382 chtls: Added a check to avoid NULL pointer dereference
    5a1af38e06b6 chtls: Replace skb_dequeue with skb_peek
    d9297487df15 chtls: Avoid unnecessary freeing of oreq pointer
    523cea39aab2 chtls: Fix panic when route to peer not configured
    2702758d42a4 chtls: Remove invalid set_tcb call
    694635a7b8cb chtls: Fix hardware tid leak
    b0ff6d00edac net: ip: always refragment ip defragmented packets
    d5fc41ebe260 net: fix pmtu check in nopmtudisc mode
    541c22aad368 tools: selftests: add test for changing routes with PTMU exceptions
    69363e37d470 net: ipv6: fib: flush exceptions when purging route
    6d233d9501af ptp: ptp_ines: prevent build when HAS_IOMEM is not set
    210b9cdb3d5b net: bareudp: add missing error handling for bareudp_link_config()
    2a432be9ba44 net/sonic: Fix some resource leaks in error handling paths
    9591f32a630f net: vlan: avoid leaks on register_vlan_dev() failures
    60de77165d0b net: stmmac: dwmac-sun8i: Balance syscon (de)initialization
    35526a9c46b4 net: stmmac: dwmac-sun8i: Balance internal PHY power
    22e1ed2abc66 net: stmmac: dwmac-sun8i: Balance internal PHY resource references
    413a79ccb98e net: stmmac: dwmac-sun8i: Fix probe error handling
    8d12c062ca99 net: hns3: fix a phy loopback fail issue
    ed59d391ee5e net: hns3: fix the number of queues actually used by ARQ
    799d8080f903 net: hns3: fix incorrect handling of sctp6 rss tuple
    b044a949a5c5 net: cdc_ncm: correct overhead in delayed_ndp_size
    e3b5252b5cdb btrfs: shrink delalloc pages instead of full inodes
    17243f73ad74 btrfs: fix deadlock when cloning inline extent and low on free metadata space
    87738164592f btrfs: skip unnecessary searches for xattrs when logging an inode
    e28ace868c1e scsi: ufs: Fix -Wsometimes-uninitialized warning
    458b40598dc0 io_uring: Fix return value from alloc_fixed_file_ref_node
    51495b719515 drm/panfrost: Don't corrupt the queue mutex on open/close
    9d7751a39a19 iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
    85bbe2e64ab4 RDMA/hns: Avoid filling sl in high 3 bits of vlan_id
    85e25e2370a2 io_uring: patch up IOPOLL overflow_flush sync
    bc924dd21ecf io_uring: limit {io|sq}poll submit locking scope
    1d5e50da5cc7 io_uring: synchronise IOPOLL on task_submit fail
    bca9ca5a603f powerpc/32s: Fix RTAS machine check with VMAP stack
    659361086d8b Linux 5.10.7
    6f1e88527c18 scsi: target: Fix XCOPY NAA identifier lookup
    513729aecb53 rtlwifi: rise completion at the last step of firmware callback
    0fae7d269ef7 xsk: Fix memory leak for failed bind
    563135ec664f KVM: x86: fix shift out of bounds reported by UBSAN
    02ccda90ef7e x86/mtrr: Correct the range check before performing MTRR type lookups
    6e3c67976eda dmaengine: idxd: off by one in cleanup code
    8b109f4cd1dc netfilter: nft_dynset: report EOPNOTSUPP on missing set feature
    810bc977f8a4 netfilter: xt_RATEEST: reject non-null terminated string from userspace
    d17f2ccf6f99 netfilter: ipset: fix shift-out-of-bounds in htable_bits()
    27bc60d9678a netfilter: x_tables: Update remaining dereference to RCU
    56429ddfd59c ARM: dts: OMAP3: disable AES on N950/N9
    00a6b090d5c9 net/mlx5e: Fix SWP offsets when vlan inserted by driver
    a3601005de8f bcache: introduce BCH_FEATURE_INCOMPAT_LOG_LARGE_BUCKET_SIZE for large bucket
    a9c413cd0cdf bcache: check unsupported feature sets for bcache register
    fbb23cd18755 bcache: fix typo from SUUP to SUPP in features.h
    36d366ace154 drm/i915: clear the gpu reloc batch
    13738d7d5a24 drm/i915: clear the shadow batch
    1cd7e30a6db6 arm64: link with -z norelro for LLD or aarch64-elf
    a19dae4254c4 dmabuf: fix use-after-free of dmabuf's file->f_inode
    6844bc38c9fe Revert "device property: Keep secondary firmware node secondary by type"
    5e84c99055eb btrfs: send: fix wrong file path when there is an inode with a pending rmdir
    1888e5df8449 btrfs: qgroup: don't try to wait flushing if we're already holding a transaction
    1c31964eca13 iommu/vt-d: Move intel_iommu info from struct intel_svm to struct intel_svm_dev
    a07c54917aad ALSA: hda/realtek: Add two "Intel Reference board" SSID in the ALC256.
    41af04d3037a ALSA: hda/realtek: Enable mute and micmute LED on HP EliteBook 850 G7
    3e1bcaebe8b1 ALSA: hda/realtek: Add mute LED quirk for more HP laptops
    582de98b59fd ALSA: hda/realtek - Fix speaker volume control on Lenovo C940
    2eda063db992 ALSA: hda/conexant: add a new hda codec CX11970
    c03f37d52934 ALSA: hda/via: Fix runtime PM for Clevo W35xSS
    cafc6e70a63c blk-iocost: fix NULL iocg deref from racing against initialization
    397e352ca96f x86/resctrl: Don't move a task to the same resource group
    34e4ae4dca72 x86/resctrl: Use an IPI instead of task_work_add() to update PQR_ASSOC MSR
    c3cf9ffe8d9c KVM: x86/mmu: Ensure TDP MMU roots are freed after yield
    ffee6772c489 kvm: check tlbs_dirty directly
    f4064ef40c5c KVM: x86/mmu: Get root level from walkers when retrieving MMIO SPTE
    afd621673f03 KVM: x86/mmu: Use -1 to flag an undefined spte in get_mmio_spte()
    23220e87c91f x86/mm: Fix leak of pmd ptlock
    876195e1c8c6 mm: make wait_on_page_writeback() wait for multiple pending writebacks
    96e6724310f2 hwmon: (amd_energy) fix allocation of hwmon_channel_info config
    3f47b182241f USB: serial: keyspan_pda: remove unused variable
    a4b202cba3ab usb: gadget: configfs: Fix use-after-free issue with udc_name
    ed57b762f51b usb: gadget: configfs: Preserve function ordering after bind failure
    8ca9626a819c usb: gadget: Fix spinlock lockup on usb_function_deactivate
    c92e6831dc90 USB: gadget: legacy: fix return error code in acm_ms_bind()
    9cc6bf99c64d usb: gadget: u_ether: Fix MTU size mismatch with RX packet size
    e698e1478be7 usb: gadget: function: printer: Fix a memory leak for interface descriptor
    c4aa893e2e0d usb: gadget: f_uac2: reset wMaxPacketSize
    e7f2c25aa88e USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug
    2cd6988fbfa5 usb: gadget: select CONFIG_CRC32
    88eaa6c077f8 ALSA: usb-audio: Fix UBSAN warnings for MIDI jacks
    0a5b28c99dc4 USB: usblp: fix DMA to stack
    4f7e97ffb4eb USB: yurex: fix control-URB timeout handling
    008689576a4e USB: serial: option: add Quectel EM160R-GL
    3013ff766dad USB: serial: option: add LongSung M5710 module support
    5410726d7def USB: serial: iuu_phoenix: fix DMA from stack
    677503c72765 usb: uas: Add PNY USB Portable SSD to unusual_uas
    91a6375b1836 usb: usbip: vhci_hcd: protect shift size
    cee536f1a5c7 USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set
    4485bdb99624 usb: chipidea: ci_hdrc_imx: add missing put_device() call in usbmisc_get_init_data()
    150a9c163c3d usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression
    97abe6663fa3 usb: dwc3: ulpi: Replace CPU-based busyloop with Protocol-based one
    b51963e9f562 usb: dwc3: ulpi: Use VStsDone to detect PHY regs access completion
    8907a10c8ffa usb: dwc3: gadget: Clear wait flag on dequeue
    dd8363fbca50 usb: dwc3: gadget: Restart DWC3 gadget when enabling pullup
    906b0510dde5 usb: dwc3: meson-g12a: disable clk on error handling path in probe
    5a5ce1e75c77 usb: typec: intel_pmc_mux: Configure HPD first for HPD+IRQ request
    340db7c0a6c0 USB: cdc-wdm: Fix use after free in service_outstanding_interrupt().
    1452fefc4c29 USB: cdc-acm: blacklist another IR Droid device
    b55debd08b8f usb: gadget: enable super speed plus
    22f56c63d50e staging: mt7621-dma: Fix a resource leak in an error handling path
    b8c9bb139331 Staging: comedi: Return -EFAULT if copy_to_user() fails
    cb5a170e979e powerpc: Handle .text.{hot,unlikely}.* in linker script
    80a364421c95 crypto: asym_tpm: correct zero out potential secrets
    3f20005ab271 crypto: ecdh - avoid buffer overflow in ecdh_set_secret()
    d55d15a332ec scsi: block: Do not accept any requests while suspended
    782c9ef2ac05 scsi: block: Remove RQF_PREEMPT and BLK_MQ_REQ_PREEMPT
    faa613d033f3 Bluetooth: revert: hci_h5: close serdev device and free hu in h5_close
    3ca425885bb7 kbuild: don't hardcode depmod path
    e5383432d92c scsi: ufs: Clear UAC for FFU and RPMB LUNs
    43dee885bead depmod: handle the case of /sbin/depmod without /sbin in PATH
    8532d3ec57e5 lib/genalloc: fix the overflow when size is too big
    2179bae04b12 local64.h: make <asm/local64.h> mandatory
    271822bbf9fe scsi: core: Only process PM requests if rpm_status != RPM_ACTIVE
    a97d55de10aa scsi: scsi_transport_spi: Set RQF_PM for domain validation commands
    60fb6a8d782b scsi: ide: Mark power management requests with RQF_PM instead of RQF_PREEMPT
    2d8b9f991de7 scsi: ide: Do not set the RQF_PREEMPT flag for sense requests
    8ed46b329d4e scsi: block: Introduce BLK_MQ_REQ_PM
    4bdd912c724e scsi: ufs-pci: Enable UFSHCD_CAP_RPM_AUTOSUSPEND for Intel controllers
    3a1be8e3806e scsi: ufs-pci: Fix recovery from hibernate exit errors for Intel controllers
    46e435583610 scsi: ufs-pci: Ensure UFS device is in PowerDown mode for suspend-to-disk ->poweroff()
    20e1aec964ea scsi: ufs-pci: Fix restore from S4 for Intel controllers
    42b464fb10ff scsi: ufs: Fix wrong print message in dev_err()
    dfec7dc891d7 workqueue: Kick a worker based on the actual activation of delayed works
    bfb39e6d67a5 block: add debugfs stanza for QUEUE_FLAG_NOWAIT
    2dc3447a043b selftests/vm: fix building protection keys test
    952264ac96ef stmmac: intel: Add PCI IDs for TGL-H platform
    22c0b151bca4 selftests: mlxsw: Set headroom size of correct port
    7b81c2f8ad8f net: usb: qmi_wwan: add Quectel EM160R-GL
    063608092aa5 ibmvnic: fix: NULL pointer dereference.
    57dde18a1e60 CDC-NCM: remove "connected" log message
    143143feae03 net: dsa: lantiq_gswip: Fix GSWIP_MII_CFG(p) register access
    495442144c74 net: dsa: lantiq_gswip: Enable GSWIP_MII_CFG_EN also for internal PHYs
    f62153027b9a r8169: work around power-saving bug on some chip versions
    0ad31889c481 vhost_net: fix ubuf refcount incorrectly when sendmsg fails
    cf78c32ac7eb bareudp: Fix use of incorrect min_headroom size
    cfcd702d038e bareudp: set NETIF_F_LLTX flag
    8ca1d23e6ad3 net: hdlc_ppp: Fix issues when mod_timer is called while timer is running
    0d6eeee3b9d4 erspan: fix version 1 check in gre_parse_header()
    cd63471a4184 net: hns: fix return value check in __lb_other_process()
    7a20969b874e net: sched: prevent invalid Scell_log shift count
    5e87eabce7bc ipv4: Ignore ECN bits for fib lookups in fib_compute_spec_dst()
    042c7f35fa61 bnxt_en: Fix AER recovery.
    cdb02a7a9e8d net: mvpp2: fix pkt coalescing int-threshold configuration
    9b350728118e bnxt_en: Check TQM rings for maximum supported value.
    7c0681c2b681 e1000e: Export S0ix flags to ethtool
    d0cd009b052e Revert "e1000e: disable s0ix entry and exit flows for ME systems"
    4e7176129f4f e1000e: bump up timeout to wait when ME un-configures ULP mode
    35a44ba54587 e1000e: Only run S0ix flows if shutdown succeeded
    e3cbce80be89 tun: fix return value when the number of iovs exceeds MAX_SKB_FRAGS
    44dc29d44b84 net: ethernet: ti: cpts: fix ethtool output when no ptp_clock registered
    e4535dbb721d net-sysfs: take the rtnl lock when accessing xps_rxqs_map and num_tc
    90297553d870 net-sysfs: take the rtnl lock when storing xps_rxqs
    0ca897c1ec41 net-sysfs: take the rtnl lock when accessing xps_cpus_map and num_tc
    4da25d83b7cc net-sysfs: take the rtnl lock when storing xps_cpus
    7eab4e69cb01 net: ethernet: Fix memleak in ethoc_probe
    2cdf8c2747d3 net/ncsi: Use real net-device for response handler
    23f8bea3e9d9 virtio_net: Fix recursive call to cpus_read_lock()
    087cfc73598a qede: fix offload for IPIP tunnel packets
    c7d068a2d711 net: ethernet: mvneta: Fix error handling in mvneta_probe
    933b2ba7f9de ibmvnic: continue fatal error reset after passive init
    0583c8ed2d30 ibmvnic: fix login buffer memory leak
    cad75a6bdba6 net: stmmac: dwmac-meson8b: ignore the second clock input
    04f241fc7eb3 net: mvpp2: Fix GoP port 3 Networking Complex Control configurations
    8ece401fa3d6 atm: idt77252: call pci_disable_device() on error path
    0e2dee9a6b26 ionic: account for vlan tag len in rx buffer len
    15741c05a889 ethernet: ucc_geth: set dev->max_mtu to 1518
    116395a26d95 ethernet: ucc_geth: fix use-after-free in ucc_geth_remove()
    ca126e9e0345 net: systemport: set dev->max_mtu to UMAC_MAX_MTU_SIZE
    cf65734dee5f net: mvpp2: prs: fix PPPoE with ipv6 packet parse
    121164dc3314 net: mvpp2: Add TCAM entry to drop flow control pause frames
    db8895aa58c7 net/sched: sch_taprio: ensure to reset/destroy all child qdiscs
    e2572423ab92 iavf: fix double-release of rtnl_lock
    d9dea80af65e i40e: Fix Error I40E_AQ_RC_EINVAL when removing VFs
    5650152ddab1 Linux 5.10.6
    94cc73b27a25 mwifiex: Fix possible buffer overflows in mwifiex_cmd_802_11_ad_hoc_start
    ab7709b551de exec: Transform exec_update_mutex into a rw_semaphore
    933b7cc86068 rwsem: Implement down_read_interruptible
    27bae39e4fc4 rwsem: Implement down_read_killable_nested
    2cded5a3cc38 perf: Break deadlock involving exec_update_mutex
    36cf9ae54b0e fuse: fix bad inode
    e522a788eb91 RDMA/siw,rxe: Make emulated devices virtual in the device tree
    404fa093741e RDMA/core: remove use of dma_virt_ops
    2a54ad3066a8 scsi: ufs: Re-enable WriteBooster after device reset
    acbf7db67ae3 scsi: ufs: Allow an error return value from ->device_reset()
    8cba90399216 drm/i915/tgl: Fix Combo PHY DPLL fractional divider for 38.4MHz ref clock
    adee1c5126ef ALSA: hda/hdmi: Fix incorrect mutex unlock in silent_stream_disable()
    e235fd076eb7 ALSA: hda/realtek - Modify Dell platform name
    ce9163cf7a84 Bluetooth: Fix attempting to set RPA timeout when unsupported
    3e073508920a kdev_t: always inline major/minor helper functions
    fd3ec3b25137 dt-bindings: rtc: add reset-source property
    757cd94ac859 rtc: pcf2127: only use watchdog when explicitly available
    acb821425c8c rtc: pcf2127: move watchdog initialisation to a separate function
    b00195241186 Revert "mtd: spinand: Fix OOB read"
    261f4d03ad23 Revert "drm/amd/display: Fix memory leaks in S3 resume"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f3aae2b0c7..c3c3325c5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "82503751a7af71b460e6a605641cff377332c058"
-SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
+SRCREV_machine ?= "9c3ab79db8ac20dac05125ef6e2a5f50ed7ebacf"
+SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.5"
+LINUX_VERSION ?= "5.10.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 56fd7a966e..31a1a99809 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.5"
+LINUX_VERSION ?= "5.10.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e3cf3a0ff5a5e85395d8cf2aeab350ac518679c6"
-SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
+SRCREV_machine_qemuarm ?= "84386300e289d626241b4dd253196699288db769"
+SRCREV_machine ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 7e570b04f5..45f45df4e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f31d1514bbe9d450b69e3101e260524b82e8626d"
-SRCREV_machine_qemuarm64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_machine_qemumips ?= "1e1e4a362640c2f385c2b093c5971ec7d9a0b238"
-SRCREV_machine_qemuppc ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_machine_qemuriscv64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_machine_qemux86 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_machine_qemux86-64 ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_machine_qemumips64 ?= "a019b338648b95aa4d679ffdc01878dc660bcbac"
-SRCREV_machine ?= "f08df324ccdbc73b9f0c2de2826a2843bcdf651b"
-SRCREV_meta ?= "47c7a3148a4d7653cec536ba202b25148d1952ad"
+SRCREV_machine_qemuarm ?= "21e6c0998375e9fed976dcdf7888960b953d7408"
+SRCREV_machine_qemuarm64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_machine_qemumips ?= "e55d1b83ee3f796e09f1c6ad919133bc3965f753"
+SRCREV_machine_qemuppc ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_machine_qemuriscv64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_machine_qemux86 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_machine_qemux86-64 ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_machine_qemumips64 ?= "8db40baaaa30740a7e6d9bd696756daae0b29d1f"
+SRCREV_machine ?= "5c976adca80cb509bac5b71052b310b0a76c58f6"
+SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.5"
+LINUX_VERSION ?= "5.10.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

