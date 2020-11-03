Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.6215.1604419513597688371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 08:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SvtFWioR;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id x20so15124447qkn.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zpBAh3zMYZ4duY+LFnGidKcwcEt6ustx3dN6WZkI7Uo=;
        b=SvtFWioRsH+isfnSxBnKf0JTYl18Apf5GOhBewI1C97fnFQoOR1tzGAd0KSmFrkGPL
         gb/4HF/bhf+ozgKmG+ptcQXZa/1Uvw+LsIzc15/GeiRRgRp8zrMSH/U4Jf+RH9yTNhh8
         OVdUt5Nkiq2WrBYmWEUU84Uo8HKLD+ybuJtLiM2DrlaBHlgeteFT+q/IHPGUFFft+jyI
         xywlYVIq35oZC2kp070G5kZUN33Zro0Z9TupPtrvBGv4N4v+fYsn7Hd9QqpPw467fNY7
         glB6javvkdFcaluF6D8vsquOIMoJibqKWJ72BzgW4tERQ2jqqo71uXpWUbgSu9yWLG8v
         4fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zpBAh3zMYZ4duY+LFnGidKcwcEt6ustx3dN6WZkI7Uo=;
        b=gjprm//nJIoo0dqWhNfORc5xFFPPT6vqbunjNuYhGypA9n0IDlQ13pQlWhD9HpA50j
         yTxMqni43rF9wCdA+QobXd9vPfjUZEnbvLUJ27900rL5LAda9B8Qa3Vp3kljRb56jrmv
         XXpVR5/TBBGOzcwe/lBswmixGHilI7ry15lWbE3hsYMHnz5pUrTtJQmCRN/R71AKJwKg
         DofXhyQe2+7zMXCON069OGhNXR86RAvRcL4NQsBzUtKyFgWqy/RKlS/I4zFtY+AStri5
         GtU+SIw8xq/HLFwFW2ANcb2+U8PeL+2wAwsFpjjoAonHeFjbCa109gXxbAPiFzOrlWyB
         93Iw==
X-Gm-Message-State: AOAM532oYD0i1exW53RX+wwSdjOfHy21k4+k4tii2HMuXArX9U+EhWb8
	BYCbgCTsDlR0n0pSglUuwJY=
X-Google-Smtp-Source: ABdhPJzoH+zyfzfNbiNLkTTZMMSKgkT478lm/Sl3JL6onirfW+pJgubsM4kLO6VhEtnOnUkyBmX+Gw==
X-Received: by 2002:a05:620a:13b9:: with SMTP id m25mr20065922qki.467.1604419512194;
        Tue, 03 Nov 2020 08:05:12 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u5sm10454809qtg.57.2020.11.03.08.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:05:10 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.4: update to v5.4.73
