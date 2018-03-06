Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26D6A78A9C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBMPJ012035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:22 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:11 -0500
Message-ID: <5613a7f66f0fada119e447dc474740549205197f.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/4.15: update to v4.15.7
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:22 -0000
Content-Type: text/plain

Updating the latest korg -stable release which comprises the following
commits:

   cb4a115a4286 Linux 4.15.7
   59e0ae1b9ae2 microblaze: fix endian handling
   39c51864410f drm/i915/breadcrumbs: Ignore unsubmitted signalers
   5d1641bd28b2 arm64: __show_regs: Only resolve kernel symbols when running at EL1
   6e0535b574bb drm/amdgpu: add new device to use atpx quirk
   ae05bb741e26 drm/amdgpu: Avoid leaking PM domain on driver unbind (v2)
   c3a0168def90 drm/amdgpu: add atpx quirk handling (v2)
   2511a10a9dbd drm/amdgpu: only check mmBIF_IOV_FUNC_IDENTIFIER on tonga/fiji
   569773e885c2 drm/amdgpu: Add dpm quirk for Jet PRO (v2)
   7cb1e932f2cf drm/amdgpu: fix VA hole handling on Vega10 v3
   73dec25a4996 drm/amdgpu: disable MMHUB power gating on raven
   86688e436e53 drm: Handle unexpected holes in color-eviction
   d9076e2789f0 drm/atomic: Fix memleak on ERESTARTSYS during non-blocking commits
   ef6ffb8e7991 drm/cirrus: Load lut in crtc_commit
   5434769e09e1 usb: renesas_usbhs: missed the "running" flag in usb_dmac with rx path
   ebf22ef5bc85 usb: gadget: f_fs: Use config_ep_by_speed()
   1e77103e4e95 usb: gadget: f_fs: Process all descriptors during bind
   84bfcffa2d58 Revert "usb: musb: host: don't start next rx urb if current one failed"
   d1ff52d9f255 usb: ldusb: add PIDs for new CASSY devices supported by this driver
   e2ea80c1081a usb: phy: mxs: Fix NULL pointer dereference on i.MX23/28
   3501a1fa4bd6 usb: dwc3: ep0: Reset TRB counter for ep0 IN
   9cd92bc0d940 usb: dwc3: gadget: Set maxpacket size for ep0 IN
   c1ee06ccaf56 usb: host: ehci: use correct device pointer for dma ops
   41be2f2884dd drm/edid: Add 6 bpc quirk for CPT panel in Asus UX303LA
   9431fcfe77f2 Add delay-init quirk for Corsair K70 RGB keyboards
   fe2d410a67ac arm64: cpufeature: Fix CTR_EL0 field definitions
   4a9aa807845d arm64: Disable unhandled signal log messages by default
   b1acbe1b5159 arm64: Remove unimplemented syscall log message
   4834cd5ef556 usb: ohci: Proper handling of ed_rm_list to handle race condition between usb_kill_urb() and finish_unlinks()
   4f2b3914d480 ohci-hcd: Fix race condition caused by ohci_urb_enqueue() and io_watchdog_func()
   bb9e6cb9619e net: thunderbolt: Run disconnect flow asynchronously when logout is received
   4843b408d3b3 net: thunderbolt: Tear down connection properly on suspend
   c36b2464868c PCI/cxgb4: Extend T3 PCI quirk to T4+ devices
   f08f5d7546b7 irqchip/mips-gic: Avoid spuriously handling masked interrupts
   ca6ecf020c19 irqchip/gic-v3: Use wmb() instead of smb_wmb() in gic_raise_softirq()
   2db8fd089da9 uapi/if_ether.h: move __UAPI_DEF_ETHHDR libc define
   c6a18ffe270d mm: don't defer struct page initialization for Xen pv guests
   9b28096ae042 mm, swap, frontswap: fix THP swap if frontswap enabled
   df70880eeca8 x86/oprofile: Fix bogus GCC-8 warning in nmi_setup()
   b380245d86d7 x86/apic/vector: Handle vector release on CPU unplug correctly
   1df9e416e647 Kbuild: always define endianess in kconfig.h
   c6ddec4b894e iio: adis_lib: Initialize trigger before requesting interrupt
   57a6624e6b66 iio: buffer: check if a buffer has been set up when poll is called
   141c7b5d62b4 iio: srf08: fix link error "devm_iio_triggered_buffer_setup" undefined
   ea69364997ac iio: adc: stm32: fix stm32h7_adc_enable error handling
   2220b31092c0 RDMA/uverbs: Sanitize user entered port numbers prior to access it
   dbc8529d0075 RDMA/uverbs: Fix circular locking dependency
   b949544f2389 RDMA/uverbs: Fix bad unlock balance in ib_uverbs_close_xrcd
   a79527b04d36 RDMA/uverbs: Protect from command mask overflow
   11c371ca4206 RDMA/uverbs: Protect from races between lookup and destroy of uobjects
   7f55f13e7c96 genirq/matrix: Handle CPU offlining proper
   44975af306a6 extcon: int3496: process id-pin first so that we start with the right status
   7bd04bd1fb3e PKCS#7: fix certificate blacklisting
   4a89879bc4c9 PKCS#7: fix certificate chain verification
   a689f00971b8 X.509: fix NULL dereference when restricting key with unsupported_sig
   ffc21f450fad X.509: fix BUG_ON() when hash algorithm is unsupported
   1af6a6727347 i2c: bcm2835: Set up the rising/falling edge delays
   13f741a22d4f i2c: designware: must wait for enable
   f2543a626feb cfg80211: fix cfg80211_beacon_dup
   53b7097c9a65 MIPS: Drop spurious __unused in struct compat_flock
   6f935322d866 scsi: ibmvfc: fix misdefined reserved field in ibmvfc_fcp_rsp_info
   e8e48b394b64 xtensa: fix high memory/reserved memory collision
   0bbdb97ac3b8 MIPS: boot: Define __ASSEMBLY__ for its.S build
   a7aa0b5c9bf9 kconfig.h: Include compiler types to avoid missed struct attributes
   174f49dedc13 arm64: mm: don't write garbage into TTBR1_EL1 register
   d7ef969797fd netfilter: drop outermost socket lock in getsockopt()
   1a7aef62b47b Linux 4.15.6
   0e6f5f6c2367 vmalloc: fix __GFP_HIGHMEM usage for vmalloc_32 on 32b systems
   fc3a0d7d6b81 mei: me: add cannon point device ids for 4th device
   772639d52fa5 mei: me: add cannon point device ids
   0f00b6feadde crypto: s5p-sss - Fix kernel Oops in AES-ECB mode
   52718d497940 usbip: keep usbip_device sockfd state in sync with tcp_socket
   f0537b3962ad xhci: fix xhci debugfs errors in xhci_stop
   11474eb609f4 xhci: xhci debugfs device nodes weren't removed after device plugged out
   99cfcdcbfb38 xhci: Fix xhci debugfs devices node disappearance after hibernation
   177b1a5bc8fe xhci: Fix NULL pointer in xhci debugfs
   3ee8ad9e5267 staging: iio: ad5933: switch buffer mode to software
   6991325a52af staging: iio: adc: ad7192: fix external frequency setting
   07bf5bad3f80 staging: fsl-mc: fix build testing on x86
   008fdd7c3915 binder: replace "%p" with "%pK"
   52f381e126bc binder: check for binder_thread allocation failure in binder_poll()
   664b80469038 staging: android: ashmem: Fix a race condition in pin ioctls
   3dd13985a916 ANDROID: binder: synchronize_rcu() when using POLLFREE.
   87340f840952 ANDROID: binder: remove WARN() for redundant txn error
   8f2f8993e0f6 dn_getsockoptdecnet: move nf_{get/set}sockopt outside sock lock
   58fde5229c07 arm64: dts: add #cooling-cells to CPU nodes
   0d899f5a7699 ARM: 8743/1: bL_switcher: add MODULE_LICENSE tag
   fa913592b110 video: fbdev/mmp: add MODULE_LICENSE
   0813c6ee1936 ASoC: ux500: add MODULE_LICENSE tag
   31903777ab86 soc: qcom: rmtfs_mem: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   3d32de924430 net_sched: gen_estimator: fix lockdep splat
   78739d2c45ac net: avoid skb_warn_bad_offload on IS_ERR
   2e980be6c7aa rds: tcp: atomically purge entries from rds_tcp_conn_list during netns delete
   8dfca224fe21 rds: tcp: correctly sequence cleanup on netns deletion.
   d7159107d7f9 netfilter: xt_RATEEST: acquire xt_rateest_mutex for hash insert
   d13e612e713c netfilter: xt_cgroup: initialize info->priv in cgroup_mt_check_v1()
   ff225999c603 netfilter: on sockopt() acquire sock lock only in the required scope
   8b73f446d3c0 netfilter: ipt_CLUSTERIP: fix out-of-bounds accesses in clusterip_tg_check()
   7d666621792e netfilter: x_tables: avoid out-of-bounds reads in xt_request_find_{match|target}
   41e28eddda46 netfilter: x_tables: fix int overflow in xt_alloc_table_info()
   660e0b97128d kcov: detect double association with a single task
   a009a6388cea KVM: x86: fix escape of guest dr6 to the host
   53712962126d blk_rq_map_user_iov: fix error override
   831a8a1297d1 staging: android: ion: Switch from WARN to pr_warn
   ea4ce12b88fc staging: android: ion: Add __GFP_NOWARN for system contig heap
   97fe1b796e9d crypto: x86/twofish-3way - Fix %rbp usage
   78fb902b9f52 media: pvrusb2: properly check endpoint types
   c31124234485 selinux: skip bounded transition processing if the policy isn't loaded
   81563ac61f54 selinux: ensure the context is NUL terminated in security_context_to_sid_core()
   62da989fd52d ptr_ring: try vmalloc() when kmalloc() fails
   62a273a47514 ptr_ring: fail early if queue occupies more than KMALLOC_MAX_SIZE
   de03f1a1c9e3 tun: fix tun_napi_alloc_frags() frag allocator
   a6c3a2a21072 Linux 4.15.5
   b5d3e87c0750 mmc: sdhci-of-esdhc: fix the mmc error after sleep on ls1046ardb
   772b28fb3f5d mmc: sdhci-of-esdhc: fix eMMC couldn't work after kexec
   c95e8f5945e4 media: r820t: fix r820t_write_reg for KASAN
   0431ae716f64 ARM: dts: Delete bogus reference to the charlcd
   d9f944934e5d arm: dts: mt2701: Add reset-cells
   76e1e2047cad arm: dts: mt7623: Update ethsys binding
   7dcebff41eb2 ARM: dts: s5pv210: add interrupt-parent for ohci
   98ada11202a3 arm64: dts: msm8916: Add missing #phy-cells
   384ba356723f ARM: pxa/tosa-bt: add MODULE_LICENSE tag
   f62971e74494 ARM: dts: exynos: fix RTC interrupt for exynos5410
   86fa1cc9eeed x86/mm, mm/hwpoison: Don't unconditionally unmap kernel 1:1 pages
   adea9deed20b usb: Move USB_UHCI_BIG_ENDIAN_* out of USB_SUPPORT
   528e50bc160b mvpp2: fix multicast address filter
   3b8e84c8373d ALSA: seq: Fix racy pool initializations
   4da52e138918 ALSA: usb: add more device quirks for USB DSD devices
   4aacd757d564 ALSA: usb-audio: add implicit fb quirk for Behringer UFX1204
   7a9a09e9c65c ALSA: hda/realtek: PCI quirk for Fujitsu U7x7
   6957300758e4 ALSA: hda/realtek - Enable Thinkpad Dock device for ALC298 platform
   24b0a5ee21c9 ALSA: hda/realtek - Add headset mode support for Dell laptop
   9030db8eef39 ALSA: usb-audio: Fix UAC2 get_ctl request with a RANGE attribute
   937a479700dd ALSA: hda - Fix headset mic detection problem for two Dell machines
   88ee6a8cff16 mtd: nand: vf610: set correct ooblayout
   2463f6dc6787 9p/trans_virtio: discard zero-length reply
   42708d88eb16 Btrfs: fix unexpected -EEXIST when creating new inode
   a4a9f48768c2 Btrfs: fix use-after-free on root->orphan_block_rsv
   ab4ccd42455a Btrfs: fix btrfs_evict_inode to handle abnormal inodes correctly
   8228c6702d01 Btrfs: fix extent state leak from tree log
   06c8273f434c Btrfs: fix crash due to not cleaning up tree log block's dirty bits
   3a695ffd7d33 Btrfs: fix deadlock in run_delalloc_nocow
   917f5807f0a5 dm: correctly handle chained bios in dec_pending()
   a4cd422f3105 iscsi-target: make sure to wake up sleeping login worker
   7d772e3a730d target/iscsi: avoid NULL dereference in CHAP auth error path
   b5291a94daab blk-wbt: account flush requests correctly
   d301a3f8ab11 xprtrdma: Fix BUG after a device removal
   e154c64806f8 xprtrdma: Fix calculation of ri_max_send_sges
   ded318a8634b arm64: proc: Set PTE_NG for table entries to avoid traversing them twice
   802061188f09 rtlwifi: rtl8821ae: Fix connection lost problem correctly
   1e6c184e415e mpls, nospec: Sanitize array index in mpls_label_ok()
   95f92d0a0ca9 tracing: Fix parsing of globs with a wildcard at the beginning
   2931553cea57 seq_file: fix incomplete reset on read from zero offset
   54de83d07a18 xenbus: track caller request id
   a616290d6a5d xen: Fix {set,clear}_foreign_p2m_mapping on autotranslating guests
   f831b1c82feb rbd: whitelist RBD_FEATURE_OPERATIONS feature bit
   221d3ee83504 console/dummy: leave .con_font_get set to NULL
   c3817658ceef video: fbdev: atmel_lcdfb: fix display-timings lookup
   335d3af5fe8a PCI: keystone: Fix interrupt-controller-node lookup
   ff4d8f0acd98 PCI: pciehp: Assume NoCompl+ for Thunderbolt ports
   e930e724e0b5 PCI: iproc: Fix NULL pointer dereference for BCMA
   b5cbe36dcee9 PCI: Disable MSI for HiSilicon Hip06/Hip07 only in Root Port mode
   c39240eeac9f MIPS: Fix incorrect mem=X@Y handling
   701241f406bc MIPS: CPS: Fix MIPS_ISA_LEVEL_RAW fallout
   a258db30df67 MIPS: Fix typo BIG_ENDIAN to CPU_BIG_ENDIAN
   3291fcf983a2 mm: Fix memory size alignment in devm_memremap_pages_release()
   327b199512b4 mm: hide a #warning for COMPILE_TEST
   efb5d2d65820 ext4: correct documentation for grpid mount option
   e1dab5d7ea9f ext4: save error to disk in __ext4_grp_locked_error()
   385daa60a706 ext4: fix a race in the ext4 shutdown path
   08d8ce8cc0de jbd2: fix sphinx kernel-doc build warnings
   c71989fe3730 Revert "apple-gmux: lock iGP IO to protect from vgaarb changes"
   1ae2c3ae98b8 mlx5: fix mlx5_get_vector_affinity to start from completion vector 0
   da40ab64894b Revert "mmc: meson-gx: include tx phase in the tuning process"
   25ca7976fa79 mmc: bcm2835: Don't overwrite max frequency unconditionally
   f56ed42361d2 mmc: sdhci: Implement an SDHCI-specific bounce buffer
   ecfb5cd05789 mbcache: initialize entry->e_referenced in mb_cache_entry_create()
   daa21b8dbc29 rtc-opal: Fix handling of firmware error codes, prevent busy loops
   e5394e1050a1 x86/smpboot: Fix uncore_pci_remove() indexing bug when hot-removing a physical CPU
   f7bbb8cc9ef5 drm/radeon: adjust tested variable
   3f08088bd77e drm/radeon: Add dpm quirk for Jet PRO (v2)
   186f99730498 arm64: Add missing Falkor part number for branch predictor hardening
   a69091bf7e21 drm: Check for lessee in DROP_MASTER ioctl
   6098f2b5d190 drm/ast: Load lut in crtc_commit
   ca1c50fb1ace drm/amd/powerplay: Fix smu_table_entry.handle type
   a8c0779fbff8 drm/qxl: reapply cursor after resetting primary
   f80082e5edf6 drm/qxl: unref cursor bo when finished with it
   ce0f840e7072 drm/ttm: Fix 'buf' pointer update in ttm_bo_vm_access_kmap() (v2)
   5c73538a5312 drm/ttm: Don't add swapped BOs to swap-LRU list
   08f4c47a9415 x86/entry/64: Fix CR3 restore in paranoid_exit()
   738bd3107bdd x86/cpu: Change type of x86_cache_size variable to unsigned int
   ceb5eab28159 x86/spectre: Fix an error message
   7d6446416778 x86/cpu: Rename cpu_data.x86_mask to cpu_data.x86_stepping
   76f0b81aaef6 selftests/x86/mpx: Fix incorrect bounds with old _sigfault
   3786b49d8260 x86/mm: Rename flush_tlb_single() and flush_tlb_one() to __flush_tlb_one_[user|kernel]()
   00ef27460aa2 x86/speculation: Add <asm/msr-index.h> dependency
   ca05b6adda6f nospec: Move array_index_nospec() parameter checking into separate macro
   5dd2e45e8121 x86/speculation: Fix up array_index_nospec_mask() asm constraint
   9a01e5477fa4 x86/debug: Use UD2 for WARN()
   f7c4d5f9c5b3 x86/debug, objtool: Annotate WARN()-related UD2 as reachable
   636aaf1b6d84 objtool: Fix segfault in ignore_unreachable_insn()
   b2fceb82f99d selftests/x86: Disable tests requiring 32-bit support on pure 64-bit systems
   9b580b1c4eb8 selftests/x86: Do not rely on "int $0x80" in single_step_syscall.c
   16446615747e gfs2: Fixes to "Implement iomap for block_map"
   c67f48ee85e4 selftests/x86: Do not rely on "int $0x80" in test_mremap_vdso.c
   dd64b34f50c9 selftests/x86: Fix build bug caused by the 5lvl test which has been moved to the VM directory
   a703766238d1 selftests/x86/pkeys: Remove unused functions
   c34c85d1fda8 selftests/x86: Clean up and document sscanf() usage
   2547dc25e49f selftests/x86: Fix vDSO selftest segfault for vsyscall=none
   639a0bc5556b x86/entry/64: Remove the unused 'icebp' macro
   59ec9d8596c7 x86/entry/64: Fix paranoid_entry() frame pointer warning
   fc0a1888a19e x86/entry/64: Indent PUSH_AND_CLEAR_REGS and POP_REGS properly
   1bbd8cc75975 x86/entry/64: Get rid of the ALLOC_PT_GPREGS_ON_STACK and SAVE_AND_CLEAR_REGS macros
   dee24cc0d177 x86/entry/64: Use PUSH_AND_CLEAN_REGS in more cases
   9b45975b10af x86/entry/64: Introduce the PUSH_AND_CLEAN_REGS macro
   6a783fb001df x86/entry/64: Interleave XOR register clearing with PUSH instructions
   a03cd0b454bd x86/entry/64: Merge the POP_C_REGS and POP_EXTRA_REGS macros into a single POP_REGS macro
   edfd139e92a7 x86/entry/64: Merge SAVE_C_REGS and SAVE_EXTRA_REGS, remove unused extensions
   c32edeec8de8 x86/entry/64: Clear registers for exceptions/interrupts, to reduce speculation attack surface
   d952c8406449 platform/x86: wmi: fix off-by-one write in wmi_dev_probe()
   779335757a39 PM: cpuidle: Fix cpuidle_poll_state_init() prototype
   6804856af9a8 PM / runtime: Update links_count also if !CONFIG_SRCU
   8453b536660f x86/speculation: Clean up various Spectre related details
   c587622856c0 KVM/nVMX: Set the CPU_BASED_USE_MSR_BITMAPS if we have a valid L02 MSR bitmap
   d765b10e7419 X86/nVMX: Properly set spec_ctrl and pred_cmd before merging MSRs
   f1a374a629ca KVM/x86: Reduce retpoline performance impact in slot_handle_level_range(), by always inlining iterator helper methods
   ae2fbb44c78a Revert "x86/speculation: Simplify indirect_branch_prediction_barrier()"
   737281fefceb x86/speculation: Correct Speculation Control microcode blacklist again
   66c27c3873f6 x86/speculation: Update Speculation Control microcode blacklist
   3e33ab3ca43f x86/mm/pti: Fix PTI comment in entry_SYSCALL_64()
   d5a6896dd598 powerpc/mm/radix: Split linear mapping on hot-unplug
   067e114886eb crypto: sun4i_ss_prng - convert lock to _bh in sun4i_ss_prng_generate
   e0ec77b5bedd crypto: sun4i_ss_prng - fix return value of sun4i_ss_prng_generate
   0a7130d20c14 compiler-gcc.h: __nostackprotector needs gcc-4.4 and up
   05ae7a5dd4e3 compiler-gcc.h: Introduce __optimize function attribute
   19af2585aa36 x86/entry/64/compat: Clear registers for compat syscalls, to reduce speculation attack surface
   4d94b7f11bbc x86/entry/64: Clear extra registers beyond syscall arguments, to reduce speculation attack surface
   19228d4e49f3 mm, memory_hotplug: fix memmap initialization
   7cdd5cf281ce x86: PM: Make APM idle driver initialize polling state
   ef1761edcea2 x86/xen: init %gs very early to avoid page faults with stack protector
   26913c7c71bb x86/kexec: Make kexec (mostly) work in 5-level paging mode
   15c8d36723f5 x86/gpu: add CFL to early quirks
   9159658a6441 arm: spear13xx: Fix spics gpio controller's warning
   2429d573bc20 arm: spear13xx: Fix dmas cells
   17823ed21725 arm: spear600: Add missing interrupt-parent of rtc
   a3eae21e25b2 arm: dts: mt7623: fix card detection issue on bananapi-r2
   578a06516a49 ARM: dts: nomadik: add interrupt-parent for clcd
   52cfc570e8e8 ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property
   8d2ca011bd8b ARM: lpc3250: fix uda1380 gpio numbers
   665129cf7fbb arm64: dts: msm8916: Correct ipc references for smsm
   916d0961f318 s390: fix handling of -1 in set{,fs}[gu]id16 syscalls
   0154ce677dc9 dma-buf: fix reservation_object_wait_timeout_rcu once more v2
   1963cbbf9152 powerpc/xive: Use hw CPU ids when configuring the CPU queues
   804c8aaff6dd powerpc/mm: Flush radix process translations when setting MMU type
   dfff7773e02e powerpc/numa: Invalidate numa_cpu_lookup_table on cpu remove
   40cbe0f92116 powerpc/vas: Don't set uses_vas for kernel windows
   676fafcce904 powerpc/kernel: Block interrupts when updating TIDR
   8119b8ed2062 powerpc/radix: Remove trace_tlbie call from radix__flush_tlb_all
   07028908f181 trace_uprobe: Display correct offset in uprobe_events
   6c5244c54902 ocfs2: try a blocking lock before return AOP_TRUNCATED_PAGE
   3455777ab90e mwifiex: resolve reset vs. remove()/shutdown() deadlocks
   0db649a48778 PM / devfreq: Propagate error from devfreq_add_device()
   ed77f6599252 swiotlb: suppress warning when __GFP_NOWARN is set
   819905fc8458 cpufreq: powernv: Dont assume distinct pstate values for nominal and pmin
   872ebeef0faf RDMA/rxe: Fix rxe_qp_cleanup()
   fe8220f6a95c RDMA/rxe: Fix a race condition in rxe_requester()
   30a032e09618 RDMA/rxe: Fix a race condition related to the QP error state
   5a5fbae808a8 kselftest: fix OOM in memory compaction test
   1e0802f65fcb selftests: seccomp: fix compile error seccomp_bpf
   e42e049c0248 IB/core: Avoid a potential OOPs for an unused optional parameter
   e9e368446931 IB/core: Fix ib_wc structure size to remain in 64 bytes boundary
   17890e8494f2 IB/core: Fix two kernel warnings triggered by rxe registration
   7ff37378d884 IB/mlx4: Fix incorrectly releasing steerable UD QPs when have only ETH ports
   9f298cc55e14 IB/qib: Fix comparison error with qperf compare/swap test
   d4473f8c2fa5 IB/umad: Fix use of unprotected device pointer
   d5610050475e scsi: smartpqi: allow static build ("built-in")
   bb61956d9d9f Linux 4.15.4
   f246c4e6d286 rcu: Export init_rcu_head() and destroy_rcu_head() to GPL modules
   8b159566ab29 scsi: cxlflash: Reset command ioasc
   5dbe7be7e522 scsi: lpfc: Fix crash after bad bar setup on driver attachment
   3dcf4935d1df scsi: core: Ensure that the SCSI error handler gets woken up
   d73763b92944 ftrace: Remove incorrect setting of glob search field
   4d5d5e9612e7 devpts: fix error handling in devpts_mntget()
   8ec68ce24fd1 mn10300/misalignment: Use SIGSEGV SEGV_MAPERR to report a failed user copy
   2433367ce69e ovl: hash directory inodes for fsnotify
   06b4cf20d166 ovl: take mnt_want_write() for removing impure xattr
   65989bff55e8 ovl: take mnt_want_write() for work/index dir setup
   fc103afa3390 ovl: fix failure to fsync lower dir
   e14a5067b13c ovl: force r/o mount when index dir creation fails
   74ef3034525a acpi, nfit: fix register dimm error handling
   1a9b65ce3165 ACPI: sbshc: remove raw pointer from printk() message
   a18ff97b8fff drm/i915: Avoid PPS HW/SW state mismatch due to rounding
   7217671ff5ad arm64: dts: marvell: add Ethernet aliases
   e8217faccb47 objtool: Fix switch-table detection
   1396715adadb lib/ubsan: add type mismatch handler for new GCC/Clang
   157bb32f826c lib/ubsan.c: s/missaligned/misaligned/
   7a8ca66b3b26 clocksource/drivers/stm32: Fix kernel panic with multiple timers
   83cfeb15b960 blk-mq: quiesce queue before freeing queue
   b3e1e2d54d4f pktcdvd: Fix a recently introduced NULL pointer dereference
   7a6938e21159 pktcdvd: Fix pkt_setup_dev() error path
   d4d9ac623f3c pinctrl: sx150x: Add a static gpio/pinctrl pin range mapping
   12cbc6636acf pinctrl: sx150x: Register pinctrl before adding the gpiochip
   c56a74735860 pinctrl: sx150x: Unregister the pinctrl on release
   178e4288c014 pinctrl: mcp23s08: fix irq setup order
   25484773c7a9 pinctrl: intel: Initialize GPIO properly when used through irqchip
   787229894896 genirq: Make legacy autoprobing work again
   141fce350f00 EDAC, octeon: Fix an uninitialized variable warning
   36ea5adbf38e xtensa: fix futex_atomic_cmpxchg_inatomic
   aa38e58d15ab alpha: fix formating of stack content
   aa117ce7d303 alpha: fix reboot on Avanti platform
   3bbebfe82495 alpha: Fix mixed up args in EXC macro in futex operations
   c3135742ca71 alpha: osf_sys.c: fix put_tv32 regression
   190d1ab5450c alpha: fix crash if pthread_create races with signal delivery
   24faada95fbe signal/sh: Ensure si_signo is initialized in do_divide_error
   cce3b22f14dd signal/openrisc: Fix do_unaligned_access to send the proper signal
   4574b506d634 ipmi: use dynamic memory for DMI driver override
   457ad223c59d Bluetooth: btusb: Restore QCA Rome suspend/resume fix with a "rewritten" version
   7ac3d11aba75 Revert "Bluetooth: btusb: fix QCA Rome suspend/resume"
   ea0c164b5895 Bluetooth: btsdio: Do not bind to non-removable BCM43341
   062b49f817aa HID: quirks: Fix keyboard + touchpad on Toshiba Click Mini not working
   f877972bcf62 pipe: fix off-by-one error when checking buffer limits
   4f361f601c04 pipe: actually allow root to exceed the pipe buffer limits
   b4ae624fc003 kernel/relay.c: revert "kernel/relay.c: fix potential memory leak"
   c84c68fc2321 kernel/async.c: revert "async: simplify lowest_in_progress()"
   20819e0cdfa8 fs/proc/kcore.c: use probe_kernel_read() instead of memcpy()
   c578f7ee61fe media: cxusb, dib0700: ignore XC2028_I2C_FLUSH
   1bddff4ff67e media: vivid: fix module load error when enabling fb and no_error_inj=1
   cefbd21480dd media: ts2020: avoid integer overflows on 32 bit machines
   de87fcee48bc media: dt-bindings/media/cec-gpio.txt: mention the CEC/HPD max voltages
   ec1eeaf5b6c1 media: dvb-frontends: fix i2c access helpers for KASAN
   2058517f456c media: dvb_frontend: be sure to init dvb_frontend_handle_ioctl() return code
   b6de976631b2 kasan: rework Kconfig settings
   6d5dd742cbf5 kasan: don't emit builtin calls when sanitization is off
   5e2dee3fc6e0 Btrfs: raid56: iterate raid56 internal bio with bio_for_each_segment_all
   04f417b0312c btrfs: Handle btrfs_set_extent_delalloc failure in fixup worker
   51611b5d19a5 afs: Fix server list handling
   a0a594704ff3 afs: Fix missing cursor clearance
   8b690011c27d afs: Need to clear responded flag in addr cursor
   da89b2d752e9 afs: Add missing afs_put_cell()
   03a7be790fc9 watchdog: imx2_wdt: restore previous timeout after suspend+resume
   16c4b6e0c064 ASoC: compress: Correct handling of copy callback
   5711cf9b8908 ASoC: skl: Fix kernel warning due to zero NHTL entry
   3a042d14100f ASoC: rockchip: i2s: fix playback after runtime resume
   6bd298ee74d8 ASoC: acpi: fix machine driver selection based on quirk
   8000c0f57633 KVM: PPC: Book3S PR: Fix broken select due to misspelling
   47415812fec3 KVM: arm/arm64: Handle CPU_PM_ENTER_FAILED
   703f0395362a KVM: PPC: Book3S HV: Drop locks before reading guest memory
   0e46778efc9f KVM: PPC: Book3S HV: Make sure we don't re-enter guest without XIVE loaded
   8285c292436c KVM: nVMX: Fix bug of injecting L2 exception into L1
   5cb7e6931e52 KVM: nVMX: Fix races when sending nested PI while dest enters/leaves L2
   8d3bb572ef44 arm: KVM: Fix SMCCC handling of unimplemented SMC/HVC calls
   e76a4b126d1e crypto: talitos - fix Kernel Oops on hashing an empty file
   97905e9cf76a crypto: sha512-mb - initialize pending lengths correctly
   bde50164e671 crypto: caam - fix endless loop when DECO acquire fails
   d971cb5f5fbd media: v4l2-compat-ioctl32.c: make ctrl_is_pointer work for subdevs
   76db969a3bbf media: v4l2-compat-ioctl32.c: refactor compat ioctl32 logic
   11fe1040030e media: v4l2-compat-ioctl32.c: don't copy back the result for certain errors
   1cc643ab48ee media: v4l2-compat-ioctl32.c: drop pr_info for unknown buffer type
   2b14d31a951e media: v4l2-compat-ioctl32.c: copy clip list in put_v4l2_window32
   4e364b677035 media: v4l2-compat-ioctl32.c: fix ctrl_is_pointer
   9c15a21a0737 media: v4l2-compat-ioctl32.c: copy m.userptr in put_v4l2_plane32
   e5294484a664 media: v4l2-compat-ioctl32.c: avoid sizeof(type)
   991030bd0aa7 media: v4l2-compat-ioctl32.c: move 'helper' functions to __get/put_v4l2_format32
   dc9a62adcd76 media: v4l2-compat-ioctl32.c: fix the indentation
   d57714a7c0f2 media: v4l2-compat-ioctl32.c: add missing VIDIOC_PREPARE_BUF
   fc174e6cbdee media: v4l2-ioctl.c: don't copy back the result for -ENOTTY
   1113a74590b4 media: v4l2-ioctl.c: use check_fmt for enum/g/s/try_fmt
   46e8d06e423c crypto: hash - prevent using keyed hashes without setting key
   cec606a62e01 crypto: hash - annotate algorithms taking optional key
   b5e994037f37 crypto: poly1305 - remove ->setkey() method
   a3b6f7d313af crypto: mcryptd - pass through absence of ->setkey()
   f034d24fcef8 crypto: cryptd - pass through absence of ->setkey()
   927a0dd1c4de crypto: hash - introduce crypto_hash_alg_has_setkey()
   d53f47c224c1 ahci: Add Intel Cannon Lake PCH-H PCI ID
   bd3b3e9b0520 ahci: Add PCI ids for Intel Bay Trail, Cherry Trail and Apollo Lake AHCI
   d714ff511458 ahci: Annotate PCI ids for mobile Intel chipsets as such
   8d94a30179ca kernfs: fix regression in kernfs_fop_write caused by wrong type
   0e61f8b07b57 nfsd: Detect unhashed stids in nfsd4_verify_open_stid()
   782b4e79ceaa NFS: Fix a race between mmap() and O_DIRECT
   0645878a34d0 NFS: reject request for id_legacy key without auxdata
   60af9d47409c NFS: commit direct writes even if they fail partially
   6d301c957faf NFS: Fix nfsstat breakage due to LOOKUPP
   09f453630a5c NFS: Add a cond_resched() to nfs_commit_release_pages()
   4be335576eca nfs41: do not return ENOMEM on LAYOUTUNAVAILABLE
   d2a7f7a32d70 nfs/pnfs: fix nfs_direct_req ref leak when i/o falls back to the mds
   79fca845f0e4 ubifs: free the encrypted symlink target
   973f83fab1b1 ubi: block: Fix locking for idr_alloc/idr_remove
   155e260ffa14 ubi: fastmap: Erase outdated anchor PEBs during attach
   85f7a399a372 ubi: Fix race condition between ubi volume creation and udev
   edb72dea6d46 mtd: nand: sunxi: Fix ECC strength choice
   ed538bc15951 mtd: nand: Fix nand_do_read_oob() return value
   b39c718d1a37 mtd: nand: brcmnand: Disable prefetch by default
   4ea0377d0dcc mtd: cfi: convert inline functions to macros
   d60ada32f9c1 arm64: Kill PSCI_GET_VERSION as a variant-2 workaround
   e301ef818938 arm64: Add ARM_SMCCC_ARCH_WORKAROUND_1 BP hardening support
   1b3173cc0818 arm/arm64: smccc: Implement SMCCC v1.1 inline primitive
   5fa82723fa1b arm/arm64: smccc: Make function identifiers an unsigned quantity
   eadba98b0dd9 firmware/psci: Expose SMCCC version through psci_ops
   5195a21d5ba0 firmware/psci: Expose PSCI conduit
   4a345e5e8731 arm64: KVM: Add SMCCC_ARCH_WORKAROUND_1 fast handling
   7a1b576877dd arm64: KVM: Report SMCCC_ARCH_WORKAROUND_1 BP hardening support
   8b423ee88829 arm/arm64: KVM: Turn kvm_psci_version into a static inline
   d18561857b79 arm64: KVM: Make PSCI_VERSION a fast path
   68894ca72b4d arm/arm64: KVM: Advertise SMCCC v1.1
   9aecea071f02 arm/arm64: KVM: Implement PSCI 1.0 support
   bfc67e088515 arm/arm64: KVM: Add smccc accessors to PSCI code
   038a0579029d arm/arm64: KVM: Add PSCI_VERSION helper
   bf9708a5df1e arm/arm64: KVM: Consolidate the PSCI include files
   a2843529c774 arm64: KVM: Increment PC after handling an SMC trap
   2458a525a4a9 arm64: Branch predictor hardening for Cavium ThunderX2
   d2a40a765e31 arm64: Implement branch predictor hardening for Falkor
   5152c0c11ccc arm64: Implement branch predictor hardening for affected Cortex-A CPUs
   df65d7b1c194 arm64: cputype: Add missing MIDR values for Cortex-A72 and Cortex-A75
   40ad0b937384 arm64: entry: Apply BP hardening for suspicious interrupts from EL0
   9444427e9f43 arm64: entry: Apply BP hardening for high-priority synchronous exceptions
   9a7a2f40da4a arm64: KVM: Use per-CPU vector when BP hardening is enabled
   7c2108a2db49 arm64: Move BP hardening to check_and_switch_context
   24f07bba953d arm64: Add skeleton to harden the branch predictor against aliasing attacks
   e8b634e69ce3 arm64: Move post_ttbr_update_workaround to C code
   4f26eef7f241 drivers/firmware: Expose psci_get_version through psci_ops structure
   4506169a1e1e arm64: cpufeature: Pass capability structure to ->enable callback
   2e780011c8fd arm64: Run enable method for errata work arounds on late CPUs
   68330fdd469b arm64: cpufeature: __this_cpu_has_cap() shouldn't stop early
   835662c5bd55 arm64: futex: Mask __user pointers prior to dereference
   15814374752a arm64: uaccess: Mask __user pointers for __arch_{clear, copy_*}_user
   9ca9d1c25789 arm64: uaccess: Don't bother eliding access_ok checks in __{get, put}_user
   e11038f4c1c7 arm64: uaccess: Prevent speculative use of the current addr_limit
   cf6df3266a91 arm64: entry: Ensure branch through syscall table is bounded under speculation
   4d4e58257ef5 arm64: Use pointer masking to limit uaccess speculation
   2a8a65a284c8 arm64: Make USER_DS an inclusive limit
   a17d329d36c8 arm64: Implement array_index_mask_nospec()
   83c5e4e3c634 arm64: barrier: Add CSDB macros to control data-value prediction
   ed6cfd54cc9b perf: arm_spe: Fail device probe when arm64_kernel_unmapped_at_el0()
   eefd900d3450 arm64: idmap: Use "awx" flags for .idmap.text .pushsection directives
   b87b5ce113e1 arm64: entry: Reword comment about post_ttbr_update_workaround
   ccb60ecfe878 arm64: Force KPTI to be disabled on Cavium ThunderX
   173358a49173 arm64: kpti: Add ->enable callback to remap swapper using nG mappings
   1e41ebd20f59 arm64: mm: Permit transitioning from Global to Non-Global without BBM
   3fb3a06fb821 arm64: kpti: Make use of nG dependent on arm64_kernel_unmapped_at_el0()
   56e4bdb0a3e9 arm64: Turn on KPTI only on CPUs that need it
   cb132ae43a2a arm64: cputype: Add MIDR values for Cavium ThunderX2 CPUs
   e7a062e77db3 arm64: kpti: Fix the interaction between ASID switching and software PAN
   7036e5f6774e arm64: mm: Introduce TTBR_ASID_MASK for getting at the ASID in the TTBR
   e0b74ca82f28 arm64: capabilities: Handle duplicate entries for a capability
   f39015ae7127 arm64: Take into account ID_AA64PFR0_EL1.CSV3
   14a756c2fda0 arm64: Kconfig: Reword UNMAP_KERNEL_AT_EL0 kconfig entry
   8c17f836255d arm64: Kconfig: Add CONFIG_UNMAP_KERNEL_AT_EL0
   feace1c8f6eb arm64: use RET instruction for exiting the trampoline
   6eac605e7103 arm64: kaslr: Put kernel vectors address in separate data page
   064607a4fd29 arm64: entry: Add fake CPU feature for unmapping the kernel at EL0
   0b5deee12ce7 arm64: tls: Avoid unconditional zeroing of tpidrro_el0 for native tasks
   a5ed8761f801 arm64: cpu_errata: Add Kryo to Falkor 1003 errata
   26ce07109300 arm64: erratum: Work around Falkor erratum #E1003 in trampoline code
   89685f858b8f arm64: entry: Hook up entry trampoline to exception vectors
   3117e455eee9 arm64: entry: Explicitly pass exception level to kernel_ventry macro
   3f14b03dde8c arm64: mm: Map entry trampoline into trampoline and kernel page tables
   a1f8eeab0e78 arm64: entry: Add exception trampoline page for exceptions from EL0
   392bb3ba6865 arm64: mm: Invalidate both kernel and user ASIDs when performing TLBI
   68e3fee6ea5c arm64: mm: Add arm64_kernel_unmapped_at_el0 helper
   75802ca67d6b arm64: mm: Allocate ASIDs in pairs
   9c3ad6e6b827 arm64: mm: Fix and re-enable ARM64_SW_TTBR0_PAN
   fc29c581cdf3 arm64: mm: Rename post_ttbr0_update_workaround
   e5b604c97b91 arm64: mm: Remove pre_ttbr0_update_workaround for Falkor erratum #E1003
   9586273ff1f8 arm64: mm: Move ASID from TTBR0 to TTBR1
   2c8c2e969339 arm64: mm: Temporarily disable ARM64_SW_TTBR0_PAN
   541214369fcb arm64: mm: Use non-global mappings for kernel space
   2eeaddcc139b media: hdpvr: Fix an error handling path in hdpvr_probe()
   2d1073cfbe78 media: dvb-usb-v2: lmedm04: move ts2020 attach to dm04_lme2510_tuner
   20f3bae5957e media: dvb-usb-v2: lmedm04: Improve logic checking of warm start
   410179dfc2b8 sched/rt: Up the root domain ref count when passing it around via IPIs
   74adee6d7b79 sched/rt: Use container_of() to get root domain in rto_push_irq_work_func()
   8709b63f2ebc Revert "drm/i915: mark all device info struct with __initconst"
   bf8b6ada9508 watchdog: gpio_wdt: set WDOG_HW_RUNNING in gpio_wdt_stop
   5577da97bd3f ssb: Do not disable PCI host on non-Mips
   a52b839c8d65 dmaengine: dmatest: fix container_of member in dmatest_callback
   76eac767a85b cpufreq: mediatek: add mediatek related projects into blacklist
   6cb0b894e128 CIFS: zero sensitive data when freeing
   44fe87e83650 cifs: Fix autonegotiate security settings mismatch
   a0f967b072c9 cifs: Fix missing put_xid in cifs_file_strict_mmap
   e4fb3fda25d6 watchdog: indydog: Add dependency on SGI_HAS_INDYDOG

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index d908eeca0ce8..a4dd17d1cb3a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
+SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.3"
+LINUX_VERSION ?= "4.15.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index d7bc84878643..858a318f3d7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -18,13 +18,13 @@ SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
+SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.3"
+LINUX_VERSION ?= "4.15.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index daad4309b7af..ebbdfcb3b0c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5a2a8f7f757b964da55bd3d2a95130051af2c173"
-SRCREV_machine_qemuarm64 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_machine_qemumips ?= "ee76cb3c65f9138c9e580c13feff6d0c6ebf5f9a"
-SRCREV_machine_qemuppc ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_machine_qemux86 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_machine_qemux86-64 ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_machine_qemumips64 ?= "3b587c8f1db7c5b425b35a98276c6d9b8dd61a2b"
-SRCREV_machine ?= "9f9649fffac97603862fdc90530e0b3ff038eed1"
-SRCREV_meta ?= "ac4dd298328c282f5e70b3ddb469edcad57590cf"
+SRCREV_machine_qemuarm ?= "c9e3d532f245dcb00a022b7fc468bdefdd9b3ec8"
+SRCREV_machine_qemuarm64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_machine_qemumips ?= "88e64d2a3f8f12f3fdc759921ec2067f1e730f97"
+SRCREV_machine_qemuppc ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_machine_qemux86 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_machine_qemux86-64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_machine_qemumips64 ?= "38face5dfd94733484822f392f9469fed18cca7e"
+SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
+SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15.3"
+LINUX_VERSION ?= "4.15.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


