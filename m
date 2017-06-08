Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED3AC6022E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 18:39:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v58IdgSB029888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Jun 2017 11:39:42 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 11:39:41 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <akuster808@gmail.com>
Date: Thu, 8 Jun 2017 14:39:41 -0400
Message-ID: <1496947181-10472-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][morty] linux-yocto/4.8: update to 4.8.24
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
X-List-Received-Date: Thu, 08 Jun 2017 18:39:44 -0000
Content-Type: text/plain

Integration the -stable updates to 4.8, which comprise the following
commits:

   ae51b3b4efe6 Linux 4.8.24
   accb950219c0 nvme/pci: Disable on removal when disconnected
   995be68699ef padata: avoid race in reordering
   bea2fdcc6d3e blk: improve order of bio handling in generic_make_request()
   26690f5a8bdf mm: workingset: fix premature shadow node shrinking with cgroups
   f52ade55d6e9 MIPS: Lantiq: Fix cascaded IRQ setup
   feae78cdcaef ARM: dts: BCM5301X: Correct GIC_PPI interrupt flags
   e36a1a1a9695 ARM: BCM5301X: Add back handler ignoring external imprecise aborts
   26fbe60844a9 mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
   d15202219abe mm: rmap: fix huge file mmap accounting in the memcg stats
   72f38e33793c x86/mce: Fix copy/paste error in exception table entries
   9e08a6f8e64e x86/mm/KASLR: Exclude EFI region from KASLR VA space randomization
   100aa553e31b x86/mm/64: Enable KASLR for vmemmap memory region
   2e5c45495433 drm/etnaviv: (re-)protect fence allocation with GPU mutex
   7f160b149090 drm/vc4: Allocate the right amount of space for boot-time CRTC state.
   38cdfd6153cf drm/radeon: Override fpfn for all VRAM placements in radeon_evict_flags
   ccd0fc5589ca KVM: kvm_io_bus_unregister_dev() should never fail
   332e2ac55d3b KVM: x86: clear bus pointer when destroyed
   fcbdbe1290d6 serial: mxs-auart: Fix baudrate calculation
   3b7bb3391f62 USB: fix linked-list corruption in rh_call_control()
   5f004babfd46 tty/serial: atmel: fix race condition (TX+DMA)
   4509ea7b4349 ACPI: Do not create a platform_device for IOAPIC/IOxAPIC
   12fddf4d255f ACPI: Fix incompatibility with mcount-based function graph tracing
   8805bbdea121 nfsd: map the ENOKEY to nfserr_perm for avoiding warning
   1fa18f8fad45 mmc: sdhci-of-at91: fix MMC_DDR_52 timing selection
   3a0df02f0387 mmc: sdhci: Disable runtime pm when the sdio_irq is enabled
   d742580939f5 ASoC: Intel: Skylake: fix invalid memory access due to wrong reference of pointer
   726514355250 ASoC: atmel-classd: fix audio clock rate
   0dd77376bd45 ALSA: hda - fix a problem for lineout on a Dell AIO machine
   12788ff3a917 ALSA: seq: Fix race during FIFO resize
   5ccedc21345f PCI: iproc: Save host bridge window resource in struct iproc_pcie
   61b133e83718 scsi: scsi_dh_alua: Ensure that alua_activate() calls the completion function
   ae4a71a0b8b4 scsi: scsi_dh_alua: Check scsi_device_get() return value
   1b82bcc866c3 scsi: libsas: fix ata xfer length
   0b9b5b603f27 scsi: sg: check length passed to SG_NEXT_CMD_LEN
   8b02a4b8e3b3 xfs: Use xfs_icluster_size_fsb() to calculate inode alignment mask
   a8eded7e1484 xfs: tune down agno asserts in the bmap code
   7650b45a6dd8 xfs: Use xfs_icluster_size_fsb() to calculate inode chunk alignment
   e9d4a4b55c86 xfs: don't reserve blocks for right shift transactions
   81f456210999 xfs: split indlen reservations fairly when under reserved
   842c9d864561 xfs: handle indlen shortage on delalloc extent merge
   f90db61ed148 xfs: don't fail xfs_extent_busy allocation
   590e612677e2 xfs: reset b_first_retry_time when clear the retry status of xfs_buf_t
   c493142b3a2c xfs: verify free block header fields
   4dda58920fb9 xfs: check for obviously bad level values in the bmbt root
   0faf06ef8b24 xfs: filter out obviously bad btree pointers
   6974d828ce0c xfs: fail _dir_open when readahead fails
   365ec079aeeb xfs: fix toctou race when locking an inode to access the data map
   06a1dbe68823 xfs: fix eofblocks race with file extending async dio writes
   fc1ff6abfb5d xfs: pull up iolock from xfs_free_eofblocks()
   2de02a1aa708 xen/setup: Don't relocate p2m over existing one
   bd37e332bc35 libceph: force GFP_NOIO for socket allocations
   14d57fe1fcd3 sched/rt: Add a missing rescheduling point
   461aa14a19df metag/ptrace: Reject partial NT_METAG_RPIPE writes
   35d078d3b1f5 metag/ptrace: Provide default TXSTATUS for short NT_PRSTATUS
   9519f4083b0d metag/ptrace: Preserve previous registers for short regset write
   b2d2e181ebe4 sparc/ptrace: Preserve previous registers for short regset write
   0a89a38ebbae mips/ptrace: Preserve previous registers for short regset write
   a303cc3a707b h8300/ptrace: Fix incorrect register transfer count
   576d881764eb c6x/ptrace: Remove useless PTRACE_SETREGSET implementation
   1661ca89ebd1 pinctrl: qcom: Don't clear status bit on irq_unmask
   5c52be1e1c55 virtio_balloon: init 1st buffer in stats vq
   171bd47e04fa KVM: x86: cleanup the page tracking SRCU instance
   37c063abc015 xfrm_user: validate XFRM_MSG_NEWAE incoming ESN size harder
   f5e8896582a0 xfrm_user: validate XFRM_MSG_NEWAE XFRMA_REPLAY_ESN_VAL replay_window
   ef704417015e xfrm: policy: init locks early
   54b82b92b678 crypto: algif_hash - avoid zero-sized array
   35a836ab3d9b fbcon: Fix vc attr at deinit
   d64422cfc106 drm: reference count event->completion
   5b8d397ea73a drm/bridge: analogix dp: Fix runtime PM state on driver bind
   409d2330bd85 libceph: don't set weight to IN when OSD is destroyed
   cb7f50af5964 Drivers: hv: vmbus: Don't leak channel ids
   7d63e96a483f intel_th: Don't leak module refcount on failure to activate
   bca70ad00096 blk-mq: don't complete un-started request in timeout handler
   7ca7701e2615 cgroup, net_cls: iterate the fds of only the tasks which are being migrated
   c3accccd8ebe cpufreq: Restore policy min/max limits on CPU online
   42ec5a5b3f7a arm64: kaslr: Fix up the kernel image alignment
   b74685fc49ce ARM: at91: pm: cpu_idle: switch DDR to power-down mode
   cba43efed603 Revert "ARM: at91/dt: sama5d2: Use new compatible for ohci node"
   a54b0f345230 xen/acpi: upload PM state from init-domain to Xen
   3700c9549893 crypto: ccp - Assign DMA commands to the channel's CCP
   c05851c95c30 clk: sunxi-ng: mp: Adjust parent rate for pre-dividers
   298b4bcbee9e mmc: sdhci: Do not disable interrupts while waiting for clock
   d3bde483cd4e mmc: sdhci-of-arasan: fix incorrect timeout clock
   1a0c2899c1fc mmc: sdhci-of-at91: Support external regulators
   512b6b14b972 mmc: sdhci: Rename sdhci_set_power() to sdhci_set_power_noreg()
   fcc465466352 powerpc/64s: Fix idle wakeup potential to clobber registers
   e31490f131bd ext4: lock the xattr block before checksuming it
   9515b8a3e59d ext4: mark inode dirty after converting inline directory
   ee78dd996a48 parport: fix attempt to write duplicate procfiles
   7aa1f90f7bc9 iio: hid-sensor-trigger: Change get poll value function order to avoid sensor properties losing after resume from S3
   46ed5a6a0317 iio: sw-device: Fix config group initialization
   4fd6237dcb15 iio: adc: ti_am335x_adc: fix fifo overrun recovery
   10481fe5bcc5 mmc: ushc: fix NULL-deref at probe
   b18275c8ca06 uwb: hwa-rc: fix NULL-deref at probe
   90f875db3d83 uwb: i1480-dfu: fix NULL-deref at probe
   fedb7364f161 USB: usbtmc: fix probe error path
   19ab12977470 USB: usbtmc: add missing endpoint sanity check
   d2f6089a604a usb: hub: Fix crash after failure to read BOS descriptor
   4fe7f56d5936 usb: musb: cppi41: don't check early-TX-interrupt for Isoch transfer
   c314f1d496b3 USB: wusbcore: fix NULL-deref at probe
   67ca7e6fbefe USB: idmouse: fix NULL-deref at probe
   979ce26d7e67 USB: lvtest: fix NULL-deref at probe
   bc5daa8fcb39 USB: uss720: fix NULL-deref at probe
   778e23f6cd77 usb-core: Add LINEAR_FRAME_INTR_BINTERVAL USB quirk
   8d38a9d16950 usb: gadget: f_uvc: Fix SuperSpeed companion descriptor's wBytesPerInterval
   ac5c5689dd1e ACM gadget: fix endianness in notifications
   8e39a4d96fa0 USB: serial: qcserial: add Dell DW5811e
   d3e557a5e277 USB: serial: option: add Quectel UC15, UC20, EC21, and EC25 modems
   0ff11fc75667 ALSA: hda - Adding a group of pin definition to fix headset problem
   73ac94f75f27 ALSA: seq: Fix racy cell insertions during snd_seq_pool_done()
   ed79a62ce3b5 Input: sur40 - validate number of endpoints before using them
   9f4a9350c962 Input: kbtab - validate number of endpoints before using them
   535ecfd9ce37 Input: cm109 - validate number of endpoints before using them
   d4d90cc1939b Input: yealink - validate number of endpoints before using them
   6cd3c938420d Input: hanwang - validate number of endpoints before using them
   114ea08f2b53 Input: ims-pcu - validate number of endpoints before using them
   8e536247967f Input: iforce - validate number of endpoints before using them
   d8e9da7cf4d2 Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000
   d7bd4ff902d4 Input: elan_i2c - add ASUS EeeBook X205TA special touchpad fw
   15cbc365f36f tcp: initialize icsk_ack.lrcvtime at session start time
   8d816936cb47 socket, bpf: fix sk_filter use after free in sk_clone_lock
   599dca4e637a ipv4: provide stronger user input validation in nl_fib_input()
   4dce5676bf12 net: bcmgenet: remove bcmgenet_internal_phy_setup()
   e54a886d9c7e ipv6: make sure to initialize sockc.tsflags before first use
   de7b203e7a07 net/mlx5e: Count LRO packets correctly
   7e3b2755ae57 net/mlx5e: Count GSO packets correctly
   0bb7b7ed9983 net/mlx5: Increase number of max QPs in default profile
   de1454d45e43 net/mlx5: Add missing entries for set/query rate limit commands
   aea1c1b15494 net: vrf: Reset rt6i_idev in local dst after put
   30467a2d6a10 qmi_wwan: add Dell DW5811e
   74a4f76fd1ac net: unix: properly re-increment inflight counter of GC discarded candidates
   b4927d54c638 openvswitch: Add missing case OVS_TUNNEL_KEY_ATTR_PAD
   d98fc268e284 amd-xgbe: Fix jumbo MTU processing on newer hardware
   4ceda29faefa net: properly release sk_frag.page
   42603fb986e2 net: bcmgenet: Do not suspend PHY if Wake-on-LAN is enabled
   40dbeb5b15df net/openvswitch: Set the ipv6 source tunnel key address attribute correctly
   81ecfc287d5a cgroup/pids: remove spurious suspicious RCU usage warning
   b488f503b905 percpu: acquire pcpu_lock when updating pcpu_nr_empty_pop_pages
   1924ae622fd9 gfs2: Avoid alignment hole in struct lm_lockname
   e279f259f3e2 isdn/gigaset: fix NULL-deref at probe
   0907a6cf5831 target: Fix VERIFY_16 handling in sbc_parse_cdb
   6d71fefbf405 scsi: libiscsi: add lock around task lists to fix list corruption regression
   4835fd5ad7aa scsi: lpfc: Add shutdown method for kexec
   93ecb4c0e2cf target/pscsi: Fix TYPE_TAPE + TYPE_MEDIMUM_CHANGER export
   e5660310dac8 powerpc/boot: Fix zImage TOC alignment
   8ce12dd199ac cpufreq: Fix and clean up show_cpuinfo_cur_freq()
   4d5c2d2099a8 perf/core: Fix event inheritance on fork()
   f7b9504c680d perf/core: Fix use-after-free in perf_release()
   848b0d18a847 parisc: Optimize flush_kernel_vmap_range and invalidate_kernel_vmap_range
   fbb1e639d3e1 qla2xxx: Fix request queue corruption.
   60d674590d02 qla2xxx: Fix memory leak for abts processing
   e5e1af16aeae give up on gcc ilog2() constant optimizations
   2401ecb47c7f drm/vc4: Use runtime autosuspend to avoid thrashing V3D power state.
   c495444e18c6 drm/vc4: Fix termination of the initial scan for branch targets.
   97b74d794fa3 Linux 4.8.23
   5d2e054aa127 crypto: powerpc - Fix initialisation of crc32c context
   30eacf198cab locking/rwsem: Fix down_write_killable() for CONFIG_RWSEM_GENERIC_SPINLOCK=y
   6ceef14519cd futex: Add missing error handling to FUTEX_REQUEUE_PI
   0596ef2a1984 futex: Fix potential use-after-free in FUTEX_REQUEUE_PI
   e0421c6f49b0 x86/perf: Fix CR4.PCE propagation to use active_mm instead of mm
   b88efae3588c x86/kasan: Fix boot with KASAN=y and PROFILE_ANNOTATED_BRANCHES=y
   429bf916381e x86/tsc: Fix ART for TSC_KNOWN_FREQ
   5eb6ff068525 drm/vc4: Fix ->clock_select setting for the VEC encoder
   4a3f522f63ab drm/vc4: Fix race between page flip completion event and clean-up
   02c5256b110c clk: bcm2835: Fix ->fixed_divider of pllh_aux
   d5dd232fc11e usb: gadget: udc: atmel: remove memory leak
   e85561f6aca8 serial: 8250_pci: Detach low-level driver during PCI error recovery
   54c73832c576 ACPI / blacklist: Make Dell Latitude 3350 ethernet work
   f92b80712355 ACPI / blacklist: add _REV quirks for Dell Precision 5520 and 3520
   990db74c5c87 slub: move synchronize_sched out of slab_mutex on shrink
   06e966ded31e [media] uvcvideo: uvc_scan_fallback() for webcams with broken chain
   e30814bb2038 s390/zcrypt: Introduce CEX6 toleration
   c73c813f59ed block: allow WRITE_SAME commands with the SG_IO ioctl
   bb64e9763f59 drm/nouveau/disp/nv50-: specify ctrl/user separately when constructing classes
   3c5d63c13311 drm/nouveau/disp/nv50-: split chid into chid.ctrl and chid.user
   49e8233a2726 drm/nouveau/disp/gp102: fix cursor/overlay immediate channel indices
   275ff35915b3 vfio/spapr: Postpone default window creation
   a6cc475b194a vfio/spapr: Add a helper to create default DMA window
   95045ae80bba powerpc/mm/iommu, vfio/spapr: Put pages on VFIO container shutdown
   789e7eac7ee0 vfio/spapr: Reference mm in tce_container
   28a412c87e63 powerpc/iommu: Stop using @current in mm_iommu_xxx
   605c802e3cb9 powerpc/iommu: Pass mm_struct to init/cleanup helpers
   c70e411994d8 vfio/spapr: Postpone allocation of userspace version of TCE table
   89b9c28ca6d7 Drivers: hv: ring_buffer: count on wrap around mappings in get_next_pkt_raw() (v2)
   ea35dd4dc3d5 PCI: Do any VF BAR updates before enabling the BARs
   ddb11bb30cbc PCI: Ignore BAR updates on virtual functions
   bfaf6ec96d7f PCI: Update BARs using property bits appropriate for type
   c09761e3af3f PCI: Don't update VF BARs while VF memory space is enabled
   f49fdb5fb9aa PCI: Decouple IORESOURCE_ROM_ENABLE and PCI_ROM_ADDRESS_ENABLE
   4453d0980e47 PCI: Add comments about ROM BAR updating
   e9026b999d64 PCI: Remove pci_resource_bar() and pci_iov_resource_bar()
   bf5194f0e771 PCI: Separate VF BAR updates from standard BAR updates
   4c25b4da1978 x86/hyperv: Handle unknown NMIs on one CPU when unknown_nmi_panic
   f86de0bf6845 scsi: ibmvscsis: Synchronize cmds at remove time
   03780edbb14b scsi: ibmvscsis: Synchronize cmds at tpg_enable_store time
   6e76f14e8da7 scsi: ibmvscsis: Rearrange functions for future patches
   87e714992008 scsi: ibmvscsis: Clean up properly if target_submit_cmd/tmr fails
   26d9e831807f scsi: ibmvscsis: Return correct partition name/# to client
   017f9415d242 scsi: ibmvscsis: Issues from Dan Carpenter/Smatch
   1a865ae47435 igb: add i211 to i210 PHY workaround
   7af86b0c55e3 igb: Workaround for igb i210 firmware issue
   15fdb8c2a904 xen: do not re-use pirq number cached in pci device msi msg data
   4af906f27c02 dmaengine: iota: ioat_alloc_chan_resources should not perform sleeping allocations.
   7815d4127881 dccp: fix memory leak during tear-down of unsuccessful connection request
   348714c022b1 tun: fix premature POLLOUT notification on tun devices
   a1bc0a9f122e dccp/tcp: fix routing redirect race
   0a787971aa5b bridge: drop netfilter fake rtable unconditionally
   ee1d5c66f7d9 ipv6: avoid write to a possibly cloned skb
   81ed14c04c32 ipv6: make ECMP route replacement less greedy
   0949ba4922e5 mpls: Do not decrement alive counter for unregister events
   76aaba0ce52e mpls: Send route delete notifications when router module is unloaded
   48325fbb1d05 act_connmark: avoid crashing on malformed nlattrs with null parms
   4331398f440e uapi: fix linux/packet_diag.h userspace compilation error
   f5f6f5529468 net/tunnel: set inner protocol in network gro hooks
   2a00f4bf0780 vrf: Fix use-after-free in vrf_xmit
   61e3a5db6e7d dccp: fix use-after-free in dccp_feat_activate_values
   39ff72664911 net: fix socket refcounting in skb_complete_tx_timestamp()
   9d88ea01fe88 net: fix socket refcounting in skb_complete_wifi_ack()
   65f7a3f9b6c0 tcp: fix various issues for sockets morphing to listen state
   5531ae9e101d dccp: Unlock sock before calling sk_free()
   beb7cb3c2a3d ipv6: orphan skbs in reassembly unit
   728edccaedbf net: net_enable_timestamp() can be called from irq contexts
   e9f82ae95dcc net: don't call strlen() on the user buffer in packet_bind_spkt()
   b0c360a043c0 tcp/dccp: block BH for SYN processing
   b64d0db77b52 mlxsw: spectrum_router: Avoid potential packets loss
   8e1715480d7c l2tp: avoid use-after-free caused by l2tp_ip_backlog_recv
   44797e4d24c0 net sched actions: decrement module reference count after table flush.
   9c1294eeb41e ipv4: mask tos for input route
   368d2236b926 vxlan: don't allow overwrite of config src addr
   9ead713bc6ac vti6: return GRE_KEY for vti6
   a305478b6e7d vxlan: correctly validate VXLAN ID against VXLAN_N_VID
   bc68673783c7 net/mlx5e: Fix wrong CQE decompression
   4e8f4987b785 IB/mlx5: Verify that Q counters are supported
   f0d5cfb83dcb ext4: don't BUG when truncating encrypted inodes on the orphan list
   9ac44a73a4c5 [media] rc: raw decoder for keymap protocol is not loaded on register
   56174559c310 dm: flush queued bios when process blocks to avoid deadlock
   875142c6e879 KVM: arm/arm64: Let vcpu thread modify its own active state
   220f66f1f4d8 KVM: s390: Fix guest migration for huge guests resulting in panic
   3dd1f5f0b22c serial: samsung: Continue to work if DMA request fails
   2a7c66c1a7c0 USB: serial: io_ti: fix information leak in completion handler
   71f396d687e9 USB: serial: io_ti: fix NULL-deref in interrupt callback
   d9682fbb1252 USB: iowarrior: fix NULL-deref in write
   e1affee35832 USB: iowarrior: fix NULL-deref at probe
   07c5918e96e7 USB: serial: omninet: fix reference leaks at open
   782317bc4eba USB: serial: safe_serial: fix information leak in completion handler
   15b553818e00 usb: host: xhci-plat: Fix timeout on removal of hot pluggable xhci controllers
   e5df1d8231d8 usb: host: xhci-dbg: HCIVERSION should be a binary number
   a03e4fb73679 usb: gadget: function: f_fs: pass companion descriptor along
   bf600df6aa66 usb: dwc3-omap: Fix missing break in dwc3_omap_set_mailbox()
   40b091328f1c usb: dwc3: gadget: make Set Endpoint Configuration macros safe
   7ab8263169d2 usb: gadget: dummy_hcd: clear usb_gadget region before registration
   0a9e57a61494 PCI: Prevent VPD access for QLogic ISP2722
   0c925288d9e2 powerpc/xics: Work around limitations of OPAL XICS priority handling
   e7ef86271857 powerpc: Emulation support for load/store instructions on LE
   88cb0342bbc9 i2c: add missing of_node_put in i2c_mux_del_adapters
   49817d5f81a0 efi/arm: Fix boot crash with CONFIG_CPUMASK_OFFSTACK=y
   b463b3b26bf5 tracing: Add #undef to fix compile error
   03a9b9c5eb0f cpmac: remove hopeless #warning
   9e7e1616fb69 MIPS: ralink: Remove unused rt*_wdt_reset functions
   774bd1f0f2e0 MIPS: ralink: Cosmetic change to prom_init().
   1ec4e1a6c373 mtd: pmcmsp: use kstrndup instead of kmalloc+strncpy
   e6c4a646d490 MIPS: Update lemote2f_defconfig for CPU_FREQ_STAT change
   b70dce737466 MIPS: ip22: Fix ip28 build for modern gcc
   c5f71770663f MIPS: Update ip27_defconfig for SCSI_DH change
   4baa71bf6ca0 MIPS: ip27: Disable qlge driver in defconfig
   810c65dcf036 crypto: improve gcc optimization flags for serpent and wp512
   4b256e46c8e3 USB: serial: digi_acceleport: fix OOB data sanity check
   b88d9bf6ce41 fat: fix using uninitialized fields of fat_inode/fsinfo_inode
   bd390a837bf2 mm: do not call mem_cgroup_free() from within mem_cgroup_alloc()
   bc83fdbb1b88 thp: fix another corner case of munlock() vs. THPs
   6f3effcbddd2 x86/tlb: Fix tlb flushing when lguest clears PGE
   52f93fd5358e x86, mm: fix gup_pte_range() vs DAX mappings
   ab0eea711de5 libceph: use BUG() instead of BUG_ON(1)
   6dd79e33d04d drm/i915: Fix not finding the VBT when it overlaps with OPREGION_ASLE_EXT
   267b0207162b drm: Cancel drm_fb_helper_dirty_work on unload
   60a94aca40ff drm/i915/gvt: Disable access to stolen memory as a guest
   076bb9ce1a9f drm/atomic: fix an error code in mode_fixup()
   a6d98a3a3c5c drm/imx: imx-tve: Do not set the regulator voltage
   3036e519c3f8 drm/ttm: Make sure BOs being swapped out are cacheable
   8c52d5581851 drm/edid: Add EDID_QUIRK_FORCE_8BPC quirk for Rotel RSX-1058
   b4f89786c979 drm/ast: Fix AST2400 POST failure without BMC FW or VBIOS
   23c1fdaced81 drm/ast: Call open_key before enable_mmio in POST code
   cb624df381a6 drm/ast: Fix test for VGA enabled
   8b6e3ca35b51 drm/amdgpu: add more cases to DCE11 possible crtc mask setup
   77a708d95727 mac80211: use driver-indicated transmitter STA only for data frames
   72aaf6d71167 mac80211: don't handle filtered frames within a BA session
   680c812d7bdc mac80211: don't reorder frames with SN smaller than SSN
   e9d8c725c29b mac80211: flush delayed work when entering suspend
   9a7a9c5c88b2 xtensa: move parse_tag_fdt out of #ifdef CONFIG_BLK_DEV_INITRD
   b389c603b09e pwm: pca9685: Fix period change with same duty cycle
   711e95e9a7d4 nlm: Ensure callback code also checks that the files match
   29f3a5545183 target: Fix NULL dereference during LUN lookup + active I/O shutdown
   f82148e9ffd3 pci/hotplug/pnv-php: Remove WARN_ON() in pnv_php_put_slot()
   1d53d522e4d1 ceph: remove req from unsafe list when unregistering it
   a0e963dbeecc ktest: Fix child exit code processing
   d8e905726d90 memory/atmel-ebi: Fix ns <-> cycles conversions
   aef2ccf1d832 orangefs: Use RCU for destroy_inode
   f0453d44086f fs: Better permission checking for submounts
   eef4fcd21313 IB/srp: Fix race conditions related to task management
   24960d72feeb IB/srp: Avoid that duplicate responses trigger a kernel bug
   f3572a0ce31f IB/SRP: Avoid using IB_MR_TYPE_SG_GAPS
   63129c2502c1 IB/mlx5: Fix out-of-bound access
   f54cae186e6e IB/ipoib: Fix deadlock between rmmod and set_mode
   77563b9714b9 mnt: Tuck mounts under others instead of creating shadow/side mounts.
   521cf3b70359 brcmfmac: fix incorrect event channel deduction
   55730c566d11 cxl: Prevent read/write to AFU config space while AFU not configured
   3c20ea7dd380 net: mvpp2: fix DMA address calculation in mvpp2_txq_inc_put()
   7006fe7139f6 s390: use correct input data address for setup_randomness
   e936795084d3 s390: make setup_randomness work
   bb318913c8ab s390: TASK_SIZE for kernel threads
   64deb4069c4b s390/chsc: Add exception handler for CHSC instruction
   a35d74c9c4a0 s390/kdump: Use "LINUX" ELF note name instead of "CORE"
   b3e8ded18f8e s390/dcssblk: fix device size calculation in dcssblk_direct_access()
   e1b323f8b65e s390/qdio: clear DSCI prior to scanning multiple input queues
   7d9a72f5eb8c Bluetooth: Add another AR3012 04ca:3018 device
   7f422c5aec89 KVM: VMX: use correct vmcs_read/write for guest segment selector/base
   61157eabc44e KVM: s390: Disable dirty log retrieval for UCONTROL guests
   d44d2ea64003 serial: 8250_pci: Add MKS Tenta SCOM-0800 and SCOM-0801 cards
   eaae8c8005c1 tty: n_hdlc: get rid of racy n_hdlc.tbuf

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 65f74b15167e..e65bc18e65d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ffd0a071c2df55ecb2bb1f101465df93a81093b5"
-SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
+SRCREV_machine ?= "7f56c6365d0d677d5fe6ca73f1b2ab6640b523a3"
+SRCREV_meta ?= "c84532b6475fd78b878507a481e2c04714341c07"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.18"
+LINUX_VERSION ?= "4.8.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 52e2b5233b0a..a0aa085be364 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.18"
+LINUX_VERSION ?= "4.8.24"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "db2e91ce904f32347ccf739de969b4216cbcaf92"
-SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
+SRCREV_machine ?= "6a134d2553b9c25ce8acb67b807fe0feb1b01430"
+SRCREV_meta ?= "c84532b6475fd78b878507a481e2c04714341c07"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index a56ecdf23c56..bfd52d24eee7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c0123490bb9b454a43c3573e2573b491e0c09701"
-SRCREV_machine_qemuarm64 ?= "304f750aa5be0bf66f70720d68f16865d912ff9f"
-SRCREV_machine_qemumips ?= "aa15b7a291ca18d08fd640932efad673f6b278c3"
-SRCREV_machine_qemuppc ?= "d2c3ea488fe179898ae853cb9565cb7ac62291c6"
-SRCREV_machine_qemux86 ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_machine_qemux86-64 ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_machine_qemumips64 ?= "40a880b0f21aa09f3b52d68969339d80f9cc10ad"
-SRCREV_machine ?= "c50f695341260d4757af64d809390610aae213e1"
-SRCREV_meta ?= "c19322afb12490d9f5ad0182339bff2fe13e778b"
+SRCREV_machine_qemuarm ?= "f25e3a184bf0ac7b12ec9c98d71439f4ac911974"
+SRCREV_machine_qemuarm64 ?= "b9c5f19c82c717b014eab5dc404b9489badbfc8f"
+SRCREV_machine_qemumips ?= "79e11192ca2c1acc714214c2125a8c0296c00413"
+SRCREV_machine_qemuppc ?= "7a688297cc810a614f0329371d1389e550a98504"
+SRCREV_machine_qemux86 ?= "f6329fd2875778192c03e08be02730180cb0dc71"
+SRCREV_machine_qemux86-64 ?= "f6329fd2875778192c03e08be02730180cb0dc71"
+SRCREV_machine_qemumips64 ?= "d619311dd8ea9ee95d80d937f08fb2c70c1dc50c"
+SRCREV_machine ?= "f6329fd2875778192c03e08be02730180cb0dc71"
+SRCREV_meta ?= "c84532b6475fd78b878507a481e2c04714341c07"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.18"
+LINUX_VERSION ?= "4.8.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


