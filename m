Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C60C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 19:58:14 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.2677.1642449493437251303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=civnXHdB;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id u3so10599483qku.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9wOHmIRZTU7n9NpBL51LP8RH2MK4dAUDpawpSNXnaHc=;
        b=civnXHdBBzza7RsNp0btYGjmyMxqoTrG9WrIKpjlOrl9Pq3r51D0JxCh4/OhnCHjwr
         8X4k0gexaB6euAKfzPhA8K7/cG6YpCfCif22yNDksWJFmFl6mRxZNBnEVEw7k50cfzwf
         XrC7pN4HVdjp3Mqh6RRGU7nScrvV9H0j3N0PYCQ8iAlx7xgvvy7NSJz5ptZhWGNnsyiI
         xB13C4NO/KDm2Gk4RhwbeTpKFitLnx586gBw1tRxPOifyKYNnGR7wrrZwdKzcCNdBc+B
         pnxKxNxIa5q/DY11EWBGM75he5OIndzL6CtLoCz/4E6C1imBP1QRLLGRBk1eLrKO1D/o
         RlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9wOHmIRZTU7n9NpBL51LP8RH2MK4dAUDpawpSNXnaHc=;
        b=lpOGEP4I2hCrXzReWpLDiReLc3BDRn8d9FsX5I5DEPPN42k1QK4PeLJZBEpxrJzgDy
         0m+Q9xvX/qQdjivpdnsTDDkEcSFNFxOFhlJlXjyrJR6/rd/yGrQs+yFviCRDo9m43/Kx
         Hdo5s5HCPLqeb9TupDQnC0WqPvJjkG2DqDbN5h9jU4V9J3GAXDRxCAK9Q/th6TQ6jHMh
         f3HPCk9b4om0871VzU53n/iXlv4OxYX7A31xwSYRszXxo3flXgcuYMNpch9sPziN9+eu
         gjoLrzZHpHLPPSF9JhNtzGYj+v4M7AyWqbnhU8ys68v2LCbA4Ck9C9zh70+xmW+pxpgw
         r7Yg==
X-Gm-Message-State: AOAM531tDo73WiYaj6C+JTSy1wgRBZKIR185ln7zuHXmprwBhv9oc7OY
	BFaqf3sIplS2HCSTNJMsvks=
X-Google-Smtp-Source: 
 ABdhPJzHj1NopaTBg6mxkr8vhO1ii3zU/z/vnsdQJPguH0W7JoEt4LIeWEO0EoOz9nBn9ynYEMarfw==
X-Received: by 2002:a05:620a:254a:: with SMTP id
 s10mr15630497qko.654.1642449492418;
        Mon, 17 Jan 2022 11:58:12 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 o6sm8851203qtr.83.2022.01.17.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 11:58:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4][dunfell] linux-yocto/5.4: update to v5.4.169
Date: Mon, 17 Jan 2022 14:58:07 -0500
Message-Id: <20220117195810.30114-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 19:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160657

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

