Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A022BCCA481
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.21875.1658104305126569993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=id+yAsU9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id f65so9215511pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XgVdAg3obiZY8abOf8THMoDyW91g2K2qagfl2DVKsSU=;
        b=id+yAsU9HsWnCwibw+sysKSmKEaKQn5NzKO8MIEegObpSEBJqmU06Tl2U5CXF1XT1b
         /V65dZneiQXtJY2yG5YnLap4cb0BdgEvjm3KyCfLDPX+8ase/9/cGWG0DSOWi5gyUnZ/
         0NKxyYK9ovRDBxWNrjT8gcSDF7ieLrWFNGs8wDsqIP3dvC7OrjnEqiyB436V3QgE+DLn
         tchTY43xc97i7viIC5a7nrBq/meW5ttIkHqk6kj/U1lhzrP6aR0W5ryLq/XrLdQitud1
         TDpr8ArKbJeEDsQ2nDdvLAKkPsC+GfFhI4jS+g9cicZk/3QvabOhL3MhfnG0tuYap+V0
         Rrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XgVdAg3obiZY8abOf8THMoDyW91g2K2qagfl2DVKsSU=;
        b=yE5Hiw7I8ndNx6NIchkV6Zyg3Zsv6UL4dS+4Pt8hUDmHsdvY2NrVsXKMa/I7NaJgit
         qCifwhuWRJ5RuGSwkAAkFCSLSRVDJxzZDb9YpeiAXiyik3o9GYc+ATH2/oqpSS+Qzhow
         +d4SmJHtRnPEOYHL47Me2hbTCCHJKSqRh8zktgiZETtYJiEEcNmJbzWK0DENjNCxSjR3
         3P28ZZM2PlqHPIwKCRNdJcYxdzUrtIaNY4AGivdWHa+jX9pSCuBQ8ykSmpwg4V1maN1b
         NoTj0DtiQE25IdCG1GgvkFpUlEpDeEeEzzp8Y0r+W4VU6R0Tr2+yaZB/skYMcQAjQl6g
         G37g==
X-Gm-Message-State: AJIora8Hn1YslztI6nkXc14AbypzmQlK3YBUD2aObB1VmUUMNAjq1VTv
	kyHR3Yiip/V0bjfBh0fhxSQVD6udKa7vWHPV
X-Google-Smtp-Source: 
 AGRyM1ulJ4MryOKj4laxeQfxMGHBxpLdDBFcHYX4fLNMkYQNyjkOFmxzHDszAQtOUvTzirCbWM4QFg==
X-Received: by 2002:a65:6787:0:b0:412:e419:d654 with SMTP id
 e7-20020a656787000000b00412e419d654mr21637689pgr.427.1658104303666;
        Sun, 17 Jul 2022 17:31:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/23] linux-yocto/5.15: update to v5.15.52
