Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81C7E71A38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:59:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMFx6vc017277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Nov 2016 07:59:06 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 07:59:06 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 22 Nov 2016 10:58:58 -0500
Message-ID: <693acc31a0f456de7e0b25c766171867480d6549.1479830169.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479830169.git.bruce.ashfield@windriver.com>
References: <cover.1479830169.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.8: update to v4.8.10
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
X-List-Received-Date: Tue, 22 Nov 2016 15:59:05 -0000
Content-Type: text/plain

Integrating the 4.8.9 and 4.8.10 -stable updates. The commit log is
as follows:

   cf5ae2989a32 Linux 4.8.10
   5cd8f6788ff3 usb: gadget: f_fs: stop sleeping in ffs_func_eps_disable
   e2458382c792 usb: gadget: f_fs: edit epfile->ep under lock
   e34a0f1c53b5 sparc64: Delete now unused user copy fixup functions.
   af97481a6f5b sparc64: Delete now unused user copy assembler helpers.
   ac663c54f40b sparc64: Convert U3copy_{from,to}_user to accurate exception reporting.
   d91bb7a87e26 sparc64: Convert NG2copy_{from,to}_user to accurate exception reporting.
   a15859f9d839 sparc64: Convert NGcopy_{from,to}_user to accurate exception reporting.
   bb522726d311 sparc64: Convert NG4copy_{from,to}_user to accurate exception reporting.
   b0580eadc19f sparc64: Convert U1copy_{from,to}_user to accurate exception reporting.
   50e927483ccf sparc64: Convert GENcopy_{from,to}_user to accurate exception reporting.
   620ec41010d1 sparc64: Convert copy_in_user to accurate exception reporting.
   bf4d0da8e800 sparc64: Prepare to move to more saner user copy exception handling.
   bbbab9f59ea7 sparc64: Delete __ret_efault.
   81a91edbb91a sparc64: Handle extremely large kernel TLB range flushes more gracefully.
   7f8a50eb38d3 sparc64: Fix illegal relative branches in hypervisor patched TLB cross-call code.
   f7ef55af2f1b sparc64: Fix instruction count in comment for __hypervisor_flush_tlb_pending.
   2a28ab3d4148 sparc64: Fix illegal relative branches in hypervisor patched TLB code.
   f4fb552a033e sparc64: Handle extremely large kernel TSB range flushes sanely.
   51915c6d9070 sparc: Handle negative offsets in arch_jump_label_transform
   da6fe239ceff spi: spidev_test: fix build with musl libc
   4ea98e573d65 net: stmmac: Fix lack of link transition for fixed PHYs
   150b491b1b88 sctp: change sk state only when it has assocs in sctp_shutdown
   5235fcfa6cf8 bnx2: Wait for in-flight DMA to complete at probe stage
   6523ff2e27fe Revert "bnx2: Reset device during driver initialization"
   224fb8cbefb2 mlxsw: spectrum_router: Correctly dump neighbour activity
   9092bbd64bd9 mlxsw: spectrum: Fix refcount bug on span entries
   5712922773b5 Revert "include/uapi/linux/atm_zatm.h: include linux/time.h"
   2b5f22e4f7fd tcp: take care of truncations done by sk_filter()
   22a78d4c7f43 ipv4: use new_gw for redirect neigh lookup
   bccb4093d464 net: __skb_flow_dissect() must cap its return value
   a1632e969a55 net: icmp_route_lookup should use rt dev to determine L3 domain
   9885f474d92b sock: fix sendmmsg for partial sendmsg
   b78ba0a0f231 fib_trie: Correct /proc/net/route off by one error
   92fd1c1f2fd2 net: icmp6_send should use dst dev to determine L3 domain
   09ee09498bca bpf: fix htab map destruction when extra reserve is in use
   de289ad2e575 sctp: assign assoc_id earlier in __sctp_connect
   76b5fee5cfa0 ipv6: dccp: add missing bind_conflict to dccp_ipv6_mapped
   84d9c612bb7a ipv6: dccp: fix out of bound access in dccp_v6_err()
   ba93cf7d2118 dccp: fix out of bound access in dccp_v4_err()
   378a61101374 dccp: do not send reset to already closed sockets
   72b03e549b95 dccp: do not release listeners too soon
   b3523a0773ed tcp: fix return value for partial writes
   1f49cc6fa91c ipv4: allow local fragmentation in ip_finish_output_gso()
   842a858fa048 tcp: fix potential memory corruption
   fc3b825f2c81 ip6_tunnel: Clear IP6CB in ip6tunnel_xmit()
   f5f4b71d5632 bgmac: stop clearing DMA receive control register right after it is set
   0c7f764d2c6a net: mangle zero checksum in skb_checksum_help()
   ac22a3ba0796 net: clear sk_err_soft in sk_clone_lock()
   5b078dc6fb64 dctcp: avoid bogus doubling of cwnd after loss
   876577321657 Linux 4.8.9
   07d00beb1e04 netfilter: fix namespace handling in nf_log_proc_dostring
   8ef009e09c13 drm/i915: Fix mismatched INIT power domain disabling during suspend
   88a45e5d2c0d drm/amdgpu: fix a vm_flush fence leak
   25ed6e4b0b65 drm/amdgpu: fix fence slab teardown
   de5e9aa77a3c NFSv4.1: work around -Wmaybe-uninitialized warning
   18c801047a18 libceph: fix legacy layout decode with pool 0
   53c1792b94da memcg: prevent memcg caches to be both OFF_SLAB & OBJFREELIST_SLAB
   02e1ee6b3e1c mmc: mxs: Initialize the spinlock prior to using it
   ce0702e35aeb pinctrl: iproc: Fix iProc and NSP GPIO support
   320244ac9eb6 ASoC: sun4i-codec: return error code instead of NULL when create_card fails
   2140d4fd9277 ASoC: Intel: Skylake: Always acquire runtime pm ref on unload
   5037fdbc62c2 gpio: of: fix GPIO drivers with multiple gpio_chip for a single node
   7a9239fd0480 gpio/mvebu: Use irq_domain_add_linear
   6de98e87effb batman-adv: Modify neigh_list only with rcu-list functions
   a3f000ce7b44 ACPI/PCI: pci_link: Include PIRQ_PENALTY_PCI_USING for ISA IRQs
   6c76dd0c7066 ACPI/PCI: pci_link: penalize SCI correctly
   86c711665c84 ACPI/PCI/IRQ: assign ISA IRQ directly during early boot stages
   ad185d9251e1 ACPI / APEI: Fix incorrect return value of ghes_proc()
   b55ebc89ab1d mmc: sdhci-msm: Fix error return code in sdhci_msm_probe()
   85284c0850f9 i40e: fix call of ndo_dflt_bridge_getlink()
   1242c9dfab0c hwrng: core - Don't use a stack buffer in add_early_randomness()
   c1a2ada73dac lib/genalloc.c: start search from start of chunk
   06bb5ebedbb4 s390/dumpstack: restore reliable indicator for call traces
   1ef1bd02ad23 rtc: pcf2123: Add missing error code assignment before test
   4baabb72e9dd clk: samsung: clk-exynos-audss: Fix module autoload
   3bbdbd8aa3c8 x86/build: Fix build with older GCC versions
   f5eadc27a60c Revert "clocksource/drivers/timer_sun5i: Replace code by clocksource_mmio_init"
   645a6b823739 nvme: Delete created IO queues on reset
   07c4cbe01341 svcrdma: Tail iovec leaves an orphaned DMA mapping
   4131e00a436e svcrdma: Skip put_page() when send_reply() fails
   755ab7aa1466 mei: bus: fix received data size check in NFC fixup
   d1b564536c6a perf top: Fix refreshing hierarchy entries on TUI
   6ac4e06b717f Input: synaptics-rmi4 - fix error handling in I2C transport driver
   d3716f1b3e4b Input: synaptics-rmi4 - fix error handling in SPI transport driver
   66503ec38f34 watchdog: core: Fix devres_alloc() allocation size
   c5e9e5cc8cd1 agp/intel: Flush chipset writes after updating a single PTE
   813617a4c8dc iommu/vt-d: Fix dead-locks in disable_dmar_iommu() path
   b6ef0b142208 iommu/amd: Free domain id when free a domain of struct dma_ops_domain
   2ef38255b588 iommu/io-pgtable-arm: Check for v7s-incapable systems
   d3d9428d7133 xprtrdma: Fix DMAR failure in frwr_op_map() after reconnect
   31c749bee3de xprtrdma: use complete() instead complete_all()
   67080e2785a3 drm/amd: fix scheduler fence teardown order v2
   b0da5ab2ffb5 drm/amdgpu: fix sched fence slab teardown
   920a85ba4306 tty/serial: at91: fix hardware handshake on Atmel platforms
   9d76a886eb2f drm/amdgpu: fix crash in acp_hw_fini
   6e652d18d73d drm/amdgpu: disable runtime pm in certain cases
   8c8fdc683295 drm/i915/dp: Extend BDW DP audio workaround to GEN9 platforms
   db8e005bf2ba drm/i915/dp: BDW cdclk fix for DP audio
   f50b7450a8e4 drm/i915: Respect alternate_ddc_pin for all DDI ports
   e1b24f6a0b3c drm/radeon: disable runtime pm in certain cases
   eb13abb0e515 KVM: arm/arm64: vgic: Prevent access to invalid SPIs
   2850fad5acb0 scsi: scsi_dh_alua: Fix a reference counting bug
   5fac70d772a4 scsi: scsi_dh_alua: fix missing kref_put() in alua_rtpg_work()
   f29bcd11a170 scsi: mpt3sas: Fix for block device of raid exists even after deleting raid disk
   b2040deabb07 scsi: qla2xxx: Fix scsi scan hang triggered if adapter fails during init
   1281b9683f96 iio: st_sensors: fix scale configuration for h3lis331dl
   4dfb6d1dd11d iio: orientation: hid-sensor-rotation: Add PM function (fix non working driver)
   341c5534edad iio: hid-sensors: Increase the precision of scale to fix wrong reading interpretation.
   b9d031f354da cdc-acm: fix uninitialized variable
   c480880cd12c clk: qoriq: Don't allow CPU clocks higher than starting value
   ee27fd32c499 toshiba-wmi: Fix loading the driver on non Toshiba laptops
   f713523a234c drbd: Fix kernel_sendmsg() usage - potential NULL deref
   31da266e4b9a usb: gadget: u_ether: remove interrupt throttling
   264e4131a167 USB: cdc-acm: fix TIOCMIWAIT
   c12c24eeaf77 usb: dwc3: Fix error handling for core init
   6b95417150b7 staging: nvec: remove managed resource from PS2 driver
   82239ab105a5 Revert "staging: nvec: ps2: change serio type to passthrough"
   529789866abe drivers: staging: nvec: remove bogus reset command for PS/2 interface
   dea774aac054 staging: comedi: ni_tio: fix buggy ni_tio_clock_period_ps() return value
   5d510185f99a staging: sm750fb: Fix bugs introduced by early commits
   45983d678b70 staging: iio: ad5933: avoid uninitialized variable in error case
   5289e59246dd mmc: mmc: Use 500ms as the default generic CMD6 timeout
   ce4dfe7d927e mmc: sdhci: Fix unexpected data interrupt handling
   bde8d3f73375 mmc: sdhci: Fix CMD line reset interfering with ongoing data transfer
   10d24701f3f4 cpupower: Correct return type of cpu_power_is_cpu_online() in cpufreq-set
   f062e738c19b pinctrl: cherryview: Prevent possible interrupt storm on resume
   1d99fe3317e3 pinctrl: cherryview: Serialize register access in suspend/resume
   f5ad96462615 arc: Implement arch-specific dma_map_ops.mmap
   004e7c97f181 PCI: Don't attempt to claim shadow copies of ROM
   7fac0361f94e ARC: timer: rtc: implement read loop in "C" vs. inline asm
   4058116db4d0 s390/hypfs: Use get_free_page() instead of kmalloc to ensure page alignment
   2f3e0b82ebe9 coredump: fix unfreezable coredumping task
   d6ee4f47e2e7 mm/hugetlb: fix huge page reservation leak in private mapping error paths
   e87bf4f558f1 mm: hwpoison: fix thp split handling in memory_failure()
   67c79e166d46 swapfile: fix memory corruption via malformed swapfile
   c87739e5d029 shmem: fix pageflags after swapping DMA32 object
   5b5243b606ec mm, frontswap: make sure allocated frontswap map is assigned
   2e594273d4c5 dib0700: fix nec repeat handling
   9964230320d5 ASoC: cs4270: fix DAPM stream name mismatch
   9386a722d250 ALSA: info: Limit the proc text input size
   c3ea1b15b71e ALSA: info: Return error for invalid read/write

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 0996fa044e73..3d9ff393fdd0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c4a91e62ea517274fde5ebb46916010eac5159f6"
-SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
+SRCREV_machine ?= "4b6a2814a1ac2a917a8334748b3168315e678041"
+SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.8"
+LINUX_VERSION ?= "4.8.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 120f268b96d1..870a3487f3d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.8"
+LINUX_VERSION ?= "4.8.10"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
-SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
+SRCREV_machine ?= "96ea072413fb386598a62c77ed202a6de08085f6"
+SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index f9457051aa90..a4dd9adc7162 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "800a8564447b6ec75500b7cd6ebce78d652a466e"
-SRCREV_machine_qemuarm64 ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
-SRCREV_machine_qemumips ?= "e01c5adddc9e48bb2b3ae74ae5f12f356a6519dd"
-SRCREV_machine_qemuppc ?= "2e7e9f1e599eb255d038ede09f1765a1bb1378cf"
-SRCREV_machine_qemux86 ?= "6745463c22f59717df34f819359ea2955611fd03"
-SRCREV_machine_qemux86-64 ?= "6745463c22f59717df34f819359ea2955611fd03"
-SRCREV_machine_qemumips64 ?= "b9217c2fa88d138f4082c730fb3b450f7c56da81"
-SRCREV_machine ?= "6745463c22f59717df34f819359ea2955611fd03"
-SRCREV_meta ?= "1eac0b697a507e2dfeeb06294c887425170711b9"
+SRCREV_machine_qemuarm ?= "a0241e756033146b308e94e262f0c434d4d5dcdc"
+SRCREV_machine_qemuarm64 ?= "72e32211033cff873824d944470d06f590f66a85"
+SRCREV_machine_qemumips ?= "b17c74d6df96711a98c48515b6c171dfe492a4a6"
+SRCREV_machine_qemuppc ?= "15c034ae478c08219aaefaf8a9b57ee2939715a9"
+SRCREV_machine_qemux86 ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
+SRCREV_machine_qemux86-64 ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
+SRCREV_machine_qemumips64 ?= "7688c6f57bc68c6b39f0bd7a20ea84419ebfaf50"
+SRCREV_machine ?= "f5d46e21688b7463c942d9d27789d88d580f566b"
+SRCREV_meta ?= "1dc615a67779fdfd36548fd48e54bd19b6e6209e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.8"
+LINUX_VERSION ?= "4.8.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


