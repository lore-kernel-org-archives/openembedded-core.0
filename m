Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FCBC48BEF
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 20:05:21 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.8142.1708113920859101945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 12:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFb8tiFH;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7872614af89so256926985a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 12:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708113920; x=1708718720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS7YPczL3AH00c5G6pePo+xm/hizo8gUO6bevE0h1IA=;
        b=dFb8tiFHyR5ZMHA9ebIwsyaiUDYDIOaiDtPI1WnR9eNePMGRM3J/JUOThf4KhcQJ4C
         gc/fHc/XRt6DM/97WRRZmEbC+E4dO98NyQO/qSQQjl62Rm69RCHdRWzfpSLcrbEL4vl6
         l+TNYjBWxRu2lSWTXLMktDl2kNUlY+mKV7qjo3WQ4hB+Ec2ckiFw4CxT6AbP9bEYGrfx
         Nt0HKblO6Ve2MAhgEKfN0cpQ3ctryEmuofGYKdcwRIx5RLSUZBWQFvIeNkDBR3ci8jCO
         B/4xlv5g4GApQIDJ5/sfvzQMVB/4gwQ8eEA9snCz+6NnmODEiT1rXayXopFVZWUIRfFr
         B5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113920; x=1708718720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS7YPczL3AH00c5G6pePo+xm/hizo8gUO6bevE0h1IA=;
        b=fseLW/gJ/NY/U4a7PJ76Od4Z3KKj2JB5o3gI6m5Ak8ZP4Yj+/Qbmc9QkcMyaSR4d37
         g3DtrGut3stCOJyK9fuTufw9NFwaSTCf7WqeyZHkOhTXpNzF/Mcx9MNxItPjyoWV7J7F
         xbeUI6gwcWpwJv6vDZbFLsKFK7nEw0BqsX95j2E7jdnvyzW9bKM7jzP+WraJlaGq0TRZ
         /3lfMd8kcBfVqjMbEhmedhW3vaMXtLePphcRcow3fr9Whf5NcOTlx8yZOcxbngUsNK9+
         ukQaC+XVL44jGcs/KKD4pDegm2mE2iL3+6kdTvylEWw/nmC89GR3fA1nVp98KeMCSjLA
         2uWg==
X-Gm-Message-State: AOJu0YymJHmpeAODrrM55CP2L14JfUzvqhcSWElQg0c/7nDqlF8Gzrjb
	bVYICV8cIQIou9cCesePQYYwMcy7ITBvYRdKvJeqJJNDJaMquH6dHG4sb0XaSSY=
X-Google-Smtp-Source: AGHT+IFpfZj7V8QFsr/XimuT296hZYDgeSTtxn2O0TU2KAvJ9dCfrECI2cmxAd222kOd8s0XUpiKoA==
X-Received: by 2002:a37:e117:0:b0:787:18b5:f56b with SMTP id c23-20020a37e117000000b0078718b5f56bmr9618116qkm.34.1708113919544;
        Fri, 16 Feb 2024 12:05:19 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id vu21-20020a05620a561500b007872e92ff64sm246046qkn.63.2024.02.16.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:05:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/6.6: update to v6.6.16
