Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B86C64ED6
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.19562.1676150646351225590
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2a06DpBr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id ct17so123768pfb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JMSy1ROvI83z3EkALuhXXIFsZ58dgYvYtU0zXQceiw=;
        b=2a06DpBrxPKepXKVGYMBlypPUJnwXMKPGzGBgG58PEICpQlqc/a1EUYKiXKE5kWOZQ
         lA2NiedapIBs4MLATA21y1dz6o7CYrWWgUKhqppjD3AY8qgK19CpfODvoPwZZgip7GVY
         znZ4spi0nm9L9y7QGICqs8qcQbUUoP9rzDqKDd3JQKPxyp9JP/TJDUxbdrDDrcqPpXtk
         eg6GgRNJSM8g3sYBNFfig0GVV9Y9s/xIurnwKPNpspJpqh1lfWVm3glJTatju/1kAeyB
         pgaL1qMNlj+W7HMA23evotth05P5bh+esJLLGIr/SGrAKRrx7ivdB86p3rFig+Ose8A/
         E1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JMSy1ROvI83z3EkALuhXXIFsZ58dgYvYtU0zXQceiw=;
        b=CcX+XnF0ouA8yx2fiDkFqkECFRPjq704sPlCCF+DqXubv7L8+BXqdBKUWAt0ecwH9T
         VOBkoL8QOzJuCM0qnI0kmuVOlTegLwF39nsbTcw6I4tQSa9XHzpBQTBAa+S+NmiHh7WW
         /OEQpjm+VRqNb8TbB/Rlib18JGK2ppnzIS7aQ7qT6wjIpXJgWCyMg5cbD/R52iDxk4AI
         VIfjG0Rfxg/2jhsJ3y6q5u5R/gBKUIL4IGmPf5YwCkjBud8Lh0rcKsyUvuaA3tUHiaJX
         Il6xZLeA+l9f5ol8TUR8Lb5Oz5gWns2khMc8mQOyTHTVdoh7s91GlGiVXYHbCgBNfTwT
         fZeQ==
X-Gm-Message-State: AO0yUKXWt688Ys5DT8eViU5/S5nTyJA7pkuSUOa0ZPAx5ch2PqCAn51P
	duKjfRfXxNQleKrr8bNJdOJ7jJprjmPkMuyhybs=
X-Google-Smtp-Source: AK7set/U1S4Yl2HXMeZQDltKwboCFDUEU82ERws5bJlJL9QylkEWNtIdmpDvXuDpqVgDQEsMuZVcbA==
X-Received: by 2002:aa7:95b7:0:b0:593:adeb:39c0 with SMTP id a23-20020aa795b7000000b00593adeb39c0mr18152961pfk.30.1676150645048;
        Sat, 11 Feb 2023 13:24:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/28] linux-yocto/5.15: update to v5.15.91
