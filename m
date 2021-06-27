Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.406.1624812644561562622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 09:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/hkPGcL;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id o6so24971999qkh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b2mZobLC63GUJ0M8z3S8DPAjXX1mUiePd3KJuYPpBjQ=;
        b=u/hkPGcLiwG8aHzNfq3Fz5ZpNWXZQ9XWdxl+2MdjkyIHe8f2/nlemGZJSC0mmNM2en
         J75rX9X8reD24Ddn0jcotFLUF7Glw67XjVAHXDZyk+xOEdRhI0hYSrwU6sPR9LqeyKIf
         8M2hlJ2EwO0D45IYdqTb5OIY9ymbbukwnftjjKuaWHqJVBH8fdPByXKhVZ4wKARn7eF4
         yJrVtlSajBnzQ+SpObBw37pvT5KWPXGQVMRHOkOm6CbUXS6J8CX6cJytzOyNHxGInzQH
         jzktnRcfjsixjjDulZ2OuRGUMflEf16L6HFIt7nouEyvISH0WwY0sfpfBpX4kyu7/wOI
         Oo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b2mZobLC63GUJ0M8z3S8DPAjXX1mUiePd3KJuYPpBjQ=;
        b=XhoNUqGaVsihcEJ/VIsgl9WuudKmyx8wc+V7lT2GH+hmjRYqjbVgCT6pGi5g1b+DlU
         kwb6Gi4CTjIAMt3H4ILoi6IIhPSWJm/7zNX+L5/iT7ttY/xIDqFwHQ/9drwZig8QltDf
         ziFEeUp7ak7jBrYdXgib7mdqzJxsGgFdc+vbMbzFtxE+q9PaKXvoAD+r+mDfrYeBVyJB
         Ie6C5KfTl99Mri0nAnhOM4lM3ImG8vjsIGypxouJHoSRyATSsgJ5SQJM0MoYwHpDSlwk
         C5rMX6CZJr/XBcKhBmnKMYiU10MccSPM0/VkoPXyZScNNbWj5hPlCjY6Dl/ltdhgc7Ct
         8M/Q==
X-Gm-Message-State: AOAM5337Luu421JnqE4QEa5NCrVcU9Id7EY5rxMmw5D9w9SrLAM4wGn0
	DPdJFuhMGxW/h7PCbgT+5x4=
X-Google-Smtp-Source: ABdhPJzrcdbKqsBRy42IWaGxuynzwDYH+/fO/Wd1t2yRyDHeRLVza7frf4WarsERBm3yEq6LzolAJA==
X-Received: by 2002:a37:6393:: with SMTP id x141mr21526100qkb.20.1624812643523;
        Sun, 27 Jun 2021 09:50:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id b8sm7150439qtr.77.2021.06.27.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 09:50:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.10: update to v5.10.46
