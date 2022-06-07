Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E06C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 17:04:24 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.107.1654621459049218242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HcqJ+biH;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id k4so6481095qth.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fof8IJuk7Aj+Tz7CTSF7MerEMUSLf4siCAD+ETi/hGQ=;
        b=HcqJ+biHEq0ujE61nwv2UK93F9/25bsx7tkKHEiq2YKUGzoqCSeAeN3UkMv86tPE+n
         5bBQwBlk+nCuWuTSbdcytGvTq8jK6j3sphvNQHqsdF+l4aYz6NmSJOflY9niDPHIF1nH
         R5e/u1G59BZKgGsi//tPpUIQAQ/OWCgXzf1bDuz6JBEG7Ey9ZjQhh+GKo56hKd3dArdq
         o5ZBiG1gxHL7PutjeQv7i5Z2SNGHKUaJPCDbUo+9CzaW8MonJFW5LNmv/C6iC16VfU5w
         V+xHgMMTfzhxmp0owG3bGSDM30Lk8bqaL9ORTZ1WOMzU5/ewgC6mOT0rYVZcep63uVcu
         smEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fof8IJuk7Aj+Tz7CTSF7MerEMUSLf4siCAD+ETi/hGQ=;
        b=DWbY+xywdU2nfvMEa7IHjMAjAu9ZkEnVH1gA8uYMIapspzxpARVLhUsr/O80WaEDvy
         KwhzhAdfXUASJMNOiGrEyKiXbqXNaEEXayi3n4PYK36DkjKldVSbjgFMSn5rKPR7LglO
         GX4nqULZSigY3SZ+rInumVDBlXQyjrsqbc9V+aTA5k2huE4SeYsINDHLyyHdN9b+Q0Zh
         /W/2TmPoXIarTuWUINc2OcehKye7Y5wVxM1OLC97sdfcO6Ev0TFj1k9mCeeBg3x9/ZHu
         0ABkcNKHSxioWr7zcopsWO4w2//3pFAtbp0ooGsUcq6JFkqlbk/KZipHolSu3p6zp+9z
         mrOQ==
X-Gm-Message-State: AOAM530ply7L5t79mDv9E9yPu7NcOhbIefxMymQBamlAbMVxOgi37qxf
	QM5cxOCq+Y67Za4TTeTZjblbwpOhxflKFg==
X-Google-Smtp-Source: 
 ABdhPJynqTlLy9StTmZyz0t2qV3poyIyKeChB9Z9XZr9/hOKGUL4vJw06NqGw1216Ye8AtO3j0DYeg==
X-Received: by 2002:ac8:5a44:0:b0:304:f19e:779c with SMTP id
 o4-20020ac85a44000000b00304f19e779cmr6996993qta.480.1654621457389;
        Tue, 07 Jun 2022 10:04:17 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a05622a01d000b00304e95ec0fbsm6517591qtw.89.2022.06.07.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:04:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: update to v5.4.196
