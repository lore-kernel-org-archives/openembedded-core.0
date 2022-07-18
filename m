Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A21C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.21868.1658104266540953651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lvHqL70Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id c6so7683469pla.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Mw329q82r6XB0JVbQo3COWVv7UzQsuGwP45jFSVEQuA=;
        b=lvHqL70Z2nB828VwNYLNBepmVd6123eTkc/XDY7DqdKuvyO0fAhO8s2+8/99eoVD/f
         Ce2qMBSTGjglWNHYjBpWYL8Jx1r7P4hNReG5UmkY6dFcGPozgF/TlRBYf9BcQrqMA1Cc
         kxPsLjJugu2xCrL2mUOInXEFtJc0QdmuHnTQjsHhqJLNT7aucWkJN61gM5XD8qknI8KA
         AJOtlr73XqTpIciritt+60PTUaScNmLIOXvwl/fUADzvDbZiIwJuFT2Jnufw2XIiOHB7
         9sii8863jSuu1Zx/2FaibzubrTei//CtNUJ0JPGka3k0aklHbswULpE2+KagCzg5+nnS
         4Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mw329q82r6XB0JVbQo3COWVv7UzQsuGwP45jFSVEQuA=;
        b=Bx3iedZJl9wOiaR4JViuzNx7iPGUDbdD40iY5Ucwo1T/G6DskmCbX5Ho35w0qgbLSx
         JvDr1Je4psvODSEGwFSERtMn/ps99b3tlDYYGrOf7e/gfFerqqP2vwKr5oMdaFXtFTYQ
         igafG/lt9EHEbX6yBJbhaCjAmp2cppk4ly0qj7CELaV7wJelN2a9UY3wq4rBw6brZDum
         zfsMf/Q2UgcLOCikwNb59uOqIGVgtBFLEMVkL9yd80eKy7V+2B+MAsaQj31KE2aS9S5+
         LRWqQJJt+0PvHuEOEK5e9qFkc+dQV9kooe7B5ZrsUqo+eO0YlSw6Ut4JhySxwopyk5NP
         861g==
X-Gm-Message-State: AJIora8n8BEEzGVuH0psg67kwcjfkxlAHEPYxPhE2SoUlA+2D/sk3FjU
	hmgZ+lDyKHLkngkMbUrSDYCMeolJtzg9oPTh
X-Google-Smtp-Source: 
 AGRyM1vyAdzDjygkH7oZnhvQTZKv4Z803mw7PnM6hgEZ4t/eM2XXxIywVXFZKdAUFRIsbDtjYfM8Fw==
X-Received: by 2002:a17:902:d4c3:b0:16c:4294:9da9 with SMTP id
 o3-20020a170902d4c300b0016c42949da9mr25376717plg.142.1658104265185;
        Sun, 17 Jul 2022 17:31:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/23] linux-yocto/5.10: update to v5.10.128
