Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02F8C731CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELETHA018491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:29 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:16 -0500
Message-ID: <c73cf8d9e3f305a0a58c9aa3cfc3bb574768f3b2.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] linux-yocto/4.9: bump to v4.9.8
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:31 -0000
Content-Type: text/plain

Integrating the -stable releases. Changelog is as follows:

   c8ea2f3b8247 Linux 4.9.8
   b5b4d4a9141e xfs: fix bmv_count confusion w/ shared extents
   5d44dd54bd57 xfs: clear _XBF_PAGES from buffers when readahead page
   29f96b7e9023 xfs: extsize hints are not unlikely in xfs_bmap_btalloc
   aab858dabd5e xfs: remove racy hasattr check from attr ops
   29094164ea99 xfs: verify dirblocklog correctly
   214d55efa255 xfs: fix COW writeback race
   29f319275e76 xfs: fix xfs_mode_to_ftype() prototype
   d062d90c35f2 xfs: don't wrap ID in xfs_dq_get_next_id
   d3201a14b36a xfs: sanity check inode di_mode
   43ce5921773b xfs: sanity check inode mode when creating new dentry
   b5f68e24cc7b xfs: replace xfs_mode_to_ftype table with switch statement
   4fac84ba1da7 xfs: add missing include dependencies to xfs_dir2.h
   e5325fcf70b1 xfs: sanity check directory inode di_size
   624e54b5aff1 xfs: make the ASSERT() condition likely
   4f4d5082ec73 xfs: don't print warnings when xfs_log_force fails
   e9b776519107 xfs: don't rely on ->total in xfs_alloc_space_available
   6b81365b1e57 xfs: adjust allocation length in xfs_alloc_space_available
   c63f4d3aa09d xfs: fix bogus minleft manipulations
   d20e4ad06c4b xfs: bump up reserved blocks in xfs_alloc_set_aside
   9f42bc4f9c1c net: dsa: Bring back device detaching in dsa_slave_suspend()
   e972cce0c833 lwtunnel: Fix oops on state free after encap module unload
   89c2588627c2 net: Specify the owning module for lwtunnel ops
   087c2ecb21af qmi_wwan/cdc_ether: add device ID for HP lt2523 (Novatel E371) WWAN card
   93ff5e03bcba af_unix: move unix_mknod() out of bindlock
   37b27b20a8a9 r8152: don't execute runtime suspend if the tx is not empty
   ad864d9fce0e net: mpls: Fix multipath selection for LSR use case
   74423145d931 bridge: netlink: call br_changelink() during br_dev_newlink()
   087dced61adc net/mlx5e: Do not recycle pages from emergency reserve
   0c687a735cdb tcp: initialize max window for a new fastopen socket
   79453ab88164 ipv6: addrconf: Avoid addrconf_disable_change() using RCU read-side lock
   e9db042dca20 lwtunnel: fix autoload of lwt modules
   b335e6566661 net: phy: bcm63xx: Utilize correct config_intr function
   948e137ad9ba net: fix harmonize_features() vs NETIF_F_HIGHDMA
   d1c95f9ce102 vxlan: fix byte order of vxlan-gpe port number
   1e7cbb413f63 virtio-net: restore VIRTIO_HDR_F_DATA_VALID on receiving
   3eab5dd0eb19 virtio: don't set VIRTIO_NET_HDR_F_DATA_VALID on xmit
   b260a714a638 net sched actions: fix refcnt when GETing of action after bind
   2d6b61ec9d3a ax25: Fix segfault after sock connection timeout
   c7a5df92d1e8 ip6_tunnel: Account for tunnel header in tunnel MTU
   08e650708dd0 ravb: do not use zero-length alignment DMA descriptor
   77ce30dc4df4 mlx4: do not call napi_schedule() without care
   18767acb7b67 openvswitch: maintain correct checksum state in conntrack actions
   3524f64224bd tcp: fix tcp_fastopen unaligned access complaints on sparc
   b66b1f5ac33d net: systemport: Decouple flow control from __bcm_sysport_tx_reclaim
   958bb1bdc2c2 net: ipv4: fix table id in getroute response
   6980c52c4efb net: lwtunnel: Handle lwtunnel_fill_encap failure
   ec1aa8d49532 mlxsw: pci: Fix EQE structure definition
   4ec59d1fe470 mlxsw: switchx2: Fix memory leak at skb reallocation
   7c249f3306b6 mlxsw: spectrum: Fix memory leak at skb reallocation
   5b3df4401064 netvsc: add rcu_read locking to netvsc callback
   a37f2311e63c r8152: fix the sw rx checksum is unavailable
   fd2ffe57dda0 Linux 4.9.7
   b59dd202f231 drm/i915: Remove WaDisableLSQCROPERFforOCL KBL workaround.
   922813f4d66f perf/core: Fix concurrent sys_perf_event_open() vs. 'move_group' race
   f5f415c13209 mm, memcg: do not retry precharge charges
   98185d4b18a1 platform/x86: intel_mid_powerbtn: Set IRQ_ONESHOT
   adb260d15134 platform/x86: mlx-platform: free first dev on error
   776050a9b55e virtio_mmio: Set DMA masks appropriately
   143a9ad4e68c memory_hotplug: make zone_can_shift() return a boolean value
   da1fdb8456ac pinctrl: baytrail: Rectify debounce support
   583eded5860b pinctrl: uniphier: fix Ethernet (RMII) pin-mux setting for LD20
   35948ae694c0 pinctrl: broxton: Use correct PADCFGLOCK offset
   668a827a6c9d s5k4ecgx: select CRC32 helper
   9a335996bfcf IB/rxe: Prevent from completer to operate on non valid QP
   fed1e89a16e3 IB/rxe: Fix rxe dev insertion to rxe_dev_list
   c81ee4ed9c0d IB/umem: Release pid in error and ODP flow
   d7c3d7e453b7 drm/i915: Check for NULL atomic state in intel_crtc_disable_noatomic()
   181478cdb75e drm/i915: Fix calculation of rotated x and y offsets for planar formats
   ff4956555513 drm/i915: Don't init hpd polling for vlv and chv from runtime_suspend()
   8d7c76ae613e drm/i915: Don't leak edid in intel_crt_detect_ddc()
   2cff678d0bb5 drm/i915: prevent crash with .disable_display parameter
   9913aca2d587 drm/i915: Clear ret before unbinding in i915_gem_evict_something()
   1b8ff91ae545 v4l: tvp5150: Don't override output pinmuxing at stream on/off time
   11e5015ae1d1 v4l: tvp5150: Fix comment regarding output pin muxing
   d25f9bfeb62f v4l: tvp5150: Reset device at probe time, not in get/set format handlers
   fe6531075e1d pctv452e: move buffer to heap, no mutex
   0bd3cb8d470b iw_cxgb4: free EQ queue memory on last deref
   cb1d48f55a6d SUNRPC: cleanup ida information when removing sunrpc module
   5637949edb50 NFSv4.0: always send mode in SETATTR after EXCLUSIVE4
   0a7023506112 NFSv4.1: Fix a deadlock in layoutget
   73fdda3b01cd nfs: Don't increment lock sequence ID after NFS4ERR_MOVED
   2b95f1210e50 parisc: Don't use BITS_PER_LONG in userspace-exported swab.h header
   ca332b96ba62 ARC: [arcompact] handle unaligned access delay slot corner case
   9d5f2c151ec0 ARC: udelay: fix inline assembler by adding LP_COUNT to clobber list
   50f5972cc231 can: ti_hecc: add missing prepare and unprepare of the clock
   9f56548b0077 can: c_can_pci: fix null-pointer-deref in c_can_start() - set device pointer
   a1af471b4151 IB/srp: fix invalid indirect_sg_entries parameter value
   c2293e76babe IB/srp: fix mr allocation when the device supports sg gaps
   24be606cd3b4 IB/iser: Fix sg_tablesize calculation
   95600605ffaa IB/cxgb3: fix misspelling in header guard
   d7f56ee1198a s390/ptrace: Preserve previous registers for short regset write
   62d7f2123f19 s390/mm: Fix cmma unused transfer from pgste into pte
   97a2e39b7ab9 RDMA/cma: Fix unknown symbol when CONFIG_IPV6 is not enabled
   ffb97c11d05f Btrfs: remove ->{get, set}_acl() from btrfs_dir_ro_inode_operations
   ad80fada9d6d Btrfs: disable xattr operations on subvolume directories
   79babd4a6ce2 Btrfs: remove old tree_root case in btrfs_read_locked_inode()
   959f9709c025 ISDN: eicon: silence misleading array-bounds warning
   485952414360 xfs: prevent quotacheck from overloading inode lru
   03707d6c36f9 sysctl: fix proc_doulongvec_ms_jiffies_minmax()
   c7556867782e userns: Make ucounts lock irq-safe
   13e39d5930ec vring: Force use of DMA API for ARM-based systems with legacy devices
   96e5cec10e7a mm, page_alloc: fix premature OOM when racing with cpuset mems update
   b678e4ff7ce0 mm, page_alloc: move cpuset seqcount checking to slowpath
   d1656c5aef4d mm, page_alloc: fix fast-path race with cpuset update or removal
   ade7afe9dca6 mm, page_alloc: fix check for NULL preferred_zone
   9b1a1ae9b528 mm/mempolicy.c: do not put mempolicy before using its nodemask
   6676aa65464f mm/huge_memory.c: respect FOLL_FORCE/FOLL_COW for thp
   a2104c7cd3b2 drm/atomic: clear out fence when duplicating state
   bbae3c452596 Revert "drm/radeon: always apply pci shutdown callbacks"
   5270c017f19f drm/vc4: fix a bounds check
   cfba2a001d0e drm/vc4: Return -EINVAL on the overflow checks failing.
   b9edac54cb85 drm/vc4: Fix an integer overflow in temporary allocation layout.
   32600835ebe1 drm/vc4: Fix memory leak of the CRTC state.
   4c741e2adb35 drm/i915: Ignore bogus plane coordinates on SKL when the plane is not visible
   f1dc9aaee029 drm: Fix broken VT switch with video=1366x768 option
   2abb7f408f7c drm: Schedule the output_poll_work with 1s delay if we have delayed event
   e4be4d4942b9 tile/ptrace: Preserve previous registers for short regset write
   544160b6ea18 fbdev: color map copying bounds checking

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 8eaec528d62b..771adaa80145 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "71569cd064e02564211737430c31a4b0e9c810fb"
-SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
+SRCREV_machine ?= "ff62b282b523e48abb8f8304ff46ebcc88913757"
+SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.6"
+LINUX_VERSION ?= "4.9.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 5510b0f8ff3d..8910bee524e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.6"
+LINUX_VERSION ?= "4.9.8"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
+SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index a7593848f61c..f91cab32450d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "103383d270939399bc73365c31cd6f93c567114f"
-SRCREV_machine_qemuarm64 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_machine_qemumips ?= "c8425cad333ec85f61d63054051fe17df53ece29"
-SRCREV_machine_qemuppc ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_machine_qemux86 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_machine_qemux86-64 ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_machine_qemumips64 ?= "42fe7d605fc92985c8ba10363de487ea06bd068a"
-SRCREV_machine ?= "4700f2f8b9dbaad5ae441b682d04b09e811135fc"
-SRCREV_meta ?= "6fd9dcbb3f0becf90c555a1740d21d18c331af99"
+SRCREV_machine_qemuarm ?= "7d0c6a3197a456d36c190f5127b06e8525b6c874"
+SRCREV_machine_qemuarm64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_machine_qemumips ?= "2b50d9fc7d329e661fd9fa317f60ee26746c30ae"
+SRCREV_machine_qemuppc ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_machine_qemux86 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_machine_qemux86-64 ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_machine_qemumips64 ?= "13818cbe0b9f0e2e7542b7c088b5719c7a463da9"
+SRCREV_machine ?= "c85c54f5bf53b98afe8105e91bffcdb6c60afe8f"
+SRCREV_meta ?= "2c9c93fb141832b1416824387491dd95a9d627c6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.6"
+LINUX_VERSION ?= "4.9.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


