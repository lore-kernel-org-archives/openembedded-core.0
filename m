Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 671C9776B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EDVQUw009276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 06:31:26 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:17 -0400
Message-ID: <69a7b20aa58dfd84ccd46f4831dc55623351c8f2.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.4: update to v4.4.53
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:26 -0000
Content-Type: text/plain

Updating from v4.4.41 to v4.4.53, with the following list of changes:

   49616e715061 Linux 4.4.53
   9cee69465035 scsi: lpfc: Correct WQ creation for pagesize
   1d316060cad5 MIPS: IP22: Fix build error due to binutils 2.25 uselessnes.
   4dd29050e46e MIPS: IP22: Reformat inline assembler code to modern standards.
   15959b728d07 powerpc/xmon: Fix data-breakpoint
   afee78f03ee6 dmaengine: ipu: Make sure the interrupt routine checks all interrupts.
   79a7ff1443bd bcma: use (get|put)_device when probing/removing device driver
   5a1f03f1ee91 md linear: fix a race between linear_add() and linear_congested()
   037cd23726b3 rtc: sun6i: Switch to the external oscillator
   ee360e99dae0 rtc: sun6i: Add some locking
   a0378b5bfc27 NFSv4: fix getacl ERANGE for some ACL buffer sizes
   5d23e89065cd NFSv4: fix getacl head length estimation
   52fb4bdcea4c NFSv4: Fix memory and state leak in _nfs4_open_and_get_state
   3ee4f442e5b3 nfsd: special case truncates some more
   6030493a3422 nfsd: minor nfsd_setattr cleanup
   781e6a08381d rtlwifi: rtl8192c-common: Fix "BUG: KASAN:
   6e10c33cb87a rtlwifi: Fix alignment issues
   70a09029b7be gfs2: Add missing rcu locking for glock lookup
   44dd30e04c1f rdma_cm: fail iwarp accepts w/o connection params
   88326fe95f59 RDMA/core: Fix incorrect structure packing for booleans
   f414af249f1e Drivers: hv: util: Backup: Fix a rescind processing issue
   9b45ab285388 Drivers: hv: util: Fcopy: Fix a rescind processing issue
   abaeda7f709a Drivers: hv: util: kvp: Fix a rescind processing issue
   862d2b7d21d3 hv: init percpu_list in hv_synic_alloc()
   374907e8d116 hv: allocate synic pages for all present CPUs
   80190fcc48f6 usb: gadget: udc: fsl: Add missing complete function.
   61e9e9bcfd7b usb: host: xhci: plat: check hcc_params after add hcd
   900466a746f5 usb: musb: da8xx: Remove CPPI 3.0 quirk and methods
   89eb5ed1536e w1: ds2490: USB transfer buffers need to be DMAable
   1df66c452471 w1: don't leak refcount on slave attach failure in w1_attach_slave_device()
   20bc8a897e48 can: usb_8dev: Fix memory leak of priv->cmd_msg_buffer
   3584716db12a iio: pressure: mpl3115: do not rely on structure field ordering
   2ab6b8c7172c iio: pressure: mpl115: do not rely on structure field ordering
   e83a28c521a6 arm/arm64: KVM: Enforce unconditional flush to PoC when mapping to stage-2
   d4a8db66b946 fuse: add missing FR_FORCE
   434ed4aff140 crypto: testmgr - Pad aes_ccm_enc_tv_template vector
   7666ef1a36cc ath9k: use correct OTP register offsets for the AR9340 and AR9550
   1aeced70f77d ath9k: fix race condition in enabling/disabling IRQs
   dc7bbf895e43 ath5k: drop bogus warning on drv_set_key with unsupported cipher
   6af0acc0b69f target: Fix multi-session dynamic se_node_acl double free OOPs
   4a3c526ced41 target: Obtain se_node_acl->acl_kref during get_initiator_node_acl
   da259399e487 samples/seccomp: fix 64-bit comparison macros
   6ad4196f1952 ext4: return EROFS if device is r/o and journal replay is needed
   9a79248c083d ext4: preserve the needs_recovery flag when the journal is aborted
   6ec4583e9b03 ext4: fix inline data error paths
   9d636818dbac ext4: fix data corruption in data=journal mode
   8774c73cf696 ext4: trim allocation requests to group size
   a3068b3e8066 ext4: do not polute the extents cache while shifting extents
   3daefdae5f8b ext4: Include forgotten start block on fallocate insert range
   cd3db55c64ae loop: fix LO_FLAGS_PARTSCAN hang
   356d71df7398 block/loop: fix race between I/O and set_status
   973f40f368f7 jbd2: don't leak modified metadata buffers on an aborted journal
   c0ef1f537a97 Fix: Disable sys_membarrier when nohz_full is enabled
   ea240cfed99b sd: get disk reference in sd_check_events()
   33950b56d2c2 scsi: use 'scsi_device_from_queue()' for scsi_dh
   2dc9a859eb89 scsi: aacraid: Reorder Adapter status check
   18dbfcae65a3 scsi: storvsc: properly set residual data length on errors
   80bccab34a57 scsi: storvsc: properly handle SRB_ERROR when sense message is present
   5cdc8193ac38 scsi: storvsc: use tagged SRB requests if supported by the device
   6a284310d5dd dm stats: fix a leaked s->histogram_boundaries array
   fdea1f972158 dm cache: fix corruption seen when using cache > 2TB
   f0ae01568e0c ipc/shm: Fix shmat mmap nil-page protection
   c5c893e7c44e mm: do not access page->mapping directly on page_endio
   66f43a576879 mm: vmpressure: fix sending wrong events on underflow
   612e4679b865 mm/page_alloc: fix nodes for reclaim in fast path
   31dac0e870dd iommu/vt-d: Tylersburg isoch identity map check is done too late.
   07852563dba6 iommu/vt-d: Fix some macros that are incorrectly specified in intel-iommu
   5cc0cd0e3a5a regulator: Fix regulator_summary for deviceless consumers
   272d60bfce0e staging: rtl: fix possible NULL pointer dereference
   8c8f42c9a4a7 ALSA: hda - Fix micmute hotkey problem for a lenovo AIO machine
   cd585d3ba5c8 ALSA: hda - Add subwoofer support for Dell Inspiron 17 7000 Gaming
   003aa343724f ALSA: seq: Fix link corruption by event error handling
   70dbc00f7e11 ALSA: ctxfi: Fallback DMA mask to 32bit
   9879f9d01a3c ALSA: timer: Reject user params with too small ticks
   b9bf1f0657c5 ALSA: hda - fix Lewisburg audio issue
   1f4f37076d52 ALSA: hda/realtek - Cannot adjust speaker's volume on a Dell AIO
   6b1d7b6f54c7 ARM: dts: at91: Enable DMA on sama5d2_xplained console
   be83ed085fcd ARM: dts: at91: Enable DMA on sama5d4_xplained console
   b401418c6cc3 ARM: at91: define LPDDR types
   f3a0b2004080 media: fix dm1105.c build error
   b0bde9f6a057 uvcvideo: Fix a wrong macro
   5988e7320179 am437x-vpfe: always assign bpp variable
   ab7546e49100 MIPS: Handle microMIPS jumps in the same way as MIPS32/MIPS64 jumps
   cc387ae0898e MIPS: Calculate microMIPS ra properly when unwinding the stack
   d75d675a0552 MIPS: Fix is_jump_ins() handling of 16b microMIPS instructions
   72a0cfae59b4 MIPS: Fix get_frame_info() handling of microMIPS function size
   2998bf60d385 MIPS: Prevent unaligned accesses during stack unwinding
   0d45490221a2 MIPS: Clear ISA bit correctly in get_frame_info()
   f1be0f5814a6 MIPS: Lantiq: Keep ethernet enabled during boot
   093292b8f8f7 MIPS: OCTEON: Fix copy_from_user fault handling for large buffers
   b32e43cf3f74 MIPS: BCM47XX: Fix button inversion for Asus WL-500W
   5636da7aba4d MIPS: Fix special case in 64 bit IP checksumming.
   faf6aa4b129d samples: move mic/mpssd example code from Documentation
   dd4534d88b93 Linux 4.4.52
   c171caf7be28 kvm: vmx: ensure VMCS is current while enabling PML
   e0913cc300c7 Revert "usb: chipidea: imx: enable CI_HDRC_SET_NON_ZERO_TTHA"
   151d4c0fb55b rtlwifi: rtl_usb: Fix for URB leaking when doing ifconfig up/down
   de5634875b60 block: fix double-free in the failure path of cgwb_bdi_init()
   15696979d80f goldfish: Sanitize the broken interrupt handler
   d7f97304a485 x86/platform/goldfish: Prevent unconditional loading
   67f47e57f9ca USB: serial: ark3116: fix register-accessor error handling
   b04a2ca5c4b3 USB: serial: opticon: fix CTS retrieval at open
   06b1cf346a4d USB: serial: spcp8x5: fix modem-status handling
   22034ee5dab8 USB: serial: ftdi_sio: fix line-status over-reporting
   cfad0817222d USB: serial: ftdi_sio: fix extreme low-latency setting
   af82872b65e0 USB: serial: ftdi_sio: fix modem-status error handling
   bcea8e993772 USB: serial: cp210x: add new IDs for GE Bx50v3 boards
   1ae570ab1c06 USB: serial: mos7840: fix another NULL-deref at open
   04fae8abfaef tty: serial: msm: Fix module autoload
   49ed6307508e net: socket: fix recvmmsg not returning error from sock_error
   ce9ecb8d7f3c ip: fix IP_CHECKSUM handling
   353dd7290025 irda: Fix lockdep annotations in hashbin_delete().
   a95df078e866 dccp: fix freeing skb too early for IPV6_RECVPKTINFO
   fe41cfb48f2d packet: Do not call fanout_release from atomic contexts
   abd672deb170 packet: fix races in fanout_add()
   2b3eb43342a0 net/llc: avoid BUG_ON() in skb_orphan()
   e8330cb5ae47 blk-mq: really fix plug list flushing for nomerge queues
   f0414c1f8bb7 rtc: interface: ignore expired timers when enqueuing new timers
   a82ac399bcf2 rtlwifi: rtl_usb: Fix missing entry in USB driver's private data
   f1924ac09c96 Linux 4.4.51
   5a86b1150f6c mmc: core: fix multi-bit bus width without high-speed mode
   6f26f0ba2435 bcache: Make gc wakeup sane, remove set_task_state()
   aee7d0412f17 ntb_transport: Pick an unused queue
   c6c6851adbaf NTB: ntb_transport: fix debugfs_remove_recursive
   efa061998d22 printk: use rcuidle console tracepoint
   6787d3ecbef7 ARM: 8658/1: uaccess: fix zeroing of 64-bit get_user()
   e6394c7d1c19 futex: Move futex_init() to core_initcall
   906bb56e3a12 drm/dp/mst: fix kernel oops when turning off secondary monitor
   b32128386bf8 drm/radeon: Use mode h/vdisplay fields to hide out of bounds HW cursor
   c6cbae45a57f Input: elan_i2c - add ELAN0605 to the ACPI table
   65de8bfbbe20 Fix missing sanity check in /dev/sg
   8107096d243d scsi: don't BUG_ON() empty DMA transfers
   d7b146c69229 fuse: fix use after free issue in fuse_dev_do_read()
   385a592dc7ce siano: make it work again with CONFIG_VMAP_STACK
   f9400118b015 vfs: fix uninitialized flags in splice_to_pipe()
   c50b74d88661 Linux 4.4.50
   b9dee56027ae l2tp: do not use udp_ioctl()
   afb4feb8bfef ping: fix a null pointer dereference
   9117c897c9aa packet: round up linear to header len
   58691e5b4f27 net: introduce device min_header_len
   6f99825e7632 sit: fix a double free on error path
   a4226c7ebfb5 sctp: avoid BUG_ON on sctp_wait_for_sndbuf
   f46f344841ec mlx4: Invoke softirqs after napi_reschedule
   0db25098cb6c macvtap: read vnet_hdr_size once
   625bd9e43b3b tun: read vnet_hdr_sz once
   82e9f6b90a0e tcp: avoid infinite loop in tcp_splice_read()
   96ada0a978fa ipv6: tcp: add a missing tcp_v6_restore_cb()
   eaa3a58f4503 ip6_gre: fix ip6gre_err() invalid reads
   13c3646dac70 netlabel: out of bound access in cipso_v4_validate()
   2d9c2e011fd3 ipv4: keep skb->dst around in presence of IP options
   22449a01baa5 net: use a work queue to defer net_disable_timestamp() work
   f3ece3b38437 tcp: fix 0 divide in __tcp_select_window()
   3f5b5134ec7c ipv6: pointer math error in ip6_tnl_parse_tlv_enc_lim()
   41e07a7e01d9 ipv6: fix ip6_tnl_parse_tlv_enc_lim()
   e6c654c9c092 can: Fix kernel panic at security_sock_rcv_skb
   702c0ce9a7c7 Linux 4.4.49
   5b0465dd4ad4 drm/i915: fix use-after-free in page_flip_completed()
   a44ca389a736 ALSA: seq: Don't handle loop timeout at snd_seq_pool_done()
   e5f20a3fd6db ALSA: seq: Fix race at creating a queue
   010ada0cfcb9 xen-netfront: Delete rx_refill_timer in xennet_disconnect_backend()
   1c0da0ac217b scsi: mpt3sas: disable ASPM for MPI2 controllers
   4d6bdf7c73e7 scsi: aacraid: Fix INTx/MSI-x issue with older controllers
   52e02d6bf304 scsi: zfcp: fix use-after-free by not tracing WKA port open/close on failed send
   f2d256a2d49f netvsc: Set maximum GSO size in the right place
   b9c29d45f980 mac80211: Fix adding of mesh vendor IEs
   2f46791849be ARM: 8642/1: LPAE: catch pending imprecise abort on unmask
   04ed4a9e21f5 target: Fix COMPARE_AND_WRITE ref leak for non GOOD status
   0c863accadb0 target: Fix early transport_generic_handle_tmr abort scenario
   ee44e73832c2 target: Use correct SCSI status during EXTENDED_COPY exception
   44d03b9280ed target: Don't BUG_ON during NodeACL dynamic -> explicit conversion
   fcc038db5959 ARM: 8643/3: arm/ptrace: Preserve previous registers for short regset write
   cc187c6200f8 hns: avoid stack overflow with CONFIG_KASAN
   3b7ff5ed114f cpumask: use nr_cpumask_bits for parsing functions
   fd96835e205d Revert "x86/ioapic: Restore IO-APIC irq_chip retrigger callback"
   e72c13d93e9e selinux: fix off-by-one in setprocattr
   e871ea6bcf99 ARC: [arcompact] brown paper bag bug in unaligned access delay slot fixup
   6a1bd9063246 Linux 4.4.48
   87ebcc534d47 base/memory, hotplug: fix a kernel oops in show_valid_zones()
   374d06699537 x86/irq: Make irq activate operations symmetric
   94c0517fd0cb USB: serial: option: add device ID for HP lt2523 (Novatel E371)
   9cf89ade1afd usb: gadget: f_fs: Assorted buffer overflow checks.
   e4c1e6648298 USB: Add quirk for WORLDE easykey.25 MIDI keyboard
   b4b3442e5032 USB: serial: pl2303: add ATEN device ID
   244e7f00035d USB: serial: qcserial: add Dell DW5570 QDL
   f4f09b79a0c4 KVM: x86: do not save guest-unsupported XSAVE state
   8b51676d6cd9 HID: wacom: Fix poor prox handling in 'wacom_pl_irq'
   b3c8c31ed24c percpu-refcount: fix reference leak during percpu-atomic transition
   3a8e217851c9 mmc: sdhci: Ignore unexpected CARD_INT interrupts
   85fb980acb01 can: bcm: fix hrtimer/tasklet termination in bcm op removal
   4025ab36c81c mm, fs: check for fatal signals in do_generic_file_read()
   e86a8769579e mm/memory_hotplug.c: check start_pfn in test_pages_in_a_zone()
   920bba109299 cifs: initialize file_info_lock
   7aeb95ceb84b zswap: disable changing params if init fails
   5dadebc67586 svcrpc: fix oops in absence of krb5 module
   2b4e56fde91b NFSD: Fix a null reference case in find_or_create_lock_stateid()
   f584bb6df7a2 powerpc: Add missing error check to prom_find_boot_cpu()
   9b993e2c3df6 powerpc/eeh: Fix wrong flag passed to eeh_unfreeze_pe()
   db18e92ceb8d libata: apply MAX_SEC_1024 to all CX1-JB*-HP devices
   579a917538f1 ata: sata_mv:- Handle return value of devm_ioremap.
   d49d465d178f perf/core: Fix PERF_RECORD_MMAP2 prot/flags for anonymous memory
   72bb4b549085 crypto: arm64/aes-blk - honour iv_out requirement in CBC and CTR modes
   ae7d33f53a56 crypto: api - Clear CRYPTO_ALG_DEAD bit before registering an alg
   c4305f00852c drm/nouveau/nv1a,nv1f/disp: fix memory clock rate retrieval
   2a3797ef69c5 drm/nouveau/disp/gt215: Fix HDA ELD handling (thus, HDMI audio) on gt215
   e21a3cad35bc ext4: validate s_first_meta_bg at mount time
   62e546b2d3a0 PCI/ASPM: Handle PCI-to-PCIe bridges as roots of PCIe hierarchies
   4686ea264f1d Linux 4.4.47
   384e4bf0def9 net: dsa: Bring back device detaching in dsa_slave_suspend()
   74a7c39ec627 qmi_wwan/cdc_ether: add device ID for HP lt2523 (Novatel E371) WWAN card
   0492a033fb71 af_unix: move unix_mknod() out of bindlock
   e674c70bafe7 r8152: don't execute runtime suspend if the tx is not empty
   980b9afd9ecc bridge: netlink: call br_changelink() during br_dev_newlink()
   8f9e4ad8d7f3 tcp: initialize max window for a new fastopen socket
   8051bf2890e9 ipv6: addrconf: Avoid addrconf_disable_change() using RCU read-side lock
   8a066a87025e net: phy: bcm63xx: Utilize correct config_intr function
   6fec199362c4 net: fix harmonize_features() vs NETIF_F_HIGHDMA
   4f5e54bdd052 ax25: Fix segfault after sock connection timeout
   062b7f35ff6c ravb: do not use zero-length alignment DMA descriptor
   7d691d89eed0 openvswitch: maintain correct checksum state in conntrack actions
   b82981fb273d tcp: fix tcp_fastopen unaligned access complaints on sparc
   ec9e993f30f6 net: systemport: Decouple flow control from __bcm_sysport_tx_reclaim
   40e7c725ab0f net: ipv4: fix table id in getroute response
   2e84b8ce6fc3 net: lwtunnel: Handle lwtunnel_fill_encap failure
   290db2cd517e mlxsw: pci: Fix EQE structure definition
   811bb1b9d9ab mlxsw: switchx2: Fix memory leak at skb reallocation
   9edb2d75d81b mlxsw: spectrum: Fix memory leak at skb reallocation
   595ac452c451 r8152: fix the sw rx checksum is unavailable
   6c1ed78cb074 Linux 4.4.46
   d0721893214e mm, memcg: do not retry precharge charges
   14b97492d6e1 platform/x86: intel_mid_powerbtn: Set IRQ_ONESHOT
   d430c37db796 pinctrl: broxton: Use correct PADCFGLOCK offset
   5ddaf6804e24 s5k4ecgx: select CRC32 helper
   5288474d2f48 IB/umem: Release pid in error and ODP flow
   e114e66eec3d IB/ipoib: move back IB LL address into the hard header
   800a78f9e62b drm/i915: Don't leak edid in intel_crt_detect_ddc()
   d79e41188a1e SUNRPC: cleanup ida information when removing sunrpc module
   edef1086bf09 NFSv4.0: always send mode in SETATTR after EXCLUSIVE4
   0f64f22c0686 nfs: Don't increment lock sequence ID after NFS4ERR_MOVED
   bde741e9cc23 parisc: Don't use BITS_PER_LONG in userspace-exported swab.h header
   acb63c8b576d ARC: [arcompact] handle unaligned access delay slot corner case
   42ad7663677d ARC: udelay: fix inline assembler by adding LP_COUNT to clobber list
   bca1a95c9e20 can: ti_hecc: add missing prepare and unprepare of the clock
   63fe33a78428 can: c_can_pci: fix null-pointer-deref in c_can_start() - set device pointer
   bae49e72f951 s390/ptrace: Preserve previous registers for short regset write
   8637de3a318d RDMA/cma: Fix unknown symbol when CONFIG_IPV6 is not enabled
   d65032ab06f4 ISDN: eicon: silence misleading array-bounds warning
   d1b232c2ce53 sysctl: fix proc_doulongvec_ms_jiffies_minmax()
   f11e8bf8e99b mm/mempolicy.c: do not put mempolicy before using its nodemask
   c83ad9703e71 drm: Fix broken VT switch with video=1366x768 option
   23bc4e136bca tile/ptrace: Preserve previous registers for short regset write
   63db7c91a3c0 fbdev: color map copying bounds checking
   ef30573ef2b1 Linux 4.4.45
   8323d0555fe3 arm64: avoid returning from bad_mode
   6e65a4c698cf selftest/powerpc: Wrong PMC initialized in pmc56_overflow test
   a5291c1a9eae dmaengine: pl330: Fix runtime PM support for terminated transfers
   238623ce487f ite-cir: initialize use_demodulator before using it
   b02d7a8219bc blackfin: check devm_pinctrl_get() for errors
   a4d2fa085b9a ARM: 8613/1: Fix the uaccess crash on PB11MPCore
   baa2610c4962 ARM: ux500: fix prcmu_is_cpu_in_wfi() calculation
   68664ae14535 ARM: dts: imx6qdl-nitrogen6_max: fix sgtl5000 pinctrl init
   c55f8aaf4a19 arm64/ptrace: Reject attempts to set incomplete hardware breakpoint fields
   4c87fc7f2059 arm64/ptrace: Avoid uninitialised struct padding in fpr_set()
   03ee97d68d8b arm64/ptrace: Preserve previous registers for short regset write - 3
   d8263f1753ce arm64/ptrace: Preserve previous registers for short regset write - 2
   76e08d2966a9 arm64/ptrace: Preserve previous registers for short regset write
   41a9abb0e06b ARM: dts: da850-evm: fix read access to SPI flash
   62c3d36309d3 ceph: fix bad endianness handling in parse_reply_info_extra
   abfa5e8ae937 ARM: 8634/1: hw_breakpoint: blacklist Scorpion CPUs
   294b0aadc8c2 svcrdma: avoid duplicate dma unmapping during error recovery
   098b62b757a4 clocksource/exynos_mct: Clear interrupt when cpu is shut down
   a07563c3cf05 ubifs: Fix journal replay wrt. xattr nodes
   7ea1eb731453 qla2xxx: Fix crash due to null pointer access
   86915782ff65 x86/ioapic: Restore IO-APIC irq_chip retrigger callback
   212bab3c5b0b mtd: nand: xway: disable module support
   80aeb7bf5ca0 ieee802154: atusb: do not use the stack for buffers to make them DMA able
   8f6f508f70ff mmc: mxs-mmc: Fix additional cycles after transmission stop
   75c60df15c85 HID: corsair: fix control-transfer error handling
   0f37d20fdc70 HID: corsair: fix DMA buffers on stack
   4740d1d7d429 PCI: Enumerate switches below PCI-to-PCIe bridges
   dc4e372f9a47 fuse: clear FR_PENDING flag when moving requests out of pending queue
   6f3002c22087 svcrpc: don't leak contexts on PROC_DESTROY
   3b434ca8592a x86/PCI: Ignore _CRS on Supermicro X8DTH-i/6/iF/6F
   36672b8b99e2 tmpfs: clear S_ISGID when setting posix ACLs
   39d7c9ce35a1 ARM: dts: imx31: fix AVIC base address
   d2e4968e3c0d ARM: dts: imx31: move CCM device node to AIPS2 bus devices
   280d00a94293 ARM: dts: imx31: fix clock control module interrupts description
   2ba399c693c0 perf scripting: Avoid leaking the scripting_context variable
   aa02f29e95f3 IB/IPoIB: Remove can't use GFP_NOIO warning
   ea470497eb31 IB/mlx4: When no DMFS for IPoIB, don't allow NET_IF QPs
   f1c9169478ca IB/mlx4: Fix port query for 56Gb Ethernet links
   c7a40c48f7a5 IB/mlx4: Fix out-of-range array index in destroy qp flow
   1be54a4ec45a IB/mlx4: Set traffic class in AH
   4ffb36efe22c IB/mlx5: Wait for all async command completions to complete
   97085e2a386a ftrace/x86: Set ftrace_stub to weak to prevent gcc from using short jumps to it
   a7dd347a67c0 Linux 4.4.44
   45611fb9e0af pinctrl: sh-pfc: Do not unconditionally support PIN_CONFIG_BIAS_DISABLE
   ef6eadbf7b16 powerpc/ibmebus: Fix device reference leaks in sysfs interface
   488e7b2c5b6a powerpc/ibmebus: Fix further device reference leaks
   4d1b5086f7e2 bus: vexpress-config: fix device reference leak
   6e8210ad2585 blk-mq: Always schedule hctx->next_cpu
   ddf0c377bf82 ACPI / APEI: Fix NMI notification handling
   4af7970b3593 block: cfq_cpd_alloc() should use @gfp
   2c1dd423a567 cpufreq: powernv: Disable preemption while checking CPU throttling state
   33ebdfe913fd NFSv4.1: nfs4_fl_prepare_ds must be careful about reporting success.
   11804232d1ad NFS: Fix a performance regression in readdir
   8ff851bf2240 pNFS: Fix race in pnfs_wait_on_layoutreturn
   7aae6e3c0c52 pinctrl: meson: fix gpio request disabling other modes
   f0382c090a20 btrfs: fix error handling when run_delayed_extent_op fails
   205e997acde7 btrfs: fix locking when we put back a delayed ref that's too new
   68b97d287e28 x86/cpu: Fix bootup crashes by sanitizing the argument of the 'clearcpuid=' command-line option
   0cf23324af1c USB: serial: ch341: fix modem-control and B0 handling
   1d25a05642c8 USB: serial: ch341: fix resume after reset
   a1a0612b7dde drm/radeon: drop verde dpm quirks
   b9d6631395a1 sysctl: Drop reference added by grab_header in proc_sys_readdir
   ca81117b7432 sysrq: attach sysrq handler correctly for 32-bit kernel
   075f493a974e tty/serial: atmel_serial: BUG: stop DMA from transmitting in stop_tx
   4a6716f16517 mnt: Protect the mountpoint hashtable with mount_lock
   836fd7c9e6e6 vme: Fix wrong pointer utilization in ca91cx42_slave_get
   d5fcd719e889 xhci: fix deadlock at host remove by running watchdog correctly
   ae76af251806 i2c: fix kernel memory disclosure in dev interface
   f64b9acc368c i2c: print correct device invalid address
   085f4ebec797 Input: elants_i2c - avoid divide by 0 errors on bad touchscreen data
   214a8e98e6bc USB: serial: ch341: fix open and resume after B0
   802b4ef3b989 USB: serial: ch341: fix control-message error handling
   bc74606d8d80 USB: serial: ch341: fix open error handling
   e29f709c2f56 USB: serial: ch341: fix initial modem-control state
   3ef5bc0b385f USB: serial: kl5kusb105: fix line-state error handling
   4a1ecf37a59f nl80211: fix sched scan netlink socket owner destruction
   9d3875c0c462 KVM: x86: Introduce segmented_write_std
   3490e72ad6d0 KVM: x86: emulate FXSAVE and FXRSTOR
   d9c4c1e7c2cf KVM: x86: add asm_safe wrapper
   4fa0090249fb KVM: x86: add Align16 instruction flag
   1fc673d96f9d KVM: x86: flush pending lapic jump label updates on module unload
   3d27cd4b2527 jump_labels: API for flushing deferred jump label updates
   34a55c9d4a2d KVM: eventfd: fix NULL deref irqbypass consumer
   816307c80d4d KVM: x86: fix emulation of "MOV SS, null selector"
   1a46e6ecf896 mm/hugetlb.c: fix reservation race when freeing surplus pages
   6bbb8ff3b68e ocfs2: fix crash caused by stale lvb with fsdlm plugin
   70429b970bde mm: fix devm_memremap_pages crash, use mem_hotplug_{begin, done}
   6de62ec07d2a selftests: do not require bash for the generated test
   2deaeea23fbd selftests: do not require bash to run netsocktests testcase
   2e2679a168fe Input: i8042 - add Pegatron touchpad to noloop table
   51377793758a Input: xpad - use correct product id for x360w controllers
   d9ea51a9bea4 Linux 4.4.43
   e21901d7a5eb mm/init: fix zone boundary creation
   e3f77bb158f9 ALSA: usb-audio: Add a quirk for Plantronics BT600
   a1c81f839c6f spi: mvebu: fix baudrate calculation for armada variant
   dfd64d112a02 ARM: OMAP4+: Fix bad fallthrough for cpuidle
   04dc1be104fe ARM: zynq: Reserve correct amount of non-DMA RAM
   bed280bbc995 powerpc: Fix build warning on 32-bit PPC
   fa48a1607580 ALSA: firewire-tascam: Fix to handle error from initialization of stream data
   a2f727149ee4 HID: hid-cypress: validate length of report
   70e05a9f2f4f net: vrf: do not allow table id 0
   c177d491a948 net: ipv4: Fix multipath selection with vrf
   67b21973ecf4 gro: Disable frag0 optimization on IPv6 ext headers
   db7119eaacf4 gro: use min_t() in skb_gro_reset_offset()
   5169043e9722 gro: Enter slow-path if there is no tailroom
   0d3b9c2746d3 r8152: fix rx issue for runtime suspend
   c31a3c79928b r8152: split rtl8152_suspend function
   807cac887d95 ipv4: Do not allow MAIN to be alias for new LOCAL w/ custom rules
   0d431f94c181 igmp: Make igmp group member RFC 3376 compliant
   14e8d568f14f drop_monitor: consider inserted data in genlmsg_end
   81e7916476ca drop_monitor: add missing call to genlmsg_end
   1ff0308f33ce net/mlx5: Avoid shadowing numa_node
   18d971f84c84 net/mlx5: Check FW limitations on log_max_qp before setting it
   3f2847608cb9 net: stmmac: Fix race between stmmac_drv_probe and stmmac_open
   67bce5821c9a net, sched: fix soft lockup in tc_classify
   58d0d7a45ef8 ipv6: handle -EFAULT from skb_copy_bits
   6ac0b3810cdc net: vrf: Drop conntrack data after pass through VRF device on Tx
   1e5298d4c82b ser_gigaset: return -ENOMEM on error instead of success
   33c7b0f74c57 netvsc: reduce maximum GSO size
   49c4446a2e13 Linux 4.4.42
   adf640eaefac usb: gadget: composite: always set ep->mult to a sensible value
   f108b2de9cd0 Revert "usb: gadget: composite: always set ep->mult to a sensible value"
   6053479cbbc5 tick/broadcast: Prevent NULL pointer dereference
   af817b3fc6e5 drm/radeon: Always store CRTC relative radeon_crtc->cursor_x/y values
   9205be7fa632 cx23885-dvb: move initialization of a8293_pdata
   6b59fb520123 net: vxge: avoid unused function warnings
   8003ac65d0a5 net: ti: cpmac: Fix compiler warning due to type confusion
   becfb50c66cb cred/userns: define current_user_ns() as a function
   f5a636fd416f staging: comedi: dt282x: tidy up register bit defines
   8f251525da14 powerpc/pci/rpadlpar: Fix device reference leaks
   ccd7bd29c2e6 md: MD_RECOVERY_NEEDED is set for mddev->recovery
   1d3124821f3a crypto: arm64/aes-ce - fix for big endian
   5b21c5489206 crypto: arm64/aes-xts-ce: fix for big endian
   abca9c2d2cab crypto: arm64/sha1-ce - fix for big endian
   83f8a200af45 crypto: arm64/aes-neon - fix for big endian
   bd17e2d36615 crypto: arm64/aes-ccm-ce: fix for big endian
   bed5c78798e1 crypto: arm/aes-ce - fix for big endian
   4c575a30db8c crypto: arm64/ghash-ce - fix for big endian
   820c2ac4c9f4 crypto: arm64/sha2-ce - fix for big endian
   6119edd2d87a s390/crypto: unlock on error in prng_tdes_read()
   85baf9416b7e mmc: mmc_test: Uninitialized return value
   b0cb7f60998c PM / wakeirq: Fix dedicated wakeirq for drivers not using autosuspend
   fc44d3d05478 irqchip/bcm7038-l1: Implement irq_cpu_offline() callback
   69dc8473b750 target/iscsi: Fix double free in lio_target_tiqn_addtpg()
   e57c830c9041 scsi: mvsas: fix command_active typo
   079c4b43e1fe ASoC: samsung: i2s: Fixup last IRQ unsafe spin lock call
   83882724eb65 iommu/vt-d: Flush old iommu caches for kdump when the device gets context mapped
   91bc81b9661c iommu/vt-d: Fix pasid table size encoding
   dc78a9e1b4f8 iommu/amd: Fix the left value check of cmd buffer
   b54dcc3b68ef iommu/amd: Missing error code in amd_iommu_init_device()
   46105512474f clk: imx31: fix rewritten input argument of mx31_clocks_init()
   f371ee85268d clk: clk-wm831x: fix a logic error
   92e993abb928 hwmon: (g762) Fix overflows and crash seen when writing limit attributes
   fd504f529160 hwmon: (nct7802) Fix overflows seen when writing into limit attributes
   5e351caeaa96 hwmon: (ds620) Fix overflows seen when writing temperature limits
   fbab1832e7e8 hwmon: (amc6821) sign extension temperature
   07c05622f63d hwmon: (scpi) Fix module autoload
   9453d46a12ba cris: Only build flash rescue image if CONFIG_ETRAX_AXISFLASHMAP is selected
   8353a5deec10 ath10k: use the right length of "background"
   56ef587b77fd stable-fixup: hotplug: fix unused function warning
   acb7df233b72 usb: dwc3: ep0: explicitly call dwc3_ep0_prepare_one_trb()
   ecd4ad9ab7e9 usb: dwc3: ep0: add dwc3_ep0_prepare_one_trb()
   efcd2e082f0f usb: dwc3: gadget: always unmap EP0 requests
   7927c0314060 staging: iio: ad7606: fix improper setting of oversampling pins
   3e4302f99aed mei: bus: fix mei_cldev_enable KDoc
   e94800df8c1f USB: serial: io_ti: bind to interface after fw download
   1224bb23fe15 USB: phy: am335x-control: fix device and of_node leaks
   d36d0122ff51 ARM: dts: r8a7794: Correct hsusb parent clock
   de2cf4998a52 USB: serial: kl5kusb105: abort on open exception path
   f5531856c2c7 ALSA: usb-audio: Fix bogus error return in snd_usb_create_stream()
   d576c36a3e1f usb: musb: blackfin: add bfin_fifo_offset in bfin_ops
   e675483ee2f1 usb: hub: Move hub_port_disable() to fix warning if PM is disabled
   02ef64ac647f usb: musb: Fix trying to free already-free IRQ 4
   60dffc173220 usb: dwc3: pci: add Intel Gemini Lake PCI ID
   59185ef00b46 xhci: Fix race related to abort operation
   ce737ba8e23e xhci: Use delayed_work instead of timer for command timeout
   b07b4fa72500 usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL
   3e3f05182b39 USB: serial: mos7720: fix parallel probe
   5c83e07c3c8b USB: serial: mos7720: fix parport use-after-free on probe errors
   2f525ed5efb8 USB: serial: mos7720: fix use-after-free on probe errors
   f2e8b37a9970 USB: serial: mos7720: fix NULL-deref at open
   857757872704 USB: serial: mos7840: fix NULL-deref at open
   1b1fdc715807 USB: serial: kobil_sct: fix NULL-deref in write
   b60b91268cd0 USB: serial: cyberjack: fix NULL-deref at open
   b835f4cd6700 USB: serial: oti6858: fix NULL-deref at open
   374250ed9b26 USB: serial: io_edgeport: fix NULL-deref at open
   ad4de3d91872 USB: serial: ti_usb_3410_5052: fix NULL-deref at open
   f0bdd7e0ccb2 USB: serial: garmin_gps: fix memory leak on failed URB submit
   e3d6a0da47e6 USB: serial: iuu_phoenix: fix NULL-deref at open
   11743d704e51 USB: serial: io_ti: fix I/O after disconnect
   7ef8807cce7d USB: serial: io_ti: fix another NULL-deref at open
   33a5d0cc25f4 USB: serial: io_ti: fix NULL-deref at open
   0243498813d2 USB: serial: spcp8x5: fix NULL-deref at open
   65d107038ec6 USB: serial: keyspan_pda: verify endpoints at probe
   c6aa86222ec5 USB: serial: pl2303: fix NULL-deref at open
   4e106709060f USB: serial: quatech2: fix sleep-while-atomic in close
   7b5d7880019c USB: serial: omninet: fix NULL-derefs at open and disconnect
   d88f0f6c5ba0 usb: xhci: hold lock over xhci_abort_cmd_ring()
   f286c2513ba6 xhci: Handle command completion and timeout race
   86bb666386ee usb: host: xhci: Fix possible wild pointer when handling abort command
   3447b3772934 usb: xhci: fix return value of xhci_setup_device()
   2d1b4fcba4a7 xhci: free xhci virtual devices with leaf nodes first
   b303a108541e usb: xhci: apply XHCI_PME_STUCK_QUIRK to Intel Apollo Lake
   b4b404b99177 xhci: workaround for hosts missing CAS bit
   e224b8b7215f usb: xhci: fix possible wild pointer
   438efb640e83 usb: dwc3: core: avoid Overflow events
   96a21e702606 usb: gadget: composite: Test get_alt() presence instead of set_alt()
   bd4e78bbc93f USB: dummy-hcd: fix bug in stop_activity (handle ep0)
   7cc00abef071 USB: fix problems with duplicate endpoint addresses
   f6ff9981743c USB: gadgetfs: fix checks of wTotalLength in config descriptors
   74e36bffe645 USB: gadgetfs: fix use-after-free bug
   fe75330a27fc USB: gadgetfs: fix unbounded memory allocation bug
   10a4380ea145 usb: gadgetfs: restrict upper bound on device configuration size
   9cc601b40d76 usb: storage: unusual_uas: Add JMicron JMS56x to unusual device
   96175db0a647 usb: musb: dsps: implement clear_ep_rxintr() callback
   2a0e2a89cc41 usb: musb: core: add clear_ep_rxintr() to musb_platform_ops
   e72575d2d76e KVM: MIPS: Flush KVM entry code from icache globally
   7b95f36fc6fa KVM: x86: reset MMU on KVM_SET_VCPU_EVENTS
   9b73f43fcef4 mac80211: initialize fast-xmit 'info' later
   6e28a02f0e86 ARM: davinci: da850: don't add emac clock to lookup table twice
   bb1cacd88e07 ALSA: usb-audio: Fix irq/process data synchronization
   16b968a1ca96 ALSA: hda - Apply asus-mode8 fixup to ASUS X71SL
   b87483c27624 ALSA: hda - Fix up GPIO for ASUS ROG Ranger

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 82f1a94f162f..390b0b72c137 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6622c6471016005d5588aa4338ce57aced713dcd"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
+SRCREV_machine ?= "15a97653eb794367a2b12bfeaf68f0104f8213e3"
+SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.41"
+LINUX_VERSION ?= "4.4.53"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 6cb580dc3e90..35cc2b1b7a56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.41"
+LINUX_VERSION ?= "4.4.53"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
+SRCREV_machine ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 34e0f38c030b..70c3beecb3aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "60287c1951ca7063bc19597eb5cabf834e660cfb"
-SRCREV_machine_qemuarm64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemumips ?= "143d659ae6d53623001e22c13a0286bd6d1723ca"
-SRCREV_machine_qemuppc ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemux86 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemux86-64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_machine_qemumips64 ?= "c74cc42106745bab08de6263b9320ac029f2cca9"
-SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
+SRCREV_machine_qemuarm ?= "96c11ef2a20975febadc839abaae3127731de642"
+SRCREV_machine_qemuarm64 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_machine_qemumips ?= "e22a4ddcb6472ae6f258c16af1b38e8e5866c5eb"
+SRCREV_machine_qemuppc ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_machine_qemux86 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_machine_qemux86-64 ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_machine_qemumips64 ?= "ca07238310e9ef502adbb1416e9f327657886343"
+SRCREV_machine ?= "cebe1ad56aebd89e0de29412e19433fb441bf13c"
+SRCREV_meta ?= "864bc5736aa58c510713e7b76d205d5341377972"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.41"
+LINUX_VERSION ?= "4.4.53"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