Date: Tue,  3 Nov 2020 11:04:54 -0500
Message-Id: <d66eaec4dcd1dfe95552d1cd83137f0c695d19cf.1604415988.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1604415988.git.bruce.ashfield@gmail.com>
References: <cover.1604415988.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    bde3f94035b0 Linux 5.4.73
    3c7ccd7d4ace usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
    efb893a56cea eeprom: at25: set minimum read/write access stride to 1
    8011f45598cd usb: cdns3: gadget: free interrupt after gadget has deleted
    ed134662a62b USB: cdc-wdm: Make wdm_flush() interruptible and add wdm_fsync().
    2cc661ab2bde usb: cdc-acm: add quirk to blacklist ETAS ES58X devices
    1d2ce4350a01 tty: serial: fsl_lpuart: fix lpuart32_poll_get_char
    231146202650 tty: serial: lpuart: fix lpuart32_write usage
    a8a4b17bcc9d s390/qeth: don't let HW override the configured port role
    905f0d17a07f net: korina: cast KSEG0 address to pointer in kfree
    9bca56ad2f0a ath10k: check idx validity in __ath10k_htt_rx_ring_fill_n()
    18ec92b1ce29 dmaengine: dw: Activate FIFO-mode for memory peripherals only
    190bce292b73 dmaengine: dw: Add DMA-channels mask cell support
    bc94a025cfd2 scsi: ufs: ufs-qcom: Fix race conditions caused by ufs_qcom_testbus_config()
    e13f0d325a04 usb: core: Solve race condition in anchor cleanup functions
    5912b09c97cd brcm80211: fix possible memleak in brcmf_proto_msgbuf_attach
    36df67bd0097 scsi: smartpqi: Avoid crashing kernel for controller issues
    d00555d2255f ALSA: hda/ca0132 - Add new quirk ID for SoundBlaster AE-7.
    4529f9e5067c ALSA: hda/ca0132 - Add AE-7 microphone selection commands.
    752df39ed6e1 mwifiex: don't call del_timer_sync() on uninitialized timer
    045f29c16fcf reiserfs: Fix memory leak in reiserfs_parse_options()
    109f5845a60f ipvs: Fix uninit-value in do_ip_vs_set_ctl()
    8f8df766f75c Bluetooth: btusb: Fix memleak in btusb_mtk_submit_wmt_recv_urb
    4886c2cf3d91 tty: ipwireless: fix error handling
    e80b7ebcfda7 fbmem: add margin check to fb_check_caps()
    f14811c617b4 scsi: qedi: Fix list_del corruption while removing active I/O
    56b2fd0cbfb0 scsi: qedi: Protect active command list to avoid list corruption
    f8bf0bbee1cc scsi: qedf: Return SUCCESS if stale rport is encountered
    09e4f2271178 HID: ite: Add USB id match for Acer One S1003 keyboard dock
    f3c23dcff8fb Fix use after free in get_capset_info callback.
    a4638768b03d rtl8xxxu: prevent potential memory leak
    d5eb55b5f96f brcmsmac: fix memory leak in wlc_phy_attach_lcnphy
    061d2f3fce45 selftests/bpf: Fix test_sysctl_loop{1, 2} failure due to clang change
    d399015f191b scsi: qla2xxx: Warn if done() or free() are called on an already freed srb
    0bb4a0b5a0ec scsi: ibmvfc: Fix error return in ibmvfc_probe()
    ff9c607f0355 iomap: fix WARN_ON_ONCE() from unprivileged users
    6458e8e8689b drm/msm/a6xx: fix a potential overflow issue
    bab673eef853 Bluetooth: Only mark socket zapped after unlocking
    78a47ef68262 usb: ohci: Default to per-port over-current protection
    df01087859fa xfs: make sure the rt allocator doesn't run off the end
    09b63105d089 opp: Prevent memory leak in dev_pm_opp_attach_genpd()
    6ff3df752c06 reiserfs: only call unlock_new_inode() if I_NEW
    0e3f41b6bec0 misc: rtsx: Fix memory leak in rtsx_pci_probe
    3a8d86d8da1b bpf: Limit caller's stack depth 256 for subprogs with tailcalls
    6c3a1aabfcff drm/panfrost: add amlogic reset quirk callback
    a9990ed2d7ca ath9k: hif_usb: fix race condition between usb_get_urb() and usb_kill_anchored_urbs()
    85b757ca3005 can: flexcan: flexcan_chip_stop(): add error handling and propagate error value
    42e781da7b37 usb: dwc3: simple: add support for Hikey 970
    0e1fb72e27d7 USB: cdc-acm: handle broken union descriptors
    ca4261a249dd rtw88: increse the size of rx buffer size
    41ce99a3ef1a udf: Avoid accessing uninitialized data on failed inode read
    01d886b89eb8 udf: Limit sparing table size
    e9e791f5c39a usb: gadget: function: printer: fix use-after-free in __lock_acquire
    08045050c6bd usb: dwc3: Add splitdisable quirk for Hisilicon Kirin Soc
    821dcabafded misc: vop: add round_up(x,4) for vring_size to avoid kernel panic
    85efddd97b72 mic: vop: copy data to kernel space then write to io memory
    e93b629d347e scsi: target: core: Add CONTROL field for trace events
    7cb5830b775a scsi: mvumi: Fix error return in mvumi_io_attach()
    267edd6478f9 PM: hibernate: remove the bogus call to get_gendisk() in software_resume()
    9ff197703e25 mac80211: handle lack of sband->bitrates in rates
    c8b6ad0a8afb ip_gre: set dev->hard_header_len and dev->needed_headroom properly
    16281bdd202f ntfs: add check for mft record size in superblock
    05f9cc28a954 media: venus: core: Fix runtime PM imbalance in venus_probe
    0ce7ba162b35 fs: dlm: fix configfs memory leak
    ed99b3e5117d media: venus: fixes for list corruption
    4f6af5a3c0f4 media: saa7134: avoid a shift overflow
    cb475ba4400f mmc: sdio: Check for CISTPL_VERS_1 buffer size
    67806a68d52c media: uvcvideo: Ensure all probed info is returned to v4l2
    6827d62a86de x86/mce: Make mce_rdmsrl() panic on an inaccessible MSR
    7aa3f954cd91 media: media/pci: prevent memory leak in bttv_probe
    ad3825eedb16 media: bdisp: Fix runtime PM imbalance on error
    e1285a73c5fa media: platform: sti: hva: Fix runtime PM imbalance on error
    8d727e1d261a media: platform: s3c-camif: Fix runtime PM imbalance on error
    6b3f0742f531 media: vsp1: Fix runtime PM imbalance on error
    7db4c3dfee01 media: exynos4-is: Fix a reference count leak
    f36a80bc7512 media: exynos4-is: Fix a reference count leak due to pm_runtime_get_sync
    8babe11e46ba media: exynos4-is: Fix several reference count leaks due to pm_runtime_get_sync
    62f3bc07008d media: sti: Fix reference count leaks
    e4d4abe6e86f media: st-delta: Fix reference count leak in delta_run_work
    d310c7437cb8 media: ati_remote: sanity check for both endpoints
    b4325c738f8f media: firewire: fix memory leak
    d06ea207e90b x86/mce: Add Skylake quirk for patrol scrub reported errors
    624c2782b49d x86/asm: Replace __force_order with a memory clobber
    fce2779e1c6e crypto: ccp - fix error handling
    b3a0ed411008 block: ratelimit handle_bad_sector() message
    a47cecbd2816 md/bitmap: fix memory leak of temporary bitmap
    44e2bc80a6ec i2c: core: Restore acpi_walk_dep_device_list() getting called after registering the ACPI i2c devs
    f224b8be9e31 perf: correct SNOOPX field offset
    78e27678db4e sched/features: Fix !CONFIG_JUMP_LABEL case
    13153509d8f3 NTB: hw: amd: fix an issue about leak system resources
    abd19984441c nvmet: fix uninitialized work for zero kato
    5ef1279abc74 powerpc/pseries: Avoid using addr_to_pfn in real mode
    72ccbd1481cb powerpc/powernv/dump: Fix race while processing OPAL dump
    d21b8c8fbf89 lightnvm: fix out-of-bounds write to array devices->info[]
    b0b10fa454ea ARM: dts: meson8: remove two invalid interrupt lines from the GPU node
    7de30421d646 arm64: dts: zynqmp: Remove additional compatible string for i2c IPs
    64b8f8fbe939 ARM: OMAP2+: Restore MPU power domain if cpu_cluster_pm_enter() fails
    55a7acbc0495 soc: fsl: qbman: Fix return value on success
    c7ffa707e657 ARM: dts: owl-s500: Fix incorrect PPI interrupt specifiers
    d725df0e2bbb arm64: dts: actions: limit address range for pinctrl node
    449ad29d76f7 arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels
    845e4eefd3c4 arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
    b78cdf1b51fc arm64: dts: qcom: msm8916: Fix MDP/DSI interrupts
    1e61c8fda1bb arm64: dts: qcom: pm8916: Remove invalid reg size from wcd_codec
    975dafc038f0 arm64: dts: qcom: msm8916: Remove one more thermal trip point unit name
    08ece4ba2a6e arm64: dts: imx8mq: Add missing interrupts to GPC
    93c3898ee8df memory: fsl-corenet-cf: Fix handling of platform_get_irq() error
    c072b76699a4 memory: omap-gpmc: Fix build error without CONFIG_OF
    afb15453ca4c memory: omap-gpmc: Fix a couple off by ones
    8426055fc960 arm64: dts: allwinner: h5: remove Mali GPU PMU module
    ec65c6a90621 ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix dcdc1 regulator
    46ac92161144 ARM: s3c24xx: fix mmc gpio lookup tables
    e118c1527ffe ARM: at91: pm: of_node_put() after its usage
    5c4c2f437cea ARM: dts: imx6sl: fix rng node
    c1430c876984 arm64: dts: meson: vim3: correct led polarity
    6dbdc81b2625 netfilter: nf_fwd_netdev: clear timestamp in forwarding path
    2f3839075a5f netfilter: ebtables: Fixes dropping of small packets in bridge nat
    4d1eec59628c netfilter: conntrack: connection timeout after re-register
    e6b7b40aced7 scsi: bfa: Fix error return in bfad_pci_init()
    48df327e4b04 KVM: x86: emulating RDPID failure shall return #UD rather than #GP
    ad87f31648ab Input: sun4i-ps2 - fix handling of platform_get_irq() error
    cb3b77359a26 Input: twl4030_keypad - fix handling of platform_get_irq() error
    2f967303cbdd Input: omap4-keypad - fix handling of platform_get_irq() error
    2106d1cbe1c2 Input: ep93xx_keypad - fix handling of platform_get_irq() error
    b205eef76388 Input: stmfts - fix a & vs && typo
    81e5e2c268e9 Input: imx6ul_tsc - clean up some errors in imx6ul_tsc_resume()
    6498597aeb4c SUNRPC: fix copying of multiple pages in gss_read_proxy_verf()
    e412625f38a4 clk: imx8mq: Fix usdhc parents order
    b4035b3d64b6 vfio iommu type1: Fix memory leak in vfio_iommu_type1_pin_pages
    f54d8a9e37b0 vfio/pci: Clear token on bypass registration failure
    f2f616f3e333 ext4: limit entries returned when counting fsmap records
    9c27185e12e8 svcrdma: fix bounce buffers for unaligned offsets and multiple pages
    120222811b2e watchdog: sp5100: Fix definition of EFCH_PM_DECODEEN3
    dbb9ef17777e watchdog: Use put_device on error
    a8bbb47d94af watchdog: Fix memleak in watchdog_cdev_register
    9a3ee7177f72 clk: bcm2835: add missing release if devm_clk_hw_register fails
    c10e3c919a69 clk: at91: clk-main: update key before writing AT91_CKGR_MOR
    1ed7508e684e module: statically initialize init section freeing data
    b213999028e6 clk: mediatek: add UART0 clock support
    56e68e2cd8fe clk: rockchip: Initialize hw to error to avoid undefined behavior
    72407e5aa058 pwm: img: Fix null pointer access in probe
    7e5155fdd061 clk: keystone: sci-clk: fix parsing assigned-clock data during probe
    5b8882b53b0c clk: qcom: gcc-sdm660: Fix wrong parent_map
    fddcf515454e vfio/pci: Decouple PCI_COMMAND_MEMORY bit checks from is_virtfn
    42f16b3add6c PCI/IOV: Mark VFs as not implementing PCI_COMMAND_MEMORY
    aafa4b4c38e8 rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()
    833f3c362f63 PCI: iproc: Set affinity mask on MSI interrupts
    bcb9394accb6 PCI: aardvark: Check for errors from pci_bridge_emul_init() call
    bf65e6c51ac4 clk: meson: g12a: mark fclk_div2 as critical
    423e65dcd594 i2c: rcar: Auto select RESET_CONTROLLER
    63bd88ba8865 mailbox: avoid timer start from callback
    fe1936208e3f rapidio: fix the missed put_device() for rio_mport_add_riodev
    bfab0711eb27 rapidio: fix error handling path
    c5df8ff043c3 ramfs: fix nommu mmap with gaps in the page cache
    410f50b41c14 lib/crc32.c: fix trivial typo in preprocessor condition
    a3a45516c70e mm/page_owner: change split_page_owner to take a count
    06727f797f45 RDMA/rxe: Handle skb_clone() failure in rxe_recv.c
    6fa4d484bada f2fs: wait for sysfs kobject removal before freeing f2fs_sb_info
    f08ae0c46198 selftests/powerpc: Fix eeh-basic.sh exit codes
    180cf2e5f722 maiblox: mediatek: Fix handling of platform_get_irq() error
    e7f0b9ab8b7d RDMA/rxe: Fix skb lifetime in rxe_rcv_mcast_pkt()
    7efb373881f7 IB/rdmavt: Fix sizeof mismatch
    bc2cba6b2d5a cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier
    56c30ffe5fcd i3c: master: Fix error return in cdns_i3c_master_probe()
    ebe1a014d7ed powerpc/perf/hv-gpci: Fix starting index value
    271e53005a26 powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints
    dc1d4c658b9c RDMA/ipoib: Set rtnl_link_ops for ipoib interfaces
    c3a1c7b426b9 overflow: Include header file with SIZE_MAX declaration
    de47278648aa kdb: Fix pager search for multi-line strings
    626e2200f80b mtd: spinand: gigadevice: Add QE Bit
    8999f59944e3 mtd: spinand: gigadevice: Only one dummy byte in QUADIO
    2bb74bc921e0 mtd: rawnand: vf610: disable clk on error handling path in probe
    5e3782b1fae1 RDMA/hns: Fix missing sq_sig_type when querying QP
    eff57fbc2377 RDMA/hns: Fix the wrong value of rnr_retry when querying qp
    1e583b2948ae perf stat: Skip duration_time in setup_system_wide
    b79dd191680f i40iw: Add support to make destroy QP synchronous
    61ad14e24eba RDMA/mlx5: Disable IB_DEVICE_MEM_MGT_EXTENSIONS if IB_WR_REG_MR can't work
    4b1d559cc5c6 RDMA/hns: Set the unsupported wr opcode
    0ff75bfed10d perf intel-pt: Fix "context_switch event has no tid" error
    cee5080a0776 RDMA/cma: Consolidate the destruction of a cma_multicast in one place
    7c4fec28980d RDMA/cma: Remove dead code for kernel rdmacm multicast
    557c184df3c5 powerpc/64s/radix: Fix mm_cpumask trimming race vs kthread_use_mm
    148d4f4dc75e powerpc/tau: Disable TAU between measurements
    72407b8d08b3 powerpc/tau: Check processor type before enabling TAU interrupt
    68a8ec0b022f powerpc/tau: Remove duplicated set_thresholds() call
    c0578b423b5e powerpc/tau: Convert from timer to workqueue
    0305488040dc powerpc/tau: Use appropriate temperature sample interval
    a2087c04a2ac powerpc/book3s64/hash/4k: Support large linear mapping range with 4K
    8fd3154eb0ee RDMA/qedr: Fix inline size returned for iWARP
    97336c8296b5 RDMA/qedr: Fix return code if accept is called on a destroyed qp
    4c5f385ab49e RDMA/qedr: Fix use of uninitialized field
    e0a970d8f627 RDMA/qedr: Fix qp structure memory leak
    1738b03e34ad RDMA/umem: Prevent small pages from being returned by ib_umem_find_best_pgsz()
    85e40ba1c4a5 RDMA/umem: Fix ib_umem_find_best_pgsz() for mappings that cross a page boundary
    b1712ec30dfb xfs: fix high key handling in the rt allocator's query_range function
    b005b448daf2 xfs: fix deadlock and streamline xfs_getfsmap performance
    adc3e2698637 xfs: limit entries returned when counting fsmap records
    2577720d35e2 ida: Free allocated bitmap in error path
    3789f5cfd600 arc: plat-hsdk: fix kconfig dependency warning when !RESET_CONTROLLER
    67c2e58b684e ARM: 9007/1: l2c: fix prefetch bits init in L2X0_AUX_CTRL using DT values
    baa7ea082f8e mtd: mtdoops: Don't write panic data twice
    b8d4f65c6ae2 RDMA/mlx5: Fix potential race between destroy and CQE poll
    935950e3190d pseries/drmem: don't cache node id in drmem_lmb struct
    eb327e98631e powerpc/pseries: explicitly reschedule during drmem_lmb list traversal
    937cdcc45aaa RDMA/umem: Fix signature of stub ib_umem_find_best_pgsz()
    a43f936da88f RDMA/hns: Add a check for current state before modifying QP
    4a5aaa1747a3 mtd: lpddr: fix excessive stack usage with clang
    1564884a4176 RDMA/ucma: Add missing locking around rdma_leave_multicast()
    cc8ebd76b10a RDMA/ucma: Fix locking for ctx->events_reported
    22d8bebf634a powerpc/icp-hv: Fix missing of_node_put() in success path
    d2575bf27279 powerpc/pseries: Fix missing of_node_put() in rng_init()
    4f74f179a335 IB/mlx4: Adjust delayed work when a dup is observed
    1fe669e9ad19 IB/mlx4: Fix starvation in paravirt mux/demux
    8d44d75812cf i3c: master add i3c_master_attach_boardinfo to preserve boardinfo
    e7f826cd20a6 selftests/ftrace: Change synthetic event name for inter-event-combined test
    17ed6448b00c fs: fix NULL dereference due to data race in prepend_path()
    91e4c12a3bf4 mm, oom_adj: don't loop through tasks in __set_oom_adj when not necessary
    9a1656f1d19b mm/memcg: fix device private memcg accounting
    04fabdfcbf5d mm/swapfile.c: fix potential memory leak in sys_swapon
    8194371c4d60 netfilter: nf_log: missing vlan offload tag and proto
    a6aaab712d6a net: korina: fix kfree of rx/tx descriptor array
    76c0e4b2a50f ipvs: clear skb->tstamp in forwarding path
    7c83fe15ecb1 mwifiex: fix double free
    91962ac35b48 platform/x86: mlx-platform: Remove PSU EEPROM configuration
    dddb49f4152a ipmi_si: Fix wrong return value in try_smi_init()
    b2a98fec2d1e scsi: be2iscsi: Fix a theoretical leak in beiscsi_create_eqs()
    9899e57bd714 scsi: target: tcmu: Fix warning: 'page' may be used uninitialized
    2fb431e69ad6 usb: dwc2: Fix INTR OUT transfers in DDMA mode.
    3fed2b5657e4 nl80211: fix non-split wiphy information
    6aa25d03dfb5 usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
    9af716ed41e4 usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed and above.
    2f002b5172b2 iwlwifi: mvm: split a print to avoid a WARNING in ROC
    1dbf9d994b12 mfd: sm501: Fix leaks in probe()
    df63949a2750 net: enic: Cure the enic api locking trainwreck
    7c48d6e80e70 iio: adc: stm32-adc: fix runtime autosuspend delay when slow polling
    cbe5109aa47b qtnfmac: fix resource leaks on unsupported iftype error return path
    1d3188378d9b ibmvnic: set up 200GBPS speed
    da012618c502 coresight: etm: perf: Fix warning caused by etm_setup_aux failure
    56365dbb3ec2 nl80211: fix OBSS PD min and max offset validation
    99e8886339fa nvmem: core: fix possibly memleak when use nvmem_cell_info_to_nvmem_cell()
    903bee2ebff1 HID: hid-input: fix stylus battery reporting
    1ad7f52fe668 ASoC: fsl_sai: Instantiate snd_soc_dai_driver
    56c1c45bb82d slimbus: qcom-ngd-ctrl: disable ngd in qmi server down callback
    5bfd32bb16dc slimbus: core: do not enter to clock pause mode in core
    9da3ff3368b7 slimbus: core: check get_addr before removing laddr ida
    b7e2b1fe04bf quota: clear padding in v2r1_mem2diskdqb()
    3fcd75ae29b5 usb: dwc2: Fix parameter type in function pointer prototype
    f70650083b9e ALSA: seq: oss: Avoid mutex lock for a long-time ioctl
    6f04266d084d misc: mic: scif: Fix error handling path
    a7bf4cf31f57 dmaengine: dmatest: Check list for emptiness before access its last entry
    4ca39ef88adc ath6kl: wmi: prevent a shift wrapping bug in ath6kl_wmi_delete_pstream_cmd()
    572a7d15f2d1 spi: omap2-mcspi: Improve performance waiting for CHSTAT
    98d0b2742fe0 net: dsa: rtl8366rb: Support all 4096 VLANs
    06ba92787790 ASoC: tlv320aic32x4: Fix bdiv clock rate derivation
    0f5203a88ca4 net: wilc1000: clean up resource in error path of init mon interface
    26751638ff09 net: dsa: rtl8366: Skip PVID setting if not requested
    11064fef1bb1 net: dsa: rtl8366: Refactor VLAN/PVID init
    09cb271bcbde net: dsa: rtl8366: Check validity of passed VLANs
    714ca2d03282 xhci: don't create endpoint debugfs entry before ring buffer is set.
    1a31fa71d979 coresight: etm4x: Handle unreachable sink in perf mode
    ed8b90d303cf drm: mxsfb: check framebuffer pitch
    c8bc46fc01e4 cpufreq: armada-37xx: Add missing MODULE_DEVICE_TABLE
    1122f2a7833c net: stmmac: use netif_tx_start|stop_all_queues() function
    148b49be7277 scsi: mpt3sas: Fix sync irqs
    e757a39c2d84 net/mlx5: Don't call timecounter cyc2time directly from 1PPS flow
    50185a14fe8e pinctrl: mcp23s08: Fix mcp23x17 precious range
    5e829cdd6d62 pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
    44a83bd3243b iomap: Clear page error before beginning a write
    82ef2b6a9b6c drm/panfrost: Ensure GPU quirks are always initialised
    a74f0f0a6265 drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
    02bf8fbfb445 HID: roccat: add bounds checking in kone_sysfs_write_settings()
    4d861784f0eb ASoC: fsl: imx-es8328: add missing put_device() call in imx_es8328_probe()
    23159b4375a4 video: fbdev: radeon: Fix memleak in radeonfb_pci_register
    2370d94aed41 video: fbdev: sis: fix null ptr dereference
    67e65396cd56 video: fbdev: vga16fb: fix setting of pixclock because a pass-by-value error
    be700c52ae00 drivers/virt/fsl_hypervisor: Fix error handling path
    bf12e769ff2a pwm: lpss: Add range limit check for the base_unit register value
    34f326e702fd pwm: lpss: Fix off by one error in base_unit math in pwm_lpss_prepare()
    2b6fb30cb49d pty: do tty_flip_buffer_push without port->lock in pty_write
    bf94a8754f2a tty: hvcs: Don't NULL tty->driver_data until hvcs_cleanup()
    f3f79d92ca71 tty: serial: earlycon dependency
    2b150aa2e3ef binder: Remove bogus warning on failed same-process transaction
    48c121a74fb6 drm/crc-debugfs: Fix memleak in crc_control_write
    751c4cf0ee62 drm: panel: Fix bpc for OrtusTech COM43H4M85ULC panel
    d911c0e9fcf0 mm/error_inject: Fix allow_error_inject function signatures.
    ebc1d548a729 VMCI: check return value of get_user_pages_fast() for errors
    659da2df0c5d staging: emxx_udc: Fix passing of NULL to dma_alloc_coherent()
    f87f0236bdbb backlight: sky81452-backlight: Fix refcount imbalance on error
    517f0785cef9 scsi: csiostor: Fix wrong return value in csio_hw_prep_fw()
    a28b846431c6 scsi: qla2xxx: Fix wrong return value in qla_nvme_register_hba()
    835e3a595aa3 scsi: qla2xxx: Fix wrong return value in qlt_chk_unresolv_exchg()
    49fc81280f83 scsi: qla4xxx: Fix an error handling path in 'qla4xxx_get_host_stats()'
    58826ecb7385 drm/gma500: fix error check
    84b79c485356 staging: rtl8192u: Do not use GFP_KERNEL in atomic context
    dc432c231f4a mwifiex: Do not use GFP_KERNEL in atomic context
    7bf50ff5a32c brcmfmac: check ndev pointer
    eb4bb7e520a7 ASoC: qcom: lpass-cpu: fix concurrency issue
    cab19b7f827b ASoC: qcom: lpass-platform: fix memory leak
    0627ae9be941 wcn36xx: Fix reported 802.11n rx_highest rate wcn3660/wcn3680
    a3cf5b3ad12d ath10k: Fix the size used in a 'dma_free_coherent()' call in an error handling path
    9981ef0f9cfa ath9k: Fix potential out of bounds in ath9k_htc_txcompletion_cb()
    80ff60f046f4 ath6kl: prevent potential array overflow in ath6kl_add_new_sta()
    e2a1b94f7fd2 drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel
    0a5630dee31f drm/amd/display: Fix wrong return value in dm_update_plane_state()
    0d234d1135dc Bluetooth: hci_uart: Cancel init work before unregistering
    e99958ec096b drm/vkms: fix xrgb on compute crc
    0ae399b5da2a ath10k: provide survey info as accumulated data
    450d03435ca9 blk-mq: move cancel of hctx->run_work to the front of blk_exit_queue
    96bc5e4cb4c8 spi: spi-s3c64xx: Check return values
    a053db13b3e6 spi: spi-s3c64xx: swap s3c64xx_spi_set_cs() and s3c64xx_enable_datapath()
    fcf7bf406590 pinctrl: bcm: fix kconfig dependency warning when !GPIOLIB
    0120ec32a777 regulator: resolve supply after creating regulator
    cd68531d2981 media: ti-vpe: Fix a missing check and reference count leak
    5c4ffc07f92e media: stm32-dcmi: Fix a reference count leak
    a05590cc08e3 media: s5p-mfc: Fix a reference count leak
    0747ff17aa6c media: camss: Fix a reference count leak.
    28b21e02dce9 media: platform: fcp: Fix a reference count leak.
    4e954d4dea1e media: rockchip/rga: Fix a reference count leak.
    aa60f4ad0707 media: rcar-vin: Fix a reference count leak.
    55d01160af68 media: tc358743: cleanup tc358743_cec_isr
    de566409e3ad media: tc358743: initialize variable
    3c66762f0c64 media: mx2_emmaprp: Fix memleak in emmaprp_probe
    7fb271426a70 cypto: mediatek - fix leaks in mtk_desc_ring_alloc
    cc0f25040972 hwmon: (pmbus/max34440) Fix status register reads for MAX344{51,60,61}
    90e8f87c0b25 crypto: omap-sham - fix digcnt register handling with export/import
    0db26c777a25 media: rcar-csi2: Allocate v4l2_async_subdev dynamically
    7906b7a7ce1d media: rcar_drif: Allocate v4l2_async_subdev dynamically
    58e2bcb7fa43 media: rcar_drif: Fix fwnode reference leak when parsing DT
    79ec0578c7e0 media: i2c: ov5640: Enable data pins on poweron for DVP mode
    b2f8546056b3 media: i2c: ov5640: Separate out mipi configuration from s_power
    b9ccea540564 media: i2c: ov5640: Remain in power down for DVP mode unless streaming
    8409370ae02e media: omap3isp: Fix memleak in isp_probe
    79a41d2357c6 media: staging/intel-ipu3: css: Correctly reset some memory
    8bcc5c270771 media: uvcvideo: Silence shift-out-of-bounds warning
    8504250759f4 media: uvcvideo: Set media controller entity functions
    8b426d665a41 media: m5mols: Check function pointer in m5mols_sensor_power
    361a1b76b2d2 media: ov5640: Correct Bit Div register in clock tree diagram
    7052f4c5ab51 media: Revert "media: exynos4-is: Add missed check for pinctrl_lookup_state()"
    c6243d107c32 media: tuner-simple: fix regression in simple_set_radio_freq
    ac36f94d34df crypto: picoxcell - Fix potential race condition bug
    71444295839c crypto: ixp4xx - Fix the size used in a 'dma_free_coherent()' call
    3dd9ffbb6eda crypto: mediatek - Fix wrong return value in mtk_desc_ring_alloc()
    528acbf310ff crypto: algif_skcipher - EBUSY on aio should be an error
    d6623eea9abb x86/events/amd/iommu: Fix sizeof mismatch
    200f13d0d9a1 x86/nmi: Fix nmi_handle() duration miscalculation
    b257bb437dc3 perf/x86/intel/uncore: Reduce the number of CBOX counters
    e089a75b7786 perf/x86/intel/uncore: Update Ice Lake uncore units
    cfa97676cb44 sched/fair: Fix wrong cpu selecting from isolated domain
    500a98894821 drivers/perf: thunderx2_pmu: Fix memory resource error handling
    1731c693a62c drivers/perf: xgene_pmu: Fix uninitialized resource struct
    7e297c83e64d x86/fpu: Allow multiple bits in clearcpuid= parameter
    ab6bb1c1f1de perf/x86/intel/ds: Fix x86_pmu_stop warning for large PEBS
    9aee8216556e EDAC/ti: Fix handling of platform_get_irq() error
    64a9f5a30fbb EDAC/aspeed: Fix handling of platform_get_irq() error
    4d86328e42c3 EDAC/i5100: Fix error handling order in i5100_init_one()
    24543df3f491 crypto: caam/qi - add fallback for XTS with more than 8B IV
    66ec3755f791 crypto: algif_aead - Do not set MAY_BACKLOG on the async path
    68e3b25444cb ima: Don't ignore errors from crypto_shash_update()
    4a62024168c3 KVM: SVM: Initialize prev_ga_tag before use
    39ba2b6c3d11 KVM: x86/mmu: Commit zap of remaining invalid pages when recovering lpages
    413aeed19567 KVM: nVMX: Reload vmcs01 if getting vmcs12's pages fails
    f9ac2036344a KVM: nVMX: Reset the segment cache when stuffing guest segs
    a5513655cfee SMB3: Resolve data corruption of TCP server info fields
    aeaa30720d67 cifs: Return the error from crypt_message when enc/dec key not found.
    65604f3ea2f2 cifs: remove bogus debug code
    706538edacc6 ALSA: hda/realtek: Enable audio jacks of ASUS D700SA with ALC887
    5e19bf634c92 ALSA: hda/realtek - Add mute Led support for HP Elitebook 845 G7
    995a90e70429 ALSA: hda/realtek - set mic to auto detect on a HP AIO machine
    a40f49438a15 ALSA: hda/realtek - The front Mic on a HP machine doesn't work
    8df0ffe2f32c icmp: randomize the global rate limiter
    9fa95d101caf tcp: fix to update snd_wl1 in bulk receiver fast path
    c5e4e010f39e selftests: rtnetlink: load fou module for kci_test_encap_fou() test
    6f7c40767bf4 selftests: forwarding: Add missing 'rp_filter' configuration
    f93a27b0f301 r8169: fix operation under forced interrupt threading
    68db21094ee5 nfc: Ensure presence of NFC_ATTR_FIRMWARE_NAME attribute in nfc_genl_fw_download()
    2f58abe7708a nexthop: Fix performance regression in nexthop deletion
    d6d478290815 net/sched: act_tunnel_key: fix OOB write in case of IPv6 ERSPAN tunnels
    09ea22aa3681 net: Properly typecast int values to set sk_max_pacing_rate
    432336b3cf2a net: hdlc_raw_eth: Clear the IFF_TX_SKB_SHARING flag after calling ether_setup
    62d366f8e570 net: hdlc: In hdlc_rcv, check to make sure dev is an HDLC device
    1a3c8d6acbfc net: ftgmac100: Fix Aspeed ast2600 TX hang issue
    7a6a016c5281 ibmvnic: save changed mac address to adapter->mac_addr
    416eec363622 chelsio/chtls: correct function return and return type
    15110ce6e26f chelsio/chtls: correct netdevice for vlan interface
    fe97af291fee chelsio/chtls: fix socket lock
    750e81e2dbc0 nvme-pci: disable the write zeros command for Intel 600P/P3100
    a86bf1d8b19c ALSA: hda/hdmi: fix incorrect locking in hdmi_pcm_close
    17784cec2da4 ALSA: hda: fix jack detection with Realtek codecs when in D3
    8bedcbceaaa3 ALSA: bebob: potential info leak in hwdep_read()
    401d4d79a8ed binder: fix UAF when releasing todo list
    711c0471ef17 cxgb4: handle 4-tuple PEDIT to NAT mode translation
    5f269cb9e513 r8169: fix data corruption issue on RTL8402
    c5b868eecb4f net_sched: remove a redundant goto chain check
    ba05057bd056 net/ipv4: always honour route mtu during forwarding
    46a55a44cc75 net: j1939: j1939_session_fresh_new(): fix missing initialization of skbcnt
    25bd9ea1ae5b can: j1935: j1939_tp_tx_dat_new(): fix missing initialization of skbcnt
    b0342b87cad8 can: m_can_platform: don't call m_can_class_suspend in runtime suspend
    c4099221dbc0 socket: fix option SO_TIMESTAMPING_NEW
    7d31e5722cbf tipc: fix the skb_unshare() in tipc_buf_append()
    dd3f58f499d0 net: usb: qmi_wwan: add Cellient MPL200 card
    65033e39f728 net/tls: sendfile fails with ktls offload
    926210cd8158 net/smc: fix valid DMBE buffer sizes
    cdd3c52a983e net: fix pos incrementment in ipv6_route_seq_next
    f08752a4498b net: fec: Fix PHY init after phy_reset_after_clk_enable()
    9e70485b40c8 net: fec: Fix phy_device lookup for phy_reset_after_clk_enable()
    0b41975f7b78 mlx4: handle non-napi callers to napi_poll
    3392c9d8f9aa ipv4: Restore flowi4_oif update before call to xfrm_lookup_route
    b7d2587f726a ibmveth: Identify ingress large send packets.
    b809bead48a3 ibmveth: Switch order of ibmveth_helper calls.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c8e93b427c..563f2d5b76 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a220745e2a874a1f56634152dba239070995a83b"
-SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
+SRCREV_machine ?= "689799c6846313eb19566dd4afb69d30353dd351"
+SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.72"
+LINUX_VERSION ?= "5.4.73"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 26c603dbfe..9f17d56b6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.72"
+LINUX_VERSION ?= "5.4.73"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "66a8c42b2503c35b2f309085b849edd4f214822b"
-SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
+SRCREV_machine_qemuarm ?= "f37a22c3ddab9db618ad302cce77825dae2cda87"
+SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 43b2789fdf..eb2793c9a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "938960a91a6e4e55f867722d43b7c0110113eebf"
-SRCREV_machine_qemuarm64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_machine_qemumips ?= "b8f39a8dad8c8a5ceaca8bd0ddfd4505dc219c0d"
-SRCREV_machine_qemuppc ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_machine_qemuriscv64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_machine_qemux86 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_machine_qemux86-64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_machine_qemumips64 ?= "530c7d0e9e387aab458ede6dc80cd3903c09c0ba"
-SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
-SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
+SRCREV_machine_qemuarm ?= "395c666f57d262a7a7c3553fd0eb40b8339cd9fe"
+SRCREV_machine_qemuarm64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_machine_qemumips ?= "fe7fedf978258fca785ceae508f87f6563c37a27"
+SRCREV_machine_qemuppc ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_machine_qemuriscv64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_machine_qemux86 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_machine_qemux86-64 ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_machine_qemumips64 ?= "536bda19159206ac7f60165f71bbf892cb8ad3fd"
+SRCREV_machine ?= "08b83b0eb0ff8fe7a8dae5aa4ef7f8eec7542806"
+SRCREV_meta ?= "8df18409861d25d9ca84b80c9ca8181a48f6ee45"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.72"
+LINUX_VERSION ?= "5.4.73"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

