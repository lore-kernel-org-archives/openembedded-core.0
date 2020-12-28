Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.4073.1609193774759140891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MFpQivX/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id t6so6271553plq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RH5twk/3r6Jh+7xiyjhBwNJkC+9ajVK0IICpqetPskA=;
        b=MFpQivX/WoQ8j6wNNmAzYj6Ax8rrDz+NIXFqw3tpurHbtJ4ASGsrAO8h1/yaFoICIZ
         tFApzYVnQ24aVMn21coSSfwGSarzIfxipgx+uTZeV6EOZmU7n6wje+/Rnan/GdbA5eWc
         JSPTc4lIUO/JfTa7s405YurkvmpUv1wszpHKeW+QS5cXY9Wphmql+vokHxOX5pg5j9Rj
         IwfcFP0W/n/Gh6AZZJGlZgc7lUwU5ll77pDuxpdBXTeHLgzVvazQCjHBvPGFyFQ/jiN/
         Vnuem4lwupfavHENhlB5yl/wXdLvKItNl1IdMbZ3ArsYEEmGSvBO1jqR/drleo6ExauZ
         rrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RH5twk/3r6Jh+7xiyjhBwNJkC+9ajVK0IICpqetPskA=;
        b=MNZGzSY4aqL8PqI5O0nOaG0fHjyVNwbNlmzH3haeOw1hS/hnFN19GP9D8X3Q+ABYnS
         rO/E4ymeE/AH29L0KzVTw3R5SSY3AEE7tPlDWxUCnbm6d5XKHu6XtStph8ZtDrWZEhGJ
         OXCb5+Hjohb9dmy9JylfoOflKLutPYXzy/0H/CJXFBq6B5/+HIqEDr6i2gBw8za/CidK
         ToPzSeYo35+WBtNMDD9RGwQkAuWQB/29WRyG4yoaNyVuRifgWuXXxrZ4SSqP+FrzW4wg
         o8V63xor75aF6Cvlyt9k565aONDZrbUUk6hKYJ3OMWiG3921uipHxUnpwNOCOY/dcINI
         LPeA==
X-Gm-Message-State: AOAM532Q9f2P1TrSUkMCp91qksSzcqoC7bdUP0IvXZV6eg/XFWGfQ5sB
	XzrYzkRr8tq2+ewXPwIYlimMMLzaJaX1zLMnSHE=
X-Google-Smtp-Source: ABdhPJyvhtByBWxsQBrIuMATtHZu1NvmsGRWjGFT+Z620AZz7iP3QDCoW4BhZpVGXvF7ZiSbFFso2A==
X-Received: by 2002:a17:902:aa84:b029:da:f114:6022 with SMTP id d4-20020a170902aa84b02900daf1146022mr45856520plr.46.1609193773694;
        Mon, 28 Dec 2020 14:16:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/17] linux-yocto/5.4: update to v5.4.80
