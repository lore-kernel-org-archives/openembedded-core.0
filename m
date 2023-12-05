Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4EFC46CA0
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:43:07 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.92316.1701751381306565471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PWHPrStE;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-77d84f8808dso344214885a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701751380; x=1702356180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hifpFsEofUJ4tSm2Iyip3z/poqVeME4Y7HRpFnooW04=;
        b=PWHPrStEG1HFDT6FJS2d5T1ls5CqbVecvIrg292aVJWXEe4CcAqsiomeHxmMq4rThc
         y8EPDSnHxEMs/m2cGqavacMntjVDBrnB8RlH6PHoxw0g0y2qTuWU1twt+LrJZ7DloIyj
         2lHunzl1obVnNno/gtcdDr8g+HyeTGbAyfHIxguajSxY2VGi2y39Hkx0Js9z4OqDQ0df
         uJGthp3eGaWTKbJao7ZHvEsmcD//cr/At4gxdpbg8A3C/aN9I1CKsn3WX9ereaRW2kd2
         RhNoBSJ5X2FzMQYo1v7VLdLrEcHen2pB3xqAWuJsY46SDT2ToKDm+d1QN6qRpSFMcGAC
         oliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701751380; x=1702356180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hifpFsEofUJ4tSm2Iyip3z/poqVeME4Y7HRpFnooW04=;
        b=QhvMvYMUz2kYQXAEWQIU+rZIe3awy7yy74gfBTXjq0hhnUSMrU4RlwlLSntjSQmKSn
         8WrpNTECDFkX4RhBTlvT+mDSgrVMkdV8oir4/QtXak+2+aSfAhufKT9u9rvkKrrzAbtE
         3bAWBBpjRGpV0MxdznVL/ARrl4VsjG2872HZ1CQfMi9b16N2MVp1k9I3xsBCt8IXWK6+
         eySlwyBtpX8ug+rhxAjs/O7Dgi+7Bh0uFno+tpjbz/FMums2YxlQomr85pmlpkJAxg/r
         tADoZZgSE4eFJqvRZ5QntbUHrDgLA2sBR5a6P43fFGPMi0D9aG4FDphnaC8FJZ/6+Foy
         WPfQ==
X-Gm-Message-State: AOJu0Yw2rDmHozr30HflgVyLhI8jg/LCxpU7/k1wmTuru/UO1kHGMtbn
	K7BvqHhFf3xap4RCFFQn2/hwpN64u3U=
X-Google-Smtp-Source: AGHT+IHYfysWrKtkx+A3bLL2U4AVFSiiYQSGESpgOMg0XuDfUoJ0H3u65ov7b35437kLD1yxkkZRQg==
X-Received: by 2002:a05:620a:1190:b0:77e:fba3:9381 with SMTP id b16-20020a05620a119000b0077efba39381mr696349qkk.99.1701751380192;
        Mon, 04 Dec 2023 20:43:00 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a27c800b0077d73fde842sm4766267qkp.56.2023.12.04.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:42:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] linux-yocto/5.4: update to v5.4.260
