Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 327056C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:34:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x07EYNlZ028285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2019 06:34:23 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 7 Jan 2019 06:34:22 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Jan 2019 09:33:47 -0500
Message-ID: <ec52ef00b9554c8906ea037c96fb44ff5c7f0af3.1546871336.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1546871336.git.bruce.ashfield@windriver.com>
References: <cover.1546871336.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.18: update to v4.18.22
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
X-List-Received-Date: Mon, 07 Jan 2019 14:34:23 -0000
Content-Type: text/plain

Integrating the -stable commits from Paul Gortmaker:

   24ed0744622e Linux 4.18.22
   8266951957ab tipc: use destination length for copy string
   2f2b82e7b4f8 arc: [devboards] Add support of NFSv3 ACL
   047e43ba5173 ARC: change defconfig defaults to ARCv2
   f8d102775911 Input: elan_i2c - add ACPI ID for Lenovo IdeaPad 330-15ARR
   91dfecd75ee7 Input: elan_i2c - add support for ELAN0621 touchpad
   7c63af1039aa Input: elan_i2c - add ELAN0620 to the ACPI table
   673d11935f70 Input: cros_ec_keyb - fix button/switch capability reports
   39f1f992639d Input: matrix_keypad - check for errors from of_get_named_gpio()
   b3cda161024f Input: synaptics - add PNP ID for ThinkPad P50 to SMBus
   3e533ca9eb5d Input: xpad - quirk all PDP Xbox One gamepads
   1c42a30f4824 i40e: Fix deletion of MAC filters
   0f2cbfeff18f svm: Add mutex_lock to protect apic_access_page_done on AMD systems
   af2cd1276d57 kgdboc: Fix warning with module build
   c72ba0c17cce kgdboc: Fix restrict error
   6571f7ba5f6a userfaultfd: shmem: UFFDIO_COPY: set the page dirty if VM_WRITE is not set
   3876646cbe3a userfaultfd: shmem: add i_size checks
   c8a600a72f36 userfaultfd: shmem: allocate anonymous memory for MAP_PRIVATE shmem
   bc43472443ee userfaultfd: use ENOENT instead of EFAULT if the atomic copy user fails
   34bfc624bb6b drm/meson: Fix OOB memory accesses in meson_viu_set_osd_lut()
   a5fdd876d4f9 drm/meson: Enable fast_io in meson_dw_hdmi_regmap_config
   c98737cc98c1 drm/meson: Fixes for drm_crtc_vblank_on/off support
   b6ba7cf72463 drm: set is_master to 0 upon drm_new_set_master() failure
   f5551d7db284 drm/ast: Fix incorrect free on ioregs
   f43ce49c718d tracing/fgraph: Fix set_graph_function from showing interrupts
   c31675335d18 IB/mlx5: Avoid load failure due to unknown link width
   339fc991ac42 mips: fix mips_get_syscall_arg o32 check
   ba720f00b540 MIPS: ralink: Fix mt7620 nd_sd pinmux
   87b2d7eda8cc sched, trace: Fix prev_state output in sched_switch tracepoint
   52338737ea2c mtd: nand: Fix memory allocation in nanddev_bbt_init()
   fa8d131f585a uprobes: Fix handle_swbp() vs. unregister() + register() race once more
   f895888ad58f iser: set sector for ambiguous mr status errors
   62613ca14469 unifdef: use memcpy instead of strncpy
   8a4fd8949897 test_hexdump: use memcpy instead of strncpy
   f68e638adaa5 misc: mic/scif: fix copy-paste error in scif_create_remote_lookup
   021b5e5a42e3 Drivers: hv: vmbus: check the creation_status in vmbus_establish_gpadl()
   f6167c3770f1 mm: use swp_offset as key in shmem_replace_page()
   d7044875a946 mm: cleancache: fix corruption on missed inode invalidation
   b14c4a131d36 lib/test_kmod.c: fix rmmod double free
   1b42a6def46d iio:st_magn: Fix enable device after trigger
   f6bd7b8e4dbc iio/hid-sensors: Fix IIO_CHAN_INFO_RAW returning wrong values for signed numbers
   a7cf14d6bbf0 Revert "usb: dwc3: gadget: skip Set/Clear Halt when invalid"
   b9be70d82cf4 usb: core: quirks: add RESET_RESUME quirk for Cherry G230 Stream series
   c233ce9ca873 USB: usb-storage: Add new IDs to ums-realtek
   726cd6bbfb4f staging: rtl8723bs: Add missing return for cfg80211_rtw_get_station
   cc91a66f70cd staging: rtl8723bs: Fix incorrect sense of ether_addr_equal
   a4827072018e staging: mt7621-dma: fix potentially dereferencing uninitialized 'tx_desc'
   3278d1121784 staging: vchiq_arm: fix compat VCHIQ_IOC_AWAIT_COMPLETION
   4871268b9733 staging: most: use format specifier "%s" in snprintf
   f52619fef6f3 dmaengine: at_hdmac: fix module unloading
   55a2c785818e dmaengine: at_hdmac: fix memory leak in at_dma_xlate()
   7def2114f963 ARM: dts: rockchip: Remove @0 from the veyron memory node
   d66e9553bb93 ASoC: pcm186x: Fix device reset-registers trigger value
   f28e4296150d ext2: fix potential use after free
   13cd83a3fdc6 ext2: initialize opts.s_mount_opt as zero before using it
   715877236823 binder: fix race that allows malicious free of live buffer
   4c80a994e1c3 function_graph: Reverse the order of pushing the ret_stack and the callback
   401bacb8a999 function_graph: Move return callback before update of curr_ret_stack
   5a45629359d8 function_graph: Have profiler use curr_ret_stack and not depth
   cdf8638a4a78 function_graph: Use new curr_ret_depth to manage depth instead of curr_ret_stack
   f54f3a8c164c function_graph: Make ftrace_push_return_trace() static
   19ebfe10ab9d MIPS: function_graph: Simplify with function_graph_enter()
   be7bcea6943b arm64: function_graph: Simplify with function_graph_enter()
   25465f3e0f89 s390/function_graph: Simplify with function_graph_enter()
   212fd6ab8b90 riscv/function_graph: Simplify with function_graph_enter()
   7845921e7845 parisc: function_graph: Simplify with function_graph_enter()
   02c3b2f09537 sparc/function_graph: Simplify with function_graph_enter()
   fadb32957bd3 sh/function_graph: Simplify with function_graph_enter()
   e8dab372f22f powerpc/function_graph: Simplify with function_graph_enter()
   06e04113d8ee x86/function_graph: Simplify with function_graph_enter()
   8974d9ddee8c microblaze: function_graph: Simplify with function_graph_enter()
   2ed3d836c186 ARM: function_graph: Simplify with function_graph_enter()
   a46f2a2ab8f7 function_graph: Create function_graph_enter() to consolidate architecture code
   0c23df1fb2ee ALSA: hda/realtek - fix headset mic detection for MSI MS-B171
   d33625c9ad99 ALSA: hda/realtek - Support ALC300
   d3736fa6a629 ALSA: hda: Add ASRock N68C-S UCC the power_save blacklist
   ac3d401ca588 ALSA: sparc: Fix invalid snd_free_pages() at error path
   5f8920cbdf8b ALSA: control: Fix race between adding and removing a user element
   68d40bdae9e1 ALSA: ac97: Fix incorrect bit shift at AC97-SPSA control write
   8a066b939728 ALSA: wss: Fix invalid snd_free_pages() at error path
   4e153baac165 fs: fix lost error code in dio_complete
   b3a80504fc6b perf/x86/intel: Disallow precise_ip on BTS events
   ef7ffa5edebb perf/x86/intel: Add generic branch tracing check to intel_pmu_has_bts()
   f273d7b0f5ea perf/x86/intel: Move branch tracing setup to the Intel-specific source file
   920db419fad5 x86/fpu: Disable bottom halves while loading FPU registers
   01ae1b649cc4 x86/MCE/AMD: Fix the thresholding machinery initialization order
   598ab7f4e75e arm64: dts: rockchip: Fix PCIe reset polarity for rk3399-puma-haikou.
   39b75abd266e PCI: layerscape: Fix wrong invocation of outbound window disable accessor
   aede037397ca btrfs: relocation: set trans to be NULL after ending transaction
   2fa66c494021 Btrfs: fix race between enabling quotas and subvolume creation
   050f755e1050 Btrfs: ensure path name is null terminated at btrfs_control_ioctl
   8640e4eba7a1 btrfs: Always try all copies when reading extent buffers
   d57b922c1fc6 udf: Allow mounting volumes with incorrect identification strings
   633f035c73f8 xtensa: fix coprocessor part of ptrace_{get,set}xregs
   e3b5970eae2a xtensa: fix coprocessor context offset definitions
   7123932c3463 xtensa: enable coprocessors that are being flushed
   4fea3a135968 KVM: VMX: re-add ple_gap module parameter
   2eda497b4155 KVM: X86: Fix scan ioapic use-before-initialization
   8c896ea1f95d KVM: x86: Fix kernel info-leak in KVM_HC_CLOCK_PAIRING hypercall
   cee09b048c40 KVM: nVMX/nSVM: Fix bug which sets vcpu->arch.tsc_offset to L1 tsc_offset
   60fa1976cc5a kvm: svm: Ensure an IBPB on all affected CPUs when freeing a vmcb
   151d0990d8c6 kvm: mmu: Fix race in emulated page table writes
   e7f4a4ecf899 userfaultfd: shmem/hugetlbfs: only allow to register VM_MAYWRITE vmas
   d04ea8a3e52b x86/speculation: Provide IBPB always command line options
   ba6fd92d9dde x86/speculation: Add seccomp Spectre v2 user space protection mode
   e162e0cb9f48 x86/speculation: Enable prctl mode for spectre_v2_user
   4fe877ade966 x86/speculation: Add prctl() control for indirect branch speculation
   26a22284be5b x86/speculation: Prepare arch_smt_update() for PRCTL mode
   3380e40c38d1 x86/speculation: Prevent stale SPEC_CTRL msr content
   dafcdc4d3ef4 x86/speculation: Split out TIF update
   b34c1d1e20ff ptrace: Remove unused ptrace_may_access_sched() and MODE_IBRS
   2f191447843d x86/speculation: Prepare for conditional IBPB in switch_mm()
   3c4a52665935 x86/speculation: Avoid __switch_to_xtra() calls
   9a02cf2b59f7 x86/process: Consolidate and simplify switch_to_xtra() code
   e45f1bf477c2 x86/speculation: Prepare for per task indirect branch speculation control
   40e17356647d x86/speculation: Add command line control for indirect branch speculation
   34ca30f6ebb2 x86/speculation: Unify conditional spectre v2 print functions
   8cf2abe5a48d x86/speculataion: Mark command line parser data __initdata
   b2e49f57b3d3 x86/speculation: Mark string arrays const correctly
   a951ec1282ca x86/speculation: Reorder the spec_v2 code
   f6e97c269fdf x86/l1tf: Show actual SMT state
   124f1934f087 x86/speculation: Rework SMT state change
   0db58041bd88 sched/smt: Expose sched_smt_present static key
   9b76ef59f198 x86/Kconfig: Select SCHED_SMT if SMP enabled
   74c0d392f4d2 sched/smt: Make sched_smt_present track topology
   4b44044665b7 x86/speculation: Reorganize speculation control MSRs update
   9d35dc0b1975 x86/speculation: Rename SSBD update functions
   ae5c861d44a2 x86/speculation: Disable STIBP when enhanced IBRS is in use
   9fdce9f0d6f6 x86/speculation: Move STIPB/IBPB string conditionals out of cpu_show_common()
   d9e0d122ae45 x86/speculation: Remove unnecessary ret variable in cpu_show_common()
   9ca44b34145e x86/speculation: Clean up spectre_v2_parse_cmdline()
   f472b112c142 x86/speculation: Update the TIF_SSBD comment
   4fe817e5f922 x86/retpoline: Remove minimal retpoline support
   cdda9afbdbcb x86/build: Fix compiler support check for CONFIG_RETPOLINE
   80420a04a82c x86/retpoline: Make CONFIG_RETPOLINE depend on compiler support
   e338c91ae9bb x86/speculation: Add RETPOLINE_AMD support to the inline asm CALL_NOSPEC variant
   dd970c7bb37c x86/speculation: Propagate information about RSB filling mitigation to sysfs
   1a42c7686198 x86/speculation: Apply IBPB more strictly to avoid cross-process data leak
   3fafe253622e tcp: defer SACK compression after DupThresh
   973b2d8edb37 net/dim: Update DIM start sample after each DIM iteration
   0541a4ad4c11 virtio-net: fail XDP set if guest csum is negotiated
   326888b906c0 virtio-net: disable guest csum during XDP set
   ce853ea2a2e1 net: skb_scrub_packet(): Scrub offload_fwd_mark
   497d616f9ef9 net: thunderx: set xdp_prog to NULL if bpf_prog_add fails
   32978c0d13b0 usbnet: ipheth: fix potential recvmsg bug and recvmsg bug 2
   303b14516da0 s390/qeth: fix length check in SNMP processing
   beedfff965e4 rapidio/rionet: do not free skb before reading its length
   9bde4bd658b6 packet: copy user buffers before orphan or clone
   8240b24014e5 net: thunderx: set tso_hdrs pointer to NULL in nicvf_free_snd_queue
   f4b7bf2f7824 net: gemini: Fix copy/paste error
   1a57f5e05433 net: don't keep lonely packets forever in the gro hash
   fa9f95c537f2 lan743x: fix return value for lan743x_tx_napi_poll
   e7ef14941113 lan743x: Enable driver to work with LAN7431
   a7a42d6ae23e mm/khugepaged: collapse_shmem() do not crash on Compound
   219f7f003c6b mm/khugepaged: collapse_shmem() without freezing new_page
   a5df6e4dd710 mm/khugepaged: minor reorderings in collapse_shmem()
   1d0476b09ae2 mm/khugepaged: collapse_shmem() remember to clear holes
   ba76e023cbcd mm/khugepaged: fix crashes due to misaccounted holes
   4ee51871be50 mm/khugepaged: collapse_shmem() stop if punched or truncated
   4b7da0a23ab7 mm/huge_memory: fix lockdep complaint on 32-bit i_size_read()
   4ea44ec50a87 mm/huge_memory: splitting set mapping+index before unfreeze
   9385e2751953 mm/huge_memory: rename freeze_page() to unmap_page()
   cfe3f465651c media: ov5640: fix auto controls values when switching to manual mode
   ce92e4309a8f media: ov5640: fix wrong binning value in exposure calculation
   797f0d9cdb19 media: ov5640: fix auto gain & exposure when changing mode
   09dd7d55020c media: ov5640: fix exposure regression
   d081f6351a54 media: ov5640: Fix timings setup code
   e27220212028 media: ov5640: Re-work MIPI startup sequence
   1941b77cf04d rcu: Make need_resched() respond to urgent RCU-QS needs
   2d694e55c1a8 tty: wipe buffer if not echoing data
   ff91ad4b37b6 tty: wipe buffer.
   c9a2097b5bca include/linux/pfn_t.h: force '~' to be parsed as an unary operator
   69adf873d6b7 mm, page_alloc: check for max order in hot path
   4cf135795c19 tmpfs: make lseek(SEEK_DATA/SEK_HOLE) return ENXIO with a negative offset
   5056621d3d82 mm, memory_hotplug: check zone_movable in has_unmovable_pages
   dfa625fbef30 z3fold: fix possible reclaim races
   32536aab2f6d powerpc/numa: Suppress "VPHN is not supported" messages
   41d104c27a25 NFSv4: Fix an Oops during delegation callbacks
   7d1687dde51a kdb: Use strscpy with destination buffer size
   32fe7d4fb78e drm/amdgpu: fix bug with IH ring setup
   f93e575d397a RISC-V: Silence some module warnings on 32-bit
   8e1136c5aff5 riscv: add missing vdso_install target
   48182b646f13 SUNRPC: Fix a bogus get/put in generic_key_to_expire()
   11e0046dcfea perf/x86/intel/uncore: Add more IMC PCI IDs for KabyLake and CoffeeLake CPUs
   73141f3f7b4f sched/fair: Fix cpu_util_wake() for 'execl' type workloads
   757ebe2cf812 powerpc/io: Fix the IO workarounds code to work with Radix
   cf650c21904c floppy: fix race condition in __floppy_read_block_0()
   7e04a587b960 crypto: simd - correctly take reqsize of wrapped skcipher into account
   eeb7ebec5993 rtc: pcf2127: fix a kmemleak caused in pcf2127_i2c_gather_write
   1a7a12521b42 rtc: cmos: Do not export alarm rtc_ops when we do not support alarms
   06200773ff6b cpufreq: imx6q: add return value check for voltage scale
   8bc2418df6ef KVM: PPC: Move and undef TRACE_INCLUDE_PATH/FILE
   c2d490ff84be scsi: hisi_sas: Remove set but not used variable 'dq_list'
   7fa1b9068daf pinctrl: meson: fix meson8b ao pull register bits
   c3faa93f65aa pinctrl: meson: fix meson8 ao pull register bits
   539eae5c2efb pinctrl: meson: fix gxl ao pull register bits
   81e6fb4d21c9 pinctrl: meson: fix gxbb ao pull register bits
   23980899fd33 pinctrl: meson: fix pinconf bias disable
   2acf52e0d024 fsnotify: generalize handling of extra event flags
   70804a2395f9 IB/hfi1: Eliminate races in the SDMA send error path
   36f0ce79eea5 ACPICA: AML interpreter: add region addresses in global list during initialization
   98a7ff363966 can: flexcan: remove not needed struct flexcan_priv::tx_mb and struct flexcan_priv::tx_mb_idx
   7e6c6e8f96a3 can: flexcan: Always use last mailbox for TX
   09c695304ced can: hi311x: Use level-triggered interrupt
   d5f1bed61e87 can: raw: check for CAN FD capable netdev in raw_sendmsg()
   5dbbeea479ba can: flexcan: handle tx-complete CAN frames via rx-offload infrastructure
   9d698b0e8c60 can: flexcan: use can_rx_offload_queue_sorted() for flexcan_irq_bus_*()
   3ca38586737b can: rx-offload: rename can_rx_offload_irq_queue_err_skb() to can_rx_offload_queue_tail()
   b564520dc84a can: rx-offload: introduce can_rx_offload_get_echo_skb() and can_rx_offload_queue_sorted() functions
   ba4d601f11da can: dev: __can_get_echo_skb(): print error message, if trying to echo non existing skb
   14daeee327c0 can: dev: __can_get_echo_skb(): Don't crash the kernel if can_priv::echo_skb is accessed out of bounds
   bd8f43390a6e can: dev: __can_get_echo_skb(): replace struct can_frame by canfd_frame to access frame length
   ec51a36d40ba can: dev: can_get_echo_skb(): factor out non sending code to __can_get_echo_skb()
   17afd6b2f539 can: flexcan: Unlock the MB unconditionally
   4e10eaf14115 drm/ast: Remove existing framebuffers before loading driver
   2059f682eac4 drm/ast: fixed cursor may disappear sometimes
   47d28426881e drm/ast: change resolution may cause screen blurred
   231220ffbd0c drm/i915: Disable LP3 watermarks on all SNB machines
   0ca629caa428 tcp: do not release socket ownership in tcp_close()
   235bb14bb504 mm/memory.c: recheck page table entry with page table lock held
   700d687423ce mm: don't warn about large allocations for slab
   3deb594eb9cc llc: do not use sk_eat_skb()
   d62cdc16c019 gfs2: Don't leave s_fs_info pointing to freed memory in init_sbd
   91aa78f105a0 sctp: clear the transport of some out_chunk_list chunks in sctp_assoc_rm_peer
   1ffe2390eec3 bfs: add sanity check at bfs_fill_super()
   609b2f88baa9 Input: synaptics - avoid using uninitialized variable when probing
   1c3712cd9ec5 selinux: Add __GFP_NOWARN to allocation at str_read()
   f4dd907859f6 v9fs_dir_readdir: fix double-free on p9stat_read error
   43fb0f750bf5 tools/power/cpupower: fix compilation with STATIC=true
   7b18c23b8a15 opp: ti-opp-supply: Correct the supply in _get_optimal_vdd_voltage call
   cdcc687a7c0f opp: ti-opp-supply: Dynamically update u_volt_min
   adf820e7040b brcmfmac: fix reporting support for 160 MHz channels
   77260dca90d8 iwlwifi: mvm: don't use SAR Geo if basic SAR is not used
   230956227e0f iwlwifi: mvm: fix regulatory domain update when the firmware starts
   34c26e7ff77e iwlwifi: mvm: support sta_statistics() even on older firmware
   4e7059a1ef08 iwlwifi: fix wrong WGDS_WIFI_DATA_SIZE
   00db19541478 gpio: don't free unallocated ida on gpiochip_add_data_with_key() error path
   1c65bc42b0b6 mmc: sdhci-pci: Workaround GLK firmware failing to restore the tuning value
   e670f3c0bd7f mmc: sdhci-pci: Try "cd" for card-detect lookup before using NULL
   0279a3e8c9a3 Documentation/security-bugs: Postpone fix publication in exceptional cases
   bea263a4d369 Documentation/security-bugs: Clarify treatment of embargoed information
   85225e451366 MAINTAINERS: Add Sasha as a stable branch maintainer
   a820ce4d4189 ALSA: oss: Use kvzalloc() for local buffer allocations
   7ca1b0cfd1f5 usb: xhci: Prevent bus suspend if a port connect change or polling state is detected
   6dc2234cfc3d xhci: Add quirk to workaround the errata seen on Cavium Thunder-X2 Soc
   e23d44bfb180 usb: xhci: fix timeout for transition from RExit to U0
   794e4eca3eb8 usb: xhci: fix uninitialized completion when USB3 port got wrong status
   e705be077247 xhci: Add check for invalid byte size error when UAS devices are connected.
   a065ce744fcb xhci: handle port status events for removed USB3 hcd
   d0ab048de951 xhci: Fix leaking USB3 shared_hcd at xhci removal
   c191d670df6c usb: dwc3: core: Clean up ULPI device
   baae5ac1953b usb: dwc3: gadget: Properly check last unaligned/zero chain TRB
   a3c907510737 usb: dwc3: gadget: fix ISOC TRB type on unaligned transfers
   2b5d953d4120 usb: core: Fix hub port connection events lost
   015ca0f92560 efi/libstub: arm: support building with clang
   7972aba9b9a0 HID: steam: remove input device when a hid client is running.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index bc28e1c021b1..e862e8d6547a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6228ee37a46479d624e608c572d241f74eee11b6"
-SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
+SRCREV_machine ?= "cbaa90ae19895c927910b60812d3a879332bb4d5"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.21"
+LINUX_VERSION ?= "4.18.22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index b2ca26498742..41765b525125 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.21"
+LINUX_VERSION ?= "4.18.22"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bd4312baf01b5aca2745245c3856b5143bf0c6ad"
-SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
+SRCREV_machine_qemuarm ?= "c2892e0099ce0b5f6effa3f925ff1a9c83e57997"
+SRCREV_machine ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 96c89723e61f..e8ecc8f55a15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bd83f95a7aa1aa180dad74dbdd6809ee9a5fe9e0"
-SRCREV_machine_qemuarm64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_machine_qemumips ?= "9a16770a65e7617b99f31663b1fafceb459df3dc"
-SRCREV_machine_qemuppc ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_machine_qemux86 ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_machine_qemux86-64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_machine_qemumips64 ?= "6641acbf076ba3f7ad96e846581272215a537904"
-SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
+SRCREV_machine_qemuarm ?= "5a58952eb0d5ff7553e3eb53c65ef70b91b01c64"
+SRCREV_machine_qemuarm64 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_machine_qemumips ?= "fe54f591b6f365c8af386981b57714ccef0a9381"
+SRCREV_machine_qemuppc ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_machine_qemux86 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_machine_qemux86-64 ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_machine_qemumips64 ?= "4b398ad91730576c68164798cc83c72d4b7f55cc"
+SRCREV_machine ?= "db2d813869a0501782469ecdb17e277a501c9f57"
+SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.21"
+LINUX_VERSION ?= "4.18.22"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


