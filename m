Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 03/23] linux-yocto/5.10: update to v5.10.121
Date: Sun, 17 Jul 2022 14:30:04 -1000
Message-Id: <62d3fc82089566ff040aaed41d24e08521581304.1658093505.git.steve@sakoman.com>
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

    e2e52b40ef1a Linux 5.10.121
    47c1680e51ef md: bcache: check the return value of kzalloc() in detached_dev_do_request()
    a67100f42665 ext4: only allow test_dummy_encryption when supported
    96662c77466d MIPS: IP30: Remove incorrect `cpu_has_fpu' override
    57e561573f2e MIPS: IP27: Remove incorrect `cpu_has_fpu' override
    bb55ca161292 RDMA/rxe: Generate a completion for unsupported/invalid opcode
    72268945b124 Revert "random: use static branch for crng_ready()"
    6b03dc67dde3 block: fix bio_clone_blkg_association() to associate with proper blkcg_gq
    51f724bffa34 bfq: Make sure bfqg for which we are queueing requests is online
    0285718e2825 bfq: Get rid of __bio_blkcg() usage
    80b0a2b3dfea bfq: Remove pointless bfq_init_rq() calls
    13599aac1b98 bfq: Drop pointless unlock-lock pair
    7d172b9dc913 bfq: Avoid merging queues with different parents
    54cdc10ac718 thermal/core: Fix memory leak in the error path
    b132abaa6515 thermal/core: fix a UAF bug in __thermal_cooling_device_register()
    ec1378f2fa36 kseltest/cgroup: Make test_stress.sh work if run interactively
    82b2b60b6745 xfs: assert in xfs_btree_del_cursor should take into account error
    f1916a88c89e xfs: consider shutdown in bmapbt cursor delete assert
    e3ffe7387c70 xfs: force log and push AIL to clear pinned inodes when aborting mount
    0b229d03d05f xfs: restore shutdown check in mapped write fault path
    3d05a855dcf7 xfs: fix incorrect root dquot corruption error when switching group/project quota types
    893cf5f68a4c xfs: fix chown leaking delalloc quota blocks when fssetxattr fails
    643ceee253a4 xfs: sync lazy sb accounting on quiesce of read-only mounts
    af26bfb04a17 xfs: set inode size after creating symlink
    d27f0000d7d4 net: ipa: fix page free in ipa_endpoint_replenish_one()
    70124d94f4c9 net: ipa: fix page free in ipa_endpoint_trans_release()
    2156dc390402 phy: qcom-qmp: fix reset-controller leak on probe errors
    67e3404889cf coresight: core: Fix coresight device probe failure issue
    77692c02e151 blk-iolatency: Fix inflight count imbalances and IO hangs on offline
    19e5aac38abc vdpasim: allow to enable a vq repeatedly
    ec029087dfef dt-bindings: gpio: altera: correct interrupt-cells
    0ac587c61fc1 docs/conf.py: Cope with removal of language=None in Sphinx 5.0.0
    6182c71a0c04 SMB3: EBADF/EIO errors in rename/open caused by race condition in smb2_compound_op
    d6b9b220d10e ARM: pxa: maybe fix gpio lookup tables
    39c61f4f7f6f ARM: dts: s5pv210: Remove spi-cs-high on panel in Aries
    6f3673c8d8ef phy: qcom-qmp: fix struct clk leak on probe errors
    09a84dad95fa arm64: dts: qcom: ipq8074: fix the sleep clock frequency
    591c3481b13f gma500: fix an incorrect NULL check on list iterator
    c521f42dd241 tilcdc: tilcdc_external: fix an incorrect NULL check on list iterator
    10c5088a312d serial: pch: don't overwrite xmit->buf[0] by x_char
    59afd4f28790 bcache: avoid journal no-space deadlock by reserving 1 journal bucket
    0cf22f234ebc bcache: remove incremental dirty sector counting for bch_sectors_dirty_init()
    3f686b249b1c bcache: improve multithreaded bch_sectors_dirty_init()
    46c2b5f81c9e bcache: improve multithreaded bch_btree_check()
    4e2fbe8cda17 stm: ltdc: fix two incorrect NULL checks on list iterator
    dc12a64cf850 carl9170: tx: fix an incorrect use of list iterator
    8f1bc0edf53c ASoC: rt5514: Fix event generation for "DSP Voice Wake Up" control
    769ec2a824de rtl818x: Prevent using not initialized queues
    d787a57a17cf xtensa/simdisk: fix proc_read_simdisk()
    63758dd9595f hugetlb: fix huge_pmd_unshare address update
    90ad54714e14 nodemask.h: fix compilation error with GCC12
    e9514bce2fb7 iommu/msm: Fix an incorrect NULL check on list iterator
    82c888e51c21 ftrace: Clean up hash direct_functions on register failures
    c26ccbaeb8d8 kexec_file: drop weak attribute from arch_kexec_apply_relocations[_add]
    cf0dabc37446 um: Fix out-of-bounds read in LDT setup
    7f8fd5dd43cd um: chan_user: Fix winch_tramp() return value
    873069e393c5 mac80211: upgrade passive scan to active scan on DFS channels after beacon rx
    22741dd048ef cfg80211: declare MODULE_FIRMWARE for regulatory.db
    e87fedad4a00 irqchip: irq-xtensa-mx: fix initial IRQ affinity
    be7ae7cd1c2d irqchip/armada-370-xp: Do not touch Performance Counter Overflow on A375, A38x, A39x
    df7f0f8be301 csky: patch_text: Fixup last cpu should be master
    31dca00d0cc9 RDMA/hfi1: Fix potential integer multiplication overflow errors
    09408080adb1 Kconfig: Add option for asm goto w/ tied outputs to workaround clang-13 bug
    b67adaec347d ima: remove the IMA_TEMPLATE Kconfig option
    577a959cb0bd media: coda: Add more H264 levels for CODA960
    4005f6a25c05 media: coda: Fix reported H264 profile
    d09dad00574b mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
    08788b917b79 mtd: cfi_cmdset_0002: Move and rename chip_check/chip_ready/chip_good_for_write
    b2b01444228d md: fix an incorrect NULL check in md_reload_sb
    2401f1cf3dee md: fix an incorrect NULL check in does_sb_need_changing
    e28321e01365 drm/i915/dsi: fix VBT send packet port selection for ICL+
    495ac7757663 drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX
    addf0ae79258 drm/nouveau/kms/nv50-: atom: fix an incorrect NULL check on list iterator
    97a9ec86ccb4 drm/nouveau/clk: Fix an incorrect NULL check on list iterator
    436cff507f2a drm/etnaviv: check for reaped mapping in etnaviv_iommu_unmap_gem
    be585921f29d drm/amdgpu/cs: make commands with 0 chunks illegal behaviour.
    556e404691ed scsi: ufs: qcom: Add a readl() to make sure ref_clk gets enabled
    f297dc2364b9 scsi: dc395x: Fix a missing check on list iterator
    337e36550788 ocfs2: dlmfs: fix error handling of user_dlm_destroy_lock
    4ca3ac06e77d dlm: fix missing lkb refcount handling
    899bc4429174 dlm: fix plock invalid read
    74114d26e9db s390/perf: obtain sie_block from the right address
    7994d890123a mm, compaction: fast_find_migrateblock() should return pfn in the target zone
    99fd821f567e PCI: qcom: Fix unbalanced PHY init on probe errors
    c0e129dafce2 PCI: qcom: Fix runtime PM imbalance on probe errors
    2b4c6ad38228 PCI/PM: Fix bridge_d3_blacklist[] Elo i2 overwrite of Gigabyte X299
    058cb6d86b97 tracing: Fix potential double free in create_var_ref()
    a2b9edc3f894 ACPI: property: Release subnode properties with data nodes
    ff4cafa51762 ext4: avoid cycles in directory h-tree
    da2f05919238 ext4: verify dir block before splitting it
    4fd58b5cf118 ext4: fix bug_on in __es_tree_search
    cc5b09cb6dac ext4: filter out EXT4_FC_REPLAY from on-disk superblock field s_state
    1b061af03764 ext4: fix bug_on in ext4_writepages
    adf490083ca5 ext4: fix warning in ext4_handle_inode_extension
    dd887f83ea54 ext4: fix use-after-free in ext4_rename_dir_prepare
    70a7dea84639 bfq: Track whether bfq_group is still online
    b06691af08b4 bfq: Update cgroup information before merging bio
    4dfc12f8c94c bfq: Split shared queues on move between cgroups
    c072cab98bac efi: Do not import certificates from UEFI Secure Boot for T2 Macs
    9a9dc60da79a fs-writeback: writeback_sb_inodes：Recalculate 'wrote' according skipped pages
    c1ad58de1300 iwlwifi: mvm: fix assert 1F04 upon reconfig
    6118bbdf69f4 wifi: mac80211: fix use-after-free in chanctx code
    efdefbe8b756 f2fs: fix to do sanity check for inline inode
    2221a2d41018 f2fs: fix fallocate to use file_modified to update permissions consistently
    ef221b738b26 f2fs: fix to do sanity check on total_data_blocks
    196f72e089b7 f2fs: don't need inode lock for system hidden quota
    2e790aa37858 f2fs: fix deadloop in foreground GC
    ccd58045beb9 f2fs: fix to clear dirty inode in f2fs_evict_inode()
    a34d7b49894b f2fs: fix to do sanity check on block address in f2fs_do_zero_range()
    2766ddaf45b6 f2fs: fix to avoid f2fs_bug_on() in dec_valid_node_count()
    d8b6aaeb9a91 perf jevents: Fix event syntax error caused by ExtSel
    c8c2802407aa perf c2c: Use stdio interface if slang is not supported
    c9542f5f901b i2c: rcar: fix PM ref counts in probe error paths
    ebd4f37ac1e6 i2c: npcm: Handle spurious interrupts
    5c0dfca6b9cc i2c: npcm: Correct register access width
    06cb0f056ba1 i2c: npcm: Fix timeout calculation
    de6f6b5400be iommu/amd: Increase timeout waiting for GA log enablement
    3cfb54643987 dmaengine: stm32-mdma: fix chan initialization in stm32_mdma_irq_handler()
    13d8d11dfaf9 dmaengine: stm32-mdma: rework interrupt handler
    0f87bd8b5fbf dmaengine: stm32-mdma: remove GISR1 register
    c1c4405222b6 video: fbdev: clcdfb: Fix refcount leak in clcdfb_of_vram_setup
    96fdbb1c8563 NFSv4/pNFS: Do not fail I/O when we fail to allocate the pNFS layout
    83839a333fbf NFS: Don't report errors from nfs_pageio_complete() more than once
    040242365c9e NFS: Do not report flush errors in nfs_write_end()
    c5a0e59bbe05 NFS: fsync() should report filesystem errors over EINTR/ERESTARTSYS
    418b9fa4349a NFS: Do not report EINTR/ERESTARTSYS as mapping errors
    6073af78156b dmaengine: idxd: Fix the error handling path in idxd_cdev_register()
    f57696bc6341 i2c: at91: Initialize dma_buf in at91_twi_xfer()
    8e49773a7596 MIPS: Loongson: Use hwmon_device_register_with_groups() to register hwmon
    ec5ded7acb38 cpufreq: mediatek: Unregister platform device on exit
    9d91400fff46 cpufreq: mediatek: Use module_init and add module_exit
    c7b0ec974457 cpufreq: mediatek: add missing platform_driver_unregister() on error in mtk_cpufreq_driver_init
    fb02d6b5432d i2c: at91: use dma safe buffers
    da748d263a64 iommu/mediatek: Add list_del in mtk_iommu_remove
    51d584704d18 f2fs: fix dereference of stale list iterator after loop body
    0e0faa14316b OPP: call of_node_put() on error path in _bandwidth_supported()
    baf86afed745 Input: stmfts - do not leave device disabled in stmfts_input_open
    fc0750e659db RDMA/hfi1: Prevent use of lock before it is initialized
    bb2220e0672b mailbox: forward the hrtimer if not queued and under a lock
    a1d4941d9a24 mfd: davinci_voicecodec: Fix possible null-ptr-deref davinci_vc_probe()
    46fd994763cf powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
    b8ef79697b62 macintosh: via-pmu and via-cuda need RTC_LIB
    cca915d69127 powerpc/perf: Fix the threshold compare group constraint for power9
    7620a280dade powerpc/64: Only WARN if __pa()/__va() called with bad addresses
    9b2851564189 hwrng: omap3-rom - fix using wrong clk_disable() in omap_rom_rng_runtime_resume()
    40d428b528c5 PCI/AER: Clear MULTI_ERR_COR/UNCOR_RCV bits
    6e07ccc7d561 Input: sparcspkr - fix refcount leak in bbc_beep_probe
    76badb0a4d94 crypto: cryptd - Protect per-CPU resource by disabling BH.
    40c41a7bfd59 crypto: sun8i-ss - handle zero sized sg
    5bea8f700a69 crypto: sun8i-ss - rework handling of IV
    9834b13e8b96 tty: fix deadlock caused by calling printk() under tty_port->lock
    a21d4dab776a PCI: imx6: Fix PERST# start-up sequence
    2a9d3b51185b ipc/mqueue: use get_tree_nodev() in mqueue_get_tree()
    f061ddfed9a7 proc: fix dentry/inode overinstantiating under /proc/${pid}/net
    ab0c26e44139 ASoC: atmel-classd: Remove endianness flag on class d component
    b716e4168df9 ASoC: atmel-pdmic: Remove endianness flag on pdmic component
    456105105e78 powerpc/4xx/cpm: Fix return value of __setup() handler
    de5bc923186c powerpc/idle: Fix return value of __setup() handler
    f99187976239 pinctrl: renesas: core: Fix possible null-ptr-deref in sh_pfc_map_resources()
    f7c290eac8f2 powerpc/8xx: export 'cpm_setbrg' for modules
    49a5b1735cd9 drivers/base/memory: fix an unlikely reference counting issue in __add_memory_block()
    c1219429179d dax: fix cache flush on PMD-mapped pages
    d8a5bdc767f1 drivers/base/node.c: fix compaction sysfs file leak
    84958f066dec pinctrl: mvebu: Fix irq_of_parse_and_map() return value
    8a8b40d00753 nvdimm: Allow overwrite in the presence of disabled dimms
    641649f31e20 nvdimm: Fix firmware activation deadlock scenarios
    1052f22e127d firmware: arm_scmi: Fix list protocols enumeration in the base protocol
    7a55a5159dae scsi: fcoe: Fix Wstringop-overflow warnings in fcoe_wwn_from_mac()
    17d9d7d26406 mfd: ipaq-micro: Fix error check return value of platform_get_irq()
    82c6c8a66c2e powerpc/fadump: fix PT_LOAD segment for boot memory area
    08b053d32b16 arm: mediatek: select arch timer for mt7629
    ceb61ab22dbd pinctrl: bcm2835: implement hook for missing gpio-ranges
    cda45b715d70 gpiolib: of: Introduce hook for missing gpio-ranges
    a26dfdf0a63b crypto: marvell/cesa - ECB does not IV
    ee89d8dee55a misc: ocxl: fix possible double free in ocxl_file_register_afu
    22c3fea20a94 ARM: dts: bcm2835-rpi-b: Fix GPIO line names
    0a4ee6cdaa14 ARM: dts: bcm2837-rpi-3-b-plus: Fix GPIO line name of power LED
    bd7ffc171ca5 ARM: dts: bcm2837-rpi-cm3-io3: Fix GPIO line names for SMPS I2C
    daffdb08306e ARM: dts: bcm2835-rpi-zero-w: Fix GPIO line name for Wifi/BT
    95000ae68025 ARM: dts: stm32: Fix PHY post-reset delay on Avenger96
    b439f7addd2b can: xilinx_can: mark bit timing constants as const
    875a17c3adb4 platform/chrome: Re-introduce cros_ec_cmd_xfer and use it for ioctls
    b0bf87b1b388 ARM: dts: imx6dl-colibri: Fix I2C pinmuxing
    acd2313bd99d platform/chrome: cros_ec: fix error handling in cros_ec_register()
    e690350d3d9f KVM: nVMX: Clear IDT vectoring on nested VM-Exit for double/triple fault
    fd7dca68a69b KVM: nVMX: Leave most VM-Exit info fields unmodified on failed VM-Entry
    259c1fad9fb0 soc: qcom: llcc: Add MODULE_DEVICE_TABLE()
    ca7ce579a717 ARM: dts: ci4x10: Adapt to changes in imx6qdl.dtsi regarding fec clocks
    acd99f384cb3 PCI: dwc: Fix setting error return on MSI DMA mapping failure
    92b7cab3076d PCI: rockchip: Fix find_first_zero_bit() limit
    266f5cf6928a PCI: cadence: Fix find_first_zero_bit() limit
    a409d0b1f929 soc: qcom: smsm: Fix missing of_node_put() in smsm_parse_ipc
    7cbe94d296c0 soc: qcom: smp2p: Fix missing of_node_put() in smp2p_parse_ipc
    83653417988c ARM: dts: suniv: F1C100: fix watchdog compatible
    ea4f1c6bb966 memory: samsung: exynos5422-dmc: Avoid some over memory allocation
    3960629bb584 arm64: dts: rockchip: Move drive-impedance-ohm to emmc phy on rk3399
    0c5f04da02b4 net/smc: postpone sk_refcnt increment in connect()
    8096e2d7c0f9 hinic: Avoid some over memory allocation
    dc7753d60097 net: huawei: hinic: Use devm_kcalloc() instead of devm_kzalloc()
    4790963ef433 rxrpc: Fix decision on when to generate an IDLE ACK
    3eef677a25c7 rxrpc: Don't let ack.previousPacket regress
    573de88fc107 rxrpc: Fix overlapping ACK accounting
    4f1c34ee6057 rxrpc: Don't try to resend the request if we're receiving the reply
    5b4826657d36 rxrpc: Fix listen() setting the bar too high for the prealloc rings
    541224201e1d hv_netvsc: Fix potential dereference of NULL pointer
    deb16df5254d net: stmmac: fix out-of-bounds access in a selftest
    5c2b34d072c4 net: stmmac: selftests: Use kcalloc() instead of kzalloc()
    7386f6904159 ASoC: max98090: Move check for invalid values before casting in max98090_put_enab_tlv()
    d015f6f694ec NFC: hci: fix sleep in atomic context bugs in nfc_hci_hcp_message_tx
    7a5e6a48980e ASoC: wm2000: fix missing clk_disable_unprepare() on error in wm2000_anc_transition()
    8bbf522a2c51 thermal/drivers/imx_sc_thermal: Fix refcount leak in imx_sc_thermal_probe
    18530bedd221 thermal/core: Fix memory leak in __thermal_cooling_device_register()
    dcf5ffc91c91 thermal/drivers/core: Use a char pointer for the cooling device name
    79098339ac20 thermal/drivers/broadcom: Fix potential NULL dereference in sr_thermal_probe
    836038029540 thermal/drivers/bcm2711: Don't clamp temperature at zero
    3161044e75b7 drm/i915: Fix CFI violation with show_dynamic_id()
    ffbcfb1688f6 drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path
    2679de7d046f x86/sev: Annotate stack change in the #VC handler
    656aa3c51fc6 drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()
    48e82ce8cdb1 drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
    d54ac6ca48c1 ext4: reject the 'commit' option on ext2 filesystems
    63b7c0899564 media: rkvdec: h264: Fix bit depth wrap in pps packet
    b4805a77d525 media: rkvdec: h264: Fix dpb_valid implementation
    82239e30ab04 media: staging: media: rkvdec: Make use of the helper function devm_platform_ioremap_resource()
    5c2456629433 media: ov7670: remove ov7670_power_off from ov7670_remove
    510e879420b4 ASoC: ti: j721e-evm: Fix refcount leak in j721e_soc_probe_*
    33411945c9ad net: hinic: add missing destroy_workqueue in hinic_pf_to_mgmt_init
    8113eedbab85 sctp: read sk->sk_bound_dev_if once in sctp_rcv()
    6950ee32c187 lsm,selinux: pass flowi_common instead of flowi to the LSM hooks
    a67a1661cf8a m68k: math-emu: Fix dependencies of math emulation support
    4dcae15ff84f nvme: set dma alignment to dword
    8ace1e63550a Bluetooth: use hdev lock for accept_list and reject_list in conn req
    792f8b0e748c Bluetooth: use inclusive language when filtering devices
    d763aa352cfc Bluetooth: use inclusive language in HCI role comments
    c024f6f11d4d Bluetooth: LL privacy allow RPA
    394df9f17e15 Bluetooth: L2CAP: Rudimentary typo fixes
    5702c3c6576d Bluetooth: Interleave with allowlist scan
    36c644c63bfc Bluetooth: fix dangling sco_conn and use-after-free in sco_sock_timeout
    fc68385fcbac media: vsp1: Fix offset calculation for plane cropping
    a3304766d938 media: pvrusb2: fix array-index-out-of-bounds in pvr2_i2c_core_init
    7d792640d3e9 media: exynos4-is: Change clk_disable to clk_disable_unprepare
    b3e483735847 media: st-delta: Fix PM disable depth imbalance in delta_probe
    8e4e0c4ac55e media: exynos4-is: Fix PM disable depth imbalance in fimc_is_probe
    0572a5bd38e3 media: aspeed: Fix an error handling path in aspeed_video_probe()
    34feaea3aa4f scripts/faddr2line: Fix overlapping text section failures
    1472fb1c7447 kselftest/cgroup: fix test_stress.sh to use OUTPUT dir
    cacea459f95b ASoC: samsung: Fix refcount leak in aries_audio_probe
    c1b08aa568e8 ASoC: samsung: Use dev_err_probe() helper
    9f564e29a512 regulator: pfuze100: Fix refcount leak in pfuze_parse_regulators_dt
    2a0da7641e1f ASoC: mxs-saif: Fix refcount leak in mxs_saif_probe
    e84aaf23ca82 ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
    4024affd53e2 ath11k: Don't check arvif->is_started before sending management frames
    779d41c80b10 perf/amd/ibs: Use interrupt regs ip for stack unwinding
    37a9db0ee7e7 regulator: qcom_smd: Fix up PM8950 regulator configuration
    e2786db0a7eb Revert "cpufreq: Fix possible race in cpufreq online error path"
    560dcbe1c7a7 spi: spi-fsl-qspi: check return value after calling platform_get_resource_byname()
    f40549ce20e8 iomap: iomap_write_failed fix
    7a79ab259684 media: uvcvideo: Fix missing check to determine if element is found in list
    d50b26221fba drm/msm: return an error pointer in msm_gem_prime_get_sg_table()
    883f1d52a57b drm/msm/mdp5: Return error code in mdp5_mixer_release when deadlock is detected
    49dc28b4b2e2 drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected
    a10092dabae6 drm/msm/dp: fix event thread stuck in wait_event after kthread_stop()
    369a712442f9 regulator: core: Fix enable_count imbalance with EXCLUSIVE_GET
    018ebe4c1810 arm64: fix types in copy_highpage()
    49bfbaf6a039 x86/mm: Cleanup the control_va_addr_alignment() __setup handler
    0d5c8ac9229a irqchip/aspeed-scu-ic: Fix irq_of_parse_and_map() return value
    f4b503b4ef59 irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
    5e76e5163392 irqchip/exiu: Fix acknowledgment of edge triggered interrupts
    35abf2081fa9 x86: Fix return value of __setup handlers
    940b12435bff virtio_blk: fix the discard_granularity and discard_alignment queue limits
    23716d761415 perf tools: Use Python devtools for version autodetection rather than runtime
    345185231230 drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()
    e19ece6f248a drm/panel: panel-simple: Fix proper bpc for AM-1280800N3TZQW-T00H
    5a26a4947031 drm/msm: add missing include to msm_drv.c
    7b815e91ff51 drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
    d9cb951d11a4 drm/msm/hdmi: check return value after calling platform_get_resource_byname()
    e99755e6a992 drm/msm/dsi: fix error checks and return values for DSI xmit functions
    3574e0b2904c drm/msm/dp: fix error check return value of irq_of_parse_and_map()
    04204612dd87 drm/msm/dp: stop event kernel thread when DP unbind
    134760263f64 drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume
    d5773db56ce9 perf tools: Add missing headers needed by util/data.h
    e251a33fe879 ASoC: rk3328: fix disabling mclk on pclk probe failure
    e2fef34d7806 x86/speculation: Add missing prototype for unpriv_ebpf_notify()
    81f1ddffdc22 mtd: rawnand: cadence: fix possible null-ptr-deref in cadence_nand_dt_probe()
    b6ecf2b7e691 x86/pm: Fix false positive kmemleak report in msr_build_context()
    0e1cd4edefc8 mtd: spi-nor: core: Check written SR value in spi_nor_write_16bit_sr_and_check()
    ab88c8d906c6 libbpf: Fix logic for finding matching program for CO-RE relocation
    97b56f17b355 selftests/resctrl: Fix null pointer dereference on open failed
    c54d66c51475 scsi: ufs: core: Exclude UECxx from SFR dump list
    02192ee93684 scsi: ufs: qcom: Fix ufs_qcom_resume()
    328cfeac735c drm/msm/dpu: adjust display_v_end for eDP and DP
    cc68e53f9a7f of: overlay: do not break notify on NOTIFY_{OK|STOP}
    f929416d5c9c fsnotify: fix wrong lockdep annotations
    94845fc422f9 inotify: show inotify mask flags in proc fdinfo
    f2c68c52898f ALSA: pcm: Check for null pointer of pointer substream before dereferencing it
    d764a7d647f7 drm/panel: simple: Add missing bus flags for Innolux G070Y2-L01
    b6b70cd3ddfa media: hantro: Empty encoder capture buffers by default
    461e4c1f1990 ath9k_htc: fix potential out of bounds access with invalid rxstatus->rs_keyix
    96c848afbddc cpufreq: Fix possible race in cpufreq online error path
    172789fd9532 spi: img-spfi: Fix pm_runtime_get_sync() error checking
    147a376c1afe sched/fair: Fix cfs_rq_clock_pelt() for throttled cfs_rq
    f35c3f237408 drm/bridge: Fix error handling in analogix_dp_probe
    6d0726725c7c HID: elan: Fix potential double free in elan_input_configured
    39d4bd3f5991 HID: hid-led: fix maximum brightness for Dream Cheeky
    3c68daf4a368 mtd: rawnand: denali: Use managed device resources
    dd2b1d70ef20 EDAC/dmc520: Don't print an error for each unconfigured interrupt line
    bea698509934 drbd: fix duplicate array initializer
    3eba802d47fb target: remove an incorrect unmap zeroes data deduction
    e7681199bbe4 efi: Add missing prototype for efi_capsule_setup_info
    2a1b5110c95e NFC: NULL out the dev->rfkill to prevent UAF
    8e357f086d40 net: dsa: mt7530: 1G can also support 1000BASE-X link mode
    4565d5be8be2 scftorture: Fix distribution of short handler delays
    58eff5b73f6c spi: spi-ti-qspi: Fix return value handling of wait_for_completion_timeout
    b4c7dd0037e6 drm: mali-dp: potential dereference of null pointer
    78a3e9fcdb7b drm/komeda: Fix an undefined behavior bug in komeda_plane_add()
    3cea0259edd1 nl80211: show SSID for P2P_GO interfaces
    6c0a8c771a71 bpf: Fix excessive memory allocation in stack_map_alloc()
    7ff76dc2d8bd libbpf: Don't error out on CO-RE relos for overriden weak subprogs
    84b0e23e107e drm/vc4: txp: Force alpha to be 0xff if it's disabled
    ac904216b8b8 drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
    15cec7dfd3df drm/vc4: hvs: Reset muxes at probe time
    2268f190af20 drm/mediatek: Fix mtk_cec_mask()
    032f8c67fe95 drm/ingenic: Reset pixclock rate when parent clock rate changes
    58c7c0157714 x86/delay: Fix the wrong asm constraint in delay_loop()
    f279c49f17ce ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
    fb66e0512e5c ASoC: mediatek: Fix error handling in mt8173_max98090_dev_probe
    35db6e2e9988 spi: qcom-qspi: Add minItems to interconnect-names
    187ecfc3b70e drm/bridge: adv7511: clean up CEC adapter when probe fails
    9072d627857d drm/edid: fix invalid EDID extension block filtering
    0d6dc3efb1fb ath9k: fix ar9003_get_eepmisc
    822dac24b4f9 ath11k: acquire ab->base_lock in unassign when finding the peer by addr
    3ed327b77d65 dt-bindings: display: sitronix, st7735r: Fix backlight in example
    61bbbde9b6d2 drm: fix EDID struct for old ARM OABI format
    cc80d3c37cec RDMA/hfi1: Prevent panic when SDMA is disabled
    dfc308d6f29a powerpc/iommu: Add missing of_node_put in iommu_init_early_dart
    b4e14e9beb5c macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
    0230055fa631 powerpc/powernv: fix missing of_node_put in uv_init()
    6a61a9710627 powerpc/xics: fix refcount leak in icp_opal_init()
    8a665c2791bc powerpc/powernv/vas: Assign real address to rx_fifo in vas_rx_win_attr
    5a3767ac79bc tracing: incorrect isolate_mote_t cast in mm_vmscan_lru_isolate
    eff3587b9c01 PCI: Avoid pci_dev_lock() AB/BA deadlock with sriov_numvfs_store()
    21a3effe446d ARM: hisi: Add missing of_node_put after of_find_compatible_node
    d2b3b380c164 ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
    d146e2a9864a ARM: versatile: Add missing of_node_put in dcscb_init
    b646e0cfeb38 pinctrl: renesas: rzn1: Fix possible null-ptr-deref in sh_pfc_map_resources()
    c16f1b3d72e4 fat: add ratelimit to fat*_ent_bread()
    f20c7cd2b24c powerpc/fadump: Fix fadump to work with a different endian capture kernel
    039966775ca0 ARM: OMAP1: clock: Fix UART rate reporting algorithm
    9dfa8d087bb8 fs: jfs: fix possible NULL pointer dereference in dbFree()
    05efc4591f80 soc: ti: ti_sci_pm_domains: Check for null return of devm_kcalloc
    0f9091f202b3 crypto: ccree - use fine grained DMA mapping dir
    86b091b6894c PM / devfreq: rk3399_dmc: Disable edev on remove()
    7e391ec93966 arm64: dts: qcom: msm8994: Fix BLSP[12]_DMA channels count
    c400439adc36 ARM: dts: s5pv210: align DMA channels with dtschema
    0521c5297885 ARM: dts: ox820: align interrupt controller node name with dtschema
    968a6683761d IB/rdmavt: add missing locks in rvt_ruc_loopback
    6a2e275834c4 gfs2: use i_lock spin_lock for inode qadata
    92ef7a87192c selftests/bpf: fix btf_dump/btf_dump due to recent clang change
    340cf91293a3 eth: tg3: silence the GCC 12 array-bounds warning
    cb2ca93f8fe3 rxrpc, afs: Fix selection of abort codes
    4a4e2e90ecec rxrpc: Return an error to sendmsg if call failed
    6c18a0fcd660 m68k: atari: Make Atari ROM port I/O write macros return void
    76744a016e78 x86/microcode: Add explicit CPU vendor dependency
    f29fb4623296 can: mcp251xfd: silence clang's -Wunaligned-access warning
    ff383c18799d ASoC: rt1015p: remove dependency on GPIOLIB
    c73aee194680 ASoC: max98357a: remove dependency on GPIOLIB
    86c02171bded media: exynos4-is: Fix compile warning
    abb5594ae2ba net: phy: micrel: Allow probing without .driver_data
    8d33585ffa2e nbd: Fix hung on disconnect request if socket is closed before
    1a5a3dfd9f17 ASoC: rt5645: Fix errorenous cleanup order
    af98940dd33c nvme-pci: fix a NULL pointer dereference in nvme_alloc_admin_tags
    8671aeeef29d openrisc: start CPU timer early in boot
    22cdbb135498 media: cec-adap.c: fix is_configuring state
    4cf6ba93678a media: imon: reorganize serialization
    f3915b46651a media: coda: limit frame interval enumeration to supported encoder frame sizes
    8ddc89437cce media: rga: fix possible memory leak in rga_probe
    f9413b90230d rtlwifi: Use pr_warn instead of WARN_ONCE
    eb7a71b7b2b8 ipmi: Fix pr_fmt to avoid compilation issues
    fa390c8b6256 ipmi:ssif: Check for NULL msg when handling events and messages
    0b7c1dc7ee67 ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default
    1ecd01d77c9b dma-debug: change allocation mode from GFP_NOWAIT to GFP_ATIOMIC
    a61583744ef6 spi: stm32-qspi: Fix wait_cmd timeout in APM mode
    0c05c03c51e5 perf/amd/ibs: Cascade pmu init functions' return value
    460545839883 s390/preempt: disable __preempt_count_add() optimization for PROFILE_ALL_BRANCHES
    312c43e98ed1 net: remove two BUG() from skb_checksum_help()
    4f99bde59eef ASoC: tscs454: Add endianness flag in snd_soc_component_driver
    296f8ca0f73f HID: bigben: fix slab-out-of-bounds Write in bigben_probe
    3ee67465f711 drm/amdgpu/ucode: Remove firmware load type check in amdgpu_ucode_free_bo
    6f19abe031e3 mlxsw: Treat LLDP packets as control
    b30e727f0916 mlxsw: spectrum_dcb: Do not warn about priority changes
    d68a5eb7b3e0 ASoC: dapm: Don't fold register value changes into notifications
    9b42659cb3c4 net/mlx5: fs, delete the FTE when there are no rules attached to it
    4d85201adb65 ipv6: Don't send rs packets to the interface of ARPHRD_TUNNEL
    0325c08ae202 drm: msm: fix error check return value of irq_of_parse_and_map()
    ad97425d23af arm64: compat: Do not treat syscall number as ESR_ELx for a bad syscall
    8aa3750986ff ath10k: skip ath10k_halt during suspend for driver state RESTARTING
    20ad91d08a80 drm/amd/pm: fix the compile warning
    b5cd10814351 drm/plane: Move range check for format_count earlier
    8c3fe9ff807e ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro Tablet 408
    60afa4f4e135 ath11k: disable spectral scan during spectral deinit
    fa1b509d41c5 scsi: lpfc: Fix resource leak in lpfc_sli4_send_seq_to_ulp()
    1869f9bfafe1 scsi: ufs: Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
    508add11af09 scsi: megaraid: Fix error check return value of register_chrdev()
    95050b984715 drivers: mmc: sdhci_am654: Add the quirk to set TESTCD bit
    90281cadf507 mmc: jz4740: Apply DMA engine limits to maximum segment size
    e69e93120f62 md/bitmap: don't set sb values if can't pass sanity check
    3f94169affa3 media: cx25821: Fix the warning when removing the module
    ca17e7a532d1 media: pci: cx23885: Fix the error handling in cx23885_initdev()
    27ad46da4417 media: venus: hfi: avoid null dereference in deinit
    e68270a78681 ath9k: fix QCA9561 PA bias level
    ca1ce206894d drm/amd/pm: fix double free in si_parse_power_table()
    3102e9d7e519 tools/power turbostat: fix ICX DRAM power numbers
    fbfeb9bc9479 spi: spi-rspi: Remove setting {src,dst}_{addr,addr_width} based on DMA direction
    e2b8681769f6 ALSA: jack: Access input_dev under mutex
    005990e30d14 sfc: ef10: Fix assigning negative value to unsigned variable
    10f30cba8f6c rcu: Make TASKS_RUDE_RCU select IRQ_WORK
    1c6c3f233664 rcu-tasks: Fix race in schedule and flush work
    c977d63b8cc4 drm/komeda: return early if drm_universal_plane_init() fails.
    cd97a481ea89 ACPICA: Avoid cache flush inside virtual machines
    29cb802966c7 x86/platform/uv: Update TSC sync state for UV5
    59dd1a07eecf fbcon: Consistently protect deferred_takeover with console_lock()
    5bfb65e92ff3 ipv6: fix locking issues with loops over idev->addr_list
    98d1dc32f890 ipw2x00: Fix potential NULL dereference in libipw_xmit()
    cc575b855809 b43: Fix assigning negative value to unsigned variable
    4ae5a2ccf5da b43legacy: Fix assigning negative value to unsigned variable
    74ad0d745020 mwifiex: add mutex lock for call in mwifiex_dfs_chan_sw_work_queue
    fadc626cae99 drm/virtio: fix NULL pointer dereference in virtio_gpu_conn_get_modes
    c6380d9d2d69 iommu/vt-d: Add RPLS to quirk list to skip TE disabling
    509e9710b802 btrfs: repair super block num_devices automatically
    4093eea47d9c btrfs: add "0x" prefix for unsupported optional features
    b49516583f00 ptrace: Reimplement PTRACE_KILL by always sending SIGKILL
    f8ef79687b2e ptrace/xtensa: Replace PT_SINGLESTEP with TIF_SINGLESTEP
    6580673b17e0 ptrace/um: Replace PT_DTRACE with TIF_SINGLESTEP
    92fb46536aec perf/x86/intel: Fix event constraints for ICL
    b4acb8e7f159 x86/MCE/AMD: Fix memory leak when threshold_create_bank() fails
    860e44f21f26 parisc/stifb: Keep track of hardware path of graphics card
    78e008dca225 Fonts: Make font size unsigned in font_desc
    c5b9b7fb123d xhci: Allow host runtime PM as default for Intel Alder Lake N xHCI
    c9ac773715fc cifs: when extending a file with falloc we should make files not-sparse
    ce4627f09e66 usb: core: hcd: Add support for deferring roothub registration
    a2532c441705 usb: dwc3: gadget: Move null pinter check to proper place
    0420275d643e USB: new quirk for Dell Gen 2 devices
    19b3fe8a7cb1 USB: serial: option: add Quectel BG95 modem
    40bdb5ec957a ALSA: usb-audio: Cancel pending work at closing a MIDI substream
    1cf70d5c15bc ALSA: hda/realtek - Fix microphone noise on ASUS TUF B550M-PLUS
    223368eaf60c ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15 9520 laptop
    d2f3acde3d52 riscv: Fix irq_work when SMP is disabled
    4a5c7a61ff50 riscv: Initialize thread pointer before calling C functions
    6b45437959dc parisc/stifb: Implement fb_is_primary_device()
    9cef71eceaa8 binfmt_flat: do not stop relocating GOT entries prematurely on riscv
    70dd2d169d08 Linux 5.10.120
    886eeb046096 bpf: Enlarge offset check value to INT_MAX in bpf_skb_{load,store}_bytes
    7f845de28633 bpf: Fix potential array overflow in bpf_trampoline_get_progs()
    3097f38e9126 NFSD: Fix possible sleep during nfsd4_release_lockowner()
    78a62e09d885 NFS: Memory allocation failures are not server fatal errors
    1d100fcc1da7 docs: submitting-patches: Fix crossref to 'The canonical patch format'
    ebbbffae71e2 tpm: ibmvtpm: Correct the return value in tpm_ibmvtpm_probe()
    5933a191ac3d tpm: Fix buffer access in tpm2_get_tpm_pt()
    0c56e5d0e655 HID: multitouch: add quirks to enable Lenovo X12 trackpoint
    d6822d82c0e8 HID: multitouch: Add support for Google Whiskers Touchpad
    0f03885059c1 raid5: introduce MD_BROKEN
    8df42bcd364c dm verity: set DM_TARGET_IMMUTABLE feature flag
    e39b536d70ed dm stats: add cond_resched when looping over entries
    4617778417d0 dm crypt: make printing of the key constant-time
    bb64957c472a dm integrity: fix error code in dm_integrity_ctr()
    8845027e55fc ARM: dts: s5pv210: Correct interrupt name for bluetooth in Aries
    4989bb033429 Bluetooth: hci_qca: Use del_timer_sync() before freeing
    fae05b2314b1 zsmalloc: fix races between asynchronous zspage free and page migration
    6a1cc2549405 crypto: ecrdsa - Fix incorrect use of vli_cmp
    c013f7d1cd92 crypto: caam - fix i.MX6SX entropy delay value
    3d8fc6e28f32 KVM: x86: avoid calling x86 emulator without a decoded instruction
    a2a3fa5b616a x86, kvm: use correct GFP flags for preemption disabled
    4a9f3a9c28a6 x86/kvm: Alloc dummy async #PF token outside of raw spinlock
    4c4a11c74ada KVM: PPC: Book3S HV: fix incorrect NULL check on list iterator
    91a36ec160ec netfilter: conntrack: re-fetch conntrack after insertion
    c0aff1faf66b netfilter: nf_tables: sanitize nft_set_desc_concat_parse()
    44f1ce55308d crypto: drbg - make reseeding from get_random_bytes() synchronous
    e744e34a3c35 crypto: drbg - move dynamic ->reseed_threshold adjustments to __drbg_seed()
    54700e82a7a7 crypto: drbg - track whether DRBG was seeded with !rng_is_initialized()
    b2bef5500e0d crypto: drbg - prepare for more fine-grained tracking of seeding state
    630192aa4523 lib/crypto: add prompts back to crypto libraries
    82f723b8a5ad exfat: check if cluster num is valid
    1f0681f3bd56 drm/i915: Fix -Wstringop-overflow warning in call to intel_read_wm_latency()
    2728d95c6c95 xfs: Fix CIL throttle hang when CIL space used going backwards
    a9e7f19a5577 xfs: fix an ABBA deadlock in xfs_rename
    72464fd2b4b7 xfs: fix the forward progress assertion in xfs_iwalk_run_callbacks
    45d97f70da4d xfs: show the proper user quota options
    f20e67b455e4 xfs: detect overflows in bmbt records
    ffc8d613876f net: ipa: compute proper aggregation limit
    8adb751d294e io_uring: fix using under-expanded iters
    57d01bcae704 io_uring: don't re-import iovecs from callbacks
    6029f86740c9 assoc_array: Fix BUG_ON during garbage collect
    b96b4aa65bbc cfg80211: set custom regdomain after wiphy registration
    8fbd54ab06c9 pipe: Fix missing lock in pipe_resize_ring()
    cd720fad8b57 pipe: make poll_usage boolean and annotate its access
    ea62d169b6e7 netfilter: nf_tables: disallow non-stateful expression in sets earlier
    5525af175be2 drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers
    f0749aecb20b i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging
    828309eee5b6 net: ftgmac100: Disable hardware checksum on AST2600
    640397afdf6e nfc: pn533: Fix buggy cleanup order
    ac8d5eb26c9e net: af_key: check encryption module availability consistency
    d007f49ab789 percpu_ref_init(): clean ->percpu_count_ref on failure
    75e35951d6ec pinctrl: sunxi: fix f1c100s uart2 function

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 01af08d12495de711c9cf6928ca8650eca28feb4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ce903a7372..267ccae6ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5629d552de7759e4bb9821e210f3673c14900dd0"
-SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
+SRCREV_machine ?= "7990b55bc5118f2c082a9bf8faba90da674846a4"
+SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.119"
+LINUX_VERSION ?= "5.10.121"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 625cdfd085..4c8acd43ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.119"
+LINUX_VERSION ?= "5.10.121"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "50342ca6fc7dd66bfde9dfd1d6c336f99c55e0ab"
-SRCREV_machine ?= "d2cfd8b4499710877d54129a9137351a9de166fb"
-SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
+SRCREV_machine:qemuarm ?= "d26f32d1b819eb76ec986019d079b367ba979f4a"
+SRCREV_machine ?= "5ff0449fb076cadeff1b010758c845a042ff52a7"
+SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fcb7b83cec..498ea018eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "68264cfbddebea663543a7c4ad5131c6cf63d3d2"
-SRCREV_machine:qemuarm64 ?= "b95be3e8c15d939ce402775de98ab80eda493b11"
-SRCREV_machine:qemumips ?= "c6a8eaf00384dcce14bb9e28f2d68b5004e8c6f3"
-SRCREV_machine:qemuppc ?= "6c1e46f34c6b9ababf8c6fcb4c01274099bb034f"
-SRCREV_machine:qemuriscv64 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
-SRCREV_machine:qemuriscv32 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
-SRCREV_machine:qemux86 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
-SRCREV_machine:qemux86-64 ?= "f844c3765c3270321f0b3347992565cfdb938c99"
-SRCREV_machine:qemumips64 ?= "8d66b3ad7fbc8554ba2248cfbe755f8d24cb5a1a"
-SRCREV_machine ?= "f844c3765c3270321f0b3347992565cfdb938c99"
-SRCREV_meta ?= "2f6fa8da5f84c343e6ea57c76829eaca1cc6a840"
+SRCREV_machine:qemuarm ?= "ef0a86962ec1ff63e1f2cbc580356131c1bef7b8"
+SRCREV_machine:qemuarm64 ?= "83a9781b432a00dc860775a741307c558c6b8c64"
+SRCREV_machine:qemumips ?= "1fde9e6d54754203be1052ce657eabd524a7dbf4"
+SRCREV_machine:qemuppc ?= "00e7a83a78a5d3140ea1e696986b75c71dda2d2b"
+SRCREV_machine:qemuriscv64 ?= "97b065764b090d52493a9300f11cb1c988368b40"
+SRCREV_machine:qemuriscv32 ?= "97b065764b090d52493a9300f11cb1c988368b40"
+SRCREV_machine:qemux86 ?= "97b065764b090d52493a9300f11cb1c988368b40"
+SRCREV_machine:qemux86-64 ?= "97b065764b090d52493a9300f11cb1c988368b40"
+SRCREV_machine:qemumips64 ?= "268418490e87231112e22edd9a5f9ab10a1b1144"
+SRCREV_machine ?= "97b065764b090d52493a9300f11cb1c988368b40"
+SRCREV_meta ?= "6337d56f23d18e5680493dadcb52899d5e6a7c09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.119"
+LINUX_VERSION ?= "5.10.121"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

