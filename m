Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: [PATCH 2/7] linux-yocto/5.14: update to v5.14.21
Date: Tue,  7 Dec 2021 11:52:03 -0500
Message-Id: <320003dfe152a81e5c87a6fe1faf2d673f883b0a.1638895732.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

545728d9e085 Linux 5.14.21
999805aaf925 Revert "ACPI: scan: Release PM resources blocked by unused objects"
0750f769b958 thermal: Fix NULL pointer dereferences in of_thermal_ functions
50812034d105 perf/core: Avoid put_page() when GUP fails
ae2afdf82a00 PCI: Add MSI masking quirk for Nvidia ION AHCI
18c55aed17b2 PCI/MSI: Deal with devices lying about their MSI mask capability
f64af1735731 PCI/MSI: Destroy sysfs before freeing entries
f41389affe96 parisc/entry: fix trace test in syscall exit path
56249b445477 Bluetooth: btusb: Add support for TP-Link UB500 Adapter
dbaa485bc5a1 bootconfig: init: Fix memblock leak in xbc_make_cmdline()
6bb162d35d74 loop: Use blk_validate_block_size() to validate block size
e2d865b3109c block: Add a helper to validate the block size
5b9f31a3be76 fortify: Explicitly disable Clang support
87304542f264 KVM: Fix steal time asm constraints
02eafa8f1558 Revert "drm: fb_helper: fix CONFIG_FB dependency"
bd462930f7e5 Revert "drm: fb_helper: improve CONFIG_FB dependency"
ff7124b91f52 Linux 5.14.20
1b86960dc451 Revert "x86: Fix get_wchan() to support the ORC unwinder"
961913f45ff6 Revert "sched: Add wrapper for get_wchan() to keep task blocked"
b51c1a592faa Revert "x86: Fix __get_wchan() for !STACKTRACE"
0e62c60b3e7e Linux 5.14.19
c6d58e3e55f5 media: videobuf2-dma-sg: Fix buf->vb NULL pointer dereference
283fd7d9fdea media: videobuf2: always set buffer vb2 pointer
6a1968a2f2f6 x86/sev: Make the #VC exception stacks part of the default stacks storage
8c57c9ff7e88 x86/sev: Add an x86 version of cc_platform_has()
0e1cd02ff0d8 arch/cc: Introduce a function to check for confidential computing features
45a47382941d IMA: reject unknown hash algorithms in ima_get_hash_algo
a3c6e358fbe4 selftests/bpf: Fix also no-alu32 strobemeta selftest
49ed44184d0c selftests/x86/iopl: Adjust to the faked iopl CLI/STI usage
35207858385e mmc: moxart: Fix null pointer dereference on pointer host
c254f7893bc1 ath10k: fix invalid dma_addr_t token assignment
733aac9beea8 cifs: fix memory leak of smb3_fs_context_dup::server_hostname
4f2bf4fe6c0d media: vidtv: move kfree(dvb) to vidtv_bridge_dev_release()
af09862cb566 drm/amd/display: Look at firmware version to determine using dmub on dcn21
697103ad736a pinctrl: amd: Handle wake-up interrupt
03e1b25d4079 pinctrl: amd: Add irq field data
f80264b897b2 SUNRPC: Partial revert of commit 6f9f17287e78
7a914508ca2f PCI: aardvark: Fix PCIe Max Payload Size setting
f12fbf40bf63 PCI: Add PCI_EXP_DEVCTL_PAYLOAD_* macros
7005ee54fc09 drm/sun4i: Fix macros in sun8i_csc.h
a595cc219051 powerpc/85xx: fix timebase sync issue when CONFIG_HOTPLUG_CPU=n
0a6412029f7e powerpc/pseries/mobility: ignore ibm, platform-facilities updates
baf19ea102c3 powerpc/64s/interrupt: Fix check_return_regs_valid() false positive
251959e47018 powerpc/security: Use a mutex for interrupt exit code patching
0795f5e71d1d powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module unload
36859829b783 powerpc/32e: Ignore ESR in instruction storage interrupt handler
db56efa61734 powerpc/bpf: Fix write protecting JIT code
b3e0a9cb6a67 powerpc/vas: Fix potential NULL pointer dereference
0bc921b6db55 mtd: rawnand: au1550nd: Keep the driver compatible with on-die ECC engines
f5a84162f174 mtd: rawnand: plat_nand: Keep the driver compatible with on-die ECC engines
426c3bda4995 mtd: rawnand: orion: Keep the driver compatible with on-die ECC engines
26b77361800a mtd: rawnand: pasemi: Keep the driver compatible with on-die ECC engines
8d37b0ee8875 mtd: rawnand: gpio: Keep the driver compatible with on-die ECC engines
0c82481e3064 mtd: rawnand: mpc5121: Keep the driver compatible with on-die ECC engines
6ad70604565c mtd: rawnand: xway: Keep the driver compatible with on-die ECC engines
e4435dec6149 mtd: rawnand: ams-delta: Keep the driver compatible with on-die ECC engines
ab5fdf2c5a41 mtd: rawnand: fsmc: Fix use of SM ORDER
6e7363893639 remoteproc: imx_rproc: Fix rsc-table name
0f27656d5e26 remoteproc: imx_rproc: Fix ignoring mapping vdev regions
fce6586cd1d7 remoteproc: Fix the wrong default value of is_iomem
69dbe49b7eac remoteproc: elf_loader: Fix loading segment when is_iomem true
7d1ece44014b s390/cio: make ccw_device_dma_* more robust
60b9aef7f2eb s390/ap: Fix hanging ioctl caused by orphaned replies
9525ecf82f04 s390/tape: fix timer initialization in tape_std_assign()
efa70f3da72a s390/cio: check the subchannel validity for dev_busid
2ea358c095ad s390/cpumf: cpum_cf PMU displays invalid value after hotplug remove
e554c13dbe3c PM: sleep: Avoid calling put_device() under dpm_list_mtx
f36ada9c43db video: backlight: Drop maximum brightness override for brightness zero
c928e634b492 mfd: dln2: Add cell for initializing DLN2 ADC
8d55a5f82210 mm, oom: do not trigger out_of_memory from the #PF
dc6b83b8fef9 mm, oom: pagefault_out_of_memory: don't force global OOM for dying tasks
5741bd42f7c5 io-wq: serialize hash clear with wakeup
9f9d088a4b7d io-wq: fix queue stalling race
92b69466102b io-wq: ensure that hash wait lock is IRQ disabling
31132a895eaa memcg: prohibit unconditional exceeding the limit of dying tasks
d3a14035e51b mm/filemap.c: remove bogus VM_BUG_ON
4546a8cb993c 9p/net: fix missing error check in p9_check_errors
2febd1914ddc bpf, cgroup: Assign cgroup in cgroup_sk_alloc when called from interrupt
72c0c32d9dde bpf, cgroups: Fix cgroup v2 fallback on v1/v2 mixed mode
06cf324a465a net, neigh: Enable state migration between NUD_PERMANENT and NTF_USE
515cfde2a028 dmaengine: bestcomm: fix system boot lockups
3f5e4b70cd7a dmaengine: ti: k3-udma: Set r/tchan or rflow to NULL if request fail
3a127ccaf9a0 dmaengine: ti: k3-udma: Set bchan to NULL if a channel request fail
2f9e6bcab0a1 erofs: fix unsafe pagevec reuse of hooked pclusters
5b67adb7425e f2fs: fix UAF in f2fs_available_free_memory
616c1311b0f3 f2fs: include non-compressed blocks in compr_written_block
25b7077e30ee f2fs: should use GFP_NOFS for directory inodes
29868ae1478f irqchip/sifive-plic: Fixup EOI failed when masked
1bf2fc90b15b posix-cpu-timers: Clear task::posix_cputimers_work in copy_process()
f7ece74d0ab2 KVM: x86: move guest_pv_has out of user_access section
4c09233d17ce x86/mce: Add errata workaround for Skylake SKX37
e95e07bab005 MIPS: Fix assembly error from MIPSr2 code used within MIPS_ISA_ARCH_LEVEL
70eeeb5aa01a MIPS: fix duplicated slashes for Platform file path
1eed13f0aba9 parisc: Flush kernel data mapping in set_pte_at() when installing pte for user page
1a396e845df7 parisc: Fix backtrace to always include init funtion names
b30255c8e2dd ARM: 9156/1: drop cc-option fallbacks for architecture selection
a39c9f2ff126 ARM: 9155/1: fix early early_iounmap()
a6e210f38fd9 smb3: do not error on fsync when readonly
05f320417823 selftests/net: udpgso_bench_rx: fix port argument
36810c9fc743 cxgb4: fix eeprom len when diagnostics not implemented
f9a2f543823f net/smc: fix sk_refcnt underflow on linkdown and fallback
eedcf3fb5e61 vsock: prevent unnecessary refcnt inc for nonblocking connect
ed5ac8bf1dbd net: marvell: mvpp2: Fix wrong SerDes reconfiguration order
e2abbf7dea22 net: ethernet: ti: cpsw_ale: Fix access to un-initialized memory
d2d62615396f net: stmmac: allow a tc-taprio base-time of zero
f116f0dad316 net: hns3: allow configure ETS bandwidth of all TCs
c7f7dc737f0d net: hns3: fix kernel crash when unload VF while it is being reset
214dbb2b4042 net: hns3: fix pfc packet number incorrect after querying pfc parameters
6fc15f27d462 net: hns3: fix ROCE base interrupt vector initialization bug
1959c3614227 net/sched: sch_taprio: fix undefined behavior in ktime_mono_to_any
45dea1317981 net: dsa: mv88e6xxx: Don't support >1G speeds on 6191X on ports other than 10
5862afa33cb1 seq_file: fix passing wrong private data
17f7aec830f5 drm/i915/fb: Fix rounding error in subsampled plane size calculation
e8cf4c96f11e gve: Fix off by one in gve_tx_timeout()
cf427bf68f29 dmaengine: stm32-dma: avoid 64-bit division in stm32_dma_get_max_width
b3ce1fc8100a dmaengine: stm32-dma: fix burst in case of unaligned memory address
af400d2469ae bpf, sockmap: sk_skb data_end access incorrect when src_reg = dst_reg
6b0db2a36f9a bpf: sockmap, strparser, and tls are reusing qdisc_skb_cb and colliding
0580e47c8895 bpf, sockmap: Fix race in ingress receive verdict with redirect to self
778aec90440f bpf, sockmap: Remove unhash handler for BPF sockmap usage
1ad5169dbb1c arm64: pgtable: make __pte_to_phys/__phys_to_pte_val inline functions
cdc29bc2748f arm64: arm64_ftr_reg->name may not be a human-readable string
8fbaf7b79caa nfc: pn533: Fix double free when pn533_fill_fragment_skbs() fails
5dedc3a392e3 llc: fix out-of-bound array index in llc_sk_dev_hash()
78455257102e perf bpf: Add missing free to bpf_event__print_bpf_prog_info()
700f183edb05 zram: off by one in read_block_state()
ec82306f4509 mm/zsmalloc.c: close race window between zs_pool_dec_isolated() and zs_unregister_migration()
8f04fdb42298 can: mcp251xfd: mcp251xfd_chip_start(): fix error handling for mcp251xfd_chip_rx_int_enable()
4f389e1276a5 can: etas_es58x: es58x_rx_err_msg(): fix memory leak in error path
7a3210be9964 Revert "drm/imx: Annotate dma-fence critical section in commit path"
cd5d00738d62 drm: fb_helper: improve CONFIG_FB dependency
748dc40f1552 selftests/bpf/xdp_redirect_multi: Limit the tests in netns
67ebdf08154e selftests/bpf/xdp_redirect_multi: Give tcpdump a chance to terminate cleanly
63d52d3f722b selftests/bpf/xdp_redirect_multi: Use arping to accurate the arp number
52058c2e5516 selftests/bpf/xdp_redirect_multi: Put the logs to tmp folder
5ad1157af560 libbpf: Fix lookup_and_delete_elem_flags error reporting
006b5af213cd ACPI: PM: Fix device wakeup power reference counting error
c6d718f67eff mfd: altera-sysmgr: Fix a mistake caused by resource_size conversion
051b35b83508 mfd: sprd: Add SPI device ID table
fa6a7b427e3e mfd: cpcap: Add SPI device ID table
b862c9d1aa0d mfd: core: Add missing of_node_put for loop iteration
c85582ef7d42 ALSA: memalloc: Catch call with NULL snd_dma_buffer pointer
61ef4e2f3fbf bonding: Fix a use-after-free problem when bond_sysfs_slave_add() failed
51f230381aee drm/ttm: remove ttm_bo_vm_insert_huge()
1e520022ebb7 net: phy: fix duplex out of sync problem while changing settings
a3a5d0e13066 cpufreq: intel_pstate: Clear HWP desired on suspend/shutdown and offline
d79404b45c10 PCI: Do not enable AtomicOps on VFs
267a022590e3 ataflop: remove ataflop_probe_lock mutex
4972bb9f9266 block/ataflop: provide a helper for cleanup up an atari disk
4f6264ed34b6 block/ataflop: add registration bool before calling del_gendisk()
ff8f1a821132 block/ataflop: use the blk_cleanup_disk() helper
5921ada07f55 drm/nouveau/svm: Fix refcount leak bug and missing check against null bug
86b53a83c55b nvdimm/btt: do not call del_gendisk() if not needed
02dea719283f PCI: j721e: Fix j721e_pcie_probe() error path
01b47659d9d1 ACPI: PMIC: Fix intel_pmic_regs_handler() read accesses
bbe42d65433a ice: Fix not stopping Tx queues for VFs
b15d8035cdb7 ice: Fix replacing VF hardware MAC to existing MAC filter
ff5b62b0decb net: dsa: felix: fix broken VLAN-tagged PTP under VLAN-aware bridge
1554b63d8751 net: dsa: tag_ocelot: break circular dependency with ocelot switch lib driver
fca96b3f852a net: vlan: fix a UAF in vlan_dev_real_dev()
7f639a03e4ab openrisc: fix SMP tlb flush NULL pointer dereference
e75b136530ce ethtool: fix ethtool msg len calculation for pause stats
f776103499bf kselftests/net: add missed icmp.sh test to Makefile
d2afb868adc9 net: davinci_emac: Fix interrupt pacing disable
5ed0d8c6af53 nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
69f35664ee1f nbd: fix max value for 'first_minor'
40804b6959fa xen-pciback: Fix return in pm_ctrl_init()
3612fdf488d5 gpio: realtek-otto: fix GPIO line IRQ offset
c64b55c85fb2 i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_probe()'
60e8a9733d82 NFSv4: Fix a regression in nfs_set_open_stateid_locked()
288be49e2e2e scsi: qla2xxx: Turn off target reset during issue_lip
66adfc54bd79 scsi: qla2xxx: Fix gnl list corruption
7c32b407ef0a scsi: target: core: Remove from tmr_list during LUN unlink
bac37c7433c5 ar7: fix kernel builds for compiler test
85b7c9ef119b watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
bae8c19f3063 m68k: set a default value for MEMORY_RESERVE
9c30504d85d2 signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
ab91e1ea48db dmaengine: dmaengine_desc_callback_valid(): Check for `callback_result`
ea52aeeb0da1 netfilter: nfnetlink_queue: fix OOB when mac header was cleared
fa46546d0871 soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read
a4a5ee9741ea auxdisplay: ht16k33: Fix frame buffer device blanking
32d349f3e4ee auxdisplay: ht16k33: Connect backlight to fbdev
be51f4ed87ed auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
cee0757bca0d Fix user namespace leak
2892327b226c NFS: Fix an Oops in pnfs_mark_request_commit()
f97d474f1b78 NFS: Fix up commit deadlocks
0adbe4155e0b dmaengine: stm32-dma: fix stm32_dma_get_max_width
ca3b5c976540 dmaengine: at_xdmac: fix AT_XDMAC_CC_PERID() macro
e8886cff93f0 dmaengine: at_xdmac: call at_xdmac_axi_config() on resume path
d08efac1f61e rtc: rv3032: fix error handling in rv3032_clkout_set_rate()
32fe246e33c6 remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
c0bd86c72dc0 mtd: core: don't remove debugfs directory if device is in use
f3ecfa903c2f mtd: rawnand: arasan: Prevent an unsupported configuration
e5744356f335 PCI: uniphier: Serialize INTx masking/unmasking and fix the bit operation
9254b2c16ba3 mtd: spi-nor: hisi-sfc: Remove excessive clk_disable_unprepare()
3189e1420b29 Input: st1232 - increase "wait ready" timeout
bef23befe1cd fs: orangefs: fix error return code of orangefs_revalidate_lookup()
f2deeaf169b8 NFS: Fix deadlocks in nfs_scan_commit_list()
0776aa4efe05 opp: Fix return in _opp_add_static_v2()
d192572a43b6 PCI: aardvark: Fix preserving PCI_EXP_RTCTL_CRSSVE flag on emulated bridge
b262b5fb60b4 PCI: aardvark: Don't spam about PIO Response Status
8d76b46f5810 drm/plane-helper: fix uninitialized variable reference
0bb7a9c31e4e drm/bridge/lontium-lt9611uxc: fix provided connector suport
9c8d416d7a52 pnfs/flexfiles: Fix misplaced barrier in nfs4_ff_layout_prepare_ds
be46326d9c65 NFS: Fix dentry verifier races
527b6ec3e979 NFS: Ignore the directory size when marking for revalidation
255fc6efacf2 NFS: Don't set NFS_INO_DATA_INVAL_DEFER and NFS_INO_INVALID_DATA
cbe0ef0063e5 NFS: Default change_attr_type to NFS4_CHANGE_TYPE_IS_UNDEFINED
6033546caa09 i2c: mediatek: fixing the incorrect register offset
a58fb2098608 Input: ariel-pwrbutton - add SPI device ID table
135c6ab095b0 rtc: mcp795: Add SPI ID table
f6136953df6e remoteproc: imx_rproc: Fix TCM io memory type
511a35aa4400 rtc: pcf2123: Add SPI ID table
e0fc7ea848f4 rtc: ds1390: Add SPI ID table
5c83c670e113 rtc: ds1302: Add SPI ID table
aeb40af85292 nfsd: don't alloc under spinlock in rpc_parse_scope_id
b33831877a0e mtd: rawnand: intel: Fix potential buffer overflow in probe
2c3a8b1701dc rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
1f6483f7c0d4 apparmor: fix error check
12af444fb18b RDMA/core: Require the driver to set the IOVA correctly during rereg_mr
db35ff6ff095 power: supply: bq27xxx: Fix kernel crash on IRQ handler register error
17d0a494465f mips: cm: Convert to bitfield API to fix out-of-bounds access
e941eb7523e6 virtio_ring: check desc == NULL when using indirect with packed
8a1bf46732bf serial: cpm_uart: Protect udbg definitions by CONFIG_SERIAL_CPM_CONSOLE
cceb856eb7f3 ASoC: rsnd: Fix an error handling path in 'rsnd_node_count()'
5e0210787cfa RDMA/hns: Modify the value of MAX_LP_MSG_LEN to meet hardware compatibility
45107b861a80 RDMA/hns: Fix initial arm_st of CQ
f3de2499242c ASoC: cs42l42: Correct configuring of switch inversion from ts-inv
03e45fb778c5 powerpc: Don't provide __kernel_map_pages() without ARCH_SUPPORTS_DEBUG_PAGEALLOC
14b05b63bfbb ALSA: oxfw: fix functional regression for Mackie Onyx 1640i in v5.14 or later
8af7e2b8d96f powerpc/xmon: fix task state output
8557ce3ddb0e powerpc/44x/fsp2: add missing of_node_put
694756f543b0 powerpc/book3e: Fix set_memory_x() and set_memory_nx()
f0a8154f6c66 powerpc/nohash: Fix __ptep_set_access_flags() and ptep_set_wrprotect()
15ccc53df3a4 HID: u2fzero: properly handle timeouts in usb_submit_urb
cc68082a3f76 HID: u2fzero: clarify error check and length calculations
463e138a67cb clk: at91: clk-master: fix prescaler logic
a4978a6cfd9e clk: at91: clk-master: check if div or pres is zero
b42bf5de6bef clk: at91: sam9x60-pll: use DIV_ROUND_CLOSEST_ULL
e40f88ca6e5b serial: xilinx_uartps: Fix race condition causing stuck TX
b135a66c3410 phy: Sparx5 Eth SerDes: Fix return value check in sparx5_serdes_probe()
16db43fc0568 phy: qcom-snps: Correct the FSEL_MASK
f639952d70c6 phy: ti: gmii-sel: check of_get_address() for failure
02058ab1dcec phy: qcom-qusb2: Fix a memory leak on probe
05d2c884bbb0 ASoC: topology: Fix stub for snd_soc_tplg_component_remove()
20cef4273de0 pinctrl: equilibrium: Fix function addition in multiple groups
fbf843c5fde5 arm64: dts: qcom: sdm845: Fix Qualcomm crypto engine bus clock
24231d918e46 arm64: dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
cd068f71c245 arm64: dts: qcom: pmi8994: Fix "eternal"->"external" typo in WLED node
0f2768e7aaa4 soc: qcom: apr: Add of_node_put() before return
5e313f56a004 soc: qcom: rpmhpd: fix sm8350_mxc's peer domain
fae72275217d firmware: qcom_scm: Fix error retval in __qcom_scm_is_call_available()
61bb3fac7a56 powerpc/booke: Disable STRICT_KERNEL_RWX, DEBUG_PAGEALLOC and KFENCE
d58dbd7c9765 usb: dwc2: drd: reset current session before setting the new one
c6a6138fd3d0 usb: dwc2: drd: fix dwc2_drd_role_sw_set when clock could be disabled
8d4801295664 usb: dwc2: drd: fix dwc2_force_mode call in dwc2_ovr_init
97714002eb5c serial: imx: fix detach/attach of serial console
f265551f304a scsi: lpfc: Wait for successful restart of SLI3 adapter during host sg_reset
9c9321f3af65 scsi: ufs: ufshcd-pltfrm: Fix memory leak due to probe defer
8104d165fe8c soundwire: bus: stop dereferencing invalid slave pointer
4e599aa437f8 iio: adis: do not disabe IRQs in 'adis_init()'
1cc004bb7e1d usb: typec: STUSB160X should select REGMAP_I2C
2c05b78785ae iio: buffer: Fix double-free in iio_buffers_alloc_sysfs_and_mask()
ddcdf294b31b soc: qcom: socinfo: add two missing PMIC IDs
4be134c2caf0 soc: qcom: rpmhpd: Make power_on actually enable the domain
c4607253ded6 ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
24d49d9f0dc6 ASoC: cs42l42: Correct some register default values
066f6d94e87b ASoC: cs42l42: Always configure both ASP TX channels
a9e0fed5c311 ARM: dts: stm32: fix AV96 board SAI2 pin muxing on stm32mp15
de4c998f9634 ARM: dts: stm32: fix SAI sub nodes register range
d39348632e9e ARM: dts: stm32: fix STUSB1600 Type-C irq level on stm32mp15xx-dkx
74447d38de5e ARM: dts: stm32: Reduce DHCOR SPI NOR frequency to 50 MHz
d34d4f395674 pinctrl: renesas: checker: Fix off-by-one bug in drive register check
03f7759f9003 powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL in power10
ae59bf224965 dyndbg: make dyndbg a known cli param
4d3bee930ce9 staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
d9d577801350 staging: most: dim2: do not double-register the same device
65f101a4bb56 usb: musb: select GENERIC_PHY instead of depending on it
04ec60e77ef2 RDMA/mlx4: Return missed an error if device doesn't support steering
96e9a4068a2a scsi: csiostor: Uninitialized data in csio_ln_vnp_read_cbfn()
f0d4f0cd9442 power: supply: max17040: fix null-ptr-deref in max17040_probe()
71ad44224a78 power: supply: rt5033_battery: Change voltage values to µV
4848d094da0e usb: gadget: hid: fix error code in do_config()
ff22ff487e5a serial: 8250_dw: Drop wrong use of ACPI_PTR()
1e405bd00949 powerpc/paravirt: correct preempt debug splat in vcpu_is_preempted()
e093b8b68af7 powerpc: fix unbalanced node refcount in check_kvm_guest()
87557023bcf0 video: fbdev: chipsfb: use memset_io() instead of memset()
327788eb627c powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prototype for 'create_section_mapping'
5ec603fc4c1f clk: at91: check pmc node status before registering syscore ops
b885c49c7733 memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe
677ee2d1634a soc/tegra: Fix an error handling path in tegra_powergate_power_up()
3a39364557c3 iio: st_pressure_spi: Add missing entries SPI to device ID table
c23d6902073e ASoC: SOF: topology: do not power down primary core during topology removal
b810bd3db9ef arm: dts: omap3-gta04a4: accelerometer irq fix
c8542e40a779 driver core: Fix possible memory leak in device_link_add()
13f731ac9b17 scsi: pm80xx: Fix misleading log statement in pm8001_mpi_get_nvmd_resp()
945070ab3d91 scsi: megaraid_sas: Fix concurrent access to ISR between IRQ polling and real interrupt
e850922067ec power: reset: at91-reset: check properly the return value of devm_of_iomap
60b15e314825 soundwire: debugfs: use controller id and link_id for debugfs
ee6e999f3f3d ALSA: hda: Use position buffer for SKL+ again
51ebfe87c0a8 ALSA: hda: Reduce udelay() at SKL+ position reporting
9c738280085a iommu/dma: Fix arch_sync_dma for map
09339ff9e671 arm64: dts: qcom: pm8916: Remove wrong reg-names for rtc@6000
20997b9aca4c iommu/mediatek: Fix out-of-range warning with clang
c1b5c72d4d59 arm64: dts: renesas: beacon: Fix Ethernet PHY mode
44bd0cd11f10 arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
75988ebce563 ASoC: wcd9335: Use correct version to initialize Class H
fd4bc9383153 JFS: fix memleak in jfs_mount
08276a9bb6db MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
e0d09ee78793 scsi: dc395: Fix error case unwinding
231b0e5b20cd soc: qcom: llcc: Disable MMUHWT retention
1ba41a69c079 arm64: dts: qcom: sc7180: Base dynamic CPU power coefficients in reality
39413a92656f ARM: dts: at91: tse850: the emac<->phy interface is rmii
87b20cedac64 bus: ti-sysc: Fix timekeeping_suspended warning on resume
b8f089162080 arm64: dts: meson-sm1: Fix the pwm regulator supply properties
ec2a1df6cb10 arm64: dts: meson-g12b: Fix the pwm regulator supply properties
fe4b9c0806c1 arm64: dts: meson-g12a: Fix the pwm regulator supply properties
b6a3e5310a23 arm64: dts: ti: j7200-main: Fix "bus-range" upto 256 bus number for PCIe
82b4981ce328 arm64: dts: ti: j7200-main: Fix "vendor-id"/"device-id" properties of pcie node
4cfacb5443c7 arm64: dts: ti: k3-j721e-main: Fix "bus-range" upto 256 bus number for PCIe
01d704aa590e arm64: dts: ti: k3-j721e-main: Fix "max-virtual-functions" in PCIe EP nodes
0bc01ceba816 RDMA/bnxt_re: Fix query SRQ failure
9c177b1c70eb ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY
9e2601ac84b4 arm64: dts: rockchip: Fix GPU register width for RK3328
1d292cf27d89 arm64: dts: rockchip: fix rk3568 mbi-alias
18d83fc611a8 ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
295bdd05ba50 scsi: pm80xx: Fix lockup in outbound queue management
b74b57b738ba clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths
465c4e9b718d arm64: dts: broadcom: bcm4908: Fix UART clock name
042ee2a50f89 ARM: dts: BCM5301X: Fix memory nodes names
ce412216fbfc RDMA/rxe: Fix wrong port_cap_flags
2427a4c9e4e7 iio: st_sensors: disable regulators after device unregistration
a61cb0ecc913 arm64: dts: meson: sm1: add Ethernet PHY reset line for ODROID-C4/HC4
3260de8b35af of: unittest: fix EXPECT text for gpio hog errors
8426a23213dc bpf: Fix propagation of signed bounds from 64-bit min/max into 32-bit.
32df0ac1c97b bpf: Fix propagation of bounds from 64-bit min/max into 32-bit and var_off.
4c4491e856a0 cgroup: Fix rootcg cpu.stat guest double counting
2e510c262523 skmsg: Lose offset info in sk_psock_skb_ingress
8777d613b23f ibmvnic: delay complete()
93d1d1bd0d58 ibmvnic: Process crqs after enabling interrupts
611e75876907 ibmvnic: don't stop queue in xmit
b7bf97fc5621 udp6: allow SO_MARK ctrl msg to affect routing
e39668a15aa2 selftests/bpf: Fix fclose/pclose mismatch in test_progs
8cf265bafd33 crypto: pcrypt - Delay write to padata->info
1d0709398213 selftests: net: bridge: update IGMP/MLD membership interval value
fe5bffbf6214 net: bridge: fix uninitialized variables when BRIDGE_CFM is disabled
d4fe67943ae4 net: phylink: avoid mvneta warning when setting pause parameters
148557b62d51 ipmi: kcs_bmc: Fix a memory leak in the error handling path of 'kcs_bmc_serio_add_device()'
5139ace7231d net: amd-xgbe: Toggle PLL settings during rate change
c329460af68e sctp: return true only for pathmtu update in sctp_transport_pl_toobig
8880eccbc789 sctp: subtract sctphdr len in sctp_transport_pl_hlen
777591117cd9 sctp: reset probe_timer in sctp_transport_pl_update
269b14dd6e10 sctp: allow IP fragmentation when PLPMTUD enters Error state
af1d4c7c44a9 selftests/bpf: Fix memory leak in test_ima
a75f4f978bab selftests/bpf: Fix fd cleanup in sk_lookup test
317a0c71ba61 drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits
7f71a6a3bc4a drm/amdgpu: fix a potential memory leak in amdgpu_device_fini_sw()
a05760ad9460 wcn36xx: Channel list update before hardware scan
00da55838d50 bpf: Fixes possible race in update_prog_stats() for 32bit arches
81fe843efb4c wcn36xx: Fix discarded frames due to wrong sequence number
ff3948bc3d2a wcn36xx: add proper DMA memory barriers in rx path
65980896b216 libertas: Fix possible memory leak in probe and disconnect
e44f7a7cba46 libertas_tf: Fix possible memory leak in probe and disconnect
dd49c41472de KVM: s390: Fix handle_sske page fault handling
239e87d9f646 samples/kretprobes: Fix return value if register_kretprobe() failed
e1ff40b6194f x86: Fix __get_wchan() for !STACKTRACE
e9ede14c116f sched: Add wrapper for get_wchan() to keep task blocked
38bdcbf9828f spi: spi-rpc-if: Check return value of rpcif_sw_init()
e0eb459df7b2 cpufreq: intel_pstate: Fix cpu->pstate.turbo_freq initialization
ea3c5c9eabc2 tcp: don't free a FIN sk_buff in tcp_remove_empty_skb()
e6b885849667 libbpf: Fix endianness detection in BPF_CORE_READ_BITFIELD_PROBED()
a003933e5579 tpm_tis_spi: Add missing SPI ID
8d43e218d53e tpm: fix Atmel TPM crash caused by too frequent queries
71e3f2ea7765 blk-cgroup: synchronize blkg creation against policy deactivation
71711bee74a4 block: ataflop: more blk-mq refactoring fixes
8b19699ff671 ath10k: fix module load regression with iram-recovery feature
1ac33d3510a6 ARM: 9142/1: kasan: work around LPAE build warning
5b01c24de282 net: dsa: avoid refcount warnings when ->port_{fdb,mdb}_del returns error
3fb2e953a38b irq: mips: avoid nested irq_enter()
0238de13d5ef KVM: s390: pv: avoid stalls for kvm_s390_pv_init_vm
848686bc72d6 KVM: s390: pv: avoid double free of sida page
679a612a0d6a s390/uv: fully validate the VMA before calling follow_page()
dcc9648cd192 s390/mm: fix VMA and page table handling code in storage key handling functions
783d5c1c009e s390/mm: validate VMA in PGSTE manipulation functions
591aa785c1a9 s390/gmap: don't unconditionally call pte_unmap_unlock() in __gmap_zap()
4fe9c6d097da s390/gmap: validate VMA in __gmap_zap()
d3601801b028 mt76: mt7615: mt7622: fix ibss and meshpoint
7462b70c2cb9 libbpf: Fix BTF header parsing checks
6eefcdb58847 libbpf: Fix overflow in BTF sanity checks
a526d92e239c bpftool: Avoid leaking the JSON writer prepared for program metadata
f1890b3e95ae libbpf: Fix memory leak in btf__dedup()
f0c966094386 KVM: selftests: Fix nested SVM tests when built with clang
3c26214f5114 smackfs: use netlbl_cfg_cipsov4_del() for deleting cipso_v4_doi
951f277ddeff crypto: tcrypt - fix skcipher multi-buffer tests for 1420B blocks
161b7ee0ab62 drm/msm: Fix potential NULL dereference in DPU SSPP
958d4b4dce1f x86/sev: Fix stack type check in vc_switch_off_ist()
eb82db5a1cb8 clocksource/drivers/timer-ti-dm: Select TIMER_OF
d2a0b63348ee PM: hibernate: fix sparse warnings
78a3123bafca nvme-rdma: fix error code in nvme_rdma_setup_ctrl
846394ea4227 nbd: Fix use-after-free in pid_show
3218ca577dc0 phy: micrel: ksz8041nl: do not use power down mode
6565d4b25229 net: enetc: unmap DMA in enetc_send_cmd()
f3b6b7f2124b iwlwifi: pnvm: read EFI data only if long enough
c0ee10049f0f iwlwifi: pnvm: don't kmemdup() more than we have
4925a9dc91ca iwlwifi: mvm: reset PM state on unsuccessful resume
150eeb5ecbb8 mwifiex: Send DELBA requests according to spec
b1aa768ec157 rsi: stop thread firstly in rsi_91x_init() error handling
3ccaadc5bd57 mt76: mt7915: fix muar_idx in mt7915_mcu_alloc_sta_req()
3a94ccdd929c mt76: mt7915: fix sta_rec_wtbl tag len
97d6c316e1aa mt76: connac: fix possible NULL pointer dereference in mt76_connac_get_phy_mode_v2
e1b1873523e4 mt76: mt7615: fix monitor mode tear down crash
754ce9d4062f mt76: mt7921: fix retrying release semaphore without end
5c6abb953396 mt76: mt7915: fix possible infinite loop release semaphore
3ff001be2c29 mt76: mt7615: fix hwmon temp sensor mem use-after-free
dd879ab927a3 mt76: mt7915: fix hwmon temp sensor mem use-after-free
3fe59d13aba0 mt76: mt7921: always wake device if necessary in debugfs
98967931f70f mt76: mt7921: fix kernel warning from cfg80211_calculate_bitrate
3ca3a4255e4e mt76: mt7921: fix firmware usage of RA info using legacy rates
a71eba425307 mt76: mt7921: report HE MU radiotap
f75989a2a4dd mt76: overwrite default reg_ops if necessary
1b2e3a89897f mt76: connac: fix GTK rekey offload failure on WPA mixed mode
c29855c0c1ed mt76: mt7921: fix dma hang in rmmod
d2697e6d8129 mt76: mt7915: fix bit fields for HT rate idx
b7282c7d0dc8 mt76: mt7915: fix potential overflow of eeprom page index
a95ec17c67a4 mt76: mt7921: Fix out of order process by invalid event pkt
37af03f35908 mt76: mt76x02: fix endianness warnings in mt76x02_mac.c
02c06f2be95b mt76: mt7921: fix survey-dump reporting
d0e327a1646e mt76: fix build error implicit enumeration conversion
3a41d47d19ee mt76: connac: fix mt76_connac_gtk_rekey_tlv usage
93b3fa91782c mt76: mt7915: fix info leak in mt7915_mcu_set_pre_cal()
31a67f6c7c93 mt76: mt7615: fix endianness warning in mt7615_mac_write_txwi
b442c8a72323 mt76: mt7921: fix endianness warning in mt7921_update_txs
07b8ee848c28 mt76: mt7915: fix endianness warning in mt7915_mac_add_txs_skb
5d1a084a476c mt76: mt7921: fix endianness in mt7921_mcu_tx_done_event
07b20f34a965 drm/amdkfd: Fix an inappropriate error handling in allloc memory of gpu
2c57dbc453d3 ACPI: PM: Fix sharing of wakeup power resources
f04fab5d90fa ACPI: PM: Turn off unused wakeup power resources
bc568fe55a17 platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
77de203d9a4f block: ataflop: fix breakage introduced at blk-mq refactoring
d43d31346658 mmc: mxs-mmc: disable regulator on error and in the remove function
8901914cdbd4 media: ir_toy: assignment to be16 should be of correct type
146e4bf44d61 media: ivtv: fix build for UML
471ed2202bd3 mailbox: Remove WARN_ON for async_cb.cb in cmdq_exec_done
4437f3ead9e8 net: stream: don't purge sk_error_queue in sk_stream_kill_queues()
eed8766a9941 drm/msm: uninitialized variable in msm_gem_import()
fe7dcde39db7 drm/msm: fix potential NULL dereference in cleanup
5c13d4be499c drm/msm: potential error pointer dereference in init()
723d2914d817 drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
bc4555ffd158 thermal/core: fix a UAF bug in __thermal_cooling_device_register()
650d1a2865e4 crypto: octeontx2 - set assoclen in aead_do_fallback()
24dfa642985f tcp: switch orphan_count to bare per-cpu counters
f270511247a5 x86: Fix get_wchan() to support the ORC unwinder
5652137ef653 net: tulip: winbond-840: fix build for UML
638d1283bbfc net: fealnx: fix build for UML
25d40b828fb8 kernel/sched: Fix sched_fork() access an invalid sched_task_group
27d16d8ec1a8 ath10k: fix max antenna gain unit
a57627b2ea67 hwmon: (pmbus/lm25066) Let compiler determine outer dimension of lm25066_coeff
4b898aa013d8 hwmon: Fix possible memleak in __hwmon_device_register()
b9e2477e4de4 net, neigh: Fix NTF_EXT_LEARNED in combination with NTF_USE
646dabb85ef7 memstick: jmb38x_ms: use appropriate free function in jmb38x_ms_alloc_host()
d288021988e0 memstick: avoid out-of-range warning
a5b536f042a4 mmc: sdhci-omap: Fix context restore
eab2681ca5bb mmc: sdhci-omap: Fix NULL pointer exception if regulator is not configured
e1628b6b6b7d gve: Track RX buffer allocation failures
89dda8da289e gve: Recover from queue stall due to missed IRQ
b8ba47d732d1 b43: fix a lower bounds test
7d14ae503c24 b43legacy: fix a lower bounds test
84328828d834 IMA: block writes of the security.ima xattr with unsupported algorithms
db75642768d2 hwrng: mtk - Force runtime pm ops for sleep ops
64bf6a343144 crypto: qat - disregard spurious PFVF interrupts
db60c3b02f4c crypto: qat - detect PFVF collision after ACK
693fc7e84bed crypto: ccree - avoid out-of-range warnings from clang
a0de5d1b841c media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()
d16af0011cef media: venus: fix vpp frequency calculation for decoder
da821525882f netfilter: nft_dynset: relax superfluous check on set updates
05f2a14a2e4f rcu: Always inline rcu_dynticks_task*_{enter,exit}()
8dd1a500b7d8 EDAC/amd64: Handle three rank interleaving mode
dea84d9cfac2 x86/insn: Use get_unaligned() instead of memcpy()
4a1a695bee9e PM: EM: Fix inefficient states detection
e6335aef8b0f ath9k: Fix potential interrupt storm on queue reset
fe0c577b43e3 ath10k: Don't always treat modem stop events as crashes
ee85728ec044 media: em28xx: Don't use ops->suspend if it is NULL
2b942c364b77 cpuidle: Fix kobject memory leaks in error paths
94b691048402 drm: fb_helper: fix CONFIG_FB dependency
f28f2b20d05f crypto: ecc - fix CRYPTO_DEFAULT_RNG dependency
056e9bf9b4df kprobes: Do not use local variable when creating debugfs file
0706df90bcbf scs: Release kasan vmalloc poison in scs_free process
e3e9d565039b media: atmel: fix the ispck initialization
b3aa49fa1883 media: cx23885: Fix snd_card_free call on null card pointer
c6ac15417184 media: tm6000: Avoid card name truncation
7d87109753dd media: si470x: Avoid card name truncation
861532494e53 media: radio-wl1273: Avoid card name truncation
9e6a5f20278a media: sun6i-csi: Allow the video device to be open multiple times
80ef29aee4fe media: i2c: ths8200 needs V4L2_ASYNC
36c371057306 media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
0dd8fc82fa04 media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
e3a8abdb8f34 media: TDA1997x: handle short reads of hdmi info frame.
0d25488ab9a8 media: mtk-vcodec: venc: fix return value when start_streaming fails
a1120f37dfc4 media: v4l2-ioctl: S_CTRL output the right value
7d4317208c32 media: imx258: Fix getting clock frequency
f7baee6e0dd9 media: dvb-usb: fix ununit-value in az6027_rc_query
1505c5758932 media: ttusb-dec: avoid release of non-acquired mutex
ae0abe0db3f6 media: cxd2880-spi: Fix a null pointer dereference on error handling path
195ba4c00fd0 media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_s_ctrl()'
d3accf5edd7c media: em28xx: add missing em28xx_close_extension
051b36e399db libbpf: Fix skel_internal.h to set errno on loader retval < 0
5019c6127eb1 drm/amdgpu: fix warning for overflow check
75bf90feb4a6 arm64: mm: update max_pfn after memory hotplug
59f0c96b3f7a drm/ttm: stop calling tt_swapin in vm_access
61104f1c0083 ath10k: sdio: Add missing BH locking around napi_schdule()
bdf3ddbf83f0 ath10k: Fix missing frame timestamp for beacon/probe-resp
5e1f85a23ae0 gve: DQO: avoid unused variable warnings
b35a9d47203b ath11k: Fix memory leak in ath11k_qmi_driver_event_work
9b404c64784d ath11k: fix packet drops due to incorrect 6 GHz freq value in rx status
afc36b6469bb ath11k: Avoid race during regd updates
aad8db659de2 ath11k: fix some sleeping in atomic bugs
24615ed29c06 net: dsa: rtl8366: Fix a bug in deleting VLANs
356b67db7834 net: dsa: rtl8366rb: Fix off-by-one bug
d759e6c0c090 cfg80211: always free wiphy specific regdomain
76ef0d62e488 fortify: Fix dropped strcpy() compile-time write overflow check
b17b52fe984d rxrpc: Fix _usecs_to_jiffies() by using usecs_to_jiffies()
188e62c48a53 qed: Don't ignore devlink allocation failures
b402ea43f6d1 bnxt_en: Check devlink allocation and registration status
30f53d14efb1 crypto: caam - disable pkc for non-E SoCs
d2891d4b5a2e drm/amdgpu: move amdgpu_virt_release_full_gpu to fini_early stage
9777ecdce80d Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync
5c4f876eb2c6 wilc1000: fix possible memory leak in cfg_scan_result()
aa5324ab2f01 wcn36xx: Fix Antenna Diversity Switching
fa6aafb2411d cgroup: Make rebind_subsystems() disable v2 controllers all at once
9a7121cc8189 spi: Fixed division by zero warning
a69330b102ba drm: bridge: it66121: Fix return value it66121_probe
83285fa94ee4 net: phylink: don't call netif_carrier_off() with NULL netdev
246ea42a7b4e net: net_namespace: Fix undefined member in key_remove_domain()
391cdce61e3d lockdep: Let lock_is_held_type() detect recursive read as read
4adc275eba8a virtio-gpu: fix possible memory allocation failure
376bd99969e5 drm/v3d: fix wait for TMU write combiner flush
35d945ef6ac8 objtool: Handle __sanitize_cov*() tail calls
a9f61b66edc8 x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
8d5eda239810 MIPS: lantiq: dma: fix burst length for DEU
67761195ad83 rcu: Fix existing exp request check in sync_sched_exp_online_cleanup()
47a4b733e8ff libbpf: Don't crash on object files with no symbol tables
db63399389bc Bluetooth: fix init and cleanup of sco_conn.timeout_work
061fb293a9dc drm/bridge: it66121: Wait for next bridge to be probed
0bf7139300d0 drm/bridge: it66121: Initialize {device,vendor}_ids
18919d23f7aa drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()
f53dc812a258 fbdev/efifb: Release PCI device's runtime PM ref during FB destroy
f0d5bf1ecb13 selftests/bpf: Fix strobemeta selftest regression
d6a0aa933c86 netfilter: conntrack: set on IPS_ASSURED if flows enters internal stream state
68af9d200661 parisc/kgdb: add kgdb_roundup() to make kgdb work with idle polling
db209b320754 parisc/unwind: fix unwinder when CONFIG_64BIT is enabled
2ce1c884ad0b erofs: don't trigger WARN() when decompression fails
a55c2f265b80 task_stack: Fix end_of_stack() for architectures with upwards-growing stack
3129c659e256 parisc: fix warning in flush_tlb_all
65fadad6022d perf/x86/intel: Fix ICL/SPR INST_RETIRED.PREC_DIST encodings
f206bd751daa selftests/core: fix conflicting types compile error for close_range()
9be249debf4d drm/amd/display: dcn20_resource_construct reduce scope of FPU enabled
2acb2cdcfc83 x86/hyperv: Protect set_hv_tscchange_cb() against getting preempted
19f1aba96f85 ftrace: do CPU checking after preemption disabled
a48bd49ee871 Revert "wcn36xx: Enable firmware link monitoring"
944285a03956 wcn36xx: Fix packet drop on resume
478d239fea12 wcn36xx: Correct band/freq reporting on RX
3874ef316cfe spi: bcm-qspi: Fix missing clk_disable_unprepare() on error in bcm_qspi_probe()
9124f94eeeb1 btrfs: do not take the uuid_mutex in btrfs_rm_device
55c9fca5f56d btrfs: reflink: initialize return value to 0 in btrfs_extent_same()
e9941a010249 ACPI: resources: Add one more Medion model in IRQ override quirk
efa7308f7821 ACPI: AC: Quirk GK45 to skip reading _PSR
6cbda510dc1b net: annotate data-race in neigh_output()
5b37f3fa42b4 vrf: run conntrack only in context of lower/physdev for locally generated packets
e43cb595915c tools/latency-collector: Use correct size when writing queue_full_warning
56d7461776e0 ARM: 9136/1: ARMv7-M uses BE-8, not BE-32
7da4447dbbec gfs2: Fix glock_hash_walk bugs
9b6a3985dc13 gfs2: Cancel remote delete work asynchronously
b108a79345c3 can: bittiming: can_fixup_bittiming(): change type of tseg1 and alltseg to unsigned int
3d9d9a77cdbe gre/sit: Don't generate link-local addr if addr_gen_mode is IN6_ADDR_GEN_MODE_NONE
69bfb5d7122e ARM: clang: Do not rely on lr register for stacktrace
002f1d6c7758 smackfs: use __GFP_NOFAIL for smk_cipso_doi()
6dbc76b0a53d iwlwifi: mvm: disable RX-diversity in powersave
6cf3abbda574 selftests/bpf: Fix perf_buffer test on system with offline cpus
65b5763eef82 selftests: kvm: fix mismatched fclose() after popen()
2093b1cdbdbf PM: hibernate: Get block device exclusively in swsusp_check()
cff152d77d9b arm64: vdso32: suppress error message for 'make mrproper'
c6065239b7cb nvme: drop scan_lock and always kick requeue list when removing namespaces
1e757b23aabe nvmet-tcp: fix use-after-free when a port is removed
844bbc958d8e nvmet-rdma: fix use-after-free when a port is removed
f252a62a2507 nvmet: fix use-after-free when a port is removed
9adc2bcdc812 drm/amdgpu/pm: properly handle sclk for profiling modes on vangogh
163ecd64c816 media: allegro: ignore interrupt if mailbox is not initialized
f63b9287375c block: remove inaccurate requeue check
bd45e6f3c0e9 iwlwifi: change all JnP to NO-160 configuration
8393c0806cc4 mwl8k: Fix use-after-free in mwl8k_fw_state_machine()
0ca511d52a28 mt76: mt7915: fix an off-by-one bound check
91dc3f6ea7c8 tracing/cfi: Fix cmp_entries_* functions signature mismatch
ab816ffa09d5 workqueue: make sysfs of unbound kworker cpumask more clever
75bbf9642bd1 lib/xz: Validate the value before assigning it to an enum variable
93cc20fa51e8 lib/xz: Avoid overlapping memcpy() with invalid input with in-place decompression
419ebe663671 locking/rwsem: Disable preemption for spinning region
38d7055de41a memstick: r592: Fix a UAF bug when removing the driver
ac14b0b119a4 md: update superblock after changing rdev flags in state_store
ca9ae3fb3315 floppy: fix calling platform_device_unregister() on invalid drives
8a6e8aa37207 block: bump max plugged deferred size from 16 to 32
f5ec8022cf54 thermal/drivers/tsens: Add timeout to get_temp_tsens_valid
cdcfcd25f40b drm/msm: prevent NULL dereference in msm_gpu_crashstate_capture()
6154aa2ab2e0 thermal/core: Fix null pointer dereference in thermal_release()
2fba88c1705d leaking_addresses: Always print a trailing newline
57cdc39776d3 net: phy: micrel: make *-skew-ps check more lenient
7e4804d1aa82 drm/amdkfd: fix resume error when iommu disabled in Picasso
082ed61dabbc drm/amd/display: fix null pointer deref when plugging in display
c40061dab6b1 ACPI: scan: Release PM resources blocked by unused objects
afdc107129b5 ACPI: battery: Accept charges over the design capacity as full
8fa361b1b3e3 iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
af2af71fd12b mmc: moxart: Fix reference count leaks in moxart_probe
07a47bb0fba3 ath: dfs_pattern_detector: Fix possible null-pointer dereference in channel_detector_create()
b40f43fcd011 tracing: Disable "other" permission bits in the tracefs files
3d2f0cd9dcb9 tracefs: Have tracefs directories not set OTH permission bits by default
2a3c1044fc0d drm/amdkfd: rm BO resv on validation to avoid deadlock
84aa6d0e0767 net-sysfs: try not to restart the syscall if it will fail eventually
8e538cacf9be media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
35f16d8e6153 media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
d43da0118953 media: ipu3-imgu: imgu_fmt: Handle properly try
986b39450c48 media: imx-jpeg: Fix possible null pointer dereference
86d9d52d6856 ice: Move devlink port to PF/VF struct
f6afa36d653f cpufreq: Make policy min/max hard requirements
86a6e4f9815a ACPICA: Avoid evaluating methods too early during system resume
72742ae5e049 kselftests/sched: cleanup the child processes
aa171d3e8556 fs/proc/uptime.c: Fix idle time reporting in /proc/uptime
09bdbbc622e3 ipmi: Disable some operations during a panic
d051a3867bea media: rcar-csi2: Add checking to rcsi2_start_receiver()
f31b7caedd50 brcmfmac: Add DMI nvram filename quirk for Cyberbook T116 tablet
39e14b269e27 rtw88: fix RX clock gate setting while fifo dump
f431d9923a69 ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
1f7d5294d2a7 media: mceusb: return without resubmitting URB in case of -EPROTO error.
6e0202ddccfb media: rcar-vin: Use user provided buffers when starting
352c818df095 media: imx: set a media_device bus_info string
8636c37018c3 media: videobuf2: rework vb2_mem_ops API
ee347b739d51 media: s5p-mfc: Add checking to s5p_mfc_probe().
6980d237fd4c media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
eb7da28fd166 media: vidtv: Fix memory leak in remove
2529c6a15579 media: uvcvideo: Set unique vdev name based in type
c115bfec8193 media: uvcvideo: Return -EIO for control errors
c0890fb5f421 media: uvcvideo: Set capability in s_param
7426dad05aaa media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
8277ec5aa8c5 media: atomisp: Fix error handling in probe
2ba21729c208 media: netup_unidvb: handle interrupt properly according to the firmware
2a1061af333e media: mt9p031: Fix corrupted frame after restarting stream
d808c6ee0c60 octeontx2-pf: Enable promisc/allmulti match MCAM entries.
2a27405cfaa5 ath10k: high latency fixes for beacon buffer
fb34da024434 ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when map reinjected packets
d08b51d94747 ath11k: add handler for scan event WMI_SCAN_EVENT_DEQUEUED
08de8bf704a5 ath11k: Avoid reg rules update during firmware recovery
b584bd228614 selftests: net: fib_nexthops: Wait before checking reported idle time
9ea7c08eb634 drm/amd/display: Fix null pointer dereference for encoders
adb3b9b2a550 drm/amdgpu: Fix MMIO access page fault
40cfb8e68aa0 fscrypt: allow 256-bit master keys with AES-256-XTS
53283ee464c3 spi: Check we have a spi_device_id for each DT compatible
6cd93f39dd2b mwifiex: Properly initialize private structure on interface type changes
7871a1156efd mwifiex: Run SET_BSS_MODE when changing from P2P to STATION vif-type
41592079230a x86: Increase exception stack sizes
bb3cc292e1a2 x86/mm/64: Improve stack overflow warnings
35512e506690 crypto: aesni - check walk.nbytes instead of err
b1b32bcc221a ath11k: Align bss_chan_info structure with firmware
8ed576395f6a smackfs: Fix use-after-free in netlbl_catmap_walk()
3f55b610b488 rcu-tasks: Move RTGS_WAIT_CBS to beginning of rcu_tasks_kthread() loop
0fcd85c7f3a1 ACPI: resources: Add DMI-based legacy IRQ override quirk
8a6214e36ff2 net: sched: update default qdisc visibility after Tx queue cnt changes
4f0ca9344d9e locking/lockdep: Avoid RCU-induced noinstr fail
134cef7b6974 MIPS: lantiq: dma: reset correct number of channel
1415242fd96b MIPS: lantiq: dma: add small delay after reset
f3b5ecab2735 platform/x86: wmi: do not fail if disabling fails
d50100c17038 rcutorture: Avoid problematic critical section nesting on PREEMPT_RT
5aad1e68ff1e drm/panel-orientation-quirks: add Valve Steam Deck
b87da982da1b Bluetooth: fix use-after-free error in lock_sock_nested()
2c2b295af72e Bluetooth: sco: Fix lock_sock() blockage by memcpy_from_msg()
9314415aaed7 drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book 10.6
491defc1c9d6 drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-in-1
b7a63c785ae6 drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (v2)
e158f9b7feea dma-buf: WARN on dmabuf release with pending attachments
5493d7e67ec7 component: do not leave master devres group open after bind
10f54634341d power: supply: max17042_battery: Clear status bits in interrupt handler
ad80b75ab97f USB: chipidea: fix interrupt deadlock
b4b4c4b1499f USB: iowarrior: fix control-message timeouts
c852092e5692 most: fix control-message timeouts
2685d8b506da serial: 8250: fix racy uartclk update
bd7ac40cbfe8 USB: serial: keyspan: fix memleak on probe errors
93198e6da9eb Documentation:devicetree:bindings:iio:dac: Fix val
8bc3eac174aa iio: ad5770r: make devicetree property reading consistent
a664d4a75c07 iio: dac: ad5446: Fix ad5622_write() return value
e99fa2a9f9d7 drivers: iio: dac: ad5766: Fix dt property name
a9501b2bfc91 iio: buffer: Fix memory leak in iio_buffer_register_legacy_sysfs_groups()
46bb49301f46 iio: buffer: Fix memory leak in __iio_buffer_alloc_sysfs_and_mask()
3827d12e1a80 iio: buffer: Fix memory leak in iio_buffers_alloc_sysfs_and_mask()
364ee3057abd iio: buffer: check return value of kstrdup_const()
fdd9d3e268cf coresight: trbe: Defer the probe on offline CPUs
ddffd384d44c coresight: trbe: Fix incorrect access of the sink specific data
13de015c782d coresight: cti: Correct the parameter for pm_runtime_put
7a0a1d45b318 pinctrl: core: fix possible memory leak in pinctrl_enable()
217ece6c45a8 cifs: set a minimum of 120s for next dns resolution
49f933bb3016 cifs: To match file servers, make sure the server hostname matches
5d0714e7d979 quota: correct error number in free_dqentry()
b2d7d1845799 quota: check block number when reading the block in quota file
2830878daf16 PCI: aardvark: Fix support for PCI_ROM_ADDRESS1 on emulated bridge
a298da0df043 PCI: aardvark: Set PCI Bridge Class Code to PCI Bridge
17099eb5978b PCI: aardvark: Fix support for PCI_BRIDGE_CTL_BUS_RESET on emulated bridge
137f450a17a0 PCI: aardvark: Fix support for bus mastering and PCI_COMMAND on emulated bridge
dba8de2c8771 PCI: aardvark: Read all 16-bits from PCIE_MSI_PAYLOAD_REG
937f91f8f621 PCI: aardvark: Fix return value of MSI domain .alloc() method
b775cd868cf3 PCI: aardvark: Fix configuring Reference clock
7083088eb99f PCI: aardvark: Fix reporting Data Link Layer Link Active
8b74250f05fb PCI: aardvark: Do not unmask unused interrupts
ca41077ee082 PCI: aardvark: Fix checking for link up via LTSSM state
b05c2e6638df PCI: aardvark: Do not clear status bits of masked interrupts
1110d1921cd3 cxl/pci: Fix NULL vs ERR_PTR confusion
f6c83346fbe5 PCI: cadence: Add cdns_plat_pcie_probe() missing return
a4935eef58d2 PCI: pci-bridge-emul: Fix emulation of W1C bits
500a1bac743c ovl: fix use after free in struct ovl_aio_req
88e9929b632e xen/balloon: add late_initcall_sync() for initial ballooning done
7373f03ae79c ifb: fix building without CONFIG_NET_CLS_ACT
0d546e9fc83b serial: core: Fix initializing and restoring termios speed
2348cadfddfd ring-buffer: Protect ring_buffer_reset() from reentrancy
6f67cf08fef0 powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
9028e051345b iio: adc: tsc2046: fix scan interval warning
299623b1b088 can: j1939: j1939_can_recv(): ignore messages with invalid source address
a6591eb3c58b can: j1939: j1939_tp_cmd_recv(): ignore abort message in the BAM transport
22237bb988c1 KVM: nVMX: Handle dynamic MSR intercept toggling
8a5180ecdcb6 KVM: nVMX: Query current VMCS when determining if MSR bitmaps are in use
ab71116b1f07 KVM: x86: Add helper to consolidate core logic of SET_CPUID{2} flows
da10e2d30634 KVM: x86: Fix recording of guest steal time / preempted status
b83f9cdc8066 KVM: arm64: Extract ESR_ELx.EC only
b594bf02dc6f iio: core: check return value when calling dev_set_name()
76289ff637ec iio: core: fix double free in iio_device_unregister_sysfs()
7c0f37ace715 power: supply: max17042_battery: use VFSOC for capacity when no rsns
6edf86431107 power: supply: max17042_battery: Prevent int underflow in set_soc_threshold
cb178acf8764 mtd: rawnand: socrates: Keep the driver compatible with on-die ECC engines
3c6ffb9bb1ea soc: fsl: dpio: use the combined functions to protect critical zone
54be06958eb4 soc: fsl: dpio: replace smp_processor_id with raw_smp_processor_id
38ae173cb7cf soc: samsung: exynos-pmu: Fix compilation when nothing selects CONFIG_MFD_CORE
d3586ddc9889 signal/mips: Update (_save|_restore)_fp_context to fail with -EFAULT
9f3e024e6483 memory: renesas-rpc-if: Correct QSPI data transfer in Manual mode
b70a29116278 signal: Remove the bogus sigkill_pending in ptrace_stop
0509d911b94e ASoC: tegra: Restore AC97 support
64c65655758b ASoC: tegra: Set default card name for Trimslice
0aef11438832 RDMA/qedr: Fix NULL deref for query_qp on the GSI QP
7ed060a0ea38 perf/x86/intel/uncore: Fix Intel ICX IIO event constraints
2e11d51006ac perf/x86/intel/uncore: Fix invalid unit check
425e486c72d6 perf/x86/intel/uncore: Support extra IMC channel on Ice Lake server
a3d5adaee5ac rsi: Fix module dev_oper_mode parameter description
c76421bd155f rsi: fix rate mask set leading to P2P failure
437ce21d2076 rsi: fix key enabled check causing unwanted encryption for vap_id > 0
3945a7308f0d rsi: fix occasional initialisation failure with BT coex
471e28ecee8c wcn36xx: handle connection loss indication
4c13483e1fa4 libata: fix checking of DMA state
1a0963d1d448 mwifiex: Try waking the firmware until we get an interrupt
e5fbcd97b4be mwifiex: Read a PCI register after writing the TX ring write pointer
ad34c5f90c2c PM: sleep: Do not let "syscore" devices runtime-suspend during system transitions
0f2d037e8ae9 wcn36xx: Fix (QoS) null data frame bitrate/modulation
ec82bede563b wcn36xx: Fix tx_status mechanism
52da1f9c5e9c wcn36xx: Fix HT40 capability for 2Ghz band
91fa7ec38256 HID: surface-hid: Allow driver matching for target ID 1 devices
4d55b85a1598 HID: surface-hid: Use correct event registry for managing HID events
6979b6f294c0 mt76: mt7615: fix skb use-after-free on mac reset
7761ffec11da platform/surface: aggregator_registry: Add support for Surface Laptop Studio
dd6c06c4538c ifb: Depend on netfilter alternatively to tc
2cd65a22a478 evm: mark evm_fixmode as __ro_after_init
e426e7842ee3 rtl8187: fix control-message timeouts
bab67ca269f9 PCI: Mark Atheros QCA6174 to avoid bus reset
0d74280d5dd9 ath10k: fix division by zero in send path
b5b911da1b16 ath10k: fix control-message timeout
abd6b17ca36f ath6kl: fix control-message timeout
dbe62858b49f ath6kl: fix division by zero in send path
96d108642240 mwifiex: fix division by zero in fw download path
2bbb56b7c305 EDAC/sb_edac: Fix top-of-high-memory value for Broadwell/Haswell
8f3420977c98 regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
79814094ec44 regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
5f31bc9bc695 hwmon: (pmbus/lm25066) Add offset coefficients
b3ebc3edaf92 md/raid1: only allocate write behind bio for WriteMostly device
dde0b4bd579f ipmi:watchdog: Set panic count to proper value on a panic
035d39cd5d36 selinux: fix race condition when computing ocontext SIDs
a2973f00755f ia64: kprobes: Fix to pass correct trampoline address to the handler
9a32b765fba3 KVM: PPC: Tick accounting should defer vtime accounting 'til after IRQ handling
fe2a3d975e27 KVM: VMX: Unregister posted interrupt wakeup handler on hardware unsetup
fe5827e78a1f btrfs: call btrfs_check_rw_degradable only if there is a missing device
12707e6406b5 btrfs: fix lost error handling when replaying directory deletes
a32bd15ddf38 btrfs: clear MISSING device status bit in btrfs_close_one_device
f73ba2e80142 tools/testing/selftests/vm/split_huge_page_test.c: fix application of sizeof to pointer
4bc152c6cd23 net/smc: Correct spelling mistake to TCPF_SYN_RECV
c5f3e2b44a3a net/smc: Fix smc_link->llc_testlink_time overflow
0019c6dc00d1 nfp: bpf: relax prog rejection for mtu check through max_pkt_offset
f108635d6d2f vmxnet3: do not stop tx queues after netif_device_detach()
2c8c7971019e r8169: Add device 10ec:8162 to driver r8169
0fb585017f75 net: hns3: ignore reset event before initialization process is done
4294c96432c3 net: hns3: change hclge/hclgevf workqueue to WQ_UNBOUND mode
a61294791f26 nvmet-tcp: fix header digest verification
a09a649a7677 block: schedule queue restart after BLK_STS_ZONE_RESOURCE
36d8544a8824 drm: panel-orientation-quirks: Add quirk for GPD Win3
c0c99f6c2c2d watchdog: Fix OMAP watchdog early handling
9498f85e5cac net: multicast: calculate csum of looped-back and forwarded packets
492ee5c41ad0 spi: spl022: fix Microwire full duplex mode
4b133d1b1f48 nvmet-tcp: fix a memory leak when releasing a queue
c1a4e29fbd7a xen/netfront: stop tx queues during live migration
7b0e2228b45b gpio: mlxbf2.c: Add check for bgpio_init failure
045e201e846d bpf: Prevent increasing bpf_jit_limit above max
1f889b6bb36d bpf: Define bpf_jit_alloc_exec_limit for arm64 JIT
589d0c47b3b6 bpf: Define bpf_jit_alloc_exec_limit for riscv JIT
24864d828c73 fcnal-test: kill hanging ping/nettest binaries on cleanup
a4754c6f2c02 drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
dc93fe4bcffb spi: altera: Change to dynamic allocation of spi id
4916836b835e mmc: winbond: don't build on M68K
315f06005ed7 reset: socfpga: add empty driver allowing consumers to probe
6010e9d34c89 ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode
9068b17616de hyperv/vmbus: include linux/bitops.h
b84379371620 sfc: Don't use netif_info before net_device setup
7c25ad465426 sfc: Export fibre-specific supported link modes
83cc3d21cbcd cavium: Fix return values of the probe function
ee25673d8fae mISDN: Fix return values of the probe function
77fe2d67962b scsi: qla2xxx: Fix unmap of already freed sgl
54aaf0fddfcd scsi: qla2xxx: Return -ENOMEM if kzalloc() fails
7cc5b87e86a1 cavium: Return negative value when pci_alloc_irq_vectors() fails
7958b5d479b0 net: mscc: ocelot: Add of_node_put() before goto
3f7c0466d4dc net: sparx5: Add of_node_put() before goto
5586508b6c21 ptp: fix error print of ptp_kvm on X86_64 platform
b1d565357899 ALSA: hda/realtek: Fixes HP Spectre x360 15-eb1xxx speakers
0529cf90b489 ASoC: cs42l42: Ensure 0dB full scale volume is used for headsets
a1cd1d08acb4 ASoC: soc-core: fix null-ptr-deref in snd_soc_del_component_unlocked()
093801ba8fe6 KVM: arm64: Report corrupted refcount at EL2
b466d8ef1233 x86/iopl: Fake iopl(3) CLI/STI usage
bfa448e241cd x86/irq: Ensure PI wakeup handler is unregistered before module unload
38ce12ffb27f x86/cpu: Fix migration safety with X86_BUG_NULL_SEL
d61cc6067d08 x86/sme: Use #define USE_EARLY_PGTABLE_L5 in mem_encrypt_identity.c
78f5cc4a3261 fuse: fix page stealing
521423148dfe ext4: refresh the ext4_ext_path struct after dropping i_data_sem.
54939d4ce87c ext4: ensure enough credits in ext4_ext_shift_path_extents
11768f7391ba ext4: fix lazy initialization next schedule time computation in more granular unit
3d96ccb1ef2a ALSA: timer: Unconditionally unlink slave instances, too
147405da05f5 ALSA: timer: Fix use-after-free problem
a493519fd98d ALSA: PCM: Fix NULL dereference at mmap checks
975cc9314162 ALSA: synth: missing check for possible NULL after the call to kstrdup
b6cb248aaa9a ALSA: hda: Free card instance properly at probe errors
e266789d8122 ALSA: usb-audio: Add registration quirk for JBL Quantum 400
3c71ff248ac6 ALSA: usb-audio: Line6 HX-Stomp XL USB_ID for 48k-fixed quirk
4b2f167789cd ALSA: mixer: fix deadlock in snd_mixer_oss_set_volume
0b879c816c0d ALSA: mixer: oss: Fix racy access to slots
3ab56cd15d22 ALSA: line6: fix control and interrupt message timeouts
c725f34ab982 ALSA: 6fire: fix control and bulk message timeouts
9bdf3120931f ALSA: ua101: fix division by zero at probe
733de916ec6b ALSA: hda/realtek: Add quirk for HP EliteBook 840 G7 mute LED
0a6fef615cd9 ALSA: hda/realtek: Add quirk for ASUS UX550VE
139ea889a60c ALSA: hda/realtek: Add a quirk for Acer Spin SP513-54N
1b0ca1a942a7 ALSA: hda/realtek: Headset fixup for Clevo NH77HJQ
09a84058016c ALSA: hda/realtek: Add quirk for Clevo PC70HS
d7d34eed508b ALSA: hda/realtek: Add a quirk for HP OMEN 15 mute LED
f35d48489cb7 ALSA: hda/realtek: Fix mic mute LED for the HP Spectre x360 14
47331981d71d media: v4l2-ioctl: Fix check_ext_ctrls
9d496fff4dfc media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
7577c6c1321a media: rkvdec: Support dynamic resolution changes
1c83764a8385 media: ite-cir: IR receiver stop working after receive overflow
ac698bd66a5c media: rkvdec: Do not override sizeimage for output format
cfb1311f92e1 crypto: s5p-sss - Add error handling in s5p_aes_probe()
ea5654a13b2e firmware/psci: fix application of sizeof to pointer
e06c0c6b038b tpm: Check for integer overflow in tpm2_map_response_body()
d0775031766f parisc: Fix ptrace check on syscall return
1af62b51aa5e parisc: Fix set_fixmap() on PA1.x CPUs
d4c5e024d73f exfat: fix incorrect loading of i_blocks for large files
de6acc5e6a95 mmc: dw_mmc: Dont wait for DRTO on Write RSP error
088a27043b2b mmc: mtk-sd: Add wait dma stop done flow
7038cb714d12 char: xillybus: fix msg_ep UAF in xillyusb_probe()
e1d2af3c9164 ce/gf100: fix incorrect CE0 address calculation on some GPUs
69e269a766b4 scsi: qla2xxx: Fix use after free in eh_abort path
5282d10eeaf0 scsi: qla2xxx: Fix kernel crash when accessing port_speed sysfs file
5fc7e0e194ff scsi: lpfc: Fix FCP I/O flush functionality for TMF routines
2080931c7849 scsi: lpfc: Don't release final kref on Fport node while ABTS outstanding
9bfe4b77333d scsi: core: Remove command size deduction from scsi_setup_scsi_cmnd()
0806efcadf8e scsi: core: Avoid leaving shost->last_reset with stale value if EH does not run
9020b4adf3a6 ocfs2: fix data corruption on truncate
762722cfd0a0 libata: fix read log timeout value
7f94e05338f5 Input: i8042 - Add quirk for Fujitsu Lifebook T725
94e0a6bc4130 Input: elantench - fix misreporting trackpoint coordinates
f9ccab9a050d Input: iforce - fix control-message timeout
d725957f4630 usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform
8eb1d2c82122 xhci: Fix USB 3.1 enumeration issues by increasing roothub power-on-good delay

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index a328c6211f..7dcab51f01 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b9d37d8650cd3787d60516496f60178c51564a59"
-SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
+SRCREV_machine ?= "b18aaa90f5ce15336aacf4cc24c7a086aeb4bc84"
+SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.18"
+LINUX_VERSION ?= "5.14.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 98947900a4..23062df3b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.18"
+LINUX_VERSION ?= "5.14.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "83004545c9bb5e3ad666b3ffa9ad723eb795881a"
-SRCREV_machine ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
+SRCREV_machine:qemuarm ?= "159f57f8e022351d5193e51c02c951f2e255db1a"
+SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 673c03d82e..aa7bf53682 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "992053c4ec826932d9256ea4e1ad8686e4ea5375"
-SRCREV_machine:qemuarm64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemumips ?= "e362a5e68da1cca6ad77a27cbda02116edc9864d"
-SRCREV_machine:qemuppc ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemuriscv64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemuriscv32 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemux86 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemux86-64 ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_machine:qemumips64 ?= "90b773a3236f213b62d2d4ab23cca9c695bc8383"
-SRCREV_machine ?= "8411a30747a2750c9d4dbe24631958bd00d3157e"
-SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
+SRCREV_machine:qemuarm ?= "5ca7fd91b258a07ed1b6f38593ff8c48cc574b1c"
+SRCREV_machine:qemuarm64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemumips ?= "1e7a6d0d29015bf1f383cf5f52fc451c1969561d"
+SRCREV_machine:qemuppc ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemuriscv64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemuriscv32 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemux86 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemux86-64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_machine:qemumips64 ?= "f6646a344afbf6cacc91cbeaaec4240b372dd192"
+SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
+SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "4e79d0b09290482ffb891e6b4acb3c7447b9c94d"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "a0265dd8262de73457aaa3ce1c5938dc152b8085"
+SRCREV_machine:class-devupstream ?= "545728d9e08593767dd55192b0324dd4f9b71151"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.18"
+LINUX_VERSION ?= "5.14.21"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

