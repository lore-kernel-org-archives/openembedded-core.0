Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002057"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002057"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651995"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/37] linux-yocto/5.10: update to v5.10.50
Date: Mon,  2 Aug 2021 15:52:02 +0800
Message-Id: <731548b758c0bd0386d70dd8b4eaed09db1fd732.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    43b0742ef44c Linux 5.10.50
    bdf4d33e8342 powerpc/preempt: Don't touch the idle task's preempt_count during hotplug
    9b07d817f799 iommu/dma: Fix compile warning in 32-bit builds
    0855952ed4f1 cred: add missing return error code when set_cred_ucounts() failed
    ce04375e2d9b s390: preempt: Fix preempt_count initialization
    e4a577d61791 crypto: qce - fix error return code in qce_skcipher_async_req_handle()
    fb0c0a04e424 scsi: core: Retry I/O for Notify (Enable Spinup) Required error
    2b541b6c7432 media: exynos4-is: remove a now unused integer
    2b58f5154a8f mmc: vub3000: fix control-request direction
    39ac3e194516 mmc: block: Disable CMDQ on the ioctl path
    a75457f63086 io_uring: fix blocking inline submission
    c98d9318dc99 block: return the correct bvec when checking for gaps
    51c19f4a6212 erofs: fix error return code in erofs_read_superblock()
    97cbddc8a2bc tpm: Replace WARN_ONCE() with dev_err_once() in tpm_tis_status()
    b5a2b5b64237 fscrypt: fix derivation of SipHash keys on big endian CPUs
    089057af71d7 fscrypt: don't ignore minor_hash when hash is 0
    b9c3b485593e mailbox: qcom-ipcc: Fix IPCC mbox channel exhaustion
    2a7c96c2e238 scsi: target: cxgbit: Unmap DMA buffer before calling target_execute_cmd()
    e2e615e6317b scsi: fc: Correct RHBA attributes length
    5c6956e66404 exfat: handle wrong stream entry size in exfat_readdir()
    b6a41435c832 csky: syscache: Fixup duplicate cache flush
    3483e1a41ca0 csky: fix syscache.c fallthrough warning
    8ff266de8906 perf llvm: Return -ENOMEM when asprintf() fails
    58fa4b36abf6 selftests/vm/pkeys: refill shadow register after implicit kernel write
    1dd18fda3eec selftests/vm/pkeys: handle negative sys_pkey_alloc() return code
    92125cb8835c selftests/vm/pkeys: fix alloc_random_pkey() to make it really, really random
    456554040e5a lib/math/rational.c: fix divide by zero
    787f4e7a7d4b mm/z3fold: use release_z3fold_page_locked() to release locked z3fold page
    0fe11b79c281 mm/z3fold: fix potential memory leak in z3fold_destroy_pool()
    555dffa4842b include/linux/huge_mm.h: remove extern keyword
    ebd6a295b580 hugetlb: remove prep_compound_huge_page cleanup
    2e16ad561143 mm/hugetlb: remove redundant check in preparing and destroying gigantic page
    0da83a815d33 mm/hugetlb: use helper huge_page_order and pages_per_huge_page
    31be4ea35c82 mm/huge_memory.c: don't discard hugepage if other processes are mapping it
    b65597377b7b mm/huge_memory.c: add missing read-only THP checking in transparent_hugepage_enabled()
    aa41f7a2a681 mm/huge_memory.c: remove dedicated macro HPAGE_CACHE_INDEX_MASK
    9b0b9edea1d3 mm/pmem: avoid inserting hugepage PTE entry with fsdax if hugepage support is disabled
    0885ea1d4759 vfio/pci: Handle concurrent vma faults
    363d85bfaec1 arm64: dts: marvell: armada-37xx: Fix reg for standard variant of UART
    347af865b6a2 serial: mvebu-uart: correctly calculate minimal possible baudrate
    9ad82f0412c0 serial: mvebu-uart: do not allow changing baudrate when uartclk is not available
    dd6d4e92e724 ALSA: firewire-lib: Fix 'amdtp_domain_start()' when no AMDTP_OUT_STREAM stream is found
    53fa3ba8085e powerpc/papr_scm: Make 'perf_stats' invisible if perf-stats unavailable
    04db493fc746 powerpc/64s: Fix copy-paste data exposure into newly created tasks
    ac08ba518c6c powerpc/papr_scm: Properly handle UUID types and API
    d3358c66ee56 powerpc: Offline CPU in stop_this_cpu()
    9443acbd251f serial: 8250: 8250_omap: Fix possible interrupt storm on K3 SoCs
    e0e3e0b7dabf serial: 8250: 8250_omap: Disable RX interrupt after DMA enable
    786461739ac4 selftests/ftrace: fix event-no-pid on 1-core machine
    57e49a0bc4b3 leds: ktd2692: Fix an error handling path
    53cb671592ef leds: as3645a: Fix error return code in as3645a_parse_node()
    f3bf888507f0 ASoC: fsl_spdif: Fix unexpected interrupt after suspend
    2938ffd56895 ASoC: Intel: sof_sdw: add SOF_RT715_DAI_ID_FIX for AlderLake
    5f2dfce8d8bc configfs: fix memleak in configfs_release_bin_file
    e30e636447fd ASoC: atmel-i2s: Fix usage of capture and playback at the same time
    af497961abef powerpc/powernv: Fix machine check reporting of async store errors
    f8d223f80ac6 extcon: max8997: Add missing modalias string
    e16fcc83748a extcon: sm5502: Drop invalid register write in sm5502_reg_data
    25c7efb3875a phy: ti: dm816x: Fix the error handling path in 'dm816x_usb_phy_probe()
    6398fc0e57ec phy: uniphier-pcie: Fix updating phy parameters
    a4b7c0af613f soundwire: stream: Fix test for DP prepare complete
    b0be06493e73 scsi: mpt3sas: Fix error return value in _scsih_expander_add()
    f51088868b16 habanalabs: Fix an error handling path in 'hl_pci_probe()'
    c183b55ed7e5 mtd: rawnand: marvell: add missing clk_disable_unprepare() on error in marvell_nfc_resume()
    f929d21af75d of: Fix truncation of memory sizes on 32-bit platforms
    db45ea876743 ASoC: cs42l42: Correct definition of CS42L42_ADC_PDN_MASK
    55bb225c0878 iio: prox: isl29501: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    49739675048d iio: light: vcnl4035: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    c850b52e47aa serial: 8250: Actually allow UPF_MAGIC_MULTIPLIER baud rates
    5db39ad3fa32 staging: mt7621-dts: fix pci address for PCI memory range
    c5cd4b74fd8a coresight: core: Fix use of uninitialized pointer
    58c0621c44a5 staging: rtl8712: fix memory leak in rtl871x_load_fw_cb
    bf5d6f697981 staging: rtl8712: fix error handling in r871xu_drv_init
    7bc3fa5db495 staging: gdm724x: check for overflow in gdm_lte_netif_rx()
    f93737061067 staging: gdm724x: check for buffer overflow in gdm_lte_multi_sdu_pkt()
    14106b90e147 ASoC: fsl_spdif: Fix error handler with pm_runtime_enable
    9cf11dca57a5 iio: light: vcnl4000: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8c85c0f8cbff iio: magn: rm3100: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    c923e9effe50 iio: adc: ti-ads8688: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    15634d6dced1 iio: adc: mxs-lradc: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    a6a1e347c7a0 iio: adc: hx711: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    2abfdd61324c iio: adc: at91-sama5d2: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    2abfa5294717 thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
    36f60700f966 eeprom: idt_89hpesx: Restore printing the unsupported fwnode name
    fc8ab0600172 eeprom: idt_89hpesx: Put fwnode in matching case during ->probe()
    c7188d19989b usb: dwc2: Don't reset the core after setting turnaround time
    8aa1cb46b72e usb: gadget: f_fs: Fix setting of device and driver data cross-references
    d4d3cd4c7699 ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'
    92a30a90d69a ASoC: rt5682-sdw: set regcache_cache_only false before reading RT5682_DEVICE_ID
    696cfb256794 ASoC: rt5682: fix getting the wrong device id when the suspend_stress_test
    8ef111db5e07 ASoC: rt715-sdw: use first_hw_init flag on resume
    36dc6957f70f ASoC: rt711-sdw: use first_hw_init flag on resume
    de77f9d92c3b ASoC: rt700-sdw: use first_hw_init flag on resume
    e1456cba8e36 ASoC: rt5682-sdw: use first_hw_init flag on resume
    16674ae3b237 ASoC: rt1308-sdw: use first_hw_init flag on resume
    dc1521641287 ASoC: max98373-sdw: use first_hw_init flag on resume
    45a3d00eafb7 iommu/dma: Fix IOVA reserve dma ranges
    ad736838155c selftests: splice: Adjust for handler fallback removal
    045c29902fbe s390: appldata depends on PROC_SYSCTL
    485b1c02b543 s390: enable HAVE_IOREMAP_PROT
    d65f69deac5c s390/irq: select HAVE_IRQ_EXIT_ON_IRQ_STACK
    d8fe62cb919c iommu/amd: Fix extended features logging
    bd95a3e159a0 visorbus: fix error return code in visorchipset_init()
    e5a3a3108f06 fsi/sbefifo: Fix reset timeout
    4a95eb0c800e fsi/sbefifo: Clean up correct FIFO when receiving reset request from SBE
    719c4db394ed fsi: occ: Don't accept response from un-initialized OCC
    af3d7f9e266b fsi: scom: Reset the FSI2PIB engine for any error
    446eed9c855e fsi: core: Fix return of error values on failures
    d22bef41017b mfd: rn5t618: Fix IRQ trigger by changing it to level mode
    9b8bfdbc7e61 mfd: mp2629: Select MFD_CORE to fix build error
    68f2f83f6fb6 scsi: iscsi: Flush block work before unblock
    b5371faa0667 scsi: FlashPoint: Rename si_flags field
    0b2f74111344 leds: lp50xx: Put fwnode in error case during ->probe()
    5f7bda9ba8d7 leds: lm3697: Don't spam logs when probe is deferred
    8fc7d4a3f039 leds: lm3692x: Put fwnode in any case during ->probe()
    c54ad49e2ff7 leds: lm36274: Put fwnode in error case during ->probe()
    1ed913317166 leds: lm3532: select regmap I2C API
    b504e279e502 leds: class: The -ENOTSUPP should never be seen by user space
    58279b341b94 tty: nozomi: Fix the error handling path of 'nozomi_card_init()'
    28c947b07263 firmware: stratix10-svc: Fix a resource leak in an error handling path
    1e1b9cd40095 char: pcmcia: error out if 'num_bytes_read' is greater than 4 in set_protocol()
    5a766253e305 staging: mmal-vchiq: Fix incorrect static vchiq_instance.
    cf05986cc4de mtd: rawnand: arasan: Ensure proper configuration for the asserted target
    2f8824f556a3 mtd: partitions: redboot: seek fis-index-block in the right node
    a16eae11f004 perf scripting python: Fix tuple_set_u64()
    201b975c1643 Input: hil_kbd - fix error return code in hil_dev_connect()
    000c70680d2f ASoC: rsnd: tidyup loop on rsnd_adg_clk_query()
    2e1d76c3b90f backlight: lm3630a_bl: Put fwnode in error case during ->probe()
    d4ebf352a7d7 ASoC: hisilicon: fix missing clk_disable_unprepare() on error in hi6210_i2s_startup()
    2541d78f7832 ASoC: rk3328: fix missing clk_disable_unprepare() on error in rk3328_platform_probe()
    246b4f1e2050 iio: potentiostat: lmp91000: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    71dbba0b9525 iio: cros_ec_sensors: Fix alignment of buffer in iio_push_to_buffers_with_timestamp()
    1fa3107759b7 iio: chemical: atlas: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    93a5538d5012 iio: light: tcs3472: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    daecb8c0a17c iio: light: tcs3414: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    293b8246a07e iio: light: isl29125: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    f960139a3c49 iio: magn: bmc150: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    e5e102f4b562 iio: magn: hmc5843: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    4613232e0b1f iio: prox: as3935: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    ab16be53b296 iio: prox: pulsed-light: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8e23dd6236de iio: prox: srf08: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    c61ac1f83b32 iio: humidity: am2315: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    8ea878287ccc iio: gyro: bmg160: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    718a67a90932 iio: adc: vf610: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    df5343bd59cd iio: adc: ti-ads1015: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    f0bc78df4a04 iio: accel: stk8ba50: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    cd62282a51cb iio: accel: stk8312: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    638ba5aa15ac iio: accel: mxc4005: Fix overread of data and alignment issue.
    0d220d40b3f3 iio: accel: kxcjk-1013: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    9eb5fb66b6f4 iio: accel: hid: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    4b362443dc21 iio: accel: bma220: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    3cca4db5f733 iio: accel: bma180: Fix buffer alignment in iio_push_to_buffers_with_timestamp()
    2edfba8a55b5 iio: adis16475: do not return ints in irq handlers
    92efd6396e4b iio: adis16400: do not return ints in irq handlers
    2e41116e6eb8 iio: adis_buffer: do not return ints in irq handlers
    67d88b7bf62d mwifiex: re-fix for unaligned accesses
    460bee90091d tty: nozomi: Fix a resource leak in an error handling function
    f5186bd17f3b serial: 8250_omap: fix a timeout loop condition
    5dcff72fe42a serial: fsl_lpuart: remove RTSCTS handling from get_mctrl()
    685d53abc918 serial: fsl_lpuart: don't modify arbitrary data on lpuart32
    728f23e53c65 rcu: Invoke rcu_spawn_core_kthreads() from rcu_spawn_gp_kthread()
    66111dfe22b1 ASoC: rt5682: Disable irq on shutdown
    8b195380cd07 staging: fbtft: Don't spam logs when probe is deferred
    7a42f3c30dfe staging: fbtft: Rectify GPIO handling
    d8c1504cf1a0 MIPS: Fix PKMAP with 32-bit MIPS huge page support
    a23ba98e91ff RDMA/core: Always release restrack object
    a938d4e8c699 RDMA/mlx5: Don't access NULL-cleared mpi pointer
    c6965316d684 net: tipc: fix FB_MTU eat two pages
    1148952dc660 net: sched: fix warning in tcindex_alloc_perfect_hash
    4476568069c9 net: lwtunnel: handle MTU calculation in forwading
    6939c39a4106 writeback: fix obtain a reference to a freeing memcg css
    4c3e839bfde5 clk: si5341: Update initialization magic
    55aaba36d718 clk: si5341: Check for input clock presence and PLL lock on startup
    42ac32d834aa clk: si5341: Avoid divide errors due to bogus register contents
    043637617d51 clk: si5341: Wait for DEVICE_READY on startup
    29746bd0f765 clk: qcom: clk-alpha-pll: fix CAL_L write in alpha_pll_fabia_prepare
    94221679ee05 clk: actions: Fix AHPPREDIV-H-AHB clock chain on Owl S500 SoC
    f3b6df5dfd72 clk: actions: Fix bisp_factor_table based clocks on Owl S500 SoC
    ced193bc0851 clk: actions: Fix SD clocks factor table on Owl S500 SoC
    12d2d6fd11c1 clk: actions: Fix UART clock dividers on Owl S500 SoC
    7d97522e6e35 Bluetooth: Fix handling of HCI_LE_Advertising_Set_Terminated event
    4f5fc3be2cca Bluetooth: Fix Set Extended (Scan Response) Data
    c5fedfcc2046 Bluetooth: Fix not sending Set Extended Scan Response
    a2dcad039e45 Bluetooth: mgmt: Fix slab-out-of-bounds in tlv_data_is_valid
    d28e780431b5 Revert "be2net: disable bh with spin_lock in be_process_mcc"
    342b06b600bf gve: Fix swapped vars when fetching max queues
    11044f8c2c9f RDMA/cma: Fix incorrect Packet Lifetime calculation
    fc2ea819b96e bpfilter: Specify the log level for the kmsg message
    4228c00e1408 net: dsa: sja1105: fix NULL pointer dereference in sja1105_reload_cbs()
    393d48b3dec0 e1000e: Check the PCIm state
    cebff3d9f74f ipv6: fix out-of-bound access in ip6_parse_tlv()
    9e753c47b905 net: atlantic: fix the macsec key length
    1c95d4d432c3 net: phy: mscc: fix macsec key length
    711a28d24d07 net: macsec: fix the length used to copy the key for offloading
    c764f2d899b2 RDMA/cma: Protect RMW with qp_mutex
    d52ceed84526 ibmvnic: free tx_pool if tso_pool alloc fails
    f25accc4fd4d ibmvnic: set ltb->buff to NULL after freeing
    3f85d2ca323f Revert "ibmvnic: remove duplicate napi_schedule call in open function"
    cad22e48cabe i40e: Fix missing rtnl locking when setting up pf switch
    d9a5d19706ea i40e: Fix autoneg disabling for non-10GBaseT links
    88819239e9fd i40e: Fix error handling in i40e_vsi_open
    aefa92774408 bpf: Do not change gso_size during bpf_skb_change_proto()
    0dac8b0ad016 can: j1939: j1939_sk_setsockopt(): prevent allocation of j1939 filter for optlen == 0
    2d58a38275d2 ipv6: exthdrs: do not blindly use init_net
    b559d003f03c net: bcmgenet: Fix attaching to PYH failed on RPi 4B
    514c96bf65ce mac80211: remove iwlwifi specific workaround NDPs of null_response
    1b3985aa53d0 drm/msm/dpu: Fix error return code in dpu_mdss_init()
    134a561aee50 drm/msm: Fix error return code in msm_drm_init()
    f97b9c4c0759 bpf: Fix null ptr deref with mixed tail calls and subprogs
    56c31bc9aabe ieee802154: hwsim: avoid possible crash in hwsim_del_edge_nl()
    71a345ede51a ieee802154: hwsim: Fix memory leak in hwsim_add_one
    4b44486b8bfd tc-testing: fix list handling
    997285646a9c net: ti: am65-cpsw-nuss: Fix crash when changing number of TX queues
    6610d5a73b6f net/ipv4: swap flow ports when validating source
    c3fcfc4e369b ip6_tunnel: fix GRE6 segmentation
    162e75687e90 vxlan: add missing rcu_read_lock() in neigh_reduce()
    6cd23b5f4017 rtw88: 8822c: fix lc calibration timing
    db2386fa4342 iwlwifi: increase PNVM load timeout
    78e6587585d8 xfrm: Fix xfrm offload fallback fail case
    5c8e5feceaf3 pkt_sched: sch_qfq: fix qfq_change_class() error path
    b2ce4ebdd9a8 netfilter: nf_tables_offload: check FLOW_DISSECTOR_KEY_BASIC in VLAN transfer logic
    581e37ad5c0a tls: prevent oversized sendfile() hangs by ignoring MSG_MORE
    e7c3ae47978f net: sched: add barrier to ensure correct ordering for lockless qdisc
    ca9b5ab7910c vrf: do not push non-ND strict packets with a source LLA through packet taps again
    e72d9e4b9807 net: ethernet: ezchip: fix error handling
    161f8b73da68 net: ethernet: ezchip: fix UAF in nps_enet_remove
    f026d82211a2 net: ethernet: aeroflex: fix UAF in greth_of_remove
    6a8c7c5c0773 mt76: mt7615: fix NULL pointer dereference in tx_prepare_skb()
    6987ee9bf0a2 mt76: fix possible NULL pointer dereference in mt76_tx
    e717f974ceed samples/bpf: Fix the error return code of xdp_redirect's main()
    79bf8f04cece samples/bpf: Fix Segmentation fault for xdp_redirect command
    fcd8d6371a46 RDMA/rtrs-srv: Set minimal max_send_wr and max_recv_wr
    a9355b201d16 bpf: Fix libelf endian handling in resolv_btfids
    607706027c89 xsk: Fix broken Tx ring validation
    cd7877a39f05 xsk: Fix missing validation for skb and unaligned mode
    89621945b698 selftests/bpf: Whitelist test_progs.h from .gitignore
    49c25a1a8dc5 RDMA/rxe: Fix qp reference counting for atomic ops
    58da10487a1e netfilter: nft_tproxy: restrict support to TCP and UDP transport protocols
    ed3d4988349e netfilter: nft_osf: check for TCP packet before further processing
    cf28cb51f01b netfilter: nft_exthdr: check for IPv6 packet before further processing
    8f6714f3c12b RDMA/mlx5: Don't add slave port to unaffiliated list
    a158ee32d4aa netlabel: Fix memory leak in netlbl_mgmt_add_common
    28e8df0c65a6 ath11k: send beacon template after vdev_start/restart during csa
    48b69f31de82 ath10k: Fix an error code in ath10k_add_interface()
    e0727a61b0aa ath11k: Fix an error handling path in ath11k_core_fetch_board_data_api_n()
    a54e9166e788 cw1200: Revert unnecessary patches that fix unreal use-after-free bugs
    30efdcaca32a brcmsmac: mac80211_if: Fix a resource leak in an error handling path
    5d452eafbd2e brcmfmac: Fix a double-free in brcmf_sdio_bus_reset
    5b8d0b0727f6 brcmfmac: correctly report average RSSI in station info
    db4de88d439e brcmfmac: fix setting of station info chains bitmask
    80ad538a87e2 ssb: Fix error return code in ssb_bus_scan()
    0147e6ccb818 wcn36xx: Move hal_buf allocation to devm_kmalloc in probe
    581098969c1a clk: imx8mq: remove SYS PLL 1/2 clock gates
    da8904c46569 ieee802154: hwsim: Fix possible memory leak in hwsim_subscribe_all_others
    7142f92412c1 wireless: carl9170: fix LEDS build errors & warnings
    ecb6797501cb ath10k: add missing error return code in ath10k_pci_probe()
    668c0663d6dd ath10k: go to path err_unsupported when chip id is not supported
    4654f1fc3019 tools/bpftool: Fix error return code in do_batch()
    1ccbb552e3d2 drm: qxl: ensure surf.data is ininitialized
    bdc16fe9df17 clk: vc5: fix output disabling when enabling a FOD
    43b7f1dec6c0 drm/vc4: hdmi: Fix error path of hpd-gpios
    756679a123bc drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
    87890e1113e6 RDMA/rxe: Fix failure during driver load
    c5db39c4dfda drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
    42800fcff3f9 RDMA/core: Sanitize WQ state received from the userspace
    c470dd34c682 net/sched: act_vlan: Fix modify to allow 0
    6a5691335550 xfrm: remove the fragment check for ipv6 beet mode
    9fddbe9495ad clk: tegra30: Use 300MHz for video decoder by default
    48bcd756aff6 ehea: fix error return code in ehea_restart_qps()
    6cbc167bc132 RDMA/rtrs-clt: Fix memory leak of not-freed sess->stats and stats->pcpu_stats
    6569ae1deb6c RDMA/rtrs-clt: Check if the queue_depth has changed during a reconnection
    8651ad0e2968 RDMA/rtrs-srv: Fix memory leak when having multiple sessions
    e7df73088443 RDMA/rtrs-srv: Fix memory leak of unfreed rtrs_srv_stats object
    f03d4c12965e RDMA/rtrs: Do not reset hb_missed_max after re-connection
    bd4df557aeef RDMA/rtrs-clt: Check state of the rtrs_clt_sess before reading its stats
    067b6631315d RDMA/srp: Fix a recently introduced memory leak
    116d5cdfacff mptcp: generate subflow hmac after mptcp_finish_join()
    284e741c4e2a mptcp: fix pr_debug in mptcp_token_new_connect
    eee0f7d399b6 drm/rockchip: cdn-dp: fix sign extension on an int multiply for a u64 result
    75db503c9cc7 drm/rockchip: lvds: Fix an error handling path
    59eb7193bef2 drm/rockchip: dsi: move all lane config except LCDC mux to bind()
    40492ebd29e1 drm/rockchip: cdn-dp-core: add missing clk_disable_unprepare() on error in cdn_dp_grf_write()
    ef61b0826c81 drm: rockchip: set alpha_en to 0 if it is not used
    7902ee2faefa net: ftgmac100: add missing error return code in ftgmac100_probe()
    28b3837b405f clk: meson: g12a: fix gp0 and hifi ranges
    27e9e0c46816 net: qrtr: ns: Fix error return code in qrtr_ns_init()
    40b701707ebf drm/vmwgfx: Fix cpu updates of coherent multisample surfaces
    a8e85ed08858 drm/vmwgfx: Mark a surface gpu-dirty after the SVGA3dCmdDXGenMips command
    8f2b15ec3bec pinctrl: renesas: r8a77990: JTAG pins do not have pull-down capabilities
    6f4718c13400 pinctrl: renesas: r8a7796: Add missing bias for PRESET# pin
    2d487941ee59 net: pch_gbe: Propagate error from devm_gpio_request_one()
    2f9f23c43a70 net: mvpp2: Put fwnode in error case during ->probe()
    b3fecbf60ebc video: fbdev: imxfb: Fix an error message
    1655266d91ed drm/ast: Fix missing conversions to managed API
    5885fce7b439 drm/amd/dc: Fix a missing check bug in dm_dp_mst_detect()
    0cd39c96574d drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
    45415d1f9929 drm/bridge/sii8620: fix dependency on extcon
    1de9425286f1 xfrm: xfrm_state_mtu should return at least 1280 for ipv6
    10f32b8c9eb8 mm/page_alloc: fix counting of managed_pages
    d7deea31ed6f mm: page_alloc: refactor setup_per_zone_lowmem_reserve()
    5458985533ba mm: memcg/slab: properly set up gfp flags for objcg pointer array
    8e4af3917bfc mm/shmem: fix shmem_swapin() race with swapoff
    a5dcdfe4cb4a swap: fix do_swap_page() race with swapoff
    29ae2c9c9ccc mm/debug_vm_pgtable: ensure THP availability via has_transparent_hugepage()
    7abf6e576354 mm/debug_vm_pgtable/basic: iterate over entire protection_map[]
    27634d63ca58 mm/debug_vm_pgtable/basic: add validation for dirtiness after write protect
    c872674da724 dax: fix ENOMEM handling in grab_mapping_entry()
    c015295b28d6 ocfs2: fix snprintf() checking
    512106ae2355 blk-mq: update hctx->dispatch_busy in case of real scheduler
    3e33b1329c61 cpufreq: Make cpufreq_online() call driver->offline() on errors
    cc0b1776fd1d ACPI: bgrt: Fix CFI violation
    3cbe01ac28a8 ACPI: Use DEVICE_ATTR_<RW|RO|WO> macros
    d3dd2fe2743f blk-wbt: make sure throttle is enabled properly
    1c2f21a8a0c2 blk-wbt: introduce a new disable state to prevent false positive by rwb_enabled()
    e0afab5181d0 ACPI: APEI: fix synchronous external aborts in user-mode
    f626452df805 extcon: extcon-max8997: Fix IRQ freeing at error path
    45b399e309f5 clocksource/drivers/timer-ti-dm: Save and restore timer TIOCP_CFG
    0317b728d8ae mark pstore-blk as broken
    296fbe2608d2 ACPI: sysfs: Fix a buffer overrun problem with description_show()
    ce47ae8961dd nvme-pci: look for StorageD3Enable on companion ACPI device instead
    3ffe41f25f21 block: avoid double io accounting for flush request
    17e77feaddd6 ACPI: PM / fan: Put fan device IDs into separate header file
    4dcb59d6a288 PM / devfreq: Add missing error code in devfreq_add_device()
    a61f8a2e45be media: video-mux: Skip dangling endpoints
    62c666805af4 media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
    6bfcb6178925 psi: Fix race between psi_trigger_create/destroy
    8d7debe74475 crypto: nx - Fix RCU warning in nx842_OF_upd_status
    c43082d284fa spi: spi-sun6i: Fix chipselect/clock bug
    f18f7a227697 lockdep/selftests: Fix selftests vs PROVE_RAW_LOCK_NESTING
    fca9e784a36c lockdep: Fix wait-type for empty stack
    ca47a4fa8996 sched/uclamp: Fix uclamp_tg_restrict()
    aea030cefc59 sched/rt: Fix Deadline utilization tracking during policy change
    c576472a051a sched/rt: Fix RT utilization tracking during policy change
    67f66d48bd10 x86/sev: Split up runtime #VC handler for correct state tracking
    2e1003f3ee77 x86/sev: Make sure IRQs are disabled while GHCB is active
    eefebcda89a8 btrfs: clear log tree recovering status if starting transaction fails
    aec3a574c632 regulator: hi655x: Fix pass wrong pointer to config.driver_data
    96275c8f6c58 KVM: arm64: Don't zero the cycle count register when PMCR_EL0.P is set
    e5154bf2177c perf/arm-cmn: Fix invalid pointer when access dtc object sharing the same IRQ number
    31dcfec19dd0 KVM: x86/mmu: Fix return value in tdp_mmu_map_handle_target_level()
    64d31137b1a6 KVM: nVMX: Don't clobber nested MMU's A/D status on EPTP switch
    bac38bd7c458 KVM: nVMX: Ensure 64-bit shift when checking VMFUNC bitmap
    b2c5af71ce4b KVM: nVMX: Sync all PGDs on nested transition with shadow paging
    5ac406b81c0d hwmon: (max31790) Fix fan speed reporting for fan7..12
    e02d52b7e9c5 hwmon: (max31722) Remove non-standard ACPI device IDs
    5c00e994978d hwmon: (lm70) Revert "hwmon: (lm70) Add support for ACPI"
    5cfc66b45450 hwmon: (lm70) Use device_get_match_data()
    c9f8416e43f8 media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
    921d2518dbba media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
    bb5e089df700 arm64/mm: Fix ttbr0 values stored in struct thread_info for software-pan
    8d6acfe80da1 arm64: consistently use reserved_pg_dir
    f1f30b3373df mmc: usdhi6rol0: fix error return code in usdhi6_probe()
    cd909ebb7315 crypto: sm2 - fix a memory leak in sm2
    d598b8b77b17 crypto: sm2 - remove unnecessary reset operations
    deef40c47e66 crypto: x86/curve25519 - fix cpu feature checking logic in mod_exit
    bc50c403859f crypto: omap-sham - Fix PM reference leak in omap sham ops
    615f2f5e7eb8 crypto: nitrox - fix unchecked variable in nitrox_register_interrupts
    5d4cb7c39436 regulator: fan53880: Fix vsel_mask setting for FAN53880_BUCK
    082d977b4688 media: siano: Fix out-of-bounds warnings in smscore_load_firmware_family2()
    52734fb99e69 m68k: atari: Fix ATARI_KBD_CORE kconfig unmet dependency warning
    b54a0f7926bd media: gspca/gl860: fix zero-length control requests
    0109910cbdd8 media: tc358743: Fix error return code in tc358743_probe_of()
    5091f2738d78 media: au0828: fix a NULL vs IS_ERR() check
    31157148a591 media: exynos4-is: Fix a use after free in isp_video_release
    2a91d7cc425c media: rkvdec: Fix .buf_prepare
    5a3ac10611d6 locking/lockdep: Reduce LOCKDEP dependency list
    1328decacd31 pata_ep93xx: fix deferred probing
    bab207d3524e media: rc: i2c: Fix an error message
    a9d02976e9ba crypto: ccp - Fix a resource leak in an error handling path
    c3285441b4cd crypto: sa2ul - Fix pm_runtime enable in sa_ul_probe()
    8ac033d9c451 crypto: sa2ul - Fix leaks on failure paths with sa_dma_init()
    c0ec4ac43638 x86/elf: Use _BITUL() macro in UAPI headers
    912d16a2d730 evm: fix writing <securityfs>/evm overflow
    403577f75d5c pata_octeon_cf: avoid WARN_ON() in ata_host_activate()
    5f9aaaaac816 kbuild: Fix objtool dependency for 'OBJECT_FILES_NON_STANDARD_<obj> := n'
    37481ad72d96 sched/uclamp: Fix locking around cpu_util_update_eff()
    6c2b3d565fca sched/uclamp: Fix wrong implementation of cpu.uclamp.min
    b49d231c67e8 media: I2C: change 'RST' to "RSET" to fix multiple build errors
    e7a376edb484 pata_rb532_cf: fix deferred probing
    9df79fd17b7f sata_highbank: fix deferred probing
    45d2d67833ae crypto: ux500 - Fix error return code in hash_hw_final()
    8c8c11b4df70 crypto: ixp4xx - update IV after requests
    f00454ac40f8 crypto: ixp4xx - dma_unmap the correct address
    2c3164f31a49 media: hantro: do a PM resume earlier
    6efd8921eb84 media: s5p_cec: decrement usage count if disabled
    e23dc4a3e8ff media: venus: Rework error fail recover logic
    08d0aa16a1f7 spi: Avoid undefined behaviour when counting unused native CSs
    db5a7e22c96c spi: Allow to have all native CSs in use along with GPIOs
    0c1d1517d616 writeback, cgroup: increment isw_nr_in_flight before grabbing an inode
    3bf8076a7b46 ia64: mca_drv: fix incorrect array size calculation
    fc12d8fbcf1a kthread_worker: fix return value when kthread_mod_delayed_work() races with kthread_cancel_delayed_work_sync()
    1208f10b4b8a block: fix discard request merge
    9d0634f6cbcb mailbox: qcom: Use PLATFORM_DEVID_AUTO to register platform device
    c35b484130cc cifs: fix missing spinlock around update to ses->status
    a72d660c0dcc HID: wacom: Correct base usage for capacitive ExpressKey status bits
    6bac00744b62 ACPI: tables: Add custom DSDT file as makefile prerequisite
    5c93dd7c5952 tpm_tis_spi: add missing SPI device ID entries
    d9b40ebd448e clocksource: Check per-CPU clock synchronization when marked unstable
    03a65c14ab47 clocksource: Retry clock read if long delays detected
    8ab9714fd84b ACPI: EC: trust DSDT GPE for certain HP laptop
    c406bb9ece6e cifs: improve fallocate emulation
    998d9fefdd47 PCI: hv: Add check for hyperv_initialized in init_hv_pci_drv()
    f5a90d44a1bc EDAC/Intel: Do not load EDAC driver when running as a guest
    950a7399056d nvmet-fc: do not check for invalid target port in nvmet_fc_handle_fcp_rqst()
    66e8848482f2 nvme-pci: fix var. type for increasing cq_head
    9dc2c2b94194 platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
    e2cf3b5cb29e platform/x86: asus-nb-wmi: Revert "add support for ASUS ROG Zephyrus G14 and G15"
    dff246672236 platform/x86: asus-nb-wmi: Revert "Drop duplicate DMI quirk structures"
    1da08a428ec3 block: fix race between adding/removing rq qos and normal IO
    555dba7c631a ACPI: resources: Add checks for ACPI IRQ override
    c79852298ce7 ACPI: bus: Call kobject_put() in acpi_init() error path
    a8c0057aee14 ACPICA: Fix memory leak caused by _CID repair function
    2ebbe3a62024 fs: dlm: fix memory leak when fenced
    eda609d8646f drivers: hv: Fix missing error code in vmbus_connect()
    019d04f91466 open: don't silently ignore unknown O-flags in openat2()
    d838dddf3f08 random32: Fix implicit truncation warning in prandom_seed_state()
    7425fe57d94f fs: dlm: cancel work sync othercon
    747b654e4069 blk-mq: clear stale request in tags->rq[] before freeing one request pool
    a3362ff0433b blk-mq: grab rq->refcount before calling ->fn in blk_mq_tagset_busy_iter
    f58625bf2ca9 block_dump: remove block_dump feature in mark_inode_dirty()
    ca8541015d25 ACPI: EC: Make more Asus laptops use ECDT _GPE
    b74b839a169b platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of TM800A550L tablets
    d4801889d61f platform/x86: touchscreen_dmi: Add an extra entry for the upside down Goodix touchscreen on Teclast X89 tablets
    bb3a3a6cebb3 Input: goodix - platform/x86: touchscreen_dmi - Move upside down quirks to touchscreen_dmi.c
    9e914f59cc3a lib: vsprintf: Fix handling of number field widths in vsscanf
    f8c3236890eb hv_utils: Fix passing zero to 'PTR_ERR' warning
    0f2f5293023f ACPI: processor idle: Fix up C-state latency if not ordered
    ae281fbbc4e5 EDAC/ti: Add missing MODULE_DEVICE_TABLE
    2c0285062dd7 HID: do not use down_interruptible() when unbinding devices
    51b7499cecc4 ACPI: video: use native backlight for GA401/GA502/GA503
    83653ace03e6 media: Fix Media Controller API config checks
    f0b8f5682db8 regulator: da9052: Ensure enough delay time for .set_voltage_time_sel
    5d9e3279f507 regulator: mt6358: Fix vdram2 .vsel_mask
    b58b54ef4978 KVM: s390: get rid of register asm usage
    963baea02ddd lockding/lockdep: Avoid to find wrong lock dep path in check_irq_usage()
    93cc59d8d0fa locking/lockdep: Fix the dep path printing for backwards BFS
    9c0835c69db8 btrfs: disable build on platforms having page size 256K
    ad71a9ad74b1 btrfs: don't clear page extent mapped if we're not invalidating the full page
    703b494a68f9 btrfs: sysfs: fix format string for some discard stats
    8d05e30c974f btrfs: abort transaction if we fail to update the delayed inode
    e0ffb169a35e btrfs: fix error handling in __btrfs_update_delayed_inode
    9b2829123727 KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors
    00b1a9f0e8d9 drivers/perf: fix the missed ida_simple_remove() in ddr_perf_probe()
    625ee7d26799 hwmon: (max31790) Fix pwmX_enable attributes
    c1eb091dbbbb hwmon: (max31790) Report correct current pwm duty cycles
    49623e4b7350 media: imx-csi: Skip first few frames from a BT.656 source
    72962620efcb media: siano: fix device register error path
    cc4ba5a3979a media: dvb_net: avoid speculation from net slot
    c34f3912a7d6 crypto: shash - avoid comparing pointers to exported functions under CFI
    0d201fee96b6 spi: meson-spicc: fix memory leak in meson_spicc_probe
    a0bbb5d378da spi: meson-spicc: fix a wrong goto jump for avoiding memory leak.
    ea7e1b581b2d mmc: via-sdmmc: add a check against NULL pointer dereference
    237999da7036 mmc: sdhci-sprd: use sdhci_sprd_writew
    b6cbe1fcf85e memstick: rtsx_usb_ms: fix UAF
    8c252a63032a media: dvd_usb: memory leak in cinergyt2_fe_attach
    e78a588b595d Makefile: fix GDB warning with CONFIG_RELR
    bce4838273e5 crypto: hisilicon/sec - fixup 3des minimum key size declaration
    74ef2418a76b media: st-hva: Fix potential NULL pointer dereferences
    617afcee2a5f media: bt8xx: Fix a missing check bug in bt878_probe
    1f9cff025d65 media: v4l2-core: Avoid the dangling pointer in v4l2_fh_release
    1d2838152e19 media: cedrus: Fix .buf_prepare
    cbfb77c2f965 media: hantro: Fix .buf_prepare
    6e08d3ab5ced media: em28xx: Fix possible memory leak of em28xx struct
    75c45a81889a media: bt878: do not schedule tasklet when it is not setup
    a61d119248ed media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}() to set xvclk on/off
    9fa8542a63b6 sched/fair: Fix ascii art by relpacing tabs
    d0214b841c1d arm64: perf: Convert snprintf to sysfs_emit
    addcb6bb584a crypto: qce: skcipher: Fix incorrect sg count for dma transfers
    d000c598db1d crypto: qat - remove unused macro in FW loader
    5daa889433c9 crypto: qat - check return code of qat_hal_rd_rel_reg()
    996234180748 media: imx: imx7_mipi_csis: Fix logging of only error event counters
    179d9c18ba83 media: pvrusb2: fix warning in pvr2_i2c_core_done
    893c243e52f2 media: hevc: Fix dependent slice segment flags
    a245f93ad067 media: cobalt: fix race condition in setting HPD
    4626df7f65b4 media: cpia2: fix memory leak in cpia2_usb_probe
    e717d6c291d1 media: sti: fix obj-$(config) targets
    93f80a0bbd5b crypto: nx - add missing MODULE_DEVICE_TABLE
    4e8c9510b787 hwrng: exynos - Fix runtime PM imbalance on error
    3c51d82d0b78 sched/core: Initialize the idle task with preemption disabled
    f8607f5ebe87 regulator: uniphier: Add missing MODULE_DEVICE_TABLE
    66f0f478ecea spi: omap-100k: Fix the length judgment problem
    8692603ff155 spi: spi-topcliff-pch: Fix potential double free in pch_spi_process_messages()
    cb42cf32ce2e spi: spi-loopback-test: Fix 'tx_buf' might be 'rx_buf'
    b980385a70ea media: exynos-gsc: fix pm_runtime_get_sync() usage count
    a8b1889cd618 media: exynos4-is: fix pm_runtime_get_sync() usage count
    29fd79b6280b media: sti/bdisp: fix pm_runtime_get_sync() usage count
    abdc89771018 media: sunxi: fix pm_runtime_get_sync() usage count
    d627fc298cda media: s5p-jpeg: fix pm_runtime_get_sync() usage count
    3c90c3fbdc96 media: mtk-vcodec: fix PM runtime get logic
    8318f7bc0e65 media: sh_vou: fix pm_runtime_get_sync() usage count
    64e291d697a0 media: am437x: fix pm_runtime_get_sync() usage count
    adf052c77963 media: s5p: fix pm_runtime_get_sync() usage count
    437ca06c7899 media: mdk-mdp: fix pm_runtime_get_sync() usage count
    ff7e4b94db72 media: marvel-ccic: fix some issues when getting pm_runtime
    ccf0a291f7e1 staging: media: rkvdec: fix pm_runtime_get_sync() usage count
    b2c4d9a33cc2 Add a reference to ucounts for each cred
    61a7a634a0c8 spi: Make of_register_spi_device also set the fwnode
    f2b240047644 thermal/cpufreq_cooling: Update offline CPUs per-cpu thermal_pressure
    4eab2e2e9889 fuse: reject internal errno
    bb7ee90ea524 fuse: check connected before queueing on fpq->io
    912e98505a63 fuse: ignore PG_workingset after stealing
    576b44c32669 fuse: Fix infinite loop in sget_fc()
    ae6ab39251f7 fuse: Fix crash if superblock of submount gets killed early
    91c2aa2c64b8 fuse: Fix crash in fuse_dentry_automount() error path
    53124265fca8 evm: Refuse EVM_ALLOW_METADATA_WRITES only if an HMAC key is loaded
    7b84c7d7e2c2 evm: Execute evm_inode_init_security() only when an HMAC key is loaded
    a7e18f57eddf loop: Fix missing discard support when using LOOP_CONFIGURE
    75395690e5e6 powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ipi()
    c556b938b3be seq_buf: Make trace_seq_putmem_hex() support data longer than 8
    0531e84bc8ac tracepoint: Add tracepoint_probe_register_may_exist() for BPF tracing
    2aedacfaf601 tracing/histograms: Fix parsing of "sym-offset" modifier
    998de999ba7d rsi: fix AP mode with WPA failure due to encrypted EAPOL
    71808ec5b982 rsi: Assign beacon rate settings to the correct rate_info descriptor field
    43189683fe5d ssb: sdio: Don't overwrite const buffer if block_write fails
    58940e88ba63 ath9k: Fix kernel NULL pointer dereference during ath_reset_internal()
    cc46d6d14fc7 serial_cs: remove wrong GLOBETROTTER.cis entry
    cf727d99ab63 serial_cs: Add Option International GSM-Ready 56K/ISDN modem
    23055da5618f serial: sh-sci: Stop dmaengine transfer in sci_stop_tx()
    17451bd0364f serial: mvebu-uart: fix calculation of clock divisor
    8c90ec9965ba iio: accel: bma180: Fix BMA25x bandwidth register values
    9efc775c28b4 iio: ltr501: ltr501_read_ps(): add missing endianness conversion
    c6c3ea1d9d4f iio: ltr501: ltr559: fix initialization of LTR501_ALS_CONTR
    fbadeba72e14 iio: ltr501: mark register holding upper 8 bits of ALS_DATA{0,1} and PS_DATA as volatile, too
    17c67f484893 iio: light: tcs3472: do not free unallocated IRQ
    6534a5e0c28c iio: frequency: adf4350: disable reg and clk on error in adf4350_probe()
    a6f7bf2652bb rtc: stm32: Fix unbalanced clk_disable_unprepare() on probe error path
    e92bd19246cc clk: agilex/stratix10: fix bypass representation
    3093214a6aa4 clk: agilex/stratix10: remove noc_clk
    308d01f5255b clk: agilex/stratix10/n5x: fix how the bypass_reg is handled
    e582a2f35245 f2fs: Prevent swap file in LFS mode
    36ae903607f6 s390: mm: Fix secure storage access exception handling
    38a2ba82e249 s390/cio: dont call css_wait_for_slow_path() inside a lock
    9aae145dc500 KVM: x86/mmu: Use MMU's role to detect CR4.SMEP value in nested NPT walk
    a9ac58f85f12 KVM: x86/mmu: Treat NX as used (not reserved) for all !TDP shadow MMUs
    30c44537cb10 KVM: PPC: Book3S HV: Workaround high stack usage with clang
    39d0dfab6c3e KVM: nVMX: Handle split-lock #AC exceptions that happen in L2
    7510c5cd0dc4 perf/smmuv3: Don't trample existing events with global filter
    9109e15709cd mm/gup: fix try_grab_compound_head() race with split_huge_page()
    9b0d1f4cb862 bus: mhi: Wait for M2 state during system resume
    cbcbfb048804 SUNRPC: Should wake up the privileged task firstly.
    30f56084980e SUNRPC: Fix the batch tasks count wraparound.
    c6d864601ef2 mac80211: remove iwlwifi specific workaround that broke sta NDP tx
    507925fff036 can: peak_pciefd: pucan_handle_status(): fix a potential starvation issue in TX path
    f79ea4755f6b can: j1939: j1939_sk_init(): set SOCK_RCU_FREE to call sk_destruct() after RCU is done
    22bfa94db2ef can: isotp: isotp_release(): omit unintended hrtimer restart on socket release
    af94ef8f0b08 can: gw: synchronize rcu operations before removing gw job entry
    b52e0cf0bfc1 can: bcm: delay release of struct bcm_op after synchronize_rcu()
    aa07327083b5 ext4: use ext4_grp_locked_error in mb_find_extent
    6903f99f1921 ext4: fix avefreec in find_group_orlov
    98cd580211bf ext4: remove check for zero nr_to_scan in ext4_es_scan()
    68a40ff916a6 ext4: correct the cache_nr in tracepoint ext4_es_shrink_exit
    f4e91a4e0d04 ext4: return error code when ext4_fill_flex_info() fails
    b368b0375e77 ext4: fix overflow in ext4_iomap_alloc()
    ea5466f1a777 ext4: fix kernel infoleak via ext4_extent_header
    076d9b06236a ext4: cleanup in-core orphan list if ext4_truncate() failed to get a transaction handle
    80d05ce58a0b btrfs: clear defrag status of a root if starting transaction fails
    6b00b1717f58 btrfs: compression: don't try to compress if we don't have enough pages
    34172f601a9c btrfs: send: fix invalid path for unlink operations after parent orphanization
    2fa929803530 ARM: dts: at91: sama5d4: fix pinctrl muxing
    ea45145e6cb4 ARM: dts: ux500: Fix LED probing
    b34aa5aaaa22 arm_pmu: Fix write counter incorrect in ARMv7 big-endian mode
    123c1b05b007 crypto: ccp - Annotate SEV Firmware file names
    834c47a387ae crypto: nx - Fix memcpy() over-reading in nonce
    b4c35e9e8061 Input: joydev - prevent use of not validated data in JSIOCSBTNMAP ioctl
    7b0393e6f6c8 iov_iter_fault_in_readable() should do nothing in xarray case
    b6df9e43d52d copy_page_to_iter(): fix ITER_DISCARD case
    d91638f70e81 selftests/lkdtm: Avoid needing explicit sub-shell
    1738bcf9e652 ntfs: fix validity check for file name attribute
    f794c839dff1 gfs2: Fix error handling in init_statfs
    3ae1c663bdeb gfs2: Fix underflow in gfs2_page_mkwrite
    b242ae99fac6 xhci: solve a double free problem while doing s4
    ff0f59d2d884 usb: typec: Add the missed altmode_id_remove() in typec_register_altmode()
    63d6029e6608 usb: dwc3: Fix debugfs creation flow
    022d22a311bb USB: cdc-acm: blacklist Heimann USB Appset device
    f9d9db593dcd usb: renesas-xhci: Fix handling of unknown ROM state
    3b545788505b usb: gadget: eem: fix echo command packet response issue
    c964c4682efb net: can: ems_usb: fix use-after-free in ems_usb_disconnect()
    a2ad0bddd0aa Input: usbtouchscreen - fix control-request directions
    23e8f468849d media: dvb-usb: fix wrong definition
    a6f433fd9e53 ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 830 G8 Notebook PC
    ba65dd6eb826 ALSA: hda/realtek: Apply LED fixup for HP Dragonfly G1, too
    13a05c7b434f ALSA: hda/realtek: Fix bass speaker DAC mapping for Asus UM431D
    37e179c0289f ALSA: hda/realtek: Improve fixup for HP Spectre x360 15-df0xxx
    ea824a31a3d2 ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook x360 830 G8
    659b440a8d04 ALSA: hda/realtek: Add another ALC236 variant support
    36bc25ec61b0 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 630 G8
    0535de167b38 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 445 G8
    2a13d43821b2 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 450 G8
    9127b2770365 ALSA: intel8x0: Fix breakage at ac97 clock measurement
    19418ed317ca ALSA: usb-audio: scarlett2: Fix wrong resume call
    5c4d51b438f3 ALSA: firewire-motu: fix stream format for MOTU 8pre FireWire
    313a5e869d04 ALSA: usb-audio: Fix OOB access at proc output
    cfd3c66ca73a ALSA: usb-audio: fix rate on Ozone Z90 USB headset
    ae9957b3ee16 Bluetooth: Remove spurious error message
    f5af19889ff0 Bluetooth: btqca: Don't modify firmware contents in-place
    3cdcbd1b8ce3 Bluetooth: hci_qca: fix potential GPF

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c48b0a7e2c52444a30038147e8247b786709edb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index e0dd954e88..1d5cd23bf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "35a59a3a48fe2513f6d77c1d6bff4ac14c11ecfa"
-SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
+SRCREV_machine ?= "8185fa4151aa2a85f022120557b4dd521a96593e"
+SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.49"
+LINUX_VERSION ?= "5.10.50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 6357e0174a..7ef9de45d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.49"
+LINUX_VERSION ?= "5.10.50"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bad4d499d5a292e25cc56d35133fb2248c34a272"
-SRCREV_machine ?= "81c2020f763444e82ac117dd1420a9d005f3f2d4"
-SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
+SRCREV_machine_qemuarm ?= "57b63241fa9ac731bc3ea6b0bb816a55196edd96"
+SRCREV_machine ?= "5b5bdf7d435d62fbab15eb66881dc43445f2778c"
+SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e236154e8f..1af77e7c4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "683a13656dad8cac542d5b2eac5f40f00d16010d"
-SRCREV_machine_qemuarm64 ?= "b799502f8b1f8804ec9e436c95129be76c548d37"
-SRCREV_machine_qemumips ?= "abdd096fd6503fdbdf7d5c81948a07d5a8fe8ea2"
-SRCREV_machine_qemuppc ?= "f6e6a1a81c0c3f11c5e42bde6d107c9f0ea45f16"
-SRCREV_machine_qemuriscv64 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
-SRCREV_machine_qemuriscv32 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
-SRCREV_machine_qemux86 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
-SRCREV_machine_qemux86-64 ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
-SRCREV_machine_qemumips64 ?= "01bad0d6e0916ce3eae77cbdfc64a141a4ae0ecd"
-SRCREV_machine ?= "8151429f787ee936c9a960e8db6f5909e81bae43"
-SRCREV_meta ?= "201aedddc2f13640a14cbe3ef229c8f9c78bde07"
+SRCREV_machine_qemuarm ?= "ac3dc3fddbea1db1d6cde9681b408f4d04541951"
+SRCREV_machine_qemuarm64 ?= "de7626dcc41204d22682fa5c424c4bddd587ee97"
+SRCREV_machine_qemumips ?= "ab2cde78ab5c1def7ab03d21c8986c794c6f69ce"
+SRCREV_machine_qemuppc ?= "d9a946c583b56ccdcf4ccd228d64129138e698e6"
+SRCREV_machine_qemuriscv64 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
+SRCREV_machine_qemuriscv32 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
+SRCREV_machine_qemux86 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
+SRCREV_machine_qemux86-64 ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
+SRCREV_machine_qemumips64 ?= "793a200e51c176cad7416603b995c2ec30d6ddde"
+SRCREV_machine ?= "3d78eb65b99aa6a6aaaf4de890b262f4dcb88623"
+SRCREV_meta ?= "44498529cd41b235e527c48e48272d9af64fdf7d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.49"
+LINUX_VERSION ?= "5.10.50"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

