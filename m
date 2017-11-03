Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C12B178322
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jdj9027366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:29 -0400
Message-ID: <a85745dd1fc7537e8c820fd1d13bc5a99bf4ea70.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/4.12: update to v4.12.14
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:38 -0000
Content-Type: text/plain

Integrating the korg -stable releases with the following commit summary:

   fa394784e74b Linux 4.12.14
   d0fa64e2a3e8 ipv6: Fix may be used uninitialized warning in rt6_check
   7816eb3874a2 md/raid5: release/flush io in raid5_do_work()
   b57c1b424549 md/raid1/10: reset bio allocated from mempool
   c3f9d09e70a3 idr: remove WARN_ON_ONCE() when trying to replace negative ID
   a82e202cbb72 fuse: allow server to run in different pid_ns
   7b777a6cc52a x86/switch_to/64: Rewrite FS/GS switching yet again to fix AMD CPUs
   831621ada28a x86/fsgsbase/64: Report FSBASE and GSBASE correctly in core dumps
   90ecd1c5bc55 x86/fsgsbase/64: Fully initialize FS and GS state in start_thread_common
   cb14d4cebdb2 f2fs: check hot_data for roll-forward recovery
   96a069a6babb f2fs: let fill_super handle roll-forward errors
   442df0425e95 sctp: fix missing wake ups in some situations
   aa02286a03c7 ipv6: fix typo in fib6_net_exit()
   18c6d4c4d17a ipv6: fix memory leak with multiple tables during netns destruction
   888b7a94104a ip6_gre: update mtu properly in ip6gre_err
   88f6c6f254bf vhost_net: correctly check tx avail during rx busy polling
   fc33f146d9f1 gianfar: Fix Tx flow control deactivation
   a44bb1c4596a Revert "net: fix percpu memory leaks"
   8fbf9f919597 Revert "net: use lib/percpu_counter API for fragmentation mem accounting"
   79f08820eeb8 bridge: switchdev: Clear forward mark when transmitting packet
   2f4232ba8001 mlxsw: spectrum: Forbid linking to devices that have uppers
   a9e548de4cf9 net: fec: Allow reception of frames bigger than 1522 bytes
   b8fcbae2fefa Revert "net: phy: Correctly process PHY_HALTED in phy_stop_machine()"
   b88be44f595f net/mlx5e: Fix CQ moderation mode not set properly
   8049c41db78d net/mlx5e: Fix inline header size for small packets
   8db40bcf439f net/mlx5: E-Switch, Unload the representors in the correct order
   b0034cb5014e net/mlx5e: Properly resolve TC offloaded ipv6 vxlan tunnel source address
   53c5525785bc net/mlx5e: Don't override user RSS upon set channels
   ba008489371d net/mlx5e: Fix dangling page pointer on DMA mapping error
   7ae1eccbde90 net/mlx5: Fix arm SRQ command for ISSI version 0
   0b6b3028c005 net/mlx5e: Fix DCB_CAP_ATTR_DCBX capability for DCBNL getcap.
   9b919ad3f99f net/mlx5e: Check for qos capability in dcbnl_initialize
   31034e443fbf net: dsa: bcm_sf2: Fix number of CFP entries for BCM7278
   f9901adf536c kcm: do not attach PF_KCM sockets to avoid deadlock
   e7ebdeb47c8b packet: Don't write vnet header beyond end of buffer
   ef5a20f0cbae ipv6: do not set sk_destruct in IPV6_ADDRFORM sockopt
   440ea29af6a5 ipv6: set dst.obsolete when a cached route has expired
   24bd86e62739 cxgb4: Fix stack out-of-bounds read due to wrong size to t4_record_mbox()
   59b304fdff15 net: mvpp2: fix the mac address used when using PPv2.2
   38ca2d395e1c udp6: set rx_dst_cookie on rx_dst updates
   b4426cf20366 netvsc: fix deadlock betwen link status and removal
   3f0204b0b7b5 net: systemport: Free DMA coherent descriptors on errors
   71dd9ac555c5 net: bcmgenet: Be drop monitor friendly
   7def678f47fc net: systemport: Be drop monitor friendly
   c86a65cf30ac tipc: Fix tipc_sk_reinit handling of -EAGAIN
   8aafed19d523 qlge: avoid memcpy buffer overflow
   6da138247b47 sctp: Avoid out-of-bounds reads from address storage
   207ab5d5a250 fsl/man: Inherit parent device and of_node
   4670d7961333 bpf: fix map value attribute for hash of maps
   79d6457e8036 udp: on peeking bad csum, drop packets even if not at head
   1999821fa500 macsec: add genl family module alias
   517e43bd1eba ipv6: fix sparse warning on rt6i_node
   640efece69a4 ipv6: add rcu grace period before freeing fib6_node
   76d3e7ff2362 ipv6: accept 64k - 1 packet length in ip6_find_1stfragopt()
   5d7d2e03e0f0 Linux 4.12.13
   9f7df0bca168 xfs: XFS_IS_REALTIME_INODE() should be false if no rt device present
   da0f4931ec52 NFSv4: Fix up mirror allocation
   3307d5f5099c NFS: Sync the correct byte range during synchronous writes
   6f50e3a1b8c3 NFS: Fix 2 use after free issues in the I/O code
   7714f302294d ARM: 8692/1: mm: abort uaccess retries upon fatal signal
   b9a489e1d4a3 ARM64: dts: marvell: armada-37xx: Fix GIC maintenance interrupt
   8329b5e8c6cf Bluetooth: Properly check L2CAP config option output buffer length
   99dc1296b47c rt2800: fix TX_PIN_CFG setting for non MT7620 chips
   2bce0fe7d0cd KVM: SVM: Limit PFERR_NESTED_GUEST_PAGE error_code check to L1 guest
   9d6412aa06ce ALSA: msnd: Optimize / harden DSP and MIDI loops
   846073130799 mm/memory.c: fix mem_cgroup_oom_disable() call missing
   46791eb9f13e mm/swapfile.c: fix swapon frontswap_map memory leak on error
   637f25e5ba94 mm: kvfree the swap cluster info if the swap file is unsatisfactory
   58989dc3af0d selftests/x86/fsgsbase: Test selectors 1, 2, and 3
   9ed3dc1c0431 radix-tree: must check __radix_tree_preload() return value
   0af760ab3882 rtlwifi: btcoexist: Fix breakage of ant_sel for rtl8723be
   8004198bb025 btrfs: resume qgroup rescan on rw remount
   9a5537a76b62 nvme-fabrics: generate spec-compliant UUID NQNs
   02c54b35cad8 mtd: nand: qcom: fix config error for BCH
   f2339a072e47 mtd: nand: qcom: fix read failure without complete bootchain
   71515c37777d mtd: nand: mxc: Fix mxc_v1 ooblayout
   c54a31845019 mtd: nand: hynix: add support for 20nm NAND chips
   2b8b46b24217 mtd: nand: make Samsung SLC NAND usable again

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index d5b97148246f..d890e6c8b17c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
+SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.12"
+LINUX_VERSION ?= "4.12.14"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 5dddc49d7c4f..87c04a5fb87b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.12"
+LINUX_VERSION ?= "4.12.14"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
+SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 10b0e803a9b1..52af3b3009b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1e1376104bff5a42b4cb02d5086f98f69cb5b835"
-SRCREV_machine_qemuarm64 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_machine_qemumips ?= "0b4d515ecab39edc197039450e8386525cdb616e"
-SRCREV_machine_qemuppc ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_machine_qemux86 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_machine_qemux86-64 ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_machine_qemumips64 ?= "8e7c9bd1fe585e22952b6772cb61f2aed6a09e83"
-SRCREV_machine ?= "abc6bf6010cae7127b5849ce83b60f244024408f"
-SRCREV_meta ?= "73365069d89a8423a6f9f4b5560ee6bfdfc0b3d1"
+SRCREV_machine_qemuarm ?= "63eabe4fc5b8645a2a1258ee9b2ec0e5c62b4236"
+SRCREV_machine_qemuarm64 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_machine_qemumips ?= "64ac80375bc1c2e87002994c3112f30aa614d73e"
+SRCREV_machine_qemuppc ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_machine_qemux86 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_machine_qemux86-64 ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_machine_qemumips64 ?= "d481a271022e211857045b48d595826d8df051c4"
+SRCREV_machine ?= "1348b764f8ca8803b6b833c69f5cb795fddf24b8"
+SRCREV_meta ?= "daacede608e07d391229ba0a6d74d6e082bead5f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.12"
+LINUX_VERSION ?= "4.12.14"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


