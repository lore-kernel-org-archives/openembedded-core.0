Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207CCC3DA7B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.57987.1671561736542596924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sh+JonBB;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c7so11759959qtw.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSyxD4Hmwouar99zipte/OLg/BTVViX4PC1cT96R3fY=;
        b=Sh+JonBBtvGapD4n3QggjkcP4ywJfk/Uj3Mtx32Rs+jaMbzLVUgJUIdVe4r1HE3QeO
         0rxmyVj7drawYAWhOhBBmkv7Tam+vCvOE33EDs1jumAnE59k4NKeFvnBO7y3hNTxfJE5
         7hS6cpHZq9u8tbwUL/KqaK9Q1YQ+XJB7XDsGuCBhGfhmaE/PFKjneKa/ve2TpGIuJLxE
         ctQousQsLuJVKNFRJSc9M1wyQ8NeZW6u9hHBNnCBcXlBGPEsz2dSi104iC7KbblExvMF
         04Hp99SVOjzrxTiuckKWmbCw4yI1+kJGTyAGTZcg8Md28xWxynAWMtVVFfALDSxXiPMl
         +mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSyxD4Hmwouar99zipte/OLg/BTVViX4PC1cT96R3fY=;
        b=0wKI8R/dCdHH4OrKZIL0Wv0k7WdIviNHMBfMtI5w5B9rbnqeOBt8VtcZzaZ/u9da3q
         JuhvgaJ9IFlBjprbJ5xdFEqb1eQkFfocqICZzTXdUQiC9LePaNGG5ojWJV1bFae2tewp
         i4eM5ktUalkyuVsoEFOtQakIsAFp9/o1ezKTv/qqqjvTc3ZhcQuDP94QDXeofSH8tggP
         W4Poki3SmH/9daO98RbzlokLcz6YWeNAWwwSTVLBp2xKc+KDKcNnjM7eSnVtn+1j456F
         sbcmc/FOg5ovQOt+fBAGpsWNETejndYZAEFctBe9SVlK5fA9qnNf4iq7jS0c2VCaw7wS
         quug==
X-Gm-Message-State: AFqh2kre64G5ghX4I5cY/setuzM2OqXvuZQfFoJI8Qw+C3j1/Cw1mSIh
	hp2RNRePtvZvwyE6pTe6RJqaNozLV6M=
X-Google-Smtp-Source: AMrXdXsN8bzwyhlqaFB6K8RdbIysE1sZ/AhaGhlQv45UXO2VXRO9eZyymygu6/upmGPOTxMeP06hPQ==
X-Received: by 2002:a05:622a:1b0a:b0:3a9:7ff3:322f with SMTP id bb10-20020a05622a1b0a00b003a97ff3322fmr17128486qtb.18.1671561735301;
        Tue, 20 Dec 2022 10:42:15 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/5.15: update to v5.15.80
