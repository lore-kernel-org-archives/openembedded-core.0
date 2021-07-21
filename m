Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.1907.1626837705006401677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 20:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vj2RHp3o;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id n10so847324qke.12
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 20:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JR1TgJ2Mv9ZMmm9dSWq20irJut/dr2VxUsVDmXkEf7A=;
        b=Vj2RHp3oqzjBusJ36oMCNk2e94hX1rVL7wHLe/r4o5sRAiFLPzA6MwxERJVlWTbqOJ
         PFJwGKCrc2CNtrh1eJkuvuYydZ2Gi0QVuiQBZb1iDGncTKI2XbTaHrO3pXmAiYW3tVFm
         UM21R2TKc/4GBjSSTLsCZ4WHtz4j8yVVTJ0OvaZElXxTzbJLNnUUNV2pgVHGs4ubw5+t
         sBG56uFQfZ8eTWWvg2q7IwGPpyocmr+lGKe54PTIHp7FAFaA5ZwL7fapLQWSzet9GGhb
         J2DWeTmoLtGPlyMLux9tUe5yzpBh7sm7ra3KLA3g1kdzWZwqfPhH36dMSdSWncGt2Bmy
         FljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JR1TgJ2Mv9ZMmm9dSWq20irJut/dr2VxUsVDmXkEf7A=;
        b=q88PLr7aMLLCfDCvDcoPvFBMAKPkl5N0lukua2Tvx1NyspZAwXFTcWPtc4EQ11zd/g
         gkAs2m5yyJAIX+U94UDcBg7h+b7PCcg6A5ULKZYW/ooKU/KTRBfG/StygTXup2RysF6j
         /xTlkK/KVJDeupHbrN8mm3FBiyT+FvEPxNdcvftO+TZ6JJeq2kqRaTh6JCG689kLnNY9
         /72x2oXVWN3QbrriSAuvukiwiJhS88/hLyCqwTBk0KMnEkgFZJR5SeEwuRVGQ7KHe3a0
         r2o+JhUtQFJZ6qgzBfcJ2XAYhpGyNSfZ4dmomHKpciyRkQ3mWnzG5xn+kBImDeaHaWXr
         Rsgg==
X-Gm-Message-State: AOAM532+Cz1SV08PkkAydxKp0zGzDMNp1g1kLEK4+bBzYjBnzaPhvpU/
	9xHOXuX2B99zYx5d+A1l3tw=
X-Google-Smtp-Source: ABdhPJyB0BbOHb6yn71LsCxuT+opp2jW4tus0RWWzJkd8x2EsrHis7Nosik5kAL+2ZSzJpwg8sUPxg==
X-Received: by 2002:a37:e04:: with SMTP id 4mr32981656qko.281.1626837703964;
        Tue, 20 Jul 2021 20:21:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h13sm10767892qkg.13.2021.07.20.20.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 20:21:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.13: update to v5.13.4