Date: Sun, 17 Jul 2022 14:30:14 -1000
Message-Id: 
 <a8a7765d980442f2e5afe7e23296e5d77afe6104.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168178

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    545aecd22961 Linux 5.15.52
    ea512d540a55 io_uring: fix not locked access to fixed buf table
    5696f7983d5d net: mscc: ocelot: allow unregistered IP multicast flooding to CPU
    810962c79417 rtw88: rtw8821c: enable rfe 6 devices
    d52f1c588824 rtw88: 8821c: support RFE type4 wifi NIC
    e8d4878dcd00 fs: account for group membership
    dc85bc24fbf1 fs: fix acl translation
    38753e9173a5 fs: support mapped mounts of mapped filesystems
    968e66f8ff70 fs: add i_user_ns() helper
    21c6c720be75 fs: port higher-level mapping helpers
    7d0536a8fab7 fs: remove unused low-level mapping helpers
    f895d0ff47be fs: use low-level mapping helpers
    1c62e0186d94 docs: update mapping documentation
    b20dcf603b8d fs: account for filesystem mappings
    3374eb1b0afc fs: tweak fsuidgid_has_mapping()
    7bc23abcb414 fs: move mapping helpers
    b3679e8b5996 fs: add is_idmapped_mnt() helper
    ab0b6dc5e16b powerpc/ftrace: Remove ftrace init tramp once kernel init is complete
    ce6bfe55237e xfs: only bother with sync_filesystem during readonly remount
    3465b167831e xfs: prevent UAF in xfs_log_item_in_current_chkpt
    4f0c91ab4c7d xfs: check sb_meta_uuid for dabuf buffer recovery
    c4f376ba8be8 xfs: remove all COW fork extents when remounting readonly
    40de647b2bab xfs: Fix the free logic of state in xfs_attr_node_hasname
    0e84e17c16a3 xfs: punch out data fork delalloc blocks on COW writeback failure
    71a218ca4fde xfs: use kmem_cache_free() for kmem_cache objects
    1cdcd496b7ca bcache: memset on stack variables in bch_btree_check() and bch_sectors_dirty_init()
    edbaf6e5e93a x86, kvm: use proper ASM macros for kvm_vcpu_is_preempted
    f4a80ec8c51d tick/nohz: unexport __init-annotated tick_nohz_full_setup()
    37238449af78 Linux 5.15.51
    7fc188a9a9cc powerpc/pseries: wire up rng during setup_arch()
    17aa69b458fd kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS (2nd attempt)
    cced9ce619ef dma-direct: use the correct size for dma_set_encrypted()
    a8bbb4c26460 perf build-id: Fix caching files with a wrong build ID
    46a78d141335 random: update comment from copy_to_user() -> copy_to_iter()
    7a3a4683562e ARM: dts: bcm2711-rpi-400: Fix GPIO line names
    bcf2087ce4de modpost: fix section mismatch check for exported init/exit sections
    da3ee7cd2f15 ARM: cns3xxx: Fix refcount leak in cns3xxx_init
    cde4480b5ab0 memory: samsung: exynos5422-dmc: Fix refcount leak in of_get_dram_timings
    4d9c60e868f7 ARM: Fix refcount leak in axxia_boot_secondary
    10ba9d499a9f soc: bcm: brcmstb: pm: pm-arm: Fix refcount leak in brcmstb_pm_probe
    d23f76018e17 ARM: exynos: Fix refcount leak in exynos_map_pmu
    5e00d3d4023c arm64: dts: ti: k3-am64-main: Remove support for HS400 speed mode
    4b5047643466 ARM: dts: imx6qdl: correct PU regulator ramp delay
    c845b98be950 ARM: dts: imx7: Move hsic_phy power domain to HSIC PHY node
    93f7d2a7fcf3 drm/msm/dp: Always clear mask bits to disable interrupts at dp_ctrl_reset_irq_ctrl()
    1ad385647bf3 powerpc/powernv: wire up rng during setup_arch
    c1cfae46c5dc powerpc/rtas: Allow ibm,platform-dump RTAS call with null buffer address
    fe643b5afde6 powerpc: Enable execve syscall exit tracepoint
    416d16b7dc0b powerpc/microwatt: wire up rng during setup_arch()
    6b28ca2cf344 parisc: Enable ARCH_HAS_STRICT_MODULE_RWX
    cb4d52085c8b parisc/stifb: Fix fb_is_primary_device() only available with CONFIG_FB_STI
    0dcc1dd8a5dd xtensa: Fix refcount leak bug in time.c
    016245172317 xtensa: xtfpga: Fix refcount leak bug in setup
    711591bf1dab iio: adc: ti-ads131e08: add missing fwnode_handle_put() in ads131e08_alloc_channels()
    ab7bf025cee8 iio: adc: adi-axi-adc: Fix refcount leak in adi_axi_adc_attach_client
    4358bf6b1aad iio: adc: rzg2l_adc: add missing fwnode_handle_put() in rzg2l_adc_parse_properties()
    bb6f853289fe iio: adc: axp288: Override TS pin bias current for some models
    4f89730288ee iio: adc: stm32: Fix IRQs on STM32F4 by removing custom spurious IRQs message
    d361b3cc1cf8 iio: adc: stm32: Fix ADCs iteration in irq handler
    148bab179f04 iio: afe: rescale: Fix boolean logic bug
    80e80577043f iio: imu: inv_icm42600: Fix broken icm42600 (chip id 0 value)
    2a2d448a74ab iio: adc: stm32: fix maximum clock rate for stm32mp15x
    4687c3f95524 iio: trigger: sysfs: fix use-after-free on remove
    f359c4751de1 iio: gyro: mpu3050: Fix the error handling in mpu3050_power_up()
    005cb02224a9 iio: accel: mma8452: ignore the return value of reset operation
    cb0d87f2519d iio:accel:mxc4005: rearrange iio trigger get and register
    3357fb9da21a iio:accel:bma180: rearrange iio trigger get and register
    240fb3913f18 iio:accel:kxcjk-1013: rearrange iio trigger get and register
    a1356318042e iio:chemical:ccs811: rearrange iio trigger get and register
    974e69beebb3 iio:humidity:hts221: rearrange iio trigger get and register
    f650029de357 f2fs: attach inline_data after setting compression
    d98b5032c9d0 btrfs: fix deadlock with fsync+fiemap+transaction commit
    1238f580cd81 btrfs: don't set lock_owner when locking extent buffer for reading
    46336a59a4a7 dt-bindings: usb: ehci: Increase the number of PHYs
    9a0b865d8b4c dt-bindings: usb: ohci: Increase the number of PHYs
    308df8d4e41b usb: chipidea: udc: check request status before setting device address
    07f1d9a6b75d USB: gadget: Fix double-free bug in raw_gadget driver
    61c3a21ba6f6 usb: gadget: Fix non-unique driver names in raw-gadget driver
    da57f113e817 xhci-pci: Allow host runtime PM as default for Intel Meteor Lake xHCI
    cfa16dd21be0 xhci-pci: Allow host runtime PM as default for Intel Raptor Lake xHCI
    c1c78d4d9b0a xhci: turn off port power in shutdown
    9509a175a560 usb: typec: wcove: Drop wrong dependency to INTEL_SOC_PMIC
    288f30e17513 iio: adc: vf610: fix conversion mode sysfs node name
    466e15f845d7 iio: magnetometer: yas530: Fix memchr_inv() misuse
    490dd2dd2a79 iio: mma8452: fix probe fail when device tree compatible is used.
    ff3e50ca9250 s390/cpumf: Handle events cycles and instructions identical
    09dd5630fea6 gpio: winbond: Fix error code in winbond_gpio_get()
    e3ea126c513c nvme: move the Samsung X5 quirk entry to the core quirks
    1057d42602cb nvme-pci: add NO APST quirk for Kioxia device
    72fa0f65b566 sock: redo the psock vs ULP protection check
    eb9399970565 Revert "net/tls: fix tls_sk_proto_close executed repeatedly"
    8d7fe9ad6fdd virtio_net: fix xdp_rxq_info bug after suspend/resume
    8eb0223631f8 igb: Make DMA faster when CPU is active on the PCIe link
    60fd29f1ff46 regmap-irq: Fix offset/index mismatch in read_sub_irq_data()
    b0581f93cf05 regmap-irq: Fix a bug in regmap_irq_enable() for type_in_mask chips
    20229bb99545 ice: ethtool: advertise 1000M speeds properly
    2b2bba96526f afs: Fix dynamic root getattr
    ab150a2bf6c5 MIPS: Remove repetitive increase irq_err_count
    3e2c9ee9c1e6 x86/xen: Remove undefined behavior in setup_features()
    ffa12a326415 xen-blkfront: Handle NULL gendisk
    0315bd8ad0dd selftests: netfilter: correct PKTGEN_SCRIPT_PATHS in nft_concat_range.sh
    5b45535865d6 udmabuf: add back sanity check
    be64f54a0db2 net/tls: fix tls_sk_proto_close executed repeatedly
    a3b2470399f6 erspan: do not assume transport header is always set
    26e70f8989cb perf arm-spe: Don't set data source if it's not a memory operation
    e24709e89b1b drm/msm/dp: force link training for display resolution change
    796d3acd7d9e drm/msm/dp: do not initialize phy until plugin interrupt received
    40e9efdc2ef9 drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read failed
    2ecf5ff9aa14 drm/msm/dp: Drop now unused hpd_high member
    d0b4a61f8713 drm/msm/dp: check core_initialized before disable interrupts at dp_display_unbind()
    3c39a1719773 drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
    45bd293bbcd8 net/sched: sch_netem: Fix arithmetic in netem_dump() for 32-bit platforms
    efb10d2a047d ethtool: Fix get module eeprom fallback
    6386fdde8df0 bonding: ARP monitor spams NETDEV_NOTIFY_PEERS notifiers
    2af944210dc2 igb: fix a use-after-free issue in igb_clean_tx_ring
    cd7789e659e8 tipc: fix use-after-free Read in tipc_named_reinit
    ad10d61c55aa net: fix data-race in dev_isalive()
    f617cef46552 net: Write lock dev_base_lock without disabling bottom halves.
    638be56ae9cc KVM: arm64: Prevent kmemleak from accessing pKVM memory
    d7fe6be43cfa phy: aquantia: Fix AN when higher speeds than 1G are not advertised
    8e74f5ceea52 scsi: storvsc: Correct reporting of Hyper-V I/O size limits
    b28e4e3fd34c bpf, x86: Fix tail call count offset calculation on bpf2bpf call
    0eef1dcb9774 drm/sun4i: Fix crash during suspend after component bind failure
    b03607437ea8 bpf: Fix request_sock leak in sk lookup helpers
    7154e4df56d4 drm/msm: use for_each_sgtable_sg to iterate over scatterlist
    64e6ba7f2d2f xsk: Fix generic transmit when completion queue reservation fails
    54abcc525269 scsi: iscsi: Exclude zero from the endpoint ID range
    0a7a5261705f drm/msm: Switch ordering of runpm put vs devfreq_idle
    7d5fe94333a9 scsi: scsi_debug: Fix zone transition to full condition
    d0906b0fffc9 netfilter: use get_random_u32 instead of prandom
    f7fa3263079c drm/msm: Fix double pm_runtime_disable() call
    c6f6c9668609 drm/msm: Ensure mmap offset is initialized
    45dc151ca0b9 USB: serial: option: add Quectel RM500K module support
    d5eb7d6baed5 USB: serial: option: add Quectel EM05-G modem
    b919ece13b6b USB: serial: option: add Telit LE910Cx 0x1250 composition
    e5b0f42edda2 USB: serial: pl2303: add support for more HXN (G) types
    0895a2235bae drm/i915: Implement w/a 22010492432 for adl-s
    bae4d6a2dd9e tracing/kprobes: Check whether get_kretprobe() returns NULL in kretprobe_dispatcher()
    c3f51b28a8bc dm mirror log: clear log bits up to BITS_PER_LONG boundary
    ac0a5f701f4d dm era: commit metadata in postsuspend after worker stops
    c477de4c7d43 ata: libata: add qc->flags in ata_qc_complete_template tracepoint
    0af674e7a764 mtd: rawnand: gpmi: Fix setting busy timeout setting
    0f6f66b4ef27 MAINTAINERS: Add new IOMMU development mailing list
    87a54feba68f xen/gntdev: Avoid blocking in unmap_grant_pages()
    fe9ba4f29320 mmc: mediatek: wait dma stop bit reset to 0
    7df8c497214b mmc: sdhci-pci-o2micro: Fix card detect by dealing with debouncing
    161ec2a0807d scsi: ibmvfc: Allocate/free queue resource only during probe/remove
    8540f66196ca scsi: ibmvfc: Store vhost pointer during subcrq allocation
    4a19c1cee0de btrfs: add error messages to all unrecognized mount options
    82e3769c0257 btrfs: prevent remounting to v1 space cache for subpage mount
    341d33128a94 btrfs: fix hang during unmount when block group reclaim task is running
    f0126bcaee81 9p: fix fid refcount leak in v9fs_vfs_get_link
    22832ac3eb5b 9p: fix fid refcount leak in v9fs_vfs_atomic_open_dotl
    10629c04b3a8 9p: Fix refcounting during full path walks for fid lookups
    cbf585269510 net: openvswitch: fix parsing of nw_proto for IPv6 fragments
    56c6f1fcd594 ALSA: hda/realtek: Add quirk for Clevo NS50PU
    48e3b93cda56 ALSA: hda/realtek: Add quirk for Clevo PD70PNT
    dffaf580c3c2 ALSA: hda/realtek: Apply fixup for Lenovo Yoga Duet 7 properly
    c478ceb4342b ALSA: hda/realtek - ALC897 headset MIC no sound
    82e29e99f2ab ALSA: hda/realtek: Add mute LED quirk for HP Omen laptop
    d12a5d1b5053 ALSA: hda/conexant: Fix missing beep setup
    535abf6207ef ALSA: hda/via: Fix missing beep setup
    eb4c99d089c0 random: quiet urandom warning ratelimit suppression message
    7a42647f7037 random: schedule mix_interrupt_randomness() less often
    18a33c8dabb8 Linux 5.15.50
    f1304f976395 arm64: mm: Don't invalidate FROM_DEVICE buffers at start of DMA transfer
    7c622181faeb serial: core: Initialize rs485 RTS polarity already on probe
    8e57da591f63 selftests/bpf: Add selftest for calling global functions from freplace
    5c0ab17c5360 bpf: Fix calling global functions from BPF_PROG_TYPE_EXT programs
    cfb68b072cbf usb: gadget: u_ether: fix regression in setting fixed MAC address
    c2f71b9bb398 zonefs: fix zonefs_iomap_begin() for reads
    04dcef44f6f4 net: mana: Add handling of CQE_RX_TRUNCATED
    7fd1d002852f drm/amd/display: Don't reinitialize DMCUB on s0ix resume
    48543509f4c5 s390/mm: use non-quiescing sske for KVM switch to keyed guest
    ee039006371a Linux 5.15.49
    c5559147766c clk: imx8mp: fix usb_root_clk parent
    d807e0dfb471 powerpc/book3e: get rid of #include <generated/compile.h>
    870179c053ce virtio-pci: Remove wrong address verification in vp_del_vqs()
    c64dfc63c422 ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for HP machine
    ac0899da0ed1 KVM: arm64: Don't read a HW interrupt pending state in user context
    33b1bba31f4c ext4: add reserved GDT blocks check
    4fadac8c7376 ext4: make variable "count" signed
    90f0f9d45dff ext4: fix bug_on ext4_mb_use_inode_pa
    38db3b696f27 ext4: fix super block checksum incorrect after mount
    75f3a5fa2ad0 cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
    8720414b51d4 drm/amd/display: Cap OLED brightness per max frame-average luminance
    0d2209b54f1d dm mirror log: round up region bitmap size to BITS_PER_LONG
    ccd175109234 bus: fsl-mc-bus: fix KASAN use-after-free in fsl_mc_bus_remove()
    9b5a3b16c4aa serial: 8250: Store to lsr_save_flags after lsr read
    a567426d1449 tty: n_gsm: Debug output allocation must use GFP_ATOMIC
    4baa493636b6 usb: gadget: f_fs: change ep->ep safe in ffs_epfile_io()
    20ac0adece7b usb: gadget: f_fs: change ep->status safe in ffs_epfile_io()
    46da1e4a8b63 usb: gadget: lpc32xx_udc: Fix refcount leak in lpc32xx_udc_probe
    492d82d5ffcd usb: cdnsp: Fixed setting last_trb incorrectly
    701d8ec01e0f usb: dwc2: Fix memory leak in dwc2_hcd_init
    b71eed408e58 USB: serial: io_ti: add Agilent E5805A support
    79ea90c9588f USB: serial: option: add support for Cinterion MV31 with new baseline
    795aa0cfd38d crypto: memneq - move into lib/
    31ac1cffa76b comedi: vmk80xx: fix expression for tx buffer size
    57199e4ee958 mei: me: add raptor lake point S DID
    2399481a13a7 mei: hbm: drop capability response on early shutdown
    93e6c2cbcd08 i2c: designware: Use standard optional ref clock implementation
    668a1f5e75d5 sched: Fix balance_push() vs __sched_setscheduler()
    e85b1b797de0 irqchip/realtek-rtl: Fix refcount leak in map_interrupts
    cc5984cf270b irqchip/gic-v3: Fix refcount leak in gic_populate_ppi_partitions
    0b325d993995 irqchip/gic-v3: Fix error handling in gic_populate_ppi_partitions
    5d38720661a4 irqchip/gic/realview: Fix refcount leak in realview_gic_of_init
    3a72ed60af9d i2c: npcm7xx: Add check for platform_driver_register
    c06ebe20ba9f faddr2line: Fix overlapping text section failures, the sequel
    b5e65ef044d6 block: Fix handling of offline queues in blk_mq_alloc_request_hctx()
    ca67881dcef0 init: Initialize noop_backing_dev_info early
    04cdec418626 certs/blacklist_hashes.c: fix const confusion in certs blacklist
    db73aa946633 arm64: ftrace: consistently handle PLTs.
    a39d42b0f7c9 arm64: ftrace: fix branch range checks
    b764bb8dd474 net: ax25: Fix deadlock caused by skb_recv_datagram in ax25_recvmsg
    ed66c8612bb4 net: bgmac: Fix an erroneous kfree() in bgmac_remove()
    32df93bd9d12 mlxsw: spectrum_cnt: Reorder counter pools
    fce5e847b6ef nvme: add device name to warning in uuid_show()
    21dda97d095c net: hns3: fix tm port shapping of fibre port is incorrect after driver initialization
    36c95d9bd2ad net: hns3: don't push link state to VF if unalive
    384ffa1dee40 net: hns3: set port base vlan tbl_sta to false before removing old vlan
    23de00c1304a net: hns3: split function hclge_update_port_base_vlan_cfg()
    f4c5eba87675 drm/i915/reset: Fix error_state_read ptr + offset use
    91f5a60a8398 io_uring: fix races with buffer table unregister
    b1e7cade3caf io_uring: fix races with file table unregister
    d460a8a3b980 misc: atmel-ssc: Fix IRQ check in ssc_probe
    fb15e79cacdd tty: goldfish: Fix free_irq() on remove
    2cd5117ce64e Drivers: hv: vmbus: Release cpu lock in error case
    0a4e5a3dc5e4 i40e: Fix call trace in setup_tx_descriptors
    f015e9929cca i40e: Fix calculating the number of queue pairs
    e04448d388be i40e: Fix adding ADQ filter to TC0
    0414eab7c78f clocksource: hyper-v: unexport __init-annotated hv_init_clocksource()
    5967a6900873 sunrpc: set cl_max_connect when cloning an rpc_clnt
    ec23a86e060c pNFS: Avoid a live lock condition in pnfs_update_layout()
    b2bb8b6ec81b pNFS: Don't keep retrying if the server replied NFS4ERR_LAYOUTUNAVAILABLE
    9c8fc4b323dd staging: r8188eu: Fix warning of array overflow in ioctl_linux.c
    2595e803130b staging: r8188eu: Use zeroing allocator in wpa_set_encryption()
    d56bc9e8760a staging: r8188eu: fix rtw_alloc_hwxmits error detection for now
    6a816a0b6cc3 platform/x86/intel: hid: Add Surface Go to VGBS allow list
    7f3746461832 platform/x86: gigabyte-wmi: Add support for B450M DS3H-CF
    9352e7f0f06b platform/x86: gigabyte-wmi: Add Z690M AORUS ELITE AX DDR4 support
    76ac3964a22a gpio: dwapb: Don't print error on -EPROBE_DEFER
    eeadd7db8c3f random: credit cpu and bootloader seeds by default
    8be6646cdbe9 MIPS: Loongson-3: fix compile mips cpu_hwmon as module build error.
    5cecc6e56b85 mellanox: mlx5: avoid uninitialized variable warning with gcc-12
    f7d63b508981 gcc-12: disable '-Wdangling-pointer' warning for now
    fcba12a43081 net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag
    27a37755ceb4 ipv6: Fix signed integer overflow in l2tp_ip6_sendmsg
    6616872cfe7f nfc: nfcmrvl: Fix memory leak in nfcmrvl_play_deferred
    af6bc0dcb16a virtio-mmio: fix missing put_device() when vm_cmdline_parent registration failed
    6759554f351a ALSA: hda/realtek - Add HW8326 support
    41b2185bcb2f scsi: pmcraid: Fix missing resource cleanup in error case
    d3b3950b00a1 scsi: ipr: Fix missing/incorrect resource cleanup in error case
    cb8aa5b92a31 scsi: mpt3sas: Fix out-of-bounds compiler warning
    4b5020fc23c8 scsi: lpfc: Allow reduced polling rate for nvme_admin_async_event cmd completion
    6782a2ccd56b scsi: lpfc: Fix port stuck in bypassed state after LIP in PT2PT topology
    5e83869e2944 scsi: lpfc: Resolve NULL ptr dereference after an ELS LOGO is aborted
    d152ce4ffecc scsi: vmw_pvscsi: Expand vcpuHint to 16 bits
    332d76dd9a3e Input: soc_button_array - also add Lenovo Yoga Tablet2 1051F to dmi_use_low_level_irq
    d6d1c0990191 ASoC: wm_adsp: Fix event generation for wm_adsp_fw_put()
    606b0226de01 ASoC: es8328: Fix event generation for deemphasis control
    d733ac5e8110 ASoC: wm8962: Fix suspend while playing music
    38ed8ab3171d quota: Prevent memory allocation recursion while holding dq_lock
    ff128fbea720 ata: libata-core: fix NULL pointer deref in ata_host_alloc_pinfo()
    4a0d2797918c drm/amdkfd: add pinned BOs to kfd_bo_list
    6d235ef00d82 ASoC: cs42l51: Correct minimum value for SX volume control
    47fc26b197aa ASoC: cs42l56: Correct typo in minimum level for SX volume controls
    b3ecd030ab28 ASoC: cs42l52: Correct TLV for Bypass Volume
    d5e7be00d128 ASoC: cs53l30: Correct number of volume levels on SX controls
    2bdfe9a32e0f ASoC: cs35l36: Update digital volume TLV
    f53212791602 ASoC: cs42l52: Fix TLV scales for mixer controls
    e4e166f10e70 dma-debug: make things less spammy under memory pressure
    09c5cdbc62d9 drm/amdkfd: Use mmget_not_zero in MMU notifier
    a2010538c9d2 drm/amd/display: Read Golden Settings Table from VBIOS
    96c22385c25b ASoC: nau8822: Add operation for internal PLL off and on
    70d6d6874db3 powerpc/kasan: Silence KASAN warnings in __get_wchan()
    9cada4a06df9 arm64: dts: imx8mn-beacon: Enable RTS-CTS on UART3
    5628b9febd78 arm64: dts: imx8mm-beacon: Enable RTS-CTS on UART3
    3145fe0ebb16 nfsd: Replace use of rwsem with errseq_t
    22fbef00c9a3 Revert "drm/amd/display: Fix DCN3 B0 DP Alt Mapping"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4d235eda915a3f21e75a24d0a23a8c094d8025d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index eee69be7a8..96607c8a5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9474b2c18a66a8172c2a13c9e83f02bd72e3df1d"
-SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
+SRCREV_machine ?= "6f3031c974b6c3bbbaaa15de66cbaecd21adf5db"
+SRCREV_meta ?= "263a2fb6fb2ed6f632d8d62fb46be2c51553b662"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.48"
+LINUX_VERSION ?= "5.15.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 5a1bc5b6cf..5d0b0da209 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.48"
+LINUX_VERSION ?= "5.15.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "59aca7a6181799d691277b32cc202cf5ac997683"
-SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
+SRCREV_machine ?= "d6eb8944eeae98befa45b4d02a8fcc0d9048c7c7"
+SRCREV_meta ?= "263a2fb6fb2ed6f632d8d62fb46be2c51553b662"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 4a40cde7d8..054bfc117a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3e17faed75180f7affdd91e64206e0bbae384099"
-SRCREV_machine:qemuarm64 ?= "fd047e27b9e51cf93e3a8a4ccb3999cca4709741"
-SRCREV_machine:qemumips ?= "f7515b17b0527fe060c102df0fea6ff82da1489b"
-SRCREV_machine:qemuppc ?= "5aa3abf07bfd44ffda1a7759e3996bfaee9ad4ec"
-SRCREV_machine:qemuriscv64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_machine:qemuriscv32 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_machine:qemux86 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_machine:qemux86-64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_machine:qemumips64 ?= "6b35c884701422bd1ce0821ce316993483283d6a"
-SRCREV_machine ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
-SRCREV_meta ?= "b35d1d1e8390a1677ee2ef1be103d6a7d09bf9cc"
+SRCREV_machine:qemuarm ?= "9c053034b8860590006f7366a0ba28a3857e7c9a"
+SRCREV_machine:qemuarm64 ?= "f7cb33fbf883c3490fd33fe1aa3833d8721bfba5"
+SRCREV_machine:qemumips ?= "f4a865ffde7375a6abbf7aaad67307ea0bc60605"
+SRCREV_machine:qemuppc ?= "ee8fa730ad56949954c321ee068bbee6fc44dbdb"
+SRCREV_machine:qemuriscv64 ?= "b54384a7eba92a04eac7c415dbe7aa9e7079b2fc"
+SRCREV_machine:qemuriscv32 ?= "b54384a7eba92a04eac7c415dbe7aa9e7079b2fc"
+SRCREV_machine:qemux86 ?= "b54384a7eba92a04eac7c415dbe7aa9e7079b2fc"
+SRCREV_machine:qemux86-64 ?= "b54384a7eba92a04eac7c415dbe7aa9e7079b2fc"
+SRCREV_machine:qemumips64 ?= "98c315f0ebd297e1cb6f1a9aa6bf16a02c1e4ec5"
+SRCREV_machine ?= "b54384a7eba92a04eac7c415dbe7aa9e7079b2fc"
+SRCREV_meta ?= "263a2fb6fb2ed6f632d8d62fb46be2c51553b662"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e1dd58c995daf8b632344b61df9d3cbed26454dc"
+SRCREV_machine:class-devupstream ?= "545aecd229613138d6db54fb2b5221faca10137f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.48"
+LINUX_VERSION ?= "5.15.52"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


