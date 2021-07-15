Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.233.1626377422553478244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NNGYZhKo;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id j184so6297960qkd.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Qc6gQ9b4nqT2ZgDzA1XvdFP0MK+VYtJn02K18Y/80I=;
        b=NNGYZhKo8JFzJ+YxbYaRPekzDX8J/edaz1iSAmztoOBSZwZ2ebGZAOg26y/cznW4XU
         OCzW3HvyXlzDA4miXd+WUBn3GtfpWK6fCo5I/veBZ13aXX3H0r7Vh10qw5VK/p1wXtYu
         /Cm1CM1AT+aSJ2QZckOooY0fQM8EOfVx3ShEyLioUFYABV6cxt0tvoEP8Zgwl3ofV18Z
         ALrkz4IC6nOmpn9H33iVrXxdCHNAra3iBdsUGzGm4jHixRbHeGzkaVJW5WHf7952xdnC
         RG2rrecf5S+cTXESncygBzG/aWkiImGOT/ABeNURlDNjWSVYYqmJq9PZmln9JAatRrMp
         pX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Qc6gQ9b4nqT2ZgDzA1XvdFP0MK+VYtJn02K18Y/80I=;
        b=kdW5rPBKCGJblkDtLoO262cf8piA3CqCJHmwif07UfPykdFYHACNRbooebxDDhVFfS
         VgnkySeBAXrLsobI8fEfMoTBIUu/tZbo3iqFbM+fGPP9sG1XnZ10wjfoRskx2GjOIelh
         gWo5Xn7wNHzXwzp5xPUZeMPYtikTl98sSrnri/uEB+OdAiRATH30fF6mVuqcY5nbDpop
         HK2XreRSAR9Wr1fkEZGi3wplf5A7nB4Wl32Qk/mZLQSwJ2yks1dOogndvWFd+ZzrP0ve
         re5P+HUAqTwU9aykIv/RD+7Gj3zByCF6+pbzQmUNAmb76hJYpomuB3gRerTJt/FqTeq5
         mcaA==
X-Gm-Message-State: AOAM532f4u5qGTLjGh9yPANrhQNyd/5UUE4W73hTmPCd3dpusgnmSgnC
	KIpZx/G1gqfwRK4fHoUYPOf8Y33yPArne9W1roQ=
X-Google-Smtp-Source: ABdhPJxRi0TmyV7za/2gUCa1Fqihh4bgvqKXzw4bpFQZw0xHR0TZDzoDWWxqRp+itV8yrI7AQ/YsRA==
X-Received: by 2002:a05:620a:1472:: with SMTP id j18mr68053qkl.483.1626377421472;
        Thu, 15 Jul 2021 12:30:21 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:21 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto/5.4: update to v5.4.132