Date: Tue,  7 Jun 2022 13:04:14 -0400
Message-Id: <20220607170414.54374-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 17:04:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166681

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    04b092e4a01a Linux 5.4.196
    dba1941f5bc3 afs: Fix afs_getattr() to refetch file status if callback break occurred
    ef5374d532ca i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()
    10a221e2d3d8 x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
    a12884ff4340 x86/xen: fix booting 32-bit pv guest
    b2f140a9f980 Reinstate some of "swiotlb: rework "fix info leak with DMA_FROM_DEVICE""
    060f38b1dfb4 ARM: dts: imx7: Use audio_mclk_post_div instead audio_mclk_root_clk
    b38cf3cb17df firmware_loader: use kernel credentials when reading firmware
    e14e3856e94d net: stmmac: disable Split Header (SPH) for Intel platforms
    9ea8e6a8323e block: return ELEVATOR_DISCARD_MERGE if possible
    36ac6caf742d Input: ili210x - fix reset timing
    1c450bdf2e8c net: atlantic: verify hw_head_ lies within TX buffer ring
    e5307704c4ad net: stmmac: fix missing pci_disable_device() on error in stmmac_pci_probe()
    91d8d7edf192 ethernet: tulip: fix missing pci_disable_device() on error in tulip_init_one()
    dd5de66f5c8a selftests: add ping test with ping_group_range tuned
    9919585e5f41 mac80211: fix rx reordering with non explicit / psmp ack policy
    19e2cd737c16 scsi: qla2xxx: Fix missed DMA unmap for aborted commands
    74168c2207a5 perf bench numa: Address compiler error on s390
    d1915d9c9fa3 gpio: mvebu/pwm: Refuse requests with inverted polarity
    3fdd67e83c42 gpio: gpio-vf610: do not touch other bits when set the target bit
    1fe6dc5f5d19 net: bridge: Clear offload_fwd_mark when passing frame up bridge interface.
    622be11fa385 igb: skip phy status check where unavailable
    eb92a8ecce23 ARM: 9197/1: spectre-bhb: fix loop8 sequence for Thumb2
    463a7b957db0 ARM: 9196/1: spectre-bhb: enable for Cortex-A15
    1b93631c77c9 net: af_key: add check for pfkey_broadcast in function pfkey_process
    c0be5fec786b net/mlx5e: Properly block LRO when XDP is enabled
    3277789f332e NFC: nci: fix sleep in atomic context bugs caused by nci_skb_alloc
    b368e07fb44d net/qla3xxx: Fix a test in ql_reset_work()
    d672eee9e404 clk: at91: generated: consider range when calculating best rate
    8cb1a05fe38b ice: fix possible under reporting of ethtool Tx and Rx statistics
    dc64e8874e87 net: vmxnet3: fix possible NULL pointer dereference in vmxnet3_rq_cleanup()
    32f779e6fbbe net: vmxnet3: fix possible use-after-free bugs in vmxnet3_rq_alloc_rx_buf()
    1eb2d7858155 net/sched: act_pedit: sanitize shift argument before usage
    50f70ee30236 net: macb: Increment rx bd head after allocating skb and buffer
    a42ffe88332c ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
    6493ff94c022 ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
    fe2a9469eca0 dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace
    8cf6c24ed488 drm/dp/mst: fix a possible memory leak in fetch_monitor_name()
    8be06f62b426 crypto: qcom-rng - fix infinite loop on requests not multiple of WORD_SZ
    f4a093215b8e KVM: x86/mmu: Update number of zapped pages even if page list is stable
    de8745182749 PCI/PM: Avoid putting Elo i2 PCIe Ports in D3cold
    3a12b2c413b2 Fix double fget() in vhost_net_set_backend()
    dd0ea88b0a0f perf: Fix sys_perf_event_open() race against self
    c8a5e14cb407 ALSA: wavefront: Proper check of get_user() error
    2f8f6c393b11 SUNRPC: Ensure we flush any closed sockets before xs_xprt_free()
    975a0f14d5cd SUNRPC: Don't call connect() more than once on a TCP socket
    aa4d71edd609 SUNRPC: Prevent immediate close+reconnect
    2d6f096476e6 SUNRPC: Clean up scheduling of autoclose
    f3fe8d13ac89 mmc: core: Default to generic_cmd6_time as timeout in __mmc_switch()
    def047ae1266 mmc: block: Use generic_cmd6_time when modifying INAND_CMD38_ARG_EXT_CSD
    f10260f35992 mmc: core: Specify timeouts for BKOPS and CACHE_FLUSH for eMMC
    1e93f939927d nilfs2: fix lockdep warnings during disk space reclamation
    307d021b1a7f nilfs2: fix lockdep warnings in page operations for btree nodes
    77b71a4c8767 ARM: 9191/1: arm/stacktrace, kasan: Silence KASAN warnings in unwind_frame()
    54f7358be14d platform/chrome: cros_ec_debugfs: detach log reader wq from devm
    232128f6e60f drbd: remove usage of list iterator variable after loop
    83abb076f473 MIPS: lantiq: check the return value of kzalloc()
    e7947c031ffe rtc: mc146818-lib: Fix the AltCentury for AMD platforms
    7be785032c05 nvme-multipath: fix hang when disk goes live over reconnect
    ee0323cc8bbb ALSA: hda/realtek: Enable headset mic on Lenovo P360
    c0d86f2a3c03 crypto: x86/chacha20 - Avoid spurious jumps to other functions
    f0213894337a crypto: stm32 - fix reference leak in stm32_crc_remove
    8c015cd52442 Input: stmfts - fix reference leak in stmfts_input_open
    bb83a744bc67 Input: add bounds checking to input_set_capability()
    4fd396695646 um: Cleanup syscall_handler_t definition/cast, fix warning
    0c319b998835 rtc: fix use-after-free on device removal
    05df3bdbc259 x86/xen: Make the secondary CPU idle tasks reliable
    0d3817cb4ebe x86/xen: Make the boot CPU idle task reliable
    67e2b62461b5 floppy: use a statically allocated error counter
    0187300e6aa6 Linux 5.4.195
    8fcefb43ecfc tty/serial: digicolor: fix possible null-ptr-deref in digicolor_uart_probe()
    6d80857c4fc7 ping: fix address binding wrt vrf
    7845532adb53 arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map
    c0b735fef2af net: phy: Fix race condition on link status change
    a60def756821 MIPS: fix build with gcc-12
    a3112d5da17c drm/vmwgfx: Initialize drm_mode_fb_cmd2
    463c7431490d cgroup/cpuset: Remove cpus_allowed/mems_allowed setup in cpuset_init_smp()
    f25145c37c4e i40e: i40e_main: fix a missing check on list iterator
    17c744716af5 drm/nouveau/tegra: Stop using iommu_present()
    c8f567c46543 serial: 8250_mtk: Fix register address for XON/XOFF character
    aa3ea7451bd6 serial: 8250_mtk: Fix UART_EFR register address
    031fda28d0a6 slimbus: qcom: Fix IRQ check in qcom_slim_probe
    7de6f3059629 USB: serial: option: add Fibocom MA510 modem
    65732f62f730 USB: serial: option: add Fibocom L610 modem
    6c78537f3e29 USB: serial: qcserial: add support for Sierra Wireless EM7590
    e40d00494712 USB: serial: pl2303: add device id for HP LM930 Display
    056a56f8fbfe usb: typec: tcpci: Don't skip cleanup in .remove() on error
    457d9401b8c1 usb: cdc-wdm: fix reading stuck on device close
    4d93303fd877 tty: n_gsm: fix mux activation issues in gsm_config()
    6e34ee5b5b92 tcp: resalt the secret every 10 seconds
    39c26fe93c76 net: emaclite: Don't advertise 1000BASE-T and do auto negotiation
    638bfbc84cca s390: disable -Warray-bounds
    f66d3fa5089f ASoC: ops: Validate input values in snd_soc_put_volsw_range()
    13b850a6cc80 ASoC: max98090: Generate notifications on changes for custom control
    5c766c000a64 ASoC: max98090: Reject invalid values in custom control put()
    22f6c68b4927 hwmon: (f71882fg) Fix negative temperature
    208200e573bd gfs2: Fix filesystem block deallocation for short writes
    42daae7d845c net: sfc: ef10: fix memory leak in efx_ef10_mtd_probe()
    e038c457bd12 net/smc: non blocking recvmsg() return -EAGAIN when no data and signal_pending
    2ec2dd7d51a9 net/sched: act_pedit: really ensure the skb is writable
    48c6a40e2f25 s390/lcs: fix variable dereferenced before check
    467ddbbe7e74 s390/ctcm: fix potential memory leak
    2cbce0110070 s390/ctcm: fix variable dereferenced before check
    1c40e85d0aa0 hwmon: (ltq-cputemp) restrict it to SOC_XWAY
    0a778db9319f dim: initialize all struct fields
    522986cc39c1 mac80211_hwsim: call ieee80211_tx_prepare_skb under RCU protection
    0729594cb788 netlink: do not reset transport header in netlink_recvmsg()
    33ce32587c44 drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()
    5809a1c53049 ipv4: drop dst in multicast routing path
    c9d75e87f45b net: Fix features skip in for_each_netdev_feature()
    5c9057670504 mac80211: Reset MBSSID parameters upon connection
    cfe74fd41f18 hwmon: (tmp401) Add OF device ID table
    3915341a935f batman-adv: Don't skb_split skbuffs with frag_list
    90659487578c Linux 5.4.194
    2f4e0bf651e3 mm: userfaultfd: fix missing cache flush in mcopy_atomic_pte() and __mcopy_atomic()
    e4db0c3ce0c5 mm: hugetlb: fix missing cache flush in copy_huge_page_from_user()
    ea9cad1c5d95 mm: fix missing cache flush for all tail pages of compound page
    45c05171d6e3 Bluetooth: Fix the creation of hdev->name
    f52c4c067aa5 KVM: x86/svm: Account for family 17h event renumberings in amd_pmc_perf_hw_id
    c1bdf1e6e706 x86: kprobes: Prohibit probing on instruction which has emulate prefix
    6af6427a9600 x86: xen: insn: Decode Xen and KVM emulate-prefix signature
    c67a4a91f5e1 x86: xen: kvm: Gather the definition of emulate prefixes
    4c39e1ace3dc x86/asm: Allow to pass macros to __ASM_FORM()
    29afcd5af012 KVM: x86/pmu: Refactoring find_arch_event() to pmc_perf_hw_id()
    ea65a7d76c00 arm: remove CONFIG_ARCH_HAS_HOLES_MEMORYMODEL
    5755f946a89f can: grcan: only use the NAPI poll budget for RX
    caba5c13a892 can: grcan: grcan_probe(): fix broken system id check for errata workaround needs
    76b64c690f03 nfp: bpf: silence bitwise vs. logical OR warning
    86ccefb83ede drm/i915: Cast remain to unsigned long in eb_relocate_vma
    de542bd76541 drm/amd/display/dc/gpio/gpio_service: Pass around correct dce_{version, environment} types
    e6ff94d31c53 block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit
    f668da98ad83 MIPS: Use address-of operator on section symbols
    01565c91b789 Linux 5.4.193
    8a7f92053dc9 mmc: rtsx: add 74 Clocks in power on flow
    d789b9891761 PCI: aardvark: Fix reading MSI interrupt number
    253bc43ca5b7 PCI: aardvark: Clear all MSIs at setup
    786dc86c8434 dm: interlock pending dm_io and dm_wait_for_bios_completion
    ad1393b92e50 dm: fix mempool NULL pointer race when completing IO
    40bcd39a0093 tcp: make sure treq->af_specific is initialized
    9661bf674d6a ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock
    37b12c16beb6 ALSA: pcm: Fix races among concurrent prealloc proc writes
    2a559eec81ac ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
    08d1807f097a ALSA: pcm: Fix races among concurrent read/write and buffer changes
    fbeb492694ce ALSA: pcm: Fix races among concurrent hw_params and hw_free calls
    f098f8b9820f mm: fix unexpected zeroed page mapping with zram swap
    c7337efd1d11 block-map: add __GFP_ZERO flag for alloc_page in function bio_copy_kern
    9588ac2eddc2 net: ipv6: ensure we call ipv6_mc_down() at most once
    367b49086b41 KVM: LAPIC: Enable timer posted-interrupt only when mwait/hlt is advertised
    c2fadf2d0ab4 x86/kvm: Preserve BSP MSR_KVM_POLL_CONTROL across suspend/resume
    8b78939f4b0b kvm: x86/cpuid: Only provide CPUID leaf 0xA if host has architectural PMU
    f455c8e657e3 NFSv4: Don't invalidate inode attributes on delegation return
    89e7a625ec5c drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
    1d14c1c7a3bd net: igmp: respect RCU rules in ip_mc_source() and ip_mc_msfilter()
    2b99ff4c3e3e btrfs: always log symlinks in full mode
    dc4784489426 smsc911x: allow using IRQ0
    cff6cb162f7a bnxt_en: Fix possible bnxt_open() failure caused by wrong RFS flag
    64ece01adb42 selftests: mirror_gre_bridge_1q: Avoid changing PVID while interface is operational
    52401926c863 net: emaclite: Add error handling for of_address_to_resource()
    354cac1e392b net: stmmac: dwmac-sun8i: add missing of_node_put() in sun8i_dwmac_register_mdio_mux()
    0510b6ccfb4f net: ethernet: mediatek: add missing of_node_put() in mtk_sgmii_init()
    102986592ffd RDMA/siw: Fix a condition race issue in MPA request processing
    e6ae21eb948a ASoC: dmaengine: Restore NULL prepare_slave_config() callback
    df3ea6cc1af5 hwmon: (adt7470) Fix warning on module removal
    01d4363dd717 NFC: netlink: fix sleep in atomic bug when firmware download timeout
    33d3e76fc7a7 nfc: nfcmrvl: main: reorder destructive operations in nfcmrvl_nci_unregister_dev to avoid bugs
    85aecdef77f9 nfc: replace improper check device_is_registered() in netlink related functions
    da9eb43b9a56 can: grcan: use ofdev->dev when allocating DMA memory
    8b451b7d7e95 can: grcan: grcan_close(): fix deadlock
    8f4246450a95 s390/dasd: Fix read inconsistency for ESE DASD devices
    91193a2c2f4f s390/dasd: Fix read for ESE with blksize < 4k
    1aa75808edd8 s390/dasd: prevent double format of tracks for ESE devices
    061a424dd1c4 s390/dasd: fix data corruption for ESE devices
    860db6cdc5be ASoC: meson: Fix event generation for G12A tohdmi mux
    d4864e8c4ba8 ASoC: wm8958: Fix change notifications for DSP controls
    6723ab2ed8bb ASoC: da7219: Fix change notifications for tone generator frequency
    ac5894fb8626 genirq: Synchronize interrupt thread startup
    8624e2c5af95 ACPICA: Always create namespace nodes using acpi_ns_create_node()
    27183539cfac firewire: core: extend card->lock in fw_core_handle_bus_reset
    2fefc6259861 firewire: remove check of list iterator against head past the loop body
    34b9b9182911 firewire: fix potential uaf in outbound_phy_packet_callback()
    f6b6e9336936 Revert "SUNRPC: attempt AF_LOCAL connect on setup"
    d403ff32e566 gpiolib: of: fix bounds check for 'gpio-reserved-ranges'
    94842485b4ec ALSA: fireworks: fix wrong return count shorter than expected by 4 bytes
    73ce49fa59a7 parisc: Merge model and model name into one line in /proc/cpuinfo
    0d5bb59858c6 MIPS: Fix CP0 counter erratum detection for R4k CPUs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bf5359d120..0ef18c0b77 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "24d323fa0e17bcd62c9cfe1fd4153c304a06f38c"
-SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
+SRCREV_machine ?= "5a2ea5a1decb40650f6e447af2dc02579b3a5521"
+SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.192"
+LINUX_VERSION ?= "5.4.196"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index dee636aca5..9b41d280a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.192"
+LINUX_VERSION ?= "5.4.196"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "460de085c07ab1a221317e6804c13657456c5368"
-SRCREV_machine ?= "b414a2fc5ce5f68c33d297d9cde4fef5437b773b"
-SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
+SRCREV_machine_qemuarm ?= "bae8f843b4f6520a8deb813616669951a5bf58ca"
+SRCREV_machine ?= "4e04a0f737355772b02dd4225e3b579204ce41c0"
+SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 680f40d208..11e7ff6a21 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "68a2ce69aaf2e8d96eef4aaccd70fc0ef7368a46"
-SRCREV_machine_qemuarm64 ?= "acfed0930d37a714d705645ff7cfbfbd0ad040e7"
-SRCREV_machine_qemumips ?= "e7046a2c8972e925cd2e6ac7f392abe87cbec5f5"
-SRCREV_machine_qemuppc ?= "997e06e0af674c27627eaa76a60b2f63cb16f38d"
-SRCREV_machine_qemuriscv64 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
-SRCREV_machine_qemux86 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
-SRCREV_machine_qemux86-64 ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
-SRCREV_machine_qemumips64 ?= "7b526cde12d78604b6f1e1ad62da31dcb729f35f"
-SRCREV_machine ?= "85f0668fea1442bbcc2c8b1509d9f711b4b73649"
-SRCREV_meta ?= "3fecb08507e286d1458497faaf31d1a07cc7d373"
+SRCREV_machine_qemuarm ?= "7efd457b777ad4b9029594f2770c5f9e3cc6b88e"
+SRCREV_machine_qemuarm64 ?= "4416c0026b35a6d2c9b03e27bfdbb9cb08cf84d2"
+SRCREV_machine_qemumips ?= "7d4e3a8bdcdae2e56640db0d4a739000665ad0cf"
+SRCREV_machine_qemuppc ?= "f0ed4149f804120d6c4b7fd5b9fb49287136b4d5"
+SRCREV_machine_qemuriscv64 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
+SRCREV_machine_qemux86 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
+SRCREV_machine_qemux86-64 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
+SRCREV_machine_qemumips64 ?= "14c090645b3e8c432dc1de659189af76d7fc7825"
+SRCREV_machine ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
+SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.192"
+LINUX_VERSION ?= "5.4.196"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


