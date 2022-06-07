Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E88CCA484
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:51 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.12595.1654610386194798161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nvDAelp1;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id hf10so12646417qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eOahrhsY1/iYZMO/0AbcJuLAcUSmuFZY4u8byGMCctg=;
        b=nvDAelp10s3qNv1bXuckCPRRn+B26i1iYvF8qf6wrjCXSxNRq/aHCDa/2eC/9zbvim
         y6/Im3WNdFVbg3jTv/Pb223G2w2CdRsI43j2XH3qZq83wsHwAPEJBE18HqYknfR0/BfQ
         8o4JXUz/0XT1TGGt4+uRYHtgOttNDansMUDYRmBmT6QqVwGTrshG6xQEc7LJKwM05ZS6
         9ZwoTCPlQiBLzRv9gXJr2toSothMNI7SikUpPUIaqKF8IimFNcepSB60/UzCzezPSVsu
         okG/jgW4PvMkMR63iVivRraAWx3RZ7nL2CMnSEQWdINXScwRiF+fz0494TIsU65JHs1j
         f3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOahrhsY1/iYZMO/0AbcJuLAcUSmuFZY4u8byGMCctg=;
        b=hx88C3QlApXYuvYi+16iKFLZX363KjZsL9X0Ah3ERkT1GzOkclaUr4KcWvF1stNvKc
         oj688IDpty8jjqFmoXd7aGXwiBM3a6lAo0jEmTRzq08za0JvraHcNRnXwEL02W8np6m3
         MYeuQGjVT9GE6c+YQWthPxRI/eArJWj0wOhWVeMMK9ccHW2kAsZCFy4QvfQ3hRfMSRSz
         lX4MnQnz3VGtKGZwV+FY2toXFbktzFilZ/k1bFjR1COG+VvuqSToHFOUIBqydvgYtDBf
         oUAQJsMLqnOt1ZVAAgTn9AJuod7ZhpPkBscqghHkSEezca97ShljCm6iFcTGaUysF3hh
         7j6A==
X-Gm-Message-State: AOAM532cAbj8Mf3CcIQiDFn/ZJaebkv4ogPXnpDhOXWxoQdsMNs+xzd5
	9PpYsbo9YcTy9ehRSHVDikOXdY1Bh7N/Lw==
X-Google-Smtp-Source: 
 ABdhPJyzyczmuLVTcWbhUe+FuVqKMJbs6o9R3yB+V0ZSLhAtS31gp3bN2/SCAXkPUASvrEogFJy3jQ==
X-Received: by 2002:a05:622a:653:b0:2f9:45f9:3248 with SMTP id
 a19-20020a05622a065300b002f945f93248mr22527998qtb.390.1654610384912;
        Tue, 07 Jun 2022 06:59:44 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/5.10: update to v5.10.118