Date: Thu, 15 Jul 2021 15:30:12 -0400
Message-Id: <7d15566bf44b92048598694c7a2ba17989d9bd69.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    7c76bd6c36ed Linux 5.4.132
    792d47ca5228 iommu/dma: Fix compile warning in 32-bit builds
    a7f4f0c4e79a scsi: core: Retry I/O for Notify (Enable Spinup) Required error
    4aaace2dc1ad mmc: vub3000: fix control-request direction
    5712b828b8d9 mmc: block: Disable CMDQ on the ioctl path
    90d29149e32c block: return the correct bvec when checking for gaps
    1bfb3a070b58 scsi: target: cxgbit: Unmap DMA buffer before calling target_execute_cmd()
    00d38f7031d4 perf llvm: Return -ENOMEM when asprintf() fails
    b00da826cab4 selftests/vm/pkeys: fix alloc_random_pkey() to make it really, really random
    49496327c290 mm/z3fold: fix potential memory leak in z3fold_destroy_pool()
    4b515fa94894 mm/huge_memory.c: don't discard hugepage if other processes are mapping it
    01be55fb26ce vfio/pci: Handle concurrent vma faults
    9db3800eeadd arm64: dts: marvell: armada-37xx: Fix reg for standard variant of UART
    b857ff866c76 serial: mvebu-uart: correctly calculate minimal possible baudrate
    7900c98108b0 serial: mvebu-uart: do not allow changing baudrate when uartclk is not available
    44d36a79dcff powerpc: Offline CPU in stop_this_cpu()
    3189d9749317 leds: ktd2692: Fix an error handling path
    95288e28c7ca leds: as3645a: Fix error return code in as3645a_parse_node()
    f0acb12b9866 configfs: fix memleak in configfs_release_bin_file
    2993c1f9d7b9 ASoC: atmel-i2s: Fix usage of capture and playback at the same time
    0e0ee2cee65c extcon: max8997: Add missing modalias string
    4efa7f728bab extcon: sm5502: Drop invalid register write in sm5502_reg_data
    b1c88a56ef6e phy: ti: dm816x: Fix the error handling path in 'dm816x_usb_phy_probe()
    8bc305d146b9 phy: uniphier-pcie: Fix updating phy parameters
    142ab7ff42b6 soundwire: stream: Fix test for DP prepare complete
    5ec1c609d26e scsi: mpt3sas: Fix error return value in _scsih_expander_add()
    35a4e0aee8f3 mtd: rawnand: marvell: add missing clk_disable_unprepare() on error in marvell_nfc_resume()
    b1d1cafd6001 of: Fix truncation of memory sizes on 32-bit platforms
    be192ab7b47a ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK
    fe9452c9d7ad iio: prox: isl29501: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    da8ef748fec2 iio: light: vcnl4035: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    84c045475ef3 serial: 8250: Actually allow UPF_MAGIC_MULTIPLIER baud rates
    eea7304dc2e9 staging: mt7621-dts: fix pci address for PCI memory range
    ce2588dc7fea staging: rtl8712: fix memory leak in rtl871x_load_fw_cb
    92538bf2eea8 staging: rtl8712: remove redundant check in r871xu_drv_init
    9f0800bd93ea staging: gdm724x: check for overflow in gdm_lte_netif_rx()
    4500b944d7f8 staging: gdm724x: check for buffer overflow in gdm_lte_multi_sdu_pkt()
    f848baa0a5b3 iio: magn: rm3100: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    26aa12ef64ee iio: adc: ti-ads8688: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    9275b1eaf04e iio: adc: mxs-lradc: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    a79c9b382b7a iio: adc: hx711: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    73e804beb759 iio: adc: at91-sama5d2: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    02d3b52f6739 iio: at91-sama5d2_adc: remove usage of iio_priv_to_dev() helper
    ac7943a7f4ad eeprom: idt_89hpesx: Restore printing the unsupported fwnode name
    9fc3fbc3af67 eeprom: idt_89hpesx: Put fwnode in matching case during ->probe()
    d7e33cc4789b usb: dwc2: Don't reset the core after setting turnaround time
    a95bbfe69031 usb: gadget: f_fs: Fix setting of device and driver data cross-references
    7ba04367b340 ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'
    6fee286da898 iommu/dma: Fix IOVA reserve dma ranges
    1e38d79d0bfc s390: appldata depends on PROC_SYSCTL
    b6e2d45e3fea visorbus: fix error return code in visorchipset_init()
    540c40c6bb4a fsi/sbefifo: Fix reset timeout
    aa4577259bfb fsi/sbefifo: Clean up correct FIFO when receiving reset request from SBE
    d903eee764a4 fsi: occ: Don't accept response from un-initialized OCC
    96c914057aaa fsi: scom: Reset the FSI2PIB engine for any error
    19c8f5307a2e fsi: core: Fix return of error values on failures
    aeed300a2e27 scsi: FlashPoint: Rename si_flags field
    fde1e59110f1 leds: lm3692x: Put fwnode in any case during ->probe()
    08ffeb67e42b leds: lm36274: cosmetic: rename lm36274_data to chip
    a42c6c448c9e leds: lm3532: select regmap I2C API
    329e02d6f22d tty: nozomi: Fix the error handling path of 'nozomi_card_init()'
    7f0b77542e57 firmware: stratix10-svc: Fix a resource leak in an error handling path
    a536c30966c1 char: pcmcia: error out if 'num_bytes_read' is greater than 4 in set_protocol()
    6490ed7c4684 mtd: partitions: redboot: seek fis-index-block in the right node
    56c6c7f8ab9b Input: hil_kbd - fix error return code in hil_dev_connect()
    ccba28358397 ASoC: rsnd: tidyup loop on rsnd_adg_clk_query()
    77c61b1b2989 backlight: lm3630a_bl: Put fwnode in error case during ->probe()
    57fd7d8ac921 ASoC: hisilicon: fix missing clk_disable_unprepare() on error in hi6210_i2s_startup()
    1dc77b6ca0c5 ASoC: rk3328: fix missing clk_disable_unprepare() on error in rk3328_platform_probe()
    d89dda5f5652 iio: potentiostat: lmp91000: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    994a076be336 iio: cros_ec_sensors: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    2ab4cf6cc0e8 iio: light: tcs3472: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    d746f8664ce5 iio: light: tcs3414: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    f35afa38c5ac iio: light: isl29125: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8fdbcbda4dfb iio: magn: bmc150: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    68c8b28305ae iio: magn: hmc5843: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    9fc6ef022b47 iio: prox: as3935: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    da4dfaed9be8 iio: prox: pulsed-light: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    b40dab164dc3 iio: prox: srf08: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    1c06080fe28b iio: humidity: am2315: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    4538e6589cfb iio: gyro: bmg160: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    acf45f54d192 iio: adc: vf610: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    9fad330311e4 iio: adc: ti-ads1015: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8bfa7ffc49ce iio: accel: stk8ba50: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    121283ad49f4 iio: accel: stk8312: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    467502dd7dfc iio: accel: mxc4005: Fix overread of data and alignment issue.
    57a7deaff13d iio:accel:mxc4005: Drop unnecessary explicit casts in regmap_bulk_read calls
    3a49b5639437 iio: accel: kxcjk-1013: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    9f23d0df409a iio: accel: hid: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    a539e2acccfd iio: accel: bma220: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    39fec8d9ab96 iio: accel: bma180: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    2e088ed6fac1 iio: adis16400: do not return ints in irq handlers
    8271a443e5e4 iio: adis_buffer: do not return ints in irq handlers
    d3a7e5384b3a mwifiex: re-fix for unaligned accesses
    3a4043f597d0 tty: nozomi: Fix a resource leak in an error handling function
    61f6c18fff3c rcu: Invoke rcu_spawn_core_kthreads() from rcu_spawn_gp_kthread()
    fbe80b3ee91f staging: fbtft: Rectify GPIO handling
    e0aef648f5bd MIPS: Fix PKMAP with 32-bit MIPS huge page support
    97704efb93b5 RDMA/mlx5: Don't access NULL-cleared mpi pointer
    eff9dabc0068 net: sched: fix warning in tcindex_alloc_perfect_hash
    92071a2b8f7f net: lwtunnel: handle MTU calculation in forwading
    5c93fc46682c writeback: fix obtain a reference to a freeing memcg css
    71721ddf4aee clk: si5341: Update initialization magic
    f894ba756e86 clk: si5341: Avoid divide errors due to bogus register contents
    80bd119c7d27 clk: actions: Fix bisp_factor_table based clocks on Owl S500 SoC
    a7aefa1a173d clk: actions: Fix SD clocks factor table on Owl S500 SoC
    1fbd19a9e23f clk: actions: Fix UART clock dividers on Owl S500 SoC
    305e64cbf855 Bluetooth: Fix handling of HCI_LE_Advertising_Set_Terminated event
    4ad77cea016c Bluetooth: mgmt: Fix slab-out-of-bounds in tlv_data_is_valid
    2954b193ebb0 Revert "be2net: disable bh with spin_lock in be_process_mcc"
    f6b723ce27ff gve: Fix swapped vars when fetching max queues
    0e8c17fd80f2 bpfilter: Specify the log level for the kmsg message
    482e12bdc5d7 e1000e: Check the PCIm state
    48fa8744989f ipv6: fix out-of-bound access in ip6_parse_tlv()
    3380206e5dc0 ibmvnic: free tx_pool if tso_pool alloc fails
    867a99001718 Revert "ibmvnic: remove duplicate napi_schedule call in open function"
    bbc833fd7dae i40e: Fix autoneg disabling for non-10GBaseT links
    a3465b94ac5f i40e: Fix error handling in i40e_vsi_open
    5e98c708a471 bpf: Do not change gso_size during bpf_skb_change_proto()
    bc54d98bd21d ipv6: exthdrs: do not blindly use init_net
    28db4b5b69f3 net: bcmgenet: Fix attaching to PYH failed on RPi 4B
    946bd84826b8 mac80211: remove iwlwifi specific workaround NDPs of null_response
    cb72c23aa544 ieee802154: hwsim: avoid possible crash in hwsim_del_edge_nl()
    048513280e41 ieee802154: hwsim: Fix memory leak in hwsim_add_one
    9692257004d4 tc-testing: fix list handling
    117e1495a636 net/ipv4: swap flow ports when validating source
    74e76cd6320c vxlan: add missing rcu_read_lock() in neigh_reduce()
    b5bd5b7b7f18 pkt_sched: sch_qfq: fix qfq_change_class() error path
    33f897fe3429 tls: prevent oversized sendfile() hangs by ignoring MSG_MORE
    6fea1a58c914 net: sched: add barrier to ensure correct ordering for lockless qdisc
    e245ea3b5240 vrf: do not push non-ND strict packets with a source LLA through packet taps again
    f264d0873d8d net: ethernet: ezchip: fix error handling
    a10e00299b80 net: ethernet: ezchip: fix UAF in nps_enet_remove
    b7f456df8594 net: ethernet: aeroflex: fix UAF in greth_of_remove
    e21b9e8436ef samples/bpf: Fix the error return code of xdp_redirect's main()
    66e9a01e4c7c RDMA/rxe: Fix qp reference counting for atomic ops
    da4ad14f87f0 netfilter: nft_tproxy: restrict support to TCP and UDP transport protocols
    a3f1e8e316bf netfilter: nft_osf: check for TCP packet before further processing
    4759c55ff1d5 netfilter: nft_exthdr: check for IPv6 packet before further processing
    e4db789e937e RDMA/mlx5: Don't add slave port to unaffiliated list
    9b1e991266c4 netlabel: Fix memory leak in netlbl_mgmt_add_common
    9b81edead824 ath10k: Fix an error code in ath10k_add_interface()
    2a8b20d74106 brcmsmac: mac80211_if: Fix a resource leak in an error handling path
    771a8b6da36f brcmfmac: correctly report average RSSI in station info
    4940e54549a5 brcmfmac: fix setting of station info chains bitmask
    18b3b70dd11d ssb: Fix error return code in ssb_bus_scan()
    55ec3e5809e5 wcn36xx: Move hal_buf allocation to devm_kmalloc in probe
    723204726a6a ieee802154: hwsim: Fix possible memory leak in hwsim_subscribe_all_others
    3986553411f8 wireless: carl9170: fix LEDS build errors & warnings
    b6d2cf68f9b1 ath10k: add missing error return code in ath10k_pci_probe()
    941ce3bd7fb0 ath10k: go to path err_unsupported when chip id is not supported
    5f543705309f tools/bpftool: Fix error return code in do_batch()
    fe5cca105794 drm: qxl: ensure surf.data is ininitialized
    d9721095a5ce RDMA/rxe: Fix failure during driver load
    2adbd7559dfb RDMA/core: Sanitize WQ state received from the userspace
    9cc3eb8abe23 net/sched: act_vlan: Fix modify to allow 0
    0b440951273a ehea: fix error return code in ehea_restart_qps()
    e16bd3365d08 drm/rockchip: dsi: move all lane config except LCDC mux to bind()
    450c25b8a4c9 drm/rockchip: cdn-dp-core: add missing clk_disable_unprepare() on error in cdn_dp_grf_write()
    01f4245ff75f net: ftgmac100: add missing error return code in ftgmac100_probe()
    3858b47c94b9 clk: meson: g12a: fix gp0 and hifi ranges
    3da37783b027 pinctrl: renesas: r8a77990: JTAG pins do not have pull-down capabilities
    4e1cb7fedf68 pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
    b0a3770ead57 net: pch_gbe: Propagate error from devm_gpio_request_one()
    a9a33de4be2e net: mvpp2: Put fwnode in error case during ->probe()
    f9ad0b5ebacc video: fbdev: imxfb: Fix an error message
    08a7306e1198 xfrm: xfrm_state_mtu should return at least 1280 for ipv6
    a87a201989ec dax: fix ENOMEM handling in grab_mapping_entry()
    6ea84116b3fe ocfs2: fix snprintf() checking
    27d02a4d9dab cpufreq: Make cpufreq_online() call driver->offline() on errors
    3c59143b9a1e ACPI: bgrt: Fix CFI violation
    6d79e36c9ece ACPI: Use DEVICE_ATTR_<RW|RO|WO> macros
    7b33b04f85df blk-wbt: make sure throttle is enabled properly
    bcf3f42bda3a blk-wbt: introduce a new disable state to prevent false positive by rwb_enabled()
    1ad25a64c66f extcon: extcon-max8997: Fix IRQ freeing at error path
    258f5c1a5d3d ACPI: sysfs: Fix a buffer overrun problem with description_show()
    dfafa93ae3a7 crypto: nx - Fix RCU warning in nx842_OF_upd_status
    55f5d771a292 spi: spi-sun6i: Fix chipselect/clock bug
    97f32c7f3322 sched/uclamp: Fix uclamp_tg_restrict()
    a3ddf1fb37f9 sched/rt: Fix Deadline utilization tracking during policy change
    3fb53be07fc1 sched/rt: Fix RT utilization tracking during policy change
    fa3f33b20bd9 btrfs: clear log tree recovering status if starting transaction fails
    a0876d9dc1c1 regulator: hi655x: Fix pass wrong pointer to config.driver_data
    032fd28ed559 KVM: nVMX: Ensure 64-bit shift when checking VMFUNC bitmap
    a90a2466dde5 hwmon: (max31790) Fix fan speed reporting for fan7..12
    93110513bcfd hwmon: (max31722) Remove non-standard ACPI device IDs
    b585f9ef6a51 media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
    3bf0509d25e0 arm64/mm: Fix ttbr0 values stored in struct thread_info for software-pan
    8e6bcc566400 arm64: consistently use reserved_pg_dir
    ccbcdcd4af98 mmc: usdhi6rol0: fix error return code in usdhi6_probe()
    c5d2f917a8f1 crypto: omap-sham - Fix PM reference leak in omap sham ops
    b205574dc682 crypto: nitrox - fix unchecked variable in nitrox_register_interrupts
    d93cbb6e5fe5 media: siano: Fix out-of-bounds warnings in smscore_load_firmware_family2()
    6e8ba90bef7c m68k: atari: Fix ATARI_KBD_CORE kconfig unmet dependency warning
    e1665624bf9d media: gspca/gl860: fix zero-length control requests
    ffc483de3ecb media: tc358743: Fix error return code in tc358743_probe_of()
    2bca3c0a95fe media: au0828: fix a NULL vs IS_ERR() check
    c04d6687e43e media: exynos4-is: Fix a use after free in isp_video_release
    6c987e7385e1 pata_ep93xx: fix deferred probing
    3eec64b5967e media: rc: i2c: Fix an error message
    6ee810a55965 crypto: ccp - Fix a resource leak in an error handling path
    4020615bd733 evm: fix writing <securityfs>/evm overflow
    550cf816bb11 pata_octeon_cf: avoid WARN_ON() in ata_host_activate()
    8454cfe40841 kbuild: Fix objtool dependency for 'OBJECT_FILES_NON_STANDARD_<obj> := n'
    dcc9f1253ddd kbuild: run the checker after the compiler
    8e5ffc103928 sched/uclamp: Fix locking around cpu_util_update_eff()
    0b199ce65bc3 sched/uclamp: Fix wrong implementation of cpu.uclamp.min
    127035b4595d media: I2C: change 'RST' to "RSET" to fix multiple build errors
    2eccf5160002 pata_rb532_cf: fix deferred probing
    3b0dfab92877 sata_highbank: fix deferred probing
    faeee7a8f684 crypto: ux500 - Fix error return code in hash_hw_final()
    a1fa855e770e crypto: ixp4xx - dma_unmap the correct address
    0c5d94f29775 media: s5p_cec: decrement usage count if disabled
    80af2c9ee1d6 writeback, cgroup: increment isw_nr_in_flight before grabbing an inode
    51fd1f683671 ia64: mca_drv: fix incorrect array size calculation
    a3aab894d971 kthread_worker: fix return value when kthread_mod_delayed_work() races with kthread_cancel_delayed_work_sync()
    05bc31902755 block: fix discard request merge
    8978dd251898 cifs: fix missing spinlock around update to ses->status
    4061697e2f17 HID: wacom: Correct base usage for capacitive ExpressKey status bits
    888469c5fa95 ACPI: tables: Add custom DSDT file as makefile prerequisite
    dba9cda5aa99 clocksource: Retry clock read if long delays detected
    0aebb12a574d PCI: hv: Add check for hyperv_initialized in init_hv_pci_drv()
    f53f229255d6 EDAC/Intel: Do not load EDAC driver when running as a guest
    26c9e398b499 nvmet-fc: do not check for invalid target port in nvmet_fc_handle_fcp_rqst()
    51af155a4327 platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
    506a2001b719 block: fix race between adding/removing rq qos and normal IO
    e30d2ecc13d7 ACPI: resources: Add checks for ACPI IRQ override
    2238732f1992 ACPI: bus: Call kobject_put() in acpi_init() error path
    00f3017e04d4 ACPICA: Fix memory leak caused by _CID repair function
    f8c7e8e572d9 fs: dlm: fix memory leak when fenced
    b6c469a850a4 random32: Fix implicit truncation warning in prandom_seed_state()
    0fc251751c73 fs: dlm: cancel work sync othercon
    75b97dcbe956 block_dump: remove block_dump feature in mark_inode_dirty()
    4cee846b30aa ACPI: EC: Make more Asus laptops use ECDT _GPE
    e846c2821c25 lib: vsprintf: Fix handling of number field widths in vsscanf
    865c6e210bd4 hv_utils: Fix passing zero to 'PTR_ERR' warning
    8d64fd2682ae ACPI: processor idle: Fix up C-state latency if not ordered
    e9e2683f1b9c EDAC/ti: Add missing MODULE_DEVICE_TABLE
    9b1b8323871b HID: do not use down_interruptible() when unbinding devices
    17ca23ef05ed media: Fix Media Controller API config checks
    ef5792d3995d regulator: da9052: Ensure enough delay time for .set_voltage_time_sel
    2aff3f51cd22 regulator: mt6358: Fix vdram2 .vsel_mask
    fc31fb6f36cd KVM: s390: get rid of register asm usage
    2ef6cd6e4865 lockding/lockdep: Avoid to find wrong lock dep path in check_irq_usage()
    1b45a85262bf locking/lockdep: Fix the dep path printing for backwards BFS
    3ee80fc1f530 btrfs: disable build on platforms having page size 256K
    af4b53f6d3ea btrfs: abort transaction if we fail to update the delayed inode
    504081c415e2 btrfs: fix error handling in __btrfs_update_delayed_inode
    f3d2278a81f7 KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors
    3fea9b708ae3 drivers/perf: fix the missed ida_simple_remove() in ddr_perf_probe()
    2e23607e65dc hwmon: (max31790) Fix pwmX_enable attributes
    d284b53193fa hwmon: (max31790) Report correct current pwm duty cycles
    4bb7eeb0a200 media: imx-csi: Skip first few frames from a BT.656 source
    54196d9e77e5 media: siano: fix device register error path
    7434625f944c media: dvb_net: avoid speculation from net slot
    80b9d3becd84 crypto: shash - avoid comparing pointers to exported functions under CFI
    31ef30f8f878 mmc: via-sdmmc: add a check against NULL pointer dereference
    b28d6d2df2b3 mmc: sdhci-sprd: use sdhci_sprd_writew
    1e3ad91cb64c memstick: rtsx_usb_ms: fix UAF
    0ec7eab55b0e media: dvd_usb: memory leak in cinergyt2_fe_attach
    1fc3ec4ac405 Makefile: fix GDB warning with CONFIG_RELR
    0a825797f791 media: st-hva: Fix potential NULL pointer dereferences
    f6f0190d651b media: bt8xx: Fix a missing check bug in bt878_probe
    3790d56daf5f media: v4l2-core: Avoid the dangling pointer in v4l2_fh_release
    a70de431f713 media: em28xx: Fix possible memory leak of em28xx struct
    432188f62697 sched/fair: Fix ascii art by relpacing tabs
    dd776d2fdf87 crypto: qat - remove unused macro in FW loader
    bcea3fc8f24d crypto: qat - check return code of qat_hal_rd_rel_reg()
    1580d72ac7fc media: imx: imx7_mipi_csis: Fix logging of only error event counters
    eae27d048ee7 media: pvrusb2: fix warning in pvr2_i2c_core_done
    bb8b5e98b5f5 media: cobalt: fix race condition in setting HPD
    162b85d3cf25 media: cpia2: fix memory leak in cpia2_usb_probe
    5c8c5edb28f3 media: sti: fix obj-$(config) targets
    84ac96486ba7 crypto: nx - add missing MODULE_DEVICE_TABLE
    f4c8a00d61fe hwrng: exynos - Fix runtime PM imbalance on error
    022cf057e443 regulator: uniphier: Add missing MODULE_DEVICE_TABLE
    d6518e028103 spi: omap-100k: Fix the length judgment problem
    afc37630a124 spi: spi-topcliff-pch: Fix potential double free in pch_spi_process_messages()
    ca5ea7847527 spi: spi-loopback-test: Fix 'tx_buf' might be 'rx_buf'
    b413d8654ed6 media: exynos-gsc: fix pm_runtime_get_sync() usage count
    8fece55aeb6d media: sti/bdisp: fix pm_runtime_get_sync() usage count
    ac69e7aea37d media: s5p-jpeg: fix pm_runtime_get_sync() usage count
    f1a8951cf1b4 media: mtk-vcodec: fix PM runtime get logic
    908b6f72a910 media: sh_vou: fix pm_runtime_get_sync() usage count
    948bcdcf7fd9 media: s5p: fix pm_runtime_get_sync() usage count
    4480cacdbc26 media: mdk-mdp: fix pm_runtime_get_sync() usage count
    ef59dbc06d6a spi: Make of_register_spi_device also set the fwnode
    a883c38f1cfa fuse: reject internal errno
    059dd690bfe0 fuse: check connected before queueing on fpq->io
    e72bec922646 fuse: ignore PG_workingset after stealing
    74e9d920f25c evm: Refuse EVM_ALLOW_METADATA_WRITES only if an HMAC key is loaded
    d7dfaf13d24e evm: Execute evm_inode_init_security() only when an HMAC key is loaded
    5c7c5c49d9b8 powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ipi()
    9ed57fc5a45b seq_buf: Make trace_seq_putmem_hex() support data longer than 8
    c65755f595cd tracepoint: Add tracepoint_probe_register_may_exist() for BPF tracing
    acf8494ba567 tracing/histograms: Fix parsing of "sym-offset" modifier
    6707b3d43822 rsi: fix AP mode with WPA failure due to encrypted EAPOL
    5269ac3cf0b5 rsi: Assign beacon rate settings to the correct rate_info descriptor field
    f4b4b121521d ssb: sdio: Don't overwrite const buffer if block_write fails
    96bb095f8536 ath9k: Fix kernel NULL pointer dereference during ath_reset_internal()
    e931d9a92576 serial_cs: remove wrong GLOBETROTTER.cis entry
    a3ca189a0018 serial_cs: Add Option International GSM-Ready 56K/ISDN modem
    4bd14de69785 serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
    a945c2ead2c5 serial: mvebu-uart: fix calculation of clock divisor
    202a64ad8f2c iio: ltr501: ltr501_read_ps(): add missing endianness conversion
    aafeedb0996d iio: ltr501: ltr559: fix initialization of LTR501_ALS_CONTR
    a27c940a9042 iio: ltr501: mark register holding upper 8 bits of ALS_DATA{0,1} and PS_DATA as volatile, too
    3287635367a4 iio: light: tcs3472: do not free unallocated IRQ
    60684282789e rtc: stm32: Fix unbalanced clk_disable_unprepare() on probe error path
    a470819824b7 s390/cio: dont call css_wait_for_slow_path() inside a lock
    684bddacf155 KVM: PPC: Book3S HV: Workaround high stack usage with clang
    f0d3a4b6d5f7 perf/smmuv3: Don't trample existing events with global filter
    f9c7f2687923 SUNRPC: Should wake up the privileged task firstly.
    d060386ffdbd SUNRPC: Fix the batch tasks count wraparound.
    619c14120c30 mac80211: remove iwlwifi specific workaround that broke sta NDP tx
    1ff563ec86c7 can: peak_pciefd: pucan_handle_status(): fix a potential starvation issue in TX path
    12aad0220812 can: j1939: j1939_sk_init(): set SOCK_RCU_FREE to call sk_destruct() after RCU is done
    7bb931d2c8cf can: gw: synchronize rcu operations before removing gw job entry
    70a9116b9e5c can: bcm: delay release of struct bcm_op after synchronize_rcu()
    512286ddc3e8 ext4: use ext4_grp_locked_error in mb_find_extent
    0bae1ea11981 ext4: fix avefreec in find_group_orlov
    8c06b3d02d65 ext4: remove check for zero nr_to_scan in ext4_es_scan()
    a0548187482d ext4: correct the cache_nr in tracepoint ext4_es_shrink_exit
    f01fa29e8ea0 ext4: return error code when ext4_fill_flex_info() fails
    ed628b253119 ext4: fix kernel infoleak via ext4_extent_header
    16b795a39f3e ext4: cleanup in-core orphan list if ext4_truncate() failed to get a transaction handle
    e3d3cf2e5a7c btrfs: clear defrag status of a root if starting transaction fails
    077f06b648a4 btrfs: send: fix invalid path for unlink operations after parent orphanization
    0ede9e8c5a83 ARM: dts: at91: sama5d4: fix pinctrl muxing
    efdcd77660f8 arm_pmu: Fix write counter incorrect in ARMv7 big-endian mode
    0f382fa359ca Input: joydev - prevent use of not validated data in JSIOCSBTNMAP ioctl
    63e68b563649 iov_iter_fault_in_readable() should do nothing in xarray case
    846ae1d87931 copy_page_to_iter(): fix ITER_DISCARD case
    c4868118fab9 ntfs: fix validity check for file name attribute
    87a365a4ddec xhci: solve a double free problem while doing s4
    cc7559e6dd1d usb: typec: Add the missed altmode_id_remove() in typec_register_altmode()
    d5b06a79fe89 usb: dwc3: Fix debugfs creation flow
    7941f646a6cd USB: cdc-acm: blacklist Heimann USB Appset device
    8bdef7f21cb6 usb: gadget: eem: fix echo command packet response issue
    11dfef6aba1a net: can: ems_usb: fix use-after-free in ems_usb_disconnect()
    aa6f233b949c Input: usbtouchscreen - fix control-request directions
    d808329ae137 media: dvb-usb: fix wrong definition
    3b4dd159db68 ALSA: hda/realtek: Apply LED fixup for HP Dragonfly G1, too
    23d443c5b417 ALSA: hda/realtek: Fix bass speaker DAC mapping for Asus UM431D
    15f521856e0f ALSA: hda/realtek: Improve fixup for HP Spectre x360 15-df0xxx
    3911b8ff714c ALSA: hda/realtek: Add another ALC236 variant support
    23ca8cf4cba0 ALSA: intel8x0: Fix breakage at ac97 clock measurement
    1908d78a87cf ALSA: usb-audio: scarlett2: Fix wrong resume call
    49e5b37fdd01 ALSA: usb-audio: Fix OOB access at proc output
    5ded94e8516d ALSA: usb-audio: fix rate on Ozone Z90 USB headset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 48514bfe83..8f4b7a44da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2bfba6ef5182dbebe73e576c6d8a629285148215"
-SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
+SRCREV_machine ?= "135b02c845043f37c8eac73607b62b0735286756"
+SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.131"
+LINUX_VERSION ?= "5.4.132"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 33d65466a1..eaef9d9b64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.131"
+LINUX_VERSION ?= "5.4.132"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "88ff7ffcdf2653941105106e5e26717f0a78d7a9"
-SRCREV_machine ?= "b9bcd1be30f8be9c00797a6368a1f8df7aa21916"
-SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
+SRCREV_machine_qemuarm ?= "629ca595e3eafd1fdc3a3d978d6ed4547b419968"
+SRCREV_machine ?= "35abc20f52ebdd41bbe76e6f2d6ee189ab3078f6"
+SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0430e06995..e06d464e34 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1fe32172ee9971daa7debf3fc8165b6ccb80fe85"
-SRCREV_machine_qemuarm64 ?= "087640d0be07b7160b8012ee0e0b08c21915a632"
-SRCREV_machine_qemumips ?= "2e6db18dd388f7b35f70727556e5e55556b5d0a4"
-SRCREV_machine_qemuppc ?= "672230448073e1342fb18137654abff89baacf5f"
-SRCREV_machine_qemuriscv64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
-SRCREV_machine_qemux86 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
-SRCREV_machine_qemux86-64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
-SRCREV_machine_qemumips64 ?= "92e0699c1dfc9e9fe6b2dd0015f36a7fcc76092c"
-SRCREV_machine ?= "c36ad648e4430819de715bba70fb735ac1f16878"
-SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
+SRCREV_machine_qemuarm ?= "cf8b645d7a1c268d071bdfe606f01d739afbdb80"
+SRCREV_machine_qemuarm64 ?= "8d40ced691b9d211840801614a1031089ed6c2a2"
+SRCREV_machine_qemumips ?= "c574c7303a75e700cb7123fc93a7ca7c19c963d6"
+SRCREV_machine_qemuppc ?= "5550c64c43f81e6c29abfbc6ce31f44f200644ec"
+SRCREV_machine_qemuriscv64 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
+SRCREV_machine_qemux86 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
+SRCREV_machine_qemux86-64 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
+SRCREV_machine_qemumips64 ?= "9cd841f768e0b5a07251df29ba202b5ff2bdf114"
+SRCREV_machine ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
+SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.131"
+LINUX_VERSION ?= "5.4.132"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

