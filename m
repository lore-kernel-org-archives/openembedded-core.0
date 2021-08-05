Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.10498.1628177742515064447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wXK2PsSk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id z6-20020a0568302906b02904f268d34f86so5227708otu.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7Dv/TPS+1E2zjH/ptEP/jIBPe9MDFG1MvHdK2B52Y0E=;
        b=wXK2PsSkPye7OcN8Z534VZpGyfyWN0ZEPoXHGdxj4Sr+YYM6AlKHWGP6cNNOrx6vnG
         xoZ8If/aoqxUONQ4/Et6aXuRzvPobgBQHs4qaFYZpr2BWJx3w0E19l7fkJRttS3sulqY
         UAdBVTmMRMpP4oWY+nzFZ3AUi6fGGHeQ6C7Io0oTPuwWsgzYGetepHpEWGU0dCK8yGoS
         5s+yy9zP+eJYOyDL3P2D0LgK7ojojiYaVcew0EVbWE7KNAxP5KlP/sIf0agvfCjEmksf
         UtutnbNsBPZ2d125Sj6DSZv0U+yjc8HSKqCTCvktUdVHJY5Aq9kXD+0cnIaNaeikX2YR
         Onkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Dv/TPS+1E2zjH/ptEP/jIBPe9MDFG1MvHdK2B52Y0E=;
        b=WS/hfJcnwkXfQv+dPwPp1h5MTfIVSjN1baKSvDEDI0wrXiEdOEPT9zWpOvFOWziNHg
         tS2hd/3wQ1QBB2unWnsscAIe9NyRWH8u6DGTk9wfh8ZkWO0gNVFt/OeY7cBVPXlZQiEi
         6a2r8b5nCQ7GxGGmIxZTxQUjJb1D2De9Joc+/FlGQujjOj/20rR5MVGzVIS64jf/zXnf
         UqQE6aGhhMI69Qqmrun6E8W/wHBe6Nrnmtp2tnV/RuN0LXgiiEtUtGSG4ZQ5A6yqb6xp
         HYqr+9XnC+th05+T/O2EF4cbj9FI9hy87L0MdmqiRs9565kLULyE2kFbT2FwkaTqBChj
         lqiw==
X-Gm-Message-State: AOAM531NNhp7KzD1DIUdKVTw4cSb7SqMSsu8PZFM9ulaHOuTJp1noktm
	B1hgpOo6Y54ROnOcddLuHD/NL6FeDP2RD1zu
X-Google-Smtp-Source: ABdhPJy95wJW6o8ge3aY1LMKzoxB/hgYmnhSkt6h456apAaEIcitTxN9rkmcoXA7p3RP6Ugnbxtdmw==
X-Received: by 2002:a9d:4811:: with SMTP id c17mr3989502otf.367.1628177741264;
        Thu, 05 Aug 2021 08:35:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/33] linux-yocto/5.4: update to v5.4.134