Date: Mon,  4 Dec 2023 23:42:56 -0500
Message-Id: <20231205044257.4163850-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205044257.4163850-1-bruce.ashfield@gmail.com>
References: <20231205044257.4163850-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191791

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    87e8e7a7aa1f Linux 5.4.260
    8b0ecf2167a0 tty: 8250: Add support for Intashield IS-100
    6dd5561b2385 tty: 8250: Add support for Brainboxes UP cards
    03145e0ff8ab tty: 8250: Add support for additional Brainboxes UC cards
    5a6471372f9b tty: 8250: Remove UC-257 and UC-431
    72f236b57f1c usb: storage: set 1.50 as the lower bcdDevice for older "Super Top" compatibility
    792a91fcd20d PCI: Prevent xHCI driver from claiming AMD VanGogh USB3 DRD device
    4b865e0d78a0 Revert "ARM: dts: Move am33xx and am43xx mmc nodes to sdhci-omap driver"
    4e53bab11f01 nvmet-tcp: Fix a possible UAF in queue intialization setup
    2c9415ec8ea9 nvmet-tcp: move send/recv error handling in the send/recv methods instead of call-sites
    784ef618b2cc remove the sx8 block driver
    a31f8222a74c ata: ahci: fix enum constants for gcc-13
    cc1afa62e231 net: chelsio: cxgb4: add an error code check in t4_load_phy_fw
    7e429d1f3994 platform/mellanox: mlxbf-tmfifo: Fix a warning message
    5f4f58eac361 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
    88d1aa03eb16 scsi: mpt3sas: Fix in error path
    b1f62e3ef90c fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()
    fb02de64791c ASoC: rt5650: fix the wrong result of key button
    b6c09ff5eada netfilter: nfnetlink_log: silence bogus compiler warning
    6c23b6d308af spi: npcm-fiu: Fix UMA reads when dummy.nbytes == 0
    788b308340ef fbdev: atyfb: only use ioremap_uc() on i386 and ia64
    848b9c688865 Input: synaptics-rmi4 - handle reset delay when using SMBus trsnsport
    a0bf183db438 dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe
    39ae053abbad irqchip/stm32-exti: add missing DT IRQ flag translation
    fbcd05a0dbda Input: i8042 - add Fujitsu Lifebook E5411 to i8042 quirk table
    cda248f16924 x86: Fix .brk attribute in linker script
    01e6885b75e2 rpmsg: Fix possible refcount leak in rpmsg_register_device_override()
    cff56d7a9274 rpmsg: glink: Release driver_override
    3d1478598057 rpmsg: Fix calling device_lock() on non-initialized device
    e70898ae1a42 rpmsg: Fix kfree() of static memory on setting driver_override
    0df5d801359e rpmsg: Constify local variable in field store macro
    063444d66f90 driver: platform: Add helper for safer setting of driver_override
    83ecffd40c65 ext4: fix BUG in ext4_mb_new_inode_pa() due to overflow
    66cfd4cf6ac8 ext4: avoid overlapping preallocations due to overflow
    1e0a5dec2638 ext4: add two helper functions extent_logical_end() and pa_logical_end()
    c2102ac1033f x86/mm: Fix RESERVE_BRK() for older binutils
    ced79d864bfd x86/mm: Simplify RESERVE_BRK()
    5fc242c11804 nfsd: lock_rename() needs both directories to live on the same fs
    e9a988cd4c8b f2fs: fix to do sanity check on inode type during garbage collection
    750de03de7e1 smbdirect: missing rc checks while waiting for rdma events
    5776aeee2a60 kobject: Fix slab-out-of-bounds in fill_kobj_path()
    0a45e0e5dd8d arm64: fix a concurrency issue in emulation_proc_handler()
    6ba2ffe3cb1c drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()
    9d29933f36e1 x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility
    1ed21b207ece i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
    f48670c3b089 clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
    511f3e9bbb0a perf/core: Fix potential NULL deref
    8de78231cba9 nvmem: imx: correct nregs for i.MX6UL
    0b2c3a8601cc nvmem: imx: correct nregs for i.MX6SLL
    6063678df7fa nvmem: imx: correct nregs for i.MX6ULL
    12337d3e8819 i2c: aspeed: Fix i2c bus hang in slave read
    e3d8ef87a9b1 i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
    5764f6e546a9 i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
    a3b9bcedd7ad i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
    07ec3d952a4a i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
    519ff2d9fecf iio: exynos-adc: request second interupt only when touchscreen mode is used
    2bf9fbd13635 gtp: fix fragmentation needed check with gso
    2ab1b7ad5046 gtp: uapi: fix GTPA_MAX
    54ba3b8267b0 tcp: fix wrong RTO timeout when received SACK reneging
    29cb3f81bc71 r8152: Cancel hw_phy_work if we have an error in probe
    6124d0b100bf r8152: Run the unload routine if we have errors during probe
    1d3cb4aa9388 r8152: Increase USB control msg timeout to 5000ms as per spec
    2f8da9511607 net: ieee802154: adf7242: Fix some potential buffer overflow in adf7242_stats_show()
    ec885679fa9a igc: Fix ambiguity in the ethtool advertising
    3b098edafefa neighbour: fix various data-races
    418ca6e63e06 igb: Fix potential memory leak in igb_add_ethtool_nfc_entry
    00ef4a7de62c treewide: Spelling fix in comment
    e44e78ff44e5 r8169: fix the KCSAN reported data race in rtl_rx while reading desc->opts1
    b9ba50fc18d7 r8169: fix the KCSAN reported data-race in rtl_tx while reading TxDescArray[entry].opts1
    a27c6bfc5287 virtio-mmio: fix memory leak of vm_dev
    8d394fcb0398 virtio_balloon: Fix endless deflation and inflation on arm64
    be84e96426ed mcb-lpc: Reallocate memory region to avoid memory overlapping
    3235094d55de mcb: Return actual parsed size when reading chameleon table
    fbe17a8be10a selftests/ftrace: Add new test case which checks non unique symbol
    4d057ca86eaa mtd: rawnand: marvell: Ensure program page operations are successful
    86ea40e6ad22 Linux 5.4.259
    c01ac092d97c xfrm6: fix inet6_dev refcount underflow problem
    b849a38e187d Bluetooth: hci_sock: Correctly bounds check and pad HCI_MON_NEW_INDEX name
    4d161e18b1c4 Bluetooth: hci_sock: fix slab oob read in create_monitor_event
    a0f0e43128f3 phy: mapphone-mdm6600: Fix pinctrl_pm handling for sleep pins
    d1618b922347 phy: mapphone-mdm6600: Fix runtime PM for remove
    4db06513a0ee phy: mapphone-mdm6600: Fix runtime disable on probe
    083ff5b50cf8 ASoC: pxa: fix a memory leak in probe()
    27a17a259005 gpio: vf610: set value before the direction to avoid a glitch
    664aad86e5e8 s390/pci: fix iommu bitmap allocation
    7252c8b98185 perf: Disallow mis-matched inherited group reads
    32279bbbd811 USB: serial: option: add Fibocom to DELL custom modem FM101R-GL
    1ff2a7fa0cc0 USB: serial: option: add entry for Sierra EM9191 with new firmware
    eb8f5e40cbe6 USB: serial: option: add Telit LE910C4-WWX 0x1035 composition
    b43a412aa1ef ACPI: irq: Fix incorrect return value in acpi_register_gsi()
    3189d2d58728 Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
    690eb3772f97 mmc: core: Capture correct oemid-bits for eMMC cards
    894b678d865b mmc: core: sdio: hold retuning if sdio in 1-bit mode
    37ae7c493a07 mtd: physmap-core: Restore map_rom fallback
    de28fa53318e mtd: spinand: micron: correct bitmask for ecc status
    bd68f5068401 mtd: rawnand: qcom: Unmap the right resource upon probe failure
    a787e07755b6 Bluetooth: hci_event: Fix using memcmp when comparing keys
    897d6aee8fb4 HID: multitouch: Add required quirk for Synaptics 0xcd7e device
    9cae05233b44 btrfs: fix some -Wmaybe-uninitialized warnings in ioctl.c
    693ecef54334 drm: panel-orientation-quirks: Add quirk for One Mix 2S
    4030effab831 sky2: Make sure there is at least one frag_addr available
    340bb4b71661 regulator/core: Revert "fix kobject release warning and memory leak in regulator_register()"
    d7604e819aa6 wifi: cfg80211: avoid leaking stack data into trace
    139234011fde wifi: mac80211: allow transmitting EAPOL frames with tainted key
    b48595f5b1c6 Bluetooth: hci_core: Fix build warnings
    16e36cde2738 Bluetooth: Avoid redundant authentication
    fa83d852e987 HID: holtek: fix slab-out-of-bounds Write in holtek_kbd_input_event
    981dfec995a6 tracing: relax trace_event_eval_update() execution with cond_resched()
    b5d9f34f38ba ata: libata-eh: Fix compilation warning in ata_eh_link_report()
    392f597eadd7 gpio: timberdale: Fix potential deadlock on &tgpio->lock
    91ae08dc3033 overlayfs: set ctime when setting mtime and atime
    01a4e9bc63b7 i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
    97cb55f41e2a btrfs: initialize start_slot in btrfs_log_prealloc_extents
    a055d9d4dd78 btrfs: return -EUCLEAN for delayed tree ref with a ref count not equals to 1
    d65dbb2aa4f3 ARM: dts: ti: omap: Fix noisy serial with overrun-throttle-ms for mapphone
    611c991b9e5f ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA
    b2d0649c8edf ACPI: resource: Skip IRQ override on ASUS ExpertBook B1502CBA
    8c0982fc4b72 ACPI: resource: Skip IRQ override on Asus Expertbook B2402CBA
    0818716a9012 ACPI: resource: Add Asus ExpertBook B2502 to Asus quirks
    c6f7b3358640 ACPI: resource: Skip IRQ override on Asus Vivobook S5602ZA
    b1f5f4720f52 ACPI: resource: Add ASUS model S5402ZA to quirks
    fdcd669371da ACPI: resource: Skip IRQ override on Asus Vivobook K3402ZA/K3502ZA
    cd202a9f88f1 ACPI: resources: Add DMI-based legacy IRQ override quirk
    26b2bc9bdcde ACPI: Drop acpi_dev_irqresource_disabled()
    583913b1a667 resource: Add irqresource_disabled()
    d6878d39b675 net: pktgen: Fix interface flags printing
    cee9ea14c8c7 netfilter: nft_set_rbtree: .deactivate fails if element has expired
    863acae0b83a neighbor: tracing: Move pin6 inside CONFIG_IPV6=y section
    f34916502d91 net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it becomes a inner curve
    b1ad377bbaf7 i40e: prevent crash on probe if hw registers have invalid values
    c813d17660f8 net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    47419f2aefb3 ipv4: fib: annotate races around nh->nh_saddr_genid and nh->nh_saddr
    00a251ea4507 tun: prevent negative ifindex
    8710dbe09e46 tcp: tsq: relax tcp_small_queue_check() when rtx queue contains a single skb
    1ae2c7d44e7e tcp: fix excessive TLP and RACK timeouts from HZ rounding
    eb1a33195a30 net: rfkill: gpio: prevent value glitch during probe
    cd44e14573c4 net: ipv6: fix return value check in esp_remove_trailer
    03b88b7d2a13 net: ipv4: fix return value check in esp_remove_trailer
    0cb7b894e47b xfrm: interface: use DEV_STATS_INC()
    bcacdf4debe5 xfrm: fix a data-race in xfrm_gen_index()
    639e979a7d15 qed: fix LL2 RX buffer allocation
    1cb76fec3ed6 netfilter: nft_payload: fix wrong mac header matching
    6b2875b52746 KVM: x86: Mask LVTPC when handling a PMI
    1d434d83136e regmap: fix NULL deref on lookup
    76050b0cc5a7 nfc: nci: fix possible NULL pointer dereference in send_acknowledge()
    80ce32ab9bee ice: fix over-shifted variable
    ec8f0d0fe6a7 Bluetooth: avoid memcmp() out of bounds warning
    1a00e3544b28 Bluetooth: hci_event: Fix coding style
    84598a339bf9 Bluetooth: vhci: Fix race when opening vhci device
    1769ac55dbf3 Bluetooth: Fix a refcnt underflow problem for hci_conn
    97ce8eca07c9 Bluetooth: Reject connection with the device which has same BD_ADDR
    6ce347833612 Bluetooth: hci_event: Ignore NULL link key
    6ad3e9fd3632 usb: hub: Guard against accesses to uninitialized BOS descriptors
    57e83c2445cd Documentation: sysctl: align cells in second content column
    947cd2fba15e dev_forward_skb: do not scrub skb mark within the same name space
    65d34cfd4e34 ravb: Fix use-after-free issue in ravb_tx_timeout_work()
    de6e271338c1 powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
    85ae11da8504 powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
    077fdae908e2 dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
    6ea15d9f7ac2 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
    e7ca00f35d8a usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call
    1e4414c3870e usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    2a433d325563 pinctrl: avoid unsafe code pattern in find_pinctrl()
    d5b11bd89377 cgroup: Remove duplicates in cgroup v1 tasks file
    1e59ebed9cf3 Input: xpad - add PXN V900 support
    8664fa7fbbbf Input: psmouse - fix fast_reconnect function for PS/2 mode
    5aa514100aaf Input: powermate - fix use-after-free in powermate_config_complete
    3cdce751b026 ceph: fix incorrect revoked caps assert in ceph_fill_file_size()
    92cd1635c685 libceph: use kernel_connect()
    5704225cdd87 mcb: remove is_added flag from mcb_device struct
    2bf6c93e17c4 iio: pressure: ms5611: ms5611_prom_is_valid false negative bug
    84af249e48c5 iio: pressure: dps310: Adjust Timeout Settings
    00cd9d9c12f4 iio: pressure: bmp280: Fix NULL pointer exception
    f4c11b2ea0f9 usb: musb: Modify the "HWVers" register address
    fc1ecea726ec usb: musb: Get the musb_qh poniter after musb_giveback
    c0fb0419c1ad usb: dwc3: Soft reset phy on probe for host
    7efac5b4c209 net: usb: dm9601: fix uninitialized variable use in dm9601_mdio_read
    57942b0763cf usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer
    e39710084664 dmaengine: stm32-mdma: abort resume if no ongoing transfer
    3345799c4f2e workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()
    95733ea130e3 nfc: nci: assert requested protocol is valid
    7adcf014bda1 net: nfc: fix races in nfc_llcp_sock_get() and nfc_llcp_sock_get_sn()
    22ca282ea00b ixgbe: fix crash with empty VF macvlan list
    0cc6c070d926 drm/vmwgfx: fix typo of sizeof argument
    80a3c0068471 xen-netback: use default TX queue size for vifs
    332587dc7fed mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
    85c2857ef900 ieee802154: ca8210: Fix a potential UAF in ca8210_probe
    daff72af3ff1 ravb: Fix up dma_free_coherent() call in ravb_remove()
    d3d2aecc1ffe drm/msm/dsi: skip the wait for video mode done if not applicable
    a0c24f802da7 drm: etvnaviv: fix bad backport leading to warning
    907a380eb3a1 net: prevent address rewrite in kernel_bind()
    061a18239ced quota: Fix slow quotaoff
    cd0e2bf7fb22 HID: logitech-hidpp: Fix kernel crash on receiver USB disconnect
    8e39b5fb834f pwm: hibvt: Explicitly set .polarity in .get_state()
    c4eff809d622 lib/test_meminit: fix off-by-one error in test_pages()
    ffdd8f56a46b RDMA/cxgb4: Check skb value for failure to allocate

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index db63b822895..92913d3ddb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5889ebdd98c208dba446c554bb4b0fadba04dde7"
-SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
+SRCREV_machine ?= "e14c8b01bbec8630c1f30e037d6e0226851369cc"
+SRCREV_meta ?= "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.258"
+LINUX_VERSION ?= "5.4.260"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index d418011bb53..f193a5990f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.258"
+LINUX_VERSION ?= "5.4.260"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "192f2b5c9064965f7b4cb56f6b779616674121e3"
-SRCREV_machine ?= "6a6a13be0a1d89370e5af25c9b8150e88dbc9c5e"
-SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
+SRCREV_machine_qemuarm ?= "7a685407c99004f8f3574c8528d6988f68477fdc"
+SRCREV_machine ?= "29ed7a00fd34f83e07e08d662009bb982f26d2af"
+SRCREV_meta ?= "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 751a5bd47f9..4affa994044 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "02d0d86cd3148f12cccb7af027fb41d41b03c726"
-SRCREV_machine_qemuarm64 ?= "5880452e43a9cf56108492a627b85196ea10190b"
-SRCREV_machine_qemumips ?= "9754f47861b4a29b4c4577ce14b7fb44c81c521e"
-SRCREV_machine_qemuppc ?= "3e5d9bf09fb23b0acefe73c644de0028dd51fe42"
-SRCREV_machine_qemuriscv64 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
-SRCREV_machine_qemux86 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
-SRCREV_machine_qemux86-64 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
-SRCREV_machine_qemumips64 ?= "98065f598767e0f92ed86f880795603df7a3a9d2"
-SRCREV_machine ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
-SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
+SRCREV_machine_qemuarm ?= "c414b2cca9023975041723ebeeae7a7a1a9169e4"
+SRCREV_machine_qemuarm64 ?= "102ea8999fae670974ae712724612b47aff915ff"
+SRCREV_machine_qemumips ?= "fe3aac3a3f5be178a8ba293c89eec0ffb845f3b6"
+SRCREV_machine_qemuppc ?= "93642912bcad365bbc9d55c6afc2253c3290063d"
+SRCREV_machine_qemuriscv64 ?= "1de97ac6497bae665acc69e6b3b15bef57229d44"
+SRCREV_machine_qemux86 ?= "1de97ac6497bae665acc69e6b3b15bef57229d44"
+SRCREV_machine_qemux86-64 ?= "1de97ac6497bae665acc69e6b3b15bef57229d44"
+SRCREV_machine_qemumips64 ?= "a9d34f8519781762993c7cc36464f632d96989c9"
+SRCREV_machine ?= "1de97ac6497bae665acc69e6b3b15bef57229d44"
+SRCREV_meta ?= "26bb76ebda0b545f3580f3c01e471f3357deb9d3"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.258"
+LINUX_VERSION ?= "5.4.260"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


