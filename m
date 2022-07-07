Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 05/14] linux-yocto/5.4: update to v5.4.199
Date: Thu,  7 Jul 2022 11:59:27 -1000
Message-Id: <5503425172d832dae12bad6af8ca22ece454e4b0.1657231055.git.steve@sakoman.com>
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a31bd366116c Linux 5.4.199
    4cc40b1022bb x86/speculation/mmio: Print SMT warning
    d49c22094e6f KVM: x86/speculation: Disable Fill buffer clear within guests
    d96159263593 x86/speculation/mmio: Reuse SRBDS mitigation for SBDS
    bc64f38b5a38 x86/speculation/srbds: Update SRBDS mitigation selection
    020ce7495cfc x86/speculation/mmio: Add sysfs reporting for Processor MMIO Stale Data
    8d25482fc96a x86/speculation/mmio: Enable CPU Fill buffer clearing on idle
    7f898baa2044 x86/bugs: Group MDS, TAA & Processor MMIO Stale Data mitigations
    0800f1b45bf6 x86/speculation/mmio: Add mitigation for Processor MMIO Stale Data
    ae649e0cbf76 x86/speculation: Add a common function for MD_CLEAR mitigation update
    814ccb673035 x86/speculation/mmio: Enumerate Processor MMIO Stale Data bug
    91f8147c8371 Documentation: Add documentation for Processor MMIO Stale Data
    1e9f4e8a7aa9 x86/cpu: Add another Alder Lake CPU to the Intel family
    45e744de251c x86/cpu: Add Lakefield, Alder Lake and Rocket Lake models to the to Intel CPU family
    79568d551570 x86/cpu: Add Jasper Lake to Intel family
    9e2efaa5dd10 cpu/speculation: Add prototype for cpu_show_srbds()
    9d6e67bf5090 Linux 5.4.198
    602b338e3c3c tcp: fix tcp_mtup_probe_success vs wrong snd_cwnd
    b35e08edb2c2 mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
    0c12d7625502 md/raid0: Ignore RAID0 layout if the second zone has only one device
    0c4bc0a2f825 powerpc/32: Fix overread/overwrite of thread_struct via ptrace
    3c953d47eb1e Input: bcm5974 - set missing URB_NO_TRANSFER_DMA_MAP urb flag
    6ec537c50033 ixgbe: fix unexpected VLAN Rx in promisc mode on VF
    24030768a7b4 ixgbe: fix bcast packets Rx on VF after promisc removal
    3eca2c42daa4 nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
    31f9c39b4a37 nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
    4f4ab5004633 mmc: block: Fix CQE recovery reset success
    0245434e381e ata: libata-transport: fix {dma|pio|xfer}_mode sysfs files
    b651f70ed3a8 cifs: return errors during session setup during reconnects
    850965edc861 ALSA: hda/conexant - Fix loopback issue with CX20632
    6c04a2ae039b scripts/gdb: change kernel config dumping method
    1a36f77dc23c vringh: Fix loop descriptors check in the indirect cases
    a3f9b0afd8b4 nodemask: Fix return values to be unsigned
    9b306339a511 cifs: version operations for smb20 unneeded when legacy support disabled
    5cb13cdc180a s390/gmap: voluntarily schedule during key setting
    69893d6d7f5c nbd: fix io hung while disconnecting device
    8a7da4ced236 nbd: fix race between nbd_alloc_config() and module removal
    1be608e1ee1f nbd: call genl_unregister_family() first in nbd_cleanup()
    045045b522c6 x86/cpu: Elide KCSAN for cpu_has() and friends
    460083de66c4 modpost: fix undefined behavior of is_arm_mapping_symbol()
    28fd384c78d7 drm/radeon: fix a possible null pointer dereference
    9223144fdd64 ceph: allow ceph.dir.rctime xattr to be updatable
    7df12bee5415 Revert "net: af_key: add check for pfkey_broadcast in function pfkey_process"
    0331d261c398 scsi: myrb: Fix up null pointer access on myrb_cleanup()
    cf6b9316879f md: protect md_unregister_thread from reentrancy
    99e4c67a5581 watchdog: wdat_wdt: Stop watchdog when rebooting the system
    6fd031799e7b kernfs: Separate kernfs_pr_cont_buf and rename_lock.
    19f4b51b836d serial: msm_serial: disable interrupts in __msm_console_write()
    52a0d88c3280 staging: rtl8712: fix uninit-value in r871xu_drv_init()
    58762f1c63c7 staging: rtl8712: fix uninit-value in usb_read8() and friends
    1bcfb95de192 clocksource/drivers/sp804: Avoid error on multiple instances
    d472c78cc829 extcon: Modify extcon device to be created after driver data is set
    fa0b2dd6829d misc: rtsx: set NULL intfdata when probe fails
    d232ca0bbc7d usb: dwc2: gadget: don't reset gadget's driver->bus
    3a7170a3de62 USB: hcd-pci: Fully suspend across freeze/thaw cycle
    2dcec0bc142b drivers: usb: host: Fix deadlock in oxu_bus_suspend()
    09a5958a2452 drivers: tty: serial: Fix deadlock in sa1100_set_termios()
    c91a74b1f0f2 USB: host: isp116x: check return value after calling platform_get_resource()
    64b05fa212c7 drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
    1fbe033c5248 drivers: staging: rtl8192u: Fix deadlock in ieee80211_beacons_stop()
    8c014373f178 tty: Fix a possible resource leak in icom_probe
    f6e07eb7ebec tty: synclink_gt: Fix null-pointer-dereference in slgt_clean()
    1b04c934e1e6 lkdtm/usercopy: Expand size of "out of frame" object
    ca2498cce875 iio: st_sensors: Add a local lock for protecting odr
    ab75e02366e1 iio: dummy: iio_simple_dummy: check the return value of kstrdup()
    36acb4d9ce55 drm: imx: fix compiler warning with gcc-12
    8174acbef87b net: altera: Fix refcount leak in altera_tse_mdio_create
    3d08bc3a5d9b ip_gre: test csum_start instead of transport header
    957d298526b5 net/mlx5: fs, fail conflicting actions
    8a6740fdc562 net/mlx5: Rearm the FW tracer after each tracer event
    317260b3eb63 net: ipv6: unexport __init-annotated seg6_hmac_init()
    ef6d2354de23 net: xfrm: unexport __init-annotated xfrm4_protocol_init()
    6a90a44d5342 net: mdio: unexport __init-annotated mdio_bus_init()
    978dcc55cf36 SUNRPC: Fix the calculation of xdr->end in xdr_get_next_encode_buffer()
    180473e8e42a net/mlx4_en: Fix wrong return value on ioctl EEPROM query failure
    7c8df6fad43d net: dsa: lantiq_gswip: Fix refcount leak in gswip_gphy_fw_list
    e412b3d178ea bpf, arm64: Clear prog->jited_len along prog->jited
    556720013c36 af_unix: Fix a data-race in unix_dgram_peer_wake_me().
    b49c884146e2 xen: unexport __init-annotated xen_xlate_map_ballooned_pages()
    5b8d63489c3b netfilter: nf_tables: memleak flow rule from commit path
    d5a1e7f33c88 ata: pata_octeon_cf: Fix refcount leak in octeon_cf_probe
    e0212033ff68 netfilter: nat: really support inet nat without l3 address
    da99331fa621 xprtrdma: treat all calls not a bcall when bc_serv is NULL
    48dea4d3a11f video: fbdev: pxa3xx-gcu: release the resources correctly in pxa3xx_gcu_probe/remove()
    a2b3be930e79 NFSv4: Don't hold the layoutget locks across multiple RPC calls
    83960276ffc9 dmaengine: zynqmp_dma: In struct zynqmp_dma_chan fix desc_size data type
    4917e43bca50 m68knommu: fix undefined reference to `_init_sp'
    f6bdafbb9b04 m68knommu: set ZERO_PAGE() to the allocated zeroed page
    27fdb4572344 i2c: cadence: Increase timeout per message if necessary
    0a7a1fc7e71e f2fs: remove WARN_ON in f2fs_is_valid_blkaddr
    23b2163b887f tracing: Avoid adding tracer option before update_tracer_options
    48c6ee7d6c61 tracing: Fix sleeping function called from invalid context on RT kernel
    cc0aed22d33c mips: cpc: Fix refcount leak in mips_cpc_default_phys_base
    ff66ae4359ff perf c2c: Fix sorting in percent_rmt_hitm_cmp()
    8b91d0dfc839 tipc: check attribute length for bearer name
    c2eba68d185b afs: Fix infinite loop found by xfstest generic/676
    d05c2fdf8e10 tcp: tcp_rtx_synack() can be called from process context
    1bd2f7f38bac net: sched: add barrier to fix packet stuck problem for lockless qdisc
    77b954ce2d64 net/mlx5e: Update netdev features after changing XDP state
    a4c52440acf4 net/mlx5: Don't use already freed action pointer
    00803d30518f nfp: only report pause frame configuration for physical device
    8302620aeb94 ubi: ubi_create_volume: Fix use-after-free when volume creation failed
    d3a4fff1e7e4 jffs2: fix memory leak in jffs2_do_fill_super
    acf92b525723 modpost: fix removing numeric suffixes
    a101793994c0 net: dsa: mv88e6xxx: Fix refcount leak in mv88e6xxx_mdios_register
    2bd1faedb74d net: ethernet: mtk_eth_soc: out of bounds read in mtk_hwlro_get_fdir_entry()
    be73e3bf6862 net: sched: fixed barrier to prevent skbuff sticking in qdisc backlog
    51ed32c1cfcf s390/crypto: fix scatterwalk_unmap() callers in AES-GCM
    80f6712f241c clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
    e5d479d73f21 ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
    5b110d940417 watchdog: ts4800_wdt: Fix refcount leak in ts4800_wdt_probe
    593b595332bd driver core: fix deadlock in __device_attach
    5d709f58c743 driver: base: fix UAF when driver_attach failed
    3157118c1795 bus: ti-sysc: Fix warnings for unbind for serial
    a724634b2a49 firmware: dmi-sysfs: Fix memory leak in dmi_sysfs_register_handle
    c3a16e7c8624 serial: stm32-usart: Correct CSIZE, bits, and parity
    29d963635ee6 serial: st-asc: Sanitize CSIZE and correct PARENB for CS7
    5c01c19f64c7 serial: sifive: Sanitize CSIZE and c_iflag
    841cab744cc0 serial: sh-sci: Don't allow CS5-6
    942aa88467b9 serial: txx9: Don't allow CS5-6
    eb8de4bac35a serial: rda-uart: Don't allow CS5-6
    0de3d2344ee0 serial: digicolor-usart: Don't allow CS5-6
    035bc3b734aa serial: 8250_fintek: Check SER_RS485_RTS_* only with RS485
    1b3ae6d85069 serial: meson: acquire port->lock in startup()
    d77f28c1bc9d rtc: mt6397: check return value after calling platform_get_resource()
    d041e885749f clocksource/drivers/riscv: Events are stopped during CPU suspend
    69a30b2ed620 soc: rockchip: Fix refcount leak in rockchip_grf_init
    0f91755514b8 coresight: cpu-debug: Replace mutex with mutex_trylock on panic notifier
    47e4c42faab9 serial: sifive: Report actual baud base rather than fixed 115200
    f2a16af2ee0a phy: qcom-qmp: fix pipe-clock imbalance on power-on failure
    b6b0f8904bd6 rpmsg: qcom_smd: Fix returning 0 if irq_of_parse_and_map() fails
    088f449d9d3c iio: adc: sc27xx: Fine tune the scale calibration values
    e5d48301d1fc iio: adc: sc27xx: fix read big scale voltage not right
    0f57d139300f iio: adc: stmpe-adc: Fix wait_for_completion_timeout return value check
    bec18bb00f11 firmware: stratix10-svc: fix a missing check on list iterator
    8ad7b3d9f838 usb: dwc3: pci: Fix pm_runtime_get_sync() error checking
    1026ee392ba3 rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
    89d1b9dfccce pwm: lp3943: Fix duty calculation in case period was clamped
    8e9f3f508a9c staging: fieldbus: Fix the error handling path in anybuss_host_common_probe()
    67c2aa77b40e usb: musb: Fix missing of_node_put() in omap2430_probe
    b78499772fa7 USB: storage: karma: fix rio_karma_init return
    72ab0f6f2ba8 usb: usbip: add missing device lock on tweak configuration cmd
    2f0ae93ec33c usb: usbip: fix a refcount leak in stub_probe()
    077f58e469a6 tty: serial: fsl_lpuart: fix potential bug when using both of_alias_get_id and ida_simple_get
    7320308b189c tty: serial: owl: Fix missing clk_disable_unprepare() in owl_uart_probe
    9ae3d073f7db tty: goldfish: Use tty_port_destroy() to destroy port
    d88fdea1477c iio: adc: ad7124: Remove shift from scan_type
    1aa30dc88372 staging: greybus: codecs: fix type confusion of list iterator variable
    6c8c536e0020 pcmcia: db1xxx_ss: restrict to MIPS_DB1XXX boards
    4faa6308e1b8 md: bcache: check the return value of kzalloc() in detached_dev_do_request()
    5f62b21b7c93 block: fix bio_clone_blkg_association() to associate with proper blkcg_gq
    ccddf8cd411c bfq: Make sure bfqg for which we are queueing requests is online
    8afc13b958bd bfq: Get rid of __bio_blkcg() usage
    be1b78f94992 bfq: Remove pointless bfq_init_rq() calls
    f885f55033a1 bfq: Drop pointless unlock-lock pair
    97be7d13fbd4 bfq: Avoid merging queues with different parents
    54073410537f MIPS: IP27: Remove incorrect `cpu_has_fpu' override
    427c3c7ebd5f RDMA/rxe: Generate a completion for unsupported/invalid opcode
    4946cfd1c8f0 Kconfig: add config option for asm goto w/ outputs
    7ac21b24af85 phy: qcom-qmp: fix reset-controller leak on probe errors
    d19fa8f25200 blk-iolatency: Fix inflight count imbalances and IO hangs on offline
    8a068913d19d dt-bindings: gpio: altera: correct interrupt-cells
    3b8c37780d11 docs/conf.py: Cope with removal of language=None in Sphinx 5.0.0
    da9634374d41 ARM: pxa: maybe fix gpio lookup tables
    1668ad103679 phy: qcom-qmp: fix struct clk leak on probe errors
    2040b6076544 arm64: dts: qcom: ipq8074: fix the sleep clock frequency
    8dd2e5f9c1f1 gma500: fix an incorrect NULL check on list iterator
    a62591e36100 tilcdc: tilcdc_external: fix an incorrect NULL check on list iterator
    77ec584d3de0 serial: pch: don't overwrite xmit->buf[0] by x_char
    f6cb1470ba22 carl9170: tx: fix an incorrect use of list iterator
    2ea49d6310c9 ASoC: rt5514: Fix event generation for "DSP Voice Wake Up" control
    b8ce58ab80fa rtl818x: Prevent using not initialized queues
    6f4a489d8458 hugetlb: fix huge_pmd_unshare address update
    73bdb2359dbc nodemask.h: fix compilation error with GCC12
    6e071eaf5002 iommu/msm: Fix an incorrect NULL check on list iterator
    9caad70819ae um: Fix out-of-bounds read in LDT setup
    6cbe83680f01 um: chan_user: Fix winch_tramp() return value
    3466e4265244 mac80211: upgrade passive scan to active scan on DFS channels after beacon rx
    cf465ecfe3a8 irqchip: irq-xtensa-mx: fix initial IRQ affinity
    36bab24bb81b irqchip/armada-370-xp: Do not touch Performance Counter Overflow on A375, A38x, A39x
    8858284dd749 RDMA/hfi1: Fix potential integer multiplication overflow errors
    64623236263f Kconfig: Add option for asm goto w/ tied outputs to workaround clang-13 bug
    532aa3f7a50c media: coda: Add more H264 levels for CODA960
    adcea1c8eea8 media: coda: Fix reported H264 profile
    f2c2ad538e49 mtd: cfi_cmdset_0002: Move and rename chip_check/chip_ready/chip_good_for_write
    16e993ac7c81 md: fix an incorrect NULL check in md_reload_sb
    d0bdc809f788 md: fix an incorrect NULL check in does_sb_need_changing
    3623f833e19b drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX
    8fa6eb03e3f5 drm/nouveau/clk: Fix an incorrect NULL check on list iterator
    19323b3671a8 drm/etnaviv: check for reaped mapping in etnaviv_iommu_unmap_gem
    c12984cdb077 drm/amdgpu/cs: make commands with 0 chunks illegal behaviour.
    8e105178c26a scsi: ufs: qcom: Add a readl() to make sure ref_clk gets enabled
    494685db0023 scsi: dc395x: Fix a missing check on list iterator
    82bf8e7271fa ocfs2: dlmfs: fix error handling of user_dlm_destroy_lock
    17ea63484975 dlm: fix missing lkb refcount handling
    49cd9eb7b9a7 dlm: fix plock invalid read
    f160e7b4b02a mm, compaction: fast_find_migrateblock() should return pfn in the target zone
    665602c83776 PCI: qcom: Fix unbalanced PHY init on probe errors
    c3919b10c45f PCI: qcom: Fix runtime PM imbalance on probe errors
    c99306cf5983 PCI/PM: Fix bridge_d3_blacklist[] Elo i2 overwrite of Gigabyte X299
    c27f744ceefa tracing: Fix potential double free in create_var_ref()
    742736dc9c01 ACPI: property: Release subnode properties with data nodes
    e157c8f87e8f ext4: avoid cycles in directory h-tree
    17034d45ec44 ext4: verify dir block before splitting it
    73fd5b192851 ext4: fix bug_on in ext4_writepages
    0ab308d72af7 ext4: fix warning in ext4_handle_inode_extension
    eaecf7ebfd5d ext4: fix use-after-free in ext4_rename_dir_prepare
    f36736fbd484 netfilter: nf_tables: disallow non-stateful expression in sets earlier
    28a8060a0bd2 bfq: Track whether bfq_group is still online
    da9f3025d595 bfq: Update cgroup information before merging bio
    31326bf55126 bfq: Split shared queues on move between cgroups
    b1cda6dd2c44 efi: Do not import certificates from UEFI Secure Boot for T2 Macs
    440d345d0274 fs-writeback: writeback_sb_inodes：Recalculate 'wrote' according skipped pages
    e0dddab01f94 iwlwifi: mvm: fix assert 1F04 upon reconfig
    265bec4779a3 wifi: mac80211: fix use-after-free in chanctx code
    9259227605df f2fs: fix fallocate to use file_modified to update permissions consistently
    1f926457c3e7 f2fs: don't need inode lock for system hidden quota
    12ffc0044aba f2fs: fix deadloop in foreground GC
    54c116615c99 f2fs: fix to clear dirty inode in f2fs_evict_inode()
    7361c9f2bd6a f2fs: fix to do sanity check on block address in f2fs_do_zero_range()
    f8b3c3fcf331 f2fs: fix to avoid f2fs_bug_on() in dec_valid_node_count()
    7f51f2734555 perf jevents: Fix event syntax error caused by ExtSel
    9eb684dc41d8 perf c2c: Use stdio interface if slang is not supported
    e23eb2f43f4d iommu/amd: Increase timeout waiting for GA log enablement
    db7ea8b261ef dmaengine: stm32-mdma: remove GISR1 register
    8db59df7f582 video: fbdev: clcdfb: Fix refcount leak in clcdfb_of_vram_setup
    dcc00106c325 NFSv4/pNFS: Do not fail I/O when we fail to allocate the pNFS layout
    3d216510f8af NFS: Don't report errors from nfs_pageio_complete() more than once
    55f0fc32b2f2 NFS: Do not report flush errors in nfs_write_end()
    59137943af75 NFS: Do not report EINTR/ERESTARTSYS as mapping errors
    4826af9a07cf i2c: at91: Initialize dma_buf in at91_twi_xfer()
    d77a0f2842b3 i2c: at91: use dma safe buffers
    e4db5f4b680a iommu/mediatek: Add list_del in mtk_iommu_remove
    5e47a7add3dd f2fs: fix dereference of stale list iterator after loop body
    c8735252f93f Input: stmfts - do not leave device disabled in stmfts_input_open
    addb192000d8 RDMA/hfi1: Prevent use of lock before it is initialized
    6d8b9f574bca mailbox: forward the hrtimer if not queued and under a lock
    49c1e32e7b3f mfd: davinci_voicecodec: Fix possible null-ptr-deref davinci_vc_probe()
    bcb6c4c5eb48 powerpc/fsl_rio: Fix refcount leak in fsl_rio_setup
    2631fe5b53b5 macintosh: via-pmu and via-cuda need RTC_LIB
    bc21634ce430 powerpc/perf: Fix the threshold compare group constraint for power9
    cf0b52858f74 powerpc/64: Only WARN if __pa()/__va() called with bad addresses
    bbc2b0ce6042 Input: sparcspkr - fix refcount leak in bbc_beep_probe
    6d7b2cf5c7ed crypto: cryptd - Protect per-CPU resource by disabling BH.
    3219ac364ac3 tty: fix deadlock caused by calling printk() under tty_port->lock
    ded067f24b90 PCI: imx6: Fix PERST# start-up sequence
    0b35a685d911 ipc/mqueue: use get_tree_nodev() in mqueue_get_tree()
    203537caad3c proc: fix dentry/inode overinstantiating under /proc/${pid}/net
    6cdb6582b566 powerpc/4xx/cpm: Fix return value of __setup() handler
    337eef19aad8 powerpc/idle: Fix return value of __setup() handler
    1d83f304215b powerpc/8xx: export 'cpm_setbrg' for modules
    662b70a45b32 dax: fix cache flush on PMD-mapped pages
    386e69e06817 drivers/base/node.c: fix compaction sysfs file leak
    d1f908bd0100 pinctrl: mvebu: Fix irq_of_parse_and_map() return value
    9282496aac8b nvdimm: Allow overwrite in the presence of disabled dimms
    b0e4bafac896 firmware: arm_scmi: Fix list protocols enumeration in the base protocol
    ffd3bed66b54 scsi: fcoe: Fix Wstringop-overflow warnings in fcoe_wwn_from_mac()
    829ea474876f mfd: ipaq-micro: Fix error check return value of platform_get_irq()
    8c4eeab72608 powerpc/fadump: fix PT_LOAD segment for boot memory area
    bbf58e97426d arm: mediatek: select arch timer for mt7629
    e7a0d0c2802f crypto: marvell/cesa - ECB does not IV
    de65c32ace9a misc: ocxl: fix possible double free in ocxl_file_register_afu
    7f287d0c7001 ARM: dts: bcm2835-rpi-b: Fix GPIO line names
    3a37022d48a5 ARM: dts: bcm2837-rpi-3-b-plus: Fix GPIO line name of power LED
    fd1c098b3bdd ARM: dts: bcm2837-rpi-cm3-io3: Fix GPIO line names for SMPS I2C
    e0bf7f084412 ARM: dts: bcm2835-rpi-zero-w: Fix GPIO line name for Wifi/BT
    e4594ca90b4e can: xilinx_can: mark bit timing constants as const
    6077a1e637b3 KVM: nVMX: Leave most VM-Exit info fields unmodified on failed VM-Entry
    9cccb3f6ed9a PCI: rockchip: Fix find_first_zero_bit() limit
    f063429ac33f PCI: cadence: Fix find_first_zero_bit() limit
    5543752a48ad soc: qcom: smsm: Fix missing of_node_put() in smsm_parse_ipc
    669575521633 soc: qcom: smp2p: Fix missing of_node_put() in smp2p_parse_ipc
    56b8d748ec43 ARM: dts: suniv: F1C100: fix watchdog compatible
    754ef324b70b arm64: dts: rockchip: Move drive-impedance-ohm to emmc phy on rk3399
    60546c0b4b46 net/smc: postpone sk_refcnt increment in connect()
    91121ee57414 rxrpc: Fix decision on when to generate an IDLE ACK
    d7b16ee15fc6 rxrpc: Don't let ack.previousPacket regress
    2fd958ae29fd rxrpc: Fix overlapping ACK accounting
    5aa14dafd2b0 rxrpc: Don't try to resend the request if we're receiving the reply
    91b34bf0409f rxrpc: Fix listen() setting the bar too high for the prealloc rings
    0bfaff00d1a7 NFC: hci: fix sleep in atomic context bugs in nfc_hci_hcp_message_tx
    9934025c4d66 ASoC: wm2000: fix missing clk_disable_unprepare() on error in wm2000_anc_transition()
    b3461ccaa5d2 thermal/drivers/broadcom: Fix potential NULL dereference in sr_thermal_probe
    449374565f34 drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()
    6832e36f156e drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
    48d331a03b0d ext4: reject the 'commit' option on ext2 filesystems
    3dc032375595 media: ov7670: remove ov7670_power_off from ov7670_remove
    dc794fa2b3c4 sctp: read sk->sk_bound_dev_if once in sctp_rcv()
    d43a87d66039 m68k: math-emu: Fix dependencies of math emulation support
    6f55fac0af35 Bluetooth: fix dangling sco_conn and use-after-free in sco_sock_timeout
    c3c8c7e409d0 media: vsp1: Fix offset calculation for plane cropping
    1310fc3538dc media: pvrusb2: fix array-index-out-of-bounds in pvr2_i2c_core_init
    83345b536599 media: exynos4-is: Change clk_disable to clk_disable_unprepare
    b87d3a043b32 media: st-delta: Fix PM disable depth imbalance in delta_probe
    12480f757810 media: aspeed: Fix an error handling path in aspeed_video_probe()
    d2b1dc3a0432 scripts/faddr2line: Fix overlapping text section failures
    0be5d9da5743 regulator: pfuze100: Fix refcount leak in pfuze_parse_regulators_dt
    18b907ff0ae4 ASoC: mxs-saif: Fix refcount leak in mxs_saif_probe
    96fc3da6184a ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
    ddb1a77f94d7 perf/amd/ibs: Use interrupt regs ip for stack unwinding
    f2e2e934d2b6 Revert "cpufreq: Fix possible race in cpufreq online error path"
    1253811c71e0 iomap: iomap_write_failed fix
    6b8291e574a8 media: uvcvideo: Fix missing check to determine if element is found in list
    ab888b1a9a6d drm/msm: return an error pointer in msm_gem_prime_get_sg_table()
    22d8424913b1 drm/msm/mdp5: Return error code in mdp5_mixer_release when deadlock is detected
    b2aa2c4efe93 drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected
    cd4cfd99ec14 regulator: core: Fix enable_count imbalance with EXCLUSIVE_GET
    db5a21f2dd62 x86/mm: Cleanup the control_va_addr_alignment() __setup handler
    d2476a1fc50b irqchip/aspeed-i2c-ic: Fix irq_of_parse_and_map() return value
    b97eb924a234 irqchip/exiu: Fix acknowledgment of edge triggered interrupts
    9777de28cfea x86: Fix return value of __setup handlers
    ee3901d7c7f4 virtio_blk: fix the discard_granularity and discard_alignment queue limits
    a9b4599665e4 drm/rockchip: vop: fix possible null-ptr-deref in vop_bind()
    35d9a84e3b35 drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
    2b3ed7547b1a drm/msm/hdmi: check return value after calling platform_get_resource_byname()
    11709592b350 drm/msm/dsi: fix error checks and return values for DSI xmit functions
    ef10d0c68e86 drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume
    db681127e96d perf tools: Add missing headers needed by util/data.h
    31de06ef06a8 ASoC: rk3328: fix disabling mclk on pclk probe failure
    ed8d5cf1dcad x86/speculation: Add missing prototype for unpriv_ebpf_notify()
    1d0c4bc628ca x86/pm: Fix false positive kmemleak report in msr_build_context()
    b889619eba6f scsi: ufs: core: Exclude UECxx from SFR dump list
    e120d31d04bf of: overlay: do not break notify on NOTIFY_{OK|STOP}
    b0be017bc59d fsnotify: fix wrong lockdep annotations
    60d159e0d084 inotify: show inotify mask flags in proc fdinfo
    2326d398ccd4 ath9k_htc: fix potential out of bounds access with invalid rxstatus->rs_keyix
    cd1f386120d0 cpufreq: Fix possible race in cpufreq online error path
    e7f0fd6f2566 spi: img-spfi: Fix pm_runtime_get_sync() error checking
    735b57a96088 sched/fair: Fix cfs_rq_clock_pelt() for throttled cfs_rq
    55fddbb1e278 drm/bridge: Fix error handling in analogix_dp_probe
    f1d4f19a7965 HID: elan: Fix potential double free in elan_input_configured
    75a89bc1baee HID: hid-led: fix maximum brightness for Dream Cheeky
    3caa2d7943ca drbd: fix duplicate array initializer
    65065f96d53e efi: Add missing prototype for efi_capsule_setup_info
    fbf9c4c714d3 NFC: NULL out the dev->rfkill to prevent UAF
    2c59535b6be0 spi: spi-ti-qspi: Fix return value handling of wait_for_completion_timeout
    fa0d7ba25a53 drm: mali-dp: potential dereference of null pointer
    797f8ee35f03 drm/komeda: Fix an undefined behavior bug in komeda_plane_add()
    1a994f1f1841 nl80211: show SSID for P2P_GO interfaces
    93c0f9d78ddd bpf: Fix excessive memory allocation in stack_map_alloc()
    c398c2149b17 drm/vc4: txp: Force alpha to be 0xff if it's disabled
    8a60b54e41c9 drm/vc4: txp: Don't set TXP_VSTART_AT_EOF
    a0c890c0ae9f drm/mediatek: Fix mtk_cec_mask()
    ea8b2ecc920d x86/delay: Fix the wrong asm constraint in delay_loop()
    c71494f5f2b4 ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
    23f340ed906c ASoC: mediatek: Fix error handling in mt8173_max98090_dev_probe
    e92b927fffb6 drm/bridge: adv7511: clean up CEC adapter when probe fails
    224e1eef0386 drm/edid: fix invalid EDID extension block filtering
    657734866839 ath9k: fix ar9003_get_eepmisc
    ebede9aadfa3 drm: fix EDID struct for old ARM OABI format
    e60ad83f645e RDMA/hfi1: Prevent panic when SDMA is disabled
    cb4f2dc513e9 powerpc/iommu: Add missing of_node_put in iommu_init_early_dart
    6557555a86f3 macintosh/via-pmu: Fix build failure when CONFIG_INPUT is disabled
    793b82d1c424 powerpc/powernv: fix missing of_node_put in uv_init()
    537a317e5ff4 powerpc/xics: fix refcount leak in icp_opal_init()
    a910e9613130 tracing: incorrect isolate_mote_t cast in mm_vmscan_lru_isolate
    c9a81f9ed6ae PCI: Avoid pci_dev_lock() AB/BA deadlock with sriov_numvfs_store()
    e10905816513 ARM: hisi: Add missing of_node_put after of_find_compatible_node
    2f46a955b6f5 ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
    fcd1999ba974 ARM: versatile: Add missing of_node_put in dcscb_init
    fd48cf8f972f fat: add ratelimit to fat*_ent_bread()
    60ce637c194b powerpc/fadump: Fix fadump to work with a different endian capture kernel
    41c7096286aa ARM: OMAP1: clock: Fix UART rate reporting algorithm
    e54fd01178eb fs: jfs: fix possible NULL pointer dereference in dbFree()
    a0180e324a9a PM / devfreq: rk3399_dmc: Disable edev on remove()
    1995a60be7cb ARM: dts: ox820: align interrupt controller node name with dtschema
    58e55f4f5a2a IB/rdmavt: add missing locks in rvt_ruc_loopback
    56fd9dcfe10c selftests/bpf: fix btf_dump/btf_dump due to recent clang change
    063d945795a0 eth: tg3: silence the GCC 12 array-bounds warning
    88d730463e9b rxrpc: Return an error to sendmsg if call failed
    1ec0bc72f5da hwmon: Make chip parameter for with_info API mandatory
    a7a41dd47303 ASoC: max98357a: remove dependency on GPIOLIB
    3cf43978ffd1 media: exynos4-is: Fix compile warning
    1e5fbfc2a6f3 net: phy: micrel: Allow probing without .driver_data
    9d1764b9266b nbd: Fix hung on disconnect request if socket is closed before
    abe7554da62c ASoC: rt5645: Fix errorenous cleanup order
    f76729662650 nvme-pci: fix a NULL pointer dereference in nvme_alloc_admin_tags
    69edf28d2c42 openrisc: start CPU timer early in boot
    67fb49438858 media: cec-adap.c: fix is_configuring state
    4172a34ef93f media: coda: limit frame interval enumeration to supported encoder frame sizes
    8f2a5721cdc3 rtlwifi: Use pr_warn instead of WARN_ONCE
    2d966c94adce ipmi: Fix pr_fmt to avoid compilation issues
    2064a1eab2ec ipmi:ssif: Check for NULL msg when handling events and messages
    17cfc9455830 ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default
    5a71f14a9b2e dma-debug: change allocation mode from GFP_NOWAIT to GFP_ATIOMIC
    6583d0d6ad6d spi: stm32-qspi: Fix wait_cmd timeout in APM mode
    1651a95517fb s390/preempt: disable __preempt_count_add() optimization for PROFILE_ALL_BRANCHES
    890b16b4709d ASoC: tscs454: Add endianness flag in snd_soc_component_driver
    00771de7cc28 HID: bigben: fix slab-out-of-bounds Write in bigben_probe
    0d7074792bb9 drm/amdgpu/ucode: Remove firmware load type check in amdgpu_ucode_free_bo
    2317f3bfda6d mlxsw: spectrum_dcb: Do not warn about priority changes
    121f56a9a832 ASoC: dapm: Don't fold register value changes into notifications
    430af81135d5 net/mlx5: fs, delete the FTE when there are no rules attached to it
    f857855a8a83 ipv6: Don't send rs packets to the interface of ARPHRD_TUNNEL
    b507f067e9fc drm: msm: fix error check return value of irq_of_parse_and_map()
    efd183d988b4 arm64: compat: Do not treat syscall number as ESR_ELx for a bad syscall
    a610cfe56c38 drm/amd/pm: fix the compile warning
    1e29d829ad51 drm/plane: Move range check for format_count earlier
    e1599ced6be1 scsi: megaraid: Fix error check return value of register_chrdev()
    7923f95997a7 mmc: jz4740: Apply DMA engine limits to maximum segment size
    0959aa00f976 md/bitmap: don't set sb values if can't pass sanity check
    222292930c8e media: cx25821: Fix the warning when removing the module
    fa636e9ee444 media: pci: cx23885: Fix the error handling in cx23885_initdev()
    0ac84ab50712 media: venus: hfi: avoid null dereference in deinit
    de16cdf0b73d ath9k: fix QCA9561 PA bias level
    af832028af6f drm/amd/pm: fix double free in si_parse_power_table()
    7bd0ac1e2345 tools/power turbostat: fix ICX DRAM power numbers
    6266ab1f31fa spi: spi-rspi: Remove setting {src,dst}_{addr,addr_width} based on DMA direction
    f68bed124c76 ALSA: jack: Access input_dev under mutex
    aea748501d09 drm/komeda: return early if drm_universal_plane_init() fails.
    8ded0af90e97 ACPICA: Avoid cache flush inside virtual machines
    c7b41fd76ce2 fbcon: Consistently protect deferred_takeover with console_lock()
    4460066eb248 ipv6: fix locking issues with loops over idev->addr_list
    8fb1b9beb085 ipw2x00: Fix potential NULL dereference in libipw_xmit()
    303380919df7 b43: Fix assigning negative value to unsigned variable
    60d515fd8797 b43legacy: Fix assigning negative value to unsigned variable
    92225d3c2241 mwifiex: add mutex lock for call in mwifiex_dfs_chan_sw_work_queue
    f85cb059fad0 drm/virtio: fix NULL pointer dereference in virtio_gpu_conn_get_modes
    670f5e40d7b3 btrfs: repair super block num_devices automatically
    622ced791ed8 btrfs: add "0x" prefix for unsupported optional features
    0ca511204740 ptrace: Reimplement PTRACE_KILL by always sending SIGKILL
    f5faa24137d7 ptrace/xtensa: Replace PT_SINGLESTEP with TIF_SINGLESTEP
    e10356eae1c2 ptrace/um: Replace PT_DTRACE with TIF_SINGLESTEP
    00c93ce2665c perf/x86/intel: Fix event constraints for ICL
    1b767500d151 usb: core: hcd: Add support for deferring roothub registration
    114790876393 USB: new quirk for Dell Gen 2 devices
    7c5a52dd4d91 USB: serial: option: add Quectel BG95 modem
    6b3ecb2d92a0 ALSA: hda/realtek - Fix microphone noise on ASUS TUF B550M-PLUS
    1c6cfb9e8a5c binfmt_flat: do not stop relocating GOT entries prematurely on riscv
    35c6471fd2c1 Linux 5.4.197
    e00c2f22fbfa bpf: Enlarge offset check value to INT_MAX in bpf_skb_{load,store}_bytes
    a2235bc65ade NFSD: Fix possible sleep during nfsd4_release_lockowner()
    f5b6bc69a792 NFS: Memory allocation failures are not server fatal errors
    0490cd2aee18 docs: submitting-patches: Fix crossref to 'The canonical patch format'
    72ef5d01fe37 tpm: ibmvtpm: Correct the return value in tpm_ibmvtpm_probe()
    7ecd237e5036 tpm: Fix buffer access in tpm2_get_tpm_pt()
    396d1f51764d HID: multitouch: Add support for Google Whiskers Touchpad
    25f0e9459f94 raid5: introduce MD_BROKEN
    fd2f7e998485 dm verity: set DM_TARGET_IMMUTABLE feature flag
    f00597350210 dm stats: add cond_resched when looping over entries
    65e6282f0d75 dm crypt: make printing of the key constant-time
    a4415f39e3e8 dm integrity: fix error code in dm_integrity_ctr()
    fc658c083904 zsmalloc: fix races between asynchronous zspage free and page migration
    7632451ad926 crypto: ecrdsa - Fix incorrect use of vli_cmp
    b16bb373988d netfilter: conntrack: re-fetch conntrack after insertion
    1fe82bfd9e4c exec: Force single empty string when argv is empty
    241b566e0403 drm/i915: Fix -Wstringop-overflow warning in call to intel_read_wm_latency()
    3dbab9e37ca1 cfg80211: set custom regdomain after wiphy registration
    039fa25d95ce assoc_array: Fix BUG_ON during garbage collect
    8c668da61bd0 drivers: i2c: thunderx: Allow driver to work with ACPI defined TWSI controllers
    fdcbdb3d089a i2c: ismt: Provide a DMA buffer for Interrupt Cause Logging
    827980029d0f net: ftgmac100: Disable hardware checksum on AST2600
    e619506ed010 net: af_key: check encryption module availability consistency
    fa77d2a3a755 pinctrl: sunxi: fix f1c100s uart2 function
    2208c31d864e ACPI: sysfs: Fix BERT error region memory mapping
    92d4b5e14830 ACPI: sysfs: Make sparse happy about address space in use
    5a73bd4f4710 media: vim2m: initialize the media device earlier
    b7248281afb1 media: vim2m: Register video device after setting up internals
    ab5b00cfe050 secure_seq: use the 64 bits of the siphash for port offset calculation
    80cca53a48c8 tcp: change source port randomizarion at connect() time
    9ce35dad5a1a Input: goodix - fix spurious key release events
    bdbc7ef3eb2c staging: rtl8723bs: prevent ->Ssid overflow in rtw_wx_set_scan()
    4f0750839421 x86/pci/xen: Disable PCI/MSI[-X] masking for XEN_HVM guests
    8bb828229da9 lockdown: also lock down previous kgdb use

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 0ef18c0b77..2fef4f032d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5a2ea5a1decb40650f6e447af2dc02579b3a5521"
-SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
+SRCREV_machine ?= "d7693f19702e1fa1bb18507260198478cba0d6a2"
+SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.196"
+LINUX_VERSION ?= "5.4.199"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9b41d280a7..32ff438a57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.196"
+LINUX_VERSION ?= "5.4.199"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bae8f843b4f6520a8deb813616669951a5bf58ca"
-SRCREV_machine ?= "4e04a0f737355772b02dd4225e3b579204ce41c0"
-SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
+SRCREV_machine_qemuarm ?= "a117c8494d49f5ab6ec54a69c0f926bad5d55616"
+SRCREV_machine ?= "fbc1147bd48ea6b51895e8ab9d6422d112cdd58a"
+SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 11e7ff6a21..e2130386b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7efd457b777ad4b9029594f2770c5f9e3cc6b88e"
-SRCREV_machine_qemuarm64 ?= "4416c0026b35a6d2c9b03e27bfdbb9cb08cf84d2"
-SRCREV_machine_qemumips ?= "7d4e3a8bdcdae2e56640db0d4a739000665ad0cf"
-SRCREV_machine_qemuppc ?= "f0ed4149f804120d6c4b7fd5b9fb49287136b4d5"
-SRCREV_machine_qemuriscv64 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
-SRCREV_machine_qemux86 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
-SRCREV_machine_qemux86-64 ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
-SRCREV_machine_qemumips64 ?= "14c090645b3e8c432dc1de659189af76d7fc7825"
-SRCREV_machine ?= "740afe0923aca19768b11bff283a31dbdf9509e9"
-SRCREV_meta ?= "9b55ffe3d137121be67c99a60bfdb3c6af47fae2"
+SRCREV_machine_qemuarm ?= "3bc1fc1cd35bd8f95e80fb49627c2f6977debc84"
+SRCREV_machine_qemuarm64 ?= "c048122124fdbd78d02ac64ef6558503e7536f7b"
+SRCREV_machine_qemumips ?= "19fc003e228a56e30943ddcba0614de6365e2740"
+SRCREV_machine_qemuppc ?= "ef263615ec81ddfac29c82c5c61f6195dde31944"
+SRCREV_machine_qemuriscv64 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
+SRCREV_machine_qemux86 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
+SRCREV_machine_qemux86-64 ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
+SRCREV_machine_qemumips64 ?= "9ee7899b379b865fe676d50be29162845c9a9ee3"
+SRCREV_machine ?= "ac296ae9753c775eb216fe6c2eb3dbccfc1489f7"
+SRCREV_meta ?= "318db1080fdd1e26567b6ba679310adad84c173a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.196"
+LINUX_VERSION ?= "5.4.199"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