Date: Sat, 11 Feb 2023 11:23:27 -1000
Message-Id: <03be035016d95fb7d3c7cbe535e187971a6b8d1e.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177014

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    9cf4111cdf94 Linux 5.15.91
    14cc13e433e1 perf/x86/amd: fix potential integer overflow on shift of a int
    033636b32258 netfilter: conntrack: unify established states for SCTP paths
    0b08201158f1 x86/i8259: Mark legacy PIC interrupts with IRQ_LEVEL
    b57740036792 block: fix and cleanup bio_check_ro
    1d152437e46f kbuild: Allow kernel installation packaging to override pkg-config
    a1964688582d cpufreq: governor: Use kobject release() method to free dbs_data
    7c513ced0dec cpufreq: Move to_gov_attr_set() to cpufreq.h
    cf7a08622d2b Revert "Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode"
    53c5d61198c1 tools: gpio: fix -c option of gpio-event-mon
    a7d1a303ff0f treewide: fix up files incorrectly marked executable
    046fe53907c5 net: mdio-mux-meson-g12a: force internal PHY off on mux switch
    86bdccde7842 net/tg3: resolve deadlock in tg3_reset_task() during EEH
    4364bf79d829 thermal: intel: int340x: Add locking to int340x_thermal_get_trip_type()
    e69c3a0d9d3d net: mctp: mark socks as dead on unhash, prevent re-add
    954cc215cd7a net: ravb: Fix possible hang if RIS2_QFF1 happen
    0f7218bf0a00 net: ravb: Fix lack of register setting after system resumed for Gen3
    3db4ca2938eb ravb: Rename "no_ptp_cfg_active" and "ptp_cfg_active" variables
    621f296f11cf gpio: mxc: Unlock on error path in mxc_flip_edge()
    071a8392869f nvme: fix passthrough csi check
    614471b7f7cd riscv/kprobe: Fix instruction simulation of JALR
    3391bd42351b sctp: fail if no bound addresses can be used for a given scope
    b0784860e145 net/sched: sch_taprio: do not schedule in taprio_reset()
    d2d3ab1b1de3 netrom: Fix use-after-free of a listening socket.
    9df5ab02c65e netfilter: conntrack: fix vtag checks for ABORT/SHUTDOWN_COMPLETE
    ca3cf947760d ipv4: prevent potential spectre v1 gadget in fib_metrics_match()
    d50e7348b44f ipv4: prevent potential spectre v1 gadget in ip_metrics_convert()
    ead06e3449f2 netlink: annotate data races around sk_state
    c4eb423c6b9b netlink: annotate data races around dst_portid and dst_group
    fac9b69a9370 netlink: annotate data races around nlk->portid
    8a13595600f7 netfilter: nft_set_rbtree: skip elements in transaction from garbage collection
    2bf1435fa19d netfilter: nft_set_rbtree: Switch to node list walk for overlap detection
    e481654426b6 drm/i915/selftest: fix intel_selftest_modify_policy argument types
    66689a72ba73 net: fix UaF in netns ops registration error path
    41b74e95f297 netlink: prevent potential spectre v1 gadgets
    2f29d780bd69 i2c: designware: use casting of u64 in clock multiplication to avoid overflow
    b03f7ed9af6e scsi: ufs: core: Fix devfreq deadlocks
    858d7e9218e1 net: mana: Fix IRQ name - add PCI and queue number
    bff5243bd326 EDAC/qcom: Do not pass llcc_driv_data as edac_device_ctl_info's pvt_info
    5eedf4568d34 EDAC/device: Respect any driver-supplied workqueue polling value
    4b7dfd0a6811 ARM: 9280/1: mm: fix warning on phys_addr_t to void pointer assignment
    7807871f28f8 ipv6: fix reachability confirmation with proxy_ndp
    f9a22f6fa187 thermal: intel: int340x: Protect trip temperature from concurrent updates
    036093c08d83 KVM: arm64: GICv4.1: Fix race with doorbell on VPE activation/deactivation
    c56683c0623e KVM: x86/vmx: Do not skip segment attributes if unusable bit is set
    e91308e63710 ovl: fail on invalid uid/gid mapping at copy up
    33a9657d67a4 ksmbd: limit pdu length size according to connection status
    8d83a758ee21 ksmbd: downgrade ndr version error message to debug
    87a7f38a9058 ksmbd: do not sign response to session request for guest login
    4210c3555db4 ksmbd: add max connections parameter
    cc6742b160fa ksmbd: add smbd max io size parameter
    3c8a5648a591 i2c: mv64xxx: Add atomic_xfer method to driver
    e619ab4fb3e9 i2c: mv64xxx: Remove shutdown method from driver
    4b83bc6f87ee cifs: Fix oops due to uncleared server->smbd_conn in reconnect
    89042d3d8542 ftrace/scripts: Update the instructions for ftrace-bisect.sh
    592ba7116fa6 trace_events_hist: add check for return value of 'create_hist_field'
    b0af180514ed tracing: Make sure trace_printk() can output as soon as it can be used
    91135d723388 module: Don't wait for GOING modules
    85ee9919add9 KVM: SVM: fix tsc scaling cache logic
    f0227eca972c scsi: hpsa: Fix allocation size for scsi_host_alloc()
    e5af9a458a13 drm/amdgpu: complete gfxoff allow signal during suspend without delay
    62b9e9f92109 Bluetooth: hci_sync: cancel cmd_timer if hci_open failed
    21998acd31fb exit: Use READ_ONCE() for all oops/warn limit reads
    e82b1598eb2c docs: Fix path paste-o for /sys/kernel/warn_count
    1c51698ad6f6 panic: Expose "warn_count" to sysfs
    0691ddae56cd panic: Introduce warn_limit
    7b98914a6c26 panic: Consolidate open-coded panic_on_warn checks
    fc636b136272 exit: Allow oops_limit to be disabled
    339f8a8e5211 exit: Expose "oops_count" to sysfs
    f80fb0001f11 exit: Put an upper limit on how often we can oops
    2857ce7f475f panic: Separate sysctl logic from CONFIG_SMP
    e156d4dcb036 ia64: make IA64_MCA_RECOVERY bool instead of tristate
    9024f772248e csky: Fix function name in csky_alignment() and die()
    2ea497d153da h8300: Fix build errors from do_exit() to make_task_dead() transition
    a452ca0228bb hexagon: Fix function name in die()
    3b39f47474a2 objtool: Add a missing comma to avoid string concatenation
    39a26d872178 exit: Add and use make_task_dead.
    b5c1acaa43b6 kasan: no need to unset panic_on_warn in end_report()
    b5c967dc6822 ubsan: no need to unset panic_on_warn in ubsan_epilogue()
    e4cd2100324e panic: unset panic_on_warn inside panic()
    191f1f1f6a42 kernel/panic: move panic sysctls to its own file
    654f6e851271 sysctl: add a new register_sysctl_init() interface
    3aa991cde94b fs: reiserfs: remove useless new_opts in reiserfs_remount
    d830531f8fff x86: ACPI: cstate: Optimize C3 entry on AMD CPUs
    1f5476223100 drm/i915: Remove unused variable
    6e1012709320 Revert "selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID"
    619ee31b9641 drm/i915: Allow switching away via vga-switcheroo if uninitialized
    ea435ba9eb85 firmware: coreboot: Check size of table entry and use flex-array
    a4e70bcf2e87 lockref: stop doing cpu_relax in the cmpxchg loop
    b0ee61f5eeab platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
    e8d2f7f56691 platform/x86: touchscreen_dmi: Add info for the CSL Panther Tab HD
    2e0a8bacbe1d r8152: add vendor/device ID pair for Microsoft Devkit
    d4b717e34dac scsi: hisi_sas: Set a port invalid only if there are no devices attached when refreshing port id
    e15750aa28a6 KVM: s390: interrupt: use READ_ONCE() before cmpxchg()
    9300c65207f3 spi: spidev: remove debug messages that access spidev->spi without locking
    48ff5d381298 ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
    5001ffb31d63 ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
    b76120e20683 cpufreq: armada-37xx: stop using 0 as NULL pointer
    eda26fa8560d perf/x86/intel/uncore: Add Emerald Rapids
    544f9d4e9d8a perf/x86/msr: Add Emerald Rapids
    b1eb964d785f s390: expicitly align _edata and _end symbols on page boundary
    fb45ec279b00 s390/debug: add _ASM_S390_ prefix to header guard
    cd488abed97e drm: Add orientation quirk for Lenovo ideapad D330-10IGL
    ff7ab370b855 net: usb: cdc_ether: add support for Thales Cinterion PLS62-W modem
    d6935084e444 ASoC: fsl_micfil: Correct the number of steps on SX controls
    ac07316b2d57 cpufreq: Add SM6375 to cpufreq-dt-platdev blocklist
    f0e6dcae1491 kcsan: test: don't put the expect array on the stack
    c51c0b37543a cpufreq: Add Tegra234 to cpufreq-dt-platdev blocklist
    28e4e8ca9e95 scsi: iscsi: Fix multiple iSCSI session unbind events sent to userspace
    14b1df2004fe tcp: fix rate_app_limited to default to 1
    120b8e527e07 net: stmmac: enable all safety features by default
    a7d736cc3c6c thermal: core: call put_device() only after device_register() fails
    ed08f958e481 thermal/core: fix error code in __thermal_cooling_device_register()
    108a6f91e276 thermal: Validate new state in cur_state_store()
    bd0ea77edf46 thermal/core: Rename 'trips' to 'num_trips'
    521c6ebd4f6e thermal/core: Remove duplicate information when an error occurs
    6504afa2632a net: dsa: microchip: ksz9477: port map correction in ALU table entry register
    18346db1854a selftests/net: toeplitz: fix race on tpacket_v3 block close
    caa28c7c83e3 driver core: Fix test_async_probe_init saves device in wrong array
    89c62cee5d4d w1: fix WARNING after calling w1_process()
    3d0eafe413a7 w1: fix deadloop in __w1_remove_master_device()
    7701a4bd45c1 device property: fix of node refcount leak in fwnode_graph_get_next_endpoint()
    ed0d8f731e0b ptdma: pt_core_execute_cmd() should use spinlock
    29e9c67bf327 octeontx2-pf: Fix the use of GFP_KERNEL in atomic context on rt
    03bff5819ad3 tcp: avoid the lookup process failing to get sk in ehash table
    5bd69d2ea897 nvme-pci: fix timeout request state check
    39178dfe8677 drm/amd/display: fix issues with driver unload
    9a5a537e1444 phy: phy-can-transceiver: Skip warning if no "max-bitrate"
    4095065b59bc dmaengine: xilinx_dma: call of_node_put() when breaking out of for_each_child_of_node()
    5bd3c1c1bce1 cifs: fix potential deadlock in cache_refresh_path()
    1a2a47b85cab HID: betop: check shape of output reports
    b2a730974373 l2tp: prevent lockdep issue in l2tp_tunnel_register()
    edf0e509cedd virtio-net: correctly enable callback during start_xmit
    d3401c7624ec net: macb: fix PTP TX timestamp failure due to packet padding
    71c601965532 dmaengine: Fix double increment of client_count in dma_chan_get()
    1e7919f0b156 drm/panfrost: fix GENERIC_ATOMIC64 dependency
    a1b3e50e2140 net: mlx5: eliminate anonymous module_init & module_exit
    09e3fb6f53bc net/mlx5: E-switch, Fix setting of reserved fields on MODIFY_SCHEDULING_ELEMENT
    01a6e108101f net: ipa: disable ipa interrupt during suspend
    98aec50ff7f6 Bluetooth: Fix possible deadlock in rfcomm_sk_state_change
    0e59f60b74cd usb: gadget: f_fs: Ensure ep0req is dequeued before free_request
    ae8e136bcaae usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
    f25cd2b731d7 HID: revert CHERRY_MOUSE_000C quirk
    39483511fd59 pinctrl: rockchip: fix mux route data for rk3568
    1dae88a0b4df net: stmmac: fix invalid call to mdiobus_get_phy()
    6716838bf801 HID: check empty report_list in bigben_probe()
    2b4956825436 HID: check empty report_list in hid_validate_values()
    ad67de330d83 net: mdio: validate parameter addr in mdiobus_get_phy()
    486912937933 net: usb: sr9700: Handle negative len
    2827c4eb429d octeontx2-pf: Avoid use of GFP_KERNEL in atomic context
    77e8ed776cdb l2tp: close all race conditions in l2tp_tunnel_register()
    af22d2c0b47f l2tp: convert l2tp_tunnel_list to idr
    22c7d45ca3d7 l2tp: Don't sleep and disable BH under writer-side sk_callback_lock
    87d9205d9a57 l2tp: Serialize access to sk_user_data with sk_callback_lock
    c53acbf2facf net/sched: sch_taprio: fix possible use-after-free
    40516d042b65 net: stmmac: Fix queue statistics reading
    620aa67f8059 pinctrl: rockchip: fix reading pull type on rk3568
    ddca674af1ba pinctrl/rockchip: add error handling for pull/drive register getters
    259ab8fb8c7e pinctrl/rockchip: Use temporary variable for struct device
    8cbf932c5c40 wifi: rndis_wlan: Prevent buffer overflow in rndis_query_oid
    f792d26e5ce7 gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
    8335f877efe7 gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
    fb4fb3d267c9 gpio: use raw spinlock for gpio chip shadowed data
    52e3eebfe670 sch_htb: Avoid grafting on htb_destroy_class_offload when destroying htb
    8232e5a84d25 net: enetc: avoid deadlock in enetc_tx_onestep_tstamp()
    95347e41cac6 net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs
    7f129927feaf net: nfc: Fix use-after-free in local_cleanup()
    397aaac88469 phy: rockchip-inno-usb2: Fix missing clk_disable_unprepare() in rockchip_usb2phy_power_on()
    01bdcc73dbe7 bpf: Fix pointer-leak due to insufficient speculative store bypass mitigation
    261e2f12b653 amd-xgbe: Delay AN timeout during KR training
    a8cf4af5441f amd-xgbe: TX Flow Ctrl Registers are h/w ver dependent
    8e897cb67421 ARM: dts: at91: sam9x60: fix the ddr clock for sam9x60
    0a27dcd53430 NFSD: fix use-after-free in nfsd4_ssc_setup_dul()
    24af570c99b4 phy: ti: fix Kconfig warning and operator precedence
    631fc3668539 arm64: dts: qcom: msm8992-libra: Fix the memory map
    dda20ffec8fb arm64: dts: qcom: msm8992-libra: Add CPU regulators
    37ba5e929349 arm64: dts: qcom: msm8992: Don't use sfpb mutex
    bab87524f6d4 PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()
    b7a479c76481 affs: initialize fsdata in affs_truncate()
    623d1116898e IB/hfi1: Remove user expected buffer invalidate race
    47d5fc0dcd57 IB/hfi1: Immediately remove invalid memory from hardware
    85caef2cfd1d IB/hfi1: Fix expected receive setup error exit issues
    cb193984d424 IB/hfi1: Reserve user expected TIDs
    891ddfae39f1 IB/hfi1: Reject a zero-length user expected buffer
    362c9489720b RDMA/core: Fix ib block iterator counter overflow
    e26c571c3b0d tomoyo: fix broken dependency on *.conf.default
    7dfe83ecc341 firmware: arm_scmi: Harden shared memory access in fetch_notification
    a653dbb70cce firmware: arm_scmi: Harden shared memory access in fetch_response
    caffa7fed139 EDAC/highbank: Fix memory leak in highbank_mc_probe()
    95de286200b2 reset: uniphier-glue: Fix possible null-ptr-deref
    4773a8cf9a53 reset: uniphier-glue: Use reset_control_bulk API
    7b33accc8ff9 soc: imx8m: Fix incorrect check for of_clk_get_by_name()
    f07427f8d9c6 arm64: dts: imx8mm-venice-gw7901: fix USB2 controller OC polarity
    c4cb73febe35 HID: intel_ish-hid: Add check for ishtp_dma_tx_map
    25f97c9883bf ARM: imx: add missing of_node_put()
    3e9d79ded9d6 arm64: dts: imx8mm-beacon: Fix ecspi2 pinmux
    538135076191 ARM: dts: imx6qdl-gw560x: Remove incorrect 'uart-has-rtscts'
    0e4bba1656a4 ARM: dts: imx7d-pico: Use 'clock-frequency'
    108cf4c6d510 ARM: dts: imx6ul-pico-dwarf: Use 'clock-frequency'
    207c9e64edba arm64: dts: imx8mp-phycore-som: Remove invalid PMIC property
    7ce380fe7574 dmaengine: ti: k3-udma: Do conditional decrement of UDMA_CHAN_RT_PEER_BCNT_REG
    edba9b7a7037 memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
    e66f6949da63 memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
    eda11ab55614 memory: tegra: Remove clients SID override programming
    aabd5ba7e9b0 Linux 5.15.90
    4b6f8263e931 io_uring/rw: remove leftover debug statement
    b10acfcd61b2 io_uring/rw: ensure kiocb_end_write() is always called
    124fb13cc757 io_uring: fix double poll leak on repolling
    e944f1e37b97 io_uring: Clean up a false-positive warning from GCC 9.3.0
    940e8922c1f5 mm/khugepaged: fix collapse_pte_mapped_thp() to allow anon_vma
    e83cc8a780e6 soc: qcom: apr: Make qcom,protection-domain optional again
    982c8b1e95c0 Revert "wifi: mac80211: fix memory leak in ieee80211_if_add()"
    40a4797e08ec block: mq-deadline: Rename deadline_is_seq_writes()
    3abf10b4c473 net/mlx5: fix missing mutex_unlock in mlx5_fw_fatal_reporter_err_work()
    1aab00aa4192 net/ulp: use consistent error code when blocking ULP
    2e4c95a404f3 io_uring/net: fix fast_iov assignment in io_setup_async_msg()
    311b298a3337 io_uring: io_kiocb_update_pos() should not touch file for non -1 offset
    487a086595b5 tracing: Use alignof__(struct {type b;}) instead of offsetof()
    430443f8565e x86/fpu: Use _Alignof to avoid undefined behavior in TYPE_ALIGN
    f114717dfa74 Revert "drm/amdgpu: make display pinning more flexible (v2)"
    7a993c1be595 efi: rt-wrapper: Add missing include
    de2af657cab9 arm64: efi: Execute runtime services from a dedicated stack
    9cca110cf8bb fs/ntfs3: Fix attr_punch_hole() null pointer derenference
    d4d112e5c458 drm/amdgpu: drop experimental flag on aldebaran
    c82fa690da7c drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
    88c33752248e drm/amd/display: Calculate output_color_space after pixel encoding adjustment
    87e605b16111 drm/amd/display: Fix set scaling doesn's work
    8687b8cdc3a3 drm/i915/display: Check source height is > 0
    5d961791663d drm/i915: re-disable RC6p on Sandy Bridge
    e9a7ec188b26 mei: me: add meteor lake point M DID
    eb0421d90f91 gsmi: fix null-deref in gsmi_get_variable
    b8d99cda526b serial: atmel: fix incorrect baudrate setup
    b85498385afc serial: amba-pl011: fix high priority character transmission in rs486 mode
    0f150134dd79 dmaengine: idxd: Let probe fail when workqueue cannot be enabled
    1e8c127c2e81 dmaengine: tegra210-adma: fix global intr clear
    473e2281f712 dmaengine: lgm: Move DT parsing after initialization
    73337724cbd8 serial: pch_uart: Pass correct sg to dma_unmap_sg()
    4307a41cbc44 dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible string documentation
    c9d55f564a69 dt-bindings: phy: g12a-usb2-phy: fix compatible string documentation
    78aa45bb7a42 usb-storage: apply IGNORE_UAS only for HIKSEMI MD202 on RTL9210
    a69c8dfb85b4 usb: gadget: f_ncm: fix potential NULL ptr deref in ncm_bitrate()
    1ab67e87b178 usb: gadget: g_webcam: Send color matching descriptor per frame
    b08167d8f07c usb: typec: altmodes/displayport: Fix pin assignment calculation
    7fb1322e7a8c usb: typec: altmodes/displayport: Add pin assignment helper
    59f9ee379640 usb: typec: tcpm: Fix altmode re-registration causes sysfs create fail
    a1c8a5c2f8aa usb: host: ehci-fsl: Fix module alias
    f073d10cd5a7 usb: cdns3: remove fetched trb from cache before dequeuing
    73f4bde9730f USB: serial: cp210x: add SCALANCE LPE-9000 device id
    a2e075f40122 USB: gadgetfs: Fix race between mounting and unmounting
    2da67bff29ab tty: fix possible null-ptr-defer in spk_ttyio_release
    cb53a3366eb2 tty: serial: qcom-geni-serial: fix slab-out-of-bounds on RX FIFO buffer
    f322dd2e4a1c staging: mt7621-dts: change some node hex addresses to lower case
    6508788b2c3b bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
    7b122c33bd31 riscv: dts: sifive: fu740: fix size of pcie 32bit memory
    701f9c3da692 thunderbolt: Use correct function to calculate maximum USB3 link rate
    5b1b03a3d3e4 cifs: do not include page data when checking signature
    64287cd456a2 btrfs: fix race between quota rescan and disable leading to NULL pointer deref
    f2e0e1615d65 btrfs: do not abort transaction on failure to write log tree when syncing log
    f653abe6195c mmc: sdhci-esdhc-imx: correct the tuning start tap and step setting
    9881436f01ce mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
    33bd0db750fc ACPI: PRM: Check whether EFI runtime is available
    87e1ee6058e5 comedi: adv_pci1760: Fix PWM instruction handling
    b5d24a8e4a61 usb: core: hub: disable autosuspend for TI TUSB8041
    61a0890cb95a misc: fastrpc: Fix use-after-free race condition for maps
    1b7b7bb400dd misc: fastrpc: Don't remove map on creater_process and device_release
    e7e41fcf909f USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100
    f3de34d90d90 staging: vchiq_arm: fix enum vchiq_status return types
    16d09c4bc99b USB: serial: option: add Quectel EM05CN modem
    34d769f0c607 USB: serial: option: add Quectel EM05CN (SG) modem
    768d56ed2411 USB: serial: option: add Quectel EC200U modem
    829916f069a7 USB: serial: option: add Quectel EM05-G (RS) modem
    eb8808f769c6 USB: serial: option: add Quectel EM05-G (CS) modem
    6e0430db195e USB: serial: option: add Quectel EM05-G (GR) modem
    f01aefe374d3 prlimit: do_prlimit needs to have a speculation check
    418e2c756d65 xhci: Detect lpm incapable xHC USB3 roothub ports from ACPI tables
    10cb7d53be5f usb: acpi: add helper to check port lpm capability using acpi _DSM
    1818e2a97dab xhci: Add a flag to disable USB3 lpm on a xhci root port level.
    8911ff796336 xhci: Add update_hub_device override for PCI xHCI hosts
    c462ac871f49 xhci: Fix null pointer dereference when host dies
    f39c813af0b6 usb: xhci: Check endpoint is valid before dereferencing it
    0f175cebc46c xhci-pci: set the dma max_seg_size
    89a410dbd0f1 io_uring/rw: defer fsnotify calls to task context
    05d69b372b3b io_uring: do not recalculate ppos unnecessarily
    ff8a070253d9 io_uring: update kiocb->ki_pos at execution time
    b7958caf415b io_uring: remove duplicated calls to io_kiocb_ppos
    86e2d6901a37 io_uring: ensure that cached task references are always put on exit
    30b90689344b io_uring: fix async accept on O_NONBLOCK sockets
    a79b13f24967 io_uring: allow re-poll if we made progress
    3c1a3d02690f io_uring: support MSG_WAITALL for IORING_OP_SEND(MSG)
    390b8816317f io_uring: add flag for disabling provided buffer recycling
    9b7b0f2116d5 io_uring: ensure recv and recvmsg handle MSG_WAITALL correctly
    cdc68e714d0b io_uring: improve send/recv error handling
    ccf06b5a981c io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups
    77baf39227c0 eventfd: provide a eventfd_signal_mask() helper
    a2d8ff00a7b0 eventpoll: add EPOLL_URING_WAKE poll wakeup flag
    a9aa4aa7a5b2 io_uring: don't gate task_work run on TIF_NOTIFY_SIGNAL
    bd9a23a4bb8a hugetlb: unshare some PMDs when splitting VMAs
    393d9e3ed10c drm/amd: Delay removal of the firmware framebuffer
    865e244e06c7 drm/amdgpu: disable runtime pm on several sienna cichlid cards(v2)
    560373fb1e9a ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP platform
    26264260a80b ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
    1026756321bd efi: fix userspace infinite retry read efivars after EFI runtime services page fault
    45627a1a6450 nilfs2: fix general protection fault in nilfs_btree_insert()
    350d66d9e730 zonefs: Detect append writes at invalid locations
    5054d001ffaf Add exception protection processing for vd in axi_chan_handle_err function
    a12fd43bd175 wifi: mac80211: sdata can be NULL during AMPDU start
    f96a6c009ed9 wifi: brcmfmac: fix regression for Broadcom PCIe wifi devices
    908d1742b6e6 Bluetooth: hci_qca: Fix driver shutdown on closed serdev
    7530fbc05ff5 fbdev: omapfb: avoid stack overflow warning
    e1df7f0b27c2 perf/x86/rapl: Treat Tigerlake like Icelake
    2c129e868992 f2fs: let's avoid panic if extent_tree is not created
    58bac7440251 x86/asm: Fix an assembler warning with current binutils
    fdb4a70bb768 btrfs: always report error in run_one_delayed_ref()
    f641067ea2af RDMA/srp: Move large values to a new enum for gcc13
    793f8ac21874 r8169: move rtl_wol_enable_rx() and rtl_prepare_power_down()
    dc072762f900 net/ethtool/ioctl: return -EOPNOTSUPP if we have no phy stats
    308d24d87599 vduse: Validate vq_num in vduse_validate_config()
    8e1eb926a093 virtio_pci: modify ENOENT to EINVAL
    64a6f3689d0d tools/virtio: initialize spinlocks in vring_test.c
    95fc28a8e921 selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID
    d4a9d2944f2e pNFS/filelayout: Fix coalescing test for single DS
    6a3319af6b36 btrfs: fix trace event name typo for FLUSH_DELAYED_REFS

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60c0f2100303bce62711c05efe9c8b775a804045)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fe945f970b..8d299ca059 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "24b6f990294dadd1dad56030bb4f044f1cc550bc"
-SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
+SRCREV_machine ?= "0567deb52d2f2c3cd3046f56ca3fb97a151cf6ec"
+SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.89"
+LINUX_VERSION ?= "5.15.91"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index e3c5a3db22..400ef75cc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.89"
+LINUX_VERSION ?= "5.15.91"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a615c596debf26252bbba9d03ac9eb30ed4d2819"
-SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
+SRCREV_machine ?= "01c387906b52214892aaea0664b3b4ead35fe484"
+SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1154b0aa57..60c088b9fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d624f7bdbfcfc826f4482e860698d4b7eb9bdbbe"
-SRCREV_machine:qemuarm64 ?= "2c4a0624a2de2f262d8c86729e5fa15fc1e57fcc"
-SRCREV_machine:qemumips ?= "99b36760d2ae2c97b9a300f2a9baf70f4d6aee8d"
-SRCREV_machine:qemuppc ?= "7e2d97348966a55d5c4fcfd5bff9b2959becf2c8"
-SRCREV_machine:qemuriscv64 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
-SRCREV_machine:qemuriscv32 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
-SRCREV_machine:qemux86 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
-SRCREV_machine:qemux86-64 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
-SRCREV_machine:qemumips64 ?= "574cd19f6aa1dc13e1b32d6197516f9859666d99"
-SRCREV_machine ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
-SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
+SRCREV_machine:qemuarm ?= "9c525056e4d5c3852fff6058bd7f6a648a3b645e"
+SRCREV_machine:qemuarm64 ?= "30e3bff02675a3d10bd04c51f52f4a6b17b94d01"
+SRCREV_machine:qemumips ?= "0dda96ab67034ee0f1db18c04fed33d2a4e2fec1"
+SRCREV_machine:qemuppc ?= "43c8d401cf8092c19e47935c5667dacf754885d4"
+SRCREV_machine:qemuriscv64 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
+SRCREV_machine:qemuriscv32 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
+SRCREV_machine:qemux86 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
+SRCREV_machine:qemux86-64 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
+SRCREV_machine:qemumips64 ?= "26e3543c62c04852896adc70584b1eaa59f15fad"
+SRCREV_machine ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
+SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3bcc86eb3ed952c22ceecce8932dde72ea01f8cc"
+SRCREV_machine:class-devupstream ?= "9cf4111cdf9420fa99792ae16c8de23242bb2e0b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.89"
+LINUX_VERSION ?= "5.15.91"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


