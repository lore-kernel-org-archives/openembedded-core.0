Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.35250.1612792444994290426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1N7IZySJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id t25so14238321otc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YbVJwwwbjNecrYPaj6JDfud+kdXsm3r/0DT7WTAWiAs=;
        b=1N7IZySJ+NDtj4TZi57ds1na0qyP2VuA2BsCUkb3bdGTyMW0thVmAzH9FqCBreCD1B
         HVx2GPcEl170+8R8akMxaN3JVH7hw1LsLId5u5QPocBxKYZk5Mly0yYh2VX+Y649Mczt
         XdLfTi+1e8xGOJANJQWVwB/l1RT24WrA8O5UVJso3i8SpC5MgAeh36AHEH97rdTwV+AG
         iTqJm8kmXy6RFZ3AlLIjaJSmlkzDY2bR+UX7zPCwieO3joUyAyzkKwbYWT8pXRjjhezM
         HExFLA8DX9PIm8ftDWkr9fFlqM4bTuQddUAk4IuKQaUpZoSA53ezZwRsEvZ9aXz5eujj
         a1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YbVJwwwbjNecrYPaj6JDfud+kdXsm3r/0DT7WTAWiAs=;
        b=Ha40IUqzh/gyQvq/C1RShwGIPoQVxmlp27IsC3sB/9rCxpJnLhl3CHaNHDAma6SCL1
         RKMCRXcVNPV+WP3BdooAcQalxffnjbkn4HcBXiuav9+gTkkBU+YzP+PF/7sIlyYstxy1
         2Cljiaz9yFNzARML6KiK1aD9CQc/sdR5fFMLT/zFkuB+NhOWkFuNDycWF8YkbL/DaEp7
         CxC1n92W758KqiTAs9V/ZEimPWK2vT+os4mFlwrseD1Ev53jCRs3nTat9LgxPXOShiLL
         dQYoaxFvy+pAlNM/KFcKIC0QwJfK3yFwzCIWn3eH8dE62nI0Q4dOLGjZ/cp1Q2kFgJti
         jq2Q==
X-Gm-Message-State: AOAM5319/o32EHK3NPqs/cR3Cadnws1kAjfRbHHkXmvKM4dT8pl6d6Lc
	36bvYUifs4hQt9bIyXJzMDEKfACxVdyxoHzFNtk=
X-Google-Smtp-Source: ABdhPJznj91dhfOZ9tWSYXrrpOZf/GiHqAL7Y/VPsM2CobL7DBUMe0e+s2ELCDHTnKxlThaFZ8Dv6g==
X-Received: by 2002:a9d:866:: with SMTP id 93mr12700755oty.365.1612792443591;
        Mon, 08 Feb 2021 05:54:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:54:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/28] linux-yocto/5.4: update to v5.4.90
