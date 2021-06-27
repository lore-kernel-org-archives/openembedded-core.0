Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.423.1624812645521804219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 09:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDTpnVff;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id x6so8050820qvx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D0AQfbAvEIIzQWdAwPWsNbTx0dHcgK3Ilqc4rZZE8Jw=;
        b=WDTpnVffrMMpFyBdpQpOxUbEAjgwAePb+ZdjboDHKwS53ZFRUKolsmFLBnpT/rc7iC
         4PI/tUnAe/zoITZx7lQaXzeQPxhCkFThyQUVamNlab+EYBQbSoPglhuigYydmh4f5XwM
         y3F0uEMlBxRQUVwTAyIYJjhhc4OlyjKIrQqsK7pUccp/BLmCRxcBgUFkYWsr2rY3Hw6H
         mRBcijrzqyG6jj1ldXYVIFf38c7v310Zd6tsLaBa5i/2yu7CAxMP9IsM4ZVXjXUpk5/y
         gwjF+YCtwCpKAuMEAghPiUOE+k7I0GKm3cl+wX2Wn0hBr7BP/16rU/CuIQ6tZ0KxsLxa
         ds5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0AQfbAvEIIzQWdAwPWsNbTx0dHcgK3Ilqc4rZZE8Jw=;
        b=Y/RijcUosCh3IBJBlR3yZTnwnyICzinW04avCad4ogha/Xf/0CL88uwLBCcfEUPet4
         5xf2V5w3aO8+VyWMDUiL1rc3jEkCOB2dipMKTPxJAhLdpgw/Mk3lKDn4GK7H1Z3lc/Nn
         8QqqIB34QEOFk0xHP5jKW9kGaAhGx3k++yshIp/AXV6Yz2TknM+ekCWV1YwOaDOKCYq+
         6cVCMglk7bP/0RvS47JrLUuQEAHVQ3r/W6fBEclYnnfSS43kfR0E4HUzKqOKIEoGl3EY
         Kf0G60pVqfmwlp10QNHC3b0VOpIdwevn3deUbHZbHeYmNgk1bzkQGYD3jxbroZqtlsB5
         g3oQ==
X-Gm-Message-State: AOAM53206GoJIMu2sUTyk8Qq8ClD3Y7FBwDiipO4LAgvshb6h7afCfFs
	MOz/3ZQHh+zmbPB/4FlBPRpHbIyrjq3kUdEj
X-Google-Smtp-Source: ABdhPJxITtzePFsoHgTihaCh5luueZw3PUdAd1UkC9PUozUveOqQ9edT6ekDDY8q87mqjgBjDYYGIQ==
X-Received: by 2002:a0c:fca4:: with SMTP id h4mr1494787qvq.35.1624812644467;
        Sun, 27 Jun 2021 09:50:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id b8sm7150439qtr.77.2021.06.27.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 09:50:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.4: update to v5.4.128