Date: Tue,  7 Jun 2022 09:59:33 -0400
Message-Id: 
 <0ab1ce41f22a132486bd104356ec1c663c3bdcf8.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166664

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c204ee3350eb Linux 5.10.118
    56642f6af2ab module: check for exit sections in layout_sections() instead of module_init_section()
    633be494c3ca include/uapi/linux/xfrm.h: Fix XFRM_MSG_MAPPING ABI breakage
    61a4cc41e5c1 afs: Fix afs_getattr() to refetch file status if callback break occurred
    606011cb6a69 i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()
    030de84d453a module: treat exit sections the same as init sections when !CONFIG_MODULE_UNLOAD
    355141fdbfef dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
    d30fdf7d1343 Input: ili210x - fix reset timing
    a698bf1f728c arm64: Enable repeat tlbi workaround on KRYO4XX gold CPUs
    696292b9b5f6 net: atlantic: verify hw_head_ lies within TX buffer ring
    cd66ab20a8f8 net: atlantic: add check for MAX_SKB_FRAGS
    9bee8b4275ec net: atlantic: reduce scope of is_rsc_complete
    9b84e83a92cd net: atlantic: fix "frag[0] not initialized"
    0ae23a1d472a net: stmmac: fix missing pci_disable_device() on error in stmmac_pci_probe()
    d4c6e5cebcf5 ethernet: tulip: fix missing pci_disable_device() on error in tulip_init_one()
    3a6dee284fa0 nl80211: fix locking in nl80211_set_tx_bitrate_mask()
    efe580c436f9 selftests: add ping test with ping_group_range tuned
    1cfbf6d3a7f6 nl80211: validate S1G channel width
    a0f5ff20496b mac80211: fix rx reordering with non explicit / psmp ack policy
    e21d734fd05c scsi: qla2xxx: Fix missed DMA unmap for aborted commands
    c5af34174733 perf bench numa: Address compiler error on s390
    210ea7da5c1f gpio: mvebu/pwm: Refuse requests with inverted polarity
    30d4721feced gpio: gpio-vf610: do not touch other bits when set the target bit
    ea8a9cb4a779 riscv: dts: sifive: fu540-c000: align dma node name with dtschema
    dfd1f0cb628b net: bridge: Clear offload_fwd_mark when passing frame up bridge interface.
    579061f39143 igb: skip phy status check where unavailable
    a89888648e0c ARM: 9197/1: spectre-bhb: fix loop8 sequence for Thumb2
    1756b45d8d83 ARM: 9196/1: spectre-bhb: enable for Cortex-A15
    7b676abe328a net: af_key: add check for pfkey_broadcast in function pfkey_process
    697f3219ee2f net/mlx5e: Properly block LRO when XDP is enabled
    b503d0228c92 NFC: nci: fix sleep in atomic context bugs caused by nci_skb_alloc
    42d4287cc1e4 net/qla3xxx: Fix a test in ql_reset_work()
    d35bf8d766b1 clk: at91: generated: consider range when calculating best rate
    9e0e75a5e753 ice: fix possible under reporting of ethtool Tx and Rx statistics
    6e2caee5cddc net: vmxnet3: fix possible NULL pointer dereference in vmxnet3_rq_cleanup()
    a54d86cf4184 net: vmxnet3: fix possible use-after-free bugs in vmxnet3_rq_alloc_rx_buf()
    201e5b5c2799 net: systemport: Fix an error handling path in bcm_sysport_probe()
    9bfe898e2b76 net/sched: act_pedit: sanitize shift argument before usage
    47f04f95edb1 xfrm: fix "disable_policy" flag use when arriving from different devices
    0d2e9d8000ef xfrm: rework default policy structure
    57c1bbe7098b xfrm: fix dflt policy check when there is no policy configured
    9856c3a129dd xfrm: notify default policy on update
    20fd28df4049 xfrm: make user policy API complete
    ab610ee1d1a1 net: xfrm: fix shift-out-of-bounce
    5b7f84b1f9f4 xfrm: Add possibility to set the default to block if we have no policy
    243e72e20446 net: evaluate net.ipvX.conf.all.disable_policy and disable_xfrm
    1bc27eb71b55 net: macb: Increment rx bd head after allocating skb and buffer
    998e305bd160 net: ipa: record proper RX transaction count
    0599d5a8b4e1 ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
    0a2847d44812 pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
    d8ca684c3d3b ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
    3fc28460998a dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace
    e5289affbacc drm/dp/mst: fix a possible memory leak in fetch_monitor_name()
    8ceca1a0693a libceph: fix potential use-after-free on linger ping and resends
    233a3cc60e7a crypto: qcom-rng - fix infinite loop on requests not multiple of WORD_SZ
    6013ef5f51e0 arm64: mte: Ensure the cleared tags are visible before setting the PTE
    a817f78ed69b arm64: paravirt: Use RCU read locks to guard stolen_time
    b49bc8d615ee KVM: x86/mmu: Update number of zapped pages even if page list is stable
    146128ba265d PCI/PM: Avoid putting Elo i2 PCIe Ports in D3cold
    ec0d801d1a44 Fix double fget() in vhost_net_set_backend()
    b42e5e3a84dd selinux: fix bad cleanup on error in hashtab_duplicate()
    3ee8e109c3c3 perf: Fix sys_perf_event_open() race against self
    18fb7d533c79 ALSA: hda/realtek: Add quirk for TongFang devices with pop noise
    3eaf770163b7 ALSA: wavefront: Proper check of get_user() error
    a34d018b6eab ALSA: usb-audio: Restore Rane SL-1 quirk
    f3f2247ac31c Reinstate some of "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""
    e2cfa7b0935c Revert "swiotlb: fix info leak with DMA_FROM_DEVICE"
    fe5ac3da50a9 nilfs2: fix lockdep warnings during disk space reclamation
    d626fcdabea2 nilfs2: fix lockdep warnings in page operations for btree nodes
    aca18bacdb71 ARM: 9191/1: arm/stacktrace, kasan: Silence KASAN warnings in unwind_frame()
    0acaf9cacd4f platform/chrome: cros_ec_debugfs: detach log reader wq from devm
    5a19f3c2d3b6 drbd: remove usage of list iterator variable after loop
    9b7f3211064d MIPS: lantiq: check the return value of kzalloc()
    05c073b1ad25 fs: fix an infinite loop in iomap_fiemap
    00d8b06a4ed4 rtc: mc146818-lib: Fix the AltCentury for AMD platforms
    87fd0dd43e9c nvme-multipath: fix hang when disk goes live over reconnect
    3663d6023aa2 tools/virtio: compile with -pthread
    5a4cbcb3df45 vhost_vdpa: don't setup irq offloading when irq_num < 0
    f0931ee125ff s390/pci: improve zpci_dev reference counting
    7d3f69cbdec8 ALSA: hda/realtek: Enable headset mic on Lenovo P360
    a59450656bcd crypto: x86/chacha20 - Avoid spurious jumps to other functions
    39acee8aea3d crypto: stm32 - fix reference leak in stm32_crc_remove
    703c80ff4330 rtc: sun6i: Fix time overflow handling
    bab037ebbe7d gfs2: Disable page faults during lockless buffered reads
    e803f12ea27f nvme-pci: add quirks for Samsung X5 SSDs
    5565fc538ded Input: stmfts - fix reference leak in stmfts_input_open
    d5e88c2d76ef Input: add bounds checking to input_set_capability()
    ea6a86886caa um: Cleanup syscall_handler_t definition/cast, fix warning
    c39b91fcd5e3 rtc: pcf2127: fix bug when reading alarm registers
    2b4e5a2d7da0 rtc: fix use-after-free on device removal
    67136fff5b9a igc: Update I226_K device ID
    d0229838b63c igc: Remove phy->type checking
    170110adbecc igc: Remove _I_PHY_ID checking
    55c820c1b2b6 Revert "drm/i915/opregion: check port number bounds for SWSCI display power state"
    911b36267855 floppy: use a statically allocated error counter
    3c48558be571 io_uring: always grab file table for deferred statx
    a1a2c957da58 usb: gadget: fix race when gadget driver register via ioctl
    7686a5c2a8d3 Linux 5.10.117
    937c6b0e3e94 SUNRPC: Fix fall-through warnings for Clang
    29f077d07051 io_uring: always use original task when preparing req identity
    1444e0568bc2 usb: gadget: uvc: allow for application to cleanly shutdown
    42505e362285 usb: gadget: uvc: rename function to be more consistent
    002e7223dc1b ping: fix address binding wrt vrf
    d9a1e82bf656 arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map
    49750c5e9acb net: phy: Fix race condition on link status change
    e68b60ae29de SUNRPC: Ensure we flush any closed sockets before xs_xprt_free()
    dbe6974a39ac SUNRPC: Don't call connect() more than once on a TCP socket
    47541ed4d47b SUNRPC: Prevent immediate close+reconnect
    2ab569edd883 SUNRPC: Clean up scheduling of autoclose
    85844ea29f82 drm/vmwgfx: Initialize drm_mode_fb_cmd2
    7e849dbe604d cgroup/cpuset: Remove cpus_allowed/mems_allowed setup in cpuset_init_smp()
    6aa239d82e35 net: atlantic: always deep reset on pm op, fixing up my null deref regression
    6158df4fa5c2 i40e: i40e_main: fix a missing check on list iterator
    819796024cce drm/nouveau/tegra: Stop using iommu_present()
    e06605af8bdc ceph: fix setting of xattrs on async created inodes
    86db01f37347 serial: 8250_mtk: Fix register address for XON/XOFF character
    84ad84e495ae serial: 8250_mtk: Fix UART_EFR register address
    f8d8440f1357 slimbus: qcom: Fix IRQ check in qcom_slim_probe
    d7b7c5532a83 USB: serial: option: add Fibocom MA510 modem
    2ba0034e3649 USB: serial: option: add Fibocom L610 modem
    319b312edb8e USB: serial: qcserial: add support for Sierra Wireless EM7590
    994395f356ea USB: serial: pl2303: add device id for HP LM930 Display
    8276a3dbe21d usb: typec: tcpci_mt6360: Update for BMC PHY setting
    54979aa49e0f usb: typec: tcpci: Don't skip cleanup in .remove() on error
    7335a6b11d13 usb: cdc-wdm: fix reading stuck on device close
    6d47eceaf311 tty: n_gsm: fix mux activation issues in gsm_config()
    69139a45b89b tty/serial: digicolor: fix possible null-ptr-deref in digicolor_uart_probe()
    5a7358111636 firmware_loader: use kernel credentials when reading firmware
    d254309aab27 tcp: resalt the secret every 10 seconds
    3abbfac1ab24 net: sfp: Add tx-fault workaround for Huawei MA5671A SFP ONT
    48f1dd67a83f net: emaclite: Don't advertise 1000BASE-T and do auto negotiation
    5c09dbdfd4fc s390: disable -Warray-bounds
    03ebc6fd5c9d ASoC: ops: Validate input values in snd_soc_put_volsw_range()
    31606a73baa3 ASoC: max98090: Generate notifications on changes for custom control
    ce154bd3bc43 ASoC: max98090: Reject invalid values in custom control put()
    5ecaaaeb2c76 hwmon: (f71882fg) Fix negative temperature
    88091c0275b2 gfs2: Fix filesystem block deallocation for short writes
    fccf4bf3f25d tls: Fix context leak on tls_device_down
    161c4edeca45 net: sfc: ef10: fix memory leak in efx_ef10_mtd_probe()
    d5e1b41bf7e0 net/smc: non blocking recvmsg() return -EAGAIN when no data and signal_pending
    e417a8fceaa9 net: dsa: bcm_sf2: Fix Wake-on-LAN with mac_link_down()
    9012209f4357 net: bcmgenet: Check for Wake-on-LAN interrupt probe deferral
    abe35bf3be51 net/sched: act_pedit: really ensure the skb is writable
    b816ed53f318 s390/lcs: fix variable dereferenced before check
    4d3c6d741816 s390/ctcm: fix potential memory leak
    5497f87edcda s390/ctcm: fix variable dereferenced before check
    cc71c9f17caf selftests: vm: Makefile: rename TARGETS to VMTARGETS
    ce12e5ff8de8 hwmon: (ltq-cputemp) restrict it to SOC_XWAY
    ceb3db723fda dim: initialize all struct fields
    8b1b8fc819f7 ionic: fix missing pci_release_regions() on error in ionic_probe()
    2cb8689f45f2 nfs: fix broken handling of the softreval mount option
    49c10784b955 mac80211_hwsim: call ieee80211_tx_prepare_skb under RCU protection
    79432d223728 net: sfc: fix memory leak due to ptp channel
    bdb8d4aed1cf sfc: Use swap() instead of open coding it
    33c93f6e5598 netlink: do not reset transport header in netlink_recvmsg()
    9e40f2c51392 drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()
    54f26fc07e6d ipv4: drop dst in multicast routing path
    c07a84492ffe net: mscc: ocelot: avoid corrupting hardware counters when moving VCAP filters
    abb237c544f1 net: mscc: ocelot: restrict tc-trap actions to VCAP IS2 lookup 0
    f9674c52a158 net: mscc: ocelot: fix VCAP IS2 filters matching on both lookups
    c1184d2888a3 net: mscc: ocelot: fix last VCAP IS1/IS2 filter persisting in hardware when deleted
    e2cdde89d253 net: Fix features skip in for_each_netdev_feature()
    c420d6604706 mac80211: Reset MBSSID parameters upon connection
    9cbf2a7d5d17 hwmon: (tmp401) Add OF device ID table
    85eba08be2f7 iwlwifi: iwl-dbg: Use del_timer_sync() before freeing
    a6a73781b460 batman-adv: Don't skb_split skbuffs with frag_list
    07a4d3649aef Linux 5.10.116
    d1ac096f8869 mm: userfaultfd: fix missing cache flush in mcopy_atomic_pte() and __mcopy_atomic()
    c6cbf5431a62 mm: hugetlb: fix missing cache flush in copy_huge_page_from_user()
    308ff6a6e768 mm: fix missing cache flush for all tail pages of compound page
    185fa5984d7a Bluetooth: Fix the creation of hdev->name
    9ff4a6b80642 arm: remove CONFIG_ARCH_HAS_HOLES_MEMORYMODEL
    dfb55dcf9d39 nfp: bpf: silence bitwise vs. logical OR warning
    f89f76f4b0e7 drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types
    efd1429fa99b block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit
    a71658c7db0b regulator: consumer: Add missing stubs to regulator/consumer.h
    7648f42d1a62 MIPS: Use address-of operator on section symbols
    e61686bb77c4 Linux 5.10.115
    8528806abed5 mmc: rtsx: add 74 Clocks in power on flow
    e1ab92302b44 PCI: aardvark: Fix reading MSI interrupt number
    49143c9ed232 PCI: aardvark: Clear all MSIs at setup
    7676a5b99f3d dm: interlock pending dm_io and dm_wait_for_bios_completion
    a439819f4797 block-map: add __GFP_ZERO flag for alloc_page in function bio_copy_kern
    a22d66eb518f rcu: Apply callbacks processing time limit only on softirq
    40fb3812d997 rcu: Fix callbacks processing time limit retaining cond_resched()
    43dbc3edada6 KVM: LAPIC: Enable timer posted-interrupt only when mwait/hlt is advertised
    9c8474fa3477 KVM: x86/mmu: avoid NULL-pointer dereference on page freeing bugs
    a474ee5ececc KVM: x86: Do not change ICR on write to APIC_SELF_IPI
    64e3e16dbc26 x86/kvm: Preserve BSP MSR_KVM_POLL_CONTROL across suspend/resume
    5f884e0c2ea6 net/mlx5: Fix slab-out-of-bounds while reading resource dump menu
    599fc32e7421 kvm: x86/cpuid: Only provide CPUID leaf 0xA if host has architectural PMU
    0a960a367216 net: igmp: respect RCU rules in ip_mc_source() and ip_mc_msfilter()
    4fd45ef7042a btrfs: always log symlinks in full mode
    687167eef99e smsc911x: allow using IRQ0
    b280877eab49 selftests: ocelot: tc_flower_chains: specify conform-exceed action for policer
    a9fd5d6cd594 bnxt_en: Fix unnecessary dropping of RX packets
    72e4fc1a4e63 bnxt_en: Fix possible bnxt_open() failure caused by wrong RFS flag
    9ac9f07f0fbb selftests: mirror_gre_bridge_1q: Avoid changing PVID while interface is operational
    475237e807a2 hinic: fix bug of wq out of bound access
    1b9f1f455de2 net: emaclite: Add error handling for of_address_to_resource()
    8459485db70c net: cpsw: add missing of_node_put() in cpsw_probe_dt()
    4eee9809505c net: stmmac: dwmac-sun8i: add missing of_node_put() in sun8i_dwmac_register_mdio_mux()
    2347e9c92270 net: dsa: mt7530: add missing of_node_put() in mt7530_setup()
    1092656cc4ca net: ethernet: mediatek: add missing of_node_put() in mtk_sgmii_init()
    408fb2680e73 NFSv4: Don't invalidate inode attributes on delegation return
    c1b480e6bed8 RDMA/siw: Fix a condition race issue in MPA request processing
    5bf2a45e3343 selftests/seccomp: Don't call read() on TTY from background pgrp
    3ea0b44c01ee net/mlx5: Avoid double clear or set of sync reset requested
    24553315910c net/mlx5e: Fix the calling of update_buffer_lossy() API
    e07c13fbdded net/mlx5e: CT: Fix queued up restore put() executing after relevant ft release
    d8338a7a0957 net/mlx5e: Don't match double-vlan packets if cvlan is not set
    c7f87ad11584 net/mlx5e: Fix trust state reset in reload
    87f0d9a518b7 ASoC: dmaengine: Restore NULL prepare_slave_config() callback
    ad87f8498ea2 hwmon: (adt7470) Fix warning on module removal
    997b8605e8f3 gpio: pca953x: fix irq_stat not updated when irq is disabled (irq_mask not set)
    879b075a9a36 NFC: netlink: fix sleep in atomic bug when firmware download timeout
    1961c5a688ed nfc: nfcmrvl: main: reorder destructive operations in nfcmrvl_nci_unregister_dev to avoid bugs
    8a9e7c64f4a0 nfc: replace improper check device_is_registered() in netlink related functions
    11adc9ab3eb3 can: grcan: only use the NAPI poll budget for RX
    4df5e498e0ff can: grcan: grcan_probe(): fix broken system id check for errata workaround needs
    dd973c0185c5 can: grcan: use ofdev->dev when allocating DMA memory
    45bdcb5ca426 can: isotp: remove re-binding of bound socket
    13959b911700 can: grcan: grcan_close(): fix deadlock
    6c7c0e131ec1 s390/dasd: Fix read inconsistency for ESE DASD devices
    6e02c0413a93 s390/dasd: Fix read for ESE with blksize < 4k
    ecc839682770 s390/dasd: prevent double format of tracks for ESE devices
    30e008ab3fe7 s390/dasd: fix data corruption for ESE devices
    d53d47fadd17 ASoC: meson: Fix event generation for AUI CODEC mux
    93a1f0755edc ASoC: meson: Fix event generation for G12A tohdmi mux
    e8b08e2f171b ASoC: meson: Fix event generation for AUI ACODEC mux
    954d55170f43 ASoC: wm8958: Fix change notifications for DSP controls
    f45359824a48 ASoC: da7219: Fix change notifications for tone generator frequency
    e6e61aab4967 genirq: Synchronize interrupt thread startup
    dcf1150f2e69 net: stmmac: disable Split Header (SPH) for Intel platforms
    68f35987d43c firewire: core: extend card->lock in fw_core_handle_bus_reset
    629b4003a71a firewire: remove check of list iterator against head past the loop body
    e757ff4bbc89 firewire: fix potential uaf in outbound_phy_packet_callback()
    70d25d4fba24 Revert "SUNRPC: attempt AF_LOCAL connect on setup"
    466721d7671a drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUNT
    2e6f3d665a29 iommu/vt-d: Calculate mask for non-aligned flushes
    fbb7c61e7601 KVM: x86/svm: Account for family 17h event renumberings in amd_pmc_perf_hw_id
    b085afe22607 gpiolib: of: fix bounds check for 'gpio-reserved-ranges'
    2b7cb072d07c mmc: core: Set HS clock speed before sending HS CMD13
    66651d719948 mmc: sdhci-msm: Reset GCC_SDCC_BCR register for SDHC
    2906c73632d7 ALSA: fireworks: fix wrong return count shorter than expected by 4 bytes
    03ab174805a3 ALSA: hda/realtek: Add quirk for Yoga Duet 7 13ITL6 speakers
    a196f277c547 parisc: Merge model and model name into one line in /proc/cpuinfo
    326f02f172d0 MIPS: Fix CP0 counter erratum detection for R4k CPUs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ad206e4235..7bf7a8016b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a8d19259c63cbf1254fe545d0a1aacf8f82547ac"
