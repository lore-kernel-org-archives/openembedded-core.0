Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.24692.1588520676841668987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ws41dsCc;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id c10so3099671qka.4
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vHeTkmZEmTYp3Cri6Ig7XjBOtvYYt/s37jmXDauCFx0=;
        b=Ws41dsCc/7hKQa2RTu3BEeeK7Ls2zfijmV2YhZPO86NKGYds8BRTS/CGOBndJiUuWA
         PT6apKXGP+dmG3CoguT2tIp7tWPXq/AM73phN4SWmuEuUJDTr4LFfNgDknBdRoJezC1a
         PtxAXpIGQ3xX8XEf1KZGEP/E0glI15T9xr7MTjgne08NvYY2re0bIDB9JR4Ju1bEt5nk
         OhHuvwyPJbIo8//Bt7b2FzDKh2WpFzPwVlhD1lKNe1PH/mnuu9sHpmXjPl1K6OMVpA4p
         yt8o78xlybnqY/zsWfX/UeBDN05/ilPjRhz9F11kv0siRppbOMWGug+sD+EDF57KdxA6
         06eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vHeTkmZEmTYp3Cri6Ig7XjBOtvYYt/s37jmXDauCFx0=;
        b=f0lFJAj/6LR5aKcUZDVbZWkm4JALfzM5wBadeiGHDvq3adTDNNivVreGUgSUcP8UtM
         VB3TEV50EB19J47i+24fRAGT5j5YZVXWgSxXclGGezp3LfQMlcyipmz3MQGPaX0VwNFt
         0tW7yzNMpVJRzQ/aVKmh+PcsIElwsQSlNchNRYQN9dGsoIIdYx28KiBCLwCsB9+ND3B3
         8jw4ez53VTywC5xEERu9321t3DYbSogTfRYW0sQ6ZeYRLPUV1av8M5wnAEd4DCetezT5
         LRIdhGOXlOjjVEduDF9iSt+pY2SloZrJrN7/9WvhgLeCFqOsy+wTetEUywc+3MoYCvrB
         PPJQ==
X-Gm-Message-State: AGi0PuYa1KTWsvdsGYY4AiZBk2iWvobUl7RPjwYcEzlirII8b8Z8wnW6
	DXOXzxL2TrLy4HWgv58FT9A=
X-Google-Smtp-Source: APiQypKNZ8thc//qQogpFxqpqVCf7D4WncpsmafdQVJK0ala5EvJ+HJA0pU5p9D+VseT7zeyzJjwFA==
X-Received: by 2002:a05:620a:85d:: with SMTP id u29mr5734847qku.496.1588520675655;
        Sun, 03 May 2020 08:44:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p4sm7771506qkg.48.2020.05.03.08.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 08:44:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 2/5] linux-yocto/5.4: update to v5.4.32
