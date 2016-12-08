Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2065D71C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 18:03:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB8I3Af9017136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Dec 2016 10:03:10 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 10:01:08 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Dec 2016 12:58:51 -0500
Message-ID: <6f8186d7cf3091a45c4f6bc9a010b3528c980bc5.1481216659.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481216659.git.bruce.ashfield@windriver.com>
References: <cover.1481216659.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/4.4: update to v4.4.36
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
X-List-Received-Date: Thu, 08 Dec 2016 18:03:09 -0000
Content-Type: text/plain

shortlog of the changes follow:

   87c6c6ef5b17 Linux 4.4.36
   6eddf5c993dd scsi: mpt3sas: Unblock device after controller reset
   c178e4809df7 flow_dissect: call init_default_flow_dissectors() earlier
   0b7860d6e88c mei: fix return value on disconnection
   bab2f72f70ea mei: me: fix place for kaby point device ids.
   4f13967ecd20 mei: me: disable driver on SPT SPS firmware
   e1049372d7a7 drm/radeon: Ensure vblank interrupt is enabled on DPMS transition to on
   249090830942 mpi: Fix NULL ptr dereference in mpi_powm() [ver #3]
   cd4235a794c0 parisc: Also flush data TLB in flush_icache_page_asm
   7a1ab6a2bf3a parisc: Fix race in pci-dma.c
   e541fd815db9 parisc: Fix races in parisc_setup_cache_timing()
   0c0ddbf7efec NFSv4.x: hide array-bounds warning
   be79d7fa43f9 apparmor: fix change_hat not finding hat after policy replacement
   8316338a201b cfg80211: limit scan results cache size
   4df31626fc08 tile: avoid using clocksource_cyc2ns with absolute cycle count
   ffffc1ed47e7 scsi: mpt3sas: Fix secure erase premature termination
   ab0867dd8bc8 Fix USB CB/CBI storage devices with CONFIG_VMAP_STACK=y
   f3f95f177269 USB: serial: ftdi_sio: add support for TI CC3200 LaunchPad
   1f36db0b397f USB: serial: cp210x: add ID for the Zone DPMX
   55d061bf9d23 usb: chipidea: move the lock initialization to core file
   341f9730c29b KVM: x86: check for pic and ioapic presence before use
   b7f9404d1b48 KVM: x86: drop error recovery in em_jmp_far and em_ret_far
   c091bbddbc5e iommu/vt-d: Fix IOMMU lookup for SR-IOV Virtual Functions
   d88a1bd00cfa iommu/vt-d: Fix PASID table allocation
   0a5b451a53d4 Linux 4.4.35
   1ba7fafae3c2 netfilter: nft_dynset: fix element timeout for HZ != 1000
   698a8dddb8a5 IB/cm: Mark stale CM id's whenever the mad agent was unregistered
   2b026a265a9a IB/uverbs: Fix leak of XRC target QPs
   eba83a85caba IB/core: Avoid unsigned int overflow in sg_alloc_table
   c524185c81d4 IB/mlx5: Fix fatal error dispatching
   734039913373 IB/mlx5: Use cache line size to select CQE stride
   7cf5b7882184 IB/mlx4: Fix create CQ error flow
   41664d7077e9 IB/mlx4: Check gid_index return value
   04c0800c73b2 PM / sleep: don't suspend parent when async child suspend_{noirq, late} fails
   469fcbcb84d8 PM / sleep: fix device reference leak in test_suspend
   680bc27065b9 uwb: fix device reference leaks
   dd214a159de6 mfd: core: Fix device reference leak in mfd_clone_cell
   d2adb5ebec61 iwlwifi: pcie: fix SPLC structure parsing
   1f995573bac8 rtc: omap: Fix selecting external osc
   c8aa3e98c1a8 clk: mmp: mmp2: fix return value check in mmp2_clk_init()
   96576127ffb7 clk: mmp: pxa168: fix return value check in pxa168_clk_init()
   a4709b4582ac clk: mmp: pxa910: fix return value check in pxa910_clk_init()
   d039fc37ec7f drm/amdgpu: Attach exclusive fence to prime exported bo's. (v5)
   96f10a6239a2 crypto: caam - do not register AES-XTS mode on LP units
   454cf79b05c5 ext4: sanity check the block and cluster size at mount time
   147117cf23c0 kbuild: Steal gcc's pie from the very beginning
   e543f094a38a x86/kexec: add -fno-PIE
   3a868dde1824 scripts/has-stack-protector: add -fno-PIE
   f740b5cc39dd kbuild: add -fno-PIE
   936d157fa7ae i2c: mux: fix up dependencies
   4e583b89add6 can: bcm: fix warning in bcm_connect/proc_register
   0c6e0db9686b mfd: intel-lpss: Do not put device in reset state on suspend
   b7321bcc8b1c fuse: fix fuse_write_end() if zero bytes were copied
   d4a774fdb92f KVM: Disable irq while unregistering user notifier
   b689e86c9a8f KVM: x86: fix missed SRCU usage in kvm_lapic_set_vapic_addr
   aea9d760b8ba x86/cpu/AMD: Fix cpu_llc_id for AMD Fam17h systems
   4eb9a8100248 Linux 4.4.34
   b4bbdcef7d90 sparc64: Delete now unused user copy fixup functions.
   cb85910b0d45 sparc64: Delete now unused user copy assembler helpers.
   1c7e17b1c4d6 sparc64: Convert U3copy_{from,to}_user to accurate exception reporting.
   7181969338f8 sparc64: Convert NG2copy_{from,to}_user to accurate exception reporting.
   bfc8be659309 sparc64: Convert NGcopy_{from,to}_user to accurate exception reporting.
   dc3a7a7d2c85 sparc64: Convert NG4copy_{from,to}_user to accurate exception reporting.
   1731d90d8a55 sparc64: Convert U1copy_{from,to}_user to accurate exception reporting.
   8a444c770f6e sparc64: Convert GENcopy_{from,to}_user to accurate exception reporting.
   c718e917b3d3 sparc64: Convert copy_in_user to accurate exception reporting.
   dd8a78b2b6ad sparc64: Prepare to move to more saner user copy exception handling.
   756723ad553d sparc64: Delete __ret_efault.
   f5a69ff7486e sparc64: Handle extremely large kernel TLB range flushes more gracefully.
   d36a1ac49d24 sparc64: Fix illegal relative branches in hypervisor patched TLB cross-call code.
   5d8eb954763d sparc64: Fix instruction count in comment for __hypervisor_flush_tlb_pending.
   217f829ae967 sparc64: Fix illegal relative branches in hypervisor patched TLB code.
   2ba06323db41 sparc64: Handle extremely large kernel TSB range flushes sanely.
   75931800733c sparc: Handle negative offsets in arch_jump_label_transform
   8fd11efa2140 sparc64 mm: Fix base TSB sizing when hugetlb pages are used
   4e90b6880135 sparc: serial: sunhv: fix a double lock bug
   a395f7a66eec sparc: Don't leak context bits into thread->fault_address
   4e772c53ab98 tty: Prevent ldisc drivers from re-using stale tty fields
   225a24ae9733 tcp: take care of truncations done by sk_filter()
   ae9e052a58ef ipv4: use new_gw for redirect neigh lookup
   5c67f9477bb2 net: __skb_flow_dissect() must cap its return value
   b67ed647d135 sock: fix sendmmsg for partial sendmsg
   0650eeb4f187 fib_trie: Correct /proc/net/route off by one error
   3f8857a4971d sctp: assign assoc_id earlier in __sctp_connect
   65d29c185614 ipv6: dccp: add missing bind_conflict to dccp_ipv6_mapped
   99131760a885 ipv6: dccp: fix out of bound access in dccp_v6_err()
   a2df29ed840f dccp: fix out of bound access in dccp_v4_err()
   ad6d0a82016b dccp: do not send reset to already closed sockets
   69a5c7ca2e62 tcp: fix potential memory corruption
   8777977b22c4 ip6_tunnel: Clear IP6CB in ip6tunnel_xmit()
   c5bad811ca4d bgmac: stop clearing DMA receive control register right after it is set
   6e9ca1b61cc8 net: mangle zero checksum in skb_checksum_help()
   ac4c2cf6f57a net: clear sk_err_soft in sk_clone_lock()
   74e53a3a053f dctcp: avoid bogus doubling of cwnd after loss
   86429bd405de Linux 4.4.33
   21cc1a183a9d netfilter: fix namespace handling in nf_log_proc_dostring
   ee5dd6878886 btrfs: qgroup: Prevent qgroup->reserved from going subzero
   ae6d4df4a7a0 mmc: mxs: Initialize the spinlock prior to using it
   ae5b8dbfe6be ASoC: sun4i-codec: return error code instead of NULL when create_card fails
   125e84726d7c ACPI / APEI: Fix incorrect return value of ghes_proc()
   5cd2cd84d573 i40e: fix call of ndo_dflt_bridge_getlink()
   5be7e6b48b21 hwrng: core - Don't use a stack buffer in add_early_randomness()
   ba8580f6cf03 lib/genalloc.c: start search from start of chunk
   c048b6711ed6 mei: bus: fix received data size check in NFC fixup
   19426f065d1e iommu/vt-d: Fix dead-locks in disable_dmar_iommu() path
   f029e7b34f25 iommu/amd: Free domain id when free a domain of struct dma_ops_domain
   f5bb84163704 tty/serial: at91: fix hardware handshake on Atmel platforms
   49163391881a dmaengine: at_xdmac: fix spurious flag status for mem2mem transfers
   fff40ee4d224 drm/i915: Respect alternate_ddc_pin for all DDI ports
   d7b0055e5566 KVM: MIPS: Precalculate MMIO load resume PC
   d24587404922 scsi: mpt3sas: Fix for block device of raid exists even after deleting raid disk
   6e897d034d4c scsi: qla2xxx: Fix scsi scan hang triggered if adapter fails during init
   29cf142cefed iio: orientation: hid-sensor-rotation: Add PM function (fix non working driver)
   caff14e99c63 iio: hid-sensors: Increase the precision of scale to fix wrong reading interpretation.
   dbbc5e6bcf36 clk: qoriq: Don't allow CPU clocks higher than starting value
   2c5cdadeab5d toshiba-wmi: Fix loading the driver on non Toshiba laptops
   f523deedff82 drbd: Fix kernel_sendmsg() usage - potential NULL deref
   f1de32232db3 usb: gadget: u_ether: remove interrupt throttling
   0ab4186bf238 USB: cdc-acm: fix TIOCMIWAIT
   290ffd550e34 staging: nvec: remove managed resource from PS2 driver
   4aa859ea591e Revert "staging: nvec: ps2: change serio type to passthrough"
   729eb8d9f7b7 drivers: staging: nvec: remove bogus reset command for PS/2 interface
   6bba8c37ceed staging: iio: ad5933: avoid uninitialized variable in error case
   a98e483ca784 pinctrl: cherryview: Prevent possible interrupt storm on resume
   126d0a2fe878 pinctrl: cherryview: Serialize register access in suspend/resume
   c45bfaa9211e ARC: timer: rtc: implement read loop in "C" vs. inline asm
   3b21a0b468a3 s390/hypfs: Use get_free_page() instead of kmalloc to ensure page alignment
   e835220ed25f coredump: fix unfreezable coredumping task
   5c54f79ad234 swapfile: fix memory corruption via malformed swapfile
   2f7496c48a7b dib0700: fix nec repeat handling
   a04769029386 ASoC: cs4270: fix DAPM stream name mismatch
   f3155797b91c ALSA: info: Limit the proc text input size
   c1ea2b3c07c6 ALSA: info: Return error for invalid read/write

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 35dcd473d51b..35239fdbebf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85e8c6c297d6d4a6f6694b69812030fff07a88fd"
-SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
+SRCREV_machine ?= "e4d81ef9c99669e815ca91e1bb02e80a59541766"
+SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.32"
+LINUX_VERSION ?= "4.4.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 8c3043b78c6c..28c3dfad8cc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.32"
+LINUX_VERSION ?= "4.4.36"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
+SRCREV_machine ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index dd56a9640f9f..2246555a3ff8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2041d76e0048b345098fbc680f5719da5d7dae7b"
-SRCREV_machine_qemuarm64 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_machine_qemumips ?= "0cd523cd89c13cb3674b55a6afe41aa976950fc1"
-SRCREV_machine_qemuppc ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_machine_qemux86 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_machine_qemux86-64 ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_machine_qemumips64 ?= "baea2f5605baba0d49a9afac8a46717193ccef90"
-SRCREV_machine ?= "4c2d50b725d6dd5e90d1151abdbcb7418938be3a"
-SRCREV_meta ?= "2d1114e7b6f39e8e4c442ad18e2eda1a918c7e48"
+SRCREV_machine_qemuarm ?= "0166111980b931967bf3449d3d040aac6ff523a8"
+SRCREV_machine_qemuarm64 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine_qemumips ?= "90bf4bfeee3d0ca1cf0077dc1e0045cd9237e392"
+SRCREV_machine_qemuppc ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine_qemux86 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine_qemux86-64 ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_machine_qemumips64 ?= "fd20390d53c24f1ef0293b2c26b8e883e87e91f3"
+SRCREV_machine ?= "9cc72ea6194abae764a2db8f6a32cde60e739d7c"
+SRCREV_meta ?= "b846fc6436aa5d4c747d620e83dfda969854d10c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.32"
+LINUX_VERSION ?= "4.4.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


