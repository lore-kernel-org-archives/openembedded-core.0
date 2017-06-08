Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8DF7823D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:22:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v58JM2h7005109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Jun 2017 12:22:02 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 12:22:02 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Jun 2017 15:21:55 -0400
Message-ID: <b772833accc1c4889830804a5bf52388ecd18b0c.1496949552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1496949552.git.bruce.ashfield@windriver.com>
References: <cover.1496949552.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/4.9: update to 4.9.31
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
X-List-Received-Date: Thu, 08 Jun 2017 19:22:02 -0000
Content-Type: text/plain

Updating to the latest 4.9 -stable which comprises the following
commits:

   f1aa865ae5d4 Linux 4.9.31
   11214bd292ec xfs: Fix off-by-in in loop termination in xfs_find_get_desired_pgoff()
   75c5afd58d46 xfs: fix unaligned access in xfs_btree_visit_blocks
   7fb8ab8f0a38 xfs: avoid mount-time deadlock in CoW extent recovery
   e40c145c023d xfs: xfs_trans_alloc_empty
   0e542792a046 xfs: bad assertion for delalloc an extent that start at i_size
   f60d76efa91a xfs: BMAPX shouldn't barf on inline-format directories
   53c44c236f21 xfs: fix indlen accounting error on partial delalloc conversion
   54894ea3c542 xfs: fix use-after-free in xfs_finish_page_writeback
   d457f822817f xfs: reserve enough blocks to handle btree splits when remapping
   0ba833fe73d2 xfs: wait on new inodes during quotaoff dquot release
   2ea882d8ebc7 xfs: update ag iterator to support wait on new inodes
   e86b616b5b9e xfs: support ability to wait on new inodes
   10f0b2c3c225 xfs: fix up quotacheck buffer list error handling
   95487d4be1e9 xfs: prevent multi-fsb dir readahead from reading random blocks
   93bd169845e5 xfs: handle array index overrun in xfs_dir2_leaf_readbuf()
   99226b890d63 xfs: fix integer truncation in xfs_bmap_remap_alloc
   4e2762878a59 xfs: drop iolock from reclaim context to appease lockdep
   4e8163fc8159 xfs: actually report xattr extents via iomap
   de417ea6b0a6 xfs: fix over-copying of getbmap parameters from userspace
   c2ad2dc3d264 xfs: use dedicated log worker wq to avoid deadlock with cil wq
   3890d83805fe xfs: fix kernel memory exposure problems
   ca659e086fb7 xfs: rework the inline directory verifiers
   815414e7648b xfs: verify inline directory data forks
   11b485477285 xfs: fix off-by-one on max nr_pages in xfs_find_get_desired_pgoff()
   9c795fff53f9 xfs: use ->b_state to fix buffer I/O accounting release race
   c9eab63b9e62 xfs: Fix missed holes in SEEK_HOLE implementation
   670821b9482d drm/gma500/psb: Actually use VBT mode when it is found
   74b416367b4e mm/slub.c: trace free objects at KERN_INFO
   c1bb2a899b5f slub/memcg: cure the brainless abuse of sysfs attributes
   873f3b0ebbfe ksm: prevent crash after write_protect_page fails
   d5ecb4ca0da7 x86/boot: Use CROSS_COMPILE prefix for readelf
   d1cff2222071 RDMA/qib,hfi1: Fix MR reference count leak on write with immediate
   292f70cd9649 mm: consider memblock reservations for deferred memory initialization sizing
   1163e785b150 mlock: fix mlock count can not decrease in race condition
   d494cab70697 mm/migrate: fix refcount handling when !hugepage_migration_supported()
   7d8ef0e0bc1e ALSA: hda - apply STAC_9200_DELL_M22 quirk for Dell Latitude D430
   da856d05645c pcmcia: remove left-over %Z format
   ebd4c110fd0b drm/radeon: Fix vram_size/visible values in DRM_RADEON_GEM_INFO ioctl
   acc771fdaec7 drm/radeon: Unbreak HPD handling for r600+
   c8d25fcb5980 drm/radeon/ci: disable mclk switching for high refresh rates (v2)
   9869fb485cc6 scsi: mpt3sas: Force request partial completion alignment
   21f33b157721 nvme: avoid to use blk_mq_abort_requeue_list()
   510b0ec7f60f nvme: use blk_mq_start_hw_queues() in nvme_kill_queues()
   ae0578089242 nvme-rdma: support devices with queue size < 32
   34808d76dd77 HID: wacom: Have wacom_tpc_irq guard against possible NULL dereference
   69b1d90e6a0f ibmvscsis: Fix the incorrect req_lim_delta
   80569d0e09ad ibmvscsis: Clear left-over abort_cmd pointers
   49d33fd10070 iscsi-target: Always wait for kthread_should_stop() before kthread exit
   ecbf0f48d65e mmc: sdhci-iproc: suppress spurious interrupt with Multiblock read
   8735cf2291cd Revert "ACPI / button: Change default behavior to lid_init_state=open"
   32d8077f1e9b acpi, nfit: Fix the memory error check in nfit_handle_mce()
   68c83a379106 x86/MCE: Export memory_error()
   4472887cbd13 crypto: skcipher - Add missing API setkey checks
   63399974effb i2c: i2c-tiny-usb: fix buffer not being DMA capable
   d3b2d9ca90c2 drivers/tty: 8250: only call fintek_8250_probe when doing port I/O
   1d74fc36f3ec powerpc/spufs: Fix hash faults for kernel regions
   68a056175512 fs/ufs: Set UFS default maximum bytes per file
   1a658771d5e1 sparc/ftrace: Fix ftrace graph time measurement
   45ceb845ef34 sparc: Fix -Wstringop-overflow warning
   c1133c671a04 bpf: add bpf_clone_redirect to bpf_helper_changes_pkt_data
   988b9792b856 ipv4: add reference counting to metrics
   1de51502a025 sctp: fix ICMP processing if skb is non-linear
   4b81271ed1c3 tcp: avoid fastopen API to be used on AF_UNSPEC
   9e056584770b virtio-net: enable TSO/checksum offloads for Q-in-Q vlans
   9c6cfd5811bd be2net: Fix offload features for Q-in-Q packets
   5f595d529796 vlan: Fix tcp checksum offloads in Q-in-Q vlans
   cc6773b51bf3 net: phy: marvell: Limit errata to 88m1101
   4fb5fd27dec0 net/mlx5: Avoid using pending command interface slots
   1730a2b9e5b5 bonding: fix accounting of active ports in 3ad
   304b41014acb ipv6: fix out of bound writes in __ip6_append_data()
   ee72e7e5c2b4 bridge: start hello_timer when enabling KERNEL_STP in br_stp_start
   0d10ebbc835f qmi_wwan: add another Lenovo EM74xx device ID
   2ea4221eb4ae bridge: netlink: check vlan_default_pvid range
   3fa202ef74c8 ipv6: Check ip6_find_1stfragopt() return value properly.
   a2c845e51a82 ipv6: Prevent overrun when parsing v6 header options
   68647616fd53 net: Improve handling of failures on link and route dumps
   0174b07408f2 tcp: eliminate negative reordering in tcp_clean_rtx_queue
   ac3735bf97f0 net/mlx5e: Fix ethtool pause support and advertise reporting
   1594973b8e07 net/mlx5e: Use the correct pause values for ethtool advertising
   f79d3307c035 net/packet: fix missing net_device reference release
   5e7d9f0b3f72 sctp: do not inherit ipv6_{mc|ac|fl}_list from parent
   eb7f6d6989ad sctp: fix src address selection if using secondary addresses for ipv6
   8d625242e86b tcp: avoid fragmenting peculiar skbs in SACK
   a5db124dc2a4 net: fix compile error in skb_orphan_partial()
   5d165daafc44 netem: fix skb_orphan_partial()
   21e3113298f9 bpf, arm64: fix faulty emission of map access in tail calls
   c1f3f197d650 s390/qeth: add missing hash table initializations
   96a81eb6ad5a s390/qeth: avoid null pointer dereference on OSN
   b68c2e387a23 s390/qeth: unbreak OSM and OSN support
   25c1a1e4d891 s390/qeth: handle sysfs error during initialization
   4bd8f5e38e5a ipv6/dccp: do not inherit ipv6_mc_list from parent
   8f1f08be3974 driver: vrf: Fix one possible use-after-free issue
   4eed44029507 dccp/tcp: do not inherit mc_list from parent
   db3fd4527ed3 Linux 4.9.30
   5a597b225d48 drm/i915/gvt: Disable access to stolen memory as a guest
   1489183c2005 drivers: char: mem: Check for address space wraparound with mmap()
   51d9c51523ec nfsd: encoders mustn't use unitialized values in error cases
   ea465551af30 nfsd: fix undefined behavior in nfsd4_layout_verify
   f2b6f508c541 NFS: Use GFP_NOIO for two allocations in writeback
   a8c35e5c88de NFS: Fix use after free in write error path
   88ac6b7e0c82 NFSv4: Fix a hang in OPEN related to server reboot
   5438f8952906 drm/edid: Add 10 bpc quirk for LGD 764 panel in HP zBook 17 G2
   5956b2815f90 mtd: nand: add ooblayout for old hamming layout
   6639b27f5a4c mtd: nand: omap2: Fix partition creation via cmdline mtdparts
   e437af936a49 mtd: nand: orion: fix clk handling
   db6636416195 PCI: Freeze PME scan before suspending devices
   9ad81ecb28d6 PCI: Only allow WC mmap on prefetchable resources
   6bec009a2f69 PCI: Fix another sanity check bug in /proc/pci mmap
   fa3bbb1c7f06 PCI: Fix pci_mmap_fits() for HAVE_PCI_RESOURCE_TO_USER platforms
   87e7dc97c8a0 PCI: hv: Specify CPU_AFFINITY_ALL for MSI affinity when >= 32 CPUs
   d1d63f97dd76 PCI: hv: Allocate interrupt descriptors with GFP_ATOMIC
   dd0023d7105c tracing/kprobes: Enforce kprobes teardown after testing
   cc0aa21de47c um: Fix to call read_initrd after init_bootmem
   541c67844198 osf_wait4(): fix infoleak
   07d8aabff490 MIPS: Loongson-3: Select MIPS_L1_CACHE_SHIFT_6
   6d6a43a08611 nvme: unmap CMB and remove sysfs file in reset path
   423f1752a028 genirq: Fix chained interrupt data ordering
   3fe116563d5d uwb: fix device quirk on big-endian hosts
   f157261b55a4 stackprotector: Increase the per-task stack canary's random range from 32 bits to 64 bits on 64-bit platforms
   e8a8a6972c50 metag/uaccess: Check access_ok in strncpy_from_user
   9fefcb947ec2 metag/uaccess: Fix access_ok()
   21f2950f91ff iommu/vt-d: Flush the IOTLB to get rid of the initial kdump mappings
   58e36d6f7f11 staging: rtl8192e: GetTs Fix invalid TID 7 warning.
   93a46fe4eb41 staging: rtl8192e: rtl92e_get_eeprom_size Fix read size of EPROM_CMD.
   d0226f9adaf8 staging: rtl8192e: fix 2 byte alignment of register BSSIDR.
   f4205502948b staging: rtl8192e: rtl92e_fill_tx_desc fix write to mapped out memory.
   e6b8f5ade305 arm64: documentation: document tagged pointer stack constraints
   e817a7fb2f31 arm64: uaccess: ensure extension of access_ok() addr
   4775fbcc92d7 arm64: armv8_deprecated: ensure extension of addr
   f2e4f4e538f0 arm64: ensure extension of smp_store_release value
   88675139a81d arm64: xchg: hazard against entire exchange variable
   31a331c8cf26 arm64: dts: hi6220: Reset the mmc hosts
   5ee1c675ab92 ARM: dts: imx6sx-sdb: Remove OPP override
   03d8b264bcb9 ARM: dts: at91: sama5d3_xplained: not all ADC channels are available
   086ea4b9510c ARM: dts: at91: sama5d3_xplained: fix ADC vref
   9f6cea2e3bbd ARM: 8670/1: V7M: Do not corrupt vector table around v7m_invalidate_l1 call
   3304f5a1cb87 ARM: 8662/1: module: split core and init PLT sections
   ee773459557d KVM: arm: plug potential guest hardware debug leakage
   0ba7e8e34193 arm: KVM: Do not use stack-protector to compile HYP code
   d0fb4b7d00bb arm64: KVM: Do not use stack-protector to compile EL2 code
   a685601f8533 powerpc/tm: Fix FP and VMX register corruption
   018b91870856 powerpc/64e: Fix hang when debugging programs with relocated kernel
   3915c566ea94 powerpc/iommu: Do not call PageTransHuge() on tail pages
   5ba5685a26b1 powerpc/pseries: Fix of_node_put() underflow during DLPAR remove
   a0da3e00df38 powerpc/book3s/mce: Move add_taint() later in virtual mode
   222f1d668d00 powerpc/eeh: Avoid use after free in eeh_handle_special_event()
   690f09eb52bc powerpc/mm: Ensure IRQs are off in switch_mm()
   2338de43e234 cx231xx-cards: fix NULL-deref at probe
   8ebb884009b6 cx231xx-audio: fix NULL-deref at probe
   1b24b8c07023 cx231xx-audio: fix init error path
   40616929f87e dw2102: limit messages to buffer size
   e42a6715d26b digitv: limit messages to buffer size
   28590f1bb601 dvb-frontends/cxd2841er: define symbol_rate_min/max in T/C fe-ops
   64579fcc57fd zr364xx: enforce minimum size when reading header
   466b45af50fd dib0700: fix NULL-deref at probe
   074912daab55 s5p-mfc: Fix unbalanced call to clock management
   4a9c54250492 gspca: konica: add missing endpoint sanity check
   e2f95f88106f s5p-mfc: Fix race between interrupt routine and device functions
   6bee0b1fe4ed iio: hid-sensor: Store restore poll and hysteresis on S3
   a99462b13dff iio: proximity: as3935: fix as3935_write
   820adccd0e3b ipx: call ipxitf_put() in ioctl error path
   c67e87a22dd8 USB: hub: fix non-SS hub-descriptor handling
   3e4a4e68df08 USB: hub: fix SS hub-descriptor handling
   f9cd79e0ad1f USB: serial: io_ti: fix div-by-zero in set_termios
   c3e024ff9180 USB: serial: mct_u232: fix big-endian baud-rate handling
   d8fc44d67488 USB: serial: qcserial: add more Lenovo EM74xx device IDs
   7e5407600663 usb: serial: option: add Telit ME910 support
   ee0f3a89842e USB: iowarrior: fix info ioctl on big-endian hosts
   dbb127332abf usb: musb: Fix trying to suspend while active for OTG configurations
   08c735a15d5b usb: musb: tusb6010_omap: Do not reset the other direction's packet size
   ff9177b158c3 usb: dwc3: gadget: Prevent losing events in event cache
   653cd31a2ca5 dvb-usb-dibusb-mc-common: Add MODULE_LICENSE
   4f93054d9b45 ttusb2: limit messages to buffer size
   c71b5040632f mceusb: fix NULL-deref at probe
   736f41a47442 usbvision: fix NULL-deref at probe
   a3adb4721ae2 net: irda: irda-usb: fix firmware name on big-endian hosts
   1046d6a51f57 usb: host: xhci-mem: allocate zeroed Scratchpad Buffer
   219628bb0c05 xhci: apply PME_STUCK_QUIRK and MISSING_CAS quirk for Denverton
   1a926919364f usb: host: xhci-plat: propagate return value of platform_get_irq()
   374a3fb5c3b0 xhci: remove GFP_DMA flag from allocation
   fa313fd6673e libnvdimm: fix clear length of nvdimm_forget_poison()
   af9bd5218855 fscrypt: avoid collisions when presenting long encrypted filenames
   8daed21dbce1 f2fs: check entire encrypted bigname when finding a dentry
   b9c0da6219e1 USB: chaoskey: fix Alea quirk on big-endian hosts
   545a3171d37f USB: serial: ftdi_sio: add Olimex ARM-USB-TINY(H) PIDs
   038ccaa5d50e USB: serial: ftdi_sio: fix setting latency for unprivileged users
   2ea2f891fa85 pid_ns: Fix race between setns'ed fork() and zap_pid_ns_processes()
   6dc6a2700b6a pid_ns: Sleep in TASK_INTERRUPTIBLE in zap_pid_ns_processes
   5e40ac3fbd0d IB/hfi1: Fix a subcontext memory leak
   b894ea8263ca IB/hfi1: Return an error on memory allocation failure
   dfb450b2b66e IIO: bmp280-core.c: fix error in humidity calculation
   a03176f92a02 iio: dac: ad7303: fix channel description
   05a36277a195 ibmvscsis: Do not send aborted task response
   9907c838fc07 of: fdt: add missing allocation-failure check
   80cdf2065bf0 of: fix "/cpus" reference leak in of_numa_parse_cpu_nodes()
   ae5074ba9ef8 of: fix sparse warning in of_pci_range_parser_one
   d10b21d6e562 proc: Fix unbalanced hard link numbers
   168b2bfaa235 cxl: Route eeh events to all drivers in cxl_pci_error_detected()
   393531299547 cxl: Force context lock during EEH flow
   fc6b678ab1d4 ohci-pci: add qemu quirk
   809ae061d998 cdc-acm: fix possible invalid access when processing notification
   198ab4031873 gpio: omap: return error if requested debounce time is not possible
   b77adf29b856 drm/nouveau/tmr: handle races with hw when updating the next alarm time
   1ec3c712e231 drm/nouveau/tmr: avoid processing completed alarms when adding a new one
   6445a49a8c59 drm/nouveau/tmr: fix corruption of the pending list when rescheduling an alarm
   16e10490d260 drm/nouveau/tmr: ack interrupt before processing alarms
   e8ee63059196 drm/nouveau/therm: remove ineffective workarounds for alarm bugs
   d1f006efde1f drm/amdgpu: Add missing lb_vblank_lead_lines setup to DCE-6 path.
   b334b3492888 drm/amdgpu: Avoid overflows/divide-by-zero in latency_watermark calculations.
   ebf3cf5b9a67 drm/amdgpu: Make display watermark calculations more accurate
   adc6647c4f0f ath9k_htc: fix NULL-deref at probe
   c39bafb9ee7a ath9k_htc: Add support of AirTies 1eda:2315 AR9271 device
   768ae64b2ab2 s390/cputime: fix incorrect system time
   8c5157c1967e s390/kdump: Add final note
   c849b4fa8e10 regulator: tps65023: Fix inverted core enable logic.
   5b00d6c85a92 regulator: rk808: Fix RK818 LDO2
   ae382caa96f7 x86: fix 32-bit case of __get_user_asm_u64()
   54e385430e12 KVM: X86: Fix read out-of-bounds vulnerability in kvm pio emulation
   c996ad7568c0 KVM: x86: Fix potential preemption when get the current kvmclock timestamp
   b64ecb25b1d5 KVM: x86: Fix load damaged SSEx MXCSR register
   91034255e42f ima: accept previously set IMA_NEW_FILE
   ce7146cf9bdf mwifiex: pcie: fix cmd_buf use-after-free in remove/reset
   385eb9b33e1d mwifiex: MAC randomization should not be persistent
   444df795edf4 rtlwifi: rtl8821ae: setup 8812ae RFE according to device type
   7e7897878783 md: MD_CLOSING needs to be cleared after called md_set_readonly or do_md_stop
   fa9a4a9c6d6f md: update slab_cache before releasing new stripes when stripes resizing
   f2bb8bcbc09d dm space map disk: fix some book keeping in the disk space map
   cc681811a92c dm thin metadata: call precommit before saving the roots
   eeaf13394d32 dm bufio: make the parameter "retain_bytes" unsigned long
   e69242436b6b dm cache metadata: fail operations if fail_io mode has been established
   042d8dbf69c6 dm mpath: split and rename activate_path() to prepare for its expanded use
   e08047c90c8a dm bufio: check new buffer allocation watermark every 30 seconds
   98e7b9d45bf4 dm bufio: avoid a possible ABBA deadlock
   c5066c4c1b7e dm raid: select the Kconfig option CONFIG_MD_RAID0
   4de8eceefbea dm btree: fix for dm_btree_find_lowest_key()
   5db8f42b62da infiniband: call ipv6 route lookup via the stub interface
   cb5cf8aaba2e mlx5: Fix mlx5_ib_map_mr_sg mr length
   ece453e8b0ca ASoC: cs4271: configure reset GPIO as output
   cc15d340ec6a tpm_crb: check for bad response size
   0c150305212b tpm: add sleep only for retry in i2c_nuvoton_write_status()
   40ca1fd38e11 tpm: msleep() delays - replace with usleep_range() in i2c nuvoton driver
   568ea0dcc27e tpm_tis_spi: Add small delay after last transfer
   c4b3779c9783 tpm_tis_spi: Remove limitation of transfers to MAX_SPI_FRAMESIZE bytes
   d513cf24e240 tpm_tis_spi: Check correct byte for wait state indicator
   daa432c1a65a tpm_tis_spi: Abort transfer when too many wait states are signaled
   aad1e5c81cbb tpm_tis_spi: Use single function to transfer data
   cc0f994c205d fanotify: don't expose EOPENSTALE to userspace
   e8b6d43ce3ea ARM: tegra: paz00: Mark panel regulator as enabled on boot
   0251f6affb11 ALSA: hda: Fix cpu lockup when stopping the cmd dmas
   5c1bd0cb4992 tpm_tis_core: Choose appropriate timeout for reading burstcount
   3888f62943bb USB: core: replace %p with %pK
   5d263d94a870 char: lp: fix possible integer overflow in lp_setup()
   7a2b8471ab12 watchdog: pcwd_usb: fix NULL-deref at probe
   6e2078c10092 USB: ene_usb6250: fix DMA to the stack
   7d96e4a404c1 usb: misc: legousbtower: Fix memory leak
   810b7c559954 usb: misc: legousbtower: Fix buffers on stack
   f5eea276d8de Linux 4.9.29
   9ee8502bd2cc pstore: Shut down worker when unregistering
   a4de93008625 pstore: Fix flags to enable dumps on powerpc
   1a1029507258 libnvdimm, pfn: fix 'npfns' vs section alignment
   c171b24fe508 libnvdimm, pmem: fix a NULL pointer BUG in nd_pmem_notify
   5b6e7f353290 libnvdimm, region: fix flush hint detection crash
   46ba11b007c1 ipmi: Fix kernel panic at ipmi_ssif_thread()
   6e7de39ef9a4 Bluetooth: hci_intel: add missing tty-device sanity check
   f2f6d77fabe2 Bluetooth: hci_bcm: add missing tty-device sanity check
   518ca84479d7 Bluetooth: Fix user channel for 32bit userspace on 64bit kernel
   89c91ea37581 tty: pty: Fix ldisc flush after userspace become aware of the data already
   e38a4c3b0b4a serial: omap: suspend device on probe errors
   f8d2751b0012 serial: omap: fix runtime-pm handling on unbind
   c5689e0ab6e1 serial: samsung: Use right device for DMA-mapping calls
   64a599ac5dcc fscrypt: fix context consistency check when key(s) unavailable
   8dd114ef78c8 device-dax: fix cdev leak
   6240377c574b padata: free correct variable
   1c5d8b377e58 CIFS: add misssing SFM mapping for doublequote
   6f3b2eed8c9a cifs: fix CIFS_IOC_GET_MNT_INFO oops
   f13d96bf98c2 CIFS: fix oplock break deadlocks
   411346640ccd cifs: fix CIFS_ENUMERATE_SNAPSHOTS oops
   449a74439d15 cifs: fix leak in FSCTL_ENUM_SNAPS response handling
   87c0604d860f CIFS: fix mapping of SFM_SPACE and SFM_PERIOD
   8dd4e3ff1bfb SMB3: Work around mount failure when using SMB3 dialect to Macs
   2ac2ad9fb045 Set unicode flag on cifs echo request to avoid Mac error
   4f5e1c48e80b Fix match_prepath()
   4e434d4fe28a mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
   945d0ecdd9bd fs/block_dev: always invalidate cleancache in invalidate_bdev()
   091784ae9738 ceph: fix memory leak in __ceph_setxattr()
   9a6bb7b5637e fs/xattr.c: zero out memory copied to userspace in getxattr
   1777e888bd40 orangefs: do not check possibly stale size on truncate
   63907bb781e7 orangefs: do not set getattr_time on orangefs_lookup
   59f496104112 orangefs: clean up oversize xattr validation
   127adc188c62 orangefs: fix bounds check for listxattr
   b2764f851db6 ext4: evict inline data when writing to memory map
   7929b50dedd1 perf auxtrace: Fix no_size logic in addr_filter__resolve_kernel_syms()
   e3cea38357ea IB/hfi1: Prevent kernel QP post send hard lockups
   43c54927f6f4 IB/mlx4: Reduce SRIOV multicast cleanup warning message to debug level
   9ae6b33dcbb4 IB/mlx4: Fix ib device initialization error flow
   d20bfe223d3e IB/IPoIB: ibX: failed to create mcg debug file
   7a227630ab89 IB/core: For multicast functions, verify that LIDs are multicast LIDs
   ecb0ab0f89c7 IB/core: Fix sysfs registration error flow
   377178321690 iov_iter: don't revert iov buffer if csum error
   9f43f70dcc56 vfio/type1: Remove locked page accounting workqueue
   1773131ec4b9 dm thin: fix a memory leak when passing discard bio down
   f32e35bc3d54 dm rq: check blk_mq_register_dev() return value in dm_mq_init_request_queue()
   f6ec18eb7425 dm era: save spacemap metadata root after the pre-commit
   f8d05099ec72 crypto: ccp - Change ISR handler method for a v5 CCP
   a0a232489c0f crypto: ccp - Change ISR handler method for a v3 CCP
   93424b2b63e0 crypto: ccp - Disable interrupts early on unload
   36dffff240d9 crypto: ccp - Use only the relevant interrupt bits
   bcc70358396a crypto: algif_aead - Require setkey before accept(2)
   9b2fb8ad5ba1 block: fix blk_integrity_register to use template's interval_exp if not 0
   884ba252f3f1 arm64: KVM: Fix decoding of Rt/Rt2 when trapping AArch32 CP accesses
   7b0d4391d0f4 KVM: arm/arm64: fix races in kvm_psci_vcpu_on
   bdf1d5b4c129 KVM: x86: fix user triggerable warning in kvm_apic_accept_events()
   f99985cdee64 perf/x86: Fix Broadwell-EP DRAM RAPL events
   0750e8b865ee um: Fix PTRACE_POKEUSER on x86_64
   e0c871792cc6 x86, pmem: Fix cache flushing for iovec write < 8 bytes
   e65c6aa10860 selftests/x86/ldt_gdt_32: Work around a glibc sigaction() bug
   acb6dc6aa744 x86/boot: Fix BSS corruption/overwrite bug in early x86 kernel startup
   219a99dd2198 usb: hub: Do not attempt to autosuspend disconnected devices
   181b0de7f7cc usb: hub: Fix error loop seen after hub communication errors
   5a001a687f7c usb: Make sure usb/phy/of gets built-in
   5c51e4b65fca usb: gadget: legacy gadgets are optional
   af534bf9540e usb: misc: add missing continue in switch
   a54ab7420ac7 staging: comedi: jr3_pci: cope with jiffies wraparound
   2bdc2e8c29e9 staging: comedi: jr3_pci: fix possible null pointer dereference
   55f9811b98f2 staging: gdm724x: gdm_mux: fix use-after-free on module unload
   83f66c9a6026 staging: vt6656: use off stack for out buffer USB transfers.
   3eff228fdd43 staging: vt6656: use off stack for in buffer USB transfers.
   6312a84dc8b5 USB: Revert "cdc-wdm: fix "out-of-sync" due to missing notifications"
   5ffe717f351d USB: Proper handling of Race Condition when two USB class drivers try to call init_usb_class simultaneously
   c31ff3ceb326 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit
   91cd8f900c75 usb: host: xhci: print correct command ring address
   853469d53e86 usb: xhci: bInterval quirk for TI TUSB73x0
   bb1f06f53bcb iscsi-target: Set session_fall_back_to_erl0 when forcing reinstatement
   f788fa43d87a target/fileio: Fix zero-length READ and WRITE handling
   a4e52cc7d81b target: Fix compare_and_write_callback handling for non GOOD status
   f2b8de98f737 xen: adjust early dom0 p2m handling to xen hypervisor behavior
   58cd97ff374b Linux 4.9.28
   6a7620744e89 block: get rid of blk_integrity_revalidate()
   48d9fa1ece5e drm/ttm: fix use-after-free races in vm fault handling
   347d07bf3add wlcore: Add RX_BA_WIN_SIZE_CHANGE_EVENT event
   bbd839a40dde wlcore: Pass win_size taken from ieee80211_sta to FW
   5d7ab8339a9a xen: Revert commits da72ff5bfcb0 and 72a9b186292d
   93862955cbf4 f2fs: sanity check segment count
   265d382cc8db net: mdio-mux: bcm-iproc: call mdiobus_free() in error path
   ced0a31e667f bpf: don't let ldimm64 leak map addresses on unprivileged
   e37aab9c63b8 bnxt_en: allocate enough space for ->ntp_fltr_bmap
   8795ee7bed24 ipv6: reorder ip6_route_dev_notifier after ipv6_dev_notf
   ecbd3ed2ddfe ipv6: initialize route null entry in addrconf_init()
   5d8e07740c69 rtnetlink: NUL-terminate IFLA_PHYS_PORT_NAME string
   f19065308601 ipv4, ipv6: ensure raw socket message is big enough to hold an IP header
   747a00193f26 tcp: do not inherit fastopen_req from parent
   78f032b071c1 net: usb: qmi_wwan: add Telit ME910 support
   0f4ac291a768 net: ipv6: Do not duplicate DAD on link up
   91260baa9d67 tcp: fix wraparound issue in tcp_lp
   493d0a7be31c bpf, arm64: fix jit branch offset related to ldimm64
   7bca0a9702ed bpf: enhance verifier to understand stack pointer arithmetic
   f3235cbd5be1 tcp: do not underestimate skb->truesize in tcp_trim_head()
   3b0129d4111e macsec: dynamically allocate space for sglist
   22d6b013ffcf sparc64: fix fault handling in NGbzero.S and GENbzero.S
   7aa0e14336d9 ALSA: hda - Fix deadlock of controller device lock at unbinding
   170e0abd886b staging: emxx_udc: remove incorrect __init annotations
   d8e94d091376 staging: wlan-ng: add missing byte order conversion
   47b7257fc20f staging/lustre/llite: move root_squash from sysfs to debugfs
   0b77c687d4e0 brcmfmac: Make skb header writable before use
   f73dfc29afa6 brcmfmac: Ensure pointer correctly set if skb data location changes
   b0e2e3acfe8e MIPS: R2-on-R6 MULTU/MADDU/MSUBU emulation bugfix
   2d652d0abd3c scsi: smartpqi: fix time handling
   a46d03e35179 scsi: mac_scsi: Fix MAC_SCSI=m option when SCSI=m
   76aa65a2c0fd scsi: qla2xxx: Fix crash in qla2xxx_eh_abort on bad ptr
   71fd9a94bd3f serial: 8250_omap: Fix probe and remove for PM runtime
   115fb7ec22b5 phy: qcom-usb-hs: Add depends on EXTCON
   52dd14d76812 clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
   6fa44d4ba212 USB: serial: io_edgeport: fix descriptor error handling
   62b8b773ebde USB: serial: mct_u232: fix modem-status error handling
   e17c48c3280e USB: serial: quatech2: fix control-message error handling
   594c9b4b0acb USB: serial: ftdi_sio: fix latency-timer error handling
   ca4e6525df05 USB: serial: ark3116: fix open error handling
   94bbbfe21b5a USB: serial: ti_usb_3410_5052: fix control-message error handling
   b07e930d1f49 USB: serial: io_edgeport: fix epic-descriptor handling
   4d32e36d6262 USB: serial: ssu100: fix control-message error handling
   9ca301067502 USB: serial: digi_acceleport: fix incomplete rx sanity check
   84443215cf54 USB: serial: keyspan_pda: fix receive sanity checks
   b6c17077e056 usb: chipidea: Handle extcon events properly
   8eb8c9b16fdd usb: chipidea: Only read/write OTGSC from one place
   4a36b6a7ee88 usb: host: ohci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   8f50cb88d862 usb: host: ehci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   30643b5ac754 usb: dwc2: host: use msleep() for long delay
   d0ee36354f77 KVM: nVMX: do not leak PML full vmexit to L1
   560a979735f4 KVM: nVMX: initialize PML fields in vmcs02
   39058adebbb1 Revert "KVM: nested VMX: disable perf cpuid reporting"
   b6cd52a0eeaf x86/platform/intel-mid: Correct MSI IRQ line for watchdog device
   1eae95d4bc03 kprobes/x86: Fix kernel panic when certain exception-handling addresses are probed
   c9f617223904 clk: Make x86/ conditional on CONFIG_COMMON_CLK
   1f0c69cfb2ad x86/mpx: Re-add MPX to selftests Makefile
   56e524a8c305 x86/pci-calgary: Fix iommu_free() comparison of unsigned expression >= 0
   5ed26fad2d08 x86/ioapic: Restore IO-APIC irq_chip retrigger callback
   3b141e2965a7 iwlwifi: mvm: writing zero bytes to debugfs causes a crash
   1fb264cf7d54 iwlwifi: mvm: synchronize firmware DMA paging memory
   495f91630205 iwlwifi: mvm: fix references to first_agg_queue in DQA mode
   4d6f2ac95bc5 iwlwifi: mvm: fix pending frame counter calculation
   48aa5ec292f3 iwlwifi: mvm/pcie: adjust A-MSDU tx_cmd length in PCIe
   04dd401a5145 iwlwifi: mvm: Use aux queue for offchannel frames in dqa
   a6fe39262c51 iwlwifi: mvm: fix reorder timer re-arming
   20a9de99a0da iwlwifi: pcie: fix the set of DMA memory mask
   562c868d94a8 iwlwifi: pcie: trans: Remove unused 'shift_param'
   9c8655c0a860 iwlwifi: pcie: don't increment / decrement a bool
   948634492b40 iwlwifi: mvm: overwrite skb info later
   45dad03aca55 iwlwifi: mvm: don't restart HW if suspend fails with unified image
   d0a8075ffe05 iwlwifi: fix MODULE_FIRMWARE for 6030
   9291cabe094b mwifiex: Avoid skipping WEP key deletion for AP
   dcdeaa743342 mwifiex: remove redundant dma padding in AMSDU
   525fda9221a8 mwifiex: debugfs: Fix (sometimes) off-by-1 SSID print
   1d61da618969 ARM: dts: sun7i: lamobo-r1: Fix CPU port RGMII settings
   ebae7681697d ARM: OMAP5 / DRA7: Fix HYP mode boot for thumb2 build
   f4bff2c44dc9 ARM: dts: NSP: GPIO reboot open-source
   329607b4864d leds: ktd2692: avoid harmless maybe-uninitialized warning
   f46fdb8a2611 arm64: Improve detection of user/non-user mappings in set_pte(_at)
   aadb7e073e81 arm: dts: qcom: Fix ipq board clock rates
   e33fb57428a1 arm64: dts: r8a7795: Mark EthernetAVB device node disabled
   e7b34f4a74f6 power: supply: bq24190_charger: Handle fault before status on interrupt
   7f2b4ad9c07a power: supply: bq24190_charger: Don't read fault register outside irq_handle_thread()
   4b7dac0a23b7 power: supply: bq24190_charger: Call power_supply_changed() for relevant component
   63e1acc84d28 power: supply: bq24190_charger: Install irq_handler_thread() at end of probe()
   20e448f2251c power: supply: bq24190_charger: Call set_mode_host() on pm_resume()
   d8d6aedd54ce power: supply: bq24190_charger: Fix irq trigger to IRQF_TRIGGER_FALLING
   89e8bd3add69 perf/x86/intel/pt: Add format strings for PTWRITE and power event tracing
   1641bb14e8be powerpc: Correctly disable latent entropy GCC plugin on prom_init.o
   b47a6b40655b powerpc/ftrace: Fix confusing help text for DISABLE_MPROFILE_KERNEL
   50e027728915 powerpc/powernv: Fix opal_exit tracepoint opcode
   754a2bcfd8b1 powerpc/mm: Fixup wrong LPCR_VRMASD value
   a19718bd0b19 cpupower: Fix turbo frequency reporting for pre-Sandy Bridge cores
   4f39fcce99d7 power: supply: lp8788: prevent out of bounds array access
   ccef31d22e80 crypto: caam - fix error path for ctx_dma mapping failure
   819e3601d3c5 tmp: use pdev for parent device in tpm_chip_alloc
   326f9b0a39d3 tpm: fix RC value check in tpm2_seal_trusted
   a941f261c8f1 hwmon: (it87) Fix pwm4 detection for IT8620 and IT8628
   898c6bbfc88d drm/sti: fix GDP size to support up to UHD resolution
   f5ca890f138d 9p: fix a potential acl leak

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index cf584be7eef6..3bfa24b0c98b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f458d12de7f157fe050afc7c1fee08022876eae3"
-SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
+SRCREV_machine ?= "ab749ed8fd7beb6c63ec62a808eac8678db83810"
+SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.27"
+LINUX_VERSION ?= "4.9.31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 49047e9c9954..8041c5f77130 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.27"
+LINUX_VERSION ?= "4.9.31"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
+SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index e9fe07761de3..ba43d5aabe61 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "60c70a5e9f07f1485491dd44c6049e7da908656a"
-SRCREV_machine_qemuarm64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_machine_qemumips ?= "f922c64ba89ca137ba2d5f75be79311dd6c5e229"
-SRCREV_machine_qemuppc ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_machine_qemux86 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_machine_qemux86-64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_machine_qemumips64 ?= "bfdb9d2cf36f5ded1cd8d03e58465d9f6250bba8"
-SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
+SRCREV_machine_qemuarm ?= "734cdab9878ac73dbf43d8e7d14b07b9e3498c32"
+SRCREV_machine_qemuarm64 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_machine_qemumips ?= "59f4ca90a4bb47ce9c81508e3b8458b87f411d59"
+SRCREV_machine_qemuppc ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_machine_qemux86 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_machine_qemux86-64 ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_machine_qemumips64 ?= "5b396803703aa5c1bd1e6f5cc7ac02de05cd0d08"
+SRCREV_machine ?= "d2de43e42bb8a270e680aab1c8f2447bff0b3552"
+SRCREV_meta ?= "60dd89e2423aaa2e7be680db09be43d1f47471e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.27"
+LINUX_VERSION ?= "4.9.31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


