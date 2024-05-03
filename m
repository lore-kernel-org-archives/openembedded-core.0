Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E009C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.4329.1714705223210016481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZcI9zyO;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69b4454e2f1so37134676d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705222; x=1715310022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfHw57W3MzgSkWbY2WxbfYCSGWyPZ7jsYmVLV2WuF80=;
        b=TZcI9zyOFi59sKqUKq2pKLlPNASEgOdxuCAUdZOwrhJTIMwY7pWLY4bp2hJ8kJlZaa
         0u5n6iMfNuhPw9GCrrJf1Yii+jeJBmp3xalsFfjFQMnQzFI+8q7pXjJMD/nabPa6swfc
         4kfh9DpgD5Qdwo6bz1YFbP9J4yZ94FYAJ/f8K6vLmKNiKDVNzo24TlAsOzEiTjS2RYAX
         jjDz7TiaVqm3EhYBvwP/msJ8huw1Il6z3ks7b6F03UeQj+mvRzLtupePuDJrtTb2U+uf
         52ujtIxDC1z85hiTUeuxaCqY6ar4Tj8ncE6TWrMQpVS5BNVtGDs7BA0/00C6W0Xr55t4
         1QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705222; x=1715310022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfHw57W3MzgSkWbY2WxbfYCSGWyPZ7jsYmVLV2WuF80=;
        b=xN11sSdY10pPzTVVgqTKbAO4lQoI5kUJZcIFCtmwTaI0Fi5lAiTLIyG+Y0cul3WkSl
         b0vaSFa1ehdahQAQnPJXL5aA3LbxzE+nHvtsGXukzaxtT6vndXPwkkF0fs9Qy3uqKR+e
         5yybyPCqBX6fu6G2wedWk66CToqi0j+H6FhJuNIJhQaD5GKInK2MKlpb7v0G8a1qy2E4
         IRijAdu80MD3/A1664LIDs1GDeVo8I8uZYYK3WMUp30uRpP0r7LfwEwX8v8gwLdR2n0b
         Bo0v9JLnsjIWhiSdAEihY0E4I07gz8LaoUsG39LZzJBPNT/WEEJDzYqI9xqLZPwqBxCs
         PKCA==
X-Gm-Message-State: AOJu0Yya+JOmeU3s6Jt5e1LIgeK2svkISCNsmvFYKOpVeRFzDfD5Ezcf
	jUOKnw3ZxLEGNHgLIrBh8LuWtBVuMBBKEx0s3bSBEfHdEc8RWMBdJr+ZQg==
X-Google-Smtp-Source: AGHT+IHEDpzwZ/n78jjNj2AUxDm0Et4/RfMGZOiMGbYL1qSm+HasEGEvTerasNgtHU9W4C4SaHYSZQ==
X-Received: by 2002:ad4:5b8f:0:b0:6a0:c162:2944 with SMTP id 15-20020ad45b8f000000b006a0c1622944mr1488576qvp.29.1714705221807;
        Thu, 02 May 2024 20:00:21 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/10] linux-yocto/6.1: update to v6.1.83
