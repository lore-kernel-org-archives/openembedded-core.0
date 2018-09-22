Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2442179830
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8MHKAu9021553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:20:10 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:20:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:52 -0400
Message-ID: <b1fed53b0b1bdee5b8f8ce7419440fad09e3a757.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/4.18: update to v4.18.9
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:10 -0000
Content-Type: text/plain

Integrating the korg -stable commits for 4.18.8/9, that comprise
the following commits:

   86e014f514f9 Linux 4.18.9
   175ad0cbd818 mm: get rid of vmacache_flush_all() entirely
   39998fd58036 autofs: fix autofs_sbi() does not check super block type
   51d34e94c470 clocksource: Revert "Remove kthread"
   777c7b8464de RDMA/cma: Do not ignore net namespace for unbound cm_id
   9daa1d751d51 MIPS: mscc: ocelot: fix length of memory address space for MIIM
   20452f8f04a2 MIPS: WARN_ON invalid DMA cache maintenance, not BUG_ON
   1c7b8cf2a76a RDMA/hns: Update the data type of immediate data
   137fee538bb0 NFSv4.1: Fix a potential layoutget/layoutrecall deadlock
   1256eeb12678 RDMA/hns: Add illegal hop_num judgement
   b6f493453c78 f2fs: fix to do sanity check with extra_attr feature
   059311916fbb f2fs: fix to propagate return value of scan_nat_page()
   8d65ffb36708 f2fs: fix to do sanity check with {sit,nat}_ver_bitmap_bytesize
   ea08014059c6 mfd: ti_am335x_tscadc: Fix struct clk memory leak
   ff418359bfcb iommu/ipmmu-vmsa: Fix allocation in atomic context
   3ca5bae4d2d8 mfd: rave-sp: Initialize flow control and parity of the port
   0342426f2bf7 f2fs: fix to do sanity check with secs_per_zone
   ee0b97e19865 f2fs: avoid potential deadlock in f2fs_sbi_store
   d92dadb83be8 media: em28xx: Fix DualHD disconnect oops
   aba03a8b544a f2fs: Fix uninitialized return in f2fs_ioc_shutdown()
   eade994be5e6 f2fs: fix to wait on page writeback before updating page
   f9ce9240ebbe iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel
   1b210d52abf5 media: em28xx: Fix dual transport stream operation
   088ce054c745 drm/amd/display: Prevent PSR from being enabled if initialization fails
   fdc340f5a710 media: helene: fix xtal frequency setting at power on
   18f4b79efb40 media: rcar-csi2: update stream start for V3M
   e681be2362e8 partitions/aix: fix usage of uninitialized lv_info and lvname structures
   06a557d12a90 partitions/aix: append null character to print data from disk
   c57525ab6f77 media: s5p-mfc: Fix buffer look up in s5p_mfc_handle_frame_{new, copy_time} functions
   3f6592445cbe Input: atmel_mxt_ts - only use first T9 instance
   5864b9e06e17 dm cache: only allow a single io_mode cache feature to be requested
   24983c8101c9 net: dcb: For wild-card lookups, use priority -1, not 0
   e66813955581 thermal_hwmon: Sanitize attribute name passed to hwmon
   8cc36414d815 thermal: rcar_thermal: avoid NULL dereference in absence of IRQ resources
   273234f22e95 MIPS: generic: fix missing of_node_put()
   9449bd8ff770 MIPS: Octeon: add missing of_node_put()
   235fd393825b f2fs: fix to do sanity check with reserved blkaddr of inline inode
   d44e0ddb577d tpm/tpm_i2c_infineon: switch to i2c_lock_bus(..., I2C_LOCK_SEGMENT)
   d229e7ecc0cb tpm_tis_spi: Pass the SPI IRQ down to the driver
   4f268d981258 f2fs: fix to skip GC if type in SSA and SIT is inconsistent
   2cf9708981e7 pktcdvd: Fix possible Spectre-v1 for pkt_devs
   bf5cde3c685b f2fs: try grabbing node page lock aggressively in sync scenario
   b493d05c0402 net: mvneta: fix mtu change on port without link
   d35bf0a213ec pinctrl/amd: only handle irq if it is pending and unmasked
   d288d8163c97 gpio: ml-ioh: Fix buffer underwrite on probe error path
   9b9ceea29ad2 gpio: pxa: disable pinctrl calls for PXA3xx
   6871146498a7 pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
   9d8c6300d158 regulator: tps65217: Fix NULL pointer dereference on probe
   0d268eaecd3d x86/mm: Remove in_nmi() warning from vmalloc_fault()
   73941b28bcdd Bluetooth: hidp: Fix handling of strncpy for hid->name information
   dc00dc4ccf8b powerpc/mm: Don't report PUDs as memory leaks when using kmemleak
   81a4ff2429e7 PCI: mobiveil: Fix struct mobiveil_pcie.pcie_reg_base address type
   94ee251c1ed4 PCI: mobiveil: Add missing ../pci.h include
   1f1e9c39a6a7 media: em28xx: explicitly disable TS packet filter
   ddd0ae7f02d4 ath10k: disable bundle mgmt tx completion event support
   0bf7bf9931ad tools/testing/nvdimm: kaddr and pfn can be NULL to ->direct_access()
   83d9430bd43b scsi: 3ware: fix return 0 on the error path of probe
   0a964871ccea nfs: Referrals not inheriting proto setting from parent
   0c8b7991f40d ata: libahci: Correct setting of DEVSLP register
   d12d3336fe95 ata: libahci: Allow reconfigure of DEVSLP register
   b0f09f787d38 MIPS: Fix ISA virt/bus conversion for non-zero PHYS_OFFSET
   2916355cbc9c scsi: tcmu: do not set max_blocks if data_bitmap has been setup
   15ce90b8346f mtd: rawnand: make subop helpers return unsigned values
   e5d9ae0077a5 rpmsg: core: add support to power domains for devices
   d397e7c9d663 wlcore: Set rx_status boottime_ns field on rx
   b19c6e698558 ath10k: prevent active scans on potential unusable channels
   23aa633d564b ath9k_hw: fix channel maximum power level test
   ce5127257d99 ath9k: report tx status on EOSP
   1e83b3b9c60e perf build: Fix installation directory for eBPF
   e01f7c77ce21 macintosh/via-pmu: Add missing mmio accessors
   14335f6beb3f powerpc/pseries: fix EEH recovery of some IOV devices
   d8551bc50c57 perf evlist: Fix error out while applying initial delay and LBR
   96e8b14b1f42 perf c2c report: Fix crash for empty browser
   3ce0566333dd NFSv4.0 fix client reference leak in callback
   aa405740d359 device-dax: avoid hang on error before devm_memremap_pages()
   f2d46f40bb92 perf tools: Allow overriding MAX_NR_CPUS at compile time
   528000132554 ASoC: soc-pcm: Use delay set in component pointer function
   9590fe082ac4 f2fs: fix to detect looped node chain correctly
   7d2914dac206 f2fs: fix defined but not used build warnings
   86750bef4029 f2fs: issue discard align to section in LFS mode
   14580e8d9655 f2fs: Keep alloc_valid_block_count in sync
   2ab744266b20 f2fs: do not set free of current section
   9a83044805f9 f2fs: fix to active page in lru list for read path
   b70fdc0ffc14 IB/IPoIB: Set ah valid flag in multicast send flow
   17732e7759e8 iwlwifi: pcie: don't access periphery registers when not available
   a1354f0d718a uio: fix possible circular locking dependency
   40dc1eb129a5 tty: rocket: Fix possible buffer overwrite on register_PCI
   e951163fb87c Drivers: hv: vmbus: Cleanup synic memory free path
   15e5a96b1e1a firmware: vpd: Fix section enabled flag on vpd_section_destroy
   386b28c2de45 uio: potential double frees if __uio_register_device() fails
   baec9ce83ad5 misc: ti-st: Fix memory leak in the error path of probe()
   7fef1a4f376a gpu: ipu-v3: default to id 0 on missing OF alias
   0bbd7344b42a media: camss: csid: Configure data type and decode format properly
   b3f70869623d timers: Clear timer_base::must_forward_clk with timer_base::lock held
   5a149d67afa9 md/raid5: fix data corruption of replacements after originals dropped
   b54ac5fd6d6a scsi: target: fix __transport_register_session locking
   9db9eb8c4e30 scsi: lpfc: Fix driver crash when re-registering NVME rports.
   abe0bde4dd8c blk-mq: fix updating tags depth
   a73a10b78563 clk: scmi: Fix the rounding of clock rate
   846f4edf32b6 scsi: qla2xxx: Silent erroneous message
   8e2b7c2c14f5 scsi: qla2xxx: Fix session state stuck in Get Port DB
   549f85194379 scsi: qla2xxx: Fix unintended Logout
   8246055b5c6b net: phy: Fix the register offsets in Broadcom iProc mdio mux driver
   e78e5a975500 media: dw2102: Fix memleak on sequence of probes
   e88a48b70c31 media: davinci: vpif_display: Mix memory leak on probe error path
   c3b51c11c836 selftests/bpf: fix a typo in map in map test
   c9feebab869c powerpc/4xx: Fix error return path in ppc4xx_msi_probe()
   35fa5df6c79a powerpc/powernv: Fix concurrency issue with npu->mmio_atsd_usage
   7e3d17181c13 gpio: tegra: Move driver registration to subsys_init level
   9a5cbf5c84a1 pinctrl: berlin: fix 'pctrl->functions' allocation in berlin_pinctrl_build_state
   074f319a5c13 Bluetooth: h5: Fix missing dependency on BT_HCIUART_SERDEV
   516771283149 i2c: aspeed: Add an explicit type casting for *get_clk_reg_val
   e6ab983acd1b ethtool: Remove trailing semicolon for static inline
   0906eb972eea ALSA: hda/realtek - Add mute LED quirk for HP Spectre x360
   c6fe80156828 misc: mic: SCIF Fix scif_get_new_port() error handling
   40b9d96cea9f tc-testing: remove duplicate spaces in connmark match patterns
   86bebb604160 tc-testing: flush gact actions on test teardown
   e114758826f5 ARC: [plat-axs*]: Enable SWAP
   f688bf1511c9 switchtec: Fix Spectre v1 vulnerability
   5b7497c02dac x86/apic/vector: Make error return value negative
   0d07d02abd58 x86/process: Don't mix user/kernel regs in 64bit __show_regs()
   c6f8e398c10e x86/microcode: Update the new microcode revision unconditionally
   e0a8f85b0aee x86/microcode: Make sure boot_cpu_data.microcode is up-to-date
   875872547357 cpu/hotplug: Prevent state corruption on error rollback
   6b7b020bef06 cpu/hotplug: Adjust misplaced smb() in cpuhp_thread_fun()
   a4db12abb871 ALSA: hda - Fix cancel_work_sync() stall from jackpoll work
   ce987db2b52f memory: ti-aemif: fix a potential NULL-pointer dereference
   8bf0dc8d0a67 ACPI / LPSS: Force LPSS quirks on boot
   e8cc3b38a0b6 ARC: [plat-axs*/plat-hsdk]: Allow U-Boot to pass MAC-address to the kernel
   18d40b7836d4 KVM: x86: Do not re-{try,execute} after failed emulation in L2
   4ff64069721a KVM: x86: Default to not allowing emulation retry in kvm_mmu_page_fault
   3e88f92cd118 KVM: x86: Merge EMULTYPE_RETRY and EMULTYPE_ALLOW_REEXECUTE
   172c718af8b2 KVM: x86: Invert emulation re-execute behavior to make it opt-in
   9a89243cb1c7 KVM: VMX: Do not allow reexecute_instruction() when skipping MMIO instr
   a7e360b1086b KVM: x86: SVM: Set EMULTYPE_NO_REEXECUTE for RSM emulation
   625a6bcb11a2 KVM: s390: vsie: copy wrapping keys to right place
   33cd6d44e8c6 KVM: PPC: Book3S HV: Use correct pagesize in kvm_unmap_radix()
   9e7e9f25ef3e KVM: arm/arm64: Clean dcache to PoC when changing PTE due to CoW
   a2359d3d80fe arm64: KVM: Only force FPEXC32_EL2.EN if trapping FPSIMD
   e9773e97f502 Btrfs: fix data corruption when deduplicating between different files
   29d76c9853a2 btrfs: fix qgroup_free wrong num_bytes in btrfs_subvolume_reserve_metadata
   15c4b1902f0e cifs: connect to servername instead of IP for IPC$ share
   dc0416dcd3ab smb3: check for and properly advertise directory lease support
   d88717b6ce78 SMB3: Backup intent flag missing for directory opens with backupuid mounts
   521983976c38 MIPS: VDSO: Match data page cache colouring when D$ aliases
   67b987648258 android: binder: fix the race mmap and alloc_new_buf_locked
   c583d8956d83 block: bfq: swap puts in bfqg_and_blkg_put
   d927dea6392d block: don't warn when doing fsync on read-only devices
   56935391aba9 nbd: don't allow invalid blocksize settings
   e847a545edae scsi: lpfc: Correct MDS diag and nvmet configuration
   faeb7c279e48 mac80211: don't update the PM state of a peer upon a multicast frame
   15a6f8974a8c memory_hotplug: fix kernel_panic on offline page processing
   f1549c67f23f mm/hugetlb: filter out hugetlb pages if HUGEPAGE migration is not supported.
   c0cbb9e5d448 HID: input: fix leaking custom input node name
   81bb35902b63 HID: i2c-hid: Fix flooded incomplete report after S3 on Rayd touchscreen
   7bc3f187fd30 HID: core: fix grouping by application
   e114a409eef6 HID: multitouch: fix Elan panels with 2 input modes declaration
   b94023f1ab51 i2c: i801: fix DNV's SMBCTRL register offset
   824ca3763057 i2c: xiic: Make the start and the byte count write atomic
   dfba61ec760e Linux 4.18.8
   d27f3eb84d52 ASoC: wm8994: Fix missing break in switch
   e496c9a4c17d HID: redragon: fix num lock and caps lock LEDs
   838ddbf08cc7 x86: kvm: avoid unused variable warning
   d9b47449c1a1 kvm: x86: Set highest physical address bits in non-present/reserved SPTEs
   f9acfbec6652 kbuild: make missing $DEPMOD a Warning instead of an Error
   30566a3520bb x86/xen: don't write ptes directly in 32-bit PV guests
   22b734b0c850 x86/pae: use 64 bit atomic xchg function in native_ptep_get_and_clear
   9fdac0148450 debugobjects: Make stack check warning more informative
   977f362a1f7b drm/amdgpu: Don't warn on destroying a pinned BO
   ff9ac76caaee drm/amdgpu: Warn and update pin_size values when destroying a pinned BO
   e2a81121f62a drm/amdgpu: Make pin_size values atomic
   df058ec846fe drm/amdgpu: Keep track of amount of pinned CPU visible VRAM
   dd458c42c28a x86/tsc: Prevent result truncation on 32bit
   009a091aae1c drm/i915: set DP Main Stream Attribute for color range on DDI platforms
   7a5d47d5faa3 mm: respect arch_dup_mmap() return value
   153fedc6ba32 uapi/linux/keyctl.h: don't use C++ reserved keyword as a struct member name
   97cdbf04a052 drm/i915: Re-apply "Perform link quality check, unconditionally during long pulse"
   15ca3cf67c18 drm/amdgpu: fix incorrect use of drm_file->pid
   dd4a6ffb5bc1 drm/amdgpu: fix incorrect use of fcheck
   0d34ba1b3d33 drm/amdgpu:add VCN booting with firmware loaded by PSP
   e765455ea299 drm/amdgpu:add VCN support in PSP driver
   56c8d038c465 drm/amdgpu:add new firmware id for VCN
   467fce24d137 drm/amdgpu:add tmr mc address into amdgpu_firmware_info
   9eba3ada1217 drm/amdgpu: update tmr mc address
   1e7e7a541e08 drm/amd/display: Check if clock source in use before disabling
   dfe84b71296f drm/amd/display: Pass connector id when executing VBIOS CT
   433009dc1b81 drm/rockchip: vop: fix irq disabled after vop driver probed
   5e1f742d4bbb drm/rockchip: vop: split out core clock enablement into separate functions
   2781b277d589 drm/rockchip: lvds: add missing of_node_put
   590eda32ee42 drm/amd/display: Report non-DP display as disconnected without EDID
   823057fc0a2c drm/amd/display: Use requested HDMI aspect ratio
   691f2d763d07 drm/amd/display: update clk for various HDMI color depths
   b31d6596d7d2 drm/amd/display: Don't share clk source between DP and HDMI
   a74410c9d4e4 drm/amd/display: fix type of variable
   401a86f73216 drm/edid: Add 6 bpc quirk for SDC panel in Lenovo B50-80
   fd0f192ab66c drm/edid: Quirk Vive Pro VR headset non-desktop.
   ef78d745f0fd drm/amd/pp/Polaris12: Fix a chunk of registers missed to program
   e32774810036 drm/amd/powerplay: fixed uninitialized value
   8ec9ca91819f drm/amd/pp: Convert voltage unit in mV*4 to mV on CZ/ST
   4c518d5abdf4 drm/amdgpu: Fix RLC safe mode test in gfx_v9_0_enter_rlc_safe_mode
   7acffde7a949 drm/amdgpu: fix a reversed condition
   c8fe7d36e49b drm/amdgpu: update uvd_v6_0_ring_vm_funcs to use new nop packet
   7ddb29b09517 drm/i915: Free write_buf that we allocated with kzalloc.
   087ed76cb538 drm/i915: Increase LSPCON timeout
   cfc7d9e0064b drm/i915: Nuke the LVDS lid notifier
   a23feb39586a drm/i915/lpe: Mark LPE audio runtime pm as "no callbacks"
   760d0077abc1 btrfs: fix mount and ioctl device scan ioctl race
   49db06e7f366 btrfs: reorder initialization before the mount locks uuid_mutex
   1ef9a3009ba9 btrfs: lift uuid_mutex to callers of btrfs_parse_early_options
   71ddab54bee5 btrfs: lift uuid_mutex to callers of btrfs_scan_one_device
   40ce21951aab btrfs: use device_list_mutex when removing stale devices
   b57a7b0d4122 btrfs: rename local devices for fs_devices in btrfs_free_stale_devices(
   0b40d58d469f btrfs: extend locked section when adding a new device in device_list_add
   2d4bbb81bac6 btrfs: do btrfs_free_stale_devices outside of device_list_add
   8515518d6365 ARM: rockchip: Force CONFIG_PM on Rockchip systems
   c4e3acea0ebc arm64: rockchip: Force CONFIG_PM on Rockchip systems
   3ffbbcafe9a5 btrfs: Fix a C compliance issue
   c8c9b6c07166 btrfs: Don't remove block group that still has pinned down bytes
   122fe306d072 btrfs: lift uuid_mutex to callers of btrfs_open_devices
   f88b40c1472a btrfs: check-integrity: Fix NULL pointer dereference for degraded mount
   4fb2799b05c2 btrfs: tree-checker: Detect invalid and empty essential trees
   13b0dbef7dd5 btrfs: relocation: Only remove reloc rb_trees if reloc control has been initialized
   4c8415cf5b5a btrfs: fix in-memory value of total_devices after seed device deletion
   32455d96e3ee btrfs: replace: Reset on-disk dev stats value after replace
   464a90e380f2 btrfs: Exit gracefully when chunk map cannot be inserted to the tree
   f5cf5b0383e3 drm/etnaviv: fix crash in GPU suspend when init failed due to buffer placement
   fc73680f9cf7 kvm: nVMX: Fix fault vector for VMX operation at CPL > 0
   68b0ce42a7f4 KVM: vmx: track host_state.loaded using a loaded_vmcs pointer
   ac5395827d48 drm/amd/display: Read back max backlight value at boot
   5bd634167f2f clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399
   214d87aee3af powerpc/pseries: Avoid using the size greater than RTAS_ERROR_LOG_MAX.
   b070664de855 um: fix parallel building with O= option
   d7e16ec6ee19 powerpc/64s: Make rfi_flush_fallback a little more robust
   a4b8adb73ba1 powerpc/platforms/85xx: fix t1042rdb_diu.c build errors & warning
   813cbe22dc04 smb3: if server does not support posix do not allow posix mount option
   c2704b5e4688 SMB3: Number of requests sent should be displayed for SMB3 not just CIFS
   31bd39126330 CIFS: fix memory leak and remove dead code
   b91052f95055 smb3: fix reset of bytes read and written stats
   0cf56c159d64 cfq: Suppress compiler warnings about comparisons
   8b59b7c743dc RDS: IB: fix 'passing zero to ERR_PTR()' warning
   fe5e418c6bc3 selinux: cleanup dentry and inodes on error in selinuxfs
   c3fb1a354ccf selftests/powerpc: Kill child processes on SIGINT
   0510985d1460 iommu/omap: Fix cache flushes on L2 table entries
   8041b94f4eda ASoC: rt5677: Fix initialization of rt5677_of_match.data
   3fb096cdad59 staging: comedi: ni_mio_common: fix subdevice flags for PFI subdevice
   aee3d110a104 dm kcopyd: avoid softlockup in run_complete_job
   ab131d7f7a9c PCI: mvebu: Fix I/O space end address calculation
   00bb59025eaf xen/balloon: fix balloon initialization for PVH Dom0
   19f2289b4ec9 Input: do not use WARN() in input_alloc_absinfo()
   4d89c871694a NFSv4: Fix error handling in nfs4_sp4_select_mode()
   12af4639cfe2 scsi: aic94xx: fix an error code in aic94xx_init()
   d5fed61a3d2e blk-mq: count the hctx as active before allocating tag
   e904dff96e84 ACPI / scan: Initialize status to ACPI_STA_DEFAULT
   e1d82ba3d835 s390/dasd: fix panic for failed online processing
   70866799dd6f s390/dasd: fix hanging offline processing due to canceled worker
   151751ec48a2 brcmfmac: fix brcmf_wiphy_wowl_params() NULL pointer dereference
   d0e21e43cd3e block: bvec_nr_vecs() returns value for wrong slab
   c728031a3535 perf probe powerpc: Fix trace event post-processing
   6f3bddbfb636 powerpc: Fix size calculation using resource_size()
   118522ed5fa7 powerpc/uaccess: Enable get_user(u64, *p) on 32-bit
   c565269d06e9 bpf: fix bpffs non-array map seq_show issue
   77197f8d9628 pinctrl: axp209: Fix NULL pointer dereference after allocation
   0fbcbc408cec f2fs: fix to clear PG_checked flag in set_page_dirty()
   ec3fb9172b86 net/9p: fix error path of p9_virtio_probe
   91ca7c5644c3 net/9p/trans_fd.c: fix race by holding the lock
   8542647689ad irqchip/bcm7038-l1: Hide cpu offline callback when building for !SMP
   e51977e08ef0 irqchip/stm32: Fix init error handling
   e71ea647e9ae RISC-V: Use KBUILD_CFLAGS instead of KCFLAGS when building the vDSO
   bd2b9872d3cb f2fs: fix avoid race between truncate and background GC
   7038712b79a1 f2fs: avoid race between zero_range and background GC
   aa8ce04f531f perf tools: Check for null when copying nsinfo.
   6d39ab3401ff coccicheck: return proper error code on fail
   243b6c6a90cc drm/amd/display: Guard against null crtc in CRC IRQ
   1e0892195475 PCI: Match Root Port's MPS to endpoint's MPSS as necessary
   0472229e385c net: hns3: Fix for phy link issue when using marvell phy driver
   b02fd8a8dc25 block: don't warn for flush on read-only device
   534dde34bb7d net: hns3: Fix for command format parsing error in hclge_is_all_function_id_zero
   faba3f032e96 perf arm spe: Fix uninitialized record error variable
   7da94d53075d ACPICA: ACPICA: add status check for acpi_hw_read before assigning return value
   08100b285966 RDMA/hns: Fix usage of bitmap allocation functions return values
   59e8e46ada76 ubi: Initialize Fastmap checkmapping correctly
   58d705bdcd85 tcp, ulp: add alias for all ulp modules
   30d2d473b6c2 netfilter: fix memory leaks on netlink_dump_start error
   2d24a4ca6204 platform/x86: asus-nb-wmi: Add keymap entry for lid flip action on UX360
   3bf9fa21774a netfilter: x_tables: do not fail xt_alloc_table_info too easilly
   8dea99cf8b43 mfd: sm501: Set coherent_dma_mask when creating subdevices
   c63f900720ba ipvs: fix race between ip_vs_conn_new() and ip_vs_del_dest()
   df1ce63447ea s390/kdump: Fix memleak in nt_vmcoreinfo
   875fefda91d4 netfilter: ip6t_rpfilter: set F_IFACE for linklocal addresses
   bdcdbe6e48f0 samples/bpf: all XDP samples should unload xdp/bpf prog on SIGTERM
   2262b26d750d bpf, sockmap: fix leakage of smap_psock_map_entry
   ea775b698008 net/xdp: Fix suspicious RCU usage warning
   7fb58bc7549d bpf, sockmap: fix sock_map_ctx_update_elem race with exist/noexist
   4cd728b4b50a tcp, ulp: fix leftover icsk_ulp_ops preventing sock from reattach
   98d30c6ae96a bpf, sockmap: fix map elem deletion race with smap_stop_sock
   af160422460e platform/x86: intel_punit_ipc: fix build errors
   56d0f1c6d4d2 fs/dcache.c: fix kmemcheck splat at take_dentry_name_snapshot()
   8bca1a92d8b8 mm: make DEFERRED_STRUCT_PAGE_INIT explicitly depend on SPARSEMEM
   b9f9fc3844d8 mm/fadvise.c: fix signed overflow UBSAN complaint
   dfb5ad65ca17 powerpc/topology: Get topology for shared processors at boot
   3940236559d1 pwm: meson: Fix mux clock names
   216011668891 IB/hfi1: Invalid NUMA node information can cause a divide by zero
   8fb30bf797fe i2c: core: ACPI: Make acpi_gsb_i2c_read_bytes() check i2c_transfer return value
   106fabc844a1 x86/mce: Add notifier_block forward declaration
   34f91b3d0e55 virtio: pci-legacy: Validate queue pfn
   cad3dc0a4563 apparmor: fix an error code in __aa_create_ns()
   fb6fc1b6a408 scripts: modpost: check memory allocation results
   13892551c76f workqueue: re-add lockdep dependencies for flushing
   b7a3d36d6c32 workqueue: skip lockdep wq dependency in cancel_work_sync()
   798d80a612dd fat: validate ->i_start before using
   739956488c79 fs/proc/kcore.c: use __pa_symbol() for KCORE_TEXT list entries
   69177abd89a5 iommu/rockchip: Move irq request past pm_runtime_enable
   d30de7347e29 hfsplus: fix NULL dereference in hfsplus_lookup()
   5a476ca109bc iommu/rockchip: Handle errors returned from PM framework
   9f0114724473 reiserfs: change j_timestamp type to time64_t
   df67ae0bd579 fs/proc/vmcore.c: hide vmcoredd_mmap_dumps() for nommu builds
   0de1a99801ff fork: don't copy inconsistent signal handler state to child
   19ca1a2830e9 sunrpc: Don't use stack buffer with scatterlist
   3d872bd5ae87 hfs: prevent crash on exit from failed search
   84ac254ed287 hfsplus: don't return 0 when fill_super() failed
   8043c90bada1 cifs: check if SMB2 PDU size has been padded and suppress the warning
   ded39314abc0 hv_netvsc: ignore devices that are not PCI
   c56a2888ac2b vhost: correctly check the iova range when waking virtqueue
   a6fddbba3e63 mlxsw: spectrum_switchdev: Do not leak RIFs when removing bridge
   98c4cc4c81e8 sctp: hold transport before accessing its asoc in sctp_transport_get_next
   eb4f28d8f9e0 nfp: wait for posted reconfigs when disabling the device
   ade76212f72a ip6_vti: fix a null pointer deference when destroy vti6 tunnel
   b7f172c4b692 ip6_vti: fix creating fallback tunnel device for vti6
   aff760646722 Revert "net: stmmac: Do not keep rearming the coalesce timer in stmmac_xmit"
   e366979eb8f0 r8169: set RxConfig after tx/rx is enabled for RTL8169sb/8110sb devices
   0981fb60a006 net/mlx5: Fix SQ offset in QPs with small RQ
   2ff8354c2317 net/ipv6: Put lwtstate when destroying fib6_info
   b24b39afa411 net/ipv6: Only update MTU metric if it set
   6568eedbe939 net/ipv6: init ip6 anycast rt->dst.input as ip6_input
   078e7d112fbc ipv6: don't get lwtstate twice in ip6_rt_copy_init()
   23f64bad173c net: macb: Fix regression breaking non-MDIO fixed-link PHYs
   630403ba9183 erspan: set erspan_ver to 1 by default when adding an erspan dev
   0f6387a1087d sctp: remove useless start_fail from sctp_ht_iter in proc
   b68d53c36108 tipc: fix the big/little endian issue in tipc_dest
   78d378ed13e8 hv_netvsc: Fix a deadlock by getting rtnl lock earlier in netvsc_probe()
   36b59c8e48e4 tipc: fix a missing rhashtable_walk_exit()
   f6fb6b2993ab net/sched: act_pedit: fix dump of extended layered op
   a2cea09396bd bnxt_en: Do not adjust max_cp_rings by the ones used by RDMA.
   e779d52e66d1 bnxt_en: Clean up unused functions.
   510fd03c5231 net: sched: action_ife: take reference to meta module
   e57d65cf4692 act_ife: fix a potential deadlock
   5c1dfc425994 act_ife: move tcfa_lock down to where necessary
   8563554006c5 vti6: remove !skb->ignore_df check from vti6_xmit()
   028d57cc5e44 tcp: do not restart timewait timer on rst reception
   ad99830d972c r8169: add support for NCube 8168 network card
   2b3b1f121306 r8152: disable RX aggregation on new Dell TB16 dock
   5379200c84c2 qlge: Fix netdev features configuration.
   9c03cfa220c1 net: sched: Fix memory exposure from short TCA_U32_SEL
   716fc5ce90cf net: macb: do not disable MDIO bus at open/close time
   5b47db7fa7b1 net: bcmgenet: use MAC link status for fixed phy
   e242b5c405b9 ipv4: tcp: send zero IPID for RST and ACK sent in SYN-RECV and TIME-WAIT state
   f5c34c4a092e act_ife: fix a potential use-after-free

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 15e788142722..6658adee36d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d8a8f28746fdb335c3d6cab69a8b64156340c1c7"
-SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
+SRCREV_machine ?= "f9cb6c0852260b119014a339332c9f4bee4c074b"
+SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.7"
+LINUX_VERSION ?= "4.18.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 19355de67aec..bb2445160fbf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.7"
+LINUX_VERSION ?= "4.18.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -13,8 +13,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
+SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 49db0d2bb93e..79d3046bd20a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5bcc33dbcd60be73897f4983844cf0226fd54bdf"
-SRCREV_machine_qemuarm64 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_machine_qemumips ?= "0fba2828af7485ebd03e4210dbefe79c070aefc5"
-SRCREV_machine_qemuppc ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_machine_qemux86 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_machine_qemux86-64 ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_machine_qemumips64 ?= "1d92949184f78f9c2c71d069683d386b37cc6dca"
-SRCREV_machine ?= "2a412d007ecc39f8d843fcb5ae2259f7f434b1ea"
-SRCREV_meta ?= "eae1bf4c938bd04beb6a1b2405e86d2cef88426f"
+SRCREV_machine_qemuarm ?= "ef0043f38afb743bffdc39aacc54ea2419da0be3"
+SRCREV_machine_qemuarm64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_machine_qemumips ?= "a6d4477ea91aec9d3d6af538f8f9d27a687540aa"
+SRCREV_machine_qemuppc ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_machine_qemux86 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_machine_qemux86-64 ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_machine_qemumips64 ?= "766c469b1707fd3101116f572052a7b8d5ac0658"
+SRCREV_machine ?= "0cdc8564c61958a39704d97e008120bd7c762f60"
+SRCREV_meta ?= "0e108d3aae16700b48e5944aa96d264e39f8160e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.7"
+LINUX_VERSION ?= "4.18.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