Date: Mon, 28 Dec 2020 12:15:39 -1000
Message-Id: <3c67ecc61f7f1543b1a3325ea4372d67cc1b4490.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    9f4b26f3ea18 Linux 5.4.80
    a88f08e78249 sched/fair: Fix overutilized update in enqueue_task_fair()
    10ca291c7749 mm, page_alloc: skip ->waternark_boost for atomic order-0 allocations
    a2761473d50b mm/userfaultfd: do not access vma->vm_mm after calling handle_userfault()
    173e37322307 mm: memcg/slab: fix root memcg vmstats
    fc82fd7f7df9 x86/microcode/intel: Check patch signature before saving microcode for early loading
    09652ebd0dc1 seccomp: Set PF_SUPERPRIV when checking capability
    fa9ccc177754 ptrace: Set PF_SUPERPRIV when checking capability
    d51481382c74 mmc: sdhci-pci: Prefer SDR25 timing for High Speed mode for BYT-based Intel controllers
    5b738014dadc drm/i915: Handle max_bpc==16
    51cc709ed961 drm/amd/display: Add missing pflip irq for dcn2.0
    1c1add911fd9 Drivers: hv: vmbus: Allow cleanup of VMBUS_CONNECT_CPU if disconnected
    7411c05a6eea s390/dasd: fix null pointer dereference for ERP requests
    e6e76a26fdc8 s390/cpum_sf.c: fix file permission for cpum_sfb_size
    89d73a97af5c mac80211: free sta in sta_info_insert_finish() on errors
    945c10ad59ca mac80211: minstrel: fix tx status processing corner case
    336c331ef01e mac80211: minstrel: remove deferred sampling code
    713f903dc4b5 xtensa: disable preemption around cache alias management calls
    747467f3625b xtensa: fix TLBTEMP area placement
    e7ea18de9bb3 regulator: workaround self-referent regulators
    0d233d5766eb regulator: avoid resolve_supply() infinite recursion
    65205dfe78ff regulator: fix memory leak with repeated set_machine_constraints()
    4cab55d65974 regulator: pfuze100: limit pfuze-support-disable-sw to pfuze{100,200}
    53a9502d9a69 spi: bcm2835aux: Fix use-after-free on unbind
    2737549129ec spi: npcm-fiu: Don't leak SPI master in probe error path
    3e04a4976add spi: Introduce device-managed SPI controller allocation
    11bb6ae21c81 spi: lpspi: Fix use-after-free on unbind
    760d4e3ee879 iio: adc: mediatek: fix unset field
    d3e27c62334e iio: accel: kxcjk1013: Add support for KIOX010A ACPI DSM for setting tablet-mode
    9f99cc38cf1a iio: accel: kxcjk1013: Replace is_smo8500_device with an acpi_type enum
    308a06ac9fb8 ext4: fix bogus warning in ext4_update_dx_flag()
    7f76c608135e iio: light: fix kconfig dependency bug for VCNL4035
    2ba693eea318 staging: rtl8723bs: Add 024c:0627 to the list of SDIO device-ids
    f59ef9ec20ac efivarfs: fix memory leak in efivarfs_create()
    d73d0106e354 HID: logitech-dj: Fix an error in mse_bluetooth_descriptor
    772ff2c77cce tty: serial: imx: keep console clocks always on
    663f70f1f5e7 tty: serial: imx: fix potential deadlock
    a3ac3d213572 ALSA: hda/realtek: Add some Clove SSID in the ALC293(ALC1220)
    659f6731bcf4 ALSA: hda/realtek - Add supported for Lenovo ThinkPad Headset Button
    c70c1b93f3d1 ALSA: mixart: Fix mutex deadlock
    b9a69e5d0b37 ALSA: ctl: fix error path at adding user-defined element set
    16a5e3748d86 ALSA: usb-audio: Add delay quirk for all Logitech USB devices
    090ac65f8c7c ALSA: firewire: Clean up a locking issue in copy_resp_to_buf()
    3b78db264675 speakup: Do not let the line discipline be used several times
    0da75d37d199 HID: logitech-dj: Fix Dinovo Mini when paired with a MX5x00 receiver
    4e23e329ec17 HID: logitech-dj: Handle quad/bluetooth keyboards with a builtin trackpad
    770a55072f12 HID: logitech-hidpp: Add PID for MX Anywhere 2
    8a411bb0d73f libfs: fix error cast of negative value in simple_attr_write()
    9d1b5a8c720e efi/x86: Free efi_pgd with free_pages()
    95fafa1cb7a5 bpf, sockmap: Avoid returning unneeded EAGAIN when redirecting to self
    a9f3670728a0 bpf, sockmap: Use truesize with sk_rmem_schedule()
    e8b1de6975db bpf, sockmap: On receive programs try to fast track SK_PASS ingress
    329c84430a64 bpf, sockmap: Skb verdict SK_PASS to self already checked rmem limits
    4983ffd34ffc xfs: revert "xfs: fix rmap key and record comparison functions"
    989d275ac592 fail_function: Remove a redundant mutex unlock
    b9589cb07932 regulator: ti-abb: Fix array out of bound read access on the first transition
    ad3c4c96bfb7 xfs: return corresponding errcode if xfs_initialize_perag() fail
    738ec7670624 xfs: strengthen rmap record flags checking
    388ca4a37dcd xfs: fix the minrecs logic when dealing with inode root child blocks
    56588c1fdd19 can: m_can: process interrupt only when not runtime suspended
    a3c94201e0a7 can: flexcan: flexcan_chip_start(): fix erroneous flexcan_transceiver_enable() during bus-off recovery
    58f1657c3a58 iommu/vt-d: Avoid panic if iommu init fails in tboot system
    964b02d50bab iommu/vt-d: Move intel_iommu_gfx_mapped to Intel IOMMU header
    6d184f851182 can: kvaser_usb: kvaser_usb_hydra: Fix KCAN bittiming limits
    987bd7901ae3 can: kvaser_pciefd: Fix KCAN bittiming limits
    9df3884a4d6a bpf, sockmap: Ensure SO_RCVBUF memory is observed on ingress redirect
    58f45daa2d0a bpf, sockmap: Fix partial copy_page_to_iter so progress can still be made
    401afa5f5e5e net/mlx5: E-Switch, Fail mlx5_esw_modify_vport_rate if qos disabled
    a5a1db757da1 drm/sun4i: dw-hdmi: fix error return code in sun8i_dw_hdmi_bind()
    5e7f422c3810 MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu
    cb5ad04eeeb6 selftests/bpf: Fix error return code in run_getsockopt_test()
    32ebbc84697b ASoC: qcom: lpass-platform: Fix memory leak
    24ce39bf0aa2 can: m_can: m_can_stop(): set device to software init mode before closing
    db2f5579e725 can: m_can: m_can_class_free_dev(): introduce new function
    9b0596c07da8 can: m_can: m_can_handle_state_change(): fix state change
    69851481b342 can: tcan4x5x: tcan4x5x_can_remove(): fix order of deregistration
    d527bb8bd577 can: tcan4x5x: tcan4x5x_can_probe(): add missing error checking for devm_regmap_init()
    84089205dbd2 can: tcan4x5x: replace depends on REGMAP_SPI with depends on SPI
    f0c8508bf874 can: flexcan: fix failure handling of pm_runtime_get_sync()
    73788e8c3b02 can: peak_usb: fix potential integer overflow on shift of a int
    4a6891e169df can: mcba_usb: mcba_usb_start_xmit(): first fill skb, then pass to can_put_echo_skb()
    85c48dcd8735 can: ti_hecc: Fix memleak in ti_hecc_probe
    85854e4e552e can: dev: can_restart(): post buffer from the right context
    247b03eca2fd can: af_can: prevent potential access of uninitialized member in canfd_rcv()
    5970c08eed35 can: af_can: prevent potential access of uninitialized member in can_rcv()
    ef097e93aca2 ip_tunnels: Set tunnel option flag when tunnel metadata is present
    f5d6b6c2e993 tools, bpftool: Add missing close before bpftool net attach exit
    6eadbc3b7ab7 perf lock: Don't free "lock_seq_stat" if read_count isn't zero
    4c954fe28af1 RMDA/sw: Don't allow drivers using dma_virt_ops on highmem configs
    1a358c4e9bb2 RDMA/pvrdma: Fix missing kfree() in pvrdma_register_device()
    1b1ddde970de rfkill: Fix use-after-free in rfkill_resume()
    6490ecdee551 Input: resistive-adc-touch - fix kconfig dependency on IIO_BUFFER
    9a4b4a06addf ARM: dts: imx50-evk: Fix the chip select 1 IOMUX
    58e4f34f52a4 arm64: dts: imx8mm: fix voltage for 1.6GHz CPU operating point
    fd278c6359ac swiotlb: using SIZE_MAX needs limits.h included
    cfee2333791a arm: dts: imx6qdl-udoo: fix rgmii phy-mode for ksz9031 phy
    a8d6ae10e9fc arm64: dts imx8mn: Remove non-existent USB OTG2
    b94479198240 arm64: dts: allwinner: h5: OrangePi Prime: Fix ethernet node
    cab227c19cd1 MIPS: export has_transparent_hugepage() for modules
    93f23689129f Input: adxl34x - clean up a data type in adxl34x_probe()
    29dea2b91871 arm64: dts: allwinner: a64: bananapi-m64: Enable RGMII RX/TX delay on PHY
    794a13015fb6 ARM: dts: sunxi: bananapi-m2-plus: Enable RGMII RX/TX delay on Ethernet PHY
    c6e7f6bdcbaa ARM: dts: sun9i: Enable both RGMII RX/TX delay on Ethernet PHY
    6cb50545fe31 ARM: dts: sun8i: a83t: Enable both RGMII RX/TX delay on Ethernet PHY
    cecaad1d3f48 ARM: dts: sun8i: h3: orangepi-plus2e: Enable RGMII RX/TX delay on Ethernet PHY
    ec268dd970a5 ARM: dts: sun7i: bananapi-m1-plus: Enable RGMII RX/TX delay on Ethernet PHY
    303691562f8f ARM: dts: sun7i: cubietruck: Enable RGMII RX/TX delay on Ethernet PHY
    b55bc15117d6 ARM: dts: sun6i: a31-hummingbird: Enable RGMII RX/TX delay on Ethernet PHY
    260ceb0c4aa6 Revert "arm: sun8i: orangepi-pc-plus: Set EMAC activity LEDs to active high"
    1446255d8600 ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix ethernet node
    31c4a413971b arm64: dts: allwinner: h5: OrangePi PC2: Fix ethernet node
    345d06f5853f arm64: dts: allwinner: a64: Pine64 Plus: Fix ethernet node
    96bde11bf2b2 arm64: dts: allwinner: a64: OrangePi Win: Fix ethernet node
    ba6ebc22844d arm64: dts: allwinner: Pine H64: Enable both RGMII RX/TX delay
    79de663dcb11 arm64: dts: allwinner: beelink-gs1: Enable both RGMII RX/TX delay
    8afc6e00a1d1 hwmon: (pwm-fan) Fix RPM calculation
    e240b4326887 gfs2: fix possible reference leak in gfs2_check_blk_type
    195f9e1a5457 vfs: remove lockdep bogosity in __sb_start_write
    54d11983c29c arm64: smp: Tell RCU about CPUs that fail to come online
    e8df8c25aa05 arm64: psci: Avoid printing in cpu_psci_cpu_die()
    71eea3d3df94 arm64: errata: Fix handling of 1418040 with late CPU onlining
    e6f6e52acb96 ACPI: button: Add DMI quirk for Medion Akoya E2228T
    58ced3741789 selftests: kvm: Fix the segment descriptor layout to match the actual layout
    8ebc41496f6e scsi: ufs: Fix unbalanced scsi_block_reqs_cnt caused by ufshcd_hold()
    e06dfd53a42a pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
    9865a26c9620 net: ftgmac100: Fix crash when removing driver
    3f0ccca2729b net/ncsi: Fix netlink registration
    9a1ac76ab15e net: usb: qmi_wwan: Set DTR quirk for MR400
    7204f0be5b5e net/mlx5: Disable QoS when min_rates on all VFs are zero
    3f9f112a6329 net/mlx5: Add handling of port type in rule deletion
    3d6c81f9c96c tcp: only postpone PROBE_RTT if RTT is < current min_rtt estimate
    04b7fd7609b3 sctp: change to hold/put transport for proto_unreach_timer
    31790683293b qlcnic: fix error return code in qlcnic_83xx_restart_hw()
    5241fa6e7acd qed: fix error return code in qed_iwarp_ll2_start()
    f8e5578dcaa7 page_frag: Recover from memory pressure
    f6f751cb315c net: x25: Increase refcnt of "struct x25_neigh" in x25_rx_call_request
    9ecfcf48d735 net/tls: fix corrupted data in recvmsg
    9e909956d0c7 net/smc: fix direct access to ib_gid_addr->ndev in smc_ib_determine_gid()
    ab1e4b3c406b net: qualcomm: rmnet: Fix incorrect receive packet handling during cleanup
    782a503a369c net/mlx4_core: Fix init_hca fields offset
    75b2b0d38068 net: lantiq: Wait for the GPHY firmware to be ready
    65a596ec63aa netlabel: fix an uninitialized warning in netlbl_unlabel_staticlist()
    d9704891f531 netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
    99ddc3211653 net: Have netpoll bring-up DSA management interface
    bd17af3cf314 net: ethernet: ti: cpsw: fix error return code in cpsw_probe()
    27e9ca6c82a0 net: dsa: mv88e6xxx: Avoid VTU corruption on 6097
    805dfdb26e54 net: bridge: add missing counters to ndo_get_stats64 callback
    fa03d6177be7 net: b44: fix error return code in b44_init_one()
    78b9c4a8e338 mlxsw: core: Use variable timeout for EMAD retries
    c35a7de217ce lan743x: prevent entire kernel HANG on open, for some platforms
    5c7a00aa05d6 lan743x: fix issue causing intermittent kernel log warnings
    88a5a3e1530c ipv6: Fix error path to cancel the meseage
    0e8b0213dc60 inet_diag: Fix error path to cancel the meseage in inet_req_diag_fill()
    e5fe052c065d Exempt multicast addresses from five-second neighbor lifetime
    2894a07110c6 devlink: Add missing genlmsg_cancel() in devlink_nl_sb_port_pool_fill()
    bedb089dcbf7 bnxt_en: read EEPROM A2h address using page 0
    362bd03af589 atm: nicstar: Unmap DMA on send error
    b2f95ff764c0 ah6: fix error return code in ah6_input()
    fc8334619167 Linux 5.4.79
    26c7d2883851 ACPI: GED: fix -Wformat
    087c857e0131 KVM: x86: clflushopt should be treated as a no-op by emulation
    7ae6f2df438d can: proc: can_remove_proc(): silence remove_proc_entry warning
    1527ab7859b2 mac80211: always wind down STA state
    df3305411447 Input: sunkbd - avoid use-after-free in teardown paths
    cd61f14592df net: lantiq: Add locking for TX DMA channel
    8cad37eb129f powerpc/8xx: Always fault when _PAGE_ACCESSED is not set
    b57c75956e79 net/mlx5: Add retry mechanism to the command entry index allocation
    7db82a5a4c15 net/mlx5: Fix a race when moving command interface to events mode
    3fa9daaccce8 net/mlx5: poll cmd EQ in case of command timeout
    42bb7b7b9654 net/mlx5: Use async EQ setup cleanup helpers for multiple EQs
    b33905dc1ce5 MIPS: PCI: Fix MIPS build
    01474e8cc342 selftests/powerpc: entry flush test
    eb37345ed224 powerpc: Only include kup-radix.h for 64-bit Book3S
    09495b5f7aab powerpc/64s: flush L1D after user accesses
    b65458b6be80 powerpc/64s: flush L1D on kernel entry
    bcf7f2d3fcec selftests/powerpc: rfi_flush: disable entry flush if present

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f752768d997dad99d518208c1540656b9162d2f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d726603caf..446650e823 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "375e7ee20260d4448761605ae55b5cc50e38d516"
-SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
+SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
+SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.78"
+LINUX_VERSION ?= "5.4.80"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index d8784c49ad..33ca5856a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.78"
+LINUX_VERSION ?= "5.4.80"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "6cf3b1d30bc7ac9bd86190129b3cbbdd04b8b236"
-SRCREV_machine ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
+SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
+SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0bf226215e..3334c02a95 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b3bafed66cf1be24caaa9c876d7d9a8298df831b"
-SRCREV_machine_qemuarm64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_machine_qemumips ?= "36c2a0b1caef0b2dd6b5777d1939c383238536a8"
-SRCREV_machine_qemuppc ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_machine_qemuriscv64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_machine_qemux86 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_machine_qemux86-64 ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_machine_qemumips64 ?= "971a3cedf9a2a7774fa072b9a13380fb59fd605b"
-SRCREV_machine ?= "370ef947d5b1470e858bae5a300110566c994b9f"
-SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
+SRCREV_machine_qemuarm ?= "9c4e95c4439a84d2472404af630659ee3ac880e8"
+SRCREV_machine_qemuarm64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_machine_qemumips ?= "07747fd48470e60ea2323df735795d9d44b74edc"
+SRCREV_machine_qemuppc ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_machine_qemuriscv64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
+SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
+SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.78"
+LINUX_VERSION ?= "5.4.80"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

