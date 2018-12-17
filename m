Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBA279D96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:41:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3eu17003629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:41:06 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:40:46 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:27 -0500
Message-ID: <132a076cc5fa9667db70c12b3fdbe4ec0b3cf1f6.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/17] linux-yocto/4.18: update to v4.18.21
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
X-List-Received-Date: Mon, 17 Dec 2018 03:41:31 -0000
Content-Type: text/plain

Integrating Paul Gortmaker's 4.18.x -stable queue that comprises the
following commits:

   7791d9ae24f8 Linux 4.18.21
   a80801badd68 libceph: fall back to sendmsg for slab pages
   fa1d15db0676 HID: Add quirk for Microsoft PIXART OEM mouse
   539bf8a221c2 HID: Add quirk for Primax PIXART OEM mice
   e5cfd0902404 HID: uhid: forbid UHID_CREATE under KERNEL_DS or elevated privileges
   c2d5a17480e1 ACPI / platform: Add SMB0001 HID to forbidden_id_list
   a6f05874e5e4 drivers/misc/sgi-gru: fix Spectre v1 vulnerability
   a2106abb1311 mtd: rawnand: atmel: fix OF child-node lookup
   852707bdc43c USB: misc: appledisplay: add 20" Apple Cinema Display
   025b1def8764 misc: atmel-ssc: Fix section annotation on atmel_ssc_get_driver_data
   9e7b23298a7e usb: quirks: Add delay-init quirk for Corsair K70 LUX RGB
   013de23dac1c USB: Wait for extra delay time after USB_PORT_FEAT_RESET for quirky hub
   3f514468061f USB: quirks: Add no-lpm quirk for Raydium touchscreens
   bbcc56d2f095 usb: cdc-acm: add entry for Hiro (Conexant) modem
   97e2f24e1a83 ALSA: hda/ca0132 - Call pci_iounmap() instead of iounmap()
   745bb5e7cfeb ALSA: hda/realtek - Add quirk entry for HP Pavilion 15
   1c6195c1d07e RISC-V: Fix raw_copy_{to,from}_user()
   58d333dec778 MIPS: OCTEON: cavium_octeon_defconfig: re-enable OCTEON USB driver
   574cddd586ad x86/ldt: Unmap PTEs for the slot before freeing LDT pages
   e5992ad333bb x86/ldt: Split out sanity check in map_ldt_struct()
   4fec0315cc99 x86/mm: Move LDT remap out of KASLR region on 5-level paging
   06e06217b513 x86/mm/doc: Enhance the x86-64 virtual memory layout descriptions
   afddf2bc08b8 x86/mm/doc: Clean up the x86-64 virtual memory layout descriptions
   251fe62f9fbd SUNRPC: drop pointless static qualifier in xdr_get_next_encode_buffer()
   39cc3a6bf7a4 kbuild: deb-pkg: fix too low build version number
   4cbf9bb5d870 net: aquantia: invalid checksumm offload implementation
   7efe7160032f net: aquantia: fixed enable unicast on 32 macvlan
   3dcebf4e0021 net: aquantia: fix potential IOMMU fault after driver unbind
   7ab68bbd45e5 net: stmmac: Fix RX packet size > 8191
   13cf931db889 qed: Fix potential memory corruption
   edc856a3748d qed: Fix SPQ entries not returned to pool in error flows
   85423a9f1925 qed: Fix blocking/unlimited SPQ entries leak
   98e7cd88b52b qed: Fix memory/entry leak in qed_init_sp_request()
   82f212b802a0 i40e: restore NETIF_F_GSO_IPXIP[46] to netdev features
   85f5e5f14d5a ice: Change req_speeds to be u16
   da1d12c17f9f ice: Fix the bytecount sent to netdev_tx_sent_queue
   2a7e71e87d96 ice: Fix dead device link issue with flow control
   14e275bde8d7 perf tools: Do not zero sample_id_all for group members
   76cc23113132 perf tools: Fix undefined symbol scnprintf in libperf-jvmti.so
   2d21e584e738 sched/core: Take the hotplug lock in sched_init_smp()
   2ada9a15c672 i2c: omap: Enable for ARCH_K3
   53d22ae3d66e nvme: make sure ns head inherits underlying device limits
   446c01fb4f92 ceph: quota: fix null pointer dereference in quota check
   9e10f7374c41 s390/perf: Change CPUM_CF return code in event init function
   9de8b1448395 drm/amd/amdgpu/dm: Fix dm_dp_create_fake_mst_encoder()
   f360a418cccb drm/amd/display: Drop reusing drm connector for MST
   7f7cef0bfc2f block: Clear kernel memory before copying to user
   f9e5bd7ff2eb drm/amd/display: Stop leaking planes
   4239764e6ba8 lib/raid6: Fix arm64 test build
   7c5fe0f1b003 mtd: nand: Fix nanddev_pos_next_page() kernel-doc header
   c3c978e03a0b clk: fixed-factor: fix of_node_get-put imbalance
   1e6a626e9a85 arm64: dts: renesas: r8a7795: add missing dma-names on hscif2
   8904df27645c Revert "drm/exynos/decon5433: implement frame counter"
   bc80947ec235 ARM: dts: fsl: Fix improperly quoted stdout-path values
   0256a4666ccc hwmon: (ibmpowernv) Remove bogus __init annotations
   7cce145bb0bc net: hns3: Fix for out-of-bounds access when setting pfc back pressure
   49ca763b85a3 s390/qeth: fix HiperSockets sniffer
   2a5adbb88317 netfilter: nft_compat: ebtables 'nat' table is normal chain type
   b1045a2ed7d0 netfilter: ipset: Fix calling ip_set() macro at dumping
   6339fe77369f netfilter: xt_IDLETIMER: add sysfs filename checking routine
   5f53cf58e657 netfilter: ipset: Correct rcu_dereference() call in ip_set_put_comment()
   ac802253a7f6 bpf: fix bpf_prog_get_info_by_fd to return 0 func_lens for unpriv
   38dd3dd00b30 s390/mm: Fix ERROR: "__node_distance" undefined!
   da97e4fe8be9 s390/mm: fix mis-accounting of pgtable_bytes
   8d30ef7ca397 netfilter: ipset: fix ip_set_list allocation failure
   61c4117c1a74 netfilter: ipset: actually allow allowable CIDR 0 in hash:net,port,net
   969721e7b329 netfilter: ipset: list:set: Decrease refcount synchronously on deletion and replace
   429746904248 Revert "netfilter: nft_numgen: add map lookups for numgen random operations"
   a5e3863ac044 netfilter: use PTR_ERR_OR_ZERO()
   0ae8e99ec8cd HID: alps: allow incoming reports when only the trackstick is opened
   15b457203750 Revert "HID: add NOGET quirk for Eaton Ellipse MAX UPS"
   b031d919f5a3 HID: i2c-hid: Add a small delay after sleep command for Raydium touchpanel
   6e7506e7ffa1 netfilter: ipv6: fix oops when defragmenting locally generated fragments
   ffe4bc3d6f34 netfilter: ipv6: nf_defrag: drop skb dst before queueing
   9b1f3e55b288 clk: ti: fix OF child-node lookup
   dd638be4185f clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
   0d6b6e708bc7 arm64: percpu: Initialize ret in the default case
   bbc36472de49 platform/x86: acerhdf: Add BIOS entry for Gateway LT31 v1.3307
   1a256be39690 x86/earlyprintk: Add a force option for pciserial device
   f7554181a88f apparmor: Fix uninitialized value in aa_split_fqname
   012871d08c0d clk: samsung: exynos5420: Enable PERIS clocks for suspend
   064e571701ce fs/exofs: fix potential memory leak in mount option parsing
   831690c6459c perf symbols: Set PLT entry/header sizes properly on Sparc
   0f9ecdb3bd83 clk: fixed-rate: fix of_node_get-put imbalance
   ede1c4fcdde1 platform/x86: intel_telemetry: report debugfs failure
   ee66e4013b23 afs: Handle EIO from delivery function
   aef20e808b30 drm/edid: Add 6 bpc quirk for BOE panel.
   24bb4410cef8 um: Give start_idle_thread() a return code
   2d40d681ae35 perf unwind: Take pgoff into account when reporting elf to libdwfl
   cb3e550391e9 hfsplus: prevent btree data loss on root split
   fa5cc3040873 hfs: prevent btree data loss on root split
   ee916b4885a5 reiserfs: propagate errors from fill_with_dentries() properly
   ef40ee9ed9ae ixgbe: fix MAC anti-spoofing filter after VFLR
   c0fee8923e4f net: hns3: bugfix for the initialization of command queue's spin lock
   8d77763100a2 net: hns3: bugfix for handling mailbox while the command queue reinitialized
   2fb7315d2cf8 net: hns3: Prevent sending command during global or core reset
   ab0b26b06885 net: hns3: bugfix for rtnl_lock's range in the hclgevf_reset()
   cd72d052e2e0 block: brd: associate with queue until adding disk
   0d11623a80f2 arm64: kprobe: make page to RO mode when allocate it
   a52826b7b283 cifs: fix return value for cifs_listxattr
   875f9a25fe16 cifs: don't dereference smb_file_target before null check
   726e26c18837 usbnet: smsc95xx: disable carrier check while suspending
   1b02f8a0f99a net: smsc95xx: Fix MTU range
   43ec8ff9d9d1 mlxsw: spectrum: Fix IP2ME CPU policer configuration
   5084168f4ddb sctp: not increase stream's incnt before sending addstrm_in request
   2d3ba28f6872 net: phy: mdio-gpio: Fix working over slow can_sleep GPIOs
   fbe671bf4640 sctp: fix strchange_flags name for Stream Change Event
   1071eded0415 net: dsa: microchip: initialize mutex before use
   92df935ee5bd net: qualcomm: rmnet: Fix incorrect assignment of real_dev
   8524e5f23056 sctp: define SCTP_SS_DEFAULT for Stream schedulers
   839c08b2e53f net: phy: realtek: fix RTL8201F sysfs name
   511ac11522c8 net: dsa: mv88e6xxx: Fix clearing of stats counters
   4166d97c8114 net/mlx5e: IPoIB, Reset QP after channels are closed
   057174ecf7c3 net/mlx5: IPSec, Fix the SA context hash key
   776d3005c370 l2tp: fix a sock refcnt leak in l2tp_tunnel_register
   5b7d8593e89d inet: frags: better deal with smp races
   38cdb31946c1 net/mlx5e: Removed unnecessary warnings in FEC caps query
   0fa0336430a4 net/mlx5e: Fix selftest for small MTUs
   35f08cfda6e4 net/mlx5e: Always use the match level enum when parsing TC rule match
   81dff097d4f1 Revert "sctp: remove sctp_transport_pmtu_check"
   956f3384ec99 net/mlx5e: Adjust to max number of channles when re-attaching
   e717c85edd16 net/mlx5e: Claim TC hw offloads support only under a proper build config
   73965525b4a5 net: systemport: Protect stop from timeout
   0c6765847a3e tuntap: fix multiqueue rx
   1f1f1f9f5c04 tipc: fix lockdep warning when reinitilaizing sockets
   4882b7bfa4f4 tipc: don't assume linear buffer when reading ancillary data
   8ee89a1dba58 tg3: Add PHY reset for 5717/5719/5720 in change ring and flow control paths
   29939b28474d tcp: Fix SOF_TIMESTAMPING_RX_HARDWARE to use the latest timestamp during TCP coalescing
   2d02df9e00f6 sctp: not allow to set asoc prsctp_enable by sockopt
   f8079b5a352d net-gro: reset skb->pkt_type in napi_reuse_skb()
   893ebde4310f net: bcmgenet: protect stop from timeout
   d50e12a49aa0 ipv6: Fix PMTU updates for UDP/raw sockets in presence of VRF
   a72cc86b5f1b ipv6: fix a dst leak when removing its exception
   05b6cf8bd43b ip_tunnel: don't force DF when MTU is locked
   9de9dc5fac67 ibmvnic: fix accelerated VLAN handling
   67485ab94ea6 flow_dissector: do not dissect l4 ports for fragments

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 5d33040cffb8..aa8c58030197 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "96664e80434995740b129f9dc5643e23b440db82"
-SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
+SRCREV_machine ?= "6228ee37a46479d624e608c572d241f74eee11b6"
+SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.20"
+LINUX_VERSION ?= "4.18.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index a4dfa4ec5668..01aeed99997f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.20"
+LINUX_VERSION ?= "4.18.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "aee695377bdc1f8779a2c68383c069a664cbdf85"
-SRCREV_machine ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
+SRCREV_machine_qemuarm ?= "bd4312baf01b5aca2745245c3856b5143bf0c6ad"
+SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index d563f74671c8..ae4359810412 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0ccc3a1c4ac6ad712be41e83a08a01de7ea8f3f8"
-SRCREV_machine_qemuarm64 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_machine_qemumips ?= "e5c2b57fb8dfaae90014f4ec07689c97f634cbcf"
-SRCREV_machine_qemuppc ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_machine_qemux86 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_machine_qemux86-64 ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_machine_qemumips64 ?= "b60ebfc39bee8da6acff4e8add4af6045d1843f2"
-SRCREV_machine ?= "3ec998a9e3e48f7f01c698c3932333be1c1f13df"
-SRCREV_meta ?= "85fa5f0caa839c7a4cafc0e0a9118a67897ad684"
+SRCREV_machine_qemuarm ?= "bd83f95a7aa1aa180dad74dbdd6809ee9a5fe9e0"
+SRCREV_machine_qemuarm64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_machine_qemumips ?= "9a16770a65e7617b99f31663b1fafceb459df3dc"
+SRCREV_machine_qemuppc ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_machine_qemux86 ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_machine_qemux86-64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_machine_qemumips64 ?= "6641acbf076ba3f7ad96e846581272215a537904"
+SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
+SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.20"
+LINUX_VERSION ?= "4.18.21"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


