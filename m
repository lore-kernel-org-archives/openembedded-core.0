Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBB8C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 14:36:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.10253.1666276564819270321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 07:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TsqTchx0;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id x13so12867578qkg.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PuZkXyB1NMEgiMXIIZSgAm6RIQIuW3U6a4JaFh9a0Rs=;
        b=TsqTchx0yp0LhZrMkDhvFJh8ShigCIGKcGTbg4ocs3biPiaNXmNzjrIZIJGIg+2qJB
         3AMOKU0/NJuTeKM50eDgtQPdLcc+CGDxkz+A6ubqicmzitEsZfbUDhawOxo/qBgrSqJW
         Y0slryDW6pQnIy8TfkiDoO9tGOEdUsHgOOw83njA6FM8mjfkn06+57sfIKAQJCxytX2C
         c/Xgr1aH4+7jtg76f2K0+JxJhaZhfD2uEZk6/RsQ0G8eZ2rGsLVW3wdA6QnvBT4tMjuW
         CS9sdgKP/7dePTLHAqqpZPW6+T1L8prckDcdPdvyGzvteL6ub+8p/XDtCOVvMwPu3K7H
         thmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuZkXyB1NMEgiMXIIZSgAm6RIQIuW3U6a4JaFh9a0Rs=;
        b=Fc5oVrbJ2RnD8Qoch9IBP+GFEaK/6UeS16kftIusaNGlOdzPEzKGY2Y+0jjuQCUbyj
         wDMiSNFnyekXopCmA51fWa4TuhLp0B2yTzKbi5zRSU4CPaUcsJZ26CF6+6SnmvgPiSGQ
         8F7e4RnRO1iCd7b9Ijt/CBEY3DnQFgtOPA5e2fxzmp1cfd4yEnw9IRBR+5Bw5WcL8v0T
         ytAWhgGZ+Ojlbz0aHf4TIWN8vGeIhsjR3m6eDIFvNZB7yyVQ+j9BoatbEvZo2+5EKn6W
         Qnp9xRs33HrLptsdf0kg4hpu/rPtA0KVYH8HO8K+f9E9Py/usNJObxTUZCdhajTcIMuN
         QBIQ==
X-Gm-Message-State: ACrzQf0UbDK2L0cdHGXv5GKu+tXhp2bQFUC+LSfZ77EqzvprDzchwL0M
	8eciRkaxF9GRq3rReymBLL93LRJogYy68A==
X-Google-Smtp-Source: AMsMyM5GDQSpl1hJ+6nlVlVAKTg+YW5IKy1Co1NacIkeEFj2FI0/YWV8cZqF1IJKHsjEpbZcfLNXpQ==
X-Received: by 2002:a05:620a:1a94:b0:6ee:d395:663e with SMTP id bl20-20020a05620a1a9400b006eed395663emr9743422qkb.632.1666276563637;
        Thu, 20 Oct 2022 07:36:03 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bw15-20020a05622a098f00b0035d08c1da35sm6214451qtb.45.2022.10.20.07.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 07:36:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2][dunfell] linux-yocto/5.4: update to v5.4.216
