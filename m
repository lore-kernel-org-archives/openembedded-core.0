Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 651F579603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF0CpK008991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:54 -0400
Message-ID: <05d105ccdc8c4d59a761c9c03c294857de8546a2.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] linux-yocto/4.14: update to v4.14.62
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:12 -0000
Content-Type: text/plain

Integratign the korg -stable updates that comprise the following
commits:

   1aa1166eface Linux 4.14.62
   7d29fb53439c jfs: Fix inconsistency between memory allocation and ea_buf->max_size
   59f35b983e8a xfs: don't call xfs_da_shrink_inode with NULL bp
   6f021e4ef39a xfs: validate cached inodes are free when allocated
   27c41b170183 xfs: catch inode allocation state mismatch corruption
   a34399927da1 intel_idle: Graceful probe failure when MWAIT is disabled
   d626ac9669f2 nvmet-fc: fix target sgl list on large transfers
   4af9c61ad953 nvme-pci: Fix queue double allocations
   12c058df8272 nvme-pci: allocate device queues storage space at probe
   0ea7fcfc7fe6 Btrfs: fix file data corruption after cloning a range and fsync
   ea464580fef7 i2c: imx: Fix reinit_completion() use
   60baabc37bc1 ring_buffer: tracing: Inherit the tracing setting to next ring buffer
   ff28e5cc58c2 ACPI / PCI: Bail early in acpi_pci_add_bus() if there is no ACPI handle
   dd69abaccbf7 ext4: fix false negatives *and* false positives in ext4_check_descriptors()
   09901e570c9e netlink: Don't shift on 64 for ngroups
   2d898915ccf4 nohz: Fix missing tick reprogram when interrupting an inline softirq
   e5bcbedadfd9 nohz: Fix local_timer_softirq_pending()
   a6d9dacf4e44 genirq: Make force irq threading setup more robust
   a96feef5b071 scsi: qla2xxx: Return error when TMF returns
   f70766f1338d scsi: qla2xxx: Fix ISP recovery on unload
   01cda405c88b scsi: qla2xxx: Fix NPIV deletion by calling wait_for_sess_deletion
   43d7c954b22e scsi: qla2xxx: Fix unintialized List head crash
   2ae6c0413b47 Linux 4.14.61
   b4653a3ea3d7 scsi: sg: fix minor memory leak in error path
   1a08888316d2 drm/vc4: Reset ->{x, y}_scaling[1] when dealing with uniplanar formats
   51ef850c78bb crypto: padlock-aes - Fix Nano workaround data corruption
   65be9cbe1224 RDMA/uverbs: Expand primary and alt AV port checks
   4aa0acf29064 iwlwifi: add more card IDs for 9000 series
   0eba9f5d3d48 userfaultfd: remove uffd flags from vma->vm_flags if UFFD_EVENT_FORK fails
   a1b5bcffe4a4 audit: fix potential null dereference 'context->module.name'
   e5a16c6a6707 kvm: x86: vmx: fix vpid leak
   c1a29c2d00c6 x86/entry/64: Remove %ebx handling from error_entry/exit
   7cf6b325f554 x86/apic: Future-proof the TSC_DEADLINE quirk for SKX
   34a938cd3ad4 virtio_balloon: fix another race between migration and ballooning
   45c8178cf69e net: socket: fix potential spectre v1 gadget in socketcall
   c8159f9a1ae9 can: ems_usb: Fix memory leak on ems_usb_disconnect()
   e7de67165efe squashfs: more metadata hardenings
   953f918d548b squashfs: more metadata hardening
   a766ccbf1d29 net/mlx5e: E-Switch, Initialize eswitch only if eswitch manager
   e0638b6a054c rxrpc: Fix user call ID check in rxrpc_service_prealloc_one
   83a46456c983 net: stmmac: Fix WoL for PCI-based setups
   1828cb3d10d9 netlink: Fix spectre v1 gadget in netlink_create()
   bcbdea137159 net: dsa: Do not suspend/resume closed slave_dev
   8721f3608945 ipv4: frags: handle possible skb truesize change
   fc63057d5fda inet: frag: enforce memory limits earlier
   dc8edd08cd89 bonding: avoid lockdep confusion in bond_get_stats()
   deaacd62c217 Linux 4.14.60
   0a2f6725115d tcp: add one more quick ack after after ECN events
   1f04d750f668 tcp: refactor tcp_ecn_check_ce to remove sk type cast
   fd31083cbe05 tcp: do not aggressively quick ack after ECN events
   1c005489fa98 tcp: add max_quickacks param to tcp_incr_quickack and tcp_enter_quickack_mode
   5a1baf194475 tcp: do not force quickack when receiving out-of-order packets
   fffd3058eaf4 netlink: Don't shift with UB on nlk->ngroups
   e208cda5f10e netlink: Do not subscribe to non-existent groups
   da970765b24c xen-netfront: wait xenbus state change when load module manually
   7309441887f6 tcp_bbr: fix bw probing to raise in-flight data for very small BDPs
   7f36a065963a NET: stmmac: align DMA stuff to largest cache line length
   e071e2fdf45e net: mdio-mux: bcm-iproc: fix wrong getter and setter pair
   ccdbe7e2374a net: lan78xx: fix rx handling before first packet is send
   112e80ac8285 net: fix amd-xgbe flow-control issue
   11b694387ab4 net: ena: Fix use of uninitialized DMA address bits field
   1494a3a70ce0 ipv4: remove BUG_ON() from fib_compute_spec_dst
   20556dc7f239 net: dsa: qca8k: Allow overwriting CPU port setting
   2eda475b0849 net: dsa: qca8k: Add QCA8334 binding documentation
   1fbc97b32b7e net: dsa: qca8k: Enable RXMAC when bringing up a port
   62310e69f1ae net: dsa: qca8k: Force CPU port to its highest bandwidth
   a61b3378b847 RDMA/uverbs: Protect from attempts to create flows on unsupported QP
   b8e9dd160ca3 usb: gadget: udc: renesas_usb3: should remove debugfs
   6aaaca7b81e4 ovl: Sync upper dirty data when syncing overlayfs
   21b5b5e80bcf PCI: xgene: Remove leftover pci_scan_child_bus() call
   011626d61a43 PCI: pciehp: Assume NoCompl+ for Thunderbolt ports
   f547aa20b4f6 ext4: fix check to prevent initializing reserved inodes
   dc1b4b710fbe ext4: check for allocation block validity with block group locked
   cdcbe750acd6 ext4: fix inline data updates with checksums enabled
   961f9feb4332 squashfs: be more careful about metadata corruption
   af41fd042fc1 random: mix rdrand with entropy sent in from userspace
   b8088c524ae2 block: reset bi_iter.bi_done after splitting bio
   cc5d7097ba8f blkdev: __blkdev_direct_IO_simple: fix leak in error case
   2258351cf086 block: bio_iov_iter_get_pages: fix size of last iovec
   2488689fe468 drm/dp/mst: Fix off-by-one typo when dump payload table
   2aa0e652bce1 drm/atomic-helper: Drop plane->fb references only for drm_atomic_helper_shutdown()
   20f01a1b7b6d drm: Add DP PSR2 sink enable bit
   a2fdb85a15eb ASoC: topology: Add missing clock gating parameter when parsing hw_configs
   b754906cd9c9 ASoC: topology: Fix bclk and fsync inversion in set_link_hw_format()
   e1d4f1e2856e media: si470x: fix __be16 annotations
   98121d665d93 media: atomisp: compat32: fix __user annotations
   a5ed99bc6f59 scsi: cxlflash: Avoid clobbering context control register value
   bb7cccb01c84 scsi: cxlflash: Synchronize reset and remove ops
   07b2a0d00183 scsi: megaraid_sas: Increase timeout by 1 sec for non-RAID fastpath IOs
   0b45eb5a340d scsi: scsi_dh: replace too broad "TP9" string with the exact models
   fb2b60e27a16 regulator: Don't return or expect -errno from of_map_mode()
   4886bf00337f media: omap3isp: fix unbalanced dma_iommu_mapping
   09740f513e3f crypto: authenc - don't leak pointers to authenc keys
   a07fc8dd2bd4 crypto: authencesn - don't leak pointers to authenc keys
   f17d397bfed4 usb: hub: Don't wait for connect state at resume for powered-off ports
   d136b7ab24b8 microblaze: Fix simpleImage format generation
   6cfd0d3c627f soc: imx: gpcv2: Do not pass static memory as platform data
   62079c8371aa serial: core: Make sure compiler barfs for 16-byte earlycon names
   41e1f1feee06 staging: lustre: ldlm: free resource when ldlm_lock_create() fails.
   e906355a7f96 staging: lustre: llite: correct removexattr detection
   fea5a0d87816 staging: vchiq_core: Fix missing semaphore release in error case
   06d6d1ad241d audit: allow not equal op for audit by executable
   e7cb8f11f6e2 rsi: fix nommu_map_sg overflow kernel panic
   0be8aa812cef rsi: Fix 'invalid vdd' warning in mmc
   e660508795d6 ipconfig: Correctly initialise ic_nameservers
   18a48a7a4418 drm/gma500: fix psb_intel_lvds_mode_valid()'s return type
   75d1087174d2 igb: Fix queue selection on MAC filters on i210
   c7ab132d7e3d arm64: defconfig: Enable Rockchip io-domain driver
   2ee4fbcd27f9 nvme: lightnvm: add granby support
   503f22cf7b2a memory: tegra: Apply interrupts mask per SoC
   9746d3696de9 memory: tegra: Do not handle spurious interrupts
   c06f5a018f71 delayacct: Use raw_spinlocks
   da2b62c740de stop_machine: Use raw spinlocks
   4531135811a5 backlight: pwm_bl: Don't use GPIOF_* with gpiod_get_direction
   232703c9091f dt-bindings: net: meson-dwmac: new compatible name for AXG SoC
   c3b540c06954 net: hns3: Fixes the out of bounds access in hclge_map_tqp
   17b26041363f spi: meson-spicc: Fix error handling in meson_spicc_probe()
   c9e5888ec8ae dt-bindings: pinctrl: meson: add support for the Meson8m2 SoC
   d6ce4f1bf79a mmc: pwrseq: Use kmalloc_array instead of stack VLA
   f0b0debbb49d mmc: dw_mmc: update actual clock for mmc debugfs
   ab76f866c8f0 ALSA: hda/ca0132: fix build failure when a local macro is defined
   c6f9830cfb47 drm/atomic: Handling the case when setting old crtc for plane
   cf0061396910 media: siano: get rid of __le32/__le16 cast warnings
   4bbf1ce3a1e3 f2fs: avoid fsync() failure caused by EAGAIN in writepage()
   15239633dc55 bpf: fix references to free_bpf_prog_info() in comments
   b62ed0bbbd63 thermal: exynos: fix setting rising_threshold for Exynos5433
   66eb9942673a staging: lustre: o2iblnd: Fix FastReg map/unmap for MLX5
   52a21fcafa71 staging: lustre: o2iblnd: fix race at kiblnd_connect_peer
   de3da42dc775 scsi: qedf: Set the UNLOADING flag when removing a vport
   ad1562ae8135 scsi: hisi_sas: config ATA de-reset as an constrained command for v3 hw
   13e4e358b94c scsi: megaraid: silence a static checker bug
   ca588ff3e7d6 scsi: 3w-xxxx: fix a missing-check bug
   a0e86c016bb4 scsi: 3w-9xxx: fix a missing-check bug
   112f47373e36 bnxt_en: Check unsupported speeds in bnxt_update_link() on PF only.
   c9b5d1519c24 perf: fix invalid bit in diagnostic entry
   d5d8223d7c67 s390/cpum_sf: Add data entry sizes to sampling trailer entry
   af5e8846a5e9 brcmfmac: Add support for bcm43364 wireless chipset
   59d9b120600d mtd: rawnand: fsl_ifc: fix FSL NAND driver to read all ONFI parameter pages
   d49f8498042a media: saa7164: Fix driver name in debug output
   f3766ad7d325 media: media-device: fix ioctl function types
   ce222fb1256b ACPI / LPSS: Only call pwm_add_table() for Bay Trail PWM if PMIC HRV is 2
   885d2128ab7f libata: Fix command retry decision
   adf9ceabfc16 media: rcar_jpu: Add missing clk_disable_unprepare() on error in jpu_open()
   240bc678f726 net: phy: phylink: Release link GPIO
   fa57e8d54494 dma-iommu: Fix compilation when !CONFIG_IOMMU_DMA
   deb1feaad03a tty: Fix data race in tty_insert_flip_string_fixed_flag
   731b918a624c i40e: free the skb after clearing the bitlock
   6fdc5235693b nvmem: properly handle returned value nvmem_reg_read
   901366594729 ARM: dts: sh73a0: Add missing interrupt-affinity to PMU node
   9c552c4e262f ARM: dts: emev2: Add missing interrupt-affinity to PMU node
   b565e4e9dd09 ARM: dts: stih407-pinctrl: Fix complain about IRQ_TYPE_NONE usage
   d7ed9da96a8a EDAC, altera: Fix ARM64 build warning
   d0eca5d32b11 HID: i2c-hid: check if device is there before really probing
   83eef34c65f1 powerpc/embedded6xx/hlwd-pic: Prevent interrupts from being handled by Starlet
   b42848b2a819 drm/amdgpu: Remove VRAM from shared bo domains.
   14bedc05ab2d drm/radeon: fix mode_valid's return type
   3ee32f73fc72 arm64: dts: renesas: salvator-common: use audio-graph-card for Sound
   d85073283aa7 HID: hid-plantronics: Re-resend Update to map button for PTT products
   6a43d5a3ca6c arm64: cmpwait: Clear event register before arming exclusive monitor
   62a87c8759f2 media: atomisp: ov2680: don't declare unused vars
   25436aa5c184 ALSA: usb-audio: Apply rate limit to warning messages in URB complete callback
   d239ee35ddb2 net: ethernet: ti: cpsw-phy-sel: check bus_find_device() ret value
   0bd08027bd19 media: smiapp: fix timeout checking in smiapp_read_nvm
   41b16e6ec6a8 ixgbevf: fix MAC address changes through ixgbevf_set_mac()
   7627ecfc4902 md: fix NULL dereference of mddev->pers in remove_and_add_spares()
   1b3433cfa222 md/raid1: add error handling of read error from FailFast device
   6192b115c58b regulator: pfuze100: add .is_enable() for pfuze100_swb_regulator_ops
   9b56c4151ac2 ALSA: emu10k1: Rate-limit error messages about page errors
   9f25b548732c rtc: tps65910: fix possible race condition
   8f5e7596fe3a rtc: vr41xx: fix possible race condition
   aca6728fa1ed rtc: tps6586x: fix possible race condition
   192591ade6ec Bluetooth: btusb: add ID for LiteOn 04ca:301a
   33775b07426b drm/nouveau/fifo/gk104-: poll for runlist update completion
   fdb5207dc1f1 scsi: zfcp: assert that the ERP lock is held when tracing a recovery trigger
   b095b5888eab scsi: ufs: fix exception event handling
   c9f744135ad7 scsi: ufs: ufshcd: fix possible unclocked register access
   63c7e58dab1e fscrypt: use unbound workqueue for decryption
   1d6908ce90b5 net: hns3: Fix the missing client list node initialization
   625d1e783375 spi: Add missing pm_runtime_put_noidle() after failed get
   d0a963cf845c drivers/perf: arm-ccn: don't log to dmesg in event_init
   cffbdb7702ba ima: based on policy verify firmware signatures (pre-allocated buffer)
   945e6ce33d80 mwifiex: correct histogram data with appropriate index
   a30ff89c34b8 net: dsa: qca8k: Add support for QCA8334 switch
   082900a6d567 PCI: pciehp: Request control of native hotplug only if supported
   39da0cf774db bpf: powerpc64: pad function address loads with NOPs
   cf957ba7c6e8 pinctrl: at91-pio4: add missing of_node_put
   210807e92b49 powerpc/8xx: fix invalid register expression in head_8xx.S
   56a58a5395ab spi: sh-msiof: Fix setting SIRMDR1.SYNCAC to match SITMDR1.SYNCAC
   7eda31872980 powerpc: Add __printf verification to prom_printf
   566be4969b83 powerpc/powermac: Mark variable x as unused
   d26f8af1a126 powerpc/powermac: Add missing prototype for note_bootable_part()
   ee8c480702a6 powerpc/chrp/time: Make some functions static, add missing header include
   c0ff32b7e852 powerpc/32: Add a missing include header
   935674605cf8 ath: Add regulatory mapping for Bahamas
   936058197fbb ath: Add regulatory mapping for Bermuda
   c4b93c91bb63 ath: Add regulatory mapping for Serbia
   aafbcce424ec ath: Add regulatory mapping for Tanzania
   5e895c9cb8ca ath: Add regulatory mapping for Uganda
   3c51226005d9 ath: Add regulatory mapping for APL2_FCCA
   cdd106451c6a ath: Add regulatory mapping for APL13_WORLD
   f198926d6a40 ath: Add regulatory mapping for ETSI8_WORLD
   be1c9763cbc7 ath: Add regulatory mapping for FCC3_ETSIC
   1afb8720b694 nvme-pci: Fix AER reset handling
   4bb1acf80c7f nvme-rdma: stop admin queue before freeing it
   2040b0d8c9c0 PCI: Prevent sysfs disable of device while driver is attached
   d93663a78783 PM / wakeup: Make s2idle_lock a RAW_SPINLOCK
   652b94b72696 x86/microcode: Make the late update update_lock a raw lock for RT
   2737a4adec5a btrfs: qgroup: Finish rescan when hit the last leaf of extent tree
   31371d2dad49 btrfs: add barriers to btrfs_sync_log before log_commit_wait wakeups
   3bf165384e82 Btrfs: don't BUG_ON() in btrfs_truncate_inode_items()
   ef61d940cd96 Btrfs: don't return ino to ino cache if inode item removal fails
   9aecdc961e6a media: videobuf2-core: don't call memop 'finish' when queueing
   b7ffc03574f8 media: tw686x: Fix incorrect vb2_mem_ops GFP flags
   1a95962bf210 net: hns3: Fixes the init of the VALID BD info in the descriptor
   6f8688bf299b wlcore: sdio: check for valid platform device data before suspend
   852feed35dcd mwifiex: handle race during mwifiex_usb_disconnect
   6648fdc71138 mfd: cros_ec: Fail early if we cannot identify the EC
   3d4837733945 ASoC: dpcm: fix BE dai not hw_free and shutdown
   5650a9be9635 Bluetooth: btusb: Add a new Realtek 8723DE ID 2ff8:b011
   678e64c63217 Bluetooth: hci_qca: Fix "Sleep inside atomic section" warning
   73425f6ad6eb iwlwifi: pcie: fix race in Rx buffer allocator
   59b837d5927c btrfs: balance dirty metadata pages in btrfs_finish_ordered_io
   233cba023484 PCI: Fix devm_pci_alloc_host_bridge() memory leak
   f559bb20c1ae selftests: intel_pstate: return Kselftest Skip code for skipped tests
   4312c2df0b7b selftests: memfd: return Kselftest Skip code for skipped tests
   9c8f3af66282 selftests/intel_pstate: Improve test, minor fixes
   596a9bfe8190 perf/x86/intel/uncore: Correct fixed counter index check for NHM
   71b1bf6e9753 perf/x86/intel/uncore: Correct fixed counter index check in generic code
   38c8c0a9709d usbip: dynamically allocate idev by nports found in sysfs
   bc30588b8e08 usbip: usbip_detach: Fix memory, udev context and udev leak
   63019044fb89 block, bfq: remove wrong lock in bfq_requests_merged
   67226fb52c23 f2fs: fix race in between GC and atomic open
   ad8d61efc9b7 f2fs: fix to detect failure of dquot_initialize
   c92d09e35d2d f2fs: Fix deadlock in shutdown ioctl
   4f979af7b0ad f2fs: fix to wait page writeback during revoking atomic write
   de13b2ac741f f2fs: fix to don't trigger writeback during recovery
   f3f029197738 f2fs: fix error path of move_data_page
   122031c29202 disable loading f2fs module on PAGE_SIZE > 4KB
   1339e2b8eaea pnfs: Don't release the sequence slot until we've processed layoutget on open
   20fc8b34c195 netfilter: nf_tables: check msg_type before nft_trans_set(trans)
   4f5fd8a1ae16 lightnvm: pblk: warn in case of corrupted write buffer
   929e1a3906e1 RDMA/mad: Convert BUG_ONs to error flows
   a23e1da9773b powerpc/64s: Fix compiler store ordering to SLB shadow area
   0aceed2d7ec1 hvc_opal: don't set tb_ticks_per_usec in udbg_init_opal_common()
   bc0b4615cc97 powerpc/eeh: Fix use-after-release of EEH driver
   04cda3ac3312 powerpc/64s: Add barrier_nospec
   47b356145017 powerpc/lib: Adjust .balign inside string functions for PPC32
   e27dad1eb1ac infiniband: fix a possible use-after-free bug
   848f260301d0 e1000e: Ignore TSYNCRXCTL when getting I219 clock attributes
   4c717e335ae1 ceph: fix alignment of rasize
   cdad03c1f21e bpf, arm32: fix inconsistent naming about emit_a32_lsr_{r64,i64}
   8dcf2dbf65ef printk: drop in_nmi check from printk_safe_flush_on_panic()
   2f6a38b131ab watchdog: da9063: Fix updating timeout value
   d90c9b07cb32 irqchip/ls-scfg-msi: Map MSIs in the iommu
   ff60eda50453 netfilter: ipset: List timing out entries with "timeout 1" instead of zero
   52f072f580e4 netfilter: ipset: forbid family for hash:mac sets
   a47ece2b17c2 perf tools: Fix pmu events parsing rule
   6a929b97b777 rtc: ensure rtc_set_alarm fails when alarms are not supported
   191d00f8c872 mm/slub.c: add __printf verification to slab_err()
   b9d1724cf618 mm: vmalloc: avoid racy handling of debugobjects in vunmap
   9e1a1fc0cd9b mm: /proc/pid/pagemap: hide swap entries from unprivileged users
   9691035cbf72 kernel/hung_task.c: show all hung tasks before panic
   827faa4eb566 vfio/type1: Fix task tracking for QEMU vCPU hotplug
   8f38152f2ae2 vfio/mdev: Check globally for duplicate devices
   ca014df110e9 vfio: platform: Fix reset module leak in error path
   5a47fe3efd4d nfsd: fix potential use-after-free in nfsd4_decode_getdeviceinfo
   baad2bf44770 NFSv4.1: Fix the client behaviour on NFS4ERR_SEQ_FALSE_RETRY
   42b1df406a29 ALSA: fm801: add error handling for snd_ctl_add
   40ff9a54dd9b ALSA: emu10k1: add error handling for snd_ctl_add
   44a78f7d1757 skip LAYOUTRETURN if layout is invalid
   0a84c912f575 hv_netvsc: fix network namespace issues with VF support
   51b694070738 xen/netfront: raise max number of slots in xennet_get_responses()
   a45f5ee6850b kcov: ensure irq code sees a valid area
   73990abb1a04 mlxsw: spectrum_switchdev: Fix port_vlan refcounting
   c1550e014135 arm64: fix vmemmap BUILD_BUG_ON() triggering on !vmemmap setups
   4681e8820f99 tracing: Quiet gcc warning about maybe unused link variable
   86428ec165ee tracing/kprobes: Fix trace_probe flags on enable_trace_kprobe() failure
   f957456878eb kthread, tracing: Don't expose half-written comm when creating kthreads
   10419b0c16d4 tracing: Fix possible double free in event_enable_trigger_func()
   9158a7debe53 tracing: Fix double free of event_trigger_data
   a2f85c02810f delayacct: fix crash in delayacct_blkio_end() after delayacct init failure
   8eead4f5dea9 kvm, mm: account shadow page tables to kmemcg
   ca6427facd96 Input: elan_i2c - add another ACPI ID for Lenovo Ideapad 330-15AST
   e0e385e2126e Input: i8042 - add Lenovo LaVie Z to the i8042 reset list
   b4667635de2e Input: elan_i2c - add ACPI ID for lenovo ideapad 330
   c09032b71fc6 spi: spi-s3c64xx: Fix system resume support
   e581f7c590cc drivers/infiniband/ulp/srpt/ib_srpt.c: fix build with gcc-4.4.4
   1e8bb2e9c9df IB/srpt: Fix an out-of-bounds stack access in srpt_zerolength_write()
   d02c9c8bfef1 drivers/infiniband/core/verbs.c: fix build with gcc-4.4.4
   3af618717e71 RDMA/core: Avoid that ib_drain_qp() triggers an out-of-bounds stack access
   c0b86d269bf0 i2c: core: decrease reference count of device node in i2c_unregister_device
   2d5fc7ffa84b fork: unconditionally clear stack on fork
   53208e12faa5 Linux 4.14.59
   e94f784fddd5 turn off -Wattribute-alias
   08382d3a1be2 can: m_can.c: fix setup of CCCR register: clear CCCR NISO bit before checking can.ctrlmode
   a55d3d73d457 can: peak_canfd: fix firmware < v3.3.0: limit allocation to 32-bit DMA addr only
   60454a9715df can: xilinx_can: fix RX overflow interrupt not being enabled
   19c756e01b09 can: xilinx_can: fix incorrect clear of non-processed interrupts
   189c7890f33b can: xilinx_can: keep only 1-2 frames in TX FIFO to fix TX accounting
   96bf3257c866 can: xilinx_can: fix device dropping off bus on RX overrun
   c5846b2fd57b can: xilinx_can: fix recovery from error states not being propagated
   f820de2a08b6 can: xilinx_can: fix power management handling
   464a3f9139f4 can: xilinx_can: fix RX loop if RXNEMP is asserted without RXOK
   55cb8f40c8d7 driver core: Partially revert "driver core: correct device's shutdown order"
   5421694d8cd7 usb: gadget: f_fs: Only return delayed status when len is 0
   68fc92a0f391 usb: dwc2: Fix DMA alignment to start at allocated boundary
   ac3f65c6b635 usb: core: handle hub C_PORT_OVER_CURRENT condition
   e089c305af49 usb: cdc_acm: Add quirk for Castles VEGA3000
   ab9489c4db89 staging: speakup: fix wraparound in uaccess length check
   22e3d3178b18 tcp: add tcp_ooo_try_coalesce() helper
   ec645ae62309 tcp: call tcp_drop() from tcp_data_queue_ofo()
   6285a74a536f tcp: detect malicious patterns in tcp_collapse_ofo_queue()
   81e6b01d1c10 tcp: avoid collapses in tcp_prune_queue() if possible
   f3a5ba6310e1 tcp: free batches of packets in tcp_prune_ofo_queue()
   ae70b6153197 tcp: do not delay ACK in DCTCP upon CE status change
   78636179f6e6 tcp: do not cancel delay-AcK on DCTCP special ACK
   f7f24b369383 tcp: helpers to send special DCTCP ack
   68c9bdfc8b42 tcp: fix dctcp delayed ACK schedule
   68974d0b9c86 vxlan: fix default fdb entry netlink notify ordering during netdev create
   bb0335aacfdd vxlan: make netlink notify in vxlan_fdb_destroy optional
   1c345a529258 vxlan: add new fdb alloc and create helpers
   23557c5d34b9 rtnetlink: add rtnl_link_state check in rtnl_configure_link
   464e2326a7f5 sock: fix sg page frag coalescing in sk_alloc_sg
   50b464d33964 net: phy: consider PHY_IGNORE_INTERRUPT in phy_start_aneg_priv
   46f9e1d0bd4e multicast: do not restore deleted record source filter mode to new one
   6d5b7d68f45b net/ipv6: Fix linklocal to global address with VRF
   047af2d8ced3 net/mlx5e: Fix quota counting in aRFS expire flow
   c83cd44202b5 net/mlx5e: Don't allow aRFS for encapsulated packets
   291d99ac4dc2 net/mlx5: Adjust clock overflow work period
   f208fbad98fd net: skb_segment() should not return NULL
   6e92f04a4fef net/mlx4_core: Save the qpn from the input modifier in RST2INIT wrapper
   df20f746d68b ip: in cmsg IP(V6)_ORIGDSTADDR call pskb_may_pull
   c2ce657fd68c ip: hash fragments consistently
   f1fb27fc256c bonding: set default miimon value for non-arp modes if not set
   7e454c18b76f drm/nouveau: Set DRIVER_ATOMIC cap earlier to fix debugfs
   d0bd2c70ffcb drm/nouveau/drm/nouveau: Fix runtime PM leak in nv50_disp_atomic_commit()
   58113603a4ea KVM: PPC: Check if IOMMU page is contained in the pinned physical page
   14500f14e0b6 xen/PVH: Set up GS segment for stack canary
   de019e7857fb MIPS: Fix off-by-one in pci_resource_to_user()
   4c686d73bc3e MIPS: ath79: fix register address in ath79_ddr_wb_flush()
   4168a8422364 Revert "cifs: Fix slab-out-of-bounds in send_set_info() on SMB2 ACE setting"
   f952480a8fc1 Linux 4.14.58
   3fcc143edcdd xhci: Fix perceived dead host due to runtime suspend race with event handler
   ff42682f21d7 powerpc/powernv: Fix save/restore of SPRG3 on entry/exit from stop (idle)
   ea8a50e5f829 cxl_getfile(): fix double-iput() on alloc_file() failures
   b12c7d0847e2 alpha: fix osf_wait4() breakage
   78cdeb665fb1 net: usb: asix: replace mii_nway_restart in resume path
   bbf9b1a46420 ipv6: make DAD fail with enhanced DAD when nonce length differs
   7c14cf21867c net: systemport: Fix CRC forwarding check for SYSTEMPORT Lite
   65851c6b6d6e net/mlx4_en: Don't reuse RX page when XDP is set
   7e7fefde7dec hv_netvsc: Fix napi reschedule while receive completion is busy
   c7daaa272dda tg3: Add higher cpu clock for 5762.
   c84c7d8383c2 qmi_wwan: add support for Quectel EG91
   294dc77bb75e ptp: fix missing break in switch
   811ad4b366a6 net: phy: fix flag masking in __set_phy_supported
   78382d78bb4a net/ipv4: Set oif in fib_compute_spec_dst
   829f4fd66354 skbuff: Unconditionally copy pfmemalloc in __skb_clone()
   6403b54a4f7e net: Don't copy pfmemalloc flag in __copy_skb_header()
   cc0ab64759c8 net: diag: Don't double-free TCP_NEW_SYN_RECV sockets in tcp_abort
   cfb876dc3042 lib/rhashtable: consider param->min_size when setting initial table size
   9f7276ce825b ipv6: ila: select CONFIG_DST_CACHE
   a5d33d38bd37 ipv6: fix useless rol32 call on hash
   0348dcd98af3 ipv4: Return EINVAL when ping_group_range sysctl doesn't map to user ns
   c8347d91cfd7 gen_stats: Fix netlink stats dumping in the presence of padding
   dd1363ca743e drm/nouveau: Avoid looping through fake MST connectors
   22c4488c8649 drm/nouveau: Use drm_connector_list_iter_* for iterating connectors
   387362c3ed80 drm/i915: Fix hotplug irq ack on i965/g4x
   d21fb63010c4 stop_machine: Disable preemption when waking two stopper threads
   9a2e4a01ded2 vfio/spapr: Use IOMMU pageshift rather than pagesize
   a5b8eae53672 vfio/pci: Fix potential Spectre v1
   dfc328156dde cpufreq: intel_pstate: Register when ACPI PCCH is present
   70ef1db1f21d mm/huge_memory.c: fix data loss when splitting a file pmd
   be2657752e9e mm: memcg: fix use after free in mem_cgroup_iter()
   95c58105bd97 ARC: mm: allow mprotect to make stack mappings executable
   3c732b3ab3a5 ARC: configs: Remove CONFIG_INITRAMFS_SOURCE from defconfigs
   13e5197d7ef6 ARC: Fix CONFIG_SWAP
   edb5e3eeb14a ARCv2: [plat-hsdk]: Save accl reg pair by default
   a82d4478337a ALSA: hda: add mute led support for HP ProBook 455 G5
   feefc072d10d ALSA: hda/realtek - Add Panasonic CF-SZ6 headset jack quirk
   5d251646ab15 ALSA: rawmidi: Change resized buffers atomically
   321089a0aa35 fat: fix memory allocation failure handling of match_strdup()
   1450a7c5da03 x86/MCE: Remove min interval polling limitation
   aa49e48232ee x86/events/intel/ds: Fix bts_interrupt_threshold alignment
   b4108288eab8 x86/apm: Don't access __preempt_count with zeroed fs
   3a46a033bfa8 KVM/Eventfd: Avoid crash when assign and deassign specific eventfd in parallel.
   763ccb4d1980 scsi: sd_zbc: Fix variable type and bogus comment
   ecc160ece609 Linux 4.14.57
   779128d80cb0 string: drop __must_check from strscpy() and restore strscpy() usages in cgroup
   96fd60c8160c arm64: KVM: Add ARCH_WORKAROUND_2 discovery through ARCH_FEATURES_FUNC_ID
   1b749f8a2416 arm64: KVM: Handle guest's ARCH_WORKAROUND_2 requests
   805357aa65bb arm64: KVM: Add ARCH_WORKAROUND_2 support for guests
   0592871918f0 arm64: KVM: Add HYP per-cpu accessors
   b769d86ea9d4 arm64: ssbd: Add prctl interface for per-thread mitigation
   e7d02797288f arm64: ssbd: Introduce thread flag to control userspace mitigation
   c5c89bb4deb8 arm64: ssbd: Restore mitigation status on CPU resume
   02e26bd9ad58 arm64: ssbd: Skip apply_ssbd if not using dynamic mitigation
   8d6907af4583 arm64: ssbd: Add global mitigation state accessor
   45808ab2f924 arm64: Add 'ssbd' command-line option
   837c87c233c1 arm64: Add ARCH_WORKAROUND_2 probing
   1bffd4869011 arm64: Add per-cpu infrastructure to call ARCH_WORKAROUND_2
   5ad09d2abb5a arm64: Call ARCH_WORKAROUND_2 on transitions between EL0 and EL1
   1de2719134b5 arm/arm64: smccc: Add SMCCC-specific return codes
   2cdc2e62a6ac KVM: arm64: Avoid storing the vcpu pointer on the stack
   dca7815605af KVM: arm/arm64: Do not use kern_hyp_va() with kvm_vgic_global_state
   e77175fafa7d arm64: alternatives: Add dynamic patching feature
   286950e0831b KVM: arm64: Stop save/restoring host tpidr_el1 on VHE
   0dac9f10d952 arm64: alternatives: use tpidr_el2 on VHE hosts
   6256b86e8519 KVM: arm64: Change hyp_panic()s dependency on tpidr_el2
   8ad56472d67c KVM: arm/arm64: Convert kvm_host_cpu_state to a static per-cpu allocation
   ed812b882599 KVM: arm64: Store vcpu on the stack during __guest_enter()
   115df2a7c5ba net/nfc: Avoid stalls when nfc_alloc_send_skb() returned NULL.
   a4b57440d971 rds: avoid unenecessary cong_update in loop transport
   1bbe05e27af1 bdi: Fix another oops in wb_workfn()
   28c74ff85efd netfilter: ipv6: nf_defrag: drop skb dst before queueing
   b124e97f3ef5 nsh: set mac len based on inner packet
   00235ab80007 autofs: fix slab out of bounds read in getname_kernel()
   30a7a7b04f8b tls: Stricter error checking in zerocopy sendmsg path
   d9bb71d76c07 KEYS: DNS: fix parsing multiple options
   cba5008502f2 reiserfs: fix buffer overflow with long warning messages
   766a7ad6639b netfilter: ebtables: reject non-bridge targets
   b5199c61e95c PCI: hv: Disable/enable IRQs rather than BH in hv_compose_msi_msg()
   aa6be396714c block: do not use interruptible wait anywhere
   f1059632a4fc mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally
   c4bfed85bae8 crypto: af_alg - Initialize sg_num_bytes in error code path
   16b3ae12337e clocksource: Initialize cs->wd_list
   a406abeb7416 media: rc: oops in ir_timer_keyup after device unplug
   67f7c68a9085 xhci: Fix USB3 NULL pointer dereference at logical disconnect.
   2be27d444f61 net: lan78xx: Fix race in tx pending skb size calculation
   12c0949a0745 rtlwifi: rtl8821ae: fix firmware is not ready to run
   ee8d2e719c1e rtlwifi: Fix kernel Oops "Fw download fail!!"
   3caea5150c15 net: cxgb3_main: fix potential Spectre v1
   d8530e891edd VSOCK: fix loopback on big-endian systems
   7eba6537c3d1 vhost_net: validate sock before trying to put its fd
   2dc4696ee6d9 tcp: prevent bogus FRTO undos with non-SACK flows
   3373d6d056d7 tcp: fix Fast Open key endianness
   4f5f7bce308e strparser: Remove early eaten to fix full tcp receive buffer stall
   32761addd300 stmmac: fix DMA channel hang in half-duplex mode
   5e90946baa57 r8152: napi hangup fix after disconnect
   d8c1603d0bb4 qmi_wwan: add support for the Dell Wireless 5821e module
   dd537828bf73 qed: Limit msix vectors in kdump kernel to the minimum required count.
   023a2043bc8a qed: Fix use of incorrect size in memcpy call.
   4c2849931b23 qed: Fix setting of incorrect eswitch mode.
   d725fde81ffc qede: Adverstise software timestamp caps when PHC is not available.
   35e324ebeee0 net/tcp: Fix socket lookups with SO_BINDTODEVICE
   b3c66b54d8fe net: sungem: fix rx checksum support
   b36f997add36 net_sched: blackhole: tell upper qdisc about dropped packets
   5e6b4b9b28b7 net/packet: fix use-after-free
   ddbbd3e05743 net: mvneta: fix the Rx desc DMA address in the Rx path
   7ae129dd6778 net/mlx5: Fix wrong size allocation for QoS ETC TC regitster
   46ff2bc7aeb1 net/mlx5: Fix required capability for manipulating MPFS
   8b7b5f76693c net/mlx5: Fix incorrect raw command length parsing
   075b50381248 net/mlx5: Fix command interface race in polling mode
   c3994f4f8bda net/mlx5: E-Switch, Avoid setup attempt if not being e-switch manager
   b216867c02ac net/mlx5e: Don't attempt to dereference the ppriv struct if not being eswitch manager
   1d8dda4444fa net/mlx5e: Avoid dealing with vport representors if not being e-switch manager
   f389c17b8dc5 net: macb: Fix ptp time adjustment for large negative delta
   b364a914c499 net: fix use-after-free in GRO with ESP
   fb6b14663d56 net: dccp: switch rx_tstamp_last_feedback to monotonic clock
   a3225a836e56 net: dccp: avoid crash in ccid3_hc_rx_send_feedback()
   a2e53d69f685 ixgbe: split XDP_TX tail and XDP_REDIRECT map flushing
   f5a42d63f0d4 ipvlan: fix IFLA_MTU ignored on NEWLINK
   d10c0baaae3f ipv6: sr: fix passing wrong flags to crypto_alloc_shash()
   e34e92d8b689 hv_netvsc: split sub-channel setup into async and sync
   43c9207d0296 atm: zatm: Fix potential Spectre v1
   f93d65939a4a atm: Preserve value of skb->truesize when accounting to vcc
   c62e2f087af1 alx: take rtnl before calling __alx_open from resume
   03bb9187754e crypto: crypto4xx - fix crypto4xx_build_pdr, crypto4xx_build_sdr leak
   996a6a393b3f crypto: crypto4xx - remove bad list_del
   dc3782a3e9c6 PCI: exynos: Fix a potential init_clk_resources NULL pointer dereference
   b1c3ce0cfff2 bcm63xx_enet: do not write to random DMA channel on BCM6345
   b913a05ab75e bcm63xx_enet: correct clock usage
   1ccab2bf726e ocfs2: ip_alloc_sem should be taken in ocfs2_get_block()
   c59a8f13f36b ocfs2: subsystem.su_mutex is required while accessing the item->ci_parent
   f5778c2d657e xprtrdma: Fix corner cases when handling device removal
   1083a7e8130c cpufreq / CPPC: Set platform specific transition_delay_us
   61a9f6b7fe0c Btrfs: fix duplicate extents after fsync of file with prealloc extents
   edefb935700c x86/paravirt: Make native_save_fl() extern inline
   92e50158fc0a x86/asm: Add _ASM_ARG* constants for argument registers to <asm/asm.h>
   779145a6f6ec compiler-gcc.h: Add __attribute__((gnu_inline)) to all inline declarations
   cff26c95b24c Linux 4.14.56
   eab3a3412215 f2fs: give message and set need_fsck given broken node id
   d2c18ad18cc7 loop: remember whether sysfs_create_group() was done
   e8484443c9db RDMA/ucm: Mark UCM interface as BROKEN
   140eae92cf70 PM / hibernate: Fix oops at snapshot_write()
   6f9f5797fc7d loop: add recursion validation to LOOP_CHANGE_FD
   348b32aa3a37 netfilter: x_tables: initialise match/target check parameter struct
   e5ee20c65b34 netfilter: nf_queue: augment nfqa_cfg_policy
   0032322689bb uprobes/x86: Remove incorrect WARN_ON() in uprobe_init_insn()
   19f39eff68b4 crypto: x86/salsa20 - remove x86 salsa20 implementations
   2a017ea2ea14 nvme-pci: Remap CMB SQ entries on every controller reset
   54ca2776fcca xen: setup pv irq ops vector earlier
   f47f1f976745 iw_cxgb4: correctly enforce the max reg_mr depth
   33beaca902a6 i2c: tegra: Fix NACK error handling
   ac5270d4bd46 IB/hfi1: Fix incorrect mixing of ERR_PTR and NULL return values
   e61f8cb63ede tools build: fix # escaping in .cmd files for future Make
   d8148f732748 arm64: neon: Fix function may_use_simd() return error status
   324881805629 kbuild: delete INSTALL_FW_PATH from kbuild documentation
   36244e3a60cf tracing: Reorder display of TGID to be after PID
   81ebc9decd16 mm: do not bug_on on incorrect length in __mm_populate()
   ff62981880d1 fs, elf: make sure to page align bss in load_elf_library
   e6f011384c92 fs/proc/task_mmu.c: fix Locked field in /proc/pid/smaps*
   684a2d8ed53f mm: do not drop unused pages when userfaultd is running
   f329f46764b1 ALSA: hda - Handle pm failure during hotplug
   11c6be539e1a ALSA: hda/realtek - two more lenovo models need fixup of MIC_LOCATION
   e58114824fa6 scsi: megaraid_sas: fix selection of reply queue
   c3aa570dd539 scsi: megaraid_sas: Create separate functions to allocate ctrl memory
   fda0eab89ccf scsi: megaraid_sas: replace is_ventura with adapter_type checks
   90229163fa6c scsi: megaraid_sas: replace instance->ctrl_context checks with instance->adapter_type
   d7e6dcdaa3ea scsi: megaraid_sas: use adapter_type for all gen controllers
   ef86f3a72adb genirq/affinity: assign vectors to all possible CPUs
   298243a5fb64 Fix up non-directory creation in SGID directories
   a6d26649fda0 devpts: resolve devpts bind-mounts
   cd360be6488c devpts: hoist out check for DEVPTS_SUPER_MAGIC
   7499390b8ba5 xhci: xhci-mem: off by one in xhci_stream_id_to_ring()
   55f51e5b4cff usb: quirks: add delay quirks for Corsair Strafe
   82b9cb4d3f06 USB: serial: mos7840: fix status-register error handling
   90f2a76ccd37 USB: yurex: fix out-of-bounds uaccess in read handler
   f24b02c3a081 USB: serial: keyspan_pda: fix modem-status error handling
   7aa69d8f50be USB: serial: cp210x: add another USB ID for Qivicon ZigBee stick
   7ce4add980f5 USB: serial: ch341: fix type promotion bug in ch341_control_in()
   1fb3563fac7e ahci: Disable LPM on Lenovo 50 series laptops with a too old BIOS
   1e39eb1bb1c0 vmw_balloon: fix inflation with batching
   33b9257a64fe ata: Fix ZBC_OUT all bit handling
   aae31a169efb ata: Fix ZBC_OUT command block check
   a3bb42c1bc6c staging: r8822be: Fix RTL8822be can't find any wireless AP
   e5bb39faedd7 staging: rtl8723bs: Prevent an underflow in rtw_check_beacon_data().
   908bfe10dd14 ibmasm: don't write out of bounds in read handler
   ccb242ec5020 mmc: dw_mmc: fix card threshold control configuration
   2c9fa8ff7045 mmc: sdhci-esdhc-imx: allow 1.8V modes without 100/200MHz pinctrl states
   6fce06b68b44 MIPS: Fix ioremap() RAM check
   0818c44b8df7 MIPS: Use async IPIs for arch_trigger_cpumask_backtrace()
   14ab9902422c MIPS: Call dump_stack() from show_regs()
   77f738e84293 ASoC: mediatek: preallocate pages use platform device
   99ebaf4f43dd media: rc: mce_kbd decoder: fix stuck keys
   1e92e813554a Linux 4.14.55
   b3ef356a096e Revert mm/vmstat.c: fix vmstat_update() preemption BUG
   7cf346dfdea5 sched, tracing: Fix trace_sched_pi_setprio() for deboosting
   32199c810655 staging: comedi: quatech_daqp_cs: fix no-op loop daqp_ao_insn_write()
   6d2b458d3d14 netfilter: nf_log: don't hold nf_log_mutex during user access
   ac6bfe418e04 mtd: cfi_cmdset_0002: Change erase functions to check chip good only
   b76d8aa04240 mtd: cfi_cmdset_0002: Change erase functions to retry for error
   eb638a002274 mtd: cfi_cmdset_0002: Change definition naming to retry write operation
   74ec37d03a12 dm: prevent DAX mounts if not supported
   0605fa6daa66 dm: set QUEUE_FLAG_DAX accordingly in dm_table_set_restrictions()
   3729e5561e1e dax: check for QUEUE_FLAG_DAX in bdev_dax_supported()
   8214347c260b dax: change bdev_dax_supported() to support boolean returns
   a19385766b4f fs: allow per-device dax status checking for filesystems
   5941026fc7a5 mtd: rawnand: mxc: set spare area size register explicitly
   c4097c64d03a media: cx25840: Use subdev host data for PLL override
   e82885490a61 Kbuild: fix # escaping in .cmd files for future Make
   3bb6397ba643 Revert "dpaa_eth: fix error in dpaa_remove()"
   42dc2a7bb72e f2fs: truncate preallocated blocks in error case
   a2c7493c7f31 media: vb2: core: Finish buffers at the end of the stream
   b16a6af97461 mm: hwpoison: disable memory error handling on 1GB hugepage
   07a1c2d1131b irq/core: Fix boot crash when the irqaffinity= boot parameter is passed on CPUMASK_OFFSTACK=y kernels(v1)
   50b4d984f55e HID: debug: check length before copy_to_user()
   c1d21fe74c25 HID: hiddev: fix potential Spectre v1
   702027291bf5 HID: i2c-hid: Fix "incomplete report" noise
   c894755d1bc8 block: cope with WRITE ZEROES failing in blkdev_issue_zeroout()
   3e3f1310c606 block: factor out __blkdev_issue_zero_pages()
   fba3230595cb ext4: check superblock mapped prior to committing
   54bf664ae4fa ext4: add more mount time checks of the superblock
   c24aab6d8664 ext4: add more inode number paranoia checks
   02945e49dc20 ext4: avoid running out of journal credits when appending to an inline file
   8a9ef17c0dc9 ext4: never move the system.data xattr out of the inode body
   deb465ec750b ext4: clear i_data in ext4_inode_info when removing inline data
   64804502d0e9 ext4: include the illegal physical block in the bad map ext4_error msg
   d69a9df614fc ext4: verify the depth of extent tree in ext4_find_extent()
   44a4bc970bfa ext4: only look at the bg_flags field if it is valid
   ac48bb9bc0a3 ext4: always check block group bounds in ext4_init_block_bitmap()
   ac93c718365a ext4: make sure bitmaps and the inode table don't overlap with bg descriptors
   3150e8913b95 ext4: always verify the magic number in xattr blocks
   0dc148230f38 ext4: add corruption check in ext4_xattr_set_entry()
   0321e68838d7 jbd2: don't mark block as modified if the handle is out of credits
   b541f470d4bd drm/udl: fix display corruption of the last line
   3cb81bce2191 drm: Use kvzalloc for allocating blob property memory
   748144f35514 cifs: Fix slab-out-of-bounds in send_set_info() on SMB2 ACE setting
   28cada984c0e cifs: Fix infinite loop when using hard mount option
   f5f485d888d5 cifs: Fix memory leak in smb2_set_ea()
   ff533735af1d cifs: Fix use after free of a mid_q_entry
   5d8ddc819c84 vfio: Use get_user_pages_longterm correctly
   0ce6c4646371 drbd: fix access after free
   2b6eff5923ce s390: Correct register corruption in critical section cleanup
   e6cf7e687285 scsi: target: Fix truncated PR-in ReadKeys response
   6e51bfa95086 scsi: sg: mitigate read/write abuse
   54f1da1ff034 tracing: Fix missing return symbol in function_graph output
   48b019a51ab8 mm: hugetlb: yield when prepping struct pages
   6fe74fb8af89 userfaultfd: hugetlbfs: fix userfaultfd_huge_must_wait() pte access
   5893f4c3fb78 Linux 4.14.54
   88b01cac4add net: dsa: b53: Add BCM5389 support
   28b64cc7a846 net/sonic: Use dma_mapping_error()
   4888ced6b749 platform/x86: asus-wmi: Fix NULL pointer dereference
   0d5e04e239ad sched/core: Require cpu_active() in select_task_rq(), for user tasks
   e4c55e0e6a75 sched/core: Fix rules for running on online && !active CPUs
   93b84462eadf fs: clear writeback errors in inode_init_always
   ae14c044587e perf bpf: Fix NULL return handling in bpf__prepare_load()
   be5af6bec31a perf test: "Session topology" dumps core on s390
   d689ad5c91af net: qmi_wwan: Add Netgear Aircard 779S
   d20dcd2f1135 atm: zatm: fix memcmp casting
   3ee6bd9411a6 iwlwifi: pcie: compare with number of IRQs requested for, not number of CPUs
   4abab5dca723 ipvs: fix buffer overflow with sync daemon and service
   27aa533f24e9 netfilter: nft_limit: fix packet ratelimiting
   510e1e8020a8 s390/dasd: use blk_mq_rq_from_pdu for per request data
   db73501ebc3a netfilter: ebtables: handle string from userspace with care
   e36bc9930d85 afs: Fix directory permissions check
   4cf1fbcdef7f xfrm6: avoid potential infinite loop in _decode_session6()
   693d06dffb43 mtd: rawnand: fix return value check for bad block status
   0ed70f206449 ARM: dts: imx6q: Use correct SDMA script for SPI5 core
   259cc05cce43 netfilter: nf_tables: use WARN_ON_ONCE instead of BUG_ON in nft_do_chain()
   5acd64888e02 netfilter: ip6t_rpfilter: provide input interface for route lookup
   3f8e85fbbaa5 netfilter: don't set F_IFACE on ipv6 fib lookups
   2fc45ef96287 md: remove special meaning of ->quiesce(.., 2)
   ce57466d323b md: allow metadata update while suspending.
   7c435e224530 md: use mddev_suspend/resume instead of ->quiesce()
   feabea216559 md: move suspend_hi/lo handling into core md code
   cc091f3fbbdb md: don't call bitmap_create() while array is quiesced.
   e44e4cf3a8db md: always hold reconfig_mutex when calling mddev_suspend()
   b8d8cde449fd netfilter: nf_tables: fix NULL-ptr in nf_tables_dump_obj()
   44956f98fd8b netfilter: nf_tables: add missing netlink attrs to policies
   082711fa3178 netfilter: nf_tables: fix memory leak on error exit return
   174757e28b7b netfilter: nf_tables: increase nft_counters_enabled in nft_chain_stats_replace()
   d3a9b8a51181 netfilter: nf_tables: disable preemption in nft_update_chain_stats()
   491b1a866e4a netfilter: nft_meta: fix wrong value dereference in nft_meta_set_eval
   2b93cb2861de netfilter: nf_tables: bogus EBUSY in chain deletions
   4ae6a7afae53 netfilter: nf_tables: don't assume chain stats are set when jumplabel is set
   365e73e07fba netfilter: nft_compat: fix handling of large matchinfo size
   ea200cdd6056 netfilter: nft_compat: prepare for indirect info storage
   1ea5ed0cadca netfilter: nf_tables: nft_compat: fix refcount leak on xt module
   1d795d1241d3 drm/i915: Enable provoking vertex fix on Gen9 systems.
   78e7000fe63f drm/amdgpu: Refactor amdgpu_vram_mgr_bo_invisible_size helper
   a1bf87cfb6ea drm/amdgpu: Use kvmalloc_array for allocating VRAM manager nodes array
   af597bb61370 drm/atmel-hlcdc: check stride values in the first plane
   7d0ed747bc56 drm/qxl: Call qxl_bo_unref outside atomic context
   dd19ea36f596 drm/amdgpu: fix the missed vcn fw version report
   40e2064b8fc7 drm/amdgpu: Add APU support in vi_set_vce_clocks
   ce686c42476e drm/amdgpu: Add APU support in vi_set_uvd_clocks
   b141de45e2dc vt: prevent leaking uninitialized data to userspace via /dev/vcs*
   b124a1c182fa serdev: fix memleak on module unload
   3ff8e558ba7b serial: 8250_pci: Remove stalled entries in blacklist
   2a7a8556b3b4 staging: android: ion: Return an ERR_PTR in ion_map_kernel
   c034d161fa63 n_tty: Access echo_* variables carefully.
   d105fb8c8894 n_tty: Fix stall at n_tty_receive_char_special().
   716382f1c1ea xhci: Fix kernel oops in trace_xhci_free_virt_device
   0a7db82ed9cc usb: typec: ucsi: Fix for incorrect status data issue
   47adbb26373f usb: typec: ucsi: acpi: Workaround for cache mode issue
   f2e9a38558d8 acpi: Add helper for deactivating memory region
   447294efb995 usb: dwc2: fix the incorrect bitmaps for the ports of multi_tt hub
   e80add5223dd USB: serial: cp210x: add Silicon Labs IDs for Windows Update
   15e449969537 USB: serial: cp210x: add CESINEL device ids
   874f2a7d412e usb: cdc_acm: Add quirk for Uniden UBC125 scanner
   fa745a1bd983 Linux 4.14.53
   4798e96b7646 xhci: Fix use-after-free in xhci_free_virt_device
   0b19825ffa28 dm thin: handle running out of data space vs concurrent discard
   fb4d8744a8f9 dm zoned: avoid triggering reclaim from inside dmz_map()
   0cfb151b9352 x86/efi: Fix efi_call_phys_epilog() with CONFIG_X86_5LEVEL=y
   251141340fd8 block: Fix cloning of requests with a special payload
   29413e068b2b block: Fix transfer when chunk sectors exceeds max
   804a0db743e0 slub: fix failure when we delete and create a slab cache
   cd41a8fac35a ALSA: hda/realtek - Fix the problem of two front mics on more machines
   c75f047560cb ALSA: hda/realtek - Add a quirk for FSC ESPRIMO U9210
   59bcd69457c7 ALSA: hda/realtek - Fix pop noise on Lenovo P50 & co
   69f96e9b570a ALSA: timer: Fix UBSAN warning at SNDRV_TIMER_IOCTL_NEXT_DEVICE ioctl
   3d1de95138fb Input: elantech - fix V4 report decoding for module with middle key
   524a0c6f2efd Input: elantech - enable middle button of touchpads on ThinkPad P52
   ade767642cc7 Input: elan_i2c_smbus - fix more potential stack buffer overflows
   8fa052853d48 Input: xpad - fix GPD Win 2 controller name
   1b241aa840df udf: Detect incorrect directory size
   d08dfdeaf49d xen: Remove unnecessary BUG_ON from __unbind_from_irq()
   fff76ff5e2b0 mm: fix devmem_is_allowed() for sub-page System RAM intersections
   6f23028480c4 mm/ksm.c: ignore STABLE_FLAG of rmap_item->address in rmap_walk_ksm()
   76022230aa64 rbd: flush rbd_dev->watch_dwork after watch is unregistered
   3c718460f5a3 pwm: lpss: platform: Save/restore the ctrl register over a suspend/resume
   24ab6e6858e7 Input: elan_i2c - add ELAN0618 (Lenovo v330 15IKB) ACPI ID
   a7f3c0abac1d ACPI / LPSS: Add missing prv_offset setting for byt/cht PWM devices
   9aa818d42bf5 video: uvesafb: Fix integer overflow in allocation
   fb7fecb4d90f NFSv4: Fix a typo in nfs41_sequence_process
   63715ead82c5 NFSv4: Revert commit 5f83d86cf531d ("NFSv4.x: Fix wraparound issues..")
   c92d800fc9c4 NFSv4: Fix possible 1-byte stack overflow in nfs_idmap_read_and_verify_message
   89864c2e7506 nfsd: restrict rd_maxcount to svc_max_payload in nfsd_encode_readdir
   c508ed236c8b media: dvb_frontend: fix locking issues at dvb_frontend_get_event()
   2c40fa51428b media: cx231xx: Add support for AverMedia DVD EZMaker 7
   06b846486668 media: v4l2-compat-ioctl32: prevent go past max size
   b28f53169c0f media: vsp1: Release buffers for each video node
   3564366d5509 perf/x86/intel/uncore: Add event constraint for BDX PCU
   5cb6105d2211 perf vendor events: Add Goldmont Plus V1 event file
   c3382e70a043 perf intel-pt: Fix packet decoding of CYC packets
   4e7b3632eafa perf intel-pt: Fix "Unexpected indirect branch" error
   65a163984abe perf intel-pt: Fix MTC timing after overflow
   e1587f178eb1 perf intel-pt: Fix decoding to accept CBR between FUP and corresponding TIP
   9e9db211cfb9 perf intel-pt: Fix sync_switch INTEL_PT_SS_NOT_TRACING
   5009bd5b9321 perf tools: Fix symbol and object code resolution for vdso32 and vdsox32
   f810961e06c6 arm: dts: mt7623: fix invalid memory node being generated
   18be8bd3aceb mfd: intel-lpss: Fix Intel Cannon Lake LPSS I2C input clock
   f79c97198b55 mfd: intel-lpss: Program REMAP register in PIO mode
   779d5f71c232 backlight: tps65217_bl: Fix Device Tree node lookup
   f893fca0a4b5 backlight: max8925_bl: Fix Device Tree node lookup
   3db7c40093f6 backlight: as3711_bl: Fix Device Tree node lookup
   b7261fc5f574 UBIFS: Fix potential integer overflow in allocation
   a23cf10d9abb ubi: fastmap: Correctly handle interrupted erasures in EBA
   b24d90f4d66d ubi: fastmap: Cancel work upon detach
   db04f92b6580 rpmsg: smd: do not use mananged resources for endpoints and channels
   dfeb333b590c md: fix two problems with setting the "re-add" device state.
   88896a963b4e rtc: sun6i: Fix bit_idx value for clk_register_gate
   b90f3eccf8aa clk: at91: PLL recalc_rate() now using cached MUL and DIV values
   a98f1946ea58 linvdimm, pmem: Preserve read-only setting for pmem devices
   a64be479ef08 scsi: zfcp: fix missing REC trigger trace on enqueue without ERP thread
   beadcfcca257 scsi: zfcp: fix missing REC trigger trace for all objects in ERP_FAILED
   60ed2673986f scsi: zfcp: fix missing REC trigger trace on terminate_rport_io for ERP_FAILED
   071f23266c30 scsi: zfcp: fix missing REC trigger trace on terminate_rport_io early return
   3d0d31e512f2 scsi: zfcp: fix misleading REC trigger trace where erp_action setup failed
   941e8bee351e scsi: zfcp: fix missing SCSI trace for retry of abort / scsi_eh TMF
   74da693a03ce scsi: zfcp: fix missing SCSI trace for result of eh_host_reset_handler
   9db2ad79b8f0 scsi: qla2xxx: Mask off Scope bits in retry delay
   9224583a5ee2 scsi: qla2xxx: Fix setting lower transfer speed if GPSC fails
   2829829c3e61 scsi: hpsa: disable device during shutdown
   2d329968a883 mm: fix __gup_device_huge vs unmap
   5d6ad5a03067 iio: sca3000: Fix an error handling path in 'sca3000_probe()'
   d55209eeb121 iio: adc: ad7791: remove sample freq sysfs attributes
   6101eea47bf3 Btrfs: fix return value on rename exchange failure
   af20e4eccc2d X.509: unpack RSA signatureValue field from BIT STRING
   7dfc81992a3e irqchip/gic-v3-its: Don't bind LPI to unavailable NUMA node
   88c4318d3633 time: Make sure jiffies_to_msecs() preserves non-zero time periods
   0fe95015fb93 MIPS: io: Add barrier after register read in inX()
   93e1297f9edc cpufreq: intel_pstate: Fix scaling max/min limits with Turbo 3.0
   55be2e6f50ac pinctrl: devicetree: Fix pctldev pointer overwrite
   7cc7ae5ce018 pinctrl: samsung: Correct EINTG banks order
   9e838b2e5a3c auxdisplay: fix broken menu
   226ffbf6135c PCI: pciehp: Clear Presence Detect and Data Link Layer Status Changed on resume
   fc0096bceae9 PCI: Add ACS quirk for Intel 300 series
   78923ba96779 PCI: Add ACS quirk for Intel 7th & 8th Gen mobile
   e4a424c550b6 PCI: hv: Make sure the bus domain is really unique
   43f6a09c8c5b MIPS: BCM47XX: Enable 74K Core ExternalSync for PCIe erratum
   c375d0bd6684 mtd: cfi_cmdset_0002: Avoid walking all chips when unlocking.
   fbbde9343c3e mtd: cfi_cmdset_0002: Fix unlocking requests crossing a chip boudary
   2f11a0c8c23a mtd: cfi_cmdset_0002: fix SEGV unlocking multiple chips
   80349943d56c mtd: cfi_cmdset_0002: Use right chip in do_ppb_xxlock()
   746c1362c434 mtd: cfi_cmdset_0002: Change write buffer to check correct value
   d097e5b5a1bc xprtrdma: Return -ENOBUFS when no pages are available
   786c8d79f34f RDMA/mlx4: Discard unknown SQP work requests
   a33699925122 IB/hfi1: Fix user context tail allocation for DMA_RTAIL
   964705c4a691 IB/hfi1: Optimize kthread pointer locking when queuing CQ entries
   2bd28cba43bd IB/hfi1: Reorder incorrect send context disable
   9e81f9a2cef1 IB/hfi1: Fix fault injection init/exit issues
   c32951862c1a IB/isert: fix T10-pi check mask setting
   7d4aaca8d093 IB/isert: Fix for lib/dma_debug check_sync warning
   c06f8c2173b2 IB/mlx5: Fetch soft WQE's on fatal error state
   96fb9b88385f IB/core: Make testing MR flags for writability a static inline function
   1c82abc1b26a IB/mlx4: Mark user MR as writable if actual virtual memory is writable
   49e1083214c6 IB/{hfi1, qib}: Add handling of kernel restart
   e884ed82995a IB/qib: Fix DMA api warning with debug kernel
   c41cb9cb5611 tpm: fix race condition in tpm_common_write()
   1bf1a5e21798 tpm: fix use after free in tpm2_load_context()
   1ed6871464b8 of: platform: stop accessing invalid dev in of_platform_device_destroy
   6ba51909693c of: unittest: for strings, account for trailing \0 in property length field
   4910cc250b4d of: overlay: validate offset from property fixups
   728ea2302acc ARM64: dts: meson: disable sd-uhs modes on the libretech-cc
   64df84dcf1e4 arm64: mm: Ensure writes to swapper are ordered wrt subsequent cache maintenance
   ee6ae5ac75ab arm64: kpti: Use early_param for kpti= command-line option
   cdfa28c29ad4 arm64: Fix syscall restarting around signal suppressed by tracer
   14ca7d344e27 ARM: dts: socfpga: Fix NAND controller node compatible for Arria10
   ae6647c78ff8 ARM: dts: socfpga: Fix NAND controller clock supply
   3482130d8d1e ARM: dts: socfpga: Fix NAND controller node compatible
   3db24d2e192f ARM: dts: Fix SPI node for Arria10
   eda170a9fe51 ARM: 8764/1: kgdb: fix NUMREGBYTES so that gdb_regs[] is the correct size
   c9debbd1a5b8 cxl: Disable prefault_mode in Radix mode
   971a55574b47 soc: rockchip: power-domain: Fix wrong value when power up pd with writemask
   56fbab60aa47 powerpc/fadump: Unregister fadump on kexec down path.
   3b185e667b52 cpuidle: powernv: Fix promotion from snooze if next state disabled
   a5d49dfb20c9 powerpc/powernv/cpuidle: Init all present cpus for deep states
   134e70c22eb0 powerpc/powernv: copy/paste - Mask SO bit in CR
   0e8bb91c6dd6 powerpc/powernv/ioda2: Remove redundant free of TCE pages
   919c9b8187bc powerpc/ptrace: Fix enforcement of DAWR constraints
   1ab9092356a1 powerpc/perf: Fix memory allocation for core-imc based on num_possible_cpus()
   c12d24161611 powerpc/ptrace: Fix setting 512B aligned breakpoints with PTRACE_SET_DEBUGREG
   5fefd9a5d97a powerpc/mm/hash: Add missing isync prior to kernel stack SLB switch
   69829f749a43 fuse: fix control dir setup and teardown
   3a37d85a90da fuse: don't keep dead fuse_conn at fuse_fill_super().
   2f7bf369b5f8 fuse: atomic_o_trunc should truncate pagecache
   02832578eb9d fuse: fix congested state leak on aborted connections
   a47c3c48769a printk: fix possible reuse of va_list variable
   affd84024cbe Bluetooth: hci_qca: Avoid missing rampatch failure with userspace fw loader
   3ffecef63d09 ipmi:bt: Set the timeout before doing a capabilities check
   26e03f8dcd34 branch-check: fix long->int truncation when profiling branches
   5eff5dbf3108 mips: ftrace: fix static function graph tracing
   5f7a15af646d ftrace/selftest: Have the reset_trigger code be a bit more careful
   ea0ac01f68aa lib/vsprintf: Remove atomic-unsafe support for %pCr
   9fcc267de242 clk: renesas: cpg-mssr: Stop using printk format %pCr
   0cf93821e34d thermal: bcm2835: Stop using printk format %pCr
   b2291a435c29 ASoC: cirrus: i2s: Fix {TX|RX}LinCtrlData setup
   b5e8118779e5 ASoC: cirrus: i2s: Fix LRCLK configuration
   7a1d79de77f5 ASoC: cs35l35: Add use_single_rw to regmap config
   040fecfd714a ASoC: dapm: delete dapm_kcontrol_data paths list before freeing it
   4e0ce7053a12 1wire: family module autoload fails because of upper/lower case mismatch.
   3c22218ed869 usb: do not reset if a low-speed or full-speed device timed out
   8b03376580c9 PM / OPP: Update voltage in case freq == old_freq
   ba0be5973f9e PM / core: Fix supplier device runtime PM usage counter imbalance
   b7ac0389770a PM / Domains: Fix error path during attach in genpd
   8ae5d476a3b7 signal/xtensa: Consistenly use SIGBUS in do_unaligned_user
   980899da5dc9 serial: sh-sci: Use spin_{try}lock_irqsave instead of open coding version
   60711b27c5f5 m68k/mac: Fix SWIM memory resource end address
   da9ad89c72d5 m68k/mm: Adjust VM area to be unmapped by gap size for __iounmap()
   ab693cc665ca x86: Call fixup_exception() before notify_die() in math_error()
   64d44661e220 x86/mce: Do not overwrite MCi_STATUS in mce_no_way_out()
   5b8e086891b0 x86/mce: Fix incorrect "Machine check from unknown source" message
   d292f33b7494 x86/mce: Check for alternate indication of machine check recovery on Skylake
   1d1dd2011adc x86/mce: Improve error message when kernel cannot recover
   dbb37d98b93d x86/xen: Add call of speculative_store_bypass_ht_init() to PV paths
   3ce79716a9ff x86/spectre_v1: Disable compiler optimizations over array_index_mask_nospec()
   a26899e0baa4 Linux 4.14.52
   1d26c112959f mm, page_alloc: do not break __GFP_THISNODE by zonelist reset
   250edf9580f7 fs/binfmt_misc.c: do not allow offset overflow
   7446344baafb vhost: fix info leak due to uninitialized memory
   d37c95f52911 HID: wacom: Correct logical maximum Y for 2nd-gen Intuos Pro large
   ab17de60ceaa HID: intel_ish-hid: ipc: register more pm callbacks to support hibernation
   e3e6bd6a1476 orangefs: report attributes_mask and attributes for statx
   f7e4328c3700 orangefs: set i_size on new symlink
   b8511dbff263 iwlwifi: fw: harden page loading code
   2d58a9ac892a x86/intel_rdt: Enable CMT and MBM on new Skylake stepping
   e6ef46cb8f01 w1: mxc_w1: Enable clock before calling clk_get_rate() on it
   0667483adeee libata: Drop SanDisk SD7UB3Q*G1001 NOLPM quirk
   27c0f1e5d94d libata: zpodd: small read overflow in eject_tray()
   1404d2e5dd36 cpufreq: governors: Fix long idle detection logic in load calculation
   c3c77b5db393 cpufreq: Fix new policy initialization during limits updates via sysfs
   67b46304b92b bdi: Move cgroup bdi_writeback to a dedicated low concurrency workqueue
   ba502bf2be45 blk-mq: reinit q->tag_set_list entry only after grace period
   00946218ffe3 nbd: use bd_set_size when updating disk size
   a477d00557f5 nbd: update size when connected
   edee2e826640 nbd: fix nbd device deletion
   ffb179cfbcf6 cifs: For SMB2 security informaion query, check for minimum sized security descriptor instead of sizeof FileAllInformation class
   2a8737336dbd CIFS: 511c54a2f69195b28afb9dd119f03787b1625bb4 adds a check for session expiry
   ae62f35def75 smb3: on reconnect set PreviousSessionId field
   dcde75924f25 smb3: fix various xid leaks
   e0b510a4170e x86/MCE: Fix stack out-of-bounds write in mce-inject.c: Flags_read()
   c5c00990f75d ALSA: hda: add dock and led support for HP ProBook 640 G4
   e6c9fd8cf7d0 ALSA: hda: add dock and led support for HP EliteBook 830 G5
   a3eb20df0e23 ALSA: hda - Handle kzalloc() failure in snd_hda_attach_pcm_stream()
   03701e42cc19 ALSA: hda/conexant - Add fixup for HP Z2 G4 workstation
   ff7eb857eeca ALSA: hda/realtek - Enable mic-mute hotkey for several Lenovo AIOs
   b1cf23c2c8db btrfs: scrub: Don't use inode pages for device replace
   4cb8942042bd btrfs: return error value if create_io_em failed in cow_file_range
   5f7e3b5b96f8 Btrfs: fix memory and mount leak in btrfs_ioctl_rm_dev_v2()
   55d29ff48222 Btrfs: fix clone vs chattr NODATASUM race
   c81a6be9da6d driver core: Don't ignore class_dir_create_and_add() failure.
   f3233cb2485c ext4: fix fencepost error in check for inode count overflow during resize
   21542545990c ext4: correctly handle a zero-length xattr with a non-zero e_value_offs
   02d45ec6e770 ext4: bubble errors from ext4_find_inline_data_nolock() up to ext4_iget()
   e81d371dac30 ext4: do not allow external inodes for inline data
   bd713edfc85d ext4: update mtime in ext4_punch_hole even if no blocks are released
   f70af46a52b3 ext4: fix hole length detection in ext4_ind_map_blocks()
   84f4d2c6dabe NFSv4.1: Fix up replays of interrupted requests
   5e8a5c30546f tls: fix use-after-free in tls_push_record
   244c10f9bfa3 hv_netvsc: Fix a network regression after ifdown/ifup
   5320e035d7bb net: in virtio_net_hdr only add VLAN_HLEN to csum_start if payload holds vlan
   2e5d3168821d udp: fix rx queue len reported by diag and proc interface
   91717ffc9057 socket: close race condition between sock_close() and sockfs_setattr()
   39f4ae01c1d6 tcp: verify the checksum of the first data segment in a new connection
   81d159444da5 net/sched: act_simple: fix parsing of TCA_DEF_DATA
   73c0eab8d215 net: dsa: add error handling for pskb_trim_rcsum
   6bcc27abfa62 ipv6: allow PMTU exceptions to local routes
   6e48ee025dc9 cdc_ncm: avoid padding beyond end of skb
   584b975af0d2 bonding: re-evaluate force_primary when the primary slave name changes
   33445c07cd45 Linux 4.14.51
   40c809774c69 tcp: do not overshoot window_clamp in tcp_rcv_space_adjust()
   7ab8fc065fff Btrfs: make raid6 rebuild retry more
   6bf89b7c6b31 Btrfs: fix scrub to repair raid6 corruption
   db5f02cc70a8 Revert "Btrfs: fix scrub to repair raid6 corruption"
   5e4b5b7194d3 ARM: kexec: fix kdump register saving on panic()
   bb7a554ae745 ARM: 8758/1: decompressor: restore r1 and r2 just before jumping to the kernel
   c7d7e3f62dbe ARM: 8753/1: decompressor: add a missing parameter to the addruart macro
   823e02ea7be5 efi/libstub/arm64: Handle randomized TEXT_OFFSET
   3f5c7add0d0f parisc: Move setup_profiling_timer() out of init section
   588977742078 sched/deadline: Make the grub_reclaim() function static
   fb49d19ed9da sched/debug: Move the print_rt_rq() and print_dl_rq() declarations to kernel/sched/sched.h
   96ef5c441494 drm/dumb-buffers: Integer overflow in drm_mode_create_ioctl()
   77a60e752ec8 locking/percpu-rwsem: Annotate rwsem ownership transfer by setting RWSEM_OWNER_UNKNOWN
   b3f84e48786d locking/rwsem: Add a new RWSEM_ANONYMOUSLY_OWNED flag
   c5746752bdbe clk: imx6ull: use OSC clock during AXI rate change
   0c5dfa51caf7 ARM: davinci: board-dm646x-evm: set VPIF capture card name
   eb6b0d6987fc ARM: davinci: board-dm646x-evm: pass correct I2C adapter id for VPIF
   ae7418dd09f9 ARM: davinci: dm646x: fix timer interrupt generation
   daf6bdb29d55 i2c: viperboard: return message count on master_xfer success
   cbfe697cdba9 i2c: pmcmsp: fix error return from master_xfer
   0c1885743a9b i2c: pmcmsp: return message count on master_xfer success
   7416dd78ad9a ARM: keystone: fix platform_domain_notifier array overrun
   a187b9c72d0c usb: musb: fix remote wakeup racing with suspend
   634b9e0aabd9 afs: Fix the non-encryption of calls
   a92a28636157 mtd: Fix comparison in map_word_andequal()
   9b9ac282bad9 x86/pkeys/selftests: Add a test for pkey 0
   b1f192a9e0cd x86/pkeys/selftests: Save off 'prot' for allocations
   cdfdffcaa8f9 x86/pkeys/selftests: Fix pointer math
   2dd0e5d62a6b x86/pkeys/selftests: Fix pkey exhaustion test off-by-one
   63bdea73bd52 x86/pkeys/selftests: Add PROT_EXEC test
   1fcd226878b3 x86/pkeys/selftests: Factor out "instruction page"
   777d513aaaf6 x86/pkeys/selftests: Allow faults on unknown keys
   9545530701c9 x86/pkeys/selftests: Remove dead debugging code, fix dprint_in_signal
   8b9f3a7404d7 x86/pkeys/selftests: Stop using assert()
   477c024fb33a x86/pkeys/selftests: Give better unexpected fault error messages
   4824a6473b85 x86/selftests: Add mov_to_ss test
   c25b160c8da6 x86/mpx/selftests: Adjust the self-test to fresh distros that export the MPX ABI
   2361f1f4fff2 x86/pkeys/selftests: Adjust the self-test to fresh distros that export the pkeys ABI
   847f0cacf21e objtool, kprobes/x86: Sync the latest <asm/insn.h> header with tools/objtool/arch/x86/include/asm/insn.h
   5aaee3e9ef32 uprobes/x86: Prohibit probing on MOV SS instruction
   ba202cd5a1f0 kprobes/x86: Prohibit probing on exception masking instructions
   12ddc2639e31 ocfs2: take inode cluster lock before moving reflinked inode from orphan dir
   553495752c82 proc/kcore: don't bounds check against address 0
   20e557fb26ca init: fix false positives in W+X checking
   86900754306e net sched actions: fix invalid pointer dereferencing if skbedit flags missing
   55e95f9ad712 ixgbe: return error on unsupported SFP module when resetting
   33d1c29e935e x86: Delay skip of emulated hypercall instruction
   ce44a4d5db63 KVM: Extend MAX_IRQ_ROUTES to 4096 for all archs
   29475c404b56 rxrpc: Fix the min security level for kernel calls
   b2abd2b98afc rxrpc: Fix error reception on AF_INET6 sockets
   b5b3188098b3 qede: Fix gfp flags sent to rdma event node allocation
   6618d064baca qed: Fix l2 initializations over iWARP personality
   dc5af7b0de98 tipc: eliminate KMSAN uninit-value in strcmp complaint
   6ca2fa569d65 agp: uninorth: make two functions static
   8223298c5075 cifs: smb2ops: Fix listxattr() when there are no EAs
   fcc0315abc95 arm64: Add MIDR encoding for NVIDIA CPUs
   56068475a7f0 can: dev: increase bus-off message severity
   4dc2437cdd6b net: aquantia: driver should correctly declare vlan_features bits
   a951cf4da896 x86/xen: Reset VCPU0 info pointer after shared_info remap
   ba29f3738e86 mac80211: use timeout from the AddBA response instead of the request
   e4bd54eb87c8 ARM: dts: cygnus: fix irq type for arm global timer
   36166445a922 driver core: add __printf verification to __ata_ehi_pushv_desc
   bc707b2d950b drm/omap: handle alloc failures in omap_connector
   771f573cc158 drm/omap: check return value from soc_device_match
   a490d0570df2 drm/omap: fix possible NULL ref issue in tiler_reserve_2d
   9631f32b61dc drm/omap: fix uninitialized ret variable
   ca3c09a74945 drm/omap: silence unititialized variable warning
   6ad69952d50d mac80211: Adjust SAE authentication timeout
   46d6ee12fa9d tee: check shm references are consistent in offset/size
   d40e177f29ab sh: fix build failure for J2 cpu with SMP disabled
   0742396317a0 sched/core: Introduce set_special_state()
   a614eaa465f7 spi: bcm2835aux: ensure interrupts are enabled for shared handler
   373a625cb3c4 RDMA/cma: Do not query GID during QP state transition to RTR
   3c54e919bd4f IB/hfi1: Fix memory leak in exception path in get_irq_affinity()
   77662d35b8c5 IB/hfi1 Use correct type for num_user_context
   194feed06bce smc: fix sendpage() call
   9c0f528f6bf0 ARM: OMAP1: ams-delta: fix deferred_fiq handler
   ac5e86401fea nvme: Set integrity flag for user passthrough commands
   b19122a48f01 nvme: fix potential memory leak in option parsing
   665d3c7f1e50 iommu/vt-d: fix shift-out-of-bounds in bug checking
   d98905c00c4c arm64: tegra: Make BCM89610 PHY interrupt as active low
   61ca60932d52 kthread, sched/wait: Fix kthread_parkme() wait-loop
   e7a65e899d52 stop_machine, sched: Fix migrate_swap() vs. active_balance() deadlock
   a814d1101042 parisc: drivers.c: Fix section mismatches
   609377d79e75 bpf, x64: fix memleak when not converging after image
   666776d5f45d scsi: vmw-pvscsi: return DID_BUS_BUSY for adapter-initated aborts
   09e12b91d12c hexagon: export csum_partial_copy_nocheck
   8794fff6f4d9 hexagon: add memset_io() helper
   960fe000b1d3 Input: atmel_mxt_ts - fix the firmware update
   f8d7147cb60f ARM: dts: logicpd-som-lv: Fix Audio Mute
   8c4511032ac1 ARM: dts: logicpd-som-lv: Fix WL127x Startup Issues
   691f0a6b3b09 ARM: OMAP2+: powerdomain: use raw_smp_processor_id() for trace
   061a560f3293 dt-bindings: panel: lvds: Fix path to display timing bindings
   b1ac1ca7352d ARM: davinci: board-dm355-evm: fix broken networking
   034a9e9b235e ARM: davinci: board-omapl138-hawk: fix GPIO numbers for MMC/SD lookup
   0bf4a2db2964 ARM: davinci: board-da850-evm: fix GPIO lookup for MMC/SD
   38ffd4d581ff ARM: davinci: board-da830-evm: fix GPIO lookup for MMC/SD
   13e4a2083d2b IB/core: Make ib_mad_client_id atomic
   5cb0ba254fee <linux/stringhash.h>: fix end_name_hash() for 64bit long
   3fbbdb44cead IB/rxe: avoid double kfree_skb
   b4f6e28c801a IB/rxe: add RXE_START_MASK for rxe_opcode IB_OPCODE_RC_SEND_ONLY_INV
   d2be557eef15 RDMA/iwpm: fix memory leak on map_info
   019ce25a4ee0 RDMA/cma: Fix use after destroy access to net namespace for IPoIB
   84f66378da20 IB/uverbs: Fix validating mandatory attributes
   fb019834bf8e IB: make INFINIBAND_ADDR_TRANS configurable
   b8500e6e8eb5 ib_srp: depend on INFINIBAND_ADDR_TRANS
   08088b8a0793 ib_srpt: depend on INFINIBAND_ADDR_TRANS
   4e2b7d1687c4 nvmet-rdma: depend on INFINIBAND_ADDR_TRANS
   8e6dba9166ed nvme: depend on INFINIBAND_ADDR_TRANS
   5d33c9d0fbd8 tipc: fix bug in function tipc_nl_node_dump_monitor
   f1e5bbe86ec1 i2c: sprd: Fix the i2c count issue
   201dc1345bfe i2c: sprd: Prevent i2c accesses after suspend is called
   40d526e67212 bpf: fix uninitialized variable in bpf tools
   09daf2df8db8 x86/cpu/intel: Add missing TLB cpuid values
   75b0436b24d6 ata: ahci: mvebu: override ahci_stop_engine for mvebu AHCI
   48c0bf9af161 libahci: Allow drivers to override stop_engine
   81d27c6ed637 KVM: arm/arm64: vgic: fix possible spectre-v1 in vgic_mmio_read_apr()
   e3d1002e14ce arm64: fix possible spectre-v1 in ptrace_hbp_get_event()
   06beec871640 blk-mq: fix sysfs inflight counter
   11ac08bd73eb HID: intel-ish-hid: use put_device() instead of kfree()
   d803d94a3fcd rpmsg: added MODULE_ALIAS for rpmsg_char
   bb7894391aad remoteproc: qcom: Fix potential device node leaks
   af22d1b7705a perf/x86/intel: Don't enable freeze-on-smi for PerfMon V1
   3958294c661e rds: ib: Fix missing call to rds_ib_dev_put in rds_ib_setup_qp
   9079946f612b selftests: ftrace: Add a testcase for multiple actions on trigger
   27e13b330dd2 HID: wacom: Release device resource data obtained by devres_alloc()
   2f3ca3908fc0 HID: lenovo: Add support for IBM/Lenovo Scrollpoint mice
   e6ec885f5f4c arm64: ptrace: remove addr_limit manipulation
   ef0fa5e6f52b net: ethtool: Add missing kernel doc for FEC parameters
   b1d0907c6fed thermal: int3403_thermal: Fix NULL pointer deref on module load / probe
   56dfe52e04a2 drm/amdkfd: fix clock counter retrieval for node without GPU
   73ea96beb771 ACPI / watchdog: Prefer iTCO_wdt on Lenovo Z50-70
   00a85086e51f ARM: dts: da850: fix W=1 warnings with pinmux node
   9148e21d7624 net: phy: marvell: clear wol event before setting it
   b0471926ceb5 powerpc/powernv/memtrace: Let the arch hotunplug code flush cache
   a4fa9189d608 dt-bindings: meson-uart: DT fix s/clocks-names/clock-names/
   71c8e7432a2e ACPI / PM: Blacklist Low Power S0 Idle _DSM for ThinkPad X1 Tablet(2016)
   d3bd4954286b usb: typec: ucsi: fix tracepoint related build error
   6d2707f26892 mm: memcg: add __GFP_NOWARN in __memcg_schedule_kmem_cache_create()
   cd2cc6d13170 kexec_file: do not add extra alignment to efi memmap
   d497efd805fe proc: revalidate kernel thread inodes to root:root
   a20600762300 mm, pagemap: fix swap offset value for PMD migration entry
   6385f2da8b3b scsi: isci: Fix infinite loop in while loop
   12f9bb1a273e scsi: storvsc: Set up correct queue depth values for IDE devices
   fc0d99fde0d2 parisc: time: Convert read_persistent_clock() to read_persistent_clock64()
   6bf379f26a54 vfs: Undo an overly zealous MS_RDONLY -> SB_RDONLY conversion
   bd595dbfcbd6 net: hns: Avoid action name truncation
   ea7246c25892 blkcg: init root blkcg_gq under lock
   b6126afd64d0 drm/msm: don't deref error pointer in the msm_fbdev_create error path
   5151a0c8d730 drm/msm/dsi: use correct enum in dsi_get_cmd_fmt
   be04f7301d8d drm/msm: Fix possible null dereference on failure of get_pages()
   625b5b8c76d4 ASoC: msm8916-wcd-analog: use threaded context for mbhc events
   705fd605237b netfilter: nf_tables: fix out-of-bounds in nft_chain_commit_update
   d11b04c34894 netfilter: nf_tables: NAT chain and extensions require NF_TABLES
   348288a2699c scsi: target: fix crash with iscsi target and dvd
   4fb7926bba58 scsi: megaraid_sas: Do not log an error if FW successfully initializes.
   af2cc1d2e75c scsi: iscsi: respond to netlink with unicast when appropriate
   3f64c0c502ef tipc: fix infinite loop when dumping link monitor summary
   9d5e2d69705f blkcg: don't hold blkcg lock when deactivating policy
   c5b6316c3f51 spi: cadence: Add usleep_range() for cdns_spi_fill_tx_fifo()
   5f4bf078e779 ASoC: topology: Check widget kcontrols before deref.
   ff3080bab10d xen: xenbus_dev_frontend: Really return response string
   d5cf1ed8d3ae ASoC: topology: Fix bugs of freeing soc topology
   bd8acfd77dd3 PCI: kirin: Fix reset gpio name
   150efd30c3a0 soc: bcm2835: Make !RASPBERRYPI_FIRMWARE dummies return failure
   305043739272 soc: bcm: raspberrypi-power: Fix use of __packed
   d066fd9d7e9b eCryptfs: don't pass up plaintext names when using filename encryption
   3f54483edea2 ASoC: rt5514: Add the missing register in the readable table
   9d33f89c40e9 clk: honor CLK_MUX_ROUND_CLOSEST in generic clk mux
   dccf9862a7f5 dt-bindings: dmaengine: rcar-dmac: document R8A77965 support
   20d681359337 dt-bindings: serial: sh-sci: Add support for r8a77965 (H)SCIF
   20d3d7fa75b2 dt-bindings: pinctrl: sunxi: Fix reference to driver
   5eeb26c58c0a doc: Add vendor prefix for Kieback & Peter GmbH
   3ca7dddaa13f spi: sh-msiof: Fix bit field overflow writes to TSCR/RSCR
   b3ccb8a77ed1 MIPS: dts: Boston: Fix PCI bus dtc warnings:
   ba041775a9a8 isofs: fix potential memory leak in mount option parsing
   d27cd5cb9b38 s390/smsgiucv: disable SMSG on module unload
   e7b720ef94d8 MIPS: io: Add barrier after register read in readX()
   dc94ac5fc410 fsnotify: fix ignore mask logic in send_to_group()
   025e42a5e7a3 perf report: Fix switching to another perf.data file
   7bb0c4bd79ab nfp: ignore signals when communicating with management FW
   d96da2acac5d MIPS: io: Prevent compiler reordering writeX()
   df5524e5483b x86: Add check for APIC access address for vmentry of L2 guests
   9b78e9ddc47a KVM: X86: fix incorrect reference of trace_kvm_pi_irte_update
   176ebf4df971 Input: synaptics-rmi4 - fix an unchecked out of memory error path
   65783949c813 clocksource/drivers/imx-tpm: Correct some registers operation flow
   cda6fd4d9382 Linux 4.14.50
   87883c89b405 crypto: omap-sham - fix memleak
   efc67e746b27 crypto: vmx - Remove overly verbose printk from AES XTS init
   1bc36d12a6ed crypto: vmx - Remove overly verbose printk from AES init routines
   b9705796e44b crypto: cavium - Limit result reading attempts
   072e8b1f58d5 crypto: cavium - Fix fallout from CONFIG_VMAP_STACK
   4854c879107c crypto: caam - fix size of RSA prime factor q
   f535e1c3b394 crypto: caam/qi - fix IV DMA mapping and updating
   9ed3135cab14 crypto: caam - fix IV DMA mapping and updating
   635ac89ea764 crypto: caam - fix DMA mapping dir for generated IV
   ed0a79561189 crypto: caam - strip input zeros from RSA input buffer
   3c42aa03cd6a Input: elan_i2c - add ELAN0612 (Lenovo v330 14IKB) ACPI ID
   c4168f192057 Input: goodix - add new ACPI id for GPD Win 2 touch screen
   53e4b19fcd0c kvm: x86: use correct privilege level for sgdt/sidt/fxsave/fxrstor access
   739ac8f4a516 tty: pl011: Avoid spuriously stuck-off interrupts
   5ee296fde55e vmw_balloon: fixing double free when batching mode is off
   a64ff0bea051 serial: 8250: omap: Fix idling of clocks for unused uarts
   804f09011069 serial: samsung: fix maxburst parameter for DMA transactions
   db30b8eb960a tty/serial: atmel: use port->name as name in request_irq()
   95b8204b4491 serial: sh-sci: Stop using printk format %pCr
   d6a9e699a3c2 usb: gadget: udc: renesas_usb3: disable the controller's irqs for reconnecting
   262af4fe6dff usb: gadget: function: printer: avoid wrong list handling in printer_write()
   874cb201d511 phy: qcom-qusb2: Fix crash if nvmem cell not specified
   cb6b5869658b Input: xpad - add GPD Win 2 Controller USB IDs
   5c2e9e9bf444 usb-storage: Add compatibility quirk flags for G-Technologies G-Drive
   c839680e8cbf usb-storage: Add support for FL_ALWAYS_SYNC flag in the UAS driver
   f31eb7298ba4 usbip: vhci_sysfs: fix potential Spectre v1
   1caeb5022449 NFC: pn533: don't send USB data off of the stack
   f1769a9ba4bf staging: android: ion: Switch to pr_warn_once in ion_buffer_destroy
   bd2742e83660 KVM: x86: pass kvm_vcpu to kvm_read_guest_virt and kvm_write_guest_virt_system
   b1bd9caf5e98 kvm: nVMX: Enforce cpl=0 for VMX instructions
   3d2f03393267 KVM: x86: introduce linear_{read,write}_system
   9791d9d7e2ac KVM: X86: Fix reserved bits check for MOV to CR3
   c7a372ddc3db gpio: No NULL owner
   7d970250cb8d af_key: Always verify length of provided sadb_key
   1cbd5ece0527 blkdev_report_zones_ioctl(): Use vmalloc() to allocate large buffers
   d02ae00ab6d0 netfilter: nf_tables: fix NULL pointer dereference on nft_ct_helper_obj_dump()
   70d7bbd9b504 Linux 4.14.49
   2abd4c3ed20d drm: set FMODE_UNSIGNED_OFFSET for drm files
   3fe4b0cf9383 PCI: hv: Do not wait forever on a device that has disappeared
   dd4be396b8c5 cls_flower: Fix incorrect idr release when failing to modify rule
   c931c9aee2f3 rtnetlink: validate attributes in do_setlink()
   fa11d992533b virtio-net: fix leaking page for gso packet during mergeable XDP
   2b8b2b26c378 net/mlx5e: When RXFCS is set, add FCS data into checksum calculation
   155cd575588b virtio-net: correctly check num_buf during err path
   e2d47fa107f9 tun: Fix NULL pointer dereference in XDP redirect
   43153f090165 net/mlx4: Fix irq-unsafe spinlock usage
   31c1e078e3ca virtio-net: correctly transmit XDP buff after linearizing
   0dbd822f6440 net-sysfs: Fix memory leak in XPS configuration
   900679988fdf net: phy: broadcom: Fix auxiliary control register reads
   8d80a839c179 ipv6: sr: fix memory OOB access in seg6_do_srh_encap/inline
   c5e1541ef6fe vrf: check the original netdevice for generating redirect
   6d431f6e6880 vhost: synchronize IOTLB message with dev cleanup
   f2bb94069f3e team: use netdev_features_t instead of u32
   60473d7034ee sctp: not allow transport timeout value less than HZ/5 for hb_timer
   0a3608662ff6 qed: Fix mask for physical address in ILT entry
   0d751192afde packet: fix reserve calculation
   1c2c7767e876 net: usb: cdc_mbim: add flag FLAG_SEND_ZLP
   8acb0708ab6d net: phy: broadcom: Fix bcm_write_exp()
   c85df6eb6e86 net/packet: refine check for priv area size
   95159ad9635a net: metrics: add proper netlink validation
   341c03313a9a net: ipv4: add missing RTA_TABLE to rtm_ipv4_policy
   be1f1827a89a netdev-FAQ: clarify DaveM's position for stable backports
   c6fae49a447c kcm: Fix use-after-free caused by clonned sockets
   ebe79f9cf44f isdn: eicon: fix a missing-check bug
   3f8f52c5f200 ipv6: omit traffic class when calculating flow hash
   ff33a32949c8 ipv4: remove warning in ip_recv_error
   f1409a73b6f4 ipmr: properly check rhltable_init() return value
   f200de49dff8 ip6_tunnel: remove magic mtu value 0xFFF8
   989986db8f66 ip6mr: only set ip6mr_table from setsockopt when ip6mr_new_table succeeds
   cbf561634db3 enic: set DMA mask to 47 bit
   0d2eb422fe35 dccp: don't free ccid2_hc_tx_sock struct in dccp_disconnect()
   d591263c7947 bnx2x: use the right constant
   128f0d700569 be2net: Fix error detection logic for BE3
   d58cf41924e8 kconfig: Avoid format overflow warning from GCC 8.1
   058dd233b559 btrfs: define SUPER_FLAG_METADUMP_V2
   af760b568ef1 mmap: relax file size limit for regular files
   16d7ceb04b55 mmap: introduce sane default mmap limits
   7cb10a4ce724 scsi: sd_zbc: Avoid that resetting a zone fails sporadically
   1110636ed2d9 scsi: sd_zbc: Fix potential memory leak
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

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index e0c8f158ad12..9e4d353cfb81 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0f7a6d5209e60e88f9bc39298229113e58db1b82"
-SRCREV_meta ?= "f75450c33202c3090c8c0d7cae4e828809ea133c"
+SRCREV_machine ?= "517929399b9fd48c9e86fe6724097532ff779f9b"
+SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.48"
+LINUX_VERSION ?= "4.14.62"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index e78bbb117a16..ecb7b43726d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.48"
+LINUX_VERSION ?= "4.14.62"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dd893e600276f4e05e416cf5be73a5fd5752e0cb"
-SRCREV_meta ?= "f75450c33202c3090c8c0d7cae4e828809ea133c"
+SRCREV_machine ?= "2b98ddc7546b7c880361c9e13e1c11393fb8b0e1"
+SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 4e3241c1fd6e..22c7b1e696d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "88755525aeeeb3c42e365208858f74b3be7bad22"
-SRCREV_machine_qemuarm64 ?= "ec98b274e0e668eb6e368fe5d9173f52c6b6d401"
-SRCREV_machine_qemumips ?= "9fd9713c5ba50d6610da19bb296b8f4954e1786b"
-SRCREV_machine_qemuppc ?= "cfe05303950568a871b746b1955181da1fb13847"
-SRCREV_machine_qemux86 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
-SRCREV_machine_qemux86-64 ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
-SRCREV_machine_qemumips64 ?= "346488cf46ac4045fe257eb63836eb93c7c09859"
-SRCREV_machine ?= "97c8063d2df381b828b37608f88efa9b4dd9e379"
-SRCREV_meta ?= "f75450c33202c3090c8c0d7cae4e828809ea133c"
+SRCREV_machine_qemuarm ?= "fcfdd4f0304cfddb3703ddbb38099a424102d5ed"
+SRCREV_machine_qemuarm64 ?= "ff1b393ffe88c42d06185ae3ffbbc76856516631"
+SRCREV_machine_qemumips ?= "f7a7823cf33e772e9fd73239e57bac2b6a57cd87"
+SRCREV_machine_qemuppc ?= "97d3f96ea2ed5efda4663fd0f0c4e0c21e43c863"
+SRCREV_machine_qemux86 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
+SRCREV_machine_qemux86-64 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
+SRCREV_machine_qemumips64 ?= "db539ae62da0b5fe7d065830c2709abc01a5591d"
+SRCREV_machine ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
+SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.48"
+LINUX_VERSION ?= "4.14.62"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