Date: Sun, 17 Jul 2022 14:30:06 -1000
Message-Id: 
 <024056a239a914518f15678530120b60c7fe67a9.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168170

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ea86c1430c83 Linux 5.10.128
    2d10984d99ac net: mscc: ocelot: allow unregistered IP multicast flooding
    6a656280e775 powerpc/ftrace: Remove ftrace init tramp once kernel init is complete
    6b734f7b7071 xfs: check sb_meta_uuid for dabuf buffer recovery
    071e750ffb3d xfs: remove all COW fork extents when remounting readonly
    1e76bd4c6722 xfs: Fix the free logic of state in xfs_attr_node_hasname
    0cdccc05da76 xfs: punch out data fork delalloc blocks on COW writeback failure
    db3f8110c3b0 xfs: use kmem_cache_free() for kmem_cache objects
    09c9902cd80a bcache: memset on stack variables in bch_btree_check() and bch_sectors_dirty_init()
    c4ff3ffe0138 tick/nohz: unexport __init-annotated tick_nohz_full_setup()
    069fff50d400 drm: remove drm_fb_helper_modinit
    52dc7f3f6fa1 MAINTAINERS: add Amir as xfs maintainer for 5.10.y
    deb587b1a48d Linux 5.10.127
    1cca46c20541 powerpc/pseries: wire up rng during setup_arch()
    95d73d510b8a kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS (2nd attempt)
    feb5ab798698 random: update comment from copy_to_user() -> copy_to_iter()
    959bbaf5b7a9 modpost: fix section mismatch check for exported init/exit sections
    c980392af147 ARM: cns3xxx: Fix refcount leak in cns3xxx_init
    889aad2203e0 memory: samsung: exynos5422-dmc: Fix refcount leak in of_get_dram_timings
    44a5b3a073e5 ARM: Fix refcount leak in axxia_boot_secondary
    30bbfeb480ae soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe
    68f28d52e6cb ARM: exynos: Fix refcount leak in exynos_map_pmu
    59fdf108144c ARM: dts: imx6qdl: correct PU regulator ramp delay
    fb70bd86751a ARM: dts: imx7: Move hsic_phy power domain to HSIC PHY node
    f78acc4288ed powerpc/powernv: wire up rng during setup_arch
    7db1ba660b07 powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
    1f5a9205a3be powerpc: Enable execve syscall exit tracepoint
    ca144919afd4 parisc: Enable ARCH_HAS_STRICT_MODULE_RWX
    a1c902349ad5 parisc/stifb: Fix fb_is_primary_device() only available with CONFIG_FB_STI
    af0ff2da0152 xtensa: Fix refcount leak bug in time.c
    6c0839cf1b9e xtensa: xtfpga: Fix refcount leak bug in setup
    501652a2ad54 iio: adc: adi-axi-adc: Fix refcount leak in adi_axi_adc_attach_client
    d40514d4403a iio: adc: axp288: Override TS pin bias current for some models
    d579c893dd6c iio: adc: stm32: Fix IRQs on STM32F4 by removing custom spurious IRQs message
    62284d45e26d iio: adc: stm32: Fix ADCs iteration in irq handler
    e3ebb9d16ce1 iio: imu: inv_icm42600: Fix broken icm42600 (chip id 0 value)
    3e0af68b99b8 iio: adc: stm32: fix maximum clock rate for stm32mp15x
    b07a30a774b3 iio: trigger: sysfs: fix use-after-free on remove
    399788e819a1 iio: gyro: mpu3050: Fix the error handling in mpu3050_power_up()
    c1ec7d52a218 iio: accel: mma8452: ignore the return value of reset operation
    42caf44906d6 iio:accel:mxc4005: rearrange iio trigger get and register
    e26dcf627971 iio:accel:bma180: rearrange iio trigger get and register
    f26379e19958 iio:chemical:ccs811: rearrange iio trigger get and register
    4b6cdcff7cb8 f2fs: attach inline_data after setting compression
    2d7bdb6a5a37 usb: chipidea: udc: check request status before setting device address
    656eca37aae1 USB: gadget: Fix double-free bug in raw_gadget driver
    54604108be64 usb: gadget: Fix non-unique driver names in raw-gadget driver
    d87dec22fdf5 xhci-pci: Allow host runtime PM as default for Intel Meteor Lake xHCI
    114080d04ae4 xhci-pci: Allow host runtime PM as default for Intel Raptor Lake xHCI
    b8142a84657e xhci: turn off port power in shutdown
    116c3e81b053 usb: typec: wcove: Drop wrong dependency to INTEL_SOC_PMIC
    a547662534ca iio: adc: vf610: fix conversion mode sysfs node name
    58c3a27e9c23 iio: mma8452: fix probe fail when device tree compatible is used.
    5ee016f6120a s390/cpumf: Handle events cycles and instructions identical
    abe487a88a5d gpio: winbond: Fix error code in winbond_gpio_get()
    30531e0d7b5d nvme: move the Samsung X5 quirk entry to the core quirks
    169f7d770552 nvme-pci: add NO APST quirk for Kioxia device
    938f594266a6 nvme-pci: allocate nvme_command within driver pdu
    ba388d4e9a68 nvme: don't check nvme_req flags for new req
    e7ccaa1abacf nvme: mark nvme_setup_passsthru() inline
    3ee62a1f0701 nvme: split nvme_alloc_request()
    fe06c692cd7e nvme: centralize setting the timeout in nvme_alloc_request
    afbc954e7896 Revert "net/tls: fix tls_sk_proto_close executed repeatedly"
    340fbdc8011f virtio_net: fix xdp_rxq_info bug after suspend/resume
    3bccf82169c5 igb: Make DMA faster when CPU is active on the PCIe link
    7d7450363fdf regmap-irq: Fix a bug in regmap_irq_enable() for type_in_mask chips
    40b3815b2c90 ice: ethtool: advertise 1000M speeds properly
    7b564e3254b7 afs: Fix dynamic root getattr
    3c22192db06e MIPS: Remove repetitive increase irq_err_count
    cc649a78654a x86/xen: Remove undefined behavior in setup_features()
    b60c375ad140 selftests: netfilter: correct PKTGEN_SCRIPT_PATHS in nft_concat_range.sh
    20119c1e0fff udmabuf: add back sanity check
    e82376b63247 net/tls: fix tls_sk_proto_close executed repeatedly
    cec9867ee554 erspan: do not assume transport header is always set
    acf76125bb2b drm/msm/dp: fix connect/disconnect handled at irq_hpd
    61f8f4034c04 drm/msm/dp: promote irq_hpd handle to handle link training correctly
    d11cb082151f drm/msm/dp: deinitialize mainlink if link training failed
    3d67cb00cbbb drm/msm/dp: fixes wrong connection state caused by failure of link train
    efb2b6916050 drm/msm/dp: check core_initialized before disable interrupts at dp_display_unbind()
    d16a4339825e drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
    363fd6e34618 net/sched: sch_netem: Fix arithmetic in netem_dump() for 32-bit platforms
    2e3216b929bb bonding: ARP monitor spams NETDEV_NOTIFY_PEERS notifiers
    c12a2c9b1b46 igb: fix a use-after-free issue in igb_clean_tx_ring
    361c5521c1e4 tipc: fix use-after-free Read in tipc_named_reinit
    f299d3fbe431 tipc: simplify the finalize work queue
    ab7f565ac705 phy: aquantia: Fix AN when higher speeds than 1G are not advertised
    a51c199e4d2b bpf, x86: Fix tail call count offset calculation on bpf2bpf call
    4ae116428e81 drm/sun4i: Fix crash during suspend after component bind failure
    516760f1d297 bpf: Fix request_sock leak in sk lookup helpers
    505a375eea11 drm/msm: use for_each_sgtable_sg to iterate over scatterlist
    10eb239e2935 scsi: scsi_debug: Fix zone transition to full condition
    15cc30ac2a8d netfilter: use get_random_u32 instead of prandom
    95f80c88436f netfilter: nftables: add nft_parse_register_store() and use it
    ec9b0a8d307e netfilter: nftables: add nft_parse_register_load() and use it
    8adedb4711dc drm/msm: Fix double pm_runtime_disable() call
    8682335375bd USB: serial: option: add Quectel RM500K module support
    9e6e063e548b USB: serial: option: add Quectel EM05-G modem
    0b3006a862fb USB: serial: option: add Telit LE910Cx 0x1250 composition
    f6a266e0dc6f dm mirror log: clear log bits up to BITS_PER_LONG boundary
    03d1874b8295 dm era: commit metadata in postsuspend after worker stops
    273106c2df43 ata: libata: add qc->flags in ata_qc_complete_template tracepoint
    156427b3123c mtd: rawnand: gpmi: Fix setting busy timeout setting
    07e56884cd95 mmc: sdhci-pci-o2micro: Fix card detect by dealing with debouncing
    0ae82e1ccb66 btrfs: add error messages to all unrecognized mount options
    49e3e449bc4e net: openvswitch: fix parsing of nw_proto for IPv6 fragments
    1508658aec4e ALSA: hda/realtek: Add quirk for Clevo NS50PU
    6e8e5031592d ALSA: hda/realtek: Add quirk for Clevo PD70PNT
    80307458a1ee ALSA: hda/realtek: Apply fixup for Lenovo Yoga Duet 7 properly
    7fcbc89d4722 ALSA: hda/realtek - ALC897 headset MIC no sound
    f5ea433d56d4 ALSA: hda/realtek: Add mute LED quirk for HP Omen laptop
    64373290601f ALSA: hda/conexant: Fix missing beep setup
    12a6be5d11d0 ALSA: hda/via: Fix missing beep setup
    5e80f923b8dd random: quiet urandom warning ratelimit suppression message
    310ebbd9f5cd random: schedule mix_interrupt_randomness() less often
    3acb7dc242ca vt: drop old FONT ioctls
    9cae50bdfafa Linux 5.10.126
    fb2fbb3c10d7 io_uring: use separate list entry for iopoll requests
    6a7c3bcc3c2e Linux 5.10.125
    df3f3bb5059d io_uring: add missing item types for various requests
    1a264b3a6940 arm64: mm: Don't invalidate FROM_DEVICE buffers at start of DMA transfer
    a1508d164e58 serial: core: Initialize rs485 RTS polarity already on probe
    7ccb026ecb99 tcp: drop the hash_32() part from the index calculation
    9429b75bc271 tcp: increase source port perturb table to 2^16
    24b922a5da00 tcp: dynamically allocate the perturb table used by source ports
    d28e64b1c63e tcp: add small random increments to the source port
    dd46a868fcfd tcp: use different parts of the port_offset for index and offset
    743acb520799 tcp: add some entropy in __inet_hash_connect()
    16b1994679a0 usb: gadget: u_ether: fix regression in setting fixed MAC address
    355be6131164 zonefs: fix zonefs_iomap_begin() for reads
    ee4677b78eca s390/mm: use non-quiescing sske for KVM switch to keyed guest
    4f3fee72a74c Linux 5.10.124
    e0b6018894b8 clk: imx8mp: fix usb_root_clk parent
    a3e50506ea0d powerpc/book3e: get rid of #include <generated/compile.h>
    ff4443f3fc53 igc: Enable PCIe PTM
    f0a7adff635a Revert "PCI: Make pci_enable_ptm() private"
    e1513a714de6 net: openvswitch: fix misuse of the cached connection on tuple changes
    09b55dc90b4d net/sched: act_police: more accurate MTU policing
    73bc8a5e8e3a dma-direct: don't over-decrypt memory
    aa9a001efa9c virtio-pci: Remove wrong address verification in vp_del_vqs()
    be9864103408 ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
    401bef1f95de KVM: SVM: Use kzalloc for sev ioctl interfaces to prevent kernel data leak
    d6be031a2f5e KVM: x86: Account a variety of miscellaneous allocations
    d74d7865e2a8 KVM: arm64: Don't read a HW interrupt pending state in user context
    bfd004a1d3a0 ext4: add reserved GDT blocks check
    0ca74dacfd47 ext4: make variable "count" signed
    6fdaf31ad5f3 ext4: fix bug_on ext4_mb_use_inode_pa
    e27430c1f1ed drm/amd/display: Cap OLED brightness per max frame-average luminance
    ba751f0d25f0 dm mirror log: round up region bitmap size to BITS_PER_LONG
    33ba36351eec serial: 8250: Store to lsr_save_flags after lsr read
    57901c658f77 usb: gadget: lpc32xx_udc: Fix refcount leak in lpc32xx_udc_probe
    a44a8a762f7f usb: dwc2: Fix memory leak in dwc2_hcd_init
    791da3e6c883 USB: serial: io_ti: add Agilent E5805A support
    0e13274bc642 USB: serial: option: add support for Cinterion MV31 with new baseline
    d721986e967b crypto: memneq - move into lib/
    308b8f31c069 comedi: vmk80xx: fix expression for tx buffer size
    9308be3d9a74 mei: me: add raptor lake point S DID
    9ea9c92275b3 i2c: designware: Use standard optional ref clock implementation
    506a88a5bf26 irqchip/gic-v3: Fix refcount leak in gic_populate_ppi_partitions
    7c9dd9d23f26 irqchip/gic-v3: Fix error handling in gic_populate_ppi_partitions
    e52a58b79f11 irqchip/gic/realview: Fix refcount leak in realview_gic_of_init
    716587a57a28 i2c: npcm7xx: Add check for platform_driver_register
    b559ef9dfc8f faddr2line: Fix overlapping text section failures, the sequel
    7fa28a7c3d74 block: Fix handling of offline queues in blk_mq_alloc_request_hctx()
    2d825fb53b9a certs/blacklist_hashes.c: fix const confusion in certs blacklist
    bc28fde90937 arm64: ftrace: consistently handle PLTs.
    e177f17fe46b arm64: ftrace: fix branch range checks
    64072389beb8 net: ax25: Fix deadlock caused by skb_recv_datagram in ax25_recvmsg
    28069e026e64 net: bgmac: Fix an erroneous kfree() in bgmac_remove()
    984793f25573 mlxsw: spectrum_cnt: Reorder counter pools
    b90ae84a8a9c nvme: add device name to warning in uuid_show()
    42f7cbe2c2c9 nvme: use sysfs_emit instead of sprintf
    63b26fe0252f drm/i915/reset: Fix error_state_read ptr + offset use
    2b2180449ae0 misc: atmel-ssc: Fix IRQ check in ssc_probe
    65ca4db68b68 tty: goldfish: Fix free_irq() on remove
    5334455067d5 Drivers: hv: vmbus: Release cpu lock in error case
    814092927a21 i40e: Fix call trace in setup_tx_descriptors
    43dfd1169cc0 i40e: Fix calculating the number of queue pairs
    ef4d73da0a5c i40e: Fix adding ADQ filter to TC0
    db965e2757d9 clocksource: hyper-v: unexport __init-annotated hv_init_clocksource()
    8acc3e228e1c pNFS: Avoid a live lock condition in pnfs_update_layout()
    03ea83324aa0 pNFS: Don't keep retrying if the server replied NFS4ERR_LAYOUTUNAVAILABLE
    4603a37f6eae random: credit cpu and bootloader seeds by default
    9d667348dc33 gpio: dwapb: Don't print error on -EPROBE_DEFER
    f3c8bfd6dc4f MIPS: Loongson-3: fix compile mips cpu_hwmon as module build error.
    85340c063450 mellanox: mlx5: avoid uninitialized variable warning with gcc-12
    38c519df8ecf net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
    b8879ca1fd73 ipv6: Fix signed integer overflow in l2tp_ip6_sendmsg
    0eeec1a8b0cd nfc: nfcmrvl: Fix memory leak in nfcmrvl_play_deferred
    6c18f47f47d4 virtio-mmio: fix missing put_device() when vm_cmdline_parent registration failed
    d539feb6df5e ALSA: hda/realtek - Add HW8326 support
    16dd002eb871 scsi: pmcraid: Fix missing resource cleanup in error case
    410b69262173 scsi: ipr: Fix missing/incorrect resource cleanup in error case
    85acc5bf0515 scsi: lpfc: Allow reduced polling rate for nvme_admin_async_event cmd completion
    916145bf9df7 scsi: lpfc: Fix port stuck in bypassed state after LIP in PT2PT topology
    f416fee125d4 scsi: vmw_pvscsi: Expand vcpuHint to 16 bits
    0e9994b86580 Input: soc_button_array - also add Lenovo Yoga Tablet2 1051F to dmi_use_low_level_irq
    2e640e5e44a7 ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
    a572c7440251 ASoC: es8328: Fix event generation for deemphasis control
    c7b8c3758f13 ASoC: wm8962: Fix suspend while playing music
    8656623bdc0d quota: Prevent memory allocation recursion while holding dq_lock
    36cd19e7d4e5 ata: libata-core: fix NULL pointer deref in ata_host_alloc_pinfo()
    440b2a62da2e ASoC: cs42l51: Correct minimum value for SX volume control
    f93d8fe3dce8 ASoC: cs42l56: Correct typo in minimum level for SX volume controls
    13e5b76d3d71 ASoC: cs42l52: Correct TLV for Bypass Volume
    b8a47bcc4d14 ASoC: cs53l30: Correct number of volume levels on SX controls
    70e355867dc2 ASoC: cs35l36: Update digital volume TLV
    cb6a0b83f1bc ASoC: cs42l52: Fix TLV scales for mixer controls
    d7be05aff272 dma-debug: make things less spammy under memory pressure
    1b54c0065763 ASoC: nau8822: Add operation for internal PLL off and on
    2c9548bc2650 powerpc/kasan: Silence KASAN warnings in __get_wchan()
    b5699bff1da6 arm64: dts: imx8mm-beacon: Enable RTS-CTS on UART3
    28bbdca6a7a4 bpf: Fix incorrect memory charge cost calculation in stack_map_alloc()
    f14816f2f928 nfsd: Replace use of rwsem with errseq_t
    56a7f57da5d0 9p: missing chunk of "fs/9p: Don't update file type when updating file attributes"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b63a1987de7e8e7de3f6656bfbb38bbd847ab500)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index affcb9f06d..75868eb3d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d5d01c8346adf1377ac45debf2f94f3a41715ea5"
-SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
+SRCREV_machine ?= "b54fa6bf849eca66798bb59d0632b76475e5ef98"
+SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.123"
+LINUX_VERSION ?= "5.10.128"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 68df384067..15e03c653a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.123"
+LINUX_VERSION ?= "5.10.128"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "61483f658abe672f1a0ac5780801110e1df3ba28"
-SRCREV_machine ?= "a0d580a3203cb2218bc5c8a9e44fc4cd3ec58ef7"
-SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
+SRCREV_machine:qemuarm ?= "fb53532e7f97426df28a91c56beff034b2487c21"
+SRCREV_machine ?= "953ea081e524baca7401da7cdf6aab5482cf9fb7"
+SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cb30c6e3ae..e143616db9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "91b1cb57bcaa1b9be59fbacfe7071051cb5b0556"
-SRCREV_machine:qemuarm64 ?= "066be7dc846bbf7d02aefe528c21437f9b5759ef"
-SRCREV_machine:qemumips ?= "ec5d13b3d64c8350cba561e0f5b85ff23daf87a2"
-SRCREV_machine:qemuppc ?= "72be545c445fa9195dbc7d76067b48149d53763f"
-SRCREV_machine:qemuriscv64 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
-SRCREV_machine:qemuriscv32 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
-SRCREV_machine:qemux86 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
-SRCREV_machine:qemux86-64 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
-SRCREV_machine:qemumips64 ?= "368bc5f2b82f7bac6e2200fa00005a26df4b6d72"
-SRCREV_machine ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
-SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
+SRCREV_machine:qemuarm ?= "b0120b4ab3e79e53b9526fcb888a0fa7fb26b290"
+SRCREV_machine:qemuarm64 ?= "cb4d26c271f026d51c2944cd8e42e484707d760c"
+SRCREV_machine:qemumips ?= "cdec08a50503179be1b3ab5120617ef11345817c"
+SRCREV_machine:qemuppc ?= "c0821a7ab5ccfd996ff3a30fc8359fb73ba4b123"
+SRCREV_machine:qemuriscv64 ?= "c57efb0553276189e83d5c276255f576240a0720"
+SRCREV_machine:qemuriscv32 ?= "c57efb0553276189e83d5c276255f576240a0720"
+SRCREV_machine:qemux86 ?= "c57efb0553276189e83d5c276255f576240a0720"
+SRCREV_machine:qemux86-64 ?= "c57efb0553276189e83d5c276255f576240a0720"
+SRCREV_machine:qemumips64 ?= "43cc2c777b16ea5bb45bbae47b901c801c30dbb1"
+SRCREV_machine ?= "c57efb0553276189e83d5c276255f576240a0720"
+SRCREV_meta ?= "5b3dacac6fe3c01c9df223897224c2367a5d20c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.123"
+LINUX_VERSION ?= "5.10.128"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


