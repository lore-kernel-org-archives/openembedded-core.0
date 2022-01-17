Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2683DC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Z2WophIz;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385448; x=1673921448;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DX2iRccgBCKsqHqktF2mr0u+fn7kgfixG04v22cm9Wg=;
  b=Z2WophIzrkMkuRhqfhAUr8nMsm7N+6Uc7ZDQRTKQyeu/4aVLGEiz0h+0
   aP2jrPuG97Q7DnaVzbfR+1t5GuxMN4PJ671G3MzJdv3mJorD4AmoStNIp
   KFvvIxVLK1NAj27CYhmG/OHfkJPqdpRXJaa/TNqk1qgTBsOs7ZDjGrLEV
   ZkK3JWhaVjHWCX+aC7cl8h/HydzRDFdkvubCToe9QUdDdlz4ym2ioFy9d
   vPF3DFov/Sb9s5vHq+EcjKuGcoDJ/sw1wk3r+TYGjRFehwdXwhULr0Rj8
   tBTNhIB7ekT/daiRF0LaUrS0NFMlPusTMWaspJs4H3V4W/Mzl0+Rqfapp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094226"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094226"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220716"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/12] linux-yocto/5.10: update to v5.10.89
Date: Mon, 17 Jan 2022 10:10:27 +0800
Message-Id: 
 <249b07715eccfb9f28fbc752c948cf4f19b8bb09.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160626

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

