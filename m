Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: [PATCH 1/7] linux-yocto/5.15: update to v5.15.5
Date: Tue,  7 Dec 2021 11:52:02 -0500
Message-Id: <66c6d8cf3706654509b49315c124a90fd08c6542.1638895732.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

f00712e27083 Linux 5.15.5
e6818963e0b0 ALSA: hda: hdac_stream: fix potential locking issue in snd_hdac_stream_assign()
01085644673f ALSA: hda: hdac_ext_stream: fix potential locking issues
faed25ba98db x86/Kconfig: Fix an unused variable error in dell-smm-hwmon
fa5f8606353f net: add and use skb_unclone_keeptruesize() helper
f14c85733154 btrfs: update device path inode time instead of bd_inode
22efa065ff01 fs: export an inode_update_time helper
148ed0e75c5e ice: Delete always true check of PF pointer
0190a2f88823 ice: Fix VF true promiscuous mode
d87edd01ce22 usb: max-3421: Use driver data instead of maintaining a list of bound devices
11a8768144ea ASoC: rsnd: fixup DMAEngine API
330651b2c0d7 ASoC: DAPM: Cover regression by kctl change notification fix
83c8ab8503ad selinux: fix NULL-pointer dereference when hashtab allocation fails
439b99314b63 bpf: Forbid bpf_ktime_get_coarse_ns and bpf_timer_* in tracing progs
354313514e97 RDMA/netlink: Add __maybe_unused to static inline in C file
556d59293a2a hugetlbfs: flush TLBs correctly after huge_pmd_unshare
686bf792032a signal: Replace force_fatal_sig with force_exit_sig when in doubt
7614e046ed48 signal: Don't always set SA_IMMUTABLE for forced signals
02d28b5fdb41 signal: Replace force_sigsegv(SIGSEGV) with force_fatal_sig(SIGSEGV)
3e61002d0597 signal/x86: In emulate_vsyscall force a signal instead of calling do_exit
3c4d5a38ca93 signal/vm86_32: Properly send SIGSEGV when the vm86 state cannot be saved.
1998d85c83e3 signal/sparc32: In setup_rt_frame and setup_fram use force_fatal_sig
905e8609419b signal/sparc32: Exit with a fatal signal when try_to_clear_window_buffer fails
58484ab427f1 signal/s390: Use force_sigsegv in default_trap_handler
c7b7868dba81 signal/powerpc: On swapcontext failure force SIGSEGV
fe67da49f784 exit/syscall_user_dispatch: Send ordinary signals on failure
110ae07d2268 signal: Implement force_fatal_sig
21d727a394f0 drm/amd/pm: avoid duplicate powergate/ungate setting
ca28919fe90d drm/amdgpu: fix set scaling mode Full/Full aspect/Center not works on vga and dvi connectors
2e3eb81884de drm/i915: Fix type1 DVI DP dual mode adapter heuristic for modern platforms
a2dda2817a9a drm/i915/dp: Ensure max link params are always valid
72704e07a003 drm/i915/dp: Ensure sink rate values are always valid
c3d06f6067bf drm/nouveau: clean up all clients on device removal
0b1a35d63995 drm/nouveau: use drm_dev_unplug() during device removal
4ee6807a1ad7 drm/nouveau: Add a dedicated mutex for the clients list
4f8e469a2384 drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap
59fb48db328b drm/udl: fix control-message timeout
f5b5ea165440 drm/i915/guc: Unwind context requests in reverse order
413e603c1447 drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
2a45b1c66ccc drm/i915/guc: Workaround reset G2H is received after schedule done G2H
ad583a961905 drm/i915/guc: Don't enable scheduling on a banned context, guc_id invalid, not registered
519bd9107ef6 drm/i915/guc: Fix outstanding G2H accounting
296188ce0360 drm/amd/display: Limit max DSC target bpp for specific monitors
d4b7d7b80bb6 drm/amd/display: Update swizzle mode enums
76025be187d2 mac80211: drop check for DONT_REORDER in __ieee80211_select_queue
60a3a889efe5 mac80211: fix radiotap header generation
5a9b671c8d74 cfg80211: call cfg80211_stop_ap when switch from P2P_GO type
a1c9455f10be parisc/sticon: fix reverse colors
61b26492e7d1 net: stmmac: Fix signed/unsigned wreckage
7c48010ba348 fs: handle circular mappings correctly
47e6f9f69153 btrfs: fix memory ordering between normal and ordered work functions
cd198aea9e8d Drivers: hv: balloon: Use VMBUS_RING_SIZE() wrapper for dm_ring_size
d8f574fb5eb2 net: stmmac: socfpga: add runtime suspend/resume callback for stratix10 platform
37330f37f666 spi: fix use-after-free of the add_lock mutex
77a5baefe1be udf: Fix crash after seekdir
c3b0ab956d90 printk: restore flushing of NMI buffers on remote CPUs after NMI backtraces
76b46fa3f8d9 drm/cma-helper: Release non-coherent memory with dma_free_noncoherent()
94cc0809e525 KVM: nVMX: don't use vcpu->arch.efer when checking host state on nested state load
679a6ffd07b6 KVM: SEV: Disallow COPY_ENC_CONTEXT_FROM if target has created vCPUs
90342e02b471 fbdev: Prevent probing generic drivers if a FB is already registered
1560763677ff block: Check ADMIN before NICE for IOPRIO_CLASS_RT
520f8ac91f2b s390/dump: fix copying to user-space of swapped kdump oldmem
c0849d3157a8 s390/kexec: fix memory leak of ipl report buffer
cc8b2e0d5bd7 s390/vdso: filter out -mstack-guard and -mstack-size
44b6cc4367cc s390/boot: simplify and fix kernel memory layout setup
a4c7fe4409c5 s390/setup: avoid reserving memory above identity mapping
f07220f7d568 pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'
4ac27afaf79d scsi: qla2xxx: Fix mailbox direction flags in qla2xxx_get_adapter_id()
e449d2e69ad7 ata: libata: add missing ata_identify_page_supported() calls
08a667e440d7 ata: libata: improve ata_read_log_page() error message
4ca2a26feeb4 Revert "parisc: Reduce sigreturn trampoline to 3 instructions"
586afe2b8420 Revert "drm/i915/tgl/dsi: Gate the ddi clocks after pll mapping"
de04ee7d7d54 powerpc/8xx: Fix pinned TLBs with CONFIG_STRICT_KERNEL_RWX
54e11a4e9df6 powerpc/xive: Change IRQ domain to a tree domain
7cc16be1ae66 powerpc/signal32: Fix sigset_t copy
c897c53642b9 KVM: x86/xen: Fix get_attr of KVM_XEN_ATTR_TYPE_SHARED_INFO
b22ef13e8e3a KVM: x86/mmu: include EFER.LMA in extended mmu role
c3168ef1f12d KVM: x86: Fix uninitialized eoi_exit_bitmap usage in vcpu_load_eoi_exitmap()
5969e2435cbd KVM: x86: Assume a 64-bit hypercall for guests with protected state
8823ea27fff6 x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
60eec41ddb92 x86/sgx: Fix free page accounting
2495decce774 x86/boot: Pull up cmdline preparation and early param parsing
1e0d346be1cc mm/damon/dbgfs: fix missed use of damon_dbgfs_lock
cda10b34ecfb mm/damon/dbgfs: use '__GFP_NOWARN' for user-specified size buffer allocation
4dfddb52abc2 kmap_local: don't assume kmap PTEs are linear arrays in memory
b5069d44e2fb hugetlb, userfaultfd: fix reservation restore on userfaultfd error
11138d734963 mm: kmemleak: slob: respect SLAB_NOLEAKTRACE flag
e73114d9334e shm: extend forced shm destroy to support objects from several IPC nses
72bfd835ae71 ipc: WARN if trying to remove ipc object which is absent
9404c4145542 tipc: check for null after calling kmemdup
660859f0158c hexagon: clean up timer-regs.h
c0247013173c hexagon: export raw I/O routines for modules
17071fdcd01d pstore/blk: Use "%lu" to format unsigned long
007ebe2d61d4 Revert "mark pstore-blk as broken"
a705254c71fd tun: fix bonding active backup with arp monitoring
9e6b4c36e9ac dmaengine: remove debugfs #ifdef
6ffad92d05b0 blk-cgroup: fix missing put device in error path from blkg_conf_pref()
4220cc6e113c s390/kexec: fix return code handling
737143025c18 perf/x86/intel/uncore: Fix IIO event constraints for Snowridge
d55aa2391d01 perf/x86/intel/uncore: Fix IIO event constraints for Skylake Server
7955e4aca73f perf/x86/intel/uncore: Fix filter_tid mask for CHA events on Skylake Server
db66f2829caa pinctrl: qcom: sm8350: Correct UFS and SDC offsets
13d31d416cb3 pinctrl: qcom: sdm845: Enable dual edge errata
ad03b901d03b powerpc/pseries: Fix numa FORM2 parsing fallback code
ad9ade6c946e powerpc/pseries: rename numa_dist_table to form2_distances
a0995ebe4e1f powerpc: clean vdso32 and vdso64 directories
a7e700257135 KVM: PPC: Book3S HV: Use GLOBAL_TOC for kvmppc_h_set_dabr/xdabr()
9c2ff78cf833 riscv: fix building external modules
35d97fd89c12 tools build: Fix removal of feature-sync-compare-and-swap feature detection
20540cb666a6 ptp: ocp: Fix a couple NULL vs IS_ERR() checks
4d42da0c86b8 e100: fix device suspend/resume
ed35e950d8e5 NFC: add NCI_UNREG flag to eliminate the race
8a9c61c3ef18 NFC: reorder the logic in nfc_{un,}register_device
96a209038a99 NFC: reorganize the functions in nci_request
7a5c8a68f38f i40e: Fix display error code in dmesg
6c9c9f48b462 i40e: Fix creation of first queue by omitting it if is not power of two
593015973591 i40e: Fix warning message and call stack during rmmod i40e driver
0bccc44a54e8 RDMA/mlx4: Do not fail the registration on port stats
29148fffe93c i40e: Fix ping is lost after configuring ADq on VF
7299cd74718e i40e: Fix changing previously set num_queue_pairs for PFs
e91e8427a1e1 i40e: Fix NULL ptr dereference on VSI filter sync
fdd56291046c i40e: Fix correct max_pkt_size on VF RX queue
0f810d06b507 net: virtio_net_hdr_to_skb: count transport header in UFO
32d468622474 net: dpaa2-eth: fix use-after-free in dpaa2_eth_remove
7cc1c7da94ea net: sched: act_mirred: drop dst for the direction from egress to ingress
d7d992cc3a7b net: mvmdio: fix compilation warning
39443eb70e29 scsi: ufs: core: Fix another task management completion race
bede57a71a68 scsi: ufs: core: Fix task management completion timeout race
bcc0e3175a97 scsi: core: sysfs: Fix hang when device state is set via sysfs
c36baca06efa scsi: ufs: core: Improve SCSI abort handling
7fbdbd4fe35b net/mlx5: E-Switch, return error if encap isn't supported
2c3b6e820d67 net/mlx5: Lag, update tracker when state change event received
486e8de6e233 net/mlx5e: CT, Fix multiple allocations and memleak of mod acts
8b45a377b582 net/mlx5: E-Switch, rebuild lag only when needed
a51a6da375d8 net/mlx5: Update error handler for UCTX and UMEM
2ae381570806 net/mlx5e: nullify cq->dbg pointer in mlx5_debug_cq_remove()
158ec85d360e net/mlx5: E-Switch, Fix resetting of encap mode when entering switchdev
a49a9b92fcd2 net/mlx5e: Wait for concurrent flow deletion during neigh/fib events
ebeda7a9528a net/mlx5e: kTLS, Fix crash in RX resync flow
b70e072feffa RDMA/core: Set send and receive CQ before forwarding to the driver
9fe0ba31271c btrfs: make 1-bit bit-fields of scrub_page unsigned int
67fb5eac4063 udp: Validate checksum in udp_read_sock()
b4a677ffb67e platform/x86: think-lmi: Abort probe on analyze failure
6e6e4fce53fa platform/x86: hp_accel: Fix an error handling path in 'lis3lv02d_probe()'
871ee7e815fb gpio: rockchip: needs GENERIC_IRQ_CHIP to fix build errors
3d0f4ae1ad75 mips: lantiq: add support for clk_get_parent()
114404d22ee0 mips: bcm63xx: add support for clk_get_parent()
21e27ed8ce6b MIPS: generic/yamon-dt: fix uninitialized variable error
a5d1d3522232 bpf: Fix toctou on read-only map's constant scalar tracking
4d1834f39252 iavf: Restore VLAN filters after link down
cbb81563f5d4 iavf: Fix for setting queues to 0
366c1fd41689 iavf: Fix for the false positive ASQ/ARQ errors while issuing VF reset
9200f8c8600e iavf: validate pointers
99744c938f96 iavf: prevent accidental free of filter structure
f72da5a83a0d iavf: Fix failure to exit out from last all-multicast mode
c3db4fffb364 iavf: don't clear a lock we don't hold
9ef6589cac9a iavf: free q_vectors before queues in iavf_disable_vf
fb2be87cc330 iavf: check for null in iavf_fix_features
68d4274034e6 iavf: Fix return of set the new channel count
10c22d9519f3 NFSD: Fix exposure in nfsd4_decode_bitmap()
f6218db54351 net/smc: Make sure the link_id is unique
17b2c2e70d20 sock: fix /proc/net/sockstat underflow in sk_clone_lock()
95fe8904bcd6 tipc: only accept encrypted MSG_CRYPTO msgs
aff97b89a38e bnxt_en: reject indirect blk offload when hw-tc-offload is off
61566668ef3f net: bnx2x: fix variable dereferenced before check
aa67407ebb6d selftests: gpio: fix gpio compiling error
05a48cba2459 net: ipa: disable HOLB drop when updating timer
0f3de700c695 net: ipa: HOLB register sometimes must be written twice
e10e13319025 mac80211: fix monitor_sdata RCU/locking assertions
1d17f6179182 nl80211: fix radio statistics in survey dump
85f4a563c9e4 tracing: Add length protection to histogram string copies
0efd57d82ece tcp: Fix uninitialized access in skb frags array for Rx 0cp.
f4d1328e6e30 net/ipa: ipa_resource: Fix wrong for loop range
e9fd8938118a selftests: net: switch to socat in the GSO GRE test
f49175809074 samples/bpf: Fix incorrect use of strlen in xdp_redirect_cpu
ff12332ec614 samples/bpf: Fix summary per-sec stats in xdp_sample_user
bd4542006641 bpf: Fix inner map state pruning regression.
8369b01aa5a6 drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame
07b486f1a8fe perf tests: Remove bash construct from record+zstd_comp_decomp.sh
99643bdc6ff1 perf bench futex: Fix memory leak of perf_cpu_map__new()
ab7c3d8d81c5 perf bpf: Avoid memory leak from perf_env__insert_btf()
05e13b4a53b5 tracing/histogram: Do not copy the fixed-size char array field over the field size
04096d1b66cf blkcg: Remove extra blkcg_bio_issue_init
eda355db53c4 perf/x86/vlbr: Add c->flags to vlbr event constraints
512e21c150c1 sched/fair: Prevent dead task groups from regaining cfs_rq's
e4511d8dc256 sched/core: Mitigate race cpus_share_cache()/update_top_cache_domain()
725b5c9984cc MIPS: boot/compressed/: add __bswapdi2() to target for ZSTD decompression
1e3220ec23d9 mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
c0c51afb2e8c KVM: arm64: Fix host stage-2 finalization
595e359751d6 clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk
c4584223f5de clk/ast2600: Fix soc revision for AHB
3024018bb2df clk: ingenic: Fix bugs with divided dividers
680a0c6332c4 f2fs: fix incorrect return value in f2fs_sanity_check_ckpt()
9c9afedf3ac5 f2fs: compress: disallow disabling compress on non-empty compressed file
3d937f901cea sh: define __BIG_ENDIAN for math-emu
d21ad7abba75 sh: math-emu: drop unused functions
c29506bfcf8b sh: fix kconfig unmet dependency warning for FRAME_POINTER
7228ed3293e0 f2fs: fix wrong condition to trigger background checkpoint correctly
9ad4e63e3cca f2fs: fix to use WHINT_MODE
0dfaa04f0161 f2fs: fix up f2fs_lookup tracepoints
6d28f6ba633d maple: fix wrong return value of maple_bus_init().
b80a7977299a sh: check return code of request_irq
23274bd8d7ad powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without DEBUG_RODATA_TEST
2f4dede20cdf powerpc/dcr: Use cmplwi instead of 3-argument cmpli
3c0c79d1261e iommu/dart: Initialize DART_STREAMS_ENABLE
c4ea7b0c6180 clk: at91: sama7g5: remove prescaler part of master clock
58fa50de595f ALSA: usb-audio: fix null pointer dereference on pointer cs_desc
16721797dcef ALSA: gus: fix null pointer dereference on pointer block
3f8da4b87f13 arm64: dts: qcom: Fix node name of rpm-msg-ram device nodes
93d0049268cd ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
72b4e7b7beba powerpc/5200: dts: fix memory node unit name
619ce4646397 memory: tegra20-emc: Add runtime dependency on devfreq governor module
bf76f56a7fc7 scsi: lpfc: Allow fabric node recovery if recovery is in progress before devloss
28de48a7cea4 scsi: lpfc: Fix link down processing to address NULL pointer dereference
dbebf865b323 scsi: lpfc: Fix use-after-free in lpfc_unreg_rpi() routine
21903226c724 RDMA/core: Use kvzalloc when allocating the struct ib_port
a9d2d23b5032 iio: imu: st_lsm6dsx: Avoid potential array overflow in st_lsm6dsx_set_odr()
26af3ab9325e scsi: target: Fix alua_tg_pt_gps_count tracking
a2489880354d scsi: target: Fix ordered tag handling
66523553fa62 scsi: scsi_debug: Fix out-of-bound read in resp_report_tgtpgs()
5b8bed6464ad scsi: scsi_debug: Fix out-of-bound read in resp_readcap16()
5777ab62b21d MIPS: sni: Fix the build
5c34486f0470 tty: tty_buffer: Fix the softlockup issue in flush_to_ldisc
0a85b47cd449 iommu/vt-d: Do not falsely log intel_iommu is unsupported kernel option
0a2ddbfd65b3 ALSA: ISA: not for M68K
eadee7f95b5d ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for flash
8e6920f7ac96 ARM: dts: ls1021a: move thermal-zones node out of soc/
8eab383460c4 ASoC: rt5682: fix a little pop while playback
065334f6640d usb: host: ohci-tmio: check return value after calling platform_get_resource()
31340f013582 ARM: dts: omap: fix gpmc,mux-add-data type
1f45b73679b9 ALSA: usb-audio: Add support for the Pioneer DJM 750MK2 Mixer/Soundcard
98b134cc4417 HID: multitouch: disable sticky fingers for UPERFECT Y
c37f9ee2bb9f firmware_loader: fix pre-allocated buf built-in firmware use
966e4def9001 ASoC: Intel: sof_sdw: add missing quirk for Dell SKU 0A45
1c6bd253dc9c ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA single amp
2e46a58adfc6 ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec
fed89b5a4c18 arm64: dts: imx8mm-kontron: Fix reset delays for ethernet PHY
d29faaf81685 scsi: smartpqi: Add controller handshake during kdump
27490ae6a85a scsi: advansys: Fix kernel pointer leak
7f37066e0d13 ASoC: nau8824: Add DMI quirk mechanism for active-high jack-detect
94ca62033dfb ASoC: rt5651: Use IRQF_NO_AUTOEN when requesting the IRQ
0864d7f686f9 ASoC: es8316: Use IRQF_NO_AUTOEN when requesting the IRQ
735939e2c8a7 clk: imx: imx6ul: Move csi_sel mux to correct base register
daf932eae1fa ALSA: usb-audio: disable implicit feedback sync for Behringer UFX1204 and UFX1604
e15de347faf4 scsi: core: Fix scsi_mode_sense() buffer length handling
ae893767385a ASoC: SOF: Intel: hda-dai: fix potential locking issue
3cff8b789ea5 RDMA/rxe: Separate HW and SW l/rkeys
b6f64bd4cf9f arm64: dts: ls1012a: Add serial alias for ls1012a-rdb
0479e598c773 arm64: dts: freescale: fix arm,sp805 compatible string
3f6946cfa798 arm64: dts: qcom: sdm845: Fix qcom,controlled-remotely property
e608d43f7603 arm64: dts: qcom: ipq8074: Fix qcom,controlled-remotely property
9bfe717293c0 arm64: dts: qcom: ipq6018: Fix qcom,controlled-remotely property
118c826ef8b4 arm64: dts: qcom: msm8998: Fix CPU/L2 idle state latency and residency
30a3826f7fa9 ARM: BCM53016: Specify switch ports for Meraki MR32
d330f1d4f797 staging: rtl8723bs: remove a third possible deadlock
12cfdef56c3b staging: rtl8723bs: remove a second possible deadlock
353a6e9acb45 staging: rtl8723bs: remove possible deadlock when disconnect (v2)
f78e23be336e ARM: dts: ux500: Skomer regulator fixes
2c71811c963b usb: typec: tipd: Remove WARN_ON in tps6598x_block_read
06cfb4cb2241 usb: musb: tusb6010: check return value after calling platform_get_resource()
9dd4b84d5521 bus: ti-sysc: Use context lost quirk for otg
c182fa00fcdd bus: ti-sysc: Add quirk handling for reinit on context lost
1e299b02bae8 RDMA/bnxt_re: Check if the vlan is valid before reporting
bed5a80fc851 arm64: dts: hisilicon: fix arm,sp805 compatible string
376bad670585 arm64: dts: rockchip: Disable CDN DP on Pinebook Pro
867cfea6ae55 ASoC: mediatek: mt8195: Add missing of_node_put()
814d3610c4ce scsi: lpfc: Fix list_add() corruption in lpfc_drain_txq()
269a4311b15f scsi: pm80xx: Fix memory leak during rmmod
a070e30d1b7b arm64: dts: broadcom: bcm4908: Move reboot syscon out of bus
8e4b6c2f027e ARM: dts: NSP: Fix mpcore, mmc node names
8033b37f969a ARM: dts: BCM5301X: Fix MDIO mux binding
50b631c5a38e ARM: dts: BCM5301X: Fix nodes names
f7d67885beb3 staging: wfx: ensure IRQ is ready before enabling it
f08c0d6a673c arm64: dts: allwinner: a100: Fix thermal zone node name
f2b9e78b3e14 arm64: dts: allwinner: h5: Fix GPU thermal zone node name
ea4f91645d5b ARM: dts: sunxi: Fix OPPs node name
b5dd513daa70 clk: sunxi-ng: Unregister clocks/resets when unbinding
5d729f4b5b56 arm64: zynqmp: Fix serial compatible string
69d0f6a7c8cf arm64: zynqmp: Do not duplicate flash partition label property
9ac77cf6e1bd Linux 5.15.4
1af7386f5f71 Revert "ACPI: scan: Release PM resources blocked by unused objects"
ef2590a5305e thermal: Fix NULL pointer dereferences in of_thermal_ functions
bd378dcd5031 perf/core: Avoid put_page() when GUP fails
7931b7e31882 PCI: Add MSI masking quirk for Nvidia ION AHCI
06ce633b3bfd PCI/MSI: Deal with devices lying about their MSI mask capability
a912418410ab parisc/entry: fix trace test in syscall exit path
73f1e74f9c87 Bluetooth: btusb: Add support for TP-Link UB500 Adapter
c0991182aca3 loop: Use blk_validate_block_size() to validate block size
1f124a661191 block: Add a helper to validate the block size
8d0956438eec fortify: Explicitly disable Clang support
0fc2241ac237 btrfs: zoned: allow preallocation for relocation inodes
d0fdafa8fcf3 btrfs: check for relocation inodes on zoned btrfs in should_nocow
080f457f35c0 btrfs: zoned: use regular writes for relocation
f716e9827838 btrfs: zoned: only allow one process to add pages to a relocation inode
d282dd7f4109 btrfs: zoned: add a dedicated data relocation block group
02c5e9e992a2 btrfs: introduce btrfs_is_data_reloc_root
19e32bd1cc37 KVM: Fix steal time asm constraints
b06962406eca Revert "drm: fb_helper: fix CONFIG_FB dependency"
3256c84aaddc Revert "drm: fb_helper: improve CONFIG_FB dependency"
d27b2dcdb8d2 string: uninline memcpy_and_pad
3b17187f5ca1 Linux 5.15.3
712cb7ee75bc media: videobuf2-dma-sg: Fix buf->vb NULL pointer dereference
c8b0f8beb566 media: videobuf2: always set buffer vb2 pointer
6c087b0fbfe9 x86/sev: Make the #VC exception stacks part of the default stacks storage
411d939db1d0 x86/sev: Add an x86 version of cc_platform_has()
d15683461800 arch/cc: Introduce a function to check for confidential computing features
03fbc935ac62 selftests/bpf: Fix also no-alu32 strobemeta selftest
60e73f7e75cf selftests/x86/iopl: Adjust to the faked iopl CLI/STI usage
32d126ac68f5 mmc: moxart: Fix null pointer dereference on pointer host
6f11f2096b2c ath10k: fix invalid dma_addr_t token assignment
9ebaafec97fb cifs: fix memory leak of smb3_fs_context_dup::server_hostname
855eba695ddc media: vidtv: move kfree(dvb) to vidtv_bridge_dev_release()
bb7e50b476ab drm/amd/display: Look at firmware version to determine using dmub on dcn21
3e1e7e4a6b54 SUNRPC: Partial revert of commit 6f9f17287e78
7f837109586e PCI: aardvark: Fix PCIe Max Payload Size setting
0b86872ba468 PCI: Add PCI_EXP_DEVCTL_PAYLOAD_* macros
dfc6f0bec09c drm/sun4i: Fix macros in sun8i_csc.h
0084aaaec2d1 powerpc/85xx: fix timebase sync issue when CONFIG_HOTPLUG_CPU=n
310b6f976c74 powerpc/pseries/mobility: ignore ibm, platform-facilities updates
d05dc4bdc333 powerpc/64s/interrupt: Fix check_return_regs_valid() false positive
02da36324104 powerpc/security: Use a mutex for interrupt exit code patching
7c8ad3fc644a powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module unload
317cc5bacf69 powerpc/32e: Ignore ESR in instruction storage interrupt handler
6f657bb66f1e powerpc/bpf: Fix write protecting JIT code
0356cc5d27c2 powerpc/vas: Fix potential NULL pointer dereference
b75b27e4e640 mtd: rawnand: au1550nd: Keep the driver compatible with on-die ECC engines
ac4e55c17cba mtd: rawnand: plat_nand: Keep the driver compatible with on-die ECC engines
768e8c3b9850 mtd: rawnand: orion: Keep the driver compatible with on-die ECC engines
2b33e01948fd mtd: rawnand: pasemi: Keep the driver compatible with on-die ECC engines
d9d3d38049d5 mtd: rawnand: gpio: Keep the driver compatible with on-die ECC engines
365b3fefe51e mtd: rawnand: mpc5121: Keep the driver compatible with on-die ECC engines
f7e59ebde2ec mtd: rawnand: xway: Keep the driver compatible with on-die ECC engines
9bfee3cd5eb1 mtd: rawnand: ams-delta: Keep the driver compatible with on-die ECC engines
bedb039360b2 mtd: rawnand: fsmc: Fix use of SM ORDER
bcd526c98adb remoteproc: imx_rproc: Fix rsc-table name
5cd861213e11 remoteproc: imx_rproc: Fix ignoring mapping vdev regions
3ff5812f164e remoteproc: Fix the wrong default value of is_iomem
6b8ea5da3be5 remoteproc: elf_loader: Fix loading segment when is_iomem true
ed8b06a0eb8e s390/cio: make ccw_device_dma_* more robust
3ef2272417f4 s390/ap: Fix hanging ioctl caused by orphaned replies
3134c317b1b3 s390/tape: fix timer initialization in tape_std_assign()
f33bf6015eaf s390/cio: check the subchannel validity for dev_busid
32f71f368086 s390/cpumf: cpum_cf PMU displays invalid value after hotplug remove
051d89f4dec2 PM: sleep: Avoid calling put_device() under dpm_list_mtx
ac8ffb5d9dfb bcache: Revert "bcache: use bvec_virt"
d6a300977ac9 bcache: fix use-after-free problem in bcache_device_free()
a958d144754e video: backlight: Drop maximum brightness override for brightness zero
d9dad32cb55e mfd: dln2: Add cell for initializing DLN2 ADC
3ea871f0d8e0 mm, thp: fix incorrect unmap behavior for private pages
fd8e972dc427 mm, thp: lock filemap when truncating page cache
c15aeead2488 mm, oom: do not trigger out_of_memory from the #PF
487a4c60c593 mm, oom: pagefault_out_of_memory: don't force global OOM for dying tasks
f1e83db27ad5 memcg: prohibit unconditional exceeding the limit of dying tasks
6560e8cd869b mm/filemap.c: remove bogus VM_BUG_ON
6847c4286297 9p/net: fix missing error check in p9_check_errors
1f03911876ab net, neigh: Enable state migration between NUD_PERMANENT and NTF_USE
6a85f01a89ef dmaengine: bestcomm: fix system boot lockups
c4cd9e5acc34 dmaengine: ti: k3-udma: Set r/tchan or rflow to NULL if request fail
68ae6ae1431f dmaengine: ti: k3-udma: Set bchan to NULL if a channel request fail
1dd578e98560 ksmbd: don't need 8byte alignment for request length in ksmbd_check_message
aacb2ddb67fb ksmbd: Fix buffer length check in fsctl_validate_negotiate_info()
5e84e9d61dba block: Hold invalidate_lock in BLKRESETZONE ioctl
373c2bfecb06 block: Hold invalidate_lock in BLKZEROOUT ioctl
f9bed86a35a0 block: Hold invalidate_lock in BLKDISCARD ioctl
876d6242d225 drm/i915/guc: Fix blocked context accounting
f60978969910 erofs: fix unsafe pagevec reuse of hooked pclusters
11a102de53a7 ceph: fix mdsmap decode when there are MDS's beyond max_mds
5e1b901dd470 f2fs: fix UAF in f2fs_available_free_memory
6fd542665e70 f2fs: include non-compressed blocks in compr_written_block
035302003cca f2fs: should use GFP_NOFS for directory inodes
910ea7dd1e62 irqchip/sifive-plic: Fixup EOI failed when masked
d5d21724af23 posix-cpu-timers: Clear task::posix_cputimers_work in copy_process()
fb58e9a26c3c KVM: x86: move guest_pv_has out of user_access section
d5e79d872bab PCI/MSI: Destroy sysfs before freeing entries
ab40a2e5e29e PCI/MSI: Move non-mask check back into low level accessors
affa1361642f x86/mce: Add errata workaround for Skylake SKX37
3cd12b61c37f MIPS: Fix assembly error from MIPSr2 code used within MIPS_ISA_ARCH_LEVEL
9b1b68eaad2a MIPS: fix *-pkg builds for loongson2ef platform
70895879357f MIPS: fix duplicated slashes for Platform file path
8301503a728a parisc: Flush kernel data mapping in set_pte_at() when installing pte for user page
1dc7ce007aef parisc: Fix backtrace to always include init funtion names
ca8f29dc8b1b ARM: 9156/1: drop cc-option fallbacks for architecture selection
12f0dc47f274 ARM: 9155/1: fix early early_iounmap()
93114d5b3af0 smb3: do not error on fsync when readonly
c3f2809643ad thermal: int340x: fix build on 32-bit targets
2cc4450b5327 selftests/net: udpgso_bench_rx: fix port argument
3ce70c345537 cxgb4: fix eeprom len when diagnostics not implemented
ed8b7355e38b net/smc: fix sk_refcnt underflow on linkdown and fallback
244048220c04 vsock: prevent unnecessary refcnt inc for nonblocking connect
c8234e6086c1 net: marvell: mvpp2: Fix wrong SerDes reconfiguration order
6fb190ff5716 net: ethernet: ti: cpsw_ale: Fix access to un-initialized memory
0c8ee89e351c net: stmmac: allow a tc-taprio base-time of zero
cb85093e0c8e net: hns3: allow configure ETS bandwidth of all TCs
3d3f131b4032 net: hns3: fix kernel crash when unload VF while it is being reset
5c051366908b net: hns3: fix pfc packet number incorrect after querying pfc parameters
bcbee7cf14a6 net: hns3: fix ROCE base interrupt vector initialization bug
3e13ce88a3c8 net/sched: sch_taprio: fix undefined behavior in ktime_mono_to_any
422fb879961f net: dsa: mv88e6xxx: Don't support >1G speeds on 6191X on ports other than 10
f17e9e81004e drm/amdgpu: fix uvd crash on Polaris12 during driver unloading
f00e054b299c seq_file: fix passing wrong private data
acdc5065d967 init: make unknown command line param message clearer
2cf82ea0a46d drm/i915/fb: Fix rounding error in subsampled plane size calculation
fea0b9507bb7 gve: Fix off by one in gve_tx_timeout()
0bf8323e2c74 dmaengine: stm32-dma: avoid 64-bit division in stm32_dma_get_max_width
4ee1ac7f3cf5 dmaengine: stm32-dma: fix burst in case of unaligned memory address
0bff34d6712a bpf, sockmap: sk_skb data_end access incorrect when src_reg = dst_reg
1a8dba02a888 bpf: sockmap, strparser, and tls are reusing qdisc_skb_cb and colliding
c5cc0d23c541 bpf, sockmap: Fix race in ingress receive verdict with redirect to self
41c65a3ce9db bpf, sockmap: Remove unhash handler for BPF sockmap usage
b90d961cf635 arm64: pgtable: make __pte_to_phys/__phys_to_pte_val inline functions
f828915064fe arm64: arm64_ftr_reg->name may not be a human-readable string
2d57d522e2f0 litex_liteeth: Fix a double free in the remove function
2d2dfc33ef44 nfc: pn533: Fix double free when pn533_fill_fragment_skbs() fails
72fb40d87c59 llc: fix out-of-bound array index in llc_sk_dev_hash()
63609f11cda8 perf bpf: Add missing free to bpf_event__print_bpf_prog_info()
18fdce809a9c zram: off by one in read_block_state()
3d6b113cbef4 mm/zsmalloc.c: close race window between zs_pool_dec_isolated() and zs_unregister_migration()
1ba8ddd87b02 can: mcp251xfd: mcp251xfd_chip_start(): fix error handling for mcp251xfd_chip_rx_int_enable()
7eb0881aec26 can: etas_es58x: es58x_rx_err_msg(): fix memory leak in error path
e16a1e4ba6da drm/amdgpu/powerplay: fix sysfs_emit/sysfs_emit_at handling
97308cd5ce8e Revert "drm/imx: Annotate dma-fence critical section in commit path"
94e18f5a5dd1 drm: fb_helper: improve CONFIG_FB dependency
39db3e5681bd selftests/bpf/xdp_redirect_multi: Limit the tests in netns
a99e4d94df31 selftests/bpf/xdp_redirect_multi: Give tcpdump a chance to terminate cleanly
00f991138c2f selftests/bpf/xdp_redirect_multi: Use arping to accurate the arp number
ddf4f3897357 selftests/bpf/xdp_redirect_multi: Put the logs to tmp folder
e13c75449905 libbpf: Fix lookup_and_delete_elem_flags error reporting
f0f8307c7db3 ACPI: PM: Fix device wakeup power reference counting error
27f2e5b91452 mfd: altera-sysmgr: Fix a mistake caused by resource_size conversion
5fb2bcf0affe mfd: sprd: Add SPI device ID table
bd20d4d8433e mfd: cpcap: Add SPI device ID table
34b1f6db7cea mfd: core: Add missing of_node_put for loop iteration
ca1362fdcbc2 ALSA: memalloc: Catch call with NULL snd_dma_buffer pointer
e9806f88b774 octeontx2-pf: select CONFIG_NET_DEVLINK
0c49ae7a8db9 bonding: Fix a use-after-free problem when bond_sysfs_slave_add() failed
71fb40ae9b07 drm/ttm: remove ttm_bo_vm_insert_huge()
9d5c7b0eeeca block: fix device_add_disk() kobject_create_and_add() error handling
8f1e23735636 net: phy: fix duplex out of sync problem while changing settings
96f9abc9183c cpufreq: intel_pstate: Clear HWP desired on suspend/shutdown and offline
d8dedce3460e PCI: Do not enable AtomicOps on VFs
6d1d54003af4 ataflop: remove ataflop_probe_lock mutex
e107071961c5 block/ataflop: provide a helper for cleanup up an atari disk
875ffb42476b block/ataflop: add registration bool before calling del_gendisk()
9d3261d4606a block/ataflop: use the blk_cleanup_disk() helper
275e4a31a82c nvdimm/pmem: cleanup the disk if pmem_release_disk() is yet assigned
8e8ed252e483 drm/nouveau/svm: Fix refcount leak bug and missing check against null bug
e65a7ab548a3 selftests: net: properly support IPv6 in GSO GRE test
57488e25ef53 scsi: ufs: ufshpb: Properly handle max-single-cmd
e022fea64e8d scsi: ufs: core: Fix NULL pointer dereference
5dd6e6426805 scsi: ufs: ufshpb: Use proper power management API
1e476c9f63ee scsi: bsg: Fix errno when scsi_bsg_register_queue() fails
064b6b0592e1 nvdimm/btt: do not call del_gendisk() if not needed
4e7af8a90a2c PCI: j721e: Fix j721e_pcie_probe() error path
19c65258dde3 ACPI: PMIC: Fix intel_pmic_regs_handler() read accesses
fdcdc4c5ae3d kdb: Adopt scheduler's task classification
1deba5e29d9f ice: Fix not stopping Tx queues for VFs
abf65a2ee78b ice: Fix replacing VF hardware MAC to existing MAC filter
932224ba805d net: dsa: felix: fix broken VLAN-tagged PTP under VLAN-aware bridge
21032425c36f net: vlan: fix a UAF in vlan_dev_real_dev()
f48a13b3ec59 openrisc: fix SMP tlb flush NULL pointer dereference
2e746ef502c9 ethtool: fix ethtool msg len calculation for pause stats
351237a76e3f kselftests/net: add missed toeplitz.sh/toeplitz_client.sh to Makefile
fca8095c4206 kselftests/net: add missed vrf_strict_mode_test.sh test to Makefile
14a49eb8dcd1 kselftests/net: add missed SRv6 tests
19f67358b600 kselftests/net: add missed setup_loopback.sh/setup_veth.sh to Makefile
13bf487e33d6 kselftests/net: add missed icmp.sh test to Makefile
9c806a70fa4c net: davinci_emac: Fix interrupt pacing disable
cd63d080b9e8 io-wq: fix max-workers not correctly set on multi-node system
e99270d7f273 nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
795e6b378692 nbd: fix max value for 'first_minor'
f314286463bc xen-pciback: Fix return in pm_ctrl_init()
db651ace499c gpio: realtek-otto: fix GPIO line IRQ offset
01e189372d48 i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_probe()'
5b12e1931569 dmaengine: idxd: fix resource leak on dmaengine driver disable
9b882818aec1 NFSv4: Fix a regression in nfs_set_open_stateid_locked()
4b7e3d5ee357 scsi: qla2xxx: edif: Fix EDIF bsg
e56d80025ed0 scsi: qla2xxx: edif: Increase ELS payload
aac0a76cb318 scsi: qla2xxx: edif: Flush stale events and msgs on session down
dcd0c5e7dec2 scsi: qla2xxx: edif: Fix app start delay
696815ee50f6 scsi: qla2xxx: edif: Fix app start fail
09e4dafeca9b scsi: qla2xxx: Turn off target reset during issue_lip
411ca50eab27 scsi: qla2xxx: Fix gnl list corruption
7ee1c31ce9df scsi: qla2xxx: Relogin during fabric disturbance
b65e9044be04 scsi: target: core: Remove from tmr_list during LUN unlink
eb63b768afca ar7: fix kernel builds for compiler test
e5f9487c06bd watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
fb2b4c7b5477 m68k: set a default value for MEMORY_RESERVE
8f072ec8b41b signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
671dd8b385b2 dmaengine: idxd: reconfig device after device reset command
b1b9ef3abafa dmanegine: idxd: fix resource free ordering on driver removal
9fb118b077f6 dmaengine: tegra210-adma: fix pm runtime unbalance
8bc8be6ce69e dmaengine: dmaengine_desc_callback_valid(): Check for `callback_result`
5b380c56bb4b netfilter: nfnetlink_queue: fix OOB when mac header was cleared
9981e39ded4b soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read
8ccaade05b00 auxdisplay: ht16k33: Fix frame buffer device blanking
fba8ce59bbd4 auxdisplay: ht16k33: Connect backlight to fbdev
d6d28153d49f auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
5204722a9642 Fix user namespace leak
d9bd9732cad6 NFS: Fix an Oops in pnfs_mark_request_commit()
9443fcc22a6c NFS: Fix up commit deadlocks
b07aa21474d3 dmaengine: stm32-dma: fix stm32_dma_get_max_width
f12d23bc255d dmaengine: at_xdmac: fix AT_XDMAC_CC_PERID() macro
98b727511da8 dmaengine: at_xdmac: call at_xdmac_axi_config() on resume path
1976e7b3c033 rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
84ea6245dc02 remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
62eaaa154c8f mtd: core: don't remove debugfs directory if device is in use
152d0b535426 mtd: rawnand: arasan: Prevent an unsupported configuration
402239647cb3 PCI: uniphier: Serialize INTx masking/unmasking and fix the bit operation
321a355777d0 mtd: spi-nor: hisi-sfc: Remove excessive clk_disable_unprepare()
1c60136d99c2 drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
d36d2c35fd98 Input: st1232 - increase "wait ready" timeout
d268e0125c92 fs: orangefs: fix error return code of orangefs_revalidate_lookup()
a94284b0fdce sparc: Add missing "FORCE" target when using if_changed
cab693c0fe29 NFS: Fix deadlocks in nfs_scan_commit_list()
97eaf7af7fd1 opp: Fix return in _opp_add_static_v2()
5a67f827379f PCI: aardvark: Fix preserving PCI_EXP_RTCTL_CRSSVE flag on emulated bridge
e8c80586b8fb PCI: aardvark: Don't spam about PIO Response Status
c8ae61fe97c2 drm/plane-helper: fix uninitialized variable reference
c03c7f58ae49 drm/bridge/lontium-lt9611uxc: fix provided connector suport
5ab7612ff0b5 pnfs/flexfiles: Fix misplaced barrier in nfs4_ff_layout_prepare_ds
6967d9967b7a NFS: Fix dentry verifier races
597e9c7a4ace NFS: Ignore the directory size when marking for revalidation
69e0be0efe53 NFS: Don't set NFS_INO_DATA_INVAL_DEFER and NFS_INO_INVALID_DATA
7e2801edf23f NFS: Default change_attr_type to NFS4_CHANGE_TYPE_IS_UNDEFINED
47dbabb8279c i2c: mediatek: fixing the incorrect register offset
1721649965e4 Input: ariel-pwrbutton - add SPI device ID table
40f60ee1d33c rtc: mcp795: Add SPI ID table
46a2f7945553 dmaengine: idxd: move out percpu_ref_exit() to ensure it's outside submission
c31b0fe8e116 i2c: i801: Use PCI bus rescan mutex to protect P2SB access
aad5b030fa2e remoteproc: imx_rproc: Fix TCM io memory type
171b2888a410 rtc: pcf2123: Add SPI ID table
75ed1289c376 rtc: ds1390: Add SPI ID table
c7e81f2c0e8a rtc: ds1302: Add SPI ID table
d9dacf260671 nfsd: don't alloc under spinlock in rpc_parse_scope_id
a61698358b38 mtd: rawnand: intel: Fix potential buffer overflow in probe
e87c6bc32caf rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
4f3de16a3ca6 apparmor: fix error check
1c6eefe997ad RDMA/core: Require the driver to set the IOVA correctly during rereg_mr
3f49a9d356bd power: supply: bq27xxx: Fix kernel crash on IRQ handler register error
dfd04b3a8191 mips: cm: Convert to bitfield API to fix out-of-bounds access
27ddb2735a6e vdpa/mlx5: Fix clearing of VIRTIO_NET_F_MAC feature bit
0099c7affb21 virtio_ring: check desc == NULL when using indirect with packed
bcf29e436895 serial: cpm_uart: Protect udbg definitions by CONFIG_SERIAL_CPM_CONSOLE
874b8c70f39d ASoC: rsnd: Fix an error handling path in 'rsnd_node_count()'
98492898c367 RDMA/hns: Modify the value of MAX_LP_MSG_LEN to meet hardware compatibility
ff021c96a9a7 RDMA/hns: Fix initial arm_st of CQ
e4fa14bdf83a ASoC: cs42l42: Correct configuring of switch inversion from ts-inv
dfbcaef20204 powerpc: Don't provide __kernel_map_pages() without ARCH_SUPPORTS_DEBUG_PAGEALLOC
06cebea18a33 iommu/dma: Fix incorrect error return on iommu deferred attach
a4ce4337dc1c ALSA: oxfw: fix functional regression for Mackie Onyx 1640i in v5.14 or later
f5927a99737a powerpc/xmon: fix task state output
d6b102db217f powerpc/44x/fsp2: add missing of_node_put
5a8579005938 powerpc/book3e: Fix set_memory_x() and set_memory_nx()
f74827713955 powerpc/nohash: Fix __ptep_set_access_flags() and ptep_set_wrprotect()
6b4a3cfce497 HID: u2fzero: properly handle timeouts in usb_submit_urb
0fcb6023d149 HID: u2fzero: clarify error check and length calculations
33dcebb916a2 clk: at91: clk-master: fix prescaler logic
ffe896d043ca clk: at91: clk-master: check if div or pres is zero
5a5cd9597e7f clk: at91: sam9x60-pll: use DIV_ROUND_CLOSEST_ULL
2efda16d42bf serial: xilinx_uartps: Fix race condition causing stuck TX
d0379ee4a864 phy: Sparx5 Eth SerDes: Fix return value check in sparx5_serdes_probe()
34f5e44c8f2d phy: qcom-snps: Correct the FSEL_MASK
9999e3d71197 phy: qcom-qmp: another fix for the sc8180x PCIe definition
69cd3bdff881 phy: ti: gmii-sel: check of_get_address() for failure
ca1e04c63850 phy: qcom-qusb2: Fix a memory leak on probe
2e8175481d5a ASoC: topology: Fix stub for snd_soc_tplg_component_remove()
804732ec30ba pinctrl: equilibrium: Fix function addition in multiple groups
286ff24b0002 arm64: dts: qcom: sdm845: Fix Qualcomm crypto engine bus clock
69ec5e3509f5 arm64: dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
87201f2148f7 arm64: dts: qcom: pmi8994: Fix "eternal"->"external" typo in WLED node
59bb5796dfbe soc: qcom: apr: Add of_node_put() before return
1210a6388313 soc: qcom: rpmhpd: fix sm8350_mxc's peer domain
df84a4f71045 firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()
58d68f2a2ca1 usb: dwc3: gadget: Skip resizing EP's TX FIFO if already resized
46256f11c2cf powerpc/booke: Disable STRICT_KERNEL_RWX, DEBUG_PAGEALLOC and KFENCE
b35b82e6648e usb: dwc2: drd: reset current session before setting the new one
27903e1ffbfa usb: dwc2: drd: fix dwc2_drd_role_sw_set when clock could be disabled
bd18f99c5c78 usb: dwc2: drd: fix dwc2_force_mode call in dwc2_ovr_init
977b112946ec serial: imx: fix detach/attach of serial console
be9866f92e9c scsi: lpfc: Wait for successful restart of SLI3 adapter during host sg_reset
d17f1042be86 scsi: ufs: ufshcd-pltfrm: Fix memory leak due to probe defer
3eab21ff9f87 soundwire: bus: stop dereferencing invalid slave pointer
d1d477cf9ba2 iio: adis: do not disabe IRQs in 'adis_init()'
715a48b65984 usb: typec: STUSB160X should select REGMAP_I2C
a8409b2f07a4 iio: buffer: Fix double-free in iio_buffers_alloc_sysfs_and_mask()
96c0265e8742 soc: qcom: socinfo: add two missing PMIC IDs
1c8a9b6365ea soc: qcom: rpmhpd: Make power_on actually enable the domain
94a60d141380 ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
001b7f31f50d ASoC: cs42l42: Correct some register default values
b7e17c293ec2 ASoC: cs42l42: Always configure both ASP TX channels
0204fbf40c95 ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
210d7e34a13a ARM: dts: stm32: fix SAI sub nodes register range
85d082965af6 ARM: dts: stm32: fix STUSB1600 Type-C irq level on stm32mp15xx-dkx
c80bba28b1f9 ARM: dts: stm32: Reduce DHCOR SPI NOR frequency to 50 MHz
ecca03f758fa pinctrl: renesas: checker: Fix off-by-one bug in drive register check
547eae8d290b powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL in power10
a14e312ad42f dyndbg: make dyndbg a known cli param
88d564772486 RDMA/core: Set sgtable nents when using ib_dma_virt_map_sg()
cc7f21385c83 staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
ab206dd35148 staging: most: dim2: do not double-register the same device
f1401c37fee2 usb: musb: select GENERIC_PHY instead of depending on it
de3c7a4167c2 RDMA/mlx4: Return missed an error if device doesn't support steering
8adfc48bda62 scsi: csiostor: Uninitialized data in csio_ln_vnp_read_cbfn()
40f7932e8ca4 power: supply: max17040: fix null-ptr-deref in max17040_probe()
2225dade4147 power: supply: rt5033_battery: Change voltage values to µV
82012f8f4926 usb: gadget: hid: fix error code in do_config()
64b913c6d40a serial: 8250_dw: Drop wrong use of ACPI_PTR()
e271314bf2a2 powerpc/paravirt: correct preempt debug splat in vcpu_is_preempted()
ddd95eb01afd powerpc: fix unbalanced node refcount in check_kvm_guest()
2af070265d6e video: fbdev: chipsfb: use memset_io() instead of memset()
11644855488e powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prototype for 'create_section_mapping'
62a1c92858c1 clk: at91: check pmc node status before registering syscore ops
383008a0e009 memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe
ee65ec08d36b soc/tegra: Fix an error handling path in tegra_powergate_power_up()
2a45a76ed146 iio: st_pressure_spi: Add missing entries SPI to device ID table
6551bac0eb42 ASoC: SOF: topology: do not power down primary core during topology removal
93322efe91f2 arm: dts: omap3-gta04a4: accelerometer irq fix
7f8beede9915 driver core: Fix possible memory leak in device_link_add()
c464ab169800 scsi: pm80xx: Fix misleading log statement in pm8001_mpi_get_nvmd_resp()
8e781506a76e scsi: megaraid_sas: Fix concurrent access to ISR between IRQ polling and real interrupt
ca92b5f2ec88 scsi: ufs: core: Stop clearing UNIT ATTENTIONS
0f1efc0c0ed2 scsi: ufs: core: Fix ufshcd_probe_hba() prototype to match the definition
a1e06f92b2db power: reset: at91-reset: check properly the return value of devm_of_iomap
9a8d7bdd5b5e soundwire: debugfs: use controller id and link_id for debugfs
784bf21bb6d1 ALSA: usb-audio: Fix possible race at sync of urb completions
34862fa65cc7 ALSA: hda: Use position buffer for SKL+ again
987bfc6eb7aa ALSA: hda: Reduce udelay() at SKL+ position reporting
f624d5495cc0 iommu/dma: Fix arch_sync_dma for map
d39f447f259a iommu/dma: Fix sync_sg with swiotlb
e9d8cb8dad2d arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
6705c94d9017 iommu/mediatek: Fix out-of-range warning with clang
a7b0d0d6041c arm64: dts: renesas: beacon: Fix Ethernet PHY mode
94d42f3a174e arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
8524d9f336cc ASoC: wcd9335: Use correct version to initialize Class H
a0274b002345 pinctrl: renesas: rzg2l: Fix missing port register 21h
259a6fdd691f JFS: fix memleak in jfs_mount
f776bb118318 MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
85e7a66ceb2b scsi: dc395: Fix error case unwinding
52a994c15a9a arm64: dts: qcom: sc7280: fix display port phy reg property
15a40b9fd396 soc: qcom: llcc: Disable MMUHWT retention
b2a98348f698 arm64: dts: qcom: sc7180: Base dynamic CPU power coefficients in reality
53616b7315ee ARM: dts: at91: tse850: the emac<->phy interface is rmii
b327d92c10b2 bus: ti-sysc: Fix timekeeping_suspended warning on resume
876ba79c7969 arm64: dts: meson-sm1: Fix the pwm regulator supply properties
2b9828e4bdbc arm64: dts: meson-g12b: Fix the pwm regulator supply properties
d2bbd1ce92d2 arm64: dts: meson-g12a: Fix the pwm regulator supply properties
4def729518ec arm64: dts: ti: j7200-main: Fix "bus-range" upto 256 bus number for PCIe
7b9ab4a7e52b arm64: dts: ti: j7200-main: Fix "vendor-id"/"device-id" properties of pcie node
ef26fb3a1931 arm64: dts: ti: k3-j721e-main: Fix "bus-range" upto 256 bus number for PCIe
461a478eabea arm64: dts: ti: k3-j721e-main: Fix "max-virtual-functions" in PCIe EP nodes
13fef1930da8 RDMA/bnxt_re: Fix query SRQ failure
280ad4f332f9 ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY
6096069c91ed arm64: dts: rockchip: Fix GPU register width for RK3328
df54f16f3c05 ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
ca4e26066748 scsi: lpfc: Fix NVMe I/O failover to non-optimized path
79becd68e16e scsi: qla2xxx: edif: Use link event to wake up app
a3e165e8e779 scsi: pm80xx: Fix lockup in outbound queue management
8525028b4652 clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths
532c48310396 arm64: dts: broadcom: bcm4908: Fix UART clock name
ed1b1ab0581e ARM: dts: BCM5301X: Fix memory nodes names
d41e6c4fae29 RDMA/rxe: Fix wrong port_cap_flags
42a6f69c5aa8 iio: st_sensors: disable regulators after device unregistration
d5e4939b5e0c arm64: dts: meson: sm1: add Ethernet PHY reset line for ODROID-C4/HC4
03060aec7281 staging: r8188eu: fix memory leak in rtw_set_key
8853e04ea61d cpufreq: Fix parameter in parse_perf_domain()
2bbc554a98f9 of: unittest: fix EXPECT text for gpio hog errors
d55aca82dda6 bpf: Fix propagation of signed bounds from 64-bit min/max into 32-bit.
d03a5b00a336 bpf: Fix propagation of bounds from 64-bit min/max into 32-bit and var_off.
e3acd3a08462 cgroup: Fix rootcg cpu.stat guest double counting
c47be68b31cf skmsg: Lose offset info in sk_psock_skb_ingress
b5c69b9fb5c4 selftests: mptcp: fix proto type in link_failure tests
2c6197e7eac7 ibmvnic: delay complete()
3a208e02e9ee ibmvnic: Process crqs after enabling interrupts
fac0105a5c9f ibmvnic: don't stop queue in xmit
e619ad4e2d4c udp6: allow SO_MARK ctrl msg to affect routing
e89d244fef55 selftests/bpf: Fix fclose/pclose mismatch in test_progs
fb657a4e125d crypto: pcrypt - Delay write to padata->info
bbf7b2dbd131 selftests: net: bridge: update IGMP/MLD membership interval value
24c8fd323957 net: bridge: fix uninitialized variables when BRIDGE_CFM is disabled
e176585f054a net: phylink: avoid mvneta warning when setting pause parameters
9073b88b1b29 nfp: fix potential deadlock when canceling dim work
e9f7832a4f14 nfp: fix NULL pointer access when scheduling dim work
d6c25579a8a0 ipmi: kcs_bmc: Fix a memory leak in the error handling path of 'kcs_bmc_serio_add_device()'
e8dabc670c40 net: amd-xgbe: Toggle PLL settings during rate change
a1fafee96a7a sctp: return true only for pathmtu update in sctp_transport_pl_toobig
554153b1cd01 sctp: subtract sctphdr len in sctp_transport_pl_hlen
118eedc00644 sctp: reset probe_timer in sctp_transport_pl_update
8cebfaefcccf sctp: allow IP fragmentation when PLPMTUD enters Error state
4c51fa32f631 selftests/bpf: Fix memory leak in test_ima
844134cd097c selftests/bpf: Fix fd cleanup in sk_lookup test
e3e3c222c306 drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits
76eb97443810 drm/amdgpu: fix a potential memory leak in amdgpu_device_fini_sw()
d834f80e51d7 wcn36xx: Channel list update before hardware scan
677c9ad9839c bpf: Fixes possible race in update_prog_stats() for 32bit arches
ae1fffdf3b95 bpf: Avoid races in __bpf_prog_run() for 32bit arches
4ab36444a538 wcn36xx: Fix discarded frames due to wrong sequence number
e2e55ffee66f wcn36xx: add proper DMA memory barriers in rx path
960a216b078a libertas: Fix possible memory leak in probe and disconnect
59de456628bd libertas_tf: Fix possible memory leak in probe and disconnect
964b738fde92 KVM: s390: Fix handle_sske page fault handling
777194b87fb3 samples/kretprobes: Fix return value if register_kretprobe() failed
41c9a411aad0 spi: spi-rpc-if: Check return value of rpcif_sw_init()
ca5c67889bd6 cpufreq: intel_pstate: Fix cpu->pstate.turbo_freq initialization
4d9b7edfdcf2 tracing: Fix missing trace_boot_init_histograms kstrdup NULL checks
d3ec9c358a42 tcp: don't free a FIN sk_buff in tcp_remove_empty_skb()
d48715b25f2e libbpf: Fix endianness detection in BPF_CORE_READ_BITFIELD_PROBED()
bf5e3d54de65 tpm_tis_spi: Add missing SPI ID
bf736690bcbe tpm: fix Atmel TPM crash caused by too frequent queries
b5949ef0753b libbpf: Fix off-by-one bug in bpf_core_apply_relo()
af25dbc8460f blk-cgroup: synchronize blkg creation against policy deactivation
39581715d6e5 block: ataflop: more blk-mq refactoring fixes
6a8cd2686ec7 ath10k: fix module load regression with iram-recovery feature
a521a0ddd5aa ARM: 9142/1: kasan: work around LPAE build warning
348273847a56 net: dsa: avoid refcount warnings when ->port_{fdb,mdb}_del returns error
69abfe39c7d6 irq: mips: avoid nested irq_enter()
ca46cc192bec KVM: s390: pv: avoid stalls for kvm_s390_pv_init_vm
cb69970e0cd9 KVM: s390: pv: avoid double free of sida page
eadbd5d1ec29 s390/uv: fully validate the VMA before calling follow_page()
a9c017ab05a4 s390/mm: fix VMA and page table handling code in storage key handling functions
735d269aa767 s390/mm: validate VMA in PGSTE manipulation functions
dbeff6651f5e s390/gmap: don't unconditionally call pte_unmap_unlock() in __gmap_zap()
9d6a0e31be0c s390/gmap: validate VMA in __gmap_zap()
908e8e54ef8d mt76: mt7615: mt7622: fix ibss and meshpoint
ae2df723141f libbpf: Fix BTF header parsing checks
ffb5d239e7ed libbpf: Fix overflow in BTF sanity checks
e6c63efb0c8d bpftool: Avoid leaking the JSON writer prepared for program metadata
5d33132c03ff libbpf: Fix memory leak in btf__dedup()
32293389e84a KVM: selftests: Fix nested SVM tests when built with clang
c6293f673f2d smackfs: use netlbl_cfg_cipsov4_del() for deleting cipso_v4_doi
19bbbeb408d0 crypto: tcrypt - fix skcipher multi-buffer tests for 1420B blocks
48ae8d2243f0 drm/msm/dsi: fix wrong type in msm_dsi_host
5f88d19f0f6a drm/msm: Fix potential NULL dereference in DPU SSPP
907d34b74c64 x86/sev: Fix stack type check in vc_switch_off_ist()
3dd4b42d95a0 clocksource/drivers/timer-ti-dm: Select TIMER_OF
8f74e6d5161e PM: hibernate: fix sparse warnings
ff950ae83201 nvme-rdma: fix error code in nvme_rdma_setup_ctrl
b2cf0bed6817 nbd: Fix use-after-free in pid_show
d0fd4b3aeea6 phy: micrel: ksz8041nl: do not use power down mode
89249cd9fa1f net: enetc: unmap DMA in enetc_send_cmd()
493a9e6367a1 iwlwifi: pnvm: read EFI data only if long enough
b0b49d055533 iwlwifi: pnvm: don't kmemdup() more than we have
f2fd84b36748 iwlwifi: mvm: reset PM state on unsuccessful resume
89f000f4c9e0 mwifiex: Send DELBA requests according to spec
f5b21a4c096d rsi: stop thread firstly in rsi_91x_init() error handling
ec280de6f409 mt76: mt7915: fix muar_idx in mt7915_mcu_alloc_sta_req()
a4ab42fbe70d mt76: mt7915: fix sta_rec_wtbl tag len
439393358568 mt76: connac: fix possible NULL pointer dereference in mt76_connac_get_phy_mode_v2
1f71b42e27e1 mt76: mt7615: fix monitor mode tear down crash
68acaaf117a9 mt76: mt7921: fix retrying release semaphore without end
5a881727bb3b mt76: mt7915: fix possible infinite loop release semaphore
dba165e255db mt76: mt7615: fix hwmon temp sensor mem use-after-free
32ec365cdca6 mt76: mt7915: fix hwmon temp sensor mem use-after-free
2c9e98bca4a5 mt76: mt7921: always wake device if necessary in debugfs
8ed4d081f2eb mt76: mt7921: fix kernel warning from cfg80211_calculate_bitrate
22f41d4f2e36 mt76: mt7921: fix firmware usage of RA info using legacy rates
90ecf88cc293 mt76: mt7921: report HE MU radiotap
bf5b9c9df69c mt76: overwrite default reg_ops if necessary
30dc676d4b02 mt76: connac: fix GTK rekey offload failure on WPA mixed mode
c8c0958687c7 mt76: mt7921: fix dma hang in rmmod
2bfda0a8dc77 mt76: mt7915: fix bit fields for HT rate idx
02c474990173 mt76: mt7915: fix potential overflow of eeprom page index
7f2d2c8d9307 mt76: mt7921: Fix out of order process by invalid event pkt
75ed8ca355fb mt76: mt76x02: fix endianness warnings in mt76x02_mac.c
9fcee803e248 mt76: mt7921: fix survey-dump reporting
a7afd7a5e68d mt76: fix build error implicit enumeration conversion
21255ccf73bb mt76: connac: fix mt76_connac_gtk_rekey_tlv usage
95792d2088ea mt76: mt7915: fix info leak in mt7915_mcu_set_pre_cal()
8dea17cf36fa mt76: mt7615: fix endianness warning in mt7615_mac_write_txwi
d1c7ea995cbf mt76: mt7921: fix endianness warning in mt7921_update_txs
ef02f94e138e mt76: mt7915: fix endianness warning in mt7915_mac_add_txs_skb
90d9e4050bc3 mt76: mt7921: fix endianness in mt7921_mcu_tx_done_event
5a9bd1b941f4 drm/amdkfd: Fix an inappropriate error handling in allloc memory of gpu
1b7030b379e4 ACPI: PM: Fix sharing of wakeup power resources
453c3013a586 ACPI: PM: Turn off unused wakeup power resources
6500e7148a01 mailbox: mtk-cmdq: Fix local clock ID usage
ac2592454712 mailbox: mtk-cmdq: Validate alias_id on probe
62a0a0539da7 platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
3e6e11f8537c blk-wbt: prevent NULL pointer dereference in wb_timer_fn
456b47cacdc7 block: ataflop: fix breakage introduced at blk-mq refactoring
4eac23d60cbc io-wq: Remove duplicate code in io_workqueue_create()
c8dccb28c329 mmc: mxs-mmc: disable regulator on error and in the remove function
6eff31412bec media: ir_toy: assignment to be16 should be of correct type
13e59b7cb277 media: ivtv: fix build for UML
51911aa157ca mailbox: Remove WARN_ON for async_cb.cb in cmdq_exec_done
2a0b9ebec182 thermal/drivers/qcom/lmh: make QCOM_LMH depends on QCOM_SCM
3988164fe9dd net: stream: don't purge sk_error_queue in sk_stream_kill_queues()
fbc24df3a5f6 drm/msm: uninitialized variable in msm_gem_import()
3464103cf485 drm/msm: fix potential NULL dereference in cleanup
cbbe14644798 drm/msm: unlock on error in get_sched_entity()
de99b40b93ac drm/msm: potential error pointer dereference in init()
c14f0035476f drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
dafe75a9a6dc drm/msm/dsi: do not enable irq handler before powering up the host
3f25451eae28 thermal/core: fix a UAF bug in __thermal_cooling_device_register()
b208436e229b crypto: octeontx2 - set assoclen in aead_do_fallback()
300ae3a5e884 tcp: switch orphan_count to bare per-cpu counters
cae022f91174 net: tulip: winbond-840: fix build for UML
be060f47ef38 net: intel: igc_ptp: fix build for UML
2fa75b667335 net: fealnx: fix build for UML
3869eecf0504 kernel/sched: Fix sched_fork() access an invalid sched_task_group
d719ff1151c7 ath10k: fix max antenna gain unit
dd0fe5985b0a hwmon: (pmbus/lm25066) Let compiler determine outer dimension of lm25066_coeff
b275c71a7b70 hwmon: Fix possible memleak in __hwmon_device_register()
9531d477589d net, neigh: Fix NTF_EXT_LEARNED in combination with NTF_USE
dacdfe7870ae memstick: jmb38x_ms: use appropriate free function in jmb38x_ms_alloc_host()
3d78b5b1ce01 memstick: avoid out-of-range warning
5b9c76df7ff0 mmc: sdhci-omap: Fix context restore
e28a1a0a412a mmc: sdhci-omap: Fix NULL pointer exception if regulator is not configured
6b084516fbc3 gve: Track RX buffer allocation failures
fd2c9032b88c gve: Recover from queue stall due to missed IRQ
e5be2a62567f b43: fix a lower bounds test
c9179a2da18c b43legacy: fix a lower bounds test
4bef6e617dbc ima: fix deadlock when traversing "ima_default_rules".
594a893df55d hwrng: mtk - Force runtime pm ops for sleep ops
51dbedbf08e0 crypto: qat - disregard spurious PFVF interrupts
d0536282842a crypto: qat - detect PFVF collision after ACK
b2805fb00de5 crypto: ccree - avoid out-of-range warnings from clang
0535d3506378 media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()
a117b767084d media: venus: fix vpp frequency calculation for decoder
3ad069d68eea netfilter: nft_dynset: relax superfluous check on set updates
d846b69dc7ff rcu: Fix rcu_dynticks_curr_cpu_in_eqs() vs noinstr
fa1af3cb0e47 rcu: Always inline rcu_dynticks_task*_{enter,exit}()
d0b693aa948b EDAC/amd64: Handle three rank interleaving mode
3357b8a431b3 x86/insn: Use get_unaligned() instead of memcpy()
3c38c852c0ac PM: EM: Fix inefficient states detection
a8f0c3c39e26 ath9k: Fix potential interrupt storm on queue reset
428199299910 ath10k: Don't always treat modem stop events as crashes
ff3487b08949 media: em28xx: Don't use ops->suspend if it is NULL
b9a0ff08a69e cpuidle: Fix kobject memory leaks in error paths
c95380ba527a drm: fb_helper: fix CONFIG_FB dependency
a213407573c6 crypto: ecc - fix CRYPTO_DEFAULT_RNG dependency
af18fe767136 kprobes: Do not use local variable when creating debugfs file
69dce456e2be scs: Release kasan vmalloc poison in scs_free process
43cfb5df9289 media: atmel: fix the ispck initialization
ead5a141ea22 media: cx23885: Fix snd_card_free call on null card pointer
5a225627ba4a media: tm6000: Avoid card name truncation
afa370b5316f media: si470x: Avoid card name truncation
ccd29579f7e7 media: radio-wl1273: Avoid card name truncation
0fd64cd9ffde media: sun6i-csi: Allow the video device to be open multiple times
e44fa27c650f media: i2c: ths8200 needs V4L2_ASYNC
7b0b7b8a2ba5 media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
56bc844703f0 media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
4a2ab1ce79ba media: TDA1997x: handle short reads of hdmi info frame.
e7f187649c24 media: mtk-vcodec: venc: fix return value when start_streaming fails
4f0ea72e4a34 media: v4l2-ioctl: S_CTRL output the right value
9e14a3d9f768 media: imx258: Fix getting clock frequency
d30d3397db1e media: dvb-usb: fix ununit-value in az6027_rc_query
98cb3a055b18 media: ttusb-dec: avoid release of non-acquired mutex
f8b2ae89671d media: cxd2880-spi: Fix a null pointer dereference on error handling path
b6100e16716e media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'
2899243f272f media: em28xx: add missing em28xx_close_extension
e6a908c5935d libbpf: Fix skel_internal.h to set errno on loader retval < 0
798419802590 drm/amdgpu: fix warning for overflow check
09732e205684 arm64: mm: update max_pfn after memory hotplug
410a0f42ced0 drm/ttm: stop calling tt_swapin in vm_access
092e6cb650eb ath10k: sdio: Add missing BH locking around napi_schdule()
63287a77b138 ath10k: Fix missing frame timestamp for beacon/probe-resp
cef58d2c3466 gve: DQO: avoid unused variable warnings
9b955d5d6038 ath11k: Fix memory leak in ath11k_qmi_driver_event_work
f3ccc878b5fb ath11k: fix packet drops due to incorrect 6 GHz freq value in rx status
3b087c2fc0d7 ath11k: Avoid race during regd updates
9b59c76797e6 ath11k: fix some sleeping in atomic bugs
e1ddaa5dcef6 bpf/tests: Fix error in tail call limit tests
739b92765e04 net: dsa: rtl8366: Fix a bug in deleting VLANs
57e4d980b7fe net: dsa: rtl8366rb: Fix off-by-one bug
9cc25e8529d5 net/mlx5: Accept devlink user input after driver initialization complete
cfaf70338314 cfg80211: always free wiphy specific regdomain
6adf16c2e5a2 mac80211: twt: don't use potentially unaligned pointer
80adbd8c4502 fortify: Fix dropped strcpy() compile-time write overflow check
c9f95c678318 mptcp: do not shrink snd_nxt when recovering
eade470b4351 rxrpc: Fix _usecs_to_jiffies() by using usecs_to_jiffies()
9fcd75ee9159 qed: Don't ignore devlink allocation failures
af484a1cde06 bnxt_en: Check devlink allocation and registration status
e4ecf64c0d10 Bluetooth: hci_h5: Fix (runtime)suspend issues on RTL8723BS HCIs
56dc06554516 crypto: qat - power up 4xxx device
891fec9f116c crypto: caam - disable pkc for non-E SoCs
adce47a6405c drm/amdgpu: move amdgpu_virt_release_full_gpu to fini_early stage
63c1435cab9b drm/amd/display: Pass display_pipe_params_st as const in DML
24b4d7102125 drm/amdgpu: Fix crash on device remove/driver unload
5481612c471f Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync
7bcbced2534b wilc1000: fix possible memory leak in cfg_scan_result()
2c4415e819f1 wcn36xx: Fix Antenna Diversity Switching
26d3bf38ae3e cgroup: Make rebind_subsystems() disable v2 controllers all at once
3409f88809a6 spi: Fixed division by zero warning
bc79831b426b drm: bridge: it66121: Fix return value it66121_probe
1a1028f89646 net: phylink: don't call netif_carrier_off() with NULL netdev
02113c83f405 net: net_namespace: Fix undefined member in key_remove_domain()
c401830b0125 lockdep: Let lock_is_held_type() detect recursive read as read
255c569eeb46 virtio-gpu: fix possible memory allocation failure
a496b7090881 crypto: sm4 - Do not change section of ck and sbox
41cfb139c36c drm/v3d: fix wait for TMU write combiner flush
0a97e2fb9690 net/mlx5: Publish and unpublish all devlink parameters at once
d9b17a030a1b objtool: Handle __sanitize_cov*() tail calls
c8a2b96d755c x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
e6e4b75f977e MIPS: lantiq: dma: fix burst length for DEU
4a9334d04ba6 rcu: Fix existing exp request check in sync_sched_exp_online_cleanup()
3998e06d9511 Bluetooth: hci_uart: fix GPF in h5_recv
9fc04208643f libbpf: Don't crash on object files with no symbol tables
11080de0a75c Bluetooth: fix init and cleanup of sco_conn.timeout_work
5f14a2c4648c drm/bridge: it66121: Wait for next bridge to be probed
3c1ccfcae8a9 drm/bridge: it66121: Initialize {device,vendor}_ids
848df133cc42 perf/x86/intel/uncore: Fix Intel SPR M3UPI event constraints
a4a2da864e2a perf/x86/intel/uncore: Fix Intel SPR M2PCIE event constraints
ced11c1b40ca perf/x86/intel/uncore: Fix Intel SPR IIO event constraints
cdba93ecbbd2 perf/x86/intel/uncore: Fix Intel SPR CHA event constraints
5a31df7d0f9f drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()
e3b39825ed08 fbdev/efifb: Release PCI device's runtime PM ref during FB destroy
8085f032541b selftests/bpf: Fix strobemeta selftest regression
6c7a147b876a netfilter: conntrack: set on IPS_ASSURED if flows enters internal stream state
ad04ebbe715c parisc/kgdb: add kgdb_roundup() to make kgdb work with idle polling
028459fab9a6 parisc/unwind: fix unwinder when CONFIG_64BIT is enabled
ab7ce95a04d6 erofs: don't trigger WARN() when decompression fails
f6ca0ac23202 task_stack: Fix end_of_stack() for architectures with upwards-growing stack
3b935cca35e4 parisc: fix warning in flush_tlb_all
ec6ceae80a42 perf/x86/intel: Fix ICL/SPR INST_RETIRED.PREC_DIST encodings
d0f6689591df selftests/core: fix conflicting types compile error for close_range()
116b6202b29a drm/amd/display: dcn20_resource_construct reduce scope of FPU enabled
ed515eea7701 x86/hyperv: Protect set_hv_tscchange_cb() against getting preempted
0f421e257e49 inet: remove races in inet{6}_getname()
b58be9a0495f ftrace: do CPU checking after preemption disabled
e24f9679c3c0 Revert "wcn36xx: Enable firmware link monitoring"
194e8d7ad91f wcn36xx: Fix packet drop on resume
397fec25850c wcn36xx: Correct band/freq reporting on RX
51421f89b909 spi: bcm-qspi: Fix missing clk_disable_unprepare() on error in bcm_qspi_probe()
6039fcd85896 btrfs: do not take the uuid_mutex in btrfs_rm_device
bfc4788e4481 btrfs: reflink: initialize return value to 0 in btrfs_extent_same()
91f8e91d93ce ACPI: resources: Add one more Medion model in IRQ override quirk
59f3feb05cfd ACPI: AC: Quirk GK45 to skip reading _PSR
0914663ac127 net: annotate data-race in neigh_output()
c90eb23eb709 vrf: run conntrack only in context of lower/physdev for locally generated packets
85a1da3d7a84 tools/latency-collector: Use correct size when writing queue_full_warning
0db6161eacda ARM: 9136/1: ARMv7-M uses BE-8, not BE-32
d2ab6689ed0d gfs2: Fix glock_hash_walk bugs
e10e8f490d6e gfs2: Cancel remote delete work asynchronously
af6f6ff3a78c can: bittiming: can_fixup_bittiming(): change type of tseg1 and alltseg to unsigned int
7b697bb86020 gre/sit: Don't generate link-local addr if addr_gen_mode is IN6_ADDR_GEN_MODE_NONE
7d341b27013e ARM: clang: Do not rely on lr register for stacktrace
7f11e51f0c9d smackfs: use __GFP_NOFAIL for smk_cipso_doi()
b94d32876378 iwlwifi: mvm: disable RX-diversity in powersave
c430f6255375 selftests/bpf: Fix perf_buffer test on system with offline cpus
19074f05307b selftests: kvm: fix mismatched fclose() after popen()
df0b6862b795 PM: hibernate: Get block device exclusively in swsusp_check()
77aa339ea59f arm64: vdso32: suppress error message for 'make mrproper'
3d890ac58a85 samples/bpf: Fix application of sizeof to pointer
54718ee9b8ee nvme: drop scan_lock and always kick requeue list when removing namespaces
0703920365d3 nvmet-tcp: fix use-after-free when a port is removed
3c82292ee9bc nvmet-rdma: fix use-after-free when a port is removed
e3d5ebee9c05 nvmet: fix use-after-free when a port is removed
1e7edd183481 drm/amdgpu/pm: properly handle sclk for profiling modes on vangogh
451be8bcdc17 media: allegro: ignore interrupt if mailbox is not initialized
a3d08aae1805 block: remove inaccurate requeue check
22d5a9add83b iwlwifi: change all JnP to NO-160 configuration
819efcac7c3c mwl8k: Fix use-after-free in mwl8k_fw_state_machine()
1c794f4b483a mt76: mt7915: fix an off-by-one bound check
84afcec2ca5a tracing/cfi: Fix cmp_entries_* functions signature mismatch
b09a201b714d workqueue: make sysfs of unbound kworker cpumask more clever
0b1a4d0ff911 lib/xz: Validate the value before assigning it to an enum variable
5329376ce6ae lib/xz: Avoid overlapping memcpy() with invalid input with in-place decompression
562d350a8809 locking/rwsem: Disable preemption for spinning region
e5d5e5317150 memstick: r592: Fix a UAF bug when removing the driver
9fff6457afad md: update superblock after changing rdev flags in state_store
22b68b015d44 floppy: fix calling platform_device_unregister() on invalid drives
396c9e834d69 block: bump max plugged deferred size from 16 to 32
3792174592b6 thermal/drivers/tsens: Add timeout to get_temp_tsens_valid
660446ff86ca drm/msm: prevent NULL dereference in msm_gpu_crashstate_capture()
38ef472ca8e5 thermal/core: Fix null pointer dereference in thermal_release()
7c0caa7e2636 leaking_addresses: Always print a trailing newline
9796eb9137b3 net: phy: micrel: make *-skew-ps check more lenient
abbc58deaab6 drm/amdkfd: fix resume error when iommu disabled in Picasso
5837c23f7ddd drm/amd/display: fix null pointer deref when plugging in display
cfc1a472a8d8 ACPI: scan: Release PM resources blocked by unused objects
37f2aebf1656 ACPI: battery: Accept charges over the design capacity as full
c45c83c1716f iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
d78de051ff32 mmc: moxart: Fix reference count leaks in moxart_probe
e41d46fe0954 KVM: arm64: Propagate errors from __pkvm_prot_finalize hypercall
dd267d35d82a ath: dfs_pattern_detector: Fix possible null-pointer dereference in channel_detector_create()
4e4f6e33d6f2 tracing: Disable "other" permission bits in the tracefs files
1067f23c1ee7 tracefs: Have tracefs directories not set OTH permission bits by default
5425f404b527 drm/amdkfd: rm BO resv on validation to avoid deadlock
b3aa4e54add8 net-sysfs: try not to restart the syscall if it will fail eventually
74339549c8dc media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
688ac68a23d4 media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
eb795fd959ac media: ipu3-imgu: imgu_fmt: Handle properly try
4c2a4bad39e1 media: imx-jpeg: Fix possible null pointer dereference
a56e9d7609ee ice: Move devlink port to PF/VF struct
9053ab4dfc1b cpufreq: Make policy min/max hard requirements
e8e98aa12411 ACPICA: Avoid evaluating methods too early during system resume
5fc13c5d43f5 kselftests/sched: cleanup the child processes
a803c35d0b38 fs/proc/uptime.c: Fix idle time reporting in /proc/uptime
8c379a77ae33 ipmi: Disable some operations during a panic
60cbd3e635f0 media: rcar-csi2: Add checking to rcsi2_start_receiver()
77da4492ad93 brcmfmac: Add DMI nvram filename quirk for Cyberbook T116 tablet
f25c2738d68a rtw88: fix RX clock gate setting while fifo dump
7ea446e3363e ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
5b55e15b6636 media: mceusb: return without resubmitting URB in case of -EPROTO error.
51ae7f962672 media: rcar-vin: Use user provided buffers when starting
88dcc2d14960 media: imx: set a media_device bus_info string
e922d0b6e6a6 media: videobuf2: rework vb2_mem_ops API
cdf5c3f84607 media: s5p-mfc: Add checking to s5p_mfc_probe().
bb2cb679699e media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
2bd28fe587a5 media: vidtv: Fix memory leak in remove
18c4e5e59f82 media: uvcvideo: Set unique vdev name based in type
477f767b9472 media: uvcvideo: Return -EIO for control errors
7c2695613989 media: uvcvideo: Set capability in s_param
673ce2812ed4 media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
25bde3ba1a34 media: atomisp: Fix error handling in probe
f92948e1e25a media: netup_unidvb: handle interrupt properly according to the firmware
944fc4717321 media: mt9p031: Fix corrupted frame after restarting stream
1a0e5b13f907 octeontx2-pf: Enable promisc/allmulti match MCAM entries.
26fcf9347ab4 ath10k: high latency fixes for beacon buffer
20e8a4f26534 ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when map reinjected packets
163189aa6e44 ath11k: add handler for scan event WMI_SCAN_EVENT_DEQUEUED
8ea518dfa39b ath11k: Avoid reg rules update during firmware recovery
72d43bc26938 selftests: net: fib_nexthops: Wait before checking reported idle time
678e8cd1bf22 drm/amd/display: Fix null pointer dereference for encoders
351601af203d drm/amdgpu: Fix MMIO access page fault
9630d4d0d14d fscrypt: allow 256-bit master keys with AES-256-XTS
d6509627e06f spi: Check we have a spi_device_id for each DT compatible
33d2d8a12f8d mwifiex: Properly initialize private structure on interface type changes
bcf47459ee7b mwifiex: Run SET_BSS_MODE when changing from P2P to STATION vif-type
7251782df85f x86: Increase exception stack sizes
a5a43cde6601 x86/mm/64: Improve stack overflow warnings
347f35130e4e crypto: aesni - check walk.nbytes instead of err
53aad1ad0e69 ath11k: Align bss_chan_info structure with firmware
4e246ca955ca smackfs: Fix use-after-free in netlbl_catmap_walk()
f85b0fe504ac rcu-tasks: Move RTGS_WAIT_CBS to beginning of rcu_tasks_kthread() loop
e36b7768aad6 ACPI: resources: Add DMI-based legacy IRQ override quirk
ae11b215aef8 net: sched: update default qdisc visibility after Tx queue cnt changes
d120d005b96f locking/lockdep: Avoid RCU-induced noinstr fail
a244da298418 MIPS: lantiq: dma: reset correct number of channel
6a5b3f5dfb02 MIPS: lantiq: dma: add small delay after reset
55bf61828ab3 drm/amdgpu: move iommu_resume before ip init/resume
36bd10013bdf platform/x86: wmi: do not fail if disabling fails
9508ee70d138 rcutorture: Avoid problematic critical section nesting on PREEMPT_RT
f3135fa42b0f drm/panel-orientation-quirks: add Valve Steam Deck
a05a18cfbf9f Bluetooth: call sock_hold earlier in sco_conn_del
7e22e4db95b0 Bluetooth: fix use-after-free error in lock_sock_nested()
b990c219c4c9 Bluetooth: sco: Fix lock_sock() blockage by memcpy_from_msg()
8815bbe712f3 drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book 10.6
4fe898b1ec8d drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-in-1
c9795f6bf0eb drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (v2)
8ff10b430ca0 dma-buf: WARN on dmabuf release with pending attachments
061a8677ab37 component: do not leave master devres group open after bind
4c264dfbb6a4 power: supply: max17042_battery: Clear status bits in interrupt handler
fc49ca4dbae1 USB: chipidea: fix interrupt deadlock
273a85ac422d USB: iowarrior: fix control-message timeouts
2fbf746092c2 most: fix control-message timeouts
8b09d36daf47 Revert "serial: 8250: Fix reporting real baudrate value in c_ospeed field"
02981a96642f serial: 8250: Fix reporting real baudrate value in c_ospeed field
670f1f30ed70 io-wq: serialize hash clear with wakeup
5bfa57795dc1 ksmbd: set unique value to volume serial field in FS_VOLUME_INFORMATION
15e904c14951 serial: 8250: fix racy uartclk update
cefb16b7b2d5 USB: serial: keyspan: fix memleak on probe errors
309d6b5d45c9 Documentation:devicetree:bindings:iio:dac: Fix val
df56942798c4 iio: ad5770r: make devicetree property reading consistent
a92d075cb4b5 iio: dac: ad5446: Fix ad5622_write() return value
bd297200b747 drivers: iio: dac: ad5766: Fix dt property name
c32c68ac7ba1 iio: buffer: Fix memory leak in iio_buffer_register_legacy_sysfs_groups()
289884de9ff6 iio: buffer: Fix memory leak in __iio_buffer_alloc_sysfs_and_mask()
b6444e89525d iio: buffer: Fix memory leak in iio_buffers_alloc_sysfs_and_mask()
d7652924a132 iio: buffer: check return value of kstrdup_const()
1c531289b74e coresight: trbe: Defer the probe on offline CPUs
ea64104287cb coresight: trbe: Fix incorrect access of the sink specific data
d27fc5ba46fc coresight: cti: Correct the parameter for pm_runtime_put
76d6bf233c7e pinctrl: core: fix possible memory leak in pinctrl_enable()
eb4102bb3821 mfd: simple-mfd-i2c: Select MFD_CORE to fix build error
63dc291ab5e0 cifs: set a minimum of 120s for next dns resolution
1c35a216ef77 cifs: To match file servers, make sure the server hostname matches
120d9dca7d51 quota: correct error number in free_dqentry()
332db0909293 quota: check block number when reading the block in quota file
ddfea4b7d13b PCI: aardvark: Fix support for PCI_ROM_ADDRESS1 on emulated bridge
7c7ebe1ec81f PCI: aardvark: Set PCI Bridge Class Code to PCI Bridge
19a6b2b2f0fe PCI: aardvark: Fix support for PCI_BRIDGE_CTL_BUS_RESET on emulated bridge
25540fbe7858 PCI: aardvark: Fix support for bus mastering and PCI_COMMAND on emulated bridge
7aaf8585eebc PCI: aardvark: Read all 16-bits from PCIE_MSI_PAYLOAD_REG
ce44e532b96e PCI: aardvark: Fix return value of MSI domain .alloc() method
643a20110083 PCI: aardvark: Fix configuring Reference clock
39579eb4f1f8 PCI: aardvark: Fix reporting Data Link Layer Link Active
9cb9b2bb7ab6 PCI: aardvark: Do not unmask unused interrupts
2c6b530a0e3c PCI: aardvark: Fix checking for link up via LTSSM state
da478902acec PCI: aardvark: Do not clear status bits of masked interrupts
39c5465c3639 cxl/pci: Fix NULL vs ERR_PTR confusion
afa7885b56e8 PCI: cadence: Add cdns_plat_pcie_probe() missing return
228028b01dab PCI: pci-bridge-emul: Fix emulation of W1C bits
5cffa333a2b2 ovl: fix filattr copy-up failure
2f372e38f572 ovl: fix use after free in struct ovl_aio_req
90817d78388c xen/balloon: add late_initcall_sync() for initial ballooning done
013fa93c79bd ifb: fix building without CONFIG_NET_CLS_ACT
ea531d52fa08 serial: core: Fix initializing and restoring termios speed
34c2a0d0a70a ring-buffer: Protect ring_buffer_reset() from reentrancy
4cac487a4730 io_uring: honour zeroes as io-wq worker limits
e1bb995036c7 powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
e4b49c3f9d58 iio: adc: tsc2046: fix scan interval warning
24d8a24f5641 can: j1939: j1939_tp_cmd_recv(): check the dst address of TP.CM_BAM
e35f3d74bf06 can: j1939: j1939_can_recv(): ignore messages with invalid source address
d1be2ab08354 can: j1939: j1939_tp_cmd_recv(): ignore abort message in the BAM transport
0c10d5d39563 can: mcp251xfd: mcp251xfd_irq(): add missing can_rx_offload_threaded_irq_finish() in case of bus off
dac06227e1a3 can: peak_usb: always ask for BERR reporting for PCAN-USB devices
df093c18bdb1 KVM: nVMX: Handle dynamic MSR intercept toggling
c98d5e42be2c KVM: nVMX: Query current VMCS when determining if MSR bitmaps are in use
35da6d291aca KVM: x86: Add helper to consolidate core logic of SET_CPUID{2} flows
9d12bf19b278 KVM: x86: Fix recording of guest steal time / preempted status
23e989b977e0 KVM: arm64: Extract ESR_ELx.EC only
1ff8dae30188 iio: core: check return value when calling dev_set_name()
91410e2a28ac iio: core: fix double free in iio_device_unregister_sysfs()
4ee77bdef8e4 power: supply: max17042_battery: use VFSOC for capacity when no rsns
165ca6e8ac5b power: supply: max17042_battery: Prevent int underflow in set_soc_threshold
aaf0562f7147 mctp: handle the struct sockaddr_mctp padding fields
22584cf24a51 mtd: rawnand: socrates: Keep the driver compatible with on-die ECC engines
b523b232e46a soc: fsl: dpio: use the combined functions to protect critical zone
e7c39e85f184 soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
22c84fe73e64 soc: samsung: exynos-pmu: Fix compilation when nothing selects CONFIG_MFD_CORE
82d43437f88c signal: Add SA_IMMUTABLE to ensure forced siganls do not get changed
e87f4856a2c4 signal/mips: Update (_save|_restore)_fp_context to fail with -EFAULT
9098de58b6d9 memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
4a2aba3252e8 signal: Remove the bogus sigkill_pending in ptrace_stop
b6a38dd58e4d ASoC: tegra: Restore AC97 support
0ed4b15a50fb ASoC: tegra: Set default card name for Trimslice
5f0d86c4fd2e RDMA/qedr: Fix NULL deref for query_qp on the GSI QP
8c0abfa673a7 perf/x86/intel/uncore: Fix Intel ICX IIO event constraints
54cabed24b73 perf/x86/intel/uncore: Fix invalid unit check
398318fb96c8 perf/x86/intel/uncore: Support extra IMC channel on Ice Lake server
a71f98f1b7a4 rsi: Fix module dev_oper_mode parameter description
a72ebbbc0f4f rsi: fix rate mask set leading to P2P failure
a23cb5f914e1 rsi: fix key enabled check causing unwanted encryption for vap_id > 0
d63343e5aa17 rsi: fix occasional initialisation failure with BT coex
60cbc288f8f3 wcn36xx: handle connection loss indication
4a41c6373c38 dma-buf: fix and rework dma_buf_poll v7
d5e659a7a6cb libata: fix checking of DMA state
023d9d9e74d6 mwifiex: Try waking the firmware until we get an interrupt
5240b74b3fe1 mwifiex: Read a PCI register after writing the TX ring write pointer
c8e31bfb3556 PM: sleep: Do not let "syscore" devices runtime-suspend during system transitions
3883dbfcce48 wcn36xx: Fix (QoS) null data frame bitrate/modulation
bfe4950d90e2 wcn36xx: Fix tx_status mechanism
7fc610c422c1 wcn36xx: Fix HT40 capability for 2Ghz band
2c7f6d6154c4 HID: surface-hid: Allow driver matching for target ID 1 devices
31d61c42f116 HID: surface-hid: Use correct event registry for managing HID events
37200a451d7e mt76: mt7615: fix skb use-after-free on mac reset
bc1e276eea3d platform/surface: aggregator_registry: Add support for Surface Laptop Studio
e094a99911da ifb: Depend on netfilter alternatively to tc
11b37df34aa8 evm: mark evm_fixmode as __ro_after_init
364b9bf060f9 rtl8187: fix control-message timeouts
422cef790448 PCI: Mark Atheros QCA6174 to avoid bus reset
003ec78e77fc ath10k: fix division by zero in send path
ee8f6a4b4080 ath10k: fix control-message timeout
eb7c750c3d85 ath6kl: fix control-message timeout
0d52fb54f0cf ath6kl: fix division by zero in send path
d52b152a1f4a mwifiex: fix division by zero in fw download path
54d7dd169745 EDAC/sb_edac: Fix top-of-high-memory value for Broadwell/Haswell
79f21b74070b regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
e61d145a0825 regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
c4ffc1e0df1f hwmon: (pmbus/lm25066) Add offset coefficients
3c0049a01b21 md/raid1: only allocate write behind bio for WriteMostly device
805d775fe6bc ipmi:watchdog: Set panic count to proper value on a panic
dcfba4896069 selinux: fix race condition when computing ocontext SIDs
5ae00ac03dd7 ia64: kprobes: Fix to pass correct trampoline address to the handler
0e47821087de KVM: PPC: Tick accounting should defer vtime accounting 'til after IRQ handling
df4d4868d164 KVM: VMX: Unregister posted interrupt wakeup handler on hardware unsetup
7a8f76177494 KVM: x86/mmu: Drop a redundant, broken remote TLB flush
aba42e1ab188 btrfs: call btrfs_check_rw_degradable only if there is a missing device
1084e628b8c5 btrfs: fix lost error handling when replaying directory deletes
e94f785f6ef4 btrfs: clear MISSING device status bit in btrfs_close_one_device
5742269ad0cd x86/iopl: Fake iopl(3) CLI/STI usage
dead44f5c5a0 x86/irq: Ensure PI wakeup handler is unregistered before module unload
e90c6b8fe3b4 x86/cpu: Fix migration safety with X86_BUG_NULL_SEL
f75068bc6796 x86/sme: Use #define USE_EARLY_PGTABLE_L5 in mem_encrypt_identity.c
729bcb4c92ca fuse: fix page stealing
2cc2e56d9042 ext4: refresh the ext4_ext_path struct after dropping i_data_sem.
4e33566bb00a ext4: ensure enough credits in ext4_ext_shift_path_extents
b5be67d04989 ext4: fix lazy initialization next schedule time computation in more granular unit
46fd62b26822 Revert "ext4: enforce buffer head state assertion in ext4_da_map_blocks"
d90b9f87968a ALSA: timer: Unconditionally unlink slave instances, too
e1bcad600319 ALSA: timer: Fix use-after-free problem
47047ae0b779 ALSA: PCM: Fix NULL dereference at mmap checks
b9d4a8993500 ALSA: pci: rme: Fix unaligned buffer addresses
9a520938980b ALSA: synth: missing check for possible NULL after the call to kstrdup
b875f9be6275 ALSA: hda: Free card instance properly at probe errors
c2f07b0d171d ALSA: usb-audio: Add registration quirk for JBL Quantum 400
62448b6a73d0 ALSA: usb-audio: Line6 HX-Stomp XL USB_ID for 48k-fixed quirk
41714a17a217 ALSA: mixer: fix deadlock in snd_mixer_oss_set_volume
b13a4908f4b5 ALSA: mixer: oss: Fix racy access to slots
46a2315ac327 ALSA: line6: fix control and interrupt message timeouts
cb104cd727d9 ALSA: 6fire: fix control and bulk message timeouts
8b86a54e00c2 ALSA: ua101: fix division by zero at probe
2b752ce22112 ALSA: hda/realtek: Add quirk for HP EliteBook 840 G7 mute LED
0b898ef1050d ALSA: hda/realtek: Add quirk for ASUS UX550VE
17c69c4f7f09 ALSA: hda/realtek: Add a quirk for Acer Spin SP513-54N
a2ea7dec7785 ALSA: hda/realtek: Headset fixup for Clevo NH77HJQ
6cd2cfd09f50 ALSA: hda/realtek: Add quirk for Clevo PC70HS
af31cffa09b7 ALSA: hda/realtek: Add a quirk for HP OMEN 15 mute LED
13c4f0e731e7 ALSA: hda/realtek: Fix mic mute LED for the HP Spectre x360 14
00845427c47d media: v4l2-ioctl: Fix check_ext_ctrls
7cfad3f87d80 media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
9e37e1cad5b0 media: rkvdec: Support dynamic resolution changes
2837d7277ea1 media: ite-cir: IR receiver stop working after receive overflow
09cca6f81dd1 media: rkvdec: Do not override sizeimage for output format
2a50d9fe9227 crypto: s5p-sss - Add error handling in s5p_aes_probe()
4a3ef4d6d330 firmware/psci: fix application of sizeof to pointer
d4efa4181ddf tpm: Check for integer overflow in tpm2_map_response_body()
c41492ee2014 parisc: Fix ptrace check on syscall return
9a5125dcb045 parisc: Fix set_fixmap() on PA1.x CPUs
7887fea0c0d4 io-wq: remove worker to owner tw dependency
e119d7ef5f92 exfat: fix incorrect loading of i_blocks for large files
aa0b015e87a8 mmc: dw_mmc: Dont wait for DRTO on Write RSP error
20af47eb7fd3 mmc: mtk-sd: Add wait dma stop done flow
3cddf1f7f7b5 char: xillybus: fix msg_ep UAF in xillyusb_probe()
d1c687148ed5 ce/gf100: fix incorrect CE0 address calculation on some GPUs
c07179037bcc scsi: qla2xxx: Fix use after free in eh_abort path
eb722507fb2c scsi: qla2xxx: Fix kernel crash when accessing port_speed sysfs file
eafa65575e6f scsi: qla2xxx: Fix crash in NVMe abort path
0bb97f2486ce scsi: lpfc: Fix FCP I/O flush functionality for TMF routines
bea230d0b26c scsi: lpfc: Don't release final kref on Fport node while ABTS outstanding
cd816d01efae scsi: core: Remove command size deduction from scsi_setup_scsi_cmnd()
005838becc27 scsi: core: Avoid leaving shost->last_reset with stale value if EH does not run
baf27c15ee89 scsi: scsi_ioctl: Validate command size
9dd45bf24027 ocfs2: fix data corruption on truncate
7d96493bd585 libata: fix read log timeout value
82e2f47f26a2 Input: i8042 - Add quirk for Fujitsu Lifebook T725
4f43e1c69280 Input: elantench - fix misreporting trackpoint coordinates
6655277462f3 Input: iforce - fix control-message timeout
eb86e9884f29 usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform
5a71fa1a1025 xhci: Fix USB 3.1 enumeration issues by increasing roothub power-on-good delay

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d5c11b8d33..44258b5a2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ada3579e989bfe75d8598ab993347157dc4611c2"
-SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
+SRCREV_machine ?= "bbc84107a92f0ac6e4eb0ba4f00598d0e826626e"
+SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.2"
+LINUX_VERSION ?= "5.15.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 49e74252e9..c8575eb51a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.2"
+LINUX_VERSION ?= "5.15.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0daad4eb78782be97ce4d91f2d455ccc2d238991"
-SRCREV_machine ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
+SRCREV_machine:qemuarm ?= "9e5e6538682b203a78dfb488b406721b0ade6696"
+SRCREV_machine ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 51259617a7..78cd45fc20 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e185d8ca70e102b1f99736b15f5e8ee1ab62d081"
-SRCREV_machine:qemuarm64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemumips ?= "51982f22cf688d426ae919380cb19fcde3cd0d1a"
-SRCREV_machine:qemuppc ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemuriscv64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemuriscv32 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemux86 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemux86-64 ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_machine:qemumips64 ?= "95b7f92bb1eec8532be3a5e50726a0643ab2fae9"
-SRCREV_machine ?= "a81c52f3e09edca72d2b3da6cbab5d17769fa8cb"
-SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
+SRCREV_machine:qemuarm ?= "f26f14bca6435aace2b2415724d2169864adc35d"
+SRCREV_machine:qemuarm64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemumips ?= "63867040ed5f6e51e1fbf380ff5cfce253672fc4"
+SRCREV_machine:qemuppc ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemuriscv64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemuriscv32 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemux86 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemux86-64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_machine:qemumips64 ?= "0872b063d6908a38ae8bc5a5be1f2ab9177b32b5"
+SRCREV_machine ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
+SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "e3682eb8fe7512597c75b009f51027534ab2f58d"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "7cc36c3e14ae0af800a3a5d20cb17d0c168fc956"
+SRCREV_machine:class-devupstream ?= "f00712e27083550be3031099b7697925533a6e01"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.2"
+LINUX_VERSION ?= "5.15.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

