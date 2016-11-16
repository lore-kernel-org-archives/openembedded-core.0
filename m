Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 643FC719D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAGEOdHF021743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Nov 2016 06:24:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 06:24:39 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Nov 2016 09:24:33 -0500
Message-ID: <4c47ae0f8486eedecf573960ac44ed9d800061b0.1479306112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479306112.git.bruce.ashfield@windriver.com>
References: <cover.1479306112.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.8: update from v4.8.6 -> v4.8.8
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
X-List-Received-Date: Wed, 16 Nov 2016 14:24:39 -0000
Content-Type: text/plain

Updating to the korg -stable release 4.8.8. The short log change
summary follows:

   61385cc1db42 Linux 4.8.8
   8ed841d6c045 scsi: megaraid_sas: fix macro MEGASAS_IS_LOGICAL to avoid regression
   32f60e9b621f scsi: megaraid_sas: Fix data integrity failure for JBOD (passthrough) devices
   eb2ca7aac349 usb: dwc3: gadget: properly account queued requests
   38db26fb3ae5 arch/powerpc: Update parameters for csum_tcpudp_magic & csum_tcpudp_nofold
   a143c6022cef packet: on direct_xmit, limit tso and csum to supported devices
   a6289d9ac3fe ip6_tunnel: Update skb->protocol to ETH_P_IPV6 in ip6_tnl_xmit()
   c9e086b9009a sctp: validate chunk len before actually using it
   5a37dce1b679 net sched filters: fix notification of filter delete with proper handle
   d46b19687fec net: ipv6: Do not consider link state for nexthop validation
   eb77db88ea11 macsec: Fix header length if SCI is added if explicitly disabled
   027ab3b8ee5a netvsc: fix incorrect receive checksum offloading
   b75edf27a6c3 udp: fix IP_CHECKSUM handling
   5ee356021c42 sctp: fix the panic caused by route update
   d90cbfaf5439 net: sctp, forbid negative length
   64774617da37 net: fec: Call swap_buffer() prior to IP header alignment
   c6c82c2b707e ipv4: use the right lock for ping_group_range
   8418193f7052 ipv4: disable BH in set_ping_group_range()
   23c110c4cdbc net: add recursion limit to GRO
   d3bbd04b92fd net: core: Correctly iterate over lower adjacency list
   fc5722f8f8f2 rtnetlink: Add rtnexthop offload flag to compare mask
   4ac3ca8c2933 switchdev: Execute bridge ndos only for bridge ports
   63d82a2cbd0c bridge: multicast: restore perm router ports on multicast enable
   e9a5921c393f net: pktgen: remove rcu locking in pktgen_change_name()
   2eeb5735dd04 net/mlx4_en: fixup xdp tx irq to match rx
   27bb6e31d32d IB/ipoib: move back IB LL address into the hard header
   f280126ec8d8 ipv6: correctly add local routes when lo goes up
   0f3e77623916 ip6_tunnel: fix ip6_tnl_lookup
   a148a818df84 net: phy: Trigger state machine on state change and not polling.
   2a9099899a6a ipv6: tcp: restore IP6CB for pktoptions skbs
   50b43ad1dce6 net_sched: reorder pernet ops and act ops registrations
   dac04913ee27 drivers/ptp: Fix kernel memory disclosure
   3f841d1555ad netlink: do not enter direct reclaim from netlink_dump()
   5086cadf8fa4 packet: call fanout_release, while UNREGISTERING a netdev
   6fff1319fdac net: Add netdev all_adj_list refcnt propagation to fix panic
   9caee42c800e net/sched: act_vlan: Push skb->data to mac_header prior calling skb_vlan_*() functions
   c002dfd8adaa net: pktgen: fix pkt_size
   ff1b27c31706 net: fec: set mac address unconditionally
   567aeca9fbb7 Linux 4.8.7
   1bf121d3b234 HID: usbhid: add ATEN CS962 to list of quirky devices
   05a833d4b051 cpufreq: intel_pstate: Set P-state upfront in performance mode
   c89771511deb ubi: fastmap: Fix add_vol() return value test in ubi_attach_fastmap()
   591bf1362e9e btrfs: qgroup: Prevent qgroup->reserved from going subzero
   0c879624701d kvm: x86: Check memopp before dereference (CVE-2016-8630)
   725a92be3926 ARM: fix oops when using older ARMv4T CPUs
   e339609bf377 tty: vt, fix bogus division in csi_J
   4a22930a74ac v4l: vsp1: Prevent pipelines from running when not streaming
   59f9693a170a usb: musb: Fix hardirq-safe hardirq-unsafe lock order error
   086ac9180437 usb: chipidea: host: fix NULL ptr dereference during shutdown
   07bae478e1c1 usb: dwc3: Fix size used in dma_free_coherent()
   fedede0963c4 pwm: Unexport children before chip removal
   7b4b77b9566d omapfb: fix return value check in dsi_bind()
   a3e55d6342b2 video: fbdev: pxafb: potential NULL dereference on error
   13d0f5b3a399 uapi: add missing install of sync_file.h
   db5025bd08ef UBI: fastmap: scrub PEB when bitflips are detected in a free PEB EC header
   cc94524e8940 netfilter: xt_NFLOG: fix unexpected truncated packet
   720a40113e78 i2c: mark device nodes only in case of successful instantiation
   f7d8d44a68de drm: i915: Wait for fences on new fb, not old
   1cefe4cb4f8c drm/i915/fbc: fix CFB size calculation for gen8+
   809e9e6fc390 drm/i915: Clean up DDI DDC/AUX CH sanitation
   ba0a959e0334 drm/i915: Respect alternate_aux_channel for all DDI ports
   426a724c9972 drm: Release reference from blob lookup after replacing property
   5064a6a05387 drm/dp/mst: Check peer device type before attempting EDID read
   e6fcf953a995 drm/i915/gen9: fix watermarks when using the pipe scaler
   0f7f9c456380 drm/i915/gen9: fix DDB partitioning for multi-screen cases
   0cc98b5963f8 drm/fb-helper: Keep references for the current set of used connectors
   14f4a463dc78 drm/fb-helper: Fix connector ref leak on error
   6222f1e0b9ef drm/fb-helper: Don't call dirty callback for untouched clips
   7290da41b8da drm/nouveau/acpi: fix check for power resources support
   fd5f9e1e28cb drm/radeon: drop register readback in cayman_cp_int_cntl_setup
   e136de5d7331 drm/radeon/si_dpm: workaround for SI kickers
   fe777e7a595c drm/radeon/si_dpm: Limit clocks on HD86xx part
   fa6227dbfd6a drm/imx: ipuv3-plane: Access old u/vbo properly in ->atomic_check for YU12/YV12
   d040374f3473 drm/imx: ipuv3-plane: Switch EBA buffer only when we don't need modeset
   51ed5a2bbf38 Revert "drm/radeon: fix DP link training issue with second 4K monitor"
   ac6f210dd7a6 md: be careful not lot leak internal curr_resync value into metadata. -- (all)
   eba4fe9db92f RAID10: ignore discard error
   21faa6dbf53f RAID1: ignore discard error
   b80fcd58e6f6 mmc: dw_mmc-pltfm: fix the potential NULL pointer dereference
   1244d3c3a0f6 scsi: arcmsr: Send SYNCHRONIZE_CACHE command to firmware
   2a1a0a6f1d60 scsi: scsi_debug: Fix memory leak if LBP enabled and module is unloaded
   5bac49422b4a ath10k: cache calibration data when the core is stopped
   a7d092e946f5 Revert "ath9k_hw: implement temperature compensation support for AR9003+"
   aea7cb3b7ceb mac80211: discard multicast and 4-addr A-MSDUs
   27fa1e735c70 firewire: net: fix fragmented datagram_size off-by-one
   032430fb6a2c firewire: net: guard against rx buffer overflows
   facb17b67ac9 Input: i8042 - add XMG C504 to keyboard reset table
   8b535f07898a rtl8xxxu: Fix rtl8723bu driver reload issue
   1c9edb27261e rtl8xxxu: Fix big-endian problem reporting mactime
   ece1b51ae1c4 rtl8xxxu: Fix memory leak in handling rxdesc16 packets
   5a805cd29284 dm raid: fix activation of existing raid4/10 devices
   6e5456768ba1 dm raid: fix compat_features validation
   056290446e8a dm rq: clear kworker_task if kthread_run() returned an error
   13a59a868756 dm table: fix missing dm_put_target_type() in dm_table_add_target()
   159a17e8dbf6 dm mirror: fix read error on recovery after default leg failure
   d8db5234adef virtio: console: Unlock vqs while freeing buffers
   7569d22a820d virtio_pci: Limit DMA mask to 44 bits for legacy virtio devices
   0c2f67a6196d virtio_ring: Make interrupt suppression spec compliant
   c528df925fba parisc: Ensure consistent state when switching to kernel stack at syscall entry
   592de1000694 ovl: fsync after copy-up
   3ad464dadb7c ovl: update S_ISGID when setting posix ACLs
   be9015460ed5 ovl: fix get_acl() on tmpfs
   2b632307635f MIPS: KASLR: Fix handling of NULL FDT
   1734afcce32b nfsd: Fix general protection fault in release_lock_stateid()
   202c6676b963 ARM: dts: fix the SD card on the Snowball
   db20b510ca5c ARM: mvebu: Select corediv clk for all mvebu v7 SoC
   c627b2e76ae2 KVM: MIPS: Precalculate MMIO load resume PC
   f3a0c969e788 KVM: MIPS: Make ERET handle ERL before EXL
   961cf133b710 KVM: s390: Fix STHYI buffer alignment for diag224
   88aca01f8cb4 KVM: x86: fix wbinvd_dirty_mask use-after-free
   ea261d177aed dm: free io_barrier after blk_cleanup_queue call
   377a2a273c4b Staging: wilc1000: Fix kernel Oops on opening the device
   0c4ffbf9e118 iio:chemical:atlas-ph-sensor: Fix use of 32 bit int to hold 16 bit big endian value
   52a1e76f16e2 arm64: dts: marvell: fix clocksource for CP110 master SPI0
   0dff3c6321a5 tty: limit terminal size to 4M chars
   44f0722dc9ac xhci: workaround for hosts missing CAS bit
   0894224ae7c0 xhci: add restart quirk for Intel Wildcatpoint PCH
   b2d28d93cf83 hv: do not lose pending heartbeat vmbus packets
   eeae0a12a166 vt: clear selection before resizing
   9710f5b19328 x86/smpboot: Init apic mapping before usage
   58b0a7f115f8 GenWQE: Fix bad page access during abort of resource allocation
   b9aa0a7290f5 usb: increase ohci watchdog delay to 275 msec
   241208e7b721 usb: renesas_usbhs: add wait after initialization for R-Car Gen3
   00dbeb06292b xhci: use default USB_RESUME_TIMEOUT when resuming ports.
   1e306cd37a66 USB: serial: ftdi_sio: add support for Infineon TriBoard TC2X7
   d082fd105eb9 USB: serial: cp210x: fix tiocmget error handling
   e8bf726705bd USB: serial: fix potential NULL-dereference at probe
   23124735a6f0 usb: gadget: function: u_ether: don't starve tx request queue
   fe4af125085a usb: gadget: udc: atmel: fix endpoint name
   420d16894425 mei: txe: don't clean an unprocessed interrupt cause.
   5d30e8f65073 ubifs: Fix regression in ubifs_readdir()
   b8176cc56bf1 ubifs: Abort readdir upon error
   1755f43e9a90 timers: Lock base for same bucket optimization
   e18ed431d7da timers: Plug locking race vs. timer migration
   b5e3a038997a timers: Prevent base clock corruption when forwarding
   665f7bf33aa8 timers: Prevent base clock rewind when forwarding clock
   0d621c57e739 x86/microcode/AMD: Fix more fallout from CONFIG_RANDOMIZE_MEMORY=y
   e599203f55ad powerpc/64: Fix race condition in setting lock bit in idle/wakeup code
   51d784b54768 powerpc/64: Re-fix race condition between going idle and entering guest
   2c7ff0e5c311 powerpc/mm/radix: Use tlbiel only if we ever ran on the current cpu
   ae150de2d5e0 powerpc: Convert cmp to cmpd in idle enter sequence
   1198fbca645e btrfs: fix races on root_log_ctx lists
   bc720ae2ffab cxl: Fix leaking pid refs in some error paths
   2a997e83960b ANDROID: binder: Clear binder and cookie when setting handle in flat binder struct
   599cfd58ffde ANDROID: binder: Add strong ref checks
   2a0efa30b15c ALSA: hda - Fix headset mic detection problem for two Dell laptops
   2585e17b71c7 ALSA: hda - Fix surround output pins for ASRock B150M mobo
   14456570a4a5 ALSA: hda - Adding a new group of pin cfg into ALC295 pin quirk table
   54186c7dd2ec ALSA: hda - allow 40 bit DMA mask for NVidia devices
   0f574c90d747 ALSA: seq: Fix time account regression
   8ccf154b2654 ALSA: usb-audio: Add quirk for Syntek STK1160
   9d3f5b85ef8b device-dax: fix percpu_ref_exit ordering
   33bcff297228 security/keys: make BIG_KEYS dependent on stdrng.
   5152986c9257 KEYS: Sort out big_key initialisation
   5daa841d0437 KEYS: Fix short sprintf buffer in /proc/keys show function
   0a38e6c551c4 thermal/powerclamp: correct cpu support check
   5db5e0c11c13 mm: memcontrol: do not recurse in direct reclaim
   68adb469dd3b mm/slab: fix kmemcg cache creation delayed issue
   67ae004e2c52 mm/list_lru.c: avoid error-path NULL pointer deref
   5cb73199ca48 libxfs: clean up _calc_dquots_per_chunk
   d00057ecf82f gpio: GPIO_GET_LINE{HANDLE,EVENT}_IOCTL: Fix file descriptor leak
   c70eb2cc1276 gpio: GPIOHANDLE_GET_LINE_VALUES_IOCTL: Fix another information leak
   6bba4b226521 gpio: GPIO_GET_LINEEVENT_IOCTL: Reject invalid line and event flags
   e2144827d96b gpio: GPIO_GET_LINEHANDLE_IOCTL: Reject invalid line flags
   c0699405b147 gpio: GPIO_GET_LINEEVENT_IOCTL: Validate line offset
   49bdfb21e37d gpio: GPIOHANDLE_GET_LINE_VALUES_IOCTL: Fix information leak
   e22edf53b40f gpio: GPIO_GET_LINEHANDLE_IOCTL: Validate line offset
   a23a59c56a53 gpio: GPIO_GET_CHIPINFO_IOCTL: Fix information leak
   78ae767553e4 gpio: GPIO_GET_CHIPINFO_IOCTL: Fix line offset validation
   56ffab4f532e gpio / ACPI: fix returned error from acpi_dev_gpio_irq_get()
   4366246129ca h8300: fix syscall restarting
   a639266ae0c3 spi: mark device nodes only in case of successful instantiation
   d6634d871199 spi: fsl-espi: avoid processing uninitalized data on error
   0cee66b72acc drm/dp/mst: Clear port->pdt when tearing down the i2c adapter
   f2ffb21fb495 i2c: core: fix NULL pointer dereference under race condition
   0fda1cdcbb72 i2c: xgene: Avoid dma_buffer overrun
   9c619c2a8d4d i2c: rk3x: Give the tuning value 0 during rk3x_i2c_v0_calc_timings

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index a03ea3782b3e..0996fa044e73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c3376689934aaf58b78cf7dd19af260a5386619e"
-SRCREV_meta ?= "860c23564d26e750f6c0a57a33580f316a10e19a"
+SRCREV_machine ?= "c4a91e62ea517274fde5ebb46916010eac5159f6"
+SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.6"
+LINUX_VERSION ?= "4.8.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index ab7a47ef7f63..120f268b96d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.6"
+LINUX_VERSION ?= "4.8.8"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
+SRCREV_machine ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
+SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index a92e9cff87e8..f9457051aa90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ae6282e4c25529f2649f8fa31d45c1b5bf5daf42"
-SRCREV_machine_qemuarm64 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_machine_qemumips ?= "87fd523e80256e404710624b5c45d76da369f9b5"
-SRCREV_machine_qemuppc ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_machine_qemux86 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_machine_qemux86-64 ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_machine_qemumips64 ?= "13669dd21e6c8e0cfccc1c6ccc3f83e272f0f6d1"
-SRCREV_machine ?= "efbdfa1ed95f7f0b4243351ffdb2d30e58308aeb"
-SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
+SRCREV_machine_qemuarm ?= "800a8564447b6ec75500b7cd6ebce78d652a466e"
+SRCREV_machine_qemuarm64 ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
+SRCREV_machine_qemumips ?= "e01c5adddc9e48bb2b3ae74ae5f12f356a6519dd"
+SRCREV_machine_qemuppc ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
+SRCREV_machine_qemux86 ?= "6745463c22f59717df34f819359ea2955611fd03"
+SRCREV_machine_qemux86-64 ?= "6745463c22f59717df34f819359ea2955611fd03"
+SRCREV_machine_qemumips64 ?= "b9217c2fa88d138f4082c730fb3b450f7c56da81"
+SRCREV_machine ?= "6745463c22f59717df34f819359ea2955611fd03"
+SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.6"
+LINUX_VERSION ?= "4.8.8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


