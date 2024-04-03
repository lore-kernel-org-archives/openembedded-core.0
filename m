Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E750ECD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 18:18:08 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.19159.1712168282343655433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 11:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YpC9znax;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e673ffbd79so90146a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712168281; x=1712773081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQdOMzztbAFu83mgLp5IAEjz+ScSV+Y8g/MM9rOxKAQ=;
        b=YpC9znaxtVgUdPTs2HYKnXjnjCPBDzYsImRVq/CMGBsrx1QzRrLenZ4zDWQaAyFIHK
         Q3zwRAorrhaUjTqFVdYqQ9bgzF6CAVGqoqC7wB8TGaSTvETNRMz1BKvNPw077dVyYVSQ
         2vN+iBa3v0hcJ8ec2uy6cxjA+hx9EgSEo6tdL6EuIBr1dboCHXz19HmAgdjVrYyuiGkv
         qMxBj/tSVdp3xoyUlEIste2Pz6UyjP9p3ZcrPjKGM0QinXHEhgT0zOwTClRhPxetTRHw
         0++ufDQDng4Jio1kqdba5gxDblz7RKdHuIwa3b75JKRz1a8f3s0bNaASYmCLBIzm5c+I
         TXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168281; x=1712773081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQdOMzztbAFu83mgLp5IAEjz+ScSV+Y8g/MM9rOxKAQ=;
        b=jms2NeKOG46AkXuTvLfulK1uV8qMv20wn63w7Hjir4y1smB9oTr7L8sPikMEcWQVLL
         k8p9jKS69bjvcmZ1Cz084mBXPNsWDmPdmFsVODXljeAHeFPG0AhswQN/kQAjn/T06DJV
         NoWV6uvRXLBxCsjT6U9VFvZ1ud0+zmJBjX/M6F9GapBCaZof0nWzIHegpwbGIDqe/6Mu
         WLRDC/0dho9wkBK3yE0SDvIyuHPedQFywgYtkoV7B/vcamSWcaeCyfDPiw0NyR+5Fp/R
         uiVy4eUE88cloXZJWX0sijWfbTTE6bXuek+xunIkuGqtRHGyowr06QEL7hT7SfrFyWj+
         PRzQ==
X-Gm-Message-State: AOJu0YzoQiU0GElvATlmI66Hsyv+q3/+sNRHJRh4eyRujVKl+qo1n5xU
	64klzv0bng1FWhbNZN55hav2XWg7CsTk5MraP1hDJ6LU3X18OSEAVHsiakAS
X-Google-Smtp-Source: AGHT+IFDFfEf7wmO7AWxBr5dB5cOOZIn3pFg+UfYceuFdFXMw09pmnN9msEKCKC8Bx4Z7tS2p7hmRw==
X-Received: by 2002:a05:6870:ec94:b0:22a:4249:f409 with SMTP id eo20-20020a056870ec9400b0022a4249f409mr130792oab.4.1712168281155;
        Wed, 03 Apr 2024 11:18:01 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id pj33-20020a05620a1da100b0078a0774d1basm5259324qkn.15.2024.04.03.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:18:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: update to v5.4.273