Date: Thu, 20 Oct 2022 10:36:00 -0400
Message-Id: <20221020143601.45658-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 14:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171994

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f28b7414ab71 Linux 5.4.216
    b8b87cb13681 clk: iproc: Do not rely on node name for correct PLL setup
    d417d5eb29d7 clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
    762706bd12a6 selftests: Fix the if conditions of in test_extra_filter()
    ae0d3a431639 nvme: Fix IOC_PR_CLEAR and IOC_PR_RELEASE ioctls for nvme devices
    18ef5cd4c53c nvme: add new line after variable declatation
    3ea4a5342452 usbnet: Fix memory leak in usbnet_disconnect()
    6ca922ec7598 Input: melfas_mip4 - fix return value check in mip4_probe()
    38c4d8230f93 Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time"
    7291d19a9eeb soc: sunxi: sram: Fix debugfs info for A64 SRAM C
    cdbcdfc96126 soc: sunxi: sram: Fix probe function ordering issues
    73dbc6e136b5 soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()
    26170e4fd145 soc: sunxi: sram: Prevent the driver from being unbound
    883778a1f4fa soc: sunxi: sram: Actually claim SRAM regions
    1ba52486082b ARM: dts: am33xx: Fix MMCHS0 dma properties
    d0c69c722ff1 ARM: dts: Move am33xx and am43xx mmc nodes to sdhci-omap driver
    d18565280076 media: dvb_vb2: fix possible out of bound access
    0f4634f70bfd mm: fix madivse_pageout mishandling on non-LRU page
    ffd11370b74f mm/migrate_device.c: flush TLB while holding PTL
    b9e31f4885c4 mm: prevent page_frag_alloc() from corrupting the memory
    d535fb83844e mm/page_alloc: fix race condition between build_all_zonelists and page allocation
    2ec4949738c8 mmc: moxart: fix 4-bit bus width and remove 8-bit bus width
    bb7c23e4e523 libata: add ATA_HORKAGE_NOLPM for Pioneer BDR-207M and BDR-205
    5cebfac6a8c9 Revert "net: mvpp2: debugfs: fix memory leak when using debugfs_lookup()"
    9a3740f448be ntfs: fix BUG_ON in ntfs_lookup_inode_by_name()
    46e784cf4a84 ARM: dts: integrator: Tag PCI host with device_type
    85b5edb1b429 clk: ingenic-tcu: Properly enable registers before accessing timers
    f8a2e22289e4 net: usb: qmi_wwan: Add new usb-id for Dell branded EM7455
    43699b8fbcf1 uas: ignore UAS for Thinkplus chips
    fc540f6e4bb4 usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
    383c663c7359 uas: add no-uas quirk for Hiksemi usb_disk
    6215647d9699 Linux 5.4.215
    579976dc0d9f ext4: make directory inode spreading reflect flexbg size
    26e7c965f41b xfs: fix use-after-free when aborting corrupt attr inactivation
    8b3c9eb1b3dd xfs: fix an ABBA deadlock in xfs_rename
    37ec5a20c80d xfs: don't commit sunit/swidth updates to disk if that would cause repair failures
    4668f08cda30 xfs: split the sunit parameter update into two parts
    fd6c5da3fa2b xfs: refactor agfl length computation function
    6363fdf7acac xfs: use bitops interface for buf log item AIL flag check
    a95582d9d500 xfs: stabilize insert range start boundary to avoid COW writeback race
    7a20c664a7d8 xfs: fix some memory leaks in log recovery
    ad9759d48802 xfs: always log corruption errors
    0336599b645e xfs: constify the buffer pointer arguments to error functions
    8856a6572fed xfs: convert EIO to EFSCORRUPTED when log contents are invalid
    9185003c93b3 xfs: Fix deadlock between AGI and AGF when target_ip exists in xfs_rename()
    796ff09598cd xfs: attach dquots and reserve quota blocks during unwritten conversion
    a33bcad48b48 xfs: range check ri_cnt when recovering log items
    a102869fb173 xfs: add missing assert in xfs_fsmap_owner_from_rmap
    979eb1230413 xfs: slightly tweak an assert in xfs_fs_map_blocks
    c494dbca9928 xfs: replace -EIO with -EFSCORRUPTED for corrupt metadata
    bb7eb3ca4b3b ext4: fix bug in extents parsing when eh_entries == 0 and eh_depth > 0
    04aa8187eba5 workqueue: don't skip lockdep work dependency in cancel_work_sync()
    a874609522b5 drm/rockchip: Fix return type of cdn_dp_connector_mode_valid
    75ed7dee26ab drm/amd/display: Limit user regamma to a valid value
    c89849ecfd2e drm/amdgpu: use dirty framebuffer helper
    0b467eab0aad Drivers: hv: Never allocate anything besides framebuffer from framebuffer memory region
    8c8d0f7ac82f cifs: always initialize struct msghdr smb_msg completely
    1438e412aeda usb: xhci-mtk: fix issue of out-of-bounds array access
    2e473351400e s390/dasd: fix Oops in dasd_alias_get_start_dev due to missing pavgroup
    9eb710d1843a serial: tegra-tcu: Use uart_xmit_advance(), fixes icount.tx accounting
    6cc0434f9d44 serial: tegra: Use uart_xmit_advance(), fixes icount.tx accounting
    556e827b0f63 serial: Create uart_xmit_advance()
    903f7d322c17 net: sched: fix possible refcount leak in tc_new_tfilter()
    0e8de8f54b04 net: sunhme: Fix packet reception for len < RX_COPY_THRESHOLD
    67199c26a006 perf kcore_copy: Do not check /proc/modules is unchanged
    80b2f37b3370 perf jit: Include program header in ELF files
    95c5637d3d1f can: gs_usb: gs_can_open(): fix race dev->can.state condition
    11ebf32fde46 netfilter: ebtables: fix memory leak when blob is malformed
    6a3239f80682 net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs
    d12a1eb07003 net/sched: taprio: avoid disabling offload when it was never enabled
    420c9b10737b of: mdio: Add of_node_put() when breaking out of for_each_xx
    d2ac2baf1fc4 i40e: Fix set max_tx_rate when it is lower than 1 Mbps
    450d106804ff i40e: Fix VF set max MTU size
    3daf09781982 iavf: Fix set max MTU size with port VLAN and jumbo frames
    bfaff9adaa89 iavf: Fix bad page state
    9bf52411eeaa MIPS: Loongson32: Fix PHY-mode being left unspecified
    405bd0ebb00c MIPS: lantiq: export clk_get_io() for lantiq_wdt.ko
    37f79374bba4 net: team: Unsync device addresses on ndo_stop
    346e94aa4a99 ipvlan: Fix out-of-bound bugs caused by unset skb->mac_header
    b84fdb6be105 iavf: Fix cached head and tail value for iavf_get_tx_pending
    721ea8ac063d netfilter: nfnetlink_osf: fix possible bogus match in nf_osf_find()
    d0a24bc8e2aa netfilter: nf_conntrack_irc: Tighten matching on DCC message
    0376a77fa7bc netfilter: nf_conntrack_sip: fix ct_sip_walk_headers
    c9355b7e5a6f arm64: dts: rockchip: Remove 'enable-active-low' from rk3399-puma
    312eb4574d16 arm64: dts: rockchip: Set RK3399-Gru PCLK_EDP to 24 MHz
    a52ef6ae2842 arm64: dts: rockchip: Pull up wlan wake# on Gru-Bob
    016b150992ee mm/slub: fix to return errno if kmalloc() fails
    cafb9cad9bcc efi: libstub: check Shim mode using MokSBStateRT
    9599d4601941 ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
    befadcf8f7f2 ALSA: hda/realtek: Add quirk for ASUS GA503R laptop
    b90ac48c0540 ALSA: hda/realtek: Add pincfg for ASUS G533Z HP jack
    5f622518a7d0 ALSA: hda/realtek: Add pincfg for ASUS G513 HP jack
    8f8a740e9160 ALSA: hda/realtek: Re-arrange quirk table entries
    dafeac1226a4 ALSA: hda/realtek: Add quirk for Huawei WRT-WX9
    95b9a7f0bfbb ALSA: hda: add Intel 5 Series / 3400 PCI DID
    7fff38ab90b8 ALSA: hda/tegra: set depop delay for tegra
    78d3ae9bfad6 USB: serial: option: add Quectel RM520N
    55f0f59e8227 USB: serial: option: add Quectel BG95 0x0203 composition
    95b97afdde75 USB: core: Fix RST error in hub.c
    f5e322ffe7aa Revert "usb: gadget: udc-xilinx: replace memcpy with memcpy_toio"
    430c9bd664ec Revert "usb: add quirks for Lenovo OneLink+ Dock"
    05ec31717feb usb: cdns3: fix issue with rearming ISO OUT endpoint
    10c5d34f6f68 usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    ddf7bc221817 usb: add quirks for Lenovo OneLink+ Dock
    da8ac086943e tty: serial: atmel: Preserve previous USART mode if RS485 disabled
    e56a40281997 serial: atmel: remove redundant assignment in rs485_config
    85a64208b319 tty/serial: atmel: RS485 & ISO7816: wait for TXRDY before sending data
    9ad48cbf8b07 wifi: mac80211: Fix UAF in ieee80211_scan_rx()
    9a3695bde9c7 usb: xhci-mtk: relax TT periodic bandwidth allocation
    174645cc63c3 usb: xhci-mtk: allow multiple Start-Split in a microframe
    6cfde07c5d8e usb: xhci-mtk: add some schedule error number
    664b0b8f4efa usb: xhci-mtk: add a function to (un)load bandwidth info
    d1eed0d3fb8c usb: xhci-mtk: use @sch_tt to check whether need do TT schedule
    1833e8e049d0 usb: xhci-mtk: add only one extra CS for FS/LS INTR
    3826d4f0ef89 usb: xhci-mtk: get the microframe boundary for ESIT
    4ccf7afa4729 usb: dwc3: gadget: Avoid duplicate requests to enable Run/Stop
    a5bdea59f43d usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
    67bf926f16b3 usb: dwc3: gadget: Refactor pullup()
    24e4f6308d95 usb: dwc3: gadget: Prevent repeat pullup()
    62b6cbc5983e usb: dwc3: Issue core soft reset before enabling run/stop
    e24f90d7617b usb: dwc3: gadget: Avoid starting DWC3 gadget during UDC unbind
    85371aad2855 ALSA: hda/sigmatel: Fix unused variable warning for beep power change
    07191f984842 cgroup: Add missing cpus_read_lock() to cgroup_attach_task_all()
    1878eaf0edb8 video: fbdev: pxa3xx-gcu: Fix integer overflow in pxa3xx_gcu_write
    47c5ef29e52f mksysmap: Fix the mismatch of 'L0' symbols in System.map
    f0ebdfc10bd1 MIPS: OCTEON: irq: Fix octeon_irq_force_ciu_mapping()
    c53c3cbca5ef afs: Return -EAGAIN, not -EREMOTEIO, when a file already locked
    1aea20f98ed3 net: usb: qmi_wwan: add Quectel RM520N
    447f95d41397 ALSA: hda/tegra: Align BDL entry to 4KB boundary
    9f55da12d05d ALSA: hda/sigmatel: Keep power up while beep is enabled
    39265647c4a6 rxrpc: Fix calc of resend age
    cc273ed79e7c rxrpc: Fix local destruction being repeated
    da01ec04a0b0 regulator: pfuze100: Fix the global-out-of-bounds access in pfuze100_regulator_probe()
    17a21341d953 ASoC: nau8824: Fix semaphore unbalance at error paths
    323f289a9044 iomap: iomap that extends beyond EOF should be marked dirty
    d88039e6fee4 MAINTAINERS: add Chandan as xfs maintainer for 5.4.y
    36128fd71f03 cifs: don't send down the destination address to sendmsg for a SOCK_STREAM
    81081a5c9c74 cifs: revalidate mapping when doing direct writes
    834f4d856fda tracing: hold caller_addr to hardirq_{enable,disable}_ip
    2c4e260d45fd task_stack, x86/cea: Force-inline stack helpers
    4051324a6daf ALSA: pcm: oss: Fix race at SNDCTL_DSP_SYNC
    47d7e6af5bd4 parisc: ccio-dma: Add missing iounmap in error path in ccio_probe()
    2aae9b7d0723 drm/meson: Fix OSD1 RGB to YCbCr coefficient
    5dd9cb66b712 drm/meson: Correct OSD1 global alpha value
    f1de50e1db99 gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx
    82e276e5fcdc NFSv4: Turn off open-by-filehandle and NFS re-export for NFSv4.0
    e0e88c25f88b of: fdt: fix off-by-one error in unflatten_dt_nodes()
    9f02aa34e179 Linux 5.4.214
    c629ec4ddd4f tracefs: Only clobber mode/uid/gid on remount if asked
    fe26b6ca0404 soc: fsl: select FSL_GUTS driver for DPIO
    1bd66f1053be net: dp83822: disable rx error interrupt
    c128bff9ff35 mm: Fix TLB flush for not-first PFNMAP mappings in unmap_region()
    bf3cd8f2c69b usb: storage: Add ASUS <0x0b05:0x1932> to IGNORE_UAS
    72b31dc26415 platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes
    0573dc9f154a perf/arm_pmu_platform: fix tests for platform_get_irq() failure
    baba0cfc3df0 nvmet-tcp: fix unhandled tcp states in nvmet_tcp_state_change()
    161e7555520b Input: iforce - add support for Boeder Force Feedback Wheel
    a725bc34d81a ieee802154: cc2520: add rc code in cc2520_tx()
    2670d1d3f59c tg3: Disable tg3 device on system reboot to avoid triggering AER
    c118ae56a5fb hid: intel-ish-hid: ishtp: Fix ishtp client sending disordered message
    3e89e8d1c634 HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
    7e214f5b2f34 drm/msm/rd: Fix FIFO-full deadlock

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 1a0e6d7b67..09ff50469a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "03cd66d9814a26fff4681d3a053654848e519fd6"
-SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
+SRCREV_machine ?= "f06a67473d2422ed3bdfb951e0897929b0959678"
+SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.213"
+LINUX_VERSION ?= "5.4.216"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0f71051d0f..3523945155 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.213"
+LINUX_VERSION ?= "5.4.216"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "284fd0f6e11db890ad6cfd246a2c47521db4a05f"
-SRCREV_machine ?= "6d8cf8757864e674bb8f55b6ff68de5e3387d110"
-SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
+SRCREV_machine_qemuarm ?= "3513255b2d77e6a6bf2ebad2697e05cfd42215ab"
+SRCREV_machine ?= "6f25ed1235d5c2556a2c1b491ffa3d3815fb26eb"
+SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d60a44e4a3..acda5ebe78 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bcf3f5cf5f1bcfac1df54a2a9f19c92a49fc7538"
-SRCREV_machine_qemuarm64 ?= "fea87c9d80c7531f85f69fee97cf9500403cef6b"
-SRCREV_machine_qemumips ?= "f1d654a16a5b5a3bbc9288936827628a4a4553a2"
-SRCREV_machine_qemuppc ?= "f6bbc9d216fd3cef1df3ced215b0b22503c48906"
-SRCREV_machine_qemuriscv64 ?= "c0b728020967728840c39994e472db7ed7b727cf"
-SRCREV_machine_qemux86 ?= "c0b728020967728840c39994e472db7ed7b727cf"
-SRCREV_machine_qemux86-64 ?= "c0b728020967728840c39994e472db7ed7b727cf"
-SRCREV_machine_qemumips64 ?= "841245c9bd427e2e7cc786b92cecaf4390e5dd52"
-SRCREV_machine ?= "c0b728020967728840c39994e472db7ed7b727cf"
-SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
+SRCREV_machine_qemuarm ?= "26b50c67881dd59a4d31bfcd667df69dc9e9ea52"
+SRCREV_machine_qemuarm64 ?= "08307edd8480dc6a3ce10d84e27c816423f396e4"
+SRCREV_machine_qemumips ?= "f49695f1e70bc9eeef061edcb2f22753520f7a43"
+SRCREV_machine_qemuppc ?= "f87963b9e6cc4e036a49def1714f850488bae5b1"
+SRCREV_machine_qemuriscv64 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
+SRCREV_machine_qemux86 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
+SRCREV_machine_qemux86-64 ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
+SRCREV_machine_qemumips64 ?= "ae1f3a35c011a787423fedf843f0330f936e5bab"
+SRCREV_machine ?= "070ae01dd2e7c99939a8b67bb4d8f8cd433396d1"
+SRCREV_meta ?= "cb04dbc35b99660032c9b278e96b206c7fc3b106"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.213"
+LINUX_VERSION ?= "5.4.216"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


