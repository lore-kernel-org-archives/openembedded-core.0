Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D37B76086
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:09:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5729AB9017807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:09:10 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:09:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:30 -0400
Message-ID: <666c88e6ea37a4d1b9cf555b96e590f09f5108b9.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.14: update to v4.14.48
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
X-List-Received-Date: Thu, 07 Jun 2018 02:09:09 -0000
Content-Type: text/plain

Updating to the latest korg -stable for v4.14, which comprises the following
commits:

   2c6025ebc7fd Linux 4.14.48
   1dd9566d9542 powerpc/mm/slice: Fix hugepage allocation at hint address on 8xx
   399e039634a4 powerpc/mm/slice: Enhance for supporting PPC32
   b8b23e8926b3 powerpc/mm/slice: create header files dedicated to slices
   e14db4feb035 powerpc/mm/slice: Remove intermediate bitmap copy
   c95c5f419e57 drm/i915: Disable LVDS on Radiant P845
   72571f26757e drm/i915/lvds: Move acpi lid notification registration to registration phase
   ffedc7ade784 drm/psr: Fix missed entry in PSR setup time table.
   5890358c60e5 intel_th: Use correct device when freeing buffers
   792be048cf9c Revert "rt2800: use TXOP_BACKOFF for probe frames"
   a7027b7d698e mm/huge_memory.c: __split_huge_page() use atomic ClearPageDirty()
   4a1b66bcec03 IB/core: Fix error code for invalid GID entry
   bdf1daba5f62 hwtracing: stm: fix build error on some arches
   1f8c4ed2dba5 stm class: Use vmalloc for the master map
   a70f19b29560 scsi: scsi_transport_srp: Fix shost to rport translation
   8a6576219da8 MIPS: prctl: Disallow FRE without FR with PR_SET_FP_MODE requests
   f7a36d7ac838 MIPS: ptrace: Fix PTRACE_PEEKUSR requests for 64-bit FGRs
   ed5bd13bec35 MIPS: lantiq: gphy: Drop reboot/remove reset asserts
   6d67a723ef37 iio: adc: select buffer for at91-sama5d2_adc
   838f25e3d9f2 iio:kfifo_buf: check for uint overflow
   30ab9366f763 iio:buffer: make length types match kfifo types
   d30819abd1c4 iio: ad7793: implement IIO_CHAN_INFO_SAMP_FREQ
   a6f81fcb2c39 tcp: avoid integer overflows in tcp_rcv_space_adjust()
   96b086a7bfe5 kbuild: clang: disable unused variable warnings only when constant
   9b6eda5797b1 platform/chrome: cros_ec_lpc: remove redundant pointer request
   a81920c73eb0 ASoC: Intel: sst: remove redundant variable dma_dev_name
   bcc9c6f03201 rtlwifi: rtl8192cu: Remove variable self-assignment in rf.c
   8524af02d132 drm/amd/powerplay: Fix enum mismatch
   074e30a3fc09 dma-buf: remove redundant initialization of sg_table
   5a92c6e3e2f3 drm/i915: Always sanity check engine state upon idling
   151b144bc602 kbuild: clang: remove crufty HOSTCFLAGS
   bc342bc02954 cfg80211: further limit wiphy names to 64 bytes
   9808c97d3cb4 selinux: KASAN: slab-out-of-bounds in xattr_getsecurity
   c6a95f37d3a0 tracing: Make the snapshot trigger work with instances
   8441a0014a29 tracing: Fix crash when freeing instances with event triggers
   2be683020be4 Input: elan_i2c_smbus - fix corrupted stack
   9a85abc79483 Input: synaptics - add Lenovo 80 series ids to SMBus
   9c707c93e179 Input: synaptics - add Intertouch support on X1 Carbon 6th and X280
   af504c5a88b3 Input: synaptics - Lenovo Thinkpad X1 Carbon G5 (2017) with Elantech trackpoints should use RMI
   88859f6cc5c4 Input: synaptics - Lenovo Carbon X1 Gen5 (2017) devices should use RMI
   d1db300b8ffc xfs: detect agfl count corruption and reset agfl
   d9a59eac3fd6 xfs: convert XFS_AGFL_SIZE to a helper function
   54978daa9dc5 PCI: hv: Fix 2 hang issues in hv_compose_msi_msg()
   085fc1967b56 Revert "pinctrl: msm: Use dynamic GPIO numbering"
   4cbe6caa4c6c x86/MCE/AMD: Cache SMCA MISC block addresses
   5df3a1b9f87b x86/mce/AMD: Carve out SMCA get_block_address() code
   6bcf3b066c69 objtool: Fix "noreturn" detection for recursive sibling calls
   806a730c0b0b objtool: Detect RIP-relative switch table references, part 2
   afb5e5c8a125 objtool: Detect RIP-relative switch table references
   2c26d5784e71 objtool: Support GCC 8 switch tables
   1bea53df12c4 objtool: Support GCC 8's cold subfunctions
   b968dd7650c8 mm: fix the NULL mapping case in __isolate_lru_page()
   6a19487d5a93 fix io_destroy()/aio_complete() race
   57a3ca783596 Linux 4.14.47
   3e496be2038a Revert "vti4: Don't override MTU passed on link creation via IFLA_MTU"
   bf4367d790c5 Linux 4.14.46
   48aaff1bcde7 Revert "perf record: Fix crash in pipe mode"
   ec39812d2117 tools: sync up .h files with the repective arch and uapi .h files
   c0f1d9bfd913 perf tools: Add trace/beauty/generated/ into .gitignore
   2c2b15bb0e88 Linux 4.14.45
   cd95b6e70712 drm/vmwgfx: Set dmabuf_size when vmw_dmabuf_init is successful
   829484eb3e00 kdb: make "mdr" command repeat
   39958037723a pinctrl: mcp23s08: spi: Fix regmap debugfs entries
   bd36ea57d6d5 pinctrl: msm: Use dynamic GPIO numbering
   bd1a6e338c1b regulator: of: Add a missing 'of_node_put()' in an error handling path of 'of_regulator_match()'
   36016bab698b ARM: dts: porter: Fix HDMI output routing
   105479a0278c ARM: dts: imx7d: cl-som-imx7: fix pinctrl_enet
   0b7761ec49e4 i40e: Add delay after EMP reset for firmware to recover
   be5f9b150b64 regmap: Correct comparison in regmap_cached
   253aa8296a5e ARM: dts: at91: tse850: use the correct compatible for the eeprom
   ffc1f3ac180c drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen2
   e5b5d9be211e drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen3
   ce7da8b88f6a netlabel: If PF_INET6, check sk_buff ip header version
   b9cd90c15ea7 selftests/net: fixes psock_fanout eBPF test case
   6ce500756288 perf tests: Fix dwarf unwind for stripped binaries
   dac66c47df6c perf report: Fix memory corruption in --branch-history mode --branch-history
   fb872eb1131d perf tests: Use arch__compare_symbol_names to compare symbols
   da5329644ad6 perf report: Fix wrong jump arrow
   4489f688fc3b perf test: Fix test case inet_pton to accept inlines.
   39478b7590d0 x86/apic: Set up through-local-APIC mode on the boot CPU if 'noapic' specified
   4c27990631f1 drm/rockchip: Respect page offset for PRIME mmap calls
   8755c4061ea9 MIPS: Octeon: Fix logging messages with spurious periods after newlines
   f0cf2575cd47 dpaa_eth: fix pause capability advertisement logic
   80300e879f9e pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for SSI pins group
   46d8696c613b rcu: Call touch_nmi_watchdog() while printing stall warnings
   162af93fa251 net: stmmac: call correct function in stmmac_mac_config_rx_queues_routing()
   4a856adf2823 audit: return on memory error to avoid null pointer dereference
   a548ba4de32e PCMCIA / PM: Avoid noirq suspend aborts during suspend-to-idle
   7d5ab9bf4f34 ARM: dts: bcm283x: Fix pin function of JTAG pins
   c10dc67e720b ARM: dts: bcm283x: Fix probing of bcm2835-i2s
   13b520688d2c power: supply: ltc2941-battery-gauge: Fix temperature units
   72662ff1cf85 sh_eth: fix TSU init on SH7734/R8A7740
   83e698e4684a ixgbe: prevent ptp_rx_hang from running when in FILTER_ALL mode
   504583768092 udf: Provide saner default for invalid uid / gid
   cb808972d770 PCI: Add function 1 DMA alias quirk for Marvell 88SE9220
   5197a9786fee dpaa_eth: fix SG mapping
   602234ea4466 cpufreq: Reorder cpufreq_online() error code path
   8a6be5403774 net: stmmac: ensure that the MSS desc is the last desc to set the own bit
   a3d4c34cdea9 net: stmmac: ensure that the device has released ownership before reading data
   957094fcc06f drm/amdgpu: adjust timeout for ib_ring_tests(v2)
   230d616f58a9 drm/amdgpu: disable GFX ring and disable PQ wptr in hw_fini
   de9054cdc8d0 ARM: dts: dra71-evm: Correct evm_sd regulator max voltage
   ee6f703020ab drm: omapdrm: dss: Move initialization code from component bind to probe
   909474cd384c dmaengine: qcom: bam_dma: get num-channels and num-ees from dt
   7efeaf6d5193 vfio-ccw: fence off transport mode
   fe2fc07d2a31 pinctrl: artpec6: dt: add missing pin group uart5nocts
   72678f7a2922 pinctrl: devicetree: Fix dt_to_map_one_config handling of hogs
   39c655c5edfe hwrng: stm32 - add reset during probe
   259cdaff0e91 watchdog: asm9260_wdt: fix error handling in asm9260_wdt_probe()
   87337cb5663c enic: enable rq before updating rq descriptors
   b3b26307208e dmaengine: rcar-dmac: Check the done lists in rcar_dmac_chan_get_residue()
   e41de468a6f4 dmaengine: pl330: fix a race condition in case of threaded irqs
   a64948842d00 block: null_blk: fix 'Invalid parameters' when loading module
   f0078d2068b2 tools: hv: fix compiler warnings about major/target_fname
   f85634b7b6d0 drm/bridge: sii902x: Retry status read after DDI I2C
   3b64e1cf6b92 phy: qcom-qmp: Fix phy pipe clock gating
   10626a0c2027 ALSA: vmaster: Propagate slave error
   b1ebc21c146b phy: rockchip-emmc: retry calpad busy trimming
   1fadfed83913 x86/devicetree: Fix device IRQ settings in DT
   5e54596b33f6 x86/devicetree: Initialize device tree before using it
   c78e4a47bc4d gfs2: Fix fallocate chunk size
   c1dab7872b32 soc: qcom: wcnss_ctrl: Fix increment in NV upload
   0a3b66b55a95 arm64: dts: qcom: Fix SPI5 config on MSM8996
   b9e852513fca perf/x86/intel: Fix event update for auto-reload
   359769ca6d16 perf/x86/intel: Fix large period handling on Broadwell CPUs
   ecaa7bd342ad efi/arm*: Only register page tables when they exist
   e6e5de32470b cdrom: do not call check_disk_change() inside cdrom_open()
   017f2ee20675 perf/x86/intel: Properly save/restore the PMU state in the NMI handler
   8f8ebc0ba07c hwmon: (pmbus/adm1275) Accept negative page register values
   afcbcb432e84 hwmon: (pmbus/max8688) Accept negative page register values
   127b06ef520d drm/panel: simple: Fix the bus format for the Ontat panel
   ede5dd7822c6 perf/core: Fix perf_output_read_group()
   8ba9b0300c18 max17042: propagate of_node to power supply device
   ed6244e8b280 perf/core: Fix installing cgroup events on CPU
   82e93a83598b f2fs: fix to check extent cache in f2fs_drop_extent_tree
   fc8cf0e7aa37 f2fs: fix to clear CP_TRIMMED_FLAG
   393e472db4c8 f2fs: fix to set KEEP_SIZE bit in f2fs_zero_range
   d71b8b0d37da cxl: Check if PSL data-cache is available before issue flush request
   bf3a501c1dc0 powerpc/powernv/npu: Fix deadlock in mmio_invalidate()
   dc81e7182747 powerpc: Add missing prototype for arch_irq_work_raise()
   903c66e35fb7 drm/meson: Fix an un-handled error path in 'meson_drv_bind_master()'
   b4d7f0dae8c1 drm/meson: Fix some error handling paths in 'meson_drv_bind_master()'
   6eaf0dd1d9d5 ipmi_ssif: Fix kernel panic at msg_done_handler
   b5c7dedc8426 watchdog: aspeed: Fix translation of reset mode to ctrl register
   e2906fc86978 watchdog: dw: RMW the control register
   e2b3fa0ce98f PCI: Restore config space on runtime resume despite being unbound
   12c663e4f8e4 MIPS: ath79: Fix AR724X_PLL_REG_PCIE_CONFIG offset
   2a0bc4ad7c63 net/smc: pay attention to MAX_ORDER for CQ entries
   289e6fa33b0b spi: bcm-qspi: fIX some error handling paths
   1fae5e92788c regulator: gpio: Fix some error handling paths in 'gpio_regulator_probe()'
   9fe2e97e6f2d coresight: Use %px to print pcsr instead of %p
   12b29e1cfe6a drm/amdkfd: add missing include of mm.h
   739c8e70889a IB/core: Honor port_num while resolving GID for IB link layer
   7166fb174758 perf stat: Fix core dump when flag T is used
   8cde08971b41 perf top: Fix top.call-graph config option reading
   25b69a422b59 KVM: lapic: stop advertising DIRECTED_EOI when in-kernel IOAPIC is in use
   982f8f14e704 i2c: mv64xxx: Apply errata delay only in standard mode
   8d1b1e7902af cxgb4: Fix queue free path of ULD drivers
   1d1646c408f6 ACPICA: acpi: acpica: fix acpi operand cache leak in nseval.c
   c827ed01821d ACPICA: Fix memory leak on unusual memory leak
   bf9b263b3e75 ACPICA: Events: add a return on failure from acpi_hw_register_read
   601ae35b3f19 dt-bindings: add device tree binding for Allwinner H6 main CCU
   35a4f782b521 remoteproc: imx_rproc: Fix an error handling path in 'imx_rproc_probe()'
   4a092479bb4f bcache: quit dc->writeback_thread when BCACHE_DEV_DETACHING is set
   590e13a68177 zorro: Set up z->dev.dma_mask for the DMA API
   5e8f4ec7899b IB/mlx5: Set the default active rate and width to QDR and 4X
   4a8b1c46af58 cpufreq: cppc_cpufreq: Fix cppc_cpufreq_init() failure path
   f69b52965de0 iommu/mediatek: Fix protect memory setting
   8c8f0b1f597d drm/vmwgfx: Unpin the screen object backup buffer when not used
   791a1ef7df36 ext4: don't complain about incorrect features when probing
   1891e0bb60b4 arm: dts: socfpga: fix GIC PPI warning
   b5fb65c559ec virtio-net: Fix operstate for virtio when no VIRTIO_NET_F_STATUS
   a54e06d490a1 watchdog: aspeed: Allow configuring for alternate boot
   cd2399b49de4 ima: Fallback to the builtin hash algorithm
   bc72e4fcc12a ima: Fix Kconfig to select TPM 2.0 CRB interface
   d7b13824c390 cxgb4: Setup FW queues before registering netdev
   aa5a781f59fb ath9k: fix crash in spectral scan
   085ec7d554c1 nvme-pci: disable APST for Samsung NVMe SSD 960 EVO + ASUS PRIME Z370-A
   7e5487b3990d ath10k: Fix kernel panic while using worker (ath10k_sta_rc_update_wk)
   5db7e1bb6a13 watchdog: davinci_wdt: fix error handling in davinci_wdt_probe()
   fc7bcbb94027 net/mlx5: Protect from command bit overflow
   d018d551e7b2 selftests: Print the test we're running to /dev/kmsg
   faace30e6e6a tools/thermal: tmon: fix for segfault
   b652092f8e99 rsi: fix kernel panic observed on 64bit machine
   31dbd9cfcb23 powerpc/perf: Fix kernel address leak via sampling registers
   6a0a9f0ab8a9 powerpc/perf: Prevent kernel address leak to userspace via BHRB buffer
   68a38cedff76 hwmon: (nct6775) Fix writing pwmX_mode
   dbce9e41161c parisc/pci: Switch LBA PCI bus from Hard Fail to Soft Fail mode
   f37519543460 iwlwifi: mvm: check if mac80211_queue is valid in iwl_mvm_disable_txq
   6a020bb3c620 m68k: set dma and coherent masks for platform FEC ethernets
   80fceaf3f16a intel_th: Use correct method of finding hub
   1366b31d1829 iommu/amd: Take into account that alloc_dev_data() may return NULL
   6bc2bf6023dd ath10k: advertize beacon_int_min_gcd
   9c222c497ba2 ieee802154: ca8210: fix uninitialised data read
   c3a2a8782059 powerpc/mpic: Check if cpu_possible() in mpic_physmask()
   fc2de796926b ACPI: acpi_pad: Fix memory leak in power saving threads
   d023498fef35 drivers: macintosh: rack-meter: really fix bogus memsets
   8effa2182d02 xen/acpi: off by one in read_acpi_id()
   637b9b187f4e rxrpc: Don't treat call aborts as conn aborts
   4a9fabcd3440 rxrpc: Fix Tx ring annotation after initial Tx failure
   204bfcda8244 btrfs: qgroup: Fix root item corruption when multiple same source snapshots are created with quota enabled
   de00d5729482 btrfs: fix lockdep splat in btrfs_alloc_subvolume_writers
   92efba91a792 Btrfs: fix copy_items() return value when logging an inode
   d7255626a082 btrfs: tests/qgroup: Fix wrong tree backref level
   27a913cc9177 powerpc/64s: sreset panic if there is no debugger or crash dump handlers
   305f25c1ed53 net: bgmac: Correctly annotate register space
   435290f7a40a net: bgmac: Fix endian access in bgmac_dma_tx_ring_free()
   4a6cd791d6c1 sparc64: Make atomic_xchg() an inline function rather than a macro.
   22f1bde5d1bf fscache: Fix hanging wait on page discarded by writeback
   6d03ff166926 lan78xx: Connect phy early
   80b8f3da4912 KVM: VMX: raise internal error for exception during invalid protected mode state
   fd97bbca67fc x86/mm: Fix bogus warning during EFI bootup, use boot_cpu_has() instead of this_cpu_has() in build_cr3_noflush()
   3aeaeecda057 sched/rt: Fix rq->clock_update_flags < RQCF_ACT_SKIP warning
   be6a5ad51a53 powerpc/64s/idle: Fix restore of AMOR on POWER9 after deep sleep
   839c27f71376 ocfs2/dlm: don't handle migrate lockres if already in shutdown
   9ebe297713af IB/rxe: Fix for oops in rxe_register_device on ppc64le arch
   370b3353f4f8 btrfs: Fix possible softlock on single core machines
   acfd8e886566 Btrfs: fix NULL pointer dereference in log_dir_items
   afef64b10877 Btrfs: bail out on error during replay_dir_deletes
   5ade3c9618f6 mm: thp: fix potential clearing to referenced flag in page_idle_clear_pte_refs_one()
   8d700626fb57 mm: fix races between address_space dereference and free in page_evicatable
   763111d9f337 mm/ksm: fix interaction with THP
   378a1e49f9d1 ibmvnic: Zero used TX descriptor counter on reset
   d04e5e72dfe9 dp83640: Ensure against premature access to PHY registers after reset
   4be06bc0916d perf clang: Add support for recent clang versions
   ee7c28b280b8 perf tools: Fix perf builds with clang support
   6689a4c7b9ed powerpc/fscr: Enable interrupts earlier before calling get_user()
   96fdc64d8eda cpufreq: CPPC: Initialize shared perf capabilities of CPUs
   8bff7ca99fda Force log to disk before reading the AGF during a fstrim
   28143fe3e3e2 sr: get/drop reference to device in revalidate and check_events
   3a0de65acdd9 z3fold: fix memory leak
   2ab7738102ad swap: divide-by-zero when zero length swap file on ssd
   9c9844d9c9d0 fs/proc/proc_sysctl.c: fix potential page fault while unregistering sysctl table
   59bdc587231c x86/mm: Do not forbid _PAGE_RW before init for __ro_after_init
   c1af6891982e x86/pgtable: Don't set huge PUD/PMD on non-leaf entries
   c527ab91f021 Btrfs: fix loss of prealloc extents past i_size after fsync log replay
   f2924e32dcf2 Btrfs: clean up resources during umount after trans is aborted
   1908ca222b36 nvme: don't send keep-alives to the discovery controller
   145b7e06de33 firmware: dmi_scan: Fix UUID length safety check
   d9179b4aa407 sh: fix debug trap failure to process signals before return to user
   4ee9130f6423 net: mvneta: fix enable of all initialized RXQs
   206199412bae vlan: Fix vlan insertion for packets without ethernet header
   34a9a036350f net: Fix untag for vlan packets without ethernet header
   235ca6a0330d qede: Do not drop rx-checksum invalidated packets.
   78c986bf85b7 hv_netvsc: enable multicast if necessary
   28bbb0d963e0 mm/kmemleak.c: wait for scan completion before disabling free
   08e9dbd5184e mm/vmstat.c: fix vmstat_update() preemption BUG
   d2a5d00dcd85 mm/page_owner: fix recursion bug after changing skip entries
   da9ec481d66d mm, slab: memcg_link the SLAB's kmem_cache
   0bbd8e2593ad qede: Fix barrier usage after tx doorbell write.
   38a85f8214e2 builddeb: Fix header package regarding dtc source links
   5b5f4fd97d8f llc: properly handle dev_queue_xmit() return value
   25801736ca48 x86/alternatives: Fixup alternative_call_2
   06956ca1aab3 perf/x86/intel: Fix linear IP of PEBS real_ip on Haswell and later CPUs
   5b3b9ce272a6 net/mlx5: Make eswitch support to depend on switchdev
   07af604f00a5 net: dsa: mt7530: fix module autoloading for OF platform drivers
   77c18f7ea417 bonding: fix the err path for dev hwaddr sync in bond_enslave
   6da5c98d65f0 net: qmi_wwan: add BroadMobi BM806U 2020:2033
   e78be20d1122 lan78xx: Set ASD in MAC_CR when EEE is enabled.
   373304e44fa9 ARM: 8748/1: mm: Define vdso_start, vdso_end as array
   cbecd7187cdf batman-adv: fix packet loss for broadcasted DHCP packets to a server
   110a7c19d9d1 batman-adv: fix multicast-via-unicast transmission with AP isolation
   bbeb1a42dc58 drm/amdkfd: Fix scratch memory with HWS enabled
   629b3a66d5ca selftests: ftrace: Add a testcase for probepoint
   04905c21ad69 selftests: ftrace: Add a testcase for string type with kprobe_event
   f7ed525fcb56 selftests: ftrace: Add probe event argument syntax testcase
   58be6253b003 xfrm: Fix transport mode skb control buffer usage.
   49f4a8c52eeb mm, thp: do not cause memcg oom for thp
   6ca473201d70 mm/mempolicy.c: avoid use uninitialized preferred_node
   5498a2b5795f drm/ast: Fixed 1280x800 Display Issue
   c269eb77dc22 net: dsa: Fix functional dsa-loop dependency on FIXED_PHY
   bf922554682b net/sched: fix idr leak in the error path of tcf_skbmod_init()
   91314c273170 net/sched: fix idr leak in the error path of __tcf_ipt_init()
   01a80839635d net/sched: fix idr leak in the error path of tcp_pedit_init()
   97689fea3c80 net/sched: fix idr leak in the error path of tcf_act_police_init()
   154040a5a869 net/sched: fix idr leak in the error path of tcf_simp_init()
   29e36c3099fc net/sched: fix idr leak on the error path of tcf_bpf_init()
   f8d93c59c78c RDMA/qedr: Fix QP state initialization race
   8ed753eee9bd RDMA/qedr: Fix rc initialization on CNQ allocation failure
   90b87707f0f7 RDMA/qedr: fix QP's ack timeout configuration
   7245e2d1790b RDMA/ucma: Correct option size check using optlen
   405544d5f864 kbuild: make scripts/adjust_autoksyms.sh robust against timestamp races
   0839b0ce6eb6 brcmfmac: Fix check for ISO3166 code
   4ff78587dea6 perf/cgroup: Fix child event counting bug
   92ab37923634 drm/tegra: Shutdown on driver unbind
   3a297d091edb iwlwifi: mvm: fix array out of bounds reference
   7867e6d82fc9 iwlwifi: mvm: make sure internal station has a valid id
   1001e8ec25db iwlwifi: mvm: clear tx queue id when unreserving aggregation queue
   4eaa2618051a iwlwifi: mvm: Increase session protection time after CS
   b57f0fe6e38b vti6: Fix dev->max_mtu setting
   5815901c29c2 vti4: Don't override MTU passed on link creation via IFLA_MTU
   34b6ba622ac4 ip_tunnel: Clamp MTU to bounds on new link
   e675b292c282 vti4: Don't count header length twice on tunnel setup
   87e07eff2772 batman-adv: Fix skbuff rcsum on packet reroute
   f31f64b2d253 net/sched: fix NULL dereference in the error path of tcf_sample_init()
   6b4a3d4e63f1 batman-adv: fix header size check in batadv_dbg_arp()
   99ba9a972870 vlan: Fix out of order vlan headers with reorder header off
   01a68a265ef5 net: Fix vlan untag for bridge and vlan_dev with reorder_hdr off
   000fe789aa76 iwlwifi: mvm: fix error checking for multi/broadcast sta
   ac2b8f5e361f iwlwifi: mvm: Correctly set IGTK for AP
   85e5ae55652e iwlwifi: mvm: set the correct tid when we flush the MCAST sta
   404cbeb36ef7 xfrm: fix rcu_read_unlock usage in xfrm_local_error
   942138f356aa drm/nouveau/bl: fix backlight regression
   872398068503 drm/imx: move arming of the vblank event to atomic_flush
   418c85ea458a gpu: ipu-v3: prg: avoid possible array underflow
   05c401183c2f KVM: arm/arm64: vgic: Add missing irq_lock to vgic_mmio_read_pending
   6ef5b2e5241a sunvnet: does not support GSO for sctp
   8387fbac8e18 ipv4: lock mtu in fnhe when received PMTU < net.ipv4.route.min_pmtu
   7c84e5e9c62c workqueue: use put_device() instead of kfree()
   845c2de95786 bnxt_en: Check valid VNIC ID in bnxt_hwrm_vnic_set_tpa().
   27eebf0800cf can: m_can: select pinctrl state in each suspend/resume function
   27fe367cdde0 can: m_can: change comparison to bitshift when dealing with a mask
   533f5f847dfd netfilter: ebtables: fix erroneous reject of last rule
   2299285fb181 dmaengine: mv_xor_v2: Fix clock resource by adding a register clock
   e2d9442dfe84 lib/test_kmod.c: fix limit check on number of test devices created
   21ccc62ec725 selftests/vm/run_vmtests: adjust hugetlb size according to nr_cpus
   bad682e26d6a arm64: Relax ARM_SMCCC_ARCH_WORKAROUND_1 discovery
   341029c2024b ARM: davinci: fix the GPIO lookup for omapl138-hawk
   b7f1129a2c77 hv_netvsc: fix locking during VF setup
   b37bc05f44c6 hv_netvsc: fix locking for rx_mode
   9241c4f47205 hv_netvsc: fix filter flags
   e7f2b054916f xen: xenbus: use put_device() instead of kfree()
   9238d1fa3ee6 xen-blkfront: move negotiate_mq to cover all cases of new VBDs
   b2709f786741 cxgb4: do not set needs_free_netdev for mgmt dev's
   ba5b9b64e883 IB/core: Fix possible crash to access NULL netdev
   7ae100c41393 net: smsc911x: Fix unload crash when link is up
   a2b2d6ae5a3f net: qcom/emac: Use proper free methods during TX
   c6ce72d59cab qed: Free RoCE ILT Memory on rmmod qedr
   7538ab34136d fsl/fman: avoid sleeping in atomic context while adding an address
   ccf92117d49d fbdev: Fixing arbitrary kernel leak in case FBIOGETCMAP_SPARC in sbusfb_ioctl_helper().
   175e365a6662 IB/mlx5: Fix an error code in __mlx5_ib_modify_qp()
   5759427a0ca8 IB/mlx4: Include GID type when deleting GIDs from HW table under RoCE
   9636bbd409ba IB/mlx4: Fix corruption of RoCEv2 IPv4 GIDs
   7b10604ddf51 RDMA/qedr: Fix iWARP write and send with immediate
   40fe662649be RDMA/qedr: Fix kernel panic when running fio over NFSoRDMA
   87bcb00aa934 ia64/err-inject: Use get_user_pages_fast()
   d98ba4f4567d e1000e: allocate ring descriptors with dma_zalloc_coherent
   d1355ae4c345 e1000e: Fix check_for_link return value with autoneg off
   f766148e47d7 perf record: Fix crash in pipe mode
   8997115bf791 ARM: dts: rockchip: Add missing #sound-dai-cells on rk3288
   a0cc3c18d34c hv_netvsc: propagate rx filters to VF
   ed85935eeafb hv_netvsc: filter multicast/broadcast
   c039c53d1952 hv_netvsc: use napi_schedule_irqoff
   5f8156fd34cf batman-adv: Fix multicast packet loss with a single WANT_ALL_IPV4/6 flag
   73ecd80bca2b watchdog: sbsa: use 32-bit read for WCV
   49995a2931bb watchdog: f71808e_wdt: Fix magic close handling
   266675ab52db rds: Incorrect reference counting in TCP socket creation
   2b6e7f2ff81a iwlwifi: mvm: Correctly set the tid for mcast queue
   3f2eb4ded1ec iwlwifi: mvm: Direct multicast frames to the correct station
   ef3dfb138159 iwlwifi: mvm: fix "failed to remove key" message
   3a0bbca21ca5 iwlwifi: avoid collecting firmware dump if not loaded
   233d80617248 iwlwifi: mvm: fix assert 0x2B00 on older FWs
   6f970847f0e9 iwlwifi: mvm: Fix channel switch for count 0 and 1
   d6bcdf0b14d8 iwlwifi: mvm: fix TX of CCMP 256
   d9ed3aed6d83 net: ethtool: don't ignore return from driver get_fecparam method
   f03cd5862f55 selftests/powerpc: Skip the subpage_prot tests if the syscall is unavailable
   2b103dee283f nvme: pci: pass max vectors as num_possible_cpus() to pci_alloc_irq_vectors
   d68e66060488 nvme-pci: Fix EEH failure on ppc
   3c84b5aaf7a5 block: display the correct diskname for bio
   07d3fb191b5a ceph: fix potential memory leak in init_caches()
   010f5ccbf4c4 Btrfs: fix log replay failure after linking special file and fsync
   9925eea3225e Btrfs: send, fix issuing write op when processing hole in no data mode
   b114296692b0 btrfs: use kvzalloc to allocate btrfs_fs_info
   acb162b9cdb6 drm/sun4i: Fix dclk_set_phase
   cd2dee1ea6d5 arm64: dts: rockchip: Fix rk3399-gru-* s2r (pinctrl hogs, wifi reset)
   5877f41cf8c8 xfrm: Fix ESN sequence number handling for IPsec GSO packets.
   30310d407715 drm/amd/amdgpu: Correct VRAM width for APUs with GMC9
   5b71573794b0 xen/pirq: fix error path cleanup when binding MSIs
   62ee80d3b45b RDMA/bnxt_re: Fix the ib_reg failure cleanup
   2bce0d98b9d9 RDMA/bnxt_re: Fix incorrect DB offset calculation
   466199b440d9 RDMA/bnxt_re: Unconditionly fence non wire memory operations
   b73bc820c4d1 IB/mlx: Set slid to zero in Ethernet completion struct
   2a71d94e4f6b ipvs: remove IPS_NAT_MASK check to fix passive FTP
   738310e1dbc9 ARC: setup cpu possible mask according to possible-cpus dts property
   f7f78191c910 ARC: mcip: update MCIP debug mask when the new cpu came online
   50de7f4347cf ARC: mcip: halt GFRC counter when ARC cores halt
   e44fe4d2a81b spectrum: Reference count VLAN entries
   5a8392f2dc13 mlxsw: spectrum: Treat IPv6 unregistered multicast as broadcast
   47a8c89258e5 mlxsw: core: Fix flex keys scratchpad offset conflict
   953a64ca3353 net/smc: use link_id of server in confirm link reply
   e0a5a0f4749f nvmet: fix PSDT field check in command format
   c6885fb45d4e net/tcp/illinois: replace broken algorithm reference link
   bb19a6a9b598 gianfar: Fix Rx byte accounting for ndev stats
   10c7390ee340 clocksource/drivers/mips-gic-timer: Use correct shift count to extract data
   f97c2bf56bb7 powerpc/boot: Fix random libfdt related build errors
   9bbedb9742f3 ARM: dts: bcm283x: Fix unit address of local_intc
   c43ff936255b ARM: dts: NSP: Fix amount of RAM on BCM958625HR
   615bf75c4690 nbd: fix return value in error handling path
   d2e2e20bbdd3 sit: fix IFLA_MTU ignored on NEWLINK
   2b0fbc2fcd2f ip6_tunnel: fix IFLA_MTU ignored on NEWLINK
   29764acd50d3 ip_gre: fix IFLA_MTU ignored on NEWLINK
   f07b6505f474 bcache: fix kcrashes with fio in RAID5 backend dev
   421c15e803de dmaengine: rcar-dmac: fix max_chunk_size for R-Car Gen3
   3c08f8140a9a virtio-gpu: fix ioctl and expose the fixed status to userspace.
   8b156a0a49c9 r8152: fix tx packets accounting
   9c3e4e41c206 selftests/futex: Fix line continuation in Makefile
   784858e73805 qrtr: add MODULE_ALIAS macro to smd
   0129ee813ef7 ARM: orion5x: Revert commit 4904dbda41c8.
   3ecb681ccf6b xen/pvcalls: fix null pointer dereference on map->sock
   6c88c93898ca ceph: fix dentry leak when failing to init debugfs
   e080e814deb1 libceph, ceph: avoid memory leak when specifying same option several times
   682def914242 clocksource/drivers/fsl_ftm_timer: Fix error return checking
   44cb7ed6e5e2 nvme-pci: Fix nvme queue cleanup if IRQ setup fails
   588078bb272e batman-adv: Fix netlink dumping of BLA backbones
   f03c64fbdd9b batman-adv: Fix netlink dumping of BLA claims
   f08cabec0696 batman-adv: Ignore invalid batadv_v_gw during netlink send
   8b7e379faf15 batman-adv: Ignore invalid batadv_iv_gw during netlink send
   dd20ff0d079d netfilter: ebtables: convert BUG_ONs to WARN_ONs
   84fc57f472f9 netfilter: ipt_CLUSTERIP: put config instead of freeing it
   596816fabe42 netfilter: ipt_CLUSTERIP: put config struct if we can't increment ct refcount
   ff8c6751ecf3 batman-adv: invalidate checksum on fragment reassembly
   ee7a88fc775e batman-adv: fix packet checksum in receive path
   879a73b10a93 md/raid1: fix NULL pointer dereference
   0a4c60471d13 md: fix a potential deadlock of raid5/raid10 reshape
   2565b271aed0 fs: dcache: Use READ_ONCE when accessing i_dir_seq
   3623c1f37efa fs: dcache: Avoid livelock between d_alloc_parallel and __d_add
   ed49851ce15c ARM: dts: imx6dl: Include correct dtsi file for Engicam i.CoreM6 DualLite/Solo RQS
   5f95541a0db5 kvm: fix warning for CONFIG_HAVE_KVM_EVENTFD builds
   1fe15ab15935 KVM: nVMX: Don't halt vcpu when L1 is injecting events to L2
   ce8bdc7aabf9 macvlan: fix use-after-free in macvlan_common_newlink()
   a383f44e7a34 arm64: fix unwind_frame() for filtered out fn for function graph tracing
   3d82155f8547 mac80211: drop frames with unexpected DS bits from fast-rx to slow path
   dff5da4724bb x86/topology: Update the 'cpu cores' field in /proc/cpuinfo correctly across CPU hotplug operations
   95e8297ab206 locking/xchg/alpha: Fix xchg() and cmpxchg() memory ordering bugs
   4ba4273e7218 x86/intel_rdt: Fix incorrect returned value when creating rdgroup sub-directory in resctrl file system
   09897fcbd42a integrity/security: fix digsig.c build error with header file
   0b9f26e97f2b regulatory: add NUL to request alpha2
   c254a86a333c smsc75xx: fix smsc75xx_set_features()
   cc4a2d71cff3 ARM: OMAP: Fix dmtimer init for omap1
   90c9ae5943c3 nfs: system crashes after NFS4ERR_MOVED recovery
   4b0a3b9a511d arm64: dts: cavium: fix PCI bus dtc warnings
   e47c1bf99a14 PKCS#7: fix direct verification of SignerInfo signature
   a72612a1c39d selftests/bpf/test_maps: exit child process without error in ENOMEM case
   dac5d3a100c6 s390/cio: clear timer when terminating driver I/O
   c5b1b2e2185d s390/cio: fix return code after missing interrupt
   5df337455c5a s390/cio: fix ccw_device_start_timeout API
   aa6eeca7bcd7 powerpc/bpf/jit: Fix 32-bit JIT for seccomp_data access
   e1bb3673ae9d soc: imx: gpc: de-register power domains only if initialized
   e65cd9a20343 seccomp: add a selftest for get_metadata
   32e139dfb684 selftests/memfd: add run_fuse_test.sh to TEST_FILES
   305eb32d45f0 bug.h: work around GCC PR82365 in BUG()
   14488f25339e kernel/relay.c: limit kmalloc size to KMALLOC_MAX_SIZE
   cf15cd63000b virtio_net: fix XDP code path in receive_small()
   0e498db68095 md: raid5: avoid string overflow warning
   ca353544670d locking/xchg/alpha: Add unconditional memory barrier to cmpxchg()
   badacb781dce net/mlx5e: Return error if prio is specified when offloading eswitch vlan push
   2e9f41ace36b ibmvnic: Check for NULL skb's in NAPI poll routine
   775cc792bb08 RDMA/bnxt_re: Fix system crash during load/unload
   c0935f1ef990 RDMA/bnxt_re: Unpin SQ and RQ memory if QP create fails
   c5c0632b9c7b arm64: perf: correct PMUVer probing
   33b3f7b5af5d drm/meson: fix vsync buffer update
   2c6a5cc09b46 drm/exynos: fix comparison to bitshift when dealing with a mask
   3f925cc2d399 drm/exynos: g2d: use monotonic timestamps
   c5db4c271ca5 md raid10: fix NULL deference in handle_write_completed()
   3ed913b61e6a gpu: ipu-v3: prg: fix device node leak in ipu_prg_lookup_by_phandle
   9ccb1d53c6ac gpu: ipu-v3: pre: fix device node leak in ipu_pre_lookup_by_phandle
   8dcb7ddb2c83 mac80211: Fix sending ADDBA response for an ongoing session
   707c81727baa mac80211: Do not disconnect on invalid operating class
   f6bfc88f14cc cfg80211: clear wep keys after disconnection
   a7f126b2e1ad mac80211: fix calling sleeping function in atomic context
   99d4fe95e4f6 mac80211: fix a possible leak of station stats
   f49e3a9acc52 mac80211: round IEEE80211_TX_STATUS_HEADROOM up to multiple of 4
   020c32a91ee0 xfrm: do not call rcu_read_unlock when afinfo is NULL in xfrm_get_tos
   d0d9330fa2a3 s390/dasd: fix handling of internal requests
   e08f86697835 md: fix md_write_start() deadlock w/o metadata devices
   ca4363bf7cb8 MD: Free bioset when md_run fails
   f146c6e6506f rxrpc: Work around usercopy check
   54881db3251a NFC: llcp: Limit size of SDP URI
   e5ea0a89bf7b iwlwifi: mvm: always init rs with 20mhz bandwidth rates
   6e752ba6436b iwlwifi: mvm: fix IBSS for devices that support station type API
   8c1cc43e745d iwlwifi: mvm: fix security bug in PN checking
   1510627c63b7 ARM: dts: rockchip: Fix DWMMC clocks
   23b738ce746a arm64: dts: rockchip: Fix DWMMC clocks
   357b528e6b70 IB/uverbs: Fix unbalanced unlock on error path for rdma_explicit_destroy
   5b0622bfe637 IB/uverbs: Fix possible oops with duplicate ioctl attributes
   cdd37f48d6a0 IB/uverbs: Fix method merging in uverbs_ioctl_merge
   44ef222ad099 xhci: workaround for AMD Promontory disabled ports wakeup
   94203f213c19 tls: retrun the correct IV in getsockopt
   cec7d77a1db8 ibmvnic: Clean RX pool buffers during device close
   322d7195572d ibmvnic: Free RX socket buffer in case of adapter error
   4431066edd13 ibmvnic: Wait until reset is complete to set carrier on
   ddca5c776fff ARM: OMAP1: clock: Fix debugfs_create_*() usage
   d615dddc6e0c ARM: OMAP2+: Fix sar_base inititalization for HS omaps
   c22e3886fc65 ARM: OMAP3: Fix prm wake interrupt for resume
   7ffe100ce67c ARM: OMAP2+: timer: fix a kmemleak caused in omap_get_timer_dt
   b2f5d98f3300 selftests: memfd: add config fragment for fuse
   b9ddf39dd579 selftests: pstore: Adding config fragment CONFIG_PSTORE_RAM=m
   a666ad4bbcfb selftest/vDSO: fix O=
   198e26a0efef selftests: sync: missing CFLAGS while compiling
   4adc95c5a020 libata: Fix compile warning with ATA_DEBUG enabled
   afe088b034b4 arm64: dts: rockchip: correct ep-gpios for rk3399-sapphire
   fa4cf9010ed6 arm64: dts: rockchip: fix rock64 gmac2io stability issues
   6fc72fd1565b ptr_ring: prevent integer overflow when calculating size
   052eb2d6dc61 ARC: Fix malformed ARC_EMUL_UNALIGNED default
   0f097096b77a mac80211: mesh: fix wrong mesh TTL offset calculation
   49e30752177f MIPS: generic: Fix machine compatible matching
   3084902aa9fd powerpc/64s: Add support for a store forwarding barrier at kernel entry/exit
   b90a6bddc8af powerpc/64s: Fix section mismatch warnings from setup_rfi_flush()
   1618f211f96e powerpc/pseries: Restore default security feature flags on setup
   f092a180128e powerpc: Move default security feature flags
   a28ff26d5e44 powerpc/pseries: Fix clearing of security feature flags
   046e9adae42a powerpc/64s: Wire up cpu_show_spectre_v2()
   6e77feadbfbc powerpc/64s: Wire up cpu_show_spectre_v1()
   7a62b0f64804 powerpc/pseries: Use the security flags in pseries_setup_rfi_flush()
   3bf1695bbb24 powerpc/powernv: Use the security flags in pnv_setup_rfi_flush()
   d71a3e0a2d0a powerpc/64s: Enhance the information in cpu_show_meltdown()
   ae8afdf604d3 powerpc/64s: Move cpu_show_meltdown()
   f2fdeebd8537 powerpc/powernv: Set or clear security feature flags
   9ba774cc0f75 powerpc/pseries: Set or clear security feature flags
   e2ba26dba530 powerpc: Add security feature flags for Spectre/Meltdown
   4c5463a5a374 powerpc/pseries: Add new H_GET_CPU_CHARACTERISTICS flags
   d1cb5ff450d3 powerpc/rfi-flush: Call setup_rfi_flush() after LPM migration
   123f6d5ccaa2 powerpc/rfi-flush: Differentiate enabled and patched flush types
   6af06dcdea08 powerpc/rfi-flush: Always enable fallback flush on pseries
   d744f8457f2f powerpc/rfi-flush: Make it possible to call setup_rfi_flush() again
   5412a9d91d65 powerpc/rfi-flush: Move the logic to avoid a redo into the debugfs code
   bf434b31bad6 powerpc/powernv: Support firmware disable of RFI flush
   dff1a7e6c3ae powerpc/pseries: Support firmware disable of RFI flush
   2245d95d9f7a powerpc/64s: Improve RFI L1-D cache flush fallback
   421e1fadb0b0 x86/kvm: fix LAPIC timer drift when guest uses periodic mode
   b3ce16455c4b kvm: x86: IA32_ARCH_CAPABILITIES is always supported
   e765fd97e0c2 KVM: x86: Update cpuid properly when CR4.OSXAVE or CR4.PKE is changed
   16c463a4ecfa KVM: s390: vsie: fix < 8k check for the itdba
   9c5eee605677 KVM/VMX: Expose SSBD properly to guests
   058dfcf9c24f kernel/sys.c: fix potential Spectre v1 issue
   1da530fe155d kasan: fix memory hotplug during boot
   b052960484fd kasan: free allocated shadow memory on MEM_CANCEL_ONLINE
   9c7821c67a71 mm/kasan: don't vfree() nonexistent vm_area
   afdc490b36b0 ipc/shm: fix shmat() nil address after round-down when remapping
   67dd0bad8189 Revert "ipc/shm: Fix shmat mmap nil-page protection"
   0472f94cef2e idr: fix invalid ptr dereference on item delete
   2a039b93679f sr: pass down correctly sized SCSI sense buffer
   a59bd819576d IB/umem: Use the correct mm during ib_umem_release
   7a5b3b91f858 IB/hfi1: Use after free race condition in send context error path
   df07f2718440 powerpc/64s: Clear PCR on boot
   92169a015bdd arm64: lse: Add early clobbers to some input/output asm operands
   760e4d7e89a5 drm/vmwgfx: Fix 32-bit VMW_PORT_HB_[IN|OUT] macros
   a0f8cbce7b57 xen-swiotlb: fix the check condition for xen_swiotlb_free_coherent
   4182f5a075f1 libata: blacklist Micron 500IT SSD with MU01 firmware
   21712abb8ba2 libata: Blacklist some Sandisk SSDs for NCQ
   f2a3c8bb4d10 mmc: sdhci-iproc: add SDHCI_QUIRK2_HOST_OFF_CARD_ON for cygnus
   4da8f20a992c mmc: sdhci-iproc: fix 32bit writes for TRANSFER_MODE register
   ebedf0b29047 mmc: sdhci-iproc: remove hard coded mmc cap 1.8v
   f440ea85d429 do d_instantiate/unlock_new_inode combinations safely
   ba3fbb7afde9 ALSA: timer: Fix pause event notification
   fbcede36bbfd aio: fix io_destroy(2) vs. lookup_ioctx() race
   b9659ff375cb fs: don't scan the inode cache before SB_BORN is set
   1e5edf32e44d affs_lookup(): close a race with affs_remove_link()
   2871a701329c KVM: Fix spelling mistake: "cop_unsuable" -> "cop_unusable"
   bba75a0ccdb5 MIPS: Fix ptrace(2) PTRACE_PEEKUSR and PTRACE_POKEUSR accesses to o32 FGRs
   769fc447cced MIPS: ptrace: Expose FIR register through FP regset
   368b70857dd7 MIPS: c-r4k: Fix data corruption related to cache coherence
   102b97d6241d Linux 4.14.44
   6b73dfbd3cfc rtc: goldfish: Add missing MODULE_LICENSE
   6f34e436509e rtc: rp5c01: fix possible race condition
   78227b671e0d rtc: tx4939: avoid unintended sign extension on a 24 bit shift
   459aa4904ab2 rtc: m41t80: fix race conditions
   6266010c3895 rtc: rk808: fix possible race condition
   6c1c17116484 rtc: hctosys: Ensure system time doesn't overflow time_t
   731d965a587c rtc: snvs: Fix usage of snvs_rtc_enable
   8293e6238e03 serial: altera: ensure port->regshift is honored consistently
   e10bbc220e1a serial: 8250: Don't service RX FIFO if interrupts are disabled
   1c447ea13703 serial: arc_uart: Fix out-of-bounds access through DT alias
   db69a1a58844 serial: fsl_lpuart: Fix out-of-bounds access through DT alias
   24182ff06635 serial: imx: Fix out-of-bounds access through serial port index
   5f53807e751e serial: mxs-auart: Fix out-of-bounds access through serial port index
   491e61fe3c53 serial: samsung: Fix out-of-bounds access through serial port index
   eb81dd52b425 serial: sh-sci: Fix out-of-bounds access through DT alias
   d1e7f966521d serial: xuartps: Fix out-of-bounds access through DT alias
   604e648e8bf0 media: cx25821: prevent out-of-bounds read on array card
   9b7c44c43946 media: vivid: fix incorrect capabilities for radio
   8cfcd5bbb723 media: vb2: Fix videobuf2 to map correct area
   81173a58638f media: i2c: adv748x: fix HDMI field heights
   93c72937a26b media: v4l: vsp1: Fix display stalls when requesting too many inputs
   d600eadf7d80 media: em28xx: Add Hauppauge SoloHD/DualHD bulk models
   d62c8d80f84f media: lgdt3306a: Fix a double kfree on i2c device remove
   53ba3526baad media: s3c-camif: fix out-of-bounds array access
   5ebcb4612748 media: cx23885: Set subdev host data to clk_freq pointer
   24858b9c030a media: cx23885: Override 888 ImpactVCBe crystal frequency
   1c94830eeea5 media: ov5645: add missing of_node_put() in error path
   cc4b4af51c13 media: Don't let tvp5150_get_vbi() go out of vbi_ram_default array
   07999bccf2e0 media: dmxdev: fix error code for invalid ioctls
   7bc147610d1e clk: samsung: exynos3250: Fix PLL rates
   3fabe01cdf75 clk: samsung: exynos5250: Fix PLL rates
   90e14be44331 clk: samsung: exynos5433: Fix PLL rates
   256499854098 clk: samsung: exynos5260: Fix PLL rates
   8f4eef93e1ab clk: samsung: exynos7: Fix PLL rates
   264530c6ad12 clk: samsung: s3c2410: Fix PLL rates
   573dda18a809 clk: rockchip: Prevent calculating mmc phase if clock rate is zero
   04adc8209a9a clk: tegra: Fix pll_u rate configuration
   99f29b5c1cc4 clk: hisilicon: mark wdt_mux_p[] as const
   2dc1d1a8715e clk: Don't show the incorrect clock phase
   a225a3ba3213 clk: rockchip: Fix wrong parent for SDMMC phase clock for rk3228
   9311d0b6b466 ASoC: samsung: i2s: Ensure the RCLK rate is properly determined
   27cbb1df79c5 ASoC: topology: create TLV data for dapm widgets
   fbeec965b8d1 ASoC: samsung: odroid: Fix 32000 sample rate handling
   b3bbda7bad73 ASoC: rockchip: rk3288-hdmi-analog: Select needed codecs
   98ffb5cf47e4 ASoC: hdmi-codec: Fix module unloading caused kernel crash
   48e835f89769 scsi: lpfc: Fix frequency of Release WQE CQEs
   8fd4131a9fcc scsi: lpfc: Fix soft lockup in lpfc worker thread during LIP testing
   d5d331cdfcb2 scsi: lpfc: Fix issue_lip if link is disabled
   a9bcbce385ed scsi: mvsas: fix wrong endianness of sgpio api
   5e315f31faef scsi: core: Make SCSI Status CONDITION MET equivalent to GOOD
   3de235c7753b scsi: aacraid: Insure command thread is not recursively stopped
   10859964e0e1 scsi: iscsi_tcp: set BDI_CAP_STABLE_WRITES when data digest enabled
   b1a706fdb5a8 scsi: sd: Keep disk read-only when re-reading partition
   2bb6b7decff0 scsi: mpt3sas: Do not mark fw_event workqueue as WQ_MEM_RECLAIM
   fbc801716092 scsi: qedi: Fix kernel crash during port toggle
   dc6cb0cb91d5 scsi: qla4xxx: skip error recovery in case of register disconnect.
   b24fd4cd9491 scsi: aacraid: fix shutdown crash when init fails
   942cb7bd774a scsi: qedi: Fix truncation of CHAP name and secret
   a9eb1e1031a0 scsi: storvsc: Increase cmd_per_lun for higher speed devices
   1ad71103e12e scsi: qla2xxx: Avoid triggering undefined behavior in qla2x00_mbx_completion()
   62d16de3109f scsi: mptfusion: Add bounds check in mptctl_hp_targetinfo()
   0bf213d90bb2 scsi: sym53c8xx_2: iterator underflow in sym_getsync()
   a1ac3da8431a scsi: bnx2fc: Fix check in SCSI completion handler for timed out request
   af9930622461 scsi: ufs: Enable quirk to ignore sending WRITE_SAME command
   b0ef004e86cf scsi: qla2xxx: Fix memory corruption during hba reset test
   59ad4bb71714 scsi: mpt3sas: fix an out of bound write
   2b2a92910c19 crypto: inside-secure - fix the invalidation step during cra_exit
   c787fb6bdac2 crypto: sunxi-ss - Add MODULE_ALIAS to sun4i-ss
   d03a0a61dc82 crypto: inside-secure - fix the extra cache computation
   6df26587d22d crypto: inside-secure - fix the cache_len computation
   a04b30fd74a1 crypto: inside-secure - do not process request if no command was issued
   41b6f0ffb3ac crypto: ccp - don't disable interrupts while setting up debugfs
   223ba92a8059 crypto: atmel-aes - fix the keys zeroing on errors
   173c55493b81 crypto: inside-secure - wait for the request to complete if in the backlog
   43624647a97c staging: lustre: lmv: correctly iput lmo_root
   281bb7920cc0 staging: ks7010: Use constants from ieee80211_eid instead of literal ints.
   d5ae597ed13d staging: rtl8192u: return -ENOMEM on failed allocation of priv->oldaddr
   20b9506df1b4 staging: fsl-dpaa2/eth: Fix incorrect casts
   ff8eb22e5bb8 staging: lustre: fix bug in osc_enter_cache_try
   bf30d26981a8 staging: bcm2835-audio: Release resources on module_exit()
   0fe68f20e09f xhci: Show what USB release number the xHC supports from protocol capablity
   0249054e4bfd Bluetooth: btusb: Add device ID for RTL8822BE
   e4504b80e012 media: em28xx: USB bulk packet size fix
   f5f6bff50f36 media: lgdt3306a: Fix module count mismatch on usb unplug
   f3f3442027b5 usb: gadget: composite: fix incorrect handling of OS desc requests
   9170c1411eca usb: gadget: udc: change comparison to bitshift when dealing with a mask
   b80114337d31 usbip: Correct maximum value of CONFIG_USBIP_VHCI_HC_PORTS
   dd5541c7a60d usb: gadget: ffs: Execute copy_to_user() with USER_DS set
   7f48c9ddca72 usb: gadget: ffs: Let setup() return USB_GADGET_DELAYED_STATUS
   11cb14a19679 usb: dwc2: host: Fix transaction errors in host mode
   51250a9357d8 usb: dwc2: hcd: Fix host channel halt flow
   db81323e6a5d usb: dwc2: Fix interval type issue
   39280c27031b xhci: zero usb device slot_id member when disabling and freeing a xhci slot
   55aaef4bd8a0 usb: dwc3: Makefile: fix link error on randconfig
   834329c4ad4c usb: dwc3: Update DWC_usb31 GTXFIFOSIZ reg fields
   7fb2d2f1b04d usb: dwc3: Add SoftReset PHY synchonization delay
   81ba08e69fe2 ALSA: usb-audio: Add native DSD support for Luxman DA-06
   d711223606e8 Bluetooth: btusb: Add USB ID 7392:a611 for Edimax EW-7611ULB
   89509cdb713f net-usb: add qmi_wwan if on lte modem wistron neweb d18q1
   58249157c6ad net/usb/qmi_wwan.c: Add USB id for lt4120 modem
   ce04fbcdb39a USB: OHCI: Fix NULL dereference in HCDs using HCD_LOCAL_MEM
   e5c8a6d499a1 usb: host: xhci-plat: revert "usb: host: xhci-plat: enable clk in resume timing"
   38ed02d85840 ARM: dts: imx7d-sdb: Fix regulator-usb-otg2-vbus node name
   5788084ba3cd net: usbnet: fix potential deadlock on 32bit hosts
   f7b3f33c79b7 usb: cdc_acm: prevent race at write to acm while system resumes
   ee4ed01d4b5c usb: dwc2: Fix dwc2_hsotg_core_init_disconnected()
   a3fcccd4a7ef usb: gadget: fsl_udc_core: fix ep valid checks
   36d66139a351 usb: gadget: core: Fix use-after-free of usb_request
   aefc5ce2342a usb: dwc3: omap: don't miss events during suspend/resume
   e8f101ec20c0 usb: dwc3: Undo PHY init if soft reset fails
   0cc948e8ddb5 usb: gadget: f_uac2: fix bFirstInterface in composite gadget
   0ff6b2cac941 x86/kexec: Avoid double free_page() upon do_kexec_load() failure
   f119414a8f8d hfsplus: stop workqueue when fill_super() failed
   9f2c35864ad6 cfg80211: limit wiphy names to 128 bytes
   360964411d57 loop: fix LOOP_GET_STATUS lock imbalance
   c18270ac9f84 loop: don't call into filesystem while holding lo_ctl_mutex
   3c017b9fede9 scsi: zfcp: fix infinite iteration on ERP ready list
   d827bea2d18c scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()
   58442874542f scsi: libsas: defer ata device eh commands to libata
   c1a35f5ddf36 s390: use expoline thunks in the BPF JIT
   457b944b61e6 s390: extend expoline to BC instructions
   a206c82f9bc9 s390: move spectre sysfs attribute code
   2a146a9b3240 s390/kernel: use expoline for indirect branches
   f1bd3b99607b s390/ftrace: use expoline for indirect branches
   0d201ff077a8 s390/lib: use expoline for indirect branches
   d7aa3f13e146 s390/crc32-vx: use expoline for indirect branches
   e3ad546e6094 s390: move expoline assembler macros to a header
   9a38169fb602 s390: add assembler macros for CPU alternatives
   131ff238b859 ext2: fix a block leak
   ea5ffcd46716 sparc: vio: use put_device() instead of kfree()
   c98b38c5ede4 hv_netvsc: Fix net device attach on older Windows hosts
   c7da51021c8d hv_netvsc: Ensure correct teardown message sequence order
   c5345b11680f hv_netvsc: Split netvsc_revoke_buf() and netvsc_teardown_gpadl()
   d8c3e04d3913 hv_netvsc: Use Windows version instead of NVSP version on GPAD teardown
   be9c798d0d13 hv_netvsc: common detach logic
   905f85c289d7 hv_netvsc: change GPAD teardown order on older versions
   9c6439c7b168 hv_netvsc: use RCU to fix concurrent rx and queue changes
   1f3ef8a7a3c6 hv_netvsc: disable NAPI before channel close
   f9aab25e3326 hv_netvsc: defer queue selection to VF
   0ac663c5674a hv_netvsc: fix race in napi poll when rescheduling
   99e06589bd5d hv_netvsc: cancel subchannel setup before halting device
   0ed8945b3aa6 hv_netvsc: fix error unwind handling if vmbus_open fails
   4857dca4dd65 hv_netvsc: only wake transmit queue if link is up
   0395570f81fe hv_netvsc: avoid retry on send during shutdown
   36a9609cef4a hv_netvsc: Use the num_online_cpus() for channel limit
   4c5fef778957 hv_netvsc: empty current transmit aggregation if flow blocked
   41f24dbef177 hv_netvsc: preserve hw_features on mtu/channels/ringparam changes
   284a58c02eeb hv_netvsc: netvsc_teardown_gpadl() split
   6296e73e459d hv_netvsc: Set tx_table to equal weight after subchannels open
   ef1c5903cd2a hv_netvsc: Add initialization of tx_table in netvsc_device_add()
   b3a303352e51 hv_netvsc: Rename tx_send_table to tx_table
   5acc4d1e8fe2 hv_netvsc: Rename ind_table to rx_table
   836f8472f1bd hv_netvsc: Fix the real number of queues of non-vRSS cases
   099612827aa3 vmxnet3: use DMA memory barriers where required
   74327eda43d0 vmxnet3: set the DMA mask before the first DMA map operation
   c89d534301a0 tcp: purge write queue in tcp_connect_init()
   edabcd0f12ae sock_diag: fix use-after-free read in __sk_free
   01a658c1b9d4 packet: in packet_snd start writing at link layer allocation
   c02756173e65 net: test tailroom before appending to linear skb
   2cedbdda01fe net/smc: check for missing nlattrs in SMC_PNETID messages
   8ffa5f978394 net: sched: red: avoid hashing NULL child
   53b2dbbee18d net/sched: fix refcnt leak in the error path of tcf_vlan_init()
   5ff45c86e90a net/mlx4_core: Fix error handling in mlx4_init_port_info.
   047df46d6cef net: Fix a bug in removing queues from XPS map
   1dff08485b9e Linux 4.14.43
   92a3c944d6d5 x86/bugs: Rename SSBD_NO to SSB_NO
   e8837f0a000f KVM: SVM: Implement VIRT_SPEC_CTRL support for SSBD
   3f44c1a3c293 x86/speculation, KVM: Implement support for VIRT_SPEC_CTRL/LS_CFG
   71179d5dcbb9 x86/bugs: Rework spec_ctrl base and mask logic
   d13f068b94a1 x86/bugs: Remove x86_spec_ctrl_set()
   987f49474b06 x86/bugs: Expose x86_spec_ctrl_base directly
   6befd3a735e0 x86/bugs: Unify x86_spec_ctrl_{set_guest,restore_host}
   3e6ab4ca1345 x86/speculation: Rework speculative_store_bypass_update()
   8e1c285a050c x86/speculation: Add virtualized speculative store bypass disable support
   72f46c229ac2 x86/bugs, KVM: Extend speculation control for VIRT_SPEC_CTRL
   b213ab46cde4 x86/speculation: Handle HT correctly on AMD
   7f1efb5e74e3 x86/cpufeatures: Add FEATURE_ZEN
   bbc0d1c33566 x86/cpufeatures: Disentangle SSBD enumeration
   8e0836d1413b x86/cpufeatures: Disentangle MSR_SPEC_CTRL enumeration from IBRS
   b1d1984f3898 x86/speculation: Use synthetic bits for IBRS/IBPB/STIBP
   b1a6028c2374 KVM: SVM: Move spec control call after restore of GS
   bd2059282934 x86/cpu: Make alternative_msr_write work for 32-bit code
   5a53a5fefb73 x86/bugs: Fix the parameters alignment and missing void
   f69c4dd36766 x86/bugs: Make cpu_show_common() static
   4fbc01632e77 x86/bugs: Fix __ssb_select_mitigation() return type
   8dc742f930cc Documentation/spec_ctrl: Do some minor cleanups
   43c47eb2a274 proc: Use underscores for SSBD in 'status'
   89ba80e61a39 x86/bugs: Rename _RDS to _SSBD
   0f18f44ce076 x86/speculation: Make "seccomp" the default mode for Speculative Store Bypass
   61dfdc12ff35 seccomp: Move speculation migitation control to arch code
   9939db75cd5b seccomp: Add filter flag to opt-out of SSB mitigation
   d829fcceb8f5 seccomp: Use PR_SPEC_FORCE_DISABLE
   20d036a2e223 prctl: Add force disable speculation
   c024722ffecd x86/bugs: Make boot modes __ro_after_init
   87895ae1e9b2 seccomp: Enable speculation flaw mitigations
   dd88d569eeff proc: Provide details on speculation flaw mitigations
   7d1254a1489c nospec: Allow getting/setting on non-current task
   d8553911627a x86/speculation: Add prctl for Speculative Store Bypass mitigation
   704609d39680 x86/process: Allow runtime control of Speculative Store Bypass
   33f6a06810cb prctl: Add speculation control prctls
   81c3c2b5917a x86/speculation: Create spec-ctrl.h to avoid include hell
   97224b3da698 x86/KVM/VMX: Expose SPEC_CTRL Bit(2) to the guest
   716bfae3b3f4 x86/bugs/AMD: Add support to disable RDS on Fam[15,16,17]h if requested
   fa2f1c65246d x86/bugs: Whitelist allowed SPEC_CTRL MSR values
   128e69909f7c x86/bugs/intel: Set proper CPU features and setup RDS
   65f747a6b108 x86/bugs: Provide boot parameters for the spec_store_bypass_disable mitigation
   832b579e1e83 x86/cpufeatures: Add X86_FEATURE_RDS
   c6dc89dd04e3 x86/bugs: Expose /sys/../spec_store_bypass
   94ae9d262843 x86/bugs, KVM: Support the combination of guest and host IBRS
   7c9b4959cda4 x86/bugs: Read SPEC_CTRL MSR during boot and re-use reserved bits
   3ce1634f6165 x86/bugs: Concentrate bug reporting into a separate function
   69dc73805969 x86/bugs: Concentrate bug detection into a separate function
   8410540f5aaf x86/nospec: Simplify alternative_msr_write()
   671c9a69f426 btrfs: fix reading stale metadata blocks after degraded raid1 mounts
   7ea5cff55c45 btrfs: Fix delalloc inodes invalidation during transaction abort
   0d670384af3c btrfs: Split btrfs_del_delalloc_inode into 2 functions
   1d16f615bb7d btrfs: fix crash when trying to resume balance without the resume flag
   f9b02febeabf btrfs: property: Set incompat flag if lzo/zstd compression is set
   de1f96cc4a30 Btrfs: send, fix invalid access to commit roots due to concurrent snapshotting
   59bbb5ca4d95 Btrfs: fix xattr loss after power failure
   ca477b42aeaa ARM: 8772/1: kprobes: Prohibit kprobes on get_user functions
   bd4aeb75dab5 ARM: 8770/1: kprobes: Prohibit probing on optimized_callback
   14b4cfb5ab54 ARM: 8769/1: kprobes: Fix to use get_kprobe_ctlblk after irq-disabed
   6986750cb57c tick/broadcast: Use for_each_cpu() specially on UP kernels
   a697b90ef09e x86/mm: Drop TS_COMPAT on 64-bit exec() syscall
   5f3ca3928e08 ARM: 8771/1: kprobes: Prohibit kprobes on do_undefinstr
   e5cefe3570a0 efi: Avoid potential crashes, fix the 'struct efi_pci_io_protocol_32' definition for mixed mode
   83a39c0e4adb x86/pkeys: Do not special case protection key 0
   359b8ff3281c x86/pkeys: Override pkey when moving away from PROT_EXEC
   a6565fdd90cb s390: remove indirect branch from do_softirq_own_stack
   ce2e68b3c260 s390/qdio: don't release memory in qdio_setup_irq()
   56130d932232 s390/cpum_sf: ensure sample frequency of perf event attributes is non-zero
   c568bdf37b6e s390/qdio: fix access to uninitialized qdio_q fields
   e2266ea100ea drm/i915/gen9: Add WaClearHIZ_WM_CHICKEN3 for bxt and glk
   fc170bda2283 mm: don't allow deferred pages with NEED_PER_CPU_KM
   572e2385ae35 radix tree: fix multi-order iteration race
   f6c0f020ee5b lib/test_bitmap.c: fix bitmap optimisation tests to report errors correctly
   5b86f020a789 drm: Match sysfs name in link removal to link creation
   094595ce5701 powerpc/powernv: Fix NVRAM sleep in invalid context when crashing
   f4f05f62d3d1 i2c: designware: fix poll-after-enable regression
   f9882808e355 netfilter: nf_socket: Fix out of bounds access in nf_sk_lookup_slow_v{4,6}
   d233f8d5bdd3 netfilter: nf_tables: can't fail after linking rule into active rule list
   321bc88ec098 netfilter: nf_tables: free set name in error path
   bca7faea5410 tee: shm: fix use-after-free via temporarily dropped reference
   9a19a93bddb3 tracing/x86/xen: Remove zero data size trace events trace_xen_mmu_flush_tlb{_all}
   d2dee2253be8 vfio: ccw: fix cleanup if cp_prefetch fails
   92ce74164efa powerpc: Don't preempt_disable() in show_cpuinfo()
   27ea98a4c50c KVM: arm/arm64: VGIC/ITS: protect kvm_read_guest() calls with SRCU lock
   b6f6d8bfe779 KVM: arm/arm64: VGIC/ITS save/restore: protect kvm_read_guest() calls
   b7f0fc1f0615 spi: bcm-qspi: Always read and set BSPI_MAST_N_BOOT_CTRL
   d18c3d2304de spi: bcm-qspi: Avoid setting MSPI_CDRAM_PCS for spi-nor master
   45804b0e3cb3 spi: pxa2xx: Allow 64-bit DMA
   50c0e85887bf ALSA: control: fix a redundant-copy issue
   6283fcc9b93a ALSA: hda: Add Lenovo C50 All in one to the power_save blacklist
   13fe9058ed09 ALSA: usb: mixer: volume quirk for CM102-A+/102S+
   e842726eccf3 usbip: usbip_host: fix bad unlock balance during stub_probe()
   ec0c93951ecb usbip: usbip_host: fix NULL-ptr deref and use-after-free errors
   5cd4dd77782e usbip: usbip_host: run rebind from exit when module is removed
   cf3bcc3231ad usbip: usbip_host: delete device from busid_table after rebind
   a3d5f6ecba99 usbip: usbip_host: refine probe and disconnect debug msgs to be useful
   d88700f79448 Linux 4.14.42
   5c9a9508de30 proc: do not access cmdline nor environ from file-backed areas
   7a4eda600d77 l2tp: revert "l2tp: fix missing print session offset info"
   036bbd584b0b xfrm: fix xfrm_do_migrate() with AEAD e.g(AES-GCM)
   b0e5b437ecfd btrfs: Take trans lock before access running trans in check_delayed_ref
   d2d85f8d2249 xfrm: Use __skb_queue_tail in xfrm_trans_queue
   73cda9030380 scsi: aacraid: Correct hba_send to include iu_type
   59afc1841b70 udp: fix SO_BINDTODEVICE
   8151fe6861a0 nsh: fix infinite loop
   66fefcabae5e net/mlx5e: Allow offloading ipv4 header re-write for icmp
   cb9e5a0817f4 ipv6: fix uninit-value in ip6_multipath_l3_keys()
   19bf346ca705 hv_netvsc: set master device
   6ecec17f71f5 net/mlx5: Avoid cleaning flow steering table twice during error flow
   eac1ab609be0 net/mlx5e: TX, Use correct counter in dma_map error flow
   b047794cc36c net: sched: fix error path in tcf_proto_create() when modules are not configured
   f6294114ade4 bonding: send learning packets for vlans on slave
   2eca993ddc83 bonding: do not allow rlb updates to invalid mac
   f754c9c88045 tg3: Fix vunmap() BUG_ON() triggered from tg3_free_consistent().
   413d2627692d tcp: ignore Fast Open on repair mode
   3cfe95a0eb02 tcp_bbr: fix to zero idle_restart only upon S/ACKed data
   bf2f3bae31a2 sctp: use the old asoc when making the cookie-ack chunk in dupcook_d
   4dce9afc2d35 sctp: remove sctp_chunk_put from fail_mark err path in sctp_ulpevent_make_rcvmsg
   d3d4d69d9bbd sctp: handle two v4 addrs comparison in sctp_inet6_cmp_addr
   f6c962d27d1a sctp: fix the issue that the cookie-ack with auth can't get processed
   3b54f1fd8770 sctp: delay the authentication for the duplicated cookie-echo chunk
   30ffa967adc3 rds: do not leak kernel memory to user land
   2753ebb4e96c r8169: fix powering up RTL8168h
   2bb66a711cc8 qmi_wwan: do not steal interfaces from class drivers
   c1ce5f359066 openvswitch: Don't swap table in nlattr_set() after OVS_ATTR_NESTED is found
   8e1b8e327903 net/tls: Fix connection stall on partial tls record
   3ac0f3e0b823 net/tls: Don't recursively call push_record during tls_write_space callbacks
   78ac65e8e940 net: support compat 64-bit time in {s,g}etsockopt
   b2a4d52fae0d net_sched: fq: take care of throttled flows before reuse
   6a5b0444e703 net sched actions: fix refcnt leak in skbmod
   1abd8c5fea11 net/mlx5: E-Switch, Include VF RDMA stats in vport statistics
   57e0a9f2174e net/mlx5e: Err if asked to offload TC match on frag being first
   edc0c15f6f61 net/mlx4_en: Verify coalescing parameters are in range
   2213a18303a2 net/mlx4_en: Fix an error handling path in 'mlx4_en_init_netdev()'
   6b10014800ce net: ethernet: ti: cpsw: fix packet leaking in dual_mac mode
   1029fb466b44 net: ethernet: sun: niu set correct packet size in skb
   1e22ffab52c0 llc: better deal with too small mtu
   a7aea8e27359 ipv4: fix memory leaks in udp_sendmsg, ping_v4_sendmsg
   c751af522989 ipv4: fix fnhe usage by non-cached routes
   91c2d70192c7 dccp: fix tasklet usage
   2c13a91e0fc5 bridge: check iface upper dev when setting master via ioctl
   ece94a76618e 8139too: Use disable_irq_nosync() in rtl8139_poll_controller()
   3f07ecbec151 Linux 4.14.41
   e8bbbd11e637 KVM: x86: remove APIC Timer periodic/oneshot spikes
   5138dd0db530 KVM: PPC: Book3S HV: Fix handling of large pages in radix page fault handler
   82e91e07e654 perf/x86: Fix possible Spectre-v1 indexing for x86_pmu::event_map()
   7093d5d0caa7 perf/core: Fix possible Spectre-v1 indexing for ->aux_pages[]
   6467123872a1 perf/x86/msr: Fix possible Spectre-v1 indexing in the MSR driver
   4e4bb64df800 perf/x86/cstate: Fix possible Spectre-v1 indexing for pkg_msr
   df2c71fb5c04 perf/x86: Fix possible Spectre-v1 indexing for hw_perf_event cache_*
   bd05324cdd3a tracing/uprobe_event: Fix strncpy corner case
   bb0b090d836a sched/autogroup: Fix possible Spectre-v1 indexing for sched_prio_to_weight[]
   f2a42c6bca67 smb3: directory sync should not return an error
   57e2ce8bbace nvme: add quirk to force medium priority for SQ creation
   db433f83a81f thermal: exynos: Propagate error value from tmu_read()
   33df2f8a8c87 thermal: exynos: Reading temperature makes sense only when TMU is turned on
   4aa9ef8a29ad Bluetooth: btusb: Only check needs_reset_resume DMI table for QCA rome chipsets
   4fcd0333b21e Bluetooth: btusb: Add Dell XPS 13 9360 to btusb_needs_reset_resume_table
   9ddc1d27a913 Revert "Bluetooth: btusb: Fix quirk for Atheros 1525/QCA6174"
   99e9acc27033 cpufreq: schedutil: Avoid using invalid next_freq
   64a03d3b240f PCI / PM: Check device_may_wakeup() in pci_enable_wake()
   89d5c4eb8105 PCI / PM: Always check PME wakeup capability for runtime wakeup support
   e2023117b877 atm: zatm: Fix potential Spectre v1
   cc21a603273c net: atm: Fix potential Spectre v1
   87aa17ca56b9 drm/atomic: Clean private obj old_state/new_state in drm_atomic_state_default_clear()
   969d4595f4a8 drm/atomic: Clean old_state/new_state in drm_atomic_state_default_clear()
   34a21b17abd6 drm/nouveau: Fix deadlock in nv50_mstm_register_connector()
   b2e01797216d drm/i915: Fix drm:intel_enable_lvds ERROR message in kernel log
   2b2b00374a54 drm/vc4: Fix scaling of uni-planar formats
   d2901e247b10 can: hi311x: Work around TX complete interrupt erratum
   ad25cf42f4c7 can: hi311x: Acquire SPI lock on ->do_get_berr_counter
   d0ca84d74f9f can: kvaser_usb: Increase correct stats counter in kvaser_usb_rx_can_msg()
   4636b4e25112 ceph: fix rsize/wsize capping in ceph_direct_read_write()
   2270dfcc4b12 mm, oom: fix concurrent munlock and oom reaper unmap, v3
   8ee7dabb311d mm: sections are not offlined during memory hotremove
   21fb6d8bc504 z3fold: fix reclaim lock-ups
   899997129276 tracing: Fix regex_match_front() to not over compare the test string
   586d02c1479f dm integrity: use kvfree for kvmalloc'd memory
   3b93fff8f452 libata: Apply NOLPM quirk for SanDisk SD7UB3Q*G1001 SSDs
   d1d5c31fc3a5 rfkill: gpio: fix memory leak in probe error path
   a7ea57b025b1 gpio: fix error path in lineevent_create
   28534d29479d gpio: fix aspeed_gpio unmask irq
   0f40bb84e25e gpioib: do not free unrequested descriptors
   ef7c4825fe5f compat: fix 4-byte infoleak via uninitialized struct field
   50ed0188af8d arm64: Add work around for Arm Cortex-A55 Erratum 1024718
   ca0ecba3ddf3 KVM: PPC: Book3S HV: Fix VRMA initialization with 2MB or 1GB memory backing
   f768d0f981e6 KVM: PPC: Book3S HV: Fix guest time accounting with VIRT_CPU_ACCOUNTING_GEN
   c51eb7379dfa KVM: PPC: Book3S HV: Fix trap number return from __kvmppc_vcore_entry
   683b4520d07e bdi: Fix oops in wb_workfn()
   6b5a99167a79 bdi: wake up concurrent wb_shutdown() callers.
   8c12bd91b597 tcp: fix TCP_REPAIR_QUEUE bound checking
   108cd022c59b perf: Remove superfluous allocation error check
   17ffa29c3556 memcg: fix per_node_info cleanup
   ac91ff2a5f12 inetpeer: fix uninit-value in inet_getpeer
   566804864cd9 soreuseport: initialise timewait reuseport field
   154ff3e04015 ipv4: fix uninit-value in ip_route_output_key_hash_rcu()
   09e45996b3e7 dccp: initialize ireq->ir_mark
   f9327803193a net: fix uninit-value in __hw_addr_add_ex()
   5652aed1de29 net: initialize skb->peeked when cloning
   ced9763b911d net: fix rtnh_ok()
   bf2ecb934603 netlink: fix uninit-value in netlink_sendmsg
   1b6d0db7ed22 crypto: af_alg - fix possible uninit-value in alg_bind()
   19042316b9e1 kcm: Call strp_stop before strp_done in kcm_attach
   725f5ae1a695 netfilter: ebtables: don't attempt to allocate 0-sized compat array
   88c43b469db5 ipvs: fix rtnl_lock lockups caused by start_sync_thread

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 4d4f19c15cae..dc09b9088079 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cc0ac94a962306ff5867e1d3c2988d2004f50c8c"
-SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
+SRCREV_machine ?= "f8ced9d2648cffbb6ce6222bb453540422eb19f2"
+SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.40"
+LINUX_VERSION ?= "4.14.48"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 7250986271a7..2f48bc67de1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.40"
+LINUX_VERSION ?= "4.14.48"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f0905017bae82f733812b3e1a31abbf6d51f67c7"
-SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
+SRCREV_machine ?= "72fa684fc18637c6b385c8fa2335ac4e48240d15"
+SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index d9069154c38c..12cd8254e0ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8b98d346387e7d12941a2c0450c3c5ebc653da66"
-SRCREV_machine_qemuarm64 ?= "5eceba0e988844c64cc1d0b2a7b428b9765da9b0"
-SRCREV_machine_qemumips ?= "e596816df1c06fb68f751736bb2e9216f93e4a5d"
-SRCREV_machine_qemuppc ?= "34cc4f2e3b441f52455832580c79b886ad47c71b"
-SRCREV_machine_qemux86 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
-SRCREV_machine_qemux86-64 ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
-SRCREV_machine_qemumips64 ?= "c50abb0247af8362692d6776139dfff03d754ff9"
-SRCREV_machine ?= "ccd823982533ea9d36df09766f3a7d645b95ca7d"
-SRCREV_meta ?= "53336e1b7d969f21d8214ec9ceeb48fba4f99372"
+SRCREV_machine_qemuarm ?= "3a7b21b8959eaeb6b3548ccc03e5aeef02757a83"
+SRCREV_machine_qemuarm64 ?= "fff23f8dabf7774db37656037243f5706f311ccd"
+SRCREV_machine_qemumips ?= "825a9302d4829384c5f8ccdf96a71f39441095dd"
+SRCREV_machine_qemuppc ?= "24febbcbc2cefbf05ea038ed1042603142d3b033"
+SRCREV_machine_qemux86 ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
+SRCREV_machine_qemux86-64 ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
+SRCREV_machine_qemumips64 ?= "a55b95ebad77a4124d5f52a6d121d59e17647289"
+SRCREV_machine ?= "2bf00ed1aee9c26b48c26b10c731c2f8970d50c2"
+SRCREV_meta ?= "94457657b8d621868672917d1c2631df4a4fadd8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.40"
+LINUX_VERSION ?= "4.14.48"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


