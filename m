Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0337832A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA32jbUW022625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Nov 2017 19:45:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:27 -0400
Message-ID: <a68776617cb2ca2fe534709b0ffc043bacaa2fe3.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/4.4: update to v4.4.93
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:36 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following shortlogs:

   e1fe3813117f Linux 4.4.93
   ad505a7b4fb0 x86/alternatives: Fix alt_max_short macro to really be a max()
   208563455aac USB: serial: console: fix use-after-free after failed setup
   6c14436b5e84 USB: serial: qcserial: add Dell DW5818, DW5819
   34592e06c7af USB: serial: option: add support for TP-Link LTE module
   ac22f49fb845 USB: serial: cp210x: add support for ELV TFD500
   b1f5a26964bf USB: serial: ftdi_sio: add id for Cypress WICED dev board
   399c46095eb5 fix unbalanced page refcounting in bio_map_user_iov
   f3b538493e66 direct-io: Prevent NULL pointer access in submit_page_section
   ac94abbb7941 usb: gadget: composite: Fix use-after-free in usb_composite_overwrite_options
   16c1ef65f4db ALSA: line6: Fix leftover URB at error-path during probe
   5b01343ad1bd ALSA: caiaq: Fix stray URB at probe error path
   ca2523c9c569 ALSA: seq: Fix copy_from_user() call inside lock
   23709ae9b614 ALSA: seq: Fix use-after-free at creating a port
   dc7c3bd09c7d ALSA: usb-audio: Kill stray URB at exiting
   050c4bbc09f1 iommu/amd: Finish TLB flush in amd_iommu_unmap()
   eb7f31673bbc usb: renesas_usbhs: Fix DMAC sequence for receiving zero-length packet
   6a92b9997028 KVM: nVMX: fix guest CR4 loading when emulating L2 to L1 exit
   03bd90fc82e4 crypto: shash - Fix zero-length shash ahash digest crash
   2929cb995378 HID: usbhid: fix out-of-bounds bug
   e7485f0f6a7b dmaengine: edma: Align the memcpy acnt array size with the transfer
   29b202ebf599 MIPS: math-emu: Remove pr_err() calls from fpu_emu()
   2fff3c5c2be7 USB: dummy-hcd: Fix deadlock caused by disconnect detection
   5fd45516595a rcu: Allow for page faults in NMI handlers
   45bd4e408040 iwlwifi: mvm: use IWL_HCMD_NOCOPY for MCAST_FILTER_CMD
   6a6c61d8467d nl80211: Define policy for packet pattern attributes
   f2bb4bcc0411 CIFS: Reconnect expired SMB sessions
   bd36826958de ext4: in ext4_seek_{hole,data}, return -ENXIO for negative offsets
   6721969c7b8a brcmfmac: add length check in brcmf_cfg80211_escan_handler()
   69f53f5d37d5 Linux 4.4.92
   82854fb438ca ext4: don't allow encrypted operations without keys
   4f22f0793cce ext4: Don't clear SGID when inheriting ACLs
   40c00e5fac3a ext4: fix data corruption for mmap writes
   90fd6738731b sched/cpuset/pm: Fix cpuset vs. suspend-resume bugs
   6d1400b09f99 nvme: protect against simultaneous shutdown invocations
   33d1fa43aad4 drm/i915/bios: ignore HDMI on port A
   b8af4466255c brcmfmac: setup passive scan if requested by user-space
   ee5bd0e4e69f uwb: ensure that endpoint is interrupt
   5a21af11c681 uwb: properly check kthread_run return value
   8b4196420dd6 iio: adc: mcp320x: Fix oops on module unload
   18215da0c241 iio: adc: mcp320x: Fix readout of negative voltages
   f2f68ec0b284 iio: ad7793: Fix the serial interface reset
   2c29a3868090 iio: core: Return error for failed read_reg
   b86df98578ab staging: iio: ad7192: Fix - use the dedicated reset function avoiding dma from stack.
   4b9c62a00aea iio: ad_sigma_delta: Implement a dedicated reset function
   0bab54141bac iio: adc: twl4030: Disable the vusb3v1 rugulator in the error handling path of 'twl4030_madc_probe()'
   0141f858d2e1 iio: adc: twl4030: Fix an error handling path in 'twl4030_madc_probe()'
   4590ed795f0c xhci: fix finding correct bus_state structure for USB 3.1 hosts
   13713e63bdb3 USB: fix out-of-bounds in usb_set_configuration
   ddcbaf853dc5 usb: Increase quirk delay for USB devices
   feab51a916ed USB: core: harden cdc_parse_cdc_header
   5d9a9c3dcc1f USB: uas: fix bug in handling of alternate settings
   9e78ac87626a scsi: sd: Do not override max_sectors_kb sysfs setting
   fc29713fa7c7 iwlwifi: add workaround to disable wide channels in 5GHz
   146a9dc99025 HID: i2c-hid: allocate hid buffers for real worst case
   87509592ecc3 ftrace: Fix kmemleak in unregister_ftrace_graph
   60623d7ca38d stm class: Fix a use-after-free
   c85e9442f9e4 Drivers: hv: fcopy: restore correct transfer length
   2b91a52e1569 driver core: platform: Don't read past the end of "driver_override" buffer
   6d1bc9ee4c2d ALSA: usx2y: Suppress kernel warning at page allocation failures
   8cff1556ddbc ALSA: compress: Remove unused variable
   dd1f96a0a72c lsm: fix smack_inode_removexattr and xattr_getsecurity memleak
   a44be3e548e4 USB: g_mass_storage: Fix deadlock when driver is unbound
   2efab2c3a3ae usb: gadget: mass_storage: set msg_registered after msg registered
   b74a45450f80 USB: devio: Don't corrupt user memory
   e84b4a008365 USB: dummy-hcd: Fix erroneous synchronization change
   d1a0787b5a24 USB: dummy-hcd: fix infinite-loop resubmission bug
   d25a65e03f18 USB: dummy-hcd: fix connection failures (wrong speed)
   da358168126b usb: pci-quirks.c: Corrected timeout values used in handshake
   46c7b1fa4911 ALSA: usb-audio: Check out-of-bounds access by corrupted buffer descriptor
   ccc6a475800d usb: renesas_usbhs: fix usbhsf_fifo_clear() for RX direction
   a7131ed81805 usb: renesas_usbhs: fix the BCLR setting condition for non-DCP pipe
   e85bd5be6088 usb-storage: unusual_devs entry to fix write-access regression for Seagate external drives
   86377bf33089 usb: gadget: udc: atmel: set vbus irqflags explicitly
   f72264e79ae7 USB: gadgetfs: fix copy_to_user while holding spinlock
   d20fff0b09d9 USB: gadgetfs: Fix crash caused by inadequate synchronization
   c2eb312f3137 usb: gadget: inode.c: fix unbalanced spin_lock in ep0_write
   c030c36a88cd Linux 4.4.91
   2536c20e8285 ttpci: address stringop overflow warning
   2b2bfb537be4 ALSA: au88x0: avoid theoretical uninitialized access
   d32ee7026081 ARM: remove duplicate 'const' annotations'
   7cad91f22d5e IB/qib: fix false-postive maybe-uninitialized warning
   13af23e01812 drivers: firmware: psci: drop duplicate const from psci_of_match
   f6c8c71cc901 libata: transport: Remove circular dependency at free time
   0185496a115d xfs: remove kmem_zalloc_greedy
   088b9a41b605 i2c: meson: fix wrong variable usage in meson_i2c_put_data
   cb07496eab43 md/raid10: submit bio directly to replacement disk
   13099ee9c7d5 rds: ib: add error handle
   9bcd5ceef96e iommu/io-pgtable-arm: Check for leaf entry before dereferencing it
   cadfa3a688d2 parisc: perf: Fix potential NULL pointer dereference
   4203f2a73882 netfilter: nfnl_cthelper: fix incorrect helper->expect_class_max
   fa029020bddd exynos-gsc: Do not swap cb/cr for semi planar formats
   8bd7216d3386 MIPS: IRQ Stack: Unwind IRQ stack onto task stack
   f7f46b3ba20d netfilter: invoke synchronize_rcu after set the _hook_ to NULL
   e29066778bc2 bridge: netlink: register netdevice before executing changelink
   1b760fdad9f0 mmc: sdio: fix alignment issue in struct sdio_func
   e1e99dc319cc usb: plusb: Add support for PL-27A1
   4212115da67b team: fix memory leaks
   fa63895f47c9 net/packet: check length in getsockopt() called with PACKET_HDRLEN
   b9ff317b5cd4 net: core: Prevent from dereferencing null pointer when releasing SKB
   4e6cdc0a7dec MIPS: Lantiq: Fix another request_mem_region() return code check
   c5710390cc76 ASoC: dapm: fix some pointer error handling
   7b8c9e6e0fca usb: chipidea: vbus event may exist before starting gadget
   093fe104c5bb audit: log 32-bit socketcalls
   af3749456042 ASoC: dapm: handle probe deferrals
   8e8c3d4bb629 partitions/efi: Fix integer overflow in GPT size calculation
   abbccd855753 USB: serial: mos7840: fix control-message error handling
   0d1b459a0baf USB: serial: mos7720: fix control-message error handling
   8b2522eb44ae drm/amdkfd: fix improper return value on error
   bf184ddd2180 IB/ipoib: Replace list_del of the neigh->list with list_del_init
   f1d53c6d4843 IB/ipoib: rtnl_unlock can not come after free_netdev
   9326a1374b13 IB/ipoib: Fix deadlock over vlan_mutex
   01b3db29ba1e tty: goldfish: Fix a parameter of a call to free_irq
   f97c79e83f7e ARM: 8635/1: nommu: allow enabling REMAP_VECTORS_TO_RAM
   89642710fdb3 iio: adc: hx711: Add DT binding for avia,hx711
   a1f7b8ff496d iio: adc: axp288: Drop bogus AXP288_ADC_TS_PIN_CTRL register modifications
   297b8b01ec27 hwmon: (gl520sm) Fix overflows and crash seen when writing into limit attributes
   d89f41c20f32 sh_eth: use correct name for ECMR_MPDE bit
   effdf2b134d5 extcon: axp288: Use vbus-valid instead of -present to determine cable presence
   5603b10236da igb: re-assign hw address pointer on reset after PCI error
   1c3ef07eb8eb MIPS: ralink: Fix incorrect assignment on ralink_soc
   1e35a2adc078 MIPS: Ensure bss section ends on a long-aligned address
   b00cfc01e70f ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes
   6a501bddeba3 RDS: RDMA: Fix the composite message user notification
   d4f97441cb88 GFS2: Fix reference to ERR_PTR in gfs2_glock_iter_next
   11bf4a8e1d5a drm: bridge: add DT bindings for TI ths8135
   771dacea92cd drm_fourcc: Fix DRM_FORMAT_MOD_LINEAR #define
   37c2d0d3e850 Linux 4.4.90
   228969b4764f fix xen_swiotlb_dma_mmap prototype
   079c03f4a915 swiotlb-xen: implement xen_swiotlb_dma_mmap callback
   27323cb81eae video: fbdev: aty: do not leak uninitialized padding in clk to userspace
   150cd84bb6ea KVM: VMX: use cmpxchg64
   90df2daa1da0 ARM: pxa: fix the number of DMA requestor lines
   c575be9a393f ARM: pxa: add the number of DMA requestor lines
   a85f176c857e dmaengine: mmp-pdma: add number of requestors
   6124ed1a712a cxl: Fix driver use count
   9037837e0c32 KVM: VMX: remove WARN_ON_ONCE in kvm_vcpu_trigger_posted_interrupt
   fc39e561e343 KVM: VMX: do not change SN bit in vmx_update_pi_irte()
   5e9b526fcc90 timer/sysclt: Restrict timer migration sysctl values to 0 and 1
   ddf25aea679d gfs2: Fix debugfs glocks dump
   d25fea066a8e x86/fpu: Don't let userspace set bogus xcomp_bv
   4c16afac1875 btrfs: prevent to set invalid default subvolid
   0efde43517a5 btrfs: propagate error to btrfs_cmp_data_prepare caller
   9a7d93dd2cad btrfs: fix NULL pointer dereference from free_reloc_roots()
   b08dc7d4cfa1 PCI: Fix race condition with driver_override
   21a638c5efd6 kvm: nVMX: Don't allow L2 to access the hardware CR8
   7520be6a454c KVM: VMX: Do not BUG() on out-of-bounds guest IRQ
   e726c30c758b arm64: fault: Route pte translation faults via do_translation_fault
   638e7874f682 arm64: Make sure SPsel is always set
   9237605e0bfb seccomp: fix the usage of get/put_seccomp_filter() in seccomp_get_filter()
   668cee82cd28 bsg-lib: don't free job in bsg_prepare_job
   9d74367d1a35 nl80211: check for the required netlink attributes presence
   3393445ef440 vfs: Return -ENXIO for negative SEEK_HOLE / SEEK_DATA offsets
   3bb7084cc031 SMB3: Don't ignore O_SYNC/O_DSYNC and O_DIRECT flags
   02ef29f9cbb6 SMB: Validate negotiate (to protect against downgrade) even if signing off
   c096b31f9d9a Fix SMB3.1.1 guest authentication to Samba
   fe37a445ea3f powerpc/pseries: Fix parent_dn reference leak in add_dt_node()
   638b38505045 KEYS: prevent KEYCTL_READ on negative key
   539255aea88e KEYS: prevent creating a different user's keyrings
   af24e9d8ba1a KEYS: fix writing past end of user-supplied buffer in keyring_read()
   362711d59b0c crypto: talitos - fix sha224
   231c4f646b77 crypto: talitos - Don't provide setkey for non hmac hashing algs.
   9d2534917c25 scsi: scsi_transport_iscsi: fix the issue that iscsi_if_rx doesn't parse nlmsg properly
   29854a77f793 md/raid5: preserve STRIPE_ON_UNPLUG_LIST in break_stripe_batch_list
   d03d1567866e md/raid5: fix a race condition in stripe batch
   68a4a5289918 tracing: Erase irqsoff trace with empty write
   9c5afa726a52 tracing: Fix trace_pipe behavior for instance traces
   f75c0042f120 KVM: PPC: Book3S: Fix race and leak in kvm_vm_ioctl_create_spapr_tce()
   7d8fbf3db169 mac80211: flush hw_roc_start work before cancelling the ROC
   fcc949a48842 cifs: release auth_key.response for reconnect.
   10def3a67799 Linux 4.4.89
   ed1bf4397d22 ftrace: Fix memleak when unregistering dynamic ops when tracing disabled
   a069d0a43de4 bcache: fix bch_hprint crash and improve output
   f522051a84e5 bcache: fix for gc and write-back race
   a6c5e7a0cd01 bcache: Correct return value for sysfs attach errors
   d9c6a28a6a1c bcache: correct cache_dirty_target in __update_writeback_rate()
   0471f58e18e6 bcache: do not subtract sectors_to_gc for bypassed IO
   093457f2bd32 bcache: Fix leak of bdev reference
   5025da3b532b bcache: initialize dirty stripes in flash_dev_run()
   4931578fbeb5 media: uvcvideo: Prevent heap overflow when accessing mapped controls
   04affe4e1171 media: v4l2-compat-ioctl32: Fix timespec conversion
   7498bd605840 PCI: shpchp: Enable bridge bus mastering if MSI is enabled
   81306fc3dbb5 ARC: Re-enable MMU upon Machine Check exception
   d28e96be7c6a tracing: Apply trace_clock changes to instance max buffer
   753154fcfefe ftrace: Fix selftest goto location on error
   d8663aa27789 scsi: qla2xxx: Fix an integer overflow in sysfs code
   72896ca30a7f scsi: sg: fixup infoleak when using SG_GET_REQUEST_TABLE
   c04996ad58ee scsi: sg: factor out sg_fill_request_table()
   f0cd701d4750 scsi: sg: off by one in sg_ioctl()
   3682e0c61ffb scsi: sg: use standard lists for sg_requests
   6b498ad14472 scsi: sg: remove 'save_scat_len'
   cf22210c66ca scsi: storvsc: fix memory leak on ring buffer busy
   b4730f456e21 scsi: megaraid_sas: Return pended IOCTLs with cmd_status MFI_STAT_WRONG_STATE in case adapter is dead
   d9b8f1ccbb8c scsi: megaraid_sas: Check valid aen class range to avoid kernel panic
   4dd6cbbc2191 scsi: zfcp: trace high part of "new" 64 bit SCSI LUN
   1e6c640a75d0 scsi: zfcp: trace HBA FSF response by default on dismiss or timedout late response
   7194822422f9 scsi: zfcp: fix payload with full FCP_RSP IU in SCSI trace records
   d0fbe221b8f1 scsi: zfcp: fix missing trace records for early returns in TMF eh handlers
   1a847369487c scsi: zfcp: fix passing fsf_req to SCSI trace on TMF to correlate with HBA
   52661717ee66 scsi: zfcp: fix capping of unsuccessful GPN_FT SAN response trace records
   d0c02c6f3e85 scsi: zfcp: add handling for FCP_RESID_OVER to the fcp ingress path
   cfc49967434d scsi: zfcp: fix queuecommand for scsi_eh commands when DIX enabled
   19978c50db68 skd: Submit requests to firmware before triggering the doorbell
   0bcaf5178fe6 skd: Avoid that module unloading triggers a use-after-free
   f05dafbd7791 md/bitmap: disable bitmap_resize for file-backed bitmaps.
   30e81e7fe197 block: Relax a check in blk_start_queue()
   a918d32583e0 powerpc: Fix DAR reporting when alignment handler faults
   c53f01698f68 ext4: fix quota inconsistency during orphan cleanup for read-only mounts
   cd46241eb03c ext4: fix incorrect quotaoff if the quota feature is enabled
   5e9d28b003b0 crypto: AF_ALG - remove SGL terminator indicator when chaining
   9354f4d0beb0 MIPS: math-emu: MINA.<D|S>: Fix some cases of infinity and zero inputs
   f4d77fc754f2 MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of both infinite inputs
   322bf697bdc4 MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of input values with opposite signs
   a83ffb581f26 MIPS: math-emu: <MAX|MIN>.<D|S>: Fix cases of both inputs negative
   6acd1d26c32e MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix cases of both inputs zero
   b6c818d813c6 MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix quiet NaN propagation
   bf592dde1262 Input: i8042 - add Gigabyte P57 to the keyboard reset table
   c13c5c7e88d7 tty: fix __tty_insert_flip_char regression
   077933dcd5ca tty: improve tty_insert_flip_char() slow path
   e1e6620f042c tty: improve tty_insert_flip_char() fast path
   c576160ff3f3 mm: prevent double decrease of nr_reserved_highatomic
   6ea627b20205 nfsd: Fix general protection fault in release_lock_stateid()
   d5c59ee84820 md/raid5: release/flush io in raid5_do_work()
   e21d66048d4d x86/fsgsbase/64: Report FSBASE and GSBASE correctly in core dumps
   53e5f7b8d41b f2fs: check hot_data for roll-forward recovery
   be9994817ad5 ipv6: fix typo in fib6_net_exit()
   70479eafe3d9 ipv6: fix memory leak with multiple tables during netns destruction
   9b5e5d8a0045 gianfar: Fix Tx flow control deactivation
   5f529e0d7844 Revert "net: fix percpu memory leaks"
   40bc5355e134 Revert "net: use lib/percpu_counter API for fragmentation mem accounting"
   611a98c8eca3 tcp: initialize rcv_mss to TCP_MIN_MSS instead of 0
   081be8c9efd6 Revert "net: phy: Correctly process PHY_HALTED in phy_stop_machine()"
   6d8c8fd1c4c7 qlge: avoid memcpy buffer overflow
   354d36b746c3 ipv6: fix sparse warning on rt6i_node
   e51bf99be7cc ipv6: add rcu grace period before freeing fib6_node
   6eb7ae1223f7 ipv6: accept 64k - 1 packet length in ip6_find_1stfragopt()
   b52c9082f2eb Linux 4.4.88
   ad3903434142 xfs: XFS_IS_REALTIME_INODE() should be false if no rt device present
   677a80364049 NFS: Fix 2 use after free issues in the I/O code
   84478477d0b8 ARM: 8692/1: mm: abort uaccess retries upon fatal signal
   f7ec367c8ea7 Bluetooth: Properly check L2CAP config option output buffer length
   556814701545 ALSA: msnd: Optimize / harden DSP and MIDI loops
   10863607c242 locktorture: Fix potential memory leak with rw lock test
   693b7f62a439 btrfs: resume qgroup rescan on rw remount
   f4596ead66a7 drm/bridge: adv7511: Re-write the i2c address before EDID probing
   e22a4308547c drm/bridge: adv7511: Switch to using drm_kms_helper_hotplug_event()
   9183e45db777 drm/bridge: adv7511: Use work_struct to defer hotplug handing to out of irq context
   c634cecad4c1 drm/bridge: adv7511: Fix mutex deadlock when interrupts are disabled
   aea7e5ce4a52 drm: adv7511: really enable interrupts for EDID detection
   a2e71dcfb0d4 scsi: sg: recheck MMAP_IO request length with lock held
   0d7592a03b8a scsi: sg: protect against races between mmap() and SG_SET_RESERVED_SIZE
   9a4cabf3bf8b cs5536: add support for IDE controller variant
   302364990c05 workqueue: Fix flag collision
   966e3a2d98c1 drm/nouveau/pci/msi: disable MSI on big-endian platforms by default
   4a9c294d7b1e mwifiex: correct channel stat buffer overflows
   926374f5e669 dlm: avoid double-free on error path in dlm_device_{register,unregister}
   bf3a0acce440 Bluetooth: Add support of 13d3:3494 RTL8723BE device
   ca245a6414e4 rtlwifi: rtl_pci_probe: Fix fail path of _rtl_pci_find_adapter
   c5b8e1dd9629 Input: trackpoint - assume 3 buttons when buttons detection fails
   2c65494080c9 ath10k: fix memory leak in rx ring buffer allocation
   69eeacb5cd87 intel_th: pci: Add Cannon Lake PCH-LP support
   eb98d15d3cbe intel_th: pci: Add Cannon Lake PCH-H support
   1875ed81c2b7 driver core: bus: Fix a potential double free
   f3584d55a8d8 staging/rts5208: fix incorrect shift to extract upper nybble
   812e484133fb USB: core: Avoid race of async_completed() w/ usbdev_release()
   9f1d78c62a4b usb:xhci:Fix regression when ATI chipsets detected
   b3e92cd7a820 usb: Add device quirk for Logitech HD Pro Webcam C920-C
   6e957a81c77f USB: serial: option: add support for D-Link DWM-157 C1
   f7a0f7318c27 usb: quirks: add delay init quirk for Corsair Strafe RGB keyboard

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 25d88833a943..c1cbf35a253c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1e691db7af642fff0222a1f1d1e9043c172699d5"
-SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
+SRCREV_machine ?= "2c13d27d73b9fddd38fd407326e82240a494d803"
+SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.87"
+LINUX_VERSION ?= "4.4.93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 141ff7399559..dd380955b588 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.87"
+LINUX_VERSION ?= "4.4.93"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
+SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index d300e69489c5..4d8d3da84a8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "840e2c02dde98ee9c584cacdd5bb0812e9dcd016"
-SRCREV_machine_qemuarm64 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_machine_qemumips ?= "27a547fe77b05ae63c3b973a029c3933ef62c164"
-SRCREV_machine_qemuppc ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_machine_qemux86 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_machine_qemux86-64 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_machine_qemumips64 ?= "7e333c223b568704cc3303b2e922ff85a2a8f7ef"
-SRCREV_machine ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
-SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
+SRCREV_machine_qemuarm ?= "5f3e5944108bc43f8ad657be259569b15e16b0f7"
+SRCREV_machine_qemuarm64 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_machine_qemumips ?= "5827dccb88b14a64dbe6ee78efb07735236ce8ea"
+SRCREV_machine_qemuppc ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_machine_qemux86 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_machine_qemux86-64 ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_machine_qemumips64 ?= "b8bcb7ea6836c9373f03fec69438d0c7225125f8"
+SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
+SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.87"
+LINUX_VERSION ?= "4.4.93"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


