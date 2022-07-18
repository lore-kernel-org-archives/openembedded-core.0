Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 10/23] linux-yocto/5.15: update to v5.15.46
Date: Sun, 17 Jul 2022 14:30:11 -1000
Message-Id: <5e5dee3c23d216459148afb6631cbe72a96a7bea.1658093505.git.steve@sakoman.com>
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    aed23654e8ed Linux 5.15.46
    c24cff012420 block: fix bio_clone_blkg_association() to associate with proper blkcg_gq
    97a40c22013a pinctrl/rockchip: support setting input-enable param
    2027647245ef md: bcache: check the return value of kzalloc() in detached_dev_do_request()
    36a2fc44c574 md: fix double free of io_acct_set bioset
    f63fd1e0e0fc md: Don't set mddev private to NULL in raid0 pers->free
    61decb58486d fs/ntfs3: Fix invalid free in log_replay
    00f1de9cffec exportfs: support idmapped mounts
    e5b310b512e7 fs: add two trivial lookup helpers
    b175e8c46d93 interconnect: qcom: icc-rpmh: Add BCMs to commit list in pre_aggregate
    8e79bf98061c interconnect: qcom: sc7180: Drop IP0 interconnects
    d973bc80e7d4 ext4: only allow test_dummy_encryption when supported
    cd2086394f04 MIPS: IP30: Remove incorrect `cpu_has_fpu' override
    bfa8e0dfa2ff MIPS: IP27: Remove incorrect `cpu_has_fpu' override
    9262f0ce3c76 RDMA/rxe: Generate a completion for unsupported/invalid opcode
    83f4a22ca6ec RDMA/hns: Remove the num_cqc_timer variable
    fdcb03632ab6 staging: r8188eu: delete rtw_wx_read/write32()
    6004fccaf82f Revert "random: use static branch for crng_ready()"
    358f12ae2e53 list: test: Add a test for list_is_head()
    85a2806c40da kseltest/cgroup: Make test_stress.sh work if run interactively
    1810bafaca2b net: ipa: fix page free in ipa_endpoint_replenish_one()
    f654596e3a08 net: ipa: fix page free in ipa_endpoint_trans_release()
    ba173a6f8d8d phy: qcom-qmp: fix reset-controller leak on probe errors
    e9f53bfcd4ae coresight: core: Fix coresight device probe failure issue
    a30acbb5dfb7 blk-iolatency: Fix inflight count imbalances and IO hangs on offline
    501c5eae2697 vdpasim: allow to enable a vq repeatedly
    bd56db7cb81e dt-bindings: gpio: altera: correct interrupt-cells
    5b726ed6a54c docs/conf.py: Cope with removal of language=None in Sphinx 5.0.0
    b5cb51cf21f5 SMB3: EBADF/EIO errors in rename/open caused by race condition in smb2_compound_op
    54de256d35b0 ARM: pxa: maybe fix gpio lookup tables
    2c3dd5badde8 ARM: dts: s5pv210: Remove spi-cs-high on panel in Aries
    b246695636a8 phy: qcom-qmp: fix struct clk leak on probe errors
    ebc56b0f737b clk: tegra: Add missing reset deassertion
    c465cf934bb1 arm64: tegra: Add missing DFLL reset on Tegra210
    977cc97b2e50 arm64: dts: qcom: ipq8074: fix the sleep clock frequency
    99367bf45dc6 gma500: fix an incorrect NULL check on list iterator
    9a1f41d77bb4 tilcdc: tilcdc_external: fix an incorrect NULL check on list iterator
    339ddef25f86 serial: pch: don't overwrite xmit->buf[0] by x_char
    5607652823ac bcache: avoid journal no-space deadlock by reserving 1 journal bucket
    cc7ff57a0acf bcache: remove incremental dirty sector counting for bch_sectors_dirty_init()
    df973468f9ce bcache: improve multithreaded bch_sectors_dirty_init()
    a5580b90d378 bcache: improve multithreaded bch_btree_check()
    2037d8cf8ceb stm: ltdc: fix two incorrect NULL checks on list iterator
    9161ae1c04cd carl9170: tx: fix an incorrect use of list iterator
    91d973aa0d69 ASoC: rt5514: Fix event generation for "DSP Voice Wake Up" control
    6ad81ad0cf57 rtl818x: Prevent using not initialized queues
    4b02493838d9 xtensa/simdisk: fix proc_read_simdisk()
    fd9a5081ee33 mm/memremap: fix missing call to untrack_pfn() in pagemap_range()
    715455ca5e81 hugetlb: fix huge_pmd_unshare address update
    0a561368ceca nodemask.h: fix compilation error with GCC12
    fb49bd85dfac mm/page_alloc: always attempt to allocate at least one page during bulk allocation
    c142bddf3706 Revert "mm/cma.c: remove redundant cma_mutex lock"
    f81e67efa712 iommu/dma: Fix iova map result check bug
    a3f98e4331e0 iommu/msm: Fix an incorrect NULL check on list iterator
    69c14d29727c ksmbd: fix outstanding credits related bugs
    cae2978d6907 ftrace: Clean up hash direct_functions on register failures
    53b858c80753 kexec_file: drop weak attribute from arch_kexec_apply_relocations[_add]
    10995a382271 um: Fix out-of-bounds read in LDT setup
    06ebe1bd3071 um: chan_user: Fix winch_tramp() return value
    b012254ad018 um: Use asm-generic/dma-mapping.h
    92dce560a809 mac80211: upgrade passive scan to active scan on DFS channels after beacon rx
    9cf980092286 cfg80211: declare MODULE_FIRMWARE for regulatory.db
    8e354518f576 thermal: devfreq_cooling: use local ops instead of global ops
    de23a6a1a31f irqchip: irq-xtensa-mx: fix initial IRQ affinity
    297c9c640d6e irqchip/armada-370-xp: Do not touch Performance Counter Overflow on A375, A38x, A39x
    ba810df878b0 csky: patch_text: Fixup last cpu should be master
    f828af2c527d mmc: core: Allows to override the timeout value for ioctl() path
    3f09ec80f115 RDMA/hfi1: Fix potential integer multiplication overflow errors
    64639d11186e Kconfig: Add option for asm goto w/ tied outputs to workaround clang-13 bug
    3892794a1813 ima: remove the IMA_TEMPLATE Kconfig option
    5fd1717439ea media: coda: Add more H264 levels for CODA960
    dc2672109c86 media: coda: Fix reported H264 profile
    c925d688e4dc mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
    b974364bda19 mtd: cfi_cmdset_0002: Move and rename chip_check/chip_ready/chip_good_for_write
    a105177c0510 md: fix an incorrect NULL check in md_reload_sb
    7907930218a6 md: fix an incorrect NULL check in does_sb_need_changing
    35511d4fdd6b drm/i915/dsi: fix VBT send packet port selection for ICL+
    df1f9631eb6d drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX
    a810f54d0576 drm/nouveau/kms/nv50-: atom: fix an incorrect NULL check on list iterator
    d1efc36beaaa drm/nouveau/clk: Fix an incorrect NULL check on list iterator
    03bd455a79f6 drm/etnaviv: check for reaped mapping in etnaviv_iommu_unmap_gem
    6e842e680bf0 drm/nouveau/subdev/bus: Ratelimit logging for fault errors
    70276460e914 drm/amdgpu/cs: make commands with 0 chunks illegal behaviour.
    f55f9e7ce63b landlock: Fix same-layer rule unions
    f859580c2738 landlock: Create find_rule() from unmask_layers()
    f7d62cb59f6d landlock: Reduce the maximum number of layers to 16
    f4cd27b8466a landlock: Define access_mask_t to enforce a consistent access mask size
    90136f20a3d4 selftests/landlock: Test landlock_create_ruleset(2) argument check ordering
    c1d9c0d0c7a9 landlock: Change landlock_restrict_self(2) check ordering
    1707df9edaed landlock: Change landlock_add_rule(2) argument check ordering
    bb416965dbb8 selftests/landlock: Add tests for O_PATH
    e3e10606ba50 selftests/landlock: Fully test file rename with "remove" access
    df2af378bc0c selftests/landlock: Extend access right tests to directories
    1d6722353be7 selftests/landlock: Add tests for unknown access rights
    d709e275a05b selftests/landlock: Extend tests for minimal valid attribute size
    a6d127b86916 selftests/landlock: Make tests build with old libc
    e42fd0775536 landlock: Fix landlock_add_rule(2) documentation
    ef350611729b samples/landlock: Format with clang-format
    ace624691974 samples/landlock: Add clang-format exceptions
    de7a39e84588 selftests/landlock: Format with clang-format
    43c3014c6fd4 selftests/landlock: Normalize array assignment
    f5c70d9deab0 selftests/landlock: Add clang-format exceptions
    695c7c06162a landlock: Format with clang-format
    58f52ad1d0ad landlock: Add clang-format exceptions
    1be49ae16f53 scsi: ufs: qcom: Add a readl() to make sure ref_clk gets enabled
    a078e6e8f4e3 scsi: dc395x: Fix a missing check on list iterator
    9c96238fac04 ocfs2: dlmfs: fix error handling of user_dlm_destroy_lock
    e70f0582805b dlm: fix missing lkb refcount handling
    697b45d5f06a dlm: uninitialized variable on error in dlm_listen_for_all()
    acdad5bc9827 dlm: fix plock invalid read
    f19e2e1d8528 s390/stp: clock_delta should be signed
    42b2f5ddc220 s390/perf: obtain sie_block from the right address
    20e6ec76aed4 mm, compaction: fast_find_migrateblock() should return pfn in the target zone
    ac2eab7de458 staging: r8188eu: prevent ->Ssid overflow in rtw_wx_set_scan()
    a7daaaa84548 PCI: qcom: Fix unbalanced PHY init on probe errors
    4f9d6407b607 PCI: qcom: Fix runtime PM imbalance on probe errors
    0db67767ff3a PCI/PM: Fix bridge_d3_blacklist[] Elo i2 overwrite of Gigabyte X299
    283bda02d0c1 drm/amdgpu: add beige goby PCI ID
    4ef5ab5344ba tracing: Initialize integer variable to prevent garbage return value
    37443b3508b8 tracing: Fix potential double free in create_var_ref()
    0b011b408f34 tty: goldfish: Introduce gf_ioread32()/gf_iowrite32()
    b3485d2b09e9 ACPI: property: Release subnode properties with data nodes
    3a3ce9416454 ext4: avoid cycles in directory h-tree
    ca17db384762 ext4: verify dir block before splitting it
    3c617827cd51 ext4: fix bug_on in __es_tree_search
    b99fd7341835 ext4: filter out EXT4_FC_REPLAY from on-disk superblock field s_state
    18a759f7f99f ext4: fix bug_on in ext4_writepages
    b81d2ff6885e ext4: fix warning in ext4_handle_inode_extension
    14602353b350 ext4: fix race condition between ext4_write and ext4_convert_inline_data
    364380c00912 ext4: fix use-after-free in ext4_rename_dir_prepare
    3e4b684f1e32 ext4: mark group as trimmed only if it was fully scanned
    6ee0868b0c3c bfq: Make sure bfqg for which we are queueing requests is online
    86defc542441 bfq: Get rid of __bio_blkcg() usage
    54c08ef2d296 bfq: Track whether bfq_group is still online
    2b802c0cb872 bfq: Remove pointless bfq_init_rq() calls
    a107df383c16 bfq: Drop pointless unlock-lock pair
    e8821f45612f bfq: Update cgroup information before merging bio
    81b7d0c717a4 bfq: Split shared queues on move between cgroups
    5ee21edaed09 bfq: Avoid merging queues with different parents
    d639a4c0df2b bfq: Avoid false marking of bic as stably merged
    65237307f88f efi: Do not import certificates from UEFI Secure Boot for T2 Macs
    9bc601c6642c fs-writeback: writeback_sb_inodes：Recalculate 'wrote' according skipped pages
    87737ee52963 iwlwifi: mvm: fix assert 1F04 upon reconfig
    b79110f2bf60 wifi: mac80211: fix use-after-free in chanctx code
    4a6ca6f8a3a0 objtool: Fix symbol creation
    c49238245dd9 objtool: Fix objtool regression on x32 systems
    7cfe2d43beca f2fs: fix to do sanity check for inline inode
    59f42b415002 f2fs: fix fallocate to use file_modified to update permissions consistently
    6bde47f4e813 f2fs: don't use casefolded comparison for "." and ".."
    c9e4cd5b0ccd f2fs: fix to do sanity check on total_data_blocks
    01572a3cb59f f2fs: don't need inode lock for system hidden quota
    7fc40280103f f2fs: fix deadloop in foreground GC
    c9196d21359b f2fs: fix to clear dirty inode in f2fs_evict_inode()
    f2e1c38b5ac6 f2fs: fix to do sanity check on block address in f2fs_do_zero_range()
    bce859358d3d f2fs: fix to avoid f2fs_bug_on() in dec_valid_node_count()
    54c408800f3f NFSv4.1 mark qualified async operations as MOVEABLE tasks
    c5665c29dd41 NFS: Convert GFP_NOFS to GFP_KERNEL
    29b51ae02df5 NFS: Create a new nfs_alloc_fattr_with_label() function
    00fa80189c97 NFS: Always initialise fattr->label in nfs_fattr_alloc()
    0fac5f8fb1bc video: fbdev: vesafb: Fix a use-after-free due early fb_info cleanup
    7654c4563501 perf jevents: Fix event syntax error caused by ExtSel
    590df0a151d3 perf c2c: Use stdio interface if slang is not supported
    06e4fa5a5cbf perf build: Fix btf__load_from_kernel_by_id() feature check
    b52e192ffda8 i2c: rcar: fix PM ref counts in probe error paths
    c06cfe582f42 i2c: npcm: Handle spurious interrupts
    708c34bc723d i2c: npcm: Correct register access width
    84721299cb9f i2c: npcm: Fix timeout calculation
    7e4bfd3b9a59 iommu/amd: Increase timeout waiting for GA log enablement
    85c2d1bb73de dmaengine: stm32-mdma: fix chan initialization in stm32_mdma_irq_handler()
    33b5d6add852 dmaengine: stm32-mdma: remove GISR1 register
    f2dfb4ab887d video: fbdev: clcdfb: Fix refcount leak in clcdfb_of_vram_setup
    08b9d374c84a NFS: Further fixes to the writeback error handling
    eaf407d5b5fe NFSv4/pNFS: Do not fail I/O when we fail to allocate the pNFS layout
    471577e926eb NFS: Don't report errors from nfs_pageio_complete() more than once
    a3bbd8b1aa4c NFS: Do not report flush errors in nfs_write_end()
    3a2d62ec419b NFS: Don't report ENOSPC write errors twice
    0d548c0c7082 NFS: fsync() should report filesystem errors over EINTR/ERESTARTSYS
    79e0b7436bc4 NFS: Do not report EINTR/ERESTARTSYS as mapping errors
    b3c7b5d08e9d dmaengine: idxd: Fix the error handling path in idxd_cdev_register()
    b9c9b4584b4b i2c: at91: Initialize dma_buf in at91_twi_xfer()
    c3c2734e28d7 iommu/mediatek: Fix NULL pointer dereference when printing dev_name
    646070b64836 MIPS: Loongson: Use hwmon_device_register_with_groups() to register hwmon
    fc90f13ea0dc iommu/arm-smmu-v3-sva: Fix mm use-after-free
    2f124280f0ae cpufreq: mediatek: Unregister platform device on exit
    4477a67d0b56 cpufreq: mediatek: Use module_init and add module_exit
    8d27c2186eea i2c: at91: use dma safe buffers
    596f59d33691 iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
    053465ab20dc iommu/mediatek: Remove clk_disable in mtk_iommu_remove
    a216539403ca iommu/mediatek: Add list_del in mtk_iommu_remove
    bf45d764616a iommu/mediatek: Fix 2 HW sharing pgtable issue
    9e53c25f3266 iommu/amd: Enable swiotlb in all cases
    45b2b7d7108a f2fs: fix dereference of stale list iterator after loop body
    250e5a6be52a f2fs: fix to do sanity check on inline_dots inode
    2646992ddf3e f2fs: support fault injection for dquot_initialize()
    24705fd3f390 OPP: call of_node_put() on error path in _bandwidth_supported()
    64522155ea73 Input: stmfts - do not leave device disabled in stmfts_input_open
    4f1c4fa37f8b KVM: LAPIC: Drop pending LAPIC timer injection when canceling the timer
    ca55150bff58 RDMA/hfi1: Prevent use of lock before it is initialized
    119f99209d85 mailbox: forward the hrtimer if not queued and under a lock
    075564ed4089 nfsd: destroy percpu stats counters after reply cache shutdown
    5289795824b7 mfd: davinci_voicecodec: Fix possible null-ptr-deref davinci_vc_probe()
    7b668a59ddfb powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
    65f11ccdd746 powerpc/xive: Fix refcount leak in xive_spapr_init
    fd7a3548af09 powerpc/xive: Add some error handling code to 'xive_spapr_init()'
    f04604987c7b macintosh: via-pmu and via-cuda need RTC_LIB
    bd89ccd736bf powerpc/perf: Fix the threshold compare group constraint for power9
    42063c1c1fb1 powerpc/perf: Fix the threshold compare group constraint for power10
    5a8849d3cb80 powerpc/64: Only WARN if __pa()/__va() called with bad addresses
    2530a7c23643 hwrng: omap3-rom - fix using wrong clk_disable() in omap_rom_rng_runtime_resume()
    bb1030d3de10 PCI: microchip: Fix potential race in interrupt handling
    acb748fdc59e PCI/AER: Clear MULTI_ERR_COR/UNCOR_RCV bits
    418b6a3e12f7 Input: sparcspkr - fix refcount leak in bbc_beep_probe
    35972ce3fb7a hugetlbfs: fix hugetlbfs_statfs() locking
    cd4815c5c97f ARM: dts: at91: sama7g5: remove interrupt-parent from gic node
    2a30446f4014 crypto: cryptd - Protect per-CPU resource by disabling BH.
    de5b734db295 crypto: sun8i-ss - handle zero sized sg
    bbfc612ac579 crypto: sun8i-ss - rework handling of IV
    18ca0d55e863 tty: fix deadlock caused by calling printk() under tty_port->lock
    518fa6bc7a52 PCI: imx6: Fix PERST# start-up sequence
    6df8af611d60 ipc/mqueue: use get_tree_nodev() in mqueue_get_tree()
    f588b925915a proc: fix dentry/inode overinstantiating under /proc/${pid}/net
    eb610fdf4916 ASoC: atmel-classd: Remove endianness flag on class d component
    7553130725eb ASoC: atmel-pdmic: Remove endianness flag on pdmic component
    dd0ee5549368 arm64: dts: marvell: espressobin-ultra: enable front USB3 port
    4ece24db394c arm64: dts: marvell: espressobin-ultra: fix SPI-NOR config
    e42ceeca700a RDMA/hns: Add the detection for CMDQ status in the device initialization process
    4237eb9bdf59 powerpc/4xx/cpm: Fix return value of __setup() handler
    c8a9b3defaad powerpc/idle: Fix return value of __setup() handler
    5ed0519d4256 pinctrl: renesas: core: Fix possible null-ptr-deref in sh_pfc_map_resources()
    6a9992f80c0f pinctrl: renesas: r8a779a0: Fix GPIO function on I2C-capable pins
    6cc90d5d449e powerpc/8xx: export 'cpm_setbrg' for modules
    878f89e7261e drm/msm/dpu: fix error check return value of irq_of_parse_and_map()
    5d5d993f16be list: fix a data-race around ep->rdllist
    8be32624f457 list: introduce list_is_head() helper and re-use it in list.h
    b53f6ba21b94 firmware: arm_ffa: Remove incorrect assignment of driver_data
    b5c203ea0b96 firmware: arm_ffa: Fix uuid parameter to ffa_partition_probe
    eca2c185bbbf drivers/base/memory: fix an unlikely reference counting issue in __add_memory_block()
    42ff63c485eb dax: fix cache flush on PMD-mapped pages
    b3fcf1f583b1 drivers/base/node.c: fix compaction sysfs file leak
    05f34867b616 pinctrl: mvebu: Fix irq_of_parse_and_map() return value
    638d39ed2ce6 nvdimm: Allow overwrite in the presence of disabled dimms
    2f97ebc58d5f nvdimm: Fix firmware activation deadlock scenarios
    98342148a8cd firmware: arm_scmi: Fix list protocols enumeration in the base protocol
    cff2553569f3 ASoC: sh: rz-ssi: Release the DMA channels in rz_ssi_probe() error path
    b7c13643e1f6 ASoC: sh: rz-ssi: Propagate error codes returned from platform_get_irq_byname()
    94241e74b79c ASoC: sh: rz-ssi: Check return value of pm_runtime_resume_and_get()
    d5e9dd4f651e arm64: dts: ti: k3-am64-mcu: remove incorrect UART base clock rates
    5650e103bfc7 soc: bcm: Check for NULL return of devm_kzalloc()
    45f1920e26eb scsi: fcoe: Fix Wstringop-overflow warnings in fcoe_wwn_from_mac()
    c762c4206bb4 mfd: ipaq-micro: Fix error check return value of platform_get_irq()
    2db3a8f54184 powerpc/fadump: fix PT_LOAD segment for boot memory area
    40c84e778e5f Drivers: hv: vmbus: Fix handling of messages with transaction ID of zero
    c43efa63a610 arm64: dts: qcom: qrb5165-rb5: Fix can-clock node name
    01d4fe0380f9 pinctrl: mediatek: mt8195: enable driver on mtk platforms
    dbd72f452e21 pinctrl/rockchip: support deferring other gpio params
    ffea838686b8 arm: mediatek: select arch timer for mt7629
    2b9f355ad891 pinctrl: bcm2835: implement hook for missing gpio-ranges
    20340be21699 gpiolib: of: Introduce hook for missing gpio-ranges
    ef1e9def63e4 crypto: marvell/cesa - ECB does not IV
    8fb674216835 misc: ocxl: fix possible double free in ocxl_file_register_afu
    11ee8e960007 ARM: dts: bcm2835-rpi-b: Fix GPIO line names
    fafc8daf0a24 ARM: dts: bcm2837-rpi-3-b-plus: Fix GPIO line name of power LED
    fdafe0bb000e ARM: dts: bcm2837-rpi-cm3-io3: Fix GPIO line names for SMPS I2C
    a444bafd72f3 ARM: dts: bcm2835-rpi-zero-w: Fix GPIO line name for Wifi/BT
    775992b4cb1d ARM: dts: stm32: Fix PHY post-reset delay on Avenger96
    ec65a8d8ca30 can: xilinx_can: mark bit timing constants as const
    6830891ed5e4 platform/chrome: Re-introduce cros_ec_cmd_xfer and use it for ioctls
    fc1e9dd97cec ARM: dts: imx6dl-colibri: Fix I2C pinmuxing
    9816480848c3 platform/chrome: cros_ec: fix error handling in cros_ec_register()
    55e1c42d968f crypto: qat - set COMPRESSION capability for DH895XCC
    7829a8595825 crypto: qat - set CIPHER capability for DH895XCC
    bb170dac3b7f crypto: qat - set COMPRESSION capability for QAT GEN2
    69f4641ad492 crypto: qat - set CIPHER capability for QAT GEN2
    99ace864e53e KVM: nVMX: Clear IDT vectoring on nested VM-Exit for double/triple fault
    a1d52910a0f4 KVM: nVMX: Leave most VM-Exit info fields unmodified on failed VM-Entry
    854904552ee7 soc: qcom: llcc: Add MODULE_DEVICE_TABLE()
    940808971b19 ARM: dts: ci4x10: Adapt to changes in imx6qdl.dtsi regarding fec clocks
    16c25287acd0 PCI: dwc: Fix setting error return on MSI DMA mapping failure
    ad1c9d13e045 PCI: mediatek: Fix refcount leak in mtk_pcie_subsys_powerup()
    d41a739cc7c1 PCI: rockchip: Fix find_first_zero_bit() limit
    d3c684749f87 PCI: cadence: Fix find_first_zero_bit() limit
    c0730d8658c0 soc: qcom: smsm: Fix missing of_node_put() in smsm_parse_ipc
    e13ad5f23049 soc: qcom: smp2p: Fix missing of_node_put() in smp2p_parse_ipc
    3f4c0083dd9a ARM: dts: suniv: F1C100: fix watchdog compatible
    86a8ed8793f8 ARM: dts: BCM5301X: Update pin controller node name
    5151f24ac937 ARM: dts: BCM5301X: update CRU block description
    cd1d22174175 memory: samsung: exynos5422-dmc: Avoid some over memory allocation
    4cb6687016b4 PCI/ACPI: Allow D3 only if Root Port can signal and wake from D3
    364f93243355 arm64: dts: mt8192: Fix nor_flash status disable typo
    e1d36fb7e70c arm64: dts: rockchip: Move drive-impedance-ohm to emmc phy on rk3399
    a48a7f89494f dma-direct: don't over-decrypt memory
    5beb74d11eab dma-direct: always leak memory that can't be re-encrypted
    9ba801c80c47 dma-direct: don't call dma_set_decrypted for remapped allocations
    82b3f045aff5 dma-direct: factor out dma_set_{de,en}crypted helpers
    8eb0e5a2659c net/smc: postpone sk_refcnt increment in connect()
    23a576718345 net: dsa: restrict SMSC_LAN9303_I2C kconfig
    90920566df88 hinic: Avoid some over memory allocation
    2ba52ad365c1 net: huawei: hinic: Use devm_kcalloc() instead of devm_kzalloc()
    d8642575a55d rxrpc: Fix decision on when to generate an IDLE ACK
    12098cebf07b rxrpc: Don't let ack.previousPacket regress
    9d5c62e63ae7 rxrpc: Fix overlapping ACK accounting
    cea2196643b2 rxrpc: Don't try to resend the request if we're receiving the reply
    b3a9b227d5e7 rxrpc: Fix listen() setting the bar too high for the prealloc rings
    1047d4ac6677 hwmon: (pmbus) Check PEC support before reading other registers
    a459bd84ad41 hv_netvsc: Fix potential dereference of NULL pointer
    651c6b2d1dac net: stmmac: fix out-of-bounds access in a selftest
    41f3571616ac net: stmmac: selftests: Use kcalloc() instead of kzalloc()
    38acee9e1453 ASoC: max98090: Move check for invalid values before casting in max98090_put_enab_tlv()
    a89ca82d6bf2 NFC: hci: fix sleep in atomic context bugs in nfc_hci_hcp_message_tx
    aa5b6d09ff66 net: macb: Fix PTP one step sync support
    37fd61fc7020 PM: domains: Fix initialization of genpd's next_wakeup
    85a18d128d18 ASoC: wm2000: fix missing clk_disable_unprepare() on error in wm2000_anc_transition()
    cf9c07d8f7e9 bfq: Allow current waker to defend against a tentative one
    9de82bfc0514 bfq: Relax waker detection for shared queues
    3ade442ea5d3 thermal/drivers/imx_sc_thermal: Fix refcount leak in imx_sc_thermal_probe
    21ccc58b671a thermal/core: Fix memory leak in __thermal_cooling_device_register()
    ef1235c6514a thermal/drivers/broadcom: Fix potential NULL dereference in sr_thermal_probe
    c4e1280abead thermal/drivers/bcm2711: Don't clamp temperature at zero
    d50d1c703bbd drm/i915: Fix CFI violation with show_dynamic_id()
    a1bcaea4afca drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path
    3e6a23ce7460 selftests/bpf: Add missed ima_setup.sh in Makefile
    beb81c13d020 drm/msm: don't free the IRQ if it was not requested
    00fcd8552cce x86/sev: Annotate stack change in the #VC handler
    33546183c16c drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()
    edff4c1af831 drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
    a11f4f01885a ext4: reject the 'commit' option on ext2 filesystems
    9ebbfa73d699 regulator: scmi: Fix refcount leak in scmi_regulator_probe
    692c8de5bdbc media: rkvdec: h264: Fix bit depth wrap in pps packet
    9031ef386621 media: rkvdec: h264: Fix dpb_valid implementation
    3c90fdbac6b2 media: staging: media: rkvdec: Make use of the helper function devm_platform_ioremap_resource()
    54d6fdf66dd4 media: i2c: ov5648: fix wrong pointer passed to IS_ERR() and PTR_ERR()
    8329361a3eba media: ov7670: remove ov7670_power_off from ov7670_remove
    018b0292c180 kselftest/arm64: bti: force static linking
    2a3966b950b3 ASoC: ti: j721e-evm: Fix refcount leak in j721e_soc_probe_*
    cf31d1ef3839 net: hinic: add missing destroy_workqueue in hinic_pf_to_mgmt_init
    9b01252e6c20 sctp: read sk->sk_bound_dev_if once in sctp_rcv()
    d17b01588e0c m68k: math-emu: Fix dependencies of math emulation support
    b5518b9b41f1 nvme: set dma alignment to dword
    ce237c1e252d Bluetooth: use hdev lock for accept_list and reject_list in conn req
    ab00f8c6b14e Bluetooth: use hdev lock in activate_scan for hci_is_adv_monitoring
    65d347cb39e2 Bluetooth: fix dangling sco_conn and use-after-free in sco_sock_timeout
    dd646f51808e media: hantro: HEVC: Fix tile info buffer value computation
    1207ddc93b9e media: atmel: atmel-sama5d2-isc: fix wrong mask in YUYV format check
    a4cd52464bf2 media: vsp1: Fix offset calculation for plane cropping
    3309c2c574e1 media: pvrusb2: fix array-index-out-of-bounds in pvr2_i2c_core_init
    2f6ced0e8fa5 media: exynos4-is: Change clk_disable to clk_disable_unprepare
    b6db1bbeaf79 media: i2c: rdacm2x: properly set subdev entity function
    f0d9105f2843 media: atmel: atmel-isc: Fix PM disable depth imbalance in atmel_isc_probe
    204e53586b36 media: st-delta: Fix PM disable depth imbalance in delta_probe
    0d2127608348 mt76: do not attempt to reorder received 802.3 packets without agg session
    663457f421d4 mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
    8ffc866d2f18 media: exynos4-is: Fix PM disable depth imbalance in fimc_is_probe
    819c8af5e572 media: aspeed: Fix an error handling path in aspeed_video_probe()
    795cc5b2b5a2 scripts/faddr2line: Fix overlapping text section failures
    7fc8f4717e39 kselftest/cgroup: fix test_stress.sh to use OUTPUT dir
    d63ffecd1136 block: Fix the bio.bi_opf comment
    85d899f39662 ASoC: samsung: Fix refcount leak in aries_audio_probe
    e2fa42e4c231 ASoC: samsung: Use dev_err_probe() helper
    6635e6ba1649 dma-direct: don't fail on highmem CMA pages in dma_direct_alloc_pages
    639518f8e0d3 dma-direct: factor out a helper for DMA_ATTR_NO_KERNEL_MAPPING allocations
    56ab0c010274 regulator: pfuze100: Fix refcount leak in pfuze_parse_regulators_dt
    244911244066 ASoC: mxs-saif: Fix refcount leak in mxs_saif_probe
    cf760e494ee5 ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
    922bccdb1796 ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
    8737b5163f4e ASoC: fsl: Use dev_err_probe() helper
    319d60b74860 HID: amd_sfh: Modify the hid name
    21e8fc0c574c HID: amd_sfh: Modify the bus name
    7fef8ec5b1d8 wilc1000: fix crash observed in AP mode with cfg80211_register_netdevice()
    1eb4f56f8ff9 ath11k: Don't check arvif->is_started before sending management frames
    84e92386d12d perf/amd/ibs: Use interrupt regs ip for stack unwinding
    a532b341d704 samples: bpf: Don't fail for a missing VMLINUX_BTF when VMLINUX_H is provided
    0480f70d13c6 regulator: qcom_smd: Fix up PM8950 regulator configuration
    ca3fd5ff7b80 Revert "cpufreq: Fix possible race in cpufreq online error path"
    10f537219629 spi: spi-fsl-qspi: check return value after calling platform_get_resource_byname()
    76f5bd1eed01 iomap: iomap_write_failed fix
    e7308391df97 arm64: stackleak: fix current_top_of_stack()
    29d441903f22 media: uvcvideo: Fix missing check to determine if element is found in list
    3aece8b03c08 drm/msm: return an error pointer in msm_gem_prime_get_sg_table()
    09bdeedc1fc5 drm/msm/mdp5: Return error code in mdp5_mixer_release when deadlock is detected
    04bef5f1ba8e drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected
    c063df41227d drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()
    f5947118e729 drm/msm/dsi: fix address for second DSI PHY on SDM660
    81180f6d74c2 regulator: core: Fix enable_count imbalance with EXCLUSIVE_GET
    75868ee93b1d arm64: fix types in copy_highpage()
    381a1e274872 x86/mm: Cleanup the control_va_addr_alignment() __setup handler
    49887ad6ba63 irqchip/aspeed-scu-ic: Fix irq_of_parse_and_map() return value
    89a223d81114 irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
    c1cfb6f65238 irqchip/exiu: Fix acknowledgment of edge triggered interrupts
    737b14e49070 x86: Fix return value of __setup handlers
    20b946ef8496 nl80211: don't hold RTNL in color change request
    bd85a268bf82 virtio_blk: fix the discard_granularity and discard_alignment queue limits
    18f2967418d0 perf tools: Use Python devtools for version autodetection rather than runtime
    ac3319c4ccf4 spi: cadence-quadspi: fix Direct Access Mode disable for SoCFPGA
    b54926bd558d drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()
    bd14de73644e kunit: fix debugfs code to use enum kunit_status, not bool
    ee21431e3022 drm/panel: panel-simple: Fix proper bpc for AM-1280800N3TZQW-T00H
    4d6582938ad3 drm/msm: add missing include to msm_drv.c
    e5d7cb9a18f1 drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
    4cd66a8016b8 drm/msm/hdmi: check return value after calling platform_get_resource_byname()
    212ecbeaf10a drm/msm/dsi: fix error checks and return values for DSI xmit functions
    f7e3daef5e23 drm/msm/dp: do not stop transmitting phy test pattern during DP phy compliance test
    bac5ff8594cb drm/msm/dp: reset DP controller before transmit phy test pattern
    75ec09a929dd drm/msm/dp: fix error check return value of irq_of_parse_and_map()
    d5e7956d8f5b drm/msm/dp: stop event kernel thread when DP unbind
    ef4bdaac7cb5 drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume
    4ae67e8494e1 perf tools: Add missing headers needed by util/data.h
    79c431eefd08 ASoC: rk3328: fix disabling mclk on pclk probe failure
    32f8691dd789 x86/speculation: Add missing prototype for unpriv_ebpf_notify()
    e5b1e419cdb6 mtd: rawnand: intel: fix possible null-ptr-deref in ebu_nand_probe()
    0cfee868b89f mtd: rawnand: cadence: fix possible null-ptr-deref in cadence_nand_dt_probe()
    6a97103fe022 x86/pm: Fix false positive kmemleak report in msr_build_context()
    fad41a8f8856 mtd: spi-nor: core: Check written SR value in spi_nor_write_16bit_sr_and_check()
    32c7cbb75b36 libbpf: Fix logic for finding matching program for CO-RE relocation
    2324985aa700 selftests/resctrl: Fix null pointer dereference on open failed
    4be045434923 drm/v3d: Fix null pointer dereference of pointer perfmon
    663d326bcf3a scsi: ufs: core: Exclude UECxx from SFR dump list
    f265dea6b8b8 scsi: ufs: qcom: Fix ufs_qcom_resume()
    90e9c14206e3 scsi: iscsi: Fix harmless double shift bug
    fbe55bc9ab7b drm/msm/dpu: adjust display_v_end for eDP and DP
    6411d0c45878 drm/msm/hdmi: switch to drm_bridge_connector
    181ec5b45a22 drm/msm/dp: Modify prototype of encoder based API
    9ea7148f61cd selftests/damon: add damon to selftests root Makefile
    6fbd040cae20 of: overlay: do not break notify on NOTIFY_{OK|STOP}
    9b2aa765fb29 spi: rockchip: fix missing error on unsupported SPI_CS_HIGH
    3359a48495ac spi: rockchip: Preset cs-high and clk polarity in setup progress
    523f6fe7b034 spi: rockchip: Stop spi slave dma receiver when cs inactive
    eb57de933e4a fsnotify: fix wrong lockdep annotations
    4ab1195c213d inotify: show inotify mask flags in proc fdinfo
    f41c9418c589 mtdblock: warn if opened on NAND
    7784d22f81a2 ALSA: pcm: Check for null pointer of pointer substream before dereferencing it
    260cd3146fc4 drm/panel: simple: Add missing bus flags for Innolux G070Y2-L01
    1911bc6e6d24 media: hantro: Empty encoder capture buffers by default
    a4ec75df7057 media: i2c: max9286: fix kernel oops when removing module
    678c63978e09 media: i2c: max9286: Use "maxim,gpio-poc" property
    d7678a7a55d0 media: i2c: max9286: Use dev_err_probe() helper
    7f6defe0fabc ath9k_htc: fix potential out of bounds access with invalid rxstatus->rs_keyix
    5c7957948c58 printk: wake waiters for safe and NMI contexts
    3b336d607b78 printk: add missing memory barrier to wake_up_klogd()
    195cb7826a47 printk: use atomic updates for klogd work
    bf422b68e772 cpufreq: Fix possible race in cpufreq online error path
    7ba2bb87e9e9 spi: img-spfi: Fix pm_runtime_get_sync() error checking
    dc4d1f3b53f8 sched/psi: report zeroes for CPU full at the system level
    36f416fdda1e sched/fair: Fix cfs_rq_clock_pelt() for throttled cfs_rq
    60768ffcede2 signal: Deliver SIGTRAP on perf event asynchronously if blocked
    4c2122a3d07e drm/mediatek: dpi: Use mt8183 output formats for mt8192
    be96baa0c795 regulator: da9121: Fix uninit-value in da9121_assign_chip_model()
    c731d18a399e drm/bridge: Fix error handling in analogix_dp_probe
    24f9dfdaece9 HID: elan: Fix potential double free in elan_input_configured
    2573a45b5176 HID: hid-led: fix maximum brightness for Dream Cheeky
    3830dbdfb9a4 mtd: rawnand: denali: Use managed device resources
    814706376f36 EDAC/dmc520: Don't print an error for each unconfigured interrupt line
    4400e542b80f drbd: fix duplicate array initializer
    ae42074b409f target: remove an incorrect unmap zeroes data deduction
    c16539ef982c device property: Allow error pointer to be passed to fwnode APIs
    ecc7b8dedf73 device property: Check fwnode->secondary when finding properties
    b61f1f3a0ea7 efi: Add missing prototype for efi_capsule_setup_info
    1632be63862f NFC: NULL out the dev->rfkill to prevent UAF
    0377e8f544a3 ixp4xx_eth: fix error check return value of platform_get_irq()
    ffd4ae87a9f6 net: dsa: mt7530: 1G can also support 1000BASE-X link mode
    79e852bf8fd0 scftorture: Fix distribution of short handler delays
    da840f354836 spi: spi-ti-qspi: Fix return value handling of wait_for_completion_timeout
    4cb37f715f60 drm: mali-dp: potential dereference of null pointer
    7e6ad65b6dc5 drm/komeda: Fix an undefined behavior bug in komeda_plane_add()
    48bd4e97dbfd nl80211: show SSID for P2P_GO interfaces
    c07f6772a058 mptcp: reset the packet scheduler on PRIO change
    4b92cfc4446d x86/PCI: Fix ALi M1487 (IBC) PIRQ router link value interpretation
    049a44dfd6df libbpf: Don't error out on CO-RE relos for overriden weak subprogs
    d47f85cc0171 drm/vc4: txp: Force alpha to be 0xff if it's disabled
    01c9020b2e7c drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
    0e26a6da02e6 drm/vc4: hvs: Reset muxes at probe time
    fdb3da70ad02 drm/mediatek: Fix mtk_cec_mask()
    08465a1889cb drm/vc4: hvs: Fix frame count register readout
    7c7a1f717327 x86/delay: Fix the wrong asm constraint in delay_loop()
    61a85a20e8df ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
    48889eb3cce9 ASoC: mediatek: Fix error handling in mt8173_max98090_dev_probe
    56846d96cce0 spi: qcom-qspi: Add minItems to interconnect-names
    d5b66645305c mtd: spinand: gigadevice: fix Quad IO for GD5F1GQ5UExxG
    adb1ff124a2a drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
    495f08380e84 drm: bridge: icn6211: Fix register layout
    faeb95b4adaa drm/bridge: adv7511: clean up CEC adapter when probe fails
    96db9afa4958 drm/edid: fix invalid EDID extension block filtering
    996409ee9716 ath9k: fix ar9003_get_eepmisc
    b0bc3af3f09d drm: bridge: it66121: Fix the register page length
    384b9eeb9f29 ath11k: acquire ab->base_lock in unassign when finding the peer by addr
    2525e264ce5b drm/vmwgfx: Fix an invalid read
    97c8a8583464 dt-bindings: display: sitronix, st7735r: Fix backlight in example
    4399781c49b2 drm/bridge_connector: enable HPD by default if supported
    710051ebb77b drm: fix EDID struct for old ARM OABI format
    96c460687813 Input: gpio-keys - cancel delayed work only in case of GPIO
    32e6aea33944 RDMA/hfi1: Prevent panic when SDMA is disabled
    9e5b03ca0214 smb3: check for null tcon
    df6d8b689252 powerpc/iommu: Add missing of_node_put in iommu_init_early_dart
    787255e6190a macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
    a4a6a3826943 powerpc/powernv: fix missing of_node_put in uv_init()
    df802880a7f9 powerpc/xics: fix refcount leak in icp_opal_init()
    ce29ea35402d powerpc/powernv/vas: Assign real address to rx_fifo in vas_rx_win_attr
    5eed36dc775e tracing: incorrect isolate_mote_t cast in mm_vmscan_lru_isolate
    72f58a176a02 alpha: fix alloc_zeroed_user_highpage_movable()
    6cd8b30790d0 KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1 LPES setting
    2cdd52840353 PCI: Avoid pci_dev_lock() AB/BA deadlock with sriov_numvfs_store()
    5ca40fcf0da0 powerpc/rtas: Keep MSR[RI] set when calling RTAS
    4668e18bc299 cpufreq: Avoid unnecessary frequency updates due to mismatch
    a3265a944003 ARM: hisi: Add missing of_node_put after of_find_compatible_node
    80b06c4afc14 ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
    83c329b980bd ARM: versatile: Add missing of_node_put in dcscb_init
    c16b59d44513 pinctrl: renesas: rzn1: Fix possible null-ptr-deref in sh_pfc_map_resources()
    50c292b469d4 fat: add ratelimit to fat*_ent_bread()
    a0f7180a2c1c powerpc/fadump: Fix fadump to work with a different endian capture kernel
    de8f0b173d07 ARM: OMAP1: clock: Fix UART rate reporting algorithm
    035ce4ffe0fe ALSA: usb-audio: Move generic implicit fb quirk entries into quirks.c
    07ddf6fbfea1 ALSA: usb-audio: Add quirk bits for enabling/disabling generic implicit fb
    4b9185fbdbfb arm64: dts: qcom: sdm845-xiaomi-beryllium: fix typo in panel's vddio-supply property
    4b9380d92c66 fs: jfs: fix possible NULL pointer dereference in dbFree()
    7cef9274fa1b soc: ti: ti_sci_pm_domains: Check for null return of devm_kcalloc
    eee44c726842 crypto: ccree - use fine grained DMA mapping dir
    cb1be1d4be18 PM / devfreq: rk3399_dmc: Disable edev on remove()
    5d44a053594c arm64: dts: qcom: msm8994: Fix BLSP[12]_DMA channels count
    8337956649ee arm64: dts: qcom: msm8994: Fix the cont_splash_mem address
    fccd667c9c57 ARM: dts: s5pv210: align DMA channels with dtschema
    5712f029726e ARM: dts: socfpga: align interrupt controller node name with dtschema
    531156e1712f ARM: dts: ox820: align interrupt controller node name with dtschema
    b6c6b398629d IB/rdmavt: add missing locks in rvt_ruc_loopback
    ff876b6cf578 scsi: target: tcmu: Avoid holding XArray lock when calling lock_page
    b897da780fd4 gfs2: use i_lock spin_lock for inode qadata
    da6b6b4eab55 selftests/bpf: fix btf_dump/btf_dump due to recent clang change
    f8bd7f369bb8 char: tpm: cr50_i2c: Suppress duplicated error message in .remove()
    4bcd926d787e eth: tg3: silence the GCC 12 array-bounds warning
    dd0728692413 afs: Adjust ACK interpretation to try and cope with NAT
    65b578726d48 rxrpc, afs: Fix selection of abort codes
    a6e80df4f02c rxrpc: Return an error to sendmsg if call failed
    16195406211b m68k: atari: Make Atari ROM port I/O write macros return void
    d295f28cb6eb net: ipa: ignore endianness if there is no header
    6f516847427c x86/microcode: Add explicit CPU vendor dependency
    28beef47f18b can: mcp251xfd: silence clang's -Wunaligned-access warning
    980b79d0be56 nvme: set non-mdts limits in nvme_scan_work
    d9c96e05574f ACPI: CPPC: Assume no transition latency if no PCCT
    649689f49ad9 ASoC: rt1015p: remove dependency on GPIOLIB
    f8ceb9745ba7 ASoC: max98357a: remove dependency on GPIOLIB
    bdd577016943 media: hantro: Stop using H.264 parameter pic_num
    16cae5d85802 media: exynos4-is: Fix compile warning
    660dfa033ccc net: phy: micrel: Allow probing without .driver_data
    5005002b2e12 drm/amd/pm: update smartshift powerboost calc for smu13
    c525d3385f6d drm/amd/pm: update smartshift powerboost calc for smu12
    c2673b86b419 nbd: Fix hung on disconnect request if socket is closed before
    061a6159cea5 ASoC: rt5645: Fix errorenous cleanup order
    906c81dba8ee nvme-pci: fix a NULL pointer dereference in nvme_alloc_admin_tags
    48d32e41bbfe openrisc: start CPU timer early in boot
    6d5deb242874 usbnet: Run unregister_netdev() before unbind() again
    35121d0bb7ad media: cec-adap.c: fix is_configuring state
    32c7b04d535a media: imon: reorganize serialization
    271bea32acc4 media: ccs-core.c: fix failure to call clk_disable_unprepare
    c16cfcac77ec media: hantro: HEVC: unconditionnaly set pps_{cb/cr}_qp_offset values
    a1f2cb0a2613 media: coda: limit frame interval enumeration to supported encoder frame sizes
    eeb4819e94aa media: rga: fix possible memory leak in rga_probe
    4b6807b1cfb8 mt76: fix encap offload ethernet type check
    bf5572fb3fc4 mt76: mt7921: accept rx frames with non-standard VHT MCS10-11
    03755410a8f6 rtlwifi: Use pr_warn instead of WARN_ONCE
    25929a5a69cf ipmi: Fix pr_fmt to avoid compilation issues
    98a0c0dea51d ipmi:ssif: Check for NULL msg when handling events and messages
    717c6f4570a6 ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default
    e202dad51908 dma-debug: change allocation mode from GFP_NOWAIT to GFP_ATIOMIC
    bab459663250 spi: stm32-qspi: Fix wait_cmd timeout in APM mode
    aeca695a19f8 sched/core: Avoid obvious double update_rq_clock warning
    cab410da48c2 perf/amd/ibs: Cascade pmu init functions' return value
    69b296597656 s390/preempt: disable __preempt_count_add() optimization for PROFILE_ALL_BRANCHES
    6320ae1b5876 net: remove two BUG() from skb_checksum_help()
    db6da340d66b scsi: lpfc: Alter FPIN stat accounting logic
    2200453e8910 ASoC: tscs454: Add endianness flag in snd_soc_component_driver
    db6d83e09f76 of: Support more than one crash kernel regions for kexec -s
    22e0b0b84c53 HID: bigben: fix slab-out-of-bounds Write in bigben_probe
    4262a0e46b08 regulator: mt6315: Enforce regulator-compatible, not name
    b305469ed004 drm/amdgpu/ucode: Remove firmware load type check in amdgpu_ucode_free_bo
    a2c87348aceb drm/amdgpu/psp: move PSP memory alloc from hw_init to sw_init
    da3b69a56454 mlxsw: Treat LLDP packets as control
    1377b79917e9 mlxsw: spectrum_dcb: Do not warn about priority changes
    9bb5de6e0b1a ASoC: dapm: Don't fold register value changes into notifications
    77d7fb14890f net/mlx5: fs, delete the FTE when there are no rules attached to it
    87402434ea84 ipv6: Don't send rs packets to the interface of ARPHRD_TUNNEL
    04be468ec13f scsi: target: tcmu: Fix possible data corruption
    903d01a220ef drm: msm: fix error check return value of irq_of_parse_and_map()
    621916afe8cd arm64: compat: Do not treat syscall number as ESR_ELx for a bad syscall
    c2272428090d ath10k: skip ath10k_halt during suspend for driver state RESTARTING
    ae488dafe074 drm/amd/pm: fix the compile warning
    978e3d023256 drm/plane: Move range check for format_count earlier
    47187f617791 ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro Tablet 408
    451b9076903a ath11k: disable spectral scan during spectral deinit
    40cf4ea4d2d4 scsi: lpfc: Fix resource leak in lpfc_sli4_send_seq_to_ulp()
    3ab08d7c1653 scsi: ufs: Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
    7719a8044bf6 drm/amdgpu/sdma: Fix incorrect calculations of the wptr of the doorbells
    942ce0cba14c scsi: megaraid: Fix error check return value of register_chrdev()
    7eb8e4787b43 drivers: mmc: sdhci_am654: Add the quirk to set TESTCD bit
    353298cadbd4 mmc: jz4740: Apply DMA engine limits to maximum segment size
    27f672af28a8 md/bitmap: don't set sb values if can't pass sanity check
    1f0fc1dfb5fd media: cx25821: Fix the warning when removing the module
    98106f100f50 media: pci: cx23885: Fix the error handling in cx23885_initdev()
    9c385b961d4c media: venus: hfi: avoid null dereference in deinit
    84bf55461d2b ath9k: fix QCA9561 PA bias level
    4374b8d71ce8 ASoC: rsnd: care return value from rsnd_node_fixed_index()
    24632913453f ASoC: rsnd: care default case on rsnd_ssiu_busif_err_status_clear()
    a5ce7051db04 drm/amd/pm: fix double free in si_parse_power_table()
    2bcec28ac0b3 cpuidle: PSCI: Improve support for suspend-to-RAM for PSCI OSI mode
    ae373d66c427 scsi: lpfc: Fix call trace observed during I/O with CMF enabled
    7625e81de216 scsi: lpfc: Fix SCSI I/O completion and abort handler deadlock
    271725e40285 scsi: lpfc: Move cfg_log_verbose check before calling lpfc_dmp_dbg()
    fcd1893ef57b tools/power turbostat: fix ICX DRAM power numbers
    30be187da579 spi: spi-rspi: Remove setting {src,dst}_{addr,addr_width} based on DMA direction
    ecfe184509a5 rtw88: 8821c: fix debugfs rssi value
    5cc6f623f481 ALSA: jack: Access input_dev under mutex
    64e9f4f65c94 sfc: ef10: Fix assigning negative value to unsigned variable
    2da36b14af94 rcu: Make TASKS_RUDE_RCU select IRQ_WORK
    ba722d061bc4 rcu-tasks: Fix race in schedule and flush work
    d0d266c2f689 drm/amd/display: Disabling Z10 on DCN31
    3f2dc8106345 drm/komeda: return early if drm_universal_plane_init() fails.
    042f8d5a13d2 mac80211: minstrel_ht: fix where rate stats are stored (fixes debugfs output)
    a425d18a131f ACPICA: Avoid cache flush inside virtual machines
    063ed7dbf9d3 x86/platform/uv: Update TSC sync state for UV5
    0781b564048b fbcon: Consistently protect deferred_takeover with console_lock()
    7665af570b84 ipv6: fix locking issues with loops over idev->addr_list
    48d4a820fd33 ipw2x00: Fix potential NULL dereference in libipw_xmit()
    9547e5ed9c59 b43: Fix assigning negative value to unsigned variable
    e7823a60f339 b43legacy: Fix assigning negative value to unsigned variable
    07ea9293330d mwifiex: add mutex lock for call in mwifiex_dfs_chan_sw_work_queue
    2485af5ca4bb selftests/bpf: Fix parsing of prog types in UAPI hdr for bpftool sync
    3117e7a0de6f selftests/bpf: Fix vfs_link kprobe definition
    32e10aabc287 drm/virtio: fix NULL pointer dereference in virtio_gpu_conn_get_modes
    079164db407c drm/vmwgfx: validate the screen formats
    4475d3c3b224 iommu/vt-d: Add RPLS to quirk list to skip TE disabling
    08128d6cac4e btrfs: fix the error handling for submit_extent_page() for btrfs_do_readpage()
    80e2340d1f80 btrfs: repair super block num_devices automatically
    b17dada226ab btrfs: return correct error number for __extent_writepage_io()
    018110b5daa8 btrfs: add "0x" prefix for unsupported optional features
    83d0ed00cca8 ptrace: Reimplement PTRACE_KILL by always sending SIGKILL
    7400a7e0a7ae ptrace/xtensa: Replace PT_SINGLESTEP with TIF_SINGLESTEP
    e1c91672c5c8 ptrace/um: Replace PT_DTRACE with TIF_SINGLESTEP
    260650ddc864 x86/sgx: Set active memcg prior to shmem allocation
    8765a423a87d x86/kexec: fix memory leak of elf header buffer
    7aef4ecc3150 perf/x86/intel: Fix event constraints for ICL
    cc0dd4456f95 x86/MCE/AMD: Fix memory leak when threshold_create_bank() fails
    d9a04bc7d1b8 platform/x86: intel-hid: fix _DSM function index handling
    dfe5921112cf xhci: Allow host runtime PM as default for Intel Alder Lake N xHCI
    791f532de70d cifs: when extending a file with falloc we should make files not-sparse
    ce0008a0e410 cifs: fix potential double free during failed mount
    d7b5577272c2 fs/ntfs3: Restore ntfs_xattr_get_acl and ntfs_xattr_set_acl functions
    79f44f05e756 fs/ntfs3: Update i_ctime when xattr is added
    d8be98ab8825 fs/ntfs3: Fix some memory leaks in an error handling path of 'log_replay()'
    8bac05d61f26 fs/ntfs3: In function ntfs_set_acl_ex do not change inode->i_mode if called from function ntfs_init_acl
    f45bd2922d66 fs/ntfs3: Check new size for limits
    dc05aa14d311 fs/ntfs3: Keep preallocated only if option prealloc enabled
    3eb42b847e43 fs/ntfs3: Fix fiemap + fix shrink file size (to remove preallocated space)
    87e9cd4b8692 fs/ntfs3: Update valid size if -EIOCBQUEUED
    0cebad7ee61a usb: core: hcd: Add support for deferring roothub registration
    5a3eec6f67d3 usb: dwc3: gadget: Move null pinter check to proper place
    bf2558bbdce3 usb: isp1760: Fix out-of-bounds array access
    fdcb8a893aec USB: new quirk for Dell Gen 2 devices
    c2dd96835fbb USB: serial: option: add Quectel BG95 modem
    2514cc471b40 USB: serial: pl2303: fix type detection for odd device
    11868ca21585 ALSA: usb-audio: Cancel pending work at closing a MIDI substream
    3e7e75378de5 ALSA: hda/realtek - Fix microphone noise on ASUS TUF B550M-PLUS
    99137afd8445 ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15 9520 laptop
    0e06c3b43ddc ALSA: hda/realtek - Add new type for ALC245
    7b50d7cc2895 riscv: Move alternative length validation into subsection
    c64d777c91e0 riscv: Wire up memfd_secret in UAPI header
    0179777e29d4 riscv: Fix irq_work when SMP is disabled
    1b1dfd94b2a5 riscv: Initialize thread pointer before calling C functions
    87fd2d27c9ea RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem instead of IORESOURCE_BUSY
    e639a66ca9b8 parisc/stifb: Keep track of hardware path of graphics card
    8b8fe78cae1d parisc/stifb: Implement fb_is_primary_device()
    fced6c0622da binfmt_flat: do not stop relocating GOT entries prematurely on riscv
    207ca688162d Linux 5.15.45
    37fad50e16ff ALSA: usb-audio: Optimize TEAC clock quirk
    6099a6c8a749 bpf: Check PTR_TO_MEM | MEM_RDONLY in check_helper_mem_access
    5d0bba8232bf bpf: Reject writes for PTR_TO_MAP_KEY in check_helper_mem_access
    51f6657e9443 bpf: Fix excessive memory allocation in stack_map_alloc()
    77f8c4a5f3d0 bpf: Enlarge offset check value to INT_MAX in bpf_skb_{load,store}_bytes
    e36452d5da63 bpf: Fix potential array overflow in bpf_trampoline_get_progs()
    e2fc17fcc503 NFSD: Fix possible sleep during nfsd4_release_lockowner()
    fa1c51c82c0e NFS: Memory allocation failures are not server fatal errors
    9bc73bbd5597 docs: submitting-patches: Fix crossref to 'The canonical patch format'
    581b2ed60535 tpm: ibmvtpm: Correct the return value in tpm_ibmvtpm_probe()
    b5745954a993 tpm: Fix buffer access in tpm2_get_tpm_pt()
    718ff5fc7e1c media: i2c: imx412: Fix power_off ordering
    d207a2e2080b media: i2c: imx412: Fix reset GPIO polarity
    9ebed8d283e5 x86/sgx: Ensure no data in PCMD page after truncate
    cd6947942511 x86/sgx: Fix race between reclaimer and page fault handler
    b070e97fbd14 x86/sgx: Obtain backing storage page with enclave mutex held
    fd55a1707750 x86/sgx: Mark PCMD page as dirty when modifying contents
    cdf828c11c12 x86/sgx: Disconnect backing page references from dirty status
    12b635b4e349 HID: multitouch: add quirks to enable Lenovo X12 trackpoint
    18242f342838 HID: multitouch: Add support for Google Whiskers Touchpad
    58cf68a1886d fs/ntfs3: validate BOOT sectors_per_clusters
    6e5bc6f7fef0 raid5: introduce MD_BROKEN
    69712b170237 dm verity: set DM_TARGET_IMMUTABLE feature flag
    40aaeb41dde0 dm stats: add cond_resched when looping over entries
    fd77cb622074 dm crypt: make printing of the key constant-time
    ed0712361a91 dm integrity: fix error code in dm_integrity_ctr()
    a485b32de799 ARM: dts: s5pv210: Correct interrupt name for bluetooth in Aries
    db03727b4bbb Bluetooth: hci_qca: Use del_timer_sync() before freeing
    f18aa2fc00bf ALSA: usb-audio: Configure sync endpoints before data
    8d1f71573089 ALSA: usb-audio: Add missing ep_idx in fixed EP quirks
    8c9a54eed738 ALSA: usb-audio: Workaround for clock setup on TEAC devices
    3ec459c8810e zsmalloc: fix races between asynchronous zspage free and page migration
    5763176f6954 crypto: ecrdsa - Fix incorrect use of vli_cmp
    dd36037d4ae7 crypto: caam - fix i.MX6SX entropy delay value
    d8fdb4b24097 KVM: SVM: Use kzalloc for sev ioctl interfaces to prevent kernel data leak
    8d3a2aa0976f KVM: x86: Drop WARNs that assert a triple fault never "escapes" from L2
    531d1070d864 KVM: x86: avoid calling x86 emulator without a decoded instruction
    eea9755a04e0 x86, kvm: use correct GFP flags for preemption disabled
    7b54eb631934 x86/kvm: Alloc dummy async #PF token outside of raw spinlock
    1b6bcda5df8c KVM: PPC: Book3S HV: fix incorrect NULL check on list iterator
    01989d7eebb6 netfilter: conntrack: re-fetch conntrack after insertion
    9c413a8c8bb4 netfilter: nf_tables: double hook unregistration in netns path
    9ea55b9f4353 netfilter: nf_tables: hold mutex on netns pre_exit path
    89ef50fe03a5 netfilter: nf_tables: sanitize nft_set_desc_concat_parse()
    e61717947af5 crypto: drbg - make reseeding from get_random_bytes() synchronous
    da208708f4c5 crypto: drbg - move dynamic ->reseed_threshold adjustments to __drbg_seed()
    585f6b76d354 crypto: drbg - track whether DRBG was seeded with !rng_is_initialized()
    fa996803b9d6 crypto: drbg - prepare for more fine-grained tracking of seeding state
    e16cc79b0f91 lib/crypto: add prompts back to crypto libraries
    c504167adc32 exfat: check if cluster num is valid
    195fffbf8291 drm/i915: Fix -Wstringop-overflow warning in call to intel_read_wm_latency()
    23cb9eff90b1 net: ipa: compute proper aggregation limit
    cf2fbc56c478 pipe: Fix missing lock in pipe_resize_ring()
    e6acf868ff0e pipe: make poll_usage boolean and annotate its access
    8a3db00ab0e2 assoc_array: Fix BUG_ON during garbage collect
    24c6fc6e7453 i2c: ismt: prevent memory corruption in ismt_access()
    f692bcffd1f2 netfilter: nf_tables: disallow non-stateful expression in sets earlier
    f55c75cf73c0 drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers
    71475936e647 i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging
    731561de2aeb net: ftgmac100: Disable hardware checksum on AST2600
    49651497b637 nfc: pn533: Fix buggy cleanup order
    7e18fd12489b net: af_key: check encryption module availability consistency
    20b413c38b7c percpu_ref_init(): clean ->percpu_count_ref on failure
    8243f5768dea KVM: arm64: Don't hypercall before EL2 init
    8ff411998a33 pinctrl: sunxi: fix f1c100s uart2 function
    09901136e79d ALSA: usb-audio: Don't get sample rate for MCT Trigger 5 USB-to-HDMI

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e86b1cf7458eed10b27b2b3b213bf1a5f420747)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b052db8a15..d5f021af48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "83bec9a458bfdfb46c5dc62342bafae2806043d4"
-SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
+SRCREV_machine ?= "23374f7aa07401ca2d34ca395472da35c669b126"
+SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.44"
+LINUX_VERSION ?= "5.15.46"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f6110354a0..7a7518164c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.44"
+LINUX_VERSION ?= "5.15.46"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "768cd295dfc0a311d2e53c1b05e19a246e184d0e"
-SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
+SRCREV_machine ?= "95b2ba04f3faff2d7f9326e43691c0c5ac36bbf9"
+SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3cb5f93a21..0112f8a649 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1585df4dbb1e353cc1472748186504a377de5dce"
-SRCREV_machine:qemuarm64 ?= "363482e730cbf7f772430c99c83f60ddc01d7518"
-SRCREV_machine:qemumips ?= "f534cfa2119dc7cf07d546d9fed2b822af1bc838"
-SRCREV_machine:qemuppc ?= "c019857d9af595336bb272c981150952b87d2639"
-SRCREV_machine:qemuriscv64 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
-SRCREV_machine:qemuriscv32 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
-SRCREV_machine:qemux86 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
-SRCREV_machine:qemux86-64 ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
-SRCREV_machine:qemumips64 ?= "a26ad766d7372a98d4d1f11d50953c45782f3a37"
-SRCREV_machine ?= "eb3df10e3f3146911fc3235c458c8ef1660ae9df"
-SRCREV_meta ?= "947149960e1426ace478e4b52c28a28ef8d6e74b"
+SRCREV_machine:qemuarm ?= "718d6e78d83aa36b177d207f2379d4ce7fff11a4"
+SRCREV_machine:qemuarm64 ?= "ad1628ba58a32df261f2219ed7ae8469446b0e0a"
+SRCREV_machine:qemumips ?= "9a408c87b3b08d47246d6c04ee9de8828c315d54"
+SRCREV_machine:qemuppc ?= "9360ffdc0172bfa039fb01f1c739b1740af8486d"
+SRCREV_machine:qemuriscv64 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
+SRCREV_machine:qemuriscv32 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
+SRCREV_machine:qemux86 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
+SRCREV_machine:qemux86-64 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
+SRCREV_machine:qemumips64 ?= "439653a76bb6dcc3dfb6fdc8d8dad83ff3659d46"
+SRCREV_machine ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
+SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4e67be407725b1d8b829ed2075987037abec98ec"
+SRCREV_machine:class-devupstream ?= "aed23654e8ed2cc776ae26a87ef773ff38b48d7f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.44"
+LINUX_VERSION ?= "5.15.46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