Date: Tue, 20 Jul 2021 23:21:38 -0400
Message-Id: <28441fcba0def91a75583fe1549e48d7108fa8c9.1626837575.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626837575.git.bruce.ashfield@gmail.com>
References: <cover.1626837575.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    64376a981a0e Linux 5.13.4
    71de462034c6 seq_file: disallow extremely large seq buffer allocations
    31cf8e7e504e misc: alcor_pci: fix inverted branch condition
    9930eeb4ffae scsi: scsi_dh_alua: Fix signedness bug in alua_rtpg()
    e1b2b2b61d30 cpufreq: CPPC: Fix potential memleak in cppc_cpufreq_cpu_init
    c898c9bfd3d5 perf tools: Fix pattern matching for same substring in different PMU type
    04ea267f5357 MIPS: vdso: Invalid GIC access through VDSO
    bd5b2e8f4a7c s390/irq: remove HAVE_IRQ_EXIT_ON_IRQ_STACK
    272fa75ec8a0 perf script python: Fix buffer size to report iregs in perf script
    3a5f4fb0ee2d mips: disable branch profiling in boot/decompress.o
    79a0e94e1434 mips: always link byteswap helpers into decompressor
    8be9eadd7bd6 kprobe/static_call: Restore missing static_call_text_reserved()
    fda47dd9f5d7 static_call: Fix static_call_text_reserved() vs __init
    a861b41d0b41 jump_label: Fix jump_label_text_reserved() vs __init
    7ec843ba963e sched/uclamp: Ignore max aggregation if rq is idle
    c368aa2bbd2a scsi: be2iscsi: Fix an error handling path in beiscsi_dev_probe()
    b6a08c2f1c41 arm64: dts: rockchip: Re-add regulator-always-on for vcc_sdio for rk3399-roc-pc
    12f8ee513a33 arm64: dts: rockchip: Re-add regulator-boot-on, regulator-always-on for vdd_gpu on rk3399-roc-pc
    9f5d2c5052d3 firmware: turris-mox-rwtm: show message about HWRNG registration
    852ae2d33e1f firmware: turris-mox-rwtm: fail probing when firmware does not support hwrng
    5f6ffd65b7dc firmware: turris-mox-rwtm: report failures better
    aa1b734129a7 firmware: turris-mox-rwtm: fix reply status decoding function
    3dbb2de9e7af kbuild: remove trailing slashes from $(KBUILD_EXTMOD)
    2292bba57bb6 thermal/drivers/rcar_gen3_thermal: Fix coefficient calculations
    314027808303 arm64: dts: ti: k3-am642-evm: align ti,pindir-d0-out-d1-in property with dt-shema
    908b140229a2 arm64: dts: ti: am65: align ti,pindir-d0-out-d1-in property with dt-shema
    6f62efde1ae0 arm64: dts: ti: k3-am642-main: fix ports mac properties
    5b47aec030e9 ARM: dts: imx6q-dhcom: Add gpios pinctrl for i2c bus recovery
    189c0feed615 ARM: dts: imx6q-dhcom: Fix ethernet plugin detection problems
    bffed302186c ARM: dts: imx6q-dhcom: Fix ethernet reset time properties
    527b863b5260 thermal/drivers/sprd: Add missing MODULE_DEVICE_TABLE
    688126766067 ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema
    ca219ca56e48 ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
    75e9d92befad ARM: dts: dra7: Fix duplicate USB4 target module node
    4264bda03ef1 arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID
    a6b45b4932f7 memory: fsl_ifc: fix leak of private memory on probe failure
    28f71fd81ebd memory: fsl_ifc: fix leak of IO mapping on probe failure
    5efc32c0cf6d arm64: dts: ti: k3-j721e-common-proc-board: Re-name "link" name as "phy"
    c854fab6a0c9 arm64: dts: ti: k3-j721e-common-proc-board: Use external clock for SERDES
    2920f3582a2b arm64: dts: ti: k3-j721e-main: Fix external refclk input to SERDES
    e1ff512116e9 firmware: arm_scmi: Add delayed response status check
    3b28d0838e94 Revert "ARM: dts: bcm283x: increase dwc2's RX FIFO size"
    5bb263488bd0 arm64: dts: renesas: r8a779a0: Drop power-domains property from GIC node
    cb5259dacdbc reset: bail if try_module_get() fails
    39119c5e50a9 ARM: dts: BCM5301X: Fixup SPI binding
    c2c62ef35e79 dt-bindings: i2c: at91: fix example for scl-gpios
    365987eb0d0e firmware: arm_scmi: Reset Rx buffer to max size during async commands
    1a35a7db3430 soc: mtk-pm-domains: Fix the clock prepared issue
    02fb5809342a soc: mtk-pm-domains: do not register smi node as syscon
    ea6ad20a5381 firmware: tegra: Fix error return code in tegra210_bpmp_init()
    2ef47def7bba arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg sizes
    77cb5b1b127f arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
    c8072f1620ce arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
    2d2b0b26399f ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM
    a3d54e663d3b arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages
    f8303239e753 arm64: dts: renesas: Add missing opp-suspend properties
    bd8eefc0b53d ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements
    6dfc3b366e20 ARM: dts: qcom: sdx55-t55: Represent secure-regions as 64-bit elements
    1b5c14a6bbe4 arm64: dts: ti: j7200-main: Enable USB2 PHY RX sensitivity workaround
    ec80ffdc4283 arm64: dts: ti: k3-j7200: Remove "#address-cells" property from GPIO DT nodes
    6d300d33d567 arm64: dts: ti: k3-am64-mcu: Fix the compatible string in GPIO DT node
    d1b67a186292 arm64: dts: qcom: sdm845-oneplus-common: guard rmtfs-mem
    d8ef498abc67 ARM: dts: r8a7779, marzen: Fix DU clock names
    7d32c0007098 arm64: dts: renesas: v3msk: Fix memory size
    104f7241f12d rtc: fix snprintf() checking in is_rtc_hctosys()
    0b46343d52e8 rtc: bd70528: fix BD71815 watchdog dependency
    dff5eb6da4f8 ARM: dts: sun8i: h3: orangepi-plus: Fix ethernet phy-mode
    7540e4352365 memory: pl353: Fix error return code in pl353_smc_probe()
    410c26a81b6c arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
    91253471596e reset: brcmstb: Add missing MODULE_DEVICE_TABLE
    19c0f8293f31 memory: atmel-ebi: add missing of_node_put for loop iteration
    e075ad208d19 memory: stm32-fmc2-ebi: add missing of_node_put for loop iteration
    444c3049db10 ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
    209aa4be8b40 ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
    3bbfd45abcd3 ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
    3bd497c174c5 ARM: exynos: add missing of_node_put for loop iteration
    7a91d9c67531 reset: a10sr: add missing of_match_table reference
    6cf18d4e190b reset: RESET_INTEL_GW should depend on X86
    1347d04d66f7 reset: RESET_BRCMSTB_RESCAL should depend on ARCH_BRCMSTB
    3b5eb8cd04a2 arm64: dts: rockchip: Drop fephy pinctrl from gmac2phy on rk3328 rock-pi-e
    62ace4c8a6fc arm64: dts: rockchip: rename LED label for NanoPi R4S
    f499d706e21e ARM: dts: gemini-rut1xx: remove duplicate ethernet node
    700ecdcb3e05 hexagon: use common DISCARDS macro
    91a711977033 hexagon: handle {,SOFT}IRQENTRY_TEXT in linker script
    a5d3913911f1 NFSv4/pNFS: Don't call _nfs4_pnfs_v3_ds_connect multiple times
    a43389b7df96 NFSv4/pnfs: Fix layoutget behaviour after invalidation
    f90295b4b641 NFSv4/pnfs: Fix the layout barrier update
    65d105e0014c NFS: Fix fscache read from NFS after cache error
    9d94a3f255da NFS: Ensure nfs_readpage returns promptly when internal error occurs
    382f21675997 virtio-mem: don't read big block size in Sub Block Mode
    8e0bfe5edb79 vdpa/mlx5: Clear vq ready indication upon device reset
    eaa0eb7020f7 ALSA: isa: Fix error return code in snd_cmi8330_probe()
    650e6f383a6e nfsd: fix NULL dereference in nfs3svc_encode_getaclres
    7605bff387a9 NFSD: Prevent a possible oops in the nfs_dirent() tracepoint
    e8a8bb8dca84 nfsd: Reduce contention for the nfsd_file nf_rwsem
    1e8c6f23b183 nfsd: move fsnotify on client creation outside spinlock
    ca9c3d31c52d NFSD: Add nfsd_clid_confirmed tracepoint
    0d435b6d94b0 powerpc/bpf: Fix detecting BPF atomic instructions
    bc6b8e2cd87e nvme-tcp: can't set sk_user_data without write_lock
    c01f6cae4b1b virtio_net: move tx vq operation under tx queue lock
    70899667e59a vdp/mlx5: Fix setting the correct dma_device
    e654dbc9a6e2 vdpa/mlx5: Fix possible failure in umem size calculation
    965b080f4e6d vdpa/mlx5: Fix umem sizes assignments on VQ create
    9dca259fbb42 vp_vdpa: correct the return value when fail to map notification
    c31fab84b23c io_uring: remove not needed PF_EXITING check
    dafcb53b550b io_uring: inline __tctx_task_work()
    7511a4f524f3 io_uring: move creds from io-wq work to io_kiocb
    16eadf897956 io_uring: don't bounce submit_state cachelines
    bea4688b9e59 io_uring: shuffle rarely used ctx fields
    f564954855fc io_uring: get rid of files in exit cancel
    04c529ed0e7f block: grab a device refcount in disk_uevent
    ccdf7e073170 arch_topology: Avoid use-after-free for scale_freq_data
    d6c153a6ae03 PCI: tegra194: Fix tegra_pcie_ep_raise_msi_irq() ill-defined shift
    63798e31f588 f2fs: remove false alarm on iget failure during GC
    e882298f7c3e nfs: update has_sec_mnt_opts after cloning lsm options from parent
    582223e621e1 pwm: imx1: Don't disable clocks at device remove time
    18cfc69d561a PCI: intel-gw: Fix INTx enable
    29e9a35b400b x86/fpu: Limit xstate copy size in xstateregs_set()
    a04e670b07df x86/fpu: Fix copy_xstate_to_kernel() gap handling
    c615921c48c9 f2fs: fix to avoid adding tab before doc section
    7bc134df92a2 PCI: iproc: Support multi-MSI only on uniprocessor kernel
    5ac5596c3b7c PCI: iproc: Fix multi-MSI base vector number allocation
    8f02865de3a3 ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode
    687cf32865b2 nfs: fix acl memory leak of posix_acl_create()
    7cedf369663f SUNRPC: prevent port reuse on transports which don't request it.
    a96036c0b520 watchdog: jz4740: Fix return value check in jz4740_wdt_probe()
    07777127a44a watchdog: aspeed: fix hardware timeout calculation
    90d61adce958 watchdog: keembay: Removed timeout update in the TO ISR
    04693e05d183 watchdog: keembay: Remove timeout update in the WDT start function
    6479c1a2ae2c watchdog: keembay: Clear either the TO or TH interrupt bit
    b8ba05635e6e watchdog: keembay: Update pretimeout to zero in the TH ISR
    340590af29d5 watchdog: keembay: Upadate WDT pretimeout for every update in timeout
    4cfc11b3a8fe watchdog: keembay: Update WDT pre-timeout during the initialization
    f55dd38490f7 ubifs: journal: Fix error return code in ubifs_jnl_write_inode()
    fe597a0eb351 um: fix error return code in winch_tramp()
    a04880c5bb08 um: fix error return code in slip_open()
    b71f11467022 um: Fix stack pointer alignment
    a02357d7532b sunrpc: Avoid a KASAN slab-out-of-bounds bug in xdr_set_page_base()
    7aec9f862411 NFSv4: Fix an Oops in pnfs_mark_request_commit() when doing O_DIRECT
    b0bfac939030 NFSv4: Initialise connection to the server in nfs4_alloc_client()
    16187f5228e6 power: supply: rt5033_battery: Fix device tree enumeration
    7da9b60120b0 PCI/sysfs: Fix dsm_label_utf16s_to_utf8s() buffer overrun
    8fcb25a3ef23 power: supply: surface-charger: Fix type of integer variable
    10d79d3bf5c4 remoteproc: k3-r5: Fix an error message
    f02de04e14cf remoteproc: stm32: fix phys_addr_t format string
    2ca41d7ba671 f2fs: compress: fix to disallow temp extension
    c3988657d370 f2fs: add MODULE_SOFTDEP to ensure crc32 is included in the initramfs
    fa815e11816b module: correctly exit module_kallsyms_on_each_symbol when fn() != 0
    7c2089413c67 pwm: visconti: Fix and simplify period calculation
    ee24633a5048 cpufreq: scmi: Fix an error message
    afb04d0b5543 x86/signal: Detect and prevent an alternate signal stack overflow
    8e0648a3cb63 NFSD: Fix TP_printk() format specifier in nfsd_clid_class
    e1f1f6603155 f2fs: atgc: fix to set default age threshold
    0f0fd04efc26 power: supply: surface_battery: Fix battery event handling
    73a14f65a67c block: fix the problem of io_ticks becoming smaller
    21a06a244d25 virtio_console: Assure used length from device is limited
    ffbfea49cc39 virtio_net: Fix error handling in virtnet_restore()
    29a2f4a3214a virtio-blk: Fix memory leak among suspend/resume procedure
    1c8c1adae69f ext4: fix WARN_ON_ONCE(!buffer_uptodate) after an error writing the superblock
    b881ba731274 PCI: rockchip: Register IRQ handlers after device and data are ready
    cfac32923d1d ACPI: video: Add quirk for the Dell Vostro 3350
    16752e05c77a ACPI: AMBA: Fix resource name in /proc/iomem
    fd313d643f07 pwm: tegra: Don't modify HW state in .remove callback
    a1d3f7407f78 pwm: img: Fix PM reference leak in img_pwm_enable()
    18127c30f619 drm/amdkfd: fix sysfs kobj leak
    0b909924a4ae drm/amdgpu: fix Navi1x tcp power gating hang when issuing lightweight invalidaiton
    813ff2425324 power: supply: axp288_fuel_gauge: Make "T3 MRD" no_battery_list DMI entry more generic
    289834760579 power: supply: ab8500: add missing MODULE_DEVICE_TABLE
    81cd77390071 power: supply: charger-manager: add missing MODULE_DEVICE_TABLE
    a01f95e2f881 power: reset: regulator-poweroff: add missing MODULE_DEVICE_TABLE
    c11910b2c2cf NFS: nfs_find_open_context() may only select open files
    4a54caa8540f drm/gma500: Add the missed drm_gem_object_put() in psb_user_framebuffer_create()
    e43aa6240814 ceph: remove bogus checks and WARN_ONs from ceph_set_page_dirty
    4f8e35e9483a orangefs: fix orangefs df output.
    cdc00734394b NFSv4: Fix handling of non-atomic change attrbute updates
    357d88120072 NFS: Fix up inode attribute revalidation timeouts
    6e56ae0a8901 PCI: tegra: Add missing MODULE_DEVICE_TABLE
    7693312a8044 remoteproc: stm32: fix mbox_send_message call
    a9f2ab385cc6 remoteproc: core: Fix cdev remove and rproc del
    bbea0e789770 x86/fpu: Return proper error codes from user access functions
    f8a51030e3be PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
    c09a4ad6251f fuse: fix illegal access to inode with reused nodeid
    6ba041fc3c44 virtiofs: propagate sync() to file server
    5e65819a006e watchdog: iTCO_wdt: Account for rebooting on second timeout
    cfb7e2f23aa0 watchdog: imx_sc_wdt: fix pretimeout
    1a053c4d7168 watchdog: Fix possible use-after-free by calling del_timer_sync()
    f0feab82f6a0 watchdog: sc520_wdt: Fix possible use-after-free in wdt_turnoff()
    8adbbe6c86bb watchdog: Fix possible use-after-free in wdt_startup()
    a037ebbe72a4 PCI: Dynamically map ECAM regions
    3cf262e8c698 PCI: pciehp: Ignore Link Down/Up caused by DPC
    9f397e9e497d NFSv4: Fix delegation return in cases where we have to retry
    eeb8022576c1 PCI/P2PDMA: Avoid pci_get_slot(), which may sleep
    00fe7b64bba8 ARM: 9087/1: kprobes: test-thumb: fix for LLVM_IAS=1
    a67dc65f59ed power: reset: gpio-poweroff: add missing MODULE_DEVICE_TABLE
    00a34a993ac3 power: supply: max17040: Do not enforce (incorrect) interrupt trigger type
    4d40b03031a0 power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
    471c250065e1 pwm: pca9685: Restrict period change for enabled PWMs
    b050025f8de4 PCI: hv: Fix a race condition when removing the device
    6b8813b09fab power: supply: ab8500: Enable USB and AC
    aa092b2f5bb3 power: supply: ab8500: Avoid NULL pointers
    341db343768b power: supply: ab8500: Move to componentized binding
    dc72a15859b2 PCI: ftpci100: Rename macro name collision
    6606e5a6811a pwm: spear: Don't modify HW state in .remove callback
    19ce06dcd189 power: supply: sc2731_charger: Add missing MODULE_DEVICE_TABLE
    2d7dae32b14b power: supply: sc27xx: Add missing MODULE_DEVICE_TABLE
    77637270800c kcov: add __no_sanitize_coverage to fix noinstr for all architectures
    67a8dfc86bdb lib/decompress_unlz4.c: correctly handle zero-padding around initrds.
    af6365ae0991 phy: intel: Fix for warnings due to EMMC clock 175Mhz change in FIP
    e00d3efd53d0 i2c: core: Disable client irq on reboot/shutdown
    47419e67a5ff intel_th: Wait until port is in reset before programming it
    8c012f3504ab staging: rtl8723bs: fix check allowing 5Ghz settings
    32615857345b staging: rtl8723bs: fix macro value for 2.4Ghz only device
    5f59df2b2358 leds: turris-omnia: add missing MODULE_DEVICE_TABLE
    658d9b291193 ALSA: firewire-motu: fix detection for S/PDIF source on optical interface in v2 protocol
    048d83c67d37 ALSA: usb-audio: scarlett2: Fix 6i6 Gen 2 line out descriptions
    4348f36461b8 ALSA: hda: Add IRQ check for platform_get_irq()
    eff67a0bb38f backlight: lm3630a: Fix return code of .update_status() callback
    18fbea65d1a5 ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters
    d422f8be38a2 ASoC: fsl_xcvr: check return value after calling platform_get_resource_byname()
    d15c57f8f120 powerpc/boot: Fixup device-tree on little endian
    34ada7b357dd usb: gadget: hid: fix error return code in hid_bind()
    c904d51536b4 usb: gadget: f_hid: fix endianness issue with descriptors
    7113c2692f7f ALSA: usb-audio: scarlett2: Fix scarlett2_*_ctl_put() return values
    7d94bcba9e59 ALSA: usb-audio: scarlett2: Fix data_mutex lock
    f3f7f6ef23fc ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2 PCM Input count
    669eb7736781 m68knommu: fix missing LCD splash screen data initializer
    efd33d33dedd ALSA: bebob: add support for ToneWeal FW66
    a5dc9f63b20d Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
    1043c57cff3d s390/mem_detect: fix tprot() program check new psw handling
    bf04c373f1b3 s390/mem_detect: fix diag260() program check new psw handling
    5c80766b911d s390/ipl_parm: fix program check new psw handling
    45b658ee680d s390/processor: always inline stap() and __load_psw_mask()
    4de8aba5c10f habanalabs/gaudi: set the correct rc in case of err
    29d01e4b4c04 habanalabs: remove node from list before freeing the node
    cce27a77cc59 habanalabs: set rc as 'valid' in case of intentional func exit
    275674c1e58b habanalabs: fix mask to obtain page offset
    30dd0cbabf14 habanalabs/gaudi: set the correct cpu_id on MME2_QM failure
    4bf6fcdcca81 habanalabs: check if asic secured with asic type
    dac25ad9dd9d xhci: handle failed buffer copy to URB sg list and fix a W=1 copiler warning
    44be4fd02a92 ASoC: soc-core: Fix the error return code in snd_soc_of_parse_audio_routing()
    c90bcc03dd7c powerpc/mm/book3s64: Fix possible build error
    d4921acaab93 gpio: pca953x: Add support for the On Semi pca9655
    ac2ee946b71e selftests/powerpc: Fix "no_handler" EBB selftest
    df6b21c0aa9d ALSA: ppc: fix error return code in snd_pmac_probe()
    21b28dfedfc1 scsi: storvsc: Correctly handle multiple flags in srb_status
    0c5085c93f64 powerpc/inst: Fix sparse detection on get_user_instr()
    71bfeb9e0f1a thunderbolt: Fix DROM handling for USB4 DROM
    4d18303a5bc1 gpio: zynq: Check return value of irq_get_irq_data
    c42ec0450a55 gpio: zynq: Check return value of pm_runtime_get_sync
    b5b9d977c7a8 ASoC: soc-pcm: fix the return value in dpcm_apply_symmetry()
    77921518bf65 ALSA: control_led - fix initialization in the mode show callback
    2955c54c5bca ALSA: n64: check return value after calling platform_get_resource()
    5f9741a9a91f iommu/arm-smmu: Fix arm_smmu_device refcount leak in address translation
    fe92c0581990 iommu/arm-smmu: Fix arm_smmu_device refcount leak when arm_smmu_rpm_get fails
    f30d6b6bb4f6 powerpc/ps3: Add dma_mask to ps3_dma_region
    06771032116a ALSA: sb: Fix potential double-free of CSP mixer elements
    c33fbdc1cdae iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
    de544803cbe0 selftests: timers: rtcpie: skip test if default RTC device does not exist
    52e8bd03856a s390: disable SSP when needed
    2fdbf6e7baa8 s390/sclp_vt220: fix console name to match device
    b29ddd99c14f serial: tty: uartlite: fix console setup
    2124240be810 fsi: Add missing MODULE_DEVICE_TABLE
    ed8c2cc77381 iov_iter_advance(): use consistent semantics for move past the end
    a3a117833731 ASoC: img: Fix PM reference leak in img_i2s_in_probe()
    cc78632eb085 mfd: cpcap: Fix cpcap dmamask not set warnings
    4aee78c62b9d mfd: da9052/stmpe: Add and modify MODULE_DEVICE_TABLE
    e65432dce6b5 scsi: qedi: Fix cleanup session block/unblock use
    400c206f3be0 scsi: qedi: Fix TMF session block/unblock use
    cf5cc57ea7dc scsi: qedi: Fix race during abort timeouts
    338330351ca5 scsi: qedi: Fix null ref during abort handling
    52b5bf245a68 scsi: iscsi: Fix shost->max_id use
    fa9542b35ceb scsi: iscsi: Fix conn use after free during resets
    bf3ce567db56 scsi: iscsi: Add iscsi_cls_conn refcount helpers
    1420af019bcb scsi: megaraid_sas: Handle missing interrupts while re-enabling IRQs
    2262bb7ee19e scsi: megaraid_sas: Early detection of VD deletion through RaidMap update
    e623f79691c5 scsi: megaraid_sas: Fix resource leak in case of probe failure
    0dab71667eb0 fs/jfs: Fix missing error code in lmLogInit()
    936440f47826 scsi: scsi_dh_alua: Check for negative result value
    89b033dd8f3b scsi: core: Fixup calling convention for scsi_mode_sense()
    fc6bf9941021 scsi: mpt3sas: Fix deadlock while cancelling the running firmware event
    b2ef1f5de403 tty: serial: 8250: serial_cs: Fix a memory leak in error handling path
    b731dddd686b ASoC: cs42l42: Fix 1536000 Bit Clock instability
    2a1115ad5fce ALSA: ac97: fix PM reference leak in ac97_bus_remove()
    dcb634e434b8 scsi: core: Cap scsi_host cmd_per_lun at can_queue
    8b927240f44c scsi: lpfc: Fix crash when lpfc_sli4_hba_setup() fails to initialize the SGLs
    9c1a1c3e71dd scsi: lpfc: Fix "Unexpected timeout" error in direct attach topology
    dd3bc6dc69c6 scsi: hisi_sas: Propagate errors in interrupt_init_v1_hw()
    67fb59eceee3 scsi: arcmsr: Fix doorbell status being updated late on ARC-1886
    ab935078f361 w1: ds2438: fixing bug that would always get page0
    59f03af920b5 ASoC: SOF: topology: fix assignment to use le32_to_cpu
    1a133a0996d6 usb: common: usb-conn-gpio: fix NULL pointer dereference of charger
    3b57a2dd956c Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
    82e5ee742fdd ALSA: usx2y: Don't call free_pages_exact() with NULL address
    6c9a4c651572 ALSA: usx2y: Avoid camelCase
    c31e22bf9406 iio: magn: bmc150: Balance runtime pm + use pm_runtime_resume_and_get()
    7beb9112a3bc iio: gyro: fxa21002c: Balance runtime pm + use pm_runtime_resume_and_get().
    78f472928f3a iio: imu: st_lsm6dsx: correct ODR in header
    27a19198ab58 partitions: msdos: fix one-byte get_unaligned()
    9c029e50e662 ASoC: intel/boards: add missing MODULE_DEVICE_TABLE
    09d154990ca8 misc: alcor_pci: fix null-ptr-deref when there is no PCI bridge
    a7268e8a227d misc/libmasm/module: Fix two use after free in ibmasm_init_one
    221f655abb56 serial: 8250: of: Check for CONFIG_SERIAL_8250_BCM7271
    464ffcfa6028 serial: fsl_lpuart: disable DMA for console and fix sysrq
    c96867d0bba9 tty: serial: fsl_lpuart: fix the potential risk of division or modulo by zero
    7397dab12fe1 usb: dwc3: pci: Fix DEFINE for Intel Elkhart Lake
    c4b8190ae66f soundwire: bus: handle -ENODATA errors in clock stop/start sequences
    740b019c2eb8 soundwire: bus: only use CLOCK_STOP_MODE0 and fix confusions
    ee188d0f8dd5 rcu: Reject RCU_LOCKDEP_WARN() false positives
    aa59856bcfd2 srcu: Fix broken node geometry after early ssp init
    5318059dea5e scsi: arcmsr: Fix the wrong CDB payload report to IOP
    38a6e9b501b2 dmaengine: fsl-qdma: check dma_set_mask return value
    7bd674051bfe ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
    c57e7b2f36ae leds: tlc591xx: fix return value check in tlc591xx_probe()
    28f0adaae3e8 net: bridge: multicast: fix MRD advertisement router port marking race
    dc924e411870 net: bridge: multicast: fix PIM hello router port marking race
    b937eb91b353 drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()
    d3891139901b drm/dp_mst: Avoid to mess up payload table by ports in stale topology
    d01943939f45 drm/dp_mst: Do not set proposed vcpi directly
    c30f0b5c6fd1 btrfs: zoned: fix wrong mutex unlock on failure to allocate log root tree
    02fac1508a72 btrfs: don't block if we can't acquire the reclaim lock
    d6479f089af1 btrfs: rework chunk allocation to avoid exhaustion of the system chunk array
    789b24d9950d btrfs: fix deadlock with concurrent chunk allocations involving system chunks
    9ffb4cd20998 btrfs: zoned: fix types for u64 division in btrfs_reclaim_bgs_work
    27c5ecbb691f btrfs: properly split extent_map for REQ_OP_ZONE_APPEND
    08e1e3b6ddd8 io_uring: use right task for exiting checks
    6ef21f34aa92 arm64: Avoid premature usercopy failure
    70fa723908a4 mm/hugetlb: fix refs calculation from unaligned @vaddr
    65a5977bd05c EDAC/igen6: fix core dependency AGAIN
    d6e76469157d fbmem: Do not delete the mode that is still in use
    a41573667b39 cgroup: verify that source is a string
    a6859443061e drm/i915/gt: Fix -EDEADLK handling regression
    1786384f5217 drm/i915/gtt: drop the page table optimisation
    e67361d6c083 drm/amdgpu: add another Renoir DID
    38379a09f735 tracing: Do not reference char * as a string in histograms
    7e6a4c304deb iommu/vt-d: Fix clearing real DMA device's scalable-mode context entries
    948ec6d00328 iommu/vt-d: Global devTLB flush when present context entry changed
    208e33fa8359 scsi: zfcp: Report port fc_security as unknown early during remote cable pull
    c1671d2d2ef8 scsi: core: Fix bad pointer dereference when ehandler kthread is invalid
    aa25872fcc35 KVM: SVM: remove INIT intercept handler
    bbca8ad77f26 KVM: SVM: #SMI interception must not skip the instruction
    2338682c3fd1 KVM: X86: Disable hardware breakpoints unconditionally before kvm_x86->run()
    f4e862a6a3d9 KVM: nSVM: Check the value written to MSR_VM_HSAVE_PA
    a238f763e650 KVM: SVM: Revert clearing of C-bit on GPA in #NPF handler
    555e674fd3f9 KVM: x86/mmu: Do not apply HPA (memory encryption) mask to GPAs
    4ccf1f873b70 KVM: x86: Use kernel's x86_phys_bits to handle reduced MAXPHYADDR
    0eb28e18e56c KVM: x86: Use guest MAXPHYADDR from CPUID.0x8000_0008 iff TDP is enabled
    228ce0ed1283 KVM: selftests: do not require 64GB in set_memory_region_test
    069d44a24c0f KVM: mmio: Fix use-after-free Read in kvm_vm_ioctl_unregister_coalesced_mmio
    d4e376c83736 cifs: Do not use the original cruid when following DFS links for multiuser mounts
    0c480c45bed3 cifs: handle reconnect of tcon when there is no cached dfs referral
    a29b76ec20f2 cifs: use the expiry output of dns_query to schedule next resolution

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index 55f2f537db..adcc84bd4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ffbd81e1827d733085ddf6ecb48de1c0668f00cf"
-SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
+SRCREV_machine ?= "10eba41eae2548d854c5d1908db77e8235336191"
+SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.3"
+LINUX_VERSION ?= "5.13.4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 3bb29c3a50..6598684bbb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.3"
+LINUX_VERSION ?= "5.13.4"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "14af4c0436892ac334ddc7e72bd1acf4ee55265d"
-SRCREV_machine ?= "d775b5d52af8b1788408676df70771db02114435"
-SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
+SRCREV_machine_qemuarm ?= "e394a72e8bc77484bf7bae8c842c75b23cc3dd63"
+SRCREV_machine ?= "7275d462cec720120d1767e277a2525d88901c80"
+SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index f43e738c69..497c3307d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.13/standard/base"
 KBRANCH_qemux86-64 ?= "v5.13/standard/base"
 KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b378a7f6a2a3542bf8cf0dc21f21e183fc8aedbc"
