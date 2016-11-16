Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 393D771A08
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAGEOeal031750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Nov 2016 06:24:40 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 06:24:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Nov 2016 09:24:34 -0500
Message-ID: <ad82d7a1fcca76aa129cfafa695c3b5719647913.1479306112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479306112.git.bruce.ashfield@windriver.com>
References: <cover.1479306112.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/4.4: update to v4.4.32
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
X-List-Received-Date: Wed, 16 Nov 2016 14:24:40 -0000
Content-Type: text/plain

Updating from v4.4.30 -> v4.4.32. The shortlog summary of the changes
follows:

   4dab3e4df994 Linux 4.4.32
   ae94da4c53b7 scsi: megaraid_sas: fix macro MEGASAS_IS_LOGICAL to avoid regression
   2be0548e64f1 drm/radeon: fix DP mode validation
   ccc31f819918 drm/radeon/dp: add back special handling for NUTMEG
   227994b52c73 drm/amdgpu: fix DP mode validation
   2e8cfc1fe985 drm/amdgpu/dp: add back special handling for NUTMEG
   72c13445dfb4 KVM: MIPS: Drop other CPU ASIDs on guest MMU changes
   c57deabd2b17 Revert KVM: MIPS: Drop other CPU ASIDs on guest MMU changes
   e28a472742bf of: silence warnings due to max() usage
   d21daf7f3ee8 packet: on direct_xmit, limit tso and csum to supported devices
   bd891f40f04f sctp: validate chunk len before actually using it
   7c230d0e546a net sched filters: fix notification of filter delete with proper handle
   d46c76765da6 udp: fix IP_CHECKSUM handling
   80d59090d4e3 net: sctp, forbid negative length
   1a680e543f84 ipv4: use the right lock for ping_group_range
   827ada2d671b ipv4: disable BH in set_ping_group_range()
   3cb00b90e8b1 net: add recursion limit to GRO
   02558fa0e061 rtnetlink: Add rtnexthop offload flag to compare mask
   ebfbfc2e4df8 bridge: multicast: restore perm router ports on multicast enable
   f467184e2323 net: pktgen: remove rcu locking in pktgen_change_name()
   e635b4766174 ipv6: correctly add local routes when lo goes up
   f9d4850af3c8 ip6_tunnel: fix ip6_tnl_lookup
   705b5aca17c3 ipv6: tcp: restore IP6CB for pktoptions skbs
   6d123f1d396b netlink: do not enter direct reclaim from netlink_dump()
   d72cb5fb36bd packet: call fanout_release, while UNREGISTERING a netdev
   63091b2c1dea net: Add netdev all_adj_list refcnt propagation to fix panic
   9edbf4a0b60b net/sched: act_vlan: Push skb->data to mac_header prior calling skb_vlan_*() functions
   bb7ffb6b68a9 net: pktgen: fix pkt_size
   bc5d8ced3c98 net: fec: set mac address unconditionally
   0ee4acb7b3be tg3: Avoid NULL pointer dereference in tg3_io_error_detected()
   6eb0061fa630 ipmr, ip6mr: fix scheduling while atomic and a deadlock with ipmr_get_route
   4f312a802994 ip6_gre: fix flowi6_proto value in ip6gre_xmit_other()
   aadcd6a96010 tcp: fix a compile error in DBGUNDO()
   ac40148543c5 tcp: fix wrong checksum calculation on MTU probing
   d2e01b15657c net: avoid sk_forward_alloc overflows
   a35ce624a3ae tcp: fix overflow in __tcp_retransmit_skb()
   beb996c1c399 Linux 4.4.31
   78bd7c9bf60b HID: usbhid: add ATEN CS962 to list of quirky devices
   69e14ce88389 ubi: fastmap: Fix add_vol() return value test in ubi_attach_fastmap()
   91e1f7b0eb25 kvm: x86: Check memopp before dereference (CVE-2016-8630)
   62fa839b8fff tty: vt, fix bogus division in csi_J
   93fe5c7bb4e0 usb: dwc3: Fix size used in dma_free_coherent()
   4b06152a4822 pwm: Unexport children before chip removal
   353bbacfd57f UBI: fastmap: scrub PEB when bitflips are detected in a free PEB EC header
   1d79b67c4a8a Disable "frame-address" warning
   c5b2cd97b1d3 smc91x: avoid self-comparison warning
   603c78000f8c cgroup: avoid false positive gcc-6 warning
   8a618bc7e586 drm/exynos: fix error handling in exynos_drm_subdrv_open
   26a5f0596ff2 mm/cma: silence warnings due to max() usage
   58fca2f1563b ARM: 8584/1: floppy: avoid gcc-6 warning
   f0b13816ad4f powerpc/ptrace: Fix out of bounds array access warning
   eeae15feceaf x86/xen: fix upper bound of pmd loop in xen_cleanhighmap()
   95f2bdbe50d0 perf build: Fix traceevent plugins build race
   9702108e3def drm/dp/mst: Check peer device type before attempting EDID read
   1262212d3b8e drm/radeon: drop register readback in cayman_cp_int_cntl_setup
   1734d4e14221 drm/radeon/si_dpm: workaround for SI kickers
   231be2b99e4a drm/radeon/si_dpm: Limit clocks on HD86xx part
   4b32256b2706 Revert "drm/radeon: fix DP link training issue with second 4K monitor"
   a1ffa7c37a4c mmc: dw_mmc-pltfm: fix the potential NULL pointer dereference
   c77a2346226e scsi: arcmsr: Send SYNCHRONIZE_CACHE command to firmware
   69ee0ed0c6f9 scsi: scsi_debug: Fix memory leak if LBP enabled and module is unloaded
   9075faf1406c scsi: megaraid_sas: Fix data integrity failure for JBOD (passthrough) devices
   d9237e75fd74 mac80211: discard multicast and 4-addr A-MSDUs
   1d22568ce5ed firewire: net: fix fragmented datagram_size off-by-one
   46e14262a063 firewire: net: guard against rx buffer overflows
   304cc8b5b437 Input: i8042 - add XMG C504 to keyboard reset table
   daac9e1c85c9 dm mirror: fix read error on recovery after default leg failure
   88586a4f884c virtio: console: Unlock vqs while freeing buffers
   50e1c4d90aff virtio_ring: Make interrupt suppression spec compliant
   f2d9107bd0a0 parisc: Ensure consistent state when switching to kernel stack at syscall entry
   e3d312c435dd ovl: fsync after copy-up
   ab69d3a03e22 KVM: MIPS: Make ERET handle ERL before EXL
   159766dff4d4 KVM: x86: fix wbinvd_dirty_mask use-after-free
   cb270a3f1666 dm: free io_barrier after blk_cleanup_queue call
   f49f9df84eb2 USB: serial: cp210x: fix tiocmget error handling
   00877d139396 tty: limit terminal size to 4M chars
   e8a806797070 xhci: add restart quirk for Intel Wildcatpoint PCH
   fde4a5f237ab hv: do not lose pending heartbeat vmbus packets
   3425e397fb23 vt: clear selection before resizing
   dc1555e670c3 Fix potential infoleak in older kernels
   bd5cc3294de3 GenWQE: Fix bad page access during abort of resource allocation
   ce423aca0126 usb: increase ohci watchdog delay to 275 msec
   54af73d02eb4 xhci: use default USB_RESUME_TIMEOUT when resuming ports.
   a98f0e91b0fc USB: serial: ftdi_sio: add support for Infineon TriBoard TC2X7
   f2ecc94504f4 USB: serial: fix potential NULL-dereference at probe
   660c04e8f174 usb: gadget: function: u_ether: don't starve tx request queue
   c0510383011f mei: txe: don't clean an unprocessed interrupt cause.
   dc70a200aac2 ubifs: Fix regression in ubifs_readdir()
   0222377bb2cb ubifs: Abort readdir upon error
   f0d6ba518421 btrfs: fix races on root_log_ctx lists
   8910c3388253 ANDROID: binder: Clear binder and cookie when setting handle in flat binder struct
   14f09e8e7cd8 ANDROID: binder: Add strong ref checks
   c5be1e1314ee ALSA: hda - Fix headset mic detection problem for two Dell laptops
   34a8b859da9f ALSA: hda - Adding a new group of pin cfg into ALC295 pin quirk table
   4a30dbab6584 ALSA: hda - allow 40 bit DMA mask for NVidia devices
   b0b3d37edb19 ALSA: hda - Raise AZX_DCAPS_RIRB_DELAY handling into top drivers
   aa72457de77b ALSA: hda - Merge RIRB_PRE_DELAY into CTX_WORKAROUND caps
   d08ae42a106d ALSA: usb-audio: Add quirk for Syntek STK1160
   940d7ecbc57c KEYS: Fix short sprintf buffer in /proc/keys show function
   299991298b04 mm: memcontrol: do not recurse in direct reclaim
   9fa32e04f810 mm/list_lru.c: avoid error-path NULL pointer deref
   fd9e4cea96df libxfs: clean up _calc_dquots_per_chunk
   0daca12d6774 h8300: fix syscall restarting
   44084f15b706 drm/dp/mst: Clear port->pdt when tearing down the i2c adapter
   4125fe7f8d31 i2c: core: fix NULL pointer dereference under race condition
   eeb1846df1c8 i2c: xgene: Avoid dma_buffer overrun

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 27a4fa36bcd3..5842d716e7d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "634050bef6cb967f654a62557bc18dd620bf2e95"
-SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
+SRCREV_machine ?= "85e8c6c297d6d4a6f6694b69812030fff07a88fd"
+SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.30"
+LINUX_VERSION ?= "4.4.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 7e4fca43f3e8..6accc1850dea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.30"
+LINUX_VERSION ?= "4.4.32"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
+SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 0678448f054c..2f2b85b02f2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d752c82364bf890681c161d80717d174419e7512"
-SRCREV_machine_qemuarm64 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_machine_qemumips ?= "ebf27c56cf862b2d5fd08e229e027b5e4dff3609"
-SRCREV_machine_qemuppc ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_machine_qemux86 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_machine_qemux86-64 ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_machine_qemumips64 ?= "de5b483095712c0c347689ef98e2a9b95bed4c7a"
-SRCREV_machine ?= "3c15255fd62c2202d76b5c110265f16d33010b9d"
-SRCREV_meta ?= "d2d1decbd11e8f78b1aee36605d3653015d710e5"
+SRCREV_machine_qemuarm ?= "2041d76e0048b345098fbc680f5719da5d7dae7b"
+SRCREV_machine_qemuarm64 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_machine_qemumips ?= "0cd523cd89c13cb3674b55a6afe41aa976950fc1"
+SRCREV_machine_qemuppc ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_machine_qemux86 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_machine_qemux86-64 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_machine_qemumips64 ?= "baea2f5605baba0d49a9afac8a46717193ccef90"
+SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
+SRCREV_meta ?= "24ea5324fc90c7cb15ce1a08cdd294f22c6e6382"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.30"
+LINUX_VERSION ?= "4.4.32"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


