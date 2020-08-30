Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.37092.1598811538563604469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0xRx0ha4;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.67, mailfrom: steve@sakoman.com)
Received: by mail-io1-f67.google.com with SMTP id b16so3837501ioj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DYZZs3JKHJpZ0crVOsFY7Wy/Y4NsqSOE/StV2T1c7e4=;
        b=0xRx0ha4XLF+OHC13c3iQx50CEnQYgQxrVMnIkbW+LTs17Yea/X9XGKAGGSqK2Ah7z
         Cu5W0GDMwX493QfI/XOsw5TaQEkgep5RwHamXSmhy/y+DbGnecyRUQUOvqScWEfFB1hj
         F3P7BQy+K5bANghMakvHJyv7KQfGmJEn//8IfCIwNT3Lr0N2eqbZKJVKZv2hMH7OZMBu
         fCCPFSGmWFWwOTtRjL/tLq75hSWxSBWiY5yXzYNcZCe88ggINS6jk/lgwgTf34rtrsUj
         bv6j4QEoswrI3kjiItLC33JZhAkZJCvysdf6deGxm+9YsDnjdGNDr9wXIvec2m+YHRUb
         XBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DYZZs3JKHJpZ0crVOsFY7Wy/Y4NsqSOE/StV2T1c7e4=;
        b=YLkcBlm3sUwtBtc2mzdlh28msiGOYk290dA9OlG6OZbjnqOkLCycJB6GuATp9x5UCj
         AgjX/dahJA6NPey7tWoV0APs3VFYtWMdYdJnI4/IMCxA4VMRE5EKDXIVeW9m6sUfgmX4
         YdX6aIVzFuKUfKgILR/1W3mA9nBskaYByTuilWTsHo946dtTutYrH0QrCwfnU90/F3Rq
         UMuKWvHULfK8dWRRIn7eq58m3K/Rs0nG7QEm3p4WCarzuxmWTooRn6VovoCSqr9fdV9b
         OGaPwbv76dlm33DrWqlsQ+p1fwSKaqzG6pCdckghqNgp0WaUqODdYzXvE3xENq/9DfWL
         Mi/A==
X-Gm-Message-State: AOAM533OmaRcAFvcbNEeblmiNF7QvVU8WDqprSrokUW02sJFeZVTc9yc
	l2onVJzPdoqmj6KmkRJC4EuQ8JZUWC3dYLrX6FA=
X-Google-Smtp-Source: ABdhPJwLT5IXbm62ncJaxdZMt8vFc5/K5InoDOHgNoqBKs3IVPjR31UjnhzPfE33HLeuVBmHEFsSGQ==
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr5969995iow.127.1598811536942;
        Sun, 30 Aug 2020 11:18:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/25] linux-yocto/5.4: update to v5.4.59
