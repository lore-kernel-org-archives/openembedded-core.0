Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98C1A77AF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2SCwA76022433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Mar 2017 05:58:10 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:03 -0400
Message-ID: <2326807f9c415d9e1b457c558b54a8942bd751f5.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/4.10: update to v4.10.5
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:10 -0000
Content-Type: text/plain

Integrating the korg -stable release with the following shortlog
summary:

   034612ee057c Linux 4.10.5
   7814c9bd217a crypto: s5p-sss - Fix spinlock recursion on LRW(AES)
   4310604e21dd crypto: powerpc - Fix initialisation of crc32c context
   de3c88fa6a29 locking/rwsem: Fix down_write_killable() for CONFIG_RWSEM_GENERIC_SPINLOCK=y
   d80e46d90742 futex: Add missing error handling to FUTEX_REQUEUE_PI
   575caefc01f3 futex: Fix potential use-after-free in FUTEX_REQUEUE_PI
   57ad6c8ecb1f x86/perf: Fix CR4.PCE propagation to use active_mm instead of mm
   343146100991 x86/intel_rdt: Put group node in rdtgroup_kn_unlock
   7621600b480e x86/kasan: Fix boot with KASAN=y and PROFILE_ANNOTATED_BRANCHES=y
   bd5ee529d0be x86/tsc: Fix ART for TSC_KNOWN_FREQ
   a0256e0c0dc6 x86/unwind: Fix last frame check for aligned function stacks
   5b115b8b53d8 drm/i915/lspcon: Fix resume time initialization due to unasserted HPD
   ebd9dbabb5fc drm/i915/gen9+: Enable hotplug detection early
   b9208ab35001 drm/i915/lspcon: Enable AUX interrupts for resume time initialization
   1740a61cf09e irqchip/gicv3-its: Add workaround for QDF2400 ITS erratum 0065
   ef217ea7f1fb arm64: KVM: VHE: Clear HCR_TGE when invalidating guest TLBs
   f70ce6c63e02 dccp: fix memory leak during tear-down of unsuccessful connection request
   a79fa23c82a1 tun: fix premature POLLOUT notification on tun devices
   b34c9f7fe45e dccp/tcp: fix routing redirect race
   7ebf301d8476 net: use net->count to check whether a netns is alive or not
   47808872e25b bridge: drop netfilter fake rtable unconditionally
   fdb09132bdea ipv6: avoid write to a possibly cloned skb
   b74b74e2087e ipv6: make ECMP route replacement less greedy
   ed44bf89ab5f mpls: Do not decrement alive counter for unregister events
   61cc1778ad62 mpls: Send route delete notifications when router module is unloaded
   8e9bacd9add7 act_connmark: avoid crashing on malformed nlattrs with null parms
   cdb9caeb7177 amd-xgbe: Enable IRQs only if napi_complete_done() is true
   110e7778ea32 uapi: fix linux/packet_diag.h userspace compilation error
   5344ec08726a net/tunnel: set inner protocol in network gro hooks
   7360a1fda857 vrf: Fix use-after-free in vrf_xmit
   be18cce7e665 team: use ETH_MAX_MTU as max mtu
   92ab4dea27c1 dccp: fix use-after-free in dccp_feat_activate_values
   a6ff06211b84 net/sched: act_skbmod: remove unneeded rcu_read_unlock in tcf_skbmod_dump
   27d0c80f1089 net: fix socket refcounting in skb_complete_tx_timestamp()
   80691f3808fc net: fix socket refcounting in skb_complete_wifi_ack()
   81a43770b456 tcp: fix various issues for sockets morphing to listen state
   178e86ff331d strparser: destroy workqueue on module exit
   aa677aafef5c bonding: use ETH_MAX_MTU as max mtu
   0ee7666f639a amd-xgbe: Don't overwrite SFP PHY mod_absent settings
   9919f222968c amd-xgbe: Be sure to set MDIO modes on device (re)start
   4381ffdfb32b amd-xgbe: Stop the PHY before releasing interrupts
   7558c56cfe35 dccp: Unlock sock before calling sk_free()
   a8ee7ed1b03d ipv6: orphan skbs in reassembly unit
   eb39579a675a net: net_enable_timestamp() can be called from irq contexts
   fa8bc7b48168 net: don't call strlen() on the user buffer in packet_bind_spkt()
   e89adaa7d0cf net: bridge: allow IPv6 when multicast flood is disabled
   da2da823497c tcp/dccp: block BH for SYN processing
   8f05976cbfba mlxsw: spectrum_router: Avoid potential packets loss
   40f9f783920f geneve: lock RCU on TX path
   d6705c8c0cb0 vxlan: lock RCU on TX path
   4c94beba3aee l2tp: avoid use-after-free caused by l2tp_ip_backlog_recv
   639fdd961af0 net sched actions: decrement module reference count after table flush.
   467bec3656bd sctp: set sin_port for addr param when checking duplicate address
   91f4f5bfaa29 ipv4: mask tos for input route
   0a33d62a6f9d ipv4: add missing initialization for flowi4_uid
   2b5a48d6c6eb vxlan: don't allow overwrite of config src addr
   fef3f97a58b2 vti6: return GRE_KEY for vti6
   36ec2150ae0a vxlan: correctly validate VXLAN ID against VXLAN_N_VID
   f44877534257 sctp: deny peeloff operation on asocs with threads sleeping on it
   55bb0dd0256c net/mlx5e: Fix wrong CQE decompression
   c0dc4855e92b net/mlx5e: Update MPWQE stride size when modifying CQE compress state
   c34c17861ab1 net/mlx5e: Fix broken CQE compression initialization
   850a1bfbf35d net/mlx5e: Do not reduce LRO WQE size when not using build_skb
   96b457b80526 net/mlx5e: Register/unregister vport representors on interface attach/detach
   8ea22fb3114d Linux 4.10.4
   42b16fffb79b IB/mlx5: Verify that Q counters are supported
   dc37bb8db47b ext4: don't BUG when truncating encrypted inodes on the orphan list
   1cda29082a30 rc: raw decoder for keymap protocol is not loaded on register
   22fc2f9efa27 dm: flush queued bios when process blocks to avoid deadlock
   2030aedc5404 serial_ir: ensure we're ready to receive interrupts
   81383a00ce83 drm/i915/gvt: Fix superfluous newline in GVT_DISPLAY_READY env var
   523379cd6b65 KVM: arm/arm64: Let vcpu thread modify its own active state
   1f9175b9ee7c KVM: s390: Fix guest migration for huge guests resulting in panic
   45dc259a4734 serial: samsung: Continue to work if DMA request fails
   7daf817d076d USB: serial: io_ti: fix information leak in completion handler
   9bb084c79f20 USB: serial: io_ti: fix NULL-deref in interrupt callback
   14bca59b1660 USB: iowarrior: fix NULL-deref in write
   5ec59765f503 USB: iowarrior: fix NULL-deref at probe
   cc6ba470ebf8 USB: serial: omninet: fix reference leaks at open
   dc944b117e6c USB: serial: safe_serial: fix information leak in completion handler
   a062cb395946 usb: host: xhci-plat: Fix timeout on removal of hot pluggable xhci controllers
   7202353681d5 usb: host: xhci-dbg: HCIVERSION should be a binary number
   222095ea6487 Revert "usb: gadget: uvc: Add missing call for additional setup data"
   d60b1053a5bb usb: gadget: function: f_fs: pass companion descriptor along
   a0f69738c10e usb: ohci-at91: Do not drop unhandled USB suspend control requests
   25b1a4fdd8ae usb: dwc3-omap: Fix missing break in dwc3_omap_set_mailbox()
   894a0dfaaef7 usb: dwc3: gadget: make Set Endpoint Configuration macros safe
   c73210fdd40d usb: gadget: dummy_hcd: clear usb_gadget region before registration
   b5ea65b25a33 PCI: Prevent VPD access for QLogic ISP2722
   27469baaef1a powerpc/xics: Work around limitations of OPAL XICS priority handling
   74e236a5bd99 powerpc/booke: Fix boot crash due to null hugepd
   1006828d1104 powerpc: Emulation support for load/store instructions on LE
   80eae855b694 i2c: add missing of_node_put in i2c_mux_del_adapters
   be20197df07d dw2102: don't do DMA on stack
   7399dec22e72 efi/arm: Fix boot crash with CONFIG_CPUMASK_OFFSTACK=y
   da603aadd53a ucount: Remove the atomicity from ucount->count
   b7e9ef5cf4d9 tracing: Add #undef to fix compile error
   3eded4f5bab1 i2c: bcm2835: Avoid possible NULL ptr dereference
   393be4bcb329 MIPS: ralink: Remove unused rt*_wdt_reset functions
   4ddb085a9b0a MIPS: ralink: Remove unused timer functions
   e1d9f7592b80 MIPS: ralink: Cosmetic change to prom_init().
   02b210c18667 mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
   ee9cc4c573d5 MIPS: Update lemote2f_defconfig for CPU_FREQ_STAT change
   9ad686e6937a MIPS: ip22: Fix ip28 build for modern gcc
   715bb84b6ff6 MIPS: Update ip27_defconfig for SCSI_DH change
   b57e5d5daf99 MIPS: ip27: Disable qlge driver in defconfig
   2260890bb6c7 MIPS: VDSO: avoid duplicate CAC_BASE definition
   d2b0d01a11b3 MIPS: Update defconfigs for NF_CT_PROTO_DCCP/UDPLITE change
   aab419fc3980 crypto: improve gcc optimization flags for serpent and wp512
   5af39bb8492f USB: serial: digi_acceleport: fix OOB-event processing
   2d32308355a8 USB: serial: digi_acceleport: fix OOB data sanity check
   a3137ad2e14f ARM: qcom_defconfig: Enable RPM/RPM-SMD clocks
   fa190b2a7f87 iio: 104-quad-8: Fix off-by-one error when addressing flag register
   adfb98cd3e93 Linux 4.10.3
   070dfed4d04e drivers: hv: Turn off write permission on the hypercall page
   9cafe6bb9aa2 fat: fix using uninitialized fields of fat_inode/fsinfo_inode
   0d9cc8aa34ad kasan: resched in quarantine_remove_cache()
   44c95966fb81 mm: do not call mem_cgroup_free() from within mem_cgroup_alloc()
   933f0f3ad49a thp: fix another corner case of munlock() vs. THPs
   459bc5065631 x86/tlb: Fix tlb flushing when lguest clears PGE
   ac312c7e0a90 x86, mm: fix gup_pte_range() vs DAX mappings
   0af36e434a3c libceph: use BUG() instead of BUG_ON(1)
   cde805106887 drm/i915: Fix not finding the VBT when it overlaps with OPREGION_ASLE_EXT
   5eeb3c0eb7ec drm/i915: Pass timeout==0 on to i915_gem_object_wait_fence()
   d11d14c5fc0b drm/i915: Check for timeout completion when waiting for the rq to submitted
   e2a946bb97bb drm/i915: Avoid spurious WARNs about the wrong pipe in the PPS code
   c50f65f12705 drm/i915: Recreate internal objects with single page segments if dmar fails
   4a8a58eed276 drm: Cancel drm_fb_helper_resume_work on unload
   616c9bd8b288 drm: Cancel drm_fb_helper_dirty_work on unload
   cdb4f19aae0f drm/i915/gvt: Disable access to stolen memory as a guest
   f7189c6bb9f2 drm/atomic: fix an error code in mode_fixup()
   99eb5a10a7f7 drm/imx: imx-tve: Do not set the regulator voltage
   5e0b0839f3ce drm/vmwgfx: Work around drm removal of control nodes
   e6d03fc74541 drm/ttm: Make sure BOs being swapped out are cacheable
   0586602fc10f drm/edid: Add EDID_QUIRK_FORCE_8BPC quirk for Rotel RSX-1058
   68279b15119b drm/radeon: handle vfct with multiple vbios images
   e51353092182 drm/ast: Fix AST2400 POST failure without BMC FW or VBIOS
   cd8183923984 drm/ast: Call open_key before enable_mmio in POST code
   f38a3c87d6ee drm/ast: Fix test for VGA enabled
   af7fe73a14fc drm/ast: Handle configuration without P2A bridge
   0f9e6fc5b76d Revert "drm/amdgpu: update tile table for oland/hainan"
   2deaea3e0d07 drm/amdgpu/pm: check for headless before calling compute_clocks
   33d129a09aae drm/amdgpu: add more cases to DCE11 possible crtc mask setup
   fc758b77745e mac80211: use driver-indicated transmitter STA only for data frames
   4a6d105fb277 mac80211: don't handle filtered frames within a BA session
   df7db05561f6 mac80211: don't reorder frames with SN smaller than SSN
   f5bf0a15c63e mac80211: flush delayed work when entering suspend
   ea708e9581d8 nfit, libnvdimm: fix interleave set cookie calculation
   3f56c495a42e xtensa: move parse_tag_fdt out of #ifdef CONFIG_BLK_DEV_INITRD
   5a4312c2a651 pwm: pca9685: Fix period change with same duty cycle
   c634f19b9501 nlm: Ensure callback code also checks that the files match
   1a02f33a6302 drivers/pci/hotplug: Fix initial state for empty slot
   487163f3f316 drivers/pci/hotplug: Handle presence detection change properly
   f9b90f204749 target: Fix NULL dereference during LUN lookup + active I/O shutdown
   81bd29553ee3 pci/hotplug/pnv-php: Disable surprise hotplug capability on conflicts
   7e8b77528445 pci/hotplug/pnv-php: Remove WARN_ON() in pnv_php_put_slot()
   ab3398e159fd ceph: remove req from unsafe list when unregistering it
   0569b5ed3e73 ktest: Fix child exit code processing
   9dbea7f7bcec tracing: Fix return value check in trace_benchmark_reg()
   8a915b3ccbb2 memory/atmel-ebi: Fix ns <-> cycles conversions
   a4755943204e orangefs: Use RCU for destroy_inode
   2708a2d33e04 Btrfs: fix data loss after truncate when using the no-holes feature
   ade784b0f3a7 fs: Better permission checking for submounts
   35065a1f6ec2 IB/srp: Fix race conditions related to task management
   a9397e4365d6 IB/srp: Avoid that duplicate responses trigger a kernel bug
   a51892e0c136 IB/SRP: Avoid using IB_MR_TYPE_SG_GAPS
   e0d15d562ee7 IB/mlx5: Fix out-of-bound access
   b92c4a09f589 IB/IPoIB: Add destination address when re-queue packet
   91948b0944af IB/ipoib: Fix deadlock between rmmod and set_mode
   6de9d08a9718 mnt: Tuck mounts under others instead of creating shadow/side mounts.
   f03d5078063c brcmfmac: fix incorrect event channel deduction
   8cdfa0d8b0f5 cxl: fix nested locking hang during EEH hotplug
   e5603a5c6deb cxl: Prevent read/write to AFU config space while AFU not configured
   4144a307cb46 net: mvpp2: fix DMA address calculation in mvpp2_txq_inc_put()
   c9ac3e943deb s390: use correct input data address for setup_randomness
   0075504d83ce s390: make setup_randomness work
   ca54585dd5dd s390/topology: correct allocation of topology information
   c61a874ea0ec s390: TASK_SIZE for kernel threads
   162668c000ab s390/chsc: Add exception handler for CHSC instruction
   836f9814f092 s390/kdump: Use "LINUX" ELF note name instead of "CORE"
   1f2659aa7dfe s390/dcssblk: fix device size calculation in dcssblk_direct_access()
   3c3c4d25c589 s390/qdio: clear DSCI prior to scanning multiple input queues
   ac7c6461addb phy: qcom-ufs: Fix misplaced jump label
   04b5101049ac phy: qcom-ufs: Don't kfree devres resource
   a6ed492d6cca Bluetooth: Add another AR3012 04ca:3018 device
   3904b32cfe50 KVM: VMX: use correct vmcs_read/write for guest segment selector/base
   f89d6db0c50c KVM: s390: Disable dirty log retrieval for UCONTROL guests
   c9dc3873046e serial: 8250_pci: Add MKS Tenta SCOM-0800 and SCOM-0801 cards
   72e544022383 tty: n_hdlc: get rid of racy n_hdlc.tbuf

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 43e12fc014a9..e562e0e92813 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
+SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.2"
+LINUX_VERSION ?= "4.10.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index dfc5bf883f86..e03c3cc0fc5c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10.2"
+LINUX_VERSION ?= "4.10.5"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
+SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 0012d5c9156c..a6b57a107161 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ad30e5e8b96e0db4fb618b1320f1a9cb5ad175a8"
-SRCREV_machine_qemuarm64 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_machine_qemumips ?= "b21d6ab39ba16f05780aaff518a2d7274fc0ce5f"
-SRCREV_machine_qemuppc ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_machine_qemux86 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_machine_qemux86-64 ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_machine_qemumips64 ?= "4cd89b5ee382b61f90b81903934a1edfd836b617"
-SRCREV_machine ?= "827a1164b155110c65f028a13a6c5699be93bbc3"
-SRCREV_meta ?= "69bfa872343a413322c2a1289f25d24a2db2728d"
+SRCREV_machine_qemuarm ?= "b97dcd4f063c3d8c1d7fac555c0a189fe44b1eec"
+SRCREV_machine_qemuarm64 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_machine_qemumips ?= "6bebfa141f0e378673c810aaf3427168848a0b02"
+SRCREV_machine_qemuppc ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_machine_qemux86 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_machine_qemux86-64 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_machine_qemumips64 ?= "0602a7509bac454c4ca4efd6fc26de4badc3d938"
+SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
+SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.2"
+LINUX_VERSION ?= "4.10.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


