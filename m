Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DC9C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:41:57 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.28725.1671471711346315258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H5XQgtxa;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id i20so8815807qtw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tb/LBpS8iFY+8Zbm7LmbpuaJ6+SEzDEbQBznqBGpjfs=;
        b=H5XQgtxafHLcM8/ETBX8SB0DD9LBqCSLPQkFUSnsQLAjeISE4l71SutIukbFk+8eYH
         uiGfzrZNRxl8d06X28Xy0m8hj03xml85f6HG0ryVOyXl04AemKbLazZ2/fXusT7vNBaZ
         7kzTHY/olaPExtk9+OtC7kKKS5HZjvghtoBEG8DUm1G+zH5vZJdofVPW6aab09Axqvuh
         OYrM9DXXIzK5RWl4ZhPXeopfUbnpdmxE5BqP9I1Fh91ajVr2hMlxcVNW+LLhFVbWuDkN
         MmDYFm0uG6TNeNCDtrwHL+7U171+y9h9Pl9jKxCttVpyULwDyeJ1HmCVvFU8xlpBjcL7
         k85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tb/LBpS8iFY+8Zbm7LmbpuaJ6+SEzDEbQBznqBGpjfs=;
        b=oGwvJhTisOIpKtFldK20V2EzA49rtj6weCAtovKhML7AQazrkxuK/zav3QR6xW1bXN
         bVQzlegtGSVy2WvhXKBjXbnRBiaR5nlstX3uLZ1XPONAQzsGyqtJZC/G/5jYbCNCGLb3
         nO0zBEoE7rBCsr+s+E3O9NDDfgUucnxWEpzH4At9jV5DSCtxZN5yhVvosHMGSJfab9pZ
         p9FCvD77gLedyzthz5WrewE+XSjFH0Smown9ewEaPprBaJR1bsj4JLgWhx7Oa2GkKGbu
         KE1Nznn1n7Qis7ShCU69pAQtTVlXK8ilM0lM7P6F94/r9mr0W6rrf8q0ip81WnLPiYNe
         ickQ==
X-Gm-Message-State: AFqh2kqMPB48DHTGHYjnSUkgFhFMfb1X0yoj6oDMvkNJfVaNfszYNx/w
	JLpkTkl8zoBfgLBYc3yETGV90Wm26sA=
X-Google-Smtp-Source: AMrXdXuXi1pv/go4QB8KEMa8npZsiUJ/f2BYdePXIUncgN/GV1bhIOZRCcLdu2xAlXljdIv4msnzAg==
X-Received: by 2002:a05:622a:985:b0:3a8:84f:1d3a with SMTP id bw5-20020a05622a098500b003a8084f1d3amr15197620qtb.9.1671471710070;
        Mon, 19 Dec 2022 09:41:50 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006fa31bf2f3dsm7477624qko.47.2022.12.19.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:41:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4][dunfell] linux-yocto/5.4: update to v5.4.225
