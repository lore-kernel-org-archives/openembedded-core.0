Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC11475402
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:25:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w69FPl6b016396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Jul 2018 08:25:47 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 08:25:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Jul 2018 11:25:38 -0400
Message-ID: <106b7b18e63be5ee94e135787de0437dadf5aa96.1531149297.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1531149297.git.bruce.ashfield@windriver.com>
References: <cover.1531149297.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.12: update to v4.12.26
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
X-List-Received-Date: Mon, 09 Jul 2018 15:25:47 -0000
Content-Type: text/plain

Integrating Paul Gortmaker's -stable 4.12 release, which comprises
the following commits:

b0f63e84c132 Linux 4.12.26
61be5424616e usbnet: fix alignment for frames with no ethernet header
6d0519e75609 tipc: fix memory leak in tipc_accept_from_sock()
8560506d5b7a tipc: call tipc_rcv() only if bearer is up in tipc_udp_recv()
5ceba73f1c24 tcp: remove buggy call to tcp_v6_restore_cb()
450a839e54a6 tcp/dccp: block bh before arming time_wait timer
872d246eaed9 stmmac: reset last TSO segment size after device open
74386d6ee7bf sit: update frag_off info
3df033244a42 s390/qeth: fix GSO throughput regression
b7bd0107008f s390/qeth: fix early exit from error path
7f02573318ba s390/qeth: build max size GSO skbs on L2 devices
3c8a527e0496 rds: Fix NULL pointer dereference in __rds_rdma_map
00c0600c0a35 net: remove hlist_nulls_add_tail_rcu()
193d9a02e802 net: realtek: r8169: implement set_link_ksettings()
8fb1c5e220ee net: qmi_wwan: add Quectel BG96 2c7c:0296
0c2ba29a13d9 net/packet: fix a race in packet_bind() and packet_notifier()
bb06331e9156 net: openvswitch: datapath: fix data type in queue_gso_packets
ea15a664c5b8 usb: gadget: ffs: Forbid usb_ep_alloc_request from sleeping
7f11deffc177 ipmi: Stop timers before cleaning up the module
fb006a18929e fix kcm_clone()
ee82eaf439cc RDMA/cxgb4: Annotate r2 and stag as __be32
b71be191d4ed md: free unused memory after bitmap resize
6d24efc56915 dm raid: fix panic when attempting to force a raid to sync
490fc05683b4 blk-mq: Avoid that request queue removal can trigger list corruption
d9e8cb49aaf1 ide: ide-atapi: fix compile error with defining macro DEBUG
115978628b54 ipvlan: fix ipv6 outbound device
ee2ce344ee06 powerpc/powernv/idle: Round up latency and residency values
0fe4d3f9fb5b afs: Connect up the CB.ProbeUuid
94bdd552d7b1 IB/mlx5: Assign send CQ and recv CQ of UMR QP
aa02d85e4d08 IB/mlx4: Increase maximal message size under UD QP
dd955bcce383 bnxt_re: changing the ip address shouldn't affect new connections
a4b3e59bcb04 f2fs: fix to clear FI_NO_PREALLOC
78f9d39a2735 xfrm: Copy policy family in clone_policy
4577662b6010 atm: horizon: Fix irq release error
d7241b40fe6d kbuild: rpm-pkg: fix jobserver unavailable warning
bffb011d5446 mailbox: mailbox-test: don't rely on rx_buffer content to signal data ready
849ef7edfa4c clk: hi3660: fix incorrect uart3 clock freqency
d561354fe15d clk: uniphier: fix DAPLL2 clock rate of Pro5
eada5db0be6e clk: qcom: common: fix legacy board-clock registration
11ea07285eb4 geneve: fix fill_info when link down
4e0b53bd177a sctp: return error if the asoc has been peeled off in sctp_wait_for_sndbuf
be7cba326d33 sctp: use the right sk after waking up from wait_buf sleep
2c485f6fa3be sctp: do not free asoc when it is already dead in sctp_sendmsg
6e2b427a32da slub: fix sysfs duplicate filename creation when slub_debug=O
e66ebbc23607 zsmalloc: calling zs_map_object() from irq is a bug
dc423eda615d sparc64/mm: set fields in deferred pages
956c73ca6664 block: wake up all tasks blocked in get_request()
1f35bda74d1a dt-bindings: usb: fix reg-property port-number range
412c76f0f9b8 sunrpc: Fix rpc_task_begin trace point
09f79313b317 NFS: Fix a typo in nfs_rename()
a550f7b43f63 dynamic-debug-howto: fix optional/omitted ending line number to be LARGE instead of 0
80f443550f8f lib/genalloc.c: make the avail variable an atomic_long_t
1dfea0e03917 drivers/rapidio/devices/rio_mport_cdev.c: fix resource leak in error handling path in 'rio_dma_transfer()'
4add25bf3dff route: update fnhe_expires for redirect when the fnhe exists
c53ad6cb2f86 route: also update fnhe_genid when updating a route cache
d09b814cd2aa gre6: use log_ecn_error module parameter in ip6_tnl_rcv()
f9ef4cd05462 mac80211_hwsim: Fix memory leak in hwsim_new_radio_nl()
a95269b0e4e5 x86/mpx/selftests: Fix up weird arrays
76e5bd0ae30a coccinelle: fix parallel build with CHECK=scripts/coccicheck
59f2aa43a314 kbuild: pkg: use --transform option to prefix paths in tar
50ce05457e39 irqchip/qcom: Fix u32 comparison with value less than zero
e3fec500f619 ARM: avoid faulting on qemu
602f85aeefb7 crypto: talitos - fix ctr-aes-talitos
73e76cb0ca1f crypto: talitos - fix use of sg_link_tbl_len
f17fe30404de crypto: talitos - fix AEAD for sha224 on non sha224 capable chips
f5fa317606b7 crypto: talitos - fix setkey to check key weakness
519619ec114a crypto: talitos - fix memory corruption on SEC2
e7984cca5abc crypto: talitos - fix AEAD test failures
64d05b5d1d86 bus: arm-ccn: fix module unloading Error: Removing state 147 which has instances left.
e14e213dfd51 bus: arm-ccn: Fix use of smp_processor_id() in preemptible context
63efd55a2c6b bus: arm-ccn: Check memory allocation failure
fd30c25b5596 bus: arm-cci: Fix use of smp_processor_id() in preemptible context
d358187f050b media: dvb: i2c transfers over usb cannot be done from stack
2ae277ebe31f drm/exynos: gem: Drop NONCONTIG flag for buffers allocated without IOMMU
0792a5a27074 drm/bridge: analogix dp: Fix runtime PM state in get_modes() callback
fdc899328ff3 kdb: Fix handling of kallsyms_symbol_next() return value
08f22e2251fd brcmfmac: change driver unbind order of the sdio function devices
f9a77013fa02 powerpc/64s: Initialize ISAv3 MMU registers before setting partition table
9c6dfd696e5a KVM: s390: Fix skey emulation permission check
092937ce1aae s390: fix compat system call table
4f4b2e279816 s390: always save and restore all registers on context switch
8c54b7d880d4 smp/hotplug: Move step CPUHP_AP_SMPCFD_DYING to the correct place
a2ec325c7d20 iommu/vt-d: Fix scatterlist offset handling
743ac71ece80 ALSA: usb-audio: Fix the missing ctl name suffix at parsing SU
1df6e988ae39 ALSA: usb-audio: Add check return value for usb_string()
974394e57a05 ALSA: usb-audio: Fix out-of-bound error
f4753360efda ALSA: seq: Remove spurious WARN_ON() at timer check
478c2ed7ca1c ALSA: pcm: prevent UAF in snd_pcm_info
b12060cae8c2 btrfs: handle errors while updating refcounts in update_ref_for_cow
ecfc013c7f23 btrfs: fix missing error return in btrfs_drop_snapshot
45822ea3d1bf X.509: fix comparisons of ->pkey_algo
19057ced2699 X.509: reject invalid BIT STRING for subjectPublicKey
a3ad8e49bc26 KEYS: reject NULL restriction string when type is specified
7c2ccfe13faa KEYS: add missing permission check for request_key() destination
664879ff9aef ASN.1: check for error from ASN1_OP_END__ACT actions
4c0e7ec3072d ASN.1: fix out-of-bounds read when parsing indefinite length item
17a6f363daf9 efi/esrt: Use memunmap() instead of kfree() to free the remapping
8dd372dd8845 efi: Move some sysfs files to be read-only by root
97c6b857262f scsi: libsas: align sata_device's rps_resp on a cacheline
eb78a8b8f172 scsi: use dma_get_cache_alignment() as minimum DMA alignment
db4a32fa5cf2 scsi: dma-mapping: always provide dma_get_cache_alignment
1f55442d0992 isa: Prevent NULL dereference in isa_bus driver callbacks
93fdb7dc713e hv: kvp: Avoid reading past allocated blocks from KVP file
d745d533737a pinctrl: armada-37xx: Fix direction_output() callback behavior
ae6add36f3ce iio: adc: meson-saradc: fix the bit_idx of the adc_en clock
50c87ecdb250 iio: adc: cpcap: fix incorrect validation
657257ba13ae iio: health: max30102: Temperature should be in milli Celsius
3da92b4ab2cc virtio: release virtio index when fail to device_register
f6fe0d2777b2 can: peak/pcie_fd: fix potential bug in restarting tx queue
654babccd437 can: usb_8dev: cancel urb on -EPIPE and -EPROTO
bda1dccdda47 can: esd_usb2: cancel urb on -EPIPE and -EPROTO
9ff8eb7ef05b can: ems_usb: cancel urb on -EPIPE and -EPROTO
51e5de2b036b can: mcba_usb: cancel urb on -EPROTO
c94c94a367ef can: kvaser_usb: cancel urb on -EPIPE and -EPROTO
c8474d8798ab can: kvaser_usb: ratelimit errors if incomplete messages are received
1936ba2b0b40 can: kvaser_usb: Fix comparison bug in kvaser_usb_read_bulk_callback()
bc86162fa81a can: kvaser_usb: free buf in error paths
4a879f2d1636 can: ti_hecc: Fix napi poll return value for repoll
09b06e3f7b1d can: flexcan: fix VF610 state transition issue
f81db8e7d0cb can: peak/pci: fix potential bug when probe() fails
7b747f65c553 can: mcba_usb: fix device disconnect bug
0a3964b0a8d3 usb: f_fs: Force Reserved1=1 in OS_DESC_EXT_COMPAT
d1c24d05d7ec serdev: ttyport: fix tty locking in close
541fbaaf6db7 serdev: ttyport: fix NULL-deref on hangup
a6d00d0df9e5 serdev: ttyport: add missing receive_buf sanity checks
b30e0bedb66b usb: gadget: udc: renesas_usb3: fix number of the pipes

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 1f0b7d5e382e..cf6a733ceb69 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "84b640c582ad7f2a968003c38702b39fa6b903b0"
-SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
+SRCREV_machine ?= "7ba09f891939cbf2c58801a7a4a740365896d6ba"
+SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.25"
+LINUX_VERSION ?= "4.12.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index c63860a937bb..9d5e1582b531 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.25"
+LINUX_VERSION ?= "4.12.26"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
+SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index c244c99e7b06..ac98ca85fc3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b1aa2a86605847e98799eb7a9720659639b95c35"
-SRCREV_machine_qemuarm64 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_machine_qemumips ?= "f2e9eb5ef808d5bf6ef00e549e7f4a297e3101fa"
-SRCREV_machine_qemuppc ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_machine_qemux86 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_machine_qemux86-64 ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_machine_qemumips64 ?= "f4cade13f87df43e14d340e001b553dcf9665a8e"
-SRCREV_machine ?= "347393ce79e7c4aeb557e76a3255029ac35ff842"
-SRCREV_meta ?= "dcef2499cc6680ce49e1a79ca371bbce403e1b93"
+SRCREV_machine_qemuarm ?= "86b02dd23be1e3b3449885b38ed1b876ebec31e8"
+SRCREV_machine_qemuarm64 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_machine_qemumips ?= "67b93101c52504fd5077166c70baa296190e6166"
+SRCREV_machine_qemuppc ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_machine_qemux86 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_machine_qemux86-64 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_machine_qemumips64 ?= "38da8c72733da9619bbbddf14140204631faf488"
+SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
+SRCREV_meta ?= "367bd3633d5a661035f90f0b8daa38e97da1a587"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.25"
+LINUX_VERSION ?= "4.12.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


