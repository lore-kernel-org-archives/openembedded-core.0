Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0AC77BF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:31:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7VJVBE5006863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 12:31:11 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 Aug 2017 12:31:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 31 Aug 2017 15:31:02 -0400
Message-ID: <fdf9020b1bef5d25c5e3db74efcf9fa4241f4385.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.12: update to v4.12.10
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
X-List-Received-Date: Thu, 31 Aug 2017 19:31:11 -0000
Content-Type: text/plain

Updating to the korg -stable release with the following commit
summary:

   6371f030c4dc Linux 4.12.10
   849e96758ab2 powerpc/mm: Ensure cpumask update is ordered
   53220a20cec0 ACPI: EC: Fix regression related to wrong ECDT initialization order
   6e80b88a7f7d ACPI: APD: Fix HID for Hisilicon Hip07/08
   49fa8c02e4a6 ntb: transport shouldn't disable link due to bogus values in SPADs
   ab75f0274d34 ntb: ntb_test: ensure the link is up before trying to configure the mws
   03e58884668e Clarify (and fix) MAX_LFS_FILESIZE macros
   0b9a3f300f89 iommu: Fix wrong freeing of iommu_device->dev
   75005bf89ad7 staging: rtl8188eu: add RNX-N150NUB support
   91628e2afc86 iio: magnetometer: st_magn: remove ihl property for LSM303AGR
   e59c095c11af iio: magnetometer: st_magn: fix status register address for LSM303AGR
   fc7957b6cdd7 iio: hid-sensor-trigger: Fix the race with user space powering up sensors
   a1d7b7e7e116 iio: imu: adis16480: Fix acceleration scale factor for adis16480
   bf9b9d3b382b ANDROID: binder: fix proc->tsk check.
   f6fc60d91549 binder: Use wake up hint for synchronous transactions.
   7771e3f4b0b9 binder: use group leader instead of open thread
   62ccb816aab8 Revert "android: binder: Sanity check at binder ioctl"
   b42c44ade798 Bluetooth: bnep: fix possible might sleep error in bnep_session
   b741896229c1 Bluetooth: cmtp: fix possible might sleep error in cmtp_session
   e792d2d48928 Bluetooth: hidp: fix possible might sleep error in hidp_session_thread
   1eb33a1b89e1 netfilter: nfnetlink: Improve input length sanitization in nfnetlink_rcv
   8b5041077024 netfilter: nat: fix src map lookup
   f5263887165a netfilter: expect: fix crash when putting uninited expectation
   4909a7b79965 net: sunrpc: svcsock: fix NULL-pointer exception
   a8da876c1e45 x86/mm: Fix use-after-free of ldt_struct
   2e11eedec6f0 timers: Fix excessive granularity of new timers after a nohz idle
   2c0dc7f00e19 perf/core: Fix group {cpu,task} validation
   aa2da6c4d548 ftrace: Check for null ret_stack on profile function graph entry function
   1b8ca8851c25 virtio_pci: fix cpu affinity support
   78f2e29f27f1 ring-buffer: Have ring_buffer_alloc_read_page() return error on offline CPU
   8d4f126c0791 nfsd: Limit end of page list when decoding NFSv4 WRITE
   ea5745a5117f cifs: return ENAMETOOLONG for overlong names in cifs_open()/cifs_lookup()
   1bc1c4391b79 cifs: Fix df output for users with quota limits
   3b278d7e8945 kbuild: linker script do not match C names unless LD_DEAD_CODE_DATA_ELIMINATION is configured
   51f49383a924 RDMA/uverbs: Initialize cq_context appropriately
   53a38dfbb5e4 tracing: Fix freeing of filter in create_filter() when set_str is false
   983ba8148e18 tracing: Fix kmemleak in tracing_map_array_free()
   a23e782823d6 tracing: Missing error code in tracer_alloc_buffers()
   3888c3aeb6bc tracing: Call clear_boot_tracer() at lateinit_sync
   1344db83ee17 ACPI: device property: Fix node lookup in acpi_graph_get_child_prop_value()
   dbe5b2d70cfd Revert "drm/amdgpu: fix vblank_time when displays are off"
   4ac9a5daaf82 drm/i915/gvt: Fix the kernel null pointer error
   bbb04b377f85 drm/i915/vbt: ignore extraneous child devices for a port
   d76df456a313 drm/atomic: If the atomic check fails, return its value first
   247122f138c0 drm/atomic: Handle -EDEADLK with out-fences correctly
   d4ae641cc285 drm/sun4i: Implement drm_driver lastclose to restore fbdev console
   08353913312a drm: Release driver tracking before making the object available again
   b96c15655125 drm: Fix framebuffer leak
   865d89f80907 arm64: fpsimd: Prevent registers leaking across exec
   1c229d7ad7b9 mm/memblock.c: reversed logic in memblock_discard()
   f5024bb32d4d fork: fix incorrect fput of ->exe_file causing use-after-free
   4823f4630bfd mm/madvise.c: fix freeing of locked page with MADV_FREE
   c237efed8b35 i2c: designware: Fix system suspend
   3a9495fd3719 dax: fix deadlock due to misaligned PMD faults
   735a252fc5b8 mm, shmem: fix handling /sys/kernel/mm/transparent_hugepage/shmem_enabled
   b2719637b16e PM/hibernate: touch NMI watchdog when creating snapshot
   8b366972d7d4 ARCv2: PAE40: set MSB even if !CONFIG_ARC_HAS_PAE40 but PAE exists in SoC
   fcedf2f28570 ARCv2: PAE40: Explicitly set MSB counterpart of SLC region ops addresses
   763ad31728e8 ARCv2: SLC: Make sure busy bit is set properly for region ops
   8537b1e0ff7f ALSA: firewire-motu: destroy stream data surely at failure of card initialization
   59d000610dc3 ALSA: firewire: fix NULL pointer dereference when releasing uninitialized data of iso-resource
   2f45c61ba400 ALSA: hda - Add stereo mic quirk for Lenovo G50-70 (17aa:3978)
   ba6b08b62f0c ALSA: core: Fix unexpected error at replacing user TLV
   1157dcda136a ALSA: usb-audio: Add delay quirk for H650e/Jabra 550a USB headsets
   2f76f62aef90 KVM: x86: block guest protection keys unless the host has them enabled
   3c498d4bde88 KVM, pkeys: do not use PKRU value in vcpu->arch.guest_fpu.state
   d0e52c825f00 KVM: x86: simplify handling of PKRU
   6dc06cd600d0 KVM: s390: sthyi: fix specification exception detection
   e516834ae81b KVM: s390: sthyi: fix sthyi inline assembly
   ddae9e6ec5d5 Input: ALPS - fix two-finger scroll breakage in right side on ALPS touchpad
   8dcee8e81a0e Input: elan_i2c - add ELAN0602 ACPI ID to support Lenovo Yoga310
   38c36f9d1fca Input: trackpoint - add new trackpoint firmware ID
   c9c682f3f029 bpf/verifier: fix min/max handling in BPF_SUB
   eb6cf01cd6b7 bpf: fix mixed signed/unsigned derived min/max value bounds
   659ee9687a11 bpf, verifier: add additional patterns to evaluate_reg_imm_alu
   d8a4ae09809a net_sched: fix order of queue length updates in qdisc_replace()
   09e1d36d0289 net: sched: fix NULL pointer dereference when action calls some targets
   f4e4a2969919 irda: do not leak initialized list.dev to userspace
   754df4da61d1 net/mlx4_core: Enable 4K UAR if SRIOV module parameter is not enabled
   2d093adfb109 tcp: when rearming RTO, if RTO time is in past then fire RTO ASAP
   7bbc60d9c916 ipv6: repair fib6 tree in failure case
   368129fe14f6 ipv6: reset fn->rr_ptr when replacing route
   c549de482f89 tipc: fix use-after-free
   62b3580fc3f0 sctp: fully initialize the IPv6 address in sctp_v6_to_addr()
   dda844773c47 tun: handle register_netdevice() failures properly
   3c3181e17b35 nfp: fix infinite loop on umapping cleanup
   9c579acf6522 ipv4: better IP_MAX_MTU enforcement
   12ee6d75d6a1 ptr_ring: use kmalloc_array()
   cb445bfc1041 openvswitch: fix skb_panic due to the incorrect actions attrlen
   c6fc7b9892a5 net: igmp: Use ingress interface rather than vrf device
   921739a95d4f bpf: fix bpf_trace_printk on 32 bit archs
   99f635d1e70d net_sched: remove warning from qdisc_hash_add
   cf665a603368 net_sched/sfq: update hierarchical backlog when drop packet
   163db2c61aa1 ipv4: fix NULL dereference in free_fib_info_rcu()
   f1d055463980 dccp: defer ccid_hc_tx_delete() at dismantle time
   a8de69b93e86 dccp: purge write queue in dccp_destroy_sock()
   94fd355614e3 af_key: do not use GFP_KERNEL in atomic contexts
   729420142979 bonding: ratelimit failed speed/duplex update warning
   b39ae1c8bdc4 bonding: require speed/duplex only for 802.3ad, alb and tlb
   16caf8dff7ee sparc64: remove unnecessary log message
   e0e7ae96b723 Linux 4.12.9
   3f40666fff96 usb: qmi_wwan: add D-Link DWM-222 device ID
   e2322bcce288 usb: optimize acpi companion search for usb port devices
   6632ae821b59 debug: Fix WARN_ON_ONCE() for modules
   c170b7930db3 pids: make task_tgid_nr_ns() safe
   e950adf8983f Sanitize 'move_pages()' permission checks
   7cbc3a8aaaa3 kernel/watchdog: Prevent false positives with turbo modes
   ee7025fef78c genirq/ipi: Fixup checks against nr_cpu_ids
   8eee5da54afe genirq: Restore trigger settings in irq_modify_status()
   399193e8ef2d irqchip/atmel-aic: Fix unbalanced refcount in aic_common_rtc_irq_fixup()
   2eceab663b9d irqchip/atmel-aic: Fix unbalanced of_node_put() in aic_common_irq_fixup()
   c4ab73ef2cfc x86/elf: Remove the unnecessary ADDR_NO_RANDOMIZE checks
   932769e10de9 x86: Fix norandmaps/ADDR_NO_RANDOMIZE
   c588e0cb269d x86/asm/64: Clear AC on NMI entries
   44e9d5afcec3 perf/x86: Fix RDPMC vs. mm_struct tracking
   33f1d0c79b04 xen-blkfront: use a right index when checking requests
   bd876f33dbeb powerpc: Fix VSX enabling/flushing to also test MSR_FP and MSR_VEC
   a77b5b81ad59 blk-mq-pci: add a fallback when pci_irq_get_affinity returns NULL
   e88bdec3ff7c ARM: dts: imx6qdl-nitrogen6_som2: fix PCIe reset
   c1cee6062ac9 xen: fix bio vec merging
   aab425db4279 mm: revert x86_64 and arm64 ELF_ET_DYN_BASE base changes
   8ac8e1d2a254 mm/vmalloc.c: don't unconditonally use __GFP_HIGHMEM
   6b2676ed32ba mm/mempolicy: fix use after free when calling get_mempolicy
   8b53b7560a8b mm/cma_debug.c: fix stack corruption due to sprintf usage
   76e8fe02bf50 mm: fix double mmap_sem unlock on MMF_UNSTABLE enforced SIGBUS
   889a17078f25 slub: fix per memcg cache leak on css offline
   4d45f00b927c mm: discard memblock data later
   c24138794d14 ALSA: usb-audio: add DSD support for new Amanero PID
   c482b084491b ALSA: usb-audio: Add mute TLV for playback volumes on C-Media devices
   b33fcbb01b3a ALSA: usb-audio: Apply sample rate quirk to Sennheiser headset
   8f05296965d8 ALSA: seq: 2nd attempt at fixing race creating a queue
   6a280cd12306 MD: not clear ->safemode for external metadata array
   7987c4066cbb md: always clear ->safemode when md_check_recovery gets the mddev lock.
   febaf83252f2 md: fix test in md_write_start()
   5f46f337bdeb Input: elan_i2c - Add antoher Lenovo ACPI ID for upcoming Lenovo NB
   04d0645d62a5 Input: elan_i2c - add ELAN0608 to the ACPI table
   b5e042f90f1f drm/amdgpu: save list length when fence is signaled
   2149506faff1 drm/i915: Perform an invalidate prior to executing golden renderstate
   aac1a12cc700 crypto: x86/sha1 - Fix reads beyond the number of blocks passed
   f1615538cd1c crypto: ixp4xx - Fix error handling path in 'aead_perform()'
   0a76684da5c2 parisc: pci memory bar assignment fails with 64bit kernels on dino/cujo
   dfaf892df105 audit: Fix use after free in audit_remove_watch_rule()
   a0fb6543b40f Linux 4.12.8
   1d4efdd222c4 powerpc: Fix /proc/cpuinfo revision for POWER9 DD2
   d40a54500008 MIPS: Octeon: Fix broken EDAC driver.
   bc60edb6aa3f Revert "MIPS: Don't unnecessarily include kmalloc.h into <asm/cache.h>."
   0a5a16f6cefd MIPS: DEC: Fix an int-handler.S CPU_DADDI_WORKAROUNDS regression
   888986477133 pinctrl: meson-gxl: Add missing GPIODV_18 pin entry
   d7b28b4cae66 pinctrl: meson-gxbb: Add missing GPIODV_18 pin entry
   155407bbf9f2 pinctrl: samsung: Remove bogus irq_[un]mask from resource management
   21d22dffc344 pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD20
   338ac5dd59b9 pinctrl: uniphier: fix WARN_ON() of pingroups dump on LD11
   be9f65893e3b pinctrl: intel: merrifield: Correct UART pin lists
   5fa72b4b746a pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
   c75a48eed01f pinctrl: cherryview: Add Setzer models to the Chromebook DMI quirk
   cc7f330bed71 pnfs/blocklayout: require 64-bit sector_t
   e8a1edad18fa iio: adc: vf610_adc: Fix VALT selection value for REFSEL bits
   0e1f0eaed6c2 xhci: Reset Renesas uPD72020x USB controller for 32-bit DMA issue
   ea9647cf87f5 PCI: Add pci_reset_function_locked()
   c71305e6854d PCI: Remove __pci_dev_reset() and pci_dev_reset()
   31e71939a4dd PCI: Protect pci_error_handlers->reset_notify() usage with device_lock()
   b23ef7b8dd7e usb:xhci:Add quirk for Certain failing HP keyboard on reset after resume
   73e7a2dca9cc usb: quirks: Add no-lpm quirk for Moshi USB to Ethernet Adapter
   488f4d8048e2 usb: core: unlink urbs from the tail of the endpoint's urb_list
   7ff799af2c21 USB: Check for dropped connection before switching to full speed
   c45923eb9413 usb: renesas_usbhs: Fix UGCTRL2 value for R-Car Gen3
   f5324020bcef usb: gadget: udc: renesas_usb3: Fix usb_gadget_giveback_request() calling
   7926348676f5 block: Make blk_mq_delay_kick_requeue_list() rerun the queue at a quiet time
   67e1a98e3a74 firmware: avoid invalid fallback aborts by using killable wait
   b1b5c0b23a90 firmware: fix batched requests - send wake up on failure on direct lookups
   c2c32ed5e6bf firmware: fix batched requests - wake all waiters
   f0834df3d97e uas: Add US_FL_IGNORE_RESIDUE for Initio Corporation INIC-3069
   c208cb9a5596 staging: comedi: comedi_fops: do not call blocking ops when !TASK_RUNNING
   20035abc9e08 iio: adc: Revert "axp288: Drop bogus AXP288_ADC_TS_PIN_CTRL register modifications"
   c1164cc258bc iio: light: tsl2563: use correct event code
   39e07a5c112c iio: pressure: st_pressure_core: disable multiread by default for LPS22HB
   8886738d06fa iio: accel: bmc150: Always restore device to normal mode after suspend-resume
   3fdd0854800e iio: accel: st_accel: add SPI-3wire support
   5f26ebe1afdc iio: aspeed-adc: wait for initial sequence.
   f0ab97d1aa14 staging:iio:resolver:ad2s1210 fix negative IIO_ANGL_VEL read
   9ccd63a6fdbd USB: hcd: Mark secondary HCD as dead if the primary one died
   792c00cb2377 usb: musb: fix tx fifo flush handling again
   ab51515ece30 USB: serial: pl2303: add new ATEN device id
   492eb6125c83 USB: serial: cp210x: add support for Qivicon USB ZigBee dongle
   b576de1e12c9 USB: serial: option: add D-Link DWM-222 device ID
   59f1322cc1e5 drm/i915: Fix out-of-bounds array access in bdw_load_gamma_lut
   4eedc8a7f03b drm/etnaviv: Fix off-by-one error in reloc checking
   8f0f15cc167d drm/bridge: tc358767: fix probe without attached output node
   1cc5cd5b97b5 nfs/flexfiles: fix leak of nfs4_ff_ds_version arrays
   8d189f60407f mmc: mmc: correct the logic for setting HS400ES signal voltage
   3329fe0e05f8 nand: fix wrong default oob layout for small pages using soft ecc
   1f2f0f1a75bd i2c: designware: Some broken DSTDs use 1MiHz instead of 1MHz
   cfea0422a154 fuse: initialize the flock flag in fuse_file on allocation
   59c74236092d target: Fix node_acl demo-mode + uncached dynamic shutdown regression
   7b0d44e25fdb usb-storage: fix deadlock involving host lock and scsi_done
   428048128bf0 iscsi-target: Fix iscsi_np reset hung task during parallel delete
   f838bd1752be iscsi-target: fix memory leak in iscsit_setup_text_cmd()
   a0e1953e0310 mtd: nand: Declare tBERS, tR and tPROG as u64 to avoid integer overflow
   867c07788e97 mtd: nand: Fix timing setup for NANDs that do not support SET FEATURES
   a34d48d5ca47 mtd: nand: atmel: Fix DT backward compatibility in pmecc.c
   0eda7e0bf238 pinctrl: armada-37xx: Fix number of pin in south bridge
   8452494828f7 xfs: Fix leak of discard bio
   0af6995672cb xtensa: don't limit csum_partial export by CONFIG_NET
   094849d602a0 xtensa: mm/cache: add missing EXPORT_SYMBOLs
   5e96389b3adc xtensa: fix cache aliasing handling code for WT cache
   5c1d458de22b futex: Remove unnecessary warning from get_futex_key
   5f064f8a0d4b mm: fix list corruptions on shmem shrinklist
   10df347170c3 mm: ratelimit PFNs busy info message

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index ffaa26d3d3b3..37ccc727fc0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
+SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.7"
+LINUX_VERSION ?= "4.12.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 56cd8ed29fe4..a9db5ae18753 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.7"
+LINUX_VERSION ?= "4.12.10"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
+SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 6f806c2bec4c..026d72e1f7a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a5227887cfadd94068717e8166879bf88d00ef73"
-SRCREV_machine_qemuarm64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_machine_qemumips ?= "a6983bac4e93ba7e892f666ad8c58b32c2d10945"
-SRCREV_machine_qemuppc ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_machine_qemux86 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_machine_qemux86-64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_machine_qemumips64 ?= "b344c1888b03e40683ba109bb45b44e9cf4d1eb4"
-SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
-SRCREV_meta ?= "09bc15990cc56fefe4111b8c64530cf0c4755817"
+SRCREV_machine_qemuarm ?= "fd1626821467303bd084dc28d41f9093d60c3f31"
+SRCREV_machine_qemuarm64 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_machine_qemumips ?= "0d351d8eb3feeb121e859cb77c16dd0f46007a15"
+SRCREV_machine_qemuppc ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_machine_qemux86 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_machine_qemux86-64 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_machine_qemumips64 ?= "ec95c3aebd1d653a409e844779d2a34666627f59"
+SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
+SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.7"
+LINUX_VERSION ?= "4.12.10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