Date: Tue, 20 Dec 2022 13:42:03 -0500
Message-Id: <576138fa503c012fac368691603eebfb74705120.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174874

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    71e496bd3382 Linux 5.15.80
    b63ddb3ba61e ntfs: check overflow when iterating ATTR_RECORDs
    ab6a1bb17e3c ntfs: fix out-of-bounds read in ntfs_attr_find()
    5330c423b862 ntfs: fix use-after-free in ntfs_attr_find()
    43bbadb7e463 net/9p: use a dedicated spinlock for trans_fd
    9357fca9dad7 mm: fs: initialize fsdata passed to write_begin/write_end interface
    b334ab4c3347 wifi: wext: use flex array destination for memcpy()
    0e07032b4b47 9p/trans_fd: always use O_NONBLOCK read/write
    7c7b7476b56e gfs2: Switch from strlcpy to strscpy
    28275a7c84d2 gfs2: Check sb_bsize_shift after reading superblock
    a4f1a01b2e81 9p: trans_fd/p9_conn_cancel: drop client lock earlier
    f7b0e95071bb kcm: close race conditions on sk_receive_queue
    27d706b0d394 kcm: avoid potential race in kcm_tx_work
    b49026d9c86f tcp: cdg: allow tcp_cdg_release() to be called multiple times
    e41cbf98df22 macvlan: enforce a consistent minimal mtu
    d5f7f6e63fed Input: i8042 - fix leaking of platform device on module removal
    c49cc2c059b5 kprobes: Skip clearing aggrprobe's post_handler in kprobe-on-ftrace case
    71beab7119d0 scsi: scsi_debug: Fix possible UAF in sdebug_add_host_helper()
    a636772988ba scsi: target: tcm_loop: Fix possible name leak in tcm_loop_setup_hba_bus()
    cb7893c85ea8 net: use struct_group to copy ip/ipv6 header addresses
    9b8c0c88f414 tracing: Fix warning on variable 'struct trace_array'
    73cf0ff9a393 ring-buffer: Include dropped pages in counting dirty patches
    35c60b4e8ca7 perf: Improve missing SIGTRAP checking
    2ac6276864de serial: 8250_lpss: Use 16B DMA burst with Elkhart Lake
    b1a27b2aad93 nvme: ensure subsystem reset is single threaded
    bccece3c3331 nvme: restrict management ioctls to admin
    8cddb0d96b9c perf/x86/intel/pt: Fix sampling using single range output
    8e2f33c59837 misc/vmw_vmci: fix an infoleak in vmci_host_do_receive_datagram()
    9a72a46cb01d docs: update mediator contact information in CoC doc
    a99a547658e5 mmc: sdhci-pci: Fix possible memory leak caused by missing pci_dev_put()
    4a1b6f7839d3 mmc: sdhci-pci-o2micro: fix card detect fail issue caused by CD# debounce timeout
    fd285d421563 mmc: core: properly select voltage range without power cycle
    8a9bae5f1b53 firmware: coreboot: Register bus in module init
    052d0e79efe5 iommu/vt-d: Set SRE bit only when hardware has SRS cap
    c31a792a825a iommu/vt-d: Preset Access bit for IOVA in FL non-leaf paging entries
    11edbdee4399 scsi: zfcp: Fix double free of FSF request when qdio send fails
    fdf87b5b3087 net: phy: marvell: add sleep time after enabling the loopback bit
    9648d760edf4 maccess: Fix writing offset in case of fault in strncpy_from_kernel_nofault()
    fdd57c20d440 Input: iforce - invert valid length check when fetching device IDs
    0cafb719bed5 serial: 8250_lpss: Configure DMA also w/o DMA filter
    59f6596697f1 serial: 8250: Flush DMA Rx on RLSI
    118b52c2ae08 serial: 8250: Fall back to non-DMA Rx if IIR_RDI occurs
    6ffce7a92ef5 dm ioctl: fix misbehavior if list_versions races with module loading
    2b104973f7fd iio: pressure: ms5611: changed hardcoded SPI speed to value limited
    1678d4abb2dc iio: adc: mp2629: fix potential array out of bound access
    bd22c232ead9 iio: adc: mp2629: fix wrong comparison of channel
    656f67061366 iio: trigger: sysfs: fix possible memory leak in iio_sysfs_trig_init()
    1bf8c0aff8fb iio: adc: at91_adc: fix possible memory leak in at91_adc_allocate_trigger()
    afc0aea70261 usb: typec: mux: Enter safe mode only when pins need to be reconfigured
    8236628a549d usb: cdns3: host: fix endless superspeed hub port reset
    ead83b0db81f usb: chipidea: fix deadlock in ci_otg_del_timer
    cc9e6d8c55c9 usb: add NO_LPM quirk for Realforce 87U Keyboard
    70eca1d261b2 USB: serial: option: add Fibocom FM160 0x0111 composition
    1b6a54885c40 USB: serial: option: add u-blox LARA-L6 modem
    b0467d0059bc USB: serial: option: add u-blox LARA-R6 00B modem
    95688a8a5735 USB: serial: option: remove old LARA-R6 PID
    53dee78ea382 USB: serial: option: add Sierra Wireless EM9191
    e7764e88e6c4 USB: bcma: Make GPIO explicitly optional
    a190a83db284 speakup: fix a segfault caused by switching consoles
    b3c6edbee48e slimbus: stream: correct presence rate frequencies
    6b35ac831555 slimbus: qcom-ngd: Fix build error when CONFIG_SLIM_QCOM_NGD_CTRL=y && CONFIG_QCOM_RPROC_COMMON=m
    0f847462fea1 Revert "usb: dwc3: disable USB core PHY management"
    23ad214a8665 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    a36b505749c6 ALSA: hda/realtek: fix speakers for Samsung Galaxy Book Pro
    02b94885b2fd ALSA: usb-audio: Drop snd_BUG_ON() from snd_usbmidi_output_open()
    7176d6f3adb9 drm/amd/display: Add HUBP surface flip interrupt handler
    e57daa750369 tracing: kprobe: Fix potential null-ptr-deref on trace_array in kprobe_event_gen_test_exit()
    3a41c0f2a5c3 tracing: kprobe: Fix potential null-ptr-deref on trace_event_file in kprobe_event_gen_test_exit()
    7291dec4f2d1 tracing: Fix race where eprobes can be called before the event
    6517b97134f7 tracing: Fix wild-memory-access in register_synth_event()
    07ba4f0603ab tracing: Fix memory leak in test_gen_synth_cmd() and test_empty_synth_event()
    8b318f3032bf tracing/ring-buffer: Have polling block on watermark
    2c21ee020ce4 tracing: Fix memory leak in tracing_read_pipe()
    00f74b1a98a2 ring_buffer: Do not deactivate non-existant pages
    1bea037a1abb ftrace: Fix null pointer dereference in ftrace_add_mod()
    fadfcf39fbcd ftrace: Optimize the allocation for mcount entries
    5c5f2642898f ftrace: Fix the possible incorrect kernel message
    2ab249416244 cifs: add check for returning value of SMB2_set_info_init
    5783abda58d6 net: thunderbolt: Fix error handling in tbnet_init()
    80e590aeb132 net: microchip: sparx5: Fix potential null-ptr-deref in sparx_stats_init() and sparx5_start()
    4a55aec1425f cifs: Fix wrong return value checking when GETFLAGS
    c8baf1fc248b net/x25: Fix skb leak in x25_lapb_receive_frame()
    af4b57fa6bd0 net: ag71xx: call phylink_disconnect_phy if ag71xx_hw_enable() fail in ag71xx_open()
    61404a182eb5 cifs: add check for returning value of SMB2_close_init
    d3233f4bf3dd platform/surface: aggregator: Do not check for repeated unsequenced packets
    69691714035b platform/x86/intel: pmc: Don't unconditionally attach Intel PMC when virtualized
    7d93417d5964 drbd: use after free in drbd_create_device()
    fc16a2c81a3e bridge: switchdev: Fix memory leaks when changing VLAN protocol
    3d90a668c4bc net: hns3: fix setting incorrect phy link ksettings for firmware in resetting process
    3f7b2ef8fe92 net: ena: Fix error handling in ena_init()
    2540eea1bdc3 net: ionic: Fix error handling in ionic_init_module()
    c08c13cb13fa xen/pcpu: fix possible memory leak in register_pcpu()
    97009f07f217 net: dsa: make dsa_master_ioctl() see through port_hwtstamp_get() shims
    88da008e5e2f net: mhi: Fix memory leak in mhi_net_dellink()
    8f839715d032 bnxt_en: Remove debugfs when pci_register_driver failed
    b88713d92bd3 net: caif: fix double disconnect client in chnl_net_open()
    6d2403416089 net: macvlan: Use built-in RCU list checking
    596230471da3 mISDN: fix misuse of put_device() in mISDN_register_device()
    07a6a8cf1712 net: liquidio: release resources when liquidio driver open failed
    19feb6cf4136 soc: imx8m: Enable OCOTP clock before reading the register
    8c54d706d829 net: stmmac: ensure tx function is not running in stmmac_xdp_release()
    6219f46c2b9d net: hinic: Fix error handling in hinic_module_init()
    7a05e3929668 mISDN: fix possible memory leak in mISDN_dsp_element_register()
    0ee6455c9cfa net: bgmac: Drop free_netdev() from bgmac_enet_remove()
    7ff4fa179e4e bpf: Initialize same number of free nodes for each pcpu_freelist
    12f178cf05f3 MIPS: Loongson64: Add WARN_ON on kexec related kmalloc failed
    a4d6e024bea2 MIPS: fix duplicate definitions for exported symbols
    44142b652a28 nfp: change eeprom length to max length enumerators
    f23058dc2398 ata: libata-transport: fix error handling in ata_tdev_add()
    67b219314628 ata: libata-transport: fix error handling in ata_tlink_add()
    e7bb1b7a7bf2 ata: libata-transport: fix error handling in ata_tport_add()
    377ff82c33c0 ata: libata-transport: fix double ata_host_put() in ata_tport_add()
    494df0b0efe8 arm64: dts: imx8mn: Fix NAND controller size-cells
    7178d568f7cc arm64: dts: imx8mm: Fix NAND controller size-cells
    8ccf18c82a0a ARM: dts: imx7: Fix NAND controller size-cells
    e884a6c2d49a drm: Fix potential null-ptr-deref in drm_vblank_destroy_worker()
    07e56de8766f drm/drv: Fix potential memory leak in drm_dev_init()
    45c300613bee drm/panel: simple: set bpc field for logic technologies displays
    779f3f9e0cdc drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms
    97e5b508e961 pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
    9a77b8557fdb parport_pc: Avoid FIFO port location truncation
    5d03c2911c52 siox: fix possible memory leak in siox_device_add()
    530e987a0226 arm64: Fix bit-shifting UB in the MIDR_CPU_MODEL() macro
    d4944497827a bpf: Fix memory leaks in __check_func_call
    25521fd2e217 block: sed-opal: kmalloc the cmd/resp buffers
    2f21d653c648 scsi: scsi_transport_sas: Fix error handling in sas_phy_add()
    7cd28bc410d2 pinctrl: rockchip: list all pins in a possible mux route for PX30
    ab79b8dbe21e ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
    eaa8edd86514 bpf, test_run: Fix alignment problem in bpf_prog_test_run_skb()
    33cabe04d2c8 tty: n_gsm: fix sleep-in-atomic-context bug in gsm_control_send
    ae22294e213a serial: imx: Add missing .thaw_noirq hook
    26db1cd5191e serial: 8250: omap: Flush PM QOS work on remove
    e0db709a58bd serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in omap8250_remove()
    83b6d4d6da67 serial: 8250_omap: remove wait loop from Errata i202 workaround
    76db05ab7092 serial: 8250: omap: Fix missing PM runtime calls for omap8250_set_mctrl()
    2aee616a6b11 ARM: at91: pm: avoid soft resetting AC DLL
    188546c78006 ASoC: tas2764: Fix set_tdm_slot in case of single slot
    5782896daf65 ASoC: tas2770: Fix set_tdm_slot in case of single slot
    34eee4189bce ASoC: core: Fix use-after-free in snd_soc_exit()
    aa6f8aecbbf2 ARM: dts: at91: sama7g5: fix signal name of pin PB2
    487fff700f5f spi: stm32: Print summary 'callbacks suppressed' message
    2cec2f65c1e7 arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed
    44dbe66bb3ea arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
    8b2eae7def2b arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
    c8e76eeea77c arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
    30571f28bb35 hugetlbfs: don't delete error page from pagecache
    14ddbb83c342 KVM: x86/pmu: Do not speculatively query Intel GP PMCs that don't exist yet
    a9b964ed7cf9 spi: intel: Use correct mask for flash and protected regions
    f4eb68642ed3 mtd: spi-nor: intel-spi: Disable write protection only if asked
    156d0c823c59 ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"
    5907ff9f2c8f x86/cpu: Add several Intel server CPU model numbers
    41e37d04e397 Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm
    b02a025dd188 btrfs: remove pointless and double ulist frees in error paths of qgroup tests
    1c366c206ff2 drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
    1c8ded1b3879 i2c: i801: add lis3lv02d's I2C address for Vostro 5568
    b432581f19a0 i2c: tegra: Allocate DMA memory for DMA engine
    7b0ae4c7b918 firmware: arm_scmi: Cleanup the core driver removal callback
    1a8a2fef273d ACPI: x86: Add another system to quirk list for forcing StorageD3Enable
    8a03a4a5cf6d NFSv4: Retry LOCK on OLD_STATEID during delegation return
    49ca2227c47b btrfs: raid56: properly handle the error when unable to find the missing stripe
    0f7bd3a2dfe1 RDMA/efa: Add EFA 0xefa2 PCI ID
    a42d4363e78f ACPI: scan: Add LATT2021 to acpi_ignore_dep_ids[]
    004decd41b32 drm/amd/display: Remove wrong pipe control lock
    7779efbb99bf ASoC: rt1308-sdw: add the default value of some registers
    ef1e4ed85814 selftests/intel_pstate: fix build for ARCH=x86_64
    dfd3cc1ef3e2 selftests/futex: fix build for clang
    648467236c12 ASoC: Intel: sof_sdw: add quirk variant for LAPBC710 NUC15
    64ee750c29da ASoC: codecs: jz4725b: fix capture selector naming
    150b74cd0625 ASoC: codecs: jz4725b: use right control for Capture Volume
    5352d8b31572 ASoC: codecs: jz4725b: fix reported volume for Master ctl
    85134577a7f2 ASoC: codecs: jz4725b: add missed Line In power control bit
    5e61dffb16dc spi: intel: Fix the offset to get the 64K erase opcode
    c697cb2e6663 ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK
    569085124d75 ASoC: rt1019: Fix the TDM settings
    4160a515c75b ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
    2963ec4535a1 ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
    30a2f9479c21 ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
    3bf6da38a292 ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
    94fa250ea55c mm: shmem: don't truncate page if memory failure happens
    003fa195911d mm: hwpoison: handle non-anonymous THP correctly
    a62b1bc603a1 mm: hwpoison: refactor refcount check handling
    3df0eeae4d9a Linux 5.15.79
    599b24eedf2a x86/cpu: Restore AMD's DE_CFG MSR after resume
    9132fa043f96 net: tun: call napi_schedule_prep() to ensure we own a napi
    1dea25e25acd drm/amdkfd: Migrate in CPU page fault use current mm
    a1c303fbd4dd marvell: octeontx2: build error: unknown type name 'u64'
    d948b228343a dmaengine: at_hdmac: Check return code of dma_async_device_register
    c556ecf32a07 dmaengine: at_hdmac: Fix impossible condition
    8a941ff34e53 dmaengine: at_hdmac: Don't allow CPU to reorder channel enable
    53831f7a13c3 dmaengine: at_hdmac: Fix completion of unissued descriptor in case of errors
    14f5462e4a00 dmaengine: at_hdmac: Fix descriptor handling when issuing it to hardware
    5482403228be dmaengine: at_hdmac: Fix concurrency over the active list
    82ca19414faa dmaengine: at_hdmac: Free the memset buf without holding the chan lock
    8fd36e069d65 dmaengine: at_hdmac: Fix concurrency over descriptor
    1ee012d452b1 dmaengine: at_hdmac: Fix concurrency problems by removing atc_complete_all()
    90c1b07406f0 dmaengine: at_hdmac: Protect atchan->status with the channel lock
    b5ee1fe06ad7 dmaengine: at_hdmac: Do not call the complete callback on device_terminate_all
    9bbf5df0fc8c dmaengine: at_hdmac: Fix premature completion of desc in issue_pending
    f7d1aaa90319 dmaengine: at_hdmac: Start transfer for cyclic channels in issue_pending
    e9777b4efcce dmaengine: at_hdmac: Don't start transactions at tx_submit level
    4e28674a0ecd dmaengine: at_hdmac: Fix at_lli struct definition
    49eba53137f5 cert host tools: Stop complaining about deprecated OpenSSL functions
    69e86c6268d5 can: j1939: j1939_send_one(): fix missing CAN header initialization
    81fc8f90b885 mm/shmem: use page_mapping() to detect page cache for uffd continue
    e91451af11f9 mm/memremap.c: map FS_DAX device memory as decrypted
    48998c1773a4 mm/damon/dbgfs: check if rm_contexts input is for a real context
    c736ed854160 udf: Fix a slab-out-of-bounds write bug in udf_find_entry()
    2e87eddf5736 mms: sdhci-esdhc-imx: Fix SDHCI_RESET_ALL for CQHCI
    91c38504e589 btrfs: zoned: initialize device's zone info for seeding
    432c30ba3f56 btrfs: selftests: fix wrong error check in btrfs_free_dummy_root()
    c9fe4719c662 btrfs: fix match incorrectly in dev_args_match_device
    f96fd3693631 wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()
    8e2b576caf91 platform/x86: hp_wmi: Fix rfkill causing soft blocked wifi
    cb3ab0e1e074 drm/amdgpu: disable BACO on special BEIGE_GOBY card
    dc066a78500a drm/i915/dmabuf: fix sg_table handling in map_dma_buf
    afbd1188382a nilfs2: fix use-after-free bug of ns_writer on remount
    abc082aac0d9 nilfs2: fix deadlock in nilfs_count_free_blocks()
    589da2288197 ata: libata-scsi: fix SYNCHRONIZE CACHE (16) command failure
    51ae4579a5d5 vmlinux.lds.h: Fix placement of '.data..decrypted' section
    1f8e08ab3269 ALSA: usb-audio: Add DSD support for Accuphase DAC-60
    c2451f62b2bd ALSA: usb-audio: Add quirk entry for M-Audio Micro
    031d1480a0f4 ALSA: usb-audio: Yet more regression for for the delayed card registration
    574f51e4aa40 ALSA: hda/realtek: Add Positivo C6300 model quirk
    7140d7aaf93d ALSA: hda: fix potential memleak in 'add_widget_node'
    f6d7a487aabd ALSA: hda/ca0132: add quirk for EVGA Z390 DARK
    1ccd55b3901b ALSA: hda/hdmi - enable runtime pm for more AMD display audio
    29100c674208 mmc: sdhci-esdhc-imx: use the correct host caps for MMC_CAP_8_BIT_DATA
    3dce99e2eb06 mmc: sdhci-tegra: Fix SDHCI_RESET_ALL for CQHCI
    9d6bd33e6aeb mmc: sdhci_am654: Fix SDHCI_RESET_ALL for CQHCI
    ad01f16ca90c mmc: sdhci-of-arasan: Fix SDHCI_RESET_ALL for CQHCI
    1aa78c1d013c mmc: cqhci: Provide helper for resetting both SDHCI and CQHCI
    c198524a99cb MIPS: jump_label: Fix compat branch range check
    9713ceffa40a arm64: efi: Fix handling of misaligned runtime regions and drop warning
    518e49f0590d riscv: fix reserved memory setup
    d07c3d7491b4 riscv: vdso: fix build with llvm
    cc36c7fa5d93 riscv: process: fix kernel info leakage
    a8d67367ab33 net: macvlan: fix memory leaks of macvlan_common_newlink
    7b194dd32b13 ethernet: tundra: free irq when alloc ring failed in tsi108_open()
    7de10342fe14 net: mv643xx_eth: disable napi when init rxq or txq failed in mv643xx_eth_open()
    88e1dd2d9291 ethernet: s2io: disable napi when start nic failed in s2io_card_up()
    3652f1f8d3ea net: atlantic: macsec: clear encryption keys from the stack
    fca3b0a1fd3e net: phy: mscc: macsec: clear encryption keys when freeing a flow
    60a0af8813fd stmmac: dwmac-loongson: fix missing of_node_put() while module exiting
    ee4a9bd2c7f4 stmmac: dwmac-loongson: fix missing pci_disable_device() in loongson_dwmac_probe()
    4a8770eebc39 stmmac: dwmac-loongson: fix missing pci_disable_msi() while module exiting
    83196d8dc5a8 cxgb4vf: shut down the adapter when t4vf_update_port_info() failed in cxgb4vf_open()
    49d8a6e24a34 mctp: Fix an error handling path in mctp_init()
    29961d2332a5 stmmac: intel: Update PCH PTP clock rate from 200MHz to 204.8MHz
    8604bebc5c32 stmmac: intel: Enable 2.5Gbps for Intel AlderLake-S
    7dec6dae2b61 net: cxgb3_main: disable napi when bind qsets failed in cxgb_up()
    960f9d30def3 net: cpsw: disable napi in cpsw_ndo_open()
    1360778fdb6f net/mlx5e: E-Switch, Fix comparing termination table instance
    f13e9ebd2925 net/mlx5: Allow async trigger completion execution on single CPU systems
    48b73b46a5b0 net/mlx5: Bridge, verify LAG state when adding bond to bridge
    13b1ea861e8a net: wwan: iosm: fix memory leak in ipc_pcie_read_bios_cfg
    7e4dcacb4dd6 net: nixge: disable napi when enable interrupts failed in nixge_open()
    409731df6310 net: marvell: prestera: fix memory leak in prestera_rxtx_switch_init()
    77ff31cba9a6 netfilter: Cleanup nft_net->module_list from nf_tables_exit_net()
    e62cb1c093d6 netfilter: nfnetlink: fix potential dead lock in nfnetlink_rcv_msg()
    0bd20318da08 perf tools: Add the include/perf/ directory to .gitignore
    a733671e388c perf stat: Fix printing os->prefix in CSV metrics output
    c36e9e2c4aff drivers: net: xgene: disable napi when register irq failed in xgene_enet_open()
    4689bd3a1b23 net: lapbether: fix issue of invalid opcode in lapbeth_open()
    1dd27541aa2b dmaengine: ti: k3-udma-glue: fix memory leak when register device fail
    992e966caf57 dmaengine: mv_xor_v2: Fix a resource leak in mv_xor_v2_remove()
    9766af75ba5a dmaengine: pxa_dma: use platform_get_irq_optional
    301caa06091a tipc: fix the msg->req tlv len check in tipc_nl_compat_name_table_dump_header
    6a264203dbdb net: broadcom: Fix BCMGENET Kconfig
    e7871b9a21ae net: stmmac: dwmac-meson8b: fix meson8b_devm_clk_prepare_enable()
    261178a1c262 can: af_can: fix NULL pointer dereference in can_rx_register()
    2acb2779b147 ipv6: addrlabel: fix infoleak when sending struct ifaddrlblmsg to network
    13ecaa6832fb tcp: prohibit TCP_REPAIR_OPTIONS if data was already sent
    bc79cb9fb006 drm/vc4: Fix missing platform_unregister_drivers() call in vc4_drm_register()
    2845bc9070ce net: wwan: mhi: fix memory leak in mhi_mbim_dellink
    2ce2348c2858 net: wwan: iosm: fix memory leak in ipc_wwan_dellink
    7b6bc50f65e9 hamradio: fix issue of dev reference count leakage in bpq_device_event()
    f59adebb8c28 net: lapbether: fix issue of dev reference count leakage in lapbeth_device_event()
    119407dc329a KVM: s390: pv: don't allow userspace to set the clock under PV
    500bcd3a99ea phy: ralink: mt7621-pci: add sentinel to quirks table
    151dc8087b56 capabilities: fix undefined behavior in bit shift for CAP_TO_MASK
    435c7ddfd510 net: fman: Unregister ethernet device on removal
    3a504d6d96ea bnxt_en: fix potentially incorrect return value for ndo_rx_flow_steer
    ac257c43fa61 bnxt_en: Fix possible crash in bnxt_hwrm_set_coal()
    d7569302a7a5 net: tun: Fix memory leaks of napi_get_frags
    430d1f4964dd octeontx2-pf: NIX TX overwrites SQ_CTX_HW_S[SQ_INT]
    ec0db81883b4 octeontx2-pf: Use hardware register for CQE count
    b89a0d8859ae macsec: clear encryption keys from the stack after setting up offload
    eeba7f07a0cb macsec: fix detection of RXSCs when toggling offloading
    3070a880eb03 macsec: fix secy->n_rx_sc accounting
    e957555a3694 macsec: delete new rxsc when offload fails
    ad25a115f508 net: gso: fix panic on frag_list with mixed head alloc types
    466ce46f251d bpf: Fix wrong reg type conversion in release_reference()
    35d8130f2ad0 bpf: Add helper macro bpf_for_each_reg_in_vstate
    61274498fbf8 bpf, sock_map: Move cancel_work_sync() out of sock lock
    32b5dd03beeb bpf: Fix sockmap calling sleepable function in teardown path
    e9915581899c bpf, sockmap: Fix sk->sk_forward_alloc warn_on in sk_stream_kill_queues
    5ad95d71344b HID: hyperv: fix possible memory leak in mousevsc_probe()
    6dcdd1b68b7f bpftool: Fix NULL pointer dereference when pin {PROG, MAP, LINK} without FILE
    2fc902245c82 wifi: mac80211: Set TWT Information Frame Disabled bit as 1
    95adbd2ac8de bpf, sockmap: Fix the sk->sk_forward_alloc warning of sk_stream_kill_queues
    06615967d488 bpf, verifier: Fix memory leak in array reallocation for stack state
    4335a82c4f7b soundwire: qcom: check for outanding writes before doing a read
    ae4dad2e5374 soundwire: qcom: reinit broadcast completion
    38c9fa2cc6bf wifi: cfg80211: fix memory leak in query_regdb_file()
    2c6ba0a7872b wifi: cfg80211: silence a sparse RCU warning
    921738c280ab phy: stm32: fix an error code in probe
    fa722006f762 hwspinlock: qcom: correct MMIO max register for newer SoCs
    3c1bb6187e56 drm/amdkfd: Fix NULL pointer dereference in svm_migrate_to_ram()
    b1f852277171 drm/amdkfd: handle CPU fault on COW mapping
    36770c045aba drm/amdkfd: avoid recursive lock in migrations back to RAM
    93a5de7e8843 fuse: fix readdir cache race
    1920cf94545a thunderbolt: Add DP OUT resource when DP tunnel is discovered
    47dbf2496990 thunderbolt: Tear down existing tunnels when resuming from hibernate

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto_5.15.bbappend              | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
index b9d4a4df1e..a969222442 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -7,17 +7,17 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:genericx86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:edgerouter ?= "7d45a6cb45c174d33daf3c2af544861a6c1ece53"
-SRCREV_machine:beaglebone-yocto ?= "d3780eabef136a2129ee69249512abd0d69ccd04"
+SRCREV_machine:genericx86 ?= "1275299b4a49c5845378537d2d623dfbe027dcca"
+SRCREV_machine:genericx86-64 ?= "1275299b4a49c5845378537d2d623dfbe027dcca"
+SRCREV_machine:edgerouter ?= "28658152bb865c3e7ffde6ac277fab5dc1940c0a"
+SRCREV_machine:beaglebone-yocto ?= "4f8b81b735ff381cde5ae840552727175393b77a"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
 COMPATIBLE_MACHINE:edgerouter = "edgerouter"
 COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-LINUX_VERSION:genericx86 = "5.15.78"
-LINUX_VERSION:genericx86-64 = "5.15.78"
-LINUX_VERSION:edgerouter = "5.15.78"
-LINUX_VERSION:beaglebone-yocto = "5.15.78"
+LINUX_VERSION:genericx86 = "5.15.80"
+LINUX_VERSION:genericx86-64 = "5.15.80"
+LINUX_VERSION:edgerouter = "5.15.80"
+LINUX_VERSION:beaglebone-yocto = "5.15.80"
-- 
2.37.3