Date: Mon, 19 Dec 2022 12:41:45 -0500
Message-Id: <20221219174146.64696-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20221219174146.64696-1-bruce.ashfield@gmail.com>
References: <20221219174146.64696-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174825

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4d2a309b5c28 Linux 5.4.225
    b612f924f296 ntfs: check overflow when iterating ATTR_RECORDs
    0e2ce0954b39 ntfs: fix out-of-bounds read in ntfs_attr_find()
    266bd5306286 ntfs: fix use-after-free in ntfs_attr_find()
    ed8b990e89aa mm: fs: initialize fsdata passed to write_begin/write_end interface
    b1ad04da7fe4 9p/trans_fd: always use O_NONBLOCK read/write
    179236a122a1 gfs2: Switch from strlcpy to strscpy
    8b6534c9ae9d gfs2: Check sb_bsize_shift after reading superblock
    96760723aae1 9p: trans_fd/p9_conn_cancel: drop client lock earlier
    ce57d6474ae9 kcm: close race conditions on sk_receive_queue
    7a704dbfd373 bpf, test_run: Fix alignment problem in bpf_prog_test_run_skb()
    ad39d09190a5 kcm: avoid potential race in kcm_tx_work
    78be2ee01124 tcp: cdg: allow tcp_cdg_release() to be called multiple times
    a62aa84fe19e macvlan: enforce a consistent minimal mtu
    4f348b60c796 Input: i8042 - fix leaking of platform device on module removal
    7b0007b28dd9 kprobes: Skip clearing aggrprobe's post_handler in kprobe-on-ftrace case
    28f7ff5e7559 scsi: target: tcm_loop: Fix possible name leak in tcm_loop_setup_hba_bus()
    ec59a1325230 ring-buffer: Include dropped pages in counting dirty patches
    32a7f0645111 serial: 8250: Flush DMA Rx on RLSI
    e7061dd1fef2 misc/vmw_vmci: fix an infoleak in vmci_host_do_receive_datagram()
    3da7098e8ffa docs: update mediator contact information in CoC doc
    27f712cd47d6 mmc: sdhci-pci: Fix possible memory leak caused by missing pci_dev_put()
    616c6695dd42 mmc: sdhci-pci-o2micro: fix card detect fail issue caused by CD# debounce timeout
    076712ff50dc mmc: core: properly select voltage range without power cycle
    1bf8ed585501 scsi: zfcp: Fix double free of FSF request when qdio send fails
    5d53797ce7ce Input: iforce - invert valid length check when fetching device IDs
    89c0c27ab39a serial: 8250_lpss: Configure DMA also w/o DMA filter
    d6ebe11ad322 serial: 8250: Fall back to non-DMA Rx if IIR_RDI occurs
    b545c0e1e409 dm ioctl: fix misbehavior if list_versions races with module loading
    1c5866b4ddec iio: pressure: ms5611: changed hardcoded SPI speed to value limited
    0dd52e141afd iio: trigger: sysfs: fix possible memory leak in iio_sysfs_trig_init()
    7b75515728b6 iio: adc: at91_adc: fix possible memory leak in at91_adc_allocate_trigger()
    c025c4505fba usb: chipidea: fix deadlock in ci_otg_del_timer
    8c8039ede2f9 usb: add NO_LPM quirk for Realforce 87U Keyboard
    bec9f91f7b0c USB: serial: option: add Fibocom FM160 0x0111 composition
    1972f20f365d USB: serial: option: add u-blox LARA-L6 modem
    089839cccf82 USB: serial: option: add u-blox LARA-R6 00B modem
    31e6aba26b44 USB: serial: option: remove old LARA-R6 PID
    5ee0a017e52a USB: serial: option: add Sierra Wireless EM9191
    0410c2ae2105 speakup: fix a segfault caused by switching consoles
    6ed6a5dfa3fa slimbus: stream: correct presence rate frequencies
    56607f0bfc9a Revert "usb: dwc3: disable USB core PHY management"
    e7dc436aea80 ALSA: usb-audio: Drop snd_BUG_ON() from snd_usbmidi_output_open()
    72c2ea34faa1 ring_buffer: Do not deactivate non-existant pages
    f715f31559b8 ftrace: Fix null pointer dereference in ftrace_add_mod()
    c50e0bcf4a1b ftrace: Optimize the allocation for mcount entries
    3041feeedbdd ftrace: Fix the possible incorrect kernel message
    04e9e5eb4551 cifs: add check for returning value of SMB2_set_info_init
    293c0d7182ee net: thunderbolt: Fix error handling in tbnet_init()
    e6546d541206 cifs: Fix wrong return value checking when GETFLAGS
    e109b41870db net/x25: Fix skb leak in x25_lapb_receive_frame()
    e313efddce71 platform/x86/intel: pmc: Don't unconditionally attach Intel PMC when virtualized
    813a8dd9c45f drbd: use after free in drbd_create_device()
    0199bf0a8f74 xen/pcpu: fix possible memory leak in register_pcpu()
    aa2ba356507f bnxt_en: Remove debugfs when pci_register_driver failed
    6134357f568e net: caif: fix double disconnect client in chnl_net_open()
    90638373f19f net: macvlan: Use built-in RCU list checking
    83672c1b83d1 mISDN: fix misuse of put_device() in mISDN_register_device()
    8c85770d1ad0 net: liquidio: release resources when liquidio driver open failed
    0f2c681900a0 mISDN: fix possible memory leak in mISDN_dsp_element_register()
    d697f78cab64 net: bgmac: Drop free_netdev() from bgmac_enet_remove()
    bec9ded5404c ata: libata-transport: fix double ata_host_put() in ata_tport_add()
    2ff7e852bd4c arm64: dts: imx8mn: Fix NAND controller size-cells
    bb4a2f898ef7 arm64: dts: imx8mm: Fix NAND controller size-cells
    040f726fecd8 pinctrl: devicetree: fix null pointer dereferencing in pinctrl_dt_to_map
    5b3d6d510bb8 parport_pc: Avoid FIFO port location truncation
    f9fe7ba4ea5b siox: fix possible memory leak in siox_device_add()
    6bb50c14c958 block: sed-opal: kmalloc the cmd/resp buffers
    8555c6c1125f ASoC: soc-utils: Remove __exit for snd_soc_util_exit()
    b768afc68b10 tty: n_gsm: fix sleep-in-atomic-context bug in gsm_control_send
    476b09e07bd5 serial: imx: Add missing .thaw_noirq hook
    b7c6033a8fa3 serial: 8250: omap: Flush PM QOS work on remove
    2d66412563ef serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in omap8250_remove()
    747e76f4ccb2 serial: 8250_omap: remove wait loop from Errata i202 workaround
    2ec3f558db34 ASoC: core: Fix use-after-free in snd_soc_exit()
    ee31abd04754 spi: stm32: Print summary 'callbacks suppressed' message
    a39357b4ec86 ASoC: codecs: jz4725b: Fix spelling mistake "Sourc" -> "Source", "Routee" -> "Route"
    1a5f13b0c542 Bluetooth: L2CAP: Fix l2cap_global_chan_by_psm
    6fa082ad96d6 btrfs: remove pointless and double ulist frees in error paths of qgroup tests
    741bded210db drm/imx: imx-tve: Fix return type of imx_tve_connector_mode_valid
    761976a6175d i2c: i801: add lis3lv02d's I2C address for Vostro 5568
    18a501e5c7a8 NFSv4: Retry LOCK on OLD_STATEID during delegation return
    281b93e42e40 selftests/intel_pstate: fix build for ARCH=x86_64
    2cce0a36cec9 selftests/futex: fix build for clang
    c81ab3d7d1e2 ASoC: codecs: jz4725b: fix capture selector naming
    5b94d1bb1ea2 ASoC: codecs: jz4725b: use right control for Capture Volume
    21b6fbb934b5 ASoC: codecs: jz4725b: fix reported volume for Master ctl
    c9fb6a03112d ASoC: codecs: jz4725b: add missed Line In power control bit
    1719b9c0fb37 spi: intel: Fix the offset to get the 64K erase opcode
    af93d7c9d94c ASoC: wm8962: Add an event handler for TEMP_HP and TEMP_SPK
    a3b07bb0b3fc ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"
    4d487873ba5f ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
    f0901e1551a8 ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
    1fd66e3b02d5 x86/cpu: Restore AMD's DE_CFG MSR after resume
    30b0263d0366 net: tun: call napi_schedule_prep() to ensure we own a napi
    7a6e564ff259 dmaengine: at_hdmac: Check return code of dma_async_device_register
    966dd087de9a dmaengine: at_hdmac: Fix impossible condition
    d6ce23165ccc dmaengine: at_hdmac: Don't allow CPU to reorder channel enable
    a5352470299f dmaengine: at_hdmac: Fix completion of unissued descriptor in case of errors
    77b97ef4908a dmaengine: at_hdmac: Don't start transactions at tx_submit level
    3d35e36d7a90 dmaengine: at_hdmac: Fix at_lli struct definition
    ab390c532e3c cert host tools: Stop complaining about deprecated OpenSSL functions
    d0513b095e1e can: j1939: j1939_send_one(): fix missing CAN header initialization
    d8971f410739 udf: Fix a slab-out-of-bounds write bug in udf_find_entry()
    c914c56ac058 btrfs: selftests: fix wrong error check in btrfs_free_dummy_root()
    aa05252ab4b8 platform/x86: hp_wmi: Fix rfkill causing soft blocked wifi
    431b70544bb1 drm/i915/dmabuf: fix sg_table handling in map_dma_buf
    9b162e810452 nilfs2: fix use-after-free bug of ns_writer on remount
    36ff974b0310 nilfs2: fix deadlock in nilfs_count_free_blocks()
    b4421e6d9a96 vmlinux.lds.h: Fix placement of '.data..decrypted' section
    022d8696a7dd ALSA: usb-audio: Add DSD support for Accuphase DAC-60
    ded2d51b85e3 ALSA: usb-audio: Add quirk entry for M-Audio Micro
    02dea987ec1c ALSA: hda: fix potential memleak in 'add_widget_node'
    9ab40b1df6ab ALSA: hda/ca0132: add quirk for EVGA Z390 DARK
    d51861d2911b mmc: sdhci-tegra: Fix SDHCI_RESET_ALL for CQHCI
    d2cf28caf5f1 mmc: sdhci-of-arasan: Fix SDHCI_RESET_ALL for CQHCI
    ae2aeee895ec mmc: cqhci: Provide helper for resetting both SDHCI and CQHCI
    9fbe02082912 MIPS: jump_label: Fix compat branch range check
    f967bbc72f20 arm64: efi: Fix handling of misaligned runtime regions and drop warning
    c5c0b3167537 riscv: process: fix kernel info leakage
    685e73e3f7a9 net: macvlan: fix memory leaks of macvlan_common_newlink
    d1dddadf4cbb ethernet: tundra: free irq when alloc ring failed in tsi108_open()
    1b7a5651432e net: mv643xx_eth: disable napi when init rxq or txq failed in mv643xx_eth_open()
    ec8a47afc5ee ethernet: s2io: disable napi when start nic failed in s2io_card_up()
    b03f505c5d1e cxgb4vf: shut down the adapter when t4vf_update_port_info() failed in cxgb4vf_open()
    834d2da28fd9 net: cxgb3_main: disable napi when bind qsets failed in cxgb_up()
    834445168191 net: cpsw: disable napi in cpsw_ndo_open()
    3892c2d33573 net/mlx5: Allow async trigger completion execution on single CPU systems
    5b72cf7a4066 net: nixge: disable napi when enable interrupts failed in nixge_open()
    a8aade318d7e perf stat: Fix printing os->prefix in CSV metrics output
    da4daa36ea2e drivers: net: xgene: disable napi when register irq failed in xgene_enet_open()
    1d8488732765 dmaengine: mv_xor_v2: Fix a resource leak in mv_xor_v2_remove()
    7c77e272b4b3 dmaengine: pxa_dma: use platform_get_irq_optional
    36769b947749 tipc: fix the msg->req tlv len check in tipc_nl_compat_name_table_dump_header
    afab4655750f can: af_can: fix NULL pointer dereference in can_rx_register()
    58cd7fdc8c1e ipv6: addrlabel: fix infoleak when sending struct ifaddrlblmsg to network
    3ad34145911d drm/vc4: Fix missing platform_unregister_drivers() call in vc4_drm_register()
    831ea56c3470 hamradio: fix issue of dev reference count leakage in bpq_device_event()
    c7e0024852c3 net: lapbether: fix issue of dev reference count leakage in lapbeth_device_event()
    5661f111a161 capabilities: fix undefined behavior in bit shift for CAP_TO_MASK
    08c3d22f1080 net: fman: Unregister ethernet device on removal
    aa94d1a607c7 bnxt_en: fix potentially incorrect return value for ndo_rx_flow_steer
    a5a05fbef4a0 bnxt_en: Fix possible crash in bnxt_hwrm_set_coal()
    a4f73f6adc53 net: tun: Fix memory leaks of napi_get_frags
    65ad047fd835 net: gso: fix panic on frag_list with mixed head alloc types
    e29289d0d819 HID: hyperv: fix possible memory leak in mousevsc_probe()
    d975bec1eaeb bpf, sockmap: Fix the sk->sk_forward_alloc warning of sk_stream_kill_queues
    0ede1a988299 wifi: cfg80211: fix memory leak in query_regdb_file()
    1c8d06631749 wifi: cfg80211: silence a sparse RCU warning
    c38ea831691b phy: stm32: fix an error code in probe
    45a841719fe0 xfs: drain the buf delwri queue before xfsaild idles
    e107e953d24d xfs: preserve inode versioning across remounts
    7d57979052c4 xfs: use MMAPLOCK around filemap_map_pages()
    8b27e684a6a9 xfs: redesign the reflink remap loop to fix blkres depletion crash
    ece1eb995787 xfs: rename xfs_bmap_is_real_extent to is_written_extent
    d304fafb978d xfs: preserve rmapbt swapext block reservation from freed blocks

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c748e9afdb..5601c43b8e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cde409b485372556f74ca484023b9b29c9c4033b"
-SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
+SRCREV_machine ?= "c06836b5ea27b0b97c04cd205959e21b2a60f32e"
+SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.224"
+LINUX_VERSION ?= "5.4.225"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e4e45604c6..5916a42f34 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.224"
+LINUX_VERSION ?= "5.4.225"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8023cf1d720eea113ca49b7876b25d767dac778c"
-SRCREV_machine ?= "61e75f4b3ca1a7c8ad179896ddd546a6f2f01cef"
-SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
+SRCREV_machine_qemuarm ?= "92964f40a4e096e1971b65ce0572ad909ab41e84"
+SRCREV_machine ?= "00e9d6d6f5c09bd5fd47af67fd7d03881d74c608"
+SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3c83e3118b..5951668c57 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5a025566942a9ace3426b926d87249fcb1f297f3"
-SRCREV_machine_qemuarm64 ?= "1ccea77e0b446db75d7fe886a1b74045e0e9a96e"
-SRCREV_machine_qemumips ?= "c22ce9aaf491340881366e151ac73450989e03a5"
-SRCREV_machine_qemuppc ?= "390f256c86e74503d285392b76ab1678f5f57697"
-SRCREV_machine_qemuriscv64 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
-SRCREV_machine_qemux86 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
-SRCREV_machine_qemux86-64 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
-SRCREV_machine_qemumips64 ?= "34cc9064800203ae6b1eb5c96d808e3ed3a359b8"
-SRCREV_machine ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
-SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
+SRCREV_machine_qemuarm ?= "13d88d2fc15f1edfa91378bc3a76aa4274969ed8"
+SRCREV_machine_qemuarm64 ?= "14d0e6d0baf0c7b2308ff1270bd706f927c72df4"
+SRCREV_machine_qemumips ?= "11472a4308590f1858d1ba7bb03bdc25cd2c9b3f"
+SRCREV_machine_qemuppc ?= "daf1282f1c6fd653fcae25e8d1d49540a932baeb"
+SRCREV_machine_qemuriscv64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
+SRCREV_machine_qemux86 ?= "15231fe2f4542b044e279e53269ee506bced9988"
+SRCREV_machine_qemux86-64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
+SRCREV_machine_qemumips64 ?= "31f08b9f81298e80e00ea37886db6f88092a5cf6"
+SRCREV_machine ?= "15231fe2f4542b044e279e53269ee506bced9988"
+SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.224"
+LINUX_VERSION ?= "5.4.225"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


