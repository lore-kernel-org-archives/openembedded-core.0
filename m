Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3775ACD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:43:16 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.4426.1711651393563512480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+EMOSmT;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4d43b3fc06cso461167e0c.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651392; x=1712256192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XZ75BnB0OJohiFRpJTmsd9bDLFQ+7XqtRdJ1y+m5VY=;
        b=I+EMOSmTsI0dm3hVVEjF9SaB869Jzvx9HLt8HH2ChufB7PuZBHqQ7h6A8ZKY/2cGXp
         NuQ7V9+DjnoMMnQI4i6eMv6LVFjLzApO8s2g9YPtzenf+wycqEqFPKqwPYin2doSsxYt
         gYtk3j4oZ/3jr0z23A2iHVuV+mwUcclddMPKlAb+yzVHAUWJn7hVdI/NzqRHbcBCI5C2
         U10Azc2y2YveAAh6H06d3dOtuRnZ7GK48Wi6J4gZDNwjHLjBgG4Bqw8dN2IA+M7IyO9X
         fQzV4brjNcbyVTlyPsYhHa5ICgVsT8azMcwYylxVm5b//vbaVPzO6HP0hcTyzUuPQfNP
         al2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651392; x=1712256192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XZ75BnB0OJohiFRpJTmsd9bDLFQ+7XqtRdJ1y+m5VY=;
        b=MLmj38VuaDGyvQf0wbT+StbwR//fiIzeJTyxeFeBGZGUQFRUWpYq0SEM26zZpKKHJY
         +rTwOJNu9uxDyAwJuBloqc3ZOAizq6gTEqOr8drC/RBtbktCx7HrCXpqSW/+/wcwHwC1
         mzrrVlzJyOahBHPMPrkak7tRvSlVYKv+OCtME+sjECDVdnD6a7YnAIc2TvsieeBnL/4a
         4o1z08s8pC8N7XlqBvfqOyKx7YmRZC0QNekCYbiLhTG3xZ2cAsPq6yH59SYAa7HgkPs8
         gIlUqHEMDSKIw+ov2GOINdpQxvdP7k47cQg8T0GIJmkoUeFA29JcPJBN3BguGlZ4O8TU
         ymcQ==
X-Gm-Message-State: AOJu0Ywi+T3+AwtJGUKwXqDMS+3ESiz7+0z0NZQCrfxXwlv5zMAaqNSz
	vyufY6DhpF2oBE2cT1NPBWkWgypW602IHiOWXM5DQWmAq4S3O/gCoH8sAl+8LZzYGA==
X-Google-Smtp-Source: AGHT+IFHSIyPyvqJRj8oOpAm2/qzPY9ZV9E/yQl0bMnRTKVepJh28lyfD7aAXzPZfo6X8pw1b8Rg6w==
X-Received: by 2002:ac5:cb08:0:b0:4d0:36e3:40c3 with SMTP id r8-20020ac5cb08000000b004d036e340c3mr201711vkl.13.1711651390628;
        Thu, 28 Mar 2024 11:43:10 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id oo14-20020a056214450e00b00690c9256676sm874425qvb.49.2024.03.28.11.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:43:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.6: update to v6.6.23
