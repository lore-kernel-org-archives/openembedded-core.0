Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE73C63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:28:33 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.28236.1675268912177379482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpQxUK+i;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id w3so8862632qts.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMoebjQKywHAcxunqGGJFZRMsWk5pQRGw0l4jA3dxw=;
        b=dpQxUK+iLb3SEbm1xVDfWoCnnHm0+9zVuFOvov4KidFGgns+xmHqw9wRAyRvUpWa0a
         YCoCyKGve9lpEdDdU2jfaxeHhdGvwYA2GMQTrTAIpZlN4UQG4Ktznzz8jA3HQ4e7Lo6A
         flhespE64Gz17V2hHX1yM4jE9KwzS2Q/NGwcirVTsUicbXSzZ8tSNpGo2ghrQNp5EM8O
         +xXAXSNnja4K6o6C3pPUJuEUhoX+sGSmUdc+IzafPyT0TbQk0qfwv8AmWlBiE43pc/KE
         9dzclStBveKd0JHENVEISKEO3g1QoWBRN5PjGVA7mzC4cwtOCwRAI4kskwwzOR0rLAK+
         NMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpMoebjQKywHAcxunqGGJFZRMsWk5pQRGw0l4jA3dxw=;
        b=j8uLRsgtK/2rJ3htDbVF9NwWY4odaLqFGhYeB2xbLmVkl8RISLrTv+5NXFJGxBL3sY
         gymQPx/eZjb2k23TyFFo0E77OaJOwwHa8NqDpEUs8m4y1wjvTlP1SaP4nhqSlS1J3Cqc
         2Y5Lt06zKwAvTszbj4VKjCw6WfF/kqJbyVLMwsQR0SEHOs9oHuJakNBcd0tK8x6piwgL
         8Wd8dNvAu33o3M77Gu1Z9BU0SJeBaegkeO8othBVxL7o2o8wyRmisgm7kaU550UWB5EY
         C4OtI43z/EAYSiEuZGaEHtg08zf7khlMnnsprMIq0sWxtycNkYvqpOM7xT9sCJy9+StU
         IrRA==
X-Gm-Message-State: AO0yUKUVxhqXp52Sa4a3pt+dIVCMWnJfNozYJnxHmlKe7OHfFvWLVl+h
	MtC0hjB8mrOCFPZpcNKg/ZEVB2lRPNFAKA==
X-Google-Smtp-Source: AK7set+AJpDZg35TFDxV2r+a2Sl1BFM4ler3nlDRkMdq8FCCryYQfFzuU6W30acBT6h8tIKtFJToDA==
X-Received: by 2002:a05:622a:1998:b0:3b8:3a7c:d204 with SMTP id u24-20020a05622a199800b003b83a7cd204mr5249101qtc.58.1675268910738;
        Wed, 01 Feb 2023 08:28:30 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d29-20020ac8615d000000b003b856b73e8bsm7528157qtm.16.2023.02.01.08.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:28:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/6.1: update to v6.1.9
