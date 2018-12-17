Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D11266C0EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:40:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3ejWg029825
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:40:45 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:40:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:26 -0500
Message-ID: <14cef60b1cca3fe35d2e518acc63f86ea44037d6.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/17] linux-yocto/4.19: update to v4.19.8
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
X-List-Received-Date: Mon, 17 Dec 2018 03:40:45 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   178574b66509 Linux 4.19.8
   55cbeea76e76 blk-mq: punt failed direct issue to dispatch list
   6235c229fea4 tipc: use destination length for copy string
   4e84cccacb12 arc: [devboards] Add support of NFSv3 ACL
   41e0254d32bd ARC: change defconfig defaults to ARCv2
   b0234f15d2e2 btrfs: tree-checker: Don't check max block group size as current max chunk size limit is unreliable
   280d652e0dd2 Input: elan_i2c - add support for ELAN0621 touchpad
   77dd91caddfe Input: elan_i2c - add ACPI ID for Lenovo IdeaPad 330-15ARR
   08a7e486a19d Input: elan_i2c - add ELAN0620 to the ACPI table
   918cd7d1dfac Input: cros_ec_keyb - fix button/switch capability reports
   25e78d0557e1 Input: matrix_keypad - check for errors from of_get_named_gpio()
   167390050068 Input: synaptics - add PNP ID for ThinkPad P50 to SMBus
   58a99d3722fe Input: xpad - quirk all PDP Xbox One gamepads
   c47bb7af582a scsi: lpfc: fix block guard enablement on SLI3 adapters
   2cb8d55be86c i40e: Fix deletion of MAC filters
   4c202ade1e74 selinux: add support for RTM_NEWCHAIN, RTM_DELCHAIN, and RTM_GETCHAIN
   85bb1e8b7013 svm: Add mutex_lock to protect apic_access_page_done on AMD systems
   e762e1407bc8 kgdboc: Fix warning with module build
   5eede3d09625 kgdboc: Fix restrict error
   8f193a716e56 userfaultfd: shmem: UFFDIO_COPY: set the page dirty if VM_WRITE is not set
   4ce337622f2b userfaultfd: shmem: add i_size checks
   6e44dd02c955 userfaultfd: shmem: allocate anonymous memory for MAP_PRIVATE shmem
   10f98c134b02 userfaultfd: use ENOENT instead of EFAULT if the atomic copy user fails
   212ad3d70222 drm/meson: Fix OOB memory accesses in meson_viu_set_osd_lut()
   ea6bb077bff2 drm/meson: Enable fast_io in meson_dw_hdmi_regmap_config
   736f04212a28 drm/meson: Fixes for drm_crtc_vblank_on/off support
   c952979ad95b drm: set is_master to 0 upon drm_new_set_master() failure
   8a8effbe56b1 drm/amd/dm: Don't forget to attach MST encoders
   94be4764b4bb drm/ast: Fix incorrect free on ioregs
   81f966235412 tracing/fgraph: Fix set_graph_function from showing interrupts
   a99075642666 IB/mlx5: Avoid load failure due to unknown link width
   a41e946e9380 mips: fix mips_get_syscall_arg o32 check
   8e847e8c7456 MIPS: ralink: Fix mt7620 nd_sd pinmux
   d49297b5c77a tracepoint: Use __idx instead of idx in DO_TRACE macro to make it unique
   fd8152818f11 sched, trace: Fix prev_state output in sched_switch tracepoint
   2858d1891eb5 arm64: ftrace: Fix to enable syscall events on arm64
   86e429241603 mtd: nand: Fix memory allocation in nanddev_bbt_init()
   ac8edc62e813 uprobes: Fix handle_swbp() vs. unregister() + register() race once more
   61c963ab59fd iser: set sector for ambiguous mr status errors
   0448ad42d6a1 unifdef: use memcpy instead of strncpy
   f2d12a0ba143 test_hexdump: use memcpy instead of strncpy
   724ff9cbfe1f blk-mq: fix corruption with direct issue
   61c68f2a2af0 Linux 4.19.7
   842c4c22ea2b misc: mic/scif: fix copy-paste error in scif_create_remote_lookup
   5e4b30d68a02 Drivers: hv: vmbus: check the creation_status in vmbus_establish_gpadl()
   b66375b599bf mm: use swp_offset as key in shmem_replace_page()
   16a2d602244f mm: cleancache: fix corruption on missed inode invalidation
   91a514788356 lib/test_kmod.c: fix rmmod double free
   855f9dc87160 iio:st_magn: Fix enable device after trigger
   ec800c8b028e iio/hid-sensors: Fix IIO_CHAN_INFO_RAW returning wrong values for signed numbers
   91f1c5c65d73 Revert "usb: dwc3: gadget: skip Set/Clear Halt when invalid"
   c7d370712e72 usb: core: quirks: add RESET_RESUME quirk for Cherry G230 Stream series
   d4f924e359ad USB: usb-storage: Add new IDs to ums-realtek
   b73301b7db4a staging: rtl8723bs: Add missing return for cfg80211_rtw_get_station
   6d956674dfc5 staging: rtl8723bs: Fix incorrect sense of ether_addr_equal
   fa299861aeeb staging: mt7621-pinctrl: fix uninitialized variable ngroups
   bea52e4d1e42 staging: mt7621-dma: fix potentially dereferencing uninitialized 'tx_desc'
   6df2b837939a staging: vchiq_arm: fix compat VCHIQ_IOC_AWAIT_COMPLETION
   053b783d3da3 staging: most: use format specifier "%s" in snprintf
   0d04d450fe0d dmaengine: at_hdmac: fix module unloading
   9983a5bba09e dmaengine: at_hdmac: fix memory leak in at_dma_xlate()
   6e74fc22db9c ARM: dts: rockchip: Remove @0 from the veyron memory node
   b16c2b78f13c ASoC: pcm186x: Fix device reset-registers trigger value
   f35f68c68ce4 ASoC: intel: cht_bsw_max98090_ti: Add quirk for boards using pmc_plt_clk_0
   ffaaaf68be1e ext2: fix potential use after free
   1666cf8c492d ext2: initialize opts.s_mount_opt as zero before using it
   553927d6aab9 binder: fix race that allows malicious free of live buffer
   a22ff9df71aa function_graph: Reverse the order of pushing the ret_stack and the callback
   d2bcf809e838 function_graph: Move return callback before update of curr_ret_stack
   aec14c812ba8 function_graph: Have profiler use curr_ret_stack and not depth
   392374326d29 function_graph: Use new curr_ret_depth to manage depth instead of curr_ret_stack
   72c33b233f05 function_graph: Make ftrace_push_return_trace() static
   35aa93cbb04c MIPS: function_graph: Simplify with function_graph_enter()
   bdfd01cfd1e7 arm64: function_graph: Simplify with function_graph_enter()
   ef9326a145cd s390/function_graph: Simplify with function_graph_enter()
   84d2023c14ea riscv/function_graph: Simplify with function_graph_enter()
   87352d621bd3 parisc: function_graph: Simplify with function_graph_enter()
   34773b2f57ae sparc/function_graph: Simplify with function_graph_enter()
   56c1dd92c0fc sh/function_graph: Simplify with function_graph_enter()
   5478648ee825 powerpc/function_graph: Simplify with function_graph_enter()
   25ac02d0ed5e nds32: function_graph: Simplify with function_graph_enter()
   217614993ace x86/function_graph: Simplify with function_graph_enter()
   e7deeabe9aa3 microblaze: function_graph: Simplify with function_graph_enter()
   fbbee0cfba5f ARM: function_graph: Simplify with function_graph_enter()
   67d7bec3fc6c function_graph: Create function_graph_enter() to consolidate architecture code
   b72fc1c3cce4 ALSA: hda/realtek - Add auto-mute quirk for HP Spectre x360 laptop
   dcd51305cd41 ALSA: hda/realtek - fix the pop noise on headphone for lenovo laptops
   524841156bbe ALSA: hda/realtek - fix headset mic detection for MSI MS-B171
   094c00891be8 ALSA: hda/realtek - Support ALC300
   bb951d8d965c ALSA: hda: Add ASRock N68C-S UCC the power_save blacklist
   15c5fb33cda9 ALSA: sparc: Fix invalid snd_free_pages() at error path
   d8a2dca04064 ALSA: control: Fix race between adding and removing a user element
   b77c35ef8e38 ALSA: ac97: Fix incorrect bit shift at AC97-SPSA control write
   e83c4405ebf0 ALSA: wss: Fix invalid snd_free_pages() at error path
   adcd35a38cde fs: fix lost error code in dio_complete
   205af59e7011 perf/x86/intel: Disallow precise_ip on BTS events
   be0e2e2436cc perf/x86/intel: Add generic branch tracing check to intel_pmu_has_bts()
   ad65b548409c perf/x86/intel: Move branch tracing setup to the Intel-specific source file
   33448a8b577d x86/fpu: Disable bottom halves while loading FPU registers
   00f91adf52af x86/MCE/AMD: Fix the thresholding machinery initialization order
   8af02415638e arm64: dts: rockchip: Fix PCIe reset polarity for rk3399-puma-haikou.
   ab7702162bbc PCI: Fix incorrect value returned from pcie_get_speed_cap()
   1ce69ec307fd PCI: dwc: Fix MSI-X EP framework address calculation bug
   b391ed731b39 PCI: layerscape: Fix wrong invocation of outbound window disable accessor
   590657656bdc btrfs: relocation: set trans to be NULL after ending transaction
   172a94eb2df2 Btrfs: fix race between enabling quotas and subvolume creation
   715608dbf756 Btrfs: fix rare chances for data loss when doing a fast fsync
   78a2890fcda1 Btrfs: ensure path name is null terminated at btrfs_control_ioctl
   aaf249e36785 btrfs: Always try all copies when reading extent buffers
   949ddf8039bf udf: Allow mounting volumes with incorrect identification strings
   01fb21bf2424 xtensa: fix coprocessor part of ptrace_{get,set}xregs
   5f84a996a0cb xtensa: fix coprocessor context offset definitions
   4ec1039f474b xtensa: enable coprocessors that are being flushed
   bbe23c4b948f KVM: VMX: re-add ple_gap module parameter
   61c42d657c85 KVM: X86: Fix scan ioapic use-before-initialization
   ffb01e73737b KVM: LAPIC: Fix pv ipis use-before-initialization
   6d772df4038e KVM: x86: Fix kernel info-leak in KVM_HC_CLOCK_PAIRING hypercall
   76c8476cc720 KVM: nVMX/nSVM: Fix bug which sets vcpu->arch.tsc_offset to L1 tsc_offset
   b8b0c871640f kvm: svm: Ensure an IBPB on all affected CPUs when freeing a vmcb
   471aca572529 kvm: mmu: Fix race in emulated page table writes
   34b7a7cc5321 userfaultfd: shmem/hugetlbfs: only allow to register VM_MAYWRITE vmas
   9f3baacee183 x86/speculation: Provide IBPB always command line options
   d1ec2354787a x86/speculation: Add seccomp Spectre v2 user space protection mode
   7b62ef142c11 x86/speculation: Enable prctl mode for spectre_v2_user
   238ba6e75855 x86/speculation: Add prctl() control for indirect branch speculation
   f67fafb88c46 x86/speculation: Prepare arch_smt_update() for PRCTL mode
   e84124017450 x86/speculation: Prevent stale SPEC_CTRL msr content
   59028be13385 x86/speculation: Split out TIF update
   aecb99692a4d ptrace: Remove unused ptrace_may_access_sched() and MODE_IBRS
   a17888154cf2 x86/speculation: Prepare for conditional IBPB in switch_mm()
   dd73e15ea213 x86/speculation: Avoid __switch_to_xtra() calls
   a87c81f0de3d x86/process: Consolidate and simplify switch_to_xtra() code
   69985a2cae82 x86/speculation: Prepare for per task indirect branch speculation control
   711875432218 x86/speculation: Add command line control for indirect branch speculation
   8a34c70686e0 x86/speculation: Unify conditional spectre v2 print functions
   507ac84e159b x86/speculataion: Mark command line parser data __initdata
   275d90f0fa5d x86/speculation: Mark string arrays const correctly
   10c24dc62a3a x86/speculation: Reorder the spec_v2 code
   1572793b498d x86/l1tf: Show actual SMT state
   f55e301ec4d5 x86/speculation: Rework SMT state change
   340693ee912e sched/smt: Expose sched_smt_present static key
   f98bf1640e06 x86/Kconfig: Select SCHED_SMT if SMP enabled
   a2c094816f89 sched/smt: Make sched_smt_present track topology
   6308dde50fcc x86/speculation: Reorganize speculation control MSRs update
   39402a5e5a29 x86/speculation: Rename SSBD update functions
   ca41d792a230 x86/speculation: Disable STIBP when enhanced IBRS is in use
   f37b55ab8d84 x86/speculation: Move STIPB/IBPB string conditionals out of cpu_show_common()
   30a8e214606d x86/speculation: Remove unnecessary ret variable in cpu_show_common()
   2ee44e2d761a x86/speculation: Clean up spectre_v2_parse_cmdline()
   e8494e5df78e x86/speculation: Update the TIF_SSBD comment
   90d2c53fa196 x86/retpoline: Remove minimal retpoline support
   8c4ad5d39144 x86/retpoline: Make CONFIG_RETPOLINE depend on compiler support
   cbc93677ef08 x86/speculation: Add RETPOLINE_AMD support to the inline asm CALL_NOSPEC variant
   44a076100a7b x86/speculation: Propagate information about RSB filling mitigation to sysfs
   cacd9385b78d x86/speculation: Apply IBPB more strictly to avoid cross-process data leak
   b07fc04c94e3 x86/speculation: Enable cross-hyperthread spectre v2 STIBP mitigation
   4e3fbd7433d7 tipc: fix lockdep warning during node delete
   38af4b903210 net: phy: add workaround for issue where PHY driver doesn't bind to the device
   aaa7e45c00d6 tcp: defer SACK compression after DupThresh
   b8e076958a09 net/dim: Update DIM start sample after each DIM iteration
   b06510bf095b virtio-net: fail XDP set if guest csum is negotiated
   1af400beef4a virtio-net: disable guest csum during XDP set
   4aaa233c79f6 net: skb_scrub_packet(): Scrub offload_fwd_mark
   2f6cfb8e9f5c net: thunderx: set xdp_prog to NULL if bpf_prog_add fails
   535b494a4fa5 usbnet: ipheth: fix potential recvmsg bug and recvmsg bug 2
   711e3d37275c s390/qeth: fix length check in SNMP processing
   720e0d05af0f rapidio/rionet: do not free skb before reading its length
   f2a67e68dbae packet: copy user buffers before orphan or clone
   abc963e459fd net: thunderx: set tso_hdrs pointer to NULL in nicvf_free_snd_queue
   cfbee9e96d79 net: gemini: Fix copy/paste error
   b24a813e792d net: don't keep lonely packets forever in the gro hash
   18dd9bf51325 lan743x: fix return value for lan743x_tx_napi_poll
   767d890331ea lan743x: Enable driver to work with LAN7431
   8b37c40503ea mm/khugepaged: collapse_shmem() do not crash on Compound
   af24c01831e4 mm/khugepaged: collapse_shmem() without freezing new_page
   3e9646c76cb9 mm/khugepaged: minor reorderings in collapse_shmem()
   ee13d69bc1e8 mm/khugepaged: collapse_shmem() remember to clear holes
   78141aabfbb9 mm/khugepaged: fix crashes due to misaccounted holes
   8797f2f4fe0d mm/khugepaged: collapse_shmem() stop if punched or truncated
   d31ff4722f45 mm/huge_memory: fix lockdep complaint on 32-bit i_size_read()
   7e18656c9a2c mm/huge_memory: splitting set mapping+index before unfreeze
   69697e6a61c7 mm/huge_memory: rename freeze_page() to unmap_page()
   96db90800c06 Linux 4.19.6
   d873e63e0a01 media: ov5640: fix auto controls values when switching to manual mode
   5724c6ad1c4c media: ov5640: fix wrong binning value in exposure calculation
   644fefe4c6a7 media: ov5640: fix auto gain & exposure when changing mode
   f8248ad512b6 media: ov5640: fix exposure regression
   905fa2f2ffad media: ov5640: Fix timings setup code
   c59dc6cf4fd9 media: ov5640: Re-work MIPI startup sequence
   016a8fc59d14 rcu: Make need_resched() respond to urgent RCU-QS needs
   38084377af4f gfs2: Fix iomap buffer head reference counting bug
   9365cdf8db51 tty: wipe buffer if not echoing data
   5a2261ed3a29 tty: wipe buffer.
   5e8c28f4fd64 include/linux/pfn_t.h: force '~' to be parsed as an unary operator
   e7a121e34c79 dax: Avoid losing wakeup in dax_lock_mapping_entry
   9dec38554aa8 mm, page_alloc: check for max order in hot path
   db89fc007b23 tmpfs: make lseek(SEEK_DATA/SEK_HOLE) return ENXIO with a negative offset
   b44fd1268bd2 mm, memory_hotplug: check zone_movable in has_unmovable_pages
   510066729ba4 z3fold: fix possible reclaim races
   43b2ceb0d4e0 efi/arm: Revert deferred unmap of early memmap mapping
   f5c632cfc424 powerpc/numa: Suppress "VPHN is not supported" messages
   b5ccf0038f34 NFSv4: Fix an Oops during delegation callbacks
   2bc40f89f47e kdb: Use strscpy with destination buffer size
   4dc843906873 drm/amdgpu: fix bug with IH ring setup
   021e2f3fc985 RISC-V: Silence some module warnings on 32-bit
   fc9b1d7f791f riscv: add missing vdso_install target
   ab1a52066938 SUNRPC: Fix a bogus get/put in generic_key_to_expire()
   487d58a9c3e5 block: copy ioprio in __bio_clone_fast() and bounce
   08f94d0628c3 perf/x86/intel/uncore: Add more IMC PCI IDs for KabyLake and CoffeeLake CPUs
   08fbd4e011ef sched/fair: Fix cpu_util_wake() for 'execl' type workloads
   b771863247e8 powerpc/io: Fix the IO workarounds code to work with Radix
   73fd491d7708 floppy: fix race condition in __floppy_read_block_0()
   c587ba480e12 crypto: simd - correctly take reqsize of wrapped skcipher into account
   49bcb0415da9 rtc: pcf2127: fix a kmemleak caused in pcf2127_i2c_gather_write
   b411f9463a78 rtc: cmos: Do not export alarm rtc_ops when we do not support alarms
   121f89dd7024 cpufreq: imx6q: add return value check for voltage scale
   8d976d7a883c KVM: PPC: Move and undef TRACE_INCLUDE_PATH/FILE
   c7ae5115e32a scsi: hisi_sas: Remove set but not used variable 'dq_list'
   3d57a04fbd6d scsi: lpfc: fix remoteport access
   08609aace6bb tools/testing/nvdimm: Fix the array size for dimm devices.
   c4b25ef590f5 pinctrl: meson: fix meson8b ao pull register bits
   93620bc4de8a pinctrl: meson: fix meson8 ao pull register bits
   c74e3fc6d0c3 pinctrl: meson: fix gxl ao pull register bits
   5922ab4adc13 pinctrl: meson: fix gxbb ao pull register bits
   71ab26e917de pinctrl: meson: fix pinconf bias disable
   20663629f6ae fanotify: fix handling of events on child sub-directory
   1dc3c17cdb9f fsnotify: generalize handling of extra event flags
   6763372b816c IB/hfi1: Eliminate races in the SDMA send error path
   87403e35bc56 ACPICA: AML interpreter: add region addresses in global list during initialization
   d5a9ba4324d5 can: flexcan: remove not needed struct flexcan_priv::tx_mb and struct flexcan_priv::tx_mb_idx
   24e5589791d0 can: flexcan: Always use last mailbox for TX
   50d94ac1da74 can: hi311x: Use level-triggered interrupt
   bf8295faed73 can: raw: check for CAN FD capable netdev in raw_sendmsg()
   04f985776f04 can: flexcan: handle tx-complete CAN frames via rx-offload infrastructure
   f699c3222635 can: flexcan: use can_rx_offload_queue_sorted() for flexcan_irq_bus_*()
   6ce9d61a6537 can: rx-offload: rename can_rx_offload_irq_queue_err_skb() to can_rx_offload_queue_tail()
   169130c87a88 can: rx-offload: introduce can_rx_offload_get_echo_skb() and can_rx_offload_queue_sorted() functions
   474673a94f17 can: dev: __can_get_echo_skb(): print error message, if trying to echo non existing skb
   e3b8d98e3758 can: dev: __can_get_echo_skb(): Don't crash the kernel if can_priv::echo_skb is accessed out of bounds
   cfc8ed910312 can: dev: __can_get_echo_skb(): replace struct can_frame by canfd_frame to access frame length
   5877d2c0eac8 can: dev: can_get_echo_skb(): factor out non sending code to __can_get_echo_skb()
   8d2aed6439cf can: flexcan: Unlock the MB unconditionally
   09132a6b01a7 drm/ast: Remove existing framebuffers before loading driver
   80142af39bd9 drm/ast: fixed cursor may disappear sometimes
   e9d2c0fbe161 drm/ast: change resolution may cause screen blurred
   382debd2fe42 drm/i915: Disable LP3 watermarks on all SNB machines
   e3290a5e24df drm/amdgpu: Fix oops when pp_funcs->switch_power_profile is unset
   d9ea911e2b90 drm/vc4: Set ->legacy_cursor_update to false when doing non-async updates
   7841a545f8bd drm/amdgpu: Add missing firmware entry for HAINAN
   d543f583e3af drm/fb-helper: Blacklist writeback when adding connectors to fbdev
   cddcc9959a32 tcp: do not release socket ownership in tcp_close()
   5999609a93a4 mm/memory.c: recheck page table entry with page table lock held
   3996e891ec97 mm: don't warn about large allocations for slab
   292c48e2971e llc: do not use sk_eat_skb()
   331bd738eb17 gfs2: Don't leave s_fs_info pointing to freed memory in init_sbd
   cd947138e8c3 sctp: clear the transport of some out_chunk_list chunks in sctp_assoc_rm_peer
   8380cbfe4eab bfs: add sanity check at bfs_fill_super()
   9891b528f91d Input: synaptics - avoid using uninitialized variable when probing
   3962e78a9fcb selinux: Add __GFP_NOWARN to allocation at str_read()
   829567dd9196 v9fs_dir_readdir: fix double-free on p9stat_read error
   9f9e2bd0bbcf tools/power/cpupower: fix compilation with STATIC=true
   b7d5ef6af8eb opp: ti-opp-supply: Correct the supply in _get_optimal_vdd_voltage call
   50f4a3b8eb62 opp: ti-opp-supply: Dynamically update u_volt_min
   54923bc74beb brcmfmac: fix reporting support for 160 MHz channels
   c74c926ffa0a iwlwifi: mvm: don't use SAR Geo if basic SAR is not used
   4969751575c8 iwlwifi: mvm: fix regulatory domain update when the firmware starts
   b643d705441c iwlwifi: mvm: support sta_statistics() even on older firmware
   29d920ba59c3 iwlwifi: fix wrong WGDS_WIFI_DATA_SIZE
   602162dce8a4 gpio: don't free unallocated ida on gpiochip_add_data_with_key() error path
   6d24302acc10 mmc: sdhci-pci: Workaround GLK firmware failing to restore the tuning value
   52f4036282f7 mmc: sdhci-pci: Try "cd" for card-detect lookup before using NULL
   bcec3b858057 Documentation/security-bugs: Postpone fix publication in exceptional cases
   160a390a9d53 Documentation/security-bugs: Clarify treatment of embargoed information
   fc0f90849a45 MAINTAINERS: Add Sasha as a stable branch maintainer
   27d6abfb99c8 ALSA: oss: Use kvzalloc() for local buffer allocations
   cc8b329fef53 usb: xhci: Prevent bus suspend if a port connect change or polling state is detected
   b6cc7f9c6461 xhci: Add quirk to workaround the errata seen on Cavium Thunder-X2 Soc
   cad3876cd23d usb: xhci: fix timeout for transition from RExit to U0
   60ac01c60ba9 usb: xhci: fix uninitialized completion when USB3 port got wrong status
   3e8886bd158f xhci: Add check for invalid byte size error when UAS devices are connected.
   a237717dfdbc xhci: handle port status events for removed USB3 hcd
   82c1b66894fd xhci: Fix leaking USB3 shared_hcd at xhci removal
   2ff85eaf165f usb: dwc3: Fix NULL pointer exception in dwc3_pci_remove()
   c4d1e71e5613 usb: dwc3: core: Clean up ULPI device
   4b977515da48 usb: dwc3: gadget: Properly check last unaligned/zero chain TRB
   47cb27191f6c usb: dwc3: gadget: fix ISOC TRB type on unaligned transfers
   269c01eb49ed usb: core: Fix hub port connection events lost
   711bd5d290da efi/libstub: arm: support building with clang
   fb87a92b4396 HID: steam: remove input device when a hid client is running.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index ab253fa730b8..e80d376b5c8c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "36ac11d2cb46f951843586935292c628d304e113"
-SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
+SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
+SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.5"
+LINUX_VERSION ?= "4.19.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 8924cce3f6b1..52dc2c10ef23 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.5"
+LINUX_VERSION ?= "4.19.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "afd1ddee4ec8cc65d585e2c75bbcf31d9650c827"
-SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
+SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
+SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index d7373c09b27b..2eb174cfc9a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a14b08c3446dfab88ff97d84a9ba70db11287290"
-SRCREV_machine_qemuarm64 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_machine_qemumips ?= "69975293fac754567a3ebdd0aa914d461e218b70"
-SRCREV_machine_qemuppc ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_machine_qemux86 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_machine_qemux86-64 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_machine_qemumips64 ?= "8c14832341502679afbfb370d48b977ecf363c82"
-SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
+SRCREV_machine_qemuarm ?= "ec8e55a97ad8a88107c5af069ece1b7f203f4ac4"
+SRCREV_machine_qemuarm64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_machine_qemumips ?= "3b5fba0207a870c1de76c5dd80d8d3c0e42aa1cf"
+SRCREV_machine_qemuppc ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
+SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
+SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.5"
+LINUX_VERSION ?= "4.19.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


