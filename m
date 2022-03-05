Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821F9C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:29 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.1641.1646443528138319775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AH0JO/bM;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id g21so10908169vsp.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u6OhCWSz8TAcUgub0lAuyx8lOMCeLUp6Wpg5G0ZdrOM=;
        b=AH0JO/bMoDtSpUhjj1CmzUrP9CB59r6hHO+2O5Fwu2x5qJzSAnM+tec1tMpq1Foven
         fMT1dDDraetWJS70PetbSJhQTCjqFsllFIgB1Q05w8jM8lBd70Ls2JZRZX0CuzGFPeS6
         k34F6UR6yxFKeZ6atd0DJcrN+F9LQGEx3nyeeeLJ3p3YfdmXWp55kWxNFKubY7iwrd/i
         fXBb6ww0b7ivktMQMnX74Z+05wlUplYnbOttxVBBvk1Df/hmtLt6veve3s4m/WzRCrhw
         aFVyUFngurYzzx/332UBNl+oDo/nOU++e3CUreVTf20GhKClQ5cqFpPsOivnHyTZ+IRm
         EzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u6OhCWSz8TAcUgub0lAuyx8lOMCeLUp6Wpg5G0ZdrOM=;
        b=z5r8nCpiOOQ43dHmdsdSXcnmcUXXJiP+f3p3Witw/HccnUppqi9DIOPwHp0mhIfdOU
         pL55TAcJ30FziR2dWlM6SX718WLfPvU+MATo52gCSXGpEmrI4mpavDtthmrBaNm6XPMM
         aVAa9fcZpDih24xmuMRUSpy/DZcmXiYeX61qOLldlZbhHVTo5U/OIqonMZ918UNGmp3J
         lZ3OBgs8stgGjIwgfl3sY93u7xvxHrZGWrg3RmpirOW2xnMIauA8oWGBBEDCfhk3TEtF
         s7x/VvClndkboefDWjvvMynslpl1++98rRFM8Sug0/psQHpCNMs12/s89bJ7WIfcoB43
         FAAQ==
X-Gm-Message-State: AOAM531aKDycgFkmFjc3nboprxcJvoqQpSGFqjURiWP5N07FkJvoX8t5
	cHhDganLBI87dacDMYJ9CSGhoM6Hzb5fEQ==
X-Google-Smtp-Source: 
 ABdhPJwhd8jTFCXnATLEe9T1VSB/uYhlTYo5HD+OQ0VPbbZB65FSyIgri4jRhGRfIXkNcfujsNukEA==
X-Received: by 2002:a67:be0f:0:b0:31f:adb0:eb17 with SMTP id
 x15-20020a67be0f000000b0031fadb0eb17mr645662vsq.69.1646443526942;
        Fri, 04 Mar 2022 17:25:26 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto/5.15: update to v5.15.26