-SRCREV_machine_qemuarm64 ?= "eb735648264252f9865fae18c509c067e32ad528"
-SRCREV_machine_qemumips ?= "9efee711588fc23832dcb32bb3ead012fd72ec34"
-SRCREV_machine_qemuppc ?= "e8966ba4bbaa9e90b21d8576cdd3bab8fe161782"
-SRCREV_machine_qemuriscv64 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
-SRCREV_machine_qemuriscv32 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
-SRCREV_machine_qemux86 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
-SRCREV_machine_qemux86-64 ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
-SRCREV_machine_qemumips64 ?= "3f0308c87d201ae82c6561da52c57f8a23f8a3f0"
-SRCREV_machine ?= "570e7aedcd00e7e8a218e37c3dfb3b1fda83d111"
-SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
+SRCREV_machine_qemuarm ?= "dc19ba17f4d43a220ae8129312703add02d03d1e"
+SRCREV_machine_qemuarm64 ?= "1e086c08b65e8bd1f45f01fd8026599a62deb6c0"
+SRCREV_machine_qemumips ?= "4dd19bc8178a6100a2cb9ffd8364e359230253c8"
+SRCREV_machine_qemuppc ?= "73c8e406db9beb3a99a5dd3ea67824f0e3c0d7a8"
+SRCREV_machine_qemuriscv64 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
+SRCREV_machine_qemuriscv32 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
+SRCREV_machine_qemux86 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
+SRCREV_machine_qemux86-64 ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
+SRCREV_machine_qemumips64 ?= "0632623fd488acc7c78a4f48d4630caba5e6044e"
+SRCREV_machine ?= "5e41c505c6057535da2c289d2cc2fec1f64a5068"
+SRCREV_meta ?= "ab5f1940535350791d2e111e0e16b08be277568d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRCREV_machine_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
+SRCREV_machine_class-devupstream ?= "64376a981a0e2e57c46efa63197c2ebb7dab35df"
 PN_class-devupstream = "linux-yocto-upstream"
 KBRANCH_class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.3"
+LINUX_VERSION ?= "5.13.4"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