Date: Sun, 27 Jun 2021 12:50:38 -0400
Message-Id: <5aacca8f30eceb073de0cd110538f7b67f57e816.1624811389.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624811389.git.bruce.ashfield@gmail.com>
References: <cover.1624811389.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4037804c5574 Linux 5.4.128
    fd7c4bd58249 usb: dwc3: core: fix kernel panic when do reboot
    d7e403eea007 usb: dwc3: debugfs: Add and remove endpoint dirs dynamically
    5babc3977565 clocksource/drivers/timer-ti-dm: Handle dra7 timer wrap errata i940
    aad8f1d88ed6 clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap issue
    5394080643bc clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support
    c53cc5f9587c ARM: OMAP: replace setup_irq() by request_irq()
    7d266c8a2ae8 KVM: arm/arm64: Fix KVM_VGIC_V3_ADDR_TYPE_REDIST read
    0c2a4178d796 tools headers UAPI: Sync linux/in.h copy with the kernel sources
    7381c4d0bc10 net: fec_ptp: add clock rate zero check
    190ecdf53d67 net: stmmac: disable clocks in stmmac_remove_config_dt()
    4f69c8930674 mm/slub.c: include swab.h
    9ddeea35c47d mm/slub: fix redzoning for small allocations
    c0837e021d90 mm/slub: clarify verification reporting
    79855be6445b net: bridge: fix vlan tunnel dst refcnt when egressing
    a2241e62f6b4 net: bridge: fix vlan tunnel dst null pointer dereference
    b6c0ab11c88f net: ll_temac: Fix TX BD buffer overwrite
    6d120ab4dc39 net: ll_temac: Make sure to free skb when it is completely used
    a32f70e06980 drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
    dbde458378ef drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell.
    92e08a5ffae9 cfg80211: avoid double free of PMSR request
    01ade7c84fda cfg80211: make certificate generation more robust
    05b4fdec273b dmaengine: pl330: fix wrong usage of spinlock flags in dma_cyclc
    f3c629b164ca x86/fpu: Reset state for all signal restore failures
    4f1e9bafa195 x86/pkru: Write hardware init value to PKRU when xstate is init
    13c5f1f0798c x86/process: Check PF_KTHREAD and not current->mm for kernel threads
    80c56699cf1a ARCv2: save ABI registers across signal handling
    cbb425f62df9 KVM: x86: Immediately reset the MMU context when the SMM flag is cleared
    58877ce3fecd PCI: Work around Huawei Intelligent NIC VF FLR erratum
    a36d9bdc1917 PCI: Add ACS quirk for Broadcom BCM57414 NIC
    4c90f90a91d7 PCI: aardvark: Fix kernel panic during PIO transfer
    0e888c237754 PCI: aardvark: Don't rely on jiffies while holding spinlock
    f3b600a2b6bc PCI: Mark some NVIDIA GPUs to avoid bus reset
    775c25b7a334 PCI: Mark TI C667X to avoid bus reset
    c7660ab8126e tracing: Do no increment trace_clock_global() by one
    79894a5d75ab tracing: Do not stop recording comms if the trace file is being read
    4ab1152bb778 tracing: Do not stop recording cmdlines when tracing is off
    0061eff74824 usb: core: hub: Disable autosuspend for Cypress CY7C65632
    6f87c0e21ad2 can: mcba_usb: fix memory leak in mcba_usb
    22cba878abf6 can: j1939: fix Use-after-Free, hold skb ref while in use
    776e0d16ac84 can: bcm/raw/isotp: use per module netdevice notifier
    c297559a2a2a can: bcm: fix infoleak in struct bcm_msg_head
    35b651d6bdf3 hwmon: (scpi-hwmon) shows the negative temperature properly
    8ea34be15fb5 radeon: use memcpy_to/fromio for UVD fw upload
    0b445249635d pinctrl: ralink: rt2880: avoid to error in calls is pin is already enabled
    d7d307fb3e70 spi: stm32-qspi: Always wait BUSY bit to be cleared in stm32_qspi_wait_cmd()
    04e5fbe604d3 ASoC: rt5659: Fix the lost powers for the HDA header
    81376d3d5ede regulator: bd70528: Fix off-by-one for buck123 .n_voltages setting
    19f88ca68ccf net: ethernet: fix potential use-after-free in ec_bhf_remove
    63137ea2423c icmp: don't send out ICMP messages with a source address of 0.0.0.0
    c3e6fbc7ba7c bnxt_en: Call bnxt_ethtool_free() in bnxt_init_one() error path
    87971d582c66 bnxt_en: Rediscover PHY capabilities after firmware reset
    755da76ec5de cxgb4: fix wrong shift.
    81de2ed06df8 net: cdc_eem: fix tx fixup skb leak
    a49cbb762ef2 net: hamradio: fix memory leak in mkiss_close
    0f868a684376 be2net: Fix an error handling path in 'be_probe()'
    c14c276d7f35 net/af_unix: fix a data-race in unix_dgram_sendmsg / unix_release_sock
    3dd2aeac2e96 net: ipv4: fix memory leak in ip_mc_add1_src
    7b18f289fd0b net: fec_ptp: fix issue caused by refactor the fec_devtype
    4252bf6c2b24 net: usb: fix possible use-after-free in smsc75xx_bind
    217395c5ab15 lantiq: net: fix duplicated skb in rx descriptor ring
    5f7acbf602d8 net: cdc_ncm: switch to eth%d interface naming
    3daa97817aa8 ptp: improve max_adj check against unreasonable values
    26b8d10703a9 net: qrtr: fix OOB Read in qrtr_endpoint_post
    8d3de2b47e53 netxen_nic: Fix an error handling path in 'netxen_nic_probe()'
    a670a78fb180 qlcnic: Fix an error handling path in 'qlcnic_probe()'
    b0bb49b0fbc3 net: make get_net_ns return error if NET_NS is disabled
    5d47a84f459c net: stmmac: dwmac1000: Fix extended MAC address registers definition
    c82e4e78094d alx: Fix an error handling path in 'alx_probe()'
    4cefa061fc63 sch_cake: Fix out of bounds when parsing TCP options and header
    6defc77d48ef netfilter: synproxy: Fix out of bounds when parsing TCP options
    ad689fec4498 net/mlx5e: Block offload of outer header csum for UDP tunnels
    946a36f82a0b net/mlx5e: allow TSO on VXLAN over VLAN topologies
    0bb0270832c8 net/mlx5: Consider RoCE cap before init RDMA resources
    4b16118665e9 net/mlx5e: Fix page reclaim for dead peer hairpin
    3c3461ed267b net/mlx5e: Remove dependency in IPsec initialization flows
    2ae0f0a409c8 net/sched: act_ct: handle DNAT tuple collision
    23f3d2779dd6 rtnetlink: Fix regression in bridge VLAN configuration
    5a88477c1c85 udp: fix race between close() and udp_abort()
    cc4c6b19093c net: lantiq: disable interrupt before sheduling NAPI
    2038cd15eacd net: rds: fix memory leak in rds_recvmsg
    cc16e7d36e5c vrf: fix maximum MTU
    398a24447eb6 net: ipv4: fix memory leak in netlbl_cipsov4_add_std
    e7fbd8184fa9 batman-adv: Avoid WARN_ON timing related checks
    bf99ea52970c kvm: LAPIC: Restore guard to prevent illegal APIC register access
    566345aaabac mm/memory-failure: make sure wait for page writeback in memory_failure
    0498165c6fec afs: Fix an IS_ERR() vs NULL check
    2a3f74ca167e dmaengine: stedma40: add missing iounmap() on error in d40_probe()
    10fd28745d8b dmaengine: QCOM_HIDMA_MGMT depends on HAS_IOMEM
    1e3c5c450567 dmaengine: ALTERA_MSGDMA depends on HAS_IOMEM
    a82d4d5e9fe6 Linux 5.4.127
    f7afaf778591 fib: Return the correct errno code
    51cc5ad292da net: Return the correct errno code
    376a703f9dce net/x25: Return the correct errno code
    107140952ecd rtnetlink: Fix missing error code in rtnl_bridge_notify()
    12fa0fdbcd0f drm/amd/display: Allow bandwidth validation for 0 streams.
    8c48345fdc98 net: ipconfig: Don't override command-line hostnames or domains
    c8e4a72b255e nvme-loop: check for NVME_LOOP_Q_LIVE in nvme_loop_destroy_admin_queue()
    655d4dc10a23 nvme-loop: clear NVME_LOOP_Q_LIVE when nvme_loop_configure_admin_queue() fails
    ed4bee6e1bb7 nvme-loop: reset queue count to 1 in nvme_loop_destroy_io_queues()
    31ac5531110a scsi: scsi_devinfo: Add blacklist entry for HPE OPEN-V
    4791b8948741 scsi: qedf: Do not put host in qedf_vport_create() unconditionally
    8034fc4ee9ef ethernet: myri10ge: Fix missing error code in myri10ge_probe()
    ea4a9a34c9b2 scsi: target: core: Fix warning on realtime kernels
    86fd5b27db74 gfs2: Fix use-after-free in gfs2_glock_shrink_scan
    527f70f76742 riscv: Use -mno-relax when using lld linker
    e58f4b5046e0 HID: gt683r: add missing MODULE_DEVICE_TABLE
    50b8e1be15f6 gfs2: Prevent direct-I/O write fallback errors from getting lost
    c8eff6762943 ARM: OMAP2+: Fix build warning when mmc_omap is not built
    e4c3f7a6a3b2 drm/tegra: sor: Do not leak runtime PM reference
    7f5a4b24cdbd HID: usbhid: fix info leak in hid_submit_ctrl
    20fbcfaaa571 HID: Add BUS_VIRTUAL to hid_connect logging
    41b9b39e1b37 HID: multitouch: set Stylus suffix for Stylus-application devices, too
    2173746ed125 HID: quirks: Add quirk for Lenovo optical mouse
    cdf5e4747da9 HID: hid-sensor-hub: Return error for hid_set_field() failure
    1f760c4e655c HID: hid-input: add mapping for emoji picker key
    818bf51031cf HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for Saitek X65
    d0f47648b87b net: ieee802154: fix null deref in parse dev addr
    ffe4d2a0684d Linux 5.4.126
    0f8837070136 proc: only require mm_struct for writing
    d63f00ec908b tracing: Correct the length check which causes memory corruption
    7e4e824b109f ftrace: Do not blindly read the ip address in ftrace_bug()
    74430f3f6149 scsi: core: Only put parent device if host state differs from SHOST_CREATED
    e694ddc8f3de scsi: core: Put .shost_dev in failure path if host state changes to RUNNING
    fe7bcd794a53 scsi: core: Fix failure handling of scsi_add_host_with_dma()
    79296e292d67 scsi: core: Fix error handling of scsi_host_alloc()
    8c9400c4855e NFSv4: nfs4_proc_set_acl needs to restore NFS_CAP_UIDGID_NOMAP on error.
    86377b239e04 NFSv4: Fix second deadlock in nfs4_evict_inode()
    3e3c7ebbfac1 NFS: Fix use-after-free in nfs4_init_client()
    83668ab1dbbf kvm: fix previous commit for 32-bit builds
    0147af30925a perf session: Correct buffer copying when peeking events
    34769f17e47c NFSv4: Fix deadlock between nfs4_evict_inode() and nfs4_opendata_get_inode()
    0057ecef9f32 NFS: Fix a potential NULL dereference in nfs_get_client()
    e3ecd9c09fcc IB/mlx5: Fix initializing CQ fragments buffer
    796d3bd4ac93 KVM: x86: Ensure liveliness of nested VM-Enter fail tracepoint message
    71c751cbb9e8 sched/fair: Make sure to update tg contrib for blocked load
    26ab08df8656 perf: Fix data race between pin_count increment/decrement
    8aeb339571c6 vmlinux.lds.h: Avoid orphan section with !SMP
    fc57713afaca RDMA/mlx4: Do not map the core_clock page to user space unless enabled
    64f1fb6acc2a RDMA/ipoib: Fix warning caused by destroying non-initial netns
    a0828219185d usb: typec: mux: Fix copy-paste mistake in typec_mux_match
    139af3b2192c regulator: max77620: Use device_set_of_node_from_dev()
    c4e10f92c319 regulator: core: resolve supply for boot-on/always-on regulators
    5ef23506695b usb: fix various gadget panics on 10gbps cabling
    b4903f7fdc48 usb: fix various gadgets null ptr deref on 10gbps cabling.
    191144bcfe3a usb: gadget: eem: fix wrong eem header operation
    cc40404bd0dd USB: serial: cp210x: fix alternate function for CP2102N QFN20
    02fafcf74cde USB: serial: quatech2: fix control-request directions
    eedd4b494538 USB: serial: omninet: add device id for Zyxel Omni 56K Plus
    a2119ad276f1 USB: serial: ftdi_sio: add NovaTech OrionMX product ID
    28b9764eb568 usb: gadget: f_fs: Ensure io_completion_wq is idle during unbind
    4fe7635a245b usb: typec: ucsi: Clear PPM capability data in ucsi_init() error path
    9523c42be986 usb: typec: wcove: Use LE to CPU conversion when accessing msg->header
    5e8ca8c79f74 usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling
    366369b89bed usb: dwc3: ep0: fix NULL pointer exception
    c469c8dddc7d usb: pd: Set PD_T_SINK_WAIT_CAP to 310ms
    32c2e6c2e4eb usb: f_ncm: only first packet of aggregate needs to start timer
    0c05a8bc0e76 USB: f_ncm: ncm_bitrate (speed) is unsigned
    4d14a82ef112 cgroup1: don't allow '\n' in renaming
    298499d73d2d btrfs: promote debugging asserts to full-fledged checks in validate_super
    d4b047651fb1 btrfs: return value from btrfs_mark_extent_written() in case of error
    dccd575337ac staging: rtl8723bs: Fix uninitialized variables
    bff1fbf0cf07 kvm: avoid speculation-based attacks from out-of-range memslot accesses
    977d11df7932 drm: Lock pointer access in drm_master_release()
    b246b4c70c12 drm: Fix use-after-free read in drm_getunique()
    b5502580cf95 spi: bcm2835: Fix out-of-bounds access with more than 4 slaves
    a225ee1fe41c x86/boot: Add .text.* to setup.ld
    8c2c1db4f2e4 i2c: mpc: implement erratum A-004447 workaround
    c7f0393a370e i2c: mpc: Make use of i2c_recover_bus()
    3cdbefdd3146 spi: Cleanup on failure of initial setup
    85a7998e7211 spi: Don't have controller clean up spi device before driver unbind
    92350839d329 powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P1010 i2c controllers
    96cea4843b8f powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
    3e9aa125f69c nvme-tcp: remove incorrect Kconfig dep in BLK_DEV_NVME
    c385af145eb4 bnx2x: Fix missing error code in bnx2x_iov_init_one()
    ece8ad75e318 dm verity: fix require_signatures module_param permissions
    a450b5b6c01d MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER
    eb5c4794b79e nvme-fabrics: decode host pathing error for connect
    70036fb61ea8 net: dsa: microchip: enable phy errata workaround on 9567
    128bb4b0e5d2 net: appletalk: cops: Fix data race in cops_probe1
    19e14481cc7d net: macb: ensure the device is available before accessing GEMGXL control registers
    cd05e1a61a05 scsi: target: qla2xxx: Wait for stop_phase1 at WWN removal
    e773147692c6 scsi: hisi_sas: Drop free_irq() of devm_request_irq() allocated irq
    1e209effe36c scsi: vmw_pvscsi: Set correct residual data length
    90476c1bfff0 scsi: bnx2fc: Return failure if io_req is already in ABTS processing
    a3842219a69d RDS tcp loopback connection can hang
    3e324774411d net/qla3xxx: fix schedule while atomic in ql_sem_spinlock
    f9e7a38d148e wq: handle VM suspension in stall detection
    92215c1f24c0 cgroup: disable controllers at parse time
    e29d22371de8 net: mdiobus: get rid of a BUG_ON()
    21df0c2e7d19 netlink: disable IRQs for netlink_lock_table()
    e0172831c61a bonding: init notify_work earlier to avoid uninitialized use
    9d7d4649dc1c isdn: mISDN: netjet: Fix crash in nj_probe:
    77b9f527731e spi: sprd: Add missing MODULE_DEVICE_TABLE
    cbeee4ccc1c7 ASoC: sti-sas: add missing MODULE_DEVICE_TABLE
    575ad4ab2057 vfio-ccw: Serialize FSM IDLE state with I/O completion
    02d3f4f0aadb ASoC: Intel: bytcr_rt5640: Add quirk for the Lenovo Miix 3-830 tablet
    8a9478cfb21b ASoC: Intel: bytcr_rt5640: Add quirk for the Glavey TM800A550L tablet
    02851cb0cae3 usb: cdns3: Fix runtime PM imbalance on error
    f3ed12af6bbb net/nfc/rawsock.c: fix a permission check bug
    3e7c190475d9 spi: Fix spi device unregister flow
    9f9ad67183aa ASoC: max98088: fix ni clock divider calculation
    c9002013ffe0 proc: Track /proc/$pid/attr/ opener mm_struct

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 432289292b..3e97058f68 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "08b154b1c1f1c85db88295a4169dff6826c2e383"
-SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
+SRCREV_machine ?= "f3ac47f313e4ce608b3567c006f61d1d8b820ae2"
+SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.125"
+LINUX_VERSION ?= "5.4.128"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 6c93e2b163..2eb5ebdbbd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.125"
+LINUX_VERSION ?= "5.4.128"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "35f9751972b9fba920b1666228a35e5ce0b04440"
-SRCREV_machine ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
+SRCREV_machine_qemuarm ?= "987d6fd6c916297cde5cc7e988c28ef1e458f1cf"
+SRCREV_machine ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7edab4931a..5a7e9f0a35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b523a950c926e2d7475768b504e46fa618a3b891"
-SRCREV_machine_qemuarm64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_machine_qemumips ?= "bff59892e827bc85e85fef518305007a787812aa"
-SRCREV_machine_qemuppc ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_machine_qemuriscv64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_machine_qemux86 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_machine_qemux86-64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_machine_qemumips64 ?= "e25b97140f5d46ac437cd8a1d9ecc235cbf462b5"
-SRCREV_machine ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
-SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
+SRCREV_machine_qemuarm ?= "69874edb0838e4d26002a8d30e14a5e1b355e397"
+SRCREV_machine_qemuarm64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_machine_qemumips ?= "1bfafb3ce048d4a30aca35e847168855980f5dbc"
+SRCREV_machine_qemuppc ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_machine_qemuriscv64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_machine_qemux86 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_machine_qemux86-64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_machine_qemumips64 ?= "2a0ea1bced3f4b8ebebb19debc19b7930a4924a8"
+SRCREV_machine ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
+SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.125"
+LINUX_VERSION ?= "5.4.128"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