Date: Fri,  4 Mar 2022 20:25:15 -0500
Message-Id: 
 <7d7734eaec8d712e4752eafbcf153d0424501400.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162772

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    8993e6067f26 Linux 5.15.26
    3c805fce07c9 ice: fix concurrent reset and removal of VFs
    26bc7197f9d3 ice: Fix race conditions between virtchnl handling and VF ndo ops
    fd21a0b6da94 memblock: use kfree() to release kmalloced memblock regions
    83f331d1debb gpio: tegra186: Fix chip_data type confusion
    a15769155440 pinctrl: k210: Fix bias-pull-up
    e3a751ee48f9 pinctrl: fix loop in k210_pinconf_get_drive()
    92cab57ea6d7 tty: n_gsm: fix deadlock in gsmtty_open()
    06bce5327b76 tty: n_gsm: fix wrong modem processing in convergence layer type 2
    1bc6f3b19bc6 tty: n_gsm: fix wrong tty control line for flow control
    50cacb783bb3 tty: n_gsm: fix NULL pointer access due to DLCI release
    519d0b389c10 tty: n_gsm: fix proper link termination after failed open
    4f0ab1c8a5a6 tty: n_gsm: fix encoding of control signal octet bit DV
    1851b9a46706 riscv: fix oops caused by irqsoff latency tracer
    e0ff4dffded5 riscv: fix nommu_k210_sdcard_defconfig
    72aa720acacf IB/qib: Fix duplicate sysfs directory name
    7a7e1b3aeef7 tps6598x: clear int mask on probe failure
    bde6a6b111b9 staging: fbtft: fb_st7789v: reset display before initialization
    ba9efbbf6745 thermal: int340x: fix memory leak in int3400_notify()
    00265efbd3e5 RDMA/cma: Do not change route.addr.src_addr outside state checks
    8df508b7a44c btrfs: prevent copying too big compressed lzo segment
    d2bef2cbd3b1 driver core: Free DMA range map when device is released
    453a82127f17 mtd: core: Fix a conflict between MTD and NVMEM on wp-gpios property
    fcd3f5906d64 nvmem: core: Fix a conflict between MTD and NVMEM on wp-gpios property
    ce94606060d7 xhci: Prevent futile URB re-submissions due to incorrect return value.
    c8b38e557414 xhci: re-initialize the HC during resume if HCE was set
    88f69c64443f usb: dwc3: gadget: Let the interrupt handler disable bottom halves.
    83e0190fb77c usb: dwc3: pci: Fix Bay Trail phy GPIO mappings
    e62f41a6528f usb: dwc3: pci: Add "snps,dis_u2_susphy_quirk" for Intel Bay Trail
    943a914d3dab usb: dwc2: drd: fix soft connect when gadget is unconfigured
    85171fbf714c USB: serial: option: add Telit LE910R1 compositions
    c331aa7e7064 USB: serial: option: add support for DW5829e
    6db927ce66ac tracefs: Set the group ownership in apply_options() not parse_options()
    2c775ad1fd5e USB: gadget: validate endpoint index for xilinx udc
    da514063440b usb: gadget: rndis: add spinlock for rndis response list
    f7c9fd0dff99 Revert "USB: serial: ch341: add new Product ID for CH341A"
    27089f04fac6 ata: pata_hpt37x: disable primary channel on HPT371
    4e508c593573 sc16is7xx: Fix for incorrect data being transmitted
    72b0fba2dd4d iio: Fix error handling for PM
    1f05c7568445 iio: imu: st_lsm6dsx: wait for settling time in st_lsm6dsx_read_oneshot
    c77f4ae7bd43 iio: accel: fxls8962af: add padding to regmap for SPI
    ca9d1799be68 iio: adc: ad7124: fix mask used for setting AIN_BUFP & AIN_BUFM bits
    0cb9b2f73c18 iio: adc: tsc2046: fix memory corruption by preventing array overflow
    fe7347780298 iio: adc: men_z188_adc: Fix a resource leak in an error handling path
    7bdf7d5f0cbd iio:imu:adis16480: fix buffering for devices with no burst mode
    9000406481a5 tracing: Have traceon and traceoff trigger honor the instance
    7e35b31e2cee tracing: Dump stacktrace trigger to the corresponding instance
    c8b56e51aa91 RDMA/ib_srp: Fix a deadlock
    e7a66dd26877 configfs: fix a race in configfs_{,un}register_subsystem()
    a94879d41917 bnxt_en: Increase firmware message response DMA wait time
    27440589551f RDMA/rtrs-clt: Move free_permit from free_clt to rtrs_clt_close
    bf2cfad0c6e4 RDMA/rtrs-clt: Fix possible double free in error case
    ff999198ec21 net-timestamp: convert sk->sk_tskey to atomic_t
    d99dcdabc52a regmap-irq: Update interrupt clear register for proper reset
    43221f446c02 gpio: rockchip: Reset int_bothedge when changing trigger
    3c32405d6474 spi: spi-zynq-qspi: Fix a NULL pointer dereference in zynq_qspi_exec_mem_op()
    2378f94c8d9b net/mlx5: Update log_max_qp value to be 17 at most
    6e94d2863384 net/mlx5e: kTLS, Use CHECKSUM_UNNECESSARY for device-offloaded packets
    95c1867704d0 net/mlx5e: MPLSoUDP decap, fix check for unsupported matches
    d4d188487ddc net/mlx5: DR, Fix the threshold that defines when pool sync is initiated
    9703a9e2f968 net/mlx5: Fix wrong limitation of metadata match on ecpf
    f63548dd05ab net/mlx5: Fix possible deadlock on rule deletion
    837b0d2e69e8 net/mlx5: DR, Don't allow match on IP w/o matching on full ethertype/ip_version
    954997aeb8f2 ibmvnic: schedule failover only if vioctl fails
    117a5a7f019e net/mlx5: DR, Cache STE shadow memory
    6b6094db77e6 udp_tunnel: Fix end of loop test in udp_tunnel_nic_unregister()
    4039254acbd4 surface: surface3_power: Fix battery readings on batteries without a serial number
    062772d5cc8c net/smc: Use a mutex for locking "struct smc_pnettable"
    e96e204ee6fa netfilter: nf_tables: fix memory leak during stateful obj update
    7d258451d345 net: mdio-ipq4019: add delay after clock enable
    9d8097caa732 nfp: flower: Fix a potential leak in nfp_tunnel_add_shared_mac()
    8ffb8ac34488 netfilter: nf_tables: unregister flowtable hooks on netns exit
    2e15fa8091de net: Force inlining of checksum functions in net/checksum.h
    be2d38247657 net: ll_temac: check the return value of devm_kmalloc()
    a95ea90deb30 net/sched: act_ct: Fix flow table lookup after ct clear or switching zones
    d064d0c39405 drm/i915/dg2: Print PHY name properly on calibration error
    eae86ab32069 drm/vc4: crtc: Fix runtime_pm reference counting
    163e50b00530 net/mlx5e: Fix wrong return value on ioctl EEPROM query failure
    143dafa60aa7 drm/edid: Always set RGB444
    f941104aa116 openvswitch: Fix setting ipv6 fields causing hw csum failure
    62ca33976ddc net: mv643xx_eth: process retval from of_get_mac_address
    899e56a1ad43 gso: do not skip outer ip header in case of ipip and net_failover
    0a9bc4179c30 tipc: Fix end of loop tests for list_for_each_entry()
    8270e92a0e42 nvme: also mark passthrough-only namespaces ready in nvme_update_ns_info
    6f2e0ae12aa8 net: __pskb_pull_tail() & pskb_carve_frag_list() drop_monitor friends
    c718ea4e7382 io_uring: add a schedule point in io_add_buffers()
    8628f489b749 bpf: Add schedule points in batch ops
    976406c5cc00 bpf: Fix a bpf_timer initialization issue
    755d4b744056 selftests: bpf: Check bpf_msg_push_data return value
    5d75e374eb77 bpf: Do not try bpf_msg_push_data with len 0
    719d1c2524c8 bpf: Fix crash due to incorrect copy_map_value
    de49b0e1cf62 net/mlx5: Update the list of the PCI supported devices
    9594d817b5eb ice: initialize local variable 'tlv'
    b3615ea66b91 ice: check the return of ice_ptp_gettimex64
    7e8da9964437 net/mlx5: Fix tc max supported prio for nic mode
    7efe8499cb90 hwmon: Handle failure to register sensor with thermal zone correctly
    86da2e4a1284 bnxt_en: Fix incorrect multicast rx mask setting when not requested
    24931b4d199e bnxt_en: Fix offline ethtool selftest with RDMA enabled
    f84bbb9893bd bnxt_en: Fix active FEC reporting to ethtool
    1243861bc002 bnx2x: fix driver load from initrd
    7c844c7af784 selftests: mptcp: be more conservative with cookie MPJ limits
    f76977643339 selftests: mptcp: fix diag instability
    f25ae162f4b3 mptcp: add mibs counter for ignored incoming options
    150d1e06c4f1 mptcp: fix race in incoming ADD_ADDR option processing
    40bbab9d4ed7 perf data: Fix double free in perf_session__delete()
    05ef4f56173e perf evlist: Fix failed to use cpu list for uncore events
    0b92b5f4c50b gpu: host1x: Always return syncpoint value when waiting
    734d80b4365a Revert "i40e: Fix reset bw limit when DCB enabled with 1 TC"
    1cfb33b338fb ping: remove pr_err from ping_lookup
    2922aff43397 optee: use driver internal tee_context for some rpc
    0efdc0360395 tee: export teedev_open() and teedev_close_context()
    6c5d780469d6 netfilter: nf_tables_offload: incorrect flow offload action array size
    144f3008524c netfilter: xt_socket: missing ifdef CONFIG_IP6_NF_IPTABLES dependency
    cb2313b216be netfilter: xt_socket: fix a typo in socket_mt_destroy()
    49909c9f8458 CDC-NCM: avoid overflow in sanity checking
    4b77aab7ada7 USB: zaurus: support another broken Zaurus
    9f2d61477990 sr9700: sanity check for packet length
    0726fca0b6cc drm/i915: Fix bw atomic check when switching between SAGV vs. no SAGV
    1b4445e09df8 drm/i915: Correctly populate use_sagv_wm for all pipes
    7782e3c4e539 drm/i915: Widen the QGV point mask
    8840d963e566 drm/amdgpu: do not enable asic reset for raven2
    70b2413ac30c drm/amdgpu: disable MMHUB PG for Picasso
    ea44fcee7e3d drm/amd: Check if ASPM is enabled from PCIe subsystem
    c00e4c01f470 drm/amd/pm: fix some OEM SKU specific stability issues
    211b67fb5a49 drm/amd/display: Protect update_bw_bounding_box FPU code.
    4c3644b6c96c KVM: x86/mmu: make apf token non-zero to fix bug
    759e5dc6554d parisc/unaligned: Fix ldw() and stw() unalignment handlers
    bf0b3d61e002 parisc/unaligned: Fix fldd and fstd unaligned handlers on 32-bit kernel
    960d474e451b vhost/vsock: don't check owner in vhost_vsock_stop() while releasing
    af091cc27e37 selinux: fix misuse of mutex_is_locked()
    0d773aaf5a90 io_uring: disallow modification of rsrc_data during quiesce
    7c83437fb3ae io_uring: don't convert to jiffies for waiting on timeouts
    6d20ff677349 clk: jz4725b: fix mmc0 clock gating
    b80fbc20f334 btrfs: tree-checker: check item_size for dev_item
    7e80846a9927 btrfs: tree-checker: check item_size for inode_item
    a6d9692cadb9 x86/ptrace: Fix xfpregs_set()'s incorrect xmm clearing
    ebeb7b73571e cgroup-v1: Correct privileges check in release_agent writes
    ffed0bf6a63d cgroup/cpuset: Fix a race between cpuset_attach() and cpu hotplug
    f89903ae99bd mm/filemap: Fix handling of THPs in generic_file_buffered_read()
    1e7beca28299 Linux 5.15.25
    5dcc36569734 lockdep: Correct lock_classes index mapping
    c2df4c62a189 i2c: brcmstb: fix support for DSL and CM variants
    ec7d87b64e78 ice: enable parsing IPSEC SPI headers for RSS
    0b4ea5b72b17 scsi: qedi: Fix ABBA deadlock in qedi_process_tmf_resp() and qedi_process_cmd_cleanup_resp()
    795feafb7234 copy_process(): Move fd_install() out of sighand->siglock critical section
    3e41445287af dmaengine: ptdma: Fix the error handling path in pt_core_init()
    8641ceb41f30 i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
    7512f91bc313 i2c: qcom-cci: don't delete an unregistered adapter
    052707279e70 tests: fix idmapped mount_setattr test
    6b186a23af0d dmaengine: sh: rcar-dmac: Check for error num after dma_set_max_seg_size
    4f3a0737992c dmaengine: stm32-dmamux: Fix PM disable depth imbalance in stm32_dmamux_probe
    62e228e3e169 dmaengine: sh: rcar-dmac: Check for error num after setting mask
    f4a821b098c5 net: sched: limit TC_ACT_REPEAT loops
    2b2be95b6013 ucounts: Move RLIMIT_NPROC handling after set_user
    b5f949d9a9c3 rlimit: Fix RLIMIT_NPROC enforcement failure caused by capability calls in set_user
    114e9f141822 lib/iov_iter: initialize "flags" in new pipe_buffer
    2d2d92cfcd3b ucounts: Enforce RLIMIT_NPROC not RLIMIT_NPROC+1
    efc853d8ffd5 ucounts: Base set_cred_ucounts changes on the real user
    f418bfabea43 ucounts: In set_cred_ucounts assume new->ucounts is non-NULL
    d464492eb391 ucounts: Handle wrapping in is_ucounts_overlimit
    e1e26697d032 EDAC: Fix calculation of returned address and next offset in edac_align_ptr()
    e6da726eb67d scsi: lpfc: Fix pt2pt NVMe PRLI reject LOGO loop
    3f2bc7f028f6 kconfig: fix failing to generate auto.conf
    88289d56cb28 net: macb: Align the dma and coherent dma masks
    b501b0f4e113 net: usb: qmi_wwan: Add support for Dell DW5829e
    1ddab2ee8829 drm/amd/display: fix yellow carp wm clamping
    929b2eddebc2 drm/amd/display: Cap pflip irqs per max otg number
    3fd92f5be6c4 display/amd: decrease message verbosity about watermarks table failure
    eb61dbb192b1 tracing: Fix tp_printk option related with tp_printk_stop_on_boot
    893297940084 drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
    9921c866dc36 xprtrdma: fix pointer derefs in error cases of rpcrdma_ep_create
    b5caba5efbab soc: aspeed: lpc-ctrl: Block error printing on probe defer cases
    71720cae1cad ata: libata-core: Disable TRIM on M88V29
    62542c5f18a1 kconfig: let 'shell' return enough output for deep path names
    004458327695 ACPI: PM: Revert "Only mark EC GPE for wakeup on Intel systems"
    246dfbc12539 mm: io_uring: allow oom-killer from io_uring_setup
    54d69f072d5e selftests: fixup build warnings in pidfd / clone3 tests
    fc6d187f2986 pidfd: fix test failure due to stack overflow on some arches
    9659711c3248 arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610
    42b3092ccfb1 arm64: dts: meson-g12: add ATF BL32 reserved-memory region
    de3b10b7ccc6 arm64: dts: meson-gx: add ATF BL32 reserved-memory region
    5644bf688e4a ksmbd: don't align last entry offset in smb2 query directory
    03dd71e0b9d8 ksmbd: fix same UniqueId for dot and dotdot entries
    7afed8b3608e netfilter: conntrack: don't refresh sctp entries in closed state
    f7b95b396700 x86/bug: Merge annotate_reachable() into _BUG_FLAGS() asm
    c4315bffe5d0 irqchip/sifive-plic: Add missing thead,c900-plic match string
    459b97c958c1 phy: phy-mtk-tphy: Fix duplicated argument in phy-mtk-tphy
    993db6da4aec staging: vc04_services: Fix RCU dereference check
    6a469cf7f372 phy: usb: Leave some clocks running during suspend
    9492e1e53e7d ARM: OMAP2+: adjust the location of put_device() call in omapdss_init_of
    1587d6b1e0b9 ARM: OMAP2+: hwmod: Add of_node_put() before break
    5f45f96f4189 KVM: x86/pmu: Use AMD64_RAW_EVENT_MASK for PERF_TYPE_RAW
    0d3b91d4d9f5 KVM: x86/pmu: Don't truncate the PerfEvtSeln MSR when creating a perf event
    d8110cb2cf19 KVM: x86/pmu: Refactoring find_arch_event() to pmc_perf_hw_id()
    c377e2ba78d3 Drivers: hv: vmbus: Fix memory leak in vmbus_add_channel_kobj
    6936f02d14ed mtd: rawnand: ingenic: Fix missing put_device in ingenic_ecc_get
    de0d102d0c8c HID: elo: fix memory leak in elo_probe
    ffe36e3a991e mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC status
    9fd00a568663 mtd: phram: Prevent divide by zero bug in phram_setup()
    3eb5185896a6 mtd: parsers: qcom: Fix missing free for pparts in cleanup
    eb03cb6e03ff mtd: parsers: qcom: Fix kernel panic on skipped partition
    502f86f5168a mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
    e65450a12cf4 block: fix surprise removal for drivers calling blk_set_queue_dying
    e1dce8e127fd tty: n_tty: do not look ahead for EOL character past the end of the buffer
    21165833efa6 NFS: Do not report writeback errors in nfs_getattr()
    f1322f10f60c NFS: LOOKUP_DIRECTORY is also ok with symlinks
    f2238b4e83b6 NFS: Remove an incorrect revalidation in nfs4_update_changeattr_locked()
    4b9c861a589e block/wbt: fix negative inflight counter when remove scsi device
    a22b213139e0 ASoC: qcom: Actually clear DMA interrupt register for HDMI
    ce3e1f82da73 ASoC: tas2770: Insert post reset delay
    493c9e850677 scsi: ufs: Fix a deadlock in the error handler
    2af0fdfbfb37 scsi: ufs: Remove dead code
    84c109620fef tipc: fix wrong notification node addresses
    727dd33561d5 smb3: fix snapshot mount option
    4a7ec50298b1 mtd: rawnand: gpmi: don't leak PM reference in error path
    45948a4b1fd0 powerpc/lib/sstep: fix 'ptesync' build error
    0e0b5705640c powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and KFENCE
    68b8924f6038 cifs: fix set of group SID via NTSD xattrs
    b4b8e7ae1346 ASoC: ops: Fix stereo change notifications in snd_soc_put_xr_sx()
    312d8074bc99 ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_sx()
    ed1e33f121ea ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_range()
    edb43ae4ca8d ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw()
    900d37d7d8ef ALSA: hda: Fix missing codec probe on Shenker Dock 15
    f9d9574a8ba8 ALSA: hda: Fix regression on forced probe mask option
    3b6134e35a60 ALSA: hda/realtek: Fix deadlock by COEF mutex
    a562de3b700a ALSA: hda/realtek: Add quirk for Legion Y9000X 2019
    2c9a7e11127e ALSA: usb-audio: revert to IMPLICIT_FB_FIXED_DEV for M-Audio FastTrack Ultra
    7285daaca3cd arm64: Correct wrong label in macro __init_el2_gicv3
    b04dcc00ae33 selftests/exec: Add non-regular to TEST_GEN_PROGS
    bf4161eb7e3b perf bpf: Defer freeing string after possible strlen() on it
    e8ba5b039eea net: bridge: multicast: notify switchdev driver whenever MC processing gets disabled
    6b1c9f99c2e6 dpaa2-eth: Initialize mutex used in one step timestamping path
    d3c9dd36ec24 dpaa2-switch: fix default return of dpaa2_switch_flower_parse_mirror_key
    1a16f047946b tipc: fix wrong publisher node address in link publications
    868366d627e4 atl1c: fix tx timeout after link flap on Mikrotik 10/25G NIC
    0e6727589aea net: phy: mediatek: remove PHY mode check on MT7531
    7de7ba7a8bd4 net/smc: Avoid overwriting the copies of clcsock callback functions
    f8ba235c4927 libsubcmd: Fix use-after-free for realloc(..., 0)
    4c9f207810b7 bonding: fix data-races around agg_select_timer
    9bb363ba014f net_sched: add __rcu annotation to netdev->qdisc
    3077976a752a drop_monitor: fix data-race in dropmon_net_event / trace_napi_poll_hit
    bdb6df9bedb3 bonding: force carrier update when releasing slave
    b9ff5667e116 ping: fix the dif and sdif check in ping_lookup
    392c42424ae0 net: ieee802154: ca8210: Fix lifs/sifs periods
    4b27446b538d net: dsa: lan9303: add VLAN IDs to master device
    860c5c275ed2 net: dsa: lan9303: handle hwaccel VLAN tags
    df2495f329b0 net: dsa: lantiq_gswip: fix use after free in gswip_remove()
    2566a89b9e16 net: dsa: mv88e6xxx: flush switchdev FDB workqueue before removing VLAN
    d8905a499af4 net: dsa: lan9303: fix reset on probe
    241e633cb379 cfg80211: fix race in netlink owner interface destruction
    c4caf72a42d3 brcmfmac: firmware: Fix crash in brcm_alt_fw_path
    00fb850c8a1a mac80211: mlme: check for null after calling kmemdup
    61e8fc49a9f8 Revert "net: ethernet: bgmac: Use devm_platform_ioremap_resource_byname"
    d51cd648dbca ipv6: per-netns exclusive flowlabel checks
    3e11ef1903cf ipv6: mcast: use rcu-safe version of ipv6_get_lladdr()
    9ed25183e6d4 ipv6: fix data-race in fib6_info_hw_flags_set / fib6_purge_rt
    db333693b052 ipv4: fix data races in fib_alias_hw_flags_set
    5dc653ef0785 selftests: netfilter: disable rp_filter on router
    2035d13eb12e netfilter: nft_synproxy: unregister hooks on init error path
    a1d9e1f14207 selftests: netfilter: fix exit value for nft_concat_range
    b10f4b00e10a iwlwifi: mvm: don't send SAR GEO command for 3160 devices
    c448b0541abf iwlwifi: pcie: gen2: fix locking when "HW not ready"
    78cd5c0acfed iwlwifi: pcie: fix locking when "HW not ready"
    79bdf56cc55d drm/i915/ttm: tweak priority hint selection
    e4778408c04d drm/i915/gvt: Make DRM_I915_GVT depend on X86
    02f7d38533ba drm/cma-helper: Set VM_DONTEXPAND for mmap
    787468ee7a43 vsock: remove vsock from connected table when connect is interrupted by a signal
    fe802b3fe763 drm/i915: Fix mbus join config lookup
    34f5556ddf2b drm/i915: Fix dbuf slice config lookup
    d006f2fe7d62 drm/i915/opregion: check port number bounds for SWSCI display power state
    960c8a55016b drm/amdgpu: skipping SDMA hw_init and hw_fini for S0ix.
    3851046599c1 drm/amd/pm: correct the sequence of sending gpu reset msg
    a1596e0277ed drm/atomic: Don't pollute crtc_state->mode_blob with error pointers
    68f3a4252e97 drm/radeon: Fix backlight control on iMac 12,1
    ddd46059f7d9 iwlwifi: fix use-after-free
    8209fede7d58 KVM: x86: nSVM: mark vmcb01 as dirty when restoring SMM saved state
    74b426bea4f7 KVM: x86: nSVM: fix potential NULL derefernce on nested migration
    417b87cb2311 KVM: x86: SVM: don't passthrough SMAP/SMEP/PKE bits in !NPT && !gCR0.PG case
    cd14c7342df5 KVM: x86: nSVM/nVMX: set nested_run_pending on VM entry which is a result of RSM
    b5c86e750388 KVM: x86/xen: Fix runstate updates to be atomic when preempting vCPU
    b16817a6de31 random: wake up /dev/random writers after zap
    effdcc250584 gcc-plugins/stackleak: Use noinstr in favor of notrace
    0a01326fddf6 Revert "module, async: async_synchronize_full() on module init iff async is used"
    769a6b33ec9f x86/Xen: streamline (and fix) PV CPU enumeration
    0fec53c5dca8 drm/amdgpu: fix logic inversion in check
    38108fd273ac drm/amd: Only run s3 or s0ix if system is configured properly
    72808bb42c87 drm/amd: add support to check whether the system is set to s3
    0ceba4d64fee net: sparx5: do not refer to skb after passing it on
    646952b2210f nvme-rdma: fix possible use-after-free in transport error_recovery work
    5e42fca37ccc nvme-tcp: fix possible use-after-free in transport error_recovery work
    e043fb5a0336 nvme: fix a possible use-after-free in controller reset during load
    64519c9e32ac drm/amd: Warn users about potential s0ix problems
    d9d93f32534a scsi: pm8001: Fix use-after-free for aborted SSP/STP sas_task
    3c334cdfd949 scsi: pm8001: Fix use-after-free for aborted TMF sas_task
    f2c58667ffcd scsi: core: Reallocate device's budget map on queue depth change
    46756cc81099 kselftest: Fix vdso_test_abi return status
    3801775a07b5 scsi: pm80xx: Fix double completion for SATA devices
    64d6f76958c5 quota: make dquot_quota_sync return errors from ->sync_fs
    38f22c730c38 vfs: make freeze_super abort when sync_filesystem returns error
    5d3e1af11e07 pinctrl: bcm63xx: fix unmet dependency on REGMAP for GPIO_REGMAP
    4c958f0c5714 ax25: improve the incomplete fix to avoid UAF and NPD bugs
    bced176da6e0 selftests: skip mincore.check_file_mmap when fs lacks needed support
    7d10b671a052 selftests: openat2: Skip testcases that fail with EOPNOTSUPP
    04542fd44dd7 selftests: openat2: Add missing dependency in Makefile
    a613105e07b9 selftests: openat2: Print also errno in failure messages
    16d28de2f361 selftests/zram: Adapt the situation that /dev/zram0 is being used
    9172557bdf13 selftests/zram01.sh: Fix compression ratio calculation
    586ec7c0992a selftests/zram: Skip max_comp_streams interface on newer kernel
    23b2a2538240 net: ieee802154: at86rf230: Stop leaking skb's
    c99068d6839c kselftest: signal all child processes
    eb3b35385558 selftests: rtc: Increase test timeout so that all tests run
    ec1d9bb08850 kunit: tool: Import missing importlib.abc
    fdad28ff1d1d platform/x86: ISST: Fix possible circular locking dependency detected
    54688a550924 platform/x86: touchscreen_dmi: Add info for the RWC NANOTE P8 AY07J 2-in-1
    7e234c47fd2f btrfs: send: in case of IO error log it
    94e76b372817 parisc: Add ioread64_lo_hi() and iowrite64_lo_hi()
    c7a4b1d155d3 PCI: hv: Fix NUMA node assignment when kernel boots with custom NUMA topology
    7da6ba116cdc HID: amd_sfh: Correct the structure field name
    6b75f5c18f38 HID: amd_sfh: Increase sensor command timeout
    bdbc65eb77ee HID: i2c-hid: goodix: Fix a lockdep splat
    6451058f2720 HID: amd_sfh: Add illuminance mask to limit ALS max value
    b3dc4b9d3ca6 mm: don't try to NUMA-migrate COW pages that have other uses
    f3ff5f75d8f6 mmc: block: fix read single on recovery logic
    5b6e29b9306c parisc: Fix sglist access in ccio-dma.c
    8c8e949ae81e parisc: Fix data TLB miss in sba_unmap_sg
    9413b2e2bdb7 parisc: Drop __init from map_pages declaration
    35c955b5a45e serial: parisc: GSC: fix build when IOSAPIC is not set
    7a25d8249971 parisc: Show error if wrong 32/64-bit compiler is being used
    9750d45760c8 Revert "svm: Add warning message for AVIC IPI invalid target"
    65ad2f6191a6 HID:Add support for UGTABLET WP5540
    06bd0f157e70 scsi: lpfc: Fix mailbox command failure during driver initialization
    ae6ca6343929 btrfs: zoned: cache reported zone during mount
    a8dd0cfa3779 fs/proc: task_mmu.c: don't read mapcount for migration entry
    f0a60c7c4ede drm/nouveau/pmu/gm200-: use alternate falcon reset sequence

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 58feb19cb7..153e48b578 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e62e8c1dfa2fe269a877b99dc9dedac6a9456b99"
-SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
+SRCREV_machine ?= "d6781443bac8b711a2c55898223dab38f2ed5896"
+SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.24"
+LINUX_VERSION ?= "5.15.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 30e63bf7f5..d4ec34beff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.24"
+LINUX_VERSION ?= "5.15.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "e6e97d2b62f29bac98815616d89cf48490b03fc3"
-SRCREV_machine ?= "9cb2e893ad4e54c23650583ff55b6f7dd2168ec1"
-SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
+SRCREV_machine:qemuarm ?= "000e76cff61c46e4a89c253d499bb92433807196"
+SRCREV_machine ?= "ba4a30c056f9fbb4286f9a79cd574025bae86c8f"
+SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index fa68e9e574..481cfe9ab5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "681eace513f2eb77ade3954f7ede8e18c53ef3b8"
-SRCREV_machine:qemuarm64 ?= "5544942b9f3aaf9af76d55a8ea015cfcc8003921"
-SRCREV_machine:qemumips ?= "65c9fa3c96cdd8d2341ab6b6042227a928f04483"
-SRCREV_machine:qemuppc ?= "15df6d697a5319289bf2fcac3fa394da83f9aac2"
-SRCREV_machine:qemuriscv64 ?= "871f23ad362717d75aba60e56d511312522ba15c"
-SRCREV_machine:qemuriscv32 ?= "871f23ad362717d75aba60e56d511312522ba15c"
-SRCREV_machine:qemux86 ?= "871f23ad362717d75aba60e56d511312522ba15c"
-SRCREV_machine:qemux86-64 ?= "871f23ad362717d75aba60e56d511312522ba15c"
-SRCREV_machine:qemumips64 ?= "23dd0a182e404e823a7d4e4f3e00c716d7b33109"
-SRCREV_machine ?= "871f23ad362717d75aba60e56d511312522ba15c"
-SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
+SRCREV_machine:qemuarm ?= "af65cb567e671fb5eea7224f9252a9cdfd37f7d0"
+SRCREV_machine:qemuarm64 ?= "6101a726c5cfd4c995f9ed3cec3dadc593f1765b"
+SRCREV_machine:qemumips ?= "24b1491fde2da59de37bf4b43e49e4d9725a700e"
+SRCREV_machine:qemuppc ?= "09492ed54dade6f3e646b31be5e70b07b0c22755"
+SRCREV_machine:qemuriscv64 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_machine:qemuriscv32 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_machine:qemux86 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_machine:qemux86-64 ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_machine:qemumips64 ?= "98e983921ddecb99fe11439c033273b90cc5d413"
+SRCREV_machine ?= "5bd4bda819e9c9736b3ab14e9295b8166c61b6a4"
+SRCREV_meta ?= "3249e3a8f9c0de4105f5cd410880d5efdeeaf75d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "a0ebea480bb319a3ad408c99db91262dbc696b76"
+SRCREV_machine:class-devupstream ?= "8993e6067f263765fd26edabf3e3012e3ec4d81e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.24"
+LINUX_VERSION ?= "5.15.26"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


