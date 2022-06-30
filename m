Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E7DCCA482
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:13 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.29318.1656616622319780354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NERXyEnp;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id cu16so646798qvb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QLFk0b2rBzz0hqTg7YXtMvs5TCzAi7IBkZRqd5TQYTk=;
        b=NERXyEnp+FvcC2FJkrVXoqki6+t3x+x49q2+q7uWxWe3PPSrdXOQ8LlVtMnF09py0k
         mNRV9+hbImO5wTOntLaNW4LItWksSFJiF9MMOebqXJYpmwGtHwqY4Zo2CiHdL9DslNxj
         LS8GCHicUp6ZmJ2ykPpRvNOJmvtcDRlybjz3TmpVEp1yrzbXBLpJLYKMD4ur0C6zl1Ru
         x7XlIATjMlevsb3uOoFs6CrjNch6t0kCQmQyqLxYaONAqz7gPUS6CZupqGnGvPGYWTQ6
         r4JJ/vL5CzC6te2eGZes72kS6HRPOksTkiMKopAfiQYGDzIsj96eXG9usZ7G8g8u+YrZ
         aFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QLFk0b2rBzz0hqTg7YXtMvs5TCzAi7IBkZRqd5TQYTk=;
        b=Tdhqvv4qNKjrQFXlf3IWDbzpnchq5hb00xo7Og0tgcZYE5pUAMnuvMzKY4TgILHNFc
         aAno2Vm1QmqpxyRYI7BnN5UUB20BK4jpkyIJ4THEZYAPzs2d/6lfsR/CA3Fqwwz3aCSw
         2me81aqNfJffLEQDquLzETRiIecL6uddIYyJ6kXP58tMtMaWkKIe0VhFbBm1mzJKAfzO
         qqPphh3IkwpJ2hGI8civ80/3Hs81KidN/43P2AjGFGLrOYwu4fTdFqsrKv/By/ul85mk
         KXoXgOtWQooFNP8IpcsqCr6F23WywWxq1IMdWNp1hSoATWsUJPmv1NVFYcOlHyItDSTF
         L7wg==
X-Gm-Message-State: AJIora+6WkzeXBXjKIXc2DrgaptwEUsFwHDXNPxuMOv+OrYL4x+QHXG2
	ajHU2je86ZqeYcWDeXG5x5O8t3Eer8XeAA==
X-Google-Smtp-Source: 
 AGRyM1tYr4h9H2wbf4Et/5zDvryYCBlzlvLqrQLW4b/+FSMMRHYn2KsFQWLTX/ae68B3cLkt4IqQQg==
X-Received: by 2002:ad4:5de5:0:b0:470:a854:e8fd with SMTP id
 jn5-20020ad45de5000000b00470a854e8fdmr12758683qvb.121.1656616626427;
        Thu, 30 Jun 2022 12:17:06 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:17:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.10: update to v5.10.123