-SRCREV_meta ?= "b368b4c1c8ee0e0e7573caa7f1596c3385ad855f"
+SRCREV_machine ?= "b324ad7fb718b77e1bcb14017020a7a123ebc30c"
+SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.114"
+LINUX_VERSION ?= "5.10.118"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 9a8e6ecffc..2cce9695ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.114"
+LINUX_VERSION ?= "5.10.118"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a0664baa09b1c6265bd404e4d3a7ceb14577dcb8"
-SRCREV_machine ?= "63b2e48029f00bfc90371adc378050181ba5d253"
-SRCREV_meta ?= "b368b4c1c8ee0e0e7573caa7f1596c3385ad855f"
+SRCREV_machine:qemuarm ?= "d4df93eb136b36c65d2fe5cfdb5404b222ff2a4d"
+SRCREV_machine ?= "f854641b454815ec8fea760820c7f8a6426330b8"
+SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ffd9538633..e08d38d4cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "49e2af0d85dc824c7829427c18e06ad2b1abbb8d"
-SRCREV_machine:qemuarm64 ?= "2b403ec0a7f60be807890902dbd0d5467bdef545"
-SRCREV_machine:qemumips ?= "793de0c2e4a3aa0e2f3091af8ff06df35f156fb3"
-SRCREV_machine:qemuppc ?= "9875eb3923e3d20893774ee7304142e2ce5ab22b"
-SRCREV_machine:qemuriscv64 ?= "8ce5741d3f6c0aa649aca5f89ee8d1022f530437"
-SRCREV_machine:qemuriscv32 ?= "8ce5741d3f6c0aa649aca5f89ee8d1022f530437"
-SRCREV_machine:qemux86 ?= "8ce5741d3f6c0aa649aca5f89ee8d1022f530437"
-SRCREV_machine:qemux86-64 ?= "8ce5741d3f6c0aa649aca5f89ee8d1022f530437"
-SRCREV_machine:qemumips64 ?= "4c3d57cc8bec91ea6225a7c9f134fd97bc1e8e0d"
-SRCREV_machine ?= "8ce5741d3f6c0aa649aca5f89ee8d1022f530437"
-SRCREV_meta ?= "b368b4c1c8ee0e0e7573caa7f1596c3385ad855f"
+SRCREV_machine:qemuarm ?= "71b08c67d5af08e96976aebea86e7d6cc18ac648"
+SRCREV_machine:qemuarm64 ?= "6f85e9236905531846a8473787ab45727b7febe7"
+SRCREV_machine:qemumips ?= "f8bb9500384317b474b0dbf27548d0ec81d9271d"
+SRCREV_machine:qemuppc ?= "66aa1440e2f7df15fb5af87cdafaf0f7be95940f"
+SRCREV_machine:qemuriscv64 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
+SRCREV_machine:qemuriscv32 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
+SRCREV_machine:qemux86 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
+SRCREV_machine:qemux86-64 ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
+SRCREV_machine:qemumips64 ?= "6a33fdea4104a586b0a5abca593ef0dba1dbb87a"
+SRCREV_machine ?= "a44e7133d7b5c649d7016a550423a90a4c804340"
+SRCREV_meta ?= "081fcbfbc763d13eef4bfecb93d733666af2521a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.114"
+LINUX_VERSION ?= "5.10.118"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