Date: Thu, 28 Mar 2024 14:43:03 -0400
Message-Id: <def5eaeaab8f6d1be31717ee6a6d2aa64b5e6beb.1711651290.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711651290.git.bruce.ashfield@gmail.com>
References: <cover.1711651290.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197606

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    5c7587f69194 Linux 6.6.23
    5ad5dcfd7543 x86/efistub: Don't clear BSS twice in mixed mode
    ae863aa18493 x86/efistub: Clear decompressor BSS in native EFI entrypoint
    31423f464fdd dm-integrity: align the outgoing bio in integrity_recheck
    5cfcea648834 dm io: Support IO priority
    b6dfcdbc8037 selftests: forwarding: Fix ping failure due to short timeout
    62b1f837b15c spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
    79846fdcc548 netfilter: nf_tables: Fix a memory leak in nf_tables_updchain
    16f55acf58e2 net: dsa: mt7530: fix handling of all link-local frames
    25a2f73ee7d1 net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
    5fcee137dbd9 bpf: report RCU QS in cpumap kthread
    e92971a7ed42 net: report RCU QS on threaded NAPI repolling
    c26190214512 rcu: add a helper to report consolidated flavor QS
    4d37f12707ee netfilter: nf_tables: do not compare internal table flags on updates
    ff9005077141 netfilter: nft_set_pipapo: release elements in clone only from destroy path
    dc29dd00705a octeontx2-af: Use separate handlers for interrupts
    85724ee6e274 octeontx2-pf: Send UP messages to VF only when VF is up.
    b96b278c8213 octeontx2-pf: Use default max_active works instead of one
    1a2ce88ab3a9 octeontx2-pf: Wait till detach_resources msg is complete
    c6354b85fa7c octeontx2: Detect the mbox up or down message via register
    7d8c7bc99a33 devlink: fix port new reply cmd type
    3a9f78b297e0 net/bnx2x: Prevent access to a freed page in page_pool
    338580a7fb9b dm-integrity: fix a memory leak when rechecking the data
    4a73b5ac78eb net: phy: fix phy_read_poll_timeout argument type in genphy_loopback
    3006137ed68a ceph: stop copying to iter at EOF on sync reads
    a4cbcc4c4546 ipv4: raw: Fix sending packets from raw sockets via IPsec tunnels
    0f25725d62d9 hsr: Handle failures in module init
    4a4dffdff9ea rds: introduce acquire/release ordering in acquire/release_in_xmit()
    78739d72f16b wireguard: receive: annotate data-race around receiving_counter.counter
    e142169aca55 virtio: packed: fix unmap leak for indirect desc table
    bf6f4d5d8c6f vdpa/mlx5: Allow CVQ size changes
    cddd85da38b9 vdpa_sim: reset must not run
    296e6678a432 drm: Fix drm_fixp2int_round() making it add 0.5
    720a92c24d4e spi: spi-imx: fix off-by-one in mx51 CPU mode burst length
    5c1e6df309ca net: dsa: mt7530: prevent possible incorrect XTAL frequency selection
    8c1901e75ccc net: veth: do not manipulate GRO when using XDP
    6312d88f9f67 xfrm: Allow UDP encapsulation only in offload modes
    2c02c5059c78 packet: annotate data-races around ignore_outgoing
    cfbb3abadc33 xen/events: increment refcnt only if event channel is refcounted
    99e425032c6e xen/evtchn: avoid WARN() when unbinding an event channel
    f0f52af461df riscv: Fix compilation error with FAST_GUP and rv32
    4cbc5e93bf6e io_uring: fix poll_remove stalled req completion
    943c14ece95e net: ethernet: mtk_eth_soc: fix PPE hanging issue
    1f32abb474c1 net: mediatek: mtk_eth_soc: clear MAC_MCR_FORCE_LINK only when MAC is up
    ff2f90f88d78 nvme: fix reconnection fail due to reserved tag allocation
    dd3ffa27270e net: txgbe: fix clk_name exceed MAX_DEV_ID limits
    39cc316fb3bc hsr: Fix uninit-value access in hsr_get_node()
    aba8659caf88 vmxnet3: Fix missing reserved tailroom
    856baaa100cd tcp: Fix refcnt handling in __inet_hash_connect().
    0b6f39c175ba io_uring: Fix release of pinned pages when __io_uaddr_map fails
    9d47d2e7f82d cpufreq: Fix per-policy boost behavior on SoCs using cpufreq_boost_set_sw()
    fa92366e413f soc: fsl: dpio: fix kcalloc() argument order
    6915b1b28fe5 net/sched: taprio: proper TCA_TAPRIO_TC_ENTRY_INDEX check
    517a2390cd8d s390/vtime: fix average steal time calculation
    32eeb4b5ecd8 octeontx2-af: Use matching wake_up API variant in CGX command interface
    f901ee07853c rds: tcp: Fix use-after-free of net in reqsk_timer_handler().
    363ceb44305d tcp: Fix NEW_SYN_RECV handling in inet_twsk_purge()
    123c3bcc04cf nouveau: reset the bo resource bus info after an eviction
    a982368a13be ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates
    da83ed350e46 spi: lpspi: Avoid potential use-after-free in probe()
    e627c433c83d io_uring: don't save/restore iowait state
    2584d6bbc2bc thermal/drivers/qoriq: Fix getting tmu range
    2db869da91af thermal/drivers/mediatek/lvts_thermal: Fix a memory leak in an error handling path
    13eccd707039 ASoC: tlv320adc3xxx: Don't strip remove function when driver is builtin
    3d6af30f177f x86/hyperv: Use per cpu initial stack for vtl context
    68c001047b83 usb: gadget: net2272: Use irqflags in the call to net2272_probe_fin
    40f0170f2278 staging: greybus: fix get_channel_from_mode() failure path
    da19b8c892bf serial: 8250_exar: Don't remove GPIO device on suspend
    b2725efd184c rtc: mt6397: select IRQ_DOMAIN instead of depending on it
    ca5e22042c59 hwtracing: hisi_ptt: Move type check to the beginning of hisi_ptt_pmu_event_init()
    0c9254770814 bus: mhi: ep: check the correct variable in mhi_ep_register_controller()
    9066bec62f52 iio: gts-helper: Fix division loop
    3328ff75f642 kconfig: fix infinite loop when expanding a macro at the end of file
    afce13580a16 coresight: etm4x: Set skip_power_up in etm4_init_arch_data function
    b7bcc2c269ce coresight: Fix issue where a source device's helpers aren't disabled
    e23d162e4d81 arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells
    e0d4a4d37362 tty: serial: samsung: fix tx_empty() to return TIOCSER_TEMT
    2ab4e1f70c23 serial: max310x: fix syntax error in IRQ error message
    6d99e673264d tty: vt: fix 20 vs 0x20 typo in EScsiignore
    0255a3b17b1c usb: phy: generic: Get the vbus supply
    330e860a08a0 iio: pressure: mprls0025pa fix off-by-one enum
    f01a856edc70 remoteproc: stm32: Fix incorrect type assignment returned by stm32_rproc_get_loaded_rsc_tablef
    b82db393a953 remoteproc: stm32: Fix incorrect type in assignment for va
    9c4c28ba316e mei: gsc_proxy: match component when GSC is on different bus
    631cc575ebc4 comedi: comedi_test: Prevent timers rescheduling during deletion
    f263cf1626b5 io_uring/net: correct the type of variable
    7ca651b4ec4a nfs: fix panic when nfs4_ff_layout_prepare_ds() fails
    106e14ca55a0 afs: Revert "afs: Hide silly-rename files from userspace"
    7be89bd65f16 perf/x86/amd/core: Avoid register reset when CPU is dead
    b386f5dda0a8 f2fs: zone: fix to remove pow2 check condition for zoned block device
    c92f2927df86 f2fs: fix to truncate meta inode pages forcely
    cfd217f6464d f2fs: introduce f2fs_invalidate_internal_cache() for cleanup
    f0bf89e84c3a f2fs: compress: fix reserve_cblocks counting error when out of space
    4d1a3b791c5d f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
    cda2f3d1754a NFSv4.1/pnfs: fix NFS with TLS in pnfs
    7f029d2438a0 NFS: Fix an off by one in root_nfs_cat()
    ad27382f8495 NFS: Fix nfs_netfs_issue_read() xarray locking for writeback interrupt
    f83f1bdac289 Input: iqs7222 - add support for IQS7222D v1.1 and v1.2
    304bc00ee198 RDMA/mana_ib: Fix bug in creation of dma regions
    fa36f5ff74f0 f2fs: ro: compress: fix to avoid caching unaligned extent
    e690dddae437 f2fs: fix to use correct segment type in f2fs_allocate_data_block()
    490510e6082f watchdog: stm32_iwdg: initialize default timeout
    281481d64418 watchdog: starfive: Check pm_runtime_enabled() before decrementing usage counter
    eb1845a8cdb9 f2fs: check number of blocks in a current section
    41e8018b45ec f2fs: compress: fix to check compress flag w/ .i_sem lock
    26e177cffce2 NFSv4.2: fix listxattr maximum XDR buffer size
    79cdcc765969 NFSv4.2: fix nfs4_listxattr kernel BUG at mm/usercopy.c:102
    5e5038413d57 net: sunrpc: Fix an off by one in rpc_sockaddr2uaddr()
    9deb2010aa9f f2fs: compress: fix to check zstd compress level correctly in mount option
    7525dec4b34c f2fs: fix to create selinux label during whiteout initialization
    a2b6d56416dd scsi: bfa: Fix function pointer type mismatch for hcb_qe->cbfn
    fd8de7292414 RDMA/rtrs-clt: Check strnlen return len in sysfs mpath_policy_store()
    034977c33b4a RDMA/device: Fix a race between mad_client and cm_client init
    522e5e477062 RDMA/hns: Fix mis-modifying default congestion control algorithm
    076acd671fc6 i3c: dw: Disable IBI IRQ depends on hot-join and SIR enabling
    ccb6998cbc7d scsi: csiostor: Avoid function pointer casts
    8844b2f8a3f0 f2fs: fix to avoid potential panic during recovery
    5e59e199f3a6 f2fs: compress: fix to cover f2fs_disable_compressed_file() w/ i_sem
    8e2ea8b04cb8 f2fs: fix NULL pointer dereference in f2fs_submit_page_write()
    10b19ea7146d f2fs: zone: fix to wait completion of last bio in zone correctly
    0386408036bf f2fs: fix to remove unnecessary f2fs_bug_on() to avoid panic
    bc1e39928c26 f2fs: compress: fix to avoid inconsistence bewteen i_blocks and dnode
    eb6d30bca0f2 f2fs: update blkaddr in __set_data_blkaddr() for cleanup
    dcd6b38ba2e8 f2fs: introduce get_dnode_addr() to clean up codes
    5690754e4089 f2fs: delete obsolete FI_DROP_CACHE
    eaf3389c8545 f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
    d415e1c96599 f2fs: compress: fix to check unreleased compressed cluster
    75abfd61392b f2fs: compress: fix to cover normal cluster write with cp_rwsem
    82704e598d7b f2fs: compress: fix to guarantee persisting compressed blocks by CP
    85570b91e482 RDMA/srpt: Do not register event handler until srpt device is fully setup
    b9ad0e9217a1 RDMA/irdma: Remove duplicate assignment
    22cad1b841a6 ALSA: usb-audio: Stop parsing channels bits when all channels are found.
    de4bfe60b030 ALSA: hda/tas2781: restore power state after system_resume
    ee4a82135de3 ALSA: hda/tas2781: configure the amp after firmware load
    93cc238b7f56 ALSA: hda/tas2781: do not call pm_runtime_force_* in system_resume/suspend
    939dbde00950 ALSA: hda/tas2781: add ptrs to calibration functions
    c27f8b739f9b ALSA: hda/tas2781: do not reset cur_* values in runtime_suspend
    e965f1152b0c ALSA: hda/tas2781: add lock to system_suspend
    5796fe3fa432 ALSA: hda/tas2781: use dev_dbg in system_resume
    cf850ab86f6f ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
    e45deec35bf7 cifs: Fix writeback data corruption
    d3c792357cda cifs: Don't use certain unnecessary folio_*() functions
    2e411c57562f smb: do not test the return value of folio_start_writeback()
    57541d8c89c0 PCI: brcmstb: Fix broken brcm_pcie_mdio_write() polling
    0801c893fd48 clk: zynq: Prevent null pointer dereference caused by kmalloc failure
    a5d9b1aa61b4 clk: Fix clk_core_get NULL dereference
    73f06dadb60b sparc32: Fix section mismatch in leon_pci_grpci
    26343bc16089 backlight: lp8788: Fully initialize backlight_properties during probe
    7117253138bd backlight: lm3639: Fully initialize backlight_properties during probe
    6b97127d3fe1 backlight: da9052: Fully initialize backlight_properties during probe
    099d15c6b501 backlight: lm3630a: Don't set bl->props.brightness in get_brightness
    28a2568eb115 backlight: lm3630a: Initialize backlight_properties on init
    f582a2491030 backlight: ktz8866: Correct the check for of_property_read_u32
    f3dfffb34474 leds: sgm3140: Add missing timer cleanup and flash gpio control
    e3f63060736f leds: aw2013: Unlock mutex before destroying it
    ffc331a37e29 powerpc/embedded6xx: Fix no previous prototype for avr_uart_send() etc.
    8ee19caaaa64 mfd: cs42l43: Fix wrong GPIO_FN_SEL and SPI_CLK_CONFIG1 defaults
    8c61e3beb03e modules: wait do_free_init correctly
    1fc5edeb3c6e drm/msm/dpu: add division of drm_display_mode's hskew parameter
    b8db7d833ff4 clk: qcom: gcc-ipq5018: fix register offset for GCC_UBI0_AXI_ARES reset
    3ad0f4162175 clk: qcom: gcc-ipq5018: fix 'halt_reg' offset of 'gcc_pcie1_pipe_clk'
    40c37683535b clk: qcom: gcc-ipq5018: fix 'enable_reg' offset of 'gcc_gmac0_sys_clk'
    c2c3bdaee224 powerpc/hv-gpci: Fix the H_GET_PERF_COUNTER_INFO hcall return value checks
    1699fb915b9f powerpc/pseries: Fix potential memleak in papr_get_attr()
    30d1366b4814 mfd: cs42l43: Fix wrong register defaults
    a3dd12b64ae8 drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip
    37e0f758e057 gpio: nomadik: fix offset bug in nmk_pmx_set()
    310ae9eb3d2a drm/amd/pm: Fix esm reg mask use to get pcie speed
    4f14cbcd0b5c drm/tests: helpers: Include missing drm_drv header
    e55093c542d9 arm64: ftrace: Don't forbid CALL_OPS+CC_OPTIMIZE_FOR_SIZE with Clang
    7334b815d202 media: mediatek: vcodec: avoid -Wcast-function-type-strict warning
    7393c681f9aa media: ttpci: fix two memleaks in budget_av_attach
    f31c1cc37411 media: go7007: fix a memleak in go7007_load_encoder
    8fad9c5bb00d media: dvb-frontends: avoid stack overflow warnings with clang
    8e60b99f6b7c media: pvrusb2: fix uaf in pvr2_context_set_notify
    bf13e50a4b76 drm/amdgpu: Fix missing break in ATOM_ARG_IMM Case of atom_get_src_int()
    54bec46280c1 HID: amd_sfh: Avoid disabling the interrupt
    c691d69fed1e HID: amd_sfh: Update HPD sensor structure elements
    dfde5becadf6 perf pmu: Fix a potential memory leak in perf_pmu__lookup()
    05173ef70742 ASoC: meson: axg-tdm-interface: add frame rate constraint
    923d95bae79a ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
    8529c215360b mtd: rawnand: lpc32xx_mlc: fix irq handler prototype
    6853209fd36a mtd: maps: physmap-core: fix flash size larger than 32-bit
    e0cbea9a3c59 clk: imx: imx8mp: Fix SAI_MCLK_SEL definition
    1dce1cee2488 drm/tidss: Fix sync-lost issue with two displays
    7a3cb96d72f4 drm/tidss: Fix initial plane zpos values
    f104e5629476 crypto: jitter - fix CRYPTO_JITTERENTROPY help text
    7c5001d9d8e4 crypto: qat - fix ring to service map for dcc in 4xxx
    9ca3af17808d crypto: qat - relocate and rename get_service_enabled()
    a3eb010943ae crypto: qat - move adf_cfg_services
    f5aa20882eea crypto: qat - avoid division by zero
    6a28ba59e477 crypto: ccp - Avoid discarding errors in psp_send_platform_access_msg()
    7baf1151c336 crypto: arm/sha - fix function cast warnings
    f88698d6459c perf print-events: make is_event_supported() more robust
    18421148eed7 mfd: altera-sysmgr: Call of_node_put() only when of_parse_phandle() takes a ref
    1b01e66c1ce4 mfd: syscon: Call of_node_put() only when of_parse_phandle() takes a ref
    81d998e18311 media: i2c: imx290: Fix IMX920 typo
    069e1bd0ad2d media: ivsc: csi: Swap SINK and SOURCE pads
    f33bf922d49d drm/tegra: put drm_gem_object ref on error in tegra_fb_create
    6ff01b314149 clk: mediatek: mt7981-topckgen: flag SGM_REG_SEL as critical
    56b8f242ebaf clk: mediatek: mt8183: Correct parent of CLK_INFRA_SSPM_32K_SELF
    de3340533bd6 clk: mediatek: mt7622-apmixedsys: Fix an error handling path in clk_mt8135_apmixed_probe()
    19a66e36c228 clk: mediatek: mt8135: Fix an error handling path in clk_mt8135_apmixed_probe()
    95d1f1228c1b clk: hisilicon: hi3559a: Fix an erroneous devm_kfree()
    0c55334f731e clk: hisilicon: hi3519: Release the correct number of gates in hi3519_clk_unregister()
    93664eb8d640 pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm
    1dee290109e3 PCI: Mark 3ware-9650SE Root Port Extended Tags as broken
    87a5a9169c40 drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
    d4d8162d725d drm/panel: boe-tv101wum-nl6: make use of prepare_prev_first
    f610c46771ef drm/amd/display: Add 'replay' NULL check in 'edp_set_replay_allow_active()'
    8863d8097a0f clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
    5b8d21f7edfd media: pvrusb2: fix pvr2_stream_callback casts
    1ff1f8c388f6 media: pvrusb2: remove redundant NULL check
    79159e7c485e media: go7007: add check of return value of go7007_read_addr()
    d164ddc21e98 media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
    8b50270c4aa0 media: sun8i-di: Fix chroma difference threshold
    9fd05afd5eef media: sun8i-di: Fix power on/off sequences
    5e56f933d24e media: sun8i-di: Fix coefficient writes
    0bf19d804736 media: cedrus: h265: Fix configuring bitstream size
    a039690d3232 NTB: fix possible name leak in ntb_register_device()
    fad132306512 drm: ci: use clk_ignore_unused for apq8016
    ced7df8b3c5c ASoC: SOF: Add some bounds checking to firmware data
    c9901903edfb powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
    d6585d694fb4 ASoC: meson: t9015: fix function pointer type mismatch
    b188c9e1d5d2 ASoC: meson: aiu: fix function pointer type mismatch
    0bbe598b5830 perf metric: Don't remove scale from counts
    40ae9bb1ddc7 perf stat: Avoid metric-only segv
    e40ef597e57c perf expr: Fix "has_event" function for metric style events
    435e7f647428 ALSA: seq: fix function cast warnings
    427322dccd98 clk: renesas: r8a779f0: Correct PFC/GPIO parent clock
    78dd26a1c1b3 clk: renesas: r8a779g0: Correct PFC/GPIO parent clocks
    e040f1fbe9ab drm/amd/display: fix NULL checks for adev->dm.dc in amdgpu_dm_fini()
    6fc5fb8ebef8 drm/radeon/ni: Fix wrong firmware size logging in ni_init_microcode()
    fd0ce43cbde3 drm/msm/dpu: Only enable DSC_MODE_MULTIPLEX if dsc_merge is enabled
    3bb4f4b16276 drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
    e2326c8ae3a6 dt-bindings: msm: qcom, mdss: Include ommited fam-b compatible
    149ad69e002d perf srcline: Add missed addr2line closes
    3e72d9d98036 perf thread_map: Free strlist on normal path in thread_map__new_by_tid_str()
    cfd9b1db6475 drivers/ps3: select VIDEO to provide cmdline functions
    23bc89fdce71 crypto: xilinx - call finalize with bh disabled
    44eb7b3b3695 PCI: switchtec: Fix an error handling path in switchtec_pci_probe()
    1bb68f30d8b6 PCI/P2PDMA: Fix a sleeping issue in a RCU read section
    42954c374534 quota: Properly annotate i_dquot arrays with __rcu
    e45e8aa2b70a quota: Fix rcu annotations of inode dquot pointers
    40a673b4b07e quota: Fix potential NULL pointer dereference
    cfa7009c18af clk: qcom: reset: Ensure write completion on reset de/assertion
    cbb2787620ca clk: qcom: reset: Commonize the de/assert functions
    8f3e68c6a3ff drm/amdgpu: Fix potential out-of-bounds access in 'amdgpu_discovery_reg_base_init()'
    6ed98a594bdb pinctrl: mediatek: Drop bogus slew rate register range for MT8192
    2969f5b83d07 pinctrl: mediatek: Drop bogus slew rate register range for MT8186
    779e8db7efb2 media: edia: dvbdev: fix a use-after-free
    0a96e0da9fd9 mtd: spinand: esmt: Extend IDs to 5 bytes
    90029b9c979b media: v4l2-mem2mem: fix a memleak in v4l2_m2m_register_entity
    4c86c772fef0 media: v4l2-tpg: fix some memleaks in tpg_alloc
    b64cc91c6d76 media: em28xx: annotate unchecked call to media_device_register()
    0cbefc7b5bda clk: meson: Add missing clocks to axg_clk_regmaps
    13696dc3ed17 perf bpf: Clean up the generated/copied vmlinux.h
    cfd2417c3be2 perf evsel: Fix duplicate initialization of data->id in evsel__parse_sample()
    9a5b6b47a34c media: v4l2: cci: print leading 0 on error
    66d8bafff7f4 clk: samsung: exynos850: Propagate SPI IPCLK rate change
    d6786cf3ccc0 pinctrl: renesas: r8a779g0: Add missing SCIF_CLK2 pin group/function
    21fe1069aa9c drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of newly-created MOBs
    ccf09255d89c ASoC: sh: rz-ssi: Fix error message print
    2d9fe7787af0 drm/amd/display: Fix potential NULL pointer dereferences in 'dcn10_set_output_transfer_func()'
    69a0a42bdfab perf pmu: Treat the msr pmu as software
    ad76fd30557d drm/amd/display: Fix a potential buffer overflow in 'dp_dsc_clock_en_read()'
    7e062c083dc9 HID: lenovo: Add middleclick_workaround sysfs knob for cptkbd
    e55c8abaadd9 perf record: Check conflict between '--timestamp-filename' option and pipe mode before recording
    1f7b3c801fa8 perf top: Uniform the event name for the hybrid machine
    d361a8ec7b20 perf record: Fix possible incorrect free in record__switch_output()
    ef8a156ca181 PCI/DPC: Print all TLP Prefixes, not just the first
    ae532eb08a28 media: cadence: csi2rx: use match fwnode for media link
    edbb3226c985 media: tc358743: register v4l2 async device only after successful setup
    6be2ed7243a6 dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
    88028c45d587 ASoC: SOF: amd: Fix memory leak in amd_sof_acp_probe()
    9439808c87e6 ASoC: amd: acp: Add missing error handling in sof-mach
    8e25c0ee5665 drm/lima: fix a memleak in lima_heap_alloc
    c5e834cf86fd drm/panel-edp: use put_sync in unprepare
    b241ee1e491d drm/rockchip: lvds: do not print scary message when probing defer
    33ea53cdd60d drm/rockchip: lvds: do not overwrite error code
    83e0f220d1e9 drm/vmwgfx: fix a memleak in vmw_gmrid_man_get_node
    9556c1676730 drm/vkms: Avoid reading beyond LUT array
    bac3d37d2f7c drm: Don't treat 0 as -1 in drm_fixp2int_ceil
    9ac30fb8fae6 drm/rockchip: inno_hdmi: Fix video timing
    c5825eff7750 drm/tegra: output: Fix missing i2c_put_adapter() in the error handling paths of tegra_output_probe()
    845322a9c06d drm/tegra: rgb: Fix missing clk_put() in the error handling paths of tegra_dc_rgb_probe()
    20a176aeba9a drm/tegra: rgb: Fix some error handling paths in tegra_dc_rgb_probe()
    3f5f7810dbc5 drm/tegra: hdmi: Fix some error handling paths in tegra_hdmi_probe()
    79a7e4019e30 drm/tegra: dsi: Fix missing pm_runtime_disable() in the error handling path of tegra_dsi_probe()
    d4ae74ad1988 drm/tegra: dsi: Fix some error handling paths in tegra_dsi_probe()
    58252c351c8f drm/tegra: dpaux: Fix PM disable depth imbalance in tegra_dpaux_probe
    52aa507148c4 drm/tegra: dsi: Add missing check for of_find_device_by_node
    15a3fc5c8774 dm: call the resume method on internal suspend
    9f926ba25343 dm raid: fix false positive for requeue needed during reshape
    535fb2160ade bpf: hardcode BPF_PROG_PACK_SIZE to 2MB * num_possible_nodes()
    408ba7fd04f9 nfp: flower: handle acti_netdevs allocation failure
    138cca05a83a net/x25: fix incorrect parameter validation in the x25_getsockopt() function
    cddf9fc70b06 net: kcm: fix incorrect parameter validation in the kcm_getsockopt) function
    48f1ffc935fa udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
    4865e9fb565c l2tp: fix incorrect parameter validation in the pppol2tp_getsockopt() function
    e82ae490a9cd ipmr: fix incorrect parameter validation in the ip_mroute_getsockopt() function
    0709f6fa131b tcp: fix incorrect parameter validation in the do_tcp_getsockopt() function
    b64a1b4f4760 OPP: debugfs: Fix warning around icc_get_name()
    145cd3e36e99 erofs: fix lockdep false positives on initializing erofs_pseudo_mnt
    51b27119196c erofs: fix handling kern_mount() failure
    613139a0303d erofs: Convert to use bdev_open_by_path()
    dd0bd4291250 block: Provide bdev_open_* functions
    3721c63d3002 net: phy: dp83822: Fix RGMII TX delay configuration
    6dda052ee1e5 Bluetooth: Fix eir name length
    9017a4f37437 net: hns3: fix port duplex configure error in IMP reset
    f0b5225a7dfc net: hns3: fix kernel crash when 1588 is received on HIP08 devices
    a8cbdc98b37e net: hns3: fix wrong judgment condition issue
    589ec16174dd net: phy: fix phy_get_internal_delay accessing an empty array
    c4c857723b37 net: ip_tunnel: make sure to pull inner header in ip_tunnel_rcv()
    2db74b0d8748 ipv6: fib6_rules: flush route cache when rule is changed
    582a7eba2c25 iommu: Fix compilation without CONFIG_IOMMU_INTEL
    7070b274c786 bpf: Fix stackmap overflow check on 32-bit arches
    8435f0961bf3 bpf: Fix hashtab overflow check on 32-bit arches
    250051acc21f bpf: Fix DEVMAP_HASH overflow check on 32-bit arches
    eabb38ad015e s390/cache: prevent rebuild of shared_cpu_list
    e39a3a14eafc sr9800: Add check for usbnet_get_endpoints
    a23546053eef Bluetooth: fix use-after-free in accessing skb after sending it
    64be3c615488 Bluetooth: af_bluetooth: Fix deadlock
    620b9e60e4b5 Bluetooth: btusb: Fix memory leak
    98e9920c75e0 Bluetooth: msft: Fix memory leak
    36626c26bed6 Bluetooth: msft: __hci_cmd_sync() doesn't return NULL
    a41c8efe659c Bluetooth: hci_core: Fix possible buffer overflow
    dd163fa34c48 Bluetooth: btrtl: fix out of bounds memory access
    5939db19db73 Bluetooth: hci_h5: Add ability to allocate memory for private data
    2af7aa6685e2 Bluetooth: hci_sync: Fix overwriting request callback
    0ce1229cbba6 Bluetooth: hci_core: Cancel request on command timeout
    988b77ba0df0 Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()
    0b3df53c9d3a Bluetooth: hci_event: Fix not indicating new connection for BIG Sync
    cd5d26a9488e Bluetooth: Remove BT_HS
    47b1b88008e0 Bluetooth: Remove superfluous call to hci_conn_check_pending()
    b439de9f7cbf Bluetooth: mgmt: Remove leftover queuing of power_off work
    54ab126c844a Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
    f054ffeeb031 ice: fix stats being updated by way too large values
    bcb6d9fad06f igb: Fix missing time sync events
    9bfb3503245f igc: Fix missing time sync events
    2b74b2a92e52 iommu/vt-d: Don't issue ATS Invalidation request when device is disconnected
    e33ee8d5e6fc PCI: Make pci_dev_is_disconnected() helper public for other drivers
    df62e22c2e27 wifi: brcm80211: handle pmk_op allocation failure
    6cada014b245 wifi: rtw88: 8821c: Fix false alarm count
    6195fc512109 wifi: rtw88: 8821c: Fix beacon loss and disconnect
    40243da588a0 wifi: rtw88: 8821cu: Fix firmware upload fail
    fa797951513c ACPI: CPPC: enable AMD CPPC V2 support for family 17h processors
    1155f56ce76d mmc: wmt-sdmmc: remove an incorrect release_mem_region() call in the .remove function
    f91a731ffc3b arm64: dts: qcom: sm8550: Fix SPMI channels size
    5e6013ae2c8d SUNRPC: fix some memleaks in gssx_dec_option_array
    99044c01ed53 SUNRPC: fix a memleak in gss_import_v2_context
    af2a9f98d884 x86, relocs: Ignore relocations in .notes section
    1cbdc6f36850 objtool: Fix UNWIND_HINT_{SAVE,RESTORE} across basic blocks
    2babfee5d4a2 arm64: dts: rockchip: drop rockchip,trcm-sync-tx-only from rk3588 i2s
    b22efd4ecab2 arm64: dts: rockchip: fix reset-names for rk356x i2s2 controller
    8c0c1139e9e6 arm64: dts: rockchip: add missing interrupt-names for rk356x vdpu
    6e7ecc7741ab ACPI: scan: Fix device check notification handling
    92cf658326ad ACPI: resource: Add MAIBENBEN X577 to irq1_edge_low_force_override
    588d59b5d5d1 ACPI: resource: Do IRQ override on Lunnen Ground laptops
    dce8c4bd9cf9 ACPI: resource: Add Infinity laptops to irq1_edge_low_force_override
    d6433a9cc72c arm64: dts: marvell: reorder crypto interrupts on Armada SoCs
    630ed2bb6f4d gpiolib: Pass consumer device through to core in devm_fwnode_gpiod_get_index()
    271d0efed20a regulator: userspace-consumer: add module device table
    656311b9bf9e arm64: dts: imx8mp-evk: Fix hdmi@3d node
    1d77f1f28300 arm64: dts: imx8mp: Set SPI NOR to max 40 MHz on Data Modul i.MX8M Plus eDM SBC
    733d6599163a ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node
    a193e542c832 ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
    832f0faddc2c arm64: dts: allwinner: h6: Add RX DMA channel for SPDIF
    4cdf9006fc09 pstore: inode: Only d_invalidate() is needed
    952d8a809351 pstore: inode: Convert mutex usage to guard(mutex)
    be50365391a7 net: mctp: copy skb ext data when fragmenting
    8f39d2e9d806 arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes
    0986e6324106 arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
    25d7fe04096a arm64: dts: renesas: rzg2l: Add missing interrupts to IRQC nodes
    9d5d48d9fe34 wifi: mt76: mt792x: fix a potential loading failure of the 6Ghz channel config from ACPI
    c7dd42fbebcf wifi: mt76: mt7921e: fix use-after-free in free_irq()
    cb8ae15877b0 wifi: mt76: mt792x: fix ethtool warning
    4bb175d465a1 wifi: mt76: mt7996: fix HIF_TXD_V2_1 value
    0e8c4809ddb5 wifi: mt76: mt7996: fix efuse reading issue
    9d87f925afce wifi: mt76: mt7996: fix HE beamformer phy cap for station vif
    a1eb16a051a3 wifi: mt76: mt7996: fix incorrect interpretation of EHT MCS caps
    e6ed68cbace5 wifi: mt76: mt7996: fix TWT issues
    f1773a106c42 memory: tegra: Correct DLA client names
    45de92bba120 ARM: dts: arm: realview: Fix development chip ROM compatible value
    0f7bdcbb0fcb wifi: wilc1000: revert reset line logic flip
    3e4ca4a721ac arm64: dts: ti: k3-am62p: Fix memory ranges for DMSS
    857f56db8c3a firmware: arm_scmi: Fix double free in SMC transport cleanup path
    d515b758d56c arm64: dts: ti: Add common1 register space for AM62x SoC
    d8b1f0effb7f arm64: dts: ti: Add common1 register space for AM65x SoC
    c5e988aca5d0 arm64: dts: mt8195-cherry-tomato: change watchdog reset boot flow
    ddca1e4fb34d arm64: dts: ti: k3-am64-main: Fix ITAP/OTAP values for MMC
    b0e4672f4e21 arm64: dts: ti: k3-am64: Enable SDHCI nodes at the board level
    b024e6732327 arm64: dts: ti: k3-am642-sk: Add boot phase tags marking
    91e057f66151 arm64: dts: ti: k3-am642-evm: Add boot phase tags marking
    acf9ac51af48 arm64: dts: ti: k3-j784s4-evm: Remove Pinmux for CTS and RTS in wkup_uart0
    82a1f7c758fb arm64: dts: ti: k3-j721s2-common-proc-board: Remove Pinmux for CTS and RTS in wkup_uart0
    4182b4b76a98 arm64: dts: ti: k3-j7200-common-proc-board: Remove clock-frequency from mcu_uart0
    c9fc538fc946 arm64: dts: ti: k3-j7200-common-proc-board: Modify Pinmux for wkup_uart0 and mcu_uart0
    f5dd253943e7 net: ena: Remove ena_select_queue
    3b454d50e41d powercap: dtpm_cpu: Fix error check against freq_qos_add_request()
    9f31b114d408 arm64: dts: qcom: sm8150: correct PCIe wake-gpios
    d2a519c72ebb arm64: dts: qcom: sm8150: use 'gpios' suffix for PCI GPIOs
    4853a673327a arm64: dts: qcom: sdm845-db845c: correct PCIe wake-gpios
    f8e360c73bdf wifi: brcmsmac: avoid function pointer casts
    3438dccde560 iommu/amd: Mark interrupt as managed
    c69d39288dbe bus: tegra-aconnect: Update dependency to ARCH_TEGRA
    3d48e5be1074 ACPI: processor_idle: Fix memory leak in acpi_processor_power_exit()
    a34c44b605c4 arm64: dts: ti: k3-am62-main: disable usb lpm
    3da9d32b7f4a wifi: wilc1000: prevent use-after-free on vif when cleaning up all interfaces
    af35d0639a33 cpufreq: qcom-hw: add CONFIG_COMMON_CLK dependency
    cfdca1154f82 arm64: dts: mediatek: mt8186: Add missing xhci clock to usb controllers
    8781c3f4d848 arm64: dts: mediatek: mt8186: Add missing clocks to ssusb power domains
    8a56f8da9655 ARM: dts: qcom: msm8974: correct qfprom node size
    7cff695d84dc soc: qcom: llcc: Check return value on Broadcast_OR reg read
    9fce71d05648 arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX for SLPI
    e36373dc5eee bpf: Mark bpf_spin_{lock,unlock}() helpers with notrace correctly
    15c8de52b3bc wifi: iwlwifi: mvm: Fix the listener MAC filter flags
    887407b622f8 can: m_can: Start/Cancel polling timer together with interrupts
    248ebf21e860 arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
    b5d11a01fb1a arm64: dts: mediatek: mt8186: fix VENC power domain clocks
    a067a7cefce2 arm64: dts: mediatek: mt8192: fix vencoder clock name
    889f133834b3 arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
    0ae767338a85 arm64: dts: mediatek: mt7986: add "#reset-cells" to infracfg
    8fa8e91f8ad0 arm64: dts: mediatek: mt7986: drop "#clock-cells" from PWM
    13147d172922 arm64: dts: mediatek: mt7986: fix SPI nodename
    f6e13a87aae4 arm64: dts: mediatek: mt7986: fix SPI bus width properties
    e30c3495361d arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
    7f318c21ed65 arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
    f24edae37423 arm64: dts: mt8183: Move CrosEC base detection node to kukui-based DTs
    26d4bac55750 ipv6: mcast: remove one synchronize_net() barrier in ipv6_mc_down()
    5ebcdbcb9e2c selftests: forwarding: Add missing multicast routing config entries
    7cb8a8ee4938 selftests: forwarding: Add missing config entries
    d19c74e20bc5 s390/vdso: drop '-fPIC' from LDFLAGS
    1cd9c4680748 s390/pai: fix attr_event_free upper limit for pai device drivers
    85074e3394a8 wifi: iwlwifi: mvm: don't set replay counters to 0xff
    b4f1b0b3b917 wifi: iwlwifi: mvm: don't set the MFP flag for the GTK
    67e7b24a70fe wifi: iwlwifi: mvm: fix erroneous queue index mask
    7559a34fc068 wifi: iwlwifi: support EHT for WH
    e4c4a0213029 tools/resolve_btfids: Fix cross-compilation to non-host endianness
    29d1ee8e7aa2 tools/resolve_btfids: Refactor set sorting with types from btf_ids.h
    e326c0d88849 pwm: sti: Fix capture for st,pwm-num-chan < st,capture-num-chan
    a3b17859c818 printk: Disable passing console lock owner completely during panic()
    75f1048672e7 wifi: ath12k: fix incorrect logic of calculating vdev_stats_id
    24648972fe5d arm64: dts: qcom: sm6115: declare VLS CLAMP register for USB3 PHY
    a535c7198b3c arm64: dts: qcom: qcm2290: declare VLS CLAMP register for USB3 PHY
    3a71ec74e5e3 wifi: wfx: fix memory leak when starting AP
    fa5bef5e80c6 libbpf: Use OPTS_SET() macro in bpf_xdp_query()
    da10f6b7918a wifi: libertas: fix some memleaks in lbs_allocate_cmd_buffer()
    4615164c4d09 wifi: ath11k: initialize rx_mcs_80 and rx_mcs_160 before use
    033984c98d79 arm64: dts: ti: k3-j784s4: Fix power domain for VTM node
    dbe156207532 arm64: dts: ti: k3-j721s2: Fix power domain for VTM node
    f91adad08237 net: blackhole_dev: fix build warning for ethh set but not used
    dae1b8166ca1 pwm: atmel-hlcdc: Fix clock imbalance related to suspend support
    93c17dc0cc14 arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
    04cd48311746 gpio: vf610: allow disabling the vf610 driver
    1cabe943729f wifi: iwlwifi: read BIOS PNVM only for non-Intel SKU
    c8dcee2052e2 wifi: iwlwifi: mvm: fix the TLC command after ADD_STA
    8b15cdc00f9e wifi: iwlwifi: mvm: d3: fix IPN byte order
    503431174b1a wifi: iwlwifi: fix EWRD table validity check
    82aebbd686c1 wifi: iwlwifi: mvm: initialize rates in FW earlier
    45eacd73727e wifi: iwlwifi: acpi: fix WPFC reading
    783d413f332a wifi: iwlwifi: dbg-tlv: ensure NUL termination
    70104eb71974 wifi: iwlwifi: mvm: report beacon protection failures
    3f6548bae353 wifi: ath12k: fix fetching MCBC flag for QCN9274
    bc3bfb638b51 wifi: ath12k: Update Qualcomm Innovation Center, Inc. copyrights
    f77ba3e04717 wifi: ath11k: change to move WMI_VDEV_PARAM_SET_HEMU_MODE before WMI_PEER_ASSOC_CMDID
    a015fbf698c8 wifi: ath9k: delay all of ath9k_wmi_event_tasklet() until init is complete
    738b192efdc7 libbpf: Add missing LIBBPF_API annotation to libbpf_set_memlock_rlim API
    00382885701b arm64: dts: imx8mm-kontron: Fix interrupt for RTC on OSM-S i.MX8MM module
    47d00e06659b arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL board
    413d325c3e35 arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL OSM-S board
    8c19e4a1c657 arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL board
    a6978973b490 arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL OSM-S board
    44033a1cb2a4 arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on SL/BL i.MX8MM
    0c3a9a2b4262 arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on OSM-S i.MX8MM
    fd4edeaa3772 selftests/bpf: Disable IPv6 for lwt_redirect test
    12955f97d602 arm64: dts: renesas: r8a779g0: Add missing SCIF_CLK2
    ef4f026bc9df arm64: dts: renesas: r8a779g0: Restore sort order
    d1db5c5bf196 arm64: dts: qcom: sa8540p: Drop gfx.lvl as power-domain for gpucc
    2b344ad37354 pmdomain: qcom: rpmhpd: Drop SA8540P gfx.lvl
    ed168d6c381c libbpf: Fix faccessat() usage on Android
    ff1a989b4a2f cpufreq: mediatek-hw: Don't error out if supply is not found
    01934a552cdb arm64: dts: qcom: sdm845-oneplus-common: improve DAI node naming
    447a83adaf85 soc: qcom: socinfo: rename PM2250 to PM4125
    6f05d724e1ae arm64: dts: qcom: sm8450: Add missing interconnects to serial
    debbb9987439 af_unix: Annotate data-race of gc_in_progress in wait_for_unix_gc().
    a9800dc6cf4a selftests/bpf: Wait for the netstamp_needed_key static key to be turned on
    f02bcb416a4f selftests/bpf: Fix the flaky tc_redirect_dtime test
    1ccc54df5797 selftests/bpf: Add netkit to tc_redirect selftest
    72f1ba021198 selftests/bpf: De-veth-ize the tc_redirect test case
    e479ae4c9b46 wifi: ath12k: Fix issues in channel list update
    fb9f3f366850 selftest/bpf: Add map_in_maps with BPF_MAP_TYPE_PERF_EVENT_ARRAY values
    f33d3161f3bf libbpf: Apply map_set_def_max_entries() for inner_maps on creation
    308e65ed6068 selftests/bpf: Fix potential premature unload in bpf_testmod
    e9a89238b9fb bpftool: Silence build warning about calloc()
    9311cc6658b1 inet_diag: annotate data-races around inet_diag_table[]
    96ba0fc3b7a9 sock_diag: annotate data-races around sock_diag_handlers[family]
    1d938ac977b0 cpufreq: mediatek-hw: Wait for CPU supplies before probing
    b25b64a241d7 cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
    65400f7ef86e arm64: dts: qcom: sc8180x: Shrink aoss_qmp register space size
    75c279257574 arm64: dts: qcom: sc8180x: Require LOW_SVS vote for MMCX if DISPCC is on
    b2506fd0390d arm64: dts: qcom: sc8180x: Don't hold MDP core clock at FMAX
    eddaa65ee1f3 arm64: dts: qcom: sc8180x: Fix eDP PHY power-domains
    d217d75db861 arm64: dts: qcom: sc8180x: Add missing CPU off state
    e29688f14d83 arm64: dts: qcom: sc8180x: Fix up big CPU idle state entry latency
    d80997b55ff3 arm64: dts: qcom: sc8180x: Hook up VDD_CX as GCC parent domain
    6d4a320e16ba ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
    9ade676d2560 wifi: mwifiex: debugfs: Drop unnecessary error check for debugfs_create_dir()
    b66b008f1d37 wifi: wilc1000: fix multi-vif management when deleting a vif
    4041c60a9d54 wifi: wilc1000: do not realloc workqueue everytime an interface is added
    156012667b85 wifi: rtl8xxxu: add cancel_work_sync() for c2hcmd_work
    4bfd20d5f5c6 wifi: wilc1000: fix RCU usage in connect path
    da5deb0db48a wifi: wilc1000: fix declarations ordering
    7b9fe69c3b93 wifi: b43: Disable QoS for bcm4331
    d607e9ad6efa wifi: b43: Stop correct queue in DMA worker when QoS is disabled
    6b62086ef60b wifi: b43: Stop/wake correct queue in PIO Tx path when QoS is disabled
    bc845e2e42ca wifi: b43: Stop/wake correct queue in DMA Tx path when QoS is disabled
    10a342fa2fe4 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
    76b512a49f10 sched/fair: Take the scheduling domain into account in select_idle_core()
    495b7cb95200 sched/fair: Take the scheduling domain into account in select_idle_smt()
    e42c1df34e58 timekeeping: Fix cross-timestamp interpolation for non-x86
    9e4d5849b4cf timekeeping: Fix cross-timestamp interpolation corner case decision
    c56317c7ed46 timekeeping: Fix cross-timestamp interpolation on counter wrap
    835ae8a07a2a x86/sme: Fix memory encryption setting if enabled by default and not overridden
    1723d72da7ad x86/resctrl: Implement new mba_MBps throttling heuristic
    2e205eb59ea5 x86/resctrl: Read supported bandwidth sources from CPUID
    655f231bde27 x86/resctrl: Remove hard-coded memory bandwidth limit
    325956b0173f x86/mm: Ensure input to pfn_to_kaddr() is treated as a 64-bit type
    eb48680b0255 aoe: fix the potential use-after-free problem in aoecmd_cfg_pkts
    59a534690ecc io_uring/net: fix overflow check in io_recvmsg_mshot_prep()
    51d28472db8b io_uring/net: move receive multishot out of the generic msghdr path
    1a03310940bb io_uring/net: unify how recvmsg and sendmsg copy in the msghdr
    01df80b3e4d5 rtc: test: Fix invalid format specifier.
    491ed9f9ebaf time: test: Fix incorrect format specifier
    3c3d394b531f lib: memcpy_kunit: Fix an invalid format specifier in an assertion msg
    8d98a46b8b45 lib/cmdline: Fix an invalid format specifier in an assertion msg
    8c018386023b kunit: test: Log the correct filter string in executor_test
    c6f95031cf21 ovl: Always reject mounting over case-insensitive directories
    cc0918b3582c ovl: add support for appending lowerdirs one by one
    0d8097526ba8 ovl: refactor layer parsing helpers
    26532aeb3cec ovl: store and show the user provided lowerdir mount option
    1fff0482186b ovl: remove unused code in lowerdir param parsing
    108ae1b5cdef md: Don't clear MD_CLOSING when the raid is about to stop
    7a3894ec496e fs/select: rework stack allocation hack for clang
    b7f5aed55829 nbd: null check for nla_nest_start
    eba92d62cbc8 rcu/exp: Handle RCU expedited grace period kworker allocation failure
    6047cdf6fcce rcu/exp: Fix RCU expedited parallel grace period kworker allocation failure recovery
    ec09bcab32fc s390/dasd: fix double module refcount decrement
    0ef87c0bb4ee s390/dasd: Use dev_*() for device log messages
    7b8fa7a0c291 io_uring: remove unconditional looping in local task_work handling
    8c0a0ae8afc8 io_uring: remove looping around handling traditional task_work
    829b161b3557 fs: Fix rw_hint validation
    0ab2a85c8020 iomap: clear the per-folio dirty bits on all writeback failures
    7df62b8cca38 workqueue: Don't call cpumask_test_cpu() with -1 CPU in wq_update_node_max_active()
    5a70baec2294 workqueue: Implement system-wide nr_active enforcement for unbound workqueues
    b522229a5694 workqueue: Introduce struct wq_node_nr_active
    bd31fb926dfa workqueue: RCU protect wq->dfl_pwq and implement accessors for it
    5f99fee6f2de workqueue: Make wq_adjust_max_active() round-robin pwqs while activating
    4023a2d95076 workqueue: Move nr_active handling into helpers
    6c592f0bb968 workqueue: Replace pwq_activate_inactive_work() with [__]pwq_activate_work()
    bad184d26a4f workqueue: Factor out pwq_is_empty()
    82e098f5bed1 workqueue: Move pwq->max_active to wq->max_active
    43a181f8f41a workqueue.c: Increase workqueue name length
    c1362eae861d do_sys_name_to_handle(): use kzalloc() to fix kernel-infoleak
    47a03a1a335f ASoC: wm8962: Fix up incorrect error message in wm8962_set_fll
    2108a49ff25a ASoC: wm8962: Enable both SPKOUTR_ENA and SPKOUTL_ENA in mono mode
    e5ff56e824cc ASoC: wm8962: Enable oscillator if selecting WM8962_FLL_OSC
    bf18280d4338 Input: gpio_keys_polled - suppress deferred probe error for gpio
    52a85947ac12 xfrm: set skb control buffer based on packet offload as well
    4f77a8c21373 xfrm: fix xfrm child route lookup for packet offload
    5171cac6f5c3 ASoC: amd: yc: Add HP Pavilion Aero Laptop 13-be2xxx(8BD6) into DMI quirk table
    2984f26a4604 x86/hyperv: Allow 15-bit APIC IDs for VTL platforms
    a9fcd576b712 ASoC: Intel: bytcr_rt5640: Add an extra entry for the Chuwi Vi8 tablet
    adb19164baf0 arm64: tegra: Set the correct PHY mode for MGBE
    3ede8e94de6b perf: RISCV: Fix panic on pmu overflow handler
    e4cd40ba9afd firewire: core: use long bus reset on gap count error
    bdfc6e5310e5 Bluetooth: mgmt: Fix limited discoverable off timeout
    3ead59bafad0 Bluetooth: rfcomm: Fix null-ptr-deref in rfcomm_check_security
    2ffabb2066c0 ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
    b5f085b46f0e drm/amdgpu: Enable gpu reset for S3 abort cases on Raven series
    3396b5db215d ALSA: hda/realtek - ALC285 reduce pop noise from Headphone port
    c59d1a4e1277 scsi: mpt3sas: Prevent sending diag_reset when the controller is ready
    da7224eb17af ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
    61e24fd6c391 drm/ttm/tests: depend on UML || COMPILE_TEST
    d6e4c77b1245 wifi: mac80211: only call drv_sta_rc_update for uploaded stations
    7624a8ef847f net: smsc95xx: add support for SYS TEC USB-SPEmodule1
    f6d4d29a1265 btrfs: fix data race at btrfs_use_block_rsv() when accessing block reserve
    82220b1835ba btrfs: fix data races when accessing the reserved amount of block reserves
    f642b8f2e20c regulator: max5970: Fix regulator child node name
    0cce072e4185 ARM: dts: renesas: rcar-gen2: Add missing #interrupt-cells to DA9063 nodes
    024fb877723a arm64: dts: qcom: Fix interrupt-map cell sizes
    ac37cda44f06 arm: dts: Fix dtc interrupt_map warnings
    377602fc04af arm64: dts: Fix dtc interrupt_provider warnings
    ab7e3fe1287f arm: dts: Fix dtc interrupt_provider warnings
    978698aae59d dm-verity, dm-crypt: align "struct bvec_iter" correctly
    bf9e4b5f90be platform/x86: x86-android-tablets: Fix acer_b1_750_goodix_gpios name
    75bb19ed372d perf: CXL: fix CPMU filter value mask length
    0468ac562405 cxl/region: Allow out of order assembly of autodiscovered regions
    9f57eecf94ff cxl/region: Handle endpoint decoders in cxl_region_find_decoder()
    031b6233fe7e block: sed-opal: handle empty atoms when parsing response
    3a28164d9b0d parisc/ftrace: add missing CONFIG_DYNAMIC_FTRACE check
    61698b987b6d net/iucv: fix the allocation size of iucv_path_table array
    57f78c46f081 x86/mm: Disallow vsyscall page read for copy_from_kernel_nofault()
    aa18a46ef809 x86/mm: Move is_vsyscall_vaddr() into asm/vsyscall.h
    9fe96db9ccac riscv: dts: sifive: add missing #interrupt-cells to pmic
    8f5069af97ef ARM: dts: rockchip: Drop interrupts property from pwm-rockchip nodes
    19faac404968 RDMA/mlx5: Relax DEVX access upon modify commands
    9a624a5f9573 RDMA/mlx5: Fix fortify source warning while accessing Eth segment
    ddc1f16ea54c arm64: dts: rockchip: mark system power controller on rk3588-evb1
    4c11bcb119bf soc: microchip: Fix POLARFIRE_SOC_SYS_CTRL input prompt
    10a33d1d056b arm64/sve: Lower the maximum allocation for the SVE ptrace regset
    b98f2b8653de gen_compile_commands: fix invalid escape sequence warning
    3cac6eebea9b ASoC: SOF: ipc4-pcm: Workaround for crashed firmware on system suspend
    59ab1e455901 HID: multitouch: Add required quirk for Synaptics 0xcddc device
    ab63a80996d7 MIPS: Clear Cause.BD in instruction_pointer_set
    a9bbb05c0c04 x86/xen: Add some null pointer checking to smp.c
    994aecb412f2 ASoC: amd: yc: Fix non-functional mic on Lenovo 82UU
    d1b6521cecba regmap: kunit: Ensure that changed bytes are actually different
    ec33549be99f spi: intel-pci: Add support for Lunar Lake-M SPI serial flash
    c33afbcc9cd8 ASoC: rt5645: Make LattePanda board DMI match more precise
    071facc21c6e selftests: tls: use exact comparison in recv_partial
    4c3157dd6a1d selftests: openvswitch: Add validation for the recursion test
    1f87429485ec perf/arm-cmn: Workaround AmpereOneX errata AC04_MESH_1 (incorrect child count)
    ae668e2e60dc wifi: iwlwifi: mvm: use correct address 3 in A-MSDU
    ae25251ade01 ASoC: cs42l43: Handle error from devm_pm_runtime_enable
    b39b4d207d4f media: rkisp1: Fix IRQ handling due to shared interrupts
    2bbd65c6ca56 soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
    6fc19b3d8a45 io_uring: drop any code related to SCM_RIGHTS
    303c0a13833f io_uring/unix: drop usage of io_uring socket
    049f043fe8cd platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 50dff1c3ff..a44a08451a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1c3234ba160c59eb50739f23591a87daf09fac35"
-SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
+SRCREV_machine ?= "19813826de57a6425518c7b3daf8dd6a04d2321f"
+SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.22"
+LINUX_VERSION ?= "6.6.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d2304b1b49..db9e252572 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.22"
+LINUX_VERSION ?= "6.6.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
+SRCREV_machine ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 764ea67cf1..8fb9867a6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0873b6f725956acf2e6d57d720edd8a2177e18ce"
-SRCREV_machine:qemuarm64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemuloongarch64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemumips ?= "6a81581711b1cb35046c637ecfbb6b17a8abbcb5"
-SRCREV_machine:qemuppc ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemuriscv64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemuriscv32 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemux86 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemux86-64 ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_machine:qemumips64 ?= "6cb075269e42d03857c95ebc8b5f8e154f155add"
-SRCREV_machine ?= "ca83799fcbc094fdd52caec7c4dca64189acd842"
-SRCREV_meta ?= "70cabea69443e974db04d6dcbe73031d0d726bc1"
+SRCREV_machine:qemuarm ?= "ceb94a85299b59d8840ed7ed392b1d3e4c727678"
+SRCREV_machine:qemuarm64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemuloongarch64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemumips ?= "c79ffc89f8909f60de52005ef258db9752634eda"
+SRCREV_machine:qemuppc ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemuriscv64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemuriscv32 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemux86 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemux86-64 ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_machine:qemumips64 ?= "b0a73fa83073c8d7d7bc917bcbeac88d296ebe38"
+SRCREV_machine ?= "2d01bc1d4eeade12518371139dd24a21438f523c"
+SRCREV_meta ?= "f7f00b22efcfcae6489e9ec7db7002685fbc078b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6a646d9fe8a2bf8d25817ceddf96dfc5eb5446db"
+SRCREV_machine:class-devupstream ?= "5c7587f69194bc9fc714953ab4c7203e6e68885b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.22"
+LINUX_VERSION ?= "6.6.23"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