Date: Thu,  2 May 2024 23:00:10 -0400
Message-Id: <20240503030015.374078-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198960

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    e5cd595e23c1 Linux 6.1.83
    9b2e8276bfb6 remoteproc: stm32: fix incorrect optional pointers
    4b0c54792394 x86/efistub: Don't clear BSS twice in mixed mode
    f07ffd18d787 x86/efistub: Clear decompressor BSS in native EFI entrypoint
    aa587257e146 dm-integrity: align the outgoing bio in integrity_recheck
    92b3c2437df8 dm io: Support IO priority
    d0980ed818d7 dm: address indent/space issues
    1bf455b2c67c selftests: forwarding: Fix ping failure due to short timeout
    766ec94cc574 spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
    86c0c154a759 net: dsa: mt7530: fix handling of all link-local frames
    f1fa919ea596 net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
    5ff8f56c392b bpf: report RCU QS in cpumap kthread
    3890e7008c55 net: report RCU QS on threaded NAPI repolling
    f21ddce5b8c4 rcu: add a helper to report consolidated flavor QS
    9683cb6c2c6c netfilter: nf_tables: do not compare internal table flags on updates
    5ad233dc731a netfilter: nft_set_pipapo: release elements in clone only from destroy path
    29d2550d79a8 octeontx2-af: Use separate handlers for interrupts
    53e6709a2ff1 octeontx2-pf: Send UP messages to VF only when VF is up.
    53ae0f36690c octeontx2-pf: Use default max_active works instead of one
    e545e4b1c1c1 net: octeontx2: Use alloc_ordered_workqueue() to create ordered workqueues
    a64cc7599ece octeontx2: Detect the mbox up or down message via register
    8a231bd4d6cb octeontx2-af: add mbox to return CPT_AF_FLT_INT info
    8b1140c5808b octeontx2-af: optimize cpt pf identification
    35d8af38f199 octeontx2-af: add mbox for CPT LF reset
    ac3f337f0a2e octeontx2-af: recover CPT engine when it gets fault
    cf7d8cba639a net/bnx2x: Prevent access to a freed page in page_pool
    20e21c3c0195 dm-integrity: fix a memory leak when rechecking the data
    b29a5055eeb0 net: phy: fix phy_read_poll_timeout argument type in genphy_loopback
    6af7c8a2980b ipv4: raw: Fix sending packets from raw sockets via IPsec tunnels
    87ca3d940f64 hsr: Handle failures in module init
    52287ed416a1 rds: introduce acquire/release ordering in acquire/release_in_xmit()
    45a83b220c83 wireguard: receive: annotate data-race around receiving_counter.counter
    07b6891ca62e vdpa/mlx5: Allow CVQ size changes
    80fc9b9c626b vdpa_sim: reset must not run
    1d830032bcba drm: Fix drm_fixp2int_round() making it add 0.5
    be4512b9ac6f net: dsa: mt7530: prevent possible incorrect XTAL frequency selection
    d343a618bc3c net: veth: do not manipulate GRO when using XDP
    ef7eed7e11d2 packet: annotate data-races around ignore_outgoing
    f78807362828 net: ethernet: mtk_eth_soc: fix PPE hanging issue
    6b62bad2da1b net: mediatek: mtk_eth_soc: clear MAC_MCR_FORCE_LINK only when MAC is up
    149afee5c741 nvme: fix reconnection fail due to reserved tag allocation
    1883ed12d702 nvme: add the Apple shared tag workaround to nvme_alloc_io_tag_set
    cb8ae8e5ec28 nvme: only set reserved_tags in nvme_alloc_io_tag_set for fabrics controllers
    1ed222ca7396 hsr: Fix uninit-value access in hsr_get_node()
    86d9b040421b tcp: Fix refcnt handling in __inet_hash_connect().
    1ff7ffcac109 soc: fsl: dpio: fix kcalloc() argument order
    bd2474a45df7 net/sched: taprio: proper TCA_TAPRIO_TC_ENTRY_INDEX check
    abc9b13fd921 s390/vtime: fix average steal time calculation
    ec0e06c797a0 octeontx2-af: Use matching wake_up API variant in CGX command interface
    9905a157048f rds: tcp: Fix use-after-free of net in reqsk_timer_handler().
    6df9cf77e0c7 tcp: Fix NEW_SYN_RECV handling in inet_twsk_purge()
    d2034a6b92ca nouveau: reset the bo resource bus info after an eviction
    d23e49f4e4c1 ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates
    2ca629b90dc9 usb: gadget: net2272: Use irqflags in the call to net2272_probe_fin
    1d4ff6a8f85e staging: greybus: fix get_channel_from_mode() failure path
    d2b48ecc760a serial: 8250_exar: Don't remove GPIO device on suspend
    bea2dfd5fa3f rtc: mt6397: select IRQ_DOMAIN instead of depending on it
    bc493a56abf8 hwtracing: hisi_ptt: Move type check to the beginning of hisi_ptt_pmu_event_init()
    c609ce8b3c6f kconfig: fix infinite loop when expanding a macro at the end of file
    8aa68d9fc22c arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells
    ad7362db2fd7 tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
    e955764b4167 serial: max310x: fix syntax error in IRQ error message
    52af9897e787 tty: vt: fix 20 vs 0x20 typo in EScsiignore
    22ae3d106391 usb: phy: generic: Get the vbus supply
    e660319fc67c remoteproc: stm32: Fix incorrect type assignment returned by stm32_rproc_get_loaded_rsc_tablef
    b4f425956362 remoteproc: stm32: Fix incorrect type in assignment for va
    0e3aa1749964 remoteproc: stm32: use correct format strings on 64-bit
    5c594bdbd519 comedi: comedi_test: Prevent timers rescheduling during deletion
    b5a579ddf0bf io_uring/net: correct the type of variable
    31db25e3141b nfs: fix panic when nfs4_ff_layout_prepare_ds() fails
    76426abf9b98 afs: Revert "afs: Hide silly-rename files from userspace"
    4fd4a210de9d perf/x86/amd/core: Avoid register reset when CPU is dead
    889846dfc8ee f2fs: compress: fix reserve_cblocks counting error when out of space
    a4e063d67e93 f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
    02b661956605 f2fs: convert to use sbi directly
    4d5e5a044b99 NFS: Fix an off by one in root_nfs_cat()
    449684e376a0 f2fs: ro: compress: fix to avoid caching unaligned extent
    aa25e54f44cb watchdog: stm32_iwdg: initialize default timeout
    b91d54a2c4aa f2fs: check number of blocks in a current section
    7486973accbc f2fs: compress: fix to check compress flag w/ .i_sem lock
    18631d43d487 NFSv4.2: fix listxattr maximum XDR buffer size
    06e828b3f1b2 NFSv4.2: fix nfs4_listxattr kernel BUG at mm/usercopy.c:102
    8c0fe010cbe0 net: sunrpc: Fix an off by one in rpc_sockaddr2uaddr()
    8ede73123cd5 f2fs: compress: fix to check zstd compress level correctly in mount option
    322eb43c0ea2 scsi: bfa: Fix function pointer type mismatch for hcb_qe->cbfn
    b0455371cced RDMA/rtrs-clt: Check strnlen return len in sysfs mpath_policy_store()
    aaa8e143bfe1 RDMA/device: Fix a race between mad_client and cm_client init
    987bc93ecdab RDMA/hns: Fix mis-modifying default congestion control algorithm
    e85d53ebae88 scsi: csiostor: Avoid function pointer casts
    fe4de493572a f2fs: fix to avoid potential panic during recovery
    98df108a9ab0 f2fs: compress: fix to cover f2fs_disable_compressed_file() w/ i_sem
    67eba3e674a1 f2fs: compress: fix to avoid inconsistence bewteen i_blocks and dnode
    bba2a0ba00eb f2fs: update blkaddr in __set_data_blkaddr() for cleanup
    ebe3a9f3c286 f2fs: introduce get_dnode_addr() to clean up codes
    3c2e2c8059da f2fs: delete obsolete FI_DROP_CACHE
    17bfaa58db0c f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
    621da84f1015 f2fs: simplify __allocate_data_block
    b5ecf59fbab9 f2fs: compress: fix to check unreleased compressed cluster
    542c8b3c774a f2fs: compress: fix to cover normal cluster write with cp_rwsem
    e54cce813725 f2fs: compress: fix to guarantee persisting compressed blocks by CP
    492acea36b29 f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
    e362d0072949 RDMA/srpt: Do not register event handler until srpt device is fully setup
    ae771b805dfd RDMA/irdma: Remove duplicate assignment
    0606bedcc373 RDMA/irdma: Allow accurate reporting on QP max send/recv WR
    629af0d5fe94 ALSA: usb-audio: Stop parsing channels bits when all channels are found.
    fd58b4e3c0c6 ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
    8c4889a9ea86 clk: zynq: Prevent null pointer dereference caused by kmalloc failure
    a8b2b26fdd01 clk: Fix clk_core_get NULL dereference
    faa2ba4cebdf sparc32: Fix section mismatch in leon_pci_grpci
    765f673c0eb9 backlight: lp8788: Fully initialize backlight_properties during probe
    693c1edfcf21 backlight: lm3639: Fully initialize backlight_properties during probe
    6d7e897358fc backlight: da9052: Fully initialize backlight_properties during probe
    d6e321dcd7d4 backlight: lm3630a: Don't set bl->props.brightness in get_brightness
    491ec4f45443 backlight: lm3630a: Initialize backlight_properties on init
    dd7f2d0f6187 leds: sgm3140: Add missing timer cleanup and flash gpio control
    d1f384e4c201 leds: aw2013: Unlock mutex before destroying it
    c2c32faae82f powerpc/embedded6xx: Fix no previous prototype for avr_uart_send() etc.
    c550f0055c5d modules: wait do_free_init correctly
    0189516bb536 drm/msm/dpu: add division of drm_display_mode's hskew parameter
    48feaf23f3a4 powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
    a3f22feb2220 powerpc/pseries: Fix potential memleak in papr_get_attr()
    d2bd30c71047 drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
    e9eee1ce1b6c gpio: nomadik: fix offset bug in nmk_pmx_set()
    32bfbab72aaa media: mediatek: vcodec: avoid -Wcast-function-type-strict warning
    55ca0c7eae84 media: ttpci: fix two memleaks in budget_av_attach
    e04d15c8bb3e media: go7007: fix a memleak in go7007_load_encoder
    107052a8cfef media: dvb-frontends: avoid stack overflow warnings with clang
    3a1ec89708d2 media: pvrusb2: fix uaf in pvr2_context_set_notify
    0a70199742c2 drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
    fcb7e704827e HID: amd_sfh: Avoid disabling the interrupt
    c6a05e45de82 HID: amd_sfh: Update HPD sensor structure elements
    ff4dd05a9415 ASoC: meson: axg-tdm-interface: add frame rate constraint
    83ee64af9bed ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
    5ac2ca7a50ed mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
    438adcd017dc mtd: maps: physmap-core: fix flash size larger than 32-bit
    82120c9ab4b8 drm/tidss: Fix sync-lost issue with two displays
    c82d43406973 drm/tidss: Fix initial plane zpos values
    67355a760bf5 crypto: jitter - fix CRYPTO_JITTERENTROPY help text
    6a2ef9725068 crypto: arm/sha - fix function cast warnings
    6be122c8d215 mfd: altera-sysmgr: Call of_node_put() only when of_parse_phandle() takes a ref
    3eb47e41c205 mfd: syscon: Call of_node_put() only when of_parse_phandle() takes a ref
    527480cab5cc drm/tegra: put drm_gem_object ref on error in tegra_fb_create
    e0b0d1c46a2c clk: hisilicon: hi3559a: Fix an erroneous devm_kfree()
    d183ee71366c clk: hisilicon: hi3519: Release the correct number of gates in hi3519_clk_unregister()
    ce106d8ef0ba PCI: Mark 3ware-9650SE Root Port Extended Tags as broken
    7a08ebcfd721 drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
    2101966b7744 clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
    6e93e0f88322 media: pvrusb2: fix pvr2_stream_callback casts
    7dee677d17c9 media: pvrusb2: remove redundant NULL check
    8e6e28e650ba media: go7007: add check of return value of go7007_read_addr()
    8df9a3c7044b media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
    77301ad7bebf media: sun8i-di: Fix chroma difference threshold
    f4258e5882e2 media: sun8i-di: Fix power on/off sequences
    0dfdf4c1ac4c media: sun8i-di: Fix coefficient writes
    acdf24f3d523 media: cedrus: h265: Fix configuring bitstream size
    8006813ebdf1 media: cedrus: h265: Associate mv col buffers with buffer
    6632a54ac805 NTB: fix possible name leak in ntb_register_device()
    298f7f137021 NTB: EPF: fix possible memory leak in pci_vntb_probe()
    d133d67e7e72 ASoC: SOF: Add some bounds checking to firmware data
    9a819504171d ASoC: SOF: Introduce container struct for SOF firmware
    b494caad9c6b powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
    4a00001d22d1 ASoC: meson: t9015: fix function pointer type mismatch
    fe636b9a6ede ASoC: meson: aiu: fix function pointer type mismatch
    511a6a88b24a perf stat: Avoid metric-only segv
    b14524556fe3 ALSA: seq: fix function cast warnings
    5342ad8db53c clk: renesas: r8a779f0: Correct PFC/GPIO parent clock
    128c04cc0472 clk: renesas: r8a779g0: Correct PFC/GPIO parent clocks
    4f6274bafde6 clk: renesas: r8a779g0: Add thermal clock
    bf10ef659b21 clk: renesas: r8a779g0: Add Audio clocks
    ca9b82755a51 clk: renesas: r8a779g0: Add CMT clocks
    7d82efd8d3a9 drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
    c264af81ad60 drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
    e4892870a5f5 drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
    dc84f8c1a3db perf thread_map: Free strlist on normal path in thread_map__new_by_tid_str()
    a71f66bd5f7b crypto: xilinx - call finalize with bh disabled
    4421c746023b PCI: switchtec: Fix an error handling path in switchtec_pci_probe()
    c12efda47df9 quota: Fix rcu annotations of inode dquot pointers
    7f9e833fc0f9 quota: Fix potential NULL pointer dereference
    fd14781b3021 quota: simplify drop_dquot_ref()
    6814dc592d35 clk: qcom: reset: Ensure write completion on reset de/assertion
    1f3e9910422e clk: qcom: reset: Commonize the de/assert functions
    99cd54167d0b pinctrl: mediatek: Drop bogus slew rate register range for MT8192
    f69b926799b3 pinctrl: mediatek: Drop bogus slew rate register range for MT8186
    437a111f79a2 media: edia: dvbdev: fix a use-after-free
    0c9550b032de media: v4l2-mem2mem: fix a memleak in v4l2_m2m_register_entity
    6bf5c2fade8e media: v4l2-tpg: fix some memleaks in tpg_alloc
    3828fc3ab84c media: em28xx: annotate unchecked call to media_device_register()
    7ae1b0dc12ec clk: meson: Add missing clocks to axg_clk_regmaps
    83fe9c3f445d perf evsel: Fix duplicate initialization of data->id in evsel__parse_sample()
    9310d3de984c clk: samsung: exynos850: Propagate SPI IPCLK rate change
    29eaa9246b0d pinctrl: renesas: r8a779g0: Add missing SCIF_CLK2 pin group/function
    a19403d20ed8 pinctrl: renesas: r8a779g0: Add Audio SSI pins, groups, and functions
    29fde8895b2f drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
    d346b3e5b25c drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
    fa8810aa5ac3 HID: lenovo: Add middleclick_workaround sysfs knob for cptkbd
    845a478304f0 perf record: Fix possible incorrect free in record__switch_output()
    43f4364c8f4e PCI/DPC: Print all TLP Prefixes, not just the first
    8ba8db9786b5 media: tc358743: register v4l2 async device only after successful setup
    b17195f1e015 dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
    1eb749a9c305 ASoC: amd: acp: Add missing error handling in sof-mach
    f6d51a91b417 drm/lima: fix a memleak in lima_heap_alloc
    680c94312e86 drm/panel-edp: use put_sync in unprepare
    06e38277151e drm/rockchip: lvds: do not print scary message when probing defer
    fe790f340eb7 drm/rockchip: lvds: do not overwrite error code
    40624af66747 drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node
    758629d348b9 drm: Don't treat 0 as -1 in drm_fixp2int_ceil
    e6ed73bb8e4b drm/rockchip: inno_hdmi: Fix video timing
    c994fed05c27 drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()
    f3f407ccbe84 drm/tegra: rgb: Fix missing clk_put() in the error handling paths of tegra_dc_rgb_probe()
    29f922ae4a0a drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
    bb459d437d17 drm/tegra: hdmi: Fix some error handling paths in tegra_hdmi_probe()
    8bc95d34408b drm/tegra: hdmi: Convert to devm_platform_ioremap_resource()
    806dc32deac2 drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
    a57bbd606a8a drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
    d3e8c2409a35 drm/tegra: dsi: Make use of the helper function dev_err_probe()
    f4a1a30f1837 drm/tegra: dpaux: Fix PM disable depth imbalance in tegra_dpaux_probe
    50c0ad785a78 drm/tegra: dsi: Add missing check for of_find_device_by_node
    ad10289f68f4 dm: call the resume method on internal suspend
    2b50b4f0d40d dm raid: fix false positive for requeue needed during reshape
    b605c3831fb4 bpf: hardcode BPF_PROG_PACK_SIZE to 2MB * num_possible_nodes()
    c9b4e220dd18 nfp: flower: handle acti_netdevs allocation failure
    b7c2b7eae286 net/x25: fix incorrect parameter validation in the x25_getsockopt() function
    440e278cb53b net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
    6bb3c0473863 udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
    cfea1c9ad406 l2tp: fix incorrect parameter validation in the pppol2tp_getsockopt() function
    6ccbd0227fb8 ipmr: fix incorrect parameter validation in the ip_mroute_getsockopt() function
    dcdcf9a71730 tcp: fix incorrect parameter validation in the do_tcp_getsockopt() function
    20fd74fa884f OPP: debugfs: Fix warning around icc_get_name()
    877cce250a7b net: phy: dp83822: Fix RGMII TX delay configuration
    262a77d85e8b Bluetooth: Fix eir name length
    99f30e12e588 Bluetooth: hci_core: Fix missing instances using HCI_MAX_AD_LENGTH
    f30e6322bc51 Bluetooth: MGMT: Fix always using HCI_MAX_AD_LENGTH
    8ec278830c1a net: hns3: fix port duplex configure error in IMP reset
    b3cf70472a60 net: hns3: fix kernel crash when 1588 is received on HIP08 devices
    19af2ce84cd9 net: hns3: fix wrong judgment condition issue
    2a2ff7095116 net: phy: fix phy_get_internal_delay accessing an empty array
    60044ab84836 net: ip_tunnel: make sure to pull inner header in ip_tunnel_rcv()
    66e74f2f74a6 ipv6: fib6_rules: flush route cache when rule is changed
    8c91a4bfc7f8 iommu: Fix compilation without CONFIG_IOMMU_INTEL
    586e19c88a0c iommu/vt-d: Retrieve IOMMU perfmon capability information
    f06899582cce bpf: Fix stackmap overflow check on 32-bit arches
    a83fdaeaea36 bpf: Fix hashtab overflow check on 32-bit arches
    edf7990baa48 bpf: Fix DEVMAP_HASH overflow check on 32-bit arches
    98a2feb8ece6 s390/cache: prevent rebuild of shared_cpu_list
    9c402819620a sr9800: Add check for usbnet_get_endpoints
    715264ad09fd Bluetooth: fix use-after-free in accessing skb after sending it
    cb8adca52f30 Bluetooth: af_bluetooth: Fix deadlock
    68644bf5ec6b Bluetooth: hci_core: Fix possible buffer overflow
    da77c1d39bc5 Bluetooth: hci_sync: Fix overwriting request callback
    1b6cfa4c760e Bluetooth: hci_core: Cancel request on command timeout
    6083089ab006 Bluetooth: hci_conn: Consolidate code for aborting connections
    ac7a47aaa794 Bluetooth: hci_sync: Only allow hci_cmd_sync_queue if running
    1023de27cd1d Bluetooth: Cancel sync command before suspend and power off
    a96738eb215f Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()
    653a17a99d75 Bluetooth: Remove superfluous call to hci_conn_check_pending()
    8beed376c919 Bluetooth: mgmt: Remove leftover queuing of power_off work
    e5f04ec44217 Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
    8499af0616cf igb: Fix missing time sync events
    34a7b30f56d3 iommu/vt-d: Don't issue ATS Invalidation request when device is disconnected
    48fba9d7f571 PCI: Make pci_dev_is_disconnected() helper public for other drivers
    eeaa98f34d84 wifi: rtw88: 8821c: Fix false alarm count
    2c727f83eb06 wifi: rtw88: 8821c: Fix beacon loss and disconnect
    33fb18efaede ACPI: CPPC: enable AMD CPPC V2 support for family 17h processors
    216712c69846 mmc: wmt-sdmmc: remove an incorrect release_mem_region() call in the .remove function
    934212a623cb SUNRPC: fix some memleaks in gssx_dec_option_array
    47635b112a64 x86, relocs: Ignore relocations in .notes section
    9e8486e46f8b arm64: dts: rockchip: add missing interrupt-names for rk356x vdpu
    5bd963ff48e8 ACPI: scan: Fix device check notification handling
    ed86e1fa7bad ACPI: resource: Add MAIBENBEN X577 to irq1_edge_low_force_override
    c259c196ebd8 ACPI: resource: Do IRQ override on Lunnen Ground laptops
    804db3c1ad5c ACPI: resource: Add Infinity laptops to irq1_edge_low_force_override
    24cc77b670ad arm64: dts: marvell: reorder crypto interrupts on Armada SoCs
    681ba22555dc ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node
    28b43ec7e4c0 ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
    23bb0006c9db ARM: dts: imx6dl-yapp4: Move phy reset into switch node
    4478f7e5be24 arm64: dts: allwinner: h6: Add RX DMA channel for SPDIF
    db6e5e16f1ee pstore: inode: Only d_invalidate() is needed
    be52ee92ced6 pstore: inode: Convert mutex usage to guard(mutex)
    e16c33dd9967 net: mctp: copy skb ext data when fragmenting
    0820c84be636 arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes
    bea023d846d3 arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
    efab55e16c55 arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
    76cfe86f2d20 arm64: dts: renesas: rzg2l: Add missing interrupts to IRQC nodes
    7f1d9f8bde62 arm64: dts: renesas: r9a07g043u: Add IRQC node
    96132cc2e159 arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
    5425ac2428b3 ARM: dts: arm: realview: Fix development chip ROM compatible value
    3936e0f81ac4 wifi: wilc1000: revert reset line logic flip
    0d276d9f335f firmware: arm_scmi: Fix double free in SMC transport cleanup path
    c20211d3df54 arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
    4c51575705d2 net: ena: Remove ena_select_queue
    2b718bb18f5f powercap: dtpm_cpu: Fix error check against freq_qos_add_request()
    88611c1fdca4 arm64: dts: qcom: sm8150: correct PCIe wake-gpios
    9c23056893a4 arm64: dts: qcom: sm8150: use 'gpios' suffix for PCI GPIOs
    f95febbffe98 arm64: dts: qcom: sdm845-db845c: correct PCIe wake-gpios
    093cec79f0bb wifi: brcmsmac: avoid function pointer casts
    386c2487754f iommu/amd: Mark interrupt as managed
    031d2acc4217 bus: tegra-aconnect: Update dependency to ARCH_TEGRA
    fad9bcd4d754 ACPI: processor_idle: Fix memory leak in acpi_processor_power_exit()
    a9545af2a533 wifi: wilc1000: prevent use-after-free on vif when cleaning up all interfaces
    e2fed151d53d ARM: dts: qcom: msm8974: correct qfprom node size
    8bfc6b840a95 bpf: Mark bpf_spin_{lock,unlock}() helpers with notrace correctly
    1e33bdd02394 arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
    4bc2befb93d1 arm64: dts: mediatek: mt8192: fix vencoder clock name
    fedd55b8a581 arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
    5c77447aa444 arm64: dts: mediatek: mt7986: add "#reset-cells" to infracfg
    6606534538e9 arm64: dts: mt8183: Move CrosEC base detection node to kukui-based DTs
    ef71a93eec06 arm64: dts: mt8183: kukui: Split out keyboard node and describe detachables
    a03ede2282eb ipv6: mcast: remove one synchronize_net() barrier in ipv6_mc_down()
    21af11fcb03f selftests: forwarding: Add missing multicast routing config entries
    4e58093897c9 selftests: forwarding: Add missing config entries
    9b2ca91f6eac s390/vdso: drop '-fPIC' from LDFLAGS
    8a2f812b4bfb s390/pai: fix attr_event_free upper limit for pai device drivers
    437af288ec7b wifi: iwlwifi: mvm: don't set replay counters to 0xff
    b4907fb68d45 tools/resolve_btfids: Fix cross-compilation to non-host endianness
    0697d4862d96 tools/resolve_btfids: Refactor set sorting with types from btf_ids.h
    23f96f86de86 pwm: sti: Fix capture for st,pwm-num-chan < st,capture-num-chan
    d73b916bcc62 printk: Disable passing console lock owner completely during panic()
    a1f57a0127b8 wifi: wfx: fix memory leak when starting AP
    4d99d267da34 wifi: libertas: fix some memleaks in lbs_allocate_cmd_buffer()
    71cdbd1fcbe7 wifi: ath11k: initialize rx_mcs_80 and rx_mcs_160 before use
    b4bb2291d6d4 net: blackhole_dev: fix build warning for ethh set but not used
    ecab386a8edb pwm: atmel-hlcdc: Fix clock imbalance related to suspend support
    78b8952e1df2 pwm: atmel-hlcdc: Use consistent variable naming
    992cbc89b0ff pwm: atmel-hlcdc: Convert to platform remove callback returning void
    a5fd802a1f55 arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
    d80bac49aebf gpio: vf610: allow disabling the vf610 driver
    5666fe7b8518 wifi: iwlwifi: fix EWRD table validity check
    c855a1a5b7e3 wifi: iwlwifi: dbg-tlv: ensure NUL termination
    9cd961d993b3 wifi: iwlwifi: mvm: report beacon protection failures
    74d0639261dd wifi: ath9k: delay all of ath9k_wmi_event_tasklet() until init is complete
    fed6a1df672e libbpf: Add missing LIBBPF_API annotation to libbpf_set_memlock_rlim API
    4f4f1e2deef2 arm64: dts: imx8mm-kontron: Fix interrupt for RTC on OSM-S i.MX8MM module
    795fb93bde7a arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL board
    a4116bd6ee5e arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL OSM-S board
    ed2186ea406f arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL board
    dde02bf5fc9b arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL OSM-S board
    333a02b3be6a arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on SL/BL i.MX8MM
    8f38b401b4e0 arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on OSM-S i.MX8MM
    4c820998a5a4 pmdomain: qcom: rpmhpd: Drop SA8540P gfx.lvl
    3248f4ae054c libbpf: Fix faccessat() usage on Android
    1b3bae282ae8 cpufreq: mediatek-hw: Don't error out if supply is not found
    7ab56f24bf01 af_unix: Annotate data-race of gc_in_progress in wait_for_unix_gc().
    6ae1ec0043d5 selftest/bpf: Add map_in_maps with BPF_MAP_TYPE_PERF_EVENT_ARRAY values
    bb21851465b3 libbpf: Apply map_set_def_max_entries() for inner_maps on creation
    c1760abb1002 bpftool: Silence build warning about calloc()
    d10dbf722d32 inet_diag: annotate data-races around inet_diag_table[]
    f7dbf2c1675a sock_diag: annotate data-races around sock_diag_handlers[family]
    60b5b89e41a6 cpufreq: mediatek-hw: Wait for CPU supplies before probing
    b98ed6417e59 cpufreq: Explicitly include correct DT includes
    e72160cb6e23 cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
    a81edfc5ec8b ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
    6798cf0aaa7c wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()
    5a26e6d2a7ec wifi: wilc1000: fix multi-vif management when deleting a vif
    515cc676dfbc wifi: wilc1000: do not realloc workqueue everytime an interface is added
    3518cea837de wifi: rtl8xxxu: add cancel_work_sync() for c2hcmd_work
    745003b5917b wifi: wilc1000: fix RCU usage in connect path
    d8766257c2e9 wifi: wilc1000: fix declarations ordering
    b8dd353a1a91 wifi: b43: Disable QoS for bcm4331
    3033583a786e wifi: b43: Stop correct queue in DMA worker when QoS is disabled
    b6b6bdfca8bc wifi: b43: Stop/wake correct queue in PIO Tx path when QoS is disabled
    c67698325c68 wifi: b43: Stop/wake correct queue in DMA Tx path when QoS is disabled
    90f089d77e38 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
    13fa3326efb2 sched/fair: Take the scheduling domain into account in select_idle_core()
    790ae577eff3 sched/fair: Take the scheduling domain into account in select_idle_smt()
    9388721260f6 timekeeping: Fix cross-timestamp interpolation for non-x86
    8a1d2ecd9bb8 timekeeping: Fix cross-timestamp interpolation corner case decision
    081bf64a7e9a timekeeping: Fix cross-timestamp interpolation on counter wrap
    3e5e8248c0a4 x86/sme: Fix memory encryption setting if enabled by default and not overridden
    f0439b7d67b8 x86/resctrl: Implement new mba_MBps throttling heuristic
    74ca3ef68d2f aoe: fix the potential use-after-free problem in aoecmd_cfg_pkts
    868ec8686164 io_uring/net: fix overflow check in io_recvmsg_mshot_prep()
    aba7b2140e82 io_uring/net: move receive multishot out of the generic msghdr path
    a34fba8c44ac io_uring/net: unify how recvmsg and sendmsg copy in the msghdr
    28e7fd1c70a2 rtc: test: Fix invalid format specifier.
    d12ffa03085e time: test: Fix incorrect format specifier
    188e9aff6887 lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
    eaf5eaa4064d lib/cmdline: Fix an invalid format specifier in an assertion msg
    d6c28aefe9b4 md: Don't clear MD_CLOSING when the raid is about to stop
    283e38fc7dce fs/select: rework stack allocation hack for clang
    96436365e5d8 nbd: null check for nla_nest_start
    267a6af60863 rcu/exp: Handle RCU expedited grace period kworker allocation failure
    f8b89a36721f rcu/exp: Fix RCU expedited parallel grace period kworker allocation failure recovery
    ad999aa18103 s390/dasd: fix double module refcount decrement
    977bb962a116 s390/dasd: Use dev_*() for device log messages
    ba0e1cc43e09 s390/dasd: add autoquiesce feature
    7533ed7668bc fs: Fix rw_hint validation
    e6450d5e46a7 do_sys_name_to_handle(): use kzalloc() to fix kernel-infoleak
    807f99139664 ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
    0a5d59ed95f1 ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
    f11b50b8baff ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
    d575eb8747d6 Input: gpio_keys_polled - suppress deferred probe error for gpio
    374709a7e541 ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet
    9a4fb2bdee2f arm64: tegra: Set the correct PHY mode for MGBE
    72dbf660e01a firewire: core: use long bus reset on gap count error
    2f3ce8fcbf52 Bluetooth: mgmt: Fix limited discoverable off timeout
    567c0411dc3b Bluetooth: rfcomm: Fix null-ptr-deref in rfcomm_check_security
    0e3732d1df35 ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
    05c7c2d198a0 drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series
    5e61a994b228 ALSA: hda/realtek - ALC285 reduce pop noise from Headphone port
    b0e50fa810e8 scsi: mpt3sas: Prevent sending diag_reset when the controller is ready
    008985fd35a7 ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
    50fbd3a7210f wifi: mac80211: only call drv_sta_rc_update for uploaded stations
    80656ee2baa7 net: smsc95xx: add support for SYS TEC USB-SPEmodule1
    ab1be3f1aa77 btrfs: fix data race at btrfs_use_block_rsv() when accessing block reserve
    995e91c9556c btrfs: fix data races when accessing the reserved amount of block reserves
    53983d354bd7 arm64: dts: Fix dtc interrupt_provider warnings
    b22b54f247f6 dm-verity, dm-crypt: align "struct bvec_iter" correctly
    6fb80b3e75b5 block: sed-opal: handle empty atoms when parsing response
    4492f2126318 parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
    05896c8ff4ed net/iucv: fix the allocation size of iucv_path_table array
    f175de546a3e x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()
    46c8615de5bf x86/mm: Move is_vsyscall_vaddr() into asm/vsyscall.h
    d35d346b5df6 riscv: dts: sifive: add missing #interrupt-cells to pmic
    6d4c7bd6dc35 RDMA/mlx5: Relax DEVX access upon modify commands
    cad82f1671e4 RDMA/mlx5: Fix fortify source warning while accessing Eth segment
    6d6aa6c0bfd6 soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
    0e5b11ff7354 arm64/sve: Lower the maximum allocation for the SVE ptrace regset
    6ce8cc5e6251 gen_compile_commands: fix invalid escape sequence warning
    d1614e1fd6c3 HID: multitouch: Add required quirk for Synaptics 0xcddc device
    9a07188311af MIPS: Clear Cause.BD in instruction_pointer_set
    f49c513f46dc x86/xen: Add some null pointer checking to smp.c
    7056108e0177 ASoC: amd: yc: Fix non-functional mic on Lenovo 82UU
    aa9e9c776442 ASoC: rt5645: Make LattePanda board DMI match more precise
    c4b96f7eaba0 selftests: tls: use exact comparison in recv_partial
    d23425dab997 perf/arm-cmn: Workaround AmpereOneX errata AC04_MESH_1 (incorrect child count)
    abd34206f396 media: rkisp1: Fix IRQ handling due to shared interrupts
    806a0a1819ba nfsd: Fix creation time serialization order
    96e18f236178 NFSD: Add an nfsd4_encode_nfstime4() helper
    37085bbd92b3 NFSD: Fix problem of COMMIT and NFS4ERR_DELAY in infinite loop
    448f1dcd6240 nfsd: simplify the delayed disposal list code
    0af5ee518165 NFSD: Convert filecache to rhltable
    f7ae48088687 nfsd: allow reaping files still under writeback
    7cc954763372 nfsd: update comment over __nfsd_file_cache_purge
    c01b3f0fef71 nfsd: don't take/put an extra reference when putting a file
    917dadb09e31 nfsd: add some comments to nfsd_file_do_acquire
    ee84c44b4a0a nfsd: don't kill nfsd_files because of lease break error
    8a6c19f15766 nfsd: simplify test_bit return in NFSD_FILE_KEY_FULL comparator
    fab03e0db0c2 nfsd: NFSD_FILE_KEY_INODE only needs to find GC'ed entries
    19d22c5ba5c9 nfsd: don't open-code clear_and_wake_up_bit
    7762c2d4cc0b nfsd: allow nfsd_file_get to sanely handle a NULL pointer
    a3812a47a320 io_uring: drop any code related to SCM_RIGHTS
    28fe81bcd3ea io_uring/unix: drop usage of io_uring socket
    1d467e105071 md/raid10: prevent soft lockup while flush writes
    7512a70376f5 md: fix data corruption for raid456 when reshape restart while grow up
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index cb091a7d79..6ad7302ad3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ff8fd5f68aadf01de61a8a17d3f7fc69ea873801"
-SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
+SRCREV_machine ?= "f01320520068df70be5d8c916f1d792f69643fe6"
+SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.82"
+LINUX_VERSION ?= "6.1.83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 04cff23ecb..d59de65d49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.82"
+LINUX_VERSION ?= "6.1.83"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
+SRCREV_machine ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ce0bd71dd6..7f6040ddec 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a07afa502355c7653fb9999345c25f86cd7c244b"
-SRCREV_machine:qemuarm64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemuloongarch64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemumips ?= "e66e81887065c1501243b6dc862e3cea58f668b0"
-SRCREV_machine:qemuppc ?= "31d1b4e1c6954491122fa3040a5e1a3017ae1462"
-SRCREV_machine:qemuriscv64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemuriscv32 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemux86 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemux86-64 ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_machine:qemumips64 ?= "34db6af2816a2a565d34e21135a2498e7723df07"
-SRCREV_machine ?= "329d19a5be2832acafa4a5c598a244ddb5d15737"
-SRCREV_meta ?= "2e91a300ba91db8a5d58a7aadf6ed45dd7ae5bef"
+SRCREV_machine:qemuarm ?= "5431332379ab328763f6d3945a17420591ca58e8"
+SRCREV_machine:qemuarm64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemuloongarch64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemumips ?= "0d625849a0114e2389eda2b02c6b79b6b253258e"
+SRCREV_machine:qemuppc ?= "44eb5814d0930deabfa9d4167c1944f3c5e54b79"
+SRCREV_machine:qemuriscv64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemuriscv32 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemux86 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemux86-64 ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_machine:qemumips64 ?= "848e49dade7ab6c477475dcdc83a1cc2d3da9822"
+SRCREV_machine ?= "7e5af88b989a76a629e76ace2604f5fe8f69d710"
+SRCREV_meta ?= "85ba1038b50deb50445772117e82e3e6f60c3142"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d7543167affd372819a94879b8b1e8b9b12547d9"
+SRCREV_machine:class-devupstream ?= "e5cd595e23c1a075359a337c0e5c3a4f2dc28dd1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.82"
+LINUX_VERSION ?= "6.1.83"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


