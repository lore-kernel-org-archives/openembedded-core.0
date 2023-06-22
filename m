Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21C9EB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:19:40 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.25989.1687475974785939291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qMYAwfh6;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3fde1d6b1c4so1216211cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687475974; x=1690067974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7in3Sq8vnt7gBFv29FNosouZgXukxa934QsVVCx3cBI=;
        b=qMYAwfh62wbtb/9f31c8OOHR5G17J8e6Fw4ZyG1xrPlgjDsH8OyOHk50mC47i1LemA
         SLgG1LcCk9C37MgkkDFgo7rpRqWrFSpRl7S6Os1oKP0zkZjmeuc+iVKqR8yP6/0Qzysi
         5g7af86plujNMzuDso3icwficmiBJL/sPajhRDCKLa6wit5nU8Eb30sP5VF55zevOZqO
         ZtNmlNG3aPBeb+PfY7lo7Hbc4JQpMrUZvnSKGnVvGJ+UcnH7HBz5AwECxO4kNwaON9mT
         mggwP8GMqxVgPcJAmVzyujohExAzOBDQYgdbZjrLCbKaGFbr4WArzNZJ1cLMyRPkXVEK
         Ubkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687475974; x=1690067974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7in3Sq8vnt7gBFv29FNosouZgXukxa934QsVVCx3cBI=;
        b=iD7omk0gNk7q0iAMjyUDcGazcSEap9uszliLzSUGVYJM6MoFnqQniNS/Y4sI0N8dyy
         sE+pm5feZuq8DATzXoT4A4wHPm1t2uPEBL1hejz7Hzd8ws7u2QY+1Zbu8Hk8fih2gGWV
         UBKRlo/IbE5Q6u86ejqJ2zUiaVJL1v3W3SvNTGjvc7VIDBoUZBKAk3q/AtFIbEj3Jpru
         tHoR3q329mG0dw2y13dM1ldODMqepVikAu116kkNlDdkFzOwSzLjdDOsmL0SHRv8aE/U
         r9Fc2YSym0tKetWv8l0iV4clMZ7Qy//3Y/oLGFpCJmvROPIJ4AS8I67U64MKvd3zV6Ik
         YB1w==
X-Gm-Message-State: AC+VfDxypkY66u/VG75OQHKETfp62MmEbdYLvNPJlNay4KmS3E6ZXWDv
	dRbuEiaAPYtUxUqz33Vqt6ABjr9MOLEYdQ==
X-Google-Smtp-Source: ACHHUZ5r4GLSSLuy6Jzpoyp0S8yK8Owv8rbB3ELMff3YmAspwDU1nBrIE9RmtETApaYmExCdG4H9ag==
X-Received: by 2002:ac8:5989:0:b0:3ff:3151:a8c2 with SMTP id e9-20020ac85989000000b003ff3151a8c2mr9566492qte.2.1687475973570;
        Thu, 22 Jun 2023 16:19:33 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t2-20020ac86a02000000b003f9c26069aesm4137148qtr.34.2023.06.22.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:19:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/4] linux-yocto/5.10: update to v5.10.182
