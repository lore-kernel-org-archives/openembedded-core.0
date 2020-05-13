Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.7135.1589379881204708977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OHlOkAK1;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n14so17472383qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zm2AcW5jQS7CG/J66vL3Q5P9SrbRPAkCg4Q30+OqSU8=;
        b=OHlOkAK1QeRegNQB/KBaMCd+F7AoEGe0C5mfUIuFYtfeCjzNY5B1f2Eq48G6nbIa/d
         enk9MbyuQkPzV52hW07zamuzkDh9yx3ziffFR3OAxY6m22essfkj+ZxxSRYagmp+I5bn
         PBzdHTIlCJv5LIGb6fONyfDr7TD0PB/yci5Rejwtn/c2M2YYsyGRA9k4Hrcr4X2oqpb6
         8wSqkYfAxOXmi79G1BPuJNVmdA2s27vVJS1MEcnmMzR4WKrFu70zq6/rjO+jHfDO8jD2
         R5AnDOc8F1m9/0fyjjWH9xFJv6SR5yhB5XsbRuvLhvAp8D5QX41OcLyz+IadFoNKlowe
         BB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zm2AcW5jQS7CG/J66vL3Q5P9SrbRPAkCg4Q30+OqSU8=;
        b=txwIuODxI5PntDaNr2BwiNQ/0ClZZBF/O0NtJE5hY2Lv2kY3pq/k21z+UQ8xnbHs9t
         1Md16jTOtAJGrv072xNDcmBmA75j4BtO257vb158uHMj7MgGjGFu2zuwYL7RzDtcWg+X
         R8Udakk4+iCuwV2W1GK4w18EJvvl4R2KgWNNZOV8nUPvqvm4xDhfCx1aPRxL7L5Dpfdm
         Z0yS1f62rHEn3MFpd1qiMIvKNmWtGFyDAid0mZgXsj0PW4iJRgj70h94ymOx+1xvVj9T
         X9lTRJa6ADJp8YIZEpq3v28SophwAJxTcwwqQi2b6/8BrlKzHgsXxH20h9HlfVI0PBR+
         wutA==
X-Gm-Message-State: AGi0PubcrI1R1DwDvvlli8oeFaGLYcrqhe5wcQixzArGZIgFgZRLGqNQ
	3h9RHAGxzkd/i2NLwZrfGJP9qozEOxA=
X-Google-Smtp-Source: APiQypLdyJ6l48p5djbal1/oW5G8Ckj1Z0donR6+T+zRXGUr+t1yyqp/Ma74Dy/a6FaNWr/uxWcXag==
X-Received: by 2002:a05:620a:1594:: with SMTP id d20mr26046772qkk.217.1589379879830;
        Wed, 13 May 2020 07:24:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 5sm10138445qkl.101.2020.05.13.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:24:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 1/4] linux-yocto/5.4: update to v5.4.38
