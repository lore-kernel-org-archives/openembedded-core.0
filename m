X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 15/20] linux-yocto/5.10: update to v5.10.82
Date: Mon, 13 Dec 2021 12:17:14 +0800
Message-Id: <49bbcfcae6e1f5e0692ea9ffd96293eaf7a462b0.1639365111.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

d5259a9ba699 Linux 5.10.82
d35250ec5a23 Revert "perf: Rework perf_event_exit_event()"
6718f79c40fd ALSA: hda: hdac_stream: fix potential locking issue in snd_hdac_stream_assign()
f751fb54f2bc ALSA: hda: hdac_ext_stream: fix potential locking issues
b3ef5051a758 x86/Kconfig: Fix an unused variable error in dell-smm-hwmon
2ec78af152e9 btrfs: update device path inode time instead of bd_inode
9febc9d8d2b4 fs: export an inode_update_time helper
cade5d7a2803 ice: Delete always true check of PF pointer
fe65cecd2758 usb: max-3421: Use driver data instead of maintaining a list of bound devices
6186c7b9bdfc ASoC: DAPM: Cover regression by kctl change notification fix
b17dd53cac76 selinux: fix NULL-pointer dereference when hashtab allocation fails
1ae0d59c4f5e RDMA/netlink: Add __maybe_unused to static inline in C file
40bc831ab5f6 hugetlbfs: flush TLBs correctly after huge_pmd_unshare
86ab0f8ff008 scsi: ufs: core: Fix task management completion timeout race
ddd4e46cff40 scsi: ufs: core: Fix task management completion
04c586a601dc drm/amdgpu: fix set scaling mode Full/Full aspect/Center not works on vga and dvi connectors
47901b77bf7d drm/i915/dp: Ensure sink rate values are always valid
82de15ca6b55 drm/nouveau: clean up all clients on device removal
c81c90fbf577 drm/nouveau: use drm_dev_unplug() during device removal
9221aff33edb drm/nouveau: Add a dedicated mutex for the clients list
65517975cb19 drm/udl: fix control-message timeout
3d68d6ee8314 drm/amd/display: Update swizzle mode enums
7b97b5776daa cfg80211: call cfg80211_stop_ap when switch from P2P_GO type
1ab297809de8 parisc/sticon: fix reverse colors
6adbc07ebcaf btrfs: fix memory ordering between normal and ordered work functions
6289b494b38e net: stmmac: socfpga: add runtime suspend/resume callback for stratix10 platform
5875f87e2fc9 udf: Fix crash after seekdir
6b43cf113a38 KVM: nVMX: don't use vcpu->arch.efer when checking host state on nested state load
cc73242889b5 block: Check ADMIN before NICE for IOPRIO_CLASS_RT
63e2f34abc22 s390/kexec: fix memory leak of ipl report buffer
b1cf0d2fc4e4 scsi: qla2xxx: Fix mailbox direction flags in qla2xxx_get_adapter_id()
08fd6df8eaaf powerpc/8xx: Fix pinned TLBs with CONFIG_STRICT_KERNEL_RWX
9c177eee116c x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
b2e2fb64071a mm: kmemleak: slob: respect SLAB_NOLEAKTRACE flag
99032adf7d4b ipc: WARN if trying to remove ipc object which is absent
a7d91625863d tipc: check for null after calling kmemdup
f5995fcb75eb hexagon: clean up timer-regs.h
0854c9ff2151 hexagon: export raw I/O routines for modules
528971af64fc tun: fix bonding active backup with arp monitoring
af1d3c437eb5 arm64: vdso32: suppress error message for 'make mrproper'
97653ba562b9 net: stmmac: dwmac-rk: Fix ethernet on rk3399 based devices
4cebe23c032b s390/kexec: fix return code handling
d4fb80ae9830 perf/x86/intel/uncore: Fix IIO event constraints for Skylake Server
175135a5eacf perf/x86/intel/uncore: Fix filter_tid mask for CHA events on Skylake Server
84f64c7c52d6 pinctrl: qcom: sdm845: Enable dual edge errata
a8230fb74b54 KVM: PPC: Book3S HV: Use GLOBAL_TOC for kvmppc_h_set_dabr/xdabr()
4e6cce20fbc0 e100: fix device suspend/resume
34e54703fb0f NFC: add NCI_UNREG flag to eliminate the race
b2a60b4a0195 net: nfc: nci: Change the NCI close sequence
73a0d12114b4 NFC: reorder the logic in nfc_{un,}register_device
cb14b196d991 NFC: reorganize the functions in nci_request
41dc8dcb49d5 i40e: Fix display error code in dmesg
028ea7b090ec i40e: Fix creation of first queue by omitting it if is not power of two
69868d7a8853 i40e: Fix warning message and call stack during rmmod i40e driver
20645482d159 i40e: Fix ping is lost after configuring ADq on VF
6d64743045ca i40e: Fix changing previously set num_queue_pairs for PFs
f866513ead43 i40e: Fix NULL ptr dereference on VSI filter sync
071948856587 i40e: Fix correct max_pkt_size on VF RX queue
8e6bae950da9 net: virtio_net_hdr_to_skb: count transport header in UFO
1c4099dc0d6a net: dpaa2-eth: fix use-after-free in dpaa2_eth_remove
381a30f7e31c net: sched: act_mirred: drop dst for the direction from egress to ingress
a792e0128d23 scsi: core: sysfs: Fix hang when device state is set via sysfs
4b4302a02b7f net/mlx5: E-Switch, return error if encap isn't supported
68748ea4d122 net/mlx5: E-Switch, Change mode lock from mutex to rw semaphore
6190e1a2d41a net/mlx5: Lag, update tracker when state change event received
471c49289055 net/mlx5e: nullify cq->dbg pointer in mlx5_debug_cq_remove()
d1f8f1e04a61 platform/x86: hp_accel: Fix an error handling path in 'lis3lv02d_probe()'
da16f907cb30 mips: lantiq: add support for clk_get_parent()
17dfbe1b2f4e mips: bcm63xx: add support for clk_get_parent()
34284b3a2f86 MIPS: generic/yamon-dt: fix uninitialized variable error
a61f90b2162d iavf: Fix for setting queues to 0
a8a1e601c2ea iavf: Fix for the false positive ASQ/ARQ errors while issuing VF reset
77f5ae5441f0 iavf: validate pointers
ddcc185baa2b iavf: prevent accidental free of filter structure
a420b2612825 iavf: Fix failure to exit out from last all-multicast mode
78638b471322 iavf: free q_vectors before queues in iavf_disable_vf
84a13bfe2714 iavf: check for null in iavf_fix_features
1555d83ddbb7 iavf: Fix return of set the new channel count
09decd0a102a net/smc: Make sure the link_id is unique
437e21e2c9ae sock: fix /proc/net/sockstat underflow in sk_clone_lock()
4da14ddad19f net: reduce indentation level in sk_clone_lock()
9c3c2ef6ca26 tipc: only accept encrypted MSG_CRYPTO msgs
3d5941664786 bnxt_en: reject indirect blk offload when hw-tc-offload is off
4fc060abaa26 net: bnx2x: fix variable dereferenced before check
3ae75cc38a84 net: ipa: disable HOLB drop when updating timer
3984876f91a3 tracing: Add length protection to histogram string copies
900ea2f6287f tcp: Fix uninitialized access in skb frags array for Rx 0cp.
d1a6150ca616 net-zerocopy: Refactor skb frag fast-forward op.
5f7aadf03f98 net-zerocopy: Copy straggler unaligned data for TCP Rx. zerocopy.
8da80ec6d4f7 drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame
aa31e3fda68f perf tests: Remove bash construct from record+zstd_comp_decomp.sh
2ada5c0877f4 perf bench futex: Fix memory leak of perf_cpu_map__new()
11589d3144bc perf bpf: Avoid memory leak from perf_env__insert_btf()
5b2f2cbbc925 tracing/histogram: Do not copy the fixed-size char array field over the field size
1d6125532755 blkcg: Remove extra blkcg_bio_issue_init
dadcc935f440 perf/x86/vlbr: Add c->flags to vlbr event constraints
68fcb52b610c sched/core: Mitigate race cpus_share_cache()/update_top_cache_domain()
91191d47af55 mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
fbe27d0e1dcf clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk
9b3d3b72be84 clk/ast2600: Fix soc revision for AHB
03bc8ea0ae95 clk: ingenic: Fix bugs with divided dividers
7a5439474e69 f2fs: fix incorrect return value in f2fs_sanity_check_ckpt()
0a17fff6f045 f2fs: compress: disallow disabling compress on non-empty compressed file
4ce685cc9a0b sh: define __BIG_ENDIAN for math-emu
73383f670d8f sh: math-emu: drop unused functions
f44defd5694b sh: fix kconfig unmet dependency warning for FRAME_POINTER
3d7c5d08a483 f2fs: fix to use WHINT_MODE
e8bd5e33057c f2fs: fix up f2fs_lookup tracepoints
5d5bf899e57a maple: fix wrong return value of maple_bus_init().
8748f08a2fc0 sh: check return code of request_irq
29b742690a09 powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without DEBUG_RODATA_TEST
bc4bc07fb44c powerpc/dcr: Use cmplwi instead of 3-argument cmpli
1ac6cd87d8dd ALSA: gus: fix null pointer dereference on pointer block
850416beadef ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
8c4d9764e74d powerpc/5200: dts: fix memory node unit name
833ad2792733 iio: imu: st_lsm6dsx: Avoid potential array overflow in st_lsm6dsx_set_odr()
e0fef1c8cd61 scsi: target: Fix alua_tg_pt_gps_count tracking
8176441373dd scsi: target: Fix ordered tag handling
8440377e1a56 scsi: scsi_debug: Fix out-of-bound read in resp_report_tgtpgs()
3e20cb072679 scsi: scsi_debug: Fix out-of-bound read in resp_readcap16()
9635581aa999 MIPS: sni: Fix the build
77e9fed33056 tty: tty_buffer: Fix the softlockup issue in flush_to_ldisc
da82a207c4dc ALSA: ISA: not for M68K
c788ac47502e ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for flash
cbba09f86976 ARM: dts: ls1021a: move thermal-zones node out of soc/
2474eb7fc3bf usb: host: ohci-tmio: check return value after calling platform_get_resource()
02d9ebe0ccfa ARM: dts: omap: fix gpmc,mux-add-data type
c6c9bbe7facb firmware_loader: fix pre-allocated buf built-in firmware use
02a22911ed87 ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec
055eced3edf5 scsi: advansys: Fix kernel pointer leak
97f3cbb57b16 ASoC: nau8824: Add DMI quirk mechanism for active-high jack-detect
ae2207a078cf clk: imx: imx6ul: Move csi_sel mux to correct base register
0c6daf479961 ASoC: SOF: Intel: hda-dai: fix potential locking issue
19d193c5761a arm64: dts: freescale: fix arm,sp805 compatible string
36446a094a45 arm64: dts: qcom: ipq6018: Fix qcom,controlled-remotely property
e52fecdd0c14 arm64: dts: qcom: msm8998: Fix CPU/L2 idle state latency and residency
568d94c5c9f0 ARM: BCM53016: Specify switch ports for Meraki MR32
3a53d9ad9bc3 staging: rtl8723bs: remove possible deadlock when disconnect (v2)
3544c338794b ARM: dts: ux500: Skomer regulator fixes
eff8b7628410 usb: typec: tipd: Remove WARN_ON in tps6598x_block_read
679eee466d0f usb: musb: tusb6010: check return value after calling platform_get_resource()
2492de6f5edb bus: ti-sysc: Use context lost quirk for otg
5eca1c8412f4 bus: ti-sysc: Add quirk handling for reinit on context lost
dcd6eefceeb0 RDMA/bnxt_re: Check if the vlan is valid before reporting
4e5bc9fb23a7 arm64: dts: hisilicon: fix arm,sp805 compatible string
109a63bb07f0 arm64: dts: rockchip: Disable CDN DP on Pinebook Pro
c097bd5a5916 scsi: lpfc: Fix list_add() corruption in lpfc_drain_txq()
db90c507832a ARM: dts: NSP: Fix mpcore, mmc node names
5010df76ab1f staging: wfx: ensure IRQ is ready before enabling it
2651d06e461f arm64: dts: allwinner: a100: Fix thermal zone node name
fa98ac472e88 arm64: dts: allwinner: h5: Fix GPU thermal zone node name
aed195558f94 ARM: dts: sunxi: Fix OPPs node name
e2e105631265 arm64: zynqmp: Fix serial compatible string
48f154e8b94a arm64: zynqmp: Do not duplicate flash partition label property
99957dcea4e9 Linux 5.10.81
0685efd9840f selftests/x86/iopl: Adjust to the faked iopl CLI/STI usage
6a315471cb6a thermal: Fix NULL pointer dereferences in of_thermal_ functions
bd40513d0bee perf/core: Avoid put_page() when GUP fails
df58fb431aa3 scripts/lld-version.sh: Rewrite based on upstream ld-version.sh
be3f6035831a erofs: fix unsafe pagevec reuse of hooked pclusters
6c1ad56b2d78 erofs: remove the occupied parameter from z_erofs_pagevec_enqueue()
5bf5f464831c PCI: Add MSI masking quirk for Nvidia ION AHCI
f28c620e1ac1 PCI/MSI: Deal with devices lying about their MSI mask capability
9b61500ee536 PCI/MSI: Destroy sysfs before freeing entries
c49bfdfe535c parisc/entry: fix trace test in syscall exit path
b31bac061918 x86/iopl: Fake iopl(3) CLI/STI usage
a0958a5354f7 net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable warnings
80407c6ad9da net: stmmac: fix issue where clk is being unprepared twice
ac4bb9951c2c net: stmmac: fix system hang if change mac address after interface ifdown
bcf37522432d net: stmmac: fix missing unlock on error in stmmac_suspend()
483ed89522b0 net: stmmac: platform: fix build error with !CONFIG_PM_SLEEP
3afe11be6435 net: stmmac: add clocks management for gmac driver
f27060e28efc bootconfig: init: Fix memblock leak in xbc_make_cmdline()
04e46514fef6 loop: Use blk_validate_block_size() to validate block size
79ff56c613c1 block: Add a helper to validate the block size
eaafc590053b fortify: Explicitly disable Clang support
f884bb85b8d8 Linux 5.10.80
1e49a79bc312 soc/tegra: pmc: Fix imbalanced clock disabling in error code path
45490bfa1ebb x86/sev: Make the #VC exception stacks part of the default stacks storage
fc25889a6617 x86/sev: Add an x86 version of cc_platform_has()
74ba917cfddd arch/cc: Introduce a function to check for confidential computing features
5be42b203f2c selftests/bpf: Fix also no-alu32 strobemeta selftest
1e7340950dc2 mmc: moxart: Fix null pointer dereference on pointer host
188bf40391a5 ath10k: fix invalid dma_addr_t token assignment
d41f4d4dd7c8 SUNRPC: Partial revert of commit 6f9f17287e78
c7a440cd3079 PCI: aardvark: Fix PCIe Max Payload Size setting
f967d120a5b5 PCI: Add PCI_EXP_DEVCTL_PAYLOAD_* macros
f3396f6d8345 drm/sun4i: Fix macros in sun8i_csc.h
1023355234ca powerpc/85xx: fix timebase sync issue when CONFIG_HOTPLUG_CPU=n
77d543e68795 powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module unload
9dcdadd6cc73 mtd: rawnand: au1550nd: Keep the driver compatible with on-die ECC engines
51e34fcf72a3 mtd: rawnand: plat_nand: Keep the driver compatible with on-die ECC engines
e1de04df8eb1 mtd: rawnand: orion: Keep the driver compatible with on-die ECC engines
b4e2e9fbd194 mtd: rawnand: pasemi: Keep the driver compatible with on-die ECC engines
963db3ccc15b mtd: rawnand: gpio: Keep the driver compatible with on-die ECC engines
13566bc111ee mtd: rawnand: mpc5121: Keep the driver compatible with on-die ECC engines
9b366f5221d8 mtd: rawnand: xway: Keep the driver compatible with on-die ECC engines
cbc55cf4a358 mtd: rawnand: ams-delta: Keep the driver compatible with on-die ECC engines
1f420818dfca s390/cio: make ccw_device_dma_* more robust
c9ca9669dec3 s390/ap: Fix hanging ioctl caused by orphaned replies
57de1fbecff0 s390/tape: fix timer initialization in tape_std_assign()
1174298a5b31 s390/cio: check the subchannel validity for dev_busid
7d0341b37d97 video: backlight: Drop maximum brightness override for brightness zero
332306b1e731 mfd: dln2: Add cell for initializing DLN2 ADC
1d457987366f mm, oom: do not trigger out_of_memory from the #PF
ac7f6befc3d1 mm, oom: pagefault_out_of_memory: don't force global OOM for dying tasks
1ada86999dc8 powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
7fcf86565bb6 powerpc/security: Add a helper to query stf_barrier type
951fb7bf387f powerpc/bpf: Validate branch ranges
51cf71d5cb03 powerpc/lib: Add helper to check if offset is within conditional branch range
74293225f503 memcg: prohibit unconditional exceeding the limit of dying tasks
32246cefb992 9p/net: fix missing error check in p9_check_errors
a8cdf34ff8b7 net, neigh: Enable state migration between NUD_PERMANENT and NTF_USE
0bf5c6a1e43f f2fs: should use GFP_NOFS for directory inodes
7930892cbd40 irqchip/sifive-plic: Fixup EOI failed when masked
f67f6eb717ae posix-cpu-timers: Clear task::posix_cputimers_work in copy_process()
1372eb187108 x86/mce: Add errata workaround for Skylake SKX37
1ee5bc2ba83f MIPS: Fix assembly error from MIPSr2 code used within MIPS_ISA_ARCH_LEVEL
fc42bbb7827b parisc: Fix backtrace to always include init funtion names
241c74cc6555 ARM: 9156/1: drop cc-option fallbacks for architecture selection
03f2578153eb ARM: 9155/1: fix early early_iounmap()
ee79560cb768 selftests/net: udpgso_bench_rx: fix port argument
8b215edb7a38 cxgb4: fix eeprom len when diagnostics not implemented
93bc3ef60758 net/smc: fix sk_refcnt underflow on linkdown and fallback
7e03b797bee0 vsock: prevent unnecessary refcnt inc for nonblocking connect
ad3d219e843d net: stmmac: allow a tc-taprio base-time of zero
b30459c0ca0d net: hns3: allow configure ETS bandwidth of all TCs
ee11f16fee95 net: hns3: fix kernel crash when unload VF while it is being reset
79aa8706b45c net/sched: sch_taprio: fix undefined behavior in ktime_mono_to_any
b5703462a428 seq_file: fix passing wrong private data
4af0cd17e724 gve: Fix off by one in gve_tx_timeout()
c842a4c4ae7f bpf: sockmap, strparser, and tls are reusing qdisc_skb_cb and colliding
8b5c98a67c1b bpf, sockmap: Remove unhash handler for BPF sockmap usage
0fe81d7a202d arm64: pgtable: make __pte_to_phys/__phys_to_pte_val inline functions
727c812433b6 nfc: pn533: Fix double free when pn533_fill_fragment_skbs() fails
9f0e683e1bd4 llc: fix out-of-bound array index in llc_sk_dev_hash()
b833274ae6d9 perf bpf: Add missing free to bpf_event__print_bpf_prog_info()
7091fcc75ff6 zram: off by one in read_block_state()
64bde0c2db50 mm/zsmalloc.c: close race window between zs_pool_dec_isolated() and zs_unregister_migration()
a3c205c017f8 can: mcp251xfd: mcp251xfd_chip_start(): fix error handling for mcp251xfd_chip_rx_int_enable()
300d87474816 mfd: core: Add missing of_node_put for loop iteration
6439b91fef2c bonding: Fix a use-after-free problem when bond_sysfs_slave_add() failed
acb01e962af7 net: phy: fix duplex out of sync problem while changing settings
090e17075f67 drm/nouveau/svm: Fix refcount leak bug and missing check against null bug
ee8a3ae48a94 ACPI: PMIC: Fix intel_pmic_regs_handler() read accesses
d83832d4a838 ice: Fix not stopping Tx queues for VFs
354ae5ca6ce1 ice: Fix replacing VF hardware MAC to existing MAC filter
e04a7a84bb77 net: vlan: fix a UAF in vlan_dev_real_dev()
3fe164e7197b openrisc: fix SMP tlb flush NULL pointer dereference
628773a759d5 ethtool: fix ethtool msg len calculation for pause stats
e78c267eb74e net: davinci_emac: Fix interrupt pacing disable
111f77594ddf xen-pciback: Fix return in pm_ctrl_init()
de9721ee8ad3 i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_probe()'
8c3e204fb6bc NFSv4: Fix a regression in nfs_set_open_stateid_locked()
0afb3bc53435 scsi: qla2xxx: Turn off target reset during issue_lip
09595fd2cef5 scsi: qla2xxx: Fix gnl list corruption
cbe31149e5a7 scsi: qla2xxx: Relogin during fabric disturbance
bc3f207ed99a scsi: qla2xxx: Changes to support FCP2 Target
ba5eb0e44346 ar7: fix kernel builds for compiler test
ef9f7ab9ba20 watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
aaa64ee14ac9 m68k: set a default value for MEMORY_RESERVE
a4cbf00e5ab8 signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
b04c17acf42a dmaengine: dmaengine_desc_callback_valid(): Check for `callback_result`
bba31f3b1f43 netfilter: nfnetlink_queue: fix OOB when mac header was cleared
41968262bb24 soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read
6caab6c96b67 auxdisplay: ht16k33: Fix frame buffer device blanking
178522aa755f auxdisplay: ht16k33: Connect backlight to fbdev
a1d6a60ee00c auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
0e1709b2a07a Fix user namespace leak
90e7415221e1 NFS: Fix an Oops in pnfs_mark_request_commit()
10f210871736 NFS: Fix up commit deadlocks
91e43a8500f4 dmaengine: at_xdmac: fix AT_XDMAC_CC_PERID() macro
038dfd67d375 rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
5061e102346e remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
36104e1f71dd mtd: core: don't remove debugfs directory if device is in use
0b73c025bfcf PCI: uniphier: Serialize INTx masking/unmasking and fix the bit operation
d2ff7a8b079d mtd: spi-nor: hisi-sfc: Remove excessive clk_disable_unprepare()
c4eb6849909a fs: orangefs: fix error return code of orangefs_revalidate_lookup()
3e7b08ebf40f NFS: Fix deadlocks in nfs_scan_commit_list()
14943891857d opp: Fix return in _opp_add_static_v2()
bea3213f191a PCI: aardvark: Fix preserving PCI_EXP_RTCTL_CRSSVE flag on emulated bridge
ec6dba3ffe3f PCI: aardvark: Don't spam about PIO Response Status
2e548581fe5b drm/plane-helper: fix uninitialized variable reference
e94c59b64e6c pnfs/flexfiles: Fix misplaced barrier in nfs4_ff_layout_prepare_ds
8ac076ce7193 NFS: Fix dentry verifier races
9d438dbf7342 i2c: mediatek: fixing the incorrect register offset
f3492c4a9264 nfsd: don't alloc under spinlock in rpc_parse_scope_id
602ab1fd40e2 rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
851b622e7b4f apparmor: fix error check
9c9c33ea4cab power: supply: bq27xxx: Fix kernel crash on IRQ handler register error
dbdf0f220759 mips: cm: Convert to bitfield API to fix out-of-bounds access
c8447cb14a12 virtio_ring: check desc == NULL when using indirect with packed
80e6643393b7 ASoC: cs42l42: Correct configuring of switch inversion from ts-inv
cb0fdd9aae01 ASoC: cs42l42: Use device_property API instead of of_property
ef9d007a91f5 ASoC: cs42l42: Disable regulators if probe fails
c0faad6e9d56 powerpc/44x/fsp2: add missing of_node_put
4310970d0b4d HID: u2fzero: properly handle timeouts in usb_submit_urb
e2f0bff411f5 HID: u2fzero: clarify error check and length calculations
26be378079fc clk: at91: sam9x60-pll: use DIV_ROUND_CLOSEST_ULL
f2886010a8d1 serial: xilinx_uartps: Fix race condition causing stuck TX
515778f9d841 phy: qcom-snps: Correct the FSEL_MASK
fd056574a7e8 phy: ti: gmii-sel: check of_get_address() for failure
0a46740a0af0 phy: qcom-qusb2: Fix a memory leak on probe
ec40a28495a8 pinctrl: equilibrium: Fix function addition in multiple groups
a0467ca4d25f soc: qcom: apr: Add of_node_put() before return
b41c528b14fe firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()
31e7a836e2a2 usb: dwc2: drd: reset current session before setting the new one
fc86da757db7 usb: dwc2: drd: fix dwc2_drd_role_sw_set when clock could be disabled
6774a429327d usb: dwc2: drd: fix dwc2_force_mode call in dwc2_ovr_init
068dfa570d8c serial: imx: fix detach/attach of serial console
d293bd40fbad scsi: ufs: ufshcd-pltfrm: Fix memory leak due to probe defer
75df59394126 scsi: ufs: Refactor ufshcd_setup_clocks() to remove skip_ref_clk
948d8f2f2fd5 iio: adis: do not disabe IRQs in 'adis_init()'
c8e5edca68a3 usb: typec: STUSB160X should select REGMAP_I2C
503d6e5fb878 soc: qcom: rpmhpd: Make power_on actually enable the domain
81e37cf40dbb soc: qcom: rpmhpd: Provide some missing struct member descriptions
b288b841c1d8 ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
1812deb08f86 ASoC: cs42l42: Correct some register default values
d34982c08714 ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
602fefd4561e ARM: dts: stm32: fix SAI sub nodes register range
3fb75227bdce ARM: dts: stm32: Reduce DHCOR SPI NOR frequency to 50 MHz
78238479b93b pinctrl: renesas: checker: Fix off-by-one bug in drive register check
51bcffb3951c staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
0bb8359f9c0d staging: most: dim2: do not double-register the same device
8e1feecc04fc usb: musb: select GENERIC_PHY instead of depending on it
0058f7fbea13 RDMA/mlx4: Return missed an error if device doesn't support steering
bce61de56480 scsi: csiostor: Uninitialized data in csio_ln_vnp_read_cbfn()
12c46732042c power: supply: max17040: fix null-ptr-deref in max17040_probe()
c553d673018d power: supply: rt5033_battery: Change voltage values to µV
d8da6328ecae usb: gadget: hid: fix error code in do_config()
92a80e1ca20e serial: 8250_dw: Drop wrong use of ACPI_PTR()
cfbf58ac8ec2 powerpc: fix unbalanced node refcount in check_kvm_guest()
54965d92a464 powerpc: Fix is_kvm_guest() / kvm_para_available()
e01a4d7560b6 powerpc: Reintroduce is_kvm_guest() as a fast-path check
113207234aac powerpc: Rename is_kvm_guest() to check_kvm_guest()
61c5d9fa5671 powerpc: Refactor is_kvm_guest() declaration to new header
67074c63cd67 video: fbdev: chipsfb: use memset_io() instead of memset()
fb24243e6d7f clk: at91: check pmc node status before registering syscore ops
20cc0fa1d030 memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe
d3833d3c569a soc/tegra: Fix an error handling path in tegra_powergate_power_up()
9a2244200908 ASoC: SOF: topology: do not power down primary core during topology removal
8b6124d9245c arm: dts: omap3-gta04a4: accelerometer irq fix
e1959450b77a driver core: Fix possible memory leak in device_link_add()
ddb13ddacc60 scsi: pm80xx: Fix misleading log statement in pm8001_mpi_get_nvmd_resp()
4438a7457063 soundwire: debugfs: use controller id and link_id for debugfs
3fe8d239e35b ALSA: hda: Use position buffer for SKL+ again
c550c7c9ae91 ALSA: hda: Fix hang during shutdown due to link reset
23e8f775d962 ALSA: hda: Release controller display power during shutdown/reboot
5972e974ebbb ALSA: hda: Reduce udelay() at SKL+ position reporting
1db71de28bfc arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
d833ddddec5b arm64: dts: renesas: beacon: Fix Ethernet PHY mode
d70247b752f7 arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
980c7bdd20fc JFS: fix memleak in jfs_mount
c4edd206d52e MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
24149c954f32 scsi: dc395: Fix error case unwinding
6348983be709 ARM: dts: at91: tse850: the emac<->phy interface is rmii
b6493c2b7ddb bus: ti-sysc: Fix timekeeping_suspended warning on resume
85085c343705 arm64: dts: meson-g12b: Fix the pwm regulator supply properties
4ccb7e4a972c arm64: dts: meson-g12a: Fix the pwm regulator supply properties
20baf0163805 arm64: dts: ti: k3-j721e-main: Fix "bus-range" upto 256 bus number for PCIe
7a1617a9919b arm64: dts: ti: k3-j721e-main: Fix "max-virtual-functions" in PCIe EP nodes
64a43b771258 RDMA/bnxt_re: Fix query SRQ failure
fe3c11fc627b ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY
2887df89e7f6 arm64: dts: rockchip: Fix GPU register width for RK3328
3f33f09d9f6a ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
cdd3dd905cea clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths
2fde76df1885 ARM: dts: BCM5301X: Fix memory nodes names
5282385ee655 RDMA/rxe: Fix wrong port_cap_flags
a2c17c93b771 iio: st_sensors: disable regulators after device unregistration
bfedc817769d iio: st_sensors: Call st_sensors_power_enable() from bus drivers
f84c7a03d1ea of: unittest: fix EXPECT text for gpio hog errors
4a50bc008476 bpf: Fix propagation of signed bounds from 64-bit min/max into 32-bit.
84dde8c8c933 bpf: Fix propagation of bounds from 64-bit min/max into 32-bit and var_off.
9308f9c9c7a5 cgroup: Fix rootcg cpu.stat guest double counting
a3fdcd16b138 ibmvnic: Process crqs after enabling interrupts
5b3f7204197a ibmvnic: don't stop queue in xmit
366235d4bebc udp6: allow SO_MARK ctrl msg to affect routing
8f3d88139df8 selftests/bpf: Fix fclose/pclose mismatch in test_progs
71ec65c70004 crypto: pcrypt - Delay write to padata->info
fb41b8f5e855 net: phylink: avoid mvneta warning when setting pause parameters
08449a5c0e56 net: amd-xgbe: Toggle PLL settings during rate change
b17f424f88ba selftests/bpf: Fix fd cleanup in sk_lookup test
2989a396b891 selftests: bpf: Convert sk_lookup ctx access tests to PROG_TEST_RUN
ae1f588ca1b0 drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits
a586453da90c wcn36xx: Fix discarded frames due to wrong sequence number
3965cc2e9fdd wcn36xx: add proper DMA memory barriers in rx path
62d12650b845 libertas: Fix possible memory leak in probe and disconnect
975c15a19bbc libertas_tf: Fix possible memory leak in probe and disconnect
3aa98ef8f7ad KVM: s390: Fix handle_sske page fault handling
5109802499fb samples/kretprobes: Fix return value if register_kretprobe() failed
c3ac751944ab spi: spi-rpc-if: Check return value of rpcif_sw_init()
5b7b4afead62 tcp: don't free a FIN sk_buff in tcp_remove_empty_skb()
3925134eff29 libbpf: Fix endianness detection in BPF_CORE_READ_BITFIELD_PROBED()
227efdda51b4 tpm_tis_spi: Add missing SPI ID
ff1a0f71cc77 tpm: fix Atmel TPM crash caused by too frequent queries
43b4860b58f3 irq: mips: avoid nested irq_enter()
29a1cc3b5011 KVM: s390: pv: avoid stalls for kvm_s390_pv_init_vm
759f27cfa344 KVM: s390: pv: avoid double free of sida page
a729eb55b3c7 s390/gmap: don't unconditionally call pte_unmap_unlock() in __gmap_zap()
50fcaa715521 libbpf: Fix BTF header parsing checks
12872fd7e40b libbpf: Fix overflow in BTF sanity checks
255eb8f8affd libbpf: Allow loading empty BTFs
4d4d6aa2ef80 libbpf: Fix BTF data layout checks and allow empty BTF
0b95aaa493c6 bpftool: Avoid leaking the JSON writer prepared for program metadata
7cd4af996cd2 KVM: selftests: Fix nested SVM tests when built with clang
293fa72d62e4 KVM: selftests: Add operand to vmsave/vmload/vmrun in svm.c
d33753718156 smackfs: use netlbl_cfg_cipsov4_del() for deleting cipso_v4_doi
807f01f60cd0 drm/msm: Fix potential NULL dereference in DPU SSPP
6d1f3157aa9b x86/sev: Fix stack type check in vc_switch_off_ist()
8e2f97df6a0b clocksource/drivers/timer-ti-dm: Select TIMER_OF
b9f142d748b6 PM: hibernate: fix sparse warnings
e8c0b748456a nvme-rdma: fix error code in nvme_rdma_setup_ctrl
7668cbe0cb77 phy: micrel: ksz8041nl: do not use power down mode
d405eb1150ce net: enetc: unmap DMA in enetc_send_cmd()
14e12b7a763e mwifiex: Send DELBA requests according to spec
4ed5bb3df6c7 rsi: stop thread firstly in rsi_91x_init() error handling
e27022647529 mt76: mt7915: fix muar_idx in mt7915_mcu_alloc_sta_req()
1a270dada035 mt76: mt7915: fix sta_rec_wtbl tag len
116652a3d5dd mt76: mt7915: fix possible infinite loop release semaphore
7a8e4effbbbc mt76: mt76x02: fix endianness warnings in mt76x02_mac.c
4d5c7f07c725 mt76: mt7615: fix endianness warning in mt7615_mac_write_txwi
4187bf331010 platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
25c032c585a2 mmc: mxs-mmc: disable regulator on error and in the remove function
7c1c7ac9d13a media: ir_toy: assignment to be16 should be of correct type
daf15fa1fd99 net: stream: don't purge sk_error_queue in sk_stream_kill_queues()
14d241577227 drm/msm: uninitialized variable in msm_gem_import()
3424931fa39e drm/msm: potential error pointer dereference in init()
a342cb4772f4 tcp: switch orphan_count to bare per-cpu counters
c85c6fadbef0 kernel/sched: Fix sched_fork() access an invalid sched_task_group
e1ee11473a88 ath10k: fix max antenna gain unit
786976b25ae0 hwmon: (pmbus/lm25066) Let compiler determine outer dimension of lm25066_coeff
fbc80c83f118 hwmon: Fix possible memleak in __hwmon_device_register()
e29352f162db net, neigh: Fix NTF_EXT_LEARNED in combination with NTF_USE
41fe79cf1156 memstick: jmb38x_ms: use appropriate free function in jmb38x_ms_alloc_host()
4756d7fbaf8c memstick: avoid out-of-range warning
72de92d33f83 mmc: sdhci-omap: Fix context restore
2fd26ec36ef0 mmc: sdhci-omap: Fix NULL pointer exception if regulator is not configured
a9fbeb5bbc46 gve: Recover from queue stall due to missed IRQ
9e4f708df65e b43: fix a lower bounds test
508faf8721ae b43legacy: fix a lower bounds test
6a1610014181 hwrng: mtk - Force runtime pm ops for sleep ops
8d98683fa6df crypto: qat - disregard spurious PFVF interrupts
d99fdd13a75a crypto: qat - detect PFVF collision after ACK
1fe4b2441982 media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()
740a794e01c5 netfilter: nft_dynset: relax superfluous check on set updates
af756be29c82 rcu: Always inline rcu_dynticks_task*_{enter,exit}()
68803253822c EDAC/amd64: Handle three rank interleaving mode
1b2d422a261b PM: EM: Fix inefficient states detection
d01e847d84bf ath9k: Fix potential interrupt storm on queue reset
52e3545eefb6 media: em28xx: Don't use ops->suspend if it is NULL
f03e0624e927 cpuidle: Fix kobject memory leaks in error paths
66f7de13d156 crypto: ecc - fix CRYPTO_DEFAULT_RNG dependency
848f1f00c637 kprobes: Do not use local variable when creating debugfs file
c34bfe4204cd media: cx23885: Fix snd_card_free call on null card pointer
388cebfa7342 media: tm6000: Avoid card name truncation
86626be4b629 media: si470x: Avoid card name truncation
88315edafe39 media: radio-wl1273: Avoid card name truncation
4280b30ea9b5 media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
e43b301cb1ba media: TDA1997x: handle short reads of hdmi info frame.
c85e591b77ca media: v4l2-ioctl: S_CTRL output the right value
e2f3608a0b50 media: dvb-usb: fix ununit-value in az6027_rc_query
0a85325fc565 media: cxd2880-spi: Fix a null pointer dereference on error handling path
4303b39b5075 media: em28xx: add missing em28xx_close_extension
375150b3aaf8 drm/amdgpu: fix warning for overflow check
8980f9d14481 arm64: mm: update max_pfn after memory hotplug
cbbf816cb7f9 drm/ttm: stop calling tt_swapin in vm_access
c39154d3d623 ath10k: sdio: Add missing BH locking around napi_schdule()
ffed64553817 ath10k: Fix missing frame timestamp for beacon/probe-resp
08fb0008d90b ath11k: Fix memory leak in ath11k_qmi_driver_event_work
4519fb910555 ath11k: fix packet drops due to incorrect 6 GHz freq value in rx status
b6a46ec871ea ath11k: Avoid race during regd updates
ac49af173c64 ath11k: fix some sleeping in atomic bugs
9833cb32066a net: dsa: rtl8366rb: Fix off-by-one bug
78fb8c999242 rxrpc: Fix _usecs_to_jiffies() by using usecs_to_jiffies()
03725f7125db crypto: caam - disable pkc for non-E SoCs
f0b40bf3e48a Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync
310f581f54cb wilc1000: fix possible memory leak in cfg_scan_result()
3a95dbc8b7f2 wcn36xx: Fix Antenna Diversity Switching
ba8ba7688594 cgroup: Make rebind_subsystems() disable v2 controllers all at once
a585e04e3472 net: net_namespace: Fix undefined member in key_remove_domain()
fb4a58f5194e lockdep: Let lock_is_held_type() detect recursive read as read
38098444b787 virtio-gpu: fix possible memory allocation failure
582de9e38584 drm/v3d: fix wait for TMU write combiner flush
f0bc12b84826 objtool: Fix static_call list generation
b36ab509e181 x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
abf37e855e53 objtool: Add xen_start_kernel() to noreturn list
6b72caabc470 MIPS: lantiq: dma: fix burst length for DEU
226d68fb6c0a rcu: Fix existing exp request check in sync_sched_exp_online_cleanup()
c20d8c197454 Bluetooth: fix init and cleanup of sco_conn.timeout_work
19337ed10e7e selftests/bpf: Fix strobemeta selftest regression
bc9199271c32 netfilter: conntrack: set on IPS_ASSURED if flows enters internal stream state
0c5e94679480 parisc/kgdb: add kgdb_roundup() to make kgdb work with idle polling
a1ec31a0befa parisc/unwind: fix unwinder when CONFIG_64BIT is enabled
ee75174f6ab9 erofs: don't trigger WARN() when decompression fails
50a2d1229b51 task_stack: Fix end_of_stack() for architectures with upwards-growing stack
44d4c43babb0 parisc: fix warning in flush_tlb_all
d8166a27c648 selftests/core: fix conflicting types compile error for close_range()
6f038b1a941e drm/amd/display: dcn20_resource_construct reduce scope of FPU enabled
ddfcae905238 x86/hyperv: Protect set_hv_tscchange_cb() against getting preempted
c4cfdf5fa8fc wcn36xx: Correct band/freq reporting on RX
a27095cda17d spi: bcm-qspi: Fix missing clk_disable_unprepare() on error in bcm_qspi_probe()
b917f9b94633 btrfs: do not take the uuid_mutex in btrfs_rm_device
428bb3d71e35 btrfs: reflink: initialize return value to 0 in btrfs_extent_same()
eeb96ebdc686 ACPI: AC: Quirk GK45 to skip reading _PSR
42d8c280dd65 net: annotate data-race in neigh_output()
c2e5f43db0c1 vrf: run conntrack only in context of lower/physdev for locally generated packets
b3ae170b8e3f ARM: 9136/1: ARMv7-M uses BE-8, not BE-32
b870d8a76c04 gfs2: Fix glock_hash_walk bugs
16a7981188a3 gfs2: Cancel remote delete work asynchronously
9ceac307b58e gre/sit: Don't generate link-local addr if addr_gen_mode is IN6_ADDR_GEN_MODE_NONE
25a45d399996 ARM: clang: Do not rely on lr register for stacktrace
c11aecbe0542 smackfs: use __GFP_NOFAIL for smk_cipso_doi()
32a9a8fdbab7 iwlwifi: mvm: disable RX-diversity in powersave
e658d59f0ee4 selftests/bpf: Fix perf_buffer test on system with offline cpus
d6dca066fc4f selftests: kvm: fix mismatched fclose() after popen()
9f4bd00a6ec6 PM: hibernate: Get block device exclusively in swsusp_check()
7a0b68eecb5b nvme: drop scan_lock and always kick requeue list when removing namespaces
82327823f34e nvmet-tcp: fix use-after-free when a port is removed
2659d8213d88 nvmet-rdma: fix use-after-free when a port is removed
e73574f7bc9b nvmet: fix use-after-free when a port is removed
1a10bf4c9dd3 media: allegro: ignore interrupt if mailbox is not initialized
49cc377654d9 block: remove inaccurate requeue check
451cef276fe4 mwl8k: Fix use-after-free in mwl8k_fw_state_machine()
16c2dd0ab5c2 mt76: mt7915: fix an off-by-one bound check
ea7f8803a314 tracing/cfi: Fix cmp_entries_* functions signature mismatch
5736f1dead84 workqueue: make sysfs of unbound kworker cpumask more clever
ab5c46f258c9 lib/xz: Validate the value before assigning it to an enum variable
aa5d35e350f6 lib/xz: Avoid overlapping memcpy() with invalid input with in-place decompression
cad55afe37c9 memstick: r592: Fix a UAF bug when removing the driver
2338c3501726 md: update superblock after changing rdev flags in state_store
b34ea3c91eac block: bump max plugged deferred size from 16 to 32
517feec952ae drm/msm: prevent NULL dereference in msm_gpu_crashstate_capture()
e1d7f0202a9f leaking_addresses: Always print a trailing newline
9101e2574b81 net: phy: micrel: make *-skew-ps check more lenient
832fad367cac drm/amdkfd: fix resume error when iommu disabled in Picasso
65c84e09e8d4 ACPI: battery: Accept charges over the design capacity as full
b60086601832 iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
219df0f6bad4 mmc: moxart: Fix reference count leaks in moxart_probe
38608d32adf0 ath: dfs_pattern_detector: Fix possible null-pointer dereference in channel_detector_create()
3c2434d9a6c6 tracefs: Have tracefs directories not set OTH permission bits by default
8524501a0e7a net-sysfs: try not to restart the syscall if it will fail eventually
b94e5bd540f4 media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
e3bc3e114135 media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
b499d4057160 media: ipu3-imgu: imgu_fmt: Handle properly try
272e54604cf7 ACPICA: Avoid evaluating methods too early during system resume
f09e1a2d2c74 fs/proc/uptime.c: Fix idle time reporting in /proc/uptime
6e242c557ad5 ipmi: Disable some operations during a panic
1f38e5e803df media: rcar-csi2: Add checking to rcsi2_start_receiver()
3d5575b3f536 brcmfmac: Add DMI nvram filename quirk for Cyberbook T116 tablet
7d54f52d8fdb rtw88: fix RX clock gate setting while fifo dump
d506a3d60df9 ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
2709971f9f60 media: mceusb: return without resubmitting URB in case of -EPROTO error.
40b8e7dee544 media: imx: set a media_device bus_info string
a62edd8390ec media: s5p-mfc: Add checking to s5p_mfc_probe().
b570e36a779c media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
f4037b9b1062 media: uvcvideo: Set unique vdev name based in type
d9349416402d media: uvcvideo: Return -EIO for control errors
2052c4cebce9 media: uvcvideo: Set capability in s_param
0c91bb4fbde4 media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
309ea2248d0a media: atomisp: Fix error handling in probe
f4c652bd3506 media: netup_unidvb: handle interrupt properly according to the firmware
09ee09359af9 media: mt9p031: Fix corrupted frame after restarting stream
aded39ff1f7a ath10k: high latency fixes for beacon buffer
461a71a1a62a ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when map reinjected packets
43ab64578836 ath11k: add handler for scan event WMI_SCAN_EVENT_DEQUEUED
97890f36333d ath11k: Avoid reg rules update during firmware recovery
2114f80889d8 drm/amdgpu: Fix MMIO access page fault
68ac723fb17e fscrypt: allow 256-bit master keys with AES-256-XTS
f526d948c38d mwifiex: Properly initialize private structure on interface type changes
bab15174ec2f mwifiex: Run SET_BSS_MODE when changing from P2P to STATION vif-type
7ca1711d59f1 x86: Increase exception stack sizes
1c04dabbd1aa ath11k: Align bss_chan_info structure with firmware
3fac6feca95f smackfs: Fix use-after-free in netlbl_catmap_walk()
02ddf26d849d rcu-tasks: Move RTGS_WAIT_CBS to beginning of rcu_tasks_kthread() loop
8d433ab5c8c2 net: sched: update default qdisc visibility after Tx queue cnt changes
28118dcc871e locking/lockdep: Avoid RCU-induced noinstr fail
b92a5df2c7ad MIPS: lantiq: dma: reset correct number of channel
5af57ce8a615 MIPS: lantiq: dma: add small delay after reset
396e302cc835 platform/x86: wmi: do not fail if disabling fails
7f43cda650d5 rcutorture: Avoid problematic critical section nesting on PREEMPT_RT
7987f31e54a2 drm/panel-orientation-quirks: add Valve Steam Deck
c10465f6d620 Bluetooth: fix use-after-free error in lock_sock_nested()
4dfba42604f0 Bluetooth: sco: Fix lock_sock() blockage by memcpy_from_msg()
509ae4a4f074 drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book 10.6
62b90d7eeb6d drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-in-1
780fff2c75f0 drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (v2)
6758d6651627 dma-buf: WARN on dmabuf release with pending attachments
890e4edcecfa power: supply: max17042_battery: Clear status bits in interrupt handler
898622adb7e9 USB: chipidea: fix interrupt deadlock
6edf4cffe1b4 USB: iowarrior: fix control-message timeouts
0e71591e916b most: fix control-message timeouts
edc546625456 serial: 8250: fix racy uartclk update
5f31af4e78b4 USB: serial: keyspan: fix memleak on probe errors
ab4755ea9114 iio: ad5770r: make devicetree property reading consistent
638462060859 iio: dac: ad5446: Fix ad5622_write() return value
a4e7a8c4321f coresight: cti: Correct the parameter for pm_runtime_put
46709163a54a pinctrl: core: fix possible memory leak in pinctrl_enable()
6bc8317b8cd5 quota: correct error number in free_dqentry()
ceeb0a8a8716 quota: check block number when reading the block in quota file
bc1274df3ff4 PCI: aardvark: Fix support for PCI_ROM_ADDRESS1 on emulated bridge
e2e8961fbc3a PCI: aardvark: Set PCI Bridge Class Code to PCI Bridge
bd5d982822cf PCI: aardvark: Fix support for PCI_BRIDGE_CTL_BUS_RESET on emulated bridge
2b99c6fb65b4 PCI: aardvark: Fix support for bus mastering and PCI_COMMAND on emulated bridge
4bb5399c1c73 PCI: aardvark: Read all 16-bits from PCIE_MSI_PAYLOAD_REG
2ad10bbf8477 PCI: aardvark: Fix return value of MSI domain .alloc() method
6a0da19be5eb PCI: aardvark: Fix configuring Reference clock
5fb031fcd423 PCI: aardvark: Fix reporting Data Link Layer Link Active
2b861523d7ce PCI: aardvark: Do not unmask unused interrupts
1085ee5236ef PCI: aardvark: Fix checking for link up via LTSSM state
3bcbace714bb PCI: aardvark: Do not clear status bits of masked interrupts
c1a8fb237470 PCI: cadence: Add cdns_plat_pcie_probe() missing return
adcfc317d3f5 PCI: pci-bridge-emul: Fix emulation of W1C bits
4fd9f0509a14 ovl: fix use after free in struct ovl_aio_req
af7d25d7853c xen/balloon: add late_initcall_sync() for initial ballooning done
96e7880a432a ALSA: mixer: fix deadlock in snd_mixer_oss_set_volume
694c0c84a6ec ALSA: mixer: oss: Fix racy access to slots
cd0b29a89bc2 ifb: fix building without CONFIG_NET_CLS_ACT
47462c5e600f serial: core: Fix initializing and restoring termios speed
c1e6e42740cb ring-buffer: Protect ring_buffer_reset() from reentrancy
93fccb1f8939 powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
875609ad8020 can: j1939: j1939_can_recv(): ignore messages with invalid source address
c3cb7b5c9d14 can: j1939: j1939_tp_cmd_recv(): ignore abort message in the BAM transport
9f9d6d391ff5 KVM: nVMX: Query current VMCS when determining if MSR bitmaps are in use
bd37419f4fde KVM: arm64: Extract ESR_ELx.EC only
924955df37f2 power: supply: max17042_battery: use VFSOC for capacity when no rsns
f2feac81edcd power: supply: max17042_battery: Prevent int underflow in set_soc_threshold
5720436bc7ba mtd: rawnand: socrates: Keep the driver compatible with on-die ECC engines
7e867f8bb3fe soc: fsl: dpio: use the combined functions to protect critical zone
55c97165adf6 soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
62bd9eac5fa2 signal/mips: Update (_save|_restore)_fp_context to fail with -EFAULT
5e63b85a489d memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
4fbecebb31c7 signal: Remove the bogus sigkill_pending in ptrace_stop
5c6fedce4a6a RDMA/qedr: Fix NULL deref for query_qp on the GSI QP
30cdf5035769 perf/x86/intel/uncore: Fix Intel ICX IIO event constraints
aef1a67fbf49 perf/x86/intel/uncore: Support extra IMC channel on Ice Lake server
da8b3b95c57f rsi: Fix module dev_oper_mode parameter description
d69ffec3aa22 rsi: fix rate mask set leading to P2P failure
41d97e0360e9 rsi: fix key enabled check causing unwanted encryption for vap_id > 0
46752a7aed91 rsi: fix occasional initialisation failure with BT coex
a194e9c721d9 wcn36xx: handle connection loss indication
701cf28e019d libata: fix checking of DMA state
890e416c026e mwifiex: Try waking the firmware until we get an interrupt
d59d2f7af7e0 mwifiex: Read a PCI register after writing the TX ring write pointer
daccf40320d4 PM: sleep: Do not let "syscore" devices runtime-suspend during system transitions
1c422d63010a wcn36xx: Fix (QoS) null data frame bitrate/modulation
c1b8ad661ff1 wcn36xx: Fix tx_status mechanism
3d62e1c9bc55 wcn36xx: Fix HT40 capability for 2Ghz band
c044f34ca22f ifb: Depend on netfilter alternatively to tc
c7400e2ec8de evm: mark evm_fixmode as __ro_after_init
eab090dfcb1d rtl8187: fix control-message timeouts
73b79ada4c1c PCI: Mark Atheros QCA6174 to avoid bus reset
30182b8c1388 ath10k: fix division by zero in send path
ce560076091a ath10k: fix control-message timeout
1336b2af8adc ath6kl: fix control-message timeout
f34487c7f223 ath6kl: fix division by zero in send path
fd1e4d8c61ef mwifiex: fix division by zero in fw download path
a5d8d76710e8 EDAC/sb_edac: Fix top-of-high-memory value for Broadwell/Haswell
31f5c925464a regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
02ecf56faa56 regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
5b7e3bb16310 hwmon: (pmbus/lm25066) Add offset coefficients
db04fb4111e6 selinux: fix race condition when computing ocontext SIDs
a09a5f4c075d ia64: kprobes: Fix to pass correct trampoline address to the handler
2f65b76c4445 KVM: VMX: Unregister posted interrupt wakeup handler on hardware unsetup
b4a4c9dc4407 btrfs: call btrfs_check_rw_degradable only if there is a missing device
b406439afe73 btrfs: fix lost error handling when replaying directory deletes
8992aab294cb btrfs: clear MISSING device status bit in btrfs_close_one_device
a99da5b68080 rds: stop using dmapool
0bfb1c1a16ff net/smc: Correct spelling mistake to TCPF_SYN_RECV
9b86eb2f34d1 net/smc: Fix smc_link->llc_testlink_time overflow
2167a9a12cc9 nfp: bpf: relax prog rejection for mtu check through max_pkt_offset
c9a7d5fe1552 vmxnet3: do not stop tx queues after netif_device_detach()
9813218e96db r8169: Add device 10ec:8162 to driver r8169
ad6a2a1e566f nvmet-tcp: fix header digest verification
c8270435cfb4 block: schedule queue restart after BLK_STS_ZONE_RESOURCE
7d1fb5c12cc0 drm: panel-orientation-quirks: Add quirk for GPD Win3
4d41059b9e23 watchdog: Fix OMAP watchdog early handling
b8cb3f4ffa3a net: multicast: calculate csum of looped-back and forwarded packets
07f7a1864929 spi: spl022: fix Microwire full duplex mode
db1d9d102ee4 nvmet-tcp: fix a memory leak when releasing a queue
0e86b727a94f xen/netfront: stop tx queues during live migration
69b14e23dfc3 gpio: mlxbf2.c: Add check for bgpio_init failure
b92ac0a9ca8f bpf: Prevent increasing bpf_jit_limit above max
a3564fb7b0bf bpf: Define bpf_jit_alloc_exec_limit for arm64 JIT
0ad7f317b933 fcnal-test: kill hanging ping/nettest binaries on cleanup
bc3e73ebb79b drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
4002f3944d41 mmc: winbond: don't build on M68K
a1ea41f91dcb reset: socfpga: add empty driver allowing consumers to probe
a90398438517 ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode
f03e04bb9d11 hyperv/vmbus: include linux/bitops.h
6491ccdde2c5 sfc: Don't use netif_info before net_device setup
e519acba2fae sfc: Export fibre-specific supported link modes
7986fdbbe009 cavium: Fix return values of the probe function
ad01685177ce mISDN: Fix return values of the probe function
a6cb5e09e16a scsi: qla2xxx: Fix unmap of already freed sgl
77fee241e6eb scsi: qla2xxx: Return -ENOMEM if kzalloc() fails
940783d08d15 cavium: Return negative value when pci_alloc_irq_vectors() fails
75710d583cc4 ALSA: hda/realtek: Fixes HP Spectre x360 15-eb1xxx speakers
92556e3c2b2e ASoC: soc-core: fix null-ptr-deref in snd_soc_del_component_unlocked()
73199aadcd5c x86/irq: Ensure PI wakeup handler is unregistered before module unload
df8a74fc15ea x86/cpu: Fix migration safety with X86_BUG_NULL_SEL
115810a26527 x86/sme: Use #define USE_EARLY_PGTABLE_L5 in mem_encrypt_identity.c
b05eea1bcb36 fuse: fix page stealing
d81e341fb13a ext4: refresh the ext4_ext_path struct after dropping i_data_sem.
4089432dc030 ext4: ensure enough credits in ext4_ext_shift_path_extents
aa21b7e3d320 ext4: fix lazy initialization next schedule time computation in more granular unit
782025948bc6 ALSA: timer: Unconditionally unlink slave instances, too
b980ce4ebb8b ALSA: timer: Fix use-after-free problem
7c6fd525044c ALSA: synth: missing check for possible NULL after the call to kstrdup
ecd536c57ab7 ALSA: hda: Free card instance properly at probe errors
f503a25a3de3 ALSA: usb-audio: Add registration quirk for JBL Quantum 400
9259518fab5b ALSA: usb-audio: Line6 HX-Stomp XL USB_ID for 48k-fixed quirk
3c7a3f2d79f7 ALSA: line6: fix control and interrupt message timeouts
21f9c02a4ded ALSA: 6fire: fix control and bulk message timeouts
0e4c288a74a3 ALSA: ua101: fix division by zero at probe
4f9e9c389e10 ALSA: hda/realtek: Add quirk for HP EliteBook 840 G7 mute LED
62b189f9f3c5 ALSA: hda/realtek: Add quirk for ASUS UX550VE
a770cb746bdd ALSA: hda/realtek: Add a quirk for Acer Spin SP513-54N
88bcfcc50d0e ALSA: hda/realtek: Headset fixup for Clevo NH77HJQ
0288f838a2e3 ALSA: hda/realtek: Add quirk for Clevo PC70HS
3d0e5d2eaff1 ALSA: hda/realtek: Add a quirk for HP OMEN 15 mute LED
f0750e98010a ALSA: hda/realtek: Fix mic mute LED for the HP Spectre x360 14
a2b3dbc9fd24 media: v4l2-ioctl: Fix check_ext_ctrls
151eff588043 media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
71a137376b64 media: rkvdec: Support dynamic resolution changes
b2b5126a777b media: ite-cir: IR receiver stop working after receive overflow
39275d2ec6ff media: rkvdec: Do not override sizeimage for output format
949c5b6daa75 crypto: s5p-sss - Add error handling in s5p_aes_probe()
9ac25cd2f4ec firmware/psci: fix application of sizeof to pointer
dd189feebaf8 tpm: Check for integer overflow in tpm2_map_response_body()
32498b8889c8 parisc: Fix ptrace check on syscall return
15b4142aea0a parisc: Fix set_fixmap() on PA1.x CPUs
284ad310542f exfat: fix incorrect loading of i_blocks for large files
823b487cfbfc mmc: dw_mmc: Dont wait for DRTO on Write RSP error
7b24b669d3f9 mmc: mtk-sd: Add wait dma stop done flow
c1d31266de3d scsi: qla2xxx: Fix use after free in eh_abort path
37b15db1d87c scsi: qla2xxx: Fix kernel crash when accessing port_speed sysfs file
06cc8187dbb6 scsi: core: Remove command size deduction from scsi_setup_scsi_cmnd()
9d623bf1736b ocfs2: fix data corruption on truncate
39264eaa6d44 libata: fix read log timeout value
ab0a06769e69 Input: i8042 - Add quirk for Fujitsu Lifebook T725
8c341d11c8bd Input: elantench - fix misreporting trackpoint coordinates
d1eb42de7cf9 Input: iforce - fix control-message timeout
afbec52fbce0 binder: use cred instead of task for getsecid
0d9f4ae7cd6f binder: use cred instead of task for selinux checks
bd9cea41ac6e binder: use euid from cred instead of using task
7f1d5a1a7d80 usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform
ff32302687fd xhci: Fix USB 3.1 enumeration issues by increasing roothub power-on-good delay

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0c843e4f1e7d255b5be1e4a0b2516a38256e25e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1971f98a62..600bb04690 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "31ba5af055c8ec4f10e7d830f6303ca2384e345a"
-SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
+SRCREV_machine ?= "d007a2fd6964323f58564a7362cb0293bc69c5bf"
+SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.79"
+LINUX_VERSION ?= "5.10.82"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 2cca934d4f..8635ddcfba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.79"
+LINUX_VERSION ?= "5.10.82"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d8f6c9be051a886d4956a7d6195d0e8f10761a33"
-SRCREV_machine ?= "f7838de907e651c3d279e6b5209b7e5d7e12ad21"
-SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
+SRCREV_machine_qemuarm ?= "01f85f09232df2aa45edd757150cb03e35f41f3b"
+SRCREV_machine ?= "f0a0ddc2f355d02a706454137d3dab7889fcf4d1"
+SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fa24e5e2d0..8ab427d8e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "400d6ae8c64508b812dd58ee90106be2aa395bd9"
-SRCREV_machine_qemuarm64 ?= "efc398a5bce6938c24413608381d86e7bf225c91"
-SRCREV_machine_qemumips ?= "358d9326c084f4162b71ed857b16419b4fb3295f"
-SRCREV_machine_qemuppc ?= "0fb273427794cb084265a18b03878a482e438aa9"
-SRCREV_machine_qemuriscv64 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
-SRCREV_machine_qemuriscv32 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
-SRCREV_machine_qemux86 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
-SRCREV_machine_qemux86-64 ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
-SRCREV_machine_qemumips64 ?= "e1dabeb4b0ea9695dea605a0c91f17c482f49f75"
-SRCREV_machine ?= "fba683668510aeb475a5fd3fb4b7da5aed402495"
-SRCREV_meta ?= "1a4cd99824c919ba17dc62935532f3748ef18469"
+SRCREV_machine_qemuarm ?= "74d64de12f376533a34ec582c19b0dc698aea8fc"
+SRCREV_machine_qemuarm64 ?= "0e5d783a705e4c4846cc34d0fd26bf8645bdfb24"
+SRCREV_machine_qemumips ?= "4a8d5630df98b660aeb137a0ca24021e8e9243bb"
+SRCREV_machine_qemuppc ?= "36a9597fcd7083cab43c5c1ec17c7e7b0ce3fab3"
+SRCREV_machine_qemuriscv64 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
+SRCREV_machine_qemuriscv32 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
+SRCREV_machine_qemux86 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
+SRCREV_machine_qemux86-64 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
+SRCREV_machine_qemumips64 ?= "690b09d3a24bafeff32bb06a72643be0c8fae9a7"
+SRCREV_machine ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
+SRCREV_meta ?= "e2f792a996eb4ace257b7dd12d3890ce504741c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.79"
+LINUX_VERSION ?= "5.10.82"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1