Date: Sun, 27 Jun 2021 12:50:37 -0400
Message-Id: <15451b90364915a2f5364711be9c180e42c56cfc.1624811389.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1624811389.git.bruce.ashfield@gmail.com>
References: <cover.1624811389.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    3de043c6851d Linux 5.10.46
    174c27583b38 usb: dwc3: core: fix kernel panic when do reboot
    e52d43c82f2f usb: dwc3: debugfs: Add and remove endpoint dirs dynamically
    1b5fbb66182f perf beauty: Update copy of linux/socket.h with the kernel sources
    69371e0482ea tools headers UAPI: Sync linux/in.h copy with the kernel sources
    4f6e7098f19b net: fec_ptp: add clock rate zero check
    1af3a8e91f1a net: stmmac: disable clocks in stmmac_remove_config_dt()
    f71ca814c286 mm/slub.c: include swab.h
    f6ed23575416 mm/slub: actually fix freelist pointer vs redzoning
    4314c8c63bfd mm/slub: fix redzoning for small allocations
    4a36fda16b1b mm/slub: clarify verification reporting
    12eb3c2c1a4f mm/swap: fix pte_same_as_swp() not removing uffd-wp bit when compare
    fc7fdd8c5c2a net: bridge: fix vlan tunnel dst refcnt when egressing
    fe0448a3fad3 net: bridge: fix vlan tunnel dst null pointer dereference
    cfe403f209b1 net: ll_temac: Fix TX BD buffer overwrite
    019ab7d044d0 net: ll_temac: Make sure to free skb when it is completely used
    41984d4fbe21 drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue.
    bc58ec307ce9 drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell.
    96b4126f8c37 cfg80211: avoid double free of PMSR request
    5493b0c2a784 cfg80211: make certificate generation more robust
    f74df6e08608 mac80211: Fix NULL ptr deref for injected rate info
    df203c1fdaaf dmaengine: pl330: fix wrong usage of spinlock flags in dma_cyclc
    b842b568a584 crash_core, vmcoreinfo: append 'SECTION_SIZE_BITS' to vmcoreinfo
    63ba83563e71 x86/fpu: Reset state for all signal restore failures
    a7748e021b9f x86/fpu: Invalidate FPU state after a failed XRSTOR from a user buffer
    076f732b16a5 x86/fpu: Prevent state corruption in __fpu__restore_sig()
    abc790bdbbc5 x86/pkru: Write hardware init value to PKRU when xstate is init
    208bb686e7fa x86/ioremap: Map EFI-reserved memory as encrypted for SEV
    75a55bc2e5e6 x86/process: Check PF_KTHREAD and not current->mm for kernel threads
    ddaaf38e1923 x86/mm: Avoid truncating memblocks for SGX memory
    f6bcb1a6281d ARCv2: save ABI registers across signal handling
    b516daed9913 s390/ap: Fix hanging ioctl caused by wrong msg counter
    7c003dab436d s390/mcck: fix calculation of SIE critical section size
    3a9934d6b8dd KVM: X86: Fix x86_emulator slab cache leak
    18eca69f88f2 KVM: x86/mmu: Calculate and check "full" mmu_role for nested MMU
    669a8866e468 KVM: x86: Immediately reset the MMU context when the SMM flag is cleared
    077cb8946f55 PCI: Work around Huawei Intelligent NIC VF FLR erratum
    ee1a9cfed28a PCI: Add ACS quirk for Broadcom BCM57414 NIC
    1a1dbc447397 PCI: aardvark: Fix kernel panic during PIO transfer
    dac77a14fa27 PCI: Mark some NVIDIA GPUs to avoid bus reset
    1e460ddf5be1 PCI: Mark TI C667X to avoid bus reset
    c9fd0ab39f0a tracing: Do no increment trace_clock_global() by one
    b313bd944ddd tracing: Do not stop recording comms if the trace file is being read
    adb3849ed8d5 tracing: Do not stop recording cmdlines when tracing is off
    1a91fafa3edc usb: chipidea: imx: Fix Battery Charger 1.2 CDP detection
    576996b64e4d usb: core: hub: Disable autosuspend for Cypress CY7C65632
    6bd3d80d1f01 can: mcba_usb: fix memory leak in mcba_usb
    509ab6bfdd0c can: j1939: fix Use-after-Free, hold skb ref while in use
    0cf4b377907f can: bcm/raw/isotp: use per module netdevice notifier
    acb755be1f7a can: bcm: fix infoleak in struct bcm_msg_head
    8c82c52d1de9 bpf: Do not mark insn as seen under speculative path verification
    e9d271731d21 bpf: Inherit expanded/patched seen count from old aux data
    ed423d80bb9a irqchip/gic-v3: Workaround inconsistent PMR setting on NMI entry
    103c4a08baec mm: relocate 'write_protect_seq' in struct mm_struct
    a87abba03a7a hwmon: (scpi-hwmon) shows the negative temperature properly
    57b21ef118ac radeon: use memcpy_to/fromio for UVD fw upload
    3e4b0fbb7293 ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
    360609fc8b06 drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device
    5bd6bcb3532d pinctrl: ralink: rt2880: avoid to error in calls is pin is already enabled
    6d0dc1b34c02 ASoC: rt5682: Fix the fast discharge for headset unplugging in soundwire mode
    ba8a26a7ce86 regulator: rt4801: Fix NULL pointer dereference if priv->enable_gpios is NULL
    2f8f0e97cebb spi: stm32-qspi: Always wait BUSY bit to be cleared in stm32_qspi_wait_cmd()
    e03c8b35161b ASoC: tas2562: Fix TDM_CFG0_SAMPRATE values
    813ff24f1d08 sched/pelt: Ensure that *_sum is always synced with *_avg
    f6d28f0e36e9 spi: spi-zynq-qspi: Fix some wrong goto jumps & missing error code
    0ea21221dd5a regulator: rtmv20: Fix to make regcache value first reading back from HW
    3c5064cd2979 ASoC: fsl-asoc-card: Set .owner attribute when registering card.
    9a1790794623 phy: phy-mtk-tphy: Fix some resource leaks in mtk_phy_init()
    02e245574887 ASoC: rt5659: Fix the lost powers for the HDA header
    3fb6c6acc1a7 platform/x86: thinkpad_acpi: Add X1 Carbon Gen 9 second fan support
    0609c36696e7 regulator: bd70528: Fix off-by-one for buck123 .n_voltages setting
    0ea923519a3f regulator: cros-ec: Fix error code in dev_err message
    95deeb29d831 net: ethernet: fix potential use-after-free in ec_bhf_remove
    8c0c2d97ad28 icmp: don't send out ICMP messages with a source address of 0.0.0.0
    c5d70dbc4d0b bnxt_en: Call bnxt_ethtool_free() in bnxt_init_one() error path
    f8774be4dc11 bnxt_en: Fix TQM fastpath ring backing store computation
    acc9175541bf bnxt_en: Rediscover PHY capabilities after firmware reset
    acc358995975 cxgb4: fix wrong shift.
    05b2b9f7d24b net: cdc_eem: fix tx fixup skb leak
    290b0b6432e2 net: hamradio: fix memory leak in mkiss_close
    45bf43d8685f be2net: Fix an error handling path in 'be_probe()'
    327e626c39f3 net/mlx5: Reset mkey index on creation
    38aafe678caa net/mlx5: E-Switch, Allow setting GUID for host PF vport
    601be24dba48 net/mlx5: E-Switch, Read PF mac address
    5f2ccc58a352 net/af_unix: fix a data-race in unix_dgram_sendmsg / unix_release_sock
    ac31cc837caf net: ipv4: fix memory leak in ip_mc_add1_src
    d08f726cd5b8 net: fec_ptp: fix issue caused by refactor the fec_devtype
    570a52cf3e01 net: usb: fix possible use-after-free in smsc75xx_bind
    70c8418469fb lantiq: net: fix duplicated skb in rx descriptor ring
    11fac7e91270 net: cdc_ncm: switch to eth%d interface naming
    9a4794956292 ptp: improve max_adj check against unreasonable values
    5fc6ed1831ca bpf: Fix leakage under speculation on mispredicted branches
    960b08dd36de net: qrtr: fix OOB Read in qrtr_endpoint_post
    0239c439cedc ipv4: Fix device used for dst_alloc with local routes
    4b5ad4b5aefd cxgb4: fix wrong ethtool n-tuple rule lookup
    d708e5efdd31 netxen_nic: Fix an error handling path in 'netxen_nic_probe()'
    70513cdb936e qlcnic: Fix an error handling path in 'qlcnic_probe()'
    fb3a94814368 ethtool: strset: fix message length calculation
    0e185a7b285d net: qualcomm: rmnet: don't over-count statistics
    e3577776d606 net: qualcomm: rmnet: Update rmnet device MTU based on real device
    4abfd597fe60 net: make get_net_ns return error if NET_NS is disabled
    6a4b39944e2f net: stmmac: dwmac1000: Fix extended MAC address registers definition
    6392ed82ad08 cxgb4: halt chip before flashing PHY firmware image
    b38ec782d004 cxgb4: fix sleep in atomic when flashing PHY firmware
    3d60457d74d9 cxgb4: fix endianness when flashing boot image
    5bf940fe91f8 alx: Fix an error handling path in 'alx_probe()'
    0adf32c033a5 selftests: mptcp: enable syncookie only in absence of reorders
    eab06f7504da mptcp: do not warn on bad input from the network
    222ebeda1702 mptcp: try harder to borrow memory from subflow under pressure
    3b491dd593d5 sch_cake: Fix out of bounds when parsing TCP options and header
    73eeba71dc99 mptcp: Fix out of bounds when parsing TCP options
    9cdf299ba4e1 netfilter: synproxy: Fix out of bounds when parsing TCP options
    a336dc6fdd56 net/mlx5e: Block offload of outer header csum for UDP tunnels
    34ff3770bff8 net/mlx5: DR, Don't use SW steering when RoCE is not supported
    3623bfcab3bf net/mlx5: DR, Allow SW steering for sw_owner_v2 devices
    792f16e083b5 net/mlx5: Consider RoCE cap before init RDMA resources
    be7f3f401d22 net/mlx5e: Fix page reclaim for dead peer hairpin
    02c55a257046 net/mlx5e: Remove dependency in IPsec initialization flows
    4733b73709a2 net/sched: act_ct: handle DNAT tuple collision
    c8f1437c0145 rtnetlink: Fix regression in bridge VLAN configuration
    8729ec8a2238 udp: fix race between close() and udp_abort()
    7dd7b1e4d929 ice: parameterize functions responsible for Tx ring management
    805ae44fc0a8 ice: add ndo_bpf callback for safe mode netdev ops
    27e3d7da654d netfilter: nft_fib_ipv6: skip ipv6 packets from any to link-local
    5cea03aef609 net: lantiq: disable interrupt before sheduling NAPI
    db5f4adc93bd net: dsa: felix: re-enable TX flow control in ocelot_port_flush()
    5946fbf48355 net: rds: fix memory leak in rds_recvmsg
    aba26b38388e vrf: fix maximum MTU
    deeeb65c6ee4 net: ipv4: fix memory leak in netlbl_cipsov4_add_std
    2088824ac90b libbpf: Fixes incorrect rx_ring_setup_done
    195585ddb767 mlxsw: core: Set thermal zone polling delay argument to real value at init
    e95848e9b52c mlxsw: reg: Spectrum-3: Enforce lowest max-shaper burst size of 11
    5a1cd67a801c mac80211: fix skb length check in ieee80211_scan_rx()
    282baa8104af batman-adv: Avoid WARN_ON timing related checks
    ae1d3b989d19 fanotify: fix copy_event_to_user() fid error clean up
    018685461a5b kvm: LAPIC: Restore guard to prevent illegal APIC register access
    9e379da727a7 mm/memory-failure: make sure wait for page writeback in memory_failure
    090b1bb928a9 afs: Fix an IS_ERR() vs NULL check
    5efb0b3886c3 dmaengine: stedma40: add missing iounmap() on error in d40_probe()
    ff864fa71aa0 dmaengine: SF_PDMA depends on HAS_IOMEM
    c0090b0169d6 dmaengine: QCOM_HIDMA_MGMT depends on HAS_IOMEM
    f984fa006b8b dmaengine: ALTERA_MSGDMA depends on HAS_IOMEM
    be4789636f72 dmaengine: xilinx: dpdma: initialize registers before request_irq
    edd60afc3fc3 dmaengine: fsl-dpaa2-qdma: Fix error return code in two functions
    4d74c9802328 dmaengine: idxd: add missing dsa driver unregister
    037a447b7a0b Linux 5.10.45
    808fcc1e707c fib: Return the correct errno code
    d8b2e3e17c33 net: Return the correct errno code
    04c1556bfc79 net/x25: Return the correct errno code
    0aa356950800 rtnetlink: Fix missing error code in rtnl_bridge_notify()
    9250f97fd594 drm/amd/amdgpu:save psp ring wptr to avoid attack
    9e8c2af01046 drm/amd/display: Fix potential memory leak in DMUB hw_init
    75fa7fbef132 drm/amdgpu: refine amdgpu_fru_get_product_info
    34fe4ccb1fe5 drm/amd/display: Allow bandwidth validation for 0 streams.
    ecd26536ec5b net: ipconfig: Don't override command-line hostnames or domains
    511a01029115 nvme-loop: do not warn for deleted controllers during reset
    155c2fea4b31 nvme-loop: check for NVME_LOOP_Q_LIVE in nvme_loop_destroy_admin_queue()
    620424df29a0 nvme-loop: clear NVME_LOOP_Q_LIVE when nvme_loop_configure_admin_queue() fails
    1c80ca596cab nvme-loop: reset queue count to 1 in nvme_loop_destroy_io_queues()
    b8fdea0695fd scsi: scsi_devinfo: Add blacklist entry for HPE OPEN-V
    f8ac1bd5270b Bluetooth: Add a new USB ID for RTL8822CE
    5491d97078fe scsi: qedf: Do not put host in qedf_vport_create() unconditionally
    609b56e9791c ethernet: myri10ge: Fix missing error code in myri10ge_probe()
    5d5f0d945d47 scsi: target: core: Fix warning on realtime kernels
    a61156314b66 gfs2: Fix use-after-free in gfs2_glock_shrink_scan
    bb73f2f78969 riscv: Use -mno-relax when using lld linker
    35277c1a6669 HID: gt683r: add missing MODULE_DEVICE_TABLE
    7a557de07917 gfs2: fix a deadlock on withdraw-during-mount
    c3e9ea16adc1 gfs2: Prevent direct-I/O write fallback errors from getting lost
    864b5a8d5390 ARM: OMAP2+: Fix build warning when mmc_omap is not built
    247ec8ee0bf2 ARM: OMAP1: Fix use of possibly uninitialized irq variable
    3c0ad70cba1f drm/tegra: sor: Fully initialize SOR before registration
    9c1d492baa91 gpu: host1x: Split up client initalization and registration
    570b3e4020f2 drm/tegra: sor: Do not leak runtime PM reference
    b1e3596416d7 HID: usbhid: fix info leak in hid_submit_ctrl
    1dfd9f18ca64 HID: Add BUS_VIRTUAL to hid_connect logging
    258d3fdbb15e HID: multitouch: set Stylus suffix for Stylus-application devices, too
    6a142ea61074 HID: quirks: Add quirk for Lenovo optical mouse
    716a087adc22 HID: hid-sensor-hub: Return error for hid_set_field() failure
    0bd8a4b46cdb HID: hid-input: add mapping for emoji picker key
    b3c5bfc43c5e HID: a4tech: use A4_2WHEEL_MOUSE_HACK_B8 for A4TECH NB-95
    be6c98879205 HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for Saitek X65
    c7836de2cadd net: ieee802154: fix null deref in parse dev addr
    f2b1fc360fa1 Linux 5.10.44
    ef9a0d224baf proc: only require mm_struct for writing
    43c32c22254b tracing: Correct the length check which causes memory corruption
    5b537408f273 scsi: core: Only put parent device if host state differs from SHOST_CREATED
    0a31d1237aaf scsi: core: Put .shost_dev in failure path if host state changes to RUNNING
    146446a43b3d scsi: core: Fix failure handling of scsi_add_host_with_dma()
    7a696ce1d5d1 scsi: core: Fix error handling of scsi_host_alloc()
    6e13b9bc66f0 NFSv4: nfs4_proc_set_acl needs to restore NFS_CAP_UIDGID_NOMAP on error.
    d973bd0d6e7f NFSv4: Fix second deadlock in nfs4_evict_inode()
    c3b6cf64dfe4 NFS: Fix use-after-free in nfs4_init_client()
    9064c9d544b9 kvm: fix previous commit for 32-bit builds
    351075bcfea9 perf session: Correct buffer copying when peeking events
    b4651cea43af NFSv4: Fix deadlock between nfs4_evict_inode() and nfs4_opendata_get_inode()
    279ad78a00f8 NFS: Fix a potential NULL dereference in nfs_get_client()
    91f7fdc4cc10 IB/mlx5: Fix initializing CQ fragments buffer
    d046f724bbd7 KVM: x86: Ensure liveliness of nested VM-Enter fail tracepoint message
    4921feb0e5be x86/nmi_watchdog: Fix old-style NMI watchdog regression on old Intel CPUs
    190a7f908993 sched/fair: Fix util_est UTIL_AVG_UNCHANGED handling
    32e22db8b25e sched/fair: Make sure to update tg contrib for blocked load
    4c37b062edae sched/fair: Keep load_avg and load_sum synced
    c64a3be39fa9 perf: Fix data race between pin_count increment/decrement
    e0b518a2eb44 gpio: wcd934x: Fix shift-out-of-bounds error
    56a388a9cc1e phy: ti: Fix an error code in wiz_probe()
    62d891861f83 ASoC: meson: gx-card: fix sound-dai dt schema
    0e2c9aeb0028 ASoC: core: Fix Null-point-dereference in fmt_single_name()
    d83075c25a28 phy: cadence: Sierra: Fix error return code in cdns_sierra_phy_probe()
    c9cb5837e92e tools/bootconfig: Fix error return code in apply_xbc()
    16ccdcdfe668 vmlinux.lds.h: Avoid orphan section with !SMP
    c25ec6386a81 ARM: cpuidle: Avoid orphan section warning
    cb1aa1da0488 RDMA/mlx4: Do not map the core_clock page to user space unless enabled
    67cf4e447b5e RDMA/ipoib: Fix warning caused by destroying non-initial netns
    fd681a8c7ac8 drm/msm/a6xx: avoid shadow NULL reference in failure path
    0bc79f4b7ac6 drm/msm/a6xx: update/fix CP_PROTECT initialization
    5b7dc8329d7a drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
    5a61f69da3b8 drm/mcde: Fix off by 10^3 in calculation
    d68889298029 usb: typec: mux: Fix copy-paste mistake in typec_mux_match
    9e0677c2e390 usb: dwc3: gadget: Disable gadget IRQ during pullup disable
    cc440da4aad9 phy: usb: Fix misuse of IS_ENABLED
    aafc51fddfa8 regulator: rtmv20: Fix .set_current_limit/.get_current_limit callbacks
    4579f6517679 regulator: bd71828: Fix .n_voltages settings
    5a5f5cfb5f09 regulator: fan53880: Fix missing n_voltages setting
    c365ff97617c regulator: bd718x7: Fix the BUCK7 voltage setting on BD71837
    e3a502abf506 regulator: max77620: Use device_set_of_node_from_dev()
    06653ebc0ad2 regulator: core: resolve supply for boot-on/always-on regulators
    7dcdfa28e1fe usb: typec: tcpm: cancel frs hrtimer when unregister tcpm port
    18eaf0de50ea usb: typec: tcpm: cancel vdm and state machine hrtimer when unregister tcpm port
    b972eff87463 usb: fix various gadget panics on 10gbps cabling
    4b289a0f3033 usb: fix various gadgets null ptr deref on 10gbps cabling.
    6bf8ff7d0520 usb: gadget: eem: fix wrong eem header operation
    21bee94fb9e4 USB: serial: cp210x: fix alternate function for CP2102N QFN20
    4fa815beeaf0 USB: serial: quatech2: fix control-request directions
    ef91a6bd9469 USB: serial: omninet: add device id for Zyxel Omni 56K Plus
    1e2d41c17f43 USB: serial: ftdi_sio: add NovaTech OrionMX product ID
    5cead896962d usb: gadget: f_fs: Ensure io_completion_wq is idle during unbind
    0b3bb7950e73 usb: typec: intel_pmc_mux: Add missed error check for devm_ioremap_resource()
    6900ef1b1095 usb: typec: intel_pmc_mux: Put fwnode in error case during ->probe()
    572de10087a9 usb: typec: ucsi: Clear PPM capability data in ucsi_init() error path
    7cee4344cbb3 usb: typec: wcove: Use LE to CPU conversion when accessing msg->header
    199af8a06de2 usb: musb: fix MUSB_QUIRK_B_DISCONNECT_99 handling
    470403639114 usb: dwc3: ep0: fix NULL pointer exception
    851dee5a5da5 usb: dwc3: gadget: Bail from dwc3_gadget_exit() if dwc->gadget is NULL
    2af93b437a61 usb: dwc3: meson-g12a: Disable the regulator in the error handling path of the probe
    750a0d755642 usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0 is disabled
    b452e8bb7c52 usb: pd: Set PD_T_SINK_WAIT_CAP to 310ms
    0ff5f83ae147 usb: f_ncm: only first packet of aggregate needs to start timer
    0f5a20b1fd9d USB: f_ncm: ncm_bitrate (speed) is unsigned
    1bf2c28ab268 mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
    67aca230caf3 mmc: renesas_sdhi: abort tuning when timeout detected
    97524384762c ftrace: Do not blindly read the ip address in ftrace_bug()
    74d3b20b1b20 cgroup1: don't allow '\n' in renaming
    31fe243a6376 btrfs: promote debugging asserts to full-fledged checks in validate_super
    ca69dc891b28 btrfs: return value from btrfs_mark_extent_written() in case of error
    bf240fee5b34 async_xor: check src_offs is not NULL before updating it
    8d5c0f6b7a78 staging: rtl8723bs: Fix uninitialized variables
    7af299b97734 kvm: avoid speculation-based attacks from out-of-range memslot accesses
    6b6ff4d1f349 KVM: X86: MMU: Use the correct inherited permissions to get shadow page
    14831b79560b perf/x86/intel/uncore: Fix M2M event umask for Ice Lake server
    aa8591a58cbd drm: Lock pointer access in drm_master_release()
    491d52e00788 drm: Fix use-after-free read in drm_getunique()
    afd87792db35 Revert "ACPI: sleep: Put the FACS table after using it"
    82a8ffba54d3 spi: bcm2835: Fix out-of-bounds access with more than 4 slaves
    05e6b7159475 ALSA: hda/realtek: fix mute/micmute LEDs for HP ZBook Power G8
    d62d55f3941b ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 840 Aero G8
    557306806777 ALSA: hda/realtek: fix mute/micmute LEDs and speaker for HP EliteBook x360 1040 G8
    bd0fe358d182 ALSA: hda/realtek: fix mute/micmute LEDs and speaker for HP Elite Dragonfly G2
    6a81e47788ff ALSA: hda/realtek: headphone and mic don't work on an Acer laptop
    98f842951f8a ALSA: firewire-lib: fix the context to call snd_pcm_stop_xrun()
    bd7d88b0874f ALSA: seq: Fix race of snd_seq_timer_open()
    fff6af6deae8 i2c: mpc: implement erratum A-004447 workaround
    d78b76af9f61 i2c: mpc: Make use of i2c_recover_bus()
    fa05ba61967a spi: Cleanup on failure of initial setup
    0c4d4de2da4d spi: Don't have controller clean up spi device before driver unbind
    3a5b982463f4 powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P1010 i2c controllers
    a7c3c17867b3 powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c controllers
    590f718a6473 nvmet: fix false keep-alive timeout when a controller is torn down
    2538f06f9468 nvme-tcp: remove incorrect Kconfig dep in BLK_DEV_NVME
    b0308804b2e0 bnx2x: Fix missing error code in bnx2x_iov_init_one()
    90547d5db50b dm verity: fix require_signatures module_param permissions
    7519ece673e3 MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER
    37a079a6ae14 nvme-fabrics: decode host pathing error for connect
    f42afc0f2902 net: dsa: microchip: enable phy errata workaround on 9567
    ee144b798028 net: appletalk: cops: Fix data race in cops_probe1
    a385cbf31ed0 net: macb: ensure the device is available before accessing GEMGXL control registers
    bbb48789b62a scsi: target: qla2xxx: Wait for stop_phase1 at WWN removal
    16763635285c scsi: hisi_sas: Drop free_irq() of devm_request_irq() allocated irq
    eac1d159b7a3 scsi: vmw_pvscsi: Set correct residual data length
    30030c6ff3d4 scsi: bnx2fc: Return failure if io_req is already in ABTS processing
    8d717c9135a3 net:sfc: fix non-freed irq in legacy irq mode
    e806df71eed2 RDS tcp loopback connection can hang
    4353eb42180d net/qla3xxx: fix schedule while atomic in ql_sem_spinlock
    ad241cb1cffb wq: handle VM suspension in stall detection
    5ca472d40e2d cgroup: disable controllers at parse time
    be23c4af3d8a net: mdiobus: get rid of a BUG_ON()
    1d6d43d4805d netlink: disable IRQs for netlink_lock_table()
    42e490013809 bonding: init notify_work earlier to avoid uninitialized use
    143fc7220961 isdn: mISDN: netjet: Fix crash in nj_probe:
    2e2145ccfbcb usb: chipidea: udc: assign interrupt number to USB gadget structure
    06e84ea1f457 spi: sprd: Add missing MODULE_DEVICE_TABLE
    369f3caa4d74 ASoC: sti-sas: add missing MODULE_DEVICE_TABLE
    01905f3232fd vfio-ccw: Serialize FSM IDLE state with I/O completion
    cad3dc73c064 vfio-ccw: Reset FSM state to IDLE inside FSM
    4352209ed0f0 ASoC: Intel: bytcr_rt5640: Add quirk for the Lenovo Miix 3-830 tablet
    a5ee8f54d0ab ASoC: Intel: bytcr_rt5640: Add quirk for the Glavey TM800A550L tablet
    2f523cd4a931 usb: cdns3: Fix runtime PM imbalance on error
    1e5cab50208c net/nfc/rawsock.c: fix a permission check bug
    584b2c7ce244 bpf: Forbid trampoline attach for functions with variable arguments
    fb91ab403e6e spi: spi-zynq-qspi: Fix stack violation bug
    4b8b7bc3a726 spi: Fix spi device unregister flow
    cb24d57ad572 ASoC: amd: fix for pcm_read() error
    3b89db7468f7 ASoC: max98088: fix ni clock divider calculation
    f70102cb369c proc: Track /proc/$pid/attr/ opener mm_struct

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 877e8d2946..30dbb5d832 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine ?= "74f60bcd7323d243e0f3d3db34021ae624afb61a"
+SRCREV_meta ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.43"
+LINUX_VERSION ?= "5.10.46"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index b44deb6f32..33339f5ca1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.43"
+LINUX_VERSION ?= "5.10.46"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9c63dda7dd5834bf731747d6ae03ae13d48e20e3"
-SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine_qemuarm ?= "20eb193a68fbdaa56ed9a49b97aef6a0eb9fbdea"
+SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f99782c1be..9d7690dcd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2fc3409cf8c2a6d684929576fd409949060a0bd9"
-SRCREV_machine_qemuarm64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemumips ?= "5cec6d1ab35feb99f023b233871cafa29e3c3682"
-SRCREV_machine_qemuppc ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemuriscv64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemuriscv32 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
-SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_machine_qemuarm ?= "efa48180fd02b074a2c9e18958fc9b7e4c9f1c00"
+SRCREV_machine_qemuarm64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
+SRCREV_machine_qemumips ?= "aa324c158a84601d99949b7cfa5c376b9691cddc"
+SRCREV_machine_qemuppc ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuriscv64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemuriscv32 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemux86 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemux86-64 ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_machine_qemumips64 ?= "7bc9a08bf3b92db4fdb0225fdd23836c8f5c037f"
+SRCREV_machine ?= "9fe9a613a93f7ff39c94e376a15d5fc3ec7a0640"
+SRCREV_meta ?= "2c3ec293dba693dc7a344d4e42cb7fa733ef4f2d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.43"
+LINUX_VERSION ?= "5.10.46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