Date: Fri, 16 Feb 2024 15:05:14 -0500
Message-Id: <f005e9121cdcd3ef93cc5e220951e05dd0176a02.1708113821.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708113821.git.bruce.ashfield@gmail.com>
References: <cover.1708113821.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195803

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    eb3e299184cc Linux 6.6.16
    bd8740928aac pds_core: Prevent health thread from running during reset/remove
    7110e98840ee drm/amdgpu: Fix missing error code in 'gmc_v6/7/8/9_0_hw_init()'
    4f89186790fe ASoC: codecs: wsa883x: fix PA volume control
    a499a67685af ASoC: codecs: lpass-wsa-macro: fix compander volume hack
    9e0454cc9252 ASoC: codecs: wcd938x: fix headphones volume controls
    d821cbe902f4 ASoC: qcom: sc8280xp: limit speaker volumes
    c9ac947693f5 bonding: remove print in bond_verify_device_path
    4caf54817650 selftests/bpf: Remove flaky test_btf_id test
    46e35a506538 LoongArch/smp: Call rcutree_report_cpu_starting() at tlb_init()
    78a1eb102c7f drm/msm/dsi: Enable runtime PM
    18e7ab59b755 Revert "drm/amd/display: Disable PSR-SU on Parade 0803 TCON again"
    6335c0cdb2ea mm, kmsan: fix infinite recursion due to RCU critical section
    e50c55c295d4 arm64: irq: set the correct node for shadow call stack
    4f3341db4ea7 selftests: net: enable some more knobs
    97d9d1fdde25 selftests: net: add missing config for NF_TARGET_TTL
    eb0b6fc85ca9 selftests: bonding: Check initial state
    83146efc8d14 selftests: team: Add missing config options
    6af17316df51 net: sysfs: Fix /sys/class/net/<iface> path
    e7a36b563bbd octeontx2-pf: Remove xdp queues on program detach
    cb0ef63e5e67 selftests: net: don't access /dev/stdout in pmtu.sh
    d99f772f6371 selftests: net: fix available tunnels detection
    eb43e8d5e059 selftests: net: add missing config for pmtu.sh tests
    fd0e57cb5f74 selftests: net: add missing config for nftables-backed iptables
    2bbf2b1c20f9 pds_core: Rework teardown/setup flow to be more common
    f6ec6ac94329 pds_core: Clear BARs on reset
    22cd6046eb21 pds_core: Prevent race issues involving the adminq
    699f5416c33e pds_core: implement pci reset handlers
    10839a1892dd pds_core: Use struct pdsc for the pdsc_adminq_isr private data
    b26628142b99 pds_core: Cancel AQ work on teardown
    5e7f3e0381c0 af_unix: fix lockdep positive in sk_diag_dump_icons()
    8160eb9a0102 net: ipv4: fix a memleak in ip_setup_cork
    cfe3550ea5df netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
    25621b53377d netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
    ce76746a1cd2 netfilter: nf_tables: restrict tunnel object to NFPROTO_NETDEV
    6edc89300b31 netfilter: conntrack: correct window scaling with retransmitted SYN
    2d608870718f selftests: net: add missing config for GENEVE
    ef3d6ed3c8b3 devlink: Fix referring to hw_addr attribute during state validation
    d99971ec1b3a bridge: mcast: fix disabled snooping after long uptime
    48129d4f967e selftests: net: Add missing matchall classifier
    3151051b787f llc: call sock_orphan() at release time
    13806fc09040 ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
    4785948b213f net: dsa: qca8k: fix illegal usage of GPIO
    a4b6f9de6a78 ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
    09943985ac58 ixgbe: Refactor overtemp event handling
    03c5b6d41744 ixgbe: Refactor returning internal error codes
    e9ad7a8060fa e1000e: correct maximum frequency adjustment values
    d15cc0f66884 tcp: add sanity checks to rx zerocopy
    f0025c92b1ba net: lan966x: Fix port configuration when using SGMII interface
    dcaafdba6c61 ipmr: fix kernel panic when forwarding mcast packets
    f9ae3a437b1f net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
    350a6640fac4 ip6_tunnel: make sure to pull inner header in __ip6_tnl_rcv()
    2d0bfd36e547 selftests: net: give more time for GRO aggregation
    d3ccd4f0e158 selftests: net: add missing required classifier
    e5d6247d7ffd selftests: net: add missing config for big tcp tests
    0c2c97aa7706 net: phy: mediatek-ge-soc: sync driver with MediaTek SDK
    01b4ae7e15df net: ethernet: mtk_eth_soc: set DMA coherent mask to get PPE working
    f08daa806ba7 gve: Fix skb truesize underestimation
    baa3f8b28185 selftests: net: explicitly wait for listener ready
    31a6e0a87ba7 selftests: net: remove dependency on ebpf tests
    54a55b632206 HID: hidraw: fix a problem of memory leak in hidraw_release()
    65ead8468c21 scsi: core: Move scsi_host_busy() out of host lock for waking up EH handler
    92f0eca1fcf7 regulator: ti-abb: don't use devm_platform_ioremap_resource_byname for shared interrupt register
    8e4319a4e9fd kunit: run test suites only after module initialization completes
    6f8277017dfb scsi: isci: Fix an error code problem in isci_io_request_build()
    b73ffafa0121 riscv: Fix build error on rv32 + XIP
    3c0a7eac9e78 drm/amdkfd: only flush mes process context if mes support is there
    8de8f000ffe1 drm: using mul_u32_u32() requires linux/math64.h
    8a67b8d2ad04 wifi: cfg80211: fix RCU dereference in __cfg80211_bss_update
    2d5228be5e03 perf: Fix the nr_addr_filters fix
    250cfafb3e9d i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
    5ea4007636b2 drm/amdkfd: Fix 'node' NULL check in 'svm_range_get_range_boundaries()'
    25c2de1fbd8e drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
    b02831b8a5b6 drm/amdgpu: Fix with right return code '-EIO' in 'amdgpu_gmc_vram_checking()'
    0ee4c5829fb3 drm/amd/powerplay: Fix kzalloc parameter 'ATOM_Tonga_PPM_Table' in 'get_platform_power_management_table()'
    d0bc6be623ba drm/amdgpu: fix avg vs input power reporting on smu7
    d8fedfb4be52 ceph: fix invalid pointer access if get_quota_realm return ERR_PTR
    196b87e5c00c ceph: fix deadlock or deadcode of misusing dget()
    987219b377cc ceph: reinitialize mds feature bit even when session in open
    6d8b01624a25 blk-mq: fix IO hang from sbitmap wakeup race
    20e81d2c4e44 virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
    752312f6a794 drm/amdkfd: Fix lock dependency warning with srcu
    28d2d623d2fb drm/amdkfd: Fix lock dependency warning
    6757fd72312b libsubcmd: Fix memory leak in uniq()
    1229ce1c4acd misc: lis3lv02d_i2c: Add missing setting of the reg_ctrl callback
    04644c18fc35 usb: xhci-plat: fix usb disconnect issue after s4
    11a93a73836e 9p: Fix initialisation of netfs_inode for 9p
    38d437d728bb PCI/AER: Decode Requester ID when no error info found
    7ec6e908ee17 PCI: Fix 64GT/s effective data rate calculation
    f8dcafcb5463 spmi: mediatek: Fix UAF on device remove
    952d0cbd1f68 fs/kernfs/dir: obey S_ISGID
    d3b08e2537bb tty: allow TIOCSLCKTRMIOS with CAP_CHECKPOINT_RESTORE
    10800685fd7d selftests/sgx: Fix linker script asserts
    915d900f6d0f usb: hub: Add quirk to decrease IN-ep poll interval for Microchip USB491x hub
    cd72da00e6a0 usb: hub: Replace hardcoded quirk value with BIT() macro
    8b755fc728cd extcon: fix possible name leak in extcon_dev_register()
    7c5276c44dd5 perf cs-etm: Bump minimum OpenCSD version to ensure a bugfix is present
    0233b836312e PCI: switchtec: Fix stdev_release() crash after surprise hot remove
    cc56867d3226 PCI: Only override AMD USB controller if required
    a71f8c0a1ba2 mailbox: arm_mhuv2: Fix a bug for mhuv2_sender_interrupt
    c27d9af41a19 mfd: ti_am335x_tscadc: Fix TI SoC dependencies
    9744be5e8952 xen/gntdev: Fix the abuse of underlying struct page in DMA-buf import
    e792a03d06b3 riscv: Make XIP bootable again
    aca8d2587223 i3c: master: cdns: Update maximum prescaler value for i2c clock
    de3e9d8e8d1a um: time-travel: fix time corruption
    857710e1b11d um: net: Fix return type of uml_net_start_xmit()
    a4378abcbb8c um: Don't use vfprintf() for os_info()
    976c46e6964c um: Fix naming clash between UML and scheduler
    029479d4f1bb leds: trigger: panic: Don't register panic notifier if creating the trigger failed
    6eef17a3c687 pinctrl: baytrail: Fix types of config value in byt_pin_config_set()
    24d748413cc4 ALSA: hda/conexant: Fix headset auto detect fail in cx8070 and SN6140
    08dde830ab24 drm/amdgpu: apply the RV2 system aperture fix to RN/CZN as well
    583e0a336bfb drm/amdkfd: Fix iterator used outside loop in 'kfd_add_peer_prop()'
    ff5aefbbd82e drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
    aa1791b280ed drm/amdgpu: Fix '*fw' from request_firmware() not released in 'amdgpu_ucode_request()'
    90df72694a5b Re-revert "drm/amd/display: Enable Replay for static screen use cases"
    0d35c8977be8 drm/amdgpu: Let KFD sync with VM fences
    cef7f96a0a4c drm/amd/display: Fix minor issues in BW Allocation Phase2
    0a8fc4e007b9 drm/amdgpu: Fix ecc irq enable/disable unpaired
    b9ecbaa6211f clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
    49b4cab7bcbd drm/amd/display: Only clear symclk otg flag for HDMI
    4033887acddc drm/amd/display: make flip_timestamp_in_us a 64-bit variable
    9aa2cba7a275 accel/habanalabs: add support for Gaudi2C device
    3075d01e2719 watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for IT8784/IT8786
    1a63d7f8aa39 watchdog: starfive: add lock annotations to fix context imbalances
    b9359c3a4278 clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
    1cda2870d5b4 clk: hi3620: Fix memory leak in hi3620_mmc_clk_init()
    e7a0ee45c653 drm/amdgpu: fix ftrace event amdgpu_bo_move always move on same heap
    1f2b0ec25103 drm/msm/dpu: fix writeback programming for YUV cases
    828282829d5a drm/msm/dpu: Ratelimit framedone timeout msgs
    ec2c3d3438a8 drm/msm/dpu: enable writeback on SM8450
    50fc3d2199ef drm/msm/dpu: enable writeback on SM8350
    3a950c56dea1 drm/amdkfd: fix mes set shader debugger process management
    e9ca61a7e6b0 drm/amd/display: Force p-state disallow if leaving no plane config
    6750d1de747f drm/amd/display: For prefetch mode > 0, extend prefetch if possible
    777ab143a0c2 media: i2c: imx335: Fix hblank min/max values
    7190073513ca media: ddbridge: fix an error code problem in ddb_probe
    7c180bf2967c media: amphion: remove mutext lock in condition of wait_event
    342258fb46d6 IB/ipoib: Fix mcast list locking
    7a9696dbad6b drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
    417b8a91f4e8 f2fs: fix to tag gcing flag on page during block migration
    f9902f92ce53 hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6
    6f86bbf92cc5 hwmon: (nct6775) Fix fan speed set failure in automatic mode
    8a315206425b media: rkisp1: resizer: Stop manual allocation of v4l2_subdev_state
    fab483438342 media: rkisp1: Fix IRQ disable race issue
    e28e80cda429 media: rkisp1: Store IRQ lines
    a32c20cf933b media: rkisp1: Fix IRQ handler return values
    e08195de19c8 media: rkisp1: Drop IRQF_SHARED
    5193d26a706e media: uvcvideo: Fix power line control for SunplusIT camera
    051400c305af media: uvcvideo: Fix power line control for a Chicony camera
    6c0f21f86958 drm/msm/dp: Add DisplayPort controller for SM8650
    70cb71c9a887 ALSA: hda: intel-dspcfg: add filters for ARL-S and ARL
    0f04f8d6168b ALSA: hda: Intel: add HDA_ARL PCI ID support
    c964e3b277da PCI: add INTEL_HDA_ARL to pci_ids.h
    6ca8d2c068bb media: rockchip: rga: fix swizzling for RGB formats
    df16808b1627 media: stk1160: Fixed high volume of stk1160_dbg messages
    daf57c5ce16e drm/mipi-dsi: Fix detach call without attach
    9b3fbff86a62 drm/framebuffer: Fix use of uninitialized variable
    2cde325e185b drm/drm_file: fix use of uninitialized variable
    01e7578c7cd3 drm/amd/display: Fix MST PBN/X.Y value calculations
    c87011986fad ASoC: amd: Add new dmi entries for acp5x platform
    8b981e78d033 f2fs: fix write pointers on zoned device after roll forward
    1c563c045090 drm/amd/display: Fix tiled display misalignment
    1e0635bcda5b drm/bridge: anx7625: Fix Set HPD irq detect window to 2ms
    8c67a27e7774 drm/panel-edp: Add override_edid_mode quirk for generic edp
    02ca47143bc0 RDMA/IPoIB: Fix error code return in ipoib_mcast_join
    17e1361cb91d reiserfs: Avoid touching renamed directory if parent does not change
    408f4c8efddc fast_dput(): handle underflows gracefully
    1b7eb3a2044b ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
    32a600b8f6f4 ALSA: hda: Refer to correct stream index at loops
    2a7b12d4705b f2fs: fix to check return value of f2fs_reserve_new_block()
    9916fdd8a29a net: dsa: qca8k: put MDIO bus OF node on qca8k_mdio_register() failure
    45d201c4335b net: kcm: fix direct access to bv_len
    225b254911ef octeontx2-af: Fix max NPC MCAM entry check while validating ref_entry
    d973bf8ec3e8 i40e: Fix VF disable behavior to block all traffic
    e54c52ee07b9 arm64: dts: sprd: Change UMS512 idle-state nodename to match bindings
    8c700bed9b69 arm64: dts: sprd: Add clock reference for pll2 on UMS512
    daa24d2065d0 bridge: cfm: fix enum typo in br_cc_ccm_tx_parse
    d1f1e11b3d30 net/smc: disable SEID on non-s390 archs where virtual ISM may be used
    100089a1ec70 Bluetooth: L2CAP: Fix possible multiple reject send
    e266b7b2d4b5 Bluetooth: hci_sync: fix BR/EDR wakeup bug
    1441054443cb Bluetooth: ISO: Avoid creating child socket if PA sync is terminating
    f2719ecc4637 Bluetooth: qca: Set both WIDEBAND_SPEECH and LE_STATES quirks for QCA2066
    0dc97f76d670 wifi: cfg80211: free beacon_ies when overridden from hidden BSS
    9940160d12bd wifi: rtlwifi: rtl8723{be,ae}: using calculate_bit_shift()
    5f3e436832e8 libbpf: Fix NULL pointer dereference in bpf_object__collect_prog_relos
    84ff6a960730 wifi: rtw89: coex: Fix wrong Wi-Fi role info and FDDT parameter members
    85b4f7523873 wifi: rtl8xxxu: Add additional USB IDs for RTL8192EU devices
    0112d7f6c6f8 arm64: dts: amlogic: fix format for s4 uart node
    6bc0e112759b ice: fix pre-shifted bit usage
    cdb7f0e9ad25 arm64: dts: qcom: Fix coresight warnings in in-ports and out-ports
    f127a0b64c2d arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
    73cb930505d2 arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
    c9851c6445e5 md: Whenassemble the array, consult the superblock of the freshest device
    85f24d72b5a8 block: prevent an integer overflow in bvec_try_merge_hw_page
    f6791424f6f2 net: dsa: mv88e6xxx: Fix mv88e6352_serdes_get_stats error path
    c11a870a73a3 net: atlantic: eliminate double free in error handling logic
    334a12270c7a ice: fix ICE_AQ_VSI_Q_OPT_RSS_* register values
    4b8672726d04 scsi: hisi_sas: Set .phy_attached before notifing phyup event HISI_PHYE_PHY_UP_PM
    f92ee7113bb7 scsi: lpfc: Move determination of vmid_flag after VMID reinitialization completes
    6d38434f427c scsi: lpfc: Reinitialize an NPIV's VMID data structures after FDISC
    40ac9c17b6ab ARM: dts: imx23/28: Fix the DMA controller node name
    3866310a77c6 ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
    20b1881800a1 ARM: dts: imx27-apf27dev: Fix LED name
    8b9b3d9dd3cb ARM: dts: imx25/27: Pass timing0
    7eadf1ff3299 ARM: dts: imx25: Fix the iim compatible string
    afe022417b93 selftests/bpf: fix compiler warnings in RELEASE=1 mode
    03ca1747949f arm64: zynqmp: Fix clock node name in kv260 cards
    b00eedb225ae arm64: zynqmp: Move fixed clock to / for kv260
    5b9ea86e6620 block/rnbd-srv: Check for unlikely string overflow
    5e7213ca7815 ionic: bypass firmware cmds when stuck in reset
    fdc2e7ad7ab3 ionic: pass opcode to devcmd_wait
    243749271dbc net: phy: at803x: fix passing the wrong reference for config_intr
    509c223966f0 ARM: dts: imx1: Fix sram node
    cc1568568a31 ARM: dts: imx27: Fix sram node
    28743cc68694 ARM: dts: imx: Use flash@0,0 pattern
    34335be2414d ARM: dts: imx25/27-eukrea: Fix RTC node name
    9e5e41f63a32 ARM: dts: rockchip: fix rk3036 hdmi ports node
    23a0cdd96b01 wifi: ath12k: fix the issue that the multicast/broadcast indicator is not read correctly for WCN7850
    9ab224744a47 wifi: wfx: fix possible NULL pointer dereference in wfx_set_mfp_ap()
    702f1ed48e39 bpf: Set uattr->batch.count as zero before batched update or deletion
    20d7686331a5 wifi: mt76: mt7996: add PCI IDs for mt7992
    c4139d2faedf wifi: mt76: connac: fix EHT phy mode check
    d03363072251 arm64: dts: qcom: sm8350: Fix remoteproc interrupt type
    03d23f7d6e9b arm64: dts: qcom: sm8450: fix soundwire controllers node name
    cd7d1971c4c7 arm64: dts: qcom: sm8550: fix soundwire controllers node name
    bd4b6397faa0 net: mvmdio: Avoid excessive sleeps in polled mode
    9487d93f172a minmax: relax check to allow comparison between unsigned arguments and signed constants
    701405f53d1b minmax: allow comparisons of 'int' against 'unsigned char/short'
    b0c7fd162fa4 minmax: fix indentation of __cmp_once() and __clamp_once()
    204c653d5d0c minmax: allow min()/max()/clamp() if the arguments have the same signedness.
    56dcff99005a minmax: add umin(a, b) and umax(a, b)
    d89ae99530d0 minmax: fix header inclusions
    b65b93f3dbca minmax: deduplicate __unconst_integer_typeof()
    268515e9ddc6 scsi: libfc: Fix up timeout error in fc_fcp_rec_error()
    01d91d66a48d scsi: libfc: Don't schedule abort twice
    1f4fd12d2a0d wifi: ath12k: fix and enable AP mode for WCN7850
    a9bf3a490e6a bpf: Set need_defer as false when clearing fd array during map free
    483cb92334cd bpf: Check rcu_read_lock_trace_held() before calling bpf map helpers
    d8bfb29484d5 wifi: rtw89: fix misbehavior of TX beacon in concurrent mode
    5b34e76bbaab wifi: ath11k: fix race due to setting ATH11K_FLAG_EXT_IRQ_ENABLED too early
    e4f4bac7d3b6 wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()
    e02851adca4e bpf: Fix a few selftest failures due to llvm18 change
    401e139c1565 ARM: dts: imx7s: Fix nand-controller #size-cells
    aeefe740c85c ARM: dts: imx7s: Fix lcdif compatible
    62b5830762a4 ARM: dts: imx7d: Fix coresight funnel ports
    58b9d491afe2 scsi: arcmsr: Support new PCI device IDs 1883 and 1886
    6e1613da0a9a scsi: mpi3mr: Add PCI checks where SAS5116 diverges from SAS4116
    177fe2a728fc scsi: mpi3mr: Add support for SAS5116 PCI IDs
    d7a319889498 net: usb: ax88179_178a: avoid two consecutive device resets
    a5bea3ae3eaf bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
    b59bc7017252 PCI: Add no PM reset quirk for NVIDIA Spectrum devices
    d06b88b01fc1 net: phy: micrel: fix ts_info value in case of no phc
    94d045510143 ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges
    6f7e8d3952f2 ARM: dts: samsung: exynos4: fix camera unit addresses/ranges
    5b94b3a8e339 scsi: lpfc: Fix possible file string name overflow when updating firmware
    61cc78be359d soc: xilinx: fix unhandled SGI warning message
    4722924e7a62 soc: xilinx: Fix for call trace due to the usage of smp_processor_id()
    b01dbb6cfdb4 ARM: dts: qcom: msm8660: fix PMIC node labels
    198bba9b9d4b ARM: dts: qcom: mdm9615: fix PMIC node labels
    9d004cda161a ARM: dts: qcom: strip prefix from PMIC files
    ae81c559f11f selftests/bpf: Fix issues in setup_classid_environment()
    e54656ed6452 wifi: rt2x00: correct wrong BBP register in RxDCOC calibration
    d14ea4b0d85f selftests/bpf: Fix pyperf180 compilation failure with clang18
    aec8c7b1334b libbpf: Fix potential uninitialized tail padding with LIBBPF_OPTS_RESET
    a4c79e7969af selftests/bpf: satisfy compiler by having explicit return in btf test
    9e1913382b47 selftests/bpf: fix RELEASE=1 build for tc_opts
    04cfe4a5da57 wifi: rt2x00: restart beacon queue when hardware reset
    7b1bb9a40b38 wifi: rtw89: fix timeout calculation in rtw89_roc_end()
    8b1413dbfe49 ext4: avoid online resizing failures due to oversized flex bg
    04cf95f7a77a ext4: remove unnecessary check from alloc_flex_gd()
    903547ea2498 ext4: unify the type of flexbg_size to unsigned int
    c1eacba3b77c ext4: fix inconsistent between segment fstrim and full fstrim
    d08534ebc347 ecryptfs: Reject casefold directory inodes
    8c944f8a4139 smb: client: fix hardlinking of reparse points
    c586b0c7466e smb: client: fix renaming of reparse points
    d91ecb894aed ext4: treat end of range as exclusive in ext4_zero_range()
    69c7eeb4f622 SUNRPC: Fix a suspicious RCU usage warning
    15893975e9e3 sysctl: Fix out of bounds access for empty sysctl registers
    c87d7d910775 KVM: s390: fix setting of fpc register
    02c6bbfb08ba s390/ptrace: handle setting of fpc register correctly
    06dfeba8a8b8 s390/vfio-ap: fix sysfs status attribute for AP queue devices
    64e7f102c301 arch: consolidate arch_irq_work_raise prototypes
    05a8ba5c1e59 s390/boot: always align vmalloc area on segment boundary
    6996d43b1448 jfs: fix array-index-out-of-bounds in diNewExt
    0cb7eafed540 rxrpc_find_service_conn_rcu: fix the usage of read_seqbegin_or_lock()
    08ade0fa6103 afs: fix the usage of read_seqbegin_or_lock() in afs_find_server*()
    8d742c4a8b2b afs: fix the usage of read_seqbegin_or_lock() in afs_lookup_volume_rcu()
    464a0ca0f05a crypto: stm32/crc32 - fix parsing list of devices
    d48760461aeb erofs: fix ztailpacking for subpage compressed blocks
    8b18d5f5454e crypto: octeontx2 - Fix cptvf driver cleanup
    c7ff77b7db34 crypto: starfive - Fix dev_err_probe return error
    3f691aa676f2 erofs: fix up compacted indexes for block size < 4096
    0593cfd321df pstore/ram: Fix crash when setting number of cpus to an odd number
    af8bdab2adb8 crypto: p10-aes-gcm - Avoid -Wstringop-overflow warnings
    b0af4adaedc6 hwrng: starfive - Fix dev_err_probe return error
    1696d6d7d4a1 jfs: fix uaf in jfs_evict_inode
    2e16a1389b5a jfs: fix array-index-out-of-bounds in dbAdjTree
    7110650b85dd jfs: fix slab-out-of-bounds Read in dtSearch
    edff092a5926 UBSAN: array-index-out-of-bounds in dtSplitRoot
    6a44065dd604 FS:JFS:UBSAN:array-index-out-of-bounds in dbAdjTree
    fcecef9a84f6 thermal: core: Fix thermal zone suspend-resume synchronization
    410063c9e100 ACPI: APEI: set memory failure flags as MF_ACTION_REQUIRED on synchronous events
    0aedb319ef3e PM / devfreq: Synchronize devfreq_monitor_[start/stop]
    29482da8ffa1 kunit: tool: fix parsing of test attributes
    f6bda2950122 ACPI: NUMA: Fix the logic of getting the fake_pxm value
    a95c77f93606 selftests/nolibc: fix testcase status alignment
    f066171de33d ACPI: extlog: fix NULL pointer dereference check
    3bbbe5902229 PNP: ACPI: fix fortify warning
    abd97ccfb3d3 ACPI: video: Add quirk for the Colorful X15 AT 23 Laptop
    129db2ded6e6 audit: Send netlink ACK before setting connection in auditd_set
    3023b44a304e regulator: core: Only increment use_count when enable_count changes
    d396f97648bf debugobjects: Stop accessing objects after releasing hash bucket lock
    814173380135 perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
    04c6948db0ff x86/mce: Mark fatal MCE's page as poison to avoid panic in the kdump kernel
    28b8ba8eebf2 powerpc/lib: Validate size for vector operations
    39ba91d29fdb powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARENT_HUGEPAGE
    f77cb0471ec0 x86/boot: Ignore NMIs during very early boot
    2074271ac73c powerpc/64s: Fix CONFIG_NUMA=n build due to create_section_mapping()
    82e40455715f powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
    641c67d59fd0 powerpc: Fix build error due to is_valid_bugaddr()
    fabdc0422cc5 drivers/perf: pmuv3: don't expose SW_INCR event in sysfs
    40a5dce893f0 arm64: irq: set the correct node for VMAP stack
    145febd85c3b powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
    c918aac94262 asm-generic: make sparse happy with odd-sized put_unaligned_*()
    55ae38ffa0f4 Documentation/sphinx: fix Python string escapes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index af8027c51a..0030be98ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f1ed79ed10e0107924041bfdb685230407343857"
-SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
+SRCREV_machine ?= "4076926df2ff94dd0b990acba799e95de5fb1c53"
+SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.15"
+LINUX_VERSION ?= "6.6.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 274d9a4456..511f2761c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.15"
+LINUX_VERSION ?= "6.6.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
+SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7a47bac057..594bee645e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "40ac68226069c0bff98d4b63ad65c8086d419f5a"
-SRCREV_machine:qemuarm64 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemuloongarch64 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemumips ?= "70e1400404bd19cd911c4fd853d5d784bf0ae3c6"
-SRCREV_machine:qemuppc ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemuriscv64 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemuriscv32 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemux86 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemux86-64 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:qemumips64 ?= "16005cbeaf56e311827be25638e0a9373c89d134"
-SRCREV_machine ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_meta ?= "7cb27442e4e282b48f7e4f746c971d3b044512df"
+SRCREV_machine:qemuarm ?= "daff911123b820eb23e9a0ee0b4e6b3c9820bfa4"
+SRCREV_machine:qemuarm64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemuloongarch64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemumips ?= "1de311a1699bb7351d826029b34a8dd087241fe6"
+SRCREV_machine:qemuppc ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemuriscv64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemuriscv32 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemux86 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemux86-64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_machine:qemumips64 ?= "d764bf0df085f9901e4466eec99442b5c48aa814"
+SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
+SRCREV_meta ?= "9b93e812d98c4709146f8f8fa24855a23ebbccb9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "51f354b815c44f1e423edb3f089ceece9bd26976"
+SRCREV_machine:class-devupstream ?= "eb3e299184cc4f40d4bd84fda269b3a20ddcff80"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.15"
+LINUX_VERSION ?= "6.6.16"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


