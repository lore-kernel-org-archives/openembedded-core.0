Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5117E77A4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2SCwBQO020688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Mar 2017 05:58:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:04 -0400
Message-ID: <6d4e34bc6ca9db5722af39713f03c0782d186969.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/4.9: update to v4.9.17
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:11 -0000
Content-Type: text/plain

Integrating the korg -stable release with the following shortlogs:

   c3825da143fc Linux 4.9.17
   ecdc5b12d7a0 crypto: powerpc - Fix initialisation of crc32c context
   c40609652267 locking/rwsem: Fix down_write_killable() for CONFIG_RWSEM_GENERIC_SPINLOCK=y
   1522181f4bc1 futex: Add missing error handling to FUTEX_REQUEUE_PI
   6244ffc5a122 futex: Fix potential use-after-free in FUTEX_REQUEUE_PI
   9f9115b67aa5 x86/perf: Fix CR4.PCE propagation to use active_mm instead of mm
   24ba2842a49d x86/kasan: Fix boot with KASAN=y and PROFILE_ANNOTATED_BRANCHES=y
   5ec98e6ffdce x86/tsc: Fix ART for TSC_KNOWN_FREQ
   095635be809a irqchip/gicv3-its: Add workaround for QDF2400 ITS erratum 0065
   61e79860b4bc arm64: KVM: VHE: Clear HCR_TGE when invalidating guest TLBs
   8ca7ef0d9af9 drm/vc4: Fix ->clock_select setting for the VEC encoder
   6b3306706733 drm/vc4: Fix race between page flip completion event and clean-up
   f4d40cfd61ea clk: bcm2835: Fix ->fixed_divider of pllh_aux
   7885195b9177 powerpc/mm: Fix build break when CMA=n && SPAPR_TCE_IOMMU=y
   ce7aeffe7596 usb: gadget: udc: atmel: remove memory leak
   4fa1c65cf040 serial: 8250_pci: Detach low-level driver during PCI error recovery
   56c28e7983a8 ACPI / blacklist: Make Dell Latitude 3350 ethernet work
   5c19e9070df8 ACPI / blacklist: add _REV quirks for Dell Precision 5520 and 3520
   bc01eb939899 slub: move synchronize_sched out of slab_mutex on shrink
   bd2de45031b9 uvcvideo: uvc_scan_fallback() for webcams with broken chain
   e627116c0c35 s390/zcrypt: Introduce CEX6 toleration
   61a153d06ef4 block: allow WRITE_SAME commands with the SG_IO ioctl
   0042afe117c6 drm/nouveau/disp/nv50-: specify ctrl/user separately when constructing classes
   5001756c1c70 drm/nouveau/disp/nv50-: split chid into chid.ctrl and chid.user
   ddc23b5212b9 drm/nouveau/disp/gp102: fix cursor/overlay immediate channel indices
   53e18968a9c0 vfio/spapr: Postpone default window creation
   2e60baca235b vfio/spapr: Add a helper to create default DMA window
   080eb13542a8 powerpc/mm/iommu, vfio/spapr: Put pages on VFIO container shutdown
   92e44bcd71ae vfio/spapr: Reference mm in tce_container
   5b34666bd2e7 powerpc/iommu: Stop using @current in mm_iommu_xxx
   2ba7ef21820e powerpc/iommu: Pass mm_struct to init/cleanup helpers
   5d8b3e755974 vfio/spapr: Postpone allocation of userspace version of TCE table
   3c0cbb47a8d6 Drivers: hv: ring_buffer: count on wrap around mappings in get_next_pkt_raw() (v2)
   3e5a7f5b95f0 ibmveth: calculate gso_segs for large packets
   fb7c521a1460 PCI: Do any VF BAR updates before enabling the BARs
   3d58444dea81 PCI: Ignore BAR updates on virtual functions
   74cce811a4b6 PCI: Update BARs using property bits appropriate for type
   a38012dc69eb PCI: Don't update VF BARs while VF memory space is enabled
   bb479246bb3e PCI: Decouple IORESOURCE_ROM_ENABLE and PCI_ROM_ADDRESS_ENABLE
   ed09d211d28e PCI: Add comments about ROM BAR updating
   7b65c3a84311 PCI: Remove pci_resource_bar() and pci_iov_resource_bar()
   6a5f3e664ac7 PCI: Separate VF BAR updates from standard BAR updates
   29d928785f5e x86/hyperv: Handle unknown NMIs on one CPU when unknown_nmi_panic
   456be98b4e79 scsi: ibmvscsis: Synchronize cmds at remove time
   94700877c25f scsi: ibmvscsis: Synchronize cmds at tpg_enable_store time
   189491f81cf6 scsi: ibmvscsis: Rearrange functions for future patches
   4d36f4859fa4 scsi: ibmvscsis: Clean up properly if target_submit_cmd/tmr fails
   29022860df8e scsi: ibmvscsis: Return correct partition name/# to client
   0ad1d7660a57 scsi: ibmvscsis: Issues from Dan Carpenter/Smatch
   61229e62c1aa igb: add i211 to i210 PHY workaround
   15ffc931eeb9 igb: Workaround for igb i210 firmware issue
   4b40611a9b7e xen: do not re-use pirq number cached in pci device msi msg data
   2382c1486c62 dmaengine: iota: ioat_alloc_chan_resources should not perform sleeping allocations.
   0e0f1d6fdb35 bpf: fix mark_reg_unknown_value for spilled regs on map value marking
   1889d6d9b5e7 bpf: fix regression on verifier pruning wrt map lookups
   b7f5aa1ca0be bpf: fix state equivalence
   1411707acb85 bpf: Detect identical PTR_TO_MAP_VALUE_OR_NULL registers
   9e38375a4b17 dccp: fix memory leak during tear-down of unsuccessful connection request
   beaa66cce556 tun: fix premature POLLOUT notification on tun devices
   98933eb36dd2 dccp/tcp: fix routing redirect race
   9bce26f224d8 bridge: drop netfilter fake rtable unconditionally
   683100ed4576 ipv6: avoid write to a possibly cloned skb
   4a8d3bb73a82 ipv6: make ECMP route replacement less greedy
   87c0286a07f9 mpls: Do not decrement alive counter for unregister events
   b61206e25302 mpls: Send route delete notifications when router module is unloaded
   47c8dc47c008 act_connmark: avoid crashing on malformed nlattrs with null parms
   ccb65adc6ca6 uapi: fix linux/packet_diag.h userspace compilation error
   b07eed8f7119 net/tunnel: set inner protocol in network gro hooks
   db6e7796186a vrf: Fix use-after-free in vrf_xmit
   7c0eaeec84d1 dccp: fix use-after-free in dccp_feat_activate_values
   5f79aab41ded net/sched: act_skbmod: remove unneeded rcu_read_unlock in tcf_skbmod_dump
   f157cc1d7251 net: fix socket refcounting in skb_complete_tx_timestamp()
   98fa3d2a8e39 net: fix socket refcounting in skb_complete_wifi_ack()
   07753bc6a281 tcp: fix various issues for sockets morphing to listen state
   4547f03d1a62 strparser: destroy workqueue on module exit
   51ae1fbcf173 dccp: Unlock sock before calling sk_free()
   0bcc319d554c ipv6: orphan skbs in reassembly unit
   3d87dce3dfd6 net: net_enable_timestamp() can be called from irq contexts
   62fe0521fb6c net: don't call strlen() on the user buffer in packet_bind_spkt()
   fa7c48fb3ad1 net: bridge: allow IPv6 when multicast flood is disabled
   bbaeb9b73fa8 tcp/dccp: block BH for SYN processing
   8f4db60c7fb5 mlxsw: spectrum_router: Avoid potential packets loss
   02595f472548 geneve: lock RCU on TX path
   0a40da4a74f1 vxlan: lock RCU on TX path
   feaa5bab4335 net: phy: Avoid deadlock during phy_error()
   837786cbbb60 l2tp: avoid use-after-free caused by l2tp_ip_backlog_recv
   063893e4ec88 net sched actions: decrement module reference count after table flush.
   36931eb015ee ipv4: mask tos for input route
   a64407fafe09 vxlan: don't allow overwrite of config src addr
   f7081057d12c vti6: return GRE_KEY for vti6
   ee2da79de289 vxlan: correctly validate VXLAN ID against VXLAN_N_VID
   0c6e38e791e9 net/mlx5e: Fix wrong CQE decompression
   a63326646995 net/mlx5e: Do not reduce LRO WQE size when not using build_skb
   9e354abf9ce3 net/mlx5e: Register/unregister vport representors on interface attach/detach
   8a16224b4054 Linux 4.9.16
   c8186699527b IB/mlx5: Verify that Q counters are supported
   8fed8fc18839 ext4: don't BUG when truncating encrypted inodes on the orphan list
   39df5977fd41 rc: raw decoder for keymap protocol is not loaded on register
   21582cd0b64c dm: flush queued bios when process blocks to avoid deadlock
   d29e6215e5ab KVM: arm/arm64: Let vcpu thread modify its own active state
   9d89c20f3b8f KVM: s390: Fix guest migration for huge guests resulting in panic
   ce8ab5f168f6 serial: samsung: Continue to work if DMA request fails
   d0ef6ecee85e USB: serial: io_ti: fix information leak in completion handler
   449b0bb23708 USB: serial: io_ti: fix NULL-deref in interrupt callback
   f06b17020a84 USB: iowarrior: fix NULL-deref in write
   653418adaf10 USB: iowarrior: fix NULL-deref at probe
   6d6c5895f454 USB: serial: omninet: fix reference leaks at open
   0ab90ddba78a USB: serial: safe_serial: fix information leak in completion handler
   24db1c5a1c52 usb: host: xhci-plat: Fix timeout on removal of hot pluggable xhci controllers
   d86376790752 usb: host: xhci-dbg: HCIVERSION should be a binary number
   03123df08e6b Revert "usb: gadget: uvc: Add missing call for additional setup data"
   5ce2e4ce4a8a usb: gadget: function: f_fs: pass companion descriptor along
   40192c96660f usb: ohci-at91: Do not drop unhandled USB suspend control requests
   accadd8164b7 usb: dwc3-omap: Fix missing break in dwc3_omap_set_mailbox()
   808ee146d733 usb: dwc3: gadget: make Set Endpoint Configuration macros safe
   de90394b0c6b usb: gadget: dummy_hcd: clear usb_gadget region before registration
   ed99f5a09cc6 PCI: Prevent VPD access for QLogic ISP2722
   1ced52ead244 powerpc/xics: Work around limitations of OPAL XICS priority handling
   bc8d2eefe63f powerpc: Emulation support for load/store instructions on LE
   ac4666a7fd1a i2c: add missing of_node_put in i2c_mux_del_adapters
   06996254a605 dw2102: don't do DMA on stack
   56d91e106b13 efi/arm: Fix boot crash with CONFIG_CPUMASK_OFFSTACK=y
   ee6f7ee1e4cd ucount: Remove the atomicity from ucount->count
   8bb208d02acc tracing: Add #undef to fix compile error
   b72ae5ca7a8b cpmac: remove hopeless #warning
   04275d2a8af3 bcm63xx_enet: avoid uninitialized variable warning
   b7e968da04d7 MIPS: ralink: Remove unused rt*_wdt_reset functions
   dd2419e1cec0 MIPS: ralink: Remove unused timer functions
   f34064186f0e MIPS: ralink: Cosmetic change to prom_init().
   7b767f6b515d mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
   976e40d7f6fe MIPS: Update lemote2f_defconfig for CPU_FREQ_STAT change
   dd2ef28eb76e MIPS: ip22: Fix ip28 build for modern gcc
   aff853abd298 MIPS: Update ip27_defconfig for SCSI_DH change
   23096c56787e MIPS: ip27: Disable qlge driver in defconfig
   ad8387a60228 MIPS: VDSO: avoid duplicate CAC_BASE definition
   5841e3d37db9 MIPS: Update defconfigs for NF_CT_PROTO_DCCP/UDPLITE change
   2c1820ea8dcc crypto: improve gcc optimization flags for serpent and wp512
   ce4d67cb3e6e USB: serial: digi_acceleport: fix OOB-event processing
   e1533c46151c USB: serial: digi_acceleport: fix OOB data sanity check
   d962bf8dd954 Linux 4.9.15
   182ff0ebbdab drivers: hv: Turn off write permission on the hypercall page
   63e873679ba9 fat: fix using uninitialized fields of fat_inode/fsinfo_inode
   16ace91043bf mm: do not call mem_cgroup_free() from within mem_cgroup_alloc()
   1771fc58a35d thp: fix another corner case of munlock() vs. THPs
   2f18b39499b2 x86/tlb: Fix tlb flushing when lguest clears PGE
   91cdd9d79616 x86, mm: fix gup_pte_range() vs DAX mappings
   290215a2abfd libceph: use BUG() instead of BUG_ON(1)
   ff3bcdc9b5f0 drm/i915: Fix not finding the VBT when it overlaps with OPREGION_ASLE_EXT
   686ea5862eb6 drm/i915: Avoid spurious WARNs about the wrong pipe in the PPS code
   967e17bcc96d drm: Cancel drm_fb_helper_resume_work on unload
   9edc456fe621 drm: Cancel drm_fb_helper_dirty_work on unload
   868a747c77cb drm/i915/gvt: Disable access to stolen memory as a guest
   f72b751f4340 drm/atomic: fix an error code in mode_fixup()
   98620b564fad drm/imx: imx-tve: Do not set the regulator voltage
   3a654a85932f dmaengine: imx-sdma - correct the dma transfer residue calculation
   56a567de553e drm/vmwgfx: Work around drm removal of control nodes
   55f47122c2e8 drm/ttm: Make sure BOs being swapped out are cacheable
   ec8e40b117c3 drm/edid: Add EDID_QUIRK_FORCE_8BPC quirk for Rotel RSX-1058
   f96c10c2bd1b drm/ast: Fix AST2400 POST failure without BMC FW or VBIOS
   5da03582e212 drm/ast: Call open_key before enable_mmio in POST code
   54aa80e300d6 drm/ast: Fix test for VGA enabled
   0734a3213ca8 drm/amdgpu: add more cases to DCE11 possible crtc mask setup
   b507df2e236e mac80211: use driver-indicated transmitter STA only for data frames
   39813849996f mac80211: don't handle filtered frames within a BA session
   42e7f3771429 mac80211: don't reorder frames with SN smaller than SSN
   b116db0da1bd mac80211: flush delayed work when entering suspend
   9ad1571da2c0 nfit, libnvdimm: fix interleave set cookie calculation
   a7b9c9ddb6f4 xtensa: move parse_tag_fdt out of #ifdef CONFIG_BLK_DEV_INITRD
   019c088dc403 pwm: pca9685: Fix period change with same duty cycle
   1f2f16c7b7e3 nlm: Ensure callback code also checks that the files match
   4f77c55c3ac2 drivers/pci/hotplug: Fix initial state for empty slot
   1afe7b4ac3df drivers/pci/hotplug: Handle presence detection change properly
   17ea11d55322 target: Fix NULL dereference during LUN lookup + active I/O shutdown
   54eff720c99f pci/hotplug/pnv-php: Disable surprise hotplug capability on conflicts
   4ee3508f7abe pci/hotplug/pnv-php: Remove WARN_ON() in pnv_php_put_slot()
   5da90d0018a7 ceph: remove req from unsafe list when unregistering it
   ff61e0123b7d ktest: Fix child exit code processing
   1f2ca141ec53 memory/atmel-ebi: Fix ns <-> cycles conversions
   b2b0f6ffd3f9 orangefs: Use RCU for destroy_inode
   d3381fab77cb fs: Better permission checking for submounts
   48e2181b0b8d IB/srp: Fix race conditions related to task management
   d5d1d2cc4be7 IB/srp: Avoid that duplicate responses trigger a kernel bug
   516a12ab11bd IB/SRP: Avoid using IB_MR_TYPE_SG_GAPS
   04f16db056d0 IB/mlx5: Fix out-of-bound access
   2e539fa49efd IB/IPoIB: Add destination address when re-queue packet
   1626076b8e1c IB/ipoib: Fix deadlock between rmmod and set_mode
   808e83e5add1 mnt: Tuck mounts under others instead of creating shadow/side mounts.
   c9b3f3173fa5 brcmfmac: fix incorrect event channel deduction
   53d43706f2ba cxl: fix nested locking hang during EEH hotplug
   411d0b0ced69 cxl: Prevent read/write to AFU config space while AFU not configured
   60037aa689ba net: mvpp2: fix DMA address calculation in mvpp2_txq_inc_put()
   e067f68db256 s390: use correct input data address for setup_randomness
   321081d522d3 s390: make setup_randomness work
   9d38fd6a4f6c s390: TASK_SIZE for kernel threads
   dc31841fcdce s390/chsc: Add exception handler for CHSC instruction
   91cfcaa6ed46 s390/kdump: Use "LINUX" ELF note name instead of "CORE"
   b848102542f5 s390/dcssblk: fix device size calculation in dcssblk_direct_access()
   5cec5e32ba56 s390/qdio: clear DSCI prior to scanning multiple input queues
   519b6cead21e Bluetooth: Add another AR3012 04ca:3018 device
   7c3bab189c16 KVM: VMX: use correct vmcs_read/write for guest segment selector/base
   035dcc8e87f6 KVM: s390: Disable dirty log retrieval for UCONTROL guests
   c4c590be4944 serial: 8250_pci: Add MKS Tenta SCOM-0800 and SCOM-0801 cards
   e5b977876155 tty: n_hdlc: get rid of racy n_hdlc.tbuf

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 7e801a3aae9a..e5f8e1d44ce2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3e5e058d8df10a5495effd069098934dc0859f2e"
-SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
+SRCREV_machine ?= "66f4ce788d6bd16e858ec3d32b8b0f91619eb356"
+SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.13"
+LINUX_VERSION ?= "4.9.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index ae4d38e4ddd2..fefe309b0f38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.13"
+LINUX_VERSION ?= "4.9.17"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
+SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 1c616e880d9e..17bbdbabb2f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "68df4c9ef9dcc59836e9e0a932bca9a4e6c201b7"
-SRCREV_machine_qemuarm64 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_machine_qemumips ?= "864b3dc5e39eaf1a6b8665894ef4ff34396d8704"
-SRCREV_machine_qemuppc ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_machine_qemux86 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_machine_qemux86-64 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_machine_qemumips64 ?= "ac72601920adbc163cd691fa060177137e41bf22"
-SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
+SRCREV_machine_qemuarm ?= "3ff3760c2ac7cfd04904b3c9ac36567cf75594bf"
+SRCREV_machine_qemuarm64 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_machine_qemumips ?= "53bf87a63316d6355be679f0f10bdaf694a94424"
+SRCREV_machine_qemuppc ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_machine_qemux86 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_machine_qemux86-64 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_machine_qemumips64 ?= "c7eee598e73eb4b6eb1e9d203e6e84e63a4a278a"
+SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
+SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.13"
+LINUX_VERSION ?= "4.9.17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