Date: Sun,  3 May 2020 11:44:27 -0400
Message-Id: <9732cf165d8b4b8b1fe033ec8247fa430cb0fbfc.1588520452.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1588520452.git.bruce.ashfield@gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    bc844d58f697 Linux 5.4.32
    ad5676629a12 iommu/vt-d: Allow devices with RMRRs to use identity domain
    04ad505eed58 drm/i915: Fix ref->mutex deadlock in i915_active_wait()
    047affa0ef00 fbcon: fix null-ptr-deref in fbcon_switch
    d4083258db04 blk-mq: Keep set->nr_hw_queues and set->map[].nr_queues in sync
    d020ff5060a4 RDMA/cm: Update num_paths in cma_resolve_iboe_route error flow
    b40f1ae359f2 Bluetooth: RFCOMM: fix ODEBUG bug in rfcomm_dev_ioctl
    7f5432c2f446 RDMA/siw: Fix passive connection establishment
    09583e3f0402 RDMA/cma: Teach lockdep about the order of rtnl and lock
    51795bcf595d RDMA/ucma: Put a lock around every call to the rdma_cm layer
    ab6ee4330288 include/uapi/linux/swab.h: fix userspace breakage, use __BITS_PER_LONG for swap
    193490dbe5ba ceph: canonicalize server path in place
    56385788f7f6 ceph: remove the extra slashes in the server path
    7dafb2c6fb46 ARM: imx: only select ARM_ERRATA_814220 for ARMv7-A
    cf7005662673 ARM: imx: Enable ARM_ERRATA_814220 for i.MX6UL and i.MX7D
    4ac80b02f10d IB/mlx5: Replace tunnel mpls capability bits for tunnel_offloads
    ccc2b645de20 IB/hfi1: Fix memory leaks in sysfs registration and unregistration
    cd38d8b231f1 IB/hfi1: Call kobject_put() when kobject_init_and_add() fails
    9351dee1cc24 ASoC: jz4740-i2s: Fix divider written at incorrect offset in register
    e30a21c6fea5 platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()
    9da847d65f37 ACPI: PM: Add acpi_[un]register_wakeup_handler()
    41a0cfa05c05 hwrng: imx-rngc - fix an error path
    dfa210cf9f94 tools/accounting/getdelays.c: fix netlink attribute length
    ea84a26ab633 slub: improve bit diffusion for freelist ptr obfuscation
    8b0f08036659 uapi: rename ext2_swab() to swab() and share globally in swab.h
    94d2d84bcafa usb: dwc3: gadget: Wrap around when skip TRBs
    170f88a47b9f random: always use batched entropy for get_random_u{32,64}
    5e331978200e s390: prevent leaking kernel address in BEAR
    74107d56d1e8 r8169: change back SG and TSO to be disabled by default
    5249653d971d mlxsw: spectrum_flower: Do not stop at FLOW_ACTION_VLAN_MANGLE
    671331c11c39 tun: Don't put_page() for all negative return values from XDP program
    fdb6a094ba41 slcan: Don't transmit uninitialized stack data in padding
    feed32e3d6fe net: stmmac: dwmac1000: fix out-of-bounds mac address reg setting
    049b9fa3ef65 net_sched: fix a missing refcnt in tcindex_init()
    1891d57f89aa net_sched: add a temporary refcnt for struct tcindex_data
    1189ba9eedac net: phy: micrel: kszphy_resume(): add delay after genphy_resume() before accessing PHY registers
    7d3d99f579e8 net: dsa: mt7530: fix null pointer dereferencing in port5 setup
    bce7ce18bd18 net: dsa: bcm_sf2: Ensure correct sub-node is parsed
    040f7a27583f net: dsa: bcm_sf2: Do not register slave MDIO bus with OF
    bbbdd7956bab ipv6: don't auto-add link-local address to lag ports
    77cf80793692 cxgb4: fix MPS index overwrite when setting MAC address
    3fcd53b1d859 net: phy: realtek: fix handling of RTL8105e-integrated PHY
    de850633a01f Linux 5.4.31
    c3f87e03f90f mm: mempolicy: require at least one nodeid for MPOL_PREFERRED
    c3d4e6fc4b37 padata: always acquire cpu_hotplug_lock before pinst->lock
    238112fcf391 net: Fix Tx hash bound checking
    15ee8da79ee3 i2c: i801: Do not add ICH_RES_IO_SMI for the iTCO_wdt device
    079c8da9e5ac watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
    b42afa3475bf watchdog: iTCO_wdt: Export vendorsupport
    4ebd16641797 tcp: fix TFO SYNACK undo to avoid double-timestamp-undo
    a6b1820d3330 IB/hfi1: Ensure pq is not left on waitlist
    c4168080f1d4 rxrpc: Fix sendmsg(MSG_WAITALL) handling
    be8a3aecd21a iwlwifi: dbg: don't abort if sending DBGC_SUSPEND_RESUME fails
    b4190809a17b iwlwifi: yoyo: don't add TLV offset when reading FIFOs
    00e332e42bbe iwlwifi: consider HE capability when setting LDPC
    5f843cb77142 net/mlx5e: kTLS, Fix wrong value in record tracker enum
    ea26f82a0422 soc: mediatek: knows_txdone needs to be set in Mediatek CMDQ helper
    f6c8f128856b ALSA: hda/ca0132 - Add Recon3Di quirk to handle integrated sound on EVGA X99 Classified motherboard
    2892100bc85a Revert "dm: always call blk_queue_split() in dm_process_bio()"
    7c6ae8ae0ac5 power: supply: axp288_charger: Add special handling for HP Pavilion x2 10
    899c38d93000 extcon: axp288: Add wakeup support
    4d60b72514c2 nvmem: check for NULL reg_read and reg_write before dereferencing
    98b32db072e9 mei: me: add cedar fork device ids
    1843cba24aef coresight: do not use the BIT() macro in the UAPI header
    b5212116392e PCI: sysfs: Revert "rescan" file renames
    aa98c16a5b7c misc: pci_endpoint_test: Avoid using module parameter to determine irqtype
    a5d697c1e92d misc: pci_endpoint_test: Fix to support > 10 pci-endpoint-test devices
    82f6c72e5d4d misc: rtsx: set correct pcr_ops for rts522A
    cec4be18d136 brcmfmac: abort and release host after error
    625b940a28e0 padata: fix uninitialized return value in padata_replace()
    16696ee7b581 XArray: Fix xa_find_next for large multi-index entries
    4eb33cb9b566 net/mlx5e: kTLS, Fix TCP seq off-by-1 issue in TX resync flow
    8792e1ac5f48 tools/power turbostat: Fix 32-bit capabilities warning
    09116eeea6a5 tools/power turbostat: Fix missing SYS_LPI counter on some Chromebooks
    0ba0ce3cbb86 tools/power turbostat: Fix gcc build warnings
    7ebc1e53a46b drm/amdgpu: fix typo for vcn1 idle check
    d2faee42f9e7 initramfs: restore default compression behavior
    4a8ba74c1c64 drm/bochs: downgrade pci_request_region failure from error to warning
    f8abcff4fd0d drm/amd/display: Add link_rate quirk for Apple 15" MBP 2017
    205b5f80c74f kconfig: introduce m32-flag and m64-flag
    91358d0f36fa nvme-rdma: Avoid double freeing of async event data
    ad13e142e024 Linux 5.4.30
    9e62b6673d14 arm64: dts: ls1046ardb: set RGMII interfaces to RGMII_ID mode
    c399a50ae878 arm64: dts: ls1043a-rdb: correct RGMII delay mode to rgmii-id
    5aa29219206a ARM: dts: sun8i: r40: Move AHCI device node based on address order
    8f1199341837 ARM: dts: N900: fix onenand timings
    89ecba47b391 ARM: dts: imx6: phycore-som: fix arm and soc minimum voltage
    bb4ec20d1687 ARM: bcm2835-rpi-zero-w: Add missing pinctrl name
    e58eb564e1fc ARM: dts: oxnas: Fix clear-mask property
    a1081413e834 perf map: Fix off by one in strncpy() size argument
    451bf4d9592a arm64: alternative: fix build with clang integrated assembler
    693860e79552 libceph: fix alloc_msg_with_page_vector() memory leaks
    61bbc823a17a clk: ti: am43xx: Fix clock parent for RTC clock
    b2efabe3f88c clk: imx: Align imx sc clock parent msg structs to 4
    4a3c7e1c807f clk: imx: Align imx sc clock msg structs to 4
    08479b1391cb net: ks8851-ml: Fix IO operations, again
    62465fd66323 gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 CHT + AXP288 model
    877f28596da2 bpf: Explicitly memset some bpf info structures declared on the stack
    e92528a8984e bpf: Explicitly memset the bpf_attr structure
    d3e215554a6c platform/x86: pmc_atom: Add Lex 2I385SW to critclk_systems DMI table
    3f4ba176c623 vt: vt_ioctl: fix use-after-free in vt_in_use()
    acf0e9401931 vt: vt_ioctl: fix VT_DISALLOCATE freeing in-use virtual console
    d1b6ab26c850 vt: vt_ioctl: remove unnecessary console allocation checks
    c897e625f94b vt: switch vt_dont_switch to bool
    e7244ce86ceb vt: ioctl, switch VT_IS_IN_USE and VT_BUSY to inlines
    383c71b7314f vt: selection, introduce vc_is_sel
    125dd8c48b19 serial: sprd: Fix a dereference warning
    5b1bd4900fed mac80211: fix authentication with iwlwifi/mvm
    5863d2b27fb2 mac80211: Check port authorization in the ieee80211_tx_dequeue() case
    73fea3292b49 Linux 5.4.29
    f8c60f7a0051 net: Fix CONFIG_NET_CLS_ACT=n and CONFIG_NFT_FWD_NETDEV={y, m} build
    5f80d17c517d media: v4l2-core: fix a use-after-free bug of sd->devnode
    e7cd85f398cd media: xirlink_cit: add missing descriptor sanity checks
    4490085a9e2d media: stv06xx: add missing descriptor sanity checks
    d111431a4420 media: dib0700: fix rc endpoint lookup
    e4af1cf37b90 media: ov519: add missing endpoint sanity checks
    b25af84517de libfs: fix infoleak in simple_attr_read()
    dcf2d659add5 ahci: Add Intel Comet Lake H RAID PCI ID
    89d4acabb2f6 staging: wlan-ng: fix use-after-free Read in hfa384x_usbin_callback
    c44ea4fe738b staging: wlan-ng: fix ODEBUG bug in prism2sta_disconnect_usb
    0ec1ab1b15d2 staging: rtl8188eu: Add ASUS USB-N10 Nano B1 to device table
    fea3939c6ccc staging: kpc2000: prevent underflow in cpld_reconfigure()
    b958dea86c26 media: usbtv: fix control-message timeouts
    275316b63165 media: flexcop-usb: fix endpoint sanity check
    5102000134f4 usb: musb: fix crash with highmen PIO and usbmon
    f32219427ca1 USB: serial: io_edgeport: fix slab-out-of-bounds read in edge_interrupt_callback
    004b43fdfcf4 USB: cdc-acm: restore capability check order
    4003d59a00e2 USB: serial: option: add Wistron Neweb D19Q1
    d5fec27c54e7 USB: serial: option: add BroadMobi BM806U
    6eff944ff084 USB: serial: option: add support for ASKEY WWHC050
    8d62a8c7489a bpf: Undo incorrect __reg_bound_offset32 handling
    f23f37fe702f clocksource/drivers/hyper-v: Untangle stimers and timesync from clocksources
    791c420f4228 r8169: fix PHY driver check on platforms w/o module softdeps
    d8166d4b4203 vti6: Fix memory leak of skb if input policy check fails
    9c4f1506b477 ARM: dts: sun8i-a83t-tbs-a711: Fix USB OTG mode detection
    7f884cb145dc bpf, sockmap: Remove bucket->lock from sock_{hash|map}_free
    657559d632c2 bpf/btf: Fix BTF verification of enum members in struct/union
    188aae1f3d5f bpf: Initialize storage pointers to NULL to prevent freeing garbage pointer
    c68e1117f4e4 bpf, x32: Fix bug with JMP32 JSET BPF_X checking upper bits
    74617178d694 i2c: nvidia-gpu: Handle timeout correctly in gpu_i2c_check_status()
    6734a326cb13 netfilter: nft_fwd_netdev: allow to redirect to ifb via ingress
    5be3b97a1f18 netfilter: nft_fwd_netdev: validate family and chain type
    4e8bba9420e2 netfilter: flowtable: reload ip{v6}h in nf_flow_tuple_ip{v6}
    0bc1c7f6358c mac80211: set IEEE80211_TX_CTRL_PORT_CTRL_PROTO for nl80211 TX
    74fdc220e2f1 ieee80211: fix HE SPR size calculation
    eaca61f5f850 afs: Fix unpinned address list during probing
    455f5192a10d afs: Fix some tracing details
    c743855a0ebe afs: Fix client call Rx-phase signal handling
    21af83e17ffa xfrm: policy: Fix doulbe free in xfrm_policy_timer
    160c2ffa7016 xfrm: add the missing verify_sec_ctx_len check in xfrm_add_acquire
    a5c5cf6f24bb xfrm: fix uctx len check in verify_sec_ctx_len
    1b92d81d4cc2 RDMA/mlx5: Block delay drop to unprivileged users
    1babd2c979aa RDMA/mlx5: Fix access to wrong pointer while performing flush due to error
    9961c56955a4 RDMA/mlx5: Fix the number of hwcounters of a dynamic counter
    f8f90690df59 vti[6]: fix packet tx through bpf_redirect() in XinY cases
    c467570443bb xfrm: handle NETDEV_UNREGISTER for xfrm device
    86c7d38c2baf genirq: Fix reference leaks on irq affinity notifiers
    fe6010e47ddc afs: Fix handling of an abort from a service handler
    d9e974eea8f1 RDMA/core: Ensure security pkey modify is not lost
    768e582a9970 bpf: Fix cgroup ref leak in cgroup_bpf_inherit on out-of-memory
    0dcf81d2c12f gpiolib: acpi: Add quirk to ignore EC wakeups on HP x2 10 BYT + AXP288 model
    43d2a61ceb09 gpiolib: acpi: Rework honor_wakeup option into an ignore_wake option
    323a89bff42b gpiolib: acpi: Correct comment for HP x2 10 honor_wakeup quirk
    159aef18f05c mm: fork: fix kernel_stack memcg stats for various stack implementations
    cc5da743a456 mm/sparse: fix kernel crash with pfn_section_valid check
    238dd5ab0080 drivers/base/memory.c: indicate all memory blocks as removable
    da458bbfb6cf mm/swapfile.c: move inode_lock out of claim_swapfile
    33c8bc8aa7b2 mac80211: mark station unauthorized before key removal
    d6b1f3fc76c4 mac80211: drop data frames without key on encrypted links
    4a89bb3fca20 nl80211: fix NL80211_ATTR_CHANNEL_WIDTH attribute type
    b34e20c78f1c scsi: sd: Fix optimal I/O size for devices that change reported values
    35b34d264cb3 scripts/dtc: Remove redundant YYLOC global declaration
    683cf6637730 tools: Let O= makes handle a relative path with -C option
    2fe72de89cf7 rtlwifi: rtl8188ee: Fix regression due to commit d1d1a96bdb44
    a2d866c50a35 perf probe: Do not depend on dwfl_module_addrsym()
    5f2b792d3125 perf probe: Fix to delete multiple probe event
    94a4104bf10e x86/ioremap: Fix CONFIG_EFI=n build
    174da11b6474 ARM: dts: omap5: Add bus_dma_limit for L3 bus
    e41cd3b598ae ARM: dts: dra7: Add bus_dma_limit for L3 bus
    7cdaa5cd79ab ceph: fix memory leak in ceph_cleanup_snapid_map()
    ed24820d1b0c ceph: check POOL_FLAG_FULL/NEARFULL in addition to OSDMAP_FULL/NEARFULL
    44960e1c39d8 RDMA/mad: Do not crash if the rdma device does not have a umad interface
    34aa3d5b84d5 RDMA/nl: Do not permit empty devices names during RDMA_NLDEV_CMD_NEWLINK/SET
    9924d9fac61b gpiolib: Fix irq_disable() semantics
    10d5de234df4 RDMA/core: Fix missing error check on dev_set_name()
    b0a2af91cd78 IB/rdmavt: Free kernel completion queue when done
    99058b8beef5 Input: avoid BIT() macro usage in the serio.h UAPI header
    597d6fb4815c Input: synaptics - enable RMI on HP Envy 13-ad105ng
    381c88a6b948 Input: fix stale timestamp on key autorepeat events
    cd18a7f6a789 Input: raydium_i2c_ts - fix error codes in raydium_i2c_boot_trigger()
    d8f58a0f533a i2c: hix5hd2: add missed clk_disable_unprepare in remove
    65047f7538ba iwlwifi: mvm: fix non-ACPI function
    72a0cfeb513c iommu/vt-d: Populate debugfs if IOMMUs are detected
    cb17ed60ec39 iommu/vt-d: Fix debugfs register reads
    e5ea0d970f33 net: hns3: fix "tc qdisc del" failed issue
    24e72d55bc0b sxgbe: Fix off by one in samsung driver strncpy size arg
    753ea21f2ac3 dpaa_eth: Remove unnecessary boolean expression in dpaa_get_headroom
    27030150699b mac80211: Do not send mesh HWMP PREQ if HWMP is disabled
    5ecb28b15678 scsi: ipr: Fix softlockup when rescanning devices in petitboot
    ee3bc486643d s390/qeth: handle error when backing RX buffer
    8b6cccd9bd84 s390/qeth: don't reset default_out_queue
    f8de95a236f6 iommu/vt-d: Silence RCU-list debugging warnings
    957e6f437d02 drm/exynos: Fix cleanup of IOMMU related objects
    70e0a720038e drm/amdgpu: correct ROM_INDEX/DATA offset for VEGA20
    2e89e4e7f7e1 drm/amd/display: update soc bb for nv14
    8dab286ab527 fsl/fman: detect FMan erratum A050385
    406f1ac075fe arm64: dts: ls1043a: FMan erratum A050385
    c211a30c1846 dt-bindings: net: FMan erratum A050385
    b82e91ae6384 cgroup1: don't call release_agent when it is ""
    0cd633314661 drivers/of/of_mdio.c:fix of_mdiobus_register()
    dda4fca30906 cpupower: avoid multiple definition with gcc -fno-common
    7f9c2d71cfd3 nfs: add minor version to nfs_server_key for fscache
    b51274fabedc cgroup-v1: cgroup_pidlist_next should update position index
    74f554af848d net/mlx5e: Do not recover from a non-fatal syndrome
    f94d69e5f682 net/mlx5e: Fix ICOSQ recovery flow with Striding RQ
    bd81b9ba546a net/mlx5e: Fix missing reset of SW metadata in Striding RQ reset
    d8338b5f373a net/mlx5e: Enhance ICOSQ WQE info fields
    63a0fc3b0047 net/mlx5: DR, Fix postsend actions write length
    c3c9927d0a8f hsr: set .netnsok flag
    1a0fdef2d52d hsr: add restart routine into hsr_get_node_list()
    80aa1e38e16b hsr: use rcu_read_lock() in hsr_get_node_{list/status}()
    e4723e0a858e net: ip_gre: Accept IFLA_INFO_DATA-less configuration
    85aa84d3c587 net: ip_gre: Separate ERSPAN newlink / changelink callbacks
    62e3ffa4ea4e bnxt_en: Reset rings if ring reservation fails during open()
    0234e8ebb7f4 bnxt_en: Free context memory after disabling PCI in probe error path.
    797d6f91c399 bnxt_en: Return error if bnxt_alloc_ctx_mem() fails.
    ae4565168af3 bnxt_en: fix memory leaks in bnxt_dcbnl_ieee_getets()
    2ac37a531115 bnxt_en: Fix Priority Bytes and Packets counters in ethtool -S.
    53d0bf064c9f vxlan: check return value of gro_cells_init()
    a6ce82deba5c tcp: repair: fix TCP_QUEUE_SEQ implementation
    27cf5410a9e1 tcp: ensure skb->dev is NULL before leaving TCP stack
    c94b94626876 tcp: also NULL skb->dev when copy was needed
    49d2333f97f0 slcan: not call free_netdev before rtnl_unlock in slcan_open
    4cc2498b7ebb r8169: re-enable MSI on RTL8168c
    3428faf70c59 NFC: fdp: Fix a signedness bug in fdp_nci_send_patch()
    3d9cc478af25 net: stmmac: dwmac-rk: fix error path in rk_gmac_probe
    d23faf32e577 net_sched: keep alloc_hash updated after hash allocation
    5317abb870fe net_sched: hold rtnl lock in tcindex_partial_destroy_work()
    ff28c6195814 net_sched: cls_route: remove the right filter from hashtable
    a631b9668460 net/sched: act_ct: Fix leak of ct zone template on replace
    312805c93bf6 net: qmi_wwan: add support for ASKEY WWHC050
    522d2dc17967 net: phy: mdio-mux-bcm-iproc: check clk_prepare_enable() return value
    f806b9e84057 net: phy: mdio-bcm-unimac: Fix clock handling
    9fe154ee3fd5 net: phy: dp83867: w/a for fld detect threshold bootstrapping issue
    86137342fd4c net/packet: tpacket_rcv: avoid a producer race condition
    bb8c787be0e3 net: mvneta: Fix the case where the last poll did not process all rx
    a2a3baa29914 net: ena: Add PCI shutdown handler to allow safe kexec
    e586427a0abb net: dsa: tag_8021q: replace dsa_8021q_remove_header with __skb_vlan_pop
    0ec037c1353c net: dsa: mt7530: Change the LINK bit to reflect the link status
    60e975088be8 net: dsa: Fix duplicate frames flooded by learning
    7c6fe9b2af79 net: cbs: Fix software cbs to consider packet sending time
    712c39d9319a net/bpfilter: fix dprintf usage for /dev/kmsg
    85675064133e mlxsw: spectrum_mr: Fix list iteration in error path
    5a1a00f6ac32 mlxsw: pci: Only issue reset when system is ready
    6e75284e2480 macsec: restrict to ethernet devices
    51db2db8fe68 ipv4: fix a RCU-list lock in inet_dump_fib()
    b67aa57f4a9d hsr: fix general protection fault in hsr_addr_is_self()
    6fe31c7ce0ed geneve: move debug check after netdev unregister
    b5c9652ada33 cxgb4: fix Txq restart check during backpressure
    e92a0e7fba68 cxgb4: fix throughput drop during Tx backpressure
    b0ab8700283c ACPI: PM: s2idle: Rework ACPI events synchronization
    127882d10931 mmc: sdhci-tegra: Fix busy detection by enabling MMC_CAP_NEED_RSP_BUSY
    71d89344af0b mmc: sdhci-omap: Fix busy detection by enabling MMC_CAP_NEED_RSP_BUSY
    bf8b920f474e mmc: core: Respect MMC_CAP_NEED_RSP_BUSY for eMMC sleep command
    3b9b71adbec4 mmc: core: Respect MMC_CAP_NEED_RSP_BUSY for erase/trim/discard
    d9c4f387e22a mmc: core: Allow host controllers to require R1B for CMD6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bc0c30986d..42e4bca574 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "79b7c0fa5b69a99037cafa959077c4bbb46ebddd"
-SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
+SRCREV_machine ?= "2348504c2c1035e1d7227d25224c9345f7b129d3"
+SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.28"
+LINUX_VERSION ?= "5.4.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5a86edac60..ec4e7679f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.28"
+LINUX_VERSION ?= "5.4.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "044058d79ab16a29429ce0163496da599bd83c33"
-SRCREV_machine ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
+SRCREV_machine_qemuarm ?= "63425cc3498f7f10b1571b38718ed47234d5ade7"
+SRCREV_machine ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 13b8085547..485928bd88 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f7412afb66c40e1c9944f115bc499fc395520c7c"
-SRCREV_machine_qemuarm64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_machine_qemumips ?= "4aba5a90caa5dd43098e3317e121497e4ce4bcaa"
-SRCREV_machine_qemuppc ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_machine_qemuriscv64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_machine_qemux86 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_machine_qemux86-64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_machine_qemumips64 ?= "a72caa2030fa17491f4013025b598f76b7efe39b"
-SRCREV_machine ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
-SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
+SRCREV_machine_qemuarm ?= "bee6048166651d8c69327a0b0ff4f4b87d961d5c"
+SRCREV_machine_qemuarm64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_machine_qemumips ?= "2180ef2ea5645cf63a1aa738f15e72c240c313ea"
+SRCREV_machine_qemuppc ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_machine_qemuriscv64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_machine_qemux86 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_machine_qemux86-64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_machine_qemumips64 ?= "6afe026b32fd5ac553420f68052a665e3fcacd53"
+SRCREV_machine ?= "d66ed1ee791577746d30b29baef734fbb9297431"
+SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.28"
+LINUX_VERSION ?= "5.4.32"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

