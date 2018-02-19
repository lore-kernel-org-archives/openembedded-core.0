Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A91B57871D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 02:25:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1J2PtJc021070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Feb 2018 18:25:55 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 18 Feb 2018 18:25:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 18 Feb 2018 21:25:46 -0500
Message-ID: <af4cbf83519edc8d6ab6e0bb515538e86810fff0.1519006338.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1519006338.git.bruce.ashfield@windriver.com>
References: <cover.1519006338.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.14: add -rt and update to v4.4.18
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
X-List-Received-Date: Mon, 19 Feb 2018 02:25:54 -0000
Content-Type: text/plain

Integrating the preempt-rt patch to v4.14 and also updating the -stable
version to 4.14.18 to pickup the following fixes:

   81d0cc85caab Linux 4.14.18
   8d1ed7d4e1ce fpga: region: release of_parse_phandle nodes after use
   a252f37c5f8b serial: core: mark port as initialized after successful IRQ change
   f6d90612c96c KVM/SVM: Allow direct access to MSR_IA32_SPEC_CTRL
   4a82531c96a2 KVM/VMX: Allow direct access to MSR_IA32_SPEC_CTRL
   0716f551d5a2 KVM/VMX: Emulate MSR_IA32_ARCH_CAPABILITIES
   d395d69de67e KVM/x86: Add IBPB support
   8f7c4d52a0e8 KVM/x86: Update the reverse_cpuid list to include CPUID_7_EDX
   4c8298c1fdd3 x86/speculation: Fix typo IBRS_ATT, which should be IBRS_ALL
   6dd1f6989a54 x86/pti: Mark constant arrays as __initconst
   ebaf2271a024 x86/spectre: Simplify spectre_v2 command line parsing
   838dbae0acd0 x86/retpoline: Avoid retpolines for built-in __init functions
   6f6eb84b14ac x86/kvm: Update spectre-v1 mitigation
   7f8da2c8a191 KVM: VMX: make MSR bitmaps per-VCPU
   ad368e5b2d56 x86/paravirt: Remove 'noreplace-paravirt' cmdline option
   7a3f12294da4 x86/speculation: Use Indirect Branch Prediction Barrier in context switch
   85543d7613c4 x86/cpuid: Fix up "virtual" IBRS/IBPB/STIBP feature bits on Intel
   c962dfa4aca0 x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
   863b308dbb19 x86/spectre: Report get_user mitigation for spectre_v1
   c9daf8144642 nl80211: Sanitize array index in parse_txq_params
   98116c32d3b4 vfs, fdtable: Prevent bounds-check bypass via speculative execution
   003513404120 x86/syscall: Sanitize syscall table de-references under speculation
   edaf1538d3a5 x86/get_user: Use pointer masking to limit speculation
   5f40de41ccae x86/uaccess: Use __uaccess_begin_nospec() and uaccess_try_nospec
   2406eb9f4568 x86/usercopy: Replace open coded stac/clac with __uaccess_{begin, end}
   31c5b332189e x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
   437ac7b6868d x86: Introduce barrier_nospec
   4820d42835b2 x86: Implement array_index_mask_nospec
   478742cf80b7 array_index_nospec: Sanitize speculative array de-references
   e72041f70c3c Documentation: Document array_index_nospec
   fb9f2d9ab83d x86/asm: Move 'status' from thread_struct to thread_info
   90522d30b223 x86/entry/64: Push extra regs right away
   8459ebcbd6ec x86/entry/64: Remove the SYSCALL64 fast path
   74ae346691dd x86/spectre: Check CONFIG_RETPOLINE in command line parser
   04e073072d14 x86/mm: Fix overlap of i386 CPU_ENTRY_AREA with FIX_BTMAP
   23a4ca4e749a objtool: Warn on stripped section symbol
   3e04e09855c5 objtool: Add support for alternatives at the end of a section
   a358df03279e objtool: Improve retpoline alternative handling
   92f4b68ed14c KVM: VMX: introduce alloc_loaded_vmcs
   2e9521197f08 KVM: nVMX: Eliminate vmcs02 pool
   76f06358ec40 ASoC: pcm512x: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   bc484da3e18c pinctrl: pxa: pxa2xx: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   ce094a80f019 iio: adc/accel: Fix up module licenses
   c8aa5cd906a5 auxdisplay: img-ascii-lcd: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   9f8955f96bd5 x86/speculation: Simplify indirect_branch_prediction_barrier()
   52d78bce4965 x86/retpoline: Simplify vmexit_fill_RSB()
   7f3e0daa9e12 x86/cpufeatures: Clean up Spectre v2 related CPUID flags
   249b1f7a7f09 x86/cpu/bugs: Make retpoline module warning conditional
   91ff9a75f360 x86/bugs: Drop one "mitigation" from dmesg
   b955239cf4ea x86/nospec: Fix header guards names
   67eb59b8ecfb x86/alternative: Print unadorned pointers
   dbbbafce5380 x86/speculation: Add basic IBPB (Indirect Branch Prediction Barrier) support
   0fd222b19766 x86/cpufeature: Blacklist SPEC_CTRL/PRED_CMD on early Spectre v2 microcodes
   d9b47a41160c x86/pti: Do not enable PTI on CPUs which are not vulnerable to Meltdown
   a65710dc584c x86/msr: Add definitions for new speculation control MSRs
   15ee82be40b6 x86/cpufeatures: Add AMD feature bits for Speculation Control
   343c91242d09 x86/cpufeatures: Add Intel feature bits for Speculation Control
   76c4bd53969b x86/cpufeatures: Add CPUID_7_EDX CPUID leaf
   86b5b1eb18aa module/retpoline: Warn about missing retpoline in module
   c927726674c7 KVM: VMX: Make indirect call speculation safe
   76bee09efb89 KVM: x86: Make indirect calls in emulator speculation safe
   4ce354deed2c x86/retpoline: Remove the esp/rsp thunk
   d6eded6c9453 powerpc/64s: Allow control of RFI flush via debugfs
   517bdccc3af6 powerpc/64s: Wire up cpu_show_meltdown()
   16d3d10d29f7 scripts/faddr2line: fix CROSS_COMPILE unset error
   0146985addc3 Linux 4.14.17
   04178b1709b6 x86/efi: Clarify that reset attack mitigation needs appropriate userspace
   01ab9886ea78 Input: synaptics-rmi4 - do not delete interrupt memory too early
   fced3c99e726 Input: synaptics-rmi4 - unmask F03 interrupts when port is opened
   aad757b65717 test_firmware: fix missing unlock on error in config_num_requests_store()
   0db5de4f4e18 iio: chemical: ccs811: Fix output of IIO_CONCENTRATION channels
   e2d4cdb7b8a4 iio: adc: stm32: fix scan of multiple channels with DMA
   cfd96cbd607a spi: imx: do not access registers while clocks disabled
   e6e7d6baa61a serial: imx: Only wakeup via RTSDEN bit if the system has RTS/CTS
   24293a3970e1 serial: 8250_uniphier: fix error return code in uniphier_uart_probe()
   aa33208b5a6f serial: 8250_of: fix return code when probe function fails to get reset
   e00c5c771877 mei: me: allow runtime pm for platform with D0i3
   86eda3864a70 android: binder: use VM_ALLOC to get vm area
   7a3cee43e935 ANDROID: binder: remove waitqueue when thread exits.
   2ba5966eddef usb/gadget: Fix "high bandwidth" check in usb_gadget_ep_match_desc()
   e0096f93aa42 usb: uas: unconditionally bring back host after reset
   75816a439f65 usb: f_fs: Prevent gadget unbind if it is already unbound
   1c226267c225 USB: serial: simple: add Motorola Tetra driver
   d00a0442a99e usbip: list: don't list devices attached to vhci_hcd
   aa7cdae765cf usbip: prevent bind loops on devices attached to vhci_hcd
   9a24d3f8c566 USB: serial: io_edgeport: fix possible sleep-in-atomic
   34b812ca3038 CDC-ACM: apply quirk for card reader
   ca7964983ca4 USB: cdc-acm: Do not log urb submission errors on disconnect
   bfc372036b41 USB: serial: pl2303: new device id for Chilitag
   947914111303 usb: option: Add support for FS040U modem
   3c538ad93546 tty: fix data race between tty_init_dev and flush of buf
   eb6de1af2e72 staging: ccree: fix fips event irq handling build
   fad7da7b638a staging: ccree: NULLify backup_info when unused
   7a4b5ee973cf staging: lustre: separate a connection destroy from free struct kib_conn
   c065b9947b05 KVM: x86: emulate #UD while in guest mode
   e9273b08d4fb drm/vc4: Move IRQ enable to PM path
   c789cfe0ae72 staging: rtl8188eu: Fix incorrect response to SIOCGIWESSID
   0479bc01767f usb: gadget: don't dereference g until after it has been null checked
   aafb1a7eb0f7 x86/xen: Support early interrupts in xen pv guests
   99a8cad9c1b2 media: usbtv: add a new usbid
   504b902b36a9 ARM: dts: NSP: Fix PPI interrupt types
   12f165f4418a ARM: dts: NSP: Disable AHCI controller for HR NSP boards
   c67fa169456e iwlwifi: fix access to prph when transport is stopped
   99f3d5f37e58 iwlwifi: mvm: fix the TX queue hang timeout for MONITOR vif type
   6c27a40c9e18 scsi: ufs: ufshcd: fix potential NULL pointer dereference in ufshcd_config_vreg
   39527e909ea5 scsi: aacraid: Prevent crash in case of free interrupt during scsi EH path
   612959943e40 perf/core: Fix memory leak triggered by perf --namespace
   773a1c5baad2 xfs: Properly retry failed dquot items in case of error during buffer writeback
   4e506f41705c xfs: ubsan fixes
   4a96f3d05668 drm/omap: displays: panel-dpi: add backlight dependency
   345dc6d499d8 drm/omap: Fix error handling path in 'omap_dmm_probe()'
   464711a74ce3 drm/bridge: tc358767: fix 1-lane behavior
   340c9a4ba303 drm/bridge: tc358767: fix AUXDATAn registers access
   b536eb986e45 drm/bridge: tc358767: fix timing calculations
   0106381870a4 drm/bridge: tc358767: fix DP0_MISC register set
   859bacc13cbb drm/bridge: tc358767: filter out too high modes
   6d734363f2c5 drm/bridge: tc358767: do no fail on hi-res displays
   345f165a31b8 drm/bridge: Fix lvds-encoder since the panel_bridge rework.
   b2ba0bd34695 kmemleak: add scheduling point to kmemleak_scan()
   bf6a04c3ffe1 scripts/faddr2line: extend usage on generic arch
   ca4b61373ee8 SUNRPC: Allow connect to return EHOSTUNREACH
   8f8b2c79c4a3 quota: Check for register_shrinker() failure.
   600c904b919a net: ethernet: xilinx: Mark XILINX_LL_TEMAC broken on 64-bit
   575c548137f8 drm/amdgpu: don't try to move pinned BOs
   f730601cdead xfs: fortify xfs_alloc_buftarg error handling
   95a7d23415b7 nvme-pci: fix NULL pointer dereference in nvme_free_host_mem()
   f268e508aeb2 Btrfs: incremental send, fix wrong unlink path after renaming file
   b27440626674 bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
   c25d803a3b7d net: phy: marvell10g: fix the PHY id mask
   5e60a297e78d net: mvpp2: fix the txq_init error path
   606592f53b87 quota: propagate error from __dquot_initialize
   1271aeb0027c hwmon: (pmbus) Use 64bit math for DIRECT format values
   02cfbaa6cd42 lockd: fix "list_add double add" caused by legacy signal interface
   156c80d4e197 race of lockd inetaddr notifiers vs nlmsvc_rqst change
   631db7f3895b nfsd: check for use of the closed special stateid
   e0849eb97066 grace: replace BUG_ON by WARN_ONCE in exit_net hook
   3bd364d156b1 nfsd: Ensure we check stateid validity in the seqid operation checks
   5f71ff510631 nfsd: CLOSE SHOULD return the invalid special stateid for NFSv4.x (x>0)
   c900ee9118d7 auxdisplay: img-ascii-lcd: Only build on archs that have IOMEM
   0ffb252208a2 xen-netfront: remove warning when unloading module
   53c045c6d07d i2c: i2c-boardinfo: fix memory leaks on devinfo
   30ac846da360 xfs: log recovery should replay deferred ops in order
   1eccdbd4836a xfs: always free inline data before resetting inode fork during ifree
   40ba283e2602 KVM: Let KVM_SET_SIGNAL_MASK work as advertised
   809981870b66 Btrfs: fix list_add corruption and soft lockups in fsync
   2ce1bbfb5e67 KVM: VMX: Fix rflags cache during vCPU reset
   2f1b5183aee3 KVM: X86: Fix softlockup when get the current kvmclock
   9a447435afab reiserfs: remove unneeded i_version bump
   14a4e9f6bde8 sctp: set sender next_tsn for the old result with ctsn_ack_point plus 1
   55f3de731c0b sctp: avoid flushing unsent queue when doing asoc reset
   d4c72a410f3b sctp: only allow the asoc reset when the asoc outq is empty
   928066e61940 btrfs: fix deadlock when writing out space cache
   841211271ecc mac80211: fix the update of path metric for RANN frame
   e23090a7d8f0 mac80211: use QoS NDP for AP probing
   093a5cb46d05 drm/rockchip: dw-mipi-dsi: fix possible un-balanced runtime PM enable
   9be97a9abe9e openvswitch: fix the incorrect flow action alloc size
   dd45c5e5be07 nvme-rdma: don't complete requests before a send work request has completed
   120c41af36df uapi: fix linux/kfd_ioctl.h userspace compilation errors
   b15f53b46d88 drm/amdkfd: Fix SDMA oversubsription handling
   64aca9911a10 drm/amdkfd: Fix SDMA ring buffer size calculation
   a595f190fc6b drm/amdgpu: Fix SDMA load/unload sequence on HWS disabled mode
   f9f175778bb9 bcache: check return value of register_shrinker
   1392633bafde rxrpc: Fix service endpoint expiry
   b89372f234a8 rxrpc: Provide a different lockdep key for call->user_mutex for kernel calls
   92c131bebf47 rxrpc: The mutex lock returned by rxrpc_accept_call() needs releasing
   e2443fb287cc s390: fix alloc_pgste check in init_new_context again
   2e194c9c5596 null_blk: fix dev->badblocks leak
   d290178f00d4 cpufreq: Add Loongson machine dependencies
   cb78d818c30d ACPI / bus: Leave modalias empty for devices which are not present
   82b90de5b111 s390/zcrypt: Fix wrong comparison leading to strange load balancing
   18c128456eac s390/topology: fix compile error in file arch/s390/kernel/smp.c
   71686d2a1759 nvmet-fc: correct ref counting error when deferred rcv used
   93a4bcf2c425 nvme-pci: avoid hmb desc array idx out-of-bound when hmmaxd set.
   128dc55f891c nvme-pci: disable APST on Samsung SSD 960 EVO + ASUS PRIME B350M-A
   7af5f9137c93 nvme-loop: check if queue is ready in queue_rq
   db2044fc4230 nvme-fc: check if queue is ready in queue_rq
   26bd01c1affe nvme-fabrics: introduce init command check for a queue that is not alive
   d46e961f056a KVM: nVMX: Fix vmx_check_nested_events() return value in case an event was reinjected to L2
   b689fc5b79d5 KVM: x86: ioapic: Preserve read-only values in the redirection table
   408a26510739 KVM: x86: ioapic: Clear Remote IRR when entry is switched to edge-triggered
   b501603be9df KVM: x86: ioapic: Fix level-triggered EOI and IOAPIC reconfigure race
   f0a3691bf2e5 KVM: x86: fix em_fxstor() sleeping while in atomic
   5e7c270a1e60 KVM: nVMX: Fix mmu context after VMLAUNCH/VMRESUME failure
   4f5500a63455 KVM: X86: Fix operand/address-size during instruction decoding
   df54fc5c28d2 KVM: x86: Don't re-execute instruction when not passing CR2 value
   fbd81f09793b KVM: x86: emulator: Return to user-mode on L1 CPL=0 emulation failure
   d003b4bfda3b KVM: nVMX/nSVM: Don't intercept #UD when running L2
   f1881befacbe cpupower : Fix cpupower working when cpu0 is offline
   1d285c0440fe cpupowerutils: bench - Fix cpu online check
   71341a8a7037 Btrfs: bail out gracefully rather than BUG_ON
   9a8215c0a91e btrfs: Fix transaction abort during failure in btrfs_rm_dev_item
   08bb42086b3e drm/vc4: Account for interrupts in flight
   bdf19237e16f VFS: Handle lazytime in do_mount()
   d7fec01990e6 scsi: aacraid: Fix hang in kdump
   791274e77395 scsi: aacraid: Fix udev inquiry race condition
   516868c59d82 ima/policy: fix parsing of fsuuid
   80baea0e6cf3 igb: Free IRQs when device is hotplugged
   e6a5fe318036 mtd: nand: denali_pci: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   bf8c4b3dd7bf gpio: ath79: add missing MODULE_DESCRIPTION/LICENSE
   925e26b922c5 gpio: iop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   aecad437fd70 power: reset: zx-reboot: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   c76133afb903 HID: wacom: Fix reporting of touch toggle (WACOM_HID_WD_MUTE_DEVICE) events
   e3f7e6f2e033 HID: wacom: EKR: ensure devres groups at higher indexes are released
   f41c8a003196 crypto: af_alg - whitelist mask and type
   b9788e278cec crypto: sha3-generic - fixes for alignment and big endian operation
   199d97815d32 crypto: inside-secure - avoid unmapping DMA memory that was not mapped
   bb9eec7b301e crypto: inside-secure - fix hash when length is a multiple of a block
   5ca02df01602 crypto: aesni - Fix out-of-bounds access of the AAD buffer in generic-gcm-aesni
   f898a39985a3 crypto: aesni - Fix out-of-bounds access of the data buffer in generic-gcm-aesni
   265502fe9ab6 crypto: aesni - add wrapper for generic gcm(aes)
   e704e550cb7b crypto: aesni - Use GCM IV size constant
   cffaf2b6b179 crypto: gcm - add GCM IV size constant
   e50f1d7c0d07 crypto: aesni - fix typo in generic_gcmaes_decrypt
   6b3dcff7ca7e crypto: aesni - handle zero length dst buffer
   299218276576 crypto: ecdh - fix typo in KPP dependency of CRYPTO_ECDH
   a5ba0b372da3 ALSA: hda - Reduce the suspend time consumption for ALC256
   c5845e025423 gpio: Fix kernel stack leak to userspace
   460c5b9745b8 gpio: stmpe: i2c transfer are forbiden in atomic context
   636124c8699b tools/gpio: Fix build error with musl libc
   00251aedef31 KVM: x86: Fix CPUID function for word 6 (80000001_ECX)
   d5e06a186721 loop: fix concurrent lo_open/lo_release
   d383a4277b75 futex: Fix OWNER_DEAD fixup

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 669a2606aed8..841d5f03b8f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+SRCREV_machine ?= "b91765955a6403e4b68b9e0735b439b7fea5e1b7"
+SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.16"
+LINUX_VERSION ?= "4.14.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index bf4b0ac4f6c3..3bfd0b6c93b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.16"
+LINUX_VERSION ?= "4.14.18"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+SRCREV_machine ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index e71046ee0c74..660807555975 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "52cbbd4d3e216cbf0c12ae66f012103b20777884"
-SRCREV_machine_qemuarm64 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_machine_qemumips ?= "900ca1bbd59fe4bf28a767e816d1883d173d7397"
-SRCREV_machine_qemuppc ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_machine_qemux86 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_machine_qemux86-64 ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_machine_qemumips64 ?= "c6c6244d216a6c2f87c807d8e2e4bc42baa7c480"
-SRCREV_machine ?= "ae0fb21fdde3df106d7dad76620bdf39721425e2"
-SRCREV_meta ?= "0e964663a7978bdb459c28f3777e1b6dfe97d93d"
+SRCREV_machine_qemuarm ?= "3144baf8ff07651b13bc2043266eac713aafb965"
+SRCREV_machine_qemuarm64 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_machine_qemumips ?= "bbb7ba114946c2aa95d86ccbf543dede7f147470"
+SRCREV_machine_qemuppc ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_machine_qemux86 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_machine_qemux86-64 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_machine_qemumips64 ?= "74e50a115b86a392c610e73193b49dd029391cb4"
+SRCREV_machine ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
+SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.16"
+LINUX_VERSION ?= "4.14.18"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


