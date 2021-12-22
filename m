Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 09/14] linux-yocto/5.4: update to v5.4.162
Date: Wed, 22 Dec 2021 04:12:22 -1000
Message-Id: <638171722cc6bfde01bf71a83af1a7c104ec54aa.1640181998.git.steve@sakoman.com>
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

9334f48f5673 Linux 5.4.162
46a8e16fcf2c ALSA: hda: hdac_stream: fix potential locking issue in snd_hdac_stream_assign()
293385739d68 ALSA: hda: hdac_ext_stream: fix potential locking issues
201340ca4eb7 hugetlbfs: flush TLBs correctly after huge_pmd_unshare
e7891b22b251 tlb: mmu_gather: add tlb_flush_*_range APIs
10e34766d8ac ice: Delete always true check of PF pointer
101485e566ce usb: max-3421: Use driver data instead of maintaining a list of bound devices
4e1b3e718f24 ASoC: DAPM: Cover regression by kctl change notification fix
56a32c82761a batman-adv: Don't always reallocate the fragmentation skb head
08bceb1e30c2 batman-adv: Reserve needed_*room for fragments
374c55d416ab batman-adv: Consider fragmentation for needed_headroom
9eff9854f82d perf/core: Avoid put_page() when GUP fails
e0122ea133cd Revert "net: mvpp2: disable force link UP during port init procedure"
4efa2509d3aa drm/amdgpu: fix set scaling mode Full/Full aspect/Center not works on vga and dvi connectors
c0276de0be48 drm/i915/dp: Ensure sink rate values are always valid
1c4af56ffbfb drm/nouveau: use drm_dev_unplug() during device removal
9e98622aa508 drm/udl: fix control-message timeout
52affc201fc2 cfg80211: call cfg80211_stop_ap when switch from P2P_GO type
ca9834a1148b parisc/sticon: fix reverse colors
670f6b3867c8 btrfs: fix memory ordering between normal and ordered work functions
1c3882215946 udf: Fix crash after seekdir
f79957d274b0 s390/kexec: fix memory leak of ipl report buffer
b0e44dfb4e4c x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
f2e0cd42f198 mm: kmemleak: slob: respect SLAB_NOLEAKTRACE flag
95de3703a1d0 ipc: WARN if trying to remove ipc object which is absent
8997bb6d1ecc hexagon: export raw I/O routines for modules
01a7ecd36d1e tun: fix bonding active backup with arp monitoring
7c8f778f0a3a arm64: vdso32: suppress error message for 'make mrproper'
e636f65b3d8f s390/kexec: fix return code handling
cc093e5a966d perf/x86/intel/uncore: Fix IIO event constraints for Skylake Server
cc63a789d80d perf/x86/intel/uncore: Fix filter_tid mask for CHA events on Skylake Server
47a810817823 KVM: PPC: Book3S HV: Use GLOBAL_TOC for kvmppc_h_set_dabr/xdabr()
307d2e6cebfc NFC: reorder the logic in nfc_{un,}register_device
da3a87eeb990 drm/nouveau: hdmigv100.c: fix corrupted HDMI Vendor InfoFrame
e418bb556ff8 NFC: reorganize the functions in nci_request
bbb8376d58ac i40e: Fix display error code in dmesg
69e5d27af579 i40e: Fix creation of first queue by omitting it if is not power of two
5564e9129f1f i40e: Fix ping is lost after configuring ADq on VF
8509178dc001 i40e: Fix changing previously set num_queue_pairs for PFs
c30162da9132 i40e: Fix NULL ptr dereference on VSI filter sync
0a0308af22a5 i40e: Fix correct max_pkt_size on VF RX queue
fb2dbc124a7f net: virtio_net_hdr_to_skb: count transport header in UFO
d74ff10ed2d9 net: dpaa2-eth: fix use-after-free in dpaa2_eth_remove
8b2c66b0f2a0 net: sched: act_mirred: drop dst for the direction from egress to ingress
edd783162bf2 scsi: core: sysfs: Fix hang when device state is set via sysfs
446882f216ac platform/x86: hp_accel: Fix an error handling path in 'lis3lv02d_probe()'
453b5b614b93 mips: lantiq: add support for clk_get_parent()
477653f3e4e4 mips: bcm63xx: add support for clk_get_parent()
426fed211b49 MIPS: generic/yamon-dt: fix uninitialized variable error
67334abd4fb7 iavf: Fix for the false positive ASQ/ARQ errors while issuing VF reset
98f3badc414f iavf: validate pointers
92cecf349121 iavf: prevent accidental free of filter structure
63f032a956ed iavf: Fix failure to exit out from last all-multicast mode
926e8c83d4c1 iavf: free q_vectors before queues in iavf_disable_vf
f0222e7eee0c iavf: check for null in iavf_fix_features
b5638bc64a69 net: bnx2x: fix variable dereferenced before check
fbba0692ec4b perf tests: Remove bash construct from record+zstd_comp_decomp.sh
9e0df711f8db perf bench futex: Fix memory leak of perf_cpu_map__new()
642fc22210a5 perf bpf: Avoid memory leak from perf_env__insert_btf()
6bf5523090a7 RDMA/netlink: Add __maybe_unused to static inline in C file
ef82c3716a5a tracing/histogram: Do not copy the fixed-size char array field over the field size
80b777606925 tracing: Save normal string variables
8928e31a776a sched/core: Mitigate race cpus_share_cache()/update_top_cache_domain()
a93a58bae950 mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL is set
05311b9192be clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk
ee1317e1f4b0 clk/ast2600: Fix soc revision for AHB
d6c32b4c83f6 clk: ingenic: Fix bugs with divided dividers
982d31ba5533 sh: define __BIG_ENDIAN for math-emu
214cd15d3675 sh: math-emu: drop unused functions
3d774e776f68 sh: fix kconfig unmet dependency warning for FRAME_POINTER
7727659e45f8 f2fs: fix up f2fs_lookup tracepoints
d7c612f6b1f3 maple: fix wrong return value of maple_bus_init().
9823ba8f17f8 sh: check return code of request_irq
94292e4577a2 powerpc/dcr: Use cmplwi instead of 3-argument cmpli
c6d2cefdd05c ALSA: gus: fix null pointer dereference on pointer block
513543f1eda1 powerpc/5200: dts: fix memory node unit name
3a9eae47a550 iio: imu: st_lsm6dsx: Avoid potential array overflow in st_lsm6dsx_set_odr()
a3ecee8a8fd7 scsi: target: Fix alua_tg_pt_gps_count tracking
14934afd4f5d scsi: target: Fix ordered tag handling
1ab3b4f4f46f MIPS: sni: Fix the build
d491c84df5c4 tty: tty_buffer: Fix the softlockup issue in flush_to_ldisc
80709beddb8d ALSA: ISA: not for M68K
2f8cda43c415 ARM: dts: ls1021a-tsn: use generic "jedec,spi-nor" compatible for flash
723c1af01c35 ARM: dts: ls1021a: move thermal-zones node out of soc/
f98986b7acb4 usb: host: ohci-tmio: check return value after calling platform_get_resource()
e187c2f3f25e ARM: dts: omap: fix gpmc,mux-add-data type
3b9d8d3e4af2 firmware_loader: fix pre-allocated buf built-in firmware use
cc248790bfdc scsi: advansys: Fix kernel pointer leak
bcc1eac0bd49 ASoC: nau8824: Add DMI quirk mechanism for active-high jack-detect
c9428e13417d clk: imx: imx6ul: Move csi_sel mux to correct base register
e5f8c43c8546 ASoC: SOF: Intel: hda-dai: fix potential locking issue
cb074c00b71a arm64: dts: freescale: fix arm,sp805 compatible string
a14d7038ea20 arm64: dts: qcom: msm8998: Fix CPU/L2 idle state latency and residency
30dcfcda8992 usb: typec: tipd: Remove WARN_ON in tps6598x_block_read
3ee15f1af174 usb: musb: tusb6010: check return value after calling platform_get_resource()
ba9579f832bd RDMA/bnxt_re: Check if the vlan is valid before reporting
bf6a633b0736 arm64: dts: hisilicon: fix arm,sp805 compatible string
16bcbfb56d75 scsi: lpfc: Fix list_add() corruption in lpfc_drain_txq()
51c94d6aee59 ARM: dts: NSP: Fix mpcore, mmc node names
1390f32ea964 arm64: zynqmp: Fix serial compatible string
31df0f0f1882 arm64: zynqmp: Do not duplicate flash partition label property
5c088fba39af Linux 5.4.161
b786cb3236e1 erofs: fix unsafe pagevec reuse of hooked pclusters
83de35ae27a1 erofs: remove the occupied parameter from z_erofs_pagevec_enqueue()
b37f6da8c3fc PCI: Add MSI masking quirk for Nvidia ION AHCI
db1390b60e89 PCI/MSI: Deal with devices lying about their MSI mask capability
49b55a7792ec PCI/MSI: Destroy sysfs before freeing entries
7186be970c11 parisc/entry: fix trace test in syscall exit path
258c42a8fb31 fortify: Explicitly disable Clang support
4f9a3cda1660 scsi: ufs: Fix tm request when non-fatal error happens
c468f9249d84 ext4: fix lazy initialization next schedule time computation in more granular unit
307c6f728728 MIPS: Fix assembly error from MIPSr2 code used within MIPS_ISA_ARCH_LEVEL
7be773a0288e scsi: ufs: Fix interrupt error message for shared interrupts
e3c97ba4a69e soc/tegra: pmc: Fix imbalanced clock disabling in error code path
17efa1a44c7f Linux 5.4.160
66bd28d6be90 selftests/bpf: Fix also no-alu32 strobemeta selftest
e7ea088cd030 ath10k: fix invalid dma_addr_t token assignment
20a951afb7d5 SUNRPC: Partial revert of commit 6f9f17287e78
5b7a0a4f7cbe PCI: Add PCI_EXP_DEVCTL_PAYLOAD_* macros
256a1e009b9b powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier during module unload
fe02d37870c9 s390/cio: make ccw_device_dma_* more robust
8a8d007bae0e s390/tape: fix timer initialization in tape_std_assign()
5ef14af16629 s390/cio: check the subchannel validity for dev_busid
b0989ae51d01 video: backlight: Drop maximum brightness override for brightness zero
66938ba12857 mm, oom: do not trigger out_of_memory from the #PF
d6648b55ed39 mm, oom: pagefault_out_of_memory: don't force global OOM for dying tasks
c6f9a5c11a91 powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
453b779d2b8f powerpc/security: Add a helper to query stf_barrier type
84b3fbfd8ed8 powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
7edda4bd9eb9 powerpc/bpf: Validate branch ranges
0347c001c909 powerpc/lib: Add helper to check if offset is within conditional branch range
c4461ca7a835 ovl: fix deadlock in splice write
8d750efc8dd6 9p/net: fix missing error check in p9_check_errors
aba12bb38b10 net, neigh: Enable state migration between NUD_PERMANENT and NTF_USE
223985fa1b5f f2fs: should use GFP_NOFS for directory inodes
af73b240e09e irqchip/sifive-plic: Fixup EOI failed when masked
53014c1c4162 parisc: Fix set_fixmap() on PA1.x CPUs
645d6dfdcb0b parisc: Fix backtrace to always include init funtion names
62c4e0a3d81a ARM: 9156/1: drop cc-option fallbacks for architecture selection
61a5e446bbff ARM: 9155/1: fix early early_iounmap()
dc3357424610 selftests/net: udpgso_bench_rx: fix port argument
dd3a418ba5e6 cxgb4: fix eeprom len when diagnostics not implemented
1800c9eecd5e net/smc: fix sk_refcnt underflow on linkdown and fallback
b2d1b6624bde vsock: prevent unnecessary refcnt inc for nonblocking connect
72aca95f958e net: hns3: allow configure ETS bandwidth of all TCs
07b218db54a4 net/sched: sch_taprio: fix undefined behavior in ktime_mono_to_any
18f2809441ef bpf: sockmap, strparser, and tls are reusing qdisc_skb_cb and colliding
180a9b539cf6 arm64: pgtable: make __pte_to_phys/__phys_to_pte_val inline functions
572599cbf17a nfc: pn533: Fix double free when pn533_fill_fragment_skbs() fails
c1d5f943bbc3 llc: fix out-of-bound array index in llc_sk_dev_hash()
bdf94057aae6 perf bpf: Add missing free to bpf_event__print_bpf_prog_info()
23def86bbf71 zram: off by one in read_block_state()
d26835de40db mm/zsmalloc.c: close race window between zs_pool_dec_isolated() and zs_unregister_migration()
46d695e870c4 bonding: Fix a use-after-free problem when bond_sysfs_slave_add() failed
dce69e0a065d ACPI: PMIC: Fix intel_pmic_regs_handler() read accesses
700602b662d7 net: vlan: fix a UAF in vlan_dev_real_dev()
98e0ab88f435 net: davinci_emac: Fix interrupt pacing disable
70ecaadb49c2 xen-pciback: Fix return in pm_ctrl_init()
7f57b9bc8ee6 i2c: xlr: Fix a resource leak in the error handling path of 'xlr_i2c_probe()'
53ad06ff3b4e NFSv4: Fix a regression in nfs_set_open_stateid_locked()
c9dcb51ae473 scsi: qla2xxx: Turn off target reset during issue_lip
211f08d1ffc8 scsi: qla2xxx: Fix gnl list corruption
9b180f3c2d92 ar7: fix kernel builds for compiler test
59e97c74d159 watchdog: f71808e_wdt: fix inaccurate report in WDIOC_GETTIMEOUT
162a1cfcd5ca m68k: set a default value for MEMORY_RESERVE
9770f8c29f81 signal/sh: Use force_sig(SIGKILL) instead of do_group_exit(SIGKILL)
9e6985190f04 dmaengine: dmaengine_desc_callback_valid(): Check for `callback_result`
fd1de3590123 netfilter: nfnetlink_queue: fix OOB when mac header was cleared
15351d5e8bb4 soc: fsl: dpaa2-console: free buffer before returning from dpaa2_console_read
be832f781dc4 auxdisplay: ht16k33: Fix frame buffer device blanking
c441943075fd auxdisplay: ht16k33: Connect backlight to fbdev
1fa9803de9e3 auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
e63507ea4369 dmaengine: at_xdmac: fix AT_XDMAC_CC_PERID() macro
04317e74745a mtd: core: don't remove debugfs directory if device is in use
59929f9a573a mtd: spi-nor: hisi-sfc: Remove excessive clk_disable_unprepare()
a83aaf15077e fs: orangefs: fix error return code of orangefs_revalidate_lookup()
c79c37c77550 NFS: Fix deadlocks in nfs_scan_commit_list()
5a893e0eab16 opp: Fix return in _opp_add_static_v2()
98ac69821650 PCI: aardvark: Fix preserving PCI_EXP_RTCTL_CRSSVE flag on emulated bridge
819925eff0c5 PCI: aardvark: Don't spam about PIO Response Status
bab1cfec7ae2 drm/plane-helper: fix uninitialized variable reference
4b48c6ede329 pnfs/flexfiles: Fix misplaced barrier in nfs4_ff_layout_prepare_ds
2b2fdb6f4892 rpmsg: Fix rpmsg_create_ept return when RPMSG config is not defined
bd48bdbfd9c4 apparmor: fix error check
a7b294764945 power: supply: bq27xxx: Fix kernel crash on IRQ handler register error
3f698d97f7c5 mips: cm: Convert to bitfield API to fix out-of-bounds access
fb7b73cd9418 powerpc/44x/fsp2: add missing of_node_put
d3dd1a057c9a HID: u2fzero: properly handle timeouts in usb_submit_urb
b216a39b3212 HID: u2fzero: clarify error check and length calculations
fae0552d83ff serial: xilinx_uartps: Fix race condition causing stuck TX
818e100c2bf4 phy: qcom-qusb2: Fix a memory leak on probe
de43e75917bc ASoC: cs42l42: Defer probe if request_threaded_irq() returns EPROBE_DEFER
f00ff5357b61 ASoC: cs42l42: Correct some register default values
baf5c1225eb2 ARM: dts: stm32: fix SAI sub nodes register range
bb74ce1feb36 staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
73aaa6222ac7 RDMA/mlx4: Return missed an error if device doesn't support steering
20dfad97dbd6 scsi: csiostor: Uninitialized data in csio_ln_vnp_read_cbfn()
5ead6f4feaa7 power: supply: rt5033_battery: Change voltage values to µV
fdbe8e8a08bf usb: gadget: hid: fix error code in do_config()
15355466cded serial: 8250_dw: Drop wrong use of ACPI_PTR()
d8241e7a2144 video: fbdev: chipsfb: use memset_io() instead of memset()
e7df004eb14e clk: at91: check pmc node status before registering syscore ops
44a2dcd146dc memory: fsl_ifc: fix leak of irq and nand_irq in fsl_ifc_ctrl_probe
03fe35ce9a0e soc/tegra: Fix an error handling path in tegra_powergate_power_up()
543d85602f9c arm: dts: omap3-gta04a4: accelerometer irq fix
7cf7d9b83d79 ALSA: hda: Reduce udelay() at SKL+ position reporting
d1cf71d79e00 JFS: fix memleak in jfs_mount
56911ee5375f MIPS: loongson64: make CPU_LOONGSON64 depends on MIPS_FP_SUPPORT
ee49b6598cfb scsi: dc395: Fix error case unwinding
dd49dee254db ARM: dts: at91: tse850: the emac<->phy interface is rmii
1df7102f265b arm64: dts: meson-g12a: Fix the pwm regulator supply properties
681c58f34434 RDMA/bnxt_re: Fix query SRQ failure
50eca29537b0 ARM: dts: qcom: msm8974: Add xo_board reference clock to DSI0 PHY
863e71a3afb7 arm64: dts: rockchip: Fix GPU register width for RK3328
6694960195b7 ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
d27580c1b027 clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths
9212ebb1c6d8 RDMA/rxe: Fix wrong port_cap_flags
cf234bc5fbd8 ibmvnic: Process crqs after enabling interrupts
bc4061648176 ibmvnic: don't stop queue in xmit
a91c8ee2ed84 udp6: allow SO_MARK ctrl msg to affect routing
9ff14503f498 selftests/bpf: Fix fclose/pclose mismatch in test_progs
af51aa2b8586 crypto: pcrypt - Delay write to padata->info
9be9cb2a2be4 net: phylink: avoid mvneta warning when setting pause parameters
077410c7907c net: amd-xgbe: Toggle PLL settings during rate change
63a3b1af0474 drm/amdgpu/gmc6: fix DMA mask from 44 to 40 bits
9ca0d107428b wcn36xx: add proper DMA memory barriers in rx path
a3256ae45b0d libertas: Fix possible memory leak in probe and disconnect
427583b93d5a libertas_tf: Fix possible memory leak in probe and disconnect
2339ff4162a6 KVM: s390: Fix handle_sske page fault handling
3f3b4054e214 samples/kretprobes: Fix return value if register_kretprobe() failed
9435b2f9c006 tcp: don't free a FIN sk_buff in tcp_remove_empty_skb()
a8226599cbab irq: mips: avoid nested irq_enter()
ae5a24464872 s390/gmap: don't unconditionally call pte_unmap_unlock() in __gmap_zap()
8fb436d146c7 libbpf: Fix BTF data layout checks and allow empty BTF
03a818c09677 smackfs: use netlbl_cfg_cipsov4_del() for deleting cipso_v4_doi
12ccb5737925 drm/msm: Fix potential NULL dereference in DPU SSPP
dc18f0806297 clocksource/drivers/timer-ti-dm: Select TIMER_OF
c523474f2a45 PM: hibernate: fix sparse warnings
0d22f55014d2 nvme-rdma: fix error code in nvme_rdma_setup_ctrl
67ba6c8e715f phy: micrel: ksz8041nl: do not use power down mode
ae213c059a8b mwifiex: Send DELBA requests according to spec
3a781e213164 rsi: stop thread firstly in rsi_91x_init() error handling
ad4cd0130757 mt76: mt76x02: fix endianness warnings in mt76x02_mac.c
bdbc9311f10f platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
3446e5ecdf91 block: ataflop: fix breakage introduced at blk-mq refactoring
2918a29fc8ba mmc: mxs-mmc: disable regulator on error and in the remove function
b631c603b5fb net: stream: don't purge sk_error_queue in sk_stream_kill_queues()
f27fbff86280 drm/msm: uninitialized variable in msm_gem_import()
32ac072c24b5 ath10k: fix max antenna gain unit
218fb43ffff0 hwmon: (pmbus/lm25066) Let compiler determine outer dimension of lm25066_coeff
8384c4a7bcb3 hwmon: Fix possible memleak in __hwmon_device_register()
f7fd072039d6 net, neigh: Fix NTF_EXT_LEARNED in combination with NTF_USE
9498f5272a44 memstick: jmb38x_ms: use appropriate free function in jmb38x_ms_alloc_host()
5f462b38ce7a memstick: avoid out-of-range warning
3a7525d5d7bf mmc: sdhci-omap: Fix NULL pointer exception if regulator is not configured
dc73f7cae11d b43: fix a lower bounds test
1b6365fdae77 b43legacy: fix a lower bounds test
c51ac7fd0256 hwrng: mtk - Force runtime pm ops for sleep ops
52d2cdab5288 crypto: qat - disregard spurious PFVF interrupts
4d7881430ffb crypto: qat - detect PFVF collision after ACK
a3d3f9c5dca3 media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()
73dd601bec0d netfilter: nft_dynset: relax superfluous check on set updates
62f6260f7065 EDAC/amd64: Handle three rank interleaving mode
f399e650c095 ath9k: Fix potential interrupt storm on queue reset
843ff688eb83 media: em28xx: Don't use ops->suspend if it is NULL
e577924b7021 cpuidle: Fix kobject memory leaks in error paths
18fdbdbecf72 crypto: ecc - fix CRYPTO_DEFAULT_RNG dependency
a993159a2ad0 kprobes: Do not use local variable when creating debugfs file
71411bd79e24 media: cx23885: Fix snd_card_free call on null card pointer
1c2c8030e7eb media: tm6000: Avoid card name truncation
61266f852fb5 media: si470x: Avoid card name truncation
4e65b9ec2158 media: radio-wl1273: Avoid card name truncation
8eeec127d5cf media: mtk-vpu: Fix a resource leak in the error handling path of 'mtk_vpu_probe()'
2b9ae7bac92e media: TDA1997x: handle short reads of hdmi info frame.
23b65152a069 media: dvb-usb: fix ununit-value in az6027_rc_query
e2b2d221a446 media: cxd2880-spi: Fix a null pointer dereference on error handling path
f46da0c6af3a media: em28xx: add missing em28xx_close_extension
14f3d77c770d drm/amdgpu: fix warning for overflow check
465dc8a1b1c1 ath10k: Fix missing frame timestamp for beacon/probe-resp
7c12c2fe4568 net: dsa: rtl8366rb: Fix off-by-one bug
674637270edd rxrpc: Fix _usecs_to_jiffies() by using usecs_to_jiffies()
d4cd7a167c87 crypto: caam - disable pkc for non-E SoCs
555fe5734d39 Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync
8c68d12f1a37 wilc1000: fix possible memory leak in cfg_scan_result()
1713b856345d cgroup: Make rebind_subsystems() disable v2 controllers all at once
bd76ec43f14e net: net_namespace: Fix undefined member in key_remove_domain()
3a37742128ea virtio-gpu: fix possible memory allocation failure
606c95078a4e drm/v3d: fix wait for TMU write combiner flush
6a93d8ebb8aa rcu: Fix existing exp request check in sync_sched_exp_online_cleanup()
6237a1685c28 Bluetooth: fix init and cleanup of sco_conn.timeout_work
28c1d965622f selftests/bpf: Fix strobemeta selftest regression
f2c04d46c8de netfilter: conntrack: set on IPS_ASSURED if flows enters internal stream state
0c2acfede5ac parisc/kgdb: add kgdb_roundup() to make kgdb work with idle polling
cbe28724277c parisc/unwind: fix unwinder when CONFIG_64BIT is enabled
a9a411adcac8 task_stack: Fix end_of_stack() for architectures with upwards-growing stack
c06cf3b1d049 parisc: fix warning in flush_tlb_all
732441923321 x86/hyperv: Protect set_hv_tscchange_cb() against getting preempted
ad67a7e2ab13 spi: bcm-qspi: Fix missing clk_disable_unprepare() on error in bcm_qspi_probe()
a15fc58933aa btrfs: do not take the uuid_mutex in btrfs_rm_device
aba1db41dde7 net: annotate data-race in neigh_output()
2f78cb7eccb6 vrf: run conntrack only in context of lower/physdev for locally generated packets
5919f02e185b ARM: 9136/1: ARMv7-M uses BE-8, not BE-32
d99f320a1b7e gre/sit: Don't generate link-local addr if addr_gen_mode is IN6_ADDR_GEN_MODE_NONE
9929b3db46c9 ARM: clang: Do not rely on lr register for stacktrace
681a426e6ba4 smackfs: use __GFP_NOFAIL for smk_cipso_doi()
4752a9c3a079 iwlwifi: mvm: disable RX-diversity in powersave
41e583edb1d2 selftests: kvm: fix mismatched fclose() after popen()
4411d0d8df2b PM: hibernate: Get block device exclusively in swsusp_check()
a528d3aac3ef nvme: drop scan_lock and always kick requeue list when removing namespaces
209c39b3f5e9 nvmet-tcp: fix use-after-free when a port is removed
81d11e40fdbb nvmet: fix use-after-free when a port is removed
1ec1ca2be9c6 block: remove inaccurate requeue check
bfde056402c7 mwl8k: Fix use-after-free in mwl8k_fw_state_machine()
e4af3e42ba1e tracing/cfi: Fix cmp_entries_* functions signature mismatch
caeb6bae7553 workqueue: make sysfs of unbound kworker cpumask more clever
58b4e0c075d5 lib/xz: Validate the value before assigning it to an enum variable
8cdab20660f0 lib/xz: Avoid overlapping memcpy() with invalid input with in-place decompression
eb8f087201b5 memstick: r592: Fix a UAF bug when removing the driver
2226ad031436 leaking_addresses: Always print a trailing newline
63c3c7b699d2 ACPI: battery: Accept charges over the design capacity as full
2efb81b22d2d iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
d5fb057f2364 ath: dfs_pattern_detector: Fix possible null-pointer dereference in channel_detector_create()
e2c27194fcd9 tracefs: Have tracefs directories not set OTH permission bits by default
ace6e7fe9645 net-sysfs: try not to restart the syscall if it will fail eventually
d8d1d3540561 media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()
382e7b6458e4 media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
e5f9be486976 media: ipu3-imgu: imgu_fmt: Handle properly try
cdf338e1dbf1 ACPICA: Avoid evaluating methods too early during system resume
9ff00d0b1d35 ipmi: Disable some operations during a panic
4bba26f89e66 media: rcar-csi2: Add checking to rcsi2_start_receiver()
c08a655ed938 brcmfmac: Add DMI nvram filename quirk for Cyberbook T116 tablet
f64551db5299 ia64: don't do IA64_CMPXCHG_DEBUG without CONFIG_PRINTK
31b784864736 media: mceusb: return without resubmitting URB in case of -EPROTO error.
e419469adfd4 media: imx: set a media_device bus_info string
b2b2f9178250 media: s5p-mfc: Add checking to s5p_mfc_probe().
6b8ab552e24c media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_probe()
bc4af8c782eb media: uvcvideo: Set unique vdev name based in type
7a646855d6a0 media: uvcvideo: Return -EIO for control errors
ab7fca0eaefb media: uvcvideo: Set capability in s_param
bff0833e2b7a media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()
cede36511c3b media: netup_unidvb: handle interrupt properly according to the firmware
3fe3d04354ae media: mt9p031: Fix corrupted frame after restarting stream
08743f9c4801 ath10k: high latency fixes for beacon buffer
fadb4cd750f4 mwifiex: Properly initialize private structure on interface type changes
7d3e6635c22a mwifiex: Run SET_BSS_MODE when changing from P2P to STATION vif-type
480c240ab6df x86: Increase exception stack sizes
91b9c23b6d5b smackfs: Fix use-after-free in netlbl_catmap_walk()
31df731c8705 net: sched: update default qdisc visibility after Tx queue cnt changes
a82f379378ab locking/lockdep: Avoid RCU-induced noinstr fail
f14eca60bf23 MIPS: lantiq: dma: reset correct number of channel
ca07aff2575d MIPS: lantiq: dma: add small delay after reset
e5ea3dca9497 platform/x86: wmi: do not fail if disabling fails
b57df4d6fc13 drm/panel-orientation-quirks: add Valve Steam Deck
67bd269a84ce Bluetooth: fix use-after-free error in lock_sock_nested()
d416020f1a9c Bluetooth: sco: Fix lock_sock() blockage by memcpy_from_msg()
a52bd11b2410 drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book 10.6
e5ca76568a61 drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200 2-in-1
c19cabfa5537 drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk (v2)
46a25b7a25a0 dma-buf: WARN on dmabuf release with pending attachments
1bee9e59c67b USB: chipidea: fix interrupt deadlock
8a643c0f95e8 USB: iowarrior: fix control-message timeouts
32858116748e USB: serial: keyspan: fix memleak on probe errors
8ce0bc6962df iio: dac: ad5446: Fix ad5622_write() return value
f01e16d32495 pinctrl: core: fix possible memory leak in pinctrl_enable()
270541cbc056 quota: correct error number in free_dqentry()
10b808307d37 quota: check block number when reading the block in quota file
a509a515f378 PCI: aardvark: Read all 16-bits from PCIE_MSI_PAYLOAD_REG
0ea58b9bb9cf PCI: aardvark: Fix return value of MSI domain .alloc() method
ee9cdca4d61b PCI: aardvark: Fix reporting Data Link Layer Link Active
6f99c7a51e0a PCI: aardvark: Do not unmask unused interrupts
d964886327ba PCI: aardvark: Fix checking for link up via LTSSM state
e0269c0c81b8 PCI: aardvark: Do not clear status bits of masked interrupts
50b0ce94fbcc PCI: pci-bridge-emul: Fix emulation of W1C bits
3d995568c9bb xen/balloon: add late_initcall_sync() for initial ballooning done
3f6255a91bf3 ALSA: mixer: fix deadlock in snd_mixer_oss_set_volume
6225a31b2eb6 ALSA: mixer: oss: Fix racy access to slots
e9adf72bdbd5 serial: core: Fix initializing and restoring termios speed
b535b634645f powerpc/85xx: Fix oops when mpc85xx_smp_guts_ids node cannot be found
bfefc5d6f953 can: j1939: j1939_can_recv(): ignore messages with invalid source address
94a3f521e3b6 can: j1939: j1939_tp_cmd_recv(): ignore abort message in the BAM transport
8e61c799c81e KVM: nVMX: Query current VMCS when determining if MSR bitmaps are in use
654a8248169e power: supply: max17042_battery: use VFSOC for capacity when no rsns
11129762e31a power: supply: max17042_battery: Prevent int underflow in set_soc_threshold
625c3ed247e1 signal/mips: Update (_save|_restore)_fp_context to fail with -EFAULT
ec5ef8d4d795 signal: Remove the bogus sigkill_pending in ptrace_stop
28c70d50363d RDMA/qedr: Fix NULL deref for query_qp on the GSI QP
91a29609bd6f rsi: Fix module dev_oper_mode parameter description
9defe9b1ab34 rsi: fix rate mask set leading to P2P failure
2f1f06be3eb5 rsi: fix key enabled check causing unwanted encryption for vap_id > 0
1fa1da8a60ff rsi: fix occasional initialisation failure with BT coex
398e7e5add0c wcn36xx: handle connection loss indication
4a67355383f3 libata: fix checking of DMA state
6f2f91b9df15 mwifiex: Read a PCI register after writing the TX ring write pointer
3991cdc40fc1 wcn36xx: Fix HT40 capability for 2Ghz band
301d33c95441 evm: mark evm_fixmode as __ro_after_init
e1f71a32899a rtl8187: fix control-message timeouts
76d2ce7ca9dc PCI: Mark Atheros QCA6174 to avoid bus reset
3110371c7af6 ath10k: fix division by zero in send path
2b94d10056f9 ath10k: fix control-message timeout
cfbe74d8b131 ath6kl: fix control-message timeout
1a2fe1c3d87f ath6kl: fix division by zero in send path
78ebff828a33 mwifiex: fix division by zero in fw download path
08501eb9ff6a EDAC/sb_edac: Fix top-of-high-memory value for Broadwell/Haswell
a147922924ab regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
c9e5a005960b regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS is disabled
3baa5886d128 hwmon: (pmbus/lm25066) Add offset coefficients
98bea923793f ia64: kprobes: Fix to pass correct trampoline address to the handler
ddb54bf3b764 btrfs: call btrfs_check_rw_degradable only if there is a missing device
5223324ed1a9 btrfs: fix lost error handling when replaying directory deletes
c25984fa182f btrfs: clear MISSING device status bit in btrfs_close_one_device
87a87c82f7f3 net/smc: Correct spelling mistake to TCPF_SYN_RECV
cc14499b9dde nfp: bpf: relax prog rejection for mtu check through max_pkt_offset
a62d43084165 vmxnet3: do not stop tx queues after netif_device_detach()
17dcecf20ce7 r8169: Add device 10ec:8162 to driver r8169
e84b38e57821 nvmet-tcp: fix header digest verification
2804181e1b91 drm: panel-orientation-quirks: Add quirk for GPD Win3
7273488fd373 watchdog: Fix OMAP watchdog early handling
5ffdddcf28a1 net: multicast: calculate csum of looped-back and forwarded packets
9420e2496d45 spi: spl022: fix Microwire full duplex mode
1a667bc32918 nvmet-tcp: fix a memory leak when releasing a queue
2f3860ba601a xen/netfront: stop tx queues during live migration
de649ec7ad84 bpf: Prevent increasing bpf_jit_limit above max
df8665c3983e bpf: Define bpf_jit_alloc_exec_limit for arm64 JIT
8dd688ba675a drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
c4282bb80519 mmc: winbond: don't build on M68K
05f0a97e2ff7 reset: socfpga: add empty driver allowing consumers to probe
dfa8fb782b52 ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode
f09014e8bea8 hyperv/vmbus: include linux/bitops.h
054fe50d2654 sfc: Don't use netif_info before net_device setup
82005afbb30b cavium: Fix return values of the probe function
9f5fd5aab85f scsi: qla2xxx: Fix unmap of already freed sgl
96183337e97d scsi: qla2xxx: Return -ENOMEM if kzalloc() fails
8e3a0d28edb6 cavium: Return negative value when pci_alloc_irq_vectors() fails
58608e80d627 x86/irq: Ensure PI wakeup handler is unregistered before module unload
7252cb96e410 x86/cpu: Fix migration safety with X86_BUG_NULL_SEL
e3d4ba338b98 x86/sme: Use #define USE_EARLY_PGTABLE_L5 in mem_encrypt_identity.c
ccc4e5e60b41 fuse: fix page stealing
9505d4872188 ALSA: timer: Unconditionally unlink slave instances, too
2c6446168f07 ALSA: timer: Fix use-after-free problem
246c6a1fe356 ALSA: synth: missing check for possible NULL after the call to kstrdup
ce9f7535ec26 ALSA: usb-audio: Add registration quirk for JBL Quantum 400
7da6f4c5c21c ALSA: line6: fix control and interrupt message timeouts
4a12e624e597 ALSA: 6fire: fix control and bulk message timeouts
ab3f823af278 ALSA: ua101: fix division by zero at probe
a3bb6e0db72b ALSA: hda/realtek: Add quirk for HP EliteBook 840 G7 mute LED
40243342d297 ALSA: hda/realtek: Add quirk for ASUS UX550VE
8af6ade7ac5e ALSA: hda/realtek: Add a quirk for Acer Spin SP513-54N
809416fe0a7a ALSA: hda/realtek: Add quirk for Clevo PC70HS
638b53d67ffc media: v4l2-ioctl: Fix check_ext_ctrls
8c11269bd619 media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
bbd62d2fca94 media: ite-cir: IR receiver stop working after receive overflow
eef6cb3d3c92 crypto: s5p-sss - Add error handling in s5p_aes_probe()
d7a5d872b414 firmware/psci: fix application of sizeof to pointer
18f0fb57a9fe tpm: Check for integer overflow in tpm2_map_response_body()
f38f3da360a6 parisc: Fix ptrace check on syscall return
acbc2a08ea7c mmc: dw_mmc: Dont wait for DRTO on Write RSP error
5ee76475f82a scsi: qla2xxx: Fix use after free in eh_abort path
cc5b13948838 scsi: qla2xxx: Fix kernel crash when accessing port_speed sysfs file
617d2fd48da5 ocfs2: fix data corruption on truncate
c20eb9551c52 libata: fix read log timeout value
69c2199f49fb Input: i8042 - Add quirk for Fujitsu Lifebook T725
17ec1c6b45a7 Input: elantench - fix misreporting trackpoint coordinates
ce4bec0a54a4 Input: iforce - fix control-message timeout
db39f49ee7d5 binder: use cred instead of task for getsecid
fc9c470cd519 binder: use cred instead of task for selinux checks
28a1e470b000 binder: use euid from cred instead of using task
3e87c4996de1 usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform
3fa7efd1fab1 xhci: Fix USB 3.1 enumeration issues by increasing roothub power-on-good delay

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 99451bfadf..3d0b248b3a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e0b42b387dce06a55169f213efd8796912778abc"
-SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
+SRCREV_machine ?= "17e5e7a7f94d3d11d9d22fb6de614492596c0a8d"
+SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.159"
+LINUX_VERSION ?= "5.4.162"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f217718c7b..024ab77d08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.159"
+LINUX_VERSION ?= "5.4.162"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7062d2dd2f5e5e7a07616accce62ddc5abb7b570"
-SRCREV_machine ?= "2494d7c8a13b2ce2a41c7bbc8276b5f4f6e61ac1"
-SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
+SRCREV_machine_qemuarm ?= "e3cbc4448222038ed98186783b61b099e35ef08d"
+SRCREV_machine ?= "0c97af59c367809671cf25eed595e3fef21eb493"
+SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 18661ff21d..e81bb00b87 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "82eedda0c6efa661eccd57dc542c50bef054cb6f"
-SRCREV_machine_qemuarm64 ?= "f0a7a9cbc8f42271f953e6a05b63a797620c8331"
-SRCREV_machine_qemumips ?= "ca5eb4fc25d66165f42348c64c568193fc6407b6"
-SRCREV_machine_qemuppc ?= "11fb8e44b3ffdc3bd7c8703f85f622265c815e69"
-SRCREV_machine_qemuriscv64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
-SRCREV_machine_qemux86 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
-SRCREV_machine_qemux86-64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
-SRCREV_machine_qemumips64 ?= "02faa48ca76a54e5da6e256b0621c09c7cf03051"
-SRCREV_machine ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
-SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
+SRCREV_machine_qemuarm ?= "d787585d276bc42eb17f3b04ed8e1c36d51b3258"
+SRCREV_machine_qemuarm64 ?= "87892857e00d1cdb6802abaea19cf65bee71da55"
+SRCREV_machine_qemumips ?= "4f84fe187ca152aab43fa6008989a5d00cca6bdb"
+SRCREV_machine_qemuppc ?= "4936240e37cfc88fe728add8ff3d9bd548c400ef"
+SRCREV_machine_qemuriscv64 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
+SRCREV_machine_qemux86 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
+SRCREV_machine_qemux86-64 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
+SRCREV_machine_qemumips64 ?= "cef4f9fba704dba2cca97111ead9e579fde115c4"
+SRCREV_machine ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
+SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.159"
+LINUX_VERSION ?= "5.4.162"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

