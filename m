Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1035071A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 18:08:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1JI8LDg011299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Feb 2018 10:08:21 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 19 Feb 2018 10:08:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 19 Feb 2018 13:08:20 -0500
Message-ID: <1519063700-14601-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][rocko] kernel-yocto/4.9: update to v4.9.82
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
X-List-Received-Date: Mon, 19 Feb 2018 18:08:22 -0000
Content-Type: text/plain

Updating to the korg -stable release of 4.9.82 which comprises the
following commits:

   3e598a7089ee Linux 4.9.82
   2de1085e8deb ftrace: Remove incorrect setting of glob search field
   df113487f844 mn10300/misalignment: Use SIGSEGV SEGV_MAPERR to report a failed user copy
   38e3bc59e0dd ovl: fix failure to fsync lower dir
   a468a3749bb5 acpi, nfit: fix register dimm error handling
   623c28ee02b3 ACPI: sbshc: remove raw pointer from printk() message
   3169a7c06e91 drm/i915: Avoid PPS HW/SW state mismatch due to rounding
   8fe7ceaf8a4e btrfs: Handle btrfs_set_extent_delalloc failure in fixup worker
   3c83fe52b5c1 lib/ubsan: add type mismatch handler for new GCC/Clang
   3f8130127c0c lib/ubsan.c: s/missaligned/misaligned/
   1bb09d05a41c clocksource/drivers/stm32: Fix kernel panic with multiple timers
   944723bf84d3 pktcdvd: Fix pkt_setup_dev() error path
   86d408d10efd pinctrl: intel: Initialize GPIO properly when used through irqchip
   10ddc77ffb92 EDAC, octeon: Fix an uninitialized variable warning
   2d4e295284a9 xtensa: fix futex_atomic_cmpxchg_inatomic
   71611b37cca4 alpha: fix formating of stack content
   7d22d92ca6c9 alpha: fix reboot on Avanti platform
   68d18e90eeec alpha: fix crash if pthread_create races with signal delivery
   21f94109d0f1 signal/sh: Ensure si_signo is initialized in do_divide_error
   498b8b7453a3 signal/openrisc: Fix do_unaligned_access to send the proper signal
   5795b076bd7f Bluetooth: btusb: Restore QCA Rome suspend/resume fix with a "rewritten" version
   84bf682f5342 Revert "Bluetooth: btusb: fix QCA Rome suspend/resume"
   6913d1b190b9 Bluetooth: btsdio: Do not bind to non-removable BCM43341
   df9658e80605 HID: quirks: Fix keyboard + touchpad on Toshiba Click Mini not working
   71baf27d8c2b pipe: fix off-by-one error when checking buffer limits
   a705c24b5d50 pipe: actually allow root to exceed the pipe buffer limits
   91cebf98cd94 kernel/relay.c: revert "kernel/relay.c: fix potential memory leak"
   33a4459bdef1 kernel/async.c: revert "async: simplify lowest_in_progress()"
   da3b224658d3 fs/proc/kcore.c: use probe_kernel_read() instead of memcpy()
   1666d38f4ed6 media: cxusb, dib0700: ignore XC2028_I2C_FLUSH
   b2e7c63cad18 media: ts2020: avoid integer overflows on 32 bit machines
   d1d85ae79d5e media: dvb-frontends: fix i2c access helpers for KASAN
   b7f9df60f410 watchdog: imx2_wdt: restore previous timeout after suspend+resume
   eb10c5973eb2 ASoC: skl: Fix kernel warning due to zero NHTL entry
   76376783a453 ASoC: rockchip: i2s: fix playback after runtime resume
   f6741799aa53 KVM: arm/arm64: Handle CPU_PM_ENTER_FAILED
   ba88289e7acb KVM: nVMX: Fix races when sending nested PI while dest enters/leaves L2
   51e22c571fad arm: KVM: Fix SMCCC handling of unimplemented SMC/HVC calls
   68f2013e1ff8 crypto: sha512-mb - initialize pending lengths correctly
   a96e82079025 crypto: caam - fix endless loop when DECO acquire fails
   f2d4bed9eabf media: v4l2-compat-ioctl32.c: refactor compat ioctl32 logic
   437c4ec62efb media: v4l2-compat-ioctl32.c: don't copy back the result for certain errors
   30dcb0756b0f media: v4l2-compat-ioctl32.c: drop pr_info for unknown buffer type
   30ac343c4222 media: v4l2-compat-ioctl32.c: copy clip list in put_v4l2_window32
   55e3f3e6846c media: v4l2-compat-ioctl32: Copy v4l2_window->global_alpha
   8465657a3be4 media: v4l2-compat-ioctl32.c: make ctrl_is_pointer work for subdevs
   9a7cd41be3ad media: v4l2-compat-ioctl32.c: fix ctrl_is_pointer
   eec955463de3 media: v4l2-compat-ioctl32.c: copy m.userptr in put_v4l2_plane32
   daff4d009f4f media: v4l2-compat-ioctl32.c: avoid sizeof(type)
   81e0acf07015 media: v4l2-compat-ioctl32.c: move 'helper' functions to __get/put_v4l2_format32
   02129c9bc235 media: v4l2-compat-ioctl32.c: fix the indentation
   f294548da645 media: v4l2-compat-ioctl32.c: add missing VIDIOC_PREPARE_BUF
   e78d9fdf5ecc media: v4l2-ioctl.c: don't copy back the result for -ENOTTY
   daaa81c48402 nsfs: mark dentry with DCACHE_RCUACCESS
   b93728341fb7 crypto: poly1305 - remove ->setkey() method
   45f31106baa3 crypto: mcryptd - pass through absence of ->setkey()
   c1ebf9f83547 crypto: cryptd - pass through absence of ->setkey()
   d2b492bda560 crypto: hash - introduce crypto_hash_alg_has_setkey()
   016572d31d32 ahci: Add Intel Cannon Lake PCH-H PCI ID
   72c0031a914e ahci: Add PCI ids for Intel Bay Trail, Cherry Trail and Apollo Lake AHCI
   3332b6f3276b ahci: Annotate PCI ids for mobile Intel chipsets as such
   058d13f85da6 kernfs: fix regression in kernfs_fop_write caused by wrong type
   b79d8854ee0e NFS: Fix a race between mmap() and O_DIRECT
   967f650f8835 NFS: reject request for id_legacy key without auxdata
   ca2c316f7cb4 NFS: commit direct writes even if they fail partially
   d1840343f948 NFS: Add a cond_resched() to nfs_commit_release_pages()
   e1df8c682df6 nfs/pnfs: fix nfs_direct_req ref leak when i/o falls back to the mds
   298dc6c6696b ubifs: Massage assert in ubifs_xattr_set() wrt. init_xattrs
   de14d0c124ca ubi: block: Fix locking for idr_alloc/idr_remove
   84f9d8536c8b ubi: fastmap: Erase outdated anchor PEBs during attach
   44ebd641be56 mtd: nand: sunxi: Fix ECC strength choice
   d80cd3e93653 mtd: nand: Fix nand_do_read_oob() return value
   d25d52ff1011 mtd: nand: brcmnand: Disable prefetch by default
   cbdabc7027b1 mtd: cfi: convert inline functions to macros
   198a7ddaf5d2 media: hdpvr: Fix an error handling path in hdpvr_probe()
   f320dd20224c media: dvb-usb-v2: lmedm04: move ts2020 attach to dm04_lme2510_tuner
   1ff1353a03c6 media: dvb-usb-v2: lmedm04: Improve logic checking of warm start
   7e2fb808d3c7 dccp: CVE-2017-8824: use-after-free in DCCP code
   a384e5437f70 sched/rt: Up the root domain ref count when passing it around via IPIs
   1c679981309b sched/rt: Use container_of() to get root domain in rto_push_irq_work_func()
   57ddb8eae517 usb: gadget: uvc: Missing files for configfs interface
   0b376535ad54 posix-timer: Properly check sigevent->sigev_notify
   83946c33b9b9 kaiser: fix compile error without vsyscall
   297c7cc4b565 dmaengine: dmatest: fix container_of member in dmatest_callback
   7e68916c361a CIFS: zero sensitive data when freeing
   f59eda16646a cifs: Fix autonegotiate security settings mismatch
   ee6858f72a39 cifs: Fix missing put_xid in cifs_file_strict_mmap
   ba4f9c192d3b powerpc/pseries: include linux/types.h in asm/hvcall.h
   7f3bd8db9974 Linux 4.9.81
   2760f452a718 x86/microcode: Do the family check first
   230ca8fb9515 drm: rcar-du: Fix race condition when disabling planes at CRTC stop
   758e22acf4fd drm: rcar-du: Use the VBK interrupt for vblank events
   1cb145c67260 ASoC: rsnd: avoid duplicate free_irq()
   24978c21f7ed ASoC: rsnd: don't call free_irq() on Parent SSI
   a7de0e9718c3 ASoC: simple-card: Fix misleading error message
   7c17a1e5852a crypto: tcrypt - fix S/G table for test_aead_speed()
   fc00dde96099 KVM/SVM: Allow direct access to MSR_IA32_SPEC_CTRL
   e5a83419c957 KVM/VMX: Allow direct access to MSR_IA32_SPEC_CTRL
   755502f810c6 KVM/VMX: Emulate MSR_IA32_ARCH_CAPABILITIES
   7013129a4034 KVM/x86: Add IBPB support
   6236b782eba3 KVM: VMX: make MSR bitmaps per-VCPU
   ff546f9d83d3 KVM: VMX: introduce alloc_loaded_vmcs
   46e24dfc2dfe KVM: nVMX: Eliminate vmcs02 pool
   b7649e177670 KVM: nVMX: mark vmcs12 pages dirty on L2 exit
   1edccf20b9d8 KVM: nVMX: vmx_complete_nested_posted_interrupt() can't fail
   19b1d4bdfe5c KVM: nVMX: kmap() can't fail
   34900390e966 x86/speculation: Fix typo IBRS_ATT, which should be IBRS_ALL
   4b234a253e52 x86/pti: Mark constant arrays as __initconst
   961cb14c615d x86/spectre: Simplify spectre_v2 command line parsing
   fe4333893936 x86/retpoline: Avoid retpolines for built-in __init functions
   eb99bd6341cb x86/kvm: Update spectre-v1 mitigation
   7552556f65af x86/paravirt: Remove 'noreplace-paravirt' cmdline option
   cda6b6074cc6 x86/cpuid: Fix up "virtual" IBRS/IBPB/STIBP feature bits on Intel
   f67e05d1506a x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
   359fde6bd0ec x86/spectre: Report get_user mitigation for spectre_v1
   0781a50a30d3 nl80211: Sanitize array index in parse_txq_params
   c26ceec69576 vfs, fdtable: Prevent bounds-check bypass via speculative execution
   c3193fd49f6f x86/syscall: Sanitize syscall table de-references under speculation
   398a39311c0b x86/get_user: Use pointer masking to limit speculation
   065eae4be83d x86/uaccess: Use __uaccess_begin_nospec() and uaccess_try_nospec
   ae75f83e79e4 x86/usercopy: Replace open coded stac/clac with __uaccess_{begin, end}
   e06d7bfb223e x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
   1f03d140e2f5 x86: Introduce barrier_nospec
   8c33e2d23a68 x86: Implement array_index_mask_nospec
   579ef9ea20d6 array_index_nospec: Sanitize speculative array de-references
   899ab2cf9138 Documentation: Document array_index_nospec
   f03d00ba0b47 x86/asm: Move 'status' from thread_struct to thread_info
   572e50917811 x86/entry/64: Push extra regs right away
   d7f8d17406d6 x86/entry/64: Remove the SYSCALL64 fast path
   9eedeb72c412 x86/spectre: Check CONFIG_RETPOLINE in command line parser
   77d1424d2fb8 x86/retpoline: Simplify vmexit_fill_RSB()
   77b3b3ee2386 x86/cpufeatures: Clean up Spectre v2 related CPUID flags
   98911226d51e x86/cpu/bugs: Make retpoline module warning conditional
   557cbfa22211 x86/bugs: Drop one "mitigation" from dmesg
   18bc71dff630 x86/nospec: Fix header guards names
   31fd9eda7f69 x86/speculation: Add basic IBPB (Indirect Branch Prediction Barrier) support
   6c5e49150a51 x86/cpufeature: Blacklist SPEC_CTRL/PRED_CMD on early Spectre v2 microcodes
   a8799fd14d9f x86/pti: Do not enable PTI on CPUs which are not vulnerable to Meltdown
   af57d43c908f x86/msr: Add definitions for new speculation control MSRs
   c26a6bea26b3 x86/cpufeatures: Add AMD feature bits for Speculation Control
   40532f65cccc x86/cpufeatures: Add Intel feature bits for Speculation Control
   d3eba7744075 x86/cpufeatures: Add CPUID_7_EDX CPUID leaf
   a1745ad92f50 module/retpoline: Warn about missing retpoline in module
   ec86a1dad0c0 KVM: VMX: Make indirect call speculation safe
   fea3c9a54012 KVM: x86: Make indirect calls in emulator speculation safe
   734e687d1d7b x86/retpoline: Remove the esp/rsp thunk
   9692602ab850 KEYS: encrypted: fix buffer overread in valid_master_desc()
   0a01ecbd23a9 b43: Add missing MODULE_FIRMWARE()
   113d22965c78 media: soc_camera: soc_scale_crop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   dd7b14c3e05e x86/microcode/AMD: Do not load when running on a hypervisor
   0a9b2dec6c12 x86/asm: Fix inline asm call constraints for GCC 4.4
   b671f40419bb soreuseport: fix mem leak in reuseport_add_sock()
   5771415d24bf ipv6: Fix SO_REUSEPORT UDP socket with implicit sk_ipv6only
   fa46d1437fab cls_u32: add missing RCU annotation.
   b980f718f525 tcp_bbr: fix pacing_gain to always be unity when using lt_bw
   73adb3b74efd vhost_net: stop device during reset owner
   ee46a8614204 tcp: release sk_frag.page in tcp_disconnect
   5db5cabbf09d r8169: fix RTL8168EP take too long to complete driver initialization.
   9f2f873d5a1c qmi_wwan: Add support for Quectel EP06
   97fe899816a6 qlcnic: fix deadlock bug
   ce43c07fcef8 net: igmp: add a missing rcu locking section
   7d3d60ef2256 ip6mr: fix stale iterator
   ffcf167d348e serial: core: mark port as initialized after successful IRQ change
   400d3c8b0c7f kaiser: allocate pgd with order 0 when pti=off
   ae1fc8de51b1 x86/pti: Make unpoison of pgd for trusted boot work for real
   0a61cd6caed7 kaiser: fix intel_bts perf crashes
   374c84de94af ASoC: pcm512x: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   0ee4f5e7bbff pinctrl: pxa: pxa2xx: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   781a2d683110 auxdisplay: img-ascii-lcd: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   9fed3978c39b powerpc/64s: Allow control of RFI flush via debugfs
   1f0c936f431d powerpc/64s: Wire up cpu_show_meltdown()
   6aec12e1869e powerpc/powernv: Check device-tree for RFI flush settings
   7db0fff62f52 powerpc/pseries: Query hypervisor for RFI flush settings
   0ef9f8289edf powerpc/64s: Support disabling RFI flush with no_rfi_flush and nopti
   c3b82ebee6e0 powerpc/64s: Add support for RFI flush of L1-D cache
   48cc95d4e4d6 powerpc/64s: Convert slb_miss_common to use RFI_TO_USER/KERNEL
   00e40620a51e powerpc/64: Convert the syscall exit path to use RFI_TO_USER/KERNEL
   9d914324d966 powerpc/64: Convert fast_exception_return to use RFI_TO_USER/KERNEL
   8fd3f98d0f4d powerpc/64: Add macros for annotating the destination of rfid/hrfid
   be6641a7e6f7 powerpc/pseries: Add H_GET_CPU_CHARACTERISTICS flags & wrapper
   331b057d4f3c Linux 4.9.80
   1333c3e996eb spi: imx: do not access registers while clocks disabled
   5846849a1ac7 serial: imx: Only wakeup via RTSDEN bit if the system has RTS/CTS
   9df847674ede usbip: vhci_hcd: clear just the USB_PORT_STAT_POWER bit
   57d4bb1beecb usb/gadget: Fix "high bandwidth" check in usb_gadget_ep_match_desc()
   92e64a1079fa usb: uas: unconditionally bring back host after reset
   f24d171a8100 usb: f_fs: Prevent gadget unbind if it is already unbound
   800de0fab17a USB: serial: simple: add Motorola Tetra driver
   f80079536bb6 usbip: list: don't list devices attached to vhci_hcd
   4c6fcc3425e1 usbip: prevent bind loops on devices attached to vhci_hcd
   ec719c52af16 USB: serial: io_edgeport: fix possible sleep-in-atomic
   aa6a93fd0c38 CDC-ACM: apply quirk for card reader
   c3b1f3137751 USB: cdc-acm: Do not log urb submission errors on disconnect
   068cc4ad2b23 USB: serial: pl2303: new device id for Chilitag
   2ef0d2ad5ce8 usb: option: Add support for FS040U modem
   55eaecffe3d6 tty: fix data race between tty_init_dev and flush of buf
   383e0620b70b staging: lustre: separate a connection destroy from free struct kib_conn
   f94b238fb856 drm/vc4: Move IRQ enable to PM path
   ace1911b7620 staging: rtl8188eu: Fix incorrect response to SIOCGIWESSID
   0e216b0a0f74 usb: gadget: don't dereference g until after it has been null checked
   b4bfc8ef594a media: usbtv: add a new usbid
   c16c193e3abc ARM: dts: NSP: Fix PPI interrupt types
   9adb2a0f9a47 iwlwifi: mvm: fix the TX queue hang timeout for MONITOR vif type
   a248dc6a55b7 scsi: ufs: ufshcd: fix potential NULL pointer dereference in ufshcd_config_vreg
   fa64914313c1 scsi: aacraid: Prevent crash in case of free interrupt during scsi EH path
   fde77c712ac0 xfs: Properly retry failed dquot items in case of error during buffer writeback
   d96024440ee5 xfs: ubsan fixes
   9301165c4623 drm/omap: Fix error handling path in 'omap_dmm_probe()'
   f7170eb80aff drm/bridge: tc358767: fix 1-lane behavior
   8ae615fecee5 drm/bridge: tc358767: fix AUXDATAn registers access
   1bdfc52c331a drm/bridge: tc358767: fix timing calculations
   c55908604ecc drm/bridge: tc358767: fix DP0_MISC register set
   8d4bfe89aacf drm/bridge: tc358767: filter out too high modes
   5f6a0441ca0d drm/bridge: tc358767: do no fail on hi-res displays
   7b8623841f2b kmemleak: add scheduling point to kmemleak_scan()
   d2a67f7afcad SUNRPC: Allow connect to return EHOSTUNREACH
   c4ecc2f69643 quota: Check for register_shrinker() failure.
   d47907bcac94 net: ethernet: xilinx: Mark XILINX_LL_TEMAC broken on 64-bit
   e11616d5e6c3 drm/amdgpu: don't try to move pinned BOs
   54a1fdff1b09 xfs: fortify xfs_alloc_buftarg error handling
   98ae1ca7534e bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
   d5a746cf4797 hwmon: (pmbus) Use 64bit math for DIRECT format values
   3b7742374f3e lockd: fix "list_add double add" caused by legacy signal interface
   f25e222ccc50 nfsd: check for use of the closed special stateid
   f35ab8e2eeb8 grace: replace BUG_ON by WARN_ONCE in exit_net hook
   2a7d4a723d2e nfsd: Ensure we check stateid validity in the seqid operation checks
   5cd3586ca8d4 nfsd: CLOSE SHOULD return the invalid special stateid for NFSv4.x (x>0)
   c57767b60962 auxdisplay: img-ascii-lcd: Only build on archs that have IOMEM
   c6a34556f539 xen-netfront: remove warning when unloading module
   b5bfda0f8e29 xfs: always free inline data before resetting inode fork during ifree
   5c0b19bd8cff KVM: VMX: Fix rflags cache during vCPU reset
   b0fa04e8429e KVM: X86: Fix softlockup when get the current kvmclock
   90ef2c30ebd3 reiserfs: remove unneeded i_version bump
   8cfb3965ebcd btrfs: fix deadlock when writing out space cache
   030d4676a268 mac80211: fix the update of path metric for RANN frame
   03899a46c223 openvswitch: fix the incorrect flow action alloc size
   827558408206 drm/amdkfd: Fix SDMA oversubsription handling
   16980affa1b0 drm/amdkfd: Fix SDMA ring buffer size calculation
   8afdbb165a79 drm/amdgpu: Fix SDMA load/unload sequence on HWS disabled mode
   409982cbb5eb bcache: check return value of register_shrinker
   6436981ba6d1 cpufreq: Add Loongson machine dependencies
   876b31fd9815 KVM: x86: ioapic: Preserve read-only values in the redirection table
   1d3ab3b2964e ACPI / bus: Leave modalias empty for devices which are not present
   a9f2c1693667 KVM: x86: ioapic: Clear Remote IRR when entry is switched to edge-triggered
   2f9e94ef498d KVM: x86: ioapic: Fix level-triggered EOI and IOAPIC reconfigure race
   ec73d16bc7ce KVM: X86: Fix operand/address-size during instruction decoding
   114de9bfefa5 KVM: x86: Don't re-execute instruction when not passing CR2 value
   60d9b22b1ffc KVM: x86: emulator: Return to user-mode on L1 CPL=0 emulation failure
   d8f75b4c7f25 cpupower : Fix cpupower working when cpu0 is offline
   82e57cdce058 cpupowerutils: bench - Fix cpu online check
   036c227cdd1c drm/vc4: Account for interrupts in flight
   30942f91b5a5 igb: Free IRQs when device is hotplugged
   3a98d0753928 mtd: nand: denali_pci: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   e29997d55268 gpio: ath79: add missing MODULE_DESCRIPTION/LICENSE
   cb1a0b51d103 gpio: iop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   517931760e69 power: reset: zx-reboot: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   ddba3c67a5b8 HID: wacom: EKR: ensure devres groups at higher indexes are released
   b7edc45f3ada crypto: af_alg - whitelist mask and type
   1ce8e52f6f36 crypto: sha3-generic - fixes for alignment and big endian operation
   95259cb008ba crypto: aesni - handle zero length dst buffer
   f1803207b5ea crypto: ecdh - fix typo in KPP dependency of CRYPTO_ECDH
   cc1fa4a7b653 gpio: Fix kernel stack leak to userspace
   241c04f75e90 gpio: stmpe: i2c transfer are forbiden in atomic context
   efe3f94f83d2 tools/gpio: Fix build error with musl libc
   2a7076e71575 RDMA/mlx5: set UMR wqe fence according to HCA cap
   20e6f5bdf542 net/mlx5: Define interface bits for fencing UMR wqe
   56bc086358ca loop: fix concurrent lo_open/lo_release
   6c6f924f9c62 Linux 4.9.79
   f12d0602633d nfsd: auth: Fix gid sorting when rootsquash enabled
   f531fbb06a56 bpf: reject stores into ctx via st and xadd
   265d7657c9ba bpf: fix 32-bit divide by zero
   4606077802f2 bpf: fix divides by zero
   5cb917aa1f1e bpf: avoid false sharing of map refcount with max_entries
   fcabc6d00885 bpf: arsh is not supported in 32 bit alu thus reject it
   a3d6dd6a66c1 bpf: introduce BPF_JIT_ALWAYS_ON config
   5226bb3b9551 bpf: fix bpf_tail_call() x64 JIT
   c964ad34f6d9 x86: bpf_jit: small optimization in emit_bpf_tail_call()
   c98ff7299b40 hrtimer: Reset hrtimer cpu base proper on CPU hotplug
   9f3a6cadf494 x86/microcode/intel: Extend BDW late-loading further with LLC size check
   dc1932c69835 perf/x86/amd/power: Do not load AMD power module on !AMD platforms
   eecfa2eeefe3 flow_dissector: properly cap thoff field
   18717ee28ef5 tun: fix a memory leak for tfile->tx_array
   1105145cb3d5 mlxsw: spectrum_router: Don't log an error on missing neighbor
   3110e2134c97 gso: validate gso_type in GSO handlers
   cc99c6d59adf ip6_gre: init dev->mtu and dev->hard_header_len correctly
   1711ba166e5f be2net: restore properly promisc mode after queues reconfiguration
   00f9e47c6f9d ppp: unlock all_ppp_mutex before registering device
   260eb694b5a4 ipv4: Make neigh lookup keys for loopback/point-to-point devices be INADDR_ANY
   014510b11781 net: Allow neigh contructor functions ability to modify the primary_key
   66c16a22e3b1 vmxnet3: repair memory leak
   0e52703d0746 tipc: fix a memory leak in tipc_nl_node_get_link()
   2f056e7def42 sctp: return error if the asoc has been peeled off in sctp_wait_for_sndbuf
   8e3534ea657e sctp: do not allow the v4 socket to bind a v4mapped v6 address
   0f51492d1bd5 r8169: fix memory corruption on retrieval of hardware statistics.
   1bd21b158e07 pppoe: take ->needed_headroom of lower device into account on xmit
   cf67be7a1a21 net: tcp: close sock if net namespace is exiting
   a44d91150f33 net: qdisc_pkt_len_init() should be more robust
   0ae16964f215 net: igmp: fix source address check for IGMPv3 reports
   283498b4ca35 lan78xx: Fix failure in USB Full Speed
   c2ceff11b46e ipv6: ip6_make_skb() needs to clear cork.base.dst
   fb50d8c9169e ipv6: fix udpv6 sendmsg crash caused by too small MTU
   8b0d3e81cdec ipv6: Fix getsockopt() for sockets with default IPV6_AUTOFLOWLABEL
   5bb5ae9718f6 dccp: don't restart ccid2_hc_tx_rto_expire() if sk in closed state
   5f6c581bcb3c eventpoll.h: add missing epoll event masks
   9a0be5afbfbb vsyscall: Fix permissions for emulate mode with KAISER/PTI
   1be7d46e775c um: link vmlinux with -no-pie
   d680db722516 orangefs: fix deadlock; do not write i_size in read_iter
   42f0aba58e00 Input: trackpoint - force 3 buttons if 0 button is reported
   19a7db1e2ef3 mm: fix 100% CPU kswapd busyloop on unreclaimable nodes
   e62b0c661f65 Revert "module: Add retpoline tag to VERMAGIC"
   c41bb027ed63 scsi: libiscsi: fix shifting of DID_REQUEUE host byte
   7b50205cf8b9 fs/fcntl: f_setown, avoid undefined behaviour
   0ccfbd4d6f02 reiserfs: don't preallocate blocks for extended attributes
   b7d25282b75e reiserfs: fix race in prealloc discard
   898eeca02a55 netfilter: xt_osf: Add missing permission checks
   2c3184ea8032 netfilter: nfnetlink_cthelper: Add missing permission checks
   2915f16bdce2 ACPICA: Namespace: fix operand cache leak
   3a53accd9c39 ACPI / scan: Prefer devices without _HID/_CID for _ADR matching
   542cde0e3cc2 ipc: msg, make msgrcv work with LONG_MIN
   685cce58f1c2 mm, page_alloc: fix potential false positive in __zone_watermark_ok
   714c19ef57a5 cma: fix calculation of aligned offset
   bc0e2174b092 hwpoison, memcg: forcibly uncharge LRU pages
   c57664bd1299 mm/mmap.c: do not blow on PROT_NONE MAP_FIXED holes in the stack
   1d8c402e0c46 drivers: base: cacheinfo: fix boot error message when acpi is enabled
   f5aaa5a2836d drivers: base: cacheinfo: fix x86 with CONFIG_OF enabled
   318e17d09cbc Prevent timer value 0 for MWAITX
   45ee9d5e97a4 KVM: arm/arm64: Check pagesize when allocating a hugepage at Stage 2
   41e4aa17bc02 can: af_can: canfd_rcv(): replace WARN_ONCE by pr_warn_once
   40bf2c0c1c9e can: af_can: can_rcv(): replace WARN_ONCE by pr_warn_once
   69e78e7214e3 usbip: Fix potential format overflow in userspace tools
   853c39f239eb usbip: Fix implicit fallthrough warning
   ce601a07bc50 usbip: prevent vhci_hcd driver from leaking a socket pointer address
   5c26ee198fca orangefs: initialize op on loop restart in orangefs_devreq_read
   fb39345e7314 orangefs: use list_for_each_entry_safe in purge_waiting_ops
   c36c940cd4aa x86/asm/32: Make sync_core() handle missing CPUID on all 32-bit kernels

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 577f9bf721b7..5c016ed7c227 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7b2a74f272ef0a6e292b259872d47e891d7b2a20"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
+SRCREV_machine ?= "90d1ffa36cbd36722638c97c1bb46a5874dbe28e"
+SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.78"
+LINUX_VERSION ?= "4.9.82"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 5c9a26098863..4d4680254d4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.78"
+LINUX_VERSION ?= "4.9.82"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
+SRCREV_machine ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 871d87000373..a5a165f7609a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "801a684d5e769ca18e6ad9758806a528eccdcb73"
-SRCREV_machine_qemuarm64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemumips ?= "8235c7fda39963abbf6347390fd460e18a7e47b5"
-SRCREV_machine_qemuppc ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemux86 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemux86-64 ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_machine_qemumips64 ?= "bd9d169cd29aa5f2397ff383cd29f84a1043a693"
-SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
+SRCREV_machine_qemuarm ?= "23369eb7e07c839fa73a8c1e85aba37a07bf14c1"
+SRCREV_machine_qemuarm64 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_machine_qemumips ?= "cab9e059447878f5383f91a05db12813f69cbfc1"
+SRCREV_machine_qemuppc ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_machine_qemux86 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_machine_qemux86-64 ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_machine_qemumips64 ?= "c2e5ef83b612d50f50fafeed9930dbea302fbe8c"
+SRCREV_machine ?= "eb3b2079ea43b451e06be443f8bc146736f9c4bc"
+SRCREV_meta ?= "0774eacea2a7d3a150594533b8c80d0c0bfdfded"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.78"
+LINUX_VERSION ?= "4.9.82"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