Date: Thu, 30 Jun 2022 15:16:52 -0400
Message-Id: 
 <b4cf5229938b01d1320711d45c1660cffc13a54a.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167438

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    2a59239b22e0 Linux 5.10.123
    aa238a92cc94 x86/speculation/mmio: Print SMT warning
    bde15fdcce44 KVM: x86/speculation: Disable Fill buffer clear within guests
    6df693dca312 x86/speculation/mmio: Reuse SRBDS mitigation for SBDS
    cf1c01a5e4c3 x86/speculation/srbds: Update SRBDS mitigation selection
    001415e4e626 x86/speculation/mmio: Add sysfs reporting for Processor MMIO Stale Data
    3eb1180564fa x86/speculation/mmio: Enable CPU Fill buffer clearing on idle
    56f0bca5e9c8 x86/bugs: Group MDS, TAA & Processor MMIO Stale Data mitigations
    26f6f231f6a5 x86/speculation/mmio: Add mitigation for Processor MMIO Stale Data
    f83d4e5be4a3 x86/speculation: Add a common function for MD_CLEAR mitigation update
    e66310bc96b7 x86/speculation/mmio: Enumerate Processor MMIO Stale Data bug
    f8a85334a57e Documentation: Add documentation for Processor MMIO Stale Data
    5754c570a569 Linux 5.10.122
    9ba2b4ac3593 tcp: fix tcp_mtup_probe_success vs wrong snd_cwnd
    5e34b4975669 dmaengine: idxd: add missing callback function to support DMA_INTERRUPT
    b8c17121f05b zonefs: fix handling of explicit_open option on mount
    ef51997771d6 PCI: qcom: Fix pipe clock imbalance
    63bcb9da91eb md/raid0: Ignore RAID0 layout if the second zone has only one device
    418db40cc753 interconnect: Restore sync state by ignoring ipa-virt in provider count
    bcae8f8338ab interconnect: qcom: sc7180: Drop IP0 interconnects
    fe6caf512261 powerpc/mm: Switch obsolete dssall to .long
    3be74fc0afbe powerpc/32: Fix overread/overwrite of thread_struct via ptrace
    fa0d3d71dc08 drm/atomic: Force bridge self-refresh-exit on CRTC switch
    dbe04e874d4f drm/bridge: analogix_dp: Support PSR-exit to disable transition
    61297ee0c329 Input: bcm5974 - set missing URB_NO_TRANSFER_DMA_MAP urb flag
    2dba96d19d25 ixgbe: fix unexpected VLAN Rx in promisc mode on VF
    91620cded92d ixgbe: fix bcast packets Rx on VF after promisc removal
    cdd9227373f2 nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
    54423649bc0e nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
    4f0a2c46f588 nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
    c4e4c07d86db net: phy: dp83867: retrigger SGMII AN when link change
    133c9870cd6b mmc: block: Fix CQE recovery reset success
    0248a8c844a4 ata: libata-transport: fix {dma|pio|xfer}_mode sysfs files
    471a41320170 cifs: fix reconnect on smb3 mount types
    9023ecfd3378 cifs: return errors during session setup during reconnects
    b423cd2a81e8 ALSA: hda/realtek: Fix for quirk to enable speaker output on the Lenovo Yoga DuetITL 2021
    94bd216d1718 ALSA: hda/conexant - Fix loopback issue with CX20632
    13639c970fdb scripts/gdb: change kernel config dumping method
    b6ea26873edb vringh: Fix loop descriptors check in the indirect cases
    362e3b3a5953 nodemask: Fix return values to be unsigned
    a262e1255b91 cifs: version operations for smb20 unneeded when legacy support disabled
    01137d898039 s390/gmap: voluntarily schedule during key setting
    f72df77600a4 nbd: fix io hung while disconnecting device
    122e4adaff24 nbd: fix race between nbd_alloc_config() and module removal
    c0868f6e728c nbd: call genl_unregister_family() first in nbd_cleanup()
    cb8da20d71f9 jump_label,noinstr: Avoid instrumentation for JUMP_LABEL=n builds
    320acaf84a64 x86/cpu: Elide KCSAN for cpu_has() and friends
    82876878210a modpost: fix undefined behavior of is_arm_mapping_symbol()
    fee8ae0a0bb6 drm/radeon: fix a possible null pointer dereference
    3e5768683022 ceph: allow ceph.dir.rctime xattr to be updatable
    7fa8312879f7 Revert "net: af_key: add check for pfkey_broadcast in function pfkey_process"
    ebfe2797253f scsi: myrb: Fix up null pointer access on myrb_cleanup()
    7eb32f286e68 md: protect md_unregister_thread from reentrancy
    668c3f9fa2dd watchdog: wdat_wdt: Stop watchdog when rebooting the system
    e20bc8b5a292 kernfs: Separate kernfs_pr_cont_buf and rename_lock.
    1e3b3a5762a9 serial: msm_serial: disable interrupts in __msm_console_write()
    ff727ab0b7d7 staging: rtl8712: fix uninit-value in r871xu_drv_init()
    33ef21d55418 staging: rtl8712: fix uninit-value in usb_read8() and friends
    f3f754d72d2d clocksource/drivers/sp804: Avoid error on multiple instances
    abf3b222614f extcon: Modify extcon device to be created after driver data is set
    41ec9466944f misc: rtsx: set NULL intfdata when probe fails
    5b0c0298f7c3 usb: dwc2: gadget: don't reset gadget's driver->bus
    468fe959eab3 sysrq: do not omit current cpu when showing backtrace of all active CPUs
    f4cb24706ca4 USB: hcd-pci: Fully suspend across freeze/thaw cycle
    ffe9440d6982 drivers: usb: host: Fix deadlock in oxu_bus_suspend()
    6e2273eefab5 drivers: tty: serial: Fix deadlock in sa1100_set_termios()
    ee105039d365 USB: host: isp116x: check return value after calling platform_get_resource()
    0f69d7d5e918 drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
    66f769762f65 drivers: staging: rtl8192u: Fix deadlock in ieee80211_beacons_stop()
    cb7147afd328 tty: Fix a possible resource leak in icom_probe
    d68d5e68b7f6 tty: synclink_gt: Fix null-pointer-dereference in slgt_clean()
    61ca1b97adb9 lkdtm/usercopy: Expand size of "out of frame" object
    7821d743abb3 iio: st_sensors: Add a local lock for protecting odr
    5a89a92efc34 staging: rtl8712: fix a potential memory leak in r871xu_drv_init()
    8caa4b7d411c iio: dummy: iio_simple_dummy: check the return value of kstrdup()
    f091e29ed872 drm: imx: fix compiler warning with gcc-12
    96bf5ed057df net: altera: Fix refcount leak in altera_tse_mdio_create
    fbeb8dfa8b87 ip_gre: test csum_start instead of transport header
    1981cd7a774e net/mlx5: fs, fail conflicting actions
    652418d82b7d net/mlx5: Rearm the FW tracer after each tracer event
    5d9c1b081ad2 net: ipv6: unexport __init-annotated seg6_hmac_init()
    be3884d5cd04 net: xfrm: unexport __init-annotated xfrm4_protocol_init()
    7759c3222815 net: mdio: unexport __init-annotated mdio_bus_init()
    b585b87fd5c7 SUNRPC: Fix the calculation of xdr->end in xdr_get_next_encode_buffer()
    3d8122e1692b net/mlx4_en: Fix wrong return value on ioctl EEPROM query failure
    c2ae49a113a5 net: dsa: lantiq_gswip: Fix refcount leak in gswip_gphy_fw_list
    0cf7aaff290c bpf, arm64: Clear prog->jited_len along prog->jited
    c61848500a3f af_unix: Fix a data-race in unix_dgram_peer_wake_me().
    be9581f4fda7 xen: unexport __init-annotated xen_xlate_map_ballooned_pages()
    86c87d2c0338 netfilter: nf_tables: bail out early if hardware offload is not supported
    330c0c6cd215 netfilter: nf_tables: memleak flow rule from commit path
    67e2d448733c netfilter: nf_tables: release new hooks on unsupported flowtable flags
    19cb3ece1454 ata: pata_octeon_cf: Fix refcount leak in octeon_cf_probe
    ec5548066d34 netfilter: nf_tables: always initialize flowtable hook list in transaction
    7fd03e34f01f powerpc/kasan: Force thread size increase with KASAN
    7a248f9c74f9 netfilter: nf_tables: delete flowtable hooks via transaction list
    9edafbc7ec29 netfilter: nat: really support inet nat without l3 address
    8dbae5affbdb xprtrdma: treat all calls not a bcall when bc_serv is NULL
    8b3d5bafb188 video: fbdev: pxa3xx-gcu: release the resources correctly in pxa3xx_gcu_probe/remove()
    c09b873f3f39 video: fbdev: hyperv_fb: Allow resolutions with size > 64 MB for Gen1
    0ee5b9644f06 NFSv4: Don't hold the layoutget locks across multiple RPC calls
    95a0ba85c1b5 dmaengine: zynqmp_dma: In struct zynqmp_dma_chan fix desc_size data type
    2c08cae19d5d m68knommu: fix undefined reference to `_init_sp'
    d99f04df3236 m68knommu: set ZERO_PAGE() to the allocated zeroed page
    344a55ccf5ec i2c: cadence: Increase timeout per message if necessary
    32bea51fe4c6 f2fs: remove WARN_ON in f2fs_is_valid_blkaddr
    54c1e0e3bbca iommu/arm-smmu-v3: check return value after calling platform_get_resource()
    3660db29b030 iommu/arm-smmu: fix possible null-ptr-deref in arm_smmu_device_probe()
    9e801c891aa2 tracing: Avoid adding tracer option before update_tracer_options
    1788e6dbb612 tracing: Fix sleeping function called from invalid context on RT kernel
    2f452a33067d bootconfig: Make the bootconfig.o as a normal object file
    c667b3872a4c mips: cpc: Fix refcount leak in mips_cpc_default_phys_base
    76b226eaf055 dmaengine: idxd: set DMA_INTERRUPT cap bit
    32be2b805a1a perf c2c: Fix sorting in percent_rmt_hitm_cmp()
    71cbce75031a driver core: Fix wait_for_device_probe() & deferred_probe_timeout interaction
    b8fac8e32104 tipc: check attribute length for bearer name
    c1f018702590 scsi: sd: Fix potential NULL pointer dereference
    d2e297eaf456 afs: Fix infinite loop found by xfstest generic/676
    04622d631826 gpio: pca953x: use the correct register address to do regcache sync
    0a0f7f841484 tcp: tcp_rtx_synack() can be called from process context
    e05dd93826e1 net: sched: add barrier to fix packet stuck problem for lockless qdisc
    e9fe72b95d7f net/mlx5e: Update netdev features after changing XDP state
    b50eef7a38ed net/mlx5: correct ECE offset in query qp output
    ea5edd015feb net/mlx5: Don't use already freed action pointer
    bf2af9b24313 sfc: fix wrong tx channel offset with efx_separate_tx_channels
    8f81a4113e1e sfc: fix considering that all channels have TX queues
    7ac3a034d96a nfp: only report pause frame configuration for physical device
    630e0a10c020 net/smc: fixes for converting from "struct smc_cdc_tx_pend **" to "struct smc_wr_tx_pend_priv *"
    b97550e380ca riscv: read-only pages should not be writable
    8f49e1694cbc bpf: Fix probe read error in ___bpf_prog_run()
    6d8d3f68cbec ubi: ubi_create_volume: Fix use-after-free when volume creation failed
    f413e4d7cdf3 ubi: fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool not empty
    3252d327f977 jffs2: fix memory leak in jffs2_do_fill_super
    741e49eacdcd modpost: fix removing numeric suffixes
    42658e47f1ab net: dsa: mv88e6xxx: Fix refcount leak in mv88e6xxx_mdios_register
    f7ba2cc57f40 net: ethernet: ti: am65-cpsw-nuss: Fix some refcount leaks
    71ae30662ec6 net: ethernet: mtk_eth_soc: out of bounds read in mtk_hwlro_get_fdir_entry()
    503a3fd6466d net: sched: fixed barrier to prevent skbuff sticking in qdisc backlog
    ee89d7fd49de s390/crypto: fix scatterwalk_unmap() callers in AES-GCM
    e892a7e60f1f clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
    1d7361679f0a ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
    910b1cdf6c50 watchdog: ts4800_wdt: Fix refcount leak in ts4800_wdt_probe
    b3354f2046cc watchdog: rti-wdt: Fix pm_runtime_get_sync() error checking
    36ee9ffca8ef driver core: fix deadlock in __device_attach
    823f24f2e329 driver: base: fix UAF when driver_attach failed
    7a6337bfedc5 bus: ti-sysc: Fix warnings for unbind for serial
    985706bd3bbe firmware: dmi-sysfs: Fix memory leak in dmi_sysfs_register_handle
    94acaaad470e serial: stm32-usart: Correct CSIZE, bits, and parity
    b7e560d2ffbe serial: st-asc: Sanitize CSIZE and correct PARENB for CS7
    afcfc3183cfd serial: sifive: Sanitize CSIZE and c_iflag
    a9f6bee486e7 serial: sh-sci: Don't allow CS5-6
    00456b932e16 serial: txx9: Don't allow CS5-6
    22e975796f89 serial: rda-uart: Don't allow CS5-6
    ff4ce2979b5d serial: digicolor-usart: Don't allow CS5-6
    5cd331bcf094 serial: 8250_fintek: Check SER_RS485_RTS_* only with RS485
    260792d5c9d6 serial: meson: acquire port->lock in startup()
    82bfea344e8f rtc: mt6397: check return value after calling platform_get_resource()
    d54a51b51851 clocksource/drivers/riscv: Events are stopped during CPU suspend
    5b3e990f85eb soc: rockchip: Fix refcount leak in rockchip_grf_init
    cfe8a0967d6e extcon: ptn5150: Add queue work sync before driver release
    96414e2cdc28 coresight: cpu-debug: Replace mutex with mutex_trylock on panic notifier
    47ebc50dc2a7 serial: sifive: Report actual baud base rather than fixed 115200
    ab35308bbd33 phy: qcom-qmp: fix pipe-clock imbalance on power-on failure
    52f327a45c5b rpmsg: qcom_smd: Fix returning 0 if irq_of_parse_and_map() fails
    c10333c4519a iio: adc: sc27xx: Fine tune the scale calibration values
    3747429834d2 iio: adc: sc27xx: fix read big scale voltage not right
    b30f2315a3a6 iio: proximity: vl53l0x: Fix return value check of wait_for_completion_timeout
    43823ceb26e6 iio: adc: stmpe-adc: Fix wait_for_completion_timeout return value check
    6f01c0fb8e44 usb: typec: mux: Check dev_set_name() return value
    7027c890ff6b firmware: stratix10-svc: fix a missing check on list iterator
    70ece3c5ec4f misc: fastrpc: fix an incorrect NULL check on list iterator
    2a1bf8e5ad61 usb: dwc3: pci: Fix pm_runtime_get_sync() error checking
    8ae4fed195c0 rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
    572211d631d7 pwm: lp3943: Fix duty calculation in case period was clamped
    f9782b26d6f1 staging: fieldbus: Fix the error handling path in anybuss_host_common_probe()
    b382c0c3b8cc usb: musb: Fix missing of_node_put() in omap2430_probe
    6b7cf2212223 USB: storage: karma: fix rio_karma_init return
    e100742823c3 usb: usbip: add missing device lock on tweak configuration cmd
    bcbb795a9e78 usb: usbip: fix a refcount leak in stub_probe()
    4e3a2d77bd0b tty: serial: fsl_lpuart: fix potential bug when using both of_alias_get_id and ida_simple_get
    e27376f5aade tty: n_tty: Restore EOF push handling behavior
    11bc6eff3abc tty: serial: owl: Fix missing clk_disable_unprepare() in owl_uart_probe
    ee6c33b29e62 tty: goldfish: Use tty_port_destroy() to destroy port
    56ac04f35fc5 lkdtm/bugs: Check for the NULL pointer after calling kmalloc
    03efa70eb0ee iio: adc: ad7124: Remove shift from scan_type
    4610b067615f staging: greybus: codecs: fix type confusion of list iterator variable
    1509d2335db8 pcmcia: db1xxx_ss: restrict to MIPS_DB1XXX boards

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 267ccae6ae..affcb9f06d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7990b55bc5118f2c082a9bf8faba90da674846a4"
-SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
+SRCREV_machine ?= "d5d01c8346adf1377ac45debf2f94f3a41715ea5"
+SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.121"
+LINUX_VERSION ?= "5.10.123"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 4c8acd43ac..68df384067 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.121"
+LINUX_VERSION ?= "5.10.123"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d26f32d1b819eb76ec986019d079b367ba979f4a"
-SRCREV_machine ?= "5ff0449fb076cadeff1b010758c845a042ff52a7"
-SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
+SRCREV_machine:qemuarm ?= "61483f658abe672f1a0ac5780801110e1df3ba28"
+SRCREV_machine ?= "a0d580a3203cb2218bc5c8a9e44fc4cd3ec58ef7"
+SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 498ea018eb..cb30c6e3ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ef0a86962ec1ff63e1f2cbc580356131c1bef7b8"
-SRCREV_machine:qemuarm64 ?= "83a9781b432a00dc860775a741307c558c6b8c64"
-SRCREV_machine:qemumips ?= "1fde9e6d54754203be1052ce657eabd524a7dbf4"
-SRCREV_machine:qemuppc ?= "00e7a83a78a5d3140ea1e696986b75c71dda2d2b"
-SRCREV_machine:qemuriscv64 ?= "97b065764b090d52493a9300f11cb1c988368b40"
-SRCREV_machine:qemuriscv32 ?= "97b065764b090d52493a9300f11cb1c988368b40"
-SRCREV_machine:qemux86 ?= "97b065764b090d52493a9300f11cb1c988368b40"
-SRCREV_machine:qemux86-64 ?= "97b065764b090d52493a9300f11cb1c988368b40"
-SRCREV_machine:qemumips64 ?= "268418490e87231112e22edd9a5f9ab10a1b1144"
-SRCREV_machine ?= "97b065764b090d52493a9300f11cb1c988368b40"
-SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
+SRCREV_machine:qemuarm ?= "91b1cb57bcaa1b9be59fbacfe7071051cb5b0556"
+SRCREV_machine:qemuarm64 ?= "066be7dc846bbf7d02aefe528c21437f9b5759ef"
+SRCREV_machine:qemumips ?= "ec5d13b3d64c8350cba561e0f5b85ff23daf87a2"
+SRCREV_machine:qemuppc ?= "72be545c445fa9195dbc7d76067b48149d53763f"
+SRCREV_machine:qemuriscv64 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
+SRCREV_machine:qemuriscv32 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
+SRCREV_machine:qemux86 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
+SRCREV_machine:qemux86-64 ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
+SRCREV_machine:qemumips64 ?= "368bc5f2b82f7bac6e2200fa00005a26df4b6d72"
+SRCREV_machine ?= "fdb36827b273d296677006c51d0d8b8d26fe3641"
+SRCREV_meta ?= "ca025569d1b8a5c227d054033bbab457dc5535e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.121"
+LINUX_VERSION ?= "5.10.123"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


