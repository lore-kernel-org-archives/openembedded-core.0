Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D09BC25B75
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:55 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.4012.1714704768082866145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3GrUnio;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7f1aa0b69ebso1120922241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704767; x=1715309567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MoeifV80l+qIzZ+OuZJQCNTCdtGOEw4dtLfdXYZTr4=;
        b=m3GrUnio58m//jXTDDmqvfpcHSWJsVeEuY4UP6/vaQn5RjZ6E4rHhP6dHj8GlInKY3
         vIEy8pqqZcvVTnIfn5IfHNWPOcedhNhJA3XoeWleq6eOnqm0Uv/c+MOH1JzSBdgzCMji
         qRZrzmB+XEaCeqRifaWdRBfAGDr0u/WReh2v4ehTjfJS+BGTRYfGJglj98bsNRuvrv6J
         pzvLbHZibvi/NO1DFz9cvvMi4trZjMP6KhykaVGPssV/PEMUPb2fvqK31/+wgKs8PM8B
         g498R0Cu/svbjpxL2vEA7brFkoHSdHZ4BYXAQzYghM+oijKBXCDntraAnBxBdRwjqoA1
         yPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704767; x=1715309567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MoeifV80l+qIzZ+OuZJQCNTCdtGOEw4dtLfdXYZTr4=;
        b=EaRarNF/ObwhMy7gCdwb+H3h1uxOCEFjX57mKJz8/lrkiutu+eGY00bedT16pCVH2l
         qHjMG8PQH1xi405ctBqKTFT91NnOg1rRbg8hzezb0LaV2oHWFJVEF6QUQr74cb5KtnDH
         5MNzJvO/R5yr8hAwW58dO58jrmfPi/VXOoO7vSAeeTIE8vGex9JlgZd26OhRwTbgzhHl
         /L3fVtEm7rDew/XXuS5ELuBHRNxG2KA1FFihtNhMIVplwHpcpagArBqtRUgVKyKz5D2D
         gQXeCQdJ6SlLoqsUYaV8vsTSZwXzlZZtzPNKtm06glYXDq1mHhTxZTzUkgDyXPR6oq00
         Tt1A==
X-Gm-Message-State: AOJu0Yzun0bw2/bRL1yU0vfaEXJ7cHlpRuF0/cqfiaN6MxLqHDNjvGMB
	gS/OBdpKF/vPOfp4RCcnJK7DnLyW/lmMMRbKNi03ozbZKGGPd5e4MHrCMQ==
X-Google-Smtp-Source: AGHT+IFn6WpJ4JD2j+peg6va/ZEtBio+pRw088ce3NgzCW3Ih3xIexk4bYkMDTcMV/wMt+5/GqTCHA==
X-Received: by 2002:a05:6102:21cb:b0:47a:23b9:d013 with SMTP id r11-20020a05610221cb00b0047a23b9d013mr1523974vsg.25.1714704766734;
        Thu, 02 May 2024 19:52:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/12] linux-yocto/5.15: update to v5.15.153