Date: Wed,  3 Apr 2024 14:17:59 -0400
Message-Id: <20240403181759.1577471-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 18:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197938

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    24489321d0cd Linux 5.4.273
    b37f030486d5 regmap: Add missing map->bus check
    55f8ea6731aa spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
    59426454b812 bpf: report RCU QS in cpumap kthread
    3ffe591b27fc rcu: add a helper to report consolidated flavor QS
    2531f907d3e4 netfilter: nf_tables: do not compare internal table flags on updates
    71002d9eb1ca ARM: dts: sun8i-h2-plus-bananapi-m2-zero: add regulator nodes vcc-dram and vcc1v2
    94cb17e5cf3a octeontx2-af: Use separate handlers for interrupts
    4f37d3a7e004 net/bnx2x: Prevent access to a freed page in page_pool
    69f9f55891ef hsr: Handle failures in module init
    f781fb5177cd rds: introduce acquire/release ordering in acquire/release_in_xmit()
    84c510411e32 packet: annotate data-races around ignore_outgoing
    889ed056eae7 hsr: Fix uninit-value access in hsr_get_node()
    48cef94b6910 s390/vtime: fix average steal time calculation
    305c31b9707d octeontx2-af: Use matching wake_up API variant in CGX command interface
    b63362b317a8 usb: gadget: net2272: Use irqflags in the call to net2272_probe_fin
    254b27c4ae2d staging: greybus: fix get_channel_from_mode() failure path
    f6bf49e76f05 serial: 8250_exar: Don't remove GPIO device on suspend
    8dd52ab78fd3 rtc: mt6397: select IRQ_DOMAIN instead of depending on it
    ca6279d1a1ee kconfig: fix infinite loop when expanding a macro at the end of file
    a8cc354a8155 tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
    f1c9a0c33814 serial: max310x: fix syntax error in IRQ error message
    bd2f4df25945 tty: vt: fix 20 vs 0x20 typo in EScsiignore
    854ebf45a4dd afs: Revert "afs: Hide silly-rename files from userspace"
    afcbba70bf55 NFS: Fix an off by one in root_nfs_cat()
    bcc3ec2bdbda watchdog: stm32_iwdg: initialize default timeout
    e95eeb7f7d8c net: sunrpc: Fix an off by one in rpc_sockaddr2uaddr()
    3b8415daaad2 scsi: bfa: Fix function pointer type mismatch for hcb_qe->cbfn
    2b38dbd7facd RDMA/device: Fix a race between mad_client and cm_client init
    39b1af7bc99d scsi: csiostor: Avoid function pointer casts
    6d5dc96b154b ALSA: usb-audio: Stop parsing channels bits when all channels are found.
    d7ae7d126568 clk: Fix clk_core_get NULL dereference
    a1129b09228f sparc32: Fix section mismatch in leon_pci_grpci
    c8c038beb40c backlight: lp8788: Fully initialize backlight_properties during probe
    8c351a9ef5f5 backlight: lm3639: Fully initialize backlight_properties during probe
    12a0153f78c7 backlight: da9052: Fully initialize backlight_properties during probe
    1c8d8c6b4e70 backlight: lm3630a: Don't set bl->props.brightness in get_brightness
    40a89f1bc42d backlight: lm3630a: Initialize backlight_properties on init
    bb9981f915b9 powerpc/embedded6xx: Fix no previous prototype for avr_uart_send() etc.
    a6e96cc26560 drm/msm/dpu: add division of drm_display_mode's hskew parameter
    41eec45c7126 powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
    dfde84cc6c58 drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
    af37aed04997 media: ttpci: fix two memleaks in budget_av_attach
    353f980a5d7a media: media/pci: rename VFL_TYPE_GRABBER to _VIDEO
    fa83fca55cbe media: rename VFL_TYPE_GRABBER to _VIDEO
    25f576552133 media: v4l2-core: correctly validate video and metadata ioctls
    291cda0b805f media: go7007: fix a memleak in go7007_load_encoder
    fa8b472952ef media: dvb-frontends: avoid stack overflow warnings with clang
    d29ed08964ce media: pvrusb2: fix uaf in pvr2_context_set_notify
    86c10c56f253 drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
    23d57b99ca3f ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
    8df143c608fc mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
    d9d4d1363bb1 mtd: maps: physmap-core: fix flash size larger than 32-bit
    a8c73f0439f3 crypto: arm/sha - fix function cast warnings
    4b6569e14226 mfd: altera-sysmgr: Call of_node_put() only when of_parse_phandle() takes a ref
    ac1170674d54 mfd: syscon: Call of_node_put() only when of_parse_phandle() takes a ref
    3472fa83d97e drm/tegra: put drm_gem_object ref on error in tegra_fb_create
    f27aaaecf747 clk: hisilicon: hi3519: Release the correct number of gates in hi3519_clk_unregister()
    44163c73b0dd PCI: Mark 3ware-9650SE Root Port Extended Tags as broken
    9b074f2ed117 drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
    2e1120e48062 clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
    d2f3c762bad0 media: pvrusb2: fix pvr2_stream_callback casts
    e9d391cc70d3 media: pvrusb2: remove redundant NULL check
    013fb5051821 media: go7007: add check of return value of go7007_read_addr()
    8c2e4efe1278 media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
    cf9580863292 perf stat: Avoid metric-only segv
    9e411c40bd1b ALSA: seq: fix function cast warnings
    a0ae3335b365 drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
    9df9108a9144 perf thread_map: Free strlist on normal path in thread_map__new_by_tid_str()
    79ab81939318 PCI: switchtec: Fix an error handling path in switchtec_pci_probe()
    00b07b4962fd quota: Fix rcu annotations of inode dquot pointers
    49669f8e7eb0 quota: Fix potential NULL pointer dereference
    ff29b5f9f019 quota: simplify drop_dquot_ref()
    68435ffc1c1a clk: qcom: reset: Ensure write completion on reset de/assertion
    026d3984a169 clk: qcom: reset: Commonize the de/assert functions
    48846ddc715c clk: qcom: reset: support resetting multiple bits
    7f82802d47b0 clk: qcom: reset: Allow specifying custom reset delay
    f20c3270f3ed media: edia: dvbdev: fix a use-after-free
    0175f2d34c85 media: v4l2-mem2mem: fix a memleak in v4l2_m2m_register_entity
    8269ab16415f media: v4l2-tpg: fix some memleaks in tpg_alloc
    2e6892b2be82 media: em28xx: annotate unchecked call to media_device_register()
    639155da9bd1 perf evsel: Fix duplicate initialization of data->id in evsel__parse_sample()
    e019d87e02f1 drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
    1d4d67417353 perf record: Fix possible incorrect free in record__switch_output()
    adc8a9167660 PCI/DPC: Print all TLP Prefixes, not just the first
    daf21394f989 media: tc358743: register v4l2 async device only after successful setup
    ba34d8a5aa85 dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
    cc31a90eb79f drm/rockchip: lvds: do not overwrite error code
    f1dfd026cdb5 drm: Don't treat 0 as -1 in drm_fixp2int_ceil
    b061b28b66c6 drm/rockchip: inno_hdmi: Fix video timing
    91dc47cd72f2 drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()
    030d46f85971 drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
    b4cb57ec2c2b drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
    e04e773fb868 drm/tegra: dsi: Make use of the helper function dev_err_probe()
    85f28e98c5e8 gpu: host1x: mipi: Update tegra_mipi_request() to be node based
    f05631a8525c drm/tegra: dsi: Add missing check for of_find_device_by_node
    da7ece219710 dm: call the resume method on internal suspend
    6070692ea3e6 dm raid: fix false positive for requeue needed during reshape
    3b1e8a617eb0 nfp: flower: handle acti_netdevs allocation failure
    e06f0d3f66e5 net/x25: fix incorrect parameter validation in the x25_getsockopt() function
    26843eefcfdd net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
    b9979cae626f udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
    1bd08e531473 l2tp: fix incorrect parameter validation in the pppol2tp_getsockopt() function
    2e7f3cabc698 tcp: fix incorrect parameter validation in the do_tcp_getsockopt() function
    fb6639c7489b net: hns3: fix port duplex configure error in IMP reset
    ec6bb01e02cb net: ip_tunnel: make sure to pull inner header in ip_tunnel_rcv()
    a9f5faf28e30 ipv6: fib6_rules: flush route cache when rule is changed
    21e5fa4688e1 bpf: Fix stackmap overflow check on 32-bit arches
    92c81fbb3ed2 bpf: Fix hashtab overflow check on 32-bit arches
    8a8b6a24684b sr9800: Add check for usbnet_get_endpoints
    54a03e4ac1a4 Bluetooth: hci_core: Fix possible buffer overflow
    f6177a17236f Bluetooth: Remove superfluous call to hci_conn_check_pending()
    03df15b579fc igb: Fix missing time sync events
    141897c5b0d4 igb: move PEROUT and EXTTS isr logic to separate functions
    8081d80a9255 mmc: wmt-sdmmc: remove an incorrect release_mem_region() call in the .remove function
    bfa9d86d39a0 SUNRPC: fix some memleaks in gssx_dec_option_array
    52018aa146e3 x86, relocs: Ignore relocations in .notes section
    450ac90ed453 ACPI: scan: Fix device check notification handling
    33b498a123af ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node
    0655698da80a ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
    8deafa61fbdc ARM: dts: imx6dl-yapp4: Move phy reset into switch node
    174e3c8ee7de ARM: dts: arm: realview: Fix development chip ROM compatible value
    de8abc894bbe net: ena: Remove ena_select_queue
    f434eacad6bd net: ena: cosmetic: fix line break issues
    a4fc14a6623d wifi: brcmsmac: avoid function pointer casts
    6234e09e692e iommu/amd: Mark interrupt as managed
    073b5bbb1361 bus: tegra-aconnect: Update dependency to ARCH_TEGRA
    ea96bf3f8062 ACPI: processor_idle: Fix memory leak in acpi_processor_power_exit()
    2eb2a5d6f5ed arm64: dts: qcom: msm8996: Pad addresses
    a8f365065671 arm64: dts: qcom: msm8996: Move regulator consumers to db820c
    1f685fa06c5e arm64: dts: qcom: msm8996: Use node references in db820c
    adcf4eeb34de arm64: dts: qcom: db820c: Move non-soc entries out of /soc
    6bbbd2fd086a bpf: Mark bpf_spin_{lock,unlock}() helpers with notrace correctly
    6f51d61a4383 bpf: Factor out bpf_spin_lock into helpers.
    cf0d888ea7a1 bpf: Add typecast to bpf helpers to help BTF generation
    e1f7fef6e224 arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
    bea9573c795a wifi: libertas: fix some memleaks in lbs_allocate_cmd_buffer()
    6fd90614971b net: blackhole_dev: fix build warning for ethh set but not used
    ef036a0598fa af_unix: Annotate data-race of gc_in_progress in wait_for_unix_gc().
    4bdfc38a983d sock_diag: annotate data-races around sock_diag_handlers[family]
    76ac9c141e10 wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()
    e556006de4ea wifi: wilc1000: fix RCU usage in connect path
    1bda3ff1fdb7 wifi: wilc1000: fix declarations ordering
    8c6210d175eb wifi: b43: Disable QoS for bcm4331
    12062b149f29 wifi: b43: Stop correct queue in DMA worker when QoS is disabled
    c668f0f8255d b43: main: Fix use true/false for bool type
    47ec637b118f wifi: b43: Stop/wake correct queue in PIO Tx path when QoS is disabled
    31aaf17200c3 wifi: b43: Stop/wake correct queue in DMA Tx path when QoS is disabled
    801be44049f8 b43: dma: Fix use true/false for bool type variable
    88a9dffaec77 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
    be269709808c timekeeping: Fix cross-timestamp interpolation for non-x86
    fee4e84c4ea2 timekeeping: Fix cross-timestamp interpolation corner case decision
    7cec7d83882c timekeeping: Fix cross-timestamp interpolation on counter wrap
    1a54aa506b3b aoe: fix the potential use-after-free problem in aoecmd_cfg_pkts
    72dacc72b25c fs/select: rework stack allocation hack for clang
    44214d744be3 nbd: null check for nla_nest_start
    772a7def9868 do_sys_name_to_handle(): use kzalloc() to fix kernel-infoleak
    3f6186cc654c ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
    9f27f4d5d1f4 ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
    f1d3be9eb980 ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
    5f3c13930bda Input: gpio_keys_polled - suppress deferred probe error for gpio
    fa14a1537362 ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet
    da17f556ad18 firewire: core: use long bus reset on gap count error
    5f369efd9d96 Bluetooth: rfcomm: Fix null-ptr-deref in rfcomm_check_security
    6e9c11399240 scsi: mpt3sas: Prevent sending diag_reset when the controller is ready
    2daa2a8e895e btrfs: fix data race at btrfs_use_block_rsv() when accessing block reserve
    890a1b31fa2b dm-verity, dm-crypt: align "struct bvec_iter" correctly
    5d8afc25c771 block: sed-opal: handle empty atoms when parsing response
    745718d00f13 parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
    b43b1a706233 net/iucv: fix the allocation size of iucv_path_table array
    c411a3c828de RDMA/mlx5: Relax DEVX access upon modify commands
    69dd0a99daff HID: multitouch: Add required quirk for Synaptics 0xcddc device
    7d7fa0bea3bf MIPS: Clear Cause.BD in instruction_pointer_set
    025a8a96c7ef x86/xen: Add some null pointer checking to smp.c
    4c00abb52a24 ASoC: rt5645: Make LattePanda board DMI match more precise
    ef5de5d5057f selftests: tls: use exact comparison in recv_partial
    cfb24022bb2c io_uring: drop any code related to SCM_RIGHTS
    2692b8a01667 io_uring/unix: drop usage of io_uring socket
    84075826304f Linux 5.4.272
    345ced405207 arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
    1b3d8cbd1cae arm64: dts: qcom: add PDC interrupt controller for SDM845
    59b3583da128 serial: max310x: fix IO data corruption in batched operations
    f5c252aaa1be serial: max310x: implement I2C support
    112094efd6fb serial: max310x: make accessing revision id interface-agnostic
    b96b01791911 regmap: Add bulk read/write callbacks into regmap_config
    758c6799da46 regmap: allow to define reg_update_bits for no bus configuration
    9a7bbea2666c serial: max310x: Unprepare and disable clock in error path
    664a6a904afe getrusage: use sig->stats_lock rather than lock_task_sighand()
    2b34f6038350 getrusage: use __for_each_thread()
    c50a0594312c getrusage: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    ef8a8b36a16b getrusage: add the "signal_struct *sig" local variable
    f184f2197832 y2038: rusage: use __kernel_old_timeval
    c7441c77c91e hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
    f2ab3eaa6470 hv_netvsc: use netif_is_bond_master() instead of open code
    9b5ef7a52896 hv_netvsc: Make netvsc/VF binding check both MAC and serial number
    5402ec577f9d Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
    bf6bb3612e5d serial: max310x: prevent infinite while() loop in port startup
    7e30e5c1439b serial: max310x: use a separate regmap for each port
    3fb7c9bcd0c1 serial: max310x: use regmap methods for SPI batch operations
    2c9c830d74a7 serial: max310x: Make use of device properties
    b765176ae1b9 serial: max310x: fail probe if clock crystal is unstable
    816700131e8b serial: max310x: Try to get crystal clock rate from property
    c76dcad53ba1 serial: max310x: Use devm_clk_get_optional() to get the input clock
    b569d91e5180 um: allow not setting extra rpaths in the linux binary
    47c68edecca2 selftests: mm: fix map_hugetlb failure on 64K page size systems
    f9055fa2b293 netrom: Fix data-races around sysctl_net_busy_read
    07bbccd1adb5 netrom: Fix a data-race around sysctl_netrom_link_fails_count
    c4309e5f8e80 netrom: Fix a data-race around sysctl_netrom_routing_control
    cbba77abb4a5 netrom: Fix a data-race around sysctl_netrom_transport_no_activity_timeout
    89aa78a34340 netrom: Fix a data-race around sysctl_netrom_transport_requested_window_size
    1f60795dcafc netrom: Fix a data-race around sysctl_netrom_transport_busy_delay
    80578681ea27 netrom: Fix a data-race around sysctl_netrom_transport_acknowledge_delay
    f716a6823424 netrom: Fix a data-race around sysctl_netrom_transport_maximum_tries
    eadec8da4451 netrom: Fix a data-race around sysctl_netrom_transport_timeout
    eda02a0bed55 netrom: Fix data-races around sysctl_netrom_network_ttl_initialiser
    1e84b108f2a7 netrom: Fix a data-race around sysctl_netrom_obsolescence_count_initialiser
    7f615232556f netrom: Fix a data-race around sysctl_netrom_default_path_quality
    4bafcc43baf7 netfilter: nf_conntrack_h323: Add protection for bmp length out of range
    6ec303202229 netfilter: nft_ct: fix l3num expectations with inet pseudo family
    997efea2bf3a net/rds: fix WARNING in rds_conn_connect_if_down
    664f9c647260 net/ipv6: avoid possible UAF in ip6_route_mpath_notify()
    d9fefc511331 net: ice: Fix potential NULL pointer dereference in ice_bridge_setlink()
    59d2a4076983 geneve: make sure to pull inner header in geneve_rx()
    a248b1f58a70 ixgbe: {dis, en}able irqs in ixgbe_txrx_ring_{dis, en}able
    7f087784692d net: lan78xx: fix runtime PM count underflow on link stop
    81934a2ab51d lan78xx: Fix race conditions in suspend/resume handling
    57b9c48cd534 lan78xx: Fix partial packet errors on suspend/resume
    e68b46e9aa0e lan78xx: Add missing return code checks
    b1cc23ffe1a2 lan78xx: Fix white space and style issues
    3fec063b052e Linux 5.4.271
    9162730a83ed gpio: 74x164: Enable output pins after registers are reset
    1dde8ef4b7a7 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
    037d5a949b04 cachefiles: fix memory leak in cachefiles_add_cache()
    ace0fdf796bf x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    9d660e5adf28 mmc: core: Fix eMMC initialization with 1-bit bus connection
    3cc5fb824c21 dmaengine: fsl-qdma: init irq after reg initialization
    518d78b4fac6 dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    c6652e20d7d7 btrfs: dev-replace: properly validate device names
    0cfbb26ee5e7 wifi: nl80211: reject iftype change with mesh ID change
    ec92aa2cab6f gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    5c78be006ed9 afs: Fix endless loop in directory parsing
    26dda65b096c ALSA: Drop leftover snd-rtctimer stuff from Makefile
    7394abc8926a power: supply: bq27xxx-i2c: Do not free non existing IRQ
    950d4d74d311 efi/capsule-loader: fix incorrect allocation size
    b9fbc44159df rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    260410c589e2 netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    20f6f150e126 Bluetooth: Enforce validation on max value of connection interval
    79820a7e1e05 Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    98fb98fd37e4 Bluetooth: Avoid potential use-after-free in hci_error_reset
    6e0000a43293 net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    69624e28d640 lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    9d4ffb5b9d87 ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    f5f11f7e2872 tun: Fix xdp_rxq_info's queue_index when detaching
    f81e94d2dcd2 net: ip_tunnel: prevent perpetual headroom growth
    9ae51361da43 netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    e133c1ee6d72 Linux 5.4.270
    7a54338219f0 scripts/bpf: Fix xdp_md forward declaration typo
    b4eea7a05ee0 fs/aio: Restrict kiocb_set_cancel_fn() to I/O submitted via libaio
    c28fc1aa6f82 drm/syncobj: call drm_syncobj_fence_add_wait when WAIT_AVAILABLE flag is set
    29db9725f276 drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v3
    ae4360cbd385 netfilter: nf_tables: set dormant flag on hook register failure
    f310143961e2 tls: stop recv() if initial process_rx_list gave us non-DATA
    a26742ada7ee tls: rx: drop pointless else after goto
    c1287c1d6b55 tls: rx: jump to a more appropriate label
    06de2302549f s390: use the correct count for __iowrite64_copy()
    7eee00feb60d packet: move from strlcpy with unused retval to strscpy
    82831e3ff76e ipv6: sr: fix possible use-after-free and null-ptr-deref
    5c27d85a69fa afs: Increase buffer size in afs_update_volume_status()
    799a4afaa54c ipv6: properly combine dev_base_seq and ipv6.dev_addr_genid
    5888f3424907 ipv4: properly combine dev_base_seq and ipv4.dev_addr_genid
    a50cb1d6f350 nouveau: fix function cast warnings
    fe031dfcea8d scsi: jazz_esp: Only build if SCSI core is builtin
    dd90af71fa7a bpf, scripts: Correct GPL license name
    1f18b5bb4511 scripts/bpf: teach bpf_helpers_doc.py to dump BPF helper definitions
    48ebca0a117b RDMA/srpt: fix function pointer cast warnings
    310763377471 RDMA/srpt: Make debug output more detailed
    6e461952df6e RDMA/bnxt_re: Return error for SRQ resize
    cecfb90cf71d IB/hfi1: Fix a memleak in init_credit_return
    bbcf72333b13 usb: roles: don't get/set_role() when usb_role_switch is unregistered
    a31cf46d108d usb: gadget: ncm: Avoid dropping datagrams of properly parsed NTBs
    aad6132ae6e4 usb: cdns3: fix memory double free when handle zero packet
    cfa9abb5570c usb: cdns3: fixed memory use after free at cdns3_gadget_ep_disable()
    999a8bb70da2 ARM: ep93xx: Add terminator to gpiod_lookup_table
    c1d3a84a67db l2tp: pass correct message length to ip6_append_data
    caf4a67c0131 PCI/MSI: Prevent MSI hardware interrupt number truncation
    f8cbd1791900 gtp: fix use-after-free and null-ptr-deref in gtp_genl_dump_pdp()
    0dccbb93538f dm-crypt: don't modify the data when using authenticated encryption
    5833024a9856 IB/hfi1: Fix sdma.h tx->num_descs off-by-one error
    6ede985c6b56 PCI: tegra: Fix OF node reference leak
    e04a2afd081f PCI: tegra: Fix reporting GPIO error value
    e3fc08091148 arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
    efd63c23a4bb drm/amdgpu: Fix type of second parameter in trans_msg() callback
    f691ab24cf19 iomap: Set all uptodate bits for an Uptodate page
    45227ae32f23 dm-integrity: don't modify bio's immutable bio_vec in integrity_metadata()
    3770c38cd6a6 x86/alternatives: Disable KASAN in apply_alternatives()
    f45dc10a3c87 drm/amdgpu: Check for valid number of registers to read
    90aa9135a472 Revert "drm/sun4i: dsi: Change the start delay calculation"
    7000efb6d8bc ALSA: hda/realtek - Enable micmute LED on and HP system
    82c53047fe8c selftests/bpf: Avoid running unprivileged tests with alignment requirements
    81e03f638dd4 net: bridge: clear bridge's private skb space on xmit
    82174d6bd79f spi: mt7621: Fix an error message in mt7621_spi_probe()
    954a7a0011d9 pinctrl: rockchip: Fix refcount leak in rockchip_pinctrl_parse_groups
    759756e2cfaf pinctrl: pinctrl-rockchip: Fix a bunch of kerneldoc misdemeanours
    99dc56854559 tcp: add annotations around sk->sk_shutdown accesses
    41ca93861627 tcp: return EPOLLOUT from tcp_poll only when notsent_bytes is half the limit
    5a9dc14df2ef tcp: factor out __tcp_close() helper
    d42867642006 pmdomain: renesas: r8a77980-sysc: CR7 must be always on
    3bc35da66722 s390/qeth: Fix potential loss of L3-IP@ in case of network issues
    b7bfaea8f5ec virtio-blk: Ensure no requests in virtqueues before deleting vqs.
    d124ab01fc5c firewire: core: send bus reset promptly on gap count error
    b5854f923d41 scsi: lpfc: Use unsigned type for num_sge
    60635f8a0542 hwmon: (coretemp) Enlarge per package core count limit
    6d338fb1a1f6 nvmet-fc: abort command when there is no binding
    ac524b7b3f4e netfilter: conntrack: check SCTP_CID_SHUTDOWN_ACK for vtag setting in sctp_new
    6f5015ce25e6 ASoC: sunxi: sun4i-spdif: Add support for Allwinner H616
    c3a25d4fdd9a nvmet-tcp: fix nvme tcp ida memory leak
    5068cb91ed0c regulator: pwm-regulator: Add validity checks in continuous .get_voltage
    6b92b1bc16d6 ext4: avoid allocating blocks from corrupted group in ext4_mb_find_by_goal()
    260fc96283c0 ext4: avoid allocating blocks from corrupted group in ext4_mb_try_best_found()
    bccb418eba5e ahci: add 43-bit DMA address quirk for ASMedia ASM1061 controllers
    e896bf487871 ahci: asm1166: correct count of reported ports
    6db07619d173 fbdev: sis: Error out if pixclock equals zero
    84dce0f6a4cc fbdev: savage: Error out if pixclock equals zero
    85720b69aef1 wifi: mac80211: fix race condition on enabling fast-xmit
    d3032de2c830 wifi: cfg80211: fix missing interfaces when dumping
    bb3813a6a755 dmaengine: fsl-qdma: increase size of 'irq_name'
    a7229c75c357 dmaengine: shdma: increase size of 'dev_id'
    11f3fe5001ed scsi: target: core: Add TMF to tmr_list handling
    d2fc4134aa06 sched/rt: Disallow writing invalid values to sched_rt_period_us
    b69677bfd77d sched/rt: Fix sysctl_sched_rr_timeslice intial value
    429aaf144b07 userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
    b0911b8d37cd nilfs2: replace WARN_ONs for invalid DAT metadata block requests
    febd74320015 memcg: add refcnt for pcpu stock to avoid UAF problem in drain_all_stock()
    d7b5bdb52d60 sched/rt: sysctl_sched_rr_timeslice show default timeslice after reset
    010dc505eab3 net/sched: Retire dsmark qdisc
    40e8abb86d96 net/sched: Retire ATM qdisc
    493685f3dddd net/sched: Retire CBQ qdisc
    9d17e7350403 KVM: arm64: vgic-its: Test for valid IRQ in MOVALL handler
    68799371c9c1 KVM: arm64: vgic-its: Test for valid IRQ in its_sync_lpi_pending_table()
    6e1f54a4985b Linux 5.4.269
    e9aa8e5a72bd of: gpio unittest kfree() wrong object
    6ac8965955fa of: unittest: fix EXPECT text for gpio hog errors
    7dd275ce3b9a net: bcmgenet: Fix EEE implementation
    10c586da9f17 Revert "Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting""
    25b42be4e067 netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()
    3dd76bebcd59 lsm: new security_file_ioctl_compat() hook
    efdf644062db drm/msm/dsi: Enable runtime PM
    fef59ee6c057 PM: runtime: Have devm_pm_runtime_enable() handle pm_runtime_dont_use_autosuspend()
    835ed5effb60 PM: runtime: add devm_pm_runtime_enable helper
    d31c8721e816 nilfs2: fix potential bug in end_buffer_async_write
    2441a64070b8 sched/membarrier: reduce the ability to hammer on sys_membarrier
    cd1022eaf87b net: prevent mss overflow in skb_segment()
    6587af96effb netfilter: ipset: Missing gc cancellations fixed
    c7f2733e5011 netfilter: ipset: fix performance regression in swap operation
    d04acadb6490 KVM: arm64: vgic-its: Avoid potential UAF in LPI translation cache
    4705a9fc50f3 mips: Fix max_mapnr being uninitialized on early stages
    5e0854b60a96 arch, mm: remove stale mentions of DISCONIGMEM
    c324e2716de3 bus: moxtet: Add spi device table
    7f71d9817cea Revert "md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d"
    60e092289c49 tracing: Inform kmemleak of saved_cmdlines allocation
    fbe86124b7d6 pmdomain: core: Move the unused cleanup to a _sync initcall
    08de58abedf6 can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
    a257ffde374a irqchip/irq-brcmstb-l2: Add write memory barrier before exit
    91a7c002351d nfp: flower: prevent re-adding mac index for bonded port
    b22c9a37c75a nfp: use correct macro for LengthSelect in BAR config
    862ee4422c38 nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
    a6efe6dbaaf5 nilfs2: fix data corruption in dsync block recovery for small block sizes
    6ce7d5e6d246 ALSA: hda/conexant: Add quirk for SWS JS201D
    6b8bdc509eee mmc: slot-gpio: Allow non-sleeping GPIO ro
    4f2fde50517d x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    4c7b1d08ad56 x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
    ed14ab2611be serial: max310x: improve crystal stable clock detection
    5814a9045c61 serial: max310x: set default value when reading clock ready bit
    ef60665ea981 ring-buffer: Clean ring_buffer_poll_wait() error return
    7200170e88e3 iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
    720d0112b39b staging: iio: ad5933: fix type mismatch regression
    77e7a316cd8d tracing: Fix wasted memory in saved_cmdlines logic
    afbcad9ae7d6 ext4: fix double-free of blocks due to wrong extents moved_len
    15238f4b21a0 misc: fastrpc: Mark all sessions as invalid in cb_remove
    42beab162dce binder: signal epoll threads of self-work
    93a52449fe9d ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
    9086b27eac64 xen-netback: properly sync TX responses
    71349abe3aba nfc: nci: free rx_data_reassembly skb on NCI device cleanup
    4ae191effbc1 kbuild: Fix changing ELF file type for output of gen_btf for big endian
    750a4e599930 firewire: core: correct documentation of fw_csr_string() kernel API
    2209fc6e3d77 scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
    d074d5ff5ae7 i2c: i801: Fix block process call transactions
    4de1489d8092 i2c: i801: Remove i801_set_block_buffer_mode
    df112ccb9b12 usb: f_mass_storage: forbid async queue when shutdown happen
    addaa8627fcd USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
    dbaca8fa9ec2 HID: wacom: Do not register input devices until after hid_hw_start
    e13bed5cfe02 HID: wacom: generic: Avoid reporting a serial of '0' to userspace
    1f12e4b3284d mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
    8ffd5590f4d6 tracing/trigger: Fix to return error if failed to alloc snapshot
    a67f1f83f315 i40e: Fix waiting for queues of all VSIs to be disabled
    9a3a82affa1c MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
    422d5243b9f7 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
    91b48c633969 spi: ppc4xx: Drop write-only variable
    61da1f41d0b5 of: unittest: Fix compile in the non-dynamic case
    f6997a2416b0 of: unittest: add overlay gpio test to catch gpio hog problem
    89485251f687 btrfs: send: return EOPNOTSUPP on unknown flags
    863837df8a94 btrfs: forbid deleting live subvol qgroup
    d25031ba2a40 btrfs: forbid creating subvol qgroups
    10e9cb393136 netfilter: nft_set_rbtree: skip end interval element from gc
    7fde2acc6d4b net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    b9ff931f0019 net: stmmac: xgmac: use #define for string constants
    88c7e1e7a6b8 vhost: use kzalloc() instead of kmalloc() followed by memset()
    09e77c7d671d Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
    a012efe0df04 hrtimer: Report offline hrtimer enqueue
    4a589de93cfc USB: serial: cp210x: add ID for IMST iM871A-USB
    cd0ab7f2a824 USB: serial: option: add Fibocom FM101-GL variant
    896695af51a5 USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
    11ca9624cca8 net/af_iucv: clean up a try_then_request_module()
    1c7488156e9a netfilter: nft_ct: reject direction for ct id
    8e2a84c6daaf netfilter: nft_compat: restrict match/target protocol to u16
    f139a4c6d209 netfilter: nft_compat: reject unused compat flag
    56fae81633cc ppp_async: limit MRU to 64K
    6f70f0b41245 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
    ef1f56f2cd9f rxrpc: Fix response to PING RESPONSE ACKs to a dead call
    5993f121fbc0 inet: read sk->sk_family once in inet_recv_error()
    7c96975c24cf hwmon: (coretemp) Fix bogus core_id to attr name mapping
    1eb74c00c9c3 hwmon: (coretemp) Fix out-of-bounds memory access
    51d76b723021 hwmon: (aspeed-pwm-tacho) mutex for tach reading
    df0965935aa7 atm: idt77252: fix a memleak in open_card_ubr0
    a0ac20fd5329 selftests: net: avoid just another constant wait
    e9837c83befb net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    8398d8d735ee phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
    0cb90f27a347 dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
    6ff482731530 phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
    1c75fe450b52 dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
    c26360941643 dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
    817bedcd7f32 bonding: remove print in bond_verify_device_path
    e95120698b51 HID: apple: Add 2021 magic keyboard FN key mapping
    5991ab8940c1 HID: apple: Swap the Fn and Left Control keys on Apple keyboards
    6d4771ab2d9e HID: apple: Add support for the 2021 Magic Keyboard
    67f56ef9e114 net: sysfs: Fix /sys/class/net/<iface> path
    b169ffde733c af_unix: fix lockdep positive in sk_diag_dump_icons()
    b3dace37f116 net: ipv4: fix a memleak in ip_setup_cork
    f549f340c91f netfilter: nft_ct: sanitize layer 3 and 4 protocol number in custom expectations
    06608603faed netfilter: nf_log: replace BUG_ON by WARN_ON_ONCE when putting logger
    64babb17e815 llc: call sock_orphan() at release time
    2a09d1784c47 ipv6: Ensure natural alignment of const ipv6 loopback and router addresses
    7f1a24914b6d ixgbe: Fix an error handling path in ixgbe_read_iosf_sb_reg_x550()
    a10e95d6cf40 ixgbe: Refactor overtemp event handling
    2d533ddca21d ixgbe: Refactor returning internal error codes
    980c806f673c ixgbe: Remove non-inclusive language
    7c03b7486597 net: remove unneeded break
    b81f679ac561 scsi: isci: Fix an error code problem in isci_io_request_build()
    12f58dce48cf wifi: cfg80211: fix RCU dereference in __cfg80211_bss_update
    ad2bd6cd17c3 perf: Fix the nr_addr_filters fix
    34da3b9fa508 drm/amdgpu: Release 'adev->pm.fw' before return in 'amdgpu_device_need_post()'
    6ab4fd508fad ceph: fix deadlock or deadcode of misusing dget()
    ecd7744a1446 blk-mq: fix IO hang from sbitmap wakeup race
    977105472f81 virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
    884b746209ed libsubcmd: Fix memory leak in uniq()
    3e06e9b906bc PCI/AER: Decode Requester ID when no error info found
    133bf750d75e fs/kernfs/dir: obey S_ISGID
    17c252f19270 usb: hub: Replace hardcoded quirk value with BIT() macro
    d8c293549946 PCI: switchtec: Fix stdev_release() crash after surprise hot remove
    a32a24da0e1b PCI: Only override AMD USB controller if required
    e2048eb3cbdd mfd: ti_am335x_tscadc: Fix TI SoC dependencies
    838cbe01db12 i3c: master: cdns: Update maximum prescaler value for i2c clock
    a6946682ddcb um: net: Fix return type of uml_net_start_xmit()
    c8115f2bd8ef um: Don't use vfprintf() for os_info()
    735a29ce08ab um: Fix naming clash between UML and scheduler
    ddd1f258f0d3 leds: trigger: panic: Don't register panic notifier if creating the trigger failed
    9052b3e0e789 drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'
    548f9a37d777 drm/amdgpu: Let KFD sync with VM fences
    15d674571af0 clk: mmp: pxa168: Fix memory leak in pxa168_clk_init()
    105444e207d4 clk: hi3620: Fix memory leak in hi3620_mmc_clk_init()
    8a96f1caf1f4 drm/msm/dpu: Ratelimit framedone timeout msgs
    4d181fe96646 media: ddbridge: fix an error code problem in ddb_probe
    615e3adc2042 IB/ipoib: Fix mcast list locking
    fb703d31fde5 drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
    c1b2e5e83772 ALSA: hda: Intel: add HDA_ARL PCI ID support
    c91bda92fbb1 PCI: add INTEL_HDA_ARL to pci_ids.h
    fbbee078cfb6 media: rockchip: rga: fix swizzling for RGB formats
    acb1bffe5fac media: stk1160: Fixed high volume of stk1160_dbg messages
    67997250d321 drm/mipi-dsi: Fix detach call without attach
    d778e10dde4f drm/framebuffer: Fix use of uninitialized variable
    da980f8db04e drm/drm_file: fix use of uninitialized variable
    00a5feb0603f RDMA/IPoIB: Fix error code return in ipoib_mcast_join
    b0f907a4efeb fast_dput(): handle underflows gracefully
    12ba5b9cf87c ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
    9fceaf8182d4 f2fs: fix to check return value of f2fs_reserve_new_block()
    52240224e74a wifi: cfg80211: free beacon_ies when overridden from hidden BSS
    18c2989c30b1 wifi: rtlwifi: rtl8723{be,ae}: using calculate_bit_shift()
    8ec36f2d0cb6 wifi: rtl8xxxu: Add additional USB IDs for RTL8192EU devices
    f3b7a31bf115 arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
    c3f22192a2b3 arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
    351b37b88ed0 md: Whenassemble the array, consult the superblock of the freshest device
    6f2cd02ff5b2 block: prevent an integer overflow in bvec_try_merge_hw_page
    fb9c25ea0a5f ARM: dts: imx23/28: Fix the DMA controller node name
    c48e75a7ee24 ARM: dts: imx23-sansa: Use preferred i2c-gpios properties
    83b1cceca9b0 ARM: dts: imx27-apf27dev: Fix LED name
    06c3f5920fe9 ARM: dts: imx25/27: Pass timing0
    826e8fa48e0f ARM: dts: imx1: Fix sram node
    05f309a3fae0 ARM: dts: imx27: Fix sram node
    1e35a4cf5a64 ARM: dts: imx: Use flash@0,0 pattern
    30cfab1c8c7e ARM: dts: imx25/27-eukrea: Fix RTC node name
    ca14da9a1eca ARM: dts: rockchip: fix rk3036 hdmi ports node
    e9ac3e3398a5 scsi: libfc: Fix up timeout error in fc_fcp_rec_error()
    f5a875051e48 scsi: libfc: Don't schedule abort twice
    eb6f68ec92ab bpf: Add map and need_defer parameters to .map_fd_put_ptr()
    f11f0fd1ad6c wifi: ath9k: Fix potential array-index-out-of-bounds read in ath9k_htc_txstatus()
    53dd674b3238 ARM: dts: imx7s: Fix nand-controller #size-cells
    a86ce3671d4a ARM: dts: imx7s: Fix lcdif compatible
    183edc0ad297 ARM: dts: imx7d: Fix coresight funnel ports
    6c50e561ce97 bonding: return -ENOMEM instead of BUG in alb_upper_dev_walk
    4d981d9224df PCI: Add no PM reset quirk for NVIDIA Spectrum devices
    0e8c8aa8e3ce scsi: lpfc: Fix possible file string name overflow when updating firmware
    cbd0b6268a77 selftests/bpf: Fix pyperf180 compilation failure with clang18
    982bdaa0fcbd selftests/bpf: satisfy compiler by having explicit return in btf test
    e1f113b57ddd wifi: rt2x00: restart beacon queue when hardware reset
    b183fe8702e7 ext4: avoid online resizing failures due to oversized flex bg
    92c3c5cfed57 ext4: remove unnecessary check from alloc_flex_gd()
    7cb19e13362b ext4: unify the type of flexbg_size to unsigned int
    360c28a2fd31 ext4: fix inconsistent between segment fstrim and full fstrim
    ec1075549613 ecryptfs: Reject casefold directory inodes
    7a96d85bf196 SUNRPC: Fix a suspicious RCU usage warning
    5e63c9ae8055 KVM: s390: fix setting of fpc register
    6d0822f2cc9b s390/ptrace: handle setting of fpc register correctly
    de6a91aed1e0 jfs: fix array-index-out-of-bounds in diNewExt
    592d29eb6bd9 rxrpc_find_service_conn_rcu: fix the usage of read_seqbegin_or_lock()
    f4a0b57632fa afs: fix the usage of read_seqbegin_or_lock() in afs_find_server*()
    3f4cba4cf82d crypto: stm32/crc32 - fix parsing list of devices
    e9f6ac508901 pstore/ram: Fix crash when setting number of cpus to an odd number
    93df0a2a0b3c jfs: fix uaf in jfs_evict_inode
    3f8217c323fd jfs: fix array-index-out-of-bounds in dbAdjTree
    1b9d6828589d jfs: fix slab-out-of-bounds Read in dtSearch
    fd3486a89377 UBSAN: array-index-out-of-bounds in dtSplitRoot
    98f9537fe61b FS:JFS:UBSAN:array-index-out-of-bounds in dbAdjTree
    d2049af7ddbc ACPI: extlog: fix NULL pointer dereference check
    0d2adafba97a PNP: ACPI: fix fortify warning
    b0b96859abe7 ACPI: video: Add quirk for the Colorful X15 AT 23 Laptop
    20277842d911 audit: Send netlink ACK before setting connection in auditd_set
    27756ae36645 regulator: core: Only increment use_count when enable_count changes
    aed181fbc2e2 perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
    980d5fe989e0 x86/mce: Mark fatal MCE's page as poison to avoid panic in the kdump kernel
    0580f4403ad3 powerpc/lib: Validate size for vector operations
    7cd81d23586e powerpc: pmd_move_must_withdraw() is only needed for CONFIG_TRANSPARENT_HUGEPAGE
    9bf6c6f0974b powerpc/mm: Fix build failures due to arch_reserved_kernel_pages()
    171468044b6d powerpc: Fix build error due to is_valid_bugaddr()
    f6781add1c31 powerpc/mm: Fix null-pointer dereference in pgtable_cache_add
    3cdbfac1068f x86/entry/ia32: Ensure s32 is sign extended to s64
    aa8bd0d9b2c9 tick/sched: Preserve number of idle sleeps across CPU hotplug events
    200d17b226a1 mips: Call lose_fpu(0) before initializing fcr31 in mips_set_personality_nan
    b2b0d40775cc spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
    344e8f33927a gpio: eic-sprd: Clear interrupt after set the interrupt type
    f81d67832cf5 drm/exynos: gsc: minor fix for loop iteration in gsc_runtime_resume
    83d86b4a77d0 drm/exynos: fix accidental on-stack copy of exynos_drm_plane
    3e835d6e6564 drm/bridge: nxp-ptn3460: simplify some error checking
    021e214947d5 drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
    9dd334a82450 drm: Don't unref the same fb many times by mistake due to deadlock handling
    5624d628a1e4 gpiolib: acpi: Ignore touchpad wakeup on GPD G1619-04
    4e66422f1b56 netfilter: nf_tables: reject QUEUE/DROP verdict parameters
    bd517df3bdad rbd: don't move requests to the running list on errors
    69a087625203 btrfs: defrag: reject unknown flags of btrfs_ioctl_defrag_range_args
    d0bf04c9654c btrfs: don't warn if discard range is not aligned to sector
    927d1a3d3278 btrfs: tree-checker: fix inline ref size in error messages
    5c9e576bfda9 btrfs: ref-verify: free ref cache before clearing mount opt
    d3d6162eb1e5 net: fec: fix the unhandled context fault from smmu
    3422bfda9203 fjes: fix memleaks in fjes_hw_setup
    07bcc3cd3d91 netfilter: nf_tables: validate NFPROTO_* family
    b55e492f06f5 netfilter: nf_tables: restrict anonymous set and map names to 16 bytes
    2501afe6c4c9 net/mlx5e: fix a double-free in arfs_create_groups
    bca555e8a240 net/mlx5: Use kfree(ft->g) in arfs_create_groups()
    0917d771f6e5 net/mlx5: DR, Use the right GVMI number for drop action
    4f4dc7098bdf netlink: fix potential sleeping issue in mqueue_flush_file
    da70948068bc tcp: Add memory barrier to tcp_push()
    01d15b68f041 afs: Hide silly-rename files from userspace
    dad9b28f675e tracing: Ensure visibility when inserting an element into tracing_map
    a37ae111db5e net/rds: Fix UBSAN: array-index-out-of-bounds in rds_cmsg_recv
    b8e8838f82f3 llc: Drop support for ETH_P_TR_802_2.
    b643d0defcba llc: make llc_ui_sendmsg() more robust against bonding changes
    06f30fdbc4cf vlan: skip nested type that is not IFLA_VLAN_QOS_MAPPING
    1fea9969b81c net/smc: fix illegal rmb_desc access in SMC-D connection dump
    5c6183f3c748 x86/CPU/AMD: Fix disabling XSAVES on AMD family 0x17 due to erratum
    7e180b702aab powerpc: Use always instead of always-y in for crtsavres.o
    457ef4fe541c fs: move S_ISGID stripping into the vfs_*() helpers
    0cb0093fd6a2 fs: add mode_strip_sgid() helper
    635a0039e87e mtd: spinand: macronix: Fix MX35LFxGE4AD page size
    3f4e660144ed block: Remove special-casing of compound pages
    0785e298996c rename(): fix the locking of subdirectories
    f0824ca28317 ubifs: ubifs_symlink: Fix memleak of inode->i_link in error path
    a1e80a33bf75 nouveau/vmm: don't set addr on the fail path to avoid warning
    f49f9e802785 mmc: core: Use mrq.sbc in close-ended ffu
    e15b1553d032 arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
    830c99794b44 parisc/firmware: Fix F-extend for PDC addresses
    dd50fe18c234 rpmsg: virtio: Free driver_override when rpmsg_remove()
    5030d4c79886 hwrng: core - Fix page fault dead lock on mmap-ed hwrng
    5bc17b4fc2aa PM: hibernate: Enforce ordering during image compression/decompression
    cf6889bb8b56 crypto: api - Disallow identical driver names
    a7edaf40fcca ext4: allow for the last group to be marked as trimmed
    e2ecfd556542 serial: sc16is7xx: add check for unsupported SPI modes during probe
    120b65f80b8f spi: introduce SPI_MODE_X_MASK macro
    2b708e6b28f8 serial: sc16is7xx: set safe default SPI clock frequency
    e53321b341ab units: add the HZ macros
    34d74cf3c799 units: change from 'L' to 'UL'
    7478445a4547 units: Add Watt units
    b6179745482e include/linux/units.h: add helpers for kelvin to/from Celsius conversion
    2ed05a8cc9b0 PCI: mediatek: Clear interrupt status before dispatching handler
    dbf9e2bf8e76 Revert "rt: drop -stable migrate_disable"
    d7ed2aabdf71 rt: drop -stable migrate_disable
    9ae0a737b97c NFS: fix general protection fault in nfs_mount
    dafbace6032e x86/alternatives: Acquire pte lock with interrupts enabled
    31708c13e464 x86/entry: Emit a symbol for register restoring thunk
    9ad5defd9059 clear_warn_once: add a clear_warn_once= boot parameter
    fbda05a6df01 clear_warn_once: bind a timer to written reset value
    2365198f516a clear_warn_once: expand debugfs to include read support
    356914747645 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
    178189d65780 kprobes: Fix compiler warning for !CONFIG_KPROBES_ON_FTRACE
    706efec4c1e2 perf cs-etm: Move definition of 'traceid_list' global variable from header file
    48ab6faa417e defconfigs: drop obselete options
    1fe4ee7f680c libtraceevent: Fix build with binutils 2.35
    953da1f7e728 arm64: dts: ti: k3-am65-main: add sd wp-invert into k3-am65 dtb
    8c083fb78a3f Fix compiling warnings of file arm64/kernel/perf_callchain.c
    85f0a97f3aac eventfd: Enlarge recursion limit to allow vhost to work
    4a6bacba3689 perf: Fix the warning of perf_regs.c
    4b69a5a32098 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    c5dcdef27c57 arm64/perf: fix backtrace for AAPCS with FP enabled
    05f4afe8b669 Revert "uptime: allow the optional limiting of kernel runtime"
    157af3a61d56 tools/power turbostat: Support Tiger Lake
    008b46517c94 arm64: dts: ti: k3-am65-mcu:Update the power domain cells
    b658676c81a0 fixup! yaffs: Fix build warning by handling inode i_version with proper atomic API
    03142acba06e ARM: 8918/2: only build return_address() if needed
    9065d188f874 KVM: LAPIC: Mark hrtimer for period or oneshot mode to expire in hard interrupt context
    4cd12df48b83 selftest/bpf: Use CHECK macro instead of RET_IF
    84591c1cb409 Revert "selftests/bpf: Fix perf_buffer test on systems w/ offline CPUs"
    844b959f96bd Revert "selftests/bpf: Skip perf hw events test if the setup disabled it"
    45760a7e1301 Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
    e64f1a1d9447 yaffs2: fix memory leak when /proc/yaffs is read
    896b38b46db9 x86/mce: Add compat_ioctl assignment to make it compatible with 32-bit system
    06356153574a cpufreq: Fix policy initialization for internal governor drivers
    eb30339a5892 arm64: dts: k3-am6: Add FSS and OSPI nodes
    f03b2ab37a42 arm64: dts: ti: k3-am654-base-board: Add OSPI entry
    762a03109411 arm64: dts: ti: k3-am65-main: Enable support for sdhci1
    d8075838fe56 arm64: dts: ti: k3-am654-base-board: Add Support for SD card
    fc2d760470d1 arm64: dts: r8a7795-h3ulcb: Add reserved memory regions
    baab8b4b5235 arm64: dts: r8a7795: Add CPUIdle support for all CPU core
    f11171f18a03 pci: pcie-rcar: add regulators support
    638d6d5f6dd3 driver: net: can: disable clock when it is in enable status
    e5a7b62d0517 arch: arm64: dts: Set gpio5-pin9 as input by default
    f4d7dbafb103 perf: Make perf able to build with latest libbfd
    239eea7ef5dd mips: vdso: fix 'jalr $t9' crash in vdso code
    f7fe06ec7a59 linux-yocto linux-yocto-dev: Fix /bin/awk issues
    ced1c6effc4f yaffs: add strict check when call yaffs_internal_read_super
    9daa7e790501 yaffs: repair yaffs_get_mtd_device
    1fffb37acca0 yaffs: Fix build failure by handling inode i_version with proper atomic API
    0007c563276d yaffs2: fix memory leak in mount/umount
    e68cc08a6841 yaffs: Avoid setting any ACL releated xattr
    bcf077d933b8 Yaffs:check oob size before auto selecting Yaffs1
    19df313c0952 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    c769a7da8c69 yaffs2: adjust to proper location of MS_RDONLY
    0f1751fff1a7 mips: Kconfig: add QEMUMIPS64 option
    86f59bbc023c aufs5: core
    d1e47364cab1 aufs5: standalone
    74a8e4bf3f2b aufs5: mmap
    7e05613a5d85 aufs5: base
    aa75a790b542 aufs5: kbuild
    8c6f9b2baa40 yaffs2: import git revision b4ce1bb (jan, 2020)
    0381cd8f4359 perf: x86-32: explicitly include <errno.h>
    ad78324feafb perf: mips64: Convert __u64 to unsigned long long
    34cefcf34034 perf: fix bench numa compilation
    fdad3e366e6e perf annotate: replace 'expand' with equivalent sed expression
    a771eec901c6 perf: add SLANG_INC for slang.h
    e0614357c8a3 perf: add sgidefs.h to for mips builds
    ac92fa579b2b perf: change --root to --prefix for python install
    6388df0def8f perf: add 'libperl not found' warning
    a0fb87034f0f perf: force include of <stdbool.h>
    32f3ab82932c uptime: allow the optional limiting of kernel runtime
    9486b2eba979 fat: don't use obsolete random32 call in namei_vfat
    5a3398afe097 FAT: Added FAT_NO_83NAME
    079c6f61933c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    2431b8dd05f7 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5338ecdddce2 initramfs: allow an optional wrapper script around initramfs generation
    6c31503ceca3 x86/boot/compressed/64: Define __force_order only when CONFIG_RANDOMIZE_BASE is unset
    3d683756dce2 modpost: srcversion sometimes incorrect
    89931013d209 linux-yocto: Handle /bin/awk issues
    75fa99f9e576 uvesafb: provide option to specify timeout for task completion
    bf98aa12f36b uvesafb: print error message when task timeout occurs
    1938b8143850 compiler.h: Undef before redefining __attribute_const__
    752c3dd6b4b6 vmware: include jiffies.h
    b23cbd0f7b66 Resolve jiffies wrapping about arp
    1830d18ce4d7 nfs: Allow default io size to be configured.
    2a7b6aaaa59c check console device file on fs when booting
    72808adae4fe mount_root: clarify error messages for when no rootfs found
    6b31420bcb71 NFS: allow nfs root mount to use alternate rpc ports
    d078e29aa31a menuconfig,mconf-cfg: Allow specification of ncurses location
    26e26affd3ae modpost: mask trivial warnings
    71e89f4b4d59 kbuild: exclude meta directory from distclean processing
    478d180563a8 powerpc: serialize image targets
    ae15d16d2f89 arm: serialize build targets
    e4ce2ac7cb8f arch/x86/boot: use prefix map to avoid embedded paths
    0c64b73184d9 crtsavres: fixups for 5.4+
    043ffbbcdb8f powerpc/ptrace: Disable array-bounds warning with gcc8
    f45a7cd151d0 powerpc: Disable attribute-alias warnings from gcc8
    d58c4db9597a powerpc: add crtsavres.o to archprepare for kbuild
    fc4ace07b7d2 powerpc: kexec fix for powerpc64
    403ce2291e1b powerpc: Add unwind information for SPE registers of E500 core
    6fb1edc69050 staging: octeon: Add a workaround for the issue of GCC8
    88e319c5c225 4kc cache tlb hazard: tlbp cache coherency
    f946365e8139 malta uhci quirks: make allowance for slow 4k(e)c
    2281cb8cc437 arm/Makefile: Fix systemtap
    7942a16ee46c vexpress: Pass LOADADDR to Makefile
    9c74389f3c8a arm: ARM EABI socketcall
    65b684cc2da1 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e3a971cbe32..89b8d2b8258 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1a529c784c773e07e2e7a743cf92d99d5f64b175"