Date: Wed,  1 Feb 2023 11:28:23 -0500
Message-Id: <2786f10640dffb2a5e7998d2e88818c9f654f6f4.1675268720.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675268720.git.bruce.ashfield@gmail.com>
References: <cover.1675268720.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176563

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    68a95455c153 Linux 6.1.9
    432ddb5765c4 amdgpu: fix build on non-DCN platforms.
    a4d01fb87ece perf/x86/amd: fix potential integer overflow on shift of a int
    dc1ccb4c0f85 netfilter: conntrack: unify established states for SCTP paths
    70654f995054 dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string
    137f1b47da5f x86/i8259: Mark legacy PIC interrupts with IRQ_LEVEL
    9291e7f6f940 dt-bindings: riscv: fix single letter canonical order
    709f785b6201 dt-bindings: riscv: fix underscore requirement for multi-letter extensions
    b96903b7fc8c acpi: Fix suspend with Xen PV
    2d4c140e9a60 x86/sev: Add SEV-SNP guest feature negotiation support
    dd017697feb1 Input: i8042 - add Clevo PCX0DX to i8042 quirk table
    6816478c0db1 Revert "Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode"
    e1275a6b2d99 Revert "mm/compaction: fix set skip in fast_find_migrateblock"
    2fd712538d68 Fix up more non-executable files marked executable
    ff66e15a4e97 tools: gpio: fix -c option of gpio-event-mon
    d88695e7cc85 treewide: fix up files incorrectly marked executable
    fe10ce3041b6 block: ublk: move ublk_chr_class destroying after devices are removed
    f81be7edb780 Partially revert "perf/arm-cmn: Optimise DTC counter accesses"
    37f21dc8a489 net: mdio-mux-meson-g12a: force internal PHY off on mux switch
    a4bbf0311755 tsnep: Fix TX queue stop/wake for multiple queues
    994087b56e95 net/tg3: resolve deadlock in tg3_reset_task() during EEH
    2d449b8dd373 riscv: Move call to init_cpu_topology() to later initialization stage
    76d130250a25 thermal: intel: int340x: Add locking to int340x_thermal_get_trip_type()
    a8f2ee10718f net: mctp: mark socks as dead on unhash, prevent re-add
    6a524787965f net: mctp: hold key reference when looking up a general key
    2f87a60e9b4e net: mctp: move expiry timer delete to unhash
    d0cdcc3da926 net: mctp: add an explicit reference from a mctp_sk_key to sock
    d46d7516cba3 net: ravb: Fix possible hang if RIS2_QFF1 happen
    4fd88b8d6e04 net: ravb: Fix lack of register setting after system resumed for Gen3
    fc482705cb84 gpio: ep93xx: Fix port F hwirq numbers in handler
    699378c56b1d gpio: mxc: Unlock on error path in mxc_flip_edge()
    b51e3f5e86d8 nvme: fix passthrough csi check
    f4c8fc775fcb riscv/kprobe: Fix instruction simulation of JALR
    9f08bb650078 sctp: fail if no bound addresses can be used for a given scope
    61a214dcda51 net/sched: sch_taprio: do not schedule in taprio_reset()
    250cec4b26a5 tracing/osnoise: Use built-in RCU list checking
    91c7ca226a24 ACPI: video: Fix apple gmux detection
    bd100f492c7e platform/x86: apple-gmux: Add apple_gmux_detect() helper
    4e1f8efbd719 platform/x86: apple-gmux: Move port defines to apple-gmux.h
    8f7f8079ed93 platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting
    51e394c6f81a netrom: Fix use-after-free of a listening socket.
    ecf1d4250ff4 netfilter: conntrack: fix vtag checks for ABORT/SHUTDOWN_COMPLETE
    f0907d08bac7 net: ethernet: adi: adin1110: Fix multicast offloading
    118e95ce5fa0 net: dsa: microchip: fix probe of I2C-connected KSZ8563
    f9753ebd61be ipv4: prevent potential spectre v1 gadget in fib_metrics_match()
    6850fe301d01 ipv4: prevent potential spectre v1 gadget in ip_metrics_convert()
    da553c7ca82f netlink: annotate data races around sk_state
    13edec44a5f5 netlink: annotate data races around dst_portid and dst_group
    b181c31fe893 netlink: annotate data races around nlk->portid
    44d6de3b4f26 netfilter: nft_set_rbtree: skip elements in transaction from garbage collection
    318cb24a4c3f netfilter: nft_set_rbtree: Switch to node list walk for overlap detection
    6f81f0a952cd ACPI: video: Add backlight=native DMI quirk for Asus U46E
    aa9483b94547 ACPI: video: Add backlight=native DMI quirk for HP EliteBook 8460p
    ed796e0916a8 ACPI: video: Add backlight=native DMI quirk for HP Pavilion g6-1d80nr
    2e3539d34b8e drm/i915/selftest: fix intel_selftest_modify_policy argument types
    048c82c0b3bd nvme-fc: fix initialization order
    74673597c100 nvme: consolidate setting the tagset flags
    3130e38b0b29 nvme: simplify transport specific device attribute handling
    554484a34e98 net: fec: Use page_pool_put_full_page when freeing rx buffers
    12075708f2e7 net: fix UaF in netns ops registration error path
    992e4ff7116a netlink: prevent potential spectre v1 gadgets
    122d3a0ee454 iavf: schedule watchdog immediately when changing primary MAC
    aa17cf8af776 iavf: fix temporary deadlock and failure to set MAC address
    0bdc4b4ba720 drm/i915: Fix a memory leak with reused mmap_offset
    67444f8ca31c drm/drm_vma_manager: Add drm_vma_node_allow_once()
    e8267867fd1a i2c: designware: Fix unbalanced suspended flag
    9f36aae9e80e i2c: designware: use casting of u64 in clock multiplication to avoid overflow
    5e6618e28b33 io_uring: always prep_async for drain requests
    3238146fcf26 net: mana: Fix IRQ name - add PCI and queue number
    1ce29f7444df io_uring: inline __io_req_complete_put()
    85224a3f89cf io_uring: remove io_req_tw_post_queue
    65aeb34c0f2d io_uring: use io_req_task_complete() in timeout
    0c4d95ad2160 io_uring: hold locks for io_req_complete_failed
    6dbb84c7c2e1 io_uring: inline __io_req_complete_post()
    bfd4d1884065 io_uring: inline io_req_task_work_add()
    af8e87f72f9e drm/amdgpu/display/mst: update mst_mgr relevant variable when long HPD
    be6bf2321343 drm/amdgpu/display/mst: limit payload to be updated one by one
    5891a419031d drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments
    60cd9bb28b97 drm/amdgpu: remove unconditional trap enable on add gfx11 queues
    076f7a8798f5 drm/amd/pm: add missing AllowIHInterrupt message mapping for SMU13.0.0
    335ef7d0777c drm/display/dp_mst: Correct the kref of port.
    4516ccd5e154 platform/x86: thinkpad_acpi: Fix profile modes on Intel platforms
    6f0351d0c311 EDAC/qcom: Do not pass llcc_driv_data as edac_device_ctl_info's pvt_info
    77a92cc82665 EDAC/device: Respect any driver-supplied workqueue polling value
    00ba539393bf ARM: 9280/1: mm: fix warning on phys_addr_t to void pointer assignment
    a914e1132f01 ipv6: fix reachability confirmation with proxy_ndp
    95cf086772c5 regulator: dt-bindings: samsung,s2mps14: add lost samsung,ext-control-gpios
    19df0f77b3d1 thermal: intel: int340x: Protect trip temperature from concurrent updates
    8294b4a88921 riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT
    ea77e9b9fb53 scsi: ufs: core: Fix devfreq deadlocks
    97856a9d776d KVM: arm64: GICv4.1: Fix race with doorbell on VPE activation/deactivation
    b0487b40305b KVM: x86/vmx: Do not skip segment attributes if unusable bit is set
    121d87eb5817 io_uring/net: cache provided buffer group value for multishot receives
    42fea1c35254 ovl: fail on invalid uid/gid mapping at copy up
    caa0ea92503f ovl: fix tmpfile leak
    f03face5fda6 ksmbd: limit pdu length size according to connection status
    dcb69eb91c84 ksmbd: downgrade ndr version error message to debug
    eb563dce3d16 ksmbd: do not sign response to session request for guest login
    d5d7847e57ac ksmbd: add max connections parameter
    5109607a4ece cifs: Fix oops due to uncleared server->smbd_conn in reconnect
    f9575ea163ad ftrace/scripts: Update the instructions for ftrace-bisect.sh
    b4e7e81b4fdf trace_events_hist: add check for return value of 'create_hist_field'
    198c83963f63 tracing: Make sure trace_printk() can output as soon as it can be used
    e5ae9b5a652f ftrace: Export ftrace_free_filter() to modules
    14f4d81f647b module: Don't wait for GOING modules
    c00c20e3e351 nfsd: don't free files unconditionally in __nfsd_file_cache_purge
    6eb0fc92eeee kvm/vfio: Fix potential deadlock on vfio group_lock
    eced3d368f63 scsi: hpsa: Fix allocation size for scsi_host_alloc()
    4ba7d17f2b3b vfio/type1: Respect IOMMU reserved regions in vfio_test_domain_fgsp()
    b811432fc56f sched/uclamp: Fix a uninitialized variable warnings
    390eb5433eff sched/fair: Check if prev_cpu has highest spare cap in feec()
    63cccc92768d wifi: mac80211: Fix iTXQ AMPDU fragmentation handling
    7b8fe53d2a1d wifi: mac80211: Proper mark iTXQs for resumption
    c932501bc232 io_uring/msg_ring: fix remote queue to disabled ring
    3964b0c2e843 drm/amdgpu: complete gfxoff allow signal during suspend without delay
    2c8fb41ed0e6 drm/i915: Allow alternate fixed modes always for eDP
    7fa092a05791 drm/i915: Allow panel fixed modes to have differing sync polarities
    83b15fe00a45 Bluetooth: hci_sync: cancel cmd_timer if hci_open failed
    cc2a13ec84a5 arm64: efi: Account for the EFI runtime stack in stack unwinder
    cf1f38ef9567 arm64: efi: Avoid workqueue to check whether EFI runtime is live
    119a34527ed8 arm64: efi: Recover from synchronous exceptions occurring in firmware
    0bfa2249ca06 Revert "selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID"
    c19bd0d89720 btrfs: zoned: enable metadata over-commit for non-ZNS setup
    5f366b36a83b firmware: coreboot: Check size of table entry and use flex-array
    f594afe49946 ata: pata_cs5535: Don't build on UML
    448e5fbbf9b7 lockref: stop doing cpu_relax in the cmpxchg loop
    47da87959390 platform/x86: simatic-ipc: add another model
    4bfccc9b1300 platform/x86: simatic-ipc: correct name of a model
    e7f4e976d39e platform/x86: asus-wmi: Ignore fan on E410MA
    71dfaccf2094 platform/x86: asus-wmi: Add quirk wmi_ignore_fan
    63e3ff2e9ee4 platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
    790aefa09e39 platform/x86: asus-nb-wmi: Add alternate mapping for KEY_CAMERA
    9527a8613960 platform/x86: touchscreen_dmi: Add info for the CSL Panther Tab HD
    564756d5ad9a r8152: add vendor/device ID pair for Microsoft Devkit
    b886ccb190f0 scsi: hisi_sas: Set a port invalid only if there are no devices attached when refreshing port id
    223dddc8807b scsi: hisi_sas: Use abort task set to reset SAS disks when discovered
    3e711bb4409a KVM: s390: interrupt: use READ_ONCE() before cmpxchg()
    75d8a514ceec spi: spidev: remove debug messages that access spidev->spi without locking
    893d45394dbe cifs: fix potential memory leaks in session setup
    ca6263dc22ac drm/amdkfd: Fix NULL pointer error for GC 11.0.1 on mGPU
    92af2d3b57a1 drm/amdkfd: Add sync after creating vram bo
    df675d4cf0e3 ACPI: resource: Skip IRQ override on Asus Expertbook B2402CBA
    c6cf20e747ed ASoC: fsl-asoc-card: Fix naming of AC'97 CODEC widgets
    39c315fe6e59 ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions with AC'97 CODEC
    74ed6ee3704c cpufreq: armada-37xx: stop using 0 as NULL pointer
    141fe35cb13e tools/nolibc: prevent gcc from making memset() loop over itself
    f3b7893078ca tools/nolibc: fix missing includes causing build issues at -O0
    338ec07a14cd tools/nolibc: Fix S_ISxxx macros
    99dd3449279b nolibc: fix fd_set type
    0333c339781f perf/x86/intel/uncore: Add Emerald Rapids
    a29933719f6b perf/x86/msr: Add Emerald Rapids
    c5ed0fe3eb55 perf/x86/msr: Add Meteor Lake support
    be839afcdf64 perf/x86/cstate: Add Meteor Lake support
    b91ec58ffb8a xen/pvcalls: free active map buffer on pvcalls_front_free_map
    25714807b1fd s390: expicitly align _edata and _end symbols on page boundary
    a524f623daae s390/debug: add _ASM_S390_ prefix to header guard
    68f5d286aa3d drm: Add orientation quirk for Lenovo ideapad D330-10IGL
    748f31ba3ec6 net: usb: cdc_ether: add support for Thales Cinterion PLS62-W modem
    c6fb430d3303 drm/msm/a6xx: Avoid gx gbit halt during rpm suspend
    7daafbd2d934 ASoC: fsl_micfil: Correct the number of steps on SX controls
    0d792453213f cpufreq: Add SM6375 to cpufreq-dt-platdev blocklist
    d5cb15095a93 kcsan: test: don't put the expect array on the stack
    fd14d29bb698 ASoC: support machine driver with max98360
    f48c6b680e74 ASoC: amd: yc: Add ASUS M5402RA into DMI table
    a0e83ab31144 ASoC: mediatek: mt8186: Add machine support for max98357a
    80590863884a ASoC: mediatek: mt8186: support rt5682s_max98360
    297b3d44bbc7 cpufreq: Add Tegra234 to cpufreq-dt-platdev blocklist
    7d596bbc66a5 cpufreq: CPPC: Add u64 casts to avoid overflowing
    528bd2aa1e7b spi: cadence: Fix busy cycles calculation
    1a5ead77c9ce ASoC: amd: yc: Add Razer Blade 14 2022 into DMI table
    c658a6d5501d ASoC: SOF: Add FW state to debugfs
    4e491a1373a7 ASoC: SOF: pm: Always tear down pipelines before DSP suspend
    7af7cb349c45 ASoC: SOF: pm: Set target state earlier
    c9f0e54a2576 scsi: iscsi: Fix multiple iSCSI session unbind events sent to userspace
    dc706d778746 tcp: fix rate_app_limited to default to 1
    cefa85480ac9 bnxt: Do not read past the end of test names
    aebf7e62708b net: stmmac: enable all safety features by default
    2846a7412f62 thermal: core: call put_device() only after device_register() fails
    d4dbbbbb2449 thermal/core: fix error code in __thermal_cooling_device_register()
    80bb3b901abe thermal: Validate new state in cur_state_store()
    3896f78b2203 net: dsa: microchip: ksz9477: port map correction in ALU table entry register
    248f6a70eac1 selftests/net: toeplitz: fix race on tpacket_v3 block close
    c80475214850 driver core: Fix test_async_probe_init saves device in wrong array
    cfc7462ff824 w1: fix WARNING after calling w1_process()
    8bc7d8706737 w1: fix deadloop in __w1_remove_master_device()
    e75485fc589e device property: fix of node refcount leak in fwnode_graph_get_next_endpoint()
    13ba563c2c80 ptdma: pt_core_execute_cmd() should use spinlock
    0c5213ce6e72 usb: dwc3: fix extcon dependency
    6df50d94697d tcp: avoid the lookup process failing to get sk in ehash table
    4888f9fc03fc nvme-pci: fix timeout request state check
    58bdab02b225 net: sched: gred: prevent races when adding offloads to stats
    b0b029ee04ef drm/amd/display: fix issues with driver unload
    8f4764c0d478 phy: phy-can-transceiver: Skip warning if no "max-bitrate"
    567128076d55 dmaengine: tegra: Fix memory leak in terminate_all()
    f7a57ef457ad dmaengine: xilinx_dma: call of_node_put() when breaking out of for_each_child_of_node()
    a8a518ff3be5 cifs: fix potential deadlock in cache_refresh_path()
    d5fb544b4ce5 drm/i915/selftests: Unwind hugepages to drop wakeref on error
    07bc32e53c7b HID: betop: check shape of output reports
    b717cf5a6bd8 l2tp: prevent lockdep issue in l2tp_tunnel_register()
    c81fcd4e49e0 virtio-net: correctly enable callback during start_xmit
    74a76b80177f net: macb: fix PTP TX timestamp failure due to packet padding
    142d644fd2cc dmaengine: Fix double increment of client_count in dma_chan_get()
    f5e58b546cbe drm/panfrost: fix GENERIC_ATOMIC64 dependency
    459b413821ef net: mlx5: eliminate anonymous module_init & module_exit
    d0453c63d38e net/mlx5: E-switch, Fix switchdev mode after devlink reload
    a03b6ef0f6db net/mlx5e: Set decap action based on attr for sample
    ad2732630ff6 net/mlx5e: QoS, Fix wrongfully setting parent_element_id on MODIFY_SCHEDULING_ELEMENT
    0680225a559a net/mlx5: E-switch, Fix setting of reserved fields on MODIFY_SCHEDULING_ELEMENT
    d8da8d96ff1d net/mlx5e: Avoid false lock dependency warning on tc_ht even more
    e401ecbc3780 net: ipa: disable ipa interrupt during suspend
    17511bd84871 Bluetooth: Fix possible deadlock in rfcomm_sk_state_change
    9a7c3befef40 Bluetooth: hci_event: Fix Invalid wait context
    2539cbc625c5 Bluetooth: ISO: Fix possible circular locking dependency
    c524f9561c65 Bluetooth: ISO: Avoid circular locking dependency
    8ac6043bd3e5 Bluetooth: hci_sync: fix memory leak in hci_update_adv_data()
    f51a825b9f73 Bluetooth: hci_conn: Fix memory leaks
    ed818fd8c531 Bluetooth: Fix a buffer overflow in mgmt_mesh_add()
    5d947222e4e4 netfilter: conntrack: handle tcp challenge acks during connection reuse
    bb03899b9ba3 usb: gadget: f_fs: Ensure ep0req is dequeued before free_request
    6aee197b7fbc usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
    3d7f77e55da3 usb: ucsi: Ensure connector delayed work items are flushed
    94fa550b9564 block/rnbd-clt: fix wrong max ID in ida_alloc_max
    1c6c30cdcf61 HID: revert CHERRY_MOUSE_000C quirk
    076a9ebfccc3 ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l
    d0c5f5caf031 ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp157c-emstamp-argon
    1c50efa1cd27 ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcom-som
    e482dc20a73c ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcor-som
    249f0149768a pinctrl: rockchip: fix mux route data for rk3568
    5bd6174693aa net: stmmac: fix invalid call to mdiobus_get_phy()
    09003f12f5fe HID: check empty report_list in bigben_probe()
    cdcdc0531a51 HID: check empty report_list in hid_validate_values()
    7879626296e6 net: mdio: validate parameter addr in mdiobus_get_phy()
    8327104c28c0 net: usb: sr9700: Handle negative len
    cef0845b6dcf l2tp: close all race conditions in l2tp_tunnel_register()
    bf47eb2cc58c l2tp: convert l2tp_tunnel_list to idr
    d3b2d2820a00 net/sched: sch_taprio: fix possible use-after-free
    12dd32ab623f net: stmmac: Fix queue statistics reading
    5a7205560755 pinctrl: rockchip: fix reading pull type on rk3568
    7794efa358bc wifi: rndis_wlan: Prevent buffer overflow in rndis_query_oid
    56e3e8da1efb gpio: mxc: Always set GPIOs used as interrupt source to INPUT mode
    4141fdfd7847 gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
    d314d0c3de79 sch_htb: Avoid grafting on htb_destroy_class_offload when destroying htb
    96a88e3ab62f net: lan966x: add missing fwnode_handle_put() for ports node
    e893dced1a18 net: enetc: avoid deadlock in enetc_tx_onestep_tstamp()
    d807a7544a70 net: wan: Add checks for NULL for utdm in undo_uhdlc_init and unmap_si_regs
    d3605282ec35 net: nfc: Fix use-after-free in local_cleanup()
    5d48e5cbb1cd phy: rockchip-inno-usb2: Fix missing clk_disable_unprepare() in rockchip_usb2phy_power_on()
    c921fe22178d drm/vc4: bo: Fix unused variable warning
    b0c89ef02556 bpf: Fix pointer-leak due to insufficient speculative store bypass mitigation
    797bbdc7c30d amd-xgbe: Delay AN timeout during KR training
    15d45a435e09 amd-xgbe: TX Flow Ctrl Registers are h/w ver dependent
    084e6764dc3e bpf: hash map, avoid deadlock with suitable hash mask
    d838b5c99bce phy: usb: sunplus: Fix potential null-ptr-deref in sp_usb_phy_probe()
    be960b061b89 drm/vc4: bo: Fix drmm_mutex_init memory hog
    86e1955b28d9 ARM: dts: at91: sam9x60: fix the ddr clock for sam9x60
    32d5eb95f8f0 NFSD: fix use-after-free in nfsd4_ssc_setup_dul()
    8103d53f25ec drm/msm/gpu: Fix potential double-free
    ba4ca7d2dd85 phy: ti: fix Kconfig warning and operator precedence
    758803e20260 kbuild: fix 'make modules' error when CONFIG_DEBUG_INFO_BTF_MODULES=y
    80bb370bce77 kbuild: export top-level LDFLAGS_vmlinux only to scripts/Makefile.vmlinux
    a504db9a140c arm64: dts: qcom: msm8992-libra: Fix the memory map
    dd95362789c7 arm64: dts: qcom: msm8992: Don't use sfpb mutex
    ad5daeb648ec PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()
    964f121334cd affs: initialize fsdata in affs_truncate()
    c37e769f2707 IB/hfi1: Remove user expected buffer invalidate race
    648cc5f41482 IB/hfi1: Immediately remove invalid memory from hardware
    dffa4afa98e7 IB/hfi1: Fix expected receive setup error exit issues
    39edbe1b549a IB/hfi1: Reserve user expected TIDs
    3304cb63f4dc IB/hfi1: Reject a zero-length user expected buffer
    43811d07ea64 RDMA/core: Fix ib block iterator counter overflow
    e73f5dd9b322 arm64: dts: marvell: AC5/AC5X: Fix address for UART1
    7b28a8920844 erofs: fix kvcalloc() misuse with __GFP_NOFAIL
    d7c71f93cfac RDMA/rxe: Prevent faulty rkey generation
    7ca8aa835464 RDMA/rxe: Fix inaccurate constants in rxe_type_info
    78cfe7bfe5d1 tomoyo: fix broken dependency on *.conf.default
    c2c3a71200c0 HID: amd_sfh: Fix warning unwind goto
    fa5ee1bec7c7 interconnect: qcom: msm8996: Fix regmap max_register values
    8086bd330a28 interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
    5362263b0c2f firmware: arm_scmi: Fix virtio channels cleanup on shutdown
    d807aff1910c firmware: arm_scmi: Harden shared memory access in fetch_notification
    3463203d1096 firmware: arm_scmi: Harden shared memory access in fetch_response
    b7863ef8a8f0 EDAC/highbank: Fix memory leak in highbank_mc_probe()
    633bad3dc81c reset: uniphier-glue: Fix possible null-ptr-deref
    00b433d5664a reset: ti-sci: honor TI_SCI_PROTOCOL setting when not COMPILE_TEST
    9eea16953ec1 soc: imx8m: Fix incorrect check for of_clk_get_by_name()
    c47e53679af1 arm64: dts: imx8mm-venice-gw7901: fix USB2 controller OC polarity
    9a65e90179ba HID: intel_ish-hid: Add check for ishtp_dma_tx_map
    bd04fcc35d37 arm64: dts: imx8mp-evk: pcie0-refclk cosmetic cleanup
    4df82eb50e3b arm64: dts: imx8mp: Fix power-domain typo
    3a999c07a644 arm64: dts: imx8mp: Fix missing GPC Interrupt
    2876069cbdc3 soc: imx: imx8mp-blk-ctrl: don't set power device name
    e92f205c71d9 ARM: imx: add missing of_node_put()
    504b06e529f1 arm64: dts: imx93-11x11-evk: correct clock and strobe pad setting
    767a2c8e7354 arm64: dts: verdin-imx8mm: fix dev board audio playback
    f20a2afec502 arm64: dts: imx8mm-beacon: Fix ecspi2 pinmux
    0cd7df5204e7 arm64: dts: verdin-imx8mm: fix dahlia audio playback
    57e8959f1018 ARM: dts: imx6qdl-gw560x: Remove incorrect 'uart-has-rtscts'
    02badccd1fcf ARM: dts: imx7d-pico: Use 'clock-frequency'
    79ed997b7146 ARM: dts: imx6ul-pico-dwarf: Use 'clock-frequency'
    7eef6180815c arm64: dts: imx8mp-phycore-som: Remove invalid PMIC property
    02ef93c4dfb4 soc: imx: imx8mp-blk-ctrl: enable global pixclk with HDMI_TX_PHY PD
    8aa234b1a492 dmaengine: ti: k3-udma: Do conditional decrement of UDMA_CHAN_RT_PEER_BCNT_REG
    1ec709691008 dmaengine: qcom: gpi: Set link_rx bit on GO TRE for rx operation
    7b91820fd753 arm64: dts: qcom: sc8280xp: fix primary USB-DP PHY reset
    7003e0ea1418 memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
    4c69fce6e537 memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
    e665b934695a memory: tegra: Remove clients SID override programming
    93f875a8526a Linux 6.1.8
    ebb677d21945 soc: qcom: apr: Make qcom,protection-domain optional again
    effecd8d116d Revert "wifi: mac80211: fix memory leak in ieee80211_if_add()"
    fa6357de7c5e block: mq-deadline: Rename deadline_is_seq_writes()
    5a69eccf5638 net/mlx5: fix missing mutex_unlock in mlx5_fw_fatal_reporter_err_work()
    659518e013d6 octeontx2-pf: Fix the use of GFP_KERNEL in atomic context on rt
    ddb98087bd2a net/ulp: use consistent error code when blocking ULP
    1eb57b87f106 octeontx2-pf: Avoid use of GFP_KERNEL in atomic context
    6da17ac15e35 drm/amdgpu: correct MEC number for gfx11 APUs
    40a66b6ca478 drm/amdgpu: add tmz support for GC IP v11.0.4
    a63bd0539bf3 drm/amdgpu: add tmz support for GC 11.0.1
    a74805429d38 drm/amdgpu: enable GFX Clock Gating control for GC IP v11.0.4
    834a91425865 drm/amdgpu: enable GFX Power Gating for GC IP v11.0.4
    09af1ee53ced drm/amdgpu: enable GFX IP v11.0.4 CG support
    8cbe04b2e0a1 drm/amdgpu: enable PSP IP v13.0.11 support
    11ffb9933730 drm/amdgpu/discovery: enable nbio support for NBIO v7.7.1
    703011b41c4f drm/amdgpu/pm: use the specific mailbox registers only for SMU IP v13.0.4
    fe4d9fb3326e drm/amdgpu/soc21: add mode2 asic reset for SMU IP v13.0.11
    c776433afefd drm/amdgpu/pm: add GFXOFF control IP version check for SMU IP v13.0.11
    6ed56b86918d drm/amdgpu: add smu 13 support for smu 13.0.11
    bb856053b7d7 drm/amdgpu/pm: enable swsmu for SMU IP v13.0.11
    3ed03b0b42c4 drm/amdgpu/discovery: add PSP IP v13.0.11 support
    7d1e2273f21f drm/amdgpu: add gmc v11 support for GC 11.0.4
    ea8f7acc35e2 drm/amdgpu: add gfx support for GC 11.0.4
    09157e804d9e drm/amdgpu/discovery: set the APU flag for GC 11.0.4
    333814dd71d8 drm/amdgpu: set GC 11.0.4 family
    2ecc26293852 drm/amdgpu/discovery: enable mes support for GC v11.0.4
    db4fa3b2d7d4 drm/amdgpu/discovery: enable gfx v11 for GC 11.0.4
    907d5b697d85 drm/amdgpu/discovery: enable gmc v11 for GC 11.0.4
    708509058b79 drm/amdgpu/discovery: enable soc21 common for GC 11.0.4
    2705a9548594 x86/fpu: Use _Alignof to avoid undefined behavior in TYPE_ALIGN
    a18417e27ed8 exit: Use READ_ONCE() for all oops/warn limit reads
    3f38c2170714 docs: Fix path paste-o for /sys/kernel/warn_count
    72c93f9897e9 panic: Expose "warn_count" to sysfs
    f53b6dda4d9b panic: Introduce warn_limit
    13aa82f00727 panic: Consolidate open-coded panic_on_warn checks
    e0738725bbf6 exit: Allow oops_limit to be disabled
    46cacd7913c8 exit: Expose "oops_count" to sysfs
    767997ef5dc0 exit: Put an upper limit on how often we can oops
    acc767cc70ce panic: Separate sysctl logic from CONFIG_SMP
    72b0e5faa514 efi: rt-wrapper: Add missing include
    f75a91c82dc8 arm64: efi: Execute runtime services from a dedicated stack
    ff3b1a624380 fs/ntfs3: Fix attr_punch_hole() null pointer derenference
    b542cb024a5d cifs: reduce roundtrips on create/qinfo requests
    bf9261e4536f drm/amd/display: disable S/G display on DCN 3.1.4
    3ad10fc4ad37 drm/amd/display: disable S/G display on DCN 3.1.5
    b105b79ea050 drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
    87e84d0ff97c drm/amd/display: Calculate output_color_space after pixel encoding adjustment
    032cebdff71e drm/amd/display: Fix set scaling doesn's work
    92c39d699592 drm/i915: Remove unused variable
    4397bcbd729d drm/i915: Allow switching away via vga-switcheroo if uninitialized
    597747eb58a7 drm/i915/display: Check source height is > 0
    38a9b17d3b58 drm/i915: re-disable RC6p on Sandy Bridge
    8dabe4e0daa9 drm/amdgpu: Correct the power calcultion for Renior/Cezanne.
    d693fdf73eb2 drm/amdgpu: allow multipipe policy on ASICs with one MEC
    af4a3c274a92 drm/amdgpu: fix amdgpu_job_free_resources v2
    cfb7a66c99ad ARM: omap1: fix !ARCH_OMAP1_ANY link failures
    4cc5622b2e9a ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI
    548ea9dd5e01 VMCI: Use threaded irqs instead of tasklets
    32b39dccd69b mei: me: add meteor lake point M DID
    a63171d0979c mei: bus: fix unlink on bus in error path
    6646d769fdb0 gsmi: fix null-deref in gsmi_get_variable
    1c5aaff754f3 serial: exar: Add support for Sealevel 7xxxC serial cards
    13efa6b1a304 serial: atmel: fix incorrect baudrate setup
    ab47d385da12 serial: amba-pl011: fix high priority character transmission in rs486 mode
    e7c07deaa193 dmaengine: idxd: Do not call DMX TX callbacks during workqueue disable
    b9e8e3fcfec6 dmaengine: idxd: Prevent use after free on completion memory
    99dc4520b74e dmaengine: idxd: Let probe fail when workqueue cannot be enabled
    8802fea8dd7f dmaengine: tegra210-adma: fix global intr clear
    16848cad1a48 dmaengine: lgm: Move DT parsing after initialization
    16b18ee00c40 serial: pch_uart: Pass correct sg to dma_unmap_sg()
    caf81ca977b3 dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible string documentation
    f1288e054995 dt-bindings: phy: g12a-usb2-phy: fix compatible string documentation
    1f1007d1301b arm64: dts: imx8mp: correct usb clocks
    2cab24bd8f43 usb-storage: apply IGNORE_UAS only for HIKSEMI MD202 on RTL9210
    09e4507ec8ef usb: gadget: f_ncm: fix potential NULL ptr deref in ncm_bitrate()
    96abcf7230d7 USB: gadget: Add ID numbers to configfs-gadget driver names
    f9c8c6b34d5d usb: gadget: g_webcam: Send color matching descriptor per frame
    184cfc6afb55 usb: typec: altmodes/displayport: Fix pin assignment calculation
    632b223797a9 usb: typec: altmodes/displayport: Add pin assignment helper
    9a027eeb9860 usb: typec: tcpm: Fix altmode re-registration causes sysfs create fail
    421492f229f0 usb: musb: fix error return code in omap2430_probe()
    b3fdc02c6123 usb: host: ehci-fsl: Fix module alias
    34f207ed1c10 usb: cdns3: remove fetched trb from cache before dequeuing
    feb7840e57ca USB: serial: cp210x: add SCALANCE LPE-9000 device id
    616fd34d0170 USB: gadgetfs: Fix race between mounting and unmounting
    f59549814a64 selftests: mptcp: userspace: validate v4-v6 subflows mix
    f44ce132016f mptcp: netlink: respect v4/v6-only sockets
    1423c12b4f0c mptcp: explicitly specify sock family at subflow creation time
    36fc7317cdb1 io_uring/poll: don't reissue in case of poll race on multishot request
    66144d830f59 pktcdvd: check for NULL returna fter calling bio_split_to_limits()
    64152e05a4de tty: fix possible null-ptr-defer in spk_ttyio_release
    fd524ca7fe45 tty: serial: qcom-geni-serial: fix slab-out-of-bounds on RX FIFO buffer
    8de08b0c44ae bpf: restore the ebpf program ID for BPF_AUDIT_UNLOAD and PERF_BPF_EVENT_PROG_UNLOAD
    ea41602d3b2f riscv: dts: sifive: fu740: fix size of pcie 32bit memory
    d1b531efcb8e thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
    16b4b0f8e5a0 thunderbolt: Do not report errors if on-board retimers are found
    15a2e23fd585 thunderbolt: Use correct function to calculate maximum USB3 link rate
    627ae8c6271e thunderbolt: Disable XDomain lane 1 only in software connection manager
    d048df8baf90 cifs: do not include page data when checking signature
    1004fc90f0d7 btrfs: fix race between quota rescan and disable leading to NULL pointer deref
    8af00fc7b670 btrfs: fix invalid leaf access due to inline extent during lseek
    bb2c2e62539f btrfs: qgroup: do not warn on record without old_roots populated
    34fe5b527e68 btrfs: do not abort transaction on failure to update log root
    23ffd7fc231a btrfs: do not abort transaction on failure to write log tree when syncing log
    076fb040d447 btrfs: add missing setup of log for full commit at add_conflicting_inode()
    f4c0df59e01a btrfs: fix directory logging due to race with concurrent index key deletion
    168492decbb6 btrfs: fix missing error handling when logging directory items
    6ec841132994 btrfs: add extra error messages to cover non-ENOMEM errors from device_add_list()
    f2f52dd4f50f mm/MADV_COLLAPSE: don't expand collapse when vm_end is past requested end
    bcde505af166 mm/userfaultfd: enable writenotify while userfaultfd-wp is enabled for a VMA
    3b8ede66658c mm/hugetlb: pre-allocate pgtable pages for uffd wr-protects
    8d6a675cd744 mm/hugetlb: fix uffd-wp handling for migration entries in hugetlb_change_protection()
    6062c992e912 mm/hugetlb: fix PTE marker handling in hugetlb_change_protection()
    33b161041471 mmc: sdhci-esdhc-imx: correct the tuning start tap and step setting
    b7465be89040 mmc: sunxi-mmc: Fix clock refcount imbalance during unbind
    7a106e8a1cdb ACPI: PRM: Check whether EFI runtime is available
    580a2a541273 comedi: adv_pci1760: Fix PWM instruction handling
    6a1594a780e7 usb: core: hub: disable autosuspend for TI TUSB8041
    079c78c68714 misc: fastrpc: Fix use-after-free race condition for maps
    35ddd482345c misc: fastrpc: Don't remove map on creater_process and device_release
    a50c5c25b6e7 misc: fastrpc: Fix use-after-free and race in fastrpc_map_find
    bab5687f4d1b usb: misc: onboard_hub: Move 'attach' work to the driver
    cbb0da62573c usb: misc: onboard_hub: Invert driver registration order
    aa5b95982f45 USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100
    5d6ecc63abb4 staging: vchiq_arm: fix enum vchiq_status return types
    32117ec83932 USB: serial: option: add Quectel EM05CN modem
    2c163640ed73 USB: serial: option: add Quectel EM05CN (SG) modem
    5fd46948fd51 USB: serial: option: add Quectel EC200U modem
    1048bc1b852d USB: serial: option: add Quectel EM05-G (RS) modem
    1e39e0b47ce6 USB: serial: option: add Quectel EM05-G (CS) modem
    4173c542195c USB: serial: option: add Quectel EM05-G (GR) modem
    91185568c99d prlimit: do_prlimit needs to have a speculation check
    08bf23c33979 xhci: Detect lpm incapable xHC USB3 roothub ports from ACPI tables
    b7904d20157c usb: acpi: add helper to check port lpm capability using acpi _DSM
    8c36de093546 xhci: Add a flag to disable USB3 lpm on a xhci root port level.
    60c1eb013e1e xhci: Add update_hub_device override for PCI xHCI hosts
    ea2ee5e9991c xhci: Fix null pointer dereference when host dies
    08864dc14a68 usb: xhci: Check endpoint is valid before dereferencing it
    0a8a71c4cb7d xhci-pci: set the dma max_seg_size
    806e5ac71d34 Revert "serial: stm32: Merge hard IRQ and threaded IRQ handling into single IRQ handler"
    2b5412ca6fd3 serial: stm32: Merge hard IRQ and threaded IRQ handling into single IRQ handler
    48b94e49980b mm/khugepaged: fix collapse_pte_mapped_thp() to allow anon_vma
    63f71b860901 hugetlb: unshare some PMDs when splitting VMAs
    1cb76f566949 mm/shmem: restore SHMEM_HUGE_DENY precedence over MADV_COLLAPSE
    0bf463939c09 nilfs2: fix general protection fault in nilfs_btree_insert()
    d3317baa34e9 zonefs: Detect append writes at invalid locations
    87615c0e5351 LoongArch: Add HWCAP_LOONGARCH_CPUCFG to elf_hwcap
    51a7ad5b60ef Add exception protection processing for vd in axi_chan_handle_err function
    6d114116da1b proc: fix PIE proc-empty-vm, proc-pid-vm tests
    e733121383c0 nommu: fix split_vma() map_count error
    6447569f4fce nommu: fix do_munmap() error path
    1442d51026c5 nommu: fix memory leak in do_mmap() error path
    a57c981d9f24 wifi: mac80211: fix initialization of rx->link and rx->link_sta
    c838df8461a6 wifi: mac80211: sdata can be NULL during AMPDU start
    b8d1d53bef5e wifi: mac80211: reset multiple BSSID options in stop_ap()
    10644c9828c8 wifi: mac80211: fix MLO + AP_VLAN check
    1590cee5342e wifi: brcmfmac: fix regression for Broadcom PCIe wifi devices
    ea3ebda47dd5 Bluetooth: hci_qca: Fix driver shutdown on closed serdev
    3b062a48b0de Bluetooth: hci_sync: Fix use HCI_OP_LE_READ_BUFFER_SIZE_V2
    4e18618ced3b fbdev: omapfb: avoid stack overflow warning
    b019db2fcf09 of: fdt: Honor CONFIG_CMDLINE* even without /chosen node, take 2
    3848b6b2a696 perf/x86/rapl: Add support for Intel Emerald Rapids
    f5f3c924f4fd perf/x86/rapl: Add support for Intel Meteor Lake
    6fb614c68406 memblock tests: Fix compilation error.
    060266625604 cifs: fix race in assemble_neg_contexts()
    66c8b7b6e4bd perf/x86/rapl: Treat Tigerlake like Icelake
    1c38cdc747f0 f2fs: let's avoid panic if extent_tree is not created
    8ca718778b77 x86/asm: Fix an assembler warning with current binutils
    853ffa1511b0 btrfs: always report error in run_one_delayed_ref()
    5744ba445c9a selftests: net: fix cmsg_so_mark.sh test hang
    307e8d9eef65 RDMA/srp: Move large values to a new enum for gcc13
    6c27fc157479 bpf: keep a reference to the mm, in case the task is dead.
    af0bedfbcb81 r8169: fix dmar pte write access is not set error
    315a779c838d r8169: move rtl_wol_enable_rx() and rtl_prepare_power_down()
    27b510785068 net/ethtool/ioctl: return -EOPNOTSUPP if we have no phy stats
    11891c80f1a9 vdpa_sim_net: should not drop the multicast/broadcast packet
    c6c6af90101f vduse: Validate vq_num in vduse_validate_config()
    ab23a6dbfc72 virtio_pci: modify ENOENT to EINVAL
    af3fca732e9a vdpa/mlx5: Avoid overwriting CVQ iotlb
    909b96557b38 vdpa/mlx5: Avoid using reslock in event_handler
    6dbffca77f12 vdpa/mlx5: Return error on vlan ctrl commands if not supported
    dc6466fcdefe tools/virtio: initialize spinlocks in vring_test.c
    a65644cef5db net: ethernet: marvell: octeontx2: Fix uninitialized variable warning
    2e5d5c4ae77d selftests/bpf: check null propagation only neither reg is PTR_TO_BTF_ID
    16e7fb3cc305 pNFS/filelayout: Fix coalescing test for single DS
    77043645aa6c wifi: iwlwifi: fw: skip PPAG for JF
    d1607059375d btrfs: fix trace event name typo for FLUSH_DELAYED_REFS
    34762a3d6a85 dma-buf: fix dma_buf_export init order v2

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 80f0f0e260..28b7159359 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8605b6101efcfdd8dd779db4fd5aafb94727e990"
-SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
+SRCREV_machine ?= "94f73e8d6872df48a7c4ee6caa1701ae2a535dfe"
+SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.7"
+LINUX_VERSION ?= "6.1.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 318eee68a6..65866dd1db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.7"
+LINUX_VERSION ?= "6.1.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
+SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 1549181b96..6bd83197fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "26bcae01ecdaf3481d4a62e1e626af7f5ef965bb"
-SRCREV_machine:qemuarm64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemumips ?= "42f627bfa37b3da569968b435423da339f9614da"
-SRCREV_machine:qemuppc ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemuriscv64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemuriscv32 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemux86 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemux86-64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_machine:qemumips64 ?= "4bfa434ee5da72a5a8b2cb8ec799603883f5d532"
-SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
+SRCREV_machine:qemuarm ?= "ccd3b20fb504d35147d35962254b68b0041a4c6f"
+SRCREV_machine:qemuarm64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemumips ?= "d60ecbda7d4de915c867f751f5c63555a14219d1"
+SRCREV_machine:qemuppc ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemuriscv64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemuriscv32 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemux86 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemux86-64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemumips64 ?= "2949d76c3f79f3c7f700a6366d828f006d7dd5a8"
+SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_meta ?= "d7393c5752865634e307673043da55e353139333"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "21e996306a6afaae88295858de0ffb8955173a15"
+SRCREV_machine:class-devupstream ?= "68a95455c153f8adc513e5b688f4b348daa7c1b1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.7"
+LINUX_VERSION ?= "6.1.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