eb967e323f7f Linux 5.10.89
52ad5da8e316 phonet/pep: refuse to enable an unbound pipe
7dd52af1eb57 hamradio: improve the incomplete fix to avoid NPD
450121075a6a hamradio: defer ax25 kfree after unregister_netdev
8e34d07dd4d9 ax25: NPD bug when detaching AX25 device
50f78486f90b hwmon: (lm90) Do not report 'busy' status bit as alarm
ec1d222d37ea hwmom: (lm90) Fix citical alarm status for MAX6680/MAX6681
441d3873664d pinctrl: mediatek: fix global-out-of-bounds issue
9c75a9657bdc ASoC: rt5682: fix the wrong jack type detected
94caab5af19a ASoC: tas2770: Fix setting of high sample rates
c7282790c782 Input: goodix - add id->model mapping for the "9111" model
3bb3bf50d69f Input: elants_i2c - do not check Remark ID on eKTH3900/eKTH5312
ee6f34215c5d mm: mempolicy: fix THP allocations escaping mempolicy restrictions
8008fc1d0be1 KVM: VMX: Fix stale docs for kvm-intel.emulate_invalid_guest_state
d91ed251fd70 usb: gadget: u_ether: fix race in setting MAC address in setup phase
6697f29bf56b ceph: fix up non-directory creation in SGID directories
fffb6581a23a f2fs: fix to do sanity check on last xattr entry in __f2fs_setxattr()
ad338d825e3f tee: optee: Fix incorrect page free bug
1f2070767401 mm/hwpoison: clear MF_COUNT_INCREASED before retrying get_any_page()
ac61b9c6c054 mac80211: fix locking in ieee80211_start_ap error path
89876d10830d ARM: 9169/1: entry: fix Thumb2 bug in iWMMXt exception handling
c3253d3a38bc mmc: mmci: stm32: clear DLYB_CR after sending tuning command
0d66b395210c mmc: core: Disable card detect during shutdown
c8e366a01c20 mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block SDIO commands
4af79153617b mmc: sdhci-tegra: Fix switch to HS400ES mode
9a7ec7979785 gpio: dln2: Fix interrupts when replugging the device
f5b02912e2dd pinctrl: stm32: consider the GPIO offset to expose all the GPIO lines
28626e76baf5 KVM: VMX: Wake vCPU when delivering posted IRQ even if vCPU == this vCPU
7a37f2e37069 platform/x86: intel_pmc_core: fix memleak on registration failure
b57afd124046 x86/pkey: Fix undefined behaviour with PKRU_WD_BIT
c05d8f66ec34 tee: handle lookup of shm with reference count 0
0ffb9f83e4f6 parisc: Fix mask used to select futex spinlock
5deeb9ad598b parisc: Correct completer in lws start
8b745616ba8f ipmi: fix initialization when workqueue allocation fails
1f6ab847461c ipmi: ssif: initialize ssif_info->client early
a5192f31160c ipmi: bail out if init_srcu_struct fails
bc674f1b2119 Input: atmel_mxt_ts - fix double free in mxt_read_info_block
30140e252fdb ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s
2b4c020b70cc ALSA: hda/realtek: Fix quirk for Clevo NJ51CU
7470780f3b0c ALSA: hda/realtek: Add new alc285-hp-amp-init model
4cb7dc2e3074 ALSA: hda/realtek: Amp init fixup for HP ZBook 15 G6
69e492161c7b ALSA: drivers: opl3: Fix incorrect use of vp->state
a96c08e0b41e ALSA: jack: Check the return value of kstrdup()
51c7b2a7b86a hwmon: (lm90) Drop critical attribute support for MAX6654
2464738d0ee4 hwmon: (lm90) Introduce flag indicating extended temperature support
196df56c3dc8 hwmon: (lm90) Add basic support for TI TMP461
fa2e149260bf hwmon: (lm90) Fix usage of CONFIG2 register in detect function
ba696b470839 pinctrl: bcm2835: Change init order for gpio hogs
676c572439e5 Input: elantech - fix stack out of bound access in elantech_change_report_id()
2792fde84cce sfc: falcon: Check null pointer of rx_queue->page_ring
d70b4001ef74 sfc: Check null pointer of rx_queue->page_ring
75c962f02a4f net: ks8851: Check for error irq
9db0f8d395fd drivers: net: smc911x: Check for error irq
ca2a15053b07 fjes: Check for error irq
c6d2754006c1 bonding: fix ad_actor_system option setting to default
6809da518514 ipmi: Fix UAF when uninstall ipmi_si and ipmi_msghandler module
61e6b82e7b6c igb: fix deadlock caused by taking RTNL in RPM resume path
e00eace2325c net: skip virtio_net_hdr_set_proto if protocol already set
ed05e4dcfba6 net: accept UFOv6 packages in virtio_net_hdr_to_skb
56b0bbba782b qlcnic: potential dereference null pointer of rx_queue->page_ring
78e49d77e517 net: marvell: prestera: fix incorrect return of port_find
861b4413e41d ARM: dts: imx6qdl-wandboard: Fix Ethernet support
d79f5e0d458b netfilter: fix regression in looped (broad|multi)cast's MAC handling
579cefef7c42 RDMA/hns: Replace kfree() with kvfree()
7cf6466e00a7 IB/qib: Fix memory leak in qib_user_sdma_queue_pkts()
cd9c90682b2f ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
580ecf86e772 spi: change clk_disable_unprepare to clk_unprepare
93a957bbf46c arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
ef2dce43257d HID: potential dereference of null pointer
3110bc5862d2 HID: holtek: fix mouse probing
0875873b2a97 ext4: check for inconsistent extents between index and leaf block
76366c024f56 ext4: check for out-of-order index extents in ext4_valid_extent_entries()
1d4b1c4e8bbd ext4: prevent partial update of the extent blocks
f69a47fcbb9c net: usb: lan78xx: add Allied Telesis AT29M2-AF
8c0059a25cb1 arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
b16b124a42e0 arm64: vdso32: drop -no-integrated-as flag
856f88f27bbc Linux 5.10.88
88f20cccbeec xen/netback: don't queue unlimited number of packages
525875c410df xen/netback: fix rx queue stall detection
8fa3a370cc2a xen/console: harden hvc_xen against event channel storms
d31b3379179d xen/netfront: harden netfront against event channel storms
8ac3b6ee7c9f xen/blkfront: harden blkfront against event channel storms
76ec7fe2d866 Revert "xsk: Do not sleep in poll() when need_wakeup set"
e24fc8983025 bus: ti-sysc: Fix variable set but not used warning for reinit_modules
70692b06208c rcu: Mark accesses to rcu_state.n_force_qs
a9078e791426 scsi: scsi_debug: Sanity check block descriptor length in resp_mode_select()
bdb854f134b9 scsi: scsi_debug: Fix type in min_t to avoid stack OOB
aa1f912712a1 scsi: scsi_debug: Don't call kcalloc() if size arg is zero
6859985a2fbd ovl: fix warning in ovl_create_real()
5fd7d62daa24 fuse: annotate lock in fuse_reverse_inval_entry()
b99bdf127af9 media: mxl111sf: change mutex_init() location
0413f7a1a533 xsk: Do not sleep in poll() when need_wakeup set
6b8d8ecdd980 ARM: dts: imx6ull-pinfunc: Fix CSI_DATA07__ESAI_TX0 pad name
8affa1b68db6 Input: touchscreen - avoid bitwise vs logical OR warning
aec5897b277b drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE
c1d519263ded libata: if T_LENGTH is zero, dma direction should be DMA_NONE
a9f2c6af5a60 timekeeping: Really make sure wall_to_monotonic isn't positive
6471ebcd6f15 serial: 8250_fintek: Fix garbled text for console
a7c80674538f iocost: Fix divide-by-zero on donation from low hweight cgroup
bcebb8eb1948 zonefs: add MODULE_ALIAS_FS
1c414ff63b2d btrfs: fix double free of anon_dev after failure to create subvolume
005d9292b5b2 btrfs: fix memory leak in __add_inode_ref()
cd98cb5216a0 USB: serial: option: add Telit FN990 compositions
5c93584d9a2f USB: serial: cp210x: fix CP2105 GPIO registration
8f207f12630b usb: xhci: Extend support for runtime power management for AMD's Yellow carp.
e5949933f313 PCI/MSI: Mask MSI-X vectors only on success
f8aa09186c30 PCI/MSI: Clear PCI_MSIX_FLAGS_MASKALL on error
d17c5a389768 usb: dwc2: fix STM ID/VBUS detection startup delay in dwc2_driver_probe
2b2edc8fc5a8 USB: NO_LPM quirk Lenovo USB-C to Ethernet Adapher(RTL8153-04)
fd623e16b2ff tty: n_hdlc: make n_hdlc_tty_wakeup() asynchronous
9439fabfc349 KVM: x86: Drop guest CPUID check for host initiated writes to MSR_IA32_PERF_CAPABILITIES
5fe305c6d485 Revert "usb: early: convert to readl_poll_timeout_atomic()"
2b54f485f2c1 USB: gadget: bRequestType is a bitfield, not a enum
151ffac3ac27 powerpc/85xx: Fix oops when CONFIG_FSL_PMC=n
fcf9194d366c bpf, selftests: Fix racing issue in btf_skc_cls_ingress test
6f46c59e60b6 sit: do not call ipip6_dev_free() from sit_init_net()
6e1011cd183f net: systemport: Add global locking for descriptor lifecycle
d1765f984c99 net/smc: Prevent smc_release() from long blocking
337bb7bf7c31 net: Fix double 0x prefix print in SKB dump
734a3f310605 sfc_ef100: potential dereference of null pointer
7da349f07e45 net/packet: rx_owner_map depends on pg_vec
1a34fb9e2bf3 netdevsim: Zero-initialize memory for new map's value in function nsim_bpf_map_alloc
d3e1f54508f1 ixgbe: set X550 MDIO speed before talking to PHY
48e01e388182 ixgbe: Document how to enable NBASE-T support
776ed8b36697 igc: Fix typo in i225 LTR functions
74a16e062b23 igbvf: fix double free in `igbvf_probe`
ddac50d04f34 igb: Fix removal of unicast MAC filters of VFs
12c1938870dc soc/tegra: fuse: Fix bitwise vs. logical OR warning
451f1eded7f5 mptcp: clear 'kern' flag from fallback sockets
222cebd995cd drm/amd/pm: fix a potential gpu_metrics_table memory leak
74dc97dfb276 rds: memory leak in __rds_conn_create()
67f4362ae286 flow_offload: return EOPNOTSUPP for the unsupported mpls action type
03fd6ca05601 mac80211: fix lookup when adding AddBA extension element
bef59d6a83d3 mac80211: agg-tx: don't schedule_and_wake_txq() under sta->lock
96bc86cac0a9 drm/ast: potential dereference of null pointer
cac0fd4b9bd3 selftest/net/forwarding: declare NETIFS p9 p10
81fbdd45652d net/sched: sch_ets: don't remove idle classes from the round-robin list
be32c8a78887 dmaengine: st_fdma: fix MODULE_ALIAS
dfff1d5e85ff selftests: Fix IPv6 address bind tests
08896ecfffc3 selftests: Fix raw socket bind tests with VRF
5ba4dfb8b8a1 selftests: Add duplicate config only for MD5 VRF tests
12512bc8f25b net: hns3: fix use-after-free bug in hclgevf_send_mbx_msg
3a4f6dba1eb9 inet_diag: fix kernel-infoleak for UDP sockets
20ad1ef02f9a sch_cake: do not call cake_destroy() from cake_init()
1208b445a497 s390/kexec_file: fix error handling when applying relocations
c058c544e73a selftests: net: Correct ping6 expected rc from 2 to 1
9983425c203b virtio/vsock: fix the transport to work with VMADDR_CID_ANY
94a01e6fb2d8 soc: imx: Register SoC device only on i.MX boards
cc426a91d384 clk: Don't parent clks until the parent is fully registered
429bb01e4dda ARM: socfpga: dts: fix qspi node compatible
7b4cc168d9ca ceph: initialize pathlen variable in reconnect_caps_cb
e0f06c32afb2 ceph: fix duplicate increment of opened_inodes metric
640e28d618e8 tee: amdtee: fix an IS_ERR() vs NULL bug
eed897a22230 mac80211: track only QoS data frames for admission control
24983f750881 arm64: dts: rockchip: fix audio-supply for Rock Pi 4
49bd597719bf arm64: dts: rockchip: fix rk3399-leez-p710 vcc3v3-lan supply
9fcdbbf3964d arm64: dts: rockchip: fix rk3308-roc-cc vcc-sd supply
ba866840b240 arm64: dts: rockchip: remove mmc-hs400-enhanced-strobe from rk3399-khadas-edge
3516bc149223 arm64: dts: imx8mp-evk: Improve the Ethernet PHY description
06294e7e341a arm64: dts: imx8m: correct assigned clocks for FEC
4cc6badff97f audit: improve robustness of the audit queue handling
0e21e6cd5eeb dm btree remove: fix use after free in rebalance_children()
f5187a9d52ae recordmcount.pl: look for jgnop instruction as well as bcrl on s390
51f6302f81d2 vdpa: check that offsets are within bounds
e3a1ab5aea4c virtio_ring: Fix querying of maximum DMA mapping size for virtio device
0612679e48d0 bpf, selftests: Add test case trying to taint map value pointer
279e0bf80d95 bpf: Make 32->64 bounds propagation slightly more robust
e2aad0b5f2cb bpf: Fix signed bounds propagation after mov32
f0f484714f35 firmware: arm_scpi: Fix string overflow in SCPI genpd driver
7fd214fc7f2e mac80211: validate extended element ID is present
0bb50470f1e0 mac80211: send ADDBA requests using the tid/queue of the aggregation session
29bb131dbbb5 mac80211: mark TX-during-stop for TX in in_reconfig
15640e40e3bb mac80211: fix regression in SSN handling of addba tx
49b7e496928e KVM: downgrade two BUG_ONs to WARN_ON_ONCE
8d0f56c2ed71 KVM: selftests: Make sure kvm_create_max_vcpus test won't hit RLIMIT_NOFILE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8710dca273bada79536e84ad3c206bd1b40aab97)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 63ae89611f..f2279326b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d6b1cc83a5315388b060eaa6195f1ce77103c3d1"
-SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
+SRCREV_machine ?= "301346d30bcaccedc71da8d5f78bd262063d4ba7"
+SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.87"
+LINUX_VERSION ?= "5.10.89"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7d6e9cb992..ae6d884954 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.87"
+LINUX_VERSION ?= "5.10.89"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a46d018920762d81e283ecc80cf156fe226712ed"
-SRCREV_machine ?= "e36ccf7356af83243e55f6ca491049462f7feab7"
-SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
+SRCREV_machine:qemuarm ?= "913d41ebe409dfd03c49fafd1923f8663df2a4ff"
+SRCREV_machine ?= "5575e67330fb6d979ed1cd2e9e64400b4c21b595"
+SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index bbb25f7393..3df4e86bd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c5c39f3ba284421eceeb9b084da1508167b37abe"
-SRCREV_machine:qemuarm64 ?= "fab21fdf95a62d013b98eb91adc0d9cfc69f700b"
-SRCREV_machine:qemumips ?= "ef1d4a1e93c209637022c9337131394a6f3679ae"
-SRCREV_machine:qemuppc ?= "8009be617e2fd4c34c80892776d79f463d436fc0"
-SRCREV_machine:qemuriscv64 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
-SRCREV_machine:qemuriscv32 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
-SRCREV_machine:qemux86 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
-SRCREV_machine:qemux86-64 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
-SRCREV_machine:qemumips64 ?= "2f42ab7aac37cd61f47231301b3f1e232807e0e6"
-SRCREV_machine ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
-SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
+SRCREV_machine:qemuarm ?= "b0dfabc86c3b6e1fb2ddb153664961e107bedfa9"
+SRCREV_machine:qemuarm64 ?= "fea23aa594ce16a15564f991e14868dd255674cf"
+SRCREV_machine:qemumips ?= "0ec16d85647a337f392ae358db3dcc200d958938"
+SRCREV_machine:qemuppc ?= "a6a07d8acd8991883464bd3034beabb9ee23f11a"
+SRCREV_machine:qemuriscv64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
+SRCREV_machine:qemuriscv32 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
+SRCREV_machine:qemux86 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
+SRCREV_machine:qemux86-64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
+SRCREV_machine:qemumips64 ?= "29cb56446b0b66b7a15d2577773e69c4e813bfd7"
+SRCREV_machine ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
+SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.87"
+LINUX_VERSION ?= "5.10.89"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