Date: Mon,  8 Feb 2021 03:52:04 -1000
Message-Id: <48a11c214ff9aa6700ef289b200079c07c41b1b0.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ceed81a883dc Linux 5.4.90
    6f484096196b regmap: debugfs: Fix a reversed if statement in regmap_debugfs_init()
    bbb2fee395e9 net: drop bogus skb with CHECKSUM_PARTIAL and offset beyond end of trimmed packet
    bd0051a5cb05 block: fix use-after-free in disk_part_iter_next
    c5fe50e18fcb KVM: arm64: Don't access PMCR_EL0 when no PMU is available
    f595e44b161a net: mvpp2: disable force link UP during port init procedure
    5b8d3c3a9fcb regulator: qcom-rpmh-regulator: correct hfsmps515 definition
    3582406b9c04 wan: ds26522: select CONFIG_BITREVERSE
    480c5e9c7e4c regmap: debugfs: Fix a memory leak when calling regmap_attach_dev
    c3c774886790 net/mlx5e: Fix two double free cases
    ce74b5a0689d net/mlx5e: Fix memleak in mlx5e_create_l2_table_groups
    a2b2ae3812e5 bpftool: Fix compilation failure for net.o with older glibc
    2992e3371a3a iommu/intel: Fix memleak in intel_irq_remapping_alloc
    006319327d21 lightnvm: select CONFIG_CRC32
    46c15eeb0a8a block: rsxx: select CONFIG_CRC32
    4834a984e456 wil6210: select CONFIG_CRC32
    b28378bc91d0 qed: select CONFIG_CRC32
    cc196d4604c9 dmaengine: xilinx_dma: fix mixed_enum_type coverity warning
    d0eaf8a8eff8 dmaengine: xilinx_dma: fix incompatible param warning in _child_probe()
    e6f247a5f927 dmaengine: xilinx_dma: check dma_async_device_register return value
    c15556cb344a dmaengine: mediatek: mtk-hsdma: Fix a resource leak in the error handling path of the probe function
    55503711adff i2c: i801: Fix the i2c-mux gpiod_lookup_table not being properly terminated
    12e8bcaef61a spi: stm32: FIFO threshold level - fix align packet size
    9ff4796e6fd9 cpufreq: powernow-k8: pass policy rather than use cpufreq_cpu_get()
    4dd15f9bc881 can: kvaser_pciefd: select CONFIG_CRC32
    82adac5ad13b can: m_can: m_can_class_unregister(): remove erroneous m_can_clk_stop()
    3b68980596fb can: tcan4x5x: fix bittiming const, use common bittiming from m_can driver
    b77e0283efdc dmaengine: dw-edma: Fix use after free in dw_edma_alloc_chunk()
    f6dd8c259ab8 i2c: sprd: use a specific timeout to avoid system hang up issue
    8d0cadc2ea64 ARM: OMAP2+: omap_device: fix idling of devices during probe
    003280bd8845 HID: wacom: Fix memory leakage caused by kfifo_alloc
    6f367fb1b7ee iio: imu: st_lsm6dsx: fix edge-trigger interrupts
    87ea51c90280 vmlinux.lds.h: Add PGO and AutoFDO input sections
    099340d3e758 exfat: Month timestamp metadata accidentally incremented
    bb039d45ebc5 x86/resctrl: Don't move a task to the same resource group
    628af07fc5cd x86/resctrl: Use an IPI instead of task_work_add() to update PQR_ASSOC MSR
    96fb3d28c885 chtls: Fix chtls resources release sequence
    fac9b53cfacb chtls: Added a check to avoid NULL pointer dereference
    38768ea1127d chtls: Replace skb_dequeue with skb_peek
    dcce456b2843 chtls: Fix panic when route to peer not configured
    44bed66b2be9 chtls: Remove invalid set_tcb call
    266ee00f402b chtls: Fix hardware tid leak
    ed62af62da41 net/mlx5e: ethtool, Fix restriction of autoneg with 56G
    cf59803ce4b3 net/mlx5: Use port_num 1 instead of 0 when delete a RoCE address
    3008c639c081 net: dsa: lantiq_gswip: Exclude RMII from modes that report 1 GbE
    fc1c907da5a1 s390/qeth: fix L2 header access in qeth_l3_osa_features_check()
    e6931e3eb084 nexthop: Unlink nexthop group entry in error path
    3cecab93f271 nexthop: Fix off-by-one error in error path
    f03b81e61ef5 octeontx2-af: fix memory leak of lmac and lmac->name
    12e10b12124c net: ip: always refragment ip defragmented packets
    41bfd4111257 net: fix pmtu check in nopmtudisc mode
    98fc9692ac3d tools: selftests: add test for changing routes with PTMU exceptions
    7694654168bb net: ipv6: fib: flush exceptions when purging route
    1cba7e270b16 net/sonic: Fix some resource leaks in error handling paths
    37e6368a8de6 net: vlan: avoid leaks on register_vlan_dev() failures
    4ff0737ebc76 net: stmmac: dwmac-sun8i: Balance internal PHY power
    5698f0921c9b net: stmmac: dwmac-sun8i: Balance internal PHY resource references
    fa020a28896c net: hns3: fix a phy loopback fail issue
    bddaf51d116c net: hns3: fix the number of queues actually used by ARQ
    d73f7e757526 net: cdc_ncm: correct overhead in delayed_ndp_size
    5597557244d4 vfio iommu: Add dma available capability
    335104082c21 x86/asm/32: Add ENDs to some functions and relabel with SYM_CODE_*
    a829146c3fdc Linux 5.4.89
    485e21729b1e scsi: target: Fix XCOPY NAA identifier lookup
    7795afa0d7a9 KVM: x86: fix shift out of bounds reported by UBSAN
    a9d49da7edf8 x86/mtrr: Correct the range check before performing MTRR type lookups
    a798b367a066 netfilter: nft_dynset: report EOPNOTSUPP on missing set feature
    5e401ea71676 netfilter: xt_RATEEST: reject non-null terminated string from userspace
    1dd6a790c220 netfilter: ipset: fix shift-out-of-bounds in htable_bits()
    e0281bb5a82d netfilter: x_tables: Update remaining dereference to RCU
    828f2a20f946 drm/i915: clear the gpu reloc batch
    ef8133b1b47e dmabuf: fix use-after-free of dmabuf's file->f_inode
    284be2b993ca Revert "device property: Keep secondary firmware node secondary by type"
    64d06c7f2fa2 btrfs: send: fix wrong file path when there is an inode with a pending rmdir
    0cb0b876f17f ALSA: hda/realtek: Add two "Intel Reference board" SSID in the ALC256.
    02e59692a6b1 ALSA: hda/realtek: Enable mute and micmute LED on HP EliteBook 850 G7
    d63a96f45c4f ALSA: hda/realtek - Fix speaker volume control on Lenovo C940
    30fd9778cf8f ALSA: hda/conexant: add a new hda codec CX11970
    121944484cc4 ALSA: hda/via: Fix runtime PM for Clevo W35xSS
    a5c7a456680f kvm: check tlbs_dirty directly
    10dcb79ec79e x86/mm: Fix leak of pmd ptlock
    d3e5db486fd8 USB: serial: keyspan_pda: remove unused variable
    bcffe2de9dde usb: gadget: configfs: Fix use-after-free issue with udc_name
    276828221852 usb: gadget: configfs: Preserve function ordering after bind failure
    b2bd36f54495 usb: gadget: Fix spinlock lockup on usb_function_deactivate
    ce507b55db29 USB: gadget: legacy: fix return error code in acm_ms_bind()
    7f875ea9883c usb: gadget: u_ether: Fix MTU size mismatch with RX packet size
    b89a5f39c2b5 usb: gadget: function: printer: Fix a memory leak for interface descriptor
    692ab0726460 usb: gadget: f_uac2: reset wMaxPacketSize
    7ac84fa85ba2 usb: gadget: select CONFIG_CRC32
    77a804dd6b46 ALSA: usb-audio: Fix UBSAN warnings for MIDI jacks
    5c263f16822f USB: usblp: fix DMA to stack
    41f15da2abd9 USB: yurex: fix control-URB timeout handling
    175f7a5fa7e6 USB: serial: option: add Quectel EM160R-GL
    1a59feb52dc4 USB: serial: option: add LongSung M5710 module support
    ac48b1dacb07 USB: serial: iuu_phoenix: fix DMA from stack
    8a051eaae708 usb: uas: Add PNY USB Portable SSD to unusual_uas
    a7b81d0d2e07 usb: usbip: vhci_hcd: protect shift size
    f7cc27eb358d USB: xhci: fix U1/U2 handling for hardware with XHCI_INTEL_HOST quirk set
    ea472d839133 usb: chipidea: ci_hdrc_imx: add missing put_device() call in usbmisc_get_init_data()
    a37a0667e1e0 usb: dwc3: ulpi: Use VStsDone to detect PHY regs access completion
    5b8e1be9e0c1 USB: cdc-wdm: Fix use after free in service_outstanding_interrupt().
    5445502a344b USB: cdc-acm: blacklist another IR Droid device
    eeae1d95ce4e usb: gadget: enable super speed plus
    70cf59b8ffb4 staging: mt7621-dma: Fix a resource leak in an error handling path
    c511f27e130e powerpc: Handle .text.{hot,unlikely}.* in linker script
    867c10a03f84 crypto: asym_tpm: correct zero out potential secrets
    ff7397add935 crypto: ecdh - avoid buffer overflow in ecdh_set_secret()
    9e60056b1f53 video: hyperv_fb: Fix the mmap() regression for v5.4.y and older
    84d488719b27 Bluetooth: revert: hci_h5: close serdev device and free hu in h5_close
    3417067b3111 kbuild: don't hardcode depmod path
    3f2a28930a7e net/sched: sch_taprio: ensure to reset/destroy all child qdiscs
    c41ea30c3839 ionic: account for vlan tag len in rx buffer len
    5c6eb887e192 vhost_net: fix ubuf refcount incorrectly when sendmsg fails
    8f64957fda12 net: usb: qmi_wwan: add Quectel EM160R-GL
    12ab7b627d43 CDC-NCM: remove "connected" log message
    171a2bce9d6c net: dsa: lantiq_gswip: Fix GSWIP_MII_CFG(p) register access
    c0883010d3b3 net: dsa: lantiq_gswip: Enable GSWIP_MII_CFG_EN also for internal PHYs
    07f26fc52b45 r8169: work around power-saving bug on some chip versions
    106ca9ca9acc net: hdlc_ppp: Fix issues when mod_timer is called while timer is running
    2b8aa896b151 erspan: fix version 1 check in gre_parse_header()
    606f5412ad86 net: hns: fix return value check in __lb_other_process()
    e40b5fc79110 net: sched: prevent invalid Scell_log shift count
    b16f883e71f3 ipv4: Ignore ECN bits for fib lookups in fib_compute_spec_dst()
    a018c071de14 net: mvpp2: fix pkt coalescing int-threshold configuration
    443a71031e49 tun: fix return value when the number of iovs exceeds MAX_SKB_FRAGS
    c076e1198554 net: ethernet: ti: cpts: fix ethtool output when no ptp_clock registered
    8602c20a9160 net-sysfs: take the rtnl lock when accessing xps_rxqs_map and num_tc
    1f6b04a2b282 net-sysfs: take the rtnl lock when storing xps_rxqs
    67ed54a63f43 net-sysfs: take the rtnl lock when accessing xps_cpus_map and num_tc
    fb14db9508c0 net-sysfs: take the rtnl lock when storing xps_cpus
    e43ec45d45af net: ethernet: Fix memleak in ethoc_probe
    56dc7908ed85 net/ncsi: Use real net-device for response handler
    dffef999e484 virtio_net: Fix recursive call to cpus_read_lock()
    5404192a8721 qede: fix offload for IPIP tunnel packets
    8009f6bb13a3 net: ethernet: mvneta: Fix error handling in mvneta_probe
    6d003fe7fe87 ibmvnic: continue fatal error reset after passive init
    3d16088a9668 net: mvpp2: Fix GoP port 3 Networking Complex Control configurations
    8548c9679939 atm: idt77252: call pci_disable_device() on error path
    2a006b4fa5cc ethernet: ucc_geth: set dev->max_mtu to 1518
    c2ca14cc6f55 ethernet: ucc_geth: fix use-after-free in ucc_geth_remove()
    af99cae96fdc net: systemport: set dev->max_mtu to UMAC_MAX_MTU_SIZE
    8dd98d5d2ba4 net: mvpp2: prs: fix PPPoE with ipv6 packet parse
    73445f29575a net: mvpp2: Add TCAM entry to drop flow control pause frames
    a5a6dc4dc293 iavf: fix double-release of rtnl_lock
    6aba31a7c72e i40e: Fix Error I40E_AQ_RC_EINVAL when removing VFs
    9ea03f6890ce proc: fix lookup in /proc/net subdirectories after setns(2)
    d2942e958f26 proc: change ->nlink under proc_subdir_lock
    59b10c8a59a1 depmod: handle the case of /sbin/depmod without /sbin in PATH
    663a0bcb3fa5 lib/genalloc: fix the overflow when size is too big
    19e0cf8fc481 scsi: scsi_transport_spi: Set RQF_PM for domain validation commands
    eb3e975ac2a3 scsi: ide: Do not set the RQF_PREEMPT flag for sense requests
    4ae3573c571e scsi: ufs-pci: Ensure UFS device is in PowerDown mode for suspend-to-disk ->poweroff()
    5f9c3d640505 scsi: ufs: Fix wrong print message in dev_err()
    515dc635eb76 workqueue: Kick a worker based on the actual activation of delayed works
    f3a4c8d50145 Linux 5.4.88
    0a49aaf4df29 mwifiex: Fix possible buffer overflows in mwifiex_cmd_802_11_ad_hoc_start
    117433236ae2 exec: Transform exec_update_mutex into a rw_semaphore
    d390fc97df62 rwsem: Implement down_read_interruptible
    1b75a263fbd9 rwsem: Implement down_read_killable_nested
    71b8355ba667 perf: Break deadlock involving exec_update_mutex
    732251cabeb3 fuse: fix bad inode
    06c672dd61b5 iio:imu:bmi160: Fix alignment and data leak issues
    7a736f41013e kdev_t: always inline major/minor helper functions
    61a0d8e437bb dmaengine: at_hdmac: add missing kfree() call in at_dma_xlate()
    20d5ee563bfd dmaengine: at_hdmac: add missing put_device() call in at_dma_xlate()
    f2a0b7677444 dmaengine: at_hdmac: Substitute kzalloc with kmalloc
    4d3ba541bede Revert "mtd: spinand: Fix OOB read"
    da5b4cf021b9 Revert "drm/amd/display: Fix memory leaks in S3 resume"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dcc8a5977725a9fe11ac13ebd16a7acc1eef37d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5fc444bfc9..027e1a15c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b82b3d52ee94caf6165eda89d3294a561bfb4f0b"
-SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
+SRCREV_machine ?= "06c752971a7cb66123ab2b3731044103fc5662e0"
+SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.87"
+LINUX_VERSION ?= "5.4.90"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 05edcfa63d..8dfa5357bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.87"
+LINUX_VERSION ?= "5.4.90"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "18b82a8554b25c86cbf31af312765832edca3498"
-SRCREV_machine ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
+SRCREV_machine_qemuarm ?= "c65142e64f3d705d0b978b44394d274165d872b2"
+SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6a2d96e8a0..3ddff222af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "03f94e8a96d027da980f2cc2ad6e95bbb45e22c5"
-SRCREV_machine_qemuarm64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_machine_qemumips ?= "0b055d3e2e8d41743b00cd84975ff383e35f1ae9"
-SRCREV_machine_qemuppc ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_machine_qemuriscv64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_machine_qemux86 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_machine_qemux86-64 ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_machine_qemumips64 ?= "126e385b2dd8580a266fe15907c3725d2da12458"
-SRCREV_machine ?= "292d752af8e4015e40e7c523641983bac543e2b4"
-SRCREV_meta ?= "bc855ca4626f33c38c1398d48c71df10334a9132"
+SRCREV_machine_qemuarm ?= "17c98abae21d7d1bf43b58edc3d4aa2992436385"
+SRCREV_machine_qemuarm64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_machine_qemumips ?= "47a679ac3ca38116beaeb071888c01ef050f1424"
+SRCREV_machine_qemuppc ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_machine_qemuriscv64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_machine_qemux86 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_machine_qemux86-64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_machine_qemumips64 ?= "e4714b9bb683cf08909e6dc2e91fd508e56bfbc2"
+SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
+SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.87"
+LINUX_VERSION ?= "5.4.90"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