+SRCREV_machine ?= "c93e75bc334ba00df2d66411a0d79c4378cf4af8"
 SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.268"
+LINUX_VERSION ?= "5.4.273"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 00a32019d94..6e049b03f97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.268"
+LINUX_VERSION ?= "5.4.273"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "19870769466f545dbfacc448a212acb0dd1324a4"
-SRCREV_machine ?= "b0ebc762e3ecbc4f0338456767a5901fce805155"
+SRCREV_machine_qemuarm ?= "d29f3f3a932319053ad24d84b087b0a57908c1bc"
+SRCREV_machine ?= "b6480d09d84d09e7560daa5c1d73917292ae30c0"
 SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2a30cf6a4d2..2a659e32fd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,15 +13,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a1fa03030adf951abcd2fc5c44f6133352e452da"
-SRCREV_machine_qemuarm64 ?= "31006b756f0b4b686b0fe4fad0f122ad427756de"
-SRCREV_machine_qemumips ?= "199be2c0b3869c13ea32737a316e51eca1a3cd6f"
-SRCREV_machine_qemuppc ?= "f1575e20066e5f61c363e7fccdcdf8b8ae23a8f3"
-SRCREV_machine_qemuriscv64 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
-SRCREV_machine_qemux86 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
-SRCREV_machine_qemux86-64 ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
-SRCREV_machine_qemumips64 ?= "a9c1d19cd3d1d0df846cd419cd75cf59995f89eb"
-SRCREV_machine ?= "698e12267b8f334a5f6a2024e4b9b1f8a95a05ac"
+SRCREV_machine_qemuarm ?= "b7e0891bf4b281c4e29b86f708e10a3339670acc"
+SRCREV_machine_qemuarm64 ?= "ff75f0c7beb167391f0285dd2993394cd143a8a7"
+SRCREV_machine_qemumips ?= "650e43a19e625d1db9d8245cda27db7b86990398"
+SRCREV_machine_qemuppc ?= "0fb6546a09f90befecb11cd0f10274276e8a3021"
+SRCREV_machine_qemuriscv64 ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
+SRCREV_machine_qemux86 ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
+SRCREV_machine_qemux86-64 ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
+SRCREV_machine_qemumips64 ?= "f59947f338319b1741db5dfac34f08399561ab25"
+SRCREV_machine ?= "fe901e2f4b156e9cf7ddb03f479f7339d28e398b"
 SRCREV_meta ?= "c841eec84cf56e6b837f12a359c35c5dfb26da5f"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.268"
+LINUX_VERSION ?= "5.4.273"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