Date: Sun, 30 Aug 2020 08:16:13 -1000
Message-Id: <d8cc933de70d7c0cb5515214dbc7b872175a77ca.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    f61e1c3638dd Linux 5.4.59
    5de0b5247cba io_uring: Fix NULL pointer dereference in loop_rw_iter()
    4db28111b2a3 s390/gmap: improve THP splitting
    756a70b6dcc3 s390/dasd: fix inability to use DASD with DIAG driver
    dccc66daeba5 xen/gntdev: Fix dmabuf import with non-zero sgt offset
    8e41ac0bfdfd xen/balloon: make the balloon wait interruptible
    ee4c180d93d0 xen/balloon: fix accounting in alloc_xenballooned_pages error path
    db1f4c745a91 fs/minix: reject too-large maximum file size
    8c7e720a165b fs/minix: don't allow getting deleted inodes
    a5305f119907 fs/minix: check return value of sb_getblk()
    5be9072b8121 bitfield.h: don't compile-time validate _val in FIELD_FIT
    3e95a74f4c27 crypto: cpt - don't sleep of CRYPTO_TFM_REQ_MAY_SLEEP was not specified
    28bd8f392f4a crypto: ccp - Fix use of merged scatterlists
    3c660aa47304 crypto: qat - fix double free in qat_uclo_create_batch_init_list
    d9add5d7d94b crypto: hisilicon - don't sleep of CRYPTO_TFM_REQ_MAY_SLEEP was not specified
    17f9ba7229c4 pstore: Fix linking when crypto API disabled
    1a2e558c8b30 tpm: Unify the mismatching TPM space buffer sizes
    169d55c486f8 ALSA: usb-audio: add quirk for Pioneer DDJ-RB
    a3ec61c84d85 irqdomain/treewide: Free firmware node after domain removal
    35e1338bddcd ARM: 8992/1: Fix unwind_frame for clang-built kernels
    cd17453fa96f parisc: mask out enable and reserved bits from sba imask
    0d3897a7f527 parisc: Implement __smp_store_release and __smp_load_acquire barriers
    8dfab4662001 parisc: Do not use an ordered store in pa_tlb_lock()
    638e45c39f30 Revert "parisc: Revert "Release spinlocks using ordered store""
    431d999bd098 Revert "parisc: Use ldcw instruction for SMP spinlock release barrier"
    7612ce180e30 Revert "parisc: Drop LDCW barrier in CAS code when running UP"
    15f7b186916d erofs: fix extended inode could cross boundary
    a8e9efb55323 mtd: rawnand: qcom: avoid write to unavailable register
    7ebb8fd40256 spi: spidev: Align buffers for DMA
    e02c77edd9b0 include/asm-generic/vmlinux.lds.h: align ro_after_init
    7e270e86b1b3 cpufreq: dt: fix oops on armada37xx
    613a374f3fd6 cpufreq: Fix locking issues with governors
    6d1e56826ea8 NFS: Don't return layout segments that are in use
    046922d3248d NFS: Don't move layouts to plh_return_segs list while in use
    3c512bd3dbbb io_uring: set ctx sq/cq entry count earlier
    c6d2ddf1a30d drm/ttm/nouveau: don't call tt destroy callback on alloc failure.
    86f95b631490 media: media-request: Fix crash if memory allocation fails
    06d8ba514949 9p: Fix memory leak in v9fs_mount
    10de419977bf ALSA: usb-audio: work around streaming quirk for MacroSilicon MS2109
    1d2c4954e82b ALSA: usb-audio: fix overeager device match for MacroSilicon MS2109
    d5f647e3a72a ALSA: usb-audio: Creative USB X-Fi Pro SB1095 volume knob support
    8555fd99c111 ALSA: hda - fix the micmute led status for Lenovo ThinkCentre AIO
    1f0e0ad76eae USB: serial: cp210x: enable usb generic throttle/unthrottle
    3a8d1ca7204e USB: serial: cp210x: re-enable auto-RTS on open
    378737e1eee2 net: initialize fastreuse on inet_inherit_port
    dcedddbc7b20 net: refactor bind_bucket fastreuse into helper
    8a337428a5af vmxnet3: use correct tcp hdr length when packet is encapsulated
    e07d0ccd7fde tcp: correct read of TFO keys on big endian systems
    49a5b473bc66 net/tls: Fix kmap usage
    7bedf1d86298 net: Set fput_needed iff FDPUT_FPUT is set
    47f873ac267b net: phy: fix memory leak in device-create error path
    0b305f259ca9 net/nfc/rawsock.c: add CAP_NET_RAW check.
    02618095ab45 net: Fix potential memory leak in proto_register()
    f6c5d9f3361a drivers/net/wan/lapbether: Added needed_headroom and a skb->len check
    de236de3df57 af_packet: TPACKET_V3: fix fill status rwlock imbalance
    5ef739b7a5be crypto: aesni - add compatibility with IAS
    c44efee6e432 x86/fsgsbase/64: Fix NULL deref in 86_fsgsbase_read_task
    18d1bb497364 SUNRPC: Fix ("SUNRPC: Add "@len" parameter to gss_unwrap()")
    789be9705ed1 svcrdma: Fix page leak in svc_rdma_recv_read_chunk()
    fa6bd08869c5 pinctrl-single: fix pcs_parse_pinconf() return value
    50abf1b9ad10 ocfs2: fix unbalanced locking
    ba8a72193346 dlm: Fix kobject memleak
    41e8b5afde8e net: thunderx: initialize VF's mailbox mutex before first usage
    3084ecb02357 fsl/fman: fix eth hash table allocation
    2997cea07f9e fsl/fman: check dereferencing null pointer
    158ccb4f03b5 fsl/fman: fix unreachable code
    a405fb3ffdab fsl/fman: fix dereference null return value
    e9b3249a3df6 fsl/fman: use 32-bit unsigned integer
    8c68da19fd02 net: spider_net: Fix the size used in a 'dma_free_coherent()' call
    dc66a35ffee6 liquidio: Fix wrong return value in cn23xx_get_pf_num()
    eb4afeaf861f net: ethernet: aquantia: Fix wrong return value
    fe8571b4d5ac net/mlx5: Delete extra dump stack that gives nothing
    87a43dac39c2 net/mlx5: DR, Change push vlan action sequence
    a4301de4be41 tools, bpftool: Fix wrong return value in do_dump()
    94bc0ab6043f tools, build: Propagate build failures from tools/build/Makefile.build
    2684577dd9bc wl1251: fix always return 0 error
    3bec3e41db0d rtw88: coex: only skip coex triggered by BT info
    1b7546010b01 rtw88: fix short GI capability based on current bandwidth
    ff1ecaf751d7 rtw88: fix LDPC field for RA info
    fef9f09078b0 ice: Graceful error handling in HW table calloc failure
    2fd47ea1e063 s390/qeth: don't process empty bridge port events
    b8ae2bf5ccc6 ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
    115da6e650ab ASoC: meson: axg-tdm-formatters: fix sclk inversion
    0cc88bf69411 ASoC: meson: axg-tdmin: fix g12a skew
    a9d54ebf8db0 ASoC: meson: axg-tdm-interface: fix link fmt setup
    5299edbfc19a selftests/powerpc: Fix online CPU selection
    5412751327e8 cpufreq: ap806: fix cpufreq driver needs ap cpu clk
    0df3fad9c17f PCI: Release IVRS table in AMD ACS quirk
    07783db29f89 RDMA/netlink: Remove CAP_NET_RAW check when dump a raw QP
    04cf65b784d2 selftests/powerpc: Fix CPU affinity for child process
    3e95f258a143 powerpc/boot: Fix CONFIG_PPC_MPC52XX references
    69a797a04517 powerpc/32s: Fix CONFIG_BOOK3S_601 uses
    09c2050239fb selftests/powerpc: Squash spurious errors due to device removal
    5f56aa0b1fec xfs: fix inode allocation block res calculation precedence
    5c0fd1e61b5a net: dsa: rtl8366: Fix VLAN set-up
    8cd2a4878787 net: dsa: rtl8366: Fix VLAN semantics
    495b9d0dd071 Bluetooth: hci_serdev: Only unregister device if it was registered
    ba5c28f78461 Bluetooth: hci_h5: Set HCI_UART_RESET_ON_INIT to correct flags
    8d91c73c13f1 power: supply: check if calc_soc succeeded in pm860x_init_battery
    b2b8438ed831 Smack: prevent underflow in smk_set_cipso()
    674992659a97 Smack: fix another vsscanf out of bounds
    3a2cd06a3d93 RDMA/core: Fix return error value in _ib_modify_qp() to negative
    16416a158743 PCI: cadence: Fix updating Vendor ID and Subsystem Vendor ID register
    845601756341 macintosh/via-macii: Access autopoll_devs when inside lock
    a88f86763cbc net: dsa: mv88e6xxx: MV88E6097 does not support jumbo configuration
    f6f75b1756f7 scsi: mesh: Fix panic after host or bus reset
    b41e8798f288 scsi: megaraid_sas: Clear affinity hint
    1d7e19cf79f4 usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
    b2c2b88b0496 usb: dwc2: Fix error path in gadget registration
    b8f3c361ca2c MIPS: OCTEON: add missing put_device() call in dwc3_octeon_device_init()
    db2eabff57cc phy: armada-38x: fix NETA lockup when repeatedly switching speeds
    2bf9418b7b11 mt76: mt7615: fix potential memory leak in mcu message handler
    54c9afe415dc powerpc/perf: Fix missing is_sier_aviable() during build
    53eeba79c152 coresight: tmc: Fix TMC mode read in tmc_read_unprepare_etb()
    6482f5119946 thermal: ti-soc-thermal: Fix reversed condition in ti_thermal_expose_sensor()
    c30281c4b28f usb: core: fix quirks_param_set() writing to a const pointer
    92581069807b USB: serial: iuu_phoenix: fix led-activity helpers
    278b532dfeaf spi: lantiq-ssc: Fix warning by using WQ_MEM_RECLAIM
    7e206d89e1c7 gpu: ipu-v3: Restore RGB32, BGR32
    e66ffe919ed4 drm/imx: tve: fix regulator_disable error path
    1a279871012d drm/imx: fix use after free
    44ae76d01d95 powerpc/book3s64/pkeys: Use PVR check instead of cpu feature
    6112c341ba3a phy: renesas: rcar-gen3-usb2: move irq registration to init
    e82e9db82faf PCI/ASPM: Add missing newline in sysfs 'policy'
    c537bd0732ea ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback
    2698fab03884 staging: rtl8192u: fix a dubious looking mask before a shift
    209207562934 ima: Have the LSM free its audit rule
    7ecfbee3b9c3 RDMA/rxe: Prevent access to wr->next ptr afrer wr is posted to send queue
    4cf66d70b5ef RDMA/qedr: SRQ's bug fixes
    978bef91cad7 powerpc/vdso: Fix vdso cpu truncation
    7beea356fabb powerpc/rtas: don't online CPUs for partition suspend
    936e927ece9b kernfs: do not call fsnotify() with name without a parent
    b7fc8591cae4 mwifiex: Prevent memory corruption handling keys
    0c0d30eaf31c scsi: scsi_debug: Add check for sdebug_max_queue during module init
    6a292c4bc027 drm/bridge: sil_sii8620: initialize return of sii8620_readb
    8ffa0cf2b662 phy: exynos5-usbdrd: Calibrating makes sense only for USB2.0 PHY
    36f9ed95ec52 drm: panel: simple: Fix bpc for LG LB070WV8 panel
    d25c81232007 leds: core: Flush scheduled work for system suspend
    adbb26e2d44e kobject: Avoid premature parent object freeing in kobject_cleanup()
    59f69f1edb56 drm/stm: repair runtime power management
    cc5f55c46a71 PCI: Fix pci_cfg_wait queue locking problem
    8fbefed6c3a0 RDMA/rxe: Skip dgid check in loopback mode
    6093eae667d6 xfs: fix reflink quota reservation accounting error
    2c5170b451b7 xfs: don't eat an EIO/ENOSPC writeback error when scrubbing data fork
    deaf69f5b028 media: cros-ec-cec: do not bail on device_init_wakeup failure
    951a21261577 media: exynos4-is: Add missed check for pinctrl_lookup_state()
    210ab36cdaa9 media: firewire: Using uninitialized values in node_probe()
    0c122fc90d02 ipvs: allow connection reuse for unconfirmed conntrack
    45a769a10126 scsi: eesox: Fix different dev_id between request_irq() and free_irq()
    76189426da56 scsi: powertec: Fix different dev_id between request_irq() and free_irq()
    691081c0558a RDMA/core: Fix bogus WARN_ON during ib_unregister_device_queued()
    67642ac2ac0b iavf: Fix updating statistics
    8d5ce7e06ff8 iavf: fix error return code in iavf_init_get_resources()
    f27a965b042f staging: vchiq_arm: Add a matching unregister call
    87a30aa61f60 drm/radeon: fix array out-of-bounds read and write issues
    db377d8caf08 cxl: Fix kobject memleak
    835c6f7c0a94 drm/mipi: use dcs write for mipi_dsi_dcs_set_tear_scanline
    6f2b14006d44 scsi: cumana_2: Fix different dev_id between request_irq() and free_irq()
    d92cc98b7423 ASoC: Intel: bxt_rt298: add missing .owner field
    a1773c8b04a4 ASoC: SOF: nocodec: add missing .owner field
    d85cebc8656f media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init_entities()
    8fe0119f5c63 media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
    79962a7a1dd1 media: cxusb-analog: fix V4L2 dependency
    a728697b74b7 Bluetooth: btmtksdio: fix up firmware download sequence
    ecab4ef93ce6 Bluetooth: btusb: fix up firmware download sequence
    6db3579dd3a4 leds: lm355x: avoid enum conversion warning
    cc51ca361059 clk: bcm63xx-gate: fix last clock availability
    8bfd16c687cf drm/arm: fix unintentional integer overflow on left shift
    018192e85860 drm/etnaviv: Fix error path on failure to enable bus clk
    8080ccd31233 iio: improve IIO_CONCENTRATION channel type description
    b4a09e491d38 ath10k: Acquire tx_lock in tx error paths
    d9411fcc9a48 video: pxafb: Fix the function used to balance a 'dma_alloc_coherent()' call
    703a2e85a3a8 console: newport_con: fix an issue about leak related system resources
    e95d33905a4e video: fbdev: sm712fb: fix an issue about iounmap for a wrong address
    d9e13b0c26cf btmrvl: Fix firmware filename for sd8997 chipset
    671f14a14471 btmrvl: Fix firmware filename for sd8977 chipset
    89b09156ed41 mwifiex: Fix firmware filename for sd8997 chipset
    be9903c9ebe4 mwifiex: Fix firmware filename for sd8977 chipset
    e3b04e1b5b03 agp/intel: Fix a memory leak on module initialisation failure
    7669b6beb4fd drm/bridge: ti-sn65dsi86: Clear old error bits before AUX transfers
    1a981f4d6c97 drm/gem: Fix a leak in drm_gem_objects_lookup()
    167708cbebd3 drm/msm: ratelimit crtc event overflow error
    1e8d2186551b ACPICA: Do not increment operation_region reference counts for field units
    ca6654d7da59 bcache: fix super block seq numbers comparision in register_cache_set()
    db9b14ae4b6a dyndbg: fix a BUG_ON in ddebug_describe_flags
    8fb05790b55b usb: bdc: Halt controller on suspend
    296184490e2c bdc: Fix bug causing crash after multiple disconnects
    77d7ce9ccb33 usb: gadget: net2280: fix memory leak on probe error handling paths
    7404ce0f639c mmc: sdhci-pci-o2micro: Bug fix for O2 host controller Seabird1
    d000795c9f25 ionic: update eid test for overflow
    691ae7c87ff7 gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
    ff3fde9d4519 iwlegacy: Check the return value of pcie_capability_read_*()
    ef62e5411db2 platform/x86: asus-nb-wmi: add support for ASUS ROG Zephyrus G14 and G15
    ce3ae44103ca brcmfmac: set state of hanger slot to FREE when flushing PSQ
    1c53aefa2866 brcmfmac: To fix Bss Info flag definition Bug
    29dd5e5309b1 brcmfmac: keep SDIO watchdog running when console_interval is non-zero
    5908a17b247d bpf: Fix fds_example SIGSEGV error
    4360d9b560bd drm/amd/powerplay: fix compile error with ARCH=arc
    fae763f1357b drm/amdgpu/display bail early in dm_pp_get_static_clocks
    87834546ea2c mm/mmap.c: Add cond_resched() for exit_mmap() CPU stalls
    ae3033d38596 irqchip/irq-mtk-sysirq: Replace spinlock with raw_spinlock
    d17931fbe9dd drm/radeon: disable AGP by default
    238e32468e0d drm/debugfs: fix plain echo to connector "force" attribute
    df91fe834bd4 drm/msm: Fix a null pointer access in msm_gem_shrinker_count()
    fae8ff2dfd8d drm: msm: a6xx: fix gpu failure after system resume
    0e76c2ffb8f0 usb: mtu3: clear dual mode of u3port when disable device
    e633add66d17 btrfs: fix lockdep splat from btrfs_dump_space_info
    7795eb18ce7d mmc: sdhci-cadence: do not use hardware tuning for SD mode
    3b69bcd45426 drm/nouveau: fix multiple instances of reference count leaks
    db0a2e4857dd drm/nouveau: fix reference count leak in nouveau_debugfs_strap_peek
    20e7c4456069 drm/etnaviv: fix ref count leak via pm_runtime_get_sync
    274f4e9c575a arm64: dts: hisilicon: hikey: fixes to comply with adi, adv7533 DT binding
    454a00e9ed83 drm/nouveau/kms/nv50-: Fix disabling dithering
    d72c0f225a2f md-cluster: fix wild pointer of unlock_all_bitmaps()
    2ac7df0910e5 bus: ti-sysc: Add missing quirk flags for usb_host_hs
    6754d2a86c43 video: fbdev: neofb: fix memory leak in neo_scan_monitor()
    9ca426693563 video: fbdev: savage: fix memory leak on error handling path in probe
    8b8d17d9ff8a crypto: aesni - Fix build with LLVM_IAS=1
    cab45cfa00b8 drm/radeon: Fix reference count leaks caused by pm_runtime_get_sync
    2f04f5bcf6d9 drm/amdgpu: avoid dereferencing a NULL pointer
    6402b231824f fs/btrfs: Add cond_resched() for try_release_extent_mapping() stalls
    a6619810135b loop: be paranoid on exit and prevent new additions / removals
    0e656b7e85c3 Bluetooth: add a mutex lock to avoid UAF in do_enale_set
    f8b0407f6a5f soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
    94fd6f72a826 drm/tilcdc: fix leak & null ref in panel_connector_get_modes
    86f305a9aca0 nvme-multipath: do not fall back to __nvme_find_path() for non-optimized paths
    f0a8c0254fde nvme-multipath: fix logic for non-optimized paths
    4e8691ba0e78 nvme-rdma: fix controller reset hang during traffic
    b98a96662a4e nvme-tcp: fix controller reset hang during traffic
    6f01de256dd0 md: raid0/linear: fix dereference before null check on pointer mddev
    0f09c88f207c seccomp: Fix ioctl number for SECCOMP_IOCTL_NOTIF_ID_VALID
    7915a3c04139 irqchip/ti-sci-inta: Fix return value about devm_ioremap_resource()
    2f53a4b54e25 iocost: Fix check condition of iocg abs_vdebt
    3f4f3b350a8a ARM: socfpga: PM: add missing put_device() call in socfpga_setup_ocram_self_refresh()
    9600bdd6924a spi: rockchip: Fix error in SPI slave pio read
    0b1799662a61 io_uring: fix sq array offset calculation
    afa16b50e2aa regulator: fix memory leak on error path of regulator_register()
    80242590651c recordmcount: only record relocation of type R_AARCH64_CALL26 on arm64.
    3a17c7bfe705 tpm: Require that all digests are present in TCG_PCR_EVENT2 structures
    b1fe27d227c6 spi: lantiq: fix: Rx overflow error in full duplex mode
    e22730350d9e ARM: dts: sunxi: bananapi-m2-plus-v1.2: Fix CPU supply voltages
    acbe4a1dc54c ARM: dts: sunxi: bananapi-m2-plus-v1.2: Add regulator supply to all CPU cores
    cd9f5d2b3999 ARM: at91: pm: add missing put_device() call in at91_pm_sram_init()
    1b3cb69fd559 ARM: dts: gose: Fix ports node name for adv7612
    e21665164e99 ARM: dts: gose: Fix ports node name for adv7180
    4361bec62bda platform/x86: intel-vbtn: Fix return value check in check_acpi_dev()
    ed48a02d4cbd platform/x86: intel-hid: Fix return value check in check_acpi_dev()
    78448034fafb m68k: mac: Fix IOP status/control register writes
    b8ad79dde63f m68k: mac: Don't send IOP message until channel is idle
    38702b9081c9 clk: scmi: Fix min and max rate when registering clocks with discrete rates
    047187eb0a3f sched/uclamp: Fix initialization of struct uclamp_rq
    4d7115d29201 arm64: dts: exynos: Fix silent hang after boot on Espresso
    420acbfdd64b firmware: arm_scmi: Fix SCMI genpd domain probing
    0155cd348be2 ARM: exynos: MCPM: Restore big.LITTLE cpuidle support
    489ee1f21993 crypto: ccree - fix resource leak on error path
    6a291f9c21e4 blktrace: fix debugfs use after free
    34108464f808 arm64: dts: qcom: msm8916: Replace invalid bias-pull-none property
    f2b639b2aa21 crc-t10dif: Fix potential crypto notify dead-lock
    c73eec04e666 EDAC: Fix reference count leaks
    192b8516c99c arm64: dts: rockchip: fix rk3399-puma gmac reset gpio
    da9dfd06dbaa arm64: dts: rockchip: fix rk3399-puma vcc5v0-host gpio
    066f85458d9c arm64: dts: rockchip: fix rk3368-lion gmac reset gpio
    e8eb09e542c1 sched: correct SD_flags returned by tl->sd_flags()
    b8d9908c9d3d sched/fair: Fix NOHZ next idle balance
    072d1300f1ce x86/mce/inject: Fix a wrong assignment of i_mce.status
    a36ff7a40d11 clk: qcom: clk-rpmh: Wait for completion when enabling clocks
    a02df82a59c3 fs/io_uring.c: Fix uninitialized variable is referenced in io_submit_sqe
    bd1584865c12 nvme: add a Identify Namespace Identification Descriptor list quirk
    039b66468fc4 HID: input: Fix devices that return multiple bytes in battery report
    16d2fb138f98 tracepoint: Mark __tracepoint_string's __used

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1e62066f50aaac6e1064e381c8440d45d9322b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index cfe3277e83..d1f3373155 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "22664d170488313b5c2713b6d9c8df6563387728"
-SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
+SRCREV_machine ?= "4a46fa0e5b9ac924a7827ad14e28359fd44071db"
+SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.58"
+LINUX_VERSION ?= "5.4.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index b90b1259a2..12edd9c70b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.58"
+LINUX_VERSION ?= "5.4.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d192ae0b9995a7be2a33b12005a95348ec6aae94"
-SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
+SRCREV_machine_qemuarm ?= "9d508813e893033dbe72caeb9421d95df5248e85"
+SRCREV_machine ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 88b6251bd0..00a656df50 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7bbd138602fda3d69d74674460e73bffdec73cd2"
-SRCREV_machine_qemuarm64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_machine_qemumips ?= "e43ed1586cd85a007b0fae3c63d6980d4f5cb336"
-SRCREV_machine_qemuppc ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_machine_qemuriscv64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_machine_qemux86 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_machine_qemux86-64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_machine_qemumips64 ?= "d1ff96887c64f70de00add62eb91d4c36f1b181a"
-SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
-SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
+SRCREV_machine_qemuarm ?= "81ee43dd68b5c88000b472e2406db7e46ac5a1a8"
+SRCREV_machine_qemuarm64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_machine_qemumips ?= "3e72d371ab61c9b23c79076e6e9aabba3907c440"
+SRCREV_machine_qemuppc ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_machine_qemuriscv64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_machine_qemux86 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_machine_qemux86-64 ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_machine_qemumips64 ?= "7b5ccc4d7ce6f71b807bea00e67f8eb4c0e236a3"
+SRCREV_machine ?= "f8efa0bae5f9aad8ba621e1c37eb898a7530b5a1"
+SRCREV_meta ?= "5d52d9eea95fa09d404053360c2351b2b91b323b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.58"
+LINUX_VERSION ?= "5.4.59"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

