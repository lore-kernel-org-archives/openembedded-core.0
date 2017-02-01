Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E03B177317
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUdaw026941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:27 -0500
Message-ID: <217d4fe514bf43d43bc55718c97903247ff27397.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto/4.9: update to 4.9.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2017 15:30:44 -0000
Content-Type: text/plain

Integrating the korg -stable release with the following changes:

   75353ac8ff43 Linux 4.9.4
   6fea974494af rtlwifi: rtl_usb: Fix missing entry in USB driver's private data
   7dae85b5c355 rtlwifi: Fix enter/exit power_save
   3f41ee3a45cb drm/i915/gen9: Fix PCODE polling during CDCLK change notification
   93f2976eb027 ALSA: usb-audio: Add a quirk for Plantronics BT600
   f52e670a5b29 spi: mvebu: fix baudrate calculation for armada variant
   05b7bdf1c3d8 ARM: omap2+: am437x: rollback to use omap3_gptimer_timer_init()
   b8ba5faa7a6b ARM: 8631/1: clkdev: Detect errors in clk_hw_register_clkdev() for mass registration
   87dbf3dc1652 ARM: OMAP4+: Fix bad fallthrough for cpuidle
   b336dc57bc92 ARM: OMAP5: Fix build for PM code
   0f665deba9bc ARM: OMAP5: Fix mpuss_early_init
   aa1c7b01c9c7 bus: arm-ccn: Prevent hotplug callback leak
   bd99e7a6036e svcrdma: Clear xpt_bc_xps in xprt_setup_rdma_bc() error exit arm
   c2ce1c4133b3 ARM: qcom_defconfig: Fix MDM9515 LCC and GCC config
   e925eb342659 ARM: zynq: Reserve correct amount of non-DMA RAM
   78e2d9405e2d ARM: pxa: fix pxa25x interrupt init
   596ff0afbe8e ARM64: dts: bcm2835: Fix bcm2837 compatible string
   e3937bc1cc0b ARM64: dts: bcm2837-rpi-3-b: remove incorrect pwr LED
   d40152d5ac67 arm64: dts: mt8173: Fix auxadc node
   08aed6e8883d tools/virtio: fix READ_ONCE()
   e7d05ec1923e powerpc: Fix build warning on 32-bit PPC
   2fc33ff4ba81 ALSA: firewire-tascam: Fix to handle error from initialization of stream data
   2c867216c555 HID: hid-cypress: validate length of report
   e425ed1d3c75 net: vrf: do not allow table id 0
   7b7a5a85b1d9 net: ipv4: Fix multipath selection with vrf
   7cc73483a4c7 net/mlx5e: Remove WARN_ONCE from adaptive moderation code
   17a561b19a27 gro: Disable frag0 optimization on IPv6 ext headers
   934ca017c850 gro: use min_t() in skb_gro_reset_offset()
   ec0fdcb88c6f gro: Enter slow-path if there is no tailroom
   33364eee1fe4 net: add the AF_QIPCRTR entries to family name tables
   2ff4a0243c9e net: dsa: Ensure validity of dst->ds[0]
   66f24d624baa r8152: fix rx issue for runtime suspend
   c8a89b4f5248 r8152: split rtl8152_suspend function
   294f2c889637 net: dsa: bcm_sf2: Utilize nested MDIO read/write
   ac77aab46168 net: dsa: bcm_sf2: Do not clobber b53_switch_ops
   b55f6ca7380d bpf: change back to orig prog on too many passes
   a4d205a59521 net: vrf: Add missing Rx counters
   efc455f08ea8 ipv4: Do not allow MAIN to be alias for new LOCAL w/ custom rules
   fe1e13cfe2c4 igmp: Make igmp group member RFC 3376 compliant
   7826d11cf44c flow_dissector: Update pptp handling to avoid null pointer deref.
   9f65f5d4746b drop_monitor: consider inserted data in genlmsg_end
   9f7551e05b0f drop_monitor: add missing call to genlmsg_end
   a8a213f296ae net: ipv4: dst for local input routes should use l3mdev if relevant
   e7422080e35d net: fix incorrect original ingress device index in PKTINFO
   2ffc694b5727 rtnl: stats - add missing netlink message size checks
   8cb7d6277f01 net/mlx5e: Disable netdev after close
   ee9f2fd3f6b6 net/mlx5e: Don't sync netdev state when not registered
   33c782dd1514 net/mlx5: Prevent setting multicast macs for VFs
   b22c86ff8e78 net/mlx5: Mask destination mac value in ethtool steering rules
   efbbc75c00fc net/mlx5: Avoid shadowing numa_node
   ca8a64467f2a net/mlx5: Cancel recovery work in remove flow
   7bf1de7f2749 net/mlx5: Check FW limitations on log_max_qp before setting it
   9b4a34ff8987 net/sched: cls_flower: Fix missing addr_type in classify
   99f40c6bf565 net: stmmac: Fix race between stmmac_drv_probe and stmmac_open
   09babe4ce12e net, sched: fix soft lockup in tc_classify
   ee99e2bc5e8a ipv6: handle -EFAULT from skb_copy_bits
   d36a1cb1e328 inet: fix IP(V6)_RECVORIGDSTADDR for udp sockets
   ed3cc329c7bc sctp: sctp_transport_lookup_process should rcu_read_unlock when transport is null
   8b8fbe5c25ab net: vrf: Drop conntrack data after pass through VRF device on Tx
   d4a0b2e40c46 net: vrf: Fix NAT within a VRF

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index e745ff76ea18..1c26ef3ac97b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2751bf0b7339c4f3227b3a7d45b2dbe5726906aa"
-SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
+SRCREV_machine ?= "628a985d1bb4d992b76c727afd373788bd496c90"
+SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.3"
+LINUX_VERSION ?= "4.9.4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index fa5dbfef1ea0..12a64887d677 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.3"
+LINUX_VERSION ?= "4.9.4"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
+SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index f57024f7f605..b42603bad2c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "09b1056330a9a4fc077d569513c2b40e8340e813"
-SRCREV_machine_qemuarm64 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_machine_qemumips ?= "858b4f40b3c2dbb6cb2ac76cc27dd5275d83f1f9"
-SRCREV_machine_qemuppc ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_machine_qemux86 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_machine_qemux86-64 ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_machine_qemumips64 ?= "32baa0c2e903fdfa714c38428ba055ad861d058d"
-SRCREV_machine ?= "881cba95ae2597482870f6c4060a60d84af4c5d1"
-SRCREV_meta ?= "03a2d3f7f999a555c8725b5f1fd69660ebd4af83"
+SRCREV_machine_qemuarm ?= "9027d6fa2661251146c08851a13ca623bc2c1156"
+SRCREV_machine_qemuarm64 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_machine_qemumips ?= "ce10acbd809335dd0c6f697770b3279ae168d145"
+SRCREV_machine_qemuppc ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_machine_qemux86 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_machine_qemux86-64 ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_machine_qemumips64 ?= "303f51499cfe9f770c4a843a2042228897cea1b4"
+SRCREV_machine ?= "6fdf2bca12625c67b64f39e08b1b4ae7c610f8bd"
+SRCREV_meta ?= "78e8e39c7c73ab9d98864f492b1fd9658124d635"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.3"
+LINUX_VERSION ?= "4.9.4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