4ca2eaf1d477 Linux 5.4.169
48c76fc53582 phonet/pep: refuse to enable an unbound pipe
a5c6a13e9056 hamradio: improve the incomplete fix to avoid NPD
ef5f7bfa19e3 hamradio: defer ax25 kfree after unregister_netdev
df8f79bcc2e4 ax25: NPD bug when detaching AX25 device
0333eaf38500 hwmon: (lm90) Do not report 'busy' status bit as alarm
bf260ff4a42f hwmom: (lm90) Fix citical alarm status for MAX6680/MAX6681
f373298e1bf0 pinctrl: mediatek: fix global-out-of-bounds issue
bf04afb6137f mm: mempolicy: fix THP allocations escaping mempolicy restrictions
f5db6bc93494 KVM: VMX: Fix stale docs for kvm-intel.emulate_invalid_guest_state
06c13e039d92 usb: gadget: u_ether: fix race in setting MAC address in setup phase
b0406b5ef4e2 f2fs: fix to do sanity check on last xattr entry in __f2fs_setxattr()
806142c805ca tee: optee: Fix incorrect page free bug
5478b90270a3 ARM: 9169/1: entry: fix Thumb2 bug in iWMMXt exception handling
1c3d4122bec6 mmc: core: Disable card detect during shutdown
e9db8fc6c7af mmc: sdhci-tegra: Fix switch to HS400ES mode
d9031ce0b071 pinctrl: stm32: consider the GPIO offset to expose all the GPIO lines
c7b2e5850ba6 x86/pkey: Fix undefined behaviour with PKRU_WD_BIT
ddc1d49e10a7 parisc: Correct completer in lws start
8467c8cb94a4 ipmi: fix initialization when workqueue allocation fails
8efd6a3391f7 ipmi: ssif: initialize ssif_info->client early
cd24bafefc17 ipmi: bail out if init_srcu_struct fails
5525d80dc9dd Input: atmel_mxt_ts - fix double free in mxt_read_info_block
737a98d91b07 ALSA: hda/realtek: Amp init fixup for HP ZBook 15 G6
8df036befbc3 ALSA: drivers: opl3: Fix incorrect use of vp->state
fdaf41977d77 ALSA: jack: Check the return value of kstrdup()
44c743f63dd3 hwmon: (lm90) Drop critical attribute support for MAX6654
4615c9740575 hwmon: (lm90) Introduce flag indicating extended temperature support
c2242478f28d hwmon: (lm90) Add basic support for TI TMP461
d939660eff62 hwmon: (lm90) Add max6654 support to lm90 driver
055ca98d48ba hwmon: (lm90) Fix usage of CONFIG2 register in detect function
a7f95328c6f0 Input: elantech - fix stack out of bound access in elantech_change_report_id()
e12dcd4aa7f4 sfc: falcon: Check null pointer of rx_queue->page_ring
c11a41e26985 drivers: net: smc911x: Check for error irq
5d556b1437e1 fjes: Check for error irq
d7024080db82 bonding: fix ad_actor_system option setting to default
992649b8b168 ipmi: Fix UAF when uninstall ipmi_si and ipmi_msghandler module
2460d96c19a8 net: skip virtio_net_hdr_set_proto if protocol already set
621d5536b452 net: accept UFOv6 packages in virtio_net_hdr_to_skb
0b01c51c4f47 qlcnic: potential dereference null pointer of rx_queue->page_ring
685fc8d22489 netfilter: fix regression in looped (broad|multi)cast's MAC handling
79dcbd817615 IB/qib: Fix memory leak in qib_user_sdma_queue_pkts()
78874bca4f27 spi: change clk_disable_unprepare to clk_unprepare
0c0ac2547c87 arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
6fa4e2992717 HID: holtek: fix mouse probing
2712816c10b3 serial: 8250_fintek: Fix garbled text for console
51c925a9bccc net: usb: lan78xx: add Allied Telesis AT29M2-AF
8f843cf57202 Linux 5.4.168
0d99b3c6bd39 xen/netback: don't queue unlimited number of packages
8bfcd0385211 xen/netback: fix rx queue stall detection
560e64413b4a xen/console: harden hvc_xen against event channel storms
3e68d099f09c xen/netfront: harden netfront against event channel storms
4ed9f5c511ce xen/blkfront: harden blkfront against event channel storms
192fe5739571 Revert "xsk: Do not sleep in poll() when need_wakeup set"
e281b7199236 net: sched: Fix suspicious RCU usage while accessing tcf_tunnel_info
96a1550a2b43 mac80211: fix regression in SSN handling of addba tx
66aba15a144a rcu: Mark accesses to rcu_state.n_force_qs
b847ecff8507 scsi: scsi_debug: Sanity check block descriptor length in resp_mode_select()
f9f300a92297 ovl: fix warning in ovl_create_real()
ba2a9d8f8ef1 fuse: annotate lock in fuse_reverse_inval_entry()
96f182c9f48b media: mxl111sf: change mutex_init() location
095ad3969b62 xsk: Do not sleep in poll() when need_wakeup set
29e9fdf7b681 ARM: dts: imx6ull-pinfunc: Fix CSI_DATA07__ESAI_TX0 pad name
f6e9e7be9b80 Input: touchscreen - avoid bitwise vs logical OR warning
3d45573dfb6e mwifiex: Remove unnecessary braces from HostCmd_SET_SEQ_NO_BSS_INFO
a19cf6844b50 mac80211: validate extended element ID is present
e070c0c990d7 drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE
c9ee8144e409 libata: if T_LENGTH is zero, dma direction should be DMA_NONE
62889094939c timekeeping: Really make sure wall_to_monotonic isn't positive
241d36219aaa USB: serial: option: add Telit FN990 compositions
d2bb4378e2bb USB: serial: cp210x: fix CP2105 GPIO registration
bae7f0808202 usb: xhci: Extend support for runtime power management for AMD's Yellow carp.
3dc6b5f2a4d5 PCI/MSI: Mask MSI-X vectors only on success
c520e7cf82ac PCI/MSI: Clear PCI_MSIX_FLAGS_MASKALL on error
ed31692a9758 USB: NO_LPM quirk Lenovo USB-C to Ethernet Adapher(RTL8153-04)
aae3448b78d9 USB: gadget: bRequestType is a bitfield, not a enum
ad0ed314d616 sit: do not call ipip6_dev_free() from sit_init_net()
c675256a7f13 net: systemport: Add global locking for descriptor lifecycle
2bf888fa4a5c net/smc: Prevent smc_release() from long blocking
56a6ffea18c2 net: Fix double 0x prefix print in SKB dump
027a13973dad net/packet: rx_owner_map depends on pg_vec
699e794c12a3 netdevsim: Zero-initialize memory for new map's value in function nsim_bpf_map_alloc
a97e7dd4b713 ixgbe: set X550 MDIO speed before talking to PHY
8addba6cab94 igbvf: fix double free in `igbvf_probe`
36844e250a2e igb: Fix removal of unicast MAC filters of VFs
bca4a53ea72c soc/tegra: fuse: Fix bitwise vs. logical OR warning
166f0adf7e75 rds: memory leak in __rds_conn_create()
9cb405ee5334 flow_offload: return EOPNOTSUPP for the unsupported mpls action type
066a637d1ce7 net: sched: lock action when translating it to flow_action infra
e7660f9535ad mac80211: fix lookup when adding AddBA extension element
f363af7c7045 mac80211: accept aggregation sessions on 6 GHz
1e6526148149 mac80211: agg-tx: don't schedule_and_wake_txq() under sta->lock
ceb30f48d817 mac80211: agg-tx: refactor sending addba
eeaf9c0609e0 selftest/net/forwarding: declare NETIFS p9 p10
2252220d9ebb dmaengine: st_fdma: fix MODULE_ALIAS
18203fe17643 selftests: Fix IPv6 address bind tests
b46f0afa74e7 selftests: Fix raw socket bind tests with VRF
7b5596e53125 inet_diag: fix kernel-infoleak for UDP sockets
2c589cf07bd5 inet_diag: use jiffies_delta_to_msecs()
0d80462fbdca sch_cake: do not call cake_destroy() from cake_init()
2fba53ccfb1b s390/kexec_file: fix error handling when applying relocations
b380bf012d2b selftests: net: Correct ping6 expected rc from 2 to 1
ec5c00be7836 clk: Don't parent clks until the parent is fully registered
f83ed203c822 ARM: socfpga: dts: fix qspi node compatible
46b9e29db201 mac80211: track only QoS data frames for admission control
a6f18191c6c1 arm64: dts: rockchip: fix audio-supply for Rock Pi 4
86f2789e3c15 arm64: dts: rockchip: fix rk3399-leez-p710 vcc3v3-lan supply
4bb01424330d arm64: dts: rockchip: remove mmc-hs400-enhanced-strobe from rk3399-khadas-edge
e0759696de68 nfsd: fix use-after-free due to delegation race
7243aa71509a iio: adc: stm32: fix a current leak by resetting pcsel before disabling vdda
0d3277eabd54 audit: improve robustness of the audit queue handling
501ecd90efdc dm btree remove: fix use after free in rebalance_children()
b25e213522f6 recordmcount.pl: look for jgnop instruction as well as bcrl on s390
c0954f1010ad virtio_ring: Fix querying of maximum DMA mapping size for virtio device
802a1a850156 firmware: arm_scpi: Fix string overflow in SCPI genpd driver
33f0dfab3187 mac80211: send ADDBA requests using the tid/queue of the aggregation session
873e664a83ef mac80211: mark TX-during-stop for TX in in_reconfig
ff3e3fdc737a KVM: selftests: Make sure kvm_create_max_vcpus test won't hit RLIMIT_NOFILE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index b7a7cbcbe3..7926ddc3c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2bddc20729f986e46ba5b802fa6ce8716ee34506"
-SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
+SRCREV_machine ?= "66f69e8b3cc56e22c8b78f3141fd736fc1c5859b"
+SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.167"
+LINUX_VERSION ?= "5.4.169"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a2db551ccb..60f13669e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.167"
+LINUX_VERSION ?= "5.4.169"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e8825a1df3d08af26acf8fc2ddb140c40aa233f4"
-SRCREV_machine ?= "b9dbced11f660908cec12d5e1339bbff0ac28d59"
-SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
+SRCREV_machine_qemuarm ?= "092520553603d101c48aafd95aac45f5f455882a"
+SRCREV_machine ?= "d44538a3be2f25dc1c768d0ed31d18af18cc2aee"
+SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6571b5ead5..0e8fe724e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6669d1a2f103a3275306cde2486a0c133ab288a4"
-SRCREV_machine_qemuarm64 ?= "0727e136f0c04aac28ee442d1a5b208d41021c00"
-SRCREV_machine_qemumips ?= "ec2a556c8c4bea3c26d85d9097fcb7bc37d9b470"
-SRCREV_machine_qemuppc ?= "dc1f229c713f712f3e29a8f3a20e45120aeccf2a"
-SRCREV_machine_qemuriscv64 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
-SRCREV_machine_qemux86 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
-SRCREV_machine_qemux86-64 ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
-SRCREV_machine_qemumips64 ?= "ec66f75ec62c5b2f576b98dcfd7dc870643590da"
-SRCREV_machine ?= "6244469059318276e2ffca54f85ecd3d13cd6756"
-SRCREV_meta ?= "ff304dbaec03398dc510602800b19d28b7c82927"
+SRCREV_machine_qemuarm ?= "69471f4c5c895fe6ccef696800c7ef2bda3ad2fd"
+SRCREV_machine_qemuarm64 ?= "e0b9164ac4b0d53e7bd42bf1d2322eb5ce462d68"
+SRCREV_machine_qemumips ?= "7bf5ddb8e9ae1284cb4e02bed7f9429bec0b39c4"
+SRCREV_machine_qemuppc ?= "b0054e5e7451561a7c6a6d6a401395fbd0395801"
+SRCREV_machine_qemuriscv64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
+SRCREV_machine_qemux86 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
+SRCREV_machine_qemux86-64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
+SRCREV_machine_qemumips64 ?= "e8483ea124a1715790eba584ee2ad8aac1e15edf"
+SRCREV_machine ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
+SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.167"
+LINUX_VERSION ?= "5.4.169"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