Date: Thu,  5 Aug 2021 05:33:45 -1000
Message-Id: <51bce45a9358f92b7272e9f4c889a97e64859d10.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    9afc0c209685 Linux 5.4.134
    c1dafbb26164 seq_file: disallow extremely large seq buffer allocations
    b06ab67bd63b misc: alcor_pci: fix inverted branch condition
    f40884382995 scsi: scsi_dh_alua: Fix signedness bug in alua_rtpg()
    e9602efecf19 MIPS: vdso: Invalid GIC access through VDSO
    48351df82dbc mips: disable branch profiling in boot/decompress.o
    d8afab9bc9fe mips: always link byteswap helpers into decompressor
    bb2435840681 scsi: be2iscsi: Fix an error handling path in beiscsi_dev_probe()
    2a22a1ca453a firmware: turris-mox-rwtm: fail probing when firmware does not support hwrng
    b7c1bafe813a firmware: turris-mox-rwtm: report failures better
    7934e060732f firmware: turris-mox-rwtm: fix reply status decoding function
    65f32d1e0514 thermal/drivers/rcar_gen3_thermal: Fix coefficient calculations
    a3ea516d8d5b ARM: dts: imx6q-dhcom: Add gpios pinctrl for i2c bus recovery
    c4e2fa6fb0f3 ARM: dts: imx6q-dhcom: Fix ethernet plugin detection problems
    9cc2ef1a784c ARM: dts: imx6q-dhcom: Fix ethernet reset time properties
    85434c3a281e ARM: dts: am437x: align ti,pindir-d0-out-d1-in property with dt-shema
    e1314f75b38a ARM: dts: am335x: align ti,pindir-d0-out-d1-in property with dt-shema
    443f6ca6fd18 memory: fsl_ifc: fix leak of private memory on probe failure
    d9213d4f372d memory: fsl_ifc: fix leak of IO mapping on probe failure
    8ef43fa4646f reset: bail if try_module_get() fails
    04bb5b3ea08d ARM: dts: BCM5301X: Fixup SPI binding
    cc10a352e29c firmware: arm_scmi: Reset Rx buffer to max size during async commands
    7dde9387498c firmware: tegra: Fix error return code in tegra210_bpmp_init()
    6ca8e516bc65 ARM: dts: r8a7779, marzen: Fix DU clock names
    52cc83c0282c arm64: dts: renesas: v3msk: Fix memory size
    11d6c1992120 rtc: fix snprintf() checking in is_rtc_hctosys()
    226adc0bf947 memory: pl353: Fix error return code in pl353_smc_probe()
    b782d54b4dca reset: brcmstb: Add missing MODULE_DEVICE_TABLE
    2a9392c6d218 memory: atmel-ebi: add missing of_node_put for loop iteration
    05cfac174796 ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
    45414bfe5af3 ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
    cc617c9ddb1f ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
    13c5fa0a43a0 ARM: exynos: add missing of_node_put for loop iteration
    dc3939d97238 reset: a10sr: add missing of_match_table reference
    b57e025bb0d7 ARM: dts: gemini-rut1xx: remove duplicate ethernet node
    3f870d8c2bc1 hexagon: use common DISCARDS macro
    3b03882123e4 NFSv4/pNFS: Don't call _nfs4_pnfs_v3_ds_connect multiple times
    9f02e9dd8ca2 ALSA: isa: Fix error return code in snd_cmi8330_probe()
    aa8866530d6a nvme-tcp: can't set sk_user_data without write_lock
    496bcc8d4ff9 virtio_net: move tx vq operation under tx queue lock
    aac6a79ee0c0 pwm: imx1: Don't disable clocks at device remove time
    aa51b6bc7907 x86/fpu: Limit xstate copy size in xstateregs_set()
    df749be38c94 PCI: iproc: Support multi-MSI only on uniprocessor kernel
    25bff167719d PCI: iproc: Fix multi-MSI base vector number allocation
    1d9d997850d8 ubifs: Set/Clear I_LINKABLE under i_lock for whiteout inode
    d0b32dc1409f nfs: fix acl memory leak of posix_acl_create()
    e7de89b8b285 watchdog: aspeed: fix hardware timeout calculation
    0366238f6af4 um: fix error return code in winch_tramp()
    c43226ac1079 um: fix error return code in slip_open()
    81e03fe5bf8f NFSv4: Initialise connection to the server in nfs4_alloc_client()
    2d2842f5d2cd power: supply: rt5033_battery: Fix device tree enumeration
    c5b104a27028 PCI/sysfs: Fix dsm_label_utf16s_to_utf8s() buffer overrun
    5b6cde3bae6d f2fs: add MODULE_SOFTDEP to ensure crc32 is included in the initramfs
    00fcd8f33e9b x86/signal: Detect and prevent an alternate signal stack overflow
    52bd1bce8624 virtio_console: Assure used length from device is limited
    7909782857c2 virtio_net: Fix error handling in virtnet_restore()
    04c6e60b884c virtio-blk: Fix memory leak among suspend/resume procedure
    8ae24b9bf8f9 ACPI: video: Add quirk for the Dell Vostro 3350
    0bbac736224f ACPI: AMBA: Fix resource name in /proc/iomem
    7d0667521501 pwm: tegra: Don't modify HW state in .remove callback
    f8ba40611be3 pwm: img: Fix PM reference leak in img_pwm_enable()
    9eb5142d3f76 power: supply: ab8500: add missing MODULE_DEVICE_TABLE
    658884b22ac8 power: supply: charger-manager: add missing MODULE_DEVICE_TABLE
    ae1a6af2f8f8 NFS: nfs_find_open_context() may only select open files
    04a333cf982c ceph: remove bogus checks and WARN_ONs from ceph_set_page_dirty
    ab720715b8a8 orangefs: fix orangefs df output.
    1680c3ece217 PCI: tegra: Add missing MODULE_DEVICE_TABLE
    12f8d6e7f2c7 x86/fpu: Return proper error codes from user access functions
    f58ab0b02ee7 watchdog: iTCO_wdt: Account for rebooting on second timeout
    bcafecd30431 watchdog: imx_sc_wdt: fix pretimeout
    db222f1477ad watchdog: Fix possible use-after-free by calling del_timer_sync()
    7c56c5508dc2 watchdog: sc520_wdt: Fix possible use-after-free in wdt_turnoff()
    146cc288fb80 watchdog: Fix possible use-after-free in wdt_startup()
    1e6e806dda4c PCI/P2PDMA: Avoid pci_get_slot(), which may sleep
    d2bc221be148 ARM: 9087/1: kprobes: test-thumb: fix for LLVM_IAS=1
    94cfbe80f0cf power: reset: gpio-poweroff: add missing MODULE_DEVICE_TABLE
    b6d1d46165f0 power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
    e8794f7bb543 power: supply: ab8500: Avoid NULL pointers
    af619a7455a1 pwm: spear: Don't modify HW state in .remove callback
    f16b1d7dc46f power: supply: sc2731_charger: Add missing MODULE_DEVICE_TABLE
    b8495c08b2e8 power: supply: sc27xx: Add missing MODULE_DEVICE_TABLE
    13b51d90f0a6 lib/decompress_unlz4.c: correctly handle zero-padding around initrds.
    f492dfec0c82 i2c: core: Disable client irq on reboot/shutdown
    ec50ddd8456c intel_th: Wait until port is in reset before programming it
    ba547e7431bf staging: rtl8723bs: fix macro value for 2.4Ghz only device
    6bc7ea6584cb ALSA: usb-audio: scarlett2: Fix 6i6 Gen 2 line out descriptions
    7929bcf1a278 ALSA: hda: Add IRQ check for platform_get_irq()
    0f3821c3281b backlight: lm3630a: Fix return code of .update_status() callback
    84d84143037f ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters
    4abe339ce863 powerpc/boot: Fixup device-tree on little endian
    60c88c8ee548 usb: gadget: hid: fix error return code in hid_bind()
    2bfe5a620894 usb: gadget: f_hid: fix endianness issue with descriptors
    eb11ade08bc8 ALSA: usb-audio: scarlett2: Fix scarlett2_*_ctl_put() return values
    f9e5d0137c14 ALSA: usb-audio: scarlett2: Fix data_mutex lock
    33251aa28d1c ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2 PCM Input count
    82343ce5cad2 ALSA: bebob: add support for ToneWeal FW66
    86d56d5a5908 Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
    5f5c1e683351 s390/mem_detect: fix tprot() program check new psw handling
    8a3adb42928c s390/mem_detect: fix diag260() program check new psw handling
    e8df00854840 s390/ipl_parm: fix program check new psw handling
    5176a4d1c43c s390/processor: always inline stap() and __load_psw_mask()
    542d85dda7ba ASoC: soc-core: Fix the error return code in snd_soc_of_parse_audio_routing()
    41c488eb5dca gpio: pca953x: Add support for the On Semi pca9655
    6602185b185b selftests/powerpc: Fix "no_handler" EBB selftest
    75dc1942f8b6 ALSA: ppc: fix error return code in snd_pmac_probe()
    8e1b6d96e95f gpio: zynq: Check return value of pm_runtime_get_sync
    b11220803ad1 iommu/arm-smmu: Fix arm_smmu_device refcount leak in address translation
    3761ae0d0e54 iommu/arm-smmu: Fix arm_smmu_device refcount leak when arm_smmu_rpm_get fails
    6c50a56d2bce powerpc/ps3: Add dma_mask to ps3_dma_region
    5169c6b12b19 ALSA: sb: Fix potential double-free of CSP mixer elements
    d481ddb1b6d0 selftests: timers: rtcpie: skip test if default RTC device does not exist
    f0bca3fbf16b s390/sclp_vt220: fix console name to match device
    1028b769600c serial: tty: uartlite: fix console setup
    ba89ba738a82 ASoC: img: Fix PM reference leak in img_i2s_in_probe()
    b5af7cec0f7e mfd: cpcap: Fix cpcap dmamask not set warnings
    c19a95cffe33 mfd: da9052/stmpe: Add and modify MODULE_DEVICE_TABLE
    d05da38c4110 scsi: qedi: Fix null ref during abort handling
    a686ea60c17a scsi: iscsi: Fix shost->max_id use
    d04958a348e5 scsi: iscsi: Fix conn use after free during resets
    173fdf1497d9 scsi: iscsi: Add iscsi_cls_conn refcount helpers
    9896b67e1b56 scsi: megaraid_sas: Handle missing interrupts while re-enabling IRQs
    e8c75b5d88f2 scsi: megaraid_sas: Early detection of VD deletion through RaidMap update
    0c6226601c3e scsi: megaraid_sas: Fix resource leak in case of probe failure
    e54625f3f0f0 fs/jfs: Fix missing error code in lmLogInit()
    077b59810cb6 scsi: scsi_dh_alua: Check for negative result value
    ee16bed95986 tty: serial: 8250: serial_cs: Fix a memory leak in error handling path
    9c543a9197c7 ALSA: ac97: fix PM reference leak in ac97_bus_remove()
    086918e61c37 scsi: core: Cap scsi_host cmd_per_lun at can_queue
    600a91ab5981 scsi: lpfc: Fix crash when lpfc_sli4_hba_setup() fails to initialize the SGLs
    07aa0d14fc9e scsi: lpfc: Fix "Unexpected timeout" error in direct attach topology
    f1f72dac9219 scsi: hisi_sas: Propagate errors in interrupt_init_v1_hw()
    68ce66ba20cf w1: ds2438: fixing bug that would always get page0
    1c774366428e Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
    88262229b778 ALSA: usx2y: Don't call free_pages_exact() with NULL address
    7dff52b311b1 iio: magn: bmc150: Balance runtime pm + use pm_runtime_resume_and_get()
    921b361ce3ee iio: gyro: fxa21002c: Balance runtime pm + use pm_runtime_resume_and_get().
    d2639ffdcad4 misc: alcor_pci: fix null-ptr-deref when there is no PCI bridge
    38660031e80e misc/libmasm/module: Fix two use after free in ibmasm_init_one
    dc195d77dd6c tty: serial: fsl_lpuart: fix the potential risk of division or modulo by zero
    fd005f53cb49 srcu: Fix broken node geometry after early ssp init
    35072f336ae8 dmaengine: fsl-qdma: check dma_set_mask return value
    249e0ab80c47 net: moxa: Use devm_platform_get_and_ioremap_resource()
    359311b85ebe fbmem: Do not delete the mode that is still in use
    c17363ccd620 cgroup: verify that source is a string
    d4238c7539c8 tracing: Do not reference char * as a string in histograms
    887bfae2732b scsi: core: Fix bad pointer dereference when ehandler kthread is invalid
    22257d3c6840 KVM: X86: Disable hardware breakpoints unconditionally before kvm_x86->run()
    dc91a480ace2 KVM: x86: Use guest MAXPHYADDR from CPUID.0x8000_0008 iff TDP is enabled
    f2ff9d03432f KVM: mmio: Fix use-after-free Read in kvm_vm_ioctl_unregister_coalesced_mmio
    795e84798fa7 Linux 5.4.133
    135122f174c3 smackfs: restrict bytes count in smk_set_cipso()
    a21e5cb1a64c jfs: fix GPF in diFree
    f190ca9068e3 pinctrl: mcp23s08: Fix missing unlock on error in mcp23s08_irq()
    f176dec999c8 media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K
    5d2a52732eeb media: gspca/sunplus: fix zero-length control requests
    1c44f2e25d8e media: gspca/sq905: fix control-request direction
    0edd67591672 media: zr364xx: fix memory leak in zr364xx_start_readpipe
    27cd29ab9bf0 media: dtv5100: fix control-request directions
    917791e43441 media: subdev: disallow ioctl for saa6588/davinci
    04d67b34a33c PCI: aardvark: Implement workaround for the readback value of VEND_ID
    a340b84e09d3 PCI: aardvark: Fix checking for PIO Non-posted Request
    86968dfa4b55 PCI: Leave Apple Thunderbolt controllers on for s2idle or standby
    964d57d1962d dm btree remove: assign new_root only when removal succeeds
    ef0a06acc6b1 coresight: tmc-etf: Fix global-out-of-bounds in tmc_update_etf_buffer()
    4e78a2a4fced ipack/carriers/tpci200: Fix a double free in tpci200_pci_probe
    8489ebfac395 tracing: Resize tgid_map to pid_max, not PID_MAX_DEFAULT
    41aa59030213 tracing: Simplify & fix saved_tgids logic
    4d4f11c3566c rq-qos: fix missed wake-ups in rq_qos_throttle try two
    33ab9138a13e seq_buf: Fix overflow in seq_buf_putmem_hex()
    854bf7196601 extcon: intel-mrfld: Sync hardware and software state on init
    ec31e681cfbf nvmem: core: add a missing of_node_put
    f0f3f0abe58e power: supply: ab8500: Fix an old bug
    7adc05b73d91 ubifs: Fix races between xattr_{set|get} and listxattr operations
    5e4aae9e3e6b thermal/drivers/int340x/processor_thermal: Fix tcc setting
    ec170de13b69 ipmi/watchdog: Stop watchdog timer when the current action is 'none'
    efed363752c0 qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
    74f81fce1215 ASoC: tegra: Set driver_name=tegra for all machine drivers
    862e1aef2bd4 MIPS: fix "mipsel-linux-ld: decompress.c:undefined reference to `memmove'"
    5078f007d863 fpga: stratix10-soc: Add missing fpga_mgr_free() call
    cfaaed5e4a12 clocksource/arm_arch_timer: Improve Allwinner A64 timer workaround
    7044e6bbc8e8 cpu/hotplug: Cure the cpusets trainwreck
    c90a5b1c3742 ata: ahci_sunxi: Disable DIPM
    a7aa56f57e84 mmc: core: Allow UHS-I voltage switch for SDSC cards if supported
    2d95959fa4f4 mmc: core: clear flags before allowing to retune
    7e3b6e797a43 mmc: sdhci: Fix warning message when accessing RPMB in HS400 mode
    690735ee3a9d drm/arm/malidp: Always list modifiers
    e976698b2642 drm/msm/mdp4: Fix modifier support enabling
    49d05786661b drm/tegra: Don't set allow_fb_modifiers explicitly
    eaabef618cbb drm/amd/display: Reject non-zero src_y and src_x for video planes
    36a9c775a5f8 pinctrl/amd: Add device HID for new AMD GPIO controller
    7af725d1481c drm/amd/display: fix incorrrect valid irq check
    1fe8005303a3 drm/rockchip: dsi: remove extra component_del() call
    85ea095dc081 drm/radeon: Add the missed drm_gem_object_put() in radeon_user_framebuffer_create()
    d05c9f91be93 drm/amdgpu: Update NV SIMD-per-CU to 2
    a5cd29059916 powerpc/barrier: Avoid collision with clang's __lwsync macro
    a82471a14aad powerpc/mm: Fix lockup on kernel exec fault
    233339bf6c7c perf bench: Fix 2 memory sanitizer warnings
    4d579ef78ae6 crypto: ccp - Annotate SEV Firmware file names
    0e105eed0966 fscrypt: don't ignore minor_hash when hash is 0
    5d4fa5e1b907 MIPS: set mips32r5 for virt extensions
    2760c141dd10 MIPS: loongsoon64: Reserve memory below starting pfn to prevent Oops
    a01745edc1c9 sctp: add size validation when walking chunks
    03a5e454614d sctp: validate from_addr_param return
    d04cd2c4fdd0 Bluetooth: btusb: fix bt fiwmare downloading failure issue for qca btsoc.
    aa9a2ec7ee08 Bluetooth: Shutdown controller after workqueues are flushed or cancelled
    6aac389d50d9 Bluetooth: Fix the HCI to MGMT status conversion table
    a27610321c31 Bluetooth: btusb: Fixed too many in-token issue for Mediatek Chip.
    032c68b4f5be RDMA/cma: Fix rdma_resolve_route() memory leak
    d27483b844c8 net: ip: avoid OOM kills with large UDP sends over loopback
    3fbae80e24d6 media, bpf: Do not copy more entries than user space requested
    1127eb86b23d wireless: wext-spy: Fix out-of-bounds warning
    161107916c79 sfc: error code if SRIOV cannot be disabled
    a95fddec35f9 sfc: avoid double pci_remove of VFs
    105982781699 iwlwifi: pcie: fix context info freeing
    0b08e9b64b99 iwlwifi: pcie: free IML DMA memory allocation
    6e2df6630636 iwlwifi: mvm: don't change band on bound PHY contexts
    9fd9734e5739 RDMA/rxe: Don't overwrite errno from ib_umem_get()
    75b011df8e00 vsock: notify server to shutdown when client has pending signal
    2a0a6f67c5d5 atm: nicstar: register the interrupt handler in the right place
    8a366dd45518 atm: nicstar: use 'dma_free_coherent' instead of 'kfree'
    002d8b395fa1 MIPS: add PMD table accounting into MIPS'pmd_alloc_one
    e15cff87dff2 rtl8xxxu: Fix device info for RTL8192EU devices
    356bb9411a26 drm/amdkfd: Walk through list with dqm lock hold
    995c3fc302bd net: sched: fix error return code in tcf_del_walker()
    bba660a079a9 net: fix mistake path for netdev_features_strings
    cea6ca260d22 mt76: mt7615: fix fixed-rate tx status reporting
    e217aadc9b55 bpf: Fix up register-based shifts in interpreter to silence KUBSAN
    7f356894ff12 cw1200: add missing MODULE_DEVICE_TABLE
    d71dddeb5380 wl1251: Fix possible buffer overflow in wl1251_cmd_scan
    e919fc655294 wlcore/wl12xx: Fix wl12xx get_mac error if device is in ELP
    9981f8f4a8f9 xfrm: Fix error reporting in xfrm_state_construct.
    46a2cd9cecbb drm/amd/display: Verify Gamma & Degamma LUT sizes in amdgpu_dm_atomic_check
    5db647affcbd r8169: avoid link-up interrupt issue on RTL8106e if user enables ASPM
    bfb8eb833e7d selinux: use __GFP_NOWARN with GFP_NOWAIT in the AVC
    91f6b357e9c1 fjes: check return value after calling platform_get_resource()
    2c028cee95a4 drm/amdkfd: use allowed domain for vmbo validation
    5756c21dd7b7 drm/amd/display: Set DISPCLK_MAX_ERRDET_CYCLES to 7
    c7010d0f0789 drm/amd/display: Release MST resources on switch from MST to SST
    7182bba3c2c6 drm/amd/display: Update scaling settings on modeset
    2ee8e85ea87e net: micrel: check return value after calling platform_get_resource()
    80240ded7994 net: mvpp2: check return value after calling platform_get_resource()
    6ac291d2b4d9 net: bcmgenet: check return value after calling platform_get_resource()
    627fffae46c2 virtio_net: Remove BUG() to avoid machine dead
    217533e60deb ice: set the value of global config lock timeout longer
    c0b70153f13e pinctrl: mcp23s08: fix race condition in irq handler
    e10062afd67d dm space maps: don't reset space map allocation cursor when committing
    57ef44f35725 RDMA/cxgb4: Fix missing error code in create_qp()
    ccde03a6a0fb ipv6: use prandom_u32() for ID generation
    482708d036be clk: tegra: Ensure that PLLU configuration is applied properly
    050c6bb5cbf7 clk: renesas: r8a77995: Add ZA2 clock
    c84e0757d80b drm/bridge: cdns: Fix PM reference leak in cdns_dsi_transfer()
    cdfd4ceafba9 igb: handle vlan types with checker enabled
    596b031a3d3a e100: handle eeprom as little endian
    80d505aee639 udf: Fix NULL pointer dereference in udf_symlink function
    c32d0f0e164f drm/sched: Avoid data corruptions
    6ebfdf01cc89 drm/virtio: Fix double free on probe failure
    5e2d303b452a reiserfs: add check for invalid 1st journal block
    1a2d21e266c4 drm/mediatek: Fix PM reference leak in mtk_crtc_ddp_hw_init()
    45cc7a653f5a net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    bdf5334250c6 atm: nicstar: Fix possible use-after-free in nicstar_cleanup()
    3ecd228c636e mISDN: fix possible use-after-free in HFC_cleanup()
    c9172498d4d6 atm: iphase: fix possible use-after-free in ia_module_exit()
    b52b0d996a13 hugetlb: clear huge pte during flush function on mips platform
    526451e8d241 drm/amd/display: fix use_max_lb flag for 420 pixel formats
    cfd8894619d1 net: pch_gbe: Use proper accessors to BE data in pch_ptp_match()
    f6d326ad0324 drm/vc4: fix argument ordering in vc4_crtc_get_margins()
    997dedaa75e9 drm/amd/amdgpu/sriov disable all ip hw status by default
    34b01e883a5d drm/zte: Don't select DRM_KMS_FB_HELPER
    012439cba95c drm/mxsfb: Don't select DRM_KMS_FB_HELPER

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f38fa9ad02b625534b91328755efbbdcff200010)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index dcf4f12f45..7d7470bec4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "135b02c845043f37c8eac73607b62b0735286756"
-SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
+SRCREV_machine ?= "849a67646d942d3a6d706f456df39954367ac7bf"
+SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.132"
+LINUX_VERSION ?= "5.4.134"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index eaef9d9b64..95ead533d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.132"
+LINUX_VERSION ?= "5.4.134"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "629ca595e3eafd1fdc3a3d978d6ed4547b419968"
-SRCREV_machine ?= "35abc20f52ebdd41bbe76e6f2d6ee189ab3078f6"
-SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
+SRCREV_machine_qemuarm ?= "86c31c51c87557af60e4d4dbee73f18618bc4c92"
+SRCREV_machine ?= "bf89a54b3f77fbac15dd0194870db288aee5c8b7"
+SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index cb3ff75d27..1816287217 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cf8b645d7a1c268d071bdfe606f01d739afbdb80"
-SRCREV_machine_qemuarm64 ?= "8d40ced691b9d211840801614a1031089ed6c2a2"
-SRCREV_machine_qemumips ?= "c574c7303a75e700cb7123fc93a7ca7c19c963d6"
-SRCREV_machine_qemuppc ?= "5550c64c43f81e6c29abfbc6ce31f44f200644ec"
-SRCREV_machine_qemuriscv64 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
-SRCREV_machine_qemux86 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
-SRCREV_machine_qemux86-64 ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
-SRCREV_machine_qemumips64 ?= "9cd841f768e0b5a07251df29ba202b5ff2bdf114"
-SRCREV_machine ?= "92705f96294a9c4ac611d3242f20651d5cf6224a"
-SRCREV_meta ?= "2ff6e592745fd397ec2da205ab02daafbf49351a"
+SRCREV_machine_qemuarm ?= "bea52ab7529ef152f99a0f6ebd97cc7e904e5360"
+SRCREV_machine_qemuarm64 ?= "8a29c9de0fc366bd89ce6954685dce0e330dbabe"
+SRCREV_machine_qemumips ?= "b15816ccad0762d27c78c269e7a1986504e60c63"
+SRCREV_machine_qemuppc ?= "906f9509a8d2f842ec8766bf81287f8939ff1fa8"
+SRCREV_machine_qemuriscv64 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
+SRCREV_machine_qemux86 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
+SRCREV_machine_qemux86-64 ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
+SRCREV_machine_qemumips64 ?= "152e33a0782920e9707c36ccacf53585a8911e9f"
+SRCREV_machine ?= "dd8a64a523fb714a98328441e0de72cde115a6fc"
+SRCREV_meta ?= "d6aec4fb69bae34f34db6f153871a0847d8198f3"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.132"
+LINUX_VERSION ?= "5.4.134"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