Date: Wed, 13 May 2020 10:24:33 -0400
Message-Id: <8293c6519478f1f3ab33285a9fbadc40d77f94ca.1589378829.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1589378829.git.bruce.ashfield@gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    9895e0ac338a Linux 5.4.38
    5a54c69c4ef8 Revert "ASoC: meson: axg-card: fix codec-to-codec link setup"
    527c60e8b7a8 Linux 5.4.37
    4e7fb753e803 ASoC: stm32: spdifrx: fix regmap status check
    4104faaeeda0 ASoC: soc-core: disable route checks for legacy devices
    8c472abaedc7 ext4: check for non-zero journal inum in ext4_calculate_overhead
    93af898b251f qed: Fix use after free in qed_chain_free
    f1610480602a net: use indirect call wrappers for skb_copy_datagram_iter()
    ec9cf8afcd64 Crypto: chelsio - Fixes a hang issue during driver registration
    b0946b45b85a qed: Fix race condition between scheduling and destroying the slowpath workqueue
    d15fc1470441 taprio: do not use BIT() in TCA_TAPRIO_ATTR_FLAG_* definitions
    f37079e9ea83 hwmon: (jc42) Fix name to have no illegal characters
    c7b6c51298bd blk-mq: Put driver tag in blk_mq_dispatch_rq_list() when no budget
    3e9299c28fc5 ext4: convert BUG_ON's to WARN_ON's in mballoc.c
    1e4281eba3ff ext4: increase wait time needed before reuse of deleted inode numbers
    0fe3908e6abc ext4: use matching invalidatepage in ext4_writepage
    1876e0e654b8 arm64: Delete the space separator in __emit_inst
    a719f7bf5c88 mac80211: fix channel switch trigger from unknown mesh peer
    9178430df3f7 net: stmmac: socfpga: Allow all RGMII modes
    daafdf87b898 ALSA: hda: call runtime_allow() for all hda controllers
    d9d4ea17d6d6 xen/xenbus: ensure xenbus_map_ring_valloc() returns proper grant status
    8c627d4b15de objtool: Support Clang non-section symbols in ORC dump
    820126d9a83d objtool: Fix CONFIG_UBSAN_TRAP unreachable warnings
    1cc2460dad82 scsi: target: tcmu: reset_ring should reset TCMU_DEV_BIT_BROKEN
    62d350eb31d1 scsi: target: fix PR IN / READ FULL STATUS for FC
    a323f69d00c6 ALSA: hda: Explicitly permit using autosuspend if runtime PM is supported
    bd074af53cb6 ALSA: hda: Keep the controller initialization even if no codecs found
    135e10232fb5 ALSA: hda: Release resources at error in delayed probe
    535ed3f01564 xfs: fix partially uninitialized structure in xfs_reflink_remap_extent
    ec6e5792d62d afs: Fix length of dump of bad YFSFetchStatus record
    16976275b929 signal: check sig before setting info in kill_pid_usb_asyncio
    f88761412b90 x86: hyperv: report value of misc_features
    b5da1152f716 net: fec: set GPR bit on suspend by DT configuration.
    316ad98983d9 libbpf: Initialize *nl_pid so gcc 10 is happy
    3c9bbe7f44f6 bpf, x86: Fix encoding for lower 8-bit registers in BPF_STX BPF_B
    ab6e8af64f39 xfs: clear PF_MEMALLOC before exiting xfsaild thread
    e5329fcdc907 mm: shmem: disable interrupt when acquiring info->lock in userfaultfd_copy path
    309a509dabd5 bpf, x86_32: Fix logic error in BPF_LDX zero-extension
    d0b8695703f2 bpf, x86_32: Fix clobbering of dst for BPF_JSET
    50c5d9146100 bpf, x86_32: Fix incorrect encoding in BPF_LDX zero-extension
    ca3a2ca4cfa2 um: ensure `make ARCH=um mrproper` removes arch/$(SUBARCH)/include/generated/
    9c5c94c5012c blk-iocost: Fix error on iocost_ioc_vrate_adj
    b9c31556c37b PM: sleep: core: Switch back to async_schedule_dev()
    36c436a8e46a netfilter: nat: fix error handling upon registering inet hook
    9578a8c157b4 perf/core: fix parent pid/tid in task exit events
    c04d01e918d8 sched/core: Fix reset-on-fork from RT with uclamp
    040287785f42 net/mlx5: Fix failing fw tracer allocation on s390
    a8b5611ffee3 s390/pci: do not set affinity for floating irqs
    6cfb8c2ada58 cpumap: Avoid warning when CONFIG_DEBUG_PER_CPU_MAPS is enabled
    05ae98547af9 ARM: dts: bcm283x: Disable dsi0 node
    764a7d0a2756 PCI: Move Apex Edge TPU class quirk to fix BAR assignment
    684dba87fdd7 PCI: Add ACS quirk for Zhaoxin Root/Downstream Ports
    17d166e9535c PCI: Add Zhaoxin Vendor ID
    d2481b5d1257 PCI: Unify ACS quirk desired vs provided checking
    981fd6ad2a5a PCI: Make ACS quirk implementations more uniform
    85a9e198f124 PCI: Add ACS quirk for Zhaoxin multi-function devices
    d2b631a136e8 PCI: Avoid ASMedia XHCI USB PME# from D0 defect
    246ff2a6f69e net/mlx5e: Get the latest values from counters in switchdev mode
    2292e4049097 net/mlx5e: Don't trigger IRQ multiple times on XSK wakeup to avoid WQ overruns
    b4284efb1e14 svcrdma: Fix leak of svc_rdma_recv_ctxt objects
    53dbb934dd4f svcrdma: Fix trace point use-after-free race
    ccd3b4bb9944 xfs: acquire superblock freeze protection on eofblocks scans
    62f1cb491552 net/cxgb4: Check the return from t4_query_params properly
    ce3460b90ed9 rxrpc: Fix DATA Tx to disable nofrag for UDP on AF_INET6 socket
    6cdded333de6 i2c: altera: use proper variable to hold errno
    db2426f86d44 bpf: Forbid XADD on spilled pointers for unprivileged users
    f1317a4a2b9b nfsd: memory corruption in nfsd4_lock()
    13b28f6b6778 drivers: soc: xilinx: fix firmware driver Kconfig dependency
    1157d97cfa2b ASoC: wm8960: Fix wrong clock after suspend & resume
    005aa9f0af9d ASoC: meson: axg-card: fix codec-to-codec link setup
    08865eb796c4 ASoC: tas571x: disable regulators on failed probe
    e9058b45556b ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs
    37405f2963c7 s390/ftrace: fix potential crashes when switching tracers
    1f107e441bde counter: 104-quad-8: Add lock guards - generic interface
    db66fd5fef68 propagate_one(): mnt_set_mountpoint() needs mount_lock
    f9e41e4bbe61 iio:ad7797: Use correct attribute_group
    f581eff93958 afs: Fix to actually set AFS_SERVER_FL_HAVE_EPOCH
    c2bdc86ec8ac afs: Make record checking use TASK_UNINTERRUPTIBLE when appropriate
    9dcb1844f884 usb: gadget: udc: atmel: Fix vbus disconnect handling
    7155416143dd usb: gadget: udc: bdc: Remove unnecessary NULL checks in bdc_req_complete
    8f4cd6f0ea82 kbuild: fix DT binding schema rule again to avoid needless rebuilds
    7067a62563d2 usb: dwc3: gadget: Do link recovery for SS and SSP
    a74a5435a610 ASoC: stm32: sai: fix sai probe
    4a5c9ae67b12 printk: queue wake_up_klogd irq_work only if per-CPU areas are ready
    276224b7a147 ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
    4d23f544a328 remoteproc: Fix wrong rvring index computation
    aa73bcc37686 Linux 5.4.36
    44d9eb0ebe8f s390/mm: fix page table upgrade vs 2ndary address mode accesses
    58b243cf2786 compat: ARM64: always include asm-generic/compat.h
    3160e84abaf7 powerpc/mm: Fix CONFIG_PPC_KUAP_DEBUG on PPC32
    b48331b52a28 powerpc/kuap: PPC_KUAP_DEBUG should depend on PPC_KUAP
    c4606876164c Revert "serial: uartps: Register own uart console and driver structures"
    02d32033b397 Revert "serial: uartps: Move Port ID to device data structure"
    bbc0423c8968 Revert "serial: uartps: Change uart ID port allocation"
    f7504efa6bf7 Revert "serial: uartps: Do not allow use aliases >= MAX_UART_INSTANCES"
    3e64d4db7b10 Revert "serial: uartps: Fix error path when alloc failed"
    6fcbf58b115c Revert "serial: uartps: Use the same dynamic major number for all ports"
    1bb43b4d8c32 Revert "serial: uartps: Fix uartps_major handling"
    3af0614df15c serial: sh-sci: Make sure status register SCxSR is read in correct sequence
    fceab238c534 xhci: Don't clear hub TT buffer on ep0 protocol stall
    54470b0bd16a xhci: prevent bus suspend if a roothub port detected a over-current condition
    f385e765ac93 xhci: Fix handling halted endpoint even if endpoint ring appears empty
    8dbfb11452c0 usb: typec: altmode: Fix typec_altmode_get_partner sometimes returning an invalid pointer
    740c93814783 usb: typec: tcpm: Ignore CC and vbus changes in PORT_RESET change
    11c2089767cd usb: f_fs: Clear OS Extended descriptor counts to zero in ffs_data_reset()
    bf996950d8de usb: dwc3: gadget: Fix request completion check
    a0f1f53ecd8d fpga: dfl: pci: fix return value of cci_pci_sriov_configure
    22432bcf066c UAS: fix deadlock in error handling and PM flushing work
    e1b656677f7d UAS: no use logging any details in case of ENODEV
    f4d1cf2ef83c cdc-acm: introduce a cool down
    892de572ea71 cdc-acm: close race betrween suspend() and acm_softint
    23d44059bc44 staging: vt6656: Power save stop wake_up_count wrap around.
    9f1a23cbef73 staging: vt6656: Fix pairwise key entry save.
    0bcc6585717e staging: vt6656: Fix drivers TBTT timing counter.
    74bbe9d99040 staging: vt6656: Fix calling conditions of vnt_set_bss_mode
    ec5ad5e1958c staging: vt6656: Don't set RCR_MULTICAST or RCR_BROADCAST by default.
    64882aa0c531 vt: don't use kmalloc() for the unicode screen buffer
    b027b30d1428 vt: don't hardcode the mem allocation upper bound
    8f8d7f07d951 staging: comedi: Fix comedi_device refcnt leak in comedi_open
    279dd75cec55 staging: comedi: dt2815: fix writing hi byte of analog output
    dba6465408b8 powerpc/setup_64: Set cache-line-size based on cache-block-size
    921b7b175605 ARM: imx: provide v7_cpu_resume() only on ARM_CPU_SUSPEND=y
    eabc107d20da cifs: fix uninitialised lease_key in open_shroot()
    562489ba1078 iwlwifi: mvm: fix inactive TID removal return value usage
    f1926b14bd8f iwlwifi: mvm: Do not declare support for ACK Enabled Aggregation
    c93fb506bfaf iwlwifi: mvm: limit maximum queue appropriately
    4025ac3d7fb7 iwlwifi: mvm: beacon statistics shouldn't go backwards
    222722be70de iwlwifi: pcie: actually release queue memory in TVQM
    7e69c9e6bbf3 SUNRPC: Fix backchannel RPC soft lockups
    d62d85260ac4 mac80211: populate debugfs only after cfg80211 init
    f67f3317ceb3 ASoC: dapm: fixup dapm kcontrol widget
    83f82fd5552c audit: check the length of userspace generated audit records
    20821047aca4 signal: Avoid corrupting si_pid and si_uid in do_notify_parent
    1b4e23a945bd usb-storage: Add unusual_devs entry for JMicron JMS566
    9de9003b255e tty: rocket, avoid OOB access
    f1c0d3243dbe tty: hvc: fix buffer overflow during hvc_alloc().
    52ca311e5f82 KVM: VMX: Enable machine check support for 32bit targets
    878127ac8b70 KVM: Check validity of resolved slot when searching memslots
    347125705f02 KVM: s390: Return last valid slot if approx index is out-of-bounds
    3fc644fd6100 tpm: ibmvtpm: retry on H_CLOSED in tpm_ibmvtpm_send()
    16244edc3bbe tpm: fix wrong return value in tpm_pcr_extend
    86f1c523d422 tpm/tpm_tis: Free IRQ if probing fails
    387039b25077 ALSA: usb-audio: Filter out unsupported sample rates on Focusrite devices
    d5cd82153629 ALSA: usb-audio: Fix usb audio refcnt leak when getting spdif
    dbb11f1d6d33 ALSA: hda/hdmi: Add module option to disable audio component binding
    1e1f9d36280f ALSA: hda/realtek - Add new codec supported for ALC245
    0939d06af06f ALSA: hda/realtek - Fix unexpected init_amp override
    16e373fe61cb ALSA: usx2y: Fix potential NULL dereference
    000515184f6f tools/vm: fix cross-compile build
    5126bdeaf980 mm/ksm: fix NULL pointer dereference when KSM zero page is enabled
    3c88e95cd167 mm/hugetlb: fix a addressing exception caused by huge_pte_offset
    a77daafc2e37 coredump: fix null pointer dereference on coredump
    fcfd63da5d82 staging: gasket: Fix incongruency in handling of sysfs entries creation
    f4f235309b5c vmalloc: fix remap_vmalloc_range() bounds checks
    3d15344e23c5 tty: serial: owl: add "much needed" clk_prepare_enable()
    4fbf19bbba6a USB: hub: Revert commit bd0e6c9614b9 ("usb: hub: try old enumeration scheme first for high speed devices")
    50ad463e20bf USB: hub: Fix handling of connect changes during sleep
    b48193a7c303 USB: core: Fix free-while-in-use bug in the USB S-Glibrary
    1d53402d89d7 USB: early: Handle AMD's spec-compliant identifiers, too
    8409f83e3e81 USB: Add USB_QUIRK_DELAY_CTRL_MSG and USB_QUIRK_DELAY_INIT for Corsair K70 RGB RAPIDFIRE
    b7758cd38b94 USB: sisusbvga: Change port variable from signed to unsigned
    557f3f549217 iio: xilinx-xadc: Make sure not exceed maximum samplerate
    b3e365a07016 iio: xilinx-xadc: Fix sequencer configuration for aux channels in simultaneous mode
    cf2849c9ef46 iio: xilinx-xadc: Fix clearing interrupt when enabling trigger
    6a956eb2e1a7 iio: xilinx-xadc: Fix ADC-B powerdown
    f83a969fcb0b iio: adc: ti-ads8344: properly byte swap value
    db168069b0d6 iio: adc: stm32-adc: fix sleep in atomic context
    02311bc13344 iio: st_sensors: rely on odr mask to know if odr can be set
    14952589c9d8 iio: core: remove extra semi-colon from devm_iio_device_register() macro
    12c02c473e86 ALSA: usb-audio: Add connector notifier delegation
    6ec99b94a3a0 ALSA: usb-audio: Add static mapping table for ALC1220-VB-based mobos
    23abb5f2faea ALSA: hda: Remove ASUS ROG Zenith from the blacklist
    419d8fb1630c KEYS: Avoid false positive ENOMEM error on key read
    b1bcb485dd6b vrf: Check skb for XFRM_TRANSFORMED flag
    dfbbb4557af4 xfrm: Always set XFRM_TRANSFORMED in xfrm{4,6}_output_finish
    ace87b487a5f geneve: use the correct nlattr array in NL_SET_ERR_MSG_ATTR
    b977fe1c9e80 vxlan: use the correct nlattr array in NL_SET_ERR_MSG_ATTR
    51c935f6c6ef net: dsa: b53: b53_arl_rw_op() needs to select IVL or SVL
    cb1a18a7d328 net: dsa: b53: Rework ARL bin logic
    2cc27f102dcd net: dsa: b53: Fix ARL register definitions
    1fae6eb0fc91 net: dsa: b53: Fix valid setting for MDB entries
    2537dc9e2c03 net: dsa: b53: Lookup VID in ARL searches when VLAN is enabled
    07856b2108cf vrf: Fix IPv6 with qdisc and xfrm
    755425c1b004 team: fix hang in team_mode_get()
    3f642d785a51 tcp: cache line align MAX_TCP_HEADER
    8a60fad4495d selftests: Fix suppress test in fib_tests.sh
    a3afaa5033f4 sched: etf: do not assume all sockets are full blown
    5a2ddf8e5a5d net/x25: Fix x25_neigh refcnt leak when receiving frame
    6885d58eb439 net: stmmac: dwmac-meson8b: Add missing boundary to RGMII TX clock array
    4acc0b18f7af net: openvswitch: ovs_ct_exit to be done under ovs_lock
    21b1a767eba6 net: netrom: Fix potential nr_neigh refcnt leak in nr_add_node
    befd63a980cc net/mlx4_en: avoid indirect call in TX completion
    49bbf322316c net: bcmgenet: correct per TX/RX ring statistics
    aa6a14bc4102 mlxsw: Fix some IS_ERR() vs NULL bugs
    d5ba4c22928f macvlan: fix null dereference in macvlan_device_event()
    70a37b9816f3 macsec: avoid to set wrong mtu
    2d197d8e1aa4 ipv6: fix restrict IPV6_ADDRFORM operation
    382f57b996aa ipv4: Update fib_select_default to handle nexthop objects
    3b759befd7f2 cxgb4: fix large delays in PTP synchronization
    d02f4242650d cxgb4: fix adapter crash due to wrong MC size
    91097eba10d3 PCI/PM: Add missing link delays required by the PCIe spec
    7720fd9c679e PCI/ASPM: Allow re-enabling Clock PM
    3340d011cff4 scsi: smartpqi: fix problem with unique ID for physical device
    d867f2757173 scsi: smartpqi: fix call trace in device discovery
    8a20fb1c9a49 scsi: smartpqi: fix controller lockup observed during force reboot
    3edd55247295 virtio-blk: improve virtqueue error to BLK_STS
    2390698b9dbd tracing/selftests: Turn off timeout setting
    ca958fe8af20 ASoC: SOF: trace: fix unconditional free in trace release
    01fad934f1bd PCI: pciehp: Prevent deadlock on disconnect
    39b9a0b3d24d libbpf: Fix readelf output parsing on powerpc with recent binutils
    b91ae5994725 PCI/PM: Add pcie_wait_for_link_delay()
    df38cda0144a drm/amd/display: Not doing optimize bandwidth if flip pending.
    2be21320076d xhci: Finetune host initiated USB3 rootport link suspend and resume
    ea6f7011c42d xhci: Wait until link state trainsits to U0 after setting USB_SS_PORT_LS_U0
    e650a264df6f xhci: Ensure link state is U3 after setting USB_SS_PORT_LS_U3
    bdb61374da1b ALSA: usb-audio: Add Pioneer DJ DJM-250MK2 quirk
    578aa47612f2 ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN MPWIN895CL tablet
    632d9736d215 drm/amd/display: Calculate scaling ratios on every medium/full update
    16c370534d6c perf/core: Disable page faults when getting phys address
    41a3e446bc56 pwm: bcm2835: Dynamically allocate base
    53cdc935c912 pwm: renesas-tpu: Fix late Runtime PM enablement
    1bfb6423c6fc nvme: fix compat address handling in several ioctls
    de1263d4306e powerpc/pseries: Fix MCE handling on pseries
    107290a8f06b Revert "powerpc/64: irq_work avoid interrupt when called with hardware irqs enabled"
    1712911bfb34 loop: Better discard support for block devices
    ed61eec49a70 s390/cio: avoid duplicated 'ADD' uevents
    ad1187668ffe s390/cio: generate delayed uevent for vfio-ccw subchannels
    8652254e96a6 lib/raid6/test: fix build on distros whose /bin/sh is not bash
    e84ef75fa184 kconfig: qconf: Fix a few alignment issues
    cb5d9604038c ipc/util.c: sysvipc_find_ipc() should increase position index
    70638a74c52a selftests: kmod: fix handling test numbers above 9
    16846f6fcbcf kernel/gcov/fs.c: gcov_seq_next() should increase position index
    1edfff795d4f dma-direct: fix data truncation in dma_direct_get_required_mask()
    8300465623bf drm/amd/display: Update stream adjust in dc_stream_adjust_vmin_vmax
    da2c733a7180 nvme: fix deadlock caused by ANA update wrong locking
    90a33c23aad8 ASoC: Intel: atom: Take the drv->lock mutex before calling sst_send_slot_map()
    1310d9655be0 tools/test/nvdimm: Fix out of tree build
    713ad9b9d37a scsi: iscsi: Report unbind session event when the target has been removed
    f507ae6e33cb nvme-tcp: fix possible crash in write_zeroes processing
    a5f036adae09 pwm: rcar: Fix late Runtime PM enablement
    b71ac8086a7b ceph: don't skip updating wanted caps when cap is stale
    acbfccc6a3e3 ceph: return ceph_mdsc_do_request() errors from __get_parent()
    fb669262fdef scsi: libfc: If PRLI rejected, move rport to PLOGI state
    8427b05a7a1f scsi: lpfc: Fix crash in target side cable pulls hitting WAIT_FOR_UNREG
    0c5733a96261 scsi: lpfc: Fix crash after handling a pci error
    9d1062c4dd14 scsi: lpfc: Fix kasan slab-out-of-bounds error in lpfc_unreg_login
    66491dadd125 watchdog: reset last_hw_keepalive time at start
    7b709f1ba800 tools/testing/nvdimm: Fix compilation failure without CONFIG_DEV_DAX_PMEM_COMPAT
    810045068bda arm64: Silence clang warning on mismatched value/register sizes
    aa50d567ec4a arm64: compat: Workaround Neoverse-N1 #1542419 for compat user-space
    6de0c621191a arm64: Fake the IminLine size on systems affected by Neoverse-N1 #1542419
    f2791551cedb arm64: errata: Hide CTR_EL0.DIC on systems affected by Neoverse-N1 #1542419
    4b823bf7c2ca net, ip_tunnel: fix interface lookup with no key
    5811f24abd27 f2fs: fix to avoid memory leakage in f2fs_listxattr
    79ad14904152 ext4: fix extent_status fragmentation for plain files
    0c418786cb3a Linux 5.4.35
    a801a05ca714 bpf, test_verifier: switch bpf_get_stack's 0 s> r8 test
    8781011a302b bpf: Test_progs, add test to catch retval refine error handling
    37e1cdff90c1 bpf: Test_verifier, bpf_get_stack return value add <0
    3bd5bcafbbf3 bpf: fix buggy r0 retval refinement for tracing helpers
    f1afcf9488fc KEYS: Don't write out to userspace while holding key semaphore
    5d53bfdce008 mtd: phram: fix a double free issue in error path
    4191ebe1fc71 mtd: lpddr: Fix a double free in probe()
    7d4adb1d3c69 docs: Fix path to MTD command line partition parser
    318d5088fdfe mtd: spinand: Explicitly use MTD_OPS_RAW to write the bad block marker to OOB
    700bccb8e9a2 mtd: rawnand: free the nand_device object
    0c72ec11d8bd locktorture: Print ratio of acquisitions, not failures
    01c9e2a9fc5c tty: evh_bytechan: Fix out of bounds accesses
    f656649089a3 fbmem: Adjust indentation in fb_prepare_logo and fb_blank
    47e4d791d514 iio: si1133: read 24-bit signed integer for measurement
    a2a385aae551 ARM: dts: sunxi: Fix DE2 clocks register range
    7e141c307834 fbdev: potential information leak in do_fb_ioctl()
    f0938746879a dma-debug: fix displaying of dma allocation type
    bc69709c54df net: dsa: bcm_sf2: Fix overflow checks
    762d35aa906f drm/nouveau/gr/gp107,gp108: implement workaround for HW hanging during init
    a156e67acf6c f2fs: fix to wait all node page writeback
    f08e4e70b0ac iommu/amd: Fix the configuration of GCR3 table root pointer
    436af737c3c2 libnvdimm: Out of bounds read in __nd_ioctl()
    dcb122749f58 power: supply: axp288_fuel_gauge: Broaden vendor check for Intel Compute Sticks.
    760eecac993b csky: Fixup init_fpu compile warning with __init
    1500c7003146 sunrpc: Fix gss_unwrap_resp_integ() again
    ddb8812a21e1 ext2: fix debug reference to ext2_xattr_cache
    24191c8c9bd2 iommu/vt-d: Fix page request descriptor size
    a5a1d567a069 iommu/vt-d: Silence RCU-list debugging warning in dmar_find_atsr()
    21439dff919e ext2: fix empty body warnings when -Wextra is used
    d00041a48c3e SUNRPC: fix krb5p mount to provide large enough buffer in rq_rcvsize
    900cd0f6c688 iommu/vt-d: Fix mm reference leak
    9c01a49a7117 iommu/virtio: Fix freeing of incomplete domains
    475bec7063bc drm/vc4: Fix HDMI mode validation
    b58244c482ce um: falloc.h needs to be directly included for older libc
    6c3339269a8a ACPICA: Fixes for acpiExec namespace init file
    9f8b1216dac9 f2fs: fix NULL pointer dereference in f2fs_write_begin()
    57615a8561f0 csky: Fixup get wrong psr value from phyical reg
    c848e00e3b95 NFS: Fix memory leaks in nfs_pageio_stop_mirroring()
    2e03d3c569b6 drm/amdkfd: kfree the wrong pointer
    e907a0d09b34 csky: Fixup cpu speculative execution to IO area
    88591187bebc x86: ACPI: fix CPU hotplug deadlock
    a9282e58238d leds: core: Fix warning message when init_data
    ddf39dc2f7a3 drm/nouveau: workaround runpm fail by disabling PCI power management on certain intel bridges
    f24d8de03b72 KVM: s390: vsie: Fix possible race when shadowing region 3 tables
    3910babeac1a compiler.h: fix error in BUILD_BUG_ON() reporting
    b525f94f16e5 percpu_counter: fix a data race at vm_committed_as
    ffac60b8bc5f include/linux/swapops.h: correct guards for non_swap_entry()
    2a40eaab1fc4 drm/nouveau/svm: fix vma range check for migration
    f3955f1e58be drm/nouveau/svm: check for SVM initialized before migrating
    a825ce86ebed mm/hugetlb: fix build failure with HUGETLB_PAGE but not HUGEBTLBFS
    23e2519760f8 cifs: Allocate encryption header through kmalloc
    6ba010ea4856 um: ubd: Prevent buffer overrun on command completion
    b9f88c31b266 ext4: do not commit super on read-only bdev
    4078dceb1228 s390/cpum_sf: Fix wrong page count in error message
    fd80f4a6805c powerpc/maple: Fix declaration made after definition
    bee9bc3e0248 powerpc/prom_init: Pass the "os-term" message to hypervisor
    765052217847 btrfs: add RCU locks around block group initialization
    285f25c97f24 hibernate: Allow uswsusp to write to swap
    4753b111f003 s390/cpuinfo: fix wrong output when CPU0 is offline
    380d12904603 f2fs: Add a new CP flag to help fsck fix resize SPO issues
    066f1e4174f2 f2fs: Fix mount failure due to SPO after a successful online resize FS
    ea468f37370a NFS: direct.c: Fix memory leak of dreq when nfs_get_lock_context fails
    81b41f5ecc96 phy: uniphier-usb3ss: Add Pro5 support
    3e85d501828c f2fs: fix to show norecovery mount option
    ffbad91b66ce KVM: PPC: Book3S HV: Fix H_CEDE return code for nested guests
    ea410f2a1fc8 ARM: dts: rockchip: fix lvds-encoder ports subnode for rk3188-bqedison2qc
    59bafdc99440 NFSv4.2: error out when relink swapfile
    264e3f1597e8 NFSv4/pnfs: Return valid stateids in nfs_layout_find_inode_by_stateid()
    07cd4e8f745c NFS: alloc_nfs_open_context() must use the file cred when available
    66bfacd0f302 rtc: 88pm860x: fix possible race condition
    56aaa0e8c92a dma-coherent: fix integer overflow in the reserved-memory dma allocation
    960bf4e436ca soc: imx: gpc: fix power up sequencing
    1e7abaf24875 arm64: dts: clearfog-gt-8k: set gigabit PHY reset deassert delay
    d7b59cd020f7 arm64: tegra: Fix Tegra194 PCIe compatible string
    5615f66bfdfc arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
    540f9620f192 clk: tegra: Fix Tegra PMC clock out parents
    b7dee304aa0e power: supply: bq27xxx_battery: Silence deferred-probe error
    6a7721714835 arm64: dts: allwinner: a64: Fix display clock register range
    5d2861f840bb ARM: dts: rockchip: fix vqmmc-supply property name for rk3188-bqedison2qc
    1321fb4320e7 f2fs: fix the panic in do_checkpoint()
    6d4330391c49 net/mlx5e: Enforce setting of a single FEC mode
    0d03cbfdf364 clk: at91: usb: continue if clk_hw_round_rate() return zero
    04e43c7c664a clk: Don't cache errors from clk_ops::get_phase()
    83321ee302e3 drm/ttm: flush the fence on the bo after we individualize the reservation object
    94ebb1eea0e7 x86/Hyper-V: Free hv_panic_page when fail to register kmsg dump
    d662b44161e4 rbd: call rbd_dev_unprobe() after unwatching and flushing notifies
    88a57e387cf0 rbd: avoid a deadlock on header_rwsem when flushing notifies
    a362482b2325 block, bfq: invoke flush_idle_tree after reparent_active_queues in pd_offline
    839b7cd1d8bc block, bfq: make reparent_leaf_entity actually work only on leaf entities
    ad749ca022ad block, bfq: turn put_queue into release_process_ref in __bfq_bic_change_cgroup
    00d392873771 afs: Fix race between post-modification dir edit and readdir/d_revalidate
    42e343cf3285 afs: Fix afs_d_validate() to set the right directory version
    8c3e4ba0fa7a afs: Fix rename operation status delivery
    4eba6ec9644a afs: Fix decoding of inline abort codes from version 1 status records
    0604b60ef9d7 afs: Fix missing XDR advance in xdr_decode_{AFS,YFS}FSFetchStatus()
    4f7b1e892ed0 x86/Hyper-V: Report crash data in die() when panic_on_oops is set
    5097186b279a x86/Hyper-V: Report crash register data when sysctl_record_panic_msg is not set
    31ebf98817c6 x86/Hyper-V: Report crash register data or kmsg before running crash kernel
    1ed38a98478f x86/Hyper-V: Trigger crash enlightenment only once during system crash.
    9f38f7b46de0 x86/Hyper-V: Unload vmbus channel in hv panic callback
    4c2a34f9f448 of: overlay: kmemleak in dup_and_fixup_symbol_prop()
    93ef21bb1a72 of: unittest: kmemleak in of_unittest_overlay_high_level()
    a1371954ee49 of: unittest: kmemleak in of_unittest_platform_populate()
    dd3dd28241e0 of: unittest: kmemleak on changeset destroy
    25c9cdef5748 xsk: Add missing check on user supplied headroom size
    9244c79da15c ALSA: hda: Don't release card at firmware loading error
    182fa4d72a7c irqchip/mbigen: Free msi_desc on device teardown
    daefa51c4353 netfilter: nf_tables: report EOPNOTSUPP on unsupported flags/object type
    aea3873fb02c kbuild, btf: Fix dependencies for DEBUG_INFO_BTF
    e1e5c219f033 ARM: dts: imx6: Use gpc for FEC interrupt controller to fix wake on LAN.
    ed0a5355aa62 ALSA: hda: Honor PM disablement in PM freeze and thaw_noirq ops
    d8b667b45d72 scsi: sg: add sg_remove_request in sg_common_write
    d979eda8a72b objtool: Fix switch table detection in .text.unlikely
    2613535abd3b arm, bpf: Fix offset overflow for BPF_MEM BPF_DW
    d4adee8e8f2f arm, bpf: Fix bugs with ALU64 {RSH, ARSH} BPF_K shift by 0
    e7f6c25bafa6 xsk: Fix out of boundary write in __xsk_rcv_memcpy
    9a9eae78529c watchdog: sp805: fix restart handler
    41d097c83343 ext4: use non-movable memory for superblock readahead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d550bf5371..ddd8587dc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c7609ad17612bd59c1cadb53faf23be8fd7250ef"
-SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
+SRCREV_machine ?= "129f86f995aac168e041feeda764097593cace75"
+SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.34"
+LINUX_VERSION ?= "5.4.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 078a15cec0..c841b1c58e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.34"
+LINUX_VERSION ?= "5.4.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ba0b1e26460cb764005af5758334fc1777760dfd"
-SRCREV_machine ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
+SRCREV_machine_qemuarm ?= "7fe31c186301aef841d44c92a03ba364c13da2f1"
+SRCREV_machine ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e225094698..fd8dab1b54 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "440e41f2f471ba2bb5e3c801ffc140523bdd59b1"
-SRCREV_machine_qemuarm64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_machine_qemumips ?= "941c329c8810e946840bd2f4ab983a94651e563f"
-SRCREV_machine_qemuppc ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_machine_qemuriscv64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_machine_qemux86 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_machine_qemux86-64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_machine_qemumips64 ?= "b73834a11da2d4327cc3cb9f33fa3540f24d56aa"
-SRCREV_machine ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
-SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
+SRCREV_machine_qemuarm ?= "32b7ccec6c9e093f1fb21c2849dc099b735f47b3"
+SRCREV_machine_qemuarm64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_machine_qemumips ?= "2f15acf8311f6c77ffe0ec5ab7dc4580d5aad5cd"
+SRCREV_machine_qemuppc ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_machine_qemuriscv64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_machine_qemux86 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_machine_qemux86-64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_machine_qemumips64 ?= "dbec39f84a447f9d1df6c9ec27e752fd488f7bb4"
+SRCREV_machine ?= "6cb5b11e832995945db63a27e999f99e5952b199"
+SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.34"
+LINUX_VERSION ?= "5.4.38"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

