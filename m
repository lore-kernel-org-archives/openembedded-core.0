Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 885C677352
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v11FUhZ0001504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Feb 2017 07:30:44 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:32 -0500
Message-ID: <887929fce56913e7f895f162844fb89e3a642a49.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/4.9: update to v4.9.6
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:44 -0000
Content-Type: text/plain

Integrating the 4.9.5 and 4.9.6 -stable updates. The commit logs
are as follows:

   09f886dc5a69 Linux 4.9.6
   f77ef5348d4b libceph: stop allocating a new cipher on every crypto request
   5b482bf58868 libceph: uninline ceph_crypto_key_destroy()
   12274f2c17f2 tools/virtio/ringtest: fix run-on-all.sh for offline cpus
   fa555d021d2b selftest/powerpc: Wrong PMC initialized in pmc56_overflow test
   f37b7a3004bb soc: ti: wkup_m3_ipc: Fix error return code in wkup_m3_ipc_probe()
   97d5e2057564 spi: pxa2xx: add missed break
   d21814a8068a dmaengine: pl330: Fix runtime PM support for terminated transfers
   172270c74348 dmaengine: rcar-dmac: unmap slave resource when channel is freed
   3bef7578e05f s5p-mfc: Fix clock management in s5p_mfc_release() function
   d47e1e7c46fe s5p-cec: mark PM functions as __maybe_unused again
   dfe8e5730fa1 st-hva: fix some error handling in hva_hw_probe()
   b9dc16170dbf ite-cir: initialize use_demodulator before using it
   278997a8e002 gs1662: drop kfree for memory allocated with devm_kzalloc
   cec5ef6ac520 platform: pxa_camera: add VIDEO_V4L2 dependency
   2a3060531768 blackfin: check devm_pinctrl_get() for errors
   fcdab6ca9c31 rpmsg: virtio_rpmsg_bus: fix channel creation
   0f3418442d7b mtd: spi-nor: Fix some error codes in cqspi_setup_flash()
   e55e6c026b7c mtd: spi-nor: Off by one in cqspi_setup_flash()
   ebdfcaa14eef PM / devfreq: Fix the bug of devfreq_add_device when governor is NULL
   795983547317 PM / devfreq: exynos-bus: Fix the wrong return value
   16236802bfec scsi: mpt3sas: fix hang on ata passthrough commands
   a07a122ad2a2 scsi: ses: Fix SAS device detection in enclosure
   41c6b3e8989e swiotlb: Add swiotlb=noforce debug option
   1fd1e6cd6314 swiotlb: Convert swiotlb_force from int to enum
   776c2b2d165d arm64: Fix swiotlb fallback allocation
   962957889d74 arm64: mm: avoid name clash in __page_to_voff()
   d34b6684e60f xprtrdma: Squelch "max send, max recv" messages at connect time
   8ade1c2b4530 xprtrdma: Make FRWR send queue entry accounting more accurate
   a193c7247596 libceph: make sure ceph_aes_crypt() IV is aligned
   6e9fa67c58cc ceph: fix endianness bug in frag_tree_split_cmp
   2e4f2131b66f ceph: fix endianness of getattr mask in ceph_d_revalidate
   8934e069674a ceph: fix ceph_get_caps() interruption
   48baa924108e ceph: fix scheduler warning due to nested blocking
   04c9fe63166f ARM: 8613/1: Fix the uaccess crash on PB11MPCore
   dd8334a5e17e ARM: ux500: fix prcmu_is_cpu_in_wfi() calculation
   cd9601caa2fa ARM: dts: omap3: Fix Card Detect and Write Protect on Logic PD SOM-LV
   a075ac9c0a40 ARM: dts: imx6qdl-nitrogen6_max: fix sgtl5000 pinctrl init
   cfcb94b3a498 ARM: dts: omap2: Add an empty chosen node to top level DTSI
   5921b26bf744 ARM: dts: omap3: Add an empty chosen node to top level DTSI
   bec062cd47bd ARM: dts: am4372: Add an empty chosen node to top level DTSI
   c3f7ca43b2d4 ARM: dts: omap5: Add an empty chosen node to top level DTSI
   835bf872d924 ARM: dts: omap4: Add an empty chosen node to top level DTSI
   355a8fced2bf ARM: dts: am33xx: Add an empty chosen node to top level DTSI
   3e1c70972204 ARM: dts: dm814x: Add an empty chosen node to top level DTSI
   ab6dc01db1f7 ARM: dts: dm816x: Add an empty chosen node to top level DTSI
   d4f12aa133db ARM: dts: dra7: Add an empty chosen node to top level DTSI
   b8add6715c9a libceph: remove now unused ceph_*{en,de}crypt*() functions
   2982b9c92a66 libceph: switch ceph_x_decrypt() to ceph_crypt()
   717a145bd5a9 libceph: switch ceph_x_encrypt() to ceph_crypt()
   6e371f9a4144 libceph: tweak calcu_signature() a little
   788a0bbc7011 libceph: rename and align ceph_x_authorizer::reply_buf
   ecf7ced85628 libceph: introduce ceph_crypt() for in-place en/decryption
   0548b8298938 libceph: introduce ceph_x_encrypt_offset()
   be60457612a2 libceph: old_key in process_one_ticket() is redundant
   2e62bf3c6fe9 libceph: ceph_x_encrypt_buflen() takes in_len
   6d9b544d88a4 Input: ALPS - fix TrackStick support for SS5 hardware
   6e53a62a0d52 arm64/ptrace: Reject attempts to set incomplete hardware breakpoint fields
   f9081dd0c8be arm64/ptrace: Avoid uninitialised struct padding in fpr_set()
   5c5839be0842 arm64/ptrace: Preserve previous registers for short regset write - 3
   a4aafb8c4204 arm64/ptrace: Preserve previous registers for short regset write - 2
   357cfd6c83ee arm64/ptrace: Preserve previous registers for short regset write
   de327948c009 arm64: avoid returning from bad_mode
   71c496495514 ARM: dts: da850-evm: fix read access to SPI flash
   5b6618615215 ARM: dts: OMAP5 / DRA7: indicate that SATA port 0 is available.
   1f75575aca7b ceph: fix bad endianness handling in parse_reply_info_extra
   a14aeccb65e5 ibmvscsis: Fix max transfer length
   51cff2c64d20 ibmvscsis: Fix sleeping in interrupt context
   df35a8f51fcb ARM: 8634/1: hw_breakpoint: blacklist Scorpion CPUs
   73a2e2405d30 svcrdma: avoid duplicate dma unmapping during error recovery
   c49b31b585a1 clocksource/exynos_mct: Clear interrupt when cpu is shut down
   ce5c52f039cf ubifs: Fix journal replay wrt. xattr nodes
   bab10a549fd6 mac80211: implement multicast forwarding on fast-RX path
   beecb1e72cc5 qla2xxx: Fix crash due to null pointer access
   33038189bcab x86/ioapic: Restore IO-APIC irq_chip retrigger callback
   bf15e45eee7a powerpc: Ignore reserved field in DCSR and PVR reads and writes
   e09778546713 powerpc/ptrace: Preserve previous TM fprs/vsrs on short regset write
   9e10a0fc7312 powerpc/ptrace: Preserve previous fprs/vsrs on short regset write
   98e60a8345ae powerpc/perf: Fix PM_BRU_CMPL event code for power9
   09187cdf50c1 powerpc/icp-opal: Fix missing KVM case and harden replay
   26c4d513b6af KVM: arm/arm64: vgic: Fix deadlock on error handling
   e0641f201114 KVM: s390: do not expose random data via facility bitmap
   001ed27d088a mtd: nand: xway: fix build because of module functions
   c8dce6e0ef2c mtd: nand: xway: disable module support
   d8d82ac42e27 mtd: nand: lpc32xx: fix invalid error handling of a requested irq
   86249aef233e ieee802154: atusb: do not use the stack for buffers to make them DMA able
   ad17175732ca mmc: mxs-mmc: Fix additional cycles after transmission stop
   c1274eeb2fe3 mmc: sdhci-acpi: Only powered up enabled acpi child devices
   35028599bc88 HID: corsair: fix control-transfer error handling
   63df1ccb937f HID: corsair: fix DMA buffers on stack
   4922a6a5cfa7 PCI: Enumerate switches below PCI-to-PCIe bridges
   c6bdc450fe93 PCI: designware: Check for iATU unroll only on platforms that use ATU
   07f0267561c6 fuse: fix time_to_jiffies nsec sanity check
   0181b3603681 fuse: clear FR_PENDING flag when moving requests out of pending queue
   bb82fb48df8c ARC: module: Fix !CONFIG_ARC_DW2_UNWIND builds
   3c4d83a1a41e libnvdimm, namespace: fix pmem namespace leak, delete when size set to zero
   f29f3616b932 svcrpc: don't leak contexts on PROC_DESTROY
   a297ed84b928 sunrpc: don't call sleeping functions from the notifier block callbacks
   90687fc3c8c3 rcu: Narrow early boot window of illegal synchronous grace periods
   bdeaa468e221 rcu: Remove cond_resched() from Tiny synchronize_sched()
   f779e00d2e86 x86/PCI: Ignore _CRS on Supermicro X8DTH-i/6/iF/6F
   782b361c9306 tmpfs: clear S_ISGID when setting posix ACLs
   9170948a24b7 ARM: dts: omap3: Add DTS for Logic PD SOM-LV 37xx Dev Kit
   efba7a37efe2 ARM: dts: imx31: fix AVIC base address
   173470b1b10a ARM: dts: imx31: move CCM device node to AIPS2 bus devices
   979f63227c98 ARM: dts: imx31: fix clock control module interrupts description
   e95bd2ca11a9 ARM: dts: imx6q-cm-fx6: fix fec pinctrl
   387812143cbe ARM: dts: r8a7794: remove Z clock
   57a10f29e0b3 ARM: dts: r8a7794: Use SYSC "always-on" PM Domain for sound
   97136d1ef47a ARM: dts: bcm283x: fix typo in mailbox address
   03f5be20ec9b perf jit: Enable jitdump support without dwarf
   3ef6a3c0136b perf scripting: Avoid leaking the scripting_context variable
   ea738532666a perf callchain: Fixup help/config for no-unwinding
   a1d308914090 perf diff: Do not overwrite valid build id
   0f242c0ae0a6 perf trace: Check if MAP_32BIT is defined (again)
   8b5484fab145 perf mem: Fix --all-user/--all-kernel options
   567eea578016 perf trace: Use the syscall raw_syscalls:sys_enter timestamp
   d622b626270a IB/IPoIB: Remove can't use GFP_NOIO warning
   656a7d657533 IB/mlx4: Check if GRH is available before using it
   661600ff77f1 IB/mlx4: When no DMFS for IPoIB, don't allow NET_IF QPs
   8f95735412ad IB/mlx4: Fix port query for 56Gb Ethernet links
   1039b7f5c7ef IB/mlx4: Handle well-known-gid in mad_demux processing
   618d14b01a45 IB/mlx4: Fix out-of-range array index in destroy qp flow
   970f6806c2b1 IB/mlx4: Set traffic class in AH
   0d64860aa638 IB/mlx5: Wait for all async command completions to complete
   7c8441c89043 IB/mlx5: Assign SRQ type earlier
   dae9f4f14411 IB/mlx5: Fix reported max SGE calculation
   4db097fe49ea IB/mlx5: Avoid system crash when enabling many VFs
   45f3a7eb2ca0 IB/rxe: avoid putting a large struct rxe_qp on stack
   25c72b518734 IB/rxe: Increase max number of completions to 32k
   b7c551559834 IB/core: Release allocated memory in cache setup failure
   40bf0662fe3f Linux 4.9.5
   4e764538512e pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
   b90a617fef04 arm64: hugetlb: fix the wrong return value for huge_ptep_set_access_flags
   2021e55d719a arm64: hugetlb: remove the wrong pmd check in find_num_contig()
   736aec92c4e9 arm64: hugetlb: fix the wrong address for several functions
   3083593700dd powerpc/powernv: Don't warn on PE init if unfreeze is unsupported
   dcd15c20c208 powerpc/ibmebus: Fix device reference leaks in sysfs interface
   25bba7152f2a powerpc/ibmebus: Fix further device reference leaks
   ae4c24b2d584 powerpc/mm: Correct process and partition table max size
   42eded92c42b bus: vexpress-config: fix device reference leak
   d9c19f90f3a5 blk-mq: Always schedule hctx->next_cpu
   cb50d45c3d42 power: supply: bq27xxx_battery: Fix register map for BQ27510 and BQ27520
   df386a0c2804 bq24190_charger: Fix PM runtime use for bq24190_battery_set_property
   4b07d85374f5 iw_cxgb4: Fix error return code in c4iw_rdev_open()
   aa3ee06a2ae2 powercap/intel_rapl: fix and tidy up error handling
   f53cfb081f00 ACPI / APEI: Fix NMI notification handling
   f57d8710096d block: cfq_cpd_alloc() should use @gfp
   f99694cdaf76 block: Change extern inline to static inline
   a4e73cc229d8 ACPI / CPPC: set an error code on probe error path
   26991b28b47c regulators: helpers: Fix handling of bypass_val_on in get_bypass_regmap
   89c728ed9237 cpufreq: powernv: Disable preemption while checking CPU throttling state
   e5f33ef0a601 powerpc/64: Simplify adaptation to new ISA v3.00 HPTE format
   f607fd883654 remoteproc: st: Fix error return code in st_rproc_probe()
   0e38a0b7acbb remoteproc: qcom_wcnss: Fix circular module dependency
   b4a69e3877ca drm: Initialise drm_mm.head_node.allocated
   5bdb57418845 drm/i915: Move the min_pixclk[] handling to the end of readout
   699fbc4cb7d4 drm/panel: simple: Check against num_timings when setting preferred for timing
   214417a0419b drm: avoid uninitialized timestamp use in wait_vblank
   3b376640445a drm/i915/gen9: Fix PCODE polling during SAGV disabling
   26eae206b786 i2c: mux: pca954x: fix i2c mux selection caching
   396b25173370 NFSv4.1: nfs4_fl_prepare_ds must be careful about reporting success.
   e331f2f2b1fb NFS: Fix a performance regression in readdir
   4c4d4bec6c90 pNFS: Fix race in pnfs_wait_on_layoutreturn
   633b57037699 NFS: fix typo in parameter description
   a5209aa99042 pinctrl: meson: fix gpio request disabling other modes
   7a1dcd92fd39 btrfs: fix error handling when run_delayed_extent_op fails
   003e3163fcc7 btrfs: fix locking when we put back a delayed ref that's too new
   0aefd99f37f3 nvme: apply DELAY_BEFORE_CHK_RDY quirk at probe time too
   9bae3c370a9e x86/cpu: Fix bootup crashes by sanitizing the argument of the 'clearcpuid=' command-line option
   64e236812197 i2c: piix4: Avoid race conditions with IMC
   ce31072b4342 net/mlx5: Only cancel recovery work when cleaning up device
   2f946414a080 USB: serial: ch341: fix modem-control and B0 handling
   12a26bd342b5 drm/amdgpu: drop verde dpm quirks
   d52e714b39ce drm/amdgpu: update si kicker smc firmware
   0c37b07002d5 drm/radeon: drop verde dpm quirks
   7cd7aea3dc78 drm/radeon: update smc firmware selection for SI
   5375b71f3b17 drm: Clean up planes in atomic commit helper failure path
   6d15a83af982 drm/i915/gen9: Fix PCODE polling timeout in stable backport
   9297e0c189f5 net/af_iucv: don't use paged skbs for TX on HiperSockets
   00cf64fbaa1e sysctl: Drop reference added by grab_header in proc_sys_readdir
   eca02f01be96 Clearing FIFOs in RS485 emulation mode causes subsequent transmits to break
   86820a103f51 extcon: return error code on failure
   ef8ee4495171 sysrq: attach sysrq handler correctly for 32-bit kernel
   4a940d6503e1 orinoco: Use shash instead of ahash for MIC calculations
   0edcc47cdb7f ibmvscsis: Fix srp_transfer_data fail return code
   ba04d869974e tty/serial: atmel_serial: BUG: stop DMA from transmitting in stop_tx
   2d789bd1fc24 tty/serial: atmel: RS485 half duplex w/DMA: enable RX after TX is done
   199c89fd32b2 virtio_blk: avoid DMA to stack for the sense buffer
   6c6ae8c43df9 dmaengine: omap-dma: Fix dynamic lch_map allocation
   3fbaff3adc76 drivers: char: mem: Fix thinkos in kmem address checks
   1a62a0f76556 mnt: Protect the mountpoint hashtable with mount_lock
   52fd0ab07676 pid: fix lockdep deadlock warning due to ucount_lock
   57bfd5a3710b vme: Fix wrong pointer utilization in ca91cx42_slave_get
   1f363639eb30 Revert "tty: serial: 8250: add CON_CONSDEV to flags"
   f9cf776b0555 ASoC: hdmi-codec: use unsigned type to structure members with bit-field
   28dad9aa9b36 btrfs: fix crash when tracepoint arguments are freed by wq callbacks
   4d0f302bf56a xhci: fix deadlock at host remove by running watchdog correctly
   d06367ac1730 fix a fencepost error in pipe_advance()
   ab8957396a69 i2c: fix kernel memory disclosure in dev interface
   93c94ec23fae i2c: print correct device invalid address
   61a8c3372adb Input: elants_i2c - avoid divide by 0 errors on bad touchscreen data
   0556a65e8b7d USB: serial: ch341: fix open and resume after B0
   3ed1f6da3a17 USB: serial: ch341: fix control-message error handling
   139556a98511 USB: serial: ch341: fix open error handling
   1685daad0b0c USB: serial: ch341: fix resume after reset
   4aeab97a0515 USB: serial: ch341: fix initial modem-control state
   58ede4beda66 USB: serial: kl5kusb105: fix line-state error handling
   dfd48efcde84 usb: musb: fix runtime PM in debugfs
   88d3670a1de4 wusbcore: Fix one more crypto-on-the-stack bug
   99ff99b830c1 x86/CPU/AMD: Fix Bulldozer topology
   bd7e769457f9 x86/bugs: Separate AMD E400 erratum and C1E bug
   e2d9ad2c540b x86/cpu/AMD: Clean up cpu_llc_id assignment per topology feature
   259495a0440f bridge: netfilter: Fix dropping packets that moving through bridge interface
   6ba35da690f3 xfs: Timely free truncated dirty pages
   86673e9331c9 gpio: Move freeing of GPIO hogs before numbing of the device
   0a28f5393689 nl80211: fix sched scan netlink socket owner destruction
   14d6c966744d x86/efi: Don't allocate memmap through memblock after mm_init()
   99b17ac0014b efi/x86: Prune invalid memory map entries and fix boot regression
   74ce3fd64bc4 efi/libstub/arm*: Pass latest memory map to the kernel
   736e77c07fba KVM: x86: Introduce segmented_write_std
   83fedbb76051 KVM: x86: emulate FXSAVE and FXRSTOR
   aae8f3464b1f KVM: x86: add asm_safe wrapper
   bc5e1316efd6 KVM: x86: add Align16 instruction flag
   90f70fcd6f72 KVM: x86: fix NULL deref in vcpu_scan_ioapic
   5ed21cc0cf26 KVM: x86: flush pending lapic jump label updates on module unload
   483ecebb22c1 jump_labels: API for flushing deferred jump label updates
   7caf473f99b8 KVM: eventfd: fix NULL deref irqbypass consumer
   7718ffcf9a64 KVM: x86: fix emulation of "MOV SS, null selector"
   1e26cec60668 mm/hugetlb.c: fix reservation race when freeing surplus pages
   8315c22ea879 mm/slab.c: fix SLAB freelist randomization duplicate entries
   6ca29ee3ca0d mm: support anonymous stable page
   07fc9575e88a mm, memcg: fix the active list aging for lowmem requests when memcg is enabled
   6c9bd81cb9ea ocfs2: fix crash caused by stale lvb with fsdlm plugin
   692755b1006d mm: fix devm_memremap_pages crash, use mem_hotplug_{begin, done}
   8edd365ee94c mm: pmd dirty emulation in page fault handler
   87fa6f37fa29 dax: fix deadlock with DAX 4k holes
   2e264fb546fa zram: support BDI_CAP_STABLE_WRITES
   ad4764b4c8eb zram: revalidate disk under init_lock
   057ac4429aef selftests: do not require bash for the generated test
   91ee732cb563 selftests: do not require bash to run netsocktests testcase
   d65146c7fb91 drm/savage: dereferencing an error pointer
   c730a84aff6f drm/vc4: Fix a couple error codes in vc4_cl_lookup_bos()
   a63bb198dc14 drm/tegra: dpaux: Fix error handling
   6b94626c9edf regulator: axp20x: Fix axp809 ldo_io registration error on cold boot
   8ac055af47ae regulator: tps65086: Fix 25mV ranges for BUCK regulators
   9229336861cb pinctrl: sh-pfc: Add helper to handle bias lookup table
   5e1595223a2c pinctrl: sh-pfc: r8a7795: Use lookup function for bias data
   b01bbf221fcc pinctrl: imx: fix imx_pinctrl_desc initialization
   f34fbb92fe81 Input: i8042 - add Pegatron touchpad to noloop table
   5975358bf2ad Input: xpad - use correct product id for x360w controllers

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 904a8465b32c..e85d7c7b18c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0898601446c6bde63cb97fb6236d114886ed5f2a"
-SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
+SRCREV_machine ?= "1d5e0d6f25c65f2404c47de11bef86f3dbc7f29d"
+SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.4"
+LINUX_VERSION ?= "4.9.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index c2931df20188..a052dad5d1fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.4"
+LINUX_VERSION ?= "4.9.6"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
+SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index eb3f027e70e9..a61bb137b999 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ebd7956fb8f43632fff9537579d2788532ec5dad"
-SRCREV_machine_qemuarm64 ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_machine_qemumips ?= "2e81d7a5cc2cbfae377f4d07d85c34800c04e3c2"
-SRCREV_machine_qemuppc ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_machine_qemux86 ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_machine_qemux86-64 ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_machine_qemumips64 ?= "af223adb1634de8cb279ff809c6d13266b87e5dc"
-SRCREV_machine ?= "087b65ddac049813eef2513c4440cb1d02971357"
-SRCREV_meta ?= "8c71361007816dcabe297f40cd5a38ed5d7d7599"
+SRCREV_machine_qemuarm ?= "9dc59f0efe6cd1dd806b5b6089faf803db9018a4"
+SRCREV_machine_qemuarm64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_machine_qemumips ?= "0ed887a8c24e2c2a8a2f136b9ef5031bdf6cde8c"
+SRCREV_machine_qemuppc ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_machine_qemux86 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_machine_qemux86-64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_machine_qemumips64 ?= "06fff8284bbec52a36fb3d054354db2f593376ac"
+SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
+SRCREV_meta ?= "0f58ab994909b0a15939f505458cec35a9663e5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.4"
+LINUX_VERSION ?= "4.9.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