Date: Thu,  2 May 2024 22:52:33 -0400
Message-Id: <20240503025240.373184-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198948

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    9465fef4ae35 Linux 5.15.153
    d180150ea714 remoteproc: stm32: fix incorrect optional pointers
    85e26c4a74ff regmap: Add missing map->bus check
    c10fed329c1c spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
    839308cf7957 net: dsa: mt7530: fix handling of all link-local frames
    cb302aa9948d net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
    70424a8f4585 net: dsa: mt7530: fix handling of 802.1X PAE frames
    c210fb3c45d7 net: dsa: mt7530: fix handling of LLDP frames
    387daae8b092 bpf: report RCU QS in cpumap kthread
    2f1d402dcc01 net: report RCU QS on threaded NAPI repolling
    083657dc7cc7 rcu: add a helper to report consolidated flavor QS
    640dbf688ba9 netfilter: nf_tables: do not compare internal table flags on updates
    362508506bf5 netfilter: nft_set_pipapo: release elements in clone only from destroy path
    772f18ded0e2 octeontx2-af: Use separate handlers for interrupts
    8ffcd3ccdbda net/bnx2x: Prevent access to a freed page in page_pool
    f1e560cdb132 net: phy: fix phy_read_poll_timeout argument type in genphy_loopback
    5deee0f7c292 hsr: Handle failures in module init
    8c378cc522ae rds: introduce acquire/release ordering in acquire/release_in_xmit()
    d691be84ab89 wireguard: receive: annotate data-race around receiving_counter.counter
    2b2f8d166fcc vdpa/mlx5: Allow CVQ size changes
    4d61084c5cfd net: dsa: mt7530: prevent possible incorrect XTAL frequency selection
    f85c87a80328 net: veth: do not manipulate GRO when using XDP
    d35b62c224e7 packet: annotate data-races around ignore_outgoing
    9fcadd125044 net: ethernet: mtk_eth_soc: fix PPE hanging issue
    448cc8b5f743 net: mediatek: mtk_eth_soc: clear MAC_MCR_FORCE_LINK only when MAC is up
    c5c0760adc26 net: mtk_eth_soc: move MAC_MCR setting to mac_finish()
    a809bbfd0e50 hsr: Fix uninit-value access in hsr_get_node()
    ccafa081bece soc: fsl: dpio: fix kcalloc() argument order
    4b9d72498df0 s390/vtime: fix average steal time calculation
    8fdc7b408a55 octeontx2-af: Use matching wake_up API variant in CGX command interface
    aa5ab5ce3496 nouveau: reset the bo resource bus info after an eviction
    deb5946255e0 io_uring: don't save/restore iowait state
    1049fa4d02fd usb: gadget: net2272: Use irqflags in the call to net2272_probe_fin
    463c429bdd56 staging: greybus: fix get_channel_from_mode() failure path
    6c619223aa21 serial: 8250_exar: Don't remove GPIO device on suspend
    f867ba8ea1f3 rtc: mt6397: select IRQ_DOMAIN instead of depending on it
    04dd61330fe8 kconfig: fix infinite loop when expanding a macro at the end of file
    3019ad4a0282 arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells
    c220378081ca tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
    e6011abe0cc1 serial: max310x: fix syntax error in IRQ error message
    19b21318377e tty: vt: fix 20 vs 0x20 typo in EScsiignore
    ea34c1c1f317 remoteproc: stm32: Fix incorrect type assignment returned by stm32_rproc_get_loaded_rsc_tablef
    dd68756ae351 remoteproc: stm32: Fix incorrect type in assignment for va
    a48c24ccc6b9 remoteproc: stm32: use correct format strings on 64-bit
    da0ad1bdc659 comedi: comedi_test: Prevent timers rescheduling during deletion
    a6ffae61ad9e afs: Revert "afs: Hide silly-rename files from userspace"
    fa3ac8b1a227 f2fs: compress: fix reserve_cblocks counting error when out of space
    6ca2ea698d47 NFS: Fix an off by one in root_nfs_cat()
    704dc0138718 watchdog: stm32_iwdg: initialize default timeout
    446f55d0d4f0 NFSv4.2: fix listxattr maximum XDR buffer size
    9d52865ff282 NFSv4.2: fix nfs4_listxattr kernel BUG at mm/usercopy.c:102
    6233dbe9ca1c net: sunrpc: Fix an off by one in rpc_sockaddr2uaddr()
    83edcda1d855 scsi: bfa: Fix function pointer type mismatch for hcb_qe->cbfn
    16a5bed6d265 RDMA/rtrs-clt: Check strnlen return len in sysfs mpath_policy_store()
    ed3e66d86ec3 RDMA/device: Fix a race between mad_client and cm_client init
    a27984f631e8 scsi: csiostor: Avoid function pointer casts
    4a411fc3363f f2fs: compress: fix to check unreleased compressed cluster
    7d420eaaa18e f2fs: compress: fix to cover normal cluster write with cp_rwsem
    ed22aef701f4 f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
    b2713af17ac9 f2fs: invalidate meta pages only for post_read required inode
    6117d8b79f48 f2fs: fix to invalidate META_MAPPING before DIO write
    5d553a56de27 f2fs: replace congestion_wait() calls with io_schedule_timeout()
    bc7e7e7d647c f2fs: invalidate META_MAPPING before IPU/DIO write
    4a543790fdc3 f2fs: multidevice: support direct IO
    6413e78086ca RDMA/srpt: Do not register event handler until srpt device is fully setup
    9af1658ba293 ALSA: usb-audio: Stop parsing channels bits when all channels are found.
    e9fbee067379 ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
    01511ac7be8e clk: zynq: Prevent null pointer dereference caused by kmalloc failure
    0efb9ef6fb95 clk: Fix clk_core_get NULL dereference
    d83d70b25d2d sparc32: Fix section mismatch in leon_pci_grpci
    e4723c6b3e79 backlight: lp8788: Fully initialize backlight_properties during probe
    73f547f2598a backlight: lm3639: Fully initialize backlight_properties during probe
    d01286f9911c backlight: da9052: Fully initialize backlight_properties during probe
    28e37f97b161 backlight: lm3630a: Don't set bl->props.brightness in get_brightness
    a80fb03dda21 backlight: lm3630a: Initialize backlight_properties on init
    f28b72162f05 leds: sgm3140: Add missing timer cleanup and flash gpio control
    663dea03055d leds: aw2013: Unlock mutex before destroying it
    d63abda6c8b3 powerpc/embedded6xx: Fix no previous prototype for avr_uart_send() etc.
    6a3d4afc5499 modules: wait do_free_init correctly
    a91eef04a775 module: Add support for default value for module async_probe
    6304ed16038d drm/msm/dpu: add division of drm_display_mode's hskew parameter
    f4108b28dce0 powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
    9beec711a172 drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
    e5aaa9f8dbc5 media: mediatek: vcodec: avoid -Wcast-function-type-strict warning
    24e51d6eb578 media: ttpci: fix two memleaks in budget_av_attach
    790fa2c04dfb media: go7007: fix a memleak in go7007_load_encoder
    d20b64f156de media: dvb-frontends: avoid stack overflow warnings with clang
    eb6e9dce979c media: pvrusb2: fix uaf in pvr2_context_set_notify
    d8e83a625cee drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
    815d1f1c6714 HID: amd_sfh: Update HPD sensor structure elements
    8abf014e0c79 ASoC: meson: axg-tdm-interface: add frame rate constraint
    844101226143 ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
    e3adf12624bb mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
    7178a272490d mtd: maps: physmap-core: fix flash size larger than 32-bit
    3ae4bd815fd3 drm/tidss: Fix initial plane zpos values
    9cc746346dc5 crypto: arm/sha - fix function cast warnings
    010cf12f596a mfd: altera-sysmgr: Call of_node_put() only when of_parse_phandle() takes a ref
    1d50e295784e mfd: syscon: Call of_node_put() only when of_parse_phandle() takes a ref
    240c4f1159f7 drm/tegra: put drm_gem_object ref on error in tegra_fb_create
    3f8445f1c746 clk: hisilicon: hi3559a: Fix an erroneous devm_kfree()
    62d92b3507fe clk: hisilicon: hi3519: Release the correct number of gates in hi3519_clk_unregister()
    118a7113db31 PCI: Mark 3ware-9650SE Root Port Extended Tags as broken
    754646012867 drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
    4e37c5342236 clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
    fe68cf273906 media: pvrusb2: fix pvr2_stream_callback casts
    4f2a1657f9ab media: pvrusb2: remove redundant NULL check
    8e19050ab9b9 media: go7007: add check of return value of go7007_read_addr()
    b1d0eebaf87c media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
    f27bcdae5730 media: sun8i-di: Fix chroma difference threshold
    de09db4e5d10 media: sun8i-di: Fix power on/off sequences
    4bdc1b352ec0 media: sun8i-di: Fix coefficient writes
    a62b9f3d7bbf NTB: fix possible name leak in ntb_register_device()
    87d306cdeb9e NTB: EPF: fix possible memory leak in pci_vntb_probe()
    e2b6ef72b7ae PCI: endpoint: Support NTB transfer between RC and EP
    caf5cf099016 powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
    4eb47ae93f4d ASoC: meson: t9015: fix function pointer type mismatch
    a3fec4744621 ASoC: meson: aiu: fix function pointer type mismatch
    a26425b7624d ASoC: meson: Use dev_err_probe() helper
    3d1d02973414 perf stat: Avoid metric-only segv
    3cae4f4153d3 ALSA: seq: fix function cast warnings
    7378234eeeac drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
    abb9bea45b43 perf thread_map: Free strlist on normal path in thread_map__new_by_tid_str()
    03e6d4e94843 crypto: xilinx - call finalize with bh disabled
    ce6e3c04119b PCI: switchtec: Fix an error handling path in switchtec_pci_probe()
    0bdb56eae235 PCI/P2PDMA: Fix a sleeping issue in a RCU read section
    56cad01c5463 quota: Fix rcu annotations of inode dquot pointers
    1ca72a3de915 quota: Fix potential NULL pointer dereference
    f2ddd8103f00 quota: simplify drop_dquot_ref()
    f630ba2386c8 clk: qcom: reset: Ensure write completion on reset de/assertion
    e5bb4f4324e9 clk: qcom: reset: Commonize the de/assert functions
    e8c71db0d8f1 pinctrl: mediatek: Drop bogus slew rate register range for MT8192
    0d3fe80b6d17 media: edia: dvbdev: fix a use-after-free
    dc866b69cc51 media: v4l2-mem2mem: fix a memleak in v4l2_m2m_register_entity
    770a57922ce3 media: v4l2-tpg: fix some memleaks in tpg_alloc
    e9d05d5d8411 media: em28xx: annotate unchecked call to media_device_register()
    a03ed00787b0 clk: meson: Add missing clocks to axg_clk_regmaps
    54985391dec2 perf evsel: Fix duplicate initialization of data->id in evsel__parse_sample()
    6ac7c7a3a9ab drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
    440f05983741 drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
    d54877c83528 HID: lenovo: Add middleclick_workaround sysfs knob for cptkbd
    d9f8bbc6d7cf perf record: Fix possible incorrect free in record__switch_output()
    87658f16082b PCI/DPC: Print all TLP Prefixes, not just the first
    b8505a1aee8f media: tc358743: register v4l2 async device only after successful setup
    4c309e06aa90 dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
    746606d37d66 drm/lima: fix a memleak in lima_heap_alloc
    1bb5fea94e62 drm/rockchip: lvds: do not print scary message when probing defer
    f3afb5361819 drm/rockchip: lvds: do not overwrite error code
    03b1072616a8 drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node
    5eaa1597e231 drm/ttm: add ttm_resource_fini v2
    2fa491a1f4a8 drm: Don't treat 0 as -1 in drm_fixp2int_ceil
    c780f00854af drm/rockchip: inno_hdmi: Fix video timing
    13c121279941 drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()
    5c8dc26e31b8 drm/tegra: rgb: Fix missing clk_put() in the error handling paths of tegra_dc_rgb_probe()
    7ec1d3cab93e drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
    527bf2adf012 drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+
    bfd52f7df633 drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
    1d2f14eb47ad drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
    26827907c27e drm/tegra: dsi: Make use of the helper function dev_err_probe()
    56ec754fd767 drm/tegra: dpaux: Fix PM disable depth imbalance in tegra_dpaux_probe
    49ebcae0b9b8 drm/tegra: dpaux: Populate AUX bus
    93128052bf83 drm/tegra: dsi: Add missing check for of_find_device_by_node
    03ad5ad53e51 dm: call the resume method on internal suspend
    85177297117c dm raid: fix false positive for requeue needed during reshape
    0d387dc503f9 nfp: flower: handle acti_netdevs allocation failure
    3538d11d2a06 net/x25: fix incorrect parameter validation in the x25_getsockopt() function
    382df231ab3d net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
    3a32dce1adcd udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
    6482113f9c75 l2tp: fix incorrect parameter validation in the pppol2tp_getsockopt() function
    3988110ecf68 ipmr: fix incorrect parameter validation in the ip_mroute_getsockopt() function
    71ce163f3e91 bpf: net: Change do_ip_getsockopt() to take the sockptr_t argument
    07aa35a50fe6 bpf: net: Change sk_getsockopt() to take the sockptr_t argument
    25e5c9b20e0a net: Change sock_getsockopt() to take the sk ptr instead of the sock ptr
    400298502354 tcp: fix incorrect parameter validation in the do_tcp_getsockopt() function
    c09fc67777b8 OPP: debugfs: Fix warning around icc_get_name()
    78a60f910353 net: phy: dp83822: Fix RGMII TX delay configuration
    fedd8c7d29f4 net: phy: DP83822: enable rgmii mode if phy_interface_is_rgmii
    f82d65e8f7ff net: hns3: fix port duplex configure error in IMP reset
    23ec1cec2429 net: hns3: fix kernel crash when 1588 is received on HIP08 devices
    0e939a002c8a net: phy: fix phy_get_internal_delay accessing an empty array
    5c03387021cf net: ip_tunnel: make sure to pull inner header in ip_tunnel_rcv()
    65fb1d271cbc ipv6: fib6_rules: flush route cache when rule is changed
    ca1f06e72dec bpf: Fix stackmap overflow check on 32-bit arches
    3b08cfc65f07 bpf: Fix hashtab overflow check on 32-bit arches
    c826502bed93 bpf: Fix DEVMAP_HASH overflow check on 32-bit arches
    276873ae26c8 sr9800: Add check for usbnet_get_endpoints
    2e845867b4e2 Bluetooth: hci_core: Fix possible buffer overflow
    89c69e83ff0a Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()
    9609476b3a16 Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
    88f846f352b8 Bluetooth: Remove superfluous call to hci_conn_check_pending()
    4b5dc615f1cf igb: Fix missing time sync events
    5cd7afd64b6e igb: move PEROUT and EXTTS isr logic to separate functions
    d70f1c85113c iommu/vt-d: Don't issue ATS Invalidation request when device is disconnected
    626b03daea32 PCI: Make pci_dev_is_disconnected() helper public for other drivers
    4137f25b5351 wifi: rtw88: 8821c: Fix false alarm count
    250a78863cdf mmc: wmt-sdmmc: remove an incorrect release_mem_region() call in the .remove function
    dd292e884c64 SUNRPC: fix some memleaks in gssx_dec_option_array
    c7cff9780297 x86, relocs: Ignore relocations in .notes section
    40876d07d292 ACPI: scan: Fix device check notification handling
    10e607fbc91b ACPI: resource: Add MAIBENBEN X577 to irq1_edge_low_force_override
    cc06efd8a6be ACPI: resource: Do IRQ override on Lunnen Ground laptops
    b53985826190 ACPI: resource: Add Infinity laptops to irq1_edge_low_force_override
    95531c0d3727 arm64: dts: marvell: reorder crypto interrupts on Armada SoCs
    941c6ee6f77d ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node
    ff54c712f046 ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
    3ebcd8f11aa8 ARM: dts: imx6dl-yapp4: Move phy reset into switch node
    ce92a8c7cf70 arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
    a022251c2f95 arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
    3c0cc753d798 ARM: dts: arm: realview: Fix development chip ROM compatible value
    276f4abe4e5b net: ena: Remove ena_select_queue
    90613c76f71c wifi: brcmsmac: avoid function pointer casts
    b96bc1b25963 iommu/amd: Mark interrupt as managed
    6a87552d0a81 bus: tegra-aconnect: Update dependency to ARCH_TEGRA
    1cbaf4c793b0 ACPI: processor_idle: Fix memory leak in acpi_processor_power_exit()
    fe20e3d56bc9 wifi: wilc1000: prevent use-after-free on vif when cleaning up all interfaces
    0454915c836b wireless: Remove redundant 'flush_workqueue()' calls
    487eff913ea9 bpf: Mark bpf_spin_{lock,unlock}() helpers with notrace correctly
    fcd58c69a372 arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
    e66285df73c0 arm64: dts: mt8183: Move CrosEC base detection node to kukui-based DTs
    657633a0b5f5 arm64: dts: mt8183: kukui: Split out keyboard node and describe detachables
    ecec357981ec arm64: dts: mt8183: kukui: Add Type C node
    9d159d6637cc ipv6: mcast: remove one synchronize_net() barrier in ipv6_mc_down()
    a6a50788b46b s390/vdso: drop '-fPIC' from LDFLAGS
    f94625ec5747 wifi: iwlwifi: mvm: don't set replay counters to 0xff
    4745cba3703c pwm: sti: Fix capture for st,pwm-num-chan < st,capture-num-chan
    55908ea9812e pwm: sti: Implement .apply() callback
    e888c4461e10 wifi: libertas: fix some memleaks in lbs_allocate_cmd_buffer()
    d20d45631feb net: blackhole_dev: fix build warning for ethh set but not used
    95ac8e3ef2a3 pwm: atmel-hlcdc: Fix clock imbalance related to suspend support
    a1716999f8ae pwm: atmel-hlcdc: Use consistent variable naming
    81f0b319f0d4 pwm: atmel-hlcdc: Convert to platform remove callback returning void
    98b0d4693934 arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
    128a7fb7e84b wifi: iwlwifi: fix EWRD table validity check
    96aa40761673 wifi: iwlwifi: dbg-tlv: ensure NUL termination
    3a5d424cffa2 wifi: iwlwifi: mvm: report beacon protection failures
    f8ff4b4df71e wifi: ath9k: delay all of ath9k_wmi_event_tasklet() until init is complete
    4287534cb520 arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL board
    d01012b6d6bc arm64: dts: imx8mm-kontron: Use the VSELECT signal to switch SD card IO voltage
    41af98f22083 arm64: dts: imx8mm-kontron: Add support for ultra high speed modes on SD card
    db25bbd2c294 arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL board
    f7e55ad75245 arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on SL/BL i.MX8MM
    d7fcdcf4ec35 cpufreq: mediatek-hw: Don't error out if supply is not found
    8a029ee1e392 af_unix: Annotate data-race of gc_in_progress in wait_for_unix_gc().
    e0d29c4def15 bpftool: Silence build warning about calloc()
    3b71a6981ef8 inet_diag: annotate data-races around inet_diag_table[]
    00d40ab2c03f sock_diag: annotate data-races around sock_diag_handlers[family]
    0f632a68804d cpufreq: mediatek-hw: Wait for CPU supplies before probing
    2cb670b272dd cpufreq: Explicitly include correct DT includes
    d951cf510fb0 cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
    f75e3536dbbc wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()
    df78377485ef wifi: wilc1000: fix multi-vif management when deleting a vif
    ac512507ac89 wifi: rtl8xxxu: add cancel_work_sync() for c2hcmd_work
    d80fc436751c wifi: wilc1000: fix RCU usage in connect path
    11b564991b53 wifi: wilc1000: fix declarations ordering
    bc4bc7464639 wifi: b43: Disable QoS for bcm4331
    66ef38ad9754 wifi: b43: Stop correct queue in DMA worker when QoS is disabled
    b05f6cd6c069 wifi: b43: Stop/wake correct queue in PIO Tx path when QoS is disabled
    04a2b6eff2ae wifi: b43: Stop/wake correct queue in DMA Tx path when QoS is disabled
    4c4e592266b6 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
    b10ff1130fa4 sched/fair: Take the scheduling domain into account in select_idle_core()
    3c1122aee91e timekeeping: Fix cross-timestamp interpolation for non-x86
    aa74fd5ccb8b timekeeping: Fix cross-timestamp interpolation corner case decision
    48c70f35f6a6 timekeeping: Fix cross-timestamp interpolation on counter wrap
    7dd09fa80b07 aoe: fix the potential use-after-free problem in aoecmd_cfg_pkts
    53609f5c0592 rtc: test: Fix invalid format specifier.
    3eafb6816dcb time: test: Fix incorrect format specifier
    770332c1fd0a lib/cmdline: Fix an invalid format specifier in an assertion msg
    01db522d003f md: Don't clear MD_CLOSING when the raid is about to stop
    25d99f7baa13 fs/select: rework stack allocation hack for clang
    98e60b538e66 nbd: null check for nla_nest_start
    edbdb0d94143 s390/dasd: fix double module refcount decrement
    bb126ed29f4e s390/dasd: Use dev_*() for device log messages
    3404d535bdc2 s390/dasd: add autoquiesce feature
    932600a295cc s390/dasd: add copy pair setup
    2c42dab80a03 s390/dasd: add query PPRC function
    815348211f30 s390/dasd: put block allocation in separate function
    423b6bdf19bb do_sys_name_to_handle(): use kzalloc() to fix kernel-infoleak
    50982ce0f177 ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
    2a239a9487f7 ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
    648bd8ef211d ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
    aa345a4d9b32 Input: gpio_keys_polled - suppress deferred probe error for gpio
    4bd9d06bdff7 ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet
    91b4bfed82c4 firewire: core: use long bus reset on gap count error
    8d1753973f59 Bluetooth: rfcomm: Fix null-ptr-deref in rfcomm_check_security
    9a1de3adf7d1 drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series
    c4e2f6081506 ALSA: hda/realtek - ALC285 reduce pop noise from Headphone port
    d157b06c1030 scsi: mpt3sas: Prevent sending diag_reset when the controller is ready
    0c255fb9b1a6 dm-verity, dm-crypt: align "struct bvec_iter" correctly
    f6cbb4843c61 block: sed-opal: handle empty atoms when parsing response
    d7c5c0335a9a parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
    59be50a37f37 net/iucv: fix the allocation size of iucv_path_table array
    e8a67fe34b76 x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()
    e2d5cf0dcb9f x86/mm: Move is_vsyscall_vaddr() into asm/vsyscall.h
    7e13a78e2ba4 riscv: dts: sifive: add missing #interrupt-cells to pmic
    cf71090a5941 RDMA/mlx5: Relax DEVX access upon modify commands
    60ba938a8bc8 RDMA/mlx5: Fix fortify source warning while accessing Eth segment
    e524979a8a3b gen_compile_commands: fix invalid escape sequence warning
    802eb0254fc1 HID: multitouch: Add required quirk for Synaptics 0xcddc device
    581d99d2f688 MIPS: Clear Cause.BD in instruction_pointer_set
    8082bccb7ac4 x86/xen: Add some null pointer checking to smp.c
    333de5a9753e ASoC: rt5645: Make LattePanda board DMI match more precise
    0d7cfe2ef5a7 selftests: tls: use exact comparison in recv_partial
    37d98fb9c314 bpf: Defer the free of inner map when necessary
    d8140159a214 rcu-tasks: Provide rcu_trace_implies_rcu_gp()
    d909d381c315 io_uring: drop any code related to SCM_RIGHTS
    9dd3863e3fcd io_uring/unix: drop usage of io_uring socket
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b04b2cc0c4..5ad7febb20 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "79e97202861289d2981a843bbc582a779195a735"
-SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
+SRCREV_machine ?= "bf104e8f5db008e45d982ff2d96b136e619be9ee"
+SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.152"
+LINUX_VERSION ?= "5.15.153"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f7b79b7395..a55ad58eaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.152"
+LINUX_VERSION ?= "5.15.153"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fdf03d698861bfa0f1403c1edda25343f675f3ee"
-SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
+SRCREV_machine ?= "4ef577ca14a247aa0c3283ad1fc3f5c9dcc80e63"
+SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1f89065b3b..8026be18a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "af0142e57319b881b5edb6a855b23b453859a66f"
-SRCREV_machine:qemuarm64 ?= "617055b77747babfeb22acd52962ec2c498e0589"
-SRCREV_machine:qemumips ?= "2a603975d4255ef5f59936905b3d42334a80f86f"
-SRCREV_machine:qemuppc ?= "b49c46381f7ff40b25fe9cdc4713007aff565cdb"
-SRCREV_machine:qemuriscv64 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
-SRCREV_machine:qemuriscv32 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
-SRCREV_machine:qemux86 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
-SRCREV_machine:qemux86-64 ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
-SRCREV_machine:qemumips64 ?= "87b43be50f7fd159ca2451d8eb81caee2fc22e11"
-SRCREV_machine ?= "1d307abeff1ecca864d5d978023a403b87e241cb"
-SRCREV_meta ?= "b2311094781ba22a890f766ca1a267f58ec7e51b"
+SRCREV_machine:qemuarm ?= "019dfee2a419e087baacbfca08d7bbb2bfd26ec5"
+SRCREV_machine:qemuarm64 ?= "17269f6b7e7ddf2178fb957f7e3f4c038de10f51"
+SRCREV_machine:qemumips ?= "a0b4f69bd55db8f36a749febbe952ed635677faf"
+SRCREV_machine:qemuppc ?= "9768dfa1dde96b13c14a40a7abb936217d8ac1ef"
+SRCREV_machine:qemuriscv64 ?= "163500b871852fd7eb5f148948583ca7bed338db"
+SRCREV_machine:qemuriscv32 ?= "163500b871852fd7eb5f148948583ca7bed338db"
+SRCREV_machine:qemux86 ?= "163500b871852fd7eb5f148948583ca7bed338db"
+SRCREV_machine:qemux86-64 ?= "163500b871852fd7eb5f148948583ca7bed338db"
+SRCREV_machine:qemumips64 ?= "5a278da2a79b5b84ce6bb6a6e19af7b1f30af0b2"
+SRCREV_machine ?= "163500b871852fd7eb5f148948583ca7bed338db"
+SRCREV_meta ?= "0b6359f487c6f8dc0d6adb061dd5afe476cc71a2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b95c01af211304429c11b8c8bdf791ab11f7f395"
+SRCREV_machine:class-devupstream ?= "9465fef4ae351749f7068da8c78af4ca27e61928"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.152"
+LINUX_VERSION ?= "5.15.153"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