Date: Thu, 22 Jun 2023 19:19:29 -0400
Message-Id: <20230622231932.928672-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183298

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c7992b6c7f0e Linux 5.10.182
    468bebc426ba netfilter: ctnetlink: Support offloaded conntrack entry deletion
    18c14d3028c0 ipv{4,6}/raw: fix output xfrm lookup wrt protocol
    2218752325a9 binder: fix UAF caused by faulty buffer cleanup
    e4d2e6c3054b bluetooth: Add cmd validity checks at the start of hci_sock_ioctl()
    6a0712d9fe46 net: phy: mscc: enable VSC8501/2 RGMII RX clock
    b556990235c3 net/mlx5: Devcom, serialize devcom registration
    57dc3c124e7b net/mlx5: devcom only supports 2 ports
    860ad704e450 regulator: pca9450: Fix BUCK2 enable_mask
    b3a9c4081db9 regulator: pca9450: Convert to use regulator_set_ramp_delay_regmap
    12cb97ed85fb regulator: Add regmap helper for ramp-delay setting
    b557220d3140 power: supply: bq24190: Call power_supply_changed() after updating input current
    224f7bbf577b power: supply: core: Refactor power_supply_set_input_current_limit_from_supplier()
    277b489ad0b7 power: supply: bq27xxx: After charger plug in/out wait 0.5s for things to stabilize
    0949c572d42d power: supply: bq27xxx: Ensure power_supply_changed() is called on current sign changes
    6ed541254f4b power: supply: bq27xxx: Move bq27xxx_battery_update() down
    ed78797a264c power: supply: bq27xxx: expose battery data when CI=1
    7ff807d68b5d power: supply: bq27xxx: Add cache parameter to bq27xxx_battery_current_and_status()
    432f98c559f2 power: supply: bq27xxx: make status more robust
    659094e4057a power: supply: bq27xxx: fix sign of current_now for newer ICs
    14e1a958d988 power: supply: bq27xxx: fix polarity of current_now
    18c9cf463337 x86/cpu: Drop spurious underscore from RAPTOR_LAKE #define
    4a8980cb2a7c x86/cpu: Add Raptor Lake to Intel family
    272d4b8a5b96 Linux 5.10.181
    cf7ee4b15838 net: phy: mscc: add VSC8502 to MODULE_DEVICE_TABLE
    98cedb991094 3c589_cs: Fix an error handling path in tc589_probe()
    6f449e409b75 arm64: dts: imx8mn-var-som: fix PHY detection bug by adding deassert delay
    d4d10a6df152 net/mlx5: Devcom, fix error flow in mlx5_devcom_register_device
    8b9c561b9fc1 net/mlx5: Fix error message when failing to allocate device memory
    c21862232f6c net/mlx5: DR, Fix crc32 calculation to work on big-endian (BE) CPUs
    058fd18e7477 net/mlx5e: do as little as possible in napi poll when budget is 0
    5afd5fb8a9a7 forcedeth: Fix an error handling path in nv_probe()
    80a4b9ad4288 ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
    c966b58c8515 x86/show_trace_log_lvl: Ensure stack pointer is aligned, again
    0de80163dea6 xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()
    b663696c0652 coresight: Fix signedness bug in tmc_etr_buf_insert_barrier_packet()
    a52d2019ec7c fs: fix undefined behavior in bit shift for SB_NOUSER
    52967bbb93eb power: supply: sbs-charger: Fix INHIBITED bit for Status reg
    e85757da9091 power: supply: bq27xxx: Fix poll_interval handling and races on remove
    1da9a4b55a66 power: supply: bq27xxx: Fix I2C IRQ race on remove
    ac1ab213946d power: supply: bq27xxx: Fix bq27xxx_battery_update() race condition
    2de6eb7c40f9 power: supply: leds: Fix blink to LED on transition
    e5f82688ae10 ipv6: Fix out-of-bounds access in ipv6_find_tlv()
    a61d5c13c7d1 bpf: Fix mask generation for 32-bit narrow loads of 64-bit fields
    72971f4071b4 octeontx2-pf: Fix TSOv6 offload
    1c8a016822bb selftests: fib_tests: mute cleanup error message
    a594382ec6d0 net: fix skb leak in __skb_tstamp_tx()
    8a30dce9d7f7 media: radio-shark: Add endpoint checks
    ccef03c51135 USB: sisusbvga: Add endpoint checks
    4c260bbf356a USB: core: Add routines for endpoint checks in old drivers
    5014b64e369b udplite: Fix NULL pointer dereference in __sk_mem_raise_allocated().
    4bb955c4d283 net: fix stack overflow when LRO is disabled for virtual interfaces
    58ecc165abda fbdev: udlfb: Fix endpoint check
    fd673079749b debugobjects: Don't wake up kswapd from fill_pool()
    a12ce786bef6 x86/topology: Fix erroneous smp_num_siblings on Intel Hybrid platforms
    518c39fc1ed6 parisc: Fix flush_dcache_page() for usage from irq context
    2d78438c3183 selftests/memfd: Fix unknown type name build failure
    d4a5e6ae9967 x86/mm: Avoid incomplete Global INVLPG flushes
    628d7e494134 dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size type
    139f84c80d9f btrfs: use nofs when cleaning up aborted transactions
    ea50ee0ef904 gpio: mockup: Fix mode of debugfs files
    c570dbf279a8 parisc: Allow to reboot machine after system halt
    de0d7dd5efd4 parisc: Handle kgdb breakpoints only in kernel context
    89eba5586aa4 m68k: Move signal frame following exception on 68020/030
    42b78c8cc774 net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize
    798c1c62cfa5 ALSA: hda/realtek: Enable headset onLenovo M70/M90
    1f57a1b97949 ALSA: hda: Fix unhandled register update during auto-suspend period
    b0d7e62fd15e ALSA: hda/ca0132: add quirk for EVGA X299 DARK
    c41324385aa7 ocfs2: Switch to security_inode_init_security()
    60afe299bb54 spi: fsl-cpm: Use 16 bit mode for large transfers with even size
    e3674788a865 spi: fsl-spi: Re-organise transfer bits_per_word adaptation
    532451037863 act_mirred: use the backlog for nested calls to mirred ingress
    f5bf8e3ca13e net/sched: act_mirred: better wording on protection against excessive stack growth
    bba7ebe10baf net/sched: act_mirred: refactor the handle of xmit
    047f618d198e writeback, cgroup: remove extra percpu_ref_exit()
    84fbe6ad0fa3 ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
    dbcc95bb510e watchdog: sp5100_tco: Immediately trigger upon starting.
    75258f083868 s390/qdio: fix do_sqbs() inline assembly constraint
    3681a0287a73 s390/qdio: get rid of register asm
    9c9f253fc60b serial: 8250_exar: Add support for USR298x PCI Modems
    1ffa0b8ba928 serial: exar: Add support for Sealevel 7xxxC serial cards
    fb3c5714f5ce serial: 8250_exar: derive nr_ports from PCI ID for Acces I/O cards
    18fbf8cfbb9d KVM: arm64: Link position-independent string routines into .hyp.text
    e266da1656d6 HID: wacom: add three styli to wacom_intuos_get_tool_type
    dfd419db0391 HID: wacom: Add new Intuos Pro Small (PTH-460) device IDs
    05b170379744 HID: wacom: Force pen out of prox if no events have been received in a while
    6b4205ea9790 nilfs2: fix use-after-free bug of nilfs_root in nilfs_evict_inode()
    710dee57012e powerpc/64s/radix: Fix soft dirty tracking
    ae149cdaef4e tpm/tpm_tis: Disable interrupts for more Lenovo devices
    8c0109d76235 ceph: force updating the msg pointer in non-split case
    11dddfbb7a4e vc_screen: reload load of struct vc_data pointer in vcs_write() to avoid UAF
    ea3d5de90bc0 serial: Add support for Advantech PCI-1611U card
    ba061afa060e statfs: enforce statfs[64] structure initialization
    845f98af6ae8 can: kvaser_pciefd: Disable interrupts in probe error path
    7a7ec807fe54 can: kvaser_pciefd: Do not send EFLUSH command on TFD interrupt
    65e85232ffa6 can: kvaser_pciefd: Clear listen-only bit if not explicitly requested
    0babb3fabf55 can: kvaser_pciefd: Empty SRB buffer in probe
    03714e9c04ec can: kvaser_pciefd: Call request_irq() before enabling interrupts
    3bbeba3ce14d can: kvaser_pciefd: Set CAN_STATE_STOPPED in kvaser_pciefd_stop()
    073a4d750cec can: isotp: recvmsg(): allow MSG_CMSG_COMPAT flag
    b4b8294a41ca can: j1939: recvmsg(): allow MSG_CMSG_COMPAT flag
    f7f799a6fe38 ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
    b4f770e61230 ALSA: hda/realtek: Add a quirk for HP EliteDesk 805
    6cebdffba628 ALSA: hda/realtek: Add quirk for Clevo L140AU
    3add6b2a4a69 ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch table
    546b1f5f45a3 ALSA: hda: Fix Oops by 9.1 surround channel names
    ff466f77d0a5 usb: typec: altmodes/displayport: fix pin_assignment_show
    35e31e1e921c usb: gadget: u_ether: Fix host MAC address case
    e35adb75fda5 usb: dwc3: debugfs: Resume dwc3 before accessing registers
    66070f5b9995 USB: UHCI: adjust zhaoxin UHCI controllers OverCurrent bit value
    0caed1faf5f6 usb-storage: fix deadlock when a scsi command timeouts more than once
    6340e432cf70 USB: usbtmc: Fix direction for 0-length ioctl control messages
    3b3c6f2d2f1f ALSA: usb-audio: Add a sample rate workaround for Line6 Pod Go
    3bd6d11e7e63 bridge: always declare tunnel functions
    3fa13203b6d9 netfilter: nft_set_rbtree: fix null deref on element insertion
    6cfe6f51856b vlan: fix a potential uninit-value in vlan_dev_hard_start_xmit()
    562ec162b04a igb: fix bit_shift to be in [1..8] range
    dc61f7582cc9 cassini: Fix a memory leak in the error handling path of cas_init_one()
    81139679f4d2 scsi: storvsc: Don't pass unused PFNs to Hyper-V host
    d0d39bed9e95 wifi: iwlwifi: mvm: don't trust firmware n_channels
    f9337a41772d wifi: mac80211: fix min center freq offset tracing
    43f6575004e0 net: bcmgenet: Restore phy_stop() depending upon suspend/close
    e92727ed9e8b net: bcmgenet: Remove phy_stop() from bcmgenet_netif_stop()
    2937127d24cc tipc: check the bearer min mtu properly when setting it by netlink
    2bd4ff4ffb92 tipc: do not update mtu if msg_max is too small in mtu negotiation
    097ea78d8cca tipc: add tipc_bearer_min_mtu to calculate min mtu
    76ea144a35ba net/tipc: fix tipc header files for kernel-doc
    02b20e0bc0c2 net: nsh: Use correct mac_offset to unwind gso skb in nsh_gso_segment()
    01cdda0d27d7 drm/exynos: fix g2d_open/close helper function definitions
    ce97bb60a6e4 SUNRPC: Fix trace_svc_register() call site
    f9982db735a8 media: netup_unidvb: fix use-after-free at del_timer()
    0cefa4215243 net: hns3: fix reset delay time to avoid configuration timeout
    aba74ad99870 net: hns3: fix sending pfc frames after reset issue
    e1f800be74c1 erspan: get the proto with the md version for collect_md
    153017561d28 serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
    e7fd68abbba3 tcp: fix possible sk_priority leak in tcp_v4_send_reset()
    788791990d74 net: Find dst with sk's xfrm policy not ctl_sk
    a9ef8b258988 ipv4/tcp: do not use per netns ctl sockets
    171669917762 vsock: avoid to close connected socket after the timeout
    b1cf6bd8833b ALSA: hda/realtek: Apply HP B&O top speaker profile to Pavilion 15
    13c5fa1248bf ALSA: firewire-digi00x: prevent potential use after free
    6fb537895d29 net: phy: dp83867: add w/a for packet errors seen with short cables
    83996d317b1d net: fec: Better handle pm_runtime_get() failing in .remove()
    8f57715f8ef6 af_key: Reject optional tunnel/BEET mode templates in outbound policies
    f5cb28a90c8c cpupower: Make TSC read per CPU for Mperf monitor
    dc30fed07ddf drm/msm/dpu: Remove duplicate register defines from INTF
    eaf9394ed79c drm/msm/dp: unregister audio driver during unbind
    c5449195f86e Revert "Fix XFRM-I support for nested ESP tunnels"
    295e07a76bf3 xfrm: don't check the default policy if the policy allows the packet
    84fdaaf0d76e btrfs: fix space cache inconsistency after error loading it from disk
    a842fb6038e5 btrfs: replace calls to btrfs_find_free_ino with btrfs_find_free_objectid
    9c69a9d05824 btrfs: move btrfs_find_highest_objectid/btrfs_find_free_objectid to disk-io.c
    6a1a72a8cfda mfd: dln2: Fix memory leak in dln2_probe()
    7d939e367b64 phy: st: miphy28lp: use _poll_timeout functions for waits
    3b37bb0d9290 Input: xpad - add constants for GIP interface numbers
    94ec1a44e843 iommu/arm-smmu-v3: Acknowledge pri/event queue overflow if any
    cae5f8f4f7a8 clk: tegra20: fix gcc-7 constant overflow warning
    8c472e68bea0 iommu/arm-smmu-qcom: Limit the SMR groups to 128
    214ae2c1a9ce RDMA/core: Fix multiple -Warray-bounds warnings
    2d9ca5f62f2b recordmcount: Fix memory leaks in the uwrite function
    cf3e2916017d sched: Fix KCSAN noinstr violation
    158502f79076 mcb-pci: Reallocate memory region to avoid memory overlapping
    2c86a1305c14 serial: 8250: Reinit port->pm on port specific driver unbind
    7ed30db87994 usb: typec: tcpm: fix multiple times discover svids error
    60fabcba7543 HID: wacom: generic: Set battery quirk only when we see battery data
    d234de1a924e spi: spi-imx: fix MX51_ECSPI_* macros when cs > 3
    0898a1df72ac HID: logitech-hidpp: Reconcile USB and Unifying serials
    958534d4368b HID: logitech-hidpp: Don't use the USB serial for USB devices
    bb1313f37e7b staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
    55410a9144c7 Bluetooth: L2CAP: fix "bad unlock balance" in l2cap_disconnect_rsp
    a2d816f55da1 Bluetooth: hci_bcm: Fall back to getting bdaddr from EFI if not set
    ba66851aba80 ipvs: Update width of source for ip_vs_sync_conn_options
    866921dc06b9 wifi: ath11k: Fix SKB corruption in REO destination ring
    91ad1ab3cc7e wifi: iwlwifi: dvm: Fix memcpy: detected field-spanning write backtrace
    e732a266b973 null_blk: Always check queue mode setting from configfs
    059e426d666a wifi: iwlwifi: pcie: Fix integer overflow in iwl_write_to_user_buf
    0fc0d287c1e7 wifi: iwlwifi: pcie: fix possible NULL pointer dereference
    7560ed6592ff samples/bpf: Fix fout leak in hbm's run_bpf_prog
    ad87bd313f70 f2fs: fix to drop all dirty pages during umount() if cp_error is set
    fc7237e191b9 ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()
    3ca3005b502c ext4: set goal start correctly in ext4_mb_normalize_request
    4c2c8f959984 gfs2: Fix inode height consistency check
    697f92f8317e scsi: message: mptlan: Fix use after free bug in mptlan_remove() due to race condition
    f748e1525383 lib: cpu_rmap: Avoid use after free on rmap->obj array entries
    4621e24c9257 scsi: target: iscsit: Free cmds before session free
    2ea171230a39 net: Catch invalid index in XPS mapping
    8b61e7ad13f2 net: pasemi: Fix return type of pasemi_mac_start_tx()
    e0e7faee3a7d scsi: lpfc: Prevent lpfc_debugfs_lockstat_write() buffer overflow
    22ab5fed07ad ext2: Check block size validity during mount
    4e8dc0e5c763 wifi: brcmfmac: cfg80211: Pass the PMK in binary instead of hex
    e8d49d1c5968 bpf: Annotate data races in bpf_local_storage
    30d041c18dfb wifi: ath: Silence memcpy run-time false positive warning
    b8e7589f50b7 drm/amd: Fix an out of bounds error in BIOS parser
    978e0d05547a ACPICA: ACPICA: check null return of ACPI_ALLOCATE_ZEROED in acpi_db_display_objects
    16359bc02c09 ACPICA: Avoid undefined behavior: applying zero offset to null pointer
    3f64a0e66469 drm/tegra: Avoid potential 32-bit integer overflow
    f718f1fd3e4c remoteproc: stm32_rproc: Add mutex protection for workqueue
    066b90bca755 ACPI: EC: Fix oops when removing custom query handlers
    7d8f5ccc826b firmware: arm_sdei: Fix sleep from invalid context BUG
    5c23f6da62f7 memstick: r592: Fix UAF bug in r592_remove due to race condition
    ae6769fb939c arm64: dts: qcom: msm8996: Add missing DWC3 quirks
    bb1616e1057d regmap: cache: Return error in cache sync operations for REGCACHE_NONE
    d5138ad7ca1d drm/amd/display: Use DC_LOG_DC in the trasform pixel function
    c8daee665858 fs: hfsplus: remove WARN_ON() from hfsplus_cat_{read,write}_inode()
    a7d21b858589 rcu: Protect rcu_print_task_exp_stall() ->exp_tasks access
    e4842de4ec13 refscale: Move shutdown from wait_event() to wait_event_idle()
    100c0ad6c045 ext4: allow ext4_get_group_info() to fail
    371d8b8ea0cb ext4: allow to find by goal if EXT4_MB_HINT_GOAL_ONLY is set
    8669fff0d0cd ext4: add mballoc stats proc file
    9b6a0c140e27 ext4: drop s_mb_bal_lock and convert protected fields to atomic
    0983142c5f17 ext4: remove redundant mb_regenerate_buddy()
    d48b7eea9469 ext4: fix lockdep warning when enabling MMP
    5c87115520d2 ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled
    8284c7592d90 ext4: reflect error codes from ext4_multi_mount_protect() to its callers
    efd18a91c9c2 ext4: remove an unused variable warning with CONFIG_QUOTA=n
    df1be652a45f fbdev: arcfb: Fix error handling in arcfb_probe()
    bd6b353671fc drm/i915/dp: prevent potential div-by-zero
    8307e372e744 af_unix: Fix data races around sk->sk_shutdown.
    9b977b0cbb6d af_unix: Fix a data race of sk->sk_receive_queue->qlen.
    fb6ac4b5bdfe net: datagram: fix data-races in datagram_poll()
    f4a371d3f5a7 ipvlan:Fix out-of-bounds caused by unclear skb->cb
    963fe9ed8626 tcp: add annotations around sk->sk_shutdown accesses
    f86568eca4c9 tcp: factor out __tcp_close() helper
    34a5ee69ec62 net: add vlan_get_protocol_and_depth() helper
    9ccf3edbafba net: tap: check vlan with eth_type_vlan() method
    449391400960 net: deal with most data-races in sk_wait_event()
    1b33bdd76635 net: annotate sk->sk_err write from do_recvmmsg()
    f92557f79a60 netlink: annotate accesses to nlk->cb_running
    26001e75dc5c netfilter: conntrack: fix possible bug_on with enable_hooks=1
    d06f67b2b8dc net: Fix load-tearing on sk->sk_stamp in sock_recv_cmsgs().
    8eb35b1aca84 linux/dim: Do nothing if no time delta between samples
    4d3ae448e850 net: mdio: mvusb: Fix an error handling path in mvusb_mdio_probe()
    b882224d7367 ARM: 9296/1: HP Jornada 7XX: fix kernel-doc warnings
    139c27648f8d drm/mipi-dsi: Set the fwnode for mipi_dsi_device
    423908e89d7d driver core: add a helper to setup both the of_node and fwnode of a device

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 332a19366a..c23dd96547 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8008621f28248a94b5f1154350a4fc9c71b130d5"
-SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
+SRCREV_machine ?= "f8048496a00def29e831a2dde503f9dc41350858"
+SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.180"
+LINUX_VERSION ?= "5.10.182"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e8d4eeea72..60627fa6ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.180"
+LINUX_VERSION ?= "5.10.182"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d0dc3a46c784849731fc25990679b676f4306cef"
-SRCREV_machine ?= "5ca66907abef1e8a0be5d3109fd3f0d50f77bc5f"
-SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
+SRCREV_machine:qemuarm ?= "710c1d3d6dc78d596514ccbd2fcc522154d06ce7"
+SRCREV_machine ?= "cf5955813dc42c3b912c370225d7b8b06a174e25"
+SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cb28294a7f..63f30c250b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1cf6a458134cbbe232467622d8e34d2e9d10e92b"
-SRCREV_machine:qemuarm64 ?= "5db230097771631366812f12c9b04c8379f53c24"
-SRCREV_machine:qemumips ?= "795276fa64f0874a4ee0dcfa9c78e572314bdfa1"
-SRCREV_machine:qemuppc ?= "6ccfcf5138703538662241bf8ed897a1ef2a3def"
-SRCREV_machine:qemuriscv64 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
-SRCREV_machine:qemuriscv32 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
-SRCREV_machine:qemux86 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
-SRCREV_machine:qemux86-64 ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
-SRCREV_machine:qemumips64 ?= "4d6b146f00b8efc99e3d3d1d8a63220c29590c8d"
-SRCREV_machine ?= "c6515d2a698792220bed8fd39ccbcfec64d1130f"
-SRCREV_meta ?= "4476e17760bea9d68c392368f2396a2e9efa86c3"
+SRCREV_machine:qemuarm ?= "c07ca23533f6ea4b0c5d5ab3b3d3b4b5f361e036"
+SRCREV_machine:qemuarm64 ?= "32f59b5e5471134346fdee47ad92cf413d0949f5"
+SRCREV_machine:qemumips ?= "5f14b5b0a79815387ba790d4512f3a6c8b2adf2a"
+SRCREV_machine:qemuppc ?= "b71515906c0b182151512035c0c7475847018d3d"
+SRCREV_machine:qemuriscv64 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
+SRCREV_machine:qemuriscv32 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
+SRCREV_machine:qemux86 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
+SRCREV_machine:qemux86-64 ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
+SRCREV_machine:qemumips64 ?= "c4c925d2becffbfb59ebd07f798ae027d3170a71"
+SRCREV_machine ?= "b7c05c1d1a02709e45e38bee7d9690bd7fd9bbcb"
+SRCREV_meta ?= "af3a4fed664af7cce2aef179812bdb572f690760"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.180"
+LINUX_VERSION ?= "5.10.182"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


